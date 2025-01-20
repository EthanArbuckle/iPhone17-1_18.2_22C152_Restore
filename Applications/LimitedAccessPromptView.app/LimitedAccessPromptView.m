id sub_100005AA0(void *a1)
{
  id v2;
  Class isa;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  unint64_t v15;
  id v17;

  v2 = objc_allocWithZone((Class)CNContactFetchRequest);
  sub_100009288(&qword_10002E4E8);
  isa = Array._bridgeToObjectiveC()().super.isa;
  v4 = [v2 initWithKeysToFetch:isa];

  [v4 setUnifyResults:1];
  v17 = 0;
  v5 = [a1 contactCountForFetchRequest:v4 error:&v17];
  if (v5)
  {
    v6 = v5;
    v7 = v17;
    v8 = [v6 integerValue];
  }
  else
  {
    v9 = v17;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    if (qword_10002E350 != -1) {
      swift_once();
    }
    v10 = type metadata accessor for Logger();
    sub_100009338(v10, (uint64_t)qword_10002E358);
    swift_errorRetain();
    swift_errorRetain();
    v11 = Logger.logObject.getter();
    v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v17 = (id)swift_slowAlloc();
      *(_DWORD *)v13 = 136315138;
      swift_getErrorValue();
      v14 = Error.localizedDescription.getter();
      sub_10001D0C4(v14, v15, (uint64_t *)&v17);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Fetched contacts: failed with %s", v13, 0xCu);
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
    return 0;
  }
  return v8;
}

uint64_t sub_100005D90(uint64_t a1)
{
  *(void *)(v1 + 120) = a1;
  return _swift_task_switch(sub_100005E20, 0, 0);
}

uint64_t sub_100005E20()
{
  sub_100009288(&qword_10002E480);
  uint64_t v1 = swift_allocObject();
  v0[16] = v1;
  *(_OWORD *)(v1 + 16) = xmmword_10001EE70;
  *(void *)(v1 + 32) = [self descriptorForRequiredKeysForStyle:0];
  v0[17] = self;
  type metadata accessor for MainActor();
  v0[18] = static MainActor.shared.getter();
  uint64_t v3 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100005F4C, v3, v2);
}

uint64_t sub_100005F4C()
{
  uint64_t v1 = *(void **)(v0 + 136);
  swift_release();
  *(void *)(v0 + 152) = [v1 descriptorForRequiredKeysWithThreeDTouchEnabled:1];
  return _swift_task_switch(sub_100006000, 0, 0);
}

uint64_t sub_100006000()
{
  uint64_t v1 = (void *)v0[15];
  *(void *)(v0[16] + 40) = v0[19];
  specialized Array._endMutation()();
  id v2 = objc_allocWithZone((Class)CNContactFetchRequest);
  sub_100009288(&qword_10002E4E8);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v4 = [v2 initWithKeysToFetch:isa];

  [v4 setUnifyResults:1];
  v0[12] = 0;
  uint64_t v5 = v0 + 12;
  v0[11] = (uint64_t)&_swiftEmptyArrayStorage;
  v6 = v0 + 11;
  v0[13] = (uint64_t)&_swiftEmptyArrayStorage;
  v0[14] = 0;
  v7 = (void *)swift_allocObject();
  v39 = v0 + 13;
  v7[2] = v0 + 13;
  v7[3] = v0 + 12;
  v7[4] = v0 + 14;
  v7[5] = v0 + 11;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_1000092DC;
  *(void *)(v8 + 24) = v7;
  v0[6] = (uint64_t)sub_1000092F8;
  v0[7] = v8;
  v0[2] = (uint64_t)_NSConcreteStackBlock;
  v0[3] = 1107296256;
  v0[4] = (uint64_t)sub_100006898;
  v0[5] = (uint64_t)&unk_100029220;
  v9 = _Block_copy(v0 + 2);
  swift_retain();
  swift_release();
  v0[2] = 0;
  v40 = v4;
  unsigned int v10 = [v1 enumerateContactsWithFetchRequest:v4 error:v0 + 2 usingBlock:v9];
  _Block_release(v9);
  id v11 = (id)v0[2];
  int64_t isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
    goto LABEL_42;
  }
  if (v10)
  {
    v4 = v0 + 13;
    if ((uint64_t)*v5 > 62) {
      goto LABEL_33;
    }
    if ((unint64_t)*v6 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v36 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v36 < 1) {
        goto LABEL_33;
      }
    }
    else if (*(uint64_t *)((*v6 & 0xFFFFFFFFFFFFFF8) + 0x10) < 1)
    {
      goto LABEL_33;
    }
    uint64_t v13 = 63 - *v5;
    if (__OFSUB__(63, *v5))
    {
      __break(1u);
    }
    else if (!((unint64_t)*v6 >> 62))
    {
      uint64_t v14 = *(void *)((*v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
      int64_t v15 = v14 - 1;
      if (!__OFSUB__(v14, 1)) {
        goto LABEL_9;
      }
      goto LABEL_49;
    }
    swift_bridgeObjectRetain();
    uint64_t v14 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    int64_t v15 = v14 - 1;
    if (!__OFSUB__(v14, 1))
    {
LABEL_9:
      if (v15 >= v13) {
        int64_t isEscapingClosureAtFileLocation = v13;
      }
      else {
        int64_t isEscapingClosureAtFileLocation = v15;
      }
      if (isEscapingClosureAtFileLocation >= 1)
      {
        uint64_t v14 = *v6;
        unint64_t v38 = (unint64_t)*v6 >> 62;
        if (!v38)
        {
          uint64_t v16 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (v16 > isEscapingClosureAtFileLocation) {
            goto LABEL_15;
          }
          goto LABEL_52;
        }
LABEL_50:
        swift_bridgeObjectRetain();
        uint64_t v37 = _CocoaArrayWrapper.endIndex.getter();
        uint64_t result = swift_bridgeObjectRelease();
        if (v37 < 0)
        {
          __break(1u);
          return result;
        }
        swift_bridgeObjectRetain();
        uint64_t v16 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        v4 = v0 + 13;
        if (v16 > isEscapingClosureAtFileLocation)
        {
LABEL_15:
          if ((v14 & 0xC000000000000001) != 0)
          {
            sub_100009370();
            Swift::Int v17 = 0;
            do
            {
              Swift::Int v18 = v17 + 1;
              _ArrayBuffer._typeCheckSlowPath(_:)(v17);
              Swift::Int v17 = v18;
            }
            while (isEscapingClosureAtFileLocation + 1 != v18);
          }
          int64_t v19 = isEscapingClosureAtFileLocation + 1;
          if (v38)
          {
            swift_bridgeObjectRetain();
            uint64_t v16 = _CocoaArrayWrapper.subscript.getter();
            uint64_t v20 = v23;
            v6 = v24;
            int64_t isEscapingClosureAtFileLocation = v25;
            swift_bridgeObjectRelease();
            if (isEscapingClosureAtFileLocation) {
              goto LABEL_26;
            }
          }
          else
          {
            uint64_t v16 = v14 & 0xFFFFFFFFFFFFFF8;
            uint64_t v20 = (v14 & 0xFFFFFFFFFFFFFF8) + 32;
            int64_t isEscapingClosureAtFileLocation = (2 * v19) | 1;
            swift_bridgeObjectRetain();
            v6 = 0;
            if (isEscapingClosureAtFileLocation)
            {
LABEL_26:
              v39 = (void *)v20;
              type metadata accessor for __ContiguousArrayStorageBase();
              swift_unknownObjectRetain_n();
              v27 = (void *)swift_dynamicCastClass();
              if (!v27)
              {
                swift_unknownObjectRelease();
                v27 = &_swiftEmptyArrayStorage;
              }
              uint64_t v28 = v27[2];
              swift_release();
              if (!__OFSUB__((unint64_t)isEscapingClosureAtFileLocation >> 1, v6))
              {
                if (v28 == ((unint64_t)isEscapingClosureAtFileLocation >> 1) - (void)v6)
                {
                  v26 = (void *)swift_dynamicCastClass();
                  if (!v26)
                  {
                    swift_unknownObjectRelease();
                    v26 = &_swiftEmptyArrayStorage;
                  }
                  goto LABEL_32;
                }
                goto LABEL_54;
              }
LABEL_53:
              __break(1u);
LABEL_54:
              swift_unknownObjectRelease();
              uint64_t v20 = (uint64_t)v39;
            }
          }
          v26 = sub_1000093B0(v16, v20, (uint64_t)v6, isEscapingClosureAtFileLocation);
LABEL_32:
          swift_unknownObjectRelease();
          sub_1000068F4((unint64_t)v26);
          goto LABEL_33;
        }
LABEL_52:
        __break(1u);
        goto LABEL_53;
      }
LABEL_33:
      if (qword_10002E350 == -1)
      {
LABEL_34:
        uint64_t v29 = type metadata accessor for Logger();
        sub_100009338(v29, (uint64_t)qword_10002E358);
        v30 = Logger.logObject.getter();
        os_log_type_t v31 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v30, v31))
        {
          v32 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v32 = 134217984;
          swift_beginAccess();
          if (*v4 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v33 = _CocoaArrayWrapper.endIndex.getter();
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v33 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
          }
          v0[8] = v33;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          _os_log_impl((void *)&_mh_execute_header, v30, v31, "Fetched %ld contacts", v32, 0xCu);
          swift_slowDealloc();
        }

        swift_beginAccess();
        uint64_t v34 = v0[13];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        v35 = (uint64_t (*)(uint64_t))v0[1];
        return v35(v34);
      }
LABEL_42:
      swift_once();
      goto LABEL_34;
    }
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  _convertNSErrorToError(_:)();

  swift_willThrow();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

uint64_t sub_100006740(void *a1, unsigned char *a2, void *a3, uint64_t *a4, void *a5, void *a6)
{
  if (![a1 imageDataAvailable])
  {
    if (__OFADD__(*a5, 1)) {
      goto LABEL_16;
    }
    ++*a5;
    a1;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)((*a6 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*a6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_17;
    }
    goto LABEL_8;
  }
  a1;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    goto LABEL_14;
  }
  while (1)
  {
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    uint64_t result = specialized Array._endMutation()();
    uint64_t v13 = *a4 + 1;
    if (__OFADD__(*a4, 1))
    {
      __break(1u);
LABEL_16:
      __break(1u);
LABEL_17:
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
LABEL_8:
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      uint64_t result = specialized Array._endMutation()();
    }
    else
    {
      *a4 = v13;
      if (v13 == 63) {
        *a2 = 1;
      }
    }
    if (!__OFADD__(*a4, *a5)) {
      break;
    }
    __break(1u);
LABEL_14:
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  if (*a4 + *a5 >= 125) {
    *a2 = 1;
  }
  return result;
}

void sub_100006898(uint64_t a1, void *a2)
{
  id v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

uint64_t sub_1000068F4(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
    swift_bridgeObjectRelease();
    *uint64_t v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_100009684(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();

  return specialized Array._endMutation()();
}

BOOL sub_100006AC0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100006AD4()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100006B1C()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100006B48()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_100006B8C()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000098F4(v0, qword_10002E338);
  sub_100009338(v0, (uint64_t)qword_10002E338);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100006C0C()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000098F4(v0, qword_10002E358);
  uint64_t v1 = sub_100009338(v0, (uint64_t)qword_10002E358);
  if (qword_10002E330 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100009338(v0, (uint64_t)qword_10002E338);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_100006CD4()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ContactAvatarView.Coordinator()
{
  return self;
}

id sub_100006D30(uint64_t a1)
{
  uint64_t v3 = *v1;
  sub_100009288(&qword_10002E678);
  UIViewRepresentableContext.coordinator.getter();
  id v4 = *(id *)(v7 + 16);
  swift_release();
  id v5 = [v4 view];

  sub_100009C20(a1, v3);
  return v5;
}

void sub_100006DC4(uint64_t a1, uint64_t a2)
{
  sub_100009C20(a2, *v2);
}

void sub_100006DD8(uint64_t *a1@<X8>)
{
  type metadata accessor for ContactAvatarView.Coordinator();
  uint64_t v2 = swift_allocObject();
  id v3 = [self defaultSettings];
  id v4 = [objc_allocWithZone((Class)CNAvatarViewController) initWithSettings:v3];

  *(void *)(v2 + 16) = v4;
  *a1 = v2;
}

uint64_t sub_100006E6C()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t sub_100006EB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10000B268();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100006F14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10000B268();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100006F78()
{
  return static View._viewListCount(inputs:)();
}

void sub_100006F94()
{
}

void sub_100006FBC(void *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>, double a4@<D0>)
{
  if (a2)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    double v20 = 0.0;
    uint64_t v21 = 0;
    uint64_t v12 = 1;
  }
  else
  {
    id v13 = a1;
    static Alignment.center.getter();
    _FrameLayout.init(width:height:alignment:)();
    uint64_t v7 = v22;
    uint64_t v8 = v23;
    uint64_t v9 = v24;
    uint64_t v10 = v25;
    uint64_t v11 = v26;
    uint64_t v21 = v27;
    double v20 = a4 * 0.1;
    uint64_t v12 = (uint64_t)a1;
  }
  id v14 = a1;
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  char v19 = static Edge.Set.all.getter();
  EdgeInsets.init(_all:)();
  *(void *)a3 = v12;
  *(void *)(a3 + 8) = v7;
  *(void *)(a3 + 16) = v8;
  *(void *)(a3 + 24) = v9;
  *(void *)(a3 + 32) = v10;
  *(void *)(a3 + 40) = v11;
  *(void *)(a3 + 48) = v21;
  *(double *)(a3 + 56) = v20;
  *(void *)(a3 + 64) = 0;
  *(void *)(a3 + 72) = 0;
  *(double *)(a3 + 80) = v20;
  *(void *)(a3 + 88) = a1;
  *(void *)(a3 + 96) = v28;
  *(unsigned char *)(a3 + 104) = v29;
  *(void *)(a3 + 112) = v30;
  *(unsigned char *)(a3 + 120) = v31;
  *(void *)(a3 + 128) = v32;
  *(void *)(a3 + 136) = v33;
  *(unsigned char *)(a3 + 144) = v19;
  *(void *)(a3 + 152) = v15;
  *(void *)(a3 + 160) = v16;
  *(void *)(a3 + 168) = v17;
  *(void *)(a3 + 176) = v18;
  *(unsigned char *)(a3 + 184) = 0;
  sub_10000AF90((id)v12);
  sub_10000AFA0((id)v12);
}

double sub_1000071B8@<D0>(uint64_t a1@<X8>)
{
  id v3 = *(void **)v1;
  double v4 = *(double *)(v1 + 8);
  char v5 = *(unsigned char *)(v1 + 24);
  uint64_t v6 = static Alignment.center.getter();
  uint64_t v8 = v7;
  sub_100006FBC(v3, v5, (uint64_t)v20, v4);
  static Alignment.leading.getter();
  _FrameLayout.init(width:height:alignment:)();
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v8;
  long long v9 = v20[9];
  *(_OWORD *)(a1 + 144) = v20[8];
  *(_OWORD *)(a1 + 160) = v9;
  *(_OWORD *)(a1 + 176) = v21[0];
  *(_OWORD *)(a1 + 185) = *(_OWORD *)((char *)v21 + 9);
  long long v10 = v20[5];
  *(_OWORD *)(a1 + 80) = v20[4];
  *(_OWORD *)(a1 + 96) = v10;
  long long v11 = v20[7];
  *(_OWORD *)(a1 + 112) = v20[6];
  *(_OWORD *)(a1 + 128) = v11;
  long long v12 = v20[1];
  *(_OWORD *)(a1 + 16) = v20[0];
  *(_OWORD *)(a1 + 32) = v12;
  long long v13 = v20[3];
  *(_OWORD *)(a1 + 48) = v20[2];
  *(_OWORD *)(a1 + 64) = v13;
  *(void *)(a1 + 208) = v15;
  *(unsigned char *)(a1 + 216) = v16;
  *(void *)(a1 + 224) = v17;
  *(unsigned char *)(a1 + 232) = v18;
  double result = *(double *)&v19;
  *(_OWORD *)(a1 + 240) = v19;
  return result;
}

uint64_t sub_1000072C0(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    if (a2)
    {
      uint64_t v4 = type metadata accessor for GridItem();
      char v5 = (char *)static Array._allocateBufferUninitialized(minimumCapacity:)();
      *((void *)v5 + 2) = a2;
      uint64_t v6 = *(void *)(v4 - 8);
      unint64_t v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      uint64_t v8 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
      v8(&v5[v7], a1, v4);
      uint64_t v9 = a2 - 1;
      if (a2 != 1)
      {
        uint64_t v10 = *(void *)(v6 + 72);
        long long v11 = &v5[v10 + v7];
        do
        {
          v8(v11, a1, v4);
          v11 += v10;
          --v9;
        }
        while (v9);
      }
    }
    else
    {
      char v5 = (char *)&_swiftEmptyArrayStorage;
    }
    uint64_t v12 = type metadata accessor for GridItem();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
    return (uint64_t)v5;
  }
  return result;
}

uint64_t sub_100007468@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for PinnedScrollableViews();
  __chkstk_darwin(v3);
  char v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = type metadata accessor for GridItem.Size();
  uint64_t v6 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v8 = (char **)((char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = type metadata accessor for GridItem();
  __chkstk_darwin(v9 - 8);
  long long v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100009288(&qword_10002E5E8);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t result = __chkstk_darwin(v12);
  char v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *(void *)(v1 + 24);
  uint64_t v18 = *(void *)(v1 + 32);
  if ((unsigned __int128)(v17 * (__int128)v18) >> 64 == (v17 * v18) >> 63)
  {
    uint64_t v19 = *(void *)(v1 + 48);
    if ((*(unsigned char *)(v1 + 64) & 1) == 0 || !__OFSUB__(v17 * v18, 1))
    {
      uint64_t v26 = v16;
      uint64_t v27 = result;
      id v20 = [self currentDevice];
      uint64_t v25 = a1;
      id v21 = v20;
      [v20 userInterfaceIdiom];
      uint64_t v24 = v5;

      *uint64_t v8 = v19;
      v8[1] = 0x7FF0000000000000;
      (*(void (**)(void *, void, uint64_t))(v6 + 104))(v8, enum case for GridItem.Size.adaptive(_:), v28);
      GridItem.init(_:spacing:alignment:)();
      uint64_t v22 = sub_1000072C0((uint64_t)v11, v18);
      __chkstk_darwin(v22);
      static HorizontalAlignment.center.getter();
      int v29 = 0;
      sub_10000A95C(&qword_10002E5F0, (void (*)(uint64_t))&type metadata accessor for PinnedScrollableViews);
      dispatch thunk of OptionSet.init(rawValue:)();
      sub_100009288(&qword_10002E5F8);
      sub_10000A684();
      unsigned __int8 v23 = v26;
      LazyVGrid.init(columns:alignment:spacing:pinnedViews:content:)();
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 32))(v25, v23, v27);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_100007830@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_100009288(&qword_10002E5F8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v7 = (char *)v71 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009288(&qword_10002E540);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v9 = (char *)v71 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100009288(&qword_10002E618);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = ((uint64_t (*)(void))__chkstk_darwin)();
  v84 = (char *)v71 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v85 = (char *)v71 - v14;
  unint64_t v15 = *(void *)a1;
  if (*(void *)a1 >> 62)
  {
    sub_10000A8B0(a1);
    uint64_t v68 = _CocoaArrayWrapper.endIndex.getter();
    sub_10000A8DC(a1);
    if (v68) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v69 = sub_100009288(&qword_10002E610);
    v70 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v69 - 8) + 56);
    return v70(a3, 1, 1, v69);
  }
  if (!*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v80 = v11;
  uint64_t v81 = v10;
  sub_10000A8B0(a1);
  uint64_t v16 = sub_10000A71C(a2, v15);
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  sub_10000A8DC(a1);
  uint64_t v86 = v16;
  uint64_t v87 = v18;
  uint64_t v88 = v20;
  uint64_t v89 = v22;
  swift_getKeyPath();
  uint64_t v23 = swift_allocObject();
  long long v24 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v23 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v23 + 64) = v24;
  *(unsigned char *)(v23 + 80) = *(unsigned char *)(a1 + 64);
  long long v25 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v23 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v23 + 32) = v25;
  sub_10000A8B0(a1);
  sub_100009288(&qword_10002E620);
  sub_10000B1C0(&qword_10002E628, &qword_10002E620);
  sub_10000A95C(&qword_10002E630, (void (*)(uint64_t))sub_100009370);
  sub_10000A9A4();
  ForEach<>.init(_:id:content:)();
  char v26 = *(unsigned char *)(a1 + 64);
  uint64_t v82 = a3;
  v83 = v7;
  if ((v26 & 1) == 0)
  {
    uint64_t v78 = 0;
    uint64_t v79 = 0;
    uint64_t v27 = 0;
    uint64_t v76 = 0;
    uint64_t v77 = 0;
    uint64_t KeyPath = 0;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    uint64_t v74 = 0;
    uint64_t v75 = 0;
    uint64_t v73 = 0;
LABEL_7:
    uint64_t v52 = v80;
    uint64_t v53 = v81;
    v54 = *(void (**)(void))(v80 + 16);
    ((void (*)(char *, char *, uint64_t))v54)(v84, v85, v81);
    v55 = v83;
    v54();
    v56 = (uint64_t *)&v55[*(int *)(sub_100009288(&qword_10002E640) + 48)];
    uint64_t v57 = v78;
    uint64_t v58 = v79;
    uint64_t *v56 = v79;
    v56[1] = v57;
    char v59 = v27;
    uint64_t v72 = v27;
    uint64_t v60 = v77;
    v56[2] = v27;
    v56[3] = v60;
    v56[4] = KeyPath;
    v56[5] = v29;
    v56[6] = 0;
    v56[7] = v30;
    v71[1] = v29;
    v71[2] = v30;
    v71[0] = KeyPath;
    uint64_t v62 = v75;
    uint64_t v61 = v76;
    v56[8] = v76;
    v56[9] = v62;
    uint64_t v63 = v73;
    uint64_t v64 = v74;
    v56[10] = v61;
    v56[11] = v64;
    v56[12] = v63;
    sub_10000A9F8(v58, v57, v59, v60);
    v65 = *(void (**)(char *, uint64_t))(v52 + 8);
    v65(v85, v53);
    sub_10000AA8C(v58, v57, v72, v60);
    v65(v84, v53);
    uint64_t v66 = sub_100009288(&qword_10002E610);
    uint64_t v67 = (uint64_t)v83;
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v66 - 8) + 56))(v83, 0, 1, v66);
    return sub_10000AB10(v67, v82, &qword_10002E5F8);
  }
  uint64_t v31 = *(void *)(a1 + 40);
  uint64_t result = v31 - a2;
  if (!__OFSUB__(v31, a2))
  {
    uint64_t v86 = sub_10000AB74(result);
    uint64_t v87 = v33;
    sub_100009FD4();
    uint64_t v34 = Text.init<A>(_:)();
    uint64_t v36 = v35;
    char v38 = v37 & 1;
    static Color.gray.getter();
    uint64_t v39 = Text.foregroundColor(_:)();
    uint64_t v41 = v40;
    char v43 = v42;
    swift_release();
    sub_10000A028(v34, v36, v38);
    swift_bridgeObjectRelease();
    uint64_t v44 = type metadata accessor for Font.Design();
    v45 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56);
    uint64_t v76 = 1;
    v45(v9, 1, 1, v44);
    static Font.system(size:weight:design:)();
    sub_10000A154((uint64_t)v9, &qword_10002E540);
    uint64_t v46 = Text.font(_:)();
    uint64_t v78 = v47;
    uint64_t v79 = v46;
    char v49 = v48;
    uint64_t v77 = v50;
    swift_release();
    uint64_t v27 = v49 & 1;
    sub_10000A028(v39, v41, v43 & 1);
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v30 = swift_getKeyPath();
    uint64_t v75 = swift_getKeyPath();
    uint64_t v51 = swift_getKeyPath();
    uint64_t v73 = 0x3FDCCCCCCCCCCCCDLL;
    uint64_t v74 = v51;
    uint64_t v29 = 2;
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_100007F04@<X0>(uint64_t a1@<X8>)
{
  return sub_100007468(a1);
}

uint64_t sub_100007F48@<X0>(int a1@<W0>, unint64_t a2@<X1>, uint64_t a3@<X2>, __int16 a4@<W3>, uint64_t a5@<X8>)
{
  unint64_t v39 = a2;
  int v9 = a4 & 1;
  uint64_t v10 = sub_100009288(&qword_10002E508);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_100009288(&qword_10002E510);
  uint64_t v13 = __chkstk_darwin(v40);
  unint64_t v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v37 - v16;
  uint64_t v18 = sub_100009288(&qword_10002E518);
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a4 & 0x100) != 0)
  {
    uint64_t v21 = 5;
    if (a1 != 3)
    {
      uint64_t v38 = a5;
      __int16 v22 = 256;
      goto LABEL_10;
    }
LABEL_8:
    sub_100009D2C(a3, v21, (uint64_t)&v41);
    uint64_t v23 = v42;
    char v24 = v44;
    *(void *)uint64_t v20 = v39;
    *((void *)v20 + 1) = a3;
    v20[16] = 0;
    *(_OWORD *)(v20 + 24) = v41;
    *((void *)v20 + 5) = v23;
    *((_OWORD *)v20 + 3) = v43;
    v20[64] = v24;
    swift_storeEnumTagMultiPayload();
    sub_100009B2C();
    sub_100009B80();
    swift_bridgeObjectRetain();
    return _ConditionalContent<>.init(storage:)();
  }
  if (v9) {
    uint64_t v21 = 6;
  }
  else {
    uint64_t v21 = 7;
  }
  if (a1 == 3) {
    goto LABEL_8;
  }
  uint64_t v38 = a5;
  __int16 v22 = 0;
LABEL_10:
  *(void *)uint64_t v12 = static HorizontalAlignment.center.getter();
  *((void *)v12 + 1) = 0;
  v12[16] = 1;
  uint64_t v26 = sub_100009288(&qword_10002E520);
  sub_1000082A8(a1, v39, a3, v22 | v9, v21, &v12[*(int *)(v26 + 44)]);
  char v27 = static Edge.Set.bottom.getter();
  EdgeInsets.init(_all:)();
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  sub_10000A0F0((uint64_t)v12, (uint64_t)v15, &qword_10002E508);
  uint64_t v36 = &v15[*(int *)(v40 + 36)];
  *uint64_t v36 = v27;
  *((void *)v36 + 1) = v29;
  *((void *)v36 + 2) = v31;
  *((void *)v36 + 3) = v33;
  *((void *)v36 + 4) = v35;
  v36[40] = 0;
  sub_10000A154((uint64_t)v12, &qword_10002E508);
  sub_10000AB10((uint64_t)v15, (uint64_t)v17, &qword_10002E510);
  sub_10000A0F0((uint64_t)v17, (uint64_t)v20, &qword_10002E510);
  swift_storeEnumTagMultiPayload();
  sub_100009B2C();
  sub_100009B80();
  _ConditionalContent<>.init(storage:)();
  return sub_10000A154((uint64_t)v17, &qword_10002E510);
}

uint64_t sub_1000082A8@<X0>(int a1@<W0>, unint64_t a2@<X1>, uint64_t a3@<X2>, __int16 a4@<W3>, uint64_t a5@<X4>, _OWORD *a6@<X8>)
{
  LODWORD(v156) = a1;
  v167 = a6;
  uint64_t v10 = sub_100009288(&qword_10002E540);
  __chkstk_darwin(v10 - 8);
  v164 = (char *)v137 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for Locale();
  __chkstk_darwin(v12 - 8);
  v158 = (char *)v137 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v14 - 8);
  v157 = (char *)v137 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for String.LocalizationValue.StringInterpolation();
  __chkstk_darwin(v16 - 8);
  uint64_t v163 = sub_100009288(&qword_10002E548);
  uint64_t v168 = *(void *)(v163 - 8);
  uint64_t v17 = __chkstk_darwin(v163);
  v154 = (char *)v137 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v149 = (char *)v137 - v19;
  uint64_t v162 = sub_100009288(&qword_10002E550);
  uint64_t v20 = __chkstk_darwin(v162);
  v152 = (char *)v137 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  v148 = (char *)v137 - v22;
  uint64_t v161 = sub_100009288(&qword_10002E558);
  uint64_t v23 = __chkstk_darwin(v161);
  uint64_t v151 = (uint64_t)v137 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  uint64_t v147 = (uint64_t)v137 - v25;
  uint64_t v160 = sub_100009288(&qword_10002E560);
  uint64_t v26 = __chkstk_darwin(v160);
  uint64_t v155 = (uint64_t)v137 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __chkstk_darwin(v26);
  uint64_t v153 = (uint64_t)v137 - v29;
  __chkstk_darwin(v28);
  uint64_t v146 = (uint64_t)v137 - v30;
  uint64_t v145 = sub_100009288(&qword_10002E568);
  uint64_t v31 = __chkstk_darwin(v145);
  uint64_t v150 = (uint64_t)v137 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __chkstk_darwin(v31);
  uint64_t v144 = (uint64_t)v137 - v34;
  __chkstk_darwin(v33);
  uint64_t v159 = (uint64_t)v137 - v35;
  uint64_t v36 = sub_100009288(&qword_10002E570);
  uint64_t v37 = __chkstk_darwin(v36 - 8);
  uint64_t v166 = (uint64_t)v137 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v37);
  uint64_t v165 = (uint64_t)v137 - v39;
  sub_100009D2C(a3, a5, (uint64_t)v185);
  uint64_t v40 = v185[0];
  uint64_t v41 = v185[1];
  uint64_t v42 = v185[2];
  uint64_t v43 = v185[3];
  uint64_t v44 = v185[4];
  char v45 = v186;
  if ((a4 & 0x100) != 0)
  {
    if (a2 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v46 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v46) {
        goto LABEL_4;
      }
    }
    else if (*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_4:
      swift_bridgeObjectRetain();
      static Alignment.center.getter();
      _FrameLayout.init(width:height:alignment:)();
      *(void *)&long long v178 = a2;
      *((void *)&v178 + 1) = a3;
      LOBYTE(v179) = 0;
      *((void *)&v179 + 1) = v40;
      *(void *)&long long v180 = v41;
      *((void *)&v180 + 1) = v42;
      *(void *)&long long v181 = v43;
      *((void *)&v181 + 1) = v44;
      LOBYTE(v182) = v45;
      *((void *)&v182 + 1) = v187;
      LOBYTE(v183) = v188;
      *((void *)&v183 + 1) = v189;
      LOBYTE(v184[0]) = v190;
      *(_OWORD *)((char *)v184 + 8) = v191;
      sub_10000A1B0((uint64_t)&v178);
      goto LABEL_7;
    }
  }
  swift_bridgeObjectRetain();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  *(void *)&long long v178 = a2;
  *((void *)&v178 + 1) = a3;
  LOBYTE(v179) = 0;
  *((void *)&v179 + 1) = v40;
  *(void *)&long long v180 = v41;
  *((void *)&v180 + 1) = v42;
  *(void *)&long long v181 = v43;
  *((void *)&v181 + 1) = v44;
  LOBYTE(v182) = v45;
  *((void *)&v182 + 1) = v187;
  LOBYTE(v183) = v188;
  *((void *)&v183 + 1) = v189;
  LOBYTE(v184[0]) = v190;
  *(_OWORD *)((char *)v184 + 8) = v191;
  sub_100009ED8((uint64_t)&v178);
LABEL_7:
  sub_10000AB10((uint64_t)&v178, (uint64_t)v176, &qword_10002E578);
  sub_100009288(&qword_10002E580);
  sub_100009EE4();
  _ConditionalContent<>.init(storage:)();
  if (v156 == 1)
  {
    String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
    v47._countAndFlagsBits = 0xD00000000000001ALL;
    v47._object = (void *)0x800000010001FC40;
    String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v47);
    *(void *)&long long v178 = a3;
    String.LocalizationValue.StringInterpolation.appendInterpolation<A>(_:specifier:)();
    v48._countAndFlagsBits = 0;
    v48._object = (void *)0xE000000000000000;
    String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v48);
    String.LocalizationValue.init(stringInterpolation:)();
    static Locale.current.getter();
    *(void *)&long long v178 = String.init(localized:table:bundle:locale:comment:)();
    *((void *)&v178 + 1) = v49;
    unint64_t v141 = sub_100009FD4();
    uint64_t v50 = Text.init<A>(_:)();
    uint64_t v52 = v51;
    char v54 = v53 & 1;
    uint64_t v143 = type metadata accessor for Font.Design();
    uint64_t v55 = *(void *)(v143 - 8);
    v142 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v55 + 56);
    uint64_t v156 = v55 + 56;
    uint64_t v56 = (uint64_t)v164;
    v142(v164, 1, 1, v143);
    static Font.system(size:weight:design:)();
    sub_10000A154(v56, &qword_10002E540);
    uint64_t v57 = Text.font(_:)();
    uint64_t v59 = v58;
    char v61 = v60;
    swift_release();
    sub_10000A028(v50, v52, v54);
    swift_bridgeObjectRelease();
    static Font.Weight.semibold.getter();
    uint64_t v62 = Text.fontWeight(_:)();
    uint64_t v64 = v63;
    uint64_t v66 = v65;
    LOBYTE(v50) = v67 & 1;
    sub_10000A028(v57, v59, v61 & 1);
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    *(void *)&long long v178 = v62;
    *((void *)&v178 + 1) = v64;
    LOBYTE(v179) = v50;
    *((void *)&v179 + 1) = v66;
    *(void *)&long long v180 = KeyPath;
    BYTE8(v180) = 1;
    v137[1] = sub_100009288(&qword_10002E5A8);
    v137[0] = sub_10000A040();
    uint64_t v69 = v149;
    View.lineLimit(_:reservesSpace:)();
    sub_10000A028(v62, v64, v50);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v70 = static Font.callout.getter();
    uint64_t v71 = swift_getKeyPath();
    uint64_t v72 = v168;
    uint64_t v73 = *(void (**)(char *, char *, uint64_t))(v168 + 16);
    uint64_t v139 = v168 + 16;
    v140 = v73;
    uint64_t v74 = (uint64_t)v148;
    uint64_t v75 = v163;
    v73(v148, v69, v163);
    uint64_t v76 = (uint64_t *)(v74 + *(int *)(v162 + 36));
    *uint64_t v76 = v71;
    v76[1] = v70;
    uint64_t v77 = *(void (**)(char *, uint64_t))(v72 + 8);
    uint64_t v168 = v72 + 8;
    v138 = v77;
    v77(v69, v75);
    uint64_t v78 = swift_getKeyPath();
    uint64_t v79 = v147;
    sub_10000A0F0(v74, v147, &qword_10002E550);
    uint64_t v80 = v79 + *(int *)(v161 + 36);
    *(void *)uint64_t v80 = v78;
    *(unsigned char *)(v80 + 8) = 1;
    sub_10000A154(v74, &qword_10002E550);
    uint64_t v81 = swift_getKeyPath();
    uint64_t v82 = v146;
    sub_10000A0F0(v79, v146, &qword_10002E558);
    v83 = (uint64_t *)(v82 + *(int *)(v160 + 36));
    uint64_t *v83 = v81;
    v83[1] = 0x3FDCCCCCCCCCCCCDLL;
    sub_10000A154(v79, &qword_10002E558);
    LOBYTE(v81) = static Edge.Set.top.getter();
    EdgeInsets.init(_all:)();
    uint64_t v85 = v84;
    uint64_t v87 = v86;
    uint64_t v89 = v88;
    uint64_t v91 = v90;
    uint64_t v92 = v144;
    sub_10000A0F0(v82, v144, &qword_10002E560);
    uint64_t v93 = v92 + *(int *)(v145 + 36);
    *(unsigned char *)uint64_t v93 = v81;
    *(void *)(v93 + 8) = v85;
    *(void *)(v93 + 16) = v87;
    *(void *)(v93 + 24) = v89;
    *(void *)(v93 + 32) = v91;
    *(unsigned char *)(v93 + 40) = 0;
    sub_10000A154(v82, &qword_10002E560);
    sub_10000AB10(v92, v159, &qword_10002E568);
    String.LocalizationValue.init(stringLiteral:)();
    static Locale.current.getter();
    *(void *)&long long v178 = String.init(localized:table:bundle:locale:comment:)();
    *((void *)&v178 + 1) = v94;
    uint64_t v95 = Text.init<A>(_:)();
    uint64_t v97 = v96;
    LOBYTE(v59) = v98 & 1;
    static Color.gray.getter();
    uint64_t v99 = Text.foregroundColor(_:)();
    uint64_t v101 = v100;
    LOBYTE(v82) = v102;
    uint64_t v104 = v103;
    swift_release();
    LOBYTE(v82) = v82 & 1;
    sub_10000A028(v95, v97, v59);
    swift_bridgeObjectRelease();
    uint64_t v105 = swift_getKeyPath();
    *(void *)&long long v178 = v99;
    *((void *)&v178 + 1) = v101;
    LOBYTE(v179) = v82;
    *((void *)&v179 + 1) = v104;
    *(void *)&long long v180 = v105;
    BYTE8(v180) = 1;
    v106 = v154;
    View.lineLimit(_:reservesSpace:)();
    sub_10000A028(v99, v101, v82);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v107 = (uint64_t)v164;
    v142(v164, 1, 1, v143);
    uint64_t v108 = static Font.system(size:weight:design:)();
    sub_10000A154(v107, &qword_10002E540);
    uint64_t v109 = swift_getKeyPath();
    uint64_t v110 = (uint64_t)v152;
    uint64_t v111 = v163;
    v140(v152, v106, v163);
    v112 = (uint64_t *)(v110 + *(int *)(v162 + 36));
    uint64_t *v112 = v109;
    v112[1] = v108;
    v138(v106, v111);
    uint64_t v113 = swift_getKeyPath();
    uint64_t v114 = v151;
    sub_10000A0F0(v110, v151, &qword_10002E550);
    uint64_t v115 = v114 + *(int *)(v161 + 36);
    *(void *)uint64_t v115 = v113;
    *(unsigned char *)(v115 + 8) = 1;
    sub_10000A154(v110, &qword_10002E550);
    uint64_t v116 = swift_getKeyPath();
    uint64_t v117 = v155;
    sub_10000A0F0(v114, v155, &qword_10002E558);
    v118 = (uint64_t *)(v117 + *(int *)(v160 + 36));
    uint64_t *v118 = v116;
    v118[1] = 0x3FDCCCCCCCCCCCCDLL;
    sub_10000A154(v114, &qword_10002E558);
    uint64_t v119 = v153;
    sub_10000AB10(v117, v153, &qword_10002E560);
    uint64_t v120 = v159;
    uint64_t v121 = v150;
    sub_10000A0F0(v159, v150, &qword_10002E568);
    sub_10000A0F0(v119, v117, &qword_10002E560);
    uint64_t v122 = v166;
    sub_10000A0F0(v121, v166, &qword_10002E568);
    uint64_t v123 = sub_100009288(&qword_10002E5C8);
    sub_10000A0F0(v117, v122 + *(int *)(v123 + 48), &qword_10002E560);
    sub_10000A154(v119, &qword_10002E560);
    sub_10000A154(v120, &qword_10002E568);
    sub_10000A154(v117, &qword_10002E560);
    sub_10000A154(v121, &qword_10002E568);
    uint64_t v124 = sub_100009288(&qword_10002E590);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v124 - 8) + 56))(v122, 0, 1, v124);
    uint64_t v125 = v165;
    sub_10000AB10(v122, v165, &qword_10002E570);
  }
  else
  {
    uint64_t v126 = sub_100009288(&qword_10002E590);
    uint64_t v125 = v165;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v126 - 8) + 56))(v165, 1, 1, v126);
    uint64_t v122 = v166;
  }
  long long v173 = v196;
  long long v174 = v197;
  v175[0] = v198[0];
  *(_OWORD *)((char *)v175 + 9) = *(_OWORD *)((char *)v198 + 9);
  long long v169 = v192;
  long long v170 = v193;
  long long v171 = v194;
  long long v172 = v195;
  sub_10000A0F0(v125, v122, &qword_10002E570);
  long long v127 = v173;
  long long v128 = v174;
  v176[4] = v173;
  v176[5] = v174;
  long long v129 = v175[0];
  v177[0] = v175[0];
  *(_OWORD *)((char *)v177 + 9) = *(_OWORD *)((char *)v175 + 9);
  long long v130 = v169;
  long long v131 = v170;
  v176[0] = v169;
  v176[1] = v170;
  long long v132 = v171;
  long long v133 = v172;
  v176[2] = v171;
  v176[3] = v172;
  v134 = v167;
  *(_OWORD *)((char *)v167 + 105) = *(_OWORD *)((char *)v175 + 9);
  v134[5] = v128;
  v134[6] = v129;
  v134[3] = v133;
  v134[4] = v127;
  v134[1] = v131;
  v134[2] = v132;
  _OWORD *v134 = v130;
  uint64_t v135 = sub_100009288(&qword_10002E598);
  sub_10000A0F0(v122, (uint64_t)v134 + *(int *)(v135 + 48), &qword_10002E570);
  sub_100009F64((uint64_t)v176, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))j__swift_bridgeObjectRetain);
  sub_10000A154(v125, &qword_10002E570);
  sub_10000A154(v122, &qword_10002E570);
  long long v182 = v173;
  long long v183 = v174;
  v184[0] = v175[0];
  *(_OWORD *)((char *)v184 + 9) = *(_OWORD *)((char *)v175 + 9);
  long long v178 = v169;
  long long v179 = v170;
  long long v180 = v171;
  long long v181 = v172;
  return sub_100009F64((uint64_t)&v178, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))j__swift_bridgeObjectRelease);
}

uint64_t sub_100009264@<X0>(uint64_t a1@<X8>)
{
  if (v1[25]) {
    __int16 v2 = 256;
  }
  else {
    __int16 v2 = 0;
  }
  return sub_100007F48(*v1, *((void *)v1 + 1), *((void *)v1 + 2), v2 | v1[24], a1);
}

uint64_t sub_100009288(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000092CC()
{
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000092DC(void *a1, unsigned char *a2)
{
  return sub_100006740(a1, a2, v2[2], v2[3], v2[4], v2[5]);
}

uint64_t sub_1000092E8()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000092F8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100009320(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100009330()
{
  return swift_release();
}

uint64_t sub_100009338(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_100009370()
{
  unint64_t result = qword_10002E4F0;
  if (!qword_10002E4F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10002E4F0);
  }
  return result;
}

void *sub_1000093B0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5) {
      return &_swiftEmptyArrayStorage;
    }
    uint64_t v8 = v5;
    if (v5 <= 0)
    {
      int v9 = &_swiftEmptyArrayStorage;
      if (v4 != a3)
      {
LABEL_7:
        if (v5 < 0) {
          goto LABEL_19;
        }
        unint64_t v12 = a2 + 8 * a3;
        if (v12 < (unint64_t)&v9[v8 + 4] && (unint64_t)(v9 + 4) < v12 + v8 * 8) {
          goto LABEL_19;
        }
        sub_100009370();
        swift_arrayInitWithCopy();
        return v9;
      }
    }
    else
    {
      sub_100009288(&qword_10002E480);
      int v9 = (void *)swift_allocObject();
      int64_t v10 = j__malloc_size(v9);
      uint64_t v11 = v10 - 32;
      if (v10 < 32) {
        uint64_t v11 = v10 - 25;
      }
      v9[2] = v5;
      v9[3] = (2 * (v11 >> 3)) | 1;
      if (v4 != a3) {
        goto LABEL_7;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_19:
  unint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *sub_100009534(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = &_swiftEmptyArrayStorage;
    }
    else
    {
      sub_100009288(&qword_10002E480);
      uint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = j__malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_100009684((unint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v2) {
      return &_swiftEmptyArrayStorage;
    }
  }
  return v3;
}

uint64_t sub_10000962C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100009658()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_100009684(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_10000B1C0(&qword_10002E500, &qword_10002E4F8);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100009288(&qword_10002E4F8);
          unint64_t v12 = sub_10001A8E4(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_100009370();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000098A8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_1000098F4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t destroy for CNContactGroupVisualizer()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CNContactGroupVisualizer(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CNContactGroupVisualizer(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  return a1;
}

__n128 initializeWithTake for CNContactGroupVisualizer(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 10) = *(_OWORD *)(a2 + 10);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for CNContactGroupVisualizer(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  return a1;
}

uint64_t getEnumTagSinglePayload for CNContactGroupVisualizer(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 26)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CNContactGroupVisualizer(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(_WORD *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 26) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 26) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CNContactGroupVisualizer()
{
  return &type metadata for CNContactGroupVisualizer;
}

uint64_t sub_100009B10()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100009B2C()
{
  unint64_t result = qword_10002E528;
  if (!qword_10002E528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E528);
  }
  return result;
}

unint64_t sub_100009B80()
{
  unint64_t result = qword_10002E530;
  if (!qword_10002E530)
  {
    sub_1000098A8(&qword_10002E510);
    sub_10000B1C0(&qword_10002E538, &qword_10002E508);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E530);
  }
  return result;
}

void sub_100009C20(uint64_t a1, void *a2)
{
  sub_100009288(&qword_10002E678);
  UIViewRepresentableContext.coordinator.getter();
  id v3 = *(id *)(v8 + 16);
  swift_release();
  sub_100009288(&qword_10002E480);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10001EE80;
  if (a2) {
    id v5 = a2;
  }
  else {
    id v5 = [self emptyContact];
  }
  *(void *)(v4 + 32) = v5;
  specialized Array._endMutation()();
  sub_100009370();
  id v6 = a2;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v3 setContacts:isa v4];
}

uint64_t sub_100009D2C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3 = 9 * a2;
  if ((unsigned __int128)(a2 * (__int128)9) >> 64 != (9 * a2) >> 63)
  {
    __break(1u);
    return result;
  }
  if ((unint64_t)(result - 1) < 6)
  {
    uint64_t v4 = 8 * (result - 1);
    a2 = *(void *)((char *)&unk_10001F2C8 + v4);
    uint64_t v5 = *(void *)((char *)&unk_10001F2F8 + v4);
    goto LABEL_32;
  }
  if ((unint64_t)(result - 10) > 0xFFFFFFFFFFFFFFFCLL)
  {
LABEL_17:
    a2 = 3;
    uint64_t v5 = 3;
    goto LABEL_32;
  }
  if ((unint64_t)(result - 13) > 0xFFFFFFFFFFFFFFFCLL)
  {
    uint64_t v5 = 4;
    a2 = 3;
    goto LABEL_32;
  }
  if ((unint64_t)(result - 17) > 0xFFFFFFFFFFFFFFFBLL)
  {
    a2 = 4;
    uint64_t v5 = 4;
    goto LABEL_32;
  }
  if ((unint64_t)(result - 21) > 0xFFFFFFFFFFFFFFFBLL)
  {
    uint64_t v5 = 5;
    a2 = 4;
    goto LABEL_32;
  }
  if ((unint64_t)(result - 26) > 0xFFFFFFFFFFFFFFFALL)
  {
    a2 = 5;
    uint64_t v5 = 5;
    goto LABEL_32;
  }
  if ((unint64_t)(result - 31) > 0xFFFFFFFFFFFFFFFALL)
  {
    uint64_t v5 = 6;
    a2 = 5;
    goto LABEL_32;
  }
  if ((unint64_t)(result - 37) > 0xFFFFFFFFFFFFFFF9)
  {
    a2 = 6;
    uint64_t v5 = 6;
    goto LABEL_32;
  }
  if ((unint64_t)(result - 43) > 0xFFFFFFFFFFFFFFF9)
  {
    uint64_t v5 = 7;
    a2 = 6;
    goto LABEL_32;
  }
  if (a2 > 6)
  {
    uint64_t v6 = 9;
    uint64_t v7 = 8;
    if ((unint64_t)result > 0x38) {
      uint64_t v7 = 9;
    }
    if (result >= 50) {
      uint64_t v6 = v7;
    }
    a2 = 7;
    if ((unint64_t)(result - 50) <= 0xFFFFFFFFFFFFFFF8) {
      uint64_t v5 = v6;
    }
    else {
      uint64_t v5 = 7;
    }
    goto LABEL_32;
  }
  uint64_t v5 = 8;
  if ((unint64_t)(result - 49) < 0xFFFFFFFFFFFFFFFALL) {
    uint64_t v5 = 9;
  }
  if (!a2)
  {
    __break(1u);
    goto LABEL_17;
  }
LABEL_32:
  BOOL v8 = v3 < result;
  uint64_t v9 = 0xE0u / v5;
  if (v9 >= 224 / a2) {
    uint64_t v9 = 224 / a2;
  }
  if (v9 <= 28) {
    uint64_t v9 = 28;
  }
  *(void *)a3 = a2;
  *(void *)(a3 + 8) = v5;
  *(void *)(a3 + 16) = result;
  *(double *)(a3 + 24) = (double)v9;
  *(double *)(a3 + 32) = (double)v9 * 0.01;
  *(unsigned char *)(a3 + 40) = v8;
  return result;
}

uint64_t sub_100009ED8(uint64_t result)
{
  *(unsigned char *)(result + 120) = 1;
  return result;
}

unint64_t sub_100009EE4()
{
  unint64_t result = qword_10002E588;
  if (!qword_10002E588)
  {
    sub_1000098A8(&qword_10002E580);
    sub_100009B2C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E588);
  }
  return result;
}

uint64_t sub_100009F64(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 120);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), v4);
  return a1;
}

unint64_t sub_100009FD4()
{
  unint64_t result = qword_10002E5A0;
  if (!qword_10002E5A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E5A0);
  }
  return result;
}

uint64_t sub_10000A028(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_10000A040()
{
  unint64_t result = qword_10002E5B0;
  if (!qword_10002E5B0)
  {
    sub_1000098A8(&qword_10002E5A8);
    sub_10000B1C0(&qword_10002E5B8, &qword_10002E5C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E5B0);
  }
  return result;
}

uint64_t sub_10000A0F0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100009288(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000A154(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100009288(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000A1B0(uint64_t result)
{
  *(unsigned char *)(result + 120) = 0;
  return result;
}

uint64_t destroy for CNContactGroupArrangedAvatars()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CNContactGroupArrangedAvatars(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 49) = *(_OWORD *)(a2 + 49);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CNContactGroupArrangedAvatars(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  return a1;
}

__n128 initializeWithTake for CNContactGroupArrangedAvatars(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for CNContactGroupArrangedAvatars(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for CNContactGroupArrangedAvatars(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 65)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CNContactGroupArrangedAvatars(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 64) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 65) = 1;
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
    *(unsigned char *)(result + 65) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CNContactGroupArrangedAvatars()
{
  return &type metadata for CNContactGroupArrangedAvatars;
}

unsigned char *initializeBufferWithCopyOfBuffer for GroupVisualizerType(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for GroupVisualizerType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for GroupVisualizerType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x10000A53CLL);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_10000A564(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000A570(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for GroupVisualizerType()
{
  return &type metadata for GroupVisualizerType;
}

unint64_t sub_10000A58C()
{
  unint64_t result = qword_10002E5D0;
  if (!qword_10002E5D0)
  {
    sub_1000098A8(&qword_10002E5D8);
    sub_100009B2C();
    sub_100009B80();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E5D0);
  }
  return result;
}

unint64_t sub_10000A60C()
{
  unint64_t result = qword_10002E5E0;
  if (!qword_10002E5E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E5E0);
  }
  return result;
}

uint64_t sub_10000A660()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000A67C@<X0>(uint64_t a1@<X8>)
{
  return sub_100007830(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

unint64_t sub_10000A684()
{
  unint64_t result = qword_10002E600;
  if (!qword_10002E600)
  {
    sub_1000098A8(&qword_10002E5F8);
    sub_10000B1C0(&qword_10002E608, &qword_10002E610);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E600);
  }
  return result;
}

uint64_t sub_10000A71C(uint64_t result, unint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v2 = a2;
    uint64_t v3 = result;
    unint64_t v4 = a2 >> 62;
    if (!(a2 >> 62))
    {
      uint64_t v5 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
  unint64_t result = swift_bridgeObjectRelease();
LABEL_4:
  if (v5 >= v3) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v5;
  }
  if (v5 < 0) {
    uint64_t v6 = v3;
  }
  if (v3) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();
    unint64_t result = swift_bridgeObjectRelease();
    if (v9 < 0)
    {
LABEL_28:
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
    unint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v8 < v7)
  {
    __break(1u);
    goto LABEL_28;
  }
  if ((v2 & 0xC000000000000001) != 0 && v7)
  {
    sub_100009370();
    Swift::Int v10 = 0;
    do
    {
      Swift::Int v11 = v10 + 1;
      _ArrayBuffer._typeCheckSlowPath(_:)(v10);
      Swift::Int v10 = v11;
    }
    while (v7 != v11);
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = _CocoaArrayWrapper.subscript.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  return v12;
}

uint64_t sub_10000A8B0(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000A8DC(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000A908()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 81, 7);
}

id sub_10000A940@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  char v4 = *(unsigned char *)(v2 + 32);
  *(void *)a2 = v3;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(v2 + 64);
  *(unsigned char *)(a2 + 24) = v4;
  return v3;
}

uint64_t sub_10000A95C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_10000A9A4()
{
  unint64_t result = qword_10002E638;
  if (!qword_10002E638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E638);
  }
  return result;
}

uint64_t sub_10000A9F8(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_10000AA7C(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_10000AA7C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_10000AA8C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_10000A028(result, a2, a3 & 1);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10000AB10(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100009288(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000AB74(uint64_t a1)
{
  id v2 = [objc_allocWithZone((Class)NSNumberFormatter) init];
  [v2 setNumberStyle:1];
  id v3 = [objc_allocWithZone((Class)NSNumber) initWithInteger:a1];
  id v4 = [v2 stringFromNumber:v3];

  if (!v4)
  {
    uint64_t v5 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v7 = v9;
    if (a1 <= 999) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v8 = 2603;
    goto LABEL_6;
  }
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;

  if (a1 > 999) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v8 = 43;
LABEL_6:
  uint64_t v12 = v8;
  v10._countAndFlagsBits = v5;
  v10._object = v7;
  String.append(_:)(v10);

  swift_bridgeObjectRelease();
  return v12;
}

uint64_t initializeBufferWithCopyOfBuffer for AvatarView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t initializeWithCopy for AvatarView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  id v4 = v3;
  return a1;
}

uint64_t assignWithCopy for AvatarView(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

__n128 initializeWithTake for AvatarView(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for AvatarView(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for AvatarView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 25)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AvatarView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 25) = 1;
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
    *(unsigned char *)(result + 25) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AvatarView()
{
  return &type metadata for AvatarView;
}

__n128 initializeWithCopy for AvatarArrangementConfiguration(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for AvatarArrangementConfiguration(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for AvatarArrangementConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AvatarArrangementConfiguration()
{
  return &type metadata for AvatarArrangementConfiguration;
}

uint64_t sub_10000AF38()
{
  return sub_10000B1C0(&qword_10002E648, &qword_10002E5E8);
}

uint64_t sub_10000AF74()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_10000AF90(id result)
{
  if (result != (id)1) {
    return result;
  }
  return result;
}

void sub_10000AFA0(id a1)
{
  if (a1 != (id)1) {
}
  }

void **initializeBufferWithCopyOfBuffer for ContactAvatarView(void **a1, void **a2)
{
  unsigned int v3 = *a2;
  *a1 = *a2;
  id v4 = v3;
  return a1;
}

void destroy for ContactAvatarView(id *a1)
{
}

void **assignWithCopy for ContactAvatarView(void **a1, void **a2)
{
  unsigned int v3 = *a1;
  id v4 = *a2;
  *a1 = *a2;
  id v5 = v4;

  return a1;
}

void *initializeWithTake for ContactAvatarView(void *result, void *a2)
{
  *__n128 result = *a2;
  return result;
}

void **assignWithTake for ContactAvatarView(void **a1, void **a2)
{
  unsigned int v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for ContactAvatarView(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ContactAvatarView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactAvatarView()
{
  return &type metadata for ContactAvatarView;
}

unint64_t sub_10000B120()
{
  unint64_t result = qword_10002E650;
  if (!qword_10002E650)
  {
    sub_1000098A8(&qword_10002E658);
    sub_10000B1C0(&qword_10002E660, &qword_10002E668);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E650);
  }
  return result;
}

uint64_t sub_10000B1C0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000098A8(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void *sub_10000B204()
{
  return &protocol witness table for Never;
}

unint64_t sub_10000B214()
{
  unint64_t result = qword_10002E670;
  if (!qword_10002E670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E670);
  }
  return result;
}

unint64_t sub_10000B268()
{
  unint64_t result = qword_10002E680;
  if (!qword_10002E680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E680);
  }
  return result;
}

uint64_t sub_10000B2CC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_10000B340()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

id sub_10000B3B4(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100009288(&qword_10002EA88);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10002E370 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  sub_100009338(v9, (uint64_t)qword_10002FD80);
  os_log_type_t v10 = static os_log_type_t.debug.getter();
  swift_bridgeObjectRetain_n();
  Swift::Int v11 = Logger.logObject.getter();
  os_log_type_t v12 = v10;
  if (os_log_type_enabled(v11, v10))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_10001D0C4(a1, a2, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Loading Onboarding avatars for bundle %s", v13, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  id v14 = [self sharedConnection];
  id v15 = objc_allocWithZone((Class)CNManagedConfiguration);
  swift_bridgeObjectRetain();
  NSString v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v17 = [v15 initWithBundleIdentifier:v16 managedProfileConnection:v14];

  id v18 = [objc_allocWithZone((Class)CNContactStoreConfiguration) init];
  id result = [self currentEnvironment];
  if (result)
  {
    uint64_t v20 = result;
    [v18 setEnvironment:result];

    [v18 setManagedConfiguration:v17];
    id v21 = [objc_allocWithZone((Class)CNContactStore) initWithConfiguration:v18];

    id v22 = sub_100005AA0(v21);
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v26 = (uint64_t)v22;
    swift_retain();
    static Published.subscript.setter();
    uint64_t v23 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v8, 1, 1, v23);
    uint64_t v24 = (void *)swift_allocObject();
    v24[2] = 0;
    v24[3] = 0;
    v24[4] = v21;
    v24[5] = v3;
    swift_retain();
    sub_10000C140((uint64_t)v8, (uint64_t)&unk_10002EA98, (uint64_t)v24);
    return (id)swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000B798(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[14] = a4;
  v5[15] = a5;
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags();
  v5[16] = v6;
  v5[17] = *(void *)(v6 - 8);
  v5[18] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for DispatchQoS();
  v5[19] = v7;
  v5[20] = *(void *)(v7 - 8);
  v5[21] = swift_task_alloc();
  return _swift_task_switch(sub_10000B8B4, 0, 0);
}

uint64_t sub_10000B8B4()
{
  if (qword_10002E370 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  v0[22] = sub_100009338(v1, (uint64_t)qword_10002FD80);
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    int v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Loading Onboarding avatars", v4, 2u);
    swift_slowDealloc();
  }

  id v5 = (void *)swift_task_alloc();
  v0[23] = v5;
  *id v5 = v0;
  v5[1] = sub_10000BA08;
  uint64_t v6 = v0[14];
  return sub_100005D90(v6);
}

uint64_t sub_10000BA08(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 192) = v1;
  swift_task_dealloc();
  if (v1)
  {
    id v5 = sub_10000BDAC;
  }
  else
  {
    *(void *)(v4 + 200) = a1;
    id v5 = sub_10000BB30;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_10000BB30()
{
  uint64_t v1 = v0[25];
  uint64_t v2 = v0[21];
  uint64_t v3 = v0[18];
  uint64_t v12 = v0[20];
  uint64_t v13 = v0[19];
  uint64_t v4 = v0[16];
  uint64_t v11 = v0[17];
  sub_100016644();
  os_log_type_t v10 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v5 = swift_allocObject();
  swift_weakInit();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  *(void *)(v6 + 24) = v1;
  v0[6] = sub_1000166FC;
  v0[7] = v6;
  v0[2] = _NSConcreteStackBlock;
  v0[3] = 1107296256;
  v0[4] = sub_10000C0FC;
  v0[5] = &unk_100029650;
  uint64_t v7 = _Block_copy(v0 + 2);
  swift_retain();
  static DispatchQoS.unspecified.getter();
  v0[13] = &_swiftEmptyArrayStorage;
  sub_1000188A8(&qword_10002EAB8, 255, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100009288(&qword_10002EAC0);
  sub_10000B1C0(&qword_10002EAC8, &qword_10002EAC0);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v7);

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v3, v4);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v2, v13);
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_10000BDAC()
{
  uint64_t v9 = v0;
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315138;
    swift_getErrorValue();
    uint64_t v4 = Error.localizedDescription.getter();
    *(void *)(v0 + 96) = sub_10001D0C4(v4, v5, &v8);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Loading Onboarding Visualization failed: %s", v3, 0xCu);
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
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

void sub_10000BFA0()
{
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_bridgeObjectRetain();
    swift_retain();
    static Published.subscript.setter();
    if (qword_10002E370 != -1) {
      swift_once();
    }
    uint64_t v0 = type metadata accessor for Logger();
    sub_100009338(v0, (uint64_t)qword_10002FD80);
    uint64_t v1 = Logger.logObject.getter();
    os_log_type_t v2 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v1, v2))
    {
      uint64_t v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, v2, "Finished loading Onboarding avatars", v3, 2u);
      swift_slowDealloc();
    }
    swift_release();
  }
}

uint64_t sub_10000C0FC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_10000C140(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_10000A154(a1, &qword_10002EA88);
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

uint64_t sub_10000C2EC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23LimitedAccessPromptView22ContactStoreVisualizer__allContacts;
  uint64_t v2 = sub_100009288(&qword_10002EAD0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC23LimitedAccessPromptView22ContactStoreVisualizer__allContactsCount;
  uint64_t v4 = sub_100009288(&qword_10002EAD8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  return swift_deallocClassInstance();
}

uint64_t sub_10000C3D8()
{
  return type metadata accessor for ContactStoreVisualizer();
}

uint64_t type metadata accessor for ContactStoreVisualizer()
{
  uint64_t result = qword_10002E848;
  if (!qword_10002E848) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000C42C()
{
  sub_10000C4F8();
  if (v0 <= 0x3F)
  {
    sub_10000C554();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_10000C4F8()
{
  if (!qword_10002E858)
  {
    sub_1000098A8(&qword_10002E4F8);
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10002E858);
    }
  }
}

void sub_10000C554()
{
  if (!qword_10002E860)
  {
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10002E860);
    }
  }
}

uint64_t sub_10000C5AC@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for ContactStoreVisualizer();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000C5EC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000C6B0(v0[6]);
  sub_10000C6B0(v0[8]);
  sub_10000C6B0(v0[10]);

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ContactsLimitedAccessPromptViewObservable()
{
  return self;
}

void *sub_10000C668()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_10000C674@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for ContactsLimitedAccessPromptViewObservable();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000C6B0(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

BOOL sub_10000C6C0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_10000C6D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v30 = a1;
  uint64_t v27 = sub_100009288(&qword_10002EB20);
  __chkstk_darwin(v27);
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100009288(&qword_10002EB28);
  uint64_t v28 = *(void *)(v5 - 8);
  uint64_t v29 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v4 = static HorizontalAlignment.center.getter();
  *((void *)v4 + 1) = 0;
  v4[16] = 1;
  uint64_t v8 = sub_100009288(&qword_10002EB30);
  sub_10000CA84(v1, (uint64_t)&v4[*(int *)(v8 + 44)]);
  long long v31 = *(_OWORD *)(v1 + 48);
  sub_100009288(&qword_10002EB38);
  State.projectedValue.getter();
  v26[3] = v32;
  uint64_t v9 = swift_allocObject();
  long long v10 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(v9 + 80) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(v9 + 96) = v10;
  *(_OWORD *)(v9 + 112) = *(_OWORD *)(v1 + 96);
  *(unsigned char *)(v9 + 128) = *(unsigned char *)(v1 + 112);
  long long v11 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v9 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v9 + 32) = v11;
  long long v12 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v9 + 48) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v9 + 64) = v12;
  uint64_t v13 = swift_allocObject();
  long long v14 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(v13 + 80) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(v13 + 96) = v14;
  *(_OWORD *)(v13 + 112) = *(_OWORD *)(v1 + 96);
  *(unsigned char *)(v13 + 128) = *(unsigned char *)(v1 + 112);
  long long v15 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v13 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v13 + 32) = v15;
  long long v16 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v13 + 48) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v13 + 64) = v16;
  sub_1000178B4(v1);
  sub_1000178B4(v1);
  sub_100009288(&qword_10002EB40);
  sub_10000B1C0(&qword_10002EB48, &qword_10002EB20);
  sub_100018500(&qword_10002EB50, &qword_10002EB40, (void (*)(void))sub_100017944);
  View.sheet<A>(isPresented:onDismiss:content:)();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10000A154((uint64_t)v4, &qword_10002EB20);
  uint64_t v17 = swift_allocObject();
  long long v18 = *(_OWORD *)(v2 + 80);
  *(_OWORD *)(v17 + 80) = *(_OWORD *)(v2 + 64);
  *(_OWORD *)(v17 + 96) = v18;
  *(_OWORD *)(v17 + 112) = *(_OWORD *)(v2 + 96);
  *(unsigned char *)(v17 + 128) = *(unsigned char *)(v2 + 112);
  long long v19 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v17 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v17 + 32) = v19;
  long long v20 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v17 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v17 + 64) = v20;
  uint64_t v22 = v28;
  uint64_t v21 = v29;
  uint64_t v23 = v30;
  (*(void (**)(uint64_t, char *, uint64_t))(v28 + 16))(v30, v7, v29);
  uint64_t v24 = (uint64_t (**)())(v23 + *(int *)(sub_100009288(&qword_10002EB60) + 36));
  void *v24 = sub_10001799C;
  v24[1] = (uint64_t (*)())v17;
  v24[2] = 0;
  v24[3] = 0;
  sub_1000178B4(v2);
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v7, v21);
}

uint64_t sub_10000CA84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v41 = a2;
  uint64_t v42 = sub_100009288(&qword_10002EBA0);
  uint64_t v38 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  uint64_t v37 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_100009288(&qword_10002EBA8);
  __chkstk_darwin(v39);
  uint64_t v40 = (uint64_t)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100009288(&qword_10002EBB0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Material();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  long long v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100009288(&qword_10002EBB8);
  __chkstk_darwin(v12);
  long long v14 = (uint64_t *)((char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v43 = sub_100009288(&qword_10002EBC0);
  __chkstk_darwin(v43);
  long long v16 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v45 = *(_OWORD *)(a1 + 32);
  sub_100009288(&qword_10002EB98);
  uint64_t v17 = State.wrappedValue.getter();
  if (v44)
  {
    __chkstk_darwin(v17);
    *(&v37 - 2) = (char *)a1;
    sub_100009288(&qword_10002EBC8);
    uint64_t v18 = sub_1000098A8(&qword_10002EBD0);
    uint64_t v19 = sub_1000098A8(&qword_10002EBD8);
    uint64_t v20 = sub_10000B1C0(&qword_10002EBE0, &qword_10002EBD0);
    uint64_t v21 = sub_10000B1C0(&qword_10002EBE8, &qword_10002EBD8);
    *(void *)&long long v45 = v18;
    *((void *)&v45 + 1) = v19;
    *(void *)&long long v46 = v20;
    *((void *)&v46 + 1) = v21;
    swift_getOpaqueTypeConformance2();
    uint64_t v22 = (uint64_t)v37;
    NavigationStack.init<>(root:)();
    uint64_t v23 = v38;
    uint64_t v24 = v42;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16))(v40, v22, v42);
    swift_storeEnumTagMultiPayload();
    sub_1000179C4();
    sub_10000B1C0(&qword_10002EC18, &qword_10002EBA0);
    _ConditionalContent<>.init(storage:)();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
  }
  else
  {
    *(void *)long long v16 = static HorizontalAlignment.center.getter();
    *((void *)v16 + 1) = 0;
    v16[16] = 1;
    uint64_t v26 = sub_100009288(&qword_10002EC20);
    sub_10000D0E8(a1, &v16[*(int *)(v26 + 44)]);
    uint64_t v27 = static HorizontalAlignment.center.getter();
    uint64_t v37 = &v16[*(int *)(v43 + 36)];
    uint64_t v38 = v27;
    uint64_t v28 = static Color.clear.getter();
    static Material.thin.getter();
    char v29 = static Edge.Set.all.getter();
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v7, v11, v8);
    v7[*(int *)(v5 + 36)] = v29;
    sub_10000A0F0((uint64_t)v7, (uint64_t)v14 + *(int *)(v12 + 36), &qword_10002EBB0);
    *long long v14 = v28;
    swift_retain();
    sub_10000A154((uint64_t)v7, &qword_10002EBB0);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    swift_release();
    static Alignment.center.getter();
    _FrameLayout.init(width:height:alignment:)();
    uint64_t v30 = (uint64_t)v37;
    sub_10000A0F0((uint64_t)v14, (uint64_t)v37, &qword_10002EBB8);
    long long v31 = (_OWORD *)(v30 + *(int *)(sub_100009288(&qword_10002EC28) + 36));
    uint64_t v32 = v30;
    long long v33 = v46;
    *long long v31 = v45;
    v31[1] = v33;
    v31[2] = v47;
    sub_10000A154((uint64_t)v14, &qword_10002EBB8);
    VerticalEdge.rawValue.getter();
    char v34 = Edge.init(rawValue:)();
    uint64_t v35 = static SafeAreaRegions.container.getter();
    uint64_t v36 = v32 + *(int *)(sub_100009288(&qword_10002EC10) + 36);
    *(void *)uint64_t v36 = v35;
    *(void *)(v36 + 8) = 0;
    *(unsigned char *)(v36 + 16) = 0;
    *(unsigned char *)(v36 + 17) = v34;
    *(void *)(v36 + 24) = v38;
    sub_10000A0F0((uint64_t)v16, v40, &qword_10002EBC0);
    swift_storeEnumTagMultiPayload();
    sub_1000179C4();
    sub_10000B1C0(&qword_10002EC18, &qword_10002EBA0);
    _ConditionalContent<>.init(storage:)();
    return sub_10000A154((uint64_t)v16, &qword_10002EBC0);
  }
}

uint64_t sub_10000D0E8@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v56 = a2;
  uint64_t v3 = sub_100009288(&qword_10002EC30);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100009288(&qword_10002EC38);
  uint64_t v7 = v6 - 8;
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v55 = (uint64_t)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v53 - v11;
  __chkstk_darwin(v10);
  uint64_t v54 = (uint64_t)&v53 - v13;
  uint64_t v14 = sub_100009288(&qword_10002EC40);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  char v53 = (char *)&v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v53 - v18;
  static Axis.Set.vertical.getter();
  uint64_t v57 = a1;
  sub_100009288(&qword_10002EC48);
  sub_10000B1C0(&qword_10002EC50, &qword_10002EC48);
  ScrollView.init(_:showsIndicators:content:)();
  *(void *)uint64_t v5 = static HorizontalAlignment.center.getter();
  *((void *)v5 + 1) = 0x4014000000000000;
  v5[16] = 0;
  uint64_t v20 = sub_100009288(&qword_10002EC58);
  sub_10000F764(a1, (uint64_t)&v5[*(int *)(v20 + 44)]);
  uint64_t v21 = self;
  id v22 = [v21 mainScreen];
  [v22 bounds];
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;

  v58.origin.x = v24;
  v58.origin.y = v26;
  v58.size.width = v28;
  v58.size.height = v30;
  if (CGRectGetHeight(v58) > 750.0) {
    double v31 = 10.0;
  }
  else {
    double v31 = 0.0;
  }
  id v32 = [v21 mainScreen];
  [v32 bounds];
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  CGFloat v40 = v39;

  v59.origin.x = v34;
  v59.origin.y = v36;
  v59.size.width = v38;
  v59.size.height = v40;
  if (CGRectGetHeight(v59) > 750.0) {
    double v41 = 10.0;
  }
  else {
    double v41 = 0.0;
  }
  char v42 = static Edge.Set.all.getter();
  sub_10000A0F0((uint64_t)v5, (uint64_t)v12, &qword_10002EC30);
  uint64_t v43 = &v12[*(int *)(v7 + 44)];
  *uint64_t v43 = v42;
  *((double *)v43 + 1) = v31;
  *((void *)v43 + 2) = 0x4039000000000000;
  *((double *)v43 + 3) = v41;
  *((void *)v43 + 4) = 0x4039000000000000;
  v43[40] = 0;
  sub_10000A154((uint64_t)v5, &qword_10002EC30);
  uint64_t v44 = v54;
  sub_10000AB10((uint64_t)v12, v54, &qword_10002EC38);
  long long v45 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  long long v46 = v53;
  v45(v53, v19, v14);
  uint64_t v47 = v55;
  sub_10000A0F0(v44, v55, &qword_10002EC38);
  Swift::String v48 = v56;
  v45(v56, v46, v14);
  uint64_t v49 = sub_100009288(&qword_10002EC60);
  uint64_t v50 = &v48[*(int *)(v49 + 48)];
  *(void *)uint64_t v50 = 0;
  v50[8] = 1;
  sub_10000A0F0(v47, (uint64_t)&v48[*(int *)(v49 + 64)], &qword_10002EC38);
  sub_10000A154(v44, &qword_10002EC38);
  uint64_t v51 = *(void (**)(char *, uint64_t))(v15 + 8);
  v51(v19, v14);
  sub_10000A154(v47, &qword_10002EC38);
  return ((uint64_t (*)(char *, uint64_t))v51)(v46, v14);
}

uint64_t sub_10000D574@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v124 = sub_100009288(&qword_10002ECD0);
  __chkstk_darwin(v124);
  uint64_t v125 = (uint64_t)&v117 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = sub_100009288(&qword_10002EBB0);
  __chkstk_darwin(v119);
  uint64_t v6 = (char *)&v117 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Material();
  uint64_t v121 = *(void *)(v7 - 8);
  uint64_t v122 = v7;
  __chkstk_darwin(v7);
  uint64_t v120 = (char *)&v117 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v123 = sub_100009288(&qword_10002ECD8);
  uint64_t v9 = __chkstk_darwin(v123);
  uint64_t v11 = (_OWORD *)((char *)&v117 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v117 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (_OWORD *)((char *)&v117 - v16);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v117 - v18;
  uint64_t v20 = sub_100009288(&qword_10002ECE0);
  uint64_t v21 = __chkstk_darwin(v20 - 8);
  uint64_t v128 = (uint64_t)&v117 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  uint64_t v126 = a1;
  long long v127 = (char *)&v117 - v23;
  char v24 = *(unsigned char *)(a1 + 112);
  uint64_t v129 = a2;
  if ((v24 & 1) == 0)
  {
    if (*(void *)(a1 + 16))
    {
      v118 = v6;
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v25 = v134;
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      swift_release();
      CGFloat v26 = (char *)v134;
      id v27 = [self mainScreen];
      [v27 bounds];
      CGFloat v29 = v28;
      CGFloat v31 = v30;
      CGFloat v33 = v32;
      CGFloat v35 = v34;

      v152.origin.x = v29;
      v152.origin.y = v31;
      v152.size.width = v33;
      v152.size.height = v35;
      double Height = CGRectGetHeight(v152);
      id v37 = [self currentDevice];
      id v38 = [v37 userInterfaceIdiom];

      if (v25 < 0 || (v25 & 0x4000000000000000) != 0)
      {
        unint64_t v115 = swift_bridgeObjectRetain();
        uint64_t v39 = (uint64_t)sub_100009534(v115);
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v39 = v25 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain();
      }
      v130[0] = v39;
      sub_1000169F4();
      swift_bridgeObjectRelease();
      uint64_t v40 = v130[0];
      char v41 = static Edge.Set.all.getter();
      char v143 = 1;
      uint64_t v144 = v40;
      uint64_t v145 = v26;
      BOOL v146 = Height <= 750.0;
      BOOL v147 = v38 == (id)1;
      char v148 = v41;
      long long v149 = xmmword_10001F330;
      long long v150 = xmmword_10001F340;
      char v151 = 0;
      static Alignment.center.getter();
      sub_10000E280(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, &v134, 0.0, 1, INFINITY, 0);
      swift_release();
      v133[8] = v135[7];
      v133[9] = v135[8];
      v133[10] = v135[9];
      v133[11] = v135[10];
      v133[4] = v135[3];
      v133[5] = v135[4];
      v133[6] = v135[5];
      v133[7] = v135[6];
      v133[0] = v134;
      v133[1] = v135[0];
      v133[2] = v135[1];
      v133[3] = v135[2];
      char v42 = v120;
      static Material.thin.getter();
      char v43 = static Edge.Set.all.getter();
      uint64_t v45 = v121;
      uint64_t v44 = v122;
      uint64_t v46 = (uint64_t)v118;
      (*(void (**)(char *, char *, uint64_t))(v121 + 16))(v118, v42, v122);
      *(unsigned char *)(v46 + *(int *)(v119 + 36)) = v43;
      sub_10000A0F0(v46, (uint64_t)v11 + *(int *)(v123 + 36), &qword_10002EBB0);
      long long v47 = v133[9];
      v11[8] = v133[8];
      v11[9] = v47;
      long long v48 = v133[11];
      v11[10] = v133[10];
      v11[11] = v48;
      long long v49 = v133[5];
      v11[4] = v133[4];
      v11[5] = v49;
      long long v50 = v133[7];
      v11[6] = v133[6];
      v11[7] = v50;
      long long v51 = v133[1];
      *uint64_t v11 = v133[0];
      v11[1] = v51;
      long long v52 = v133[3];
      v11[2] = v133[2];
      v11[3] = v52;
      sub_1000183F8((uint64_t)v133);
      sub_10000A154(v46, &qword_10002EBB0);
      (*(void (**)(char *, uint64_t))(v45 + 8))(v42, v44);
      sub_100017CD8((uint64_t)v133);
      sub_10000AB10((uint64_t)v11, (uint64_t)v14, &qword_10002ECD8);
      sub_10000A0F0((uint64_t)v14, v125, &qword_10002ECD8);
      swift_storeEnumTagMultiPayload();
      sub_100017D04();
      uint64_t v53 = (uint64_t)v127;
      _ConditionalContent<>.init(storage:)();
      sub_10000A154((uint64_t)v14, &qword_10002ECD8);
      double v54 = 10.0;
      goto LABEL_12;
    }
LABEL_20:
    type metadata accessor for ContactStoreVisualizer();
    sub_1000188A8(&qword_10002F0C0, 255, (void (*)(uint64_t))type metadata accessor for ContactStoreVisualizer);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
    return result;
  }
  if (!*(void *)(a1 + 16)) {
    goto LABEL_20;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v55 = v134;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  v118 = (char *)v134;
  id v56 = [self mainScreen];
  [v56 bounds];
  CGFloat v58 = v57;
  CGFloat v60 = v59;
  CGFloat v62 = v61;
  CGFloat v64 = v63;

  v153.origin.x = v58;
  v153.origin.y = v60;
  v153.size.width = v62;
  v153.size.height = v64;
  double v65 = CGRectGetHeight(v153);
  id v66 = [self currentDevice];
  id v67 = [v66 userInterfaceIdiom];

  if (v55 < 0 || (v55 & 0x4000000000000000) != 0)
  {
    unint64_t v116 = swift_bridgeObjectRetain();
    uint64_t v68 = (uint64_t)sub_100009534(v116);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v68 = v55 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  BOOL v69 = v67 == (id)1;
  v130[0] = v68;
  sub_1000169F4();
  swift_bridgeObjectRelease();
  uint64_t v70 = v130[0];
  char v71 = static Edge.Set.top.getter();
  EdgeInsets.init(_all:)();
  char v143 = 1;
  uint64_t v144 = v70;
  uint64_t v145 = v118;
  BOOL v146 = v65 <= 750.0;
  BOOL v147 = v69;
  char v148 = v71;
  *(void *)&long long v149 = v72;
  *((void *)&v149 + 1) = v73;
  *(void *)&long long v150 = v74;
  *((void *)&v150 + 1) = v75;
  char v151 = 0;
  static Alignment.center.getter();
  sub_10000E280(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, &v134, 0.0, 1, 0.0, 1);
  swift_release();
  v133[8] = v135[7];
  v133[9] = v135[8];
  v133[10] = v135[9];
  v133[11] = v135[10];
  v133[4] = v135[3];
  v133[5] = v135[4];
  v133[6] = v135[5];
  v133[7] = v135[6];
  v133[0] = v134;
  v133[1] = v135[0];
  v133[2] = v135[1];
  v133[3] = v135[2];
  uint64_t v76 = v120;
  static Material.thin.getter();
  char v77 = static Edge.Set.all.getter();
  uint64_t v79 = v121;
  uint64_t v78 = v122;
  (*(void (**)(char *, char *, uint64_t))(v121 + 16))(v6, v76, v122);
  v6[*(int *)(v119 + 36)] = v77;
  sub_10000A0F0((uint64_t)v6, (uint64_t)v17 + *(int *)(v123 + 36), &qword_10002EBB0);
  long long v80 = v133[9];
  v17[8] = v133[8];
  v17[9] = v80;
  long long v81 = v133[11];
  v17[10] = v133[10];
  v17[11] = v81;
  long long v82 = v133[5];
  v17[4] = v133[4];
  v17[5] = v82;
  long long v83 = v133[7];
  v17[6] = v133[6];
  v17[7] = v83;
  long long v84 = v133[1];
  *uint64_t v17 = v133[0];
  v17[1] = v84;
  long long v85 = v133[3];
  v17[2] = v133[2];
  v17[3] = v85;
  sub_1000183F8((uint64_t)v133);
  sub_10000A154((uint64_t)v6, &qword_10002EBB0);
  (*(void (**)(char *, uint64_t))(v79 + 8))(v76, v78);
  sub_100017CD8((uint64_t)v133);
  sub_10000AB10((uint64_t)v17, (uint64_t)v19, &qword_10002ECD8);
  sub_10000A0F0((uint64_t)v19, v125, &qword_10002ECD8);
  swift_storeEnumTagMultiPayload();
  sub_100017D04();
  uint64_t v53 = (uint64_t)v127;
  _ConditionalContent<>.init(storage:)();
  sub_10000A154((uint64_t)v19, &qword_10002ECD8);
  double v54 = 0.0;
LABEL_12:
  uint64_t v86 = static HorizontalAlignment.center.getter();
  sub_10000E634(v126, v142);
  uint64_t v87 = self;
  id v88 = [v87 mainScreen];
  [v88 bounds];
  CGFloat v90 = v89;
  CGFloat v92 = v91;
  CGFloat v94 = v93;
  CGFloat v96 = v95;

  v154.origin.x = v90;
  v154.origin.y = v92;
  v154.size.width = v94;
  v154.size.height = v96;
  if (CGRectGetHeight(v154) <= 750.0) {
    double v54 = 0.0;
  }
  id v97 = [v87 mainScreen];
  [v97 bounds];
  CGFloat v99 = v98;
  CGFloat v101 = v100;
  CGFloat v103 = v102;
  CGFloat v105 = v104;

  v155.origin.x = v99;
  v155.origin.y = v101;
  v155.size.width = v103;
  v155.size.height = v105;
  if (CGRectGetHeight(v155) > 750.0) {
    double v106 = 10.0;
  }
  else {
    double v106 = 0.0;
  }
  char v131 = 1;
  memcpy((char *)v130 + 7, v142, 0x251uLL);
  char v107 = static Edge.Set.all.getter();
  char v132 = 0;
  uint64_t v108 = v128;
  sub_10000A0F0(v53, v128, &qword_10002ECE0);
  char v109 = v132;
  uint64_t v110 = v129;
  sub_10000A0F0(v108, v129, &qword_10002ECE0);
  uint64_t v111 = sub_100009288(&qword_10002ED20);
  uint64_t v112 = v110 + *(int *)(v111 + 48);
  *(void *)uint64_t v112 = 0;
  *(unsigned char *)(v112 + 8) = 1;
  uint64_t v113 = (void *)(v110 + *(int *)(v111 + 64));
  v133[0] = (unint64_t)v86;
  LOBYTE(v133[1]) = 1;
  memcpy((char *)&v133[1] + 1, v130, 0x258uLL);
  LOBYTE(v133[39]) = v107;
  *((double *)&v133[39] + 1) = v54;
  *(void *)&v133[40] = 0x4039000000000000;
  *((double *)&v133[40] + 1) = v106;
  *(void *)&v133[41] = 0x4039000000000000;
  BYTE8(v133[41]) = v109;
  memcpy(v113, v133, 0x299uLL);
  sub_100017ED0((uint64_t)v133);
  sub_10000A154(v53, &qword_10002ECE0);
  long long v134 = (unint64_t)v86;
  LOBYTE(v135[0]) = 1;
  memcpy((char *)v135 + 1, v130, 0x258uLL);
  char v136 = v107;
  double v137 = v54;
  uint64_t v138 = 0x4039000000000000;
  double v139 = v106;
  uint64_t v140 = 0x4039000000000000;
  char v141 = v109;
  sub_100018030((uint64_t)&v134);
  return sub_10000A154(v108, &qword_10002ECE0);
}

uint64_t sub_10000E280@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    static os_log_type_t.fault.getter();
    uint64_t v23 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  long long v24 = v13[3];
  a9[2] = v13[2];
  a9[3] = v24;
  *(_OWORD *)((char *)a9 + 57) = *(_OWORD *)((char *)v13 + 57);
  long long v25 = v13[1];
  *a9 = *v13;
  a9[1] = v25;
  a9[9] = v31;
  a9[10] = v32;
  a9[11] = v33;
  a9[5] = v27;
  a9[6] = v28;
  a9[7] = v29;
  a9[8] = v30;

  return sub_1000183F8((uint64_t)v13);
}

uint64_t sub_10000E440@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  uint64_t v20 = a19;
  char v21 = a18;
  uint64_t v22 = a17;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    static os_log_type_t.fault.getter();
    long long v31 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();

    char v21 = a18;
    uint64_t v20 = a19;
    uint64_t v22 = a17;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  *(void *)a9 = a16;
  *(void *)(a9 + 8) = v22;
  *(unsigned char *)(a9 + 16) = v21 & 1;
  *(void *)(a9 + 24) = v20;
  *(_OWORD *)(a9 + 96) = v37;
  *(_OWORD *)(a9 + 112) = v38;
  *(_OWORD *)(a9 + 128) = v39;
  *(_OWORD *)(a9 + 32) = v33;
  *(_OWORD *)(a9 + 48) = v34;
  *(_OWORD *)(a9 + 64) = v35;
  *(_OWORD *)(a9 + 80) = v36;
  sub_10000AA7C(a16, v22, v21 & 1);

  return swift_bridgeObjectRetain();
}

uint64_t sub_10000E634@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v155 = a1;
  uint64_t v128 = a2;
  uint64_t v2 = type metadata accessor for String.LocalizationValue.StringInterpolation();
  __chkstk_darwin(v2 - 8);
  CGRect v154 = (char *)&v117 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100009288(&qword_10002E540);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v117 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Locale();
  __chkstk_darwin(v7 - 8);
  long long v130 = (char *)&v117 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v9 - 8);
  uint64_t v129 = (char *)&v117 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  *(void *)v236 = String.init(localized:table:bundle:locale:comment:)();
  *(void *)&v236[8] = v11;
  unint64_t v136 = sub_100009FD4();
  uint64_t v12 = Text.init<A>(_:)();
  uint64_t v14 = v13;
  char v16 = v15 & 1;
  static Font.Weight.bold.getter();
  uint64_t v17 = enum case for Font.Design.default(_:);
  uint64_t v18 = type metadata accessor for Font.Design();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(void (**)(void, void))(v19 + 104);
  uint64_t v21 = v17;
  uint64_t v22 = v18;
  uint64_t v131 = v18;
  v20(v6, v21);
  long long v127 = *(void (**)(void, void, void, void))(v19 + 56);
  uint64_t v132 = v19 + 56;
  v127(v6, 0, 1, v22);
  static Font.system(size:weight:design:)();
  uint64_t v23 = v6;
  sub_10000A154((uint64_t)v6, &qword_10002E540);
  uint64_t v163 = Text.font(_:)();
  uint64_t v170 = v24;
  uint64_t v171 = v25;
  char v27 = v26;
  swift_release();
  sub_10000A028(v12, v14, v16);
  swift_bridgeObjectRelease();
  int v162 = static Edge.Set.horizontal.getter();
  EdgeInsets.init(_all:)();
  uint64_t v158 = v29;
  uint64_t v159 = v28;
  uint64_t v156 = v31;
  uint64_t v157 = v30;
  int v164 = static Edge.Set.vertical.getter();
  EdgeInsets.init(_all:)();
  uint64_t v151 = v33;
  uint64_t v152 = v32;
  uint64_t v149 = v35;
  uint64_t v150 = v34;
  unsigned __int8 v345 = v27 & 1;
  unsigned __int8 v342 = 0;
  unsigned __int8 v339 = 0;
  uint64_t KeyPath = swift_getKeyPath();
  int v161 = v345;
  v356[0] = *(_DWORD *)v344;
  *(_DWORD *)((char *)v356 + 3) = *(_DWORD *)&v344[3];
  v355[0] = *(_DWORD *)v343;
  *(_DWORD *)((char *)v355 + 3) = *(_DWORD *)&v343[3];
  int v160 = v342;
  v354[0] = *(_DWORD *)v341;
  *(_DWORD *)((char *)v354 + 3) = *(_DWORD *)&v341[3];
  *(_DWORD *)((char *)v353 + 3) = *(_DWORD *)&v340[3];
  v353[0] = *(_DWORD *)v340;
  int v166 = v339;
  uint64_t v168 = swift_getKeyPath();
  v352[0] = *(_DWORD *)v346;
  *(_DWORD *)((char *)v352 + 3) = *(_DWORD *)&v346[3];
  uint64_t v167 = swift_getKeyPath();
  v351[0] = *(_DWORD *)v347;
  *(_DWORD *)((char *)v351 + 3) = *(_DWORD *)&v347[3];
  uint64_t v165 = swift_getKeyPath();
  v350[0] = *(_DWORD *)v348;
  *(_DWORD *)((char *)v350 + 3) = *(_DWORD *)&v348[3];
  unsigned __int8 v349 = 0;
  String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v36._countAndFlagsBits = 0xD000000000000018;
  v36._object = (void *)0x800000010001FEC0;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v36);
  uint64_t v37 = *(void *)(v155 + 8);
  uint64_t v38 = *(void *)(v37 + 16);
  long long v39 = *(void **)(v37 + 24);
  swift_bridgeObjectRetain();
  v40._countAndFlagsBits = v38;
  v40._object = v39;
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v40);
  swift_bridgeObjectRelease();
  v41._countAndFlagsBits = 0;
  v41._object = (void *)0xE000000000000000;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v41);
  String.LocalizationValue.init(stringInterpolation:)();
  static Locale.current.getter();
  *(void *)v236 = String.init(localized:table:bundle:locale:comment:)();
  *(void *)&v236[8] = v42;
  uint64_t v43 = Text.init<A>(_:)();
  uint64_t v45 = v44;
  char v47 = v46 & 1;
  uint64_t v48 = (uint64_t)v23;
  long long v49 = v23;
  long long v50 = v127;
  v127(v49, 1, 1, v131);
  static Font.system(size:weight:design:)();
  sub_10000A154(v48, &qword_10002E540);
  uint64_t v51 = Text.font(_:)();
  uint64_t v153 = v52;
  CGRect v154 = (char *)v51;
  LOBYTE(v12) = v53;
  uint64_t v155 = v54;
  swift_release();
  sub_10000A028(v43, v45, v47);
  swift_bridgeObjectRelease();
  int v147 = static Edge.Set.horizontal.getter();
  EdgeInsets.init(_all:)();
  uint64_t v137 = v55;
  *(void *)&long long v138 = v56;
  *((void *)&v138 + 1) = v57;
  uint64_t v139 = v58;
  int v148 = static Edge.Set.vertical.getter();
  double v59 = self;
  id v60 = [v59 mainScreen];
  [v60 bounds];
  CGFloat v62 = v61;
  CGFloat v64 = v63;
  CGFloat v66 = v65;
  CGFloat v68 = v67;

  v357.origin.x = v62;
  v357.origin.y = v64;
  v357.size.width = v66;
  v357.size.height = v68;
  CGRectGetHeight(v357);
  EdgeInsets.init(_all:)();
  uint64_t v133 = v69;
  *(void *)&long long v134 = v70;
  *((void *)&v134 + 1) = v71;
  uint64_t v135 = v72;
  unsigned __int8 v330 = v12 & 1;
  unsigned __int8 v329 = 0;
  unsigned __int8 v328 = 0;
  uint64_t v146 = swift_getKeyPath();
  int v140 = v330;
  int v141 = v329;
  int v142 = v328;
  uint64_t v144 = swift_getKeyPath();
  uint64_t v145 = swift_getKeyPath();
  uint64_t v143 = swift_getKeyPath();
  unsigned __int8 v331 = 0;
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  *(void *)v236 = String.init(localized:table:bundle:locale:comment:)();
  *(void *)&v236[8] = v73;
  uint64_t v74 = Text.init<A>(_:)();
  uint64_t v76 = v75;
  LOBYTE(v12) = v77 & 1;
  v50(v48, 1, 1, v131);
  static Font.system(size:weight:design:)();
  sub_10000A154(v48, &qword_10002E540);
  uint64_t v78 = Text.font(_:)();
  uint64_t v131 = v79;
  uint64_t v132 = v78;
  LOBYTE(v48) = v80;
  unint64_t v136 = v81;
  swift_release();
  sub_10000A028(v74, v76, v12);
  swift_bridgeObjectRelease();
  int v126 = static Edge.Set.horizontal.getter();
  EdgeInsets.init(_all:)();
  uint64_t v83 = v82;
  uint64_t v129 = v85;
  long long v130 = v84;
  long long v127 = v86;
  int v125 = static Edge.Set.vertical.getter();
  id v87 = [v59 mainScreen];
  [v87 bounds];
  CGFloat v89 = v88;
  CGFloat v91 = v90;
  CGFloat v93 = v92;
  CGFloat v95 = v94;

  v358.origin.x = v89;
  v358.origin.y = v91;
  v358.size.width = v93;
  v358.size.height = v95;
  CGRectGetHeight(v358);
  EdgeInsets.init(_all:)();
  uint64_t v97 = v96;
  uint64_t v99 = v98;
  uint64_t v101 = v100;
  uint64_t v124 = v102;
  char v195 = v48 & 1;
  char v194 = 0;
  char v193 = 0;
  uint64_t v103 = swift_getKeyPath();
  uint64_t v117 = v103;
  LOBYTE(v87) = v195;
  LOBYTE(v74) = v194;
  LOBYTE(v50) = v193;
  uint64_t v104 = swift_getKeyPath();
  uint64_t v118 = v104;
  uint64_t v105 = swift_getKeyPath();
  uint64_t v120 = v105;
  uint64_t v119 = swift_getKeyPath();
  char v196 = 0;
  v192[0] = v356[0];
  *(_DWORD *)((char *)v192 + 3) = *(_DWORD *)((char *)v356 + 3);
  v191[0] = v355[0];
  *(_DWORD *)((char *)v191 + 3) = *(_DWORD *)((char *)v355 + 3);
  v190[0] = v354[0];
  *(_DWORD *)((char *)v190 + 3) = *(_DWORD *)((char *)v354 + 3);
  *(_DWORD *)((char *)v189 + 3) = *(_DWORD *)((char *)v353 + 3);
  v189[0] = v353[0];
  *(_DWORD *)((char *)v188 + 3) = *(_DWORD *)((char *)v352 + 3);
  v188[0] = v352[0];
  *(_DWORD *)((char *)v187 + 3) = *(_DWORD *)((char *)v351 + 3);
  v187[0] = v351[0];
  *(_DWORD *)((char *)v186 + 3) = *(_DWORD *)((char *)v350 + 3);
  v186[0] = v350[0];
  int v123 = v349;
  v185[0] = v338[0];
  *(_DWORD *)((char *)v185 + 3) = *(_DWORD *)((char *)v338 + 3);
  v184[0] = *(_DWORD *)v337;
  *(_DWORD *)((char *)v184 + 3) = *(_DWORD *)&v337[3];
  v183[0] = *(_DWORD *)v336;
  *(_DWORD *)((char *)v183 + 3) = *(_DWORD *)&v336[3];
  *(_DWORD *)((char *)v182 + 3) = *(_DWORD *)&v335[3];
  v182[0] = *(_DWORD *)v335;
  *(_DWORD *)((char *)v181 + 3) = *(_DWORD *)&v334[3];
  v181[0] = *(_DWORD *)v334;
  *(_DWORD *)((char *)v180 + 3) = *(_DWORD *)&v333[3];
  v180[0] = *(_DWORD *)v333;
  *(_DWORD *)((char *)v179 + 3) = *(_DWORD *)&v332[3];
  v179[0] = *(_DWORD *)v332;
  DWORD1(v198) = *(_DWORD *)((char *)v356 + 3);
  *(_DWORD *)((char *)&v198 + 1) = v356[0];
  DWORD1(v199) = *(_DWORD *)((char *)v355 + 3);
  *(_DWORD *)((char *)&v199 + 1) = v355[0];
  HIDWORD(v201) = *(_DWORD *)((char *)v354 + 3);
  *(_DWORD *)((char *)&v201 + 9) = v354[0];
  DWORD1(v202) = *(_DWORD *)((char *)v353 + 3);
  *(_DWORD *)((char *)&v202 + 1) = v353[0];
  HIDWORD(v204) = *(_DWORD *)((char *)v352 + 3);
  *(_DWORD *)((char *)&v204 + 9) = v352[0];
  HIDWORD(v205) = *(_DWORD *)((char *)v351 + 3);
  *(_DWORD *)((char *)&v205 + 9) = v351[0];
  HIDWORD(v206) = *(_DWORD *)((char *)v350 + 3);
  *(_DWORD *)((char *)&v206 + 9) = v350[0];
  DWORD1(v211) = *(_DWORD *)((char *)v338 + 3);
  *(_DWORD *)((char *)&v211 + 1) = v338[0];
  DWORD1(v212) = *(_DWORD *)&v337[3];
  *(_DWORD *)((char *)&v212 + 1) = *(_DWORD *)v337;
  HIDWORD(v214) = *(_DWORD *)&v336[3];
  int v122 = v331;
  *((void *)&v197 + 1) = v170;
  *((void *)&v198 + 1) = v171;
  *((void *)&v199 + 1) = v159;
  *(void *)&long long v200 = v158;
  *((void *)&v200 + 1) = v157;
  *(void *)&long long v201 = v156;
  *((void *)&v202 + 1) = v152;
  *(void *)&long long v203 = v151;
  *((void *)&v203 + 1) = v150;
  *(void *)&long long v204 = v149;
  *(void *)&long long v205 = KeyPath;
  *(void *)&long long v206 = v168;
  *(_DWORD *)((char *)&v214 + 9) = *(_DWORD *)v336;
  DWORD1(v215) = *(_DWORD *)&v335[3];
  *(_DWORD *)((char *)&v215 + 1) = *(_DWORD *)v335;
  HIDWORD(v217) = *(_DWORD *)&v334[3];
  *(void *)&long long v207 = v167;
  *((void *)&v207 + 1) = 0x3FE0000000000000;
  *(_DWORD *)((char *)&v217 + 9) = *(_DWORD *)v334;
  HIDWORD(v218) = *(_DWORD *)&v333[3];
  *(_DWORD *)((char *)&v218 + 9) = *(_DWORD *)v333;
  HIDWORD(v219) = *(_DWORD *)&v332[3];
  *(void *)&long long v208 = v165;
  *((void *)&v208 + 1) = 2;
  unsigned __int8 v209 = v349;
  *(void *)&long long v210 = v154;
  *((void *)&v210 + 1) = v153;
  LOBYTE(v211) = v140;
  *((void *)&v211 + 1) = v155;
  LOBYTE(v212) = v147;
  *((void *)&v212 + 1) = v137;
  long long v213 = v138;
  *(void *)&long long v214 = v139;
  BYTE8(v214) = v141;
  LOBYTE(v215) = v148;
  *((void *)&v215 + 1) = v133;
  long long v216 = v134;
  *(void *)&long long v217 = v135;
  BYTE8(v217) = v142;
  *(void *)&long long v218 = v146;
  BYTE8(v218) = 1;
  *(void *)&long long v219 = v144;
  BYTE8(v219) = 1;
  *(_DWORD *)((char *)&v219 + 9) = *(_DWORD *)v332;
  *(void *)&long long v220 = v145;
  *((void *)&v220 + 1) = 0x3FE0000000000000;
  v236[192] = v349;
  *(void *)&long long v221 = v143;
  *((void *)&v221 + 1) = 4;
  unsigned __int8 v222 = v331;
  *(_OWORD *)&v236[360] = v220;
  *(_OWORD *)&v236[376] = v221;
  *(_OWORD *)&v236[296] = v134;
  *(_OWORD *)&v236[312] = v217;
  *(_OWORD *)&v236[328] = v218;
  *(_OWORD *)&v236[344] = v219;
  *(_OWORD *)&v236[264] = v214;
  *(_OWORD *)&v236[280] = v215;
  v236[392] = v331;
  int v121 = 0;
  uint64_t v106 = v131;
  uint64_t v107 = v132;
  *(void *)&long long v223 = v132;
  *((void *)&v223 + 1) = v131;
  *((void *)&v224 + 1) = v136;
  uint64_t v108 = v83;
  char v109 = v129;
  uint64_t v110 = v130;
  *((void *)&v225 + 1) = v83;
  *(void *)&long long v226 = v130;
  uint64_t v111 = v127;
  *((void *)&v226 + 1) = v129;
  *(void *)&long long v227 = v127;
  uint64_t v112 = v97;
  *((void *)&v228 + 1) = v97;
  *(void *)&long long v229 = v99;
  uint64_t v113 = v99;
  uint64_t v114 = v101;
  *((void *)&v229 + 1) = v101;
  uint64_t v115 = v124;
  *(void *)&long long v230 = v124;
  *(void *)&long long v231 = v103;
  *(void *)&long long v232 = v104;
  *(void *)&long long v233 = v105;
  *((void *)&v233 + 1) = 0x3FE0000000000000;
  *(void *)&long long v234 = v119;
  *((void *)&v234 + 1) = 4;
  char v235 = 0;
  v236[592] = 0;
  LOBYTE(v224) = (_BYTE)v87;
  LOBYTE(v103) = v125;
  LOBYTE(v104) = v126;
  LOBYTE(v225) = v126;
  BYTE8(v227) = v74;
  LOBYTE(v228) = v125;
  BYTE8(v230) = (_BYTE)v50;
  BYTE8(v231) = 1;
  BYTE8(v232) = 1;
  *(void *)&long long v197 = v163;
  LOBYTE(v198) = v161;
  LOBYTE(v199) = v162;
  BYTE8(v201) = v160;
  LOBYTE(v202) = v164;
  BYTE8(v204) = v166;
  BYTE8(v205) = 1;
  BYTE8(v206) = 1;
  *(_OWORD *)&v236[160] = v207;
  *(_OWORD *)&v236[176] = v208;
  *(_OWORD *)&v236[96] = v203;
  *(_OWORD *)&v236[112] = v204;
  *(_OWORD *)&v236[128] = v205;
  *(_OWORD *)&v236[144] = v206;
  *(_OWORD *)&v236[32] = v199;
  *(_OWORD *)&v236[48] = v200;
  *(_OWORD *)&v236[64] = v201;
  *(_OWORD *)&v236[80] = v202;
  *(_OWORD *)v236 = v197;
  *(_OWORD *)&v236[16] = v198;
  *(_OWORD *)&v236[216] = v211;
  *(_OWORD *)&v236[232] = v212;
  *(_OWORD *)&v236[248] = v138;
  *(_OWORD *)&v236[200] = v210;
  *(_OWORD *)&v236[560] = v233;
  *(_OWORD *)&v236[576] = v234;
  *(_OWORD *)&v236[496] = v229;
  *(_OWORD *)&v236[512] = v230;
  *(_OWORD *)&v236[528] = v231;
  *(_OWORD *)&v236[544] = v232;
  *(_OWORD *)&v236[432] = v225;
  *(_OWORD *)&v236[448] = v226;
  *(_OWORD *)&v236[464] = v227;
  *(_OWORD *)&v236[480] = v228;
  *(_OWORD *)&v236[400] = v223;
  *(_OWORD *)&v236[416] = v224;
  memcpy(v128, v236, 0x251uLL);
  v237[0] = v107;
  v237[1] = v106;
  char v238 = (char)v87;
  *(_DWORD *)v239 = *(_DWORD *)v178;
  *(_DWORD *)&v239[3] = *(_DWORD *)&v178[3];
  unint64_t v240 = v136;
  char v241 = v104;
  *(_DWORD *)v242 = *(_DWORD *)v177;
  *(_DWORD *)&v242[3] = *(_DWORD *)&v177[3];
  uint64_t v243 = v108;
  v244 = v110;
  v245 = v109;
  v246 = v111;
  char v247 = v74;
  *(_DWORD *)&v248[3] = *(_DWORD *)&v176[3];
  *(_DWORD *)v248 = *(_DWORD *)v176;
  char v249 = v103;
  *(_DWORD *)&v250[3] = *(_DWORD *)&v175[3];
  *(_DWORD *)v250 = *(_DWORD *)v175;
  uint64_t v251 = v112;
  uint64_t v252 = v113;
  uint64_t v253 = v114;
  uint64_t v254 = v115;
  char v255 = (char)v50;
  *(_DWORD *)v256 = *(_DWORD *)v174;
  *(_DWORD *)&v256[3] = *(_DWORD *)&v174[3];
  uint64_t v257 = v117;
  char v258 = 1;
  *(_DWORD *)v259 = *(_DWORD *)v173;
  *(_DWORD *)&v259[3] = *(_DWORD *)&v173[3];
  uint64_t v260 = v118;
  char v261 = 1;
  *(_DWORD *)v262 = *(_DWORD *)v172;
  *(_DWORD *)&v262[3] = *(_DWORD *)&v172[3];
  uint64_t v263 = v120;
  uint64_t v264 = 0x3FE0000000000000;
  uint64_t v265 = v119;
  uint64_t v266 = 4;
  char v267 = v121;
  sub_1000182F8((uint64_t)&v197);
  sub_1000182F8((uint64_t)&v210);
  sub_1000182F8((uint64_t)&v223);
  sub_100018378((uint64_t)v237);
  v268[0] = v154;
  v268[1] = v153;
  char v269 = v140;
  *(_DWORD *)v270 = v185[0];
  *(_DWORD *)&v270[3] = *(_DWORD *)((char *)v185 + 3);
  uint64_t v271 = v155;
  char v272 = v147;
  *(_DWORD *)v273 = v184[0];
  *(_DWORD *)&v273[3] = *(_DWORD *)((char *)v184 + 3);
  uint64_t v274 = v137;
  long long v275 = v138;
  uint64_t v276 = v139;
  char v277 = v141;
  *(_DWORD *)&v278[3] = *(_DWORD *)((char *)v183 + 3);
  *(_DWORD *)v278 = v183[0];
  char v279 = v148;
  *(_DWORD *)&v280[3] = *(_DWORD *)((char *)v182 + 3);
  *(_DWORD *)v280 = v182[0];
  uint64_t v281 = v133;
  long long v282 = v134;
  uint64_t v283 = v135;
  char v284 = v142;
  *(_DWORD *)&v285[3] = *(_DWORD *)((char *)v181 + 3);
  *(_DWORD *)v285 = v181[0];
  uint64_t v286 = v146;
  char v287 = 1;
  *(_DWORD *)v288 = v180[0];
  *(_DWORD *)&v288[3] = *(_DWORD *)((char *)v180 + 3);
  uint64_t v289 = v144;
  char v290 = 1;
  *(_DWORD *)v291 = v179[0];
  *(_DWORD *)&v291[3] = *(_DWORD *)((char *)v179 + 3);
  uint64_t v292 = v145;
  uint64_t v293 = 0x3FE0000000000000;
  uint64_t v294 = v143;
  uint64_t v295 = 4;
  char v296 = v122;
  sub_100018378((uint64_t)v268);
  v297[0] = v163;
  v297[1] = v170;
  char v298 = v161;
  *(_DWORD *)v299 = v192[0];
  *(_DWORD *)&v299[3] = *(_DWORD *)((char *)v192 + 3);
  uint64_t v300 = v171;
  char v301 = v162;
  *(_DWORD *)v302 = v191[0];
  *(_DWORD *)&v302[3] = *(_DWORD *)((char *)v191 + 3);
  uint64_t v303 = v159;
  uint64_t v304 = v158;
  uint64_t v305 = v157;
  uint64_t v306 = v156;
  char v307 = v160;
  *(_DWORD *)&v308[3] = *(_DWORD *)((char *)v190 + 3);
  *(_DWORD *)v308 = v190[0];
  char v309 = v164;
  *(_DWORD *)&v310[3] = *(_DWORD *)((char *)v189 + 3);
  *(_DWORD *)v310 = v189[0];
  uint64_t v311 = v152;
  uint64_t v312 = v151;
  uint64_t v313 = v150;
  uint64_t v314 = v149;
  char v315 = v166;
  *(_DWORD *)&v316[3] = *(_DWORD *)((char *)v188 + 3);
  *(_DWORD *)v316 = v188[0];
  uint64_t v317 = KeyPath;
  char v318 = 1;
  *(_DWORD *)v319 = v187[0];
  *(_DWORD *)&v319[3] = *(_DWORD *)((char *)v187 + 3);
  uint64_t v320 = v168;
  char v321 = 1;
  *(_DWORD *)v322 = v186[0];
  *(_DWORD *)&v322[3] = *(_DWORD *)((char *)v186 + 3);
  uint64_t v323 = v167;
  uint64_t v324 = 0x3FE0000000000000;
  uint64_t v325 = v165;
  uint64_t v326 = 2;
  char v327 = v123;
  return sub_100018378((uint64_t)v297);
}

uint64_t sub_10000F764@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v125 = a2;
  uint64_t v131 = type metadata accessor for RoundedRectangle() - 8;
  __chkstk_darwin(v131);
  int v123 = (char *)&v94 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v127 = type metadata accessor for BorderedProminentButtonStyle();
  uint64_t v133 = *(void *)(v127 - 8);
  __chkstk_darwin(v127);
  int v126 = (char *)&v94 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100009288(&qword_10002EC68);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v94 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100009288(&qword_10002EC70);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v94 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v128 = sub_100009288(&qword_10002EC78);
  uint64_t v132 = *(void *)(v128 - 8);
  __chkstk_darwin(v128);
  uint64_t v13 = (char *)&v94 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v129 = sub_100009288(&qword_10002EC80) - 8;
  __chkstk_darwin(v129);
  char v15 = (char *)&v94 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v130 = sub_100009288(&qword_10002EC88) - 8;
  uint64_t v16 = __chkstk_darwin(v130);
  uint64_t v124 = (char *)&v94 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  char v109 = (char *)&v94 - v18;
  uint64_t v122 = sub_100009288(&qword_10002EC90) - 8;
  uint64_t v19 = __chkstk_darwin(v122);
  uint64_t v118 = (uint64_t)&v94 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v121 = (uint64_t)&v94 - v21;
  uint64_t v22 = swift_allocObject();
  long long v23 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v22 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v22 + 96) = v23;
  *(_OWORD *)(v22 + 112) = *(_OWORD *)(a1 + 96);
  *(unsigned char *)(v22 + 128) = *(unsigned char *)(a1 + 112);
  long long v24 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v22 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v22 + 32) = v24;
  long long v25 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v22 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v22 + 64) = v25;
  sub_1000178B4(a1);
  uint64_t v120 = sub_100009288(&qword_10002EC98);
  unint64_t v119 = sub_100017A98();
  Button.init(action:label:)();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  char v26 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  uint64_t v116 = v6 + 16;
  uint64_t v117 = v26;
  uint64_t v104 = v8;
  uint64_t v113 = v5;
  v26(v11, v8, v5);
  uint64_t v103 = v9;
  char v27 = &v11[*(int *)(v9 + 36)];
  long long v28 = v137;
  *(_OWORD *)char v27 = v136;
  *((_OWORD *)v27 + 1) = v28;
  *((_OWORD *)v27 + 2) = v138;
  uint64_t v29 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v114 = v6 + 8;
  uint64_t v115 = v29;
  v29(v8, v5);
  uint64_t v30 = v126;
  BorderedProminentButtonStyle.init()();
  unint64_t v112 = sub_100017B0C();
  uint64_t v111 = sub_1000188A8(&qword_10002ECB8, 255, (void (*)(uint64_t))&type metadata accessor for BorderedProminentButtonStyle);
  uint64_t v31 = v127;
  uint64_t v96 = v11;
  View.buttonStyle<A>(_:)();
  uint64_t v32 = *(void (**)(char *, uint64_t))(v133 + 8);
  v133 += 8;
  uint64_t v110 = v32;
  v32(v30, v31);
  sub_10000A154((uint64_t)v11, &qword_10002EC70);
  id v108 = self;
  id v33 = [v108 tertiarySystemFillColor];
  uint64_t v34 = Color.init(_:)();
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)&long long v139 = v34;
  swift_retain();
  uint64_t v36 = AnyShapeStyle.init<A>(_:)();
  uint64_t v37 = v132;
  uint64_t v106 = *(void (**)(char *, char *, uint64_t))(v132 + 16);
  uint64_t v107 = v132 + 16;
  uint64_t v38 = v15;
  long long v39 = v13;
  CGFloat v95 = v13;
  Swift::String v40 = v13;
  uint64_t v41 = v128;
  v106(v15, v40, v128);
  swift_release();
  uint64_t v42 = (uint64_t *)&v15[*(int *)(v129 + 44)];
  *uint64_t v42 = KeyPath;
  v42[1] = v36;
  uint64_t v105 = *(void (**)(char *, uint64_t))(v37 + 8);
  uint64_t v132 = v37 + 8;
  v105(v39, v41);
  uint64_t v43 = v123;
  uint64_t v44 = &v123[*(int *)(v131 + 28)];
  uint64_t v45 = enum case for RoundedCornerStyle.continuous(_:);
  unsigned int v101 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v100 = type metadata accessor for RoundedCornerStyle();
  uint64_t v46 = *(void *)(v100 - 8);
  uint64_t v99 = *(void (**)(char *, uint64_t, uint64_t))(v46 + 104);
  uint64_t v102 = v46 + 104;
  v99(v44, v45, v100);
  __asm { FMOV            V0.2D, #14.0 }
  long long v98 = _Q0;
  *(_OWORD *)uint64_t v43 = _Q0;
  uint64_t v52 = (uint64_t)v109;
  uint64_t v53 = (uint64_t)&v109[*(int *)(v130 + 44)];
  sub_100017C04((uint64_t)v43, v53);
  uint64_t v97 = sub_100009288(&qword_10002ECC0);
  *(_WORD *)(v53 + *(int *)(v97 + 36)) = 256;
  sub_10000A0F0((uint64_t)v15, v52, &qword_10002EC80);
  sub_100017C68((uint64_t)v43);
  sub_10000A154((uint64_t)v15, &qword_10002EC80);
  LOBYTE(v53) = static Edge.Set.bottom.getter();
  EdgeInsets.init(_all:)();
  uint64_t v55 = v54;
  uint64_t v57 = v56;
  uint64_t v59 = v58;
  uint64_t v61 = v60;
  uint64_t v62 = v118;
  sub_10000A0F0(v52, v118, &qword_10002EC88);
  uint64_t v63 = v62 + *(int *)(v122 + 44);
  *(unsigned char *)uint64_t v63 = v53;
  *(void *)(v63 + 8) = v55;
  *(void *)(v63 + 16) = v57;
  *(void *)(v63 + 24) = v59;
  *(void *)(v63 + 32) = v61;
  *(unsigned char *)(v63 + 40) = 0;
  sub_10000A154(v52, &qword_10002EC88);
  uint64_t v64 = v121;
  sub_10000AB10(v62, v121, &qword_10002EC90);
  uint64_t v65 = swift_allocObject();
  *(unsigned char *)(v65 + 128) = *(unsigned char *)(a1 + 112);
  long long v66 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v65 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v65 + 96) = v66;
  *(_OWORD *)(v65 + 112) = *(_OWORD *)(a1 + 96);
  long long v67 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v65 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v65 + 32) = v67;
  long long v68 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v65 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v65 + 64) = v68;
  uint64_t v134 = a1;
  sub_1000178B4(a1);
  uint64_t v69 = v104;
  Button.init(action:label:)();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v70 = (uint64_t)v96;
  uint64_t v71 = v69;
  uint64_t v72 = v69;
  uint64_t v73 = v113;
  v117(v96, v71, v113);
  uint64_t v74 = (_OWORD *)(v70 + *(int *)(v103 + 36));
  long long v75 = v140;
  *uint64_t v74 = v139;
  v74[1] = v75;
  v74[2] = v141;
  v115(v72, v73);
  uint64_t v76 = v126;
  BorderedProminentButtonStyle.init()();
  char v77 = v95;
  uint64_t v78 = v127;
  View.buttonStyle<A>(_:)();
  v110(v76, v78);
  sub_10000A154(v70, &qword_10002EC70);
  id v79 = [v108 tertiarySystemFillColor];
  uint64_t v80 = Color.init(_:)();
  uint64_t v81 = swift_getKeyPath();
  uint64_t v135 = v80;
  swift_retain();
  uint64_t v82 = AnyShapeStyle.init<A>(_:)();
  uint64_t v83 = (uint64_t)v38;
  long long v84 = v38;
  long long v85 = v77;
  uint64_t v86 = v77;
  uint64_t v87 = v128;
  v106(v84, v85, v128);
  swift_release();
  double v88 = (uint64_t *)(v83 + *(int *)(v129 + 44));
  *double v88 = v81;
  v88[1] = v82;
  v105(v86, v87);
  v99(&v43[*(int *)(v131 + 28)], v101, v100);
  *(_OWORD *)uint64_t v43 = v98;
  uint64_t v89 = (uint64_t)v124;
  uint64_t v90 = (uint64_t)&v124[*(int *)(v130 + 44)];
  sub_100017C04((uint64_t)v43, v90);
  *(_WORD *)(v90 + *(int *)(v97 + 36)) = 256;
  sub_10000A0F0(v83, v89, &qword_10002EC80);
  sub_100017C68((uint64_t)v43);
  sub_10000A154(v83, &qword_10002EC80);
  sub_10000AB10(v89, v52, &qword_10002EC88);
  sub_10000A0F0(v64, v62, &qword_10002EC90);
  sub_10000A0F0(v52, v89, &qword_10002EC88);
  uint64_t v91 = v125;
  sub_10000A0F0(v62, v125, &qword_10002EC90);
  uint64_t v92 = sub_100009288(&qword_10002ECC8);
  sub_10000A0F0(v89, v91 + *(int *)(v92 + 48), &qword_10002EC88);
  sub_10000A154(v52, &qword_10002EC88);
  sub_10000A154(v64, &qword_10002EC90);
  sub_10000A154(v89, &qword_10002EC88);
  return sub_10000A154(v62, &qword_10002EC90);
}

__n128 sub_1000103E4@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100009288(&qword_10002E540);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Locale();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v6 - 8);
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  *(void *)&v35[0] = String.init(localized:table:bundle:locale:comment:)();
  *((void *)&v35[0] + 1) = v7;
  sub_100009FD4();
  uint64_t v8 = Text.init<A>(_:)();
  uint64_t v10 = v9;
  char v12 = v11 & 1;
  uint64_t v13 = type metadata accessor for Font.Design();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v4, 1, 1, v13);
  static Font.system(size:weight:design:)();
  sub_10000A154((uint64_t)v4, &qword_10002E540);
  static Font.Weight.semibold.getter();
  Font.weight(_:)();
  swift_release();
  uint64_t v14 = Text.font(_:)();
  uint64_t v16 = v15;
  char v18 = v17;
  swift_release();
  char v19 = v18 & 1;
  sub_10000A028(v8, v10, v12);
  swift_bridgeObjectRelease();
  *(void *)&v35[0] = static Color.blue.getter();
  uint64_t v20 = Text.foregroundStyle<A>(_:)();
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  char v26 = v25 & 1;
  sub_10000A028(v14, v16, v19);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v27 = static Alignment.center.getter();
  sub_10000E440(0.0, 1, 0.0, 1, INFINITY, 0, 50.0, 0, (uint64_t)v35, 0.0, 1, 0.0, 1, v27, v28, v20, v22, v26, v24);
  sub_10000A028(v20, v22, v26);
  swift_bridgeObjectRelease();
  long long v29 = v35[7];
  long long v30 = v35[8];
  *(_OWORD *)(a1 + 96) = v35[6];
  *(_OWORD *)(a1 + 112) = v29;
  *(_OWORD *)(a1 + 128) = v30;
  long long v31 = v35[3];
  *(_OWORD *)(a1 + 32) = v35[2];
  *(_OWORD *)(a1 + 48) = v31;
  long long v32 = v35[5];
  *(_OWORD *)(a1 + 64) = v35[4];
  *(_OWORD *)(a1 + 80) = v32;
  __n128 result = (__n128)v35[1];
  *(_OWORD *)a1 = v35[0];
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t sub_10001074C(uint64_t result)
{
  uint64_t v1 = *(void (**)(uint64_t))(*(void *)(result + 8) + 64);
  if (v1)
  {
    uint64_t v2 = swift_retain();
    v1(v2);
    return sub_10000C6B0((uint64_t)v1);
  }
  return result;
}

uint64_t sub_1000107AC@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v4 = sub_100009288(&qword_10002E540);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Locale();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = type metadata accessor for String.LocalizationValue.StringInterpolation();
  __chkstk_darwin(v9 - 8);
  String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v10._object = (void *)0x800000010001FE00;
  v10._countAndFlagsBits = 0xD000000000000030;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v10);
  if (*(void *)(a1 + 16))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    v39[4] = *(void *)&v40[0];
    String.LocalizationValue.StringInterpolation.appendInterpolation<A>(_:specifier:)();
    v11._countAndFlagsBits = 0;
    v11._object = (void *)0xE000000000000000;
    String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v11);
    String.LocalizationValue.init(stringInterpolation:)();
    static Locale.current.getter();
    *(void *)&v40[0] = String.init(localized:table:bundle:locale:comment:)();
    *((void *)&v40[0] + 1) = v12;
    sub_100009FD4();
    uint64_t v13 = Text.init<A>(_:)();
    uint64_t v15 = v14;
    char v17 = v16 & 1;
    uint64_t v18 = type metadata accessor for Font.Design();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v6, 1, 1, v18);
    static Font.system(size:weight:design:)();
    sub_10000A154((uint64_t)v6, &qword_10002E540);
    static Font.Weight.semibold.getter();
    Font.weight(_:)();
    swift_release();
    uint64_t v19 = Text.font(_:)();
    uint64_t v21 = v20;
    char v23 = v22;
    swift_release();
    char v24 = v23 & 1;
    sub_10000A028(v13, v15, v17);
    swift_bridgeObjectRelease();
    *(void *)&v40[0] = static Color.blue.getter();
    uint64_t v25 = Text.foregroundStyle<A>(_:)();
    uint64_t v27 = v26;
    uint64_t v29 = v28;
    char v31 = v30 & 1;
    sub_10000A028(v19, v21, v24);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v32 = static Alignment.center.getter();
    sub_10000E440(0.0, 1, 0.0, 1, INFINITY, 0, 50.0, 0, (uint64_t)v40, 0.0, 1, 0.0, 1, v32, v33, v25, v27, v31, v29);
    sub_10000A028(v25, v27, v31);
    uint64_t result = swift_bridgeObjectRelease();
    long long v35 = v40[7];
    a2[6] = v40[6];
    a2[7] = v35;
    a2[8] = v40[8];
    long long v36 = v40[3];
    a2[2] = v40[2];
    a2[3] = v36;
    long long v37 = v40[5];
    a2[4] = v40[4];
    a2[5] = v37;
    long long v38 = v40[1];
    *a2 = v40[0];
    a2[1] = v38;
  }
  else
  {
    type metadata accessor for ContactStoreVisualizer();
    sub_1000188A8(&qword_10002F0C0, 255, (void (*)(uint64_t))type metadata accessor for ContactStoreVisualizer);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_100010C64(uint64_t a1)
{
  uint64_t v2 = sub_100009288(&qword_10002EBD0);
  __chkstk_darwin(v2);
  uint64_t v4 = &v7[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(void *)uint64_t v4 = static HorizontalAlignment.center.getter();
  *((void *)v4 + 1) = 0;
  v4[16] = 0;
  uint64_t v5 = sub_100009288(&qword_10002ED28);
  sub_100010DC8(a1, (uint64_t)&v4[*(int *)(v5 + 44)]);
  uint64_t v8 = a1;
  sub_100009288(&qword_10002EBD8);
  sub_10000B1C0(&qword_10002EBE0, &qword_10002EBD0);
  sub_10000B1C0(&qword_10002EBE8, &qword_10002EBD8);
  View.toolbar<A>(content:)();
  return sub_10000A154((uint64_t)v4, &qword_10002EBD0);
}

uint64_t sub_100010DC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v85 = a1;
  uint64_t v98 = a2;
  uint64_t v2 = sub_100009288(&qword_10002EDE0);
  __chkstk_darwin(v2 - 8);
  uint64_t v92 = (uint64_t *)((char *)&v82 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v91 = sub_100009288(&qword_10002EDE8);
  uint64_t v4 = __chkstk_darwin(v91);
  uint64_t v97 = (uint64_t)&v82 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v90 = (uint64_t)&v82 - v7;
  __chkstk_darwin(v6);
  uint64_t v94 = (uint64_t)&v82 - v8;
  uint64_t v96 = sub_100009288(&qword_10002EDF0);
  uint64_t v95 = *(void *)(v96 - 8);
  uint64_t v9 = __chkstk_darwin(v96);
  CGFloat v93 = (char *)&v82 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v99 = (char *)&v82 - v11;
  uint64_t v12 = type metadata accessor for Locale();
  __chkstk_darwin(v12 - 8);
  double v88 = (char *)&v82 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v14 - 8);
  uint64_t v87 = (char *)&v82 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for String.LocalizationValue.StringInterpolation();
  __chkstk_darwin(v16 - 8);
  uint64_t v86 = (char *)&v82 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = (char *)(sub_100009288(&qword_10002EBB0) - 8);
  __chkstk_darwin(v89);
  uint64_t v19 = (char *)&v82 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = type metadata accessor for Material();
  uint64_t v20 = *(void *)(v83 - 8);
  __chkstk_darwin(v83);
  char v22 = (char *)&v82 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_100009288(&qword_10002EBB8);
  uint64_t v24 = v23 - 8;
  __chkstk_darwin(v23);
  uint64_t v26 = (uint64_t *)((char *)&v82 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v27 = sub_100009288(&qword_10002EDF8);
  uint64_t v28 = v27 - 8;
  __chkstk_darwin(v27);
  uint64_t v82 = (uint64_t)&v82 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = sub_100009288(&qword_10002EE00) - 8;
  uint64_t v30 = __chkstk_darwin(v84);
  uint64_t v32 = (char *)&v82 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v30);
  uint64_t v100 = (uint64_t)&v82 - v33;
  uint64_t v34 = static Color.clear.getter();
  static Material.thin.getter();
  char v35 = static Edge.Set.all.getter();
  uint64_t v36 = v83;
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v19, v22, v83);
  v19[*((int *)v89 + 11)] = v35;
  sub_10000A0F0((uint64_t)v19, (uint64_t)v26 + *(int *)(v24 + 44), &qword_10002EBB0);
  uint64_t *v26 = v34;
  swift_retain();
  sub_10000A154((uint64_t)v19, &qword_10002EBB0);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v36);
  swift_release();
  LOBYTE(v34) = static Edge.Set.top.getter();
  uint64_t v37 = static SafeAreaRegions.all.getter();
  uint64_t v38 = v82;
  sub_10000A0F0((uint64_t)v26, v82, &qword_10002EBB8);
  uint64_t v39 = *(int *)(v28 + 44);
  uint64_t v40 = v85;
  uint64_t v41 = v38 + v39;
  *(void *)uint64_t v41 = v37;
  *(unsigned char *)(v41 + 8) = v34;
  sub_10000A154((uint64_t)v26, &qword_10002EBB8);
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  sub_10000A0F0(v38, (uint64_t)v32, &qword_10002EDF8);
  uint64_t v42 = &v32[*(int *)(v84 + 44)];
  long long v43 = v104;
  *(_OWORD *)uint64_t v42 = v103;
  *((_OWORD *)v42 + 1) = v43;
  *((_OWORD *)v42 + 2) = v105;
  sub_10000A154(v38, &qword_10002EDF8);
  uint64_t v89 = v32;
  sub_10000AB10((uint64_t)v32, v100, &qword_10002EE00);
  long long v106 = *(_OWORD *)(v40 + 80);
  long long v101 = *(_OWORD *)(v40 + 80);
  sub_100009288(&qword_10002EB70);
  State.wrappedValue.getter();
  if (v102 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v44 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v44 = *(void *)((v102 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v44 < 1)
  {
    String.LocalizationValue.init(stringLiteral:)();
  }
  else
  {
    String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
    v45._countAndFlagsBits = 0xD00000000000001ELL;
    v45._object = (void *)0x800000010001FF60;
    String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v45);
    long long v101 = v106;
    State.wrappedValue.getter();
    if (v102 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v46 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v46 = *(void *)((v102 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    *(void *)&long long v101 = v46;
    String.LocalizationValue.StringInterpolation.appendInterpolation<A>(_:specifier:)();
    v47._countAndFlagsBits = 0;
    v47._object = (void *)0xE000000000000000;
    String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v47);
    String.LocalizationValue.init(stringInterpolation:)();
  }
  static Locale.current.getter();
  uint64_t v48 = String.init(localized:table:bundle:locale:comment:)();
  uint64_t v50 = v49;
  uint64_t v51 = static Axis.Set.vertical.getter();
  __chkstk_darwin(v51);
  *(&v82 - 4) = v40;
  *(&v82 - 3) = v48;
  *(&v82 - 2) = v50;
  *((unsigned char *)&v82 - 8) = v44 > 0;
  sub_100009288(&qword_10002EE08);
  sub_10000B1C0(&qword_10002EE10, &qword_10002EE08);
  uint64_t v52 = v99;
  ScrollView.init(_:showsIndicators:content:)();
  swift_bridgeObjectRelease();
  uint64_t v53 = static HorizontalAlignment.center.getter();
  uint64_t v54 = (uint64_t)v92;
  *uint64_t v92 = v53;
  *(void *)(v54 + 8) = 0x4014000000000000;
  *(unsigned char *)(v54 + 16) = 0;
  uint64_t v55 = sub_100009288(&qword_10002EE18);
  sub_1000130E0(v40, v44 > 0, v54 + *(int *)(v55 + 44));
  id v56 = [self mainScreen];
  [v56 bounds];
  CGFloat v58 = v57;
  CGFloat v60 = v59;
  CGFloat v62 = v61;
  CGFloat v64 = v63;

  v107.origin.x = v58;
  v107.origin.y = v60;
  v107.size.width = v62;
  v107.size.height = v64;
  if (CGRectGetHeight(v107) > 750.0) {
    double v65 = 10.0;
  }
  else {
    double v65 = 0.0;
  }
  char v66 = static Edge.Set.all.getter();
  uint64_t v67 = v90;
  sub_10000A0F0(v54, v90, &qword_10002EDE0);
  uint64_t v68 = v67 + *(int *)(v91 + 36);
  *(unsigned char *)uint64_t v68 = v66;
  *(double *)(v68 + 8) = v65;
  *(_OWORD *)(v68 + 16) = xmmword_10001F350;
  *(void *)(v68 + 32) = 0x4039000000000000;
  *(unsigned char *)(v68 + 40) = 0;
  sub_10000A154(v54, &qword_10002EDE0);
  uint64_t v69 = v94;
  sub_10000AB10(v67, v94, &qword_10002EDE8);
  uint64_t v70 = (uint64_t)v89;
  sub_10000A0F0(v100, (uint64_t)v89, &qword_10002EE00);
  uint64_t v71 = v95;
  uint64_t v72 = *(void (**)(char *, char *, uint64_t))(v95 + 16);
  uint64_t v73 = v93;
  uint64_t v74 = v52;
  uint64_t v75 = v96;
  v72(v93, v74, v96);
  uint64_t v76 = v97;
  sub_10000A0F0(v69, v97, &qword_10002EDE8);
  uint64_t v77 = v98;
  sub_10000A0F0(v70, v98, &qword_10002EE00);
  uint64_t v78 = (int *)sub_100009288(&qword_10002EE20);
  v72((char *)(v77 + v78[12]), v73, v75);
  uint64_t v79 = v77 + v78[16];
  *(void *)uint64_t v79 = 0;
  *(unsigned char *)(v79 + 8) = 1;
  sub_10000A0F0(v76, v77 + v78[20], &qword_10002EDE8);
  sub_10000A154(v69, &qword_10002EDE8);
  uint64_t v80 = *(void (**)(char *, uint64_t))(v71 + 8);
  v80(v99, v75);
  sub_10000A154(v100, &qword_10002EE00);
  sub_10000A154(v76, &qword_10002EDE8);
  v80(v73, v75);
  return sub_10000A154(v70, &qword_10002EE00);
}

uint64_t sub_100011910@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  int v133 = a4;
  uint64_t v136 = a3;
  uint64_t v134 = a2;
  *(void *)&long long v138 = a5;
  uint64_t v130 = sub_100009288(&qword_10002ECD0);
  __chkstk_darwin(v130);
  uint64_t v131 = (uint64_t)&v122 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = sub_100009288(&qword_10002EBB0);
  __chkstk_darwin(v124);
  int v126 = (char *)&v122 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Material();
  uint64_t v127 = *(void *)(v8 - 8);
  uint64_t v128 = v8;
  __chkstk_darwin(v8);
  uint64_t v125 = (char *)&v122 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v129 = sub_100009288(&qword_10002ECD8);
  uint64_t v10 = __chkstk_darwin(v129);
  uint64_t v12 = (_OWORD *)((char *)&v122 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v123 = (uint64_t)&v122 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (_OWORD *)((char *)&v122 - v16);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v122 - v18;
  uint64_t v20 = sub_100009288(&qword_10002ECE0);
  uint64_t v21 = __chkstk_darwin(v20 - 8);
  uint64_t v137 = (uint64_t)&v122 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  char v23 = *(unsigned char *)(a1 + 112);
  uint64_t v135 = a1;
  uint64_t v24 = (long long *)(a1 + 80);
  uint64_t v132 = (char *)&v122 - v25;
  if (v23)
  {
    long long v143 = *v24;
    sub_100009288(&qword_10002EB70);
    State.wrappedValue.getter();
    uint64_t v68 = *(void *)&v142[0];
    long long v143 = *v24;
    State.wrappedValue.getter();
    if (*(void *)&v142[0] >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v69 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v69 = *(void *)((*(void *)&v142[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    id v70 = [self mainScreen];
    [v70 bounds];
    CGFloat v72 = v71;
    CGFloat v74 = v73;
    CGFloat v76 = v75;
    CGFloat v78 = v77;

    v163.origin.x = v72;
    v163.origin.y = v74;
    v163.size.width = v76;
    v163.size.height = v78;
    double Height = CGRectGetHeight(v163);
    id v80 = [self currentDevice];
    id v81 = [v80 userInterfaceIdiom];

    if (v68 < 0 || (v68 & 0x4000000000000000) != 0)
    {
      unint64_t v121 = swift_bridgeObjectRetain();
      uint64_t v82 = (uint64_t)sub_100009534(v121);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v82 = v68 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain();
    }
    BOOL v83 = v81 == (id)1;
    v139[0] = v82;
    sub_1000169F4();
    swift_bridgeObjectRelease();
    uint64_t v84 = v139[0];
    char v85 = static Edge.Set.top.getter();
    EdgeInsets.init(_all:)();
    char v151 = 2;
    uint64_t v152 = v84;
    uint64_t v153 = v69;
    BOOL v154 = Height <= 750.0;
    BOOL v155 = v83;
    char v156 = v85;
    *(void *)&long long v157 = v86;
    *((void *)&v157 + 1) = v87;
    double v158 = v88;
    uint64_t v159 = v89;
    char v160 = 0;
    static Alignment.center.getter();
    sub_10000E280(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, &v143, 0.0, 1, INFINITY, 0);
    swift_release();
    v142[8] = *(_OWORD *)&v144[112];
    v142[9] = *(_OWORD *)&v144[128];
    v142[10] = *(_OWORD *)&v144[144];
    v142[11] = *(_OWORD *)&v144[160];
    v142[4] = *(_OWORD *)&v144[48];
    v142[5] = *(_OWORD *)&v144[64];
    v142[6] = *(_OWORD *)&v144[80];
    v142[7] = *(_OWORD *)&v144[96];
    v142[0] = v143;
    v142[1] = *(_OWORD *)v144;
    v142[2] = *(_OWORD *)&v144[16];
    v142[3] = *(_OWORD *)&v144[32];
    uint64_t v90 = v125;
    static Material.thin.getter();
    char v91 = static Edge.Set.all.getter();
    uint64_t v93 = (uint64_t)v126;
    uint64_t v92 = v127;
    uint64_t v94 = v128;
    (*(void (**)(char *, char *, uint64_t))(v127 + 16))(v126, v90, v128);
    *(unsigned char *)(v93 + *(int *)(v124 + 36)) = v91;
    sub_10000A0F0(v93, (uint64_t)v17 + *(int *)(v129 + 36), &qword_10002EBB0);
    long long v95 = v142[9];
    v17[8] = v142[8];
    v17[9] = v95;
    long long v96 = v142[11];
    v17[10] = v142[10];
    v17[11] = v96;
    long long v97 = v142[5];
    v17[4] = v142[4];
    v17[5] = v97;
    long long v98 = v142[7];
    v17[6] = v142[6];
    v17[7] = v98;
    long long v99 = v142[1];
    *uint64_t v17 = v142[0];
    v17[1] = v99;
    long long v100 = v142[3];
    v17[2] = v142[2];
    v17[3] = v100;
    sub_1000183F8((uint64_t)v142);
    sub_10000A154(v93, &qword_10002EBB0);
    (*(void (**)(char *, uint64_t))(v92 + 8))(v90, v94);
    sub_100017CD8((uint64_t)v142);
    sub_10000AB10((uint64_t)v17, (uint64_t)v19, &qword_10002ECD8);
    sub_10000A0F0((uint64_t)v19, v131, &qword_10002ECD8);
    swift_storeEnumTagMultiPayload();
    sub_100017D04();
    uint64_t v67 = (uint64_t)v132;
    _ConditionalContent<>.init(storage:)();
    sub_10000A154((uint64_t)v19, &qword_10002ECD8);
  }
  else
  {
    long long v143 = *v24;
    sub_100009288(&qword_10002EB70);
    State.wrappedValue.getter();
    uint64_t v26 = *(void *)&v142[0];
    long long v143 = *v24;
    State.wrappedValue.getter();
    if (*(void *)&v142[0] >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v122 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v122 = *(void *)((*(void *)&v142[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    uint64_t v27 = self;
    id v28 = [v27 mainScreen];
    [v28 bounds];
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;

    v161.origin.x = v30;
    v161.origin.y = v32;
    v161.size.width = v34;
    v161.size.height = v36;
    double v37 = CGRectGetHeight(v161);
    id v38 = [self currentDevice];
    id v39 = [v38 userInterfaceIdiom];

    if (v26 < 0 || (v26 & 0x4000000000000000) != 0)
    {
      unint64_t v120 = swift_bridgeObjectRetain();
      uint64_t v40 = (uint64_t)sub_100009534(v120);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v40 = v26 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain();
    }
    BOOL v41 = v39 == (id)1;
    BOOL v42 = v37 <= 750.0;
    *(void *)&long long v143 = v40;
    sub_1000169F4();
    swift_bridgeObjectRelease();
    uint64_t v43 = v143;
    id v44 = [v27 mainScreen];
    [v44 bounds];
    CGFloat v46 = v45;
    CGFloat v48 = v47;
    CGFloat v50 = v49;
    CGFloat v52 = v51;

    v162.origin.x = v46;
    v162.origin.y = v48;
    v162.size.width = v50;
    v162.size.height = v52;
    if (CGRectGetHeight(v162) > 750.0) {
      double v53 = 5.0;
    }
    else {
      double v53 = 25.0;
    }
    char v54 = static Edge.Set.all.getter();
    char v151 = 2;
    uint64_t v152 = v43;
    uint64_t v153 = v122;
    BOOL v154 = v42;
    BOOL v155 = v41;
    char v156 = v54;
    long long v157 = xmmword_10001F330;
    double v158 = v53;
    uint64_t v159 = 0x4039000000000000;
    char v160 = 0;
    static Alignment.center.getter();
    sub_10000E280(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, &v143, 0.0, 1, INFINITY, 0);
    swift_release();
    v142[8] = *(_OWORD *)&v144[112];
    v142[9] = *(_OWORD *)&v144[128];
    v142[10] = *(_OWORD *)&v144[144];
    v142[11] = *(_OWORD *)&v144[160];
    v142[4] = *(_OWORD *)&v144[48];
    v142[5] = *(_OWORD *)&v144[64];
    v142[6] = *(_OWORD *)&v144[80];
    v142[7] = *(_OWORD *)&v144[96];
    v142[0] = v143;
    v142[1] = *(_OWORD *)v144;
    v142[2] = *(_OWORD *)&v144[16];
    v142[3] = *(_OWORD *)&v144[32];
    uint64_t v55 = v125;
    static Material.thin.getter();
    char v56 = static Edge.Set.all.getter();
    uint64_t v58 = (uint64_t)v126;
    uint64_t v57 = v127;
    uint64_t v59 = v128;
    (*(void (**)(char *, char *, uint64_t))(v127 + 16))(v126, v55, v128);
    *(unsigned char *)(v58 + *(int *)(v124 + 36)) = v56;
    sub_10000A0F0(v58, (uint64_t)v12 + *(int *)(v129 + 36), &qword_10002EBB0);
    long long v60 = v142[9];
    v12[8] = v142[8];
    v12[9] = v60;
    long long v61 = v142[11];
    v12[10] = v142[10];
    v12[11] = v61;
    long long v62 = v142[5];
    v12[4] = v142[4];
    v12[5] = v62;
    long long v63 = v142[7];
    v12[6] = v142[6];
    v12[7] = v63;
    long long v64 = v142[1];
    *uint64_t v12 = v142[0];
    v12[1] = v64;
    long long v65 = v142[3];
    v12[2] = v142[2];
    v12[3] = v65;
    sub_1000183F8((uint64_t)v142);
    sub_10000A154(v58, &qword_10002EBB0);
    (*(void (**)(char *, uint64_t))(v57 + 8))(v55, v59);
    sub_100017CD8((uint64_t)v142);
    uint64_t v66 = v123;
    sub_10000AB10((uint64_t)v12, v123, &qword_10002ECD8);
    sub_10000A0F0(v66, v131, &qword_10002ECD8);
    swift_storeEnumTagMultiPayload();
    sub_100017D04();
    uint64_t v67 = (uint64_t)v132;
    _ConditionalContent<>.init(storage:)();
    sub_10000A154(v66, &qword_10002ECD8);
  }
  uint64_t v101 = static HorizontalAlignment.center.getter();
  sub_100012534(v134, v136, v135, v133 & 1, v150);
  id v102 = [self mainScreen];
  [v102 bounds];
  CGFloat v104 = v103;
  CGFloat v106 = v105;
  CGFloat v108 = v107;
  CGFloat v110 = v109;

  v164.origin.x = v104;
  v164.origin.y = v106;
  v164.size.width = v108;
  v164.size.height = v110;
  if (CGRectGetHeight(v164) > 750.0) {
    double v111 = 10.0;
  }
  else {
    double v111 = 0.0;
  }
  char v140 = 1;
  memcpy((char *)v139 + 7, v150, 0x189uLL);
  char v112 = static Edge.Set.all.getter();
  char v141 = 0;
  uint64_t v113 = v137;
  sub_10000A0F0(v67, v137, &qword_10002ECE0);
  char v114 = v141;
  uint64_t v115 = v138;
  sub_10000A0F0(v113, v138, &qword_10002ECE0);
  uint64_t v116 = sub_100009288(&qword_10002EE48);
  uint64_t v117 = v115 + *(int *)(v116 + 48);
  *(void *)uint64_t v117 = 0;
  *(unsigned char *)(v117 + 8) = 1;
  uint64_t v118 = (void *)(v115 + *(int *)(v116 + 64));
  v142[0] = (unint64_t)v101;
  LOBYTE(v142[1]) = 1;
  memcpy((char *)&v142[1] + 1, v139, 0x190uLL);
  BYTE8(v142[26]) = v112;
  *(double *)&v142[27] = v111;
  *((void *)&v142[27] + 1) = 0x4039000000000000;
  long long v138 = xmmword_10001F360;
  v142[28] = xmmword_10001F360;
  LOBYTE(v142[29]) = v114;
  memcpy(v118, v142, 0x1D1uLL);
  sub_1000188F0((uint64_t)v142);
  sub_10000A154(v67, &qword_10002ECE0);
  long long v143 = (unint64_t)v101;
  v144[0] = 1;
  memcpy(&v144[1], v139, 0x190uLL);
  char v145 = v112;
  double v146 = v111;
  uint64_t v147 = 0x4039000000000000;
  long long v148 = v138;
  char v149 = v114;
  sub_1000189E4((uint64_t)&v143);
  return sub_10000A154(v113, &qword_10002ECE0);
}

uint64_t sub_100012534@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, void *a5@<X8>)
{
  LODWORD(v105) = a4;
  uint64_t v110 = a3;
  uint64_t v113 = a5;
  uint64_t v7 = type metadata accessor for Locale();
  __chkstk_darwin(v7 - 8);
  uint64_t v116 = (char *)&v101 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v9 - 8);
  char v114 = (char *)&v101 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for String.LocalizationValue.StringInterpolation();
  __chkstk_darwin(v11 - 8);
  CGFloat v108 = (char *)&v101 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100009288(&qword_10002E540);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v101 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v173[0] = a1;
  *((void *)&v173[0] + 1) = a2;
  unint64_t v16 = sub_100009FD4();
  swift_bridgeObjectRetain();
  unint64_t v111 = v16;
  uint64_t v17 = Text.init<A>(_:)();
  uint64_t v19 = v18;
  uint64_t v133 = v20;
  char v22 = v21 & 1;
  static Font.Weight.bold.getter();
  uint64_t v23 = enum case for Font.Design.default(_:);
  uint64_t v24 = type metadata accessor for Font.Design();
  uint64_t v25 = *(void *)(v24 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 104))(v15, v23, v24);
  uint64_t v26 = *(void (**)(void, void, void, void))(v25 + 56);
  uint64_t v109 = v24;
  CGFloat v106 = v26;
  uint64_t v107 = v25 + 56;
  v26(v15, 0, 1, v24);
  static Font.system(size:weight:design:)();
  uint64_t v115 = v15;
  sub_10000A154((uint64_t)v15, &qword_10002E540);
  uint64_t v112 = Text.font(_:)();
  uint64_t v134 = v27;
  uint64_t v135 = v28;
  LOBYTE(v23) = v29;
  swift_release();
  sub_10000A028(v17, v19, v22);
  swift_bridgeObjectRelease();
  LODWORD(v133) = static Edge.Set.horizontal.getter();
  EdgeInsets.init(_all:)();
  uint64_t v131 = v31;
  uint64_t v132 = v30;
  uint64_t v129 = v33;
  uint64_t v130 = v32;
  int v128 = static Edge.Set.vertical.getter();
  id v104 = self;
  id v34 = [v104 mainScreen];
  [v34 bounds];
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  CGFloat v42 = v41;

  v240.origin.x = v36;
  v240.origin.y = v38;
  v240.size.width = v40;
  v240.size.height = v42;
  CGRectGetHeight(v240);
  EdgeInsets.init(_all:)();
  uint64_t v126 = v44;
  uint64_t v127 = v43;
  uint64_t v124 = v46;
  uint64_t v125 = v45;
  unsigned __int8 v231 = v23 & 1;
  unsigned __int8 v230 = 0;
  unsigned __int8 v229 = 0;
  uint64_t KeyPath = swift_getKeyPath();
  int v117 = v231;
  int v118 = v230;
  int v120 = v229;
  uint64_t v122 = swift_getKeyPath();
  uint64_t v121 = swift_getKeyPath();
  uint64_t v119 = swift_getKeyPath();
  unsigned __int8 v232 = 0;
  if (v105)
  {
    String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
    unint64_t v47 = 0xD000000000000024;
    unint64_t v48 = 0x8000000100020010;
  }
  else
  {
    String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
    unint64_t v48 = 0x800000010001FFE0;
    unint64_t v47 = 0xD000000000000020;
  }
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v47);
  uint64_t v49 = *(void *)(v110 + 8);
  uint64_t v50 = *(void *)(v49 + 16);
  double v51 = *(void **)(v49 + 24);
  swift_bridgeObjectRetain();
  v52._countAndFlagsBits = v50;
  v52._object = v51;
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v52);
  swift_bridgeObjectRelease();
  v53._countAndFlagsBits = 0;
  v53._object = (void *)0xE000000000000000;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v53);
  String.LocalizationValue.init(stringInterpolation:)();
  static Locale.current.getter();
  *(void *)&v173[0] = String.init(localized:table:bundle:locale:comment:)();
  *((void *)&v173[0] + 1) = v54;
  uint64_t v55 = Text.init<A>(_:)();
  uint64_t v57 = v56;
  char v59 = v58 & 1;
  uint64_t v60 = (uint64_t)v115;
  v106(v115, 1, 1, v109);
  static Font.system(size:weight:design:)();
  sub_10000A154(v60, &qword_10002E540);
  uint64_t v61 = Text.font(_:)();
  uint64_t v115 = v62;
  uint64_t v116 = (char *)v61;
  char v64 = v63;
  char v114 = v65;
  swift_release();
  sub_10000A028(v55, v57, v59);
  swift_bridgeObjectRelease();
  LODWORD(v111) = static Edge.Set.horizontal.getter();
  EdgeInsets.init(_all:)();
  uint64_t v67 = v66;
  uint64_t v69 = v68;
  uint64_t v71 = v70;
  uint64_t v73 = v72;
  LOBYTE(v55) = static Edge.Set.vertical.getter();
  id v74 = [v104 mainScreen];
  [v74 bounds];
  CGFloat v76 = v75;
  CGFloat v78 = v77;
  CGFloat v80 = v79;
  CGFloat v82 = v81;

  v241.origin.x = v76;
  v241.origin.y = v78;
  v241.size.width = v80;
  v241.size.height = v82;
  CGRectGetHeight(v241);
  EdgeInsets.init(_all:)();
  uint64_t v107 = v84;
  CGFloat v108 = v83;
  uint64_t v105 = v86;
  CGFloat v106 = v85;
  char v145 = v64 & 1;
  char v144 = 0;
  unsigned __int8 v143 = 0;
  uint64_t v87 = (void *)swift_getKeyPath();
  id v104 = v87;
  char v88 = v145;
  LOBYTE(v57) = v144;
  LODWORD(v109) = v143;
  uint64_t v89 = swift_getKeyPath();
  uint64_t v102 = v89;
  uint64_t v90 = swift_getKeyPath();
  uint64_t v103 = v90;
  uint64_t v101 = swift_getKeyPath();
  char v146 = 0;
  v142[0] = v239[0];
  *(_DWORD *)((char *)v142 + 3) = *(_DWORD *)((char *)v239 + 3);
  v141[0] = *(_DWORD *)v238;
  *(_DWORD *)((char *)v141 + 3) = *(_DWORD *)&v238[3];
  v140[0] = *(_DWORD *)v237;
  *(_DWORD *)((char *)v140 + 3) = *(_DWORD *)&v237[3];
  *(_DWORD *)((char *)v139 + 3) = *(_DWORD *)&v236[3];
  v139[0] = *(_DWORD *)v236;
  *(_DWORD *)((char *)v138 + 3) = *(_DWORD *)&v235[3];
  v138[0] = *(_DWORD *)v235;
  *(_DWORD *)((char *)v137 + 3) = *(_DWORD *)&v234[3];
  v137[0] = *(_DWORD *)v234;
  *(_DWORD *)((char *)v136 + 3) = *(_DWORD *)&v233[3];
  v136[0] = *(_DWORD *)v233;
  DWORD1(v148) = *(_DWORD *)((char *)v239 + 3);
  *(_DWORD *)((char *)&v148 + 1) = v239[0];
  DWORD1(v149) = *(_DWORD *)&v238[3];
  *(_DWORD *)((char *)&v149 + 1) = *(_DWORD *)v238;
  HIDWORD(v151) = *(_DWORD *)&v237[3];
  LODWORD(v110) = v232;
  *((void *)&v147 + 1) = v134;
  LOBYTE(v148) = v117;
  *((void *)&v148 + 1) = v135;
  LOBYTE(v149) = v133;
  *((void *)&v149 + 1) = v132;
  *(void *)&long long v150 = v131;
  *((void *)&v150 + 1) = v130;
  *(void *)&long long v151 = v129;
  BYTE8(v151) = v118;
  *(_DWORD *)((char *)&v151 + 9) = *(_DWORD *)v237;
  LOBYTE(v152) = v128;
  DWORD1(v152) = *(_DWORD *)&v236[3];
  *(_DWORD *)((char *)&v152 + 1) = *(_DWORD *)v236;
  *((void *)&v152 + 1) = v127;
  *(void *)&long long v153 = v126;
  *((void *)&v153 + 1) = v125;
  *(void *)&long long v154 = v124;
  BYTE8(v154) = v120;
  HIDWORD(v154) = *(_DWORD *)&v235[3];
  *(_DWORD *)((char *)&v154 + 9) = *(_DWORD *)v235;
  *(void *)&long long v155 = KeyPath;
  BYTE8(v155) = 1;
  HIDWORD(v155) = *(_DWORD *)&v234[3];
  *(_DWORD *)((char *)&v155 + 9) = *(_DWORD *)v234;
  *(void *)&long long v156 = v122;
  BYTE8(v156) = 1;
  HIDWORD(v156) = *(_DWORD *)&v233[3];
  *(_DWORD *)((char *)&v156 + 9) = *(_DWORD *)v233;
  *(void *)&long long v157 = v121;
  *((void *)&v157 + 1) = 0x3FE0000000000000;
  *(void *)&long long v158 = v119;
  *((void *)&v158 + 1) = 2;
  unsigned __int8 v159 = v232;
  *(void *)&long long v160 = v116;
  *((void *)&v160 + 1) = v115;
  *((void *)&v161 + 1) = v114;
  uint64_t v91 = v67;
  *((void *)&v162 + 1) = v67;
  *(void *)&long long v163 = v69;
  uint64_t v92 = v69;
  uint64_t v93 = v71;
  *((void *)&v163 + 1) = v71;
  *(void *)&long long v164 = v73;
  uint64_t v94 = v73;
  uint64_t v95 = v107;
  long long v96 = v108;
  *((void *)&v165 + 1) = v108;
  *(void *)&long long v166 = v107;
  uint64_t v97 = v105;
  long long v98 = v106;
  *((void *)&v166 + 1) = v106;
  *(void *)&long long v167 = v105;
  *(void *)&long long v168 = v87;
  *(void *)&long long v169 = v89;
  *(void *)&long long v170 = v90;
  *((void *)&v170 + 1) = 0x3FE0000000000000;
  LOBYTE(v173[12]) = v232;
  *(void *)&long long v171 = v101;
  *((void *)&v171 + 1) = 4;
  LOBYTE(v161) = v88;
  LOBYTE(v90) = v111;
  LOBYTE(v162) = v111;
  BYTE8(v164) = v57;
  LOBYTE(v165) = v55;
  LOBYTE(v89) = v109;
  BYTE8(v167) = v109;
  BYTE8(v168) = 1;
  BYTE8(v169) = 1;
  char v172 = 0;
  *(_OWORD *)((char *)&v173[22] + 8) = v170;
  *(_OWORD *)((char *)&v173[23] + 8) = v171;
  *(_OWORD *)((char *)&v173[18] + 8) = v166;
  *(_OWORD *)((char *)&v173[19] + 8) = v167;
  *(_OWORD *)((char *)&v173[20] + 8) = v168;
  *(_OWORD *)((char *)&v173[21] + 8) = v169;
  *(_OWORD *)((char *)&v173[16] + 8) = v164;
  *(_OWORD *)((char *)&v173[17] + 8) = v165;
  BYTE8(v173[24]) = 0;
  uint64_t v99 = v112;
  *(void *)&long long v147 = v112;
  v173[10] = v157;
  v173[11] = v158;
  v173[6] = v153;
  unsigned char v173[7] = v154;
  v173[8] = v155;
  v173[9] = v156;
  v173[2] = v149;
  v173[3] = v150;
  v173[4] = v151;
  v173[5] = v152;
  v173[0] = v147;
  v173[1] = v148;
  *(_OWORD *)((char *)&v173[13] + 8) = v161;
  *(_OWORD *)((char *)&v173[14] + 8) = v162;
  *(_OWORD *)((char *)&v173[15] + 8) = v163;
  *(_OWORD *)((char *)&v173[12] + 8) = v160;
  memcpy(v113, v173, 0x189uLL);
  v174[0] = v116;
  v174[1] = v115;
  char v175 = v88;
  v176 = v114;
  char v177 = v90;
  uint64_t v178 = v91;
  uint64_t v179 = v92;
  uint64_t v180 = v93;
  uint64_t v181 = v94;
  char v182 = v57;
  char v183 = v55;
  v184 = v96;
  uint64_t v185 = v95;
  char v186 = v98;
  uint64_t v187 = v97;
  char v188 = v89;
  id v189 = v104;
  char v190 = 1;
  uint64_t v191 = v102;
  char v192 = 1;
  uint64_t v193 = v103;
  uint64_t v194 = 0x3FE0000000000000;
  uint64_t v195 = v101;
  uint64_t v196 = 4;
  char v197 = 0;
  sub_1000182F8((uint64_t)&v147);
  sub_1000182F8((uint64_t)&v160);
  sub_100018378((uint64_t)v174);
  v198[0] = v99;
  v198[1] = v134;
  char v199 = v117;
  *(_DWORD *)long long v200 = v142[0];
  *(_DWORD *)&v200[3] = *(_DWORD *)((char *)v142 + 3);
  uint64_t v201 = v135;
  char v202 = v133;
  *(_DWORD *)long long v203 = v141[0];
  *(_DWORD *)&v203[3] = *(_DWORD *)((char *)v141 + 3);
  uint64_t v204 = v132;
  uint64_t v205 = v131;
  uint64_t v206 = v130;
  uint64_t v207 = v129;
  char v208 = v118;
  *(_DWORD *)&v209[3] = *(_DWORD *)((char *)v140 + 3);
  *(_DWORD *)unsigned __int8 v209 = v140[0];
  char v210 = v128;
  *(_DWORD *)&v211[3] = *(_DWORD *)((char *)v139 + 3);
  *(_DWORD *)long long v211 = v139[0];
  uint64_t v212 = v127;
  uint64_t v213 = v126;
  uint64_t v214 = v125;
  uint64_t v215 = v124;
  char v216 = v120;
  *(_DWORD *)&v217[3] = *(_DWORD *)((char *)v138 + 3);
  *(_DWORD *)long long v217 = v138[0];
  uint64_t v218 = KeyPath;
  char v219 = 1;
  *(_DWORD *)long long v220 = v137[0];
  *(_DWORD *)&v220[3] = *(_DWORD *)((char *)v137 + 3);
  uint64_t v221 = v122;
  char v222 = 1;
  *(_DWORD *)long long v223 = v136[0];
  *(_DWORD *)&v223[3] = *(_DWORD *)((char *)v136 + 3);
  uint64_t v224 = v121;
  uint64_t v225 = 0x3FE0000000000000;
  uint64_t v226 = v119;
  uint64_t v227 = 2;
  char v228 = v110;
  return sub_100018378((uint64_t)v198);
}

uint64_t sub_1000130E0@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  int v95 = a2;
  uint64_t v93 = a3;
  uint64_t v90 = type metadata accessor for DefaultButtonStyle();
  uint64_t v92 = *(void *)(v90 - 8);
  __chkstk_darwin(v90);
  uint64_t v87 = (char *)&v70 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = sub_100009288(&qword_10002EE28);
  uint64_t v89 = *(void *)(v91 - 8);
  uint64_t v5 = __chkstk_darwin(v91);
  uint64_t v86 = (char *)&v70 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  char v88 = (char *)&v70 - v7;
  uint64_t v85 = type metadata accessor for RoundedRectangle() - 8;
  __chkstk_darwin(v85);
  uint64_t v84 = (char *)&v70 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = type metadata accessor for BorderedProminentButtonStyle();
  uint64_t v83 = *(void *)(v82 - 8);
  __chkstk_darwin(v82);
  CGFloat v76 = (char *)&v70 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100009288(&qword_10002EC68);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v70 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = sub_100009288(&qword_10002EC70);
  __chkstk_darwin(v94);
  uint64_t v15 = (char *)&v70 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = sub_100009288(&qword_10002EC78);
  uint64_t v80 = *(void *)(v81 - 8);
  __chkstk_darwin(v81);
  uint64_t v17 = (char *)&v70 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100009288(&qword_10002EE30);
  uint64_t v19 = v18 - 8;
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v71 = (char *)&v70 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v79 = (uint64_t)&v70 - v22;
  uint64_t v23 = swift_allocObject();
  long long v24 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v23 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v23 + 96) = v24;
  *(_OWORD *)(v23 + 112) = *(_OWORD *)(a1 + 96);
  *(unsigned char *)(v23 + 128) = *(unsigned char *)(a1 + 112);
  long long v25 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v23 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v23 + 32) = v25;
  long long v26 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v23 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v23 + 64) = v26;
  char v97 = v95;
  uint64_t v98 = a1;
  sub_1000178B4(a1);
  uint64_t v78 = sub_100009288(&qword_10002EC98);
  unint64_t v77 = sub_100017A98();
  Button.init(action:label:)();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  double v75 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  uint64_t v70 = v10;
  v75(v15, v13, v10);
  uint64_t v27 = &v15[*(int *)(v94 + 36)];
  long long v28 = v100;
  *(_OWORD *)uint64_t v27 = v99;
  *((_OWORD *)v27 + 1) = v28;
  *((_OWORD *)v27 + 2) = v101;
  char v29 = *(void (**)(char *, uint64_t))(v11 + 8);
  uint64_t v73 = v11 + 8;
  id v74 = v29;
  v29(v13, v10);
  uint64_t v30 = v76;
  BorderedProminentButtonStyle.init()();
  unint64_t v72 = sub_100017B0C();
  sub_1000188A8(&qword_10002ECB8, 255, (void (*)(uint64_t))&type metadata accessor for BorderedProminentButtonStyle);
  uint64_t v31 = v82;
  View.buttonStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v83 + 8))(v30, v31);
  sub_10000A154((uint64_t)v15, &qword_10002EC70);
  uint64_t v32 = v84;
  uint64_t v33 = &v84[*(int *)(v85 + 28)];
  uint64_t v34 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v35 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v35 - 8) + 104))(v33, v34, v35);
  __asm { FMOV            V0.2D, #14.0 }
  _OWORD *v32 = _Q0;
  uint64_t v41 = (uint64_t)v71;
  uint64_t v42 = (uint64_t)&v71[*(int *)(v19 + 44)];
  sub_100017C04((uint64_t)v32, v42);
  *(_WORD *)(v42 + *(int *)(sub_100009288(&qword_10002ECC0) + 36)) = 256;
  uint64_t v43 = v80;
  uint64_t v44 = v81;
  (*(void (**)(uint64_t, char *, uint64_t))(v80 + 16))(v41, v17, v81);
  sub_100017C68((uint64_t)v32);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v17, v44);
  uint64_t v45 = v79;
  sub_10000AB10(v41, v79, &qword_10002EE30);
  uint64_t v46 = swift_allocObject();
  long long v47 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v46 + 88) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v46 + 104) = v47;
  *(_OWORD *)(v46 + 120) = *(_OWORD *)(a1 + 96);
  long long v48 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v46 + 24) = *(_OWORD *)a1;
  *(_OWORD *)(v46 + 40) = v48;
  long long v49 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v46 + 56) = *(_OWORD *)(a1 + 32);
  char v50 = v95;
  *(unsigned char *)(v46 + 16) = v95;
  *(unsigned char *)(v46 + 136) = *(unsigned char *)(a1 + 112);
  *(_OWORD *)(v46 + 72) = v49;
  char v96 = v50;
  sub_1000178B4(a1);
  Button.init(action:label:)();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v51 = v70;
  v75(v15, v13, v70);
  Swift::String v52 = &v15[*(int *)(v94 + 36)];
  long long v53 = v103;
  *(_OWORD *)Swift::String v52 = v102;
  *((_OWORD *)v52 + 1) = v53;
  *((_OWORD *)v52 + 2) = v104;
  v74(v13, v51);
  uint64_t v54 = v87;
  DefaultButtonStyle.init()();
  sub_1000188A8(&qword_10002EE38, 255, (void (*)(uint64_t))&type metadata accessor for DefaultButtonStyle);
  uint64_t v55 = v86;
  uint64_t v56 = v90;
  View.buttonStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v92 + 8))(v54, v56);
  sub_10000A154((uint64_t)v15, &qword_10002EC70);
  uint64_t v57 = v89;
  char v58 = v88;
  uint64_t v59 = v91;
  (*(void (**)(char *, char *, uint64_t))(v89 + 32))(v88, v55, v91);
  uint64_t v60 = v41;
  sub_10000A0F0(v45, v41, &qword_10002EE30);
  uint64_t v61 = v57;
  long long v62 = *(void (**)(char *, char *, uint64_t))(v57 + 16);
  char v63 = v55;
  char v64 = v55;
  uint64_t v65 = v59;
  v62(v63, v58, v59);
  uint64_t v66 = v93;
  sub_10000A0F0(v60, v93, &qword_10002EE30);
  uint64_t v67 = sub_100009288(&qword_10002EE40);
  v62((char *)(v66 + *(int *)(v67 + 48)), v64, v65);
  uint64_t v68 = *(void (**)(char *, uint64_t))(v61 + 8);
  v68(v58, v65);
  sub_10000A154(v45, &qword_10002EE30);
  v68(v64, v65);
  return sub_10000A154(v60, &qword_10002EE30);
}

uint64_t sub_100013B24(uint64_t result)
{
  uint64_t v1 = *(void (**)())(*(void *)(result + 8) + 48);
  if (v1)
  {
    swift_retain();
    sub_100009288(&qword_10002EB70);
    State.wrappedValue.getter();
    v1();
    sub_10000C6B0((uint64_t)v1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

__n128 sub_100013BB0@<Q0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_100009288(&qword_10002E540);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Locale();
  __chkstk_darwin(v9 - 8);
  uint64_t v10 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v10 - 8);
  if (a1)
  {
    v33[0] = *(_OWORD *)(a2 + 80);
    sub_100009288(&qword_10002EB70);
    State.wrappedValue.getter();
    if (v32[1] >> 62)
    {
      swift_bridgeObjectRetain();
      _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  *(void *)&v33[0] = String.init(localized:table:bundle:locale:comment:)();
  *((void *)&v33[0] + 1) = v11;
  sub_100009FD4();
  uint64_t v12 = Text.init<A>(_:)();
  uint64_t v14 = v13;
  char v16 = v15 & 1;
  uint64_t v17 = type metadata accessor for Font.Design();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v8, 1, 1, v17);
  static Font.system(size:weight:design:)();
  sub_10000A154((uint64_t)v8, &qword_10002E540);
  static Font.Weight.semibold.getter();
  Font.weight(_:)();
  swift_release();
  uint64_t v18 = Text.font(_:)();
  uint64_t v20 = v19;
  char v22 = v21;
  uint64_t v24 = v23;
  swift_release();
  sub_10000A028(v12, v14, v16);
  swift_bridgeObjectRelease();
  uint64_t v25 = static Alignment.center.getter();
  sub_10000E440(0.0, 1, 0.0, 1, INFINITY, 0, 50.0, 0, (uint64_t)v33, 0.0, 1, 0.0, 1, v25, v26, v18, v20, v22 & 1, v24);
  sub_10000A028(v18, v20, v22 & 1);
  swift_bridgeObjectRelease();
  long long v27 = v33[7];
  long long v28 = v33[8];
  *(_OWORD *)(a3 + 96) = v33[6];
  *(_OWORD *)(a3 + 112) = v27;
  *(_OWORD *)(a3 + 128) = v28;
  long long v29 = v33[3];
  *(_OWORD *)(a3 + 32) = v33[2];
  *(_OWORD *)(a3 + 48) = v29;
  long long v30 = v33[5];
  *(_OWORD *)(a3 + 64) = v33[4];
  *(_OWORD *)(a3 + 80) = v30;
  __n128 result = (__n128)v33[1];
  *(_OWORD *)a3 = v33[0];
  *(__n128 *)(a3 + 16) = result;
  return result;
}

uint64_t sub_100013F78(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v2 = *(void (**)(void *))(*(void *)(a2 + 8) + 48);
    if (v2)
    {
      swift_retain();
      v2(&_swiftEmptyArrayStorage);
      return sub_10000C6B0((uint64_t)v2);
    }
  }
  else
  {
    sub_100009288(&qword_10002EB38);
    return State.wrappedValue.setter();
  }
  return result;
}

__n128 sub_10001401C@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100009288(&qword_10002E540);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  uint64_t v5 = type metadata accessor for Locale();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v6 - 8);
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  *(void *)&v29[0] = String.init(localized:table:bundle:locale:comment:)();
  *((void *)&v29[0] + 1) = v7;
  sub_100009FD4();
  uint64_t v8 = Text.init<A>(_:)();
  uint64_t v10 = v9;
  char v12 = v11 & 1;
  uint64_t v13 = type metadata accessor for Font.Design();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v4, 1, 1, v13);
  static Font.system(size:weight:design:)();
  sub_10000A154((uint64_t)v4, &qword_10002E540);
  static Font.Weight.semibold.getter();
  Font.weight(_:)();
  swift_release();
  uint64_t v14 = Text.font(_:)();
  uint64_t v16 = v15;
  char v18 = v17;
  uint64_t v20 = v19;
  swift_release();
  sub_10000A028(v8, v10, v12);
  swift_bridgeObjectRelease();
  uint64_t v21 = static Alignment.center.getter();
  sub_10000E440(0.0, 1, 0.0, 1, INFINITY, 0, 50.0, 0, (uint64_t)v29, 0.0, 1, 0.0, 1, v21, v22, v14, v16, v18 & 1, v20);
  sub_10000A028(v14, v16, v18 & 1);
  swift_bridgeObjectRelease();
  long long v23 = v29[7];
  long long v24 = v29[8];
  *(_OWORD *)(a1 + 96) = v29[6];
  *(_OWORD *)(a1 + 112) = v23;
  *(_OWORD *)(a1 + 128) = v24;
  long long v25 = v29[3];
  *(_OWORD *)(a1 + 32) = v29[2];
  *(_OWORD *)(a1 + 48) = v25;
  long long v26 = v29[5];
  *(_OWORD *)(a1 + 64) = v29[4];
  *(_OWORD *)(a1 + 80) = v26;
  __n128 result = (__n128)v29[1];
  *(_OWORD *)a1 = v29[0];
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t sub_10001433C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v24 = sub_100009288(&qword_10002ED30);
  __chkstk_darwin(v24);
  uint64_t v22 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_100009288(&qword_10002ED38);
  uint64_t v4 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for ToolbarItemPlacement();
  __chkstk_darwin(v7 - 8);
  uint64_t v21 = sub_100009288(&qword_10002ED40);
  uint64_t v8 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static ToolbarItemPlacement.navigationBarLeading.getter();
  uint64_t v27 = a1;
  sub_100009288(&qword_10002ED48);
  sub_10000B1C0(&qword_10002ED50, &qword_10002ED48);
  ToolbarItem<>.init(placement:content:)();
  static ToolbarItemPlacement.navigationBarTrailing.getter();
  uint64_t v26 = a1;
  sub_100009288(&qword_10002ED58);
  uint64_t v11 = sub_1000098A8(&qword_10002ED60);
  uint64_t v12 = sub_1000098A8(&qword_10002ED68);
  unint64_t v13 = sub_10001843C();
  uint64_t v14 = sub_100018500(&qword_10002ED98, &qword_10002ED68, (void (*)(void))sub_1000185A8);
  uint64_t v28 = v11;
  uint64_t v29 = v12;
  unint64_t v30 = v13;
  uint64_t v31 = v14;
  swift_getOpaqueTypeConformance2();
  ToolbarItem<>.init(placement:content:)();
  uint64_t v15 = v21;
  uint64_t v16 = &v22[*(int *)(v24 + 48)];
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v22, v10, v21);
  char v17 = v16;
  uint64_t v18 = v23;
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v17, v6, v23);
  TupleToolbarContent.init(_:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v18);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v15);
}

uint64_t sub_1000146E4(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  long long v3 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v2 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v2 + 96) = v3;
  *(_OWORD *)(v2 + 112) = *(_OWORD *)(a1 + 96);
  *(unsigned char *)(v2 + 128) = *(unsigned char *)(a1 + 112);
  long long v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v2 + 32) = v4;
  long long v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v2 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v2 + 64) = v5;
  sub_1000178B4(a1);
  sub_100009288(&qword_10002EDB8);
  sub_10000B1C0(&qword_10002EDC0, &qword_10002EDB8);

  return Button.init(action:label:)();
}

uint64_t sub_1000147DC@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = static VerticalAlignment.center.getter();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v2 = sub_100009288(&qword_10002EDC8);
  return sub_100014824((char *)(a1 + *(int *)(v2 + 44)));
}

uint64_t sub_100014824@<X0>(char *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Locale();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v3 - 8);
  uint64_t v4 = sub_100009288(&qword_10002EDD0);
  uint64_t v23 = *(void *)(v4 - 8);
  uint64_t v5 = v23;
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v23 - v9;
  uint64_t v24 = Image.init(systemName:)();
  static Font.Weight.bold.getter();
  View.fontWeight(_:)();
  swift_release();
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  uint64_t v24 = String.init(localized:table:bundle:locale:comment:)();
  uint64_t v25 = v11;
  sub_100009FD4();
  uint64_t v12 = Text.init<A>(_:)();
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  char v18 = v17 & 1;
  uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  v19(v8, v10, v4);
  v19(a1, v8, v4);
  uint64_t v20 = &a1[*(int *)(sub_100009288(&qword_10002EDD8) + 48)];
  *(void *)uint64_t v20 = v12;
  *((void *)v20 + 1) = v14;
  v20[16] = v18;
  *((void *)v20 + 3) = v16;
  sub_10000AA7C(v12, v14, v18);
  uint64_t v21 = *(void (**)(char *, uint64_t))(v23 + 8);
  swift_bridgeObjectRetain();
  v21(v10, v4);
  sub_10000A028(v12, v14, v18);
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v21)(v8, v4);
}

uint64_t sub_100014B08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v28[1] = a2;
  uint64_t v3 = sub_100009288(&qword_10002ED80);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100009288(&qword_10002ED60);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = swift_allocObject();
  long long v11 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v10 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v10 + 96) = v11;
  *(_OWORD *)(v10 + 112) = *(_OWORD *)(a1 + 96);
  *(unsigned char *)(v10 + 128) = *(unsigned char *)(a1 + 112);
  long long v12 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v10 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v10 + 32) = v12;
  long long v13 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v10 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v10 + 64) = v13;
  sub_1000178B4(a1);
  sub_100009288(&qword_10002EDA0);
  sub_10000B1C0(&qword_10002EDA8, &qword_10002EDA0);
  Button.init(action:label:)();
  long long v30 = *(_OWORD *)(a1 + 80);
  sub_100009288(&qword_10002EB70);
  State.wrappedValue.getter();
  if ((unint64_t)v29 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v14 = *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  BOOL v15 = v14 == 0;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v17 = swift_allocObject();
  *(unsigned char *)(v17 + 16) = v15;
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v9, v6, v3);
  char v18 = (uint64_t *)&v9[*(int *)(v7 + 36)];
  *char v18 = KeyPath;
  v18[1] = (uint64_t)sub_1000186B8;
  v18[2] = v17;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  long long v29 = *(_OWORD *)(a1 + 64);
  sub_100009288(&qword_10002EB38);
  State.projectedValue.getter();
  uint64_t v19 = swift_allocObject();
  long long v20 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v19 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v19 + 96) = v20;
  *(_OWORD *)(v19 + 112) = *(_OWORD *)(a1 + 96);
  *(unsigned char *)(v19 + 128) = *(unsigned char *)(a1 + 112);
  long long v21 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v19 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v19 + 32) = v21;
  long long v22 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v19 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v19 + 64) = v22;
  uint64_t v23 = swift_allocObject();
  long long v24 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v23 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v23 + 96) = v24;
  *(_OWORD *)(v23 + 112) = *(_OWORD *)(a1 + 96);
  *(unsigned char *)(v23 + 128) = *(unsigned char *)(a1 + 112);
  long long v25 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v23 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v23 + 32) = v25;
  long long v26 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v23 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v23 + 64) = v26;
  sub_1000178B4(a1);
  sub_1000178B4(a1);
  sub_100009288(&qword_10002ED68);
  sub_10001843C();
  sub_100018500(&qword_10002ED98, &qword_10002ED68, (void (*)(void))sub_1000185A8);
  View.sheet<A>(isPresented:onDismiss:content:)();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return sub_10000A154((uint64_t)v9, &qword_10002ED60);
}

uint64_t sub_100014F60@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Locale();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v3 - 8);
  uint64_t v4 = static VerticalAlignment.center.getter();
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)();
  sub_100009FD4();
  uint64_t result = Text.init<A>(_:)();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(void *)(a1 + 24) = result;
  *(void *)(a1 + 32) = v6;
  *(unsigned char *)(a1 + 40) = v7 & 1;
  *(void *)(a1 + 48) = v8;
  return result;
}

uint64_t sub_1000150A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v18 = a2;
  uint64_t v3 = sub_100009288(&qword_10002EDB0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v19 = *(_OWORD *)(a1 + 80);
  sub_100009288(&qword_10002EB70);
  State.wrappedValue.getter();
  uint64_t v7 = v21;
  uint64_t v8 = swift_allocObject();
  long long v9 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v8 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v8 + 96) = v9;
  *(_OWORD *)(v8 + 112) = *(_OWORD *)(a1 + 96);
  *(unsigned char *)(v8 + 128) = *(unsigned char *)(a1 + 112);
  long long v10 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v8 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v8 + 32) = v10;
  long long v11 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v8 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v8 + 64) = v11;
  *(void *)&long long v19 = v7;
  *((void *)&v19 + 1) = sub_100018730;
  uint64_t v20 = v8;
  sub_100009288(&qword_10002EB78);
  type metadata accessor for PresentationDetent();
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_10001F370;
  sub_1000178B4(a1);
  static PresentationDetent.large.getter();
  static PresentationDetent.large.getter();
  sub_100016BAC(v12);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_1000185A8();
  View.presentationDetents(_:)();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v12) = static Edge.Set.bottom.getter();
  uint64_t v13 = static SafeAreaRegions.all.getter();
  uint64_t v14 = v18;
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 16))(v18, v6, v3);
  uint64_t v15 = v14 + *(int *)(sub_100009288(&qword_10002ED68) + 36);
  *(void *)uint64_t v15 = v13;
  *(unsigned char *)(v15 + 8) = v12;
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_100015364(unint64_t a1)
{
  if (qword_10002E370 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100009338(v2, (uint64_t)qword_10002FD80);
  swift_bridgeObjectRetain_n();
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 134217984;
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "LimitedAccess show selected view chose: %ld contacts", v5, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain();
  sub_100009288(&qword_10002EB70);
  return State.wrappedValue.setter();
}

uint64_t sub_100015514@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v29 = a2;
  uint64_t v28 = sub_100009288(&qword_10002EB68);
  uint64_t v3 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v5 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void **)(a1 + 8);
  uint64_t v8 = v6[2];
  uint64_t v7 = v6[3];
  uint64_t v9 = v6[4];
  uint64_t v10 = v6[5];
  long long v30 = *(_OWORD *)(a1 + 80);
  uint64_t v11 = v7;
  v27[1] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_100009288(&qword_10002EB70);
  State.wrappedValue.getter();
  uint64_t v12 = v38;
  v27[0] = v38;
  uint64_t v13 = swift_allocObject();
  long long v14 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v13 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v13 + 96) = v14;
  *(_OWORD *)(v13 + 112) = *(_OWORD *)(a1 + 96);
  *(unsigned char *)(v13 + 128) = *(unsigned char *)(a1 + 112);
  long long v15 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v13 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v13 + 32) = v15;
  long long v16 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v13 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v13 + 64) = v16;
  uint64_t v17 = swift_allocObject();
  long long v18 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v17 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v17 + 96) = v18;
  *(_OWORD *)(v17 + 112) = *(_OWORD *)(a1 + 96);
  *(unsigned char *)(v17 + 128) = *(unsigned char *)(a1 + 112);
  long long v19 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v17 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v17 + 32) = v19;
  long long v20 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v17 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v17 + 64) = v20;
  *(void *)&long long v30 = v8;
  *((void *)&v30 + 1) = v11;
  uint64_t v31 = v9;
  uint64_t v32 = v10;
  uint64_t v33 = v12;
  uint64_t v34 = sub_1000179A8;
  uint64_t v35 = v13;
  CGFloat v36 = sub_1000179B4;
  uint64_t v37 = v17;
  sub_100009288(&qword_10002EB78);
  type metadata accessor for PresentationDetent();
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_10001F370;
  sub_1000178B4(a1);
  sub_1000178B4(a1);
  static PresentationDetent.large.getter();
  static PresentationDetent.large.getter();
  sub_100016BAC(v21);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_100017944();
  View.presentationDetents(_:)();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v8) = static Edge.Set.bottom.getter();
  uint64_t v22 = static SafeAreaRegions.all.getter();
  uint64_t v24 = v28;
  uint64_t v23 = v29;
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(v29, v5, v28);
  uint64_t v25 = v23 + *(int *)(sub_100009288(&qword_10002EB40) + 36);
  *(void *)uint64_t v25 = v22;
  *(unsigned char *)(v25 + 8) = v8;
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v24);
}

uint64_t sub_100015874(unint64_t a1, uint64_t a2)
{
  if (qword_10002E370 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100009338(v4, (uint64_t)qword_10002FD80);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  unint64_t v7 = a1 >> 62;
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 134217984;
    if (v7)
    {
      swift_bridgeObjectRetain();
      _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "LimitedAccess picker chose: %ld contacts", v8, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain();
  sub_100009288(&qword_10002EB70);
  uint64_t result = State.wrappedValue.setter();
  if (v7)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    if (v10 >= 1) {
      goto LABEL_10;
    }
  }
  else if (*(uint64_t *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 1)
  {
LABEL_10:
    sub_100009288(&qword_10002EB98);
    return State.wrappedValue.setter();
  }
  uint64_t v11 = *(void (**)(void *))(*(void *)(a2 + 8) + 48);
  if (v11)
  {
    swift_retain();
    v11(&_swiftEmptyArrayStorage);
    return sub_10000C6B0((uint64_t)v11);
  }
  return result;
}

uint64_t sub_100015AD0()
{
  if (qword_10002E370 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100009338(v0, (uint64_t)qword_10002FD80);
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "LimitedAccess picker chose to go back to start", v3, 2u);
    swift_slowDealloc();
  }

  swift_bridgeObjectRetain();
  sub_100009288(&qword_10002EB70);
  State.wrappedValue.setter();
  sub_100009288(&qword_10002EB98);
  return State.wrappedValue.setter();
}

uint64_t sub_100015C18(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    uint64_t v1 = *(void *)(a1 + 8);
    uint64_t v2 = *(void *)(v1 + 32);
    unint64_t v3 = *(void *)(v1 + 40);
    swift_retain();
    swift_bridgeObjectRetain();
    sub_10000B3B4(v2, v3);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  else
  {
    type metadata accessor for ContactStoreVisualizer();
    sub_1000188A8(&qword_10002F0C0, 255, (void (*)(uint64_t))type metadata accessor for ContactStoreVisualizer);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_100015CE4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C6D8(a1);
}

__n128 sub_100015D38@<Q0>(uint64_t a1@<X8>)
{
  type metadata accessor for ContactStoreVisualizer();
  sub_1000188A8(&qword_10002F0C0, 255, (void (*)(uint64_t))type metadata accessor for ContactStoreVisualizer);
  swift_retain();
  uint64_t v2 = EnvironmentObject.init()();
  sub_100016ECC(v2, v3, (uint64_t)&v21);
  long long v12 = v21;
  uint64_t v5 = v22;
  uint64_t v4 = v23;
  char v6 = v24;
  uint64_t v7 = v25;
  uint64_t v15 = v27;
  char v13 = v26;
  char v14 = v28;
  __n128 v18 = v29;
  uint64_t v17 = v30;
  char v16 = v31;
  uint64_t v20 = v32;
  char v19 = v33;
  uint64_t v8 = swift_allocObject();
  sub_100009288(&qword_10002E4F8);
  Published.init(initialValue:)();
  Published.init(initialValue:)();
  uint64_t v9 = static ObservableObject.environmentStore.getter();
  *(_OWORD *)a1 = v12;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = v6;
  *(_DWORD *)(a1 + 33) = 0;
  *(_DWORD *)(a1 + 36) = 0;
  *(void *)(a1 + 40) = v7;
  *(unsigned char *)(a1 + 48) = v13;
  *(_DWORD *)(a1 + 49) = v37[0];
  *(_DWORD *)(a1 + 52) = *(_DWORD *)((char *)v37 + 3);
  *(void *)(a1 + 56) = v15;
  *(unsigned char *)(a1 + 64) = v14;
  int v10 = *(_DWORD *)v36;
  *(_DWORD *)(a1 + 68) = *(_DWORD *)&v36[3];
  *(_DWORD *)(a1 + 65) = v10;
  __n128 result = v18;
  *(__n128 *)(a1 + 72) = v18;
  *(void *)(a1 + 88) = v17;
  *(unsigned char *)(a1 + 96) = v16;
  *(_DWORD *)(a1 + 100) = *(_DWORD *)&v35[3];
  *(_DWORD *)(a1 + 97) = *(_DWORD *)v35;
  *(void *)(a1 + 104) = v20;
  *(unsigned char *)(a1 + 112) = v19;
  *(_DWORD *)(a1 + 113) = *(_DWORD *)v34;
  *(_DWORD *)(a1 + 116) = *(_DWORD *)&v34[3];
  *(void *)(a1 + 120) = v9;
  *(void *)(a1 + 128) = v8;
  return result;
}

double sub_100015F84@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_100015D38(a1).n128_u64[0];
  return result;
}

uint64_t sub_100015F8C@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_10001600C()
{
  return static Published.subscript.setter();
}

uint64_t sub_100016088@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_10001610C()
{
  return static Published.subscript.setter();
}

uint64_t sub_100016184()
{
  swift_unknownObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000161CC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_10001628C;
  return sub_10000B798(a1, v4, v5, v7, v6);
}

uint64_t sub_10001628C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100016380(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_10001645C;
  return v6(a1);
}

uint64_t sub_10001645C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100016554()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001658C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10001628C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10002EAA0 + dword_10002EAA0);
  return v6(a1, v4);
}

unint64_t sub_100016644()
{
  unint64_t result = qword_10002EAB0;
  if (!qword_10002EAB0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10002EAB0);
  }
  return result;
}

uint64_t sub_100016684()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000166BC()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_1000166FC()
{
}

uint64_t sub_100016704(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100016714()
{
  return swift_release();
}

void *initializeBufferWithCopyOfBuffer for LimitedAccessPromptViewPerPlatform(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for LimitedAccessPromptViewPerPlatform()
{
  return swift_release();
}

void *assignWithCopy for LimitedAccessPromptViewPerPlatform(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for LimitedAccessPromptViewPerPlatform(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for LimitedAccessPromptViewPerPlatform(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for LimitedAccessPromptViewPerPlatform(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LimitedAccessPromptViewPerPlatform(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LimitedAccessPromptViewPerPlatform()
{
  return &type metadata for LimitedAccessPromptViewPerPlatform;
}

uint64_t sub_100016874()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100016890@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = EnvironmentValues.lineLimit.getter();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_1000168C4()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_1000168F4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100016920()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_100016948@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.allowsTightening.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_100016978()
{
  return EnvironmentValues.allowsTightening.setter();
}

uint64_t sub_1000169A0@<X0>(void *a1@<X8>)
{
  uint64_t result = EnvironmentValues.minimumScaleFactor.getter();
  *a1 = v3;
  return result;
}

uint64_t sub_1000169CC()
{
  return EnvironmentValues.minimumScaleFactor.setter();
}

void sub_1000169F4()
{
  unint64_t v1 = *(void *)(*v0 + 16);
  unint64_t v2 = v1 - 2;
  if (v1 >= 2)
  {
    unint64_t v3 = 0;
    while (1)
    {
      swift_stdlib_random();
      uint64_t v5 = (0 * (unsigned __int128)v1) >> 64;
      if (v1)
      {
        if (-(uint64_t)v1 % v1)
        {
          while (1)
            swift_stdlib_random();
        }
      }
      unint64_t v7 = v3 + v5;
      if (__OFADD__(v3, v5)) {
        break;
      }
      if (v3 != v7)
      {
        uint64_t v8 = *v0;
        unint64_t v9 = *(void *)(*v0 + 16);
        if (v3 >= v9) {
          goto LABEL_20;
        }
        if (v7 >= v9) {
          goto LABEL_21;
        }
        uint64_t v10 = *(void **)(v8 + 32 + 8 * v7);
        id v11 = *(id *)(v8 + 32 + 8 * v3);
        id v12 = v10;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t *v0 = v8;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          uint64_t v8 = sub_100016B98(v8);
          uint64_t *v0 = v8;
        }
        if (v3 >= *(void *)(v8 + 16)) {
          goto LABEL_22;
        }
        uint64_t v14 = v8 + 8 * v3;
        uint64_t v15 = *(void **)(v14 + 32);
        *(void *)(v14 + 32) = v12;

        specialized ContiguousArray._endMutation()();
        uint64_t v16 = *v0;
        char v17 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t *v0 = v16;
        if ((v17 & 1) == 0)
        {
          uint64_t v16 = sub_100016B98(v16);
          uint64_t *v0 = v16;
        }
        if (v7 >= *(void *)(v16 + 16)) {
          goto LABEL_23;
        }
        uint64_t v18 = v16 + 8 * v7;
        char v19 = *(void **)(v18 + 32);
        *(void *)(v18 + 32) = v11;

        specialized ContiguousArray._endMutation()();
      }
      --v1;
      if (v3++ == v2) {
        return;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
  }
}

uint64_t sub_100016B98(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

void *sub_100016BAC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PresentationDetent();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    sub_100009288(&qword_10002EB80);
    uint64_t v9 = static _SetStorage.allocate(capacity:)();
    uint64_t v10 = 0;
    id v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    char v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_1000188A8(&qword_10002EB88, 255, (void (*)(uint64_t))&type metadata accessor for PresentationDetent);
      uint64_t v16 = dispatch thunk of Hashable._rawHashValue(seed:)();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          sub_1000188A8(&qword_10002EB90, 255, (void (*)(uint64_t))&type metadata accessor for PresentationDetent);
          char v23 = dispatch thunk of static Equatable.== infix(_:_:)();
          char v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        uint64_t v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        uint64_t result = (void *)(*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return (void *)v9;
      }
    }
  }
  return &_swiftEmptySetSingleton;
}

void sub_100016ECC(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  type metadata accessor for ContactsLimitedAccessPromptViewObservable();
  sub_1000188A8((unint64_t *)&unk_10002F0B0, v4, (void (*)(uint64_t))type metadata accessor for ContactsLimitedAccessPromptViewObservable);
  uint64_t v5 = ObservedObject.init(wrappedValue:)();
  uint64_t v9 = v6;
  uint64_t v10 = v5;
  State.init(wrappedValue:)();
  State.init(wrappedValue:)();
  State.init(wrappedValue:)();
  sub_100009288(&qword_10002E4F8);
  State.init(wrappedValue:)();
  State.init(wrappedValue:)();
  id v7 = [self currentDevice];
  id v8 = [v7 userInterfaceIdiom];

  *(void *)a3 = v10;
  *(void *)(a3 + 8) = v9;
  *(void *)(a3 + 16) = a1;
  *(void *)(a3 + 24) = a2;
  *(unsigned char *)(a3 + 32) = v13;
  *(void *)(a3 + 40) = v14;
  *(unsigned char *)(a3 + 48) = v13;
  *(void *)(a3 + 56) = v14;
  *(unsigned char *)(a3 + 64) = v13;
  *(void *)(a3 + 72) = v14;
  *(void *)(a3 + 80) = v13;
  *(void *)(a3 + 88) = v14;
  *(unsigned char *)(a3 + 96) = v13;
  *(void *)(a3 + 104) = v14;
  *(unsigned char *)(a3 + 112) = v8 == (id)1;
}

uint64_t getEnumTagSinglePayload for OnboardingState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for OnboardingState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x100017214);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_10001723C(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for OnboardingState()
{
  return &type metadata for OnboardingState;
}

uint64_t destroy for PromptContentView()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for PromptContentView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v5 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v5;
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for PromptContentView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  return a1;
}

__n128 initializeWithTake for PromptContentView(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[6];
  *(unsigned char *)(a1 + 112) = *((unsigned char *)a2 + 112);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for PromptContentView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  swift_release();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_release();
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_release();
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  return a1;
}

uint64_t getEnumTagSinglePayload for PromptContentView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 113)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PromptContentView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 112) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 113) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 113) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PromptContentView()
{
  return &type metadata for PromptContentView;
}

unint64_t sub_10001767C()
{
  unint64_t result = qword_10002EAE0;
  if (!qword_10002EAE0)
  {
    sub_1000098A8(&qword_10002EAE8);
    sub_1000176F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002EAE0);
  }
  return result;
}

unint64_t sub_1000176F0()
{
  unint64_t result = qword_10002EAF0;
  if (!qword_10002EAF0)
  {
    sub_1000098A8(&qword_10002EAF8);
    sub_100017790();
    sub_10000B1C0(&qword_10002EB08, &qword_10002EB10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002EAF0);
  }
  return result;
}

unint64_t sub_100017790()
{
  unint64_t result = qword_10002EB00;
  if (!qword_10002EB00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002EB00);
  }
  return result;
}

uint64_t sub_1000177E4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100017804()
{
  unint64_t result = qword_10002EB18;
  if (!qword_10002EB18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002EB18);
  }
  return result;
}

uint64_t sub_10001785C()
{
  return State.wrappedValue.setter();
}

uint64_t sub_1000178AC@<X0>(uint64_t a1@<X8>)
{
  return sub_100015514(v1 + 16, a1);
}

uint64_t sub_1000178B4(uint64_t a1)
{
  return a1;
}

unint64_t sub_100017944()
{
  unint64_t result = qword_10002EB58;
  if (!qword_10002EB58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002EB58);
  }
  return result;
}

uint64_t sub_10001799C()
{
  return sub_100015C18(v0 + 16);
}

uint64_t sub_1000179A8(unint64_t a1)
{
  return sub_100015874(a1, v1 + 16);
}

uint64_t sub_1000179B4()
{
  return sub_100015AD0();
}

uint64_t sub_1000179BC()
{
  return sub_100010C64(*(void *)(v0 + 16));
}

unint64_t sub_1000179C4()
{
  unint64_t result = qword_10002EBF0;
  if (!qword_10002EBF0)
  {
    sub_1000098A8(&qword_10002EBC0);
    sub_10000B1C0(&qword_10002EBF8, &qword_10002EC00);
    sub_10000B1C0(&qword_10002EC08, &qword_10002EC10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002EBF0);
  }
  return result;
}

uint64_t sub_100017A88@<X0>(uint64_t a1@<X8>)
{
  return sub_10000D574(*(void *)(v1 + 16), a1);
}

unint64_t sub_100017A98()
{
  unint64_t result = qword_10002ECA0;
  if (!qword_10002ECA0)
  {
    sub_1000098A8(&qword_10002EC98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002ECA0);
  }
  return result;
}

unint64_t sub_100017B0C()
{
  unint64_t result = qword_10002ECA8;
  if (!qword_10002ECA8)
  {
    sub_1000098A8(&qword_10002EC70);
    sub_10000B1C0(&qword_10002ECB0, &qword_10002EC68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002ECA8);
  }
  return result;
}

uint64_t sub_100017BAC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.tint.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100017BD8()
{
  return EnvironmentValues.tint.setter();
}

uint64_t sub_100017C04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RoundedRectangle();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100017C68(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RoundedRectangle();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100017CC8()
{
  return sub_10001074C(v0 + 16);
}

uint64_t sub_100017CD0@<X0>(_OWORD *a1@<X8>)
{
  return sub_1000107AC(*(void *)(v1 + 16), a1);
}

uint64_t sub_100017CD8(uint64_t a1)
{
  return a1;
}

unint64_t sub_100017D04()
{
  unint64_t result = qword_10002ECE8;
  if (!qword_10002ECE8)
  {
    sub_1000098A8(&qword_10002ECD8);
    sub_100017DD0(&qword_10002ECF0, &qword_10002ECF8, (void (*)(void))sub_100017E4C);
    sub_10000B1C0(&qword_10002ED18, &qword_10002EBB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002ECE8);
  }
  return result;
}

uint64_t sub_100017DD0(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000098A8(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100017E4C()
{
  return sub_100017DD0(&qword_10002ED00, &qword_10002ED08, (void (*)(void))sub_100017E7C);
}

unint64_t sub_100017E7C()
{
  unint64_t result = qword_10002ED10;
  if (!qword_10002ED10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002ED10);
  }
  return result;
}

uint64_t sub_100017ED0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 224);
  uint64_t v3 = *(void *)(a1 + 232);
  char v4 = *(unsigned char *)(a1 + 240);
  uint64_t v7 = *(void *)(a1 + 432);
  uint64_t v8 = *(void *)(a1 + 424);
  char v6 = *(unsigned char *)(a1 + 440);
  sub_10000AA7C(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_10000AA7C(v2, v3, v4);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_10000AA7C(v8, v7, v6);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_100018030(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 224);
  uint64_t v3 = *(void *)(a1 + 232);
  char v4 = *(unsigned char *)(a1 + 240);
  uint64_t v8 = *(void *)(a1 + 424);
  uint64_t v7 = *(void *)(a1 + 432);
  char v6 = *(unsigned char *)(a1 + 440);
  sub_10000A028(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_10000A028(v2, v3, v4);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_10000A028(v8, v7, v6);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100018194@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000181C0()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_1000181E8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.allowsTightening.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_100018218()
{
  return EnvironmentValues.allowsTightening.setter();
}

uint64_t sub_100018240@<X0>(void *a1@<X8>)
{
  uint64_t result = EnvironmentValues.minimumScaleFactor.getter();
  *a1 = v3;
  return result;
}

uint64_t sub_10001826C()
{
  return EnvironmentValues.minimumScaleFactor.setter();
}

uint64_t sub_100018294@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = EnvironmentValues.lineLimit.getter();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_1000182C8()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_1000182F8(uint64_t a1)
{
  return a1;
}

uint64_t sub_100018378(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000183F8(uint64_t a1)
{
  return a1;
}

uint64_t sub_100018424@<X0>(uint64_t a1@<X8>)
{
  return sub_10001433C(*(void *)(v1 + 16), a1);
}

uint64_t sub_10001842C()
{
  return sub_1000146E4(*(void *)(v0 + 16));
}

uint64_t sub_100018434@<X0>(uint64_t a1@<X8>)
{
  return sub_100014B08(*(void *)(v1 + 16), a1);
}

unint64_t sub_10001843C()
{
  unint64_t result = qword_10002ED70;
  if (!qword_10002ED70)
  {
    sub_1000098A8(&qword_10002ED60);
    sub_10000B1C0(&qword_10002ED78, &qword_10002ED80);
    sub_10000B1C0(&qword_10002ED88, &qword_10002ED90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002ED70);
  }
  return result;
}

uint64_t sub_100018500(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000098A8(a2);
    a3();
    swift_getOpaqueTypeConformance2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000185A8()
{
  unint64_t result = qword_10002F260;
  if (!qword_10002F260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002F260);
  }
  return result;
}

uint64_t sub_100018600()
{
  return State.wrappedValue.setter();
}

uint64_t sub_100018650@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.isEnabled.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_100018680()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t sub_1000186A8()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_1000186B8(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_1000186D4()
{
  return State.wrappedValue.setter();
}

uint64_t sub_100018724@<X0>(uint64_t a1@<X8>)
{
  return sub_1000150A4(v1 + 16, a1);
}

uint64_t sub_100018730(unint64_t a1)
{
  return sub_100015364(a1);
}

uint64_t sub_10001873C()
{
  return State.wrappedValue.setter();
}

uint64_t sub_10001878C@<X0>(uint64_t a1@<X8>)
{
  return sub_100011910(*(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(unsigned __int8 *)(v1 + 40), a1);
}

uint64_t sub_1000187A0()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 129, 7);
}

uint64_t sub_100018810()
{
  return sub_100013B24(v0 + 16);
}

double sub_100018818@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_100013BB0(*(unsigned char *)(v1 + 16), *(void *)(v1 + 24), a1).n128_u64[0];
  return result;
}

uint64_t sub_100018824()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 137, 7);
}

uint64_t sub_100018894()
{
  return sub_100013F78(*(unsigned __int8 *)(v0 + 16), v0 + 24);
}

double sub_1000188A0@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_10001401C(a1).n128_u64[0];
  return result;
}

uint64_t sub_1000188A8(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000188F0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 224);
  uint64_t v3 = *(void *)(a1 + 232);
  char v4 = *(unsigned char *)(a1 + 240);
  sub_10000AA7C(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_10000AA7C(v2, v3, v4);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_1000189E4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 224);
  uint64_t v3 = *(void *)(a1 + 232);
  char v4 = *(unsigned char *)(a1 + 240);
  sub_10000A028(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_10000A028(v2, v3, v4);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_100018ADC()
{
  unint64_t result = qword_10002EE50;
  if (!qword_10002EE50)
  {
    sub_1000098A8(&qword_10002EB60);
    sub_1000098A8(&qword_10002EB20);
    sub_1000098A8(&qword_10002EB40);
    sub_10000B1C0(&qword_10002EB48, &qword_10002EB20);
    sub_100018500(&qword_10002EB50, &qword_10002EB40, (void (*)(void))sub_100017944);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002EE50);
  }
  return result;
}

uint64_t sub_100018C0C(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)LSApplicationRecord);
  swift_bridgeObjectRetain();
  id v5 = sub_10001A570(a1, a2, 0);
  id v6 = [v5 localizedName];
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v7;
}

void sub_100018F70()
{
  uint64_t v1 = v0;
  type metadata accessor for ContactsLimitedAccessPromptViewObservable();
  sub_10001BB5C((unint64_t *)&unk_10002F0B0, (void (*)(uint64_t))type metadata accessor for ContactsLimitedAccessPromptViewObservable);
  swift_retain();
  uint64_t v2 = ObservedObject.init(wrappedValue:)();
  uint64_t v4 = v3;
  type metadata accessor for ContactStoreVisualizer();
  uint64_t v5 = swift_allocObject();
  sub_100009288(&qword_10002E4F8);
  Published.init(initialValue:)();
  Published.init(initialValue:)();
  sub_10001BB5C(&qword_10002F0C0, (void (*)(uint64_t))type metadata accessor for ContactStoreVisualizer);
  uint64_t v55 = v2;
  uint64_t v56 = static ObservableObject.environmentStore.getter();
  id v6 = objc_allocWithZone((Class)sub_100009288(&qword_10002F0C8));
  uint64_t v7 = UIHostingController.init(rootView:)();
  uint64_t v8 = OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_contentView;
  uint64_t v9 = *(void **)&v0[OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_contentView];
  *(void *)&v0[OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_contentView] = v7;

  uint64_t v10 = *(void **)&v0[v8];
  if (v10)
  {
    uint64_t v11 = self;
    id v12 = v10;
    id v13 = [v11 currentDevice:v55, v4, v56, v5];
    id v14 = [v13 userInterfaceIdiom];

    if (v14)
    {
LABEL_15:

      goto LABEL_16;
    }
    [v1 addChildViewController:v12];
    id v15 = [v1 view];
    if (v15)
    {
      uint64_t v16 = v15;
      id v17 = [v12 view];
      if (v17)
      {
        unint64_t v18 = v17;
        [v16 addSubview:v17];

        id v19 = [v12 view];
        if (v19)
        {
          uint64_t v20 = v19;
          [v19 setTranslatesAutoresizingMaskIntoConstraints:0];

          id v21 = [v12 view];
          if (v21)
          {
            uint64_t v22 = v21;
            id v23 = [v21 topAnchor];

            id v24 = [v1 view];
            if (v24)
            {
              uint64_t v25 = v24;
              id v26 = [v24 topAnchor];

              id v27 = [v23 constraintEqualToAnchor:v26];
              [v27 setActive:1];

              id v28 = [v12 view];
              if (v28)
              {
                uint64_t v29 = v28;
                id v30 = [v28 bottomAnchor];

                id v31 = [v1 view];
                if (v31)
                {
                  uint64_t v32 = v31;
                  id v33 = [v31 bottomAnchor];

                  id v34 = [v30 constraintEqualToAnchor:v33];
                  [v34 setActive:1];

                  id v35 = [v12 view];
                  if (v35)
                  {
                    uint64_t v36 = v35;
                    id v37 = [v35 rightAnchor];

                    id v38 = [v1 view];
                    if (v38)
                    {
                      double v39 = v38;
                      id v40 = [v38 rightAnchor];

                      id v41 = [v37 constraintEqualToAnchor:v40];
                      [v41 setActive:1];

                      id v42 = [v12 view];
                      if (v42)
                      {
                        uint64_t v43 = v42;
                        id v44 = [v42 leftAnchor];

                        id v45 = [v1 view];
                        if (v45)
                        {
                          uint64_t v46 = v45;
                          id v47 = [v45 leftAnchor];

                          id v48 = [v44 constraintEqualToAnchor:v47];
                          [v48 setActive:1];

                          id v12 = v48;
                          goto LABEL_15;
                        }
LABEL_34:
                        __break(1u);
                        return;
                      }
LABEL_33:
                      __break(1u);
                      goto LABEL_34;
                    }
LABEL_32:
                    __break(1u);
                    goto LABEL_33;
                  }
LABEL_31:
                  __break(1u);
                  goto LABEL_32;
                }
LABEL_30:
                __break(1u);
                goto LABEL_31;
              }
LABEL_29:
              __break(1u);
              goto LABEL_30;
            }
LABEL_28:
            __break(1u);
            goto LABEL_29;
          }
LABEL_27:
          __break(1u);
          goto LABEL_28;
        }
LABEL_26:
        __break(1u);
        goto LABEL_27;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_26;
  }
LABEL_16:
  id v49 = [self currentDevice];
  id v50 = [v49 userInterfaceIdiom];

  uint64_t v51 = *(void **)&v1[v8];
  if (v50 == (id)1)
  {
    if (v51)
    {
      [v51 setModalInPresentation:1];
      Swift::String v52 = *(void **)&v1[v8];
      if (v52)
      {
        id v53 = [v52 sheetPresentationController];
        if (v53)
        {
          uint64_t v54 = v53;
          [v53 setPrefersEdgeAttachedInCompactHeight:1];
          [v54 setWidthFollowsPreferredContentSizeWhenEdgeAttached:1];
        }
      }
    }
  }
  else if (v51)
  {
    [v51 didMoveToParentViewController:v1];
  }
}

uint64_t sub_1000195D8()
{
  if ([v0 _remoteViewControllerProxy])
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  sub_10001B8A8((uint64_t)v3, (uint64_t)v4);
  if (v5)
  {
    sub_100009288(&qword_10002F0A8);
    if (swift_dynamicCast()) {
      return v2;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_10001B910((uint64_t)v4);
    return 0;
  }
}

id sub_1000198B4(uint64_t a1, uint64_t a2, void *a3)
{
  type metadata accessor for ContactsLimitedAccessPromptViewObservable();
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_observer;
  *(void *)(v6 + 16) = 7368769;
  *(void *)(v6 + 24) = 0xE300000000000000;
  *(void *)(v6 + 32) = 0;
  *(void *)(v6 + 40) = 0xE000000000000000;
  *(_OWORD *)(v6 + 48) = 0u;
  *(_OWORD *)(v6 + 64) = 0u;
  *(_OWORD *)(v6 + 80) = 0u;
  *(void *)&v3[v7] = v6;
  uint64_t v8 = &v3[OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_requestorBundleID];
  *(void *)uint64_t v8 = 0;
  *((void *)v8 + 1) = 0;
  *(void *)&v3[OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_contentView] = 0;
  if (a2)
  {
    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v9 = 0;
  }
  v12.receiver = v3;
  v12.super_class = (Class)type metadata accessor for ContactsLimitedAccessPromptViewController();
  id v10 = [super initWithNibName:v9 bundle:a3];

  return v10;
}

id sub_100019A00(void *a1)
{
  type metadata accessor for ContactsLimitedAccessPromptViewObservable();
  uint64_t v3 = swift_allocObject();
  uint64_t v4 = OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_observer;
  *(void *)(v3 + 16) = 7368769;
  *(void *)(v3 + 24) = 0xE300000000000000;
  *(void *)(v3 + 32) = 0;
  *(void *)(v3 + 40) = 0xE000000000000000;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_OWORD *)(v3 + 64) = 0u;
  *(_OWORD *)(v3 + 80) = 0u;
  *(void *)&v1[v4] = v3;
  uint64_t v5 = &v1[OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_requestorBundleID];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  *(void *)&v1[OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_contentView] = 0;
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for ContactsLimitedAccessPromptViewController();
  [super initWithCoder:a1];

  return v6;
}

id sub_100019AD8()
{
  return sub_10001A090(type metadata accessor for ContactsLimitedAccessPromptViewController);
}

uint64_t type metadata accessor for ContactsLimitedAccessPromptViewController()
{
  return self;
}

id sub_100019BCC(unint64_t a1, uint64_t a2, void *a3)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  id v6 = (void *)Strong;
  if (Strong)
  {
    uint64_t v7 = *(void **)(Strong + OBJC_IVAR____TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate_rootVc);
    objc_super v8 = v7;

    if (v7)
    {
      uint64_t v7 = *(void **)&v8[OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_requestorBundleID];
      id v6 = *(void **)&v8[OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_requestorBundleID
                       + 8];
      swift_bridgeObjectRetain();
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  sub_10001B694(3, (uint64_t)v7, (uint64_t)v6);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v9 = swift_unknownObjectWeakLoadStrong();
  if (!v9) {
    return [a3 deactivate];
  }
  id v10 = (void *)v9;
  uint64_t v11 = *(void **)(v9 + OBJC_IVAR____TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate_rootVc);
  objc_super v12 = v11;

  if (!v11) {
    return [a3 deactivate];
  }
  uint64_t v14 = *(void *)&v12[OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_requestorBundleID];
  uint64_t v13 = *(void *)&v12[OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_requestorBundleID
                      + 8];
  swift_bridgeObjectRetain();

  if (!v13) {
    return [a3 deactivate];
  }
  type metadata accessor for ContactsAccessUpdater();
  inited = (void *)swift_initStackObject();
  inited[3] = v14;
  inited[4] = v13;
  uint64_t v16 = self;
  swift_bridgeObjectRetain();
  id v17 = [v16 sharedConnection];
  id v18 = objc_allocWithZone((Class)CNManagedConfiguration);
  swift_bridgeObjectRetain();
  NSString v19 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v20 = [v18 initWithBundleIdentifier:v19 managedProfileConnection:v17];

  id v21 = [objc_allocWithZone((Class)CNContactStoreConfiguration) init];
  id result = [self currentEnvironment];
  if (result)
  {
    id v23 = result;
    [v21 setEnvironment:result];

    [v21 setManagedConfiguration:v20];
    id v24 = [objc_allocWithZone((Class)CNContactStore) initWithConfiguration:v21];
    swift_bridgeObjectRelease();

    inited[2] = v24;
    NSString v25 = String._bridgeToObjectiveC()();
    [v24 purgeLimitedAccessRecordsForBundle:v25];

    sub_10001A16C(a1);
    swift_bridgeObjectRelease();

    return [a3 deactivate];
  }
  __break(1u);
  return result;
}

id sub_100019E88(uint64_t a1, void *a2, uint64_t a3)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  id v6 = (void *)Strong;
  if (Strong)
  {
    uint64_t v7 = *(void **)(Strong + OBJC_IVAR____TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate_rootVc);
    objc_super v8 = v7;

    if (v7)
    {
      uint64_t v7 = *(void **)&v8[OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_requestorBundleID];
      id v6 = *(void **)&v8[OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_requestorBundleID
                       + 8];
      swift_bridgeObjectRetain();
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  sub_10001B694(a3, (uint64_t)v7, (uint64_t)v6);
  swift_bridgeObjectRelease();
  return [a2 deactivate];
}

id sub_10001A078()
{
  return sub_10001A090(type metadata accessor for ContactsLimitedAccessPromptSceneDelegate);
}

id sub_10001A090(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t type metadata accessor for ContactsLimitedAccessPromptSceneDelegate()
{
  return self;
}

uint64_t sub_10001A138()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TCCAccessUpdater()
{
  return self;
}

void sub_10001A16C(unint64_t a1)
{
  uint64_t v2 = v1;
  if (qword_10002E370 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100009338(v4, (uint64_t)qword_10002FD80);
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  uint64_t v5 = Logger.logObject.getter();
  LOBYTE(v6) = static os_log_type_t.default.getter();
  unint64_t v7 = a1 >> 62;
  if (!os_log_type_enabled(v5, (os_log_type_t)v6))
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
    goto LABEL_7;
  }
  uint64_t v8 = swift_slowAlloc();
  NSString v25 = (unint64_t *)swift_slowAlloc();
  *(_DWORD *)uint64_t v8 = 134218242;
  unint64_t v24 = a1 >> 62;
  if (v7) {
    goto LABEL_22;
  }
  while (1)
  {
    swift_bridgeObjectRelease();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2080;
    uint64_t v9 = v2[3];
    unint64_t v10 = v2[4];
    swift_bridgeObjectRetain();
    sub_10001D0C4(v9, v10, (uint64_t *)&v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, (os_log_type_t)v6, "Adding %ld contacts to limited access for %s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    unint64_t v7 = v24;
LABEL_7:
    uint64_t v8 = v2[2];
    uint64_t v2 = String._bridgeToObjectiveC()();
    if (v7)
    {
      swift_bridgeObjectRetain();
      uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    if (!v6) {
      break;
    }
    NSString v25 = (unint64_t *)&_swiftEmptyArrayStorage;
    uint64_t v5 = &v25;
    sub_10001A758(0, v6 & ~(v6 >> 63), 0);
    if ((v6 & 0x8000000000000000) == 0)
    {
      id v23 = v2;
      uint64_t v11 = 0;
      objc_super v12 = v25;
      do
      {
        if ((a1 & 0xC000000000000001) != 0) {
          id v13 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          id v13 = *(id *)(a1 + 8 * v11 + 32);
        }
        uint64_t v14 = v13;
        id v15 = [v13 identifier:v23];
        uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v18 = v17;

        NSString v25 = v12;
        unint64_t v20 = v12[2];
        unint64_t v19 = v12[3];
        if (v20 >= v19 >> 1)
        {
          sub_10001A758(v19 > 1, v20 + 1, 1);
          objc_super v12 = v25;
        }
        ++v11;
        v12[2] = v20 + 1;
        id v21 = &v12[2 * v20];
        v21[4] = v16;
        v21[5] = v18;
      }
      while (v6 != v11);
      uint64_t v2 = v23;
      break;
    }
    __break(1u);
LABEL_22:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [(id)v8 addLimitedAccessForBundle:v2 contactIdentifiers:isa];
}

uint64_t sub_10001A50C()
{
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ContactsAccessUpdater()
{
  return self;
}

id sub_10001A570(uint64_t a1, uint64_t a2, char a3)
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

unint64_t sub_10001A64C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_10001A690(a1, v4);
}

unint64_t sub_10001A690(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10001BB00(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_10001BA50((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_10001A758(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10001A778(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10001A778(char a1, int64_t a2, char a3, char *a4)
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
    sub_100009288(&qword_10002F090);
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
  id v13 = v10 + 32;
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void (*sub_10001A8E4(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_10001A994(v6, a2, a3);
  return sub_10001A94C;
}

void sub_10001A94C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_10001A994(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return destroy for ContactAvatarView;
  }
  __break(1u);
  return result;
}

void *sub_10001AA14(void *result)
{
  if (result)
  {
    uint64_t v2 = v1;
    id v3 = [result userInfo];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

      if (qword_10002E370 != -1) {
        swift_once();
      }
      uint64_t v6 = type metadata accessor for Logger();
      sub_100009338(v6, (uint64_t)qword_10002FD80);
      swift_bridgeObjectRetain();
      int64_t v7 = Logger.logObject.getter();
      os_log_type_t v8 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v7, v8))
      {
        uint64_t v9 = (uint8_t *)swift_slowAlloc();
        id v10 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v9 = 138412290;
        v23[0] = Dictionary._bridgeToObjectiveC()().super.isa;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *id v10 = v23[0];
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "ContactsLimitedAccessPromptViewController activated with userInfo: %@", v9, 0xCu);
        sub_100009288(&qword_10002F098);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease();
      }
      *(void *)&long long v24 = 0xD00000000000001FLL;
      *((void *)&v24 + 1) = 0x8000000100020250;
      AnyHashable.init<A>(_:)();
      if (*(void *)(v5 + 16) && (unint64_t v15 = sub_10001A64C((uint64_t)v23), (v16 & 1) != 0))
      {
        sub_10001BAA4(*(void *)(v5 + 56) + 32 * v15, (uint64_t)&v24);
      }
      else
      {
        long long v24 = 0u;
        long long v25 = 0u;
      }
      swift_bridgeObjectRelease();
      sub_10001BA50((uint64_t)v23);
      if (*((void *)&v25 + 1))
      {
        int v17 = swift_dynamicCast();
        uint64_t v18 = v21;
        uint64_t v19 = v22;
        if (!v17)
        {
          uint64_t v18 = 0;
          uint64_t v19 = 0;
        }
      }
      else
      {
        sub_10001B910((uint64_t)&v24);
        uint64_t v18 = 0;
        uint64_t v19 = 0;
      }
      unint64_t v20 = (void *)(v2
                     + OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_requestorBundleID);
      *unint64_t v20 = v18;
      v20[1] = v19;
      return (void *)swift_bridgeObjectRelease();
    }
    else
    {
      if (qword_10002E370 != -1) {
        swift_once();
      }
      uint64_t v11 = type metadata accessor for Logger();
      sub_100009338(v11, (uint64_t)qword_10002FD80);
      uint64_t v12 = Logger.logObject.getter();
      os_log_type_t v13 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "ContactsLimitedAccessPromptViewController unexpectedly got nil from user info", v14, 2u);
        swift_slowDealloc();
      }

      uint64_t result = (void *)sub_1000195D8();
      if (result)
      {
        [result dismiss];
        return (void *)swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10001ADEC(void *a1)
{
  uint64_t v2 = v1;
  if (qword_10002E370 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100009338(v4, (uint64_t)qword_10002FD80);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    int64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "ContactsLimitedAccessPromptSceneDelegate: scene will connect", v7, 2u);
    swift_slowDealloc();
  }

  self;
  os_log_type_t v8 = (void *)swift_dynamicCastObjCClassUnconditional();
  id v9 = objc_allocWithZone((Class)UIWindow);
  id v10 = a1;
  id v11 = [v9 initWithWindowScene:v8];
  uint64_t v12 = OBJC_IVAR____TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate_window;
  os_log_type_t v13 = *(void **)(v1 + OBJC_IVAR____TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate_window);
  *(void *)(v1 + OBJC_IVAR____TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate_window) = v11;

  id v78 = self;
  id v14 = [v78 currentDevice];
  id v15 = [v14 userInterfaceIdiom];

  uint64_t v79 = v12;
  if (!v15)
  {
    uint64_t v43 = *(void **)(v1 + v12);
    if (v43)
    {
      id v44 = [v43 layer];
      id v45 = [self blackColor];
      id v46 = [v45 CGColor];

      [v44 setBackgroundColor:v46];
      id v47 = *(void **)(v1 + v12);
      if (v47)
      {
        id v48 = [v47 layer];
        id v49 = [self blackColor];
        id v50 = [v49 CGColor];

        [v48 setShadowColor:v50];
        uint64_t v51 = *(void **)(v1 + v12);
        if (v51)
        {
          id v52 = [v51 layer];
          LODWORD(v53) = 1.0;
          [v52 setShadowOpacity:v53];

          uint64_t v54 = *(void **)(v1 + v12);
          if (v54)
          {
            id v55 = [v54 layer];
            [v55 setShadowOffset:0.0, 0.0];

            uint64_t v56 = *(void **)(v1 + v12);
            if (v56)
            {
              id v57 = [v56 layer];
              [v57 setShadowRadius:5.0];
            }
          }
        }
      }
    }
  }
  id v16 = [objc_allocWithZone((Class)type metadata accessor for ContactsLimitedAccessPromptViewController()) initWithNibName:0 bundle:0];
  uint64_t v17 = OBJC_IVAR____TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate_rootVc;
  uint64_t v18 = *(void **)(v1 + OBJC_IVAR____TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate_rootVc);
  *(void *)(v1 + OBJC_IVAR____TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate_rootVc) = v16;

  uint64_t v19 = *(void *)(v1 + v17);
  if (v19)
  {
    uint64_t v20 = *(void *)(v19 + OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_observer);
    uint64_t v21 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = v21;
    *(void *)(v22 + 24) = v8;
    uint64_t v23 = *(void *)(v20 + 48);
    *(void *)(v20 + 48) = sub_10001B604;
    *(void *)(v20 + 56) = v22;
    id v24 = v10;
    sub_10000C6B0(v23);
    uint64_t v25 = *(void *)(v1 + v17);
    if (v25)
    {
      uint64_t v26 = *(void *)(v25
                      + OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_observer);
      uint64_t v27 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v28 = swift_allocObject();
      *(void *)(v28 + 16) = v27;
      *(void *)(v28 + 24) = v8;
      uint64_t v29 = *(void *)(v26 + 80);
      *(void *)(v26 + 80) = sub_10001B610;
      *(void *)(v26 + 88) = v28;
      id v30 = v24;
      sub_10000C6B0(v29);
      uint64_t v31 = *(void *)(v1 + v17);
      if (v31)
      {
        uint64_t v32 = *(void *)(v31
                        + OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_observer);
        uint64_t v33 = swift_allocObject();
        swift_unknownObjectWeakInit();
        uint64_t v34 = swift_allocObject();
        *(void *)(v34 + 16) = v33;
        *(void *)(v34 + 24) = v8;
        uint64_t v35 = *(void *)(v32 + 64);
        *(void *)(v32 + 64) = sub_10001B674;
        *(void *)(v32 + 72) = v34;
        id v36 = v30;
        sub_10000C6B0(v35);
      }
    }
  }
  id v37 = v10;
  id v38 = Logger.logObject.getter();
  os_log_type_t v39 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v38, v39))
  {
    id v40 = (uint8_t *)swift_slowAlloc();
    id v41 = (void *)swift_slowAlloc();
    *(_DWORD *)id v40 = 138412290;
    id v42 = [v8 activationContext];
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *id v41 = v42;

    _os_log_impl((void *)&_mh_execute_header, v38, v39, "ContactsLimitedAccessPromptSceneDelegate will activate with context %@", v40, 0xCu);
    sub_100009288(&qword_10002F098);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  char v58 = *(void **)(v2 + v17);
  uint64_t v59 = v79;
  if (v58)
  {
    id v60 = v58;
    id v61 = [v8 activationContext];
    [v60 prepareForActivationWithContext:v61 completion:0];

    uint64_t v62 = *(void *)(v2 + v17);
    if (v62)
    {
      uint64_t v63 = *(void *)(v62
                      + OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_requestorBundleID
                      + 8);
      if (v63)
      {
        uint64_t v64 = *(void *)(v62
                        + OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_requestorBundleID);
        uint64_t v65 = *(void *)(v62
                        + OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_observer);
        *(void *)(v65 + 32) = v64;
        *(void *)(v65 + 40) = v63;
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRelease();
        uint64_t v66 = *(void *)(v2 + v17);
        if (v66)
        {
          uint64_t v67 = *(void *)(v66
                          + OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_observer);
          swift_retain();
          uint64_t v68 = sub_100018C0C(v64, v63);
          uint64_t v70 = v69;
          swift_bridgeObjectRelease();
          *(void *)(v67 + 16) = v68;
          *(void *)(v67 + 24) = v70;
          swift_release();
        }
        swift_bridgeObjectRelease();
        uint64_t v59 = v79;
      }
    }
  }
  uint64_t v71 = *(void **)(v2 + v59);
  if (v71)
  {
    [v71 setRootViewController:*(void *)(v2 + v17)];
    uint64_t v71 = *(void **)(v2 + v59);
  }
  [v71 makeKeyAndVisible];
  [v8 setSwipeDismissalStyle:1];
  [v8 setAllowsMenuButtonDismissal:1];
  id v72 = [v78 currentDevice];
  id v73 = [v72 userInterfaceIdiom];

  if (v73 == (id)1)
  {
    id v74 = *(char **)(v2 + v17);
    if (v74)
    {
      double v75 = *(void **)&v74[OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_contentView];
      if (v75)
      {
        CGFloat v76 = v74;
        id v77 = v75;
        [v76 presentViewController:v77 animated:1 completion:0];
      }
    }
  }
}

uint64_t sub_10001B5C8()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

id sub_10001B604(unint64_t a1)
{
  return sub_100019BCC(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

id sub_10001B610()
{
  return sub_100019E88(*(void *)(v0 + 16), *(void **)(v0 + 24), 0);
}

uint64_t sub_10001B634()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

id sub_10001B674()
{
  return sub_100019E88(*(void *)(v0 + 16), *(void **)(v0 + 24), 2);
}

void sub_10001B694(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!tcc_server_create())
  {
    __break(1u);
    goto LABEL_17;
  }
  if (!kTCCServiceAddressBook)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  id v4 = kTCCServiceAddressBook;
  id v5 = (id)tcc_service_singleton_for_CF_name();

  if (!v5)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (!tcc_message_options_create())
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  tcc_message_options_set_reply_handler_policy();
  tcc_message_options_set_request_prompt_policy();
  tcc_message_options_set_nokill_policy();
  if (!a3)
  {
    if (qword_10002E370 != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    sub_100009338(v7, (uint64_t)qword_10002FD80);
    os_log_type_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v8, v9))
    {
      id v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "updateAddressBookAccess: don't know the requestor's bundle ID, so we can't set anything", v10, 2u);
      swift_slowDealloc();
      swift_unknownObjectRelease();
    }
    else
    {

      swift_unknownObjectRelease();
    }
    goto LABEL_13;
  }
  String.utf8CString.getter();
  uint64_t v6 = tcc_identity_create();
  swift_release();
  if (!v6)
  {
LABEL_20:
    __break(1u);
    return;
  }
  tcc_server_message_set_authorization_value();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
LABEL_13:
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

uint64_t sub_10001B8A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100009288(&qword_10002F0A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001B910(uint64_t a1)
{
  uint64_t v2 = sub_100009288(&qword_10002F0A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001B970()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001B9B0()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 16);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t sub_10001B9E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001B9F0()
{
  return swift_release();
}

uint64_t sub_10001B9F8(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_10001BA08()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001BA40()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_10001BA50(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001BAA4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10001BB00(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10001BB5C(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_10001BBF4()
{
  return sub_10001C18C(type metadata accessor for LimitedAccessContactPickerView.ControllerCoordinator);
}

uint64_t type metadata accessor for LimitedAccessContactPickerView.ControllerCoordinator()
{
  return self;
}

uint64_t sub_10001BC84()
{
  unint64_t v1 = *(void *)(v0 + 32);
  unint64_t v20 = v1;
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_10000A8B0((uint64_t)&v20);
    if (v2) {
      goto LABEL_3;
    }
LABEL_13:
    sub_10000A8DC((uint64_t)&v20);
    id v14 = objc_allocWithZone((Class)CNLimitedAccessContactPickerViewController);
    NSString v15 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    NSString v16 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v18 = [v14 initForOnboarding:v15 bundleId:v16 selectedContacts:isa];

    sub_100009288(&qword_10002F280);
    UIViewControllerRepresentableContext.coordinator.getter();
    [v18 setDelegate:v19];

    return (uint64_t)v18;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10000A8B0((uint64_t)&v20);
  uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
  if (!v2) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t result = sub_10001A758(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    uint64_t v4 = 0;
    do
    {
      if ((v1 & 0xC000000000000001) != 0) {
        id v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v5 = *(id *)(v1 + 8 * v4 + 32);
      }
      uint64_t v6 = v5;
      id v7 = [v5 identifier];
      uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v10 = v9;

      uint64_t v19 = _swiftEmptyArrayStorage;
      unint64_t v12 = _swiftEmptyArrayStorage[2];
      unint64_t v11 = _swiftEmptyArrayStorage[3];
      if (v12 >= v11 >> 1) {
        sub_10001A758(v11 > 1, v12 + 1, 1);
      }
      ++v4;
      _swiftEmptyArrayStorage[2] = v12 + 1;
      os_log_type_t v13 = (char *)&_swiftEmptyArrayStorage[2 * v12];
      *((void *)v13 + 4) = v8;
      *((void *)v13 + 5) = v10;
    }
    while (v2 != v4);
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

id sub_10001BF0C@<X0>(void *a1@<X8>)
{
  uint64_t v4 = v1[5];
  uint64_t v3 = v1[6];
  uint64_t v6 = v1[7];
  uint64_t v5 = v1[8];
  id v7 = (objc_class *)type metadata accessor for LimitedAccessContactPickerView.ControllerCoordinator();
  uint64_t v8 = (char *)objc_allocWithZone(v7);
  uint64_t v9 = &v8[OBJC_IVAR____TtCV23LimitedAccessPromptView30LimitedAccessContactPickerView21ControllerCoordinator_completion];
  *(void *)uint64_t v9 = v4;
  *((void *)v9 + 1) = v3;
  uint64_t v10 = &v8[OBJC_IVAR____TtCV23LimitedAccessPromptView30LimitedAccessContactPickerView21ControllerCoordinator_goBackBlock];
  *(void *)uint64_t v10 = v6;
  *((void *)v10 + 1) = v5;
  v12.receiver = v8;
  v12.super_class = v7;
  swift_retain();
  swift_retain();
  id result = [super init];
  *a1 = result;
  return result;
}

uint64_t sub_10001BFA4()
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)();
}

uint64_t sub_10001BFE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10001C81C();

  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10001C044(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10001C81C();

  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_10001C0A8()
{
}

uint64_t sub_10001C0DC(char *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  sub_100009370();
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = *(void (**)(uint64_t))&a1[*a5];
  id v10 = a3;
  unint64_t v11 = a1;
  v9(v8);

  return swift_bridgeObjectRelease();
}

id sub_10001C174()
{
  return sub_10001C18C(type metadata accessor for LimitedAccessSelectedContactsView.ControllerCoordinator);
}

id sub_10001C18C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t type metadata accessor for LimitedAccessSelectedContactsView.ControllerCoordinator()
{
  return self;
}

uint64_t destroy for LimitedAccessContactPickerView()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for LimitedAccessContactPickerView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 64);
  long long v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  *(void *)(a1 + 64) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for LimitedAccessContactPickerView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[6];
  a1[5] = a2[5];
  a1[6] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[8];
  a1[7] = a2[7];
  a1[8] = v5;
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for LimitedAccessContactPickerView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for LimitedAccessContactPickerView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for LimitedAccessContactPickerView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LimitedAccessContactPickerView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LimitedAccessContactPickerView()
{
  return &type metadata for LimitedAccessContactPickerView;
}

uint64_t destroy for LimitedAccessSelectedContactsView()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t _s23LimitedAccessPromptView33LimitedAccessSelectedContactsViewVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for LimitedAccessSelectedContactsView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for LimitedAccessSelectedContactsView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for LimitedAccessSelectedContactsView(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v4;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for LimitedAccessSelectedContactsView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LimitedAccessSelectedContactsView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LimitedAccessSelectedContactsView()
{
  return &type metadata for LimitedAccessSelectedContactsView;
}

uint64_t sub_10001C6AC(uint64_t a1)
{
  return sub_10001C8C4(a1, *v1);
}

id sub_10001C6B4@<X0>(void *a1@<X8>)
{
  uint64_t v4 = *(void *)(v1 + 8);
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v5 = (objc_class *)type metadata accessor for LimitedAccessSelectedContactsView.ControllerCoordinator();
  unint64_t v6 = (char *)objc_allocWithZone(v5);
  long long v7 = &v6[OBJC_IVAR____TtCV23LimitedAccessPromptView33LimitedAccessSelectedContactsView21ControllerCoordinator_completion];
  *(void *)long long v7 = v4;
  *((void *)v7 + 1) = v3;
  v9.receiver = v6;
  v9.super_class = v5;
  swift_retain();
  id result = [super init];
  *a1 = result;
  return result;
}

uint64_t sub_10001C72C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10001C870();

  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10001C790(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10001C870();

  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_10001C7F4()
{
}

unint64_t sub_10001C81C()
{
  unint64_t result = qword_10002F270;
  if (!qword_10002F270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002F270);
  }
  return result;
}

unint64_t sub_10001C870()
{
  unint64_t result = qword_10002F278;
  if (!qword_10002F278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002F278);
  }
  return result;
}

uint64_t sub_10001C8C4(uint64_t a1, unint64_t a2)
{
  if (!(a2 >> 62))
  {
    uint64_t v4 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    id v16 = objc_allocWithZone((Class)CNLimitedAccessContactPickerViewController);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v18 = [v16 initForShowSelected:isa];

    sub_100009288(&qword_10002F288);
    UIViewControllerRepresentableContext.coordinator.getter();
    [v18 setDelegate:v20];

    return (uint64_t)v18;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
  if (!v4) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t result = sub_10001A758(0, v4 & ~(v4 >> 63), 0);
  if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v19 = a1;
    uint64_t v6 = 0;
    do
    {
      if ((a2 & 0xC000000000000001) != 0) {
        id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v7 = *(id *)(a2 + 8 * v6 + 32);
      }
      uint64_t v8 = v7;
      id v9 = [v7 identifier:v19];
      uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v12 = v11;

      unint64_t v20 = _swiftEmptyArrayStorage;
      unint64_t v14 = _swiftEmptyArrayStorage[2];
      unint64_t v13 = _swiftEmptyArrayStorage[3];
      if (v14 >= v13 >> 1) {
        sub_10001A758(v13 > 1, v14 + 1, 1);
      }
      ++v6;
      _swiftEmptyArrayStorage[2] = v14 + 1;
      NSString v15 = &_swiftEmptyArrayStorage[2 * v14];
      v15[4] = v10;
      v15[5] = v12;
    }
    while (v4 != v6);
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

id sub_10001CC98()
{
  return sub_10001CE08(type metadata accessor for LimitedAccessPromptSceneDelegate);
}

id sub_10001CCC8(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  v4.receiver = a1;
  v4.super_class = (Class)a3();
  return [super init];
}

id sub_10001CDF0()
{
  return sub_10001CE08(type metadata accessor for AppDelegate);
}

id sub_10001CE08(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t sub_10001CE40()
{
  uint64_t v0 = sub_100009288(&qword_10002F348);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  objc_super v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  WindowGroup.init(id:title:lazyContent:)();
  sub_10001D068();
  static SceneBuilder.buildBlock<A>(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10001CFA0()
{
  unint64_t result = qword_10002F290;
  if (!qword_10002F290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002F290);
  }
  return result;
}

uint64_t type metadata accessor for LimitedAccessPromptSceneDelegate()
{
  return self;
}

uint64_t type metadata accessor for AppDelegate()
{
  return self;
}

ValueMetadata *type metadata accessor for LimitedAccessPromptView()
{
  return &type metadata for LimitedAccessPromptView;
}

uint64_t sub_10001D04C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10001D068()
{
  unint64_t result = qword_10002F350;
  if (!qword_10002F350)
  {
    sub_1000098A8(&qword_10002F348);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002F350);
  }
  return result;
}

uint64_t sub_10001D0C4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10001D198(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10001BAA4((uint64_t)v12, *a3);
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
      sub_10001BAA4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10001D8C4((uint64_t)v12);
  return v7;
}

uint64_t sub_10001D198(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10001D354(a5, a6);
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

uint64_t sub_10001D354(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10001D3EC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001D5CC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001D5CC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10001D3EC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10001D564(v2, 0);
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

void *sub_10001D564(uint64_t a1, uint64_t a2)
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
  sub_100009288(&qword_10002F358);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10001D5CC(char a1, int64_t a2, char a3, char *a4)
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
    sub_100009288(&qword_10002F358);
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

void sub_10001D71C(uint64_t a1, unint64_t a2)
{
  if (qword_10002E370 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100009338(v4, (uint64_t)qword_10002FD80);
  swift_bridgeObjectRetain_n();
  size_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    int64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)int64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    sub_10001D0C4(a1, a2, &v8);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "LimitedAccessPromptSceneDelegate will continue activity with type: %s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_10001D8C4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10001D918()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000098F4(v0, qword_10002FD80);
  sub_100009338(v0, (uint64_t)qword_10002FD80);
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return os_log(_:dso:log:_:_:)();
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

uint64_t static ObservableObject.environmentStore.getter()
{
  return static ObservableObject.environmentStore.getter();
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t Published.init(initialValue:)()
{
  return Published.init(initialValue:)();
}

uint64_t static Published.subscript.getter()
{
  return static Published.subscript.getter();
}

uint64_t static Published.subscript.setter()
{
  return static Published.subscript.setter();
}

uint64_t type metadata accessor for Published()
{
  return type metadata accessor for Published();
}

uint64_t EdgeInsets.init(_all:)()
{
  return EdgeInsets.init(_all:)();
}

uint64_t ScrollView.init(_:showsIndicators:content:)()
{
  return ScrollView.init(_:showsIndicators:content:)();
}

uint64_t ToolbarItem<>.init(placement:content:)()
{
  return ToolbarItem<>.init(placement:content:)();
}

uint64_t WindowGroup.init(id:title:lazyContent:)()
{
  return WindowGroup.init(id:title:lazyContent:)();
}

uint64_t static SceneBuilder.buildBlock<A>(_:)()
{
  return static SceneBuilder.buildBlock<A>(_:)();
}

uint64_t VerticalEdge.rawValue.getter()
{
  return VerticalEdge.rawValue.getter();
}

uint64_t _FrameLayout.init(width:height:alignment:)()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t AnyShapeStyle.init<A>(_:)()
{
  return AnyShapeStyle.init<A>(_:)();
}

uint64_t ObservedObject.init(wrappedValue:)()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t NavigationStack.init<>(root:)()
{
  return NavigationStack.init<>(root:)();
}

uint64_t static SafeAreaRegions.all.getter()
{
  return static SafeAreaRegions.all.getter();
}

uint64_t static SafeAreaRegions.container.getter()
{
  return static SafeAreaRegions.container.getter();
}

uint64_t type metadata accessor for RoundedRectangle()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t EnvironmentObject.error()()
{
  return EnvironmentObject.error()();
}

uint64_t EnvironmentObject.init()()
{
  return EnvironmentObject.init()();
}

uint64_t EnvironmentValues.allowsTightening.getter()
{
  return EnvironmentValues.allowsTightening.getter();
}

uint64_t EnvironmentValues.allowsTightening.setter()
{
  return EnvironmentValues.allowsTightening.setter();
}

uint64_t EnvironmentValues.minimumScaleFactor.getter()
{
  return EnvironmentValues.minimumScaleFactor.getter();
}

uint64_t EnvironmentValues.minimumScaleFactor.setter()
{
  return EnvironmentValues.minimumScaleFactor.setter();
}

uint64_t EnvironmentValues.multilineTextAlignment.getter()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t EnvironmentValues.multilineTextAlignment.setter()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t EnvironmentValues.font.getter()
{
  return EnvironmentValues.font.getter();
}

uint64_t EnvironmentValues.font.setter()
{
  return EnvironmentValues.font.setter();
}

uint64_t EnvironmentValues.tint.getter()
{
  return EnvironmentValues.tint.getter();
}

uint64_t EnvironmentValues.tint.setter()
{
  return EnvironmentValues.tint.setter();
}

uint64_t EnvironmentValues.isEnabled.getter()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t EnvironmentValues.isEnabled.setter()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t EnvironmentValues.lineLimit.getter()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t EnvironmentValues.lineLimit.setter()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t static VerticalAlignment.center.getter()
{
  return static VerticalAlignment.center.getter();
}

uint64_t DefaultButtonStyle.init()()
{
  return DefaultButtonStyle.init()();
}

uint64_t type metadata accessor for DefaultButtonStyle()
{
  return type metadata accessor for DefaultButtonStyle();
}

uint64_t static PresentationDetent.large.getter()
{
  return static PresentationDetent.large.getter();
}

uint64_t type metadata accessor for PresentationDetent()
{
  return type metadata accessor for PresentationDetent();
}

uint64_t type metadata accessor for RoundedCornerStyle()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t static HorizontalAlignment.center.getter()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t TupleToolbarContent.init(_:)()
{
  return TupleToolbarContent.init(_:)();
}

uint64_t UIHostingController.init(rootView:)()
{
  return UIHostingController.init(rootView:)();
}

uint64_t UIViewRepresentable._resetUIView(_:coordinator:destroy:)()
{
  return UIViewRepresentable._resetUIView(_:coordinator:destroy:)();
}

uint64_t static UIViewRepresentable.dismantleUIView(_:coordinator:)()
{
  return static UIViewRepresentable.dismantleUIView(_:coordinator:)();
}

uint64_t UIViewRepresentable.sizeThatFits(_:uiView:context:)()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t static UIViewRepresentable._layoutOptions(_:)()
{
  return static UIViewRepresentable._layoutOptions(_:)();
}

uint64_t UIViewRepresentable._identifiedViewTree(in:)()
{
  return UIViewRepresentable._identifiedViewTree(in:)();
}

uint64_t UIViewRepresentable._overrideLayoutTraits(_:for:)()
{
  return UIViewRepresentable._overrideLayoutTraits(_:for:)();
}

uint64_t UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)()
{
  return UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)();
}

uint64_t static UIViewRepresentable._modifyBridgedViewInputs(_:)()
{
  return static UIViewRepresentable._modifyBridgedViewInputs(_:)();
}

uint64_t UIViewRepresentable.body.getter()
{
  return UIViewRepresentable.body.getter();
}

uint64_t _ConditionalContent<>.init(storage:)()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t static ToolbarItemPlacement.navigationBarLeading.getter()
{
  return static ToolbarItemPlacement.navigationBarLeading.getter();
}

uint64_t static ToolbarItemPlacement.navigationBarTrailing.getter()
{
  return static ToolbarItemPlacement.navigationBarTrailing.getter();
}

uint64_t type metadata accessor for ToolbarItemPlacement()
{
  return type metadata accessor for ToolbarItemPlacement();
}

uint64_t type metadata accessor for PinnedScrollableViews()
{
  return type metadata accessor for PinnedScrollableViews();
}

uint64_t UIViewRepresentableContext.coordinator.getter()
{
  return UIViewRepresentableContext.coordinator.getter();
}

uint64_t BorderedProminentButtonStyle.init()()
{
  return BorderedProminentButtonStyle.init()();
}

uint64_t type metadata accessor for BorderedProminentButtonStyle()
{
  return type metadata accessor for BorderedProminentButtonStyle();
}

uint64_t UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)()
{
  return UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)();
}

uint64_t static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)()
{
  return static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)();
}

uint64_t UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)()
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)();
}

uint64_t static UIViewControllerRepresentable._layoutOptions(_:)()
{
  return static UIViewControllerRepresentable._layoutOptions(_:)();
}

uint64_t UIViewControllerRepresentable._identifiedViewTree(in:)()
{
  return UIViewControllerRepresentable._identifiedViewTree(in:)();
}

uint64_t UIViewControllerRepresentable.body.getter()
{
  return UIViewControllerRepresentable.body.getter();
}

uint64_t UIViewControllerRepresentableContext.coordinator.getter()
{
  return UIViewControllerRepresentableContext.coordinator.getter();
}

uint64_t static App.main()()
{
  return static App.main()();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t static Axis.Set.vertical.getter()
{
  return static Axis.Set.vertical.getter();
}

uint64_t static Edge.Set.horizontal.getter()
{
  return static Edge.Set.horizontal.getter();
}

uint64_t static Edge.Set.all.getter()
{
  return static Edge.Set.all.getter();
}

uint64_t static Edge.Set.top.getter()
{
  return static Edge.Set.top.getter();
}

uint64_t static Edge.Set.bottom.getter()
{
  return static Edge.Set.bottom.getter();
}

uint64_t static Edge.Set.vertical.getter()
{
  return static Edge.Set.vertical.getter();
}

uint64_t Edge.init(rawValue:)()
{
  return Edge.init(rawValue:)();
}

uint64_t type metadata accessor for Font.Design()
{
  return type metadata accessor for Font.Design();
}

uint64_t static Font.Weight.bold.getter()
{
  return static Font.Weight.bold.getter();
}

uint64_t static Font.Weight.semibold.getter()
{
  return static Font.Weight.semibold.getter();
}

uint64_t static Font.system(size:weight:design:)()
{
  return static Font.system(size:weight:design:)();
}

uint64_t Font.weight(_:)()
{
  return Font.weight(_:)();
}

uint64_t static Font.callout.getter()
{
  return static Font.callout.getter();
}

uint64_t Text.fontWeight(_:)()
{
  return Text.fontWeight(_:)();
}

uint64_t Text.foregroundColor(_:)()
{
  return Text.foregroundColor(_:)();
}

uint64_t Text.foregroundStyle<A>(_:)()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t Text.font(_:)()
{
  return Text.font(_:)();
}

uint64_t Text.init<A>(_:)()
{
  return Text.init<A>(_:)();
}

uint64_t static View._makeView(view:inputs:)()
{
  return static View._makeView(view:inputs:)();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t View.fontWeight(_:)()
{
  return View.fontWeight(_:)();
}

uint64_t View.buttonStyle<A>(_:)()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t View.presentationDetents(_:)()
{
  return View.presentationDetents(_:)();
}

uint64_t View.sheet<A>(isPresented:onDismiss:content:)()
{
  return View.sheet<A>(isPresented:onDismiss:content:)();
}

uint64_t View.toolbar<A>(content:)()
{
  return View.toolbar<A>(content:)();
}

uint64_t View.lineLimit(_:reservesSpace:)()
{
  return View.lineLimit(_:reservesSpace:)();
}

uint64_t static Color.blue.getter()
{
  return static Color.blue.getter();
}

uint64_t static Color.gray.getter()
{
  return static Color.gray.getter();
}

uint64_t static Color.clear.getter()
{
  return static Color.clear.getter();
}

uint64_t Color.init(_:)()
{
  return Color.init(_:)();
}

uint64_t Image.init(systemName:)()
{
  return Image.init(systemName:)();
}

uint64_t State.init(wrappedValue:)()
{
  return State.init(wrappedValue:)();
}

uint64_t State.wrappedValue.getter()
{
  return State.wrappedValue.getter();
}

uint64_t State.wrappedValue.setter()
{
  return State.wrappedValue.setter();
}

uint64_t State.projectedValue.getter()
{
  return State.projectedValue.getter();
}

uint64_t Button.init(action:label:)()
{
  return Button.init(action:label:)();
}

uint64_t ForEach<>.init(_:id:content:)()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t type metadata accessor for GridItem.Size()
{
  return type metadata accessor for GridItem.Size();
}

uint64_t type metadata accessor for GridItem()
{
  return type metadata accessor for GridItem();
}

uint64_t GridItem.init(_:spacing:alignment:)()
{
  return GridItem.init(_:spacing:alignment:)();
}

uint64_t static Material.thin.getter()
{
  return static Material.thin.getter();
}

uint64_t type metadata accessor for Material()
{
  return type metadata accessor for Material();
}

uint64_t static Alignment.center.getter()
{
  return static Alignment.center.getter();
}

uint64_t static Alignment.leading.getter()
{
  return static Alignment.leading.getter();
}

uint64_t LazyVGrid.init(columns:alignment:spacing:pinnedViews:content:)()
{
  return LazyVGrid.init(columns:alignment:spacing:pinnedViews:content:)();
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

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t String.LocalizationValue.init(stringLiteral:)()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t String.LocalizationValue.StringInterpolation.appendInterpolation<A>(_:specifier:)()
{
  return String.LocalizationValue.StringInterpolation.appendInterpolation<A>(_:specifier:)();
}

Swift::Void __swiftcall String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall String.LocalizationValue.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t type metadata accessor for String.LocalizationValue.StringInterpolation()
{
  return type metadata accessor for String.LocalizationValue.StringInterpolation();
}

uint64_t String.LocalizationValue.init(stringInterpolation:)()
{
  return String.LocalizationValue.init(stringInterpolation:)();
}

uint64_t type metadata accessor for String.LocalizationValue()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init(localized:table:bundle:locale:comment:)()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
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

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

Swift::Void __swiftcall _ArrayBuffer._typeCheckSlowPath(_:)(Swift::Int a1)
{
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t _CocoaArrayWrapper.subscript.getter()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
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

uint64_t dispatch thunk of OptionSet.init(rawValue:)()
{
  return dispatch thunk of OptionSet.init(rawValue:)();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
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

void exit(int a1)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return _swift_dynamicCastObjCClassUnconditional();
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

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
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

uint64_t swift_retain_n()
{
  return _swift_retain_n();
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

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
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

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
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

uint64_t tcc_identity_create()
{
  return _tcc_identity_create();
}

uint64_t tcc_message_options_create()
{
  return _tcc_message_options_create();
}

uint64_t tcc_message_options_set_nokill_policy()
{
  return _tcc_message_options_set_nokill_policy();
}

uint64_t tcc_message_options_set_reply_handler_policy()
{
  return _tcc_message_options_set_reply_handler_policy();
}

uint64_t tcc_message_options_set_request_prompt_policy()
{
  return _tcc_message_options_set_request_prompt_policy();
}

uint64_t tcc_server_create()
{
  return _tcc_server_create();
}

uint64_t tcc_server_message_set_authorization_value()
{
  return _tcc_server_message_set_authorization_value();
}

uint64_t tcc_service_singleton_for_CF_name()
{
  return _tcc_service_singleton_for_CF_name();
}