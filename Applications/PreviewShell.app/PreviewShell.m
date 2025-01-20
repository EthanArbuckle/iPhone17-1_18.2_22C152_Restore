uint64_t sub_1000042D4()
{
  if (qword_100071248[0] != -1) {
    dispatch_once(qword_100071248, &stru_1000624F0);
  }
  return byte_100071240;
}

void sub_100004318(id a1)
{
  CFDictionaryRef v1 = (const __CFDictionary *)MGCopyAnswer();
  if (v1)
  {
    CFDictionaryRef v2 = v1;
    CFDictionaryGetValue(v1, @"ArtworkDeviceSubType");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      unsigned int v3 = [v6 intValue];
      BOOL v5 = v3 == 2556 || v3 == 2796;
      byte_100071240 = v5;
    }
    CFRelease(v2);
  }
}

uint64_t sub_100004408()
{
  if (qword_100071248[0] != -1) {
    dispatch_once(qword_100071248, &stru_1000624F0);
  }
  if (byte_100071240) {
    return 1;
  }

  return _SBSIsSystemApertureAvailable();
}

uint64_t sub_100004484(uint64_t (*a1)(), uint64_t a2)
{
  CFDictionaryRef v2 = (uint64_t (**)())(a2
                      + OBJC_IVAR____TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver_didExitHandler);
  uint64_t v3 = *(void *)(a2
                 + OBJC_IVAR____TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver_didExitHandler);
  *CFDictionaryRef v2 = j___s20PreviewsFoundationOS7PromiseC7succeed4withyx_tF;
  v2[1] = a1;
  swift_retain();
  sub_100007674(v3);
  return static ProcessUtilities.kill(processHandle:)();
}

id sub_10000452C(uint64_t a1, uint64_t a2)
{
  uint64_t v105 = a2;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v101 = *(void *)(v2 - 8);
  uint64_t v102 = v2;
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  v100 = (char *)v94 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v99 = (char *)v94 - v5;
  id v6 = type metadata accessor for URL.DirectoryHint();
  uint64_t isa = (uint64_t)v6[-1].isa;
  os_log_t v107 = v6;
  __chkstk_darwin(v6);
  v8 = (char *)v94 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v103 = *(void *)(v9 - 8);
  uint64_t v104 = v9;
  uint64_t v10 = __chkstk_darwin(v9);
  v98 = (char *)v94 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  v97 = (char *)v94 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  v108 = (char *)v94 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  v109 = (char *)v94 - v17;
  __chkstk_darwin(v16);
  v110 = (char *)v94 - v18;
  uint64_t v19 = type metadata accessor for BinaryType();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = __chkstk_darwin(v19);
  v23 = (char *)v94 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  v25 = (char *)v94 - v24;
  id v26 = [objc_allocWithZone((Class)FBMutableProcessExecutionContext) init];
  [v26 setLaunchIntent:4];
  uint64_t v27 = PreviewAgentLaunchConfiguration.environment.getter();
  sub_10000519C(v27);
  swift_bridgeObjectRelease();
  Class v28 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v26 setEnvironment:v28];

  uint64_t v29 = PreviewAgentLaunchConfiguration.arguments.getter();
  sub_10000555C(v29);
  swift_bridgeObjectRelease();
  Class v30 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v26 setArguments:v30];

  PreviewAgentLaunchConfiguration.binaryType.getter();
  uint64_t v31 = BinaryType.cpuType.getter();
  v32 = *(void (**)(char *, uint64_t))(v20 + 8);
  v32(v25, v19);
  PreviewAgentLaunchConfiguration.binaryType.getter();
  uint64_t v33 = BinaryType.cpuSubtype.getter();
  v32(v23, v19);
  id v34 = [self sliceWithType:v31 subtype:v33];
  [v26 setOverrideExecutableSlice:v34];

  uint64_t v35 = PreviewAgentLaunchConfiguration.environment.getter();
  if (*(void *)(v35 + 16) && (unint64_t v36 = sub_100009020(0xD000000000000037, 0x8000000100055AF0), (v37 & 1) != 0))
  {
    v38 = (uint64_t *)(*(void *)(v35 + 56) + 16 * v36);
    uint64_t v40 = *v38;
    uint64_t v39 = v38[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if (v39)
    {
      if (v40 == 49 && v39 == 0xE100000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v42 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if ((v42 & 1) == 0) {
          return v26;
        }
      }
      id v96 = self;
      id v43 = [v96 defaultManager];
      id v44 = [v43 temporaryDirectory];

      static URL._unconditionallyBridgeFromObjectiveC(_:)();
      strcpy((char *)v112, "agent-stderr");
      BYTE5(v112[1]) = 0;
      HIWORD(v112[1]) = -5120;
      uint64_t v46 = isa;
      os_log_t v45 = v107;
      v95 = *(void (**)(char *, void, os_log_t))(isa + 104);
      v95(v8, enum case for URL.DirectoryHint.isDirectory(_:), v107);
      v94[1] = sub_100007BC0();
      URL.appending<A>(component:directoryHint:)();
      uint64_t isa = *(void *)(v46 + 8);
      ((void (*)(char *, os_log_t))isa)(v8, v45);
      swift_bridgeObjectRelease();
      id v47 = [objc_allocWithZone((Class)NSDate) init];
      id v48 = [v47 description];

      uint64_t v49 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v51 = v50;

      v112[0] = AgentDescriptor.Bundle.bundleID.getter();
      v112[1] = v52;
      v53._countAndFlagsBits = 45;
      v53._object = (void *)0xE100000000000000;
      String.append(_:)(v53);
      v54._countAndFlagsBits = v49;
      v54._object = v51;
      String.append(_:)(v54);
      swift_bridgeObjectRelease();
      v55._countAndFlagsBits = 1954051118;
      v55._object = (void *)0xE400000000000000;
      String.append(_:)(v55);
      v95(v8, enum case for URL.DirectoryHint.notDirectory(_:), v45);
      v56 = v108;
      URL.appending<A>(component:directoryHint:)();
      ((void (*)(char *, os_log_t))isa)(v8, v45);
      swift_bridgeObjectRelease();
      id v57 = [v96 defaultManager];
      URL._bridgeToObjectiveC()(v58);
      v60 = v59;
      v112[0] = 0;
      unsigned int v61 = [v57 createDirectoryAtURL:v59 withIntermediateDirectories:1 attributes:0 error:v112];

      if (v61)
      {
        id v62 = (id)v112[0];
        v63 = v99;
        static Logger.previews.getter();
        uint64_t v64 = v103;
        uint64_t v65 = v104;
        v66 = v97;
        (*(void (**)(char *, char *, uint64_t))(v103 + 16))(v97, v56, v104);
        v67 = Logger.logObject.getter();
        os_log_type_t v68 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v67, v68))
        {
          os_log_t v107 = v67;
          v69 = (uint8_t *)swift_slowAlloc();
          uint64_t isa = swift_slowAlloc();
          v112[0] = isa;
          *(_DWORD *)v69 = 136446210;
          uint64_t v70 = URL.path.getter();
          uint64_t v111 = sub_100013F74(v70, v71, v112);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          v72 = *(void (**)(char *, uint64_t))(v64 + 8);
          v72(v66, v65);
          os_log_t v73 = v107;
          _os_log_impl((void *)&_mh_execute_header, v107, v68, "ApplicationLauncher: Redirecting stderr to %{public}s", v69, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          (*(void (**)(char *, uint64_t))(v101 + 8))(v99, v102);
        }
        else
        {
          v72 = *(void (**)(char *, uint64_t))(v64 + 8);
          v72(v66, v65);

          (*(void (**)(char *, uint64_t))(v101 + 8))(v63, v102);
        }
        URL._bridgeToObjectiveC()(v74);
        v92 = v91;
        [v26 setStandardErrorURL:v91];

        v72(v56, v65);
        v72(v109, v65);
        v72(v110, v65);
      }
      else
      {
        id v75 = (id)v112[0];
        uint64_t v76 = _convertNSErrorToError(_:)();

        swift_willThrow();
        v77 = v100;
        static Logger.previews.getter();
        uint64_t v78 = v103;
        v79 = v98;
        v80 = v56;
        v81 = v56;
        uint64_t v82 = v104;
        (*(void (**)(char *, char *, uint64_t))(v103 + 16))(v98, v80, v104);
        swift_errorRetain();
        swift_errorRetain();
        v83 = Logger.logObject.getter();
        os_log_type_t v84 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v83, v84))
        {
          uint64_t v85 = swift_slowAlloc();
          os_log_t v107 = (os_log_t)swift_slowAlloc();
          v112[0] = (uint64_t)v107;
          *(_DWORD *)uint64_t v85 = 136446466;
          uint64_t v86 = URL.path.getter();
          uint64_t v111 = sub_100013F74(v86, v87, v112);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          v88 = *(void (**)(char *, uint64_t))(v78 + 8);
          v88(v79, v82);
          *(_WORD *)(v85 + 12) = 2080;
          uint64_t v111 = v76;
          swift_errorRetain();
          sub_10000758C(&qword_10006EFF0);
          uint64_t v89 = String.init<A>(describing:)();
          uint64_t v111 = sub_100013F74(v89, v90, v112);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl((void *)&_mh_execute_header, v83, v84, "ApplicationLauncher: Could not redirect stderr to %{public}s: %s", (uint8_t *)v85, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          swift_errorRelease();
          (*(void (**)(char *, uint64_t))(v101 + 8))(v100, v102);
          v88(v108, v82);
          v88(v109, v82);
          v88(v110, v82);
        }
        else
        {

          swift_errorRelease();
          swift_errorRelease();
          v93 = *(void (**)(char *, uint64_t))(v78 + 8);
          v93(v79, v82);
          swift_errorRelease();
          (*(void (**)(char *, uint64_t))(v101 + 8))(v77, v102);
          v93(v81, v82);
          v93(v109, v82);
          v93(v110, v82);
        }
      }
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  return v26;
}

uint64_t sub_10000519C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_10000758C(&qword_10006EFF8);
    uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v27 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
  id v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v27 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v27 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v27 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    uint64_t v17 = (void *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v18 = v17[1];
    *(void *)&v36[0] = *v17;
    *((void *)&v36[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    swift_dynamicCast();
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_100007C14(&v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_100007C14(v35, v36);
    sub_100007C14(v36, &v32);
    uint64_t result = AnyHashable._rawHashValue(seed:)(v2[5]);
    uint64_t v19 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)&v6[8 * (v20 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v20) & ~*(void *)&v6[8 * (v20 >> 6)])) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)&v6[8 * v21];
      }
      while (v25 == -1);
      unint64_t v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(void *)(v10 + 32) = v30;
    uint64_t result = (uint64_t)sub_100007C14(&v32, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_100007C24();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v27 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

void *sub_10000555C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = &_swiftEmptyArrayStorage;
  if (v1)
  {
    unint64_t v9 = &_swiftEmptyArrayStorage;
    sub_10001EC14(0, v1, 0);
    uint64_t v2 = &_swiftEmptyArrayStorage;
    uint64_t v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_10001EC14(0, v2[2] + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = v2[2];
      unint64_t v5 = v2[3];
      if (v6 >= v5 >> 1)
      {
        sub_10001EC14(v5 > 1, v6 + 1, 1);
        uint64_t v2 = v9;
      }
      v4 += 16;
      v2[2] = v6 + 1;
      sub_100007C14(&v8, &v2[4 * v6 + 4]);
      --v1;
    }
    while (v1);
  }
  return v2;
}

id sub_100005684(void *a1, void *a2, uint64_t a3)
{
  uint64_t v28 = a3;
  id v31 = a1;
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v32 = *(void *)(v5 - 8);
  uint64_t v33 = v5;
  __chkstk_darwin(v5);
  uint64_t v34 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for AgentDescriptor.Bundle();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = __chkstk_darwin(v7);
  long long v29 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  unint64_t v12 = (char *)&v26 - v11;
  uint64_t v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v27 = *(void (**)(void))(v8 + 16);
  ((void (*)(char *, uint64_t, uint64_t))v27)(v12, a3, v7);
  unint64_t v14 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v15 = (v9 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v16 = swift_allocObject();
  uint64_t v30 = v8;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v16 + v14, v12, v7);
  *(void *)(v16 + v15) = v13;
  *(void *)(v16 + ((v15 + 15) & 0xFFFFFFFFFFFFFFF8)) = v31;
  aBlock[4] = (uint64_t)sub_100007B18;
  aBlock[5] = v16;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100026300;
  aBlock[3] = (uint64_t)&unk_1000628C0;
  uint64_t v17 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  id v31 = a2;
  [a2 setCompletionBlock:v17];
  _Block_release(v17);
  static Logger.uv.getter();
  uint64_t v18 = v29;
  uint64_t v19 = v7;
  v27();
  unint64_t v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v20, v21))
  {
    char v22 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)char v22 = 136315138;
    sub_100007544(&qword_10006EFD8, (void (*)(uint64_t))&type metadata accessor for AgentDescriptor.Bundle);
    uint64_t v23 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v35 = sub_100013F74(v23, v24, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v18, v19);
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "will begin launch transaction for %s", v22, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v30 + 8))(v18, v7);
  }

  (*(void (**)(char *, uint64_t))(v32 + 8))(v34, v33);
  return [v31 begin];
}

void sub_100005AF0(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v48 = a1;
  uint64_t v7 = type metadata accessor for AgentDescriptor.Bundle();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  *(void *)&long long v52 = (char *)v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  unint64_t v12 = (char *)v44 - v11;
  uint64_t v47 = type metadata accessor for Logger();
  uint64_t v13 = *(void *)(v47 - 8);
  __chkstk_darwin(v47);
  unint64_t v15 = (char *)v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = a3 + 16;
  static Logger.uv.getter();
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  uint64_t v46 = a2;
  v50 = v16;
  *(void *)&long long v51 = v8 + 16;
  v16((uint64_t)v12, a2, v7);
  uint64_t v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v45 = v8;
    uint64_t v20 = v19;
    uint64_t v21 = swift_slowAlloc();
    v44[1] = a4;
    *(void *)&long long v53 = v21;
    *(_DWORD *)uint64_t v20 = 136315394;
    sub_100007544(&qword_10006EFD8, (void (*)(uint64_t))&type metadata accessor for AgentDescriptor.Bundle);
    uint64_t v22 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v55 = sub_100013F74(v22, v23, (uint64_t *)&v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    unint64_t v24 = *(void (**)(char *, uint64_t))(v45 + 8);
    v24(v12, v7);
    *(_WORD *)(v20 + 12) = 1024;
    char v25 = v48;
    LODWORD(v55) = v48 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "launch transaction completed for %s with success = %{BOOL}d", (uint8_t *)v20, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v47);
    char v26 = v25;
  }
  else
  {
    unint64_t v24 = *(void (**)(char *, uint64_t))(v8 + 8);
    v24(v12, v7);

    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v47);
    char v26 = v48;
  }
  uint64_t v27 = (char *)v52;
  uint64_t v28 = v50;
  if ((v26 & 1) == 0
    || (swift_beginAccess(), (long long v29 = (void *)swift_unknownObjectWeakLoadStrong()) == 0)
    || (uint64_t v30 = v29, v31 = [v29 process], v30, !v31))
  {
    swift_beginAccess();
    Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      unint64_t v36 = Strong;
      id v37 = [Strong error];

      v28((uint64_t)v27, v46, v7);
      if (v37)
      {
LABEL_15:
        v24(v27, v7);
        Promise.fail(with:)();
        goto LABEL_16;
      }
    }
    else
    {
      v28((uint64_t)v27, v46, v7);
    }
    uint64_t v38 = type metadata accessor for ProcessError();
    sub_100007544(&qword_10006EFE0, (void (*)(uint64_t))&type metadata accessor for ProcessError);
    swift_allocError();
    uint64_t v40 = v39;
    v28(v39, (uint64_t)v27, v7);
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v38 - 8) + 104))(v40, enum case for ProcessError.noLaunchedProcess(_:), v38);
    goto LABEL_15;
  }
  id v32 = [v31 handle];
  if (v32)
  {
    uint64_t v33 = v32;
    id v34 = [v32 auditToken];

    if (v34)
    {
      [v34 realToken];
      long long v51 = v54;
      long long v52 = v53;

      long long v53 = v52;
      long long v54 = v51;
      Promise.succeed(with:)();

      return;
    }
  }
  uint64_t v41 = type metadata accessor for ProcessError();
  sub_100007544(&qword_10006EFE0, (void (*)(uint64_t))&type metadata accessor for ProcessError);
  swift_allocError();
  id v43 = v42;
  *char v42 = [v31 pid];
  (*(void (**)(_DWORD *, void, uint64_t))(*(void *)(v41 - 8) + 104))(v43, enum case for ProcessError.noAuditTokenForPid(_:), v41);
  Promise.fail(with:)();

LABEL_16:
  swift_errorRelease();
}

uint64_t sub_100006168(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return _swift_task_switch(sub_100006188, 0, 0);
}

uint64_t sub_100006188()
{
  int64_t v1 = *(void **)(v0 + 16);
  AgentDescriptor.Bundle.bundleID.getter();
  NSString v2 = String._bridgeToObjectiveC()();
  id v3 = [self identityForEmbeddedApplicationIdentifier:v2];

  swift_bridgeObjectRelease();
  *int64_t v1 = v3;
  uint64_t v4 = enum case for PreviewAgentJITBootstrapMethod.runningBoardIdentity(_:);
  uint64_t v5 = type metadata accessor for PreviewAgentJITBootstrapMethod();
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 104))(v1, v4, v5);
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_100006280(uint64_t result)
{
  int64_t v1 = *(void (**)(uint64_t))(result
                                      + OBJC_IVAR____TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver_didExitHandler);
  if (v1)
  {
    uint64_t v2 = swift_retain();
    v1(v2);
    return sub_100007674((uint64_t)v1);
  }
  return result;
}

id sub_100006378()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  [super dealloc];
}

uint64_t type metadata accessor for ProcessExitObserver()
{
  return self;
}

void type metadata accessor for CGImage(uint64_t a1)
{
}

void type metadata accessor for UIInterfaceOrientation(uint64_t a1)
{
}

void type metadata accessor for UIDeviceOrientation(uint64_t a1)
{
}

void type metadata accessor for UISDeviceIdiom(uint64_t a1)
{
}

void type metadata accessor for BSDeviceHomeButtonType(uint64_t a1)
{
}

void type metadata accessor for BSDeviceClass(uint64_t a1)
{
}

id sub_10000649C(uint64_t a1)
{
  int64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  id v3 = (void *)v1(v2);
  swift_release();

  return v3;
}

BOOL sub_1000064EC(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

void *sub_100006500@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100006510(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_10000651C(uint64_t a1, uint64_t a2)
{
  return sub_100006614(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100006534()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100006588()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1000065FC(uint64_t a1, uint64_t a2)
{
  return sub_100006614(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100006614(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100006658(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_1000066D0(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100006750@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

Swift::Int sub_100006794()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_1000067DC()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100006808()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void *sub_10000684C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

_DWORD *sub_100006858@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void sub_100006868(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100006874()
{
  return sub_100007544(&qword_10006EEA8, type metadata accessor for UIInterfaceOrientation);
}

uint64_t sub_1000068BC()
{
  uint64_t v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

BOOL sub_100006948(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_10000695C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_100006970(void *result)
{
  *v1 &= *result;
  return result;
}

BOOL sub_100006984(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_100006998(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

uint64_t sub_1000069AC@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1000069F4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100006A20(uint64_t a1)
{
  uint64_t v2 = sub_100007544((unint64_t *)&unk_1000708A0, type metadata accessor for LaunchOptionsKey);
  uint64_t v3 = sub_100007544((unint64_t *)&unk_10006EFC0, type metadata accessor for LaunchOptionsKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100006ADC()
{
  AgentDescriptor.Bundle.bundleID.getter();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = [self identityForEmbeddedApplicationIdentifier:v0];

  id v2 = [self predicateMatchingIdentity:v1];
  uint64_t v3 = self;
  id v19 = 0;
  id v4 = v2;
  id v5 = [v3 handleForPredicate:v4 error:&v19];
  if (!v5)
  {
    id v16 = v19;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRelease();
    swift_bridgeObjectRelease();
LABEL_6:
    sub_10000758C(&qword_10006F000);
    return static Future<A>.succeeded(dsoHandle:file:line:column:function:)();
  }
  uint64_t v6 = v5;
  id v7 = v19;

  uint64_t v8 = (void *)RBSProcessHandle.applicationProcess.getter();
  swift_bridgeObjectRelease();
  if (!v8)
  {

    goto LABEL_6;
  }
  uint64_t v9 = (objc_class *)type metadata accessor for ProcessExitObserver();
  uint64_t v10 = (char *)objc_allocWithZone(v9);
  uint64_t v11 = &v10[OBJC_IVAR____TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver_didExitHandler];
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  *(void *)&v10[OBJC_IVAR____TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver_process] = v8;
  v18.receiver = v10;
  v18.super_class = v9;
  id v12 = v8;
  uint64_t v13 = (char *)[super init];
  [*(id *)&v13[OBJC_IVAR____TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver_process] addObserver:v13];
  sub_10000758C(&qword_10006F000);
  __chkstk_darwin();
  uint64_t v14 = Future.__allocating_init(dsoHandle:file:line:column:function:callback:)();
  *(void *)(swift_allocObject() + 16) = v13;
  unint64_t v15 = v13;
  Future.observeFinish(_:)();

  swift_release();
  return v14;
}

uint64_t sub_100006E00(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PreviewAgentLaunchConfiguration();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2);
  id v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for AgentDescriptor.Bundle();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  id v12 = (char *)&v30 - v11;
  id v31 = (char *)&v30 - v11;
  PreviewAgentLaunchConfiguration.agentBundle.getter();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  uint64_t v13 = v12;
  uint64_t v14 = v6;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v13, v6);
  unint64_t v15 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v16 = (v4 + *(unsigned __int8 *)(v7 + 80) + v15) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v17 + v15, v5, v2);
  unint64_t v18 = v17 + v16;
  uint64_t v19 = v14;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v18, v10, v14);
  uint64_t v20 = v31;
  AgentDescriptor.Bundle.bundleID.getter();
  NSString v21 = String._bridgeToObjectiveC()();
  id v22 = [self identityForEmbeddedApplicationIdentifier:v21];
  swift_bridgeObjectRelease();

  id v23 = objc_allocWithZone((Class)FBApplicationProcessLaunchTransaction);
  aBlock[4] = sub_1000078E4;
  aBlock[5] = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000649C;
  aBlock[3] = &unk_100062820;
  unint64_t v24 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  id v25 = [v23 initWithProcessIdentity:v22 executionContextProvider:v24];

  _Block_release(v24);
  sub_10000758C(&qword_10006EFD0);
  id v32 = v25;
  uint64_t v33 = v20;
  char v26 = v20;
  uint64_t v27 = Future.__allocating_init(dsoHandle:file:line:column:function:callback:)();
  *(void *)(swift_allocObject() + 16) = v25;
  id v28 = v25;
  Future.observeCancelation(_:)();
  swift_release();

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v26, v19);
  return v27;
}

uint64_t sub_100007200()
{
  uint64_t v1 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000074AC();
  uint64_t v9 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v0;
  aBlock[4] = sub_100007524;
  aBlock[5] = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100026354;
  aBlock[3] = &unk_100062768;
  uint64_t v11 = _Block_copy(aBlock);
  id v12 = v0;
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100007544(&qword_10006EF78, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000758C(&qword_10006EF80);
  sub_1000075D0();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_1000074AC()
{
  unint64_t result = qword_10006EF70;
  if (!qword_10006EF70)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10006EF70);
  }
  return result;
}

uint64_t sub_1000074EC()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100007524()
{
  return sub_100006280(*(void *)(v0 + 16));
}

uint64_t sub_10000752C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000753C()
{
  return swift_release();
}

uint64_t sub_100007544(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000758C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000075D0()
{
  unint64_t result = qword_10006EF88;
  if (!qword_10006EF88)
  {
    sub_10000762C(&qword_10006EF80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006EF88);
  }
  return result;
}

uint64_t sub_10000762C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100007674(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
}

void type metadata accessor for UIUserInterfaceIdiom(uint64_t a1)
{
}

uint64_t sub_1000076AC()
{
  return sub_100007544(&qword_10006EFA0, type metadata accessor for LaunchOptionsKey);
}

uint64_t sub_1000076F4()
{
  return sub_100007544(&qword_10006EFA8, type metadata accessor for LaunchOptionsKey);
}

uint64_t sub_10000773C()
{
  return sub_100007544((unint64_t *)&unk_10006EFB0, type metadata accessor for LaunchOptionsKey);
}

ValueMetadata *type metadata accessor for ApplicationLauncher()
{
  return &type metadata for ApplicationLauncher;
}

uint64_t sub_100007794()
{
  uint64_t v1 = type metadata accessor for PreviewAgentLaunchConfiguration();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = type metadata accessor for AgentDescriptor.Bundle();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v4 + v5 + v8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);

  return _swift_deallocObject(v0, v10, v11);
}

id sub_1000078E4()
{
  uint64_t v1 = *(void *)(type metadata accessor for PreviewAgentLaunchConfiguration() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v4 = *(void *)(type metadata accessor for AgentDescriptor.Bundle() - 8);
  uint64_t v5 = v0 + ((v2 + v3 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return sub_10000452C(v0 + v2, v5);
}

id sub_1000079B0(void *a1)
{
  return sub_100005684(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

void sub_1000079B8()
{
  uint64_t v1 = *(void **)(v0 + 16);
  NSString v2 = String._bridgeToObjectiveC()();
  [v1 failWithReason:v2];
}

uint64_t sub_100007A24()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100007A5C()
{
  uint64_t v1 = type metadata accessor for AgentDescriptor.Bundle();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v6 + 8, v5);
}

void sub_100007B18(int a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for AgentDescriptor.Bundle() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = *(void *)(v1 + v5);
  uint64_t v7 = *(void *)(v1 + ((v5 + 15) & 0xFFFFFFFFFFFFFFF8));

  sub_100005AF0(a1, v1 + v4, v6, v7);
}

unint64_t sub_100007BC0()
{
  unint64_t result = qword_10006EFE8;
  if (!qword_10006EFE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006EFE8);
  }
  return result;
}

_OWORD *sub_100007C14(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100007C24()
{
  return swift_release();
}

uint64_t sub_100007C2C(uint64_t (*a1)())
{
  return sub_100004484(a1, *(void *)(v1 + 16));
}

id sub_100007C34()
{
  uint64_t v1 = *(void *)(v0 + 16);
  long long v2 = (void *)(v1
                + OBJC_IVAR____TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver_didExitHandler);
  uint64_t v3 = *(void *)(v1
                 + OBJC_IVAR____TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver_didExitHandler);
  *long long v2 = 0;
  v2[1] = 0;
  sub_100007674(v3);
  unint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver_process);

  return [v4 removeObserver:v1];
}

uint64_t initializeBufferWithCopyOfBuffer for LocalSceneHost.Client(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_100007CD0(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_100007CDC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100007CFC(uint64_t result, int a2, int a3)
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

void type metadata accessor for audit_token_t(uint64_t a1)
{
}

void sub_100007D3C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

double sub_100007DA8(uint64_t a1, uint64_t a2)
{
  id v2 = sub_100007DF4(a1, a2);
  [v2 bounds];
  double v4 = v3;

  return v4;
}

id sub_100007DF4(uint64_t a1, uint64_t a2)
{
  id v2 = (void *)(*(uint64_t (**)(void))(a2 + 8))();
  double v4 = v3;

  id v5 = [v4 displayConfiguration];
  return v5;
}

id sub_100007E50()
{
  id v1 = *(id *)v0;
  id v2 = *(void **)(v0 + 8);
  id v3 = *(id *)v0;
  id v4 = v2;
  return v1;
}

uint64_t sub_100007E90()
{
  return sub_1000082F4(*v0);
}

uint64_t BSDeviceClass.description.getter(int a1)
{
  int v3 = a1 + 1;
  uint64_t result = 30324;
  switch(v3)
  {
    case 0:
      uint64_t result = 0x6E776F6E6B6E75;
      break;
    case 1:
      uint64_t result = 0x656E6F6870;
      break;
    case 2:
      uint64_t result = 6582128;
      break;
    case 3:
      uint64_t result = 6578544;
      break;
    case 4:
      return result;
    case 5:
      uint64_t result = 0x6863746177;
      break;
    default:
      v6[4] = v1;
      v6[5] = v2;
      strcpy((char *)v6, "unrecognized:");
      HIWORD(v6[1]) = -4864;
      v5._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v5);
      swift_bridgeObjectRelease();
      uint64_t result = v6[0];
      break;
  }
  return result;
}

uint64_t sub_100007FC8()
{
  return BSDeviceClass.description.getter(*v0);
}

uint64_t BSDeviceHomeButtonType.description.getter(uint64_t a1)
{
  uint64_t v3 = a1 + 1;
  uint64_t result = 0x6E776F6E6B6E75;
  switch(v3)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 0x79636167656CLL;
      break;
    case 2:
      uint64_t result = 1112036179;
      break;
    case 3:
      uint64_t result = 1701736302;
      break;
    default:
      v6[4] = v1;
      v6[5] = v2;
      strcpy((char *)v6, "unrecognized:");
      HIWORD(v6[1]) = -4864;
      v5._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v5);
      swift_bridgeObjectRelease();
      uint64_t result = v6[0];
      break;
  }
  return result;
}

uint64_t sub_1000080D4()
{
  return BSDeviceHomeButtonType.description.getter(*v0);
}

uint64_t UISDeviceIdiom.description.getter(uint64_t a1)
{
  uint64_t result = 6513005;
  switch(a1)
  {
    case 0:
      uint64_t result = 0x6669636570736E75;
      break;
    case 1:
      uint64_t result = 0x656E6F6870;
      break;
    case 2:
      uint64_t result = 6578544;
      break;
    case 3:
      uint64_t result = 30324;
      break;
    case 4:
      uint64_t result = 0x79616C50726163;
      break;
    case 5:
      uint64_t result = 0x6863746177;
      break;
    case 6:
      return result;
    case 7:
      uint64_t result = 0x6E6F69736976;
      break;
    case 8:
    case 9:
    case 10:
    case 11:
      uint64_t v3 = 0x656E696665646E75;
      goto LABEL_3;
    default:
      uint64_t v3 = 0x6E676F6365726E75;
LABEL_3:
      uint64_t v5 = v3;
      v4._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v4);
      swift_bridgeObjectRelease();
      uint64_t result = v5;
      break;
  }
  return result;
}

uint64_t sub_10000826C()
{
  return UISDeviceIdiom.description.getter(*v0);
}

__n128 initializeWithTake for DisplayCapabilities(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for DisplayCapabilities()
{
  return &type metadata for DisplayCapabilities;
}

uint64_t sub_1000082A4(void *a1)
{
  uint64_t v1 = (char *)[a1 deviceInfoIntegerValueForKey:UISDeviceContextDeviceIdiomKey];
  if ((unint64_t)(v1 - 1) > 6) {
    return -1;
  }
  else {
    return qword_10004FF90[(void)(v1 - 1)];
  }
}

uint64_t sub_1000082F4(void *a1)
{
  _StringGuts.grow(_:)(51);
  v2._countAndFlagsBits = 0x3D656369766544;
  v2._object = (void *)0xE700000000000000;
  String.append(_:)(v2);
  uint64_t result = (uint64_t)[a1 deviceInfoIntegerValueForKey:UISDeviceContextDeviceClassKey];
  if (result < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (result <= 0x7FFFFFFF)
  {
    v4._countAndFlagsBits = BSDeviceClass.description.getter(result);
    String.append(_:)(v4);
    swift_bridgeObjectRelease();
    v5._countAndFlagsBits = 0x3D6D6F696449202CLL;
    v5._object = (void *)0xE800000000000000;
    String.append(_:)(v5);
    sub_1000082A4(a1);
    type metadata accessor for UIUserInterfaceIdiom(0);
    _print_unlocked<A, B>(_:_:)();
    v6._countAndFlagsBits = 0x7542656D6F48202CLL;
    v6._object = (void *)0xED00003D6E6F7474;
    String.append(_:)(v6);
    v7._countAndFlagsBits = BSDeviceHomeButtonType.description.getter((uint64_t)[a1 deviceInfoIntegerValueForKey:UISDeviceContextHomeButtonTypeKey]);
    String.append(_:)(v7);
    swift_bridgeObjectRelease();
    v8._countAndFlagsBits = 0x72656E726F43202CLL;
    v8._object = (void *)0xEF3D737569646152;
    String.append(_:)(v8);
    [a1 deviceInfoFloatValueForKey:UISDeviceContextDeviceCornerRadiusKey];
    v9._countAndFlagsBits = Double.description.getter();
    String.append(_:)(v9);
    swift_bridgeObjectRelease();
    return 0;
  }
  __break(1u);
  return result;
}

void sub_1000084B8()
{
  uint64_t v0 = self;
  if (!objc_msgSend(v0, "uv_loadedInitialContext")) {
    [v0 defaultContext];
  }
  if (objc_msgSend(self, "uv_loadedInitialContext")) {
    goto LABEL_6;
  }
  id v1 = [self mainScreen];
  id v2 = [v1 displayConfiguration];

  if (v2)
  {
    [objc_allocWithZone((Class)UISDisplayContext) initWithDisplayConfiguration:v2];

LABEL_6:
    sub_100004408();
    return;
  }
  __break(1u);
}

uint64_t initializeBufferWithCopyOfBuffer for MainDisplay(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  Swift::String v4 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void destroy for MainDisplay(uint64_t a1)
{
  id v2 = *(void **)(a1 + 8);
}

uint64_t _s12PreviewShell19DisplayCapabilitiesVwca_0(uint64_t a1, uint64_t a2)
{
  Swift::String v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  Swift::String v7 = *(void **)(a2 + 8);
  Swift::String v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for MainDisplay(uint64_t a1, uint64_t a2)
{
  Swift::String v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t _s12PreviewShell19DisplayCapabilitiesVwet_0(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_100008728(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MainDisplay()
{
  return &type metadata for MainDisplay;
}

uint64_t sub_100008784()
{
  uint64_t v1 = v0;
  uint64_t v38 = type metadata accessor for ShellToHostMessage();
  __chkstk_darwin(v38);
  uint64_t v3 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Unreachable();
  uint64_t v37 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t updated = type metadata accessor for SceneUpdateSeed();
  uint64_t v8 = *(void *)(updated - 8);
  uint64_t v9 = __chkstk_darwin(updated);
  uint64_t v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v39 = (char *)&v34 - v12;
  SceneUpdateHandshake.updateSeed.getter();
  swift_beginAccess();
  uint64_t v13 = *(void *)(v0 + 24);
  if (*(void *)(v13 + 16) && (unint64_t v14 = sub_100009098((uint64_t)v39), (v15 & 1) != 0))
  {
    uint64_t v16 = *(void *)(v13 + 56);
    uint64_t v38 = v8;
    uint64_t v17 = *(void (**)(char *, uint64_t))(v16 + 8 * v14);
    swift_endAccess();
    uint64_t v35 = v17;
    swift_retain();
    Unreachable.init(_:diagnostics:file:line:column:function:)();
    sub_10000DEC8((unint64_t *)&qword_10006F130, (void (*)(uint64_t))&type metadata accessor for Unreachable);
    swift_allocError();
    uint64_t v36 = updated;
    uint64_t v18 = v37;
    uint64_t v19 = *(void (**)(uint64_t, char *, uint64_t))(v37 + 16);
    v19(v20, v6, v4);
    Promise.fail(with:)();
    swift_errorRelease();
    swift_beginAccess();
    uint64_t v21 = (uint64_t)v39;
    sub_100009800((uint64_t)v39);
    swift_endAccess();
    swift_release();
    sub_10000758C(&qword_10006F120);
    swift_allocError();
    v19(v22, v6, v4);
    uint64_t v23 = static Future.failed(dsoHandle:file:line:column:function:_:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v6, v4);
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v21, v36);
    swift_errorRelease();
  }
  else
  {
    swift_endAccess();
    sub_10000758C(&qword_10006F120);
    uint64_t v37 = static Future.create(dsoHandle:file:line:column:function:)();
    uint64_t v25 = v24;
    char v26 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
    v26(v11, (uint64_t)v39, updated);
    swift_beginAccess();
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v40 = *(void *)(v1 + 24);
    *(void *)(v1 + 24) = 0x8000000000000000;
    uint64_t v36 = v25;
    sub_10000C44C(v25, (uint64_t)v11, isUniquelyReferenced_nonNull_native);
    *(void *)(v1 + 24) = v40;
    swift_bridgeObjectRelease();
    uint64_t v35 = *(void (**)(char *, uint64_t))(v8 + 8);
    v35(v11, updated);
    swift_endAccess();
    uint64_t v28 = sub_10000758C(&qword_10006F128);
    long long v29 = &v3[*(int *)(v28 + 48)];
    uint64_t v30 = *(int *)(v28 + 64);
    SceneUpdateHandshake.preferences.getter();
    v26(v29, (uint64_t)v39, updated);
    *(void *)&v3[v30] = SceneUpdateHandshake.fenceHandle.getter();
    swift_storeEnumTagMultiPayload();
    SceneMessenger.send(message:)();
    sub_100008FC4((uint64_t)v3);
    id v31 = (void *)SceneUpdateHandshake.fenceHandle.getter();
    if (v31)
    {
      id v32 = v31;
      [v31 invalidate];
      swift_release();

      v35(v39, updated);
    }
    else
    {
      v35(v39, updated);
      swift_release();
    }
    return v37;
  }
  return v23;
}

uint64_t sub_100008D5C(uint64_t a1)
{
  swift_beginAccess();
  if (*(void *)(*(void *)(v1 + 24) + 16) && (sub_100009098(a1), (v3 & 1) != 0))
  {
    swift_endAccess();
    swift_retain();
    Promise.succeed(with:)();
    swift_release();
  }
  else
  {
    swift_endAccess();
  }
  swift_beginAccess();
  sub_100009800(a1);
  swift_endAccess();
  return swift_release();
}

uint64_t sub_100008E28()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for HostPreferenceResolver()
{
  return self;
}

uint64_t sub_100008E8C()
{
  return sub_100008784();
}

id sub_100008EB0(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for ShellToHostMessage();
  __chkstk_darwin(v4);
  id v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(int *)(sub_10000758C(&qword_10006F118) + 48);
  uint64_t v8 = type metadata accessor for PreviewPreferences();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v6, a1, v8);
  *(void *)&v6[v7] = a2;
  swift_storeEnumTagMultiPayload();
  id v9 = a2;
  SceneMessenger.send(message:)();
  sub_100008FC4((uint64_t)v6);
  return [v9 invalidate];
}

uint64_t sub_100008FC4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ShellToHostMessage();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100009020(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_100009414(a1, a2, v4);
}

unint64_t sub_100009098(uint64_t a1)
{
  type metadata accessor for SceneUpdateSeed();
  sub_10000DEC8(&qword_10006F138, (void (*)(uint64_t))&type metadata accessor for SceneUpdateSeed);
  uint64_t v2 = dispatch thunk of Hashable._rawHashValue(seed:)();
  return sub_1000094F8(a1, v2, (uint64_t (*)(void))&type metadata accessor for SceneUpdateSeed, &qword_10006F148, (void (*)(uint64_t))&type metadata accessor for SceneUpdateSeed, (uint64_t)&protocol conformance descriptor for SceneUpdateSeed);
}

unint64_t sub_10000916C(uint64_t a1)
{
  type metadata accessor for AgentDescriptor.Bundle();
  sub_10000DEC8(&qword_10006F150, (void (*)(uint64_t))&type metadata accessor for AgentDescriptor.Bundle);
  uint64_t v2 = dispatch thunk of Hashable._rawHashValue(seed:)();
  return sub_1000094F8(a1, v2, (uint64_t (*)(void))&type metadata accessor for AgentDescriptor.Bundle, &qword_10006F158, (void (*)(uint64_t))&type metadata accessor for AgentDescriptor.Bundle, (uint64_t)&protocol conformance descriptor for AgentDescriptor.Bundle);
}

unint64_t sub_100009240(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  if (a2)
  {
    Hasher._combine(_:)(1uLL);
    String.hash(into:)();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  Swift::Int v4 = Hasher._finalize()();

  return sub_100009698(a1, a2, v4);
}

unint64_t sub_1000092D4(uint64_t a1)
{
  type metadata accessor for ContentCategory();
  sub_10000DEC8(&qword_10006F180, (void (*)(uint64_t))&type metadata accessor for ContentCategory);
  uint64_t v2 = dispatch thunk of Hashable._rawHashValue(seed:)();
  return sub_1000094F8(a1, v2, (uint64_t (*)(void))&type metadata accessor for ContentCategory, &qword_10006F188, (void (*)(uint64_t))&type metadata accessor for ContentCategory, (uint64_t)&protocol conformance descriptor for ContentCategory);
}

unint64_t sub_1000093A8(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  Swift::Int v2 = Hasher._finalize()();

  return sub_100009764(a1, v2);
}

unint64_t sub_100009414(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
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
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1000094F8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), unint64_t *a4, void (*a5)(uint64_t), uint64_t a6)
{
  uint64_t v24 = a5;
  uint64_t v25 = a6;
  uint64_t v23 = a4;
  v21[1] = a1;
  uint64_t v8 = a3(0);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  BOOL v11 = (char *)v21 - v10;
  uint64_t v22 = v6;
  uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v13 = a2 & ~v12;
  v21[0] = v6 + 64;
  if ((*(void *)(v6 + 64 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v14 = ~v12;
    uint64_t v17 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
    uint64_t v16 = v9 + 16;
    char v15 = v17;
    uint64_t v18 = *(void *)(v16 + 56);
    do
    {
      v15(v11, *(void *)(v22 + 48) + v18 * v13, v8);
      sub_10000DEC8(v23, v24);
      char v19 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*(void (**)(char *, uint64_t))(v16 - 8))(v11, v8);
      if (v19) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v14;
    }
    while (((*(void *)(v21[0] + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) != 0);
  }
  return v13;
}

unint64_t sub_100009698(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = ~v5;
    uint64_t v10 = *(void *)(v3 + 48);
    do
    {
      BOOL v11 = (void *)(v10 + 16 * v6);
      uint64_t v12 = v11[1];
      if (v12)
      {
        if (a2)
        {
          BOOL v13 = *v11 == a1 && v12 == a2;
          if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
            return v6;
          }
        }
      }
      else if (!a2)
      {
        return v6;
      }
      unint64_t v6 = (v6 + 1) & v9;
    }
    while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
  }
  return v6;
}

unint64_t sub_100009764(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_100009800(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_100009098(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  uint64_t v12 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10000D1D8((uint64_t (*)(void))&type metadata accessor for SceneUpdateSeed, &qword_10006F140);
    uint64_t v7 = v12;
  }
  uint64_t v8 = *(void *)(v7 + 48);
  uint64_t updated = type metadata accessor for SceneUpdateSeed();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(updated - 8) + 8))(v8 + *(void *)(*(void *)(updated - 8) + 72) * v4, updated);
  uint64_t v10 = *(void *)(*(void *)(v7 + 56) + 8 * v4);
  sub_10000BC28(v4, v7, (uint64_t (*)(void))&type metadata accessor for SceneUpdateSeed, &qword_10006F138, (void (*)(uint64_t))&type metadata accessor for SceneUpdateSeed, (uint64_t)&protocol conformance descriptor for SceneUpdateSeed);
  *uint64_t v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_100009958(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_100009020(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10000D000();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_10000BA08(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_100009A28(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_100009240(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10000D470();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_10000BF08(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_100009AF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_10000916C(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v21 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_10000D624();
      uint64_t v9 = v21;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = type metadata accessor for AgentDescriptor.Bundle();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v6, v11);
    uint64_t v12 = *(void *)(v9 + 56);
    uint64_t v13 = type metadata accessor for LaunchPayload();
    uint64_t v20 = *(void *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 32))(a2, v12 + *(void *)(v20 + 72) * v6, v13);
    sub_10000C104(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a2;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = type metadata accessor for LaunchPayload();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a2;
    uint64_t v16 = 1;
  }

  return v14(v15, v16, 1, v17);
}

uint64_t sub_100009CC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_100009240(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10000DB84();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_10000BF08(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_100009D98(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t updated = type metadata accessor for SceneUpdateSeed();
  uint64_t v6 = *(void *)(updated - 8);
  __chkstk_darwin(updated);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_10000758C(&qword_10006F140);
  int v46 = a2;
  uint64_t v10 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = *(void *)(v11 + 64);
  char v42 = (void *)(v11 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  uint64_t v40 = v3;
  int64_t v41 = (unint64_t)(v13 + 63) >> 6;
  id v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v45 = v6;
  uint64_t v17 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v18 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v16)
    {
      unint64_t v22 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v41) {
      break;
    }
    uint64_t v25 = v42;
    unint64_t v26 = v42[v24];
    ++v20;
    if (!v26)
    {
      int64_t v20 = v24 + 1;
      if (v24 + 1 >= v41) {
        goto LABEL_34;
      }
      unint64_t v26 = v42[v20];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v40;
          if ((v46 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v26 = v42[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t v20 = v27 + 1;
            if (__OFADD__(v27, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v41) {
              goto LABEL_34;
            }
            unint64_t v26 = v42[v20];
            ++v27;
            if (v26) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v27;
      }
    }
LABEL_21:
    unint64_t v16 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_22:
    uint64_t v28 = *(void *)(v45 + 72);
    unint64_t v29 = *(void *)(v11 + 48) + v28 * v23;
    if (v46)
    {
      (*v17)(v8, v29, updated);
      uint64_t v30 = *(void *)(*(void *)(v11 + 56) + 8 * v23);
    }
    else
    {
      (*v43)(v8, v29, updated);
      uint64_t v30 = *(void *)(*(void *)(v11 + 56) + 8 * v23);
      swift_retain();
    }
    sub_10000DEC8(&qword_10006F138, (void (*)(uint64_t))&type metadata accessor for SceneUpdateSeed);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v31 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 48) + v28 * v21, v8, updated);
    *(void *)(*(void *)(v12 + 56) + 8 * v21) = v30;
    ++*(void *)(v12 + 16);
  }
  swift_release();
  uint64_t v3 = v40;
  uint64_t v25 = v42;
  if ((v46 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v11 + 32);
  if (v38 >= 64) {
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v25 = -1 << v38;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v12;
  return result;
}

uint64_t sub_10000A1BC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10000758C(&qword_10006F190);
  char v36 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
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
    unint64_t v22 = (void *)(v5 + 64);
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
    unint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
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
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10000A4D4(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for AgentDescriptor.Bundle();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_10000758C(&qword_10006F168);
  int v46 = a2;
  uint64_t v10 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = *(void *)(v11 + 64);
  char v42 = (void *)(v11 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  uint64_t v40 = v3;
  int64_t v41 = (unint64_t)(v13 + 63) >> 6;
  id v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v45 = v6;
  unint64_t v17 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v18 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v16)
    {
      unint64_t v22 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v41) {
      break;
    }
    char v25 = v42;
    unint64_t v26 = v42[v24];
    ++v20;
    if (!v26)
    {
      int64_t v20 = v24 + 1;
      if (v24 + 1 >= v41) {
        goto LABEL_34;
      }
      unint64_t v26 = v42[v20];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v40;
          if ((v46 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v26 = v42[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t v20 = v27 + 1;
            if (__OFADD__(v27, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v41) {
              goto LABEL_34;
            }
            unint64_t v26 = v42[v20];
            ++v27;
            if (v26) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v27;
      }
    }
LABEL_21:
    unint64_t v16 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_22:
    uint64_t v28 = *(void *)(v45 + 72);
    unint64_t v29 = *(void *)(v11 + 48) + v28 * v23;
    if (v46)
    {
      (*v17)(v8, v29, v5);
      uint64_t v30 = *(void *)(*(void *)(v11 + 56) + 8 * v23);
    }
    else
    {
      (*v43)(v8, v29, v5);
      uint64_t v30 = *(void *)(*(void *)(v11 + 56) + 8 * v23);
      swift_retain();
    }
    sub_10000DEC8(&qword_10006F150, (void (*)(uint64_t))&type metadata accessor for AgentDescriptor.Bundle);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v31 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 48) + v28 * v21, v8, v5);
    *(void *)(*(void *)(v12 + 56) + 8 * v21) = v30;
    ++*(void *)(v12 + 16);
  }
  swift_release();
  uint64_t v3 = v40;
  char v25 = v42;
  if ((v46 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v11 + 32);
  if (v38 >= 64) {
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v25 = -1 << v38;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v12;
  return result;
}

uint64_t sub_10000A8F8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10000758C(&qword_10006F178);
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v31 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v30 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v15 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v16 = v15 | (v13 << 6);
      }
      else
      {
        int64_t v17 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        if (v17 >= v30) {
          goto LABEL_36;
        }
        unint64_t v18 = v31[v17];
        ++v13;
        if (!v18)
        {
          int64_t v13 = v17 + 1;
          if (v17 + 1 >= v30) {
            goto LABEL_36;
          }
          unint64_t v18 = v31[v13];
          if (!v18)
          {
            int64_t v19 = v17 + 2;
            if (v19 >= v30)
            {
LABEL_36:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v29 = 1 << *(unsigned char *)(v5 + 32);
                if (v29 >= 64) {
                  bzero(v31, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v31 = -1 << v29;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v18 = v31[v19];
            if (!v18)
            {
              while (1)
              {
                int64_t v13 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_43;
                }
                if (v13 >= v30) {
                  goto LABEL_36;
                }
                unint64_t v18 = v31[v13];
                ++v19;
                if (v18) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v19;
          }
        }
LABEL_21:
        unint64_t v10 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v13 << 6);
      }
      uint64_t v20 = *(void *)(*(void *)(v5 + 56) + 8 * v16);
      long long v32 = *(_OWORD *)(*(void *)(v5 + 48) + 16 * v16);
      uint64_t v21 = *(void *)(*(void *)(v5 + 48) + 16 * v16 + 8);
      if ((a2 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      Hasher.init(_seed:)();
      if (v21)
      {
        Hasher._combine(_:)(1uLL);
        String.hash(into:)();
      }
      else
      {
        Hasher._combine(_:)(0);
      }
      uint64_t result = Hasher._finalize()();
      uint64_t v22 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v11 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v23) & ~*(void *)(v11 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_42;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v11 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v14 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      *(_OWORD *)(*(void *)(v7 + 48) + 16 * v14) = v32;
      *(void *)(*(void *)(v7 + 56) + 8 * v14) = v20;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10000AC0C(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v53 = type metadata accessor for LaunchPayload();
  uint64_t v5 = *(void *)(v53 - 8);
  __chkstk_darwin(v53);
  long long v52 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for AgentDescriptor.Bundle();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  unint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v2;
  sub_10000758C(&qword_10006F160);
  int v50 = a2;
  uint64_t v12 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v13 = v12;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v14 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v15 = *(void *)(v11 + 64);
  id v44 = (void *)(v11 + 64);
  if (v14 < 64) {
    uint64_t v16 = ~(-1 << v14);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & v15;
  char v42 = v2;
  int64_t v43 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v45 = v5 + 16;
  int v46 = (void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  uint64_t v48 = v5;
  uint64_t v49 = v8;
  unint64_t v18 = (void (**)(char *, unint64_t, uint64_t))(v8 + 32);
  long long v51 = (uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32);
  uint64_t v19 = v12 + 64;
  uint64_t result = swift_retain();
  int64_t v21 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v17)
    {
      unint64_t v23 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v24 = v23 | (v21 << 6);
      goto LABEL_22;
    }
    int64_t v25 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v43) {
      break;
    }
    unint64_t v26 = v44;
    unint64_t v27 = v44[v25];
    ++v21;
    if (!v27)
    {
      int64_t v21 = v25 + 1;
      if (v25 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v27 = v44[v21];
      if (!v27)
      {
        int64_t v28 = v25 + 2;
        if (v28 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v42;
          if ((v50 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v27 = v44[v28];
        if (!v27)
        {
          while (1)
          {
            int64_t v21 = v28 + 1;
            if (__OFADD__(v28, 1)) {
              goto LABEL_43;
            }
            if (v21 >= v43) {
              goto LABEL_34;
            }
            unint64_t v27 = v44[v21];
            ++v28;
            if (v27) {
              goto LABEL_21;
            }
          }
        }
        int64_t v21 = v28;
      }
    }
LABEL_21:
    unint64_t v17 = (v27 - 1) & v27;
    unint64_t v24 = __clz(__rbit64(v27)) + (v21 << 6);
LABEL_22:
    uint64_t v29 = *(void *)(v49 + 72);
    unint64_t v30 = *(void *)(v11 + 48) + v29 * v24;
    if (v50)
    {
      (*v18)(v10, v30, v7);
      uint64_t v31 = *(void *)(v11 + 56);
      uint64_t v32 = *(void *)(v48 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v48 + 32))(v52, v31 + v32 * v24, v53);
    }
    else
    {
      (*v46)(v10, v30, v7);
      uint64_t v33 = *(void *)(v11 + 56);
      uint64_t v32 = *(void *)(v48 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v48 + 16))(v52, v33 + v32 * v24, v53);
    }
    sub_10000DEC8(&qword_10006F150, (void (*)(uint64_t))&type metadata accessor for AgentDescriptor.Bundle);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v34 = -1 << *(unsigned char *)(v13 + 32);
    unint64_t v35 = result & ~v34;
    unint64_t v36 = v35 >> 6;
    if (((-1 << v35) & ~*(void *)(v19 + 8 * (v35 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v35) & ~*(void *)(v19 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v37 = 0;
      unint64_t v38 = (unint64_t)(63 - v34) >> 6;
      do
      {
        if (++v36 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v39 = v36 == v38;
        if (v36 == v38) {
          unint64_t v36 = 0;
        }
        v37 |= v39;
        uint64_t v40 = *(void *)(v19 + 8 * v36);
      }
      while (v40 == -1);
      unint64_t v22 = __clz(__rbit64(~v40)) + (v36 << 6);
    }
    *(void *)(v19 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    (*v18)((char *)(*(void *)(v13 + 48) + v29 * v22), (unint64_t)v10, v7);
    uint64_t result = (*v51)(*(void *)(v13 + 56) + v32 * v22, v52, v53);
    ++*(void *)(v13 + 16);
  }
  swift_release();
  uint64_t v3 = v42;
  unint64_t v26 = v44;
  if ((v50 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v41 = 1 << *(unsigned char *)(v11 + 32);
  if (v41 >= 64) {
    bzero(v26, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v26 = -1 << v41;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v13;
  return result;
}

uint64_t sub_10000B108(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10000758C((uint64_t *)&unk_10006F1A0);
  char v36 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
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
    unint64_t v22 = (void *)(v5 + 64);
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
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
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
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10000B420(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10000758C(&qword_10006F198);
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v31 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v30 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v15 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v16 = v15 | (v13 << 6);
      }
      else
      {
        int64_t v17 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        if (v17 >= v30) {
          goto LABEL_36;
        }
        unint64_t v18 = v31[v17];
        ++v13;
        if (!v18)
        {
          int64_t v13 = v17 + 1;
          if (v17 + 1 >= v30) {
            goto LABEL_36;
          }
          unint64_t v18 = v31[v13];
          if (!v18)
          {
            int64_t v19 = v17 + 2;
            if (v19 >= v30)
            {
LABEL_36:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v29 = 1 << *(unsigned char *)(v5 + 32);
                if (v29 >= 64) {
                  bzero(v31, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v31 = -1 << v29;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v18 = v31[v19];
            if (!v18)
            {
              while (1)
              {
                int64_t v13 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_43;
                }
                if (v13 >= v30) {
                  goto LABEL_36;
                }
                unint64_t v18 = v31[v13];
                ++v19;
                if (v18) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v19;
          }
        }
LABEL_21:
        unint64_t v10 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v13 << 6);
      }
      uint64_t v20 = *(void *)(*(void *)(v5 + 56) + 8 * v16);
      long long v32 = *(_OWORD *)(*(void *)(v5 + 48) + 16 * v16);
      uint64_t v21 = *(void *)(*(void *)(v5 + 48) + 16 * v16 + 8);
      if ((a2 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_retain();
      }
      Hasher.init(_seed:)();
      if (v21)
      {
        Hasher._combine(_:)(1uLL);
        String.hash(into:)();
      }
      else
      {
        Hasher._combine(_:)(0);
      }
      uint64_t result = Hasher._finalize()();
      uint64_t v22 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v11 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v23) & ~*(void *)(v11 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_42;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v11 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v14 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      *(_OWORD *)(*(void *)(v7 + 48) + 16 * v14) = v32;
      *(void *)(*(void *)(v7 + 56) + 8 * v14) = v20;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10000B734(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10000758C(&qword_10006F170);
  uint64_t result = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v33 = a2;
    int64_t v8 = 0;
    uint64_t v9 = (void *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v13 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v17 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v18 = v17 | (v8 << 6);
      }
      else
      {
        int64_t v19 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v19 >= v13) {
          goto LABEL_31;
        }
        unint64_t v20 = v9[v19];
        ++v8;
        if (!v20)
        {
          int64_t v8 = v19 + 1;
          if (v19 + 1 >= v13) {
            goto LABEL_31;
          }
          unint64_t v20 = v9[v8];
          if (!v20)
          {
            int64_t v21 = v19 + 2;
            if (v21 >= v13)
            {
LABEL_31:
              if ((v33 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_38;
              }
              uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
              if (v32 >= 64) {
                bzero((void *)(v5 + 64), ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v9 = -1 << v32;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v20 = v9[v21];
            if (!v20)
            {
              while (1)
              {
                int64_t v8 = v21 + 1;
                if (__OFADD__(v21, 1)) {
                  goto LABEL_40;
                }
                if (v8 >= v13) {
                  goto LABEL_31;
                }
                unint64_t v20 = v9[v8];
                ++v21;
                if (v20) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v21;
          }
        }
LABEL_21:
        unint64_t v12 = (v20 - 1) & v20;
        unint64_t v18 = __clz(__rbit64(v20)) + (v8 << 6);
      }
      uint64_t v22 = 8 * v18;
      Swift::UInt v23 = *(void *)(*(void *)(v5 + 48) + v22);
      uint64_t v24 = *(void *)(*(void *)(v5 + 56) + v22);
      Hasher.init(_seed:)();
      Hasher._combine(_:)(v23);
      uint64_t result = Hasher._finalize()();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v14 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v26) & ~*(void *)(v14 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v14 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      uint64_t v16 = 8 * v15;
      *(void *)(*(void *)(v7 + 48) + v16) = v23;
      *(void *)(*(void *)(v7 + 56) + v16) = v24;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_10000BA08(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v9 = Hasher._finalize()();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          unint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *unint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (void *)(v14 + 8 * v3);
          uint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *unint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_10000BBE0(int64_t a1, uint64_t a2)
{
  return sub_10000BC28(a1, a2, (uint64_t (*)(void))&type metadata accessor for AgentDescriptor.Bundle, &qword_10006F150, (void (*)(uint64_t))&type metadata accessor for AgentDescriptor.Bundle, (uint64_t)&protocol conformance descriptor for AgentDescriptor.Bundle);
}

unint64_t sub_10000BC28(int64_t a1, uint64_t a2, uint64_t (*a3)(void), unint64_t *a4, void (*a5)(uint64_t), uint64_t a6)
{
  id v44 = a5;
  uint64_t v45 = a6;
  int64_t v43 = a4;
  uint64_t v8 = a3(0);
  uint64_t v9 = *(void *)(v8 - 8);
  unint64_t result = __chkstk_darwin(v8);
  unint64_t v12 = (char *)&v39 - v11;
  uint64_t v13 = a2 + 64;
  uint64_t v14 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v15 = (a1 + 1) & ~v14;
  if (((1 << v15) & *(void *)(a2 + 64 + 8 * (v15 >> 6))) != 0)
  {
    uint64_t v16 = ~v14;
    unint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v13 + 8 * (v15 >> 6)) & (1 << v15)) != 0)
    {
      uint64_t v17 = (result + 1) & v16;
      uint64_t v41 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
      uint64_t v42 = v9 + 16;
      uint64_t v46 = *(void *)(v9 + 72);
      uint64_t v40 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
      do
      {
        uint64_t v18 = v13;
        int64_t v19 = v46 * v15;
        v41(v12, *(void *)(a2 + 48) + v46 * v15, v8);
        unint64_t v20 = v17;
        uint64_t v21 = v16;
        sub_10000DEC8(v43, v44);
        uint64_t v22 = dispatch thunk of Hashable._rawHashValue(seed:)();
        unint64_t result = (*v40)(v12, v8);
        uint64_t v23 = v22 & v21;
        uint64_t v16 = v21;
        uint64_t v17 = v20;
        if (a1 >= (uint64_t)v20)
        {
          if (v23 >= v20 && a1 >= v23)
          {
LABEL_17:
            uint64_t v26 = *(void *)(a2 + 48);
            unint64_t result = v26 + v46 * a1;
            unint64_t v27 = v26 + v19 + v46;
            if (v46 * a1 < v19 || result >= v27)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
              uint64_t v13 = v18;
            }
            else
            {
              BOOL v29 = v46 * a1 == v19;
              uint64_t v13 = v18;
              if (!v29) {
                unint64_t result = swift_arrayInitWithTakeBackToFront();
              }
            }
            uint64_t v30 = *(void *)(a2 + 56);
            uint64_t v31 = (void *)(v30 + 8 * a1);
            uint64_t v32 = (void *)(v30 + 8 * v15);
            if (a1 != v15 || (a1 = v15, v31 >= v32 + 1))
            {
              *uint64_t v31 = *v32;
              a1 = v15;
            }
            goto LABEL_5;
          }
        }
        else if (v23 >= v20 || a1 >= v23)
        {
          goto LABEL_17;
        }
        uint64_t v13 = v18;
LABEL_5:
        unint64_t v15 = (v15 + 1) & v16;
      }
      while (((*(void *)(v13 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) != 0);
    }
    char v33 = (uint64_t *)(v13 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v34 = *v33;
    uint64_t v35 = (-1 << a1) - 1;
  }
  else
  {
    char v33 = (uint64_t *)(v13 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v35 = *v33;
    uint64_t v34 = (-1 << a1) - 1;
  }
  *char v33 = v35 & v34;
  uint64_t v36 = *(void *)(a2 + 16);
  BOOL v37 = __OFSUB__(v36, 1);
  uint64_t v38 = v36 - 1;
  if (v37)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v38;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_10000BF08(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    unint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = *(void *)(*(void *)(a2 + 48) + 16 * v6 + 8);
        Hasher.init(_seed:)();
        if (v9)
        {
          Hasher._combine(_:)(1uLL);
          swift_bridgeObjectRetain();
          String.hash(into:)();
        }
        else
        {
          Hasher._combine(_:)(0);
        }
        Swift::Int v10 = Hasher._finalize()();
        unint64_t result = swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v8)
        {
          goto LABEL_14;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_14:
          uint64_t v12 = *(void *)(a2 + 48);
          uint64_t v13 = (_OWORD *)(v12 + 16 * v3);
          uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            *uint64_t v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          uint64_t v16 = (void *)(v15 + 8 * v3);
          uint64_t v17 = (void *)(v15 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 1))
          {
            *uint64_t v16 = *v17;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *uint64_t v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_10000C104(int64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AgentDescriptor.Bundle();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = __chkstk_darwin(v4);
  unint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a2 + 64;
  uint64_t v10 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v11 = (a1 + 1) & ~v10;
  if (((1 << v11) & *(void *)(a2 + 64 + 8 * (v11 >> 6))) != 0)
  {
    uint64_t v12 = ~v10;
    unint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v9 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
    {
      unint64_t v39 = (result + 1) & v12;
      uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v13 = v5 + 16;
      uint64_t v15 = *(void *)(v13 + 56);
      uint64_t v40 = v13;
      BOOL v37 = (uint64_t (**)(char *, uint64_t))(v13 - 8);
      uint64_t v38 = v14;
      uint64_t v36 = v12;
      do
      {
        uint64_t v16 = v9;
        uint64_t v17 = v15;
        int64_t v18 = v15 * v11;
        v38(v8, *(void *)(a2 + 48) + v15 * v11, v4);
        sub_10000DEC8(&qword_10006F150, (void (*)(uint64_t))&type metadata accessor for AgentDescriptor.Bundle);
        uint64_t v19 = dispatch thunk of Hashable._rawHashValue(seed:)();
        unint64_t result = (*v37)(v8, v4);
        unint64_t v20 = v19 & v12;
        if (a1 >= (uint64_t)v39)
        {
          if (v20 >= v39 && a1 >= (uint64_t)v20)
          {
LABEL_16:
            if (v17 * a1 < v18
              || *(void *)(a2 + 48) + v17 * a1 >= (unint64_t)(*(void *)(a2 + 48) + v18 + v17))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v17 * a1 != v18)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v23 = *(void *)(a2 + 56);
            uint64_t v24 = *(void *)(*(void *)(type metadata accessor for LaunchPayload() - 8) + 72);
            int64_t v25 = v24 * a1;
            unint64_t result = v23 + v24 * a1;
            int64_t v26 = v24 * v11;
            unint64_t v27 = v23 + v24 * v11 + v24;
            BOOL v28 = v25 < v26 || result >= v27;
            uint64_t v9 = v16;
            if (v28)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
              a1 = v11;
              uint64_t v12 = v36;
            }
            else
            {
              a1 = v11;
              uint64_t v12 = v36;
              if (v25 != v26)
              {
                unint64_t result = swift_arrayInitWithTakeBackToFront();
                a1 = v11;
              }
            }
            goto LABEL_5;
          }
        }
        else if (v20 >= v39 || a1 >= (uint64_t)v20)
        {
          goto LABEL_16;
        }
        uint64_t v9 = v16;
LABEL_5:
        unint64_t v11 = (v11 + 1) & v12;
        uint64_t v15 = v17;
      }
      while (((*(void *)(v9 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
    }
    BOOL v29 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v30 = *v29;
    uint64_t v31 = (-1 << a1) - 1;
  }
  else
  {
    BOOL v29 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v31 = *v29;
    uint64_t v30 = (-1 << a1) - 1;
  }
  *BOOL v29 = v31 & v30;
  uint64_t v32 = *(void *)(a2 + 16);
  BOOL v33 = __OFSUB__(v32, 1);
  uint64_t v34 = v32 - 1;
  if (v33)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v34;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_10000C44C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t updated = type metadata accessor for SceneUpdateSeed();
  uint64_t v9 = *(void *)(updated - 8);
  __chkstk_darwin(updated);
  unint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_100009098(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    unint64_t v20 = *v4;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];
      uint64_t result = swift_release();
      *(void *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_10000D1D8((uint64_t (*)(void))&type metadata accessor for SceneUpdateSeed, &qword_10006F140);
    goto LABEL_7;
  }
  sub_100009D98(v17, a3 & 1);
  unint64_t v23 = sub_100009098(a2);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_14:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  unint64_t v20 = *v4;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, updated);
  return sub_10000CE50(v14, (uint64_t)v11, a1, v20, (uint64_t (*)(void))&type metadata accessor for SceneUpdateSeed);
}

uint64_t sub_10000C624(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_100009020(a2, a3);
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
    sub_10000D000();
LABEL_7:
    char v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_unknownObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_10000A1BC(v15, a4 & 1);
  unint64_t v21 = sub_100009020(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  char v18 = (void *)*v5;
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

uint64_t sub_10000C794(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for AgentDescriptor.Bundle();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  char v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_10000916C(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    unint64_t v20 = *v4;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];
      uint64_t result = swift_release();
      *(void *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_10000D1D8((uint64_t (*)(void))&type metadata accessor for AgentDescriptor.Bundle, &qword_10006F168);
    goto LABEL_7;
  }
  sub_10000A4D4(v17, a3 & 1);
  unint64_t v23 = sub_10000916C(a2);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_14:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  unint64_t v20 = *v4;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  return sub_10000CE50(v14, (uint64_t)v11, a1, v20, (uint64_t (*)(void))&type metadata accessor for AgentDescriptor.Bundle);
}

uint64_t sub_10000C96C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_100009240(a2, a3);
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
    sub_10000D470();
LABEL_7:
    char v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_10000A8F8(v15, a4 & 1);
  unint64_t v21 = sub_100009240(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  char v18 = (void *)*v5;
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

uint64_t sub_10000CADC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for AgentDescriptor.Bundle();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  char v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_10000916C(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 < v17 || (a3 & 1) == 0)
  {
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_10000D624();
      goto LABEL_7;
    }
    sub_10000AC0C(v17, a3 & 1);
    unint64_t v28 = sub_10000916C(a2);
    if ((v18 & 1) == (v29 & 1))
    {
      unint64_t v14 = v28;
      unint64_t v20 = *v4;
      if (v18) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_10000CF0C(v14, (uint64_t)v11, a1, v20);
    }
LABEL_15:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v20 = *v4;
  if ((v18 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v21 = v20[7];
  uint64_t v22 = type metadata accessor for LaunchPayload();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v23 + 40);
  uint64_t v25 = v22;
  uint64_t v26 = v21 + *(void *)(v23 + 72) * v14;

  return v24(v26, a1, v25);
}

uint64_t sub_10000CCE0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_100009240(a2, a3);
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
    sub_10000DB84();
LABEL_7:
    char v18 = (void *)*v5;
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
  sub_10000B420(v15, a4 & 1);
  unint64_t v21 = sub_100009240(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  char v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
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

uint64_t sub_10000CE50(unint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t (*a5)(void))
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v9 = a4[6];
  uint64_t v10 = a5(0);
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1, a2, v10);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v12 = a4[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a4[2] = v14;
  }
  return result;
}

uint64_t sub_10000CF0C(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = type metadata accessor for AgentDescriptor.Bundle();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t v10 = a4[7];
  uint64_t v11 = type metadata accessor for LaunchPayload();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1, a3, v11);
  uint64_t v13 = a4[2];
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    a4[2] = v15;
  }
  return result;
}

void *sub_10000D000()
{
  uint64_t v1 = v0;
  sub_10000758C(&qword_10006F190);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
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
    uint64_t result = (void *)swift_unknownObjectRetain();
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

void *sub_10000D1B8()
{
  return sub_10000D1D8((uint64_t (*)(void))&type metadata accessor for AgentDescriptor.Bundle, &qword_10006F168);
}

void *sub_10000D1D8(uint64_t (*a1)(void), uint64_t *a2)
{
  uint64_t v4 = a1(0);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v7 = (char *)&v26 - v6;
  sub_10000758C(a2);
  unint64_t v27 = v2;
  uint64_t v8 = *v2;
  uint64_t v9 = static _DictionaryStorage.copy(original:)();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *unint64_t v27 = v10;
    return result;
  }
  uint64_t result = (void *)(v9 + 64);
  unint64_t v12 = (unint64_t)((1 << *(unsigned char *)(v10 + 32)) + 63) >> 6;
  if (v10 != v8 || (unint64_t)result >= v8 + 64 + 8 * v12) {
    uint64_t result = memmove(result, (const void *)(v8 + 64), 8 * v12);
  }
  int64_t v14 = 0;
  *(void *)(v10 + 16) = *(void *)(v8 + 16);
  uint64_t v15 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v16 = -1;
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  unint64_t v17 = v16 & *(void *)(v8 + 64);
  uint64_t v28 = v8 + 64;
  int64_t v29 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v30 = v5 + 32;
  uint64_t v31 = v5 + 16;
  while (1)
  {
    if (v17)
    {
      unint64_t v18 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v19 = v18 | (v14 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v29) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v23);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v23 + 1;
      if (v23 + 1 >= v29) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v28 + 8 * v14);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v17 = (v24 - 1) & v24;
    unint64_t v19 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_12:
    unint64_t v20 = *(void *)(v5 + 72) * v19;
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v7, *(void *)(v8 + 48) + v20, v4);
    uint64_t v21 = 8 * v19;
    uint64_t v22 = *(void *)(*(void *)(v8 + 56) + 8 * v19);
    (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(void *)(v10 + 48) + v20, v7, v4);
    *(void *)(*(void *)(v10 + 56) + v21) = v22;
    uint64_t result = (void *)swift_retain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v29) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v28 + 8 * v25);
  if (v24)
  {
    int64_t v14 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v14 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v14 >= v29) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v14);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10000D470()
{
  uint64_t v1 = v0;
  sub_10000758C(&qword_10006F178);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
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
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void *)(*(void *)(v2 + 56) + 8 * v15);
    *(_OWORD *)(*(void *)(v4 + 48) + 16 * v15) = *(_OWORD *)(*(void *)(v2 + 48) + 16 * v15);
    *(void *)(*(void *)(v4 + 56) + 8 * v15) = v16;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10000D624()
{
  uint64_t v42 = type metadata accessor for LaunchPayload();
  uint64_t v45 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  uint64_t v41 = (char *)&v32 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = type metadata accessor for AgentDescriptor.Bundle();
  uint64_t v44 = *(void *)(v40 - 8);
  __chkstk_darwin(v40);
  unint64_t v39 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000758C(&qword_10006F160);
  uint64_t v32 = v0;
  uint64_t v3 = *v0;
  uint64_t v4 = static _DictionaryStorage.copy(original:)();
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v46 = v4;
  if (!v5)
  {
    uint64_t result = (void *)swift_release();
    uint64_t v31 = v46;
    uint64_t v30 = v32;
LABEL_25:
    *uint64_t v30 = v31;
    return result;
  }
  uint64_t v6 = v4;
  uint64_t result = (void *)(v4 + 64);
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v6 + 32)) + 63) >> 6;
  if (v6 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
  {
    uint64_t result = memmove(result, (const void *)(v3 + 64), 8 * v8);
    uint64_t v6 = v46;
  }
  int64_t v9 = 0;
  *(void *)(v6 + 16) = *(void *)(v3 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v11 = -1;
  uint64_t v43 = v3;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v3 + 64);
  uint64_t v33 = v3 + 64;
  int64_t v34 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v13 = v45;
  uint64_t v14 = v44;
  uint64_t v37 = v45 + 16;
  uint64_t v38 = v44 + 16;
  uint64_t v35 = v45 + 32;
  uint64_t v36 = v44 + 32;
  unint64_t v15 = v39;
  uint64_t v16 = v40;
  uint64_t v17 = v42;
  uint64_t v18 = v46;
  while (1)
  {
    if (v12)
    {
      unint64_t v19 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      int64_t v47 = v9;
      unint64_t v20 = v19 | (v9 << 6);
      uint64_t v21 = v43;
      goto LABEL_9;
    }
    int64_t v26 = v9 + 1;
    uint64_t v21 = v43;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v26 >= v34) {
      goto LABEL_23;
    }
    unint64_t v27 = *(void *)(v33 + 8 * v26);
    int64_t v28 = v9 + 1;
    if (!v27)
    {
      int64_t v28 = v26 + 1;
      if (v26 + 1 >= v34) {
        goto LABEL_23;
      }
      unint64_t v27 = *(void *)(v33 + 8 * v28);
      if (!v27) {
        break;
      }
    }
LABEL_22:
    unint64_t v12 = (v27 - 1) & v27;
    int64_t v47 = v28;
    unint64_t v20 = __clz(__rbit64(v27)) + (v28 << 6);
LABEL_9:
    unint64_t v22 = *(void *)(v14 + 72) * v20;
    (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v15, *(void *)(v21 + 48) + v22, v16);
    unint64_t v23 = *(void *)(v13 + 72) * v20;
    unint64_t v24 = *(void *)(v21 + 56) + v23;
    int64_t v25 = v41;
    (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v41, v24, v17);
    (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(*(void *)(v18 + 48) + v22, v15, v16);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v13 + 32))(*(void *)(v18 + 56) + v23, v25, v17);
    int64_t v9 = v47;
  }
  int64_t v29 = v26 + 2;
  if (v29 >= v34)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v30 = v32;
    uint64_t v31 = v46;
    goto LABEL_25;
  }
  unint64_t v27 = *(void *)(v33 + 8 * v29);
  if (v27)
  {
    int64_t v28 = v29;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v28 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v28 >= v34) {
      goto LABEL_23;
    }
    unint64_t v27 = *(void *)(v33 + 8 * v28);
    ++v29;
    if (v27) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_10000D9CC()
{
  uint64_t v1 = v0;
  sub_10000758C((uint64_t *)&unk_10006F1A0);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
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
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

void *sub_10000DB84()
{
  uint64_t v1 = v0;
  sub_10000758C(&qword_10006F198);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
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
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void *)(*(void *)(v2 + 56) + 8 * v15);
    *(_OWORD *)(*(void *)(v4 + 48) + 16 * v15) = *(_OWORD *)(*(void *)(v2 + 48) + 16 * v15);
    *(void *)(*(void *)(v4 + 56) + 8 * v15) = v16;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
  }
  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10000DD38()
{
  uint64_t v1 = v0;
  sub_10000758C(&qword_10006F170);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v21 = __clz(__rbit64(v19));
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = v21 + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_10000DEC8(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_10000DF10(void *a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = [a1 scene];
  id v7 = [v6 settings];
  id v8 = [v7 displayConfiguration];

  if (v8)
  {
    id v9 = [v8 identity];
    uint64_t v10 = [v9 rootIdentity];

    unint64_t v21 = v10;
    __chkstk_darwin(v11);
    *(&v18 - 2) = v10;
    *(&v18 - 1) = v8;
    swift_beginAccess();
    sub_10000758C(&qword_10006F2B0);
    sub_10000E744();
    KeyValueMap.guaranteedValue(for:creatingIfNecessaryWith:)();
    swift_endAccess();
    id v12 = v22;
    [v22 addScene:v6];
  }
  else
  {
    static Logger.uv.getter();
    int64_t v13 = v6;
    unint64_t v14 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v19 = v3;
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      int64_t v18 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 138412290;
      int64_t v20 = v13;
      uint64_t v17 = v13;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *int64_t v18 = v13;

      uint64_t v3 = v19;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Cannot bind FBScene lacking display configuration: %@", v16, 0xCu);
      sub_10000758C(&qword_10006F2A8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      unint64_t v14 = v13;
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

id sub_10000E25C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.uv.getter();
  uint64_t v11 = a1;
  id v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v23 = v3;
    uint64_t v14 = swift_slowAlloc();
    id v22 = a3;
    os_log_type_t v15 = (uint8_t *)v14;
    int64_t v18 = (void *)swift_slowAlloc();
    uint64_t v19 = v15;
    uint64_t v20 = v8;
    *(_DWORD *)os_log_type_t v15 = 138412290;
    uint64_t v21 = a2;
    int64_t v24 = v11;
    uint64_t v16 = v11;
    uint64_t v8 = v20;
    a2 = v21;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *int64_t v18 = v11;

    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Adding a new root window binder for local scene, with root display identity: %@", v19, 0xCu);
    sub_10000758C(&qword_10006F2A8);
    swift_arrayDestroy();
    swift_slowDealloc();
    a3 = v22;
    swift_slowDealloc();
  }
  else
  {

    id v12 = v11;
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  id result = [objc_allocWithZone((Class)UIRootWindowScenePresentationBinder) initWithPriority:0 displayConfiguration:a2];
  *a3 = result;
  return result;
}

uint64_t sub_10000E4A8()
{
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for SceneBinder.DefaultBinder()
{
  return self;
}

void sub_10000E504(void *a1)
{
}

uint64_t sub_10000E528()
{
  if (qword_10006ECA0 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for PreviewShellPluginRegistry();
  sub_10000E620(v0, (uint64_t)qword_100074188);
  swift_beginAccess();
  PreviewShellPluginRegistry.sceneBinder.getter();
  swift_endAccess();
  if (v5) {
    return sub_10000E710(&v4, (uint64_t)&qword_10006F1B0);
  }
  uint64_t v2 = type metadata accessor for SceneBinder.DefaultBinder();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = &_swiftEmptyDictionarySingleton;
  qword_10006F1C8 = v2;
  qword_10006F1D0 = sub_10000E658();
  qword_10006F1B0 = v3;
  return sub_10000E6B0((uint64_t)&v4);
}

uint64_t sub_10000E620(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_10000E658()
{
  unint64_t result = qword_10006F298;
  if (!qword_10006F298)
  {
    type metadata accessor for SceneBinder.DefaultBinder();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006F298);
  }
  return result;
}

uint64_t sub_10000E6B0(uint64_t a1)
{
  uint64_t v2 = sub_10000758C(&qword_10006F2A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000E710(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

id sub_10000E728@<X0>(void *a1@<X8>)
{
  return sub_10000E25C(*(void **)(v1 + 16), *(void *)(v1 + 24), a1);
}

unint64_t sub_10000E744()
{
  unint64_t result = qword_10006F2B8;
  if (!qword_10006F2B8)
  {
    sub_10000762C(&qword_10006F2B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006F2B8);
  }
  return result;
}

uint64_t sub_10000E7A0()
{
  return sub_1000116A8();
}

uint64_t sub_10000E7C4(int a1)
{
  return sub_10000E814(a1, (uint64_t (*)(uint64_t, uint64_t))&dispatch thunk of CanvasContentHost.prepareForRelaunch());
}

uint64_t sub_10000E7EC(int a1)
{
  return sub_10000E814(a1, (uint64_t (*)(uint64_t, uint64_t))&dispatch thunk of CanvasContentHost.stop());
}

uint64_t sub_10000E814(int a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  swift_beginAccess();
  sub_10000FD34(v2 + 56, (uint64_t)&v11);
  if (!v12)
  {
    uint64_t v8 = &qword_10006F3A0;
    uint64_t v9 = &v11;
LABEL_6:
    sub_10000FD9C((uint64_t)v9, v8);
    sub_10000758C(&qword_10006F000);
    return static Future<A>.succeeded(dsoHandle:file:line:column:function:)();
  }
  sub_10000E710(&v11, (uint64_t)v14);
  int v17 = v13;
  if (v13 != a1)
  {
    uint64_t v8 = &qword_10006F3A8;
    uint64_t v9 = (long long *)v14;
    goto LABEL_6;
  }
  uint64_t v5 = v15;
  uint64_t v6 = v16;
  sub_10000FC3C(v14, v15);
  uint64_t v7 = a2(v5, v6);
  sub_10000FD9C((uint64_t)v14, &qword_10006F3A8);
  return v7;
}

uint64_t sub_10000E94C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = v7;
  uint64_t v28 = a6;
  uint64_t v29 = a7;
  uint64_t v26 = a4;
  uint64_t v27 = a5;
  uint64_t v24 = a1;
  uint64_t v25 = a3;
  uint64_t v30 = type metadata accessor for ExecutionLane();
  uint64_t v10 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for PreviewAgentConnector();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a2, v13);
  unint64_t v17 = (*(unsigned __int8 *)(v14 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v8;
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v18 + v17, v16, v13);
  swift_retain_n();
  sub_100011920(v24, a2, v25, v26, v27, v28, v29, (uint64_t)sub_10000FA80, v8, (uint64_t)sub_10000FB54, v18);
  swift_release();
  swift_release();
  static ExecutionLane.main.getter();
  swift_retain();
  Future.observeSuccess(on:_:)();
  swift_release();
  uint64_t v19 = *(void (**)(char *, uint64_t))(v10 + 8);
  uint64_t v20 = v30;
  v19(v12, v30);
  swift_retain();
  static ExecutionLane.any.getter();
  type metadata accessor for PropertyList();
  uint64_t v21 = Future.mapSuccess<A>(dsoHandle:file:line:column:function:on:_:)();
  swift_release();
  swift_release();
  v19(v12, v20);
  return v21;
}

uint64_t sub_10000EC58@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_100038CB8(a1);
  sub_10000FC3C(a1, a1[3]);
  uint64_t v6 = (void *)dispatch thunk of CanvasContentHost.viewController.getter();
  swift_beginAccess();
  uint64_t v7 = *(void *)(a2 + 80);
  if (!v7)
  {

    goto LABEL_5;
  }
  uint64_t v8 = sub_10000FC3C((void *)(a2 + 56), v7);
  uint64_t v9 = *(void *)(v7 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v9 + 16))(v11);
  uint64_t v12 = (void *)dispatch thunk of CanvasContentHost.viewController.getter();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v7);

  if (v6 != v12)
  {
LABEL_5:
    uint64_t v13 = (unsigned int *)&enum case for SceneUpdateTiming.async(_:);
    goto LABEL_6;
  }
  uint64_t v13 = (unsigned int *)&enum case for SceneUpdateTiming.fenced(_:);
LABEL_6:
  uint64_t v14 = *v13;
  uint64_t updated = type metadata accessor for SceneUpdateTiming();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(updated - 8) + 104))(a3, v14, updated);
}

uint64_t sub_10000EE20(void *a1, uint64_t a2)
{
  sub_100038DE8(a1);
  sub_10000FC3C(a1, a1[3]);
  long long v4 = (void *)dispatch thunk of CanvasContentHost.viewController.getter();
  swift_beginAccess();
  uint64_t v5 = *(void *)(a2 + 80);
  if (!v5)
  {

    if (!*(void *)(a2 + 80)) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  uint64_t v6 = sub_10000FC3C((void *)(a2 + 56), *(void *)(a2 + 80));
  uint64_t v7 = *(void *)(v5 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = &v12[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *))(v7 + 16))(v9);
  uint64_t v10 = (void *)dispatch thunk of CanvasContentHost.viewController.getter();
  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v5);

  if (v4 != v10)
  {
    if (!*(void *)(a2 + 80))
    {
LABEL_5:
      sub_10000FC3C(a1, a1[3]);
      dispatch thunk of CanvasContentHost.didActivate()();
      goto LABEL_6;
    }
LABEL_4:
    sub_10000FC80(a2 + 56, (uint64_t)v13);
    sub_10000FC3C(v13, v13[3]);
    dispatch thunk of CanvasContentHost.didDeactivate()();
    sub_10000FCE4((uint64_t)v13);
    goto LABEL_5;
  }
LABEL_6:
  sub_10000FC80((uint64_t)a1, (uint64_t)v13);
  int v14 = PreviewAgentConnector.pid.getter();
  swift_beginAccess();
  sub_10000FE48((uint64_t)v13, a2 + 56, &qword_10006F3A0);
  return swift_endAccess();
}

uint64_t sub_10000F04C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PropertyList();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = sub_10000758C(&qword_10006F390);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for HostIdentity();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = type metadata accessor for HostedPreviewReply();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getObjectType();
  dispatch thunk of PreviewShellScene.hostIdentity.getter();
  uint64_t v11 = type metadata accessor for SceneLayout();
  uint64_t v12 = *(void *)(v11 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v5, a1, v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v5, 0, 1, v11);
  type metadata accessor for CanvasUpdater.UpdateResult(0);
  CanvasUpdateOutput.controlDescriptions.getter();
  CanvasUpdateOutput.controlStates.getter();
  CanvasUpdateOutput.hostedOutput.getter();
  HostedPreviewReply.init(hostIdentity:sceneLayout:controlDescriptions:controlStates:contentPayload:)();
  sub_10000FBF4(&qword_10006F398, 255, (void (*)(uint64_t))&type metadata accessor for HostedPreviewReply);
  PropertyListRepresentable.propertyList.getter();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_10000F320()
{
  uint64_t v1 = sub_10000758C(&qword_10006F3B0);
  uint64_t v19 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000758C(&qword_10006F3B8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000758C(&qword_10006F000);
  uint64_t v18 = static Future.create(dsoHandle:file:line:column:function:)();
  uint64_t v8 = v7;
  swift_beginAccess();
  if (*(void *)(v0 + 80))
  {
    sub_10000FC80(v0 + 56, (uint64_t)v20);
    sub_10000E710(v20, (uint64_t)v21);
    sub_10000FC3C(v21, v21[3]);
    dispatch thunk of CanvasContentHost.confirmReadyForDisplayAfterAsyncResize()();
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = sub_10000FEAC;
    *(void *)(v9 + 24) = v8;
    swift_retain();
    Future.observeSuccess(_:)();
    swift_release();
    swift_release();
    sub_10000FCE4((uint64_t)v21);
  }
  uint64_t v10 = swift_allocBox();
  uint64_t v12 = v11;
  uint64_t v13 = type metadata accessor for CancellationToken();
  uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v17(v12, 1, 1, v13);
  EventStream.Sink.eventStream.getter();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v8;
  *(void *)(v14 + 24) = v10;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = sub_10000FE38;
  *(void *)(v15 + 24) = v14;
  swift_retain();
  swift_retain();
  EventStream.observe(dsoHandle:file:line:column:function:_:)();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v3, v1);
  v17((uint64_t)v6, 0, 1, v13);
  swift_beginAccess();
  sub_10000FE48((uint64_t)v6, v12, &qword_10006F3B8);
  swift_release();
  return v18;
}

uint64_t sub_10000F6F0()
{
  return Promise<A>.trySucceed()();
}

uint64_t sub_10000F754()
{
  uint64_t v0 = type metadata accessor for CancellationToken();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = &v6[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = swift_projectBox();
  Promise<A>.trySucceed()();
  swift_beginAccess();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v4, 1, v0);
  if (!result)
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
    CancellationToken.cancel(dsoHandle:file:line:column:function:)();
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v1 + 8))(v3, v0);
  }
  return result;
}

uint64_t sub_10000F8DC()
{
  swift_release();

  swift_unknownObjectRelease();
  swift_release();
  sub_10000FD9C(v0 + 56, &qword_10006F3A0);
  swift_release();

  return _swift_deallocClassInstance(v0, 112, 7);
}

uint64_t type metadata accessor for HostedPreviewCanvas()
{
  return self;
}

uint64_t sub_10000F968(int a1)
{
  return sub_10000E814(a1, (uint64_t (*)(uint64_t, uint64_t))&dispatch thunk of CanvasContentHost.prepareForRelaunch());
}

uint64_t sub_10000F9B0(int a1)
{
  return sub_10000E814(a1, (uint64_t (*)(uint64_t, uint64_t))&dispatch thunk of CanvasContentHost.stop());
}

uint64_t sub_10000F9F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_10000E94C(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_10000FA1C()
{
  return swift_retain();
}

uint64_t sub_10000FA28(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_10000FBF4(&qword_10006F388, a2, (void (*)(uint64_t))type metadata accessor for HostedPreviewCanvas);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10000FA80@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10000EC58(a1, v2, a2);
}

uint64_t sub_10000FA88()
{
  uint64_t v1 = type metadata accessor for PreviewAgentConnector();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10000FB54(void *a1)
{
  type metadata accessor for PreviewAgentConnector();
  uint64_t v3 = *(void *)(v1 + 16);

  return sub_10000EE20(a1, v3);
}

uint64_t sub_10000FBC8()
{
  return EventStream.Sink.send<A>()();
}

uint64_t sub_10000FBEC(uint64_t a1)
{
  return sub_10000F04C(a1);
}

uint64_t sub_10000FBF4(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

void *sub_10000FC3C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000FC80(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000FCE4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000FD34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000758C(&qword_10006F3A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000FD9C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000758C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000FDF8()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000FE38()
{
  return sub_10000F754();
}

uint64_t sub_10000FE40(uint64_t a1)
{
  return sub_100026398(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_10000FE48(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000758C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000FEAC()
{
  return sub_10000F6F0();
}

uint64_t sub_10000FEB4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000FEEC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

id sub_10000FF18()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.uv.getter();
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "DisplayTransformer created", v8, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v9 = (objc_class *)type metadata accessor for DisplayTransformer();
  v11.receiver = v1;
  v11.super_class = v9;
  return [super init];
}

id sub_10001014C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DisplayTransformer();
  return [super dealloc];
}

uint64_t type metadata accessor for DisplayTransformer()
{
  return self;
}

uint64_t sub_1000101A4(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = __CocoaSet.member(for:)();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_100011014();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = __CocoaSet.count.getter();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_100010424(v7, result + 1);
    uint64_t v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_10001060C();
      uint64_t v23 = v28;
    }
    else
    {
      uint64_t v23 = (void *)v22;
      id v24 = v8;
    }
    sub_1000108AC((uint64_t)v8, v23);
    *uint64_t v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v11 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v12 = NSObject._rawHashValue(seed:)(v11);
    uint64_t v13 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v14 = v12 & ~v13;
    if ((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      sub_100011014();
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = static NSObject.== infix(_:_:)();

      if (v16)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v20 = *(void **)(*(void *)(*v3 + 48) + 8 * v14);
        *a1 = v20;
        id v21 = v20;
        return 0;
      }
      uint64_t v17 = ~v13;
      while (1)
      {
        unint64_t v14 = (v14 + 1) & v17;
        if (((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0) {
          break;
        }
        id v18 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
        char v19 = static NSObject.== infix(_:_:)();

        if (v19) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    id v8 = a2;
    sub_100010930((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

Swift::Int sub_100010424(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_10000758C((uint64_t *)&unk_10006F460);
    uint64_t v2 = static _SetStorage.convert(_:capacity:)();
    uint64_t v14 = v2;
    __CocoaSet.makeIterator()();
    if (__CocoaSet.Iterator.next()())
    {
      sub_100011014();
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_10001060C();
          uint64_t v2 = v14;
        }
        Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v2 + 40));
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (__CocoaSet.Iterator.next()());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v2;
}

uint64_t sub_10001060C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_10000758C((uint64_t *)&unk_10006F460);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = NSObject._rawHashValue(seed:)(*(void *)(v4 + 40));
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v25 = v22 == v24;
          if (v22 == v24) {
            unint64_t v22 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

unint64_t sub_1000108AC(uint64_t a1, void *a2)
{
  NSObject._rawHashValue(seed:)(a2[5]);
  unint64_t result = _HashTable.nextHole(atOrAfter:)();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

void sub_100010930(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_10001060C();
  }
  else
  {
    if (v7 > v6)
    {
      sub_100010AA8();
      goto LABEL_14;
    }
    sub_100010C54();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = NSObject._rawHashValue(seed:)(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_100011014();
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = static NSObject.== infix(_:_:)();

    if (v12)
    {
LABEL_13:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = static NSObject.== infix(_:_:)();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

id sub_100010AA8()
{
  uint64_t v1 = v0;
  sub_10000758C((uint64_t *)&unk_10006F460);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
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

uint64_t sub_100010C54()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_10000758C((uint64_t *)&unk_10006F460);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v28 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    Swift::Int v19 = *(void *)(v4 + 40);
    id v20 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = NSObject._rawHashValue(seed:)(v19);
    uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v13 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v20;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v28;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_100010ED0(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  sub_100011014();
  sub_100011054();
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return v10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4) {
      return v10;
    }
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        uint64_t v6 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)();
        sub_1000101A4(&v9, v6);
      }
    }
    else
    {
      uint64_t v7 = (void **)(a1 + 32);
      do
      {
        unint64_t v8 = *v7++;
        sub_1000101A4(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_100011014()
{
  unint64_t result = qword_10006F450;
  if (!qword_10006F450)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10006F450);
  }
  return result;
}

unint64_t sub_100011054()
{
  unint64_t result = qword_10006F458;
  if (!qword_10006F458)
  {
    sub_100011014();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006F458);
  }
  return result;
}

uint64_t type metadata accessor for SimDisplay()
{
  return self;
}

id sub_1000112E4()
{
  uint64_t v1 = *v0 + OBJC_IVAR____TtC12PreviewShell10SimDisplay_capabilities;
  id v2 = *(id *)v1;
  uint64_t v3 = *(void **)(v1 + 8);
  id v4 = *(id *)v1;
  id v5 = v3;
  return v2;
}

id sub_100011334(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  id v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v40 = *(void *)(v10 - 8);
  uint64_t v41 = v10;
  __chkstk_darwin(v10);
  int64_t v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRelease();
  unint64_t v13 = &v5[OBJC_IVAR____TtC12PreviewShell10SimDisplay_name];
  *(void *)unint64_t v13 = a1;
  *((void *)v13 + 1) = a2;
  *(_DWORD *)&v5[OBJC_IVAR____TtC12PreviewShell10SimDisplay_displayID] = a3;
  unint64_t v14 = v5;
  sub_1000084B8();
  int64_t v16 = v15;
  char v18 = v17;
  id v20 = v19;
  id v21 = v16;
  id v22 = a4;
  id v23 = [v21 displayEdgeInfo];
  if (!v23) {
    id v23 = [objc_allocWithZone((Class)UISApplicationSupportDisplayEdgeInfo) init];
  }
  id v24 = [v21 exclusionArea];
  id v25 = [objc_allocWithZone((Class)UISDisplayContext) initWithDisplayConfiguration:v22 displayEdgeInfo:v23 exclusionArea:v24];

  BOOL v26 = &v14[OBJC_IVAR____TtC12PreviewShell10SimDisplay_capabilities];
  *(void *)BOOL v26 = v20;
  *((void *)v26 + 1) = v25;
  v26[16] = v18 & 1;
  static Logger.uv.getter();
  uint64_t v27 = v14;
  uint64_t v28 = v12;
  uint64_t v29 = Logger.logObject.getter();
  os_log_type_t v30 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v44 = swift_slowAlloc();
    *(_DWORD *)uint64_t v31 = 67240450;
    LODWORD(v43) = a3;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v31 + 8) = 2082;
    uint64_t v39 = v31 + 10;
    uint64_t v32 = (void *)*((void *)v26 + 1);
    id v33 = *(id *)v26;
    id v34 = v32;
    uint64_t v35 = sub_1000082F4(v33);
    unint64_t v37 = v36;

    uint64_t v43 = sub_100013F74(v35, v37, &v44);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "SimDisplay %{public}u capabilities: <%{public}s>", (uint8_t *)v31, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v40 + 8))(v28, v41);
  v45.receiver = v27;
  v45.super_class = ObjectType;
  return [super init];
}

uint64_t sub_1000116A8()
{
  if (*(void *)(v0 + 16))
  {
    *(void *)&v15[0] = *(void *)(v0 + 16);
    type metadata accessor for CanvasUpdater.UpdateDelegate(0);
    sub_100014AC0(&qword_10006F688, (void (*)(uint64_t))type metadata accessor for CanvasUpdater.UpdateDelegate);
    Invalidatable.invalidate(dsoHandle:file:line:column:function:)();
  }
  *(void *)(v0 + 16) = 0;
  swift_release();
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = v1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain_n();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_7;
    }
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v11 >= v6) {
      goto LABEL_27;
    }
    unint64_t v12 = *(void *)(v2 + 8 * v11);
    ++v8;
    if (!v12)
    {
      int64_t v8 = v11 + 1;
      if (v11 + 1 >= v6) {
        goto LABEL_27;
      }
      unint64_t v12 = *(void *)(v2 + 8 * v8);
      if (!v12)
      {
        int64_t v8 = v11 + 2;
        if (v11 + 2 >= v6) {
          goto LABEL_27;
        }
        unint64_t v12 = *(void *)(v2 + 8 * v8);
        if (!v12)
        {
          int64_t v8 = v11 + 3;
          if (v11 + 3 >= v6) {
            goto LABEL_27;
          }
          unint64_t v12 = *(void *)(v2 + 8 * v8);
          if (!v12)
          {
            int64_t v8 = v11 + 4;
            if (v11 + 4 >= v6) {
              goto LABEL_27;
            }
            unint64_t v12 = *(void *)(v2 + 8 * v8);
            if (!v12) {
              break;
            }
          }
        }
      }
    }
LABEL_26:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v8 << 6);
LABEL_7:
    sub_10000FC80(*(void *)(v1 + 56) + 40 * v10, (uint64_t)v15);
    sub_10000E710(v15, (uint64_t)v14);
    sub_10000FC3C(v14, v14[3]);
    dispatch thunk of CanvasContentProviderBox.invalidateProviders()();
    uint64_t result = sub_10000FCE4((uint64_t)v14);
  }
  int64_t v13 = v11 + 5;
  if (v13 >= v6)
  {
LABEL_27:
    swift_release();
    return swift_bridgeObjectRelease();
  }
  unint64_t v12 = *(void *)(v2 + 8 * v13);
  if (v12)
  {
    int64_t v8 = v13;
    goto LABEL_26;
  }
  while (1)
  {
    int64_t v8 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v8 >= v6) {
      goto LABEL_27;
    }
    unint64_t v12 = *(void *)(v2 + 8 * v8);
    ++v13;
    if (v12) {
      goto LABEL_26;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_100011920(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  unint64_t v12 = v11;
  uint64_t v52 = a8;
  uint64_t v58 = a7;
  uint64_t v54 = a6;
  uint64_t v53 = a5;
  uint64_t v57 = a2;
  uint64_t v61 = type metadata accessor for ExecutionLane();
  uint64_t v60 = *(void *)(v61 - 8);
  __chkstk_darwin(v61);
  v59 = (char *)&v47 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v62 = (void (*)(uint64_t))type metadata accessor for ContentKey();
  uint64_t v55 = *((void *)v62 - 1);
  __chkstk_darwin(v62);
  char v18 = (char *)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = type metadata accessor for Logger();
  uint64_t v50 = *(void *)(v51 - 8);
  __chkstk_darwin(v51);
  v63 = (char *)&v47 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  assertMainThread(file:line:column:function:)();
  uint64_t v65 = a3;
  uint64_t v66 = a4;
  v67 = v12;
  swift_beginAccess();
  sub_10000758C(&qword_10006F678);
  sub_100013E2C();
  KeyValueMap.guaranteedValue(for:creatingIfNecessaryWith:)();
  swift_endAccess();
  sub_10000FC80((uint64_t)v73, (uint64_t)v70);
  uint64_t v21 = v12[3];
  uint64_t v20 = v12[4];
  uint64_t updated = type metadata accessor for CanvasUpdater.UpdateDelegate(0);
  swift_allocObject();
  swift_unknownObjectRetain();
  swift_retain();
  uint64_t v23 = sub_1000148A4((uint64_t)v70, v21, v20, a10, a11);
  swift_unknownObjectRelease();
  swift_release();
  if (v12[2])
  {
    v70[0] = v12[2];
    sub_100014AC0(&qword_10006F688, (void (*)(uint64_t))type metadata accessor for CanvasUpdater.UpdateDelegate);
    Invalidatable.invalidate(dsoHandle:file:line:column:function:)();
  }
  uint64_t v56 = a9;
  v12[2] = v23;
  swift_retain();
  swift_release();
  id v24 = v63;
  static Logger.uv.getter();
  uint64_t v25 = v55;
  BOOL v26 = v62;
  (*(void (**)(char *, uint64_t, void (*)(uint64_t)))(v55 + 16))(v18, a1, v62);
  sub_10000FC80((uint64_t)v73, (uint64_t)v70);
  swift_retain_n();
  uint64_t v27 = Logger.logObject.getter();
  os_log_type_t v28 = static os_log_type_t.default.getter();
  int v49 = v28;
  BOOL v29 = os_log_type_enabled(v27, v28);
  uint64_t v64 = updated;
  if (v29)
  {
    uint64_t v30 = swift_slowAlloc();
    uint64_t v48 = swift_slowAlloc();
    uint64_t v69 = v48;
    *(_DWORD *)uint64_t v30 = 136446722;
    swift_getObjectType();
    uint64_t v31 = dispatch thunk of PreviewShellScene.identifier.getter();
    uint64_t v68 = sub_100013F74(v31, v32, &v69);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 12) = 2082;
    sub_100014AC0(&qword_10006F6A0, (void (*)(uint64_t))&type metadata accessor for ContentKey);
    id v33 = v62;
    uint64_t v34 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v68 = sub_100013F74(v34, v35, &v69);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, void (*)(uint64_t)))(v25 + 8))(v18, v33);
    *(_WORD *)(v30 + 22) = 2082;
    sub_10000FC3C(v70, v71);
    uint64_t v36 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v68 = sub_100013F74(v36, v37, &v69);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_10000FCE4((uint64_t)v70);
    _os_log_impl((void *)&_mh_execute_header, v27, (os_log_type_t)v49, "Canvas %{public}s performing update for %{public}s using %{public}s", (uint8_t *)v30, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v50 + 8))(v63, v51);
  }
  else
  {
    swift_release_n();
    (*(void (**)(char *, void (*)(uint64_t)))(v25 + 8))(v18, v26);
    sub_10000FCE4((uint64_t)v70);

    (*(void (**)(char *, uint64_t))(v50 + 8))(v24, v51);
  }
  uint64_t v38 = v52;
  sub_10000758C(&qword_10006F690);
  v63 = (char *)static Future.create(dsoHandle:file:line:column:function:)();
  uint64_t v55 = v39;
  sub_10000FC3C(v73, v73[3]);
  uint64_t v40 = (void *)swift_allocObject();
  v40[2] = v38;
  v40[3] = v56;
  v40[4] = v23;
  v40[5] = v12;
  uint64_t v71 = v64;
  id v62 = (void (*)(uint64_t))type metadata accessor for CanvasUpdater.UpdateDelegate;
  uint64_t v72 = sub_100014AC0(&qword_10006F698, (void (*)(uint64_t))type metadata accessor for CanvasUpdater.UpdateDelegate);
  v70[0] = v23;
  swift_retain_n();
  swift_retain();
  swift_retain();
  dispatch thunk of CanvasContentProviderBox.performUpdate(using:providerPromise:updatePayload:controlStates:agentContext:makeSceneContext:delegate:)();
  swift_release();
  sub_10000FCE4((uint64_t)v70);
  uint64_t v41 = swift_allocObject();
  *(void *)(v41 + 16) = v12;
  *(void *)(v41 + 24) = v23;
  swift_retain();
  swift_retain();
  uint64_t v42 = v59;
  static ExecutionLane.any.getter();
  type metadata accessor for SceneLayout();
  uint64_t v57 = v23;
  uint64_t v58 = Future.tryThen<A>(dsoHandle:file:line:column:function:on:transform:)();
  swift_release();
  uint64_t v43 = *(void (**)(char *, uint64_t))(v60 + 8);
  uint64_t v44 = v61;
  v43(v42, v61);
  sub_10000758C(&qword_10006F000);
  static Future<A>.zip<A, B>(dsoHandle:file:line:column:function:_:_:)();
  static ExecutionLane.any.getter();
  type metadata accessor for CanvasUpdater.UpdateResult(0);
  uint64_t v45 = Future.mapSuccess<A>(dsoHandle:file:line:column:function:on:_:)();
  swift_release();
  v43(v42, v44);
  v70[0] = v57;
  sub_100014AC0(&qword_10006F688, v62);
  swift_retain();
  Invalidatable.onInvalidation(_:)();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10000FCE4((uint64_t)v73);
  return v45;
}

uint64_t sub_100012398(uint64_t a1)
{
  uint64_t v1 = (void *)(a1
                + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_scene);
  *uint64_t v1 = 0;
  v1[1] = 0;
  swift_unknownObjectRelease();
  return dispatch thunk of Future.cancel(dsoHandle:file:line:column:function:)();
}

uint64_t sub_10001241C()
{
  uint64_t updated = type metadata accessor for SceneUpdateSeed();
  uint64_t v1 = *(void *)(updated - 8);
  __chkstk_darwin(updated);
  uint64_t v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  assertMainThread(file:line:column:function:)();
  SceneUpdateHandshake.updateSeed.getter();
  sub_100014AC0(&qword_10006F6D0, (void (*)(uint64_t))&type metadata accessor for SceneUpdateSeed);
  dispatch thunk of RawRepresentable.rawValue.getter();
  dispatch thunk of RawRepresentable.rawValue.getter();
  uint64_t v5 = v7[2];
  uint64_t v4 = v7[3];
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, updated);
  if (v4 == v5) {
    return Promise.trySucceed(with:)();
  }
  return result;
}

uint64_t sub_1000125C4(uint64_t result, uint64_t a2)
{
  void (*v7)(void *__return_ptr, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  void v10[3];
  uint64_t v11;
  uint64_t v12;

  if (*(void *)(v2
                 + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_scene))
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)(v2
                   + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_scene
                   + 8);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v7 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(v5 + 16);
    swift_unknownObjectRetain();
    v7(v10, ObjectType, v5);
    swift_unknownObjectRelease();
    int64_t v8 = v11;
    unint64_t v9 = v12;
    sub_10000FC3C(v10, v11);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 16))(v4, a2, v8, v9);
    return sub_10000FCE4((uint64_t)v10);
  }
  return result;
}

uint64_t sub_10001269C(uint64_t a1)
{
  sub_10001505C(v1 + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_providerBox, (uint64_t)v7);
  if (v8)
  {
    sub_10000FC3C(v7, v8);
    dispatch thunk of CanvasContentProviderBox.notePreviewCrashed(pid:)();
    uint64_t result = sub_10000FCE4((uint64_t)v7);
  }
  else
  {
    uint64_t result = sub_1000150CC((uint64_t)v7);
  }
  if (*(void *)(v1
                 + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_scene))
  {
    uint64_t v4 = *(void *)(v1
                   + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_scene
                   + 8);
    uint64_t ObjectType = swift_getObjectType();
    int64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24);
    swift_unknownObjectRetain();
    v6(a1, ObjectType, v4);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_100012780()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_seed;
  uint64_t updated = type metadata accessor for SceneUpdateSeed();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(updated - 8) + 8))(v1, updated);
  swift_release();
  sub_1000150CC(v0 + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_providerBox);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_10001287C()
{
  return sub_10001241C();
}

uint64_t sub_1000128A0(uint64_t a1, uint64_t a2)
{
  return sub_1000125C4(a1, a2);
}

void sub_1000128C4()
{
  uint64_t v1 = (void *)(*v0
                + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_scene);
  if (*v1)
  {
    uint64_t v2 = v1[1];
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v2 + 48);
    swift_unknownObjectRetain();
    v4(ObjectType, v2);
    swift_unknownObjectRelease();
  }
}

void sub_100012964()
{
  uint64_t v1 = (void *)(*v0
                + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_scene);
  if (*v1)
  {
    uint64_t v2 = v1[1];
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v2 + 56);
    swift_unknownObjectRetain();
    v4(ObjectType, v2);
    swift_unknownObjectRelease();
  }
}

uint64_t sub_100012A04(uint64_t result)
{
  uint64_t v2 = (void *)(*v1
                + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_scene);
  if (*v2)
  {
    uint64_t v3 = result;
    uint64_t v4 = v2[1];
    uint64_t ObjectType = swift_getObjectType();
    int64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 64);
    swift_unknownObjectRetain();
    v6(v3, ObjectType, v4);
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_100012AAC()
{
  uint64_t v1 = (void *)(*v0
                + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_scene);
  if (*v1)
  {
    uint64_t v2 = v1[1];
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v2 + 32);
    swift_unknownObjectRetain();
    v4(ObjectType, v2);
    swift_unknownObjectRelease();
  }
}

uint64_t sub_100012B4C(uint64_t a1)
{
  return sub_10001269C(a1);
}

uint64_t sub_100012B70@<X0>(void *a1@<X0>, void (*a2)(uint64_t *)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v27 = a4;
  uint64_t v28 = a5;
  uint64_t v25 = a3;
  BOOL v26 = a2;
  uint64_t v29 = a6;
  uint64_t v7 = type metadata accessor for PreviewSceneRole();
  __chkstk_darwin(v7 - 8);
  uint64_t updated = type metadata accessor for SceneUpdateSeed();
  uint64_t v8 = *(void *)(updated - 8);
  __chkstk_darwin(updated);
  unint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for SceneUpdateTiming();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  unint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v23 - v16;
  uint64_t v18 = a1[3];
  uint64_t v19 = a1[4];
  uint64_t v20 = sub_10000FC3C(a1, v18);
  v30[3] = v18;
  v30[4] = *(void *)(v19 + 8);
  uint64_t v21 = sub_100014CC4(v30);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v18 - 8) + 16))(v21, v20, v18);
  v26(v30);
  sub_10000FCE4((uint64_t)v30);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v27 + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_seed, updated);
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
  swift_getObjectType();
  dispatch thunk of PreviewShellScene.role.getter();
  SceneUpdateContext.init(seed:timing:role:)();
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v17, v11);
}

uint64_t sub_100012E20(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1[3];
  uint64_t v6 = a1[4];
  uint64_t v7 = sub_10000FC3C(a1, v5);
  v12[3] = v5;
  uint64_t v8 = *(void *)(v6 + 8);
  v12[4] = v8;
  uint64_t v9 = sub_100014CC4(v12);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v5 - 8) + 16))(v9, v7, v5);
  uint64_t v10 = sub_1000145DC(a3, (uint64_t)v9, a2, v5, v8);
  sub_10000FCE4((uint64_t)v12);
  return v10;
}

uint64_t sub_100012EEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1 + *(int *)(sub_10000758C(&qword_10006F6B0) + 48);
  uint64_t v5 = type metadata accessor for SceneLayout();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, v4, v5);
  uint64_t v6 = a2 + *(int *)(type metadata accessor for CanvasUpdater.UpdateResult(0) + 20);
  uint64_t updated = type metadata accessor for CanvasUpdateOutput();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(updated - 8) + 16);

  return v8(v6, a1, updated);
}

uint64_t sub_100012FC0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for ExecutionLane();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t updated = SceneUpdateHandshake.fenceHandle.getter();
  if (updated)
  {
    uint64_t v11 = (void *)updated;
    swift_getObjectType();
    uint64_t v12 = (void *)dispatch thunk of PreviewShellScene.windowScene.getter();
    [v11 applyToScene:v12];
  }
  uint64_t v13 = *(void *)(v3 + 32);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v13 + 16))(v21, ObjectType, v13);
  uint64_t v15 = v22;
  uint64_t v16 = v23;
  sub_10000FC3C(v21, v22);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 8))(a1, v15, v16);
  sub_10000FC80(a2, (uint64_t)v20);
  uint64_t v17 = swift_allocObject();
  sub_10000E710(v20, v17 + 16);
  static ExecutionLane.any.getter();
  type metadata accessor for SceneUpdateTiming();
  uint64_t v18 = Future.then<A>(dsoHandle:file:line:column:function:on:transform:)();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_10000FCE4((uint64_t)v21);
  return v18;
}

uint64_t sub_100013200(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ExecutionLane();
  uint64_t v19 = *(void *)(v4 - 8);
  uint64_t v20 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for SceneLayout();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v13 = (uint64_t *)((char *)&v19 - v12);
  assertMainThread(file:line:column:function:)();
  (*(void (**)(uint64_t))(a1
                                  + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_didUpdate))(a2);
  swift_getObjectType();
  sub_1000138FC(v13);
  sub_100014E08();
  static CATransaction.afterSynchronize()();
  (*(void (**)(char *, void *, uint64_t))(v8 + 16))(v11, v13, v7);
  unint64_t v14 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v15 + v14, v11, v7);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = sub_100014E60;
  *(void *)(v16 + 24) = v15;
  static ExecutionLane.any.getter();
  uint64_t v17 = Future.mapSuccess<A>(dsoHandle:file:line:column:function:on:_:)();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v6, v20);
  (*(void (**)(void *, uint64_t))(v8 + 8))(v13, v7);
  return v17;
}

uint64_t sub_10001350C(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for ExecutionLane();
  uint64_t v24 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v23 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t updated = type metadata accessor for SceneUpdateTiming();
  uint64_t v7 = *(void *)(updated - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = __chkstk_darwin(updated);
  uint64_t v10 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v21 - v11;
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v13((char *)&v21 - v11, a1, updated);
  int v14 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v12, updated);
  if (v14 == enum case for SceneUpdateTiming.fenced(_:))
  {
    sub_10000758C(&qword_10006F120);
    return static Future.succeeded(dsoHandle:file:line:column:function:_:)();
  }
  else if (v14 == enum case for SceneUpdateTiming.async(_:))
  {
    uint64_t v22 = v4;
    sub_10000FC3C(a2, a2[3]);
    dispatch thunk of CanvasContentHost.confirmReadyForDisplayAfterAsyncResize()();
    v13(v10, a1, updated);
    unint64_t v16 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v17 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v17 + v16, v10, updated);
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = sub_100014FA0;
    *(void *)(v18 + 24) = v17;
    uint64_t v19 = v23;
    static ExecutionLane.any.getter();
    uint64_t v15 = Future.mapSuccess<A>(dsoHandle:file:line:column:function:on:_:)();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v19, v22);
  }
  else
  {
    sub_10000758C(&qword_10006F120);
    SceneUpdateTiming.unknownTimingError.getter();
    uint64_t v15 = static Future.failed(dsoHandle:file:line:column:function:_:)();
    swift_errorRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, updated);
  }
  return v15;
}

void sub_1000138FC(void *a1@<X8>)
{
  uint64_t v2 = (void *)dispatch thunk of PreviewShellScene.windowScene.getter();
  id v3 = [v2 _FBSScene];

  id v25 = [v3 settings];
  self;
  uint64_t v4 = (void *)swift_dynamicCastObjCClass();
  if (!v4)
  {

    if (qword_10006ECF8 != -1) {
      swift_once();
    }
    uint64_t v9 = type metadata accessor for SceneLayout();
    uint64_t v10 = sub_10000E620(v9, (uint64_t)qword_1000741D8);
    uint64_t v11 = *(void (**)(void *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
    uint64_t v12 = a1;
    uint64_t v13 = v9;
    goto LABEL_10;
  }
  uint64_t v5 = v4;
  id v6 = [v4 previewSceneLayout];
  if (v6 == (id)1)
  {
    [v5 frame];
    uint64_t v15 = v14;
    uint64_t v17 = v16;

    *a1 = v15;
    a1[1] = v17;
    uint64_t v18 = (unsigned int *)&enum case for SceneLayout.custom(_:);
LABEL_21:
    uint64_t v23 = *v18;
    uint64_t v24 = type metadata accessor for SceneLayout();
    uint64_t v11 = *(void (**)(void *, uint64_t, uint64_t))(*(void *)(v24 - 8) + 104);
    uint64_t v13 = v24;
    uint64_t v12 = a1;
    uint64_t v10 = v23;
LABEL_10:
    v11(v12, v10, v13);
    return;
  }
  if (!v6)
  {
    id v7 = [v5 interfaceOrientation];

    switch((unint64_t)v7)
    {
      case 2uLL:
        uint64_t v8 = (unsigned int *)&enum case for PreviewTraits.Orientation.portraitUpsideDown(_:);
        break;
      case 3uLL:
        uint64_t v8 = (unsigned int *)&enum case for PreviewTraits.Orientation.landscapeRight(_:);
        break;
      case 4uLL:
        uint64_t v8 = (unsigned int *)&enum case for PreviewTraits.Orientation.landscapeLeft(_:);
        break;
      default:
        uint64_t v8 = (unsigned int *)&enum case for PreviewTraits.Orientation.portrait(_:);
        break;
    }
    uint64_t v21 = *v8;
    uint64_t v22 = type metadata accessor for PreviewTraits.Orientation();
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 104))(a1, v21, v22);
    uint64_t v18 = (unsigned int *)&enum case for SceneLayout.device(_:);
    goto LABEL_21;
  }
  if (qword_10006ECF8 != -1) {
    swift_once();
  }
  uint64_t v19 = type metadata accessor for SceneLayout();
  uint64_t v20 = sub_10000E620(v19, (uint64_t)qword_1000741D8);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(a1, v20, v19);
}

uint64_t sub_100013C4C()
{
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for CanvasUpdater()
{
  return self;
}

uint64_t sub_100013CB8()
{
  return type metadata accessor for CanvasUpdater.UpdateDelegate(0);
}

uint64_t type metadata accessor for CanvasUpdater.UpdateDelegate(uint64_t a1)
{
  return sub_100014BD8(a1, qword_10006F5B8);
}

uint64_t sub_100013CE0()
{
  uint64_t result = type metadata accessor for SceneUpdateSeed();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100013DA4()
{
  return sub_100014AC0(&qword_10006F670, (void (*)(uint64_t))type metadata accessor for CanvasUpdater.UpdateDelegate);
}

uint64_t sub_100013DEC()
{
  return (*(uint64_t (**)(void, void))(v0 + 16))(*(void *)(*(void *)(v0 + 32) + 24), *(void *)(*(void *)(*(void *)(v0 + 32) + 32) + 8));
}

unint64_t sub_100013E2C()
{
  unint64_t result = qword_10006F680;
  if (!qword_10006F680)
  {
    sub_10000762C(&qword_10006F678);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006F680);
  }
  return result;
}

uint64_t sub_100013E88(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100013E98(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100013ED4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100013EFC(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_100013F74(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_100013F74(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100014048(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100014C64((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100014C64((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000FCE4((uint64_t)v12);
  return v7;
}

uint64_t sub_100014048(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100014204(a5, a6);
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

uint64_t sub_100014204(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10001429C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001447C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001447C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10001429C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100014414(v2, 0);
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

void *sub_100014414(uint64_t a1, uint64_t a2)
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
  sub_10000758C(&qword_10006F6A8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10001447C(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000758C(&qword_10006F6A8);
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unsigned char **sub_1000145CC(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_1000145DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = type metadata accessor for ExecutionLane();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  void v21[3] = a4;
  void v21[4] = a5;
  uint64_t v14 = sub_100014CC4(v21);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 16))(v14, a2, a4);
  static ExecutionLane.main.getter();
  sub_10000FC80((uint64_t)v21, (uint64_t)v20);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a3;
  sub_10000E710(v20, v15 + 24);
  type metadata accessor for SceneUpdateTiming();
  swift_retain();
  Future.then<A>(dsoHandle:file:line:column:function:on:transform:)();
  swift_release();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v11 + 8);
  v16(v13, v10);
  static ExecutionLane.main.getter();
  sub_10000FC80((uint64_t)v21, (uint64_t)v20);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a3;
  *(void *)(v17 + 24) = a1;
  sub_10000E710(v20, v17 + 32);
  type metadata accessor for SceneLayout();
  swift_retain();
  swift_retain();
  uint64_t v18 = Future.then<A>(dsoHandle:file:line:column:function:on:transform:)();
  swift_release();
  swift_release();
  v16(v13, v10);
  sub_10000FCE4((uint64_t)v21);
  return v18;
}

uint64_t sub_1000148A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  type metadata accessor for InvalidationHandle();
  swift_allocObject();
  *(void *)(v5 + 16) = InvalidationHandle.init(dsoHandle:file:line:column:function:name:)();
  SceneUpdateSeed.init()();
  uint64_t v11 = (void *)(v5
                 + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_scene);
  *uint64_t v11 = 0;
  v11[1] = 0;
  sub_10001505C(a1, v5 + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_providerBox);
  *uint64_t v11 = a2;
  v11[1] = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  uint64_t v12 = (void *)(v5
                 + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_didUpdate);
  *uint64_t v12 = a4;
  v12[1] = a5;
  sub_10000758C(&qword_10006F6C8);
  swift_retain();
  *(void *)(v5
            + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_handshakeFuture) = static Future.create(dsoHandle:file:line:column:function:)();
  *(void *)(v5
            + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_handshakePromise) = v13;
  sub_100014AC0(&qword_10006F688, (void (*)(uint64_t))type metadata accessor for CanvasUpdater.UpdateDelegate);
  swift_retain();
  Invalidatable.onInvalidation(_:)();
  swift_release();
  sub_1000150CC(a1);
  return v5;
}

uint64_t sub_100014AC0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100014B08()
{
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100014B50@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100012B70(a1, *(void (**)(uint64_t *))(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), a2);
}

uint64_t sub_100014B5C()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100014B9C(void *a1)
{
  return sub_100012E20(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t type metadata accessor for CanvasUpdater.UpdateResult(uint64_t a1)
{
  return sub_100014BD8(a1, qword_10006F730);
}

uint64_t sub_100014BD8(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100014C10()
{
  return dispatch thunk of Future.cancel(dsoHandle:file:line:column:function:)();
}

uint64_t sub_100014C64(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_100014CC4(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_100014D28()
{
  swift_release();
  sub_10000FCE4(v0 + 24);

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100014D68(uint64_t a1)
{
  return sub_100012FC0(a1, v1 + 24);
}

uint64_t sub_100014D94()
{
  swift_release();
  swift_release();
  sub_10000FCE4(v0 + 32);

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_100014DDC()
{
  return sub_100013200(*(void *)(v0 + 24), v0 + 32);
}

unint64_t sub_100014E08()
{
  unint64_t result = qword_10006F6B8;
  if (!qword_10006F6B8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10006F6B8);
  }
  return result;
}

uint64_t sub_100014E48()
{
  return sub_100014F08((uint64_t (*)(void))&type metadata accessor for SceneLayout);
}

uint64_t sub_100014E60@<X0>(uint64_t a1@<X8>)
{
  return sub_100014FB8((uint64_t (*)(void))&type metadata accessor for SceneLayout, a1);
}

uint64_t sub_100014E78()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100014EB0()
{
  sub_10000FCE4(v0 + 16);

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100014EE8(uint64_t a1)
{
  return sub_10001350C(a1, (void *)(v1 + 16));
}

uint64_t sub_100014EF0()
{
  return sub_100014F08((uint64_t (*)(void))&type metadata accessor for SceneUpdateTiming);
}

uint64_t sub_100014F08(uint64_t (*a1)(void))
{
  uint64_t v2 = a1(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);

  return _swift_deallocObject(v1, v6, v7);
}

uint64_t sub_100014FA0@<X0>(uint64_t a1@<X8>)
{
  return sub_100014FB8((uint64_t (*)(void))&type metadata accessor for SceneUpdateTiming, a1);
}

uint64_t sub_100014FB8@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return v6(a2, v7, v4);
}

uint64_t sub_100015034()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10001505C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000758C(&qword_10006F6C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000150C4()
{
  return sub_100012398(v0);
}

uint64_t sub_1000150CC(uint64_t a1)
{
  uint64_t v2 = sub_10000758C(&qword_10006F6C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *sub_10001512C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for SceneLayout();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    int64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t updated = type metadata accessor for CanvasUpdateOutput();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(updated - 8) + 16))(v9, v10, updated);
  }
  return a1;
}

uint64_t sub_100015234(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SceneLayout();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t updated = type metadata accessor for CanvasUpdateOutput();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(updated - 8) + 8);

  return v7(v5, updated);
}

uint64_t sub_1000152DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SceneLayout();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t updated = type metadata accessor for CanvasUpdateOutput();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(updated - 8) + 16))(v8, v9, updated);
  return a1;
}

uint64_t sub_100015394(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SceneLayout();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t updated = type metadata accessor for CanvasUpdateOutput();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(updated - 8) + 24))(v8, v9, updated);
  return a1;
}

uint64_t sub_10001544C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SceneLayout();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t updated = type metadata accessor for CanvasUpdateOutput();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(updated - 8) + 32))(v8, v9, updated);
  return a1;
}

uint64_t sub_100015504(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SceneLayout();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t updated = type metadata accessor for CanvasUpdateOutput();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(updated - 8) + 40))(v8, v9, updated);
  return a1;
}

uint64_t sub_1000155BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000155D0);
}

uint64_t sub_1000155D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SceneLayout();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t updated = type metadata accessor for CanvasUpdateOutput();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(updated - 8) + 48);
    uint64_t v12 = updated;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_1000156C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000156DC);
}

uint64_t sub_1000156DC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for SceneLayout();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t updated = type metadata accessor for CanvasUpdateOutput();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(updated - 8) + 56);
    uint64_t v14 = updated;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t sub_1000157E0()
{
  uint64_t result = type metadata accessor for SceneLayout();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for CanvasUpdateOutput();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000158B0()
{
  type metadata accessor for SimDisplaySceneRegistry();
  uint64_t result = swift_initStaticObject();
  qword_100074158 = result;
  return result;
}

uint64_t sub_1000158EC()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for SimDisplaySceneRegistry()
{
  return self;
}

ValueMetadata *type metadata accessor for SimDisplaySceneRegistry.UnsupportedOnDevice()
{
  return &type metadata for SimDisplaySceneRegistry.UnsupportedOnDevice;
}

uint64_t sub_100015930(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v66 = a3;
  uint64_t v62 = a2;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v59 = type metadata accessor for SceneCrashedStyle();
  uint64_t v58 = *(void *)(v59 - 8);
  __chkstk_darwin(v59);
  uint64_t v57 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = type metadata accessor for PreviewSceneRole();
  uint64_t v68 = *(void *)(v78 - 8);
  uint64_t v7 = __chkstk_darwin(v78);
  uint64_t v65 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v56 = (char *)&v49 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v64 = (char *)&v49 - v12;
  __chkstk_darwin(v11);
  v63 = (char *)&v49 - v13;
  uint64_t v55 = type metadata accessor for SceneStoppedStyle();
  uint64_t v54 = *(void *)(v55 - 8);
  __chkstk_darwin(v55);
  uint64_t v53 = (char *)&v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for Identifier();
  uint64_t v60 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_snapshotView;
  *(void *)&v4[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_snapshotView] = 0;
  uint64_t v19 = OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_stoppedViewController;
  *(void *)&v4[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_stoppedViewController] = 0;
  uint64_t v20 = OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_crashedViewController;
  *(void *)&v4[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_crashedViewController] = 0;
  uint64_t v51 = OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cacheSnapshotTimer;
  *(void *)&v4[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cacheSnapshotTimer] = 0;
  uint64_t v52 = OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cachedSnapshotCGImage;
  *(void *)&v4[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cachedSnapshotCGImage] = 0;
  v67 = v4;
  uint64_t v21 = a1;
  uint64_t v22 = (void *)PreviewSceneAgentProxy.scene.getter();
  id v23 = [v22 scene];

  id v24 = [v23 uiPresentationManager];
  if (!v24)
  {
    sub_100017C30();
    swift_allocError();
    *id v33 = v23;
    id v34 = v23;
    swift_willThrow();

    swift_release();
    swift_unknownObjectRelease();

    swift_release();
    id v35 = *(id *)&v4[v52];

    swift_deallocPartialClassInstance();
    return (uint64_t)v35;
  }
  uint64_t v51 = (uint64_t)v23;
  uint64_t v52 = v21;
  aBlock = 0;
  unint64_t v73 = 0xE000000000000000;
  id v25 = v24;
  _StringGuts.grow(_:)(25);
  swift_bridgeObjectRelease();
  aBlock = (void **)0xD000000000000017;
  unint64_t v73 = 0x8000000100056650;
  Identifier.init()();
  sub_100017C9C(&qword_10006F888, (void (*)(uint64_t))&type metadata accessor for Identifier);
  v26._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v26);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v60 + 8))(v17, v15);
  NSString v27 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v50 = v25;
  id v28 = [v25 createPresenterWithIdentifier:v27];

  *(void *)&v67[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_scenePresenter] = v28;
  uint64_t v76 = sub_1000162DC;
  uint64_t v77 = 0;
  aBlock = _NSConcreteStackBlock;
  unint64_t v73 = 1107296256;
  v74 = sub_1000162EC;
  id v75 = &unk_100062D38;
  uint64_t v29 = _Block_copy(&aBlock);
  swift_release();
  [v28 modifyPresentationContext:v29];
  _Block_release(v29);
  uint64_t result = swift_isEscapingClosureAtFileLocation();
  if ((result & 1) == 0)
  {
    uint64_t v60 = swift_getObjectType();
    dispatch thunk of PreviewShellScene.role.getter();
    uint64_t v31 = enum case for PreviewSceneRole.hosted(_:);
    int v49 = *(void (**)(char *, uint64_t, uint64_t))(v68 + 104);
    v49(v64, enum case for PreviewSceneRole.hosted(_:), v78);
    sub_100017C9C((unint64_t *)&unk_10006F890, (void (*)(uint64_t))&type metadata accessor for PreviewSceneRole);
    dispatch thunk of RawRepresentable.rawValue.getter();
    dispatch thunk of RawRepresentable.rawValue.getter();
    if (aBlock == v70 && v73 == v71) {
      char v32 = 1;
    }
    else {
      char v32 = _stringCompareWithSmolCheck(_:_:expecting:)();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v36 = v68 + 8;
    unint64_t v37 = *(void (**)(char *, uint64_t))(v68 + 8);
    uint64_t v38 = v78;
    v37(v64, v78);
    uint64_t v68 = v36;
    v37(v63, v38);
    if (v32)
    {
      uint64_t v39 = v53;
      dispatch thunk of PreviewShellScene.stoppedStyle.getter();
      uint64_t v40 = v39;
    }
    else
    {
      uint64_t v40 = v53;
      static SceneStoppedStyle.none.getter();
    }
    uint64_t v41 = v56;
    (*(void (**)(char *, char *, uint64_t))(v54 + 32))(&v67[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_stoppedStyle], v40, v55);
    dispatch thunk of PreviewShellScene.role.getter();
    v49(v65, v31, v78);
    dispatch thunk of RawRepresentable.rawValue.getter();
    dispatch thunk of RawRepresentable.rawValue.getter();
    if (aBlock == v70 && v73 == v71)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v42 = v78;
      v37(v65, v78);
      v37(v41, v42);
    }
    else
    {
      char v43 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v44 = v78;
      v37(v65, v78);
      v37(v41, v44);
      if ((v43 & 1) == 0)
      {
        uint64_t v45 = v57;
        static SceneCrashedStyle.none.getter();
        goto LABEL_17;
      }
    }
    uint64_t v45 = v57;
    dispatch thunk of PreviewShellScene.crashedStyle.getter();
LABEL_17:
    uint64_t v46 = (objc_class *)ObjectType;
    uint64_t v47 = (void *)v51;
    uint64_t v48 = v67;
    (*(void (**)(char *, char *, uint64_t))(v58 + 32))(&v67[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_crashedStyle], v45, v59);

    v69.receiver = v48;
    v69.super_class = v46;
    [super initWithNibName:0 bundle:0];

    swift_release();
    swift_unknownObjectRelease();
    return (uint64_t)v35;
  }
  __break(1u);
  return result;
}

id sub_1000162DC(void *a1)
{
  return [a1 setAppearanceStyle:2];
}

void sub_1000162EC(uint64_t a1, void *a2)
{
  unint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

id sub_100016360()
{
  unint64_t v1 = v0;
  v8.receiver = v0;
  v8.super_class = (Class)swift_getObjectType();
  [super viewDidLoad];
  id result = [v0 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  id v3 = result;
  id v4 = [self systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  uint64_t v5 = *(void **)&v1[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_scenePresenter];
  [v5 activate];
  id result = [v1 view];
  if (!result)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  uint64_t v6 = result;
  id v7 = [v5 presentationView];
  [v6 addSubview:v7];

  if (SceneStoppedStyle.snapshotStyle.getter() != 3) {
    return (id)sub_1000164CC(0.1);
  }
  id result = (id)SceneCrashedStyle.snapshotStyle.getter();
  if (result != 3) {
    return (id)sub_1000164CC(0.1);
  }
  return result;
}

uint64_t sub_1000164CC(Swift::Double a1)
{
  uint64_t v3 = type metadata accessor for DispatchScheduler();
  __chkstk_darwin(v3);
  uint64_t v4 = OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cacheSnapshotTimer;
  if (*(void *)(v1 + OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cacheSnapshotTimer))
  {
    swift_retain();
    DelayedInvocation.cancel()();
    swift_release();
  }
  sub_1000074AC();
  static OS_dispatch_queue.main.getter();
  DispatchScheduler.init(queue:)();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  type metadata accessor for DelayedInvocation();
  swift_allocObject();
  *(void *)(v1 + v4) = DelayedInvocation.init<A>(scheduler:callback:)();
  uint64_t result = swift_release();
  if (*(void *)(v1 + v4))
  {
    swift_retain();
    DelayedInvocation.schedule(delay:)(a1);
    return swift_release();
  }
  return result;
}

void sub_100016678()
{
  v62.receiver = v0;
  v62.super_class = (Class)swift_getObjectType();
  [super viewDidLayoutSubviews];
  id v1 = [*(id *)&v0[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_scenePresenter] presentationView];
  id v2 = [v0 view];
  if (!v2)
  {
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v3 = v2;
  [v2 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [v1 setFrame:v5, v7, v9, v11];
  uint64_t v12 = *(void **)&v0[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_snapshotView];
  if (!v12) {
    goto LABEL_6;
  }
  id v13 = v12;
  id v14 = [v0 view];
  if (!v14) {
    goto LABEL_20;
  }
  uint64_t v15 = v14;
  [v14 bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  [v13 setFrame:v17, v19, v21, v23];
  id v24 = [v0 view];
  if (!v24)
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  id v25 = v24;
  [v24 bringSubviewToFront:v13];

LABEL_6:
  Swift::String v26 = *(void **)&v0[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_stoppedViewController];
  if (!v26) {
    goto LABEL_12;
  }
  id v27 = v26;
  id v28 = [v27 view];
  if (!v28) {
    goto LABEL_22;
  }
  uint64_t v29 = v28;
  id v30 = [v0 view];
  if (!v30)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v31 = v30;
  [v30 bounds];
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;

  [v29 setFrame:v33, v35, v37, v39];
  id v40 = [v0 view];
  if (!v40)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v41 = v40;
  id v42 = [v27 view];
  if (!v42)
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  char v43 = v42;
  [v41 bringSubviewToFront:v42];

LABEL_12:
  uint64_t v44 = *(void **)&v0[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_crashedViewController];
  if (!v44) {
    return;
  }
  id v45 = v44;
  id v46 = [v45 view];
  if (!v46) {
    goto LABEL_26;
  }
  uint64_t v47 = v46;
  id v48 = [v0 view];
  if (!v48)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  int v49 = v48;
  [v48 bounds];
  double v51 = v50;
  double v53 = v52;
  double v55 = v54;
  double v57 = v56;

  [v47 setFrame:v51, v53, v55, v57];
  id v58 = [v0 view];
  if (!v58)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v59 = v58;
  id v60 = [v45 view];
  if (!v60)
  {
LABEL_29:
    __break(1u);
    return;
  }
  uint64_t v61 = v60;
  [v59 bringSubviewToFront:v60];
}

void sub_100016A3C()
{
  uint64_t v1 = OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_snapshotView;
  id v2 = *(void **)&v0[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_snapshotView];
  if (v2) {
    [v2 removeFromSuperview];
  }
  id v3 = [*(id *)&v0[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_scenePresenter] newSnapshotPresentationView];
  id v4 = [v0 view];
  if (v4)
  {
    double v5 = v4;
    [v4 addSubview:v3];

    double v6 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v3;
  }
  else
  {
    __break(1u);
  }
}

void sub_100016AE8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SceneStoppedStyle();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  double v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  double v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_stoppedViewController;
  if (!*(void *)&v1[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_stoppedViewController])
  {
    uint64_t v44 = v2;
    static Logger.uv.getter();
    double v11 = v1;
    uint64_t v12 = Logger.logObject.getter();
    int v43 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v12, (os_log_type_t)v43))
    {
      uint64_t v37 = v7;
      os_log_t v38 = v12;
      uint64_t v41 = v10;
      id v42 = v1;
      uint64_t v13 = swift_slowAlloc();
      id v14 = (void *)swift_slowAlloc();
      uint64_t v39 = swift_slowAlloc();
      uint64_t v46 = v39;
      *(_DWORD *)uint64_t v13 = 136315650;
      uint64_t v40 = v13 + 4;
      id v15 = [*(id *)&v11[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_scenePresenter] identifier];
      uint64_t v16 = v3;
      uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v19 = v18;

      uint64_t v45 = sub_100013F74(v17, v19, &v46);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      *(_WORD *)(v13 + 12) = 2080;
      uint64_t v40 = v16;
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v5, &v11[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_stoppedStyle], v44);
      uint64_t v20 = String.init<A>(describing:)();
      uint64_t v45 = sub_100013F74(v20, v21, &v46);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      *(_WORD *)(v13 + 22) = 2112;
      id v22 = sub_10001707C();
      id v23 = v22;
      if (v22) {
        uint64_t v45 = (uint64_t)v22;
      }
      else {
        uint64_t v45 = 0;
      }
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t v24 = v37;
      *id v14 = v23;

      os_log_t v25 = v38;
      _os_log_impl((void *)&_mh_execute_header, v38, (os_log_type_t)v43, "Showing stopped UI for %s using style %s with image %@", (uint8_t *)v13, 0x20u);
      sub_10000758C(&qword_10006F2A8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v24 + 8))(v9, v6);
      uint64_t v10 = v41;
      uint64_t v1 = v42;
      uint64_t v3 = v40;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
    if (*(void *)&v11[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cacheSnapshotTimer])
    {
      swift_retain();
      DelayedInvocation.cancel()();
      swift_release();
    }
    id v26 = [*(id *)&v11[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_scenePresenter] newSnapshot];
    id v27 = [v26 CGImage];

    id v28 = *(void **)&v11[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cachedSnapshotCGImage];
    *(void *)&v11[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cachedSnapshotCGImage] = v27;

    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, &v11[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_stoppedStyle], v44);
    sub_10001707C();
    id v29 = objc_allocWithZone((Class)type metadata accessor for StoppedViewController());
    id v30 = (void *)StoppedViewController.init(style:snapshotImage:)();
    [v11 addChildViewController:v30];
    id v31 = [v11 view];
    if (v31)
    {
      double v32 = v31;
      id v33 = [v30 view];
      if (v33)
      {
        double v34 = v33;
        [v32 addSubview:v33];

        [v30 didMoveToParentViewController:v11];
        double v35 = *(void **)&v1[v10];
        *(void *)&v1[v10] = v30;

        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
}

id sub_10001707C()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cachedSnapshotCGImage);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_scenePresenter);
  id v3 = v1;
  id v4 = [v2 scene];
  double v5 = 2.0;
  if (v4)
  {
    uint64_t v6 = v4;
    id v7 = [v4 settings];

    id v8 = [v7 displayConfiguration];
    if (v8)
    {
      [v8 pointScale];
      double v5 = v9;
    }
  }
  id v10 = [objc_allocWithZone((Class)UIImage) initWithCGImage:v3 scale:0 orientation:v5];

  return v10;
}

void sub_100017180()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SceneCrashedStyle();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  double v5 = (char *)v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  double v9 = (char *)v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_crashedViewController;
  if (!*(void *)&v0[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_crashedViewController])
  {
    static Logger.uv.getter();
    double v11 = v0;
    uint64_t v12 = Logger.logObject.getter();
    int v37 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v12, (os_log_type_t)v37))
    {
      os_log_t v34 = v12;
      uint64_t v35 = v7;
      uint64_t v36 = v10;
      uint64_t v13 = swift_slowAlloc();
      uint64_t v38 = v3;
      uint64_t v14 = v13;
      double v32 = (void *)swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      uint64_t v40 = v33;
      *(_DWORD *)uint64_t v14 = 136315650;
      v31[1] = v14 + 4;
      id v15 = [*(id *)&v11[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_scenePresenter] identifier];
      uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v18 = v17;

      uint64_t v39 = sub_100013F74(v16, v18, &v40);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 12) = 2080;
      (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v5, &v11[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_crashedStyle], v2);
      uint64_t v19 = String.init<A>(describing:)();
      uint64_t v39 = sub_100013F74(v19, v20, &v40);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 22) = 2112;
      id v21 = sub_10001707C();
      id v22 = v21;
      if (v21) {
        uint64_t v39 = (uint64_t)v21;
      }
      else {
        uint64_t v39 = 0;
      }
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *double v32 = v22;

      os_log_t v23 = v34;
      _os_log_impl((void *)&_mh_execute_header, v34, (os_log_type_t)v37, "Showing stopped UI for %s using style %s with image %@", (uint8_t *)v14, 0x20u);
      sub_10000758C(&qword_10006F2A8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v35 + 8))(v9, v6);
      uint64_t v10 = v36;
      uint64_t v3 = v38;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
    if (*(void *)&v11[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cacheSnapshotTimer])
    {
      swift_retain();
      DelayedInvocation.cancel()();
      swift_release();
    }
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, &v11[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_crashedStyle], v2);
    sub_10001707C();
    id v24 = objc_allocWithZone((Class)type metadata accessor for CrashedViewController());
    os_log_t v25 = (void *)CrashedViewController.init(style:snapshotImage:)();
    [v11 addChildViewController:v25];
    id v26 = [v11 view];
    if (v26)
    {
      id v27 = v26;
      id v28 = [v25 view];
      if (v28)
      {
        id v29 = v28;
        [v27 addSubview:v28];

        [v25 didMoveToParentViewController:v11];
        id v30 = *(void **)&v1[v10];
        *(void *)&v1[v10] = v25;

        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
}

void sub_1000176C4()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (char *)Strong;
    id v2 = [*(id *)(Strong + OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_scenePresenter) newSnapshot];
    id v3 = [v2 CGImage];

    uint64_t v4 = *(void **)&v1[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cachedSnapshotCGImage];
    *(void *)&v1[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cachedSnapshotCGImage] = v3;
  }
  swift_beginAccess();
  uint64_t v5 = swift_unknownObjectWeakLoadStrong();
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    sub_1000164CC(5.0);
  }
}

unint64_t sub_100017798(void *a1)
{
  _StringGuts.grow(_:)(25);
  swift_bridgeObjectRelease();
  id v2 = [a1 identifier];
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;

  v6._countAndFlagsBits = v3;
  v6._object = v5;
  String.append(_:)(v6);
  swift_bridgeObjectRelease();
  v7._countAndFlagsBits = 39;
  v7._object = (void *)0xE100000000000000;
  String.append(_:)(v7);
  return 0xD000000000000016;
}

uint64_t sub_100017858(void *a1)
{
  id v1 = a1;
  id v2 = [v1 description];
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;

  v6._countAndFlagsBits = v3;
  v6._object = v5;
  String.append(_:)(v6);

  swift_bridgeObjectRelease();
  return 0x203A656E656353;
}

unint64_t sub_1000178F0()
{
  return sub_100017798(*v0);
}

uint64_t sub_1000178F8()
{
  return sub_100017858(*v0);
}

uint64_t sub_100017900()
{
  return 0;
}

uint64_t sub_100017930(uint64_t a1)
{
  unint64_t v2 = sub_100017E84();

  return HumanReadableError.errorDescription.getter(a1, v2);
}

uint64_t sub_100017978(uint64_t a1)
{
  unint64_t v2 = sub_100017E84();

  return HumanReadableError.description.getter(a1, v2);
}

uint64_t sub_100017AFC()
{
  return type metadata accessor for RemoteContentViewController();
}

uint64_t type metadata accessor for RemoteContentViewController()
{
  uint64_t result = qword_10006F868;
  if (!qword_10006F868) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100017B50()
{
  uint64_t result = type metadata accessor for SceneStoppedStyle();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for SceneCrashedStyle();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

unint64_t sub_100017C30()
{
  unint64_t result = qword_10006F880;
  if (!qword_10006F880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006F880);
  }
  return result;
}

uint64_t sub_100017C84(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100017C94()
{
  return swift_release();
}

uint64_t sub_100017C9C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100017CE4()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100017D1C()
{
}

void sub_100017D24()
{
  *(void *)&v0[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_snapshotView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_stoppedViewController] = 0;
  *(void *)&v0[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_crashedViewController] = 0;
  *(void *)&v0[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cacheSnapshotTimer] = 0;
  *(void *)&v0[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cachedSnapshotCGImage] = 0;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

ValueMetadata *type metadata accessor for RemoteContentViewController.InvalidSceneError()
{
  return &type metadata for RemoteContentViewController.InvalidSceneError;
}

unint64_t sub_100017DD8()
{
  unint64_t result = qword_10006F8A0;
  if (!qword_10006F8A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006F8A0);
  }
  return result;
}

unint64_t sub_100017E30()
{
  unint64_t result = qword_10006F8A8;
  if (!qword_10006F8A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006F8A8);
  }
  return result;
}

unint64_t sub_100017E84()
{
  unint64_t result = qword_10006F8B0;
  if (!qword_10006F8B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006F8B0);
  }
  return result;
}

uint64_t sub_100018048@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  Swift::String v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000758C(&qword_10006F9E8);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  double v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v24 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v24 - v15;
  sub_100018858((uint64_t)v2 + OBJC_IVAR____TtC12PreviewShell15ApplicationInfo_overrideExecutableURL, (uint64_t)v14);
  unint64_t v17 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48);
  if (v17(v14, 1, v4))
  {
    sub_1000188C0((uint64_t)v14);
    unint64_t v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
    v18(v16, 1, 1, v4);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, v14, v4);
    sub_1000188C0((uint64_t)v14);
    URL.absoluteURL.getter();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    unint64_t v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
    v18(v16, 0, 1, v4);
    if (v17(v16, 1, v4) != 1)
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a1, v16, v4);
      return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v18)(a1, 0, 1, v4);
    }
  }
  uint64_t v19 = (objc_class *)type metadata accessor for ApplicationInfo();
  v24.receiver = v2;
  v24.super_class = v19;
  id v20 = [super executableURL];
  if (v20)
  {
    id v21 = v20;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v22 = 0;
  }
  else
  {
    uint64_t v22 = 1;
  }
  v18(v11, v22, 1, v4);
  sub_100018920((uint64_t)v11, a1);
  return sub_1000188C0((uint64_t)v16);
}

id sub_100018354(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  Swift::String v7 = &a1[OBJC_IVAR____TtC12PreviewShell15ApplicationInfo_overrideExecutableURL];
  uint64_t v8 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v10.receiver = a1;
  v10.super_class = (Class)type metadata accessor for ApplicationInfo();
  return [super a3];
}

id sub_1000183F4()
{
  return sub_10001870C(0, type metadata accessor for ApplicationInfo);
}

uint64_t sub_100018420()
{
  return type metadata accessor for ApplicationInfo();
}

uint64_t type metadata accessor for ApplicationInfo()
{
  uint64_t result = qword_10006F8E8;
  if (!qword_10006F8E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100018474()
{
  sub_100018504();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_100018504()
{
  if (!qword_10006F8F8)
  {
    type metadata accessor for URL();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10006F8F8);
    }
  }
}

id sub_10001855C()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for ApplicationInfoProvider()) init];
  qword_100074160 = (uint64_t)result;
  return result;
}

id sub_1000186F4(uint64_t a1)
{
  return sub_10001870C(a1, type metadata accessor for ApplicationInfoProvider);
}

id sub_10001870C(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return [super dealloc];
}

uint64_t type metadata accessor for ApplicationInfoProvider()
{
  return self;
}

id sub_10001876C()
{
  swift_bridgeObjectRetain();
  NSString v0 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v1 = [self applicationProxyForIdentifier:v0];

  if (!v1) {
    return 0;
  }
  id result = [v1 appState];
  if (result)
  {
    uint64_t v3 = result;
    unsigned int v4 = [result isValid];

    if (v4)
    {
      id v5 = [objc_allocWithZone((Class)type metadata accessor for ApplicationInfo()) initWithApplicationProxy:v1];

      return v5;
    }

    return 0;
  }
  __break(1u);
  return result;
}

uint64_t sub_100018858(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000758C(&qword_10006F9E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000188C0(uint64_t a1)
{
  uint64_t v2 = sub_10000758C(&qword_10006F9E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100018920(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000758C(&qword_10006F9E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100018988(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_10000758C(&qword_10006FAC8);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for LaunchPayload();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_10000FD9C(a1, &qword_10006FAC8);
    sub_100009AF8(a2, (uint64_t)v8);
    uint64_t v13 = type metadata accessor for AgentDescriptor.Bundle();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a2, v13);
    return sub_10000FD9C((uint64_t)v8, &qword_10006FAC8);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, a1, v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_10000CADC((uint64_t)v12, a2, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v18;
    swift_bridgeObjectRelease();
    uint64_t v16 = type metadata accessor for AgentDescriptor.Bundle();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a2, v16);
  }
}

uint64_t sub_100018BB4(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (!v1) {
    return (uint64_t)v2;
  }
  id v26 = (unint64_t *)&_swiftEmptyArrayStorage;
  sub_10001EC34(0, v1, 0);
  uint64_t v2 = (unint64_t *)&_swiftEmptyArrayStorage;
  uint64_t result = sub_10001EF68(a1);
  uint64_t v6 = result;
  uint64_t v7 = 0;
  uint64_t v8 = a1 + 64;
  int64_t v20 = v1;
  int v21 = v5;
  uint64_t v22 = a1 + 64;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(unsigned char *)(a1 + 32))
  {
    unint64_t v11 = (unint64_t)v6 >> 6;
    if ((*(void *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0) {
      goto LABEL_25;
    }
    if (*(_DWORD *)(a1 + 36) != v5) {
      goto LABEL_26;
    }
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8 * v6);
    uint64_t v24 = type metadata accessor for HostedPreviewCanvas();
    uint64_t v25 = sub_100020E58((unint64_t *)&qword_100070C10, (void (*)(uint64_t))type metadata accessor for HostedPreviewCanvas);
    *(void *)&long long v23 = v12;
    id v26 = v2;
    unint64_t v14 = v2[2];
    unint64_t v13 = v2[3];
    swift_retain();
    if (v14 >= v13 >> 1)
    {
      sub_10001EC34(v13 > 1, v14 + 1, 1);
      uint64_t v2 = v26;
    }
    v2[2] = v14 + 1;
    uint64_t result = sub_10000E710(&v23, (uint64_t)&v2[5 * v14 + 4]);
    int64_t v9 = 1 << *(unsigned char *)(a1 + 32);
    if (v6 >= v9) {
      goto LABEL_27;
    }
    uint64_t v8 = a1 + 64;
    uint64_t v15 = *(void *)(v22 + 8 * v11);
    if ((v15 & (1 << v6)) == 0) {
      goto LABEL_28;
    }
    int v5 = v21;
    if (*(_DWORD *)(a1 + 36) != v21) {
      goto LABEL_29;
    }
    unint64_t v16 = v15 & (-2 << (v6 & 0x3F));
    if (v16)
    {
      int64_t v9 = __clz(__rbit64(v16)) | v6 & 0xFFFFFFFFFFFFFFC0;
      int64_t v10 = v20;
    }
    else
    {
      unint64_t v17 = v11 + 1;
      unint64_t v18 = (unint64_t)(v9 + 63) >> 6;
      int64_t v10 = v20;
      if (v11 + 1 < v18)
      {
        unint64_t v19 = *(void *)(v22 + 8 * v17);
        if (!v19)
        {
          unint64_t v17 = v11 + 2;
          if (v11 + 2 >= v18) {
            goto LABEL_4;
          }
          unint64_t v19 = *(void *)(v22 + 8 * v17);
          if (!v19)
          {
            while (v18 - 3 != v11)
            {
              unint64_t v19 = *(void *)(a1 + 88 + 8 * v11++);
              if (v19)
              {
                unint64_t v17 = v11 + 2;
                goto LABEL_17;
              }
            }
            goto LABEL_4;
          }
        }
LABEL_17:
        int64_t v9 = __clz(__rbit64(v19)) + (v17 << 6);
      }
    }
LABEL_4:
    ++v7;
    uint64_t v6 = v9;
    if (v7 == v10) {
      return (uint64_t)v2;
    }
  }
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

void *sub_100018E24()
{
  type metadata accessor for PreviewShellService();
  swift_allocObject();
  uint64_t result = sub_100018E64();
  qword_100074170 = (uint64_t)result;
  return result;
}

void *sub_100018E64()
{
  int64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v31 - v7;
  uint64_t v9 = type metadata accessor for PreviewShellPluginRegistry();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v1[2] = _swiftEmptyDictionarySingleton;
  v1[3] = _swiftEmptyDictionarySingleton;
  v1[4] = [objc_allocWithZone((Class)type metadata accessor for UserAlertController()) init];
  ServerFarm.init()();
  if (qword_10006ECA0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_10000E620(v9, (uint64_t)qword_100074188);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v13, v9);
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))((uint64_t)v1 + OBJC_IVAR____TtC12PreviewShell19PreviewShellService_pluginRegistry, v12, v9);
  id v14 = [self sharedInstance];
  if (qword_10006EC90 != -1) {
    swift_once();
  }
  [v14 setDelegate:qword_100074160];

  id v15 = [self processInfo];
  id v16 = [v15 environment];

  uint64_t v17 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(void *)(v17 + 16) && (unint64_t v18 = sub_100009020(0xD000000000000012, 0x8000000100056880), (v19 & 1) != 0))
  {
    int64_t v20 = (uint64_t *)(*(void *)(v17 + 56) + 16 * v18);
    uint64_t v21 = *v20;
    unint64_t v22 = v20[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    static Logger.uv.getter();
    swift_bridgeObjectRetain();
    long long v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v31 = v21;
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v32 = v3;
      uint64_t v35 = v26;
      uint64_t v33 = v2;
      *(_DWORD *)uint64_t v25 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v34 = sub_100013F74(v31, v22, &v35);
      uint64_t v2 = v33;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "PreviewShell created with MallocStackLogging=%s", v25, 0xCu);
      swift_arrayDestroy();
      uint64_t v3 = v32;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    if ((isXTP.getter() & 1) == 0) {
      return v1;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    if ((isXTP.getter() & 1) == 0) {
      return v1;
    }
  }
  static Logger.uv.getter();
  id v27 = Logger.logObject.getter();
  os_log_type_t v28 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v27, v28))
  {
    id v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v29 = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "PreviewShell running in XTP", v29, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  return v1;
}

uint64_t sub_1000193A8(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for DeviceType();
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001D444(a1);
  if ((Agent.pid.getter() & 0x100000000) != 0)
  {
    swift_release();
    sub_10000758C(&qword_10006F000);
    LOBYTE(v17) = 2;
    return static Future<A>.succeeded(dsoHandle:file:line:column:function:)();
  }
  else
  {
    swift_beginAccess();
    uint64_t v20 = *(void *)(v1 + 24);
    __chkstk_darwin(v20);
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_10000758C(&qword_10006FAD8);
    uint64_t v17 = (char *)&type metadata for () + 8;
    uint64_t v18 = sub_100020384(&qword_10006FAE0, &qword_10006FAD8);
    uint64_t v15 = (uint64_t)&v15;
    uint64_t v16 = v6;
    Sequence.traverse<A>(dsoHandle:file:line:column:function:andAccumulateErrors:_:)();
    swift_release();
    swift_bridgeObjectRelease();
    Agent.deviceType.getter();
    uint64_t v7 = type metadata accessor for SimulatorDevicePayload();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v5, 1, v7) == 1)
    {
      if (qword_10006ECD0 != -1) {
        swift_once();
      }
      swift_beginAccess();
      uint64_t v8 = swift_bridgeObjectRetain();
      uint64_t v9 = (void *)sub_100018BB4(v8);
      uint64_t v10 = swift_bridgeObjectRelease();
    }
    else
    {
      if (qword_10006EC88 != -1) {
        swift_once();
      }
      assertUnreachable(file:line:column:function:)();
      uint64_t v10 = sub_100021200((uint64_t)v5, (uint64_t (*)(void))&type metadata accessor for DeviceType);
      uint64_t v9 = &_swiftEmptyArrayStorage;
    }
    uint64_t v21 = v9;
    __chkstk_darwin(v10);
    uint64_t v12 = sub_10000758C(&qword_10006FAE8);
    uint64_t v13 = sub_100020384(&qword_10006FAF0, &qword_10006FAE8);
    uint64_t v17 = (char *)&type metadata for () + 8;
    uint64_t v18 = v13;
    uint64_t v15 = (uint64_t)&v15;
    uint64_t v16 = v12;
    Sequence.traverse<A>(dsoHandle:file:line:column:function:andAccumulateErrors:_:)();
    swift_bridgeObjectRelease();
    LOBYTE(v17) = 2;
    uint64_t v14 = Future.ignoringValue(dsoHandle:file:line:column:function:)();
    swift_release();
    swift_release();
    return v14;
  }
}

uint64_t sub_100019824(uint64_t a1, uint64_t a2)
{
  uint64_t v111 = (char *)a2;
  uint64_t v99 = type metadata accessor for ExecutionLane();
  uint64_t v98 = *(void *)(v99 - 8);
  __chkstk_darwin(v99);
  v113 = (char *)&v85 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = type metadata accessor for AgentDescriptor();
  uint64_t v92 = *(void *)(v93 - 8);
  __chkstk_darwin(v93);
  v91 = (char *)&v85 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = type metadata accessor for Logger();
  uint64_t v89 = *(void *)(v90 - 8);
  __chkstk_darwin(v90);
  v109 = (char *)&v85 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v103 = type metadata accessor for PreviewAgentLauncherRegistry();
  uint64_t v102 = *(void *)(v103 - 8);
  __chkstk_darwin(v103);
  uint64_t v7 = (char *)&v85 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = type metadata accessor for ProcessType();
  uint64_t v104 = *(void *)(v106 - 8);
  uint64_t v8 = __chkstk_darwin(v106);
  v88 = (char *)&v85 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v85 - v10;
  uint64_t v116 = type metadata accessor for AgentDescriptor.Bundle();
  uint64_t v105 = *(void *)(v116 - 8);
  uint64_t v12 = __chkstk_darwin(v116);
  v97 = (char *)&v85 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v85 - v14;
  uint64_t v16 = type metadata accessor for DeviceType();
  __chkstk_darwin(v16 - 8);
  uint64_t v18 = (char *)&v85 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for LaunchPayload();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = __chkstk_darwin(v19);
  v108 = (char *)&v85 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = v22;
  __chkstk_darwin(v21);
  os_log_type_t v24 = (char *)&v85 - v23;
  uint64_t v25 = type metadata accessor for BatchIdentity();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v114 = v25;
  uint64_t v115 = v26;
  uint64_t v27 = __chkstk_darwin(v25);
  v110 = (char *)&v85 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = v28;
  __chkstk_darwin(v27);
  id v30 = (char *)&v85 - v29;
  uint64_t v112 = v20;
  uint64_t v33 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 16);
  uint64_t v31 = v20 + 16;
  uint64_t v32 = v33;
  v33(v24, a1, v19);
  sub_100020FC0((uint64_t)v111, (uint64_t)v18, (uint64_t (*)(void))&type metadata accessor for DeviceType);
  uint64_t v111 = v24;
  uint64_t v34 = v11;
  BatchIdentity.init(_:_:)();
  BatchIdentity.agentBundle.getter();
  LaunchPayload.processType.getter();
  PreviewShellPluginRegistry.launchers.getter();
  PreviewAgentLauncherRegistry.subscript.getter();
  (*(void (**)(char *, uint64_t))(v102 + 8))(v7, v103);
  if (v120)
  {
    v100 = v30;
    uint64_t v101 = v15;
    sub_10000E710(&v119, (uint64_t)v121);
    static Logger.uv.getter();
    uint64_t v103 = a1;
    uint64_t v102 = v31;
    v32(v108, a1, v19);
    uint64_t v35 = Logger.logObject.getter();
    os_log_type_t v36 = static os_log_type_t.default.getter();
    BOOL v37 = os_log_type_enabled(v35, v36);
    unint64_t v87 = v11;
    uint64_t v107 = v19;
    uint64_t v86 = v32;
    if (v37)
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      v88 = (char *)swift_slowAlloc();
      *(void *)&long long v119 = v88;
      *(_DWORD *)uint64_t v38 = 136315138;
      uint64_t v85 = v38 + 4;
      uint64_t v39 = (uint64_t)v91;
      uint64_t v40 = v108;
      LaunchPayload.agentDescriptor.getter();
      sub_100020E58(&qword_10006FB88, (void (*)(uint64_t))&type metadata accessor for AgentDescriptor);
      uint64_t v41 = v93;
      uint64_t v42 = dispatch thunk of CustomStringConvertible.description.getter();
      unint64_t v44 = v43;
      uint64_t v45 = v92;
      (*(void (**)(uint64_t, uint64_t))(v92 + 8))(v39, v41);
      uint64_t v118 = sub_100013F74(v42, v44, (uint64_t *)&v119);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v112 + 8))(v40, v107);
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "Preparing display & canvases for relaunch of %s", v38, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v89 + 8))(v109, v90);
      uint64_t v46 = v115;
      uint64_t v47 = v100;
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v112 + 8))(v108, v19);

      (*(void (**)(char *, uint64_t))(v89 + 8))(v109, v90);
      uint64_t v46 = v115;
      uint64_t v47 = v100;
      uint64_t v41 = v93;
      uint64_t v45 = v92;
      uint64_t v39 = (uint64_t)v91;
    }
    sub_10000758C(&qword_10006F000);
    sub_10000758C(&qword_10006F448);
    uint64_t v51 = swift_allocObject();
    *(_OWORD *)(v51 + 16) = xmmword_1000505A0;
    *(void *)(v51 + 32) = sub_10001F050();
    uint64_t v52 = v103;
    LaunchPayload.agentDescriptor.getter();
    uint64_t v53 = sub_1000193A8(v39);
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v39, v41);
    *(void *)(v51 + 40) = v53;
    *(void *)&long long v119 = v51;
    specialized Array._endMutation()();
    v109 = (char *)static Future.inverting(dsoHandle:file:line:column:function:accumulateErrors:_:)();
    swift_bridgeObjectRelease();
    uint64_t v54 = LaunchPayload.environment.getter();
    if (*(void *)(v54 + 16) && (unint64_t v55 = sub_100009020(0xD00000000000002FLL, 0x8000000100056B60), (v56 & 1) != 0))
    {
      double v57 = (uint64_t *)(*(void *)(v54 + 56) + 16 * v55);
      uint64_t v59 = *v57;
      uint64_t v58 = v57[1];
      swift_bridgeObjectRetain();
      uint64_t v60 = swift_bridgeObjectRelease();
      uint64_t v118 = 0;
      uint64_t v61 = __chkstk_darwin(v60);
      if ((v58 & 0x1000000000000000) != 0 || !(v58 & 0x2000000000000000 | v59 & 0x1000000000000000))
      {
        _StringGuts._slowWithCString<A>(_:)();
        swift_bridgeObjectRelease();
        int v64 = v119;
      }
      else
      {
        __chkstk_darwin(v61);
        if ((v58 & 0x2000000000000000) != 0)
        {
          *(void *)&long long v119 = v59;
          *((void *)&v119 + 1) = v58 & 0xFFFFFFFFFFFFFFLL;
          int v64 = (v59 > 0x20u || ((0x100003E01uLL >> v59) & 1) == 0)
             && (uint64_t v66 = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0
             && *v66 == 0;
          swift_bridgeObjectRelease();
        }
        else
        {
          if ((v59 & 0x1000000000000000) != 0)
          {
            uint64_t v62 = (v58 & 0xFFFFFFFFFFFFFFFLL) + 32;
            uint64_t v63 = v59 & 0xFFFFFFFFFFFFLL;
          }
          else
          {
            uint64_t v62 = _StringObject.sharedUTF8.getter();
          }
          int v64 = sub_10001EFF0(v62, v63, (void (*)(uint64_t *__return_ptr))sub_100020E14);
          swift_bridgeObjectRelease();
        }
        uint64_t v52 = v103;
      }
      v67 = (char *)v118;
      if ((v64 & 1) == 0) {
        v67 = 0;
      }
      v108 = v67;
      int v65 = v64 ^ 1;
    }
    else
    {
      swift_bridgeObjectRelease();
      v108 = 0;
      int v65 = 1;
    }
    LODWORD(v93) = v65;
    uint64_t v68 = v116;
    uint64_t v69 = v105;
    uint64_t v70 = v101;
    static ExecutionLane.main.getter();
    uint64_t v71 = v97;
    (*(void (**)(char *, char *, uint64_t))(v69 + 16))(v97, v70, v68);
    sub_10000FC80((uint64_t)v121, (uint64_t)&v119);
    (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v110, v47, v114);
    v86(v111, v52, v107);
    unint64_t v72 = (*(unsigned __int8 *)(v69 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80);
    unint64_t v73 = (v96 + v72 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v74 = (*(unsigned __int8 *)(v46 + 80) + v73 + 40) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80);
    unint64_t v75 = (v94 + v74 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v76 = v112;
    unint64_t v77 = (*(unsigned __int8 *)(v112 + 80) + v75 + 9) & ~(unint64_t)*(unsigned __int8 *)(v112 + 80);
    uint64_t v78 = swift_allocObject();
    *(void *)(v78 + 16) = v117;
    (*(void (**)(unint64_t, char *, uint64_t))(v69 + 32))(v78 + v72, v71, v68);
    sub_10000E710(&v119, v78 + v73);
    unint64_t v79 = v78 + v74;
    uint64_t v80 = v114;
    uint64_t v81 = v115;
    (*(void (**)(unint64_t, char *, uint64_t))(v115 + 32))(v79, v110, v114);
    unint64_t v82 = v78 + v75;
    *(void *)unint64_t v82 = v108;
    *(unsigned char *)(v82 + 8) = v93 & 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v76 + 32))(v78 + v77, v111, v107);
    swift_retain();
    v83 = v113;
    uint64_t v50 = Future.then<A>(dsoHandle:file:line:column:function:on:transform:)();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v98 + 8))(v83, v99);
    sub_10000FCE4((uint64_t)v121);
    (*(void (**)(char *, uint64_t))(v104 + 8))(v87, v106);
    (*(void (**)(char *, uint64_t))(v69 + 8))(v101, v116);
    (*(void (**)(char *, uint64_t))(v81 + 8))(v100, v80);
  }
  else
  {
    sub_10000FD9C((uint64_t)&v119, &qword_10006FB70);
    sub_10000758C(&qword_10006FB78);
    uint64_t v48 = v104;
    uint64_t v49 = v106;
    (*(void (**)(char *, char *, uint64_t))(v104 + 16))(v88, v11, v106);
    type metadata accessor for UnknownProcessType();
    sub_100020E58(&qword_10006FB80, (void (*)(uint64_t))&type metadata accessor for UnknownProcessType);
    swift_allocError();
    UnknownProcessType.init(processType:)();
    uint64_t v50 = static Future.failed(dsoHandle:file:line:column:function:_:)();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v34, v49);
    (*(void (**)(char *, uint64_t))(v105 + 8))(v15, v116);
    (*(void (**)(char *, uint64_t))(v115 + 8))(v30, v114);
    swift_errorRelease();
  }
  return v50;
}

uint64_t sub_10001A818(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v34 = a8;
  uint64_t v30 = a5;
  uint64_t v31 = a6;
  uint64_t v29 = a4;
  uint64_t v33 = type metadata accessor for AgentDescriptor.Bundle();
  uint64_t v10 = *(void *)(v33 - 8);
  __chkstk_darwin(v33);
  uint64_t v12 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10000758C(&qword_10006FB90);
  __chkstk_darwin(v13 - 8);
  uint64_t v14 = type metadata accessor for BatchIdentity();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28[1] = a2 + 16;
  swift_beginAccess();
  uint64_t v18 = *(void *)(a2 + 16);
  uint64_t v19 = *(void *)(v18 + 16);
  uint64_t v32 = a3;
  if (v19 && (unint64_t v20 = sub_10000916C(a3), (v21 & 1) != 0))
  {
    uint64_t v22 = *(void *)(*(void *)(v18 + 56) + 8 * v20);
    swift_endAccess();
    v36[0] = v22;
    v28[0] = type metadata accessor for Agent();
    sub_100020E58(&qword_10006FAD0, (void (*)(uint64_t))&type metadata accessor for Agent);
    swift_retain();
    Invalidatable.invalidate(dsoHandle:file:line:column:function:)();
  }
  else
  {
    swift_endAccess();
  }
  sub_10000FC80(v29, (uint64_t)v36);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v30, v14);
  ServerFarm.jitBootstrapAgentServer.getter();
  type metadata accessor for Agent();
  swift_allocObject();
  uint64_t v23 = Agent.init(launcher:batchIdentity:jitBootstrapAgentServer:jitBootstrapTimeout:)();
  uint64_t v24 = v33;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v32, v33);
  swift_beginAccess();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v35 = *(void *)(a2 + 16);
  *(void *)(a2 + 16) = 0x8000000000000000;
  sub_10000C794(v23, (uint64_t)v12, isUniquelyReferenced_nonNull_native);
  *(void *)(a2 + 16) = v35;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v24);
  swift_endAccess();
  uint64_t v26 = Agent.launch(with:killing:)();
  swift_release();
  swift_release();
  return v26;
}

uint64_t sub_10001ABDC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ExecutionLane();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v94 = v2;
  uint64_t v95 = v3;
  __chkstk_darwin(v2);
  uint64_t v89 = (char *)&v71 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t updated = type metadata accessor for ShellUpdatePayload();
  uint64_t v93 = *(void *)(updated - 8);
  uint64_t v5 = *(void *)(v93 + 64);
  __chkstk_darwin(updated);
  v97 = (char *)&v71 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for ContentProviderRegistry();
  uint64_t v91 = *(void *)(v6 - 8);
  uint64_t v92 = (char *)v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v71 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000758C(&qword_10006FB08);
  __chkstk_darwin(v9 - 8);
  uint64_t v10 = type metadata accessor for ContentCategory();
  __chkstk_darwin(v10 - 8);
  uint64_t v90 = (char *)&v71 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for ContentKey();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  uint64_t v15 = __chkstk_darwin(v12);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v71 - v16;
  uint64_t v99 = a1;
  int v18 = ShellUpdatePayload.pid.getter();
  uint64_t v19 = v98;
  uint64_t v20 = sub_10001B8A4(v18);
  if (!v19)
  {
    uint64_t v76 = v14;
    unint64_t v77 = (char *)&v71 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v86 = v5;
    uint64_t v22 = updated;
    uint64_t v23 = v97;
    uint64_t v98 = v20;
    uint64_t v83 = 0;
    uint64_t v85 = v13;
    uint64_t v88 = v12;
    ShellUpdatePayload.contentCategory.getter();
    ShellUpdatePayload.contentOverride.getter();
    ContentKey.init(for:with:)();
    PreviewShellPluginRegistry.providers.getter();
    uint64_t v24 = ContentProviderRegistry.boxRecipe(for:)();
    uint64_t v26 = v25;
    int v87 = v27;
    int v28 = ~(_BYTE)v27;
    (*(void (**)(char *, char *))(v91 + 8))(v8, v92);
    if (v28)
    {
      uint64_t v84 = v24;
      uint64_t v91 = v26;
      uint64_t v92 = v17;
      uint64_t v29 = v98;
      uint64_t v30 = v99;
      Agent.applyUpdateFor(payload:)();
      uint64_t v31 = *(void (**)(char *, uint64_t))(v93 + 16);
      uint64_t v32 = v93;
      uint64_t v79 = v93 + 16;
      uint64_t v78 = v31;
      ((void (*)(char *, uint64_t, uint64_t))v31)(v23, v30, v22);
      uint64_t v33 = *(unsigned __int8 *)(v32 + 80);
      uint64_t v80 = ~v33;
      uint64_t v73 = v33 + 16;
      uint64_t v34 = (v33 + 16) & ~v33;
      uint64_t v81 = v33;
      uint64_t v72 = v86 + 7;
      unint64_t v35 = (v86 + 7 + v34) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v75 = v33 | 7;
      uint64_t v36 = swift_allocObject();
      uint64_t v38 = *(void (**)(uint64_t, char *, uint64_t))(v32 + 32);
      uint64_t v37 = v32 + 32;
      unint64_t v82 = v38;
      v38(v36 + v34, v23, v22);
      *(void *)(v36 + v35) = v29;
      *(void *)(v36 + ((v35 + 15) & 0xFFFFFFFFFFFFFFF8)) = v102;
      swift_retain();
      swift_retain();
      uint64_t v39 = v89;
      static ExecutionLane.any.getter();
      sub_10000758C(&qword_10006FB18);
      uint64_t v90 = (char *)Future.mapSuccess<A>(dsoHandle:file:line:column:function:on:_:)();
      swift_release();
      swift_release();
      uint64_t v40 = v95 + 8;
      uint64_t v41 = *(uint64_t (**)(char *, uint64_t))(v95 + 8);
      uint64_t v42 = v41(v39, v94);
      unint64_t v74 = (void (*)(char *, uint64_t))v41;
      if (v87)
      {
        sub_10001FED4();
        static ExecutionLane.main.getter();
        uint64_t v50 = v97;
        uint64_t v95 = v40;
        uint64_t v51 = updated;
        v78(v97, v99);
        uint64_t v52 = (v81 + 24) & v80;
        unint64_t v53 = (v72 + v52) & 0xFFFFFFFFFFFFFFF8;
        uint64_t v54 = swift_allocObject();
        *(void *)(v54 + 16) = v102;
        v82(v54 + v52, v50, v51);
        *(void *)(v54 + v53) = v98;
        uint64_t v55 = swift_allocObject();
        *(void *)(v55 + 16) = sub_10001FFC4;
        *(void *)(v55 + 24) = v54;
        swift_retain();
        swift_retain();
        sub_10000758C(&qword_10006FB20);
        uint64_t v102 = Future.then<A>(dsoHandle:file:line:column:function:on:transform:)();
        swift_release();
        v41(v39, v94);
        static ExecutionLane.main.getter();
        uint64_t v56 = v85;
        double v57 = *(void (**)(char *, char *, uint64_t))(v85 + 16);
        uint64_t v58 = v77;
        uint64_t v93 = v37;
        uint64_t v59 = v88;
        v57(v77, v92, v88);
        uint64_t v60 = v97;
        uint64_t v61 = v51;
        ((void (*)(char *, uint64_t, uint64_t))v78)(v97, v99, v51);
        unint64_t v62 = (*(unsigned __int8 *)(v56 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
        unint64_t v63 = (v76 + v62 + 7) & 0xFFFFFFFFFFFFFFF8;
        unint64_t v64 = (v73 + v63) & v80;
        uint64_t v65 = swift_allocObject();
        (*(void (**)(unint64_t, char *, uint64_t))(v56 + 32))(v65 + v62, v58, v59);
        uint64_t v66 = (void *)(v65 + v63);
        uint64_t v67 = v84;
        uint64_t v68 = v91;
        void *v66 = v84;
        v66[1] = v68;
        v82(v65 + v64, v60, v61);
        uint64_t v69 = swift_allocObject();
        *(void *)(v69 + 16) = sub_1000201E0;
        *(void *)(v69 + 24) = v65;
        sub_10001FED4();
        type metadata accessor for PropertyList();
        uint64_t v70 = v89;
        uint64_t v13 = Future.then<A>(dsoHandle:file:line:column:function:on:transform:)();
        swift_release();
        swift_release();
        swift_release();
        LOBYTE(v59) = v87;
        sub_100020334(v67, v68, v87);
        sub_100020334(v67, v68, v59);
        swift_release();
        v74(v70, v94);
        (*(void (**)(char *, uint64_t))(v56 + 8))(v92, v88);
      }
      else
      {
        __chkstk_darwin(v42);
        uint64_t v43 = v91;
        swift_beginAccess();
        sub_10001FED4();
        sub_10000758C(&qword_10006FB28);
        sub_100020384(&qword_10006FB30, &qword_10006FB28);
        KeyValueMap.guaranteedValue(for:creatingIfNecessaryWith:)();
        swift_endAccess();
        sub_10000FC80((uint64_t)v101, (uint64_t)v100);
        uint64_t v44 = updated;
        uint64_t v45 = v97;
        ((void (*)(char *, uint64_t, uint64_t))v78)(v97, v99, updated);
        uint64_t v46 = (v81 + 56) & v80;
        uint64_t v47 = swift_allocObject();
        sub_10000E710(v100, v47 + 16);
        v82(v47 + v46, v45, v44);
        uint64_t v48 = swift_allocObject();
        *(void *)(v48 + 16) = sub_100020494;
        *(void *)(v48 + 24) = v47;
        static ExecutionLane.any.getter();
        type metadata accessor for PropertyList();
        uint64_t v13 = Future.then<A>(dsoHandle:file:line:column:function:on:transform:)();
        uint64_t v49 = v84;
        LOBYTE(v45) = v87;
        sub_100020334(v84, v43, v87);
        swift_release();
        swift_release();
        sub_100020334(v49, v43, v45);
        swift_release();
        v74(v39, v94);
        sub_10000FCE4((uint64_t)v101);
        (*(void (**)(char *, uint64_t))(v85 + 8))(v92, v88);
      }
    }
    else
    {
      ShellUpdatePayload.contentCategory.getter();
      uint64_t v13 = type metadata accessor for UnknownContentCategory();
      sub_100020E58(&qword_10006FB10, (void (*)(uint64_t))&type metadata accessor for UnknownContentCategory);
      swift_allocError();
      UnknownContentCategory.init(category:)();
      swift_willThrow();
      swift_release();
      (*(void (**)(char *, uint64_t))(v85 + 8))(v17, v88);
    }
  }
  return v13;
}

uint64_t sub_10001B8A4(int a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = v3 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(v3 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain_n();
  int64_t v10 = 0;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v10 << 6);
LABEL_25:
    uint64_t v16 = *(void *)(*(void *)(v3 + 56) + 8 * v12);
    swift_retain();
    uint64_t v17 = Agent.pid.getter();
    if ((v17 & 0x100000000) == 0 && v17 == a1)
    {
      swift_release();
      swift_bridgeObjectRelease();
      return v16;
    }
    uint64_t result = swift_release();
  }
  int64_t v13 = v10 + 1;
  if (__OFADD__(v10, 1))
  {
    __break(1u);
    goto LABEL_31;
  }
  if (v13 >= v8) {
    goto LABEL_28;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  ++v10;
  if (v14) {
    goto LABEL_24;
  }
  int64_t v10 = v13 + 1;
  if (v13 + 1 >= v8) {
    goto LABEL_28;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v10);
  if (v14) {
    goto LABEL_24;
  }
  int64_t v10 = v13 + 2;
  if (v13 + 2 >= v8) {
    goto LABEL_28;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v10);
  if (v14) {
    goto LABEL_24;
  }
  int64_t v10 = v13 + 3;
  if (v13 + 3 >= v8) {
    goto LABEL_28;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v10);
  if (v14) {
    goto LABEL_24;
  }
  int64_t v10 = v13 + 4;
  if (v13 + 4 >= v8) {
    goto LABEL_28;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v10);
  if (v14)
  {
LABEL_24:
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v10 << 6);
    goto LABEL_25;
  }
  int64_t v15 = v13 + 5;
  if (v15 >= v8)
  {
LABEL_28:
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v16 = type metadata accessor for AgentLocatingError();
    sub_100020E58(&qword_10006FAC0, (void (*)(uint64_t))&type metadata accessor for AgentLocatingError);
    swift_allocError();
    *int v18 = a1;
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    return v16;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
    int64_t v10 = v15;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v10 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v10 >= v8) {
      goto LABEL_28;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v10);
    ++v15;
    if (v14) {
      goto LABEL_24;
    }
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_10001BAE8@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v41 = a3;
  uint64_t v39 = a2;
  uint64_t v45 = a4;
  uint64_t v5 = sub_10000758C(&qword_10006FB60);
  __chkstk_darwin(v5 - 8);
  uint64_t v43 = (char *)v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000758C(&qword_10006FB68);
  __chkstk_darwin(v7 - 8);
  uint64_t v40 = (char *)v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for ContentIdentifier();
  __chkstk_darwin(v9 - 8);
  uint64_t v37 = (char *)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = type metadata accessor for AgentUpdate.Context();
  uint64_t v42 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  uint64_t v38 = (char *)v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t updated = type metadata accessor for UpdateSetupPayload();
  uint64_t v35 = *(void *)(updated - 8);
  uint64_t v36 = updated;
  __chkstk_darwin(updated);
  unint64_t v14 = (char *)v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for SceneInjector();
  __chkstk_darwin(v15 - 8);
  uint64_t v16 = type metadata accessor for ServerFarm();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for AgentDescriptor.Bundle();
  __chkstk_darwin(v20 - 8);
  uint64_t v21 = type metadata accessor for PreviewAgentConnector();
  uint64_t v33 = *(void *)(v21 - 8);
  uint64_t v34 = v21;
  __chkstk_darwin(v21);
  v32[1] = *a1;
  ShellUpdatePayload.pid.getter();
  Agent.agentBundle.getter();
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, v41 + OBJC_IVAR____TtC12PreviewShell19PreviewShellService_serverFarm, v16);
  SceneInjector.init(injectScene:)();
  PreviewAgentConnector.init(pid:agentBundle:serverFarm:sceneInjector:)();
  ShellUpdatePayload.setupPayload.getter();
  UpdateSetupPayload.shellDidLoadStaticProducts.setter();
  ShellUpdatePayload.contentIdentifier.getter();
  ShellUpdatePayload.hostUpdateSeed.getter();
  uint64_t v23 = v35;
  uint64_t v22 = v36;
  uint64_t v24 = v43;
  (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v43, v14, v36);
  uint64_t v25 = v23;
  uint64_t v26 = *(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56);
  uint64_t v27 = v22;
  v26(v24, 0, 1, v22);
  int v28 = v38;
  AgentUpdate.Context.init(contentIdentifier:updateSeed:setupPayload:)();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v27);
  uint64_t v29 = sub_10000758C(&qword_10006FB18);
  uint64_t v30 = v45 + *(int *)(v29 + 48);
  (*(void (**)(void))(v33 + 32))();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v42 + 32))(v30, v28, v44);
}

uint64_t sub_10001C00C(int a1, uint64_t a2, uint64_t a3)
{
  return sub_10003B5B0(a1, a2, a3);
}

uint64_t sub_10001C024(uint64_t a1, uint64_t a2, void *a3)
{
  v14[0] = a1;
  v14[1] = a2;
  uint64_t v4 = type metadata accessor for PreviewType();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for PropertyList();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000FC3C(a3, a3[3]);
  ShellUpdatePayload.contentPayload.getter();
  ShellUpdatePayload.previewType.getter();
  uint64_t v12 = dispatch thunk of NonUIContentProviderBox.performUpdate(using:updatePayload:previewType:agentContext:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v12;
}

uint64_t sub_10001C1DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v30 = a5;
  uint64_t v33 = a2;
  uint64_t v31 = type metadata accessor for AgentUpdate.Context();
  uint64_t v6 = *(void *)(v31 - 8);
  uint64_t v32 = *(void *)(v6 + 64);
  __chkstk_darwin(v31);
  uint64_t v29 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = type metadata accessor for PreviewAgentConnector();
  uint64_t v8 = *(void *)(v28 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v28);
  uint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000758C(&qword_10006FB38);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for PreviewType();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  ShellUpdatePayload.previewType.getter();
  uint64_t v30 = sub_10001F268((uint64_t)v17, v30);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  uint64_t v18 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v13, 1, 1, v18);
  uint64_t v19 = a1;
  uint64_t v20 = v28;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v19, v28);
  uint64_t v21 = v29;
  uint64_t v22 = v31;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v29, v33, v31);
  unint64_t v23 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v24 = (v9 + *(unsigned __int8 *)(v6 + 80) + v23) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v25 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v25 + v23, v10, v20);
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v25 + v24, v21, v22);
  sub_10000758C(&qword_10006FB20);
  uint64_t v26 = Future.then<A>(dsoHandle:file:line:column:function:priority:transform:)();
  swift_release();
  swift_release();
  sub_10000FD9C((uint64_t)v13, &qword_10006FB38);
  return v26;
}

uint64_t sub_10001C5A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return _swift_task_switch(sub_10001C5CC, 0, 0);
}

uint64_t sub_10001C5CC()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[5];
  uint64_t v4 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = sub_10000758C(&qword_10006FB20);
  uint64_t v6 = v4 + *(int *)(v5 + 48);
  uint64_t v7 = v4 + *(int *)(v5 + 64);
  uint64_t v8 = type metadata accessor for PreviewAgentConnector();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v4, v1, v8);
  uint64_t v9 = type metadata accessor for AgentUpdate.Context();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v6, v2, v9);
  sub_10000FC80(v3, v7);
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_10001C6E0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v20 = a2;
  uint64_t v21 = a6;
  uint64_t v19 = a5;
  uint64_t v9 = type metadata accessor for PropertyList();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = a3[3];
  uint64_t v13 = a3[4];
  sub_10000FC3C(a3, v14);
  ShellUpdatePayload.contentPayload.getter();
  uint64_t updated = ShellUpdatePayload.controlStates.getter();
  uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 48))(a4, a1, v19, v21, v12, updated, v20, v14, v13);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v16;
}

uint64_t sub_10001C83C(int a1)
{
  uint64_t v4 = type metadata accessor for ExecutionLane();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DeviceType();
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10001B8A4(a1);
  if (!v2)
  {
    uint64_t v12 = v11;
    uint64_t v27 = v5;
    uint64_t v28 = v4;
    swift_beginAccess();
    uint64_t v29 = *(void *)(v1 + 24);
    __chkstk_darwin(v29);
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_10000758C(&qword_10006FAD8);
    unint64_t v24 = (char *)&type metadata for () + 8;
    uint64_t v25 = sub_100020384(&qword_10006FAE0, &qword_10006FAD8);
    uint64_t v22 = (uint64_t (*)(uint64_t))&v22;
    uint64_t v23 = v13;
    Sequence.traverse<A>(dsoHandle:file:line:column:function:andAccumulateErrors:_:)();
    swift_release();
    swift_bridgeObjectRelease();
    Agent.deviceType.getter();
    uint64_t v14 = type metadata accessor for SimulatorDevicePayload();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48))(v10, 1, v14) == 1)
    {
      if (qword_10006ECD0 != -1) {
        swift_once();
      }
      swift_beginAccess();
      uint64_t v15 = swift_bridgeObjectRetain();
      uint64_t v16 = (void *)sub_100018BB4(v15);
      uint64_t v17 = swift_bridgeObjectRelease();
    }
    else
    {
      if (qword_10006EC88 != -1) {
        swift_once();
      }
      assertUnreachable(file:line:column:function:)();
      uint64_t v17 = sub_100021200((uint64_t)v10, (uint64_t (*)(void))&type metadata accessor for DeviceType);
      uint64_t v16 = &_swiftEmptyArrayStorage;
    }
    uint64_t v30 = v16;
    __chkstk_darwin(v17);
    uint64_t v18 = sub_10000758C(&qword_10006FAE8);
    uint64_t v19 = sub_100020384(&qword_10006FAF0, &qword_10006FAE8);
    unint64_t v24 = (char *)&type metadata for () + 8;
    uint64_t v25 = v19;
    uint64_t v22 = (uint64_t (*)(uint64_t))&v22;
    uint64_t v23 = v18;
    Sequence.traverse<A>(dsoHandle:file:line:column:function:andAccumulateErrors:_:)();
    swift_bridgeObjectRelease();
    uint64_t v20 = swift_allocObject();
    *(_DWORD *)(v20 + 16) = a1;
    *(void *)(v20 + 24) = v12;
    swift_retain();
    static ExecutionLane.any.getter();
    uint64_t v23 = v20;
    unint64_t v24 = (char *)&type metadata for () + 8;
    uint64_t v22 = sub_10001FD54;
    uint64_t v1 = Future.then<A>(dsoHandle:file:line:column:function:on:transform:)();
    swift_release();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v7, v28);
  }
  return v1;
}

uint64_t sub_10001CD50(uint64_t a1, int a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.uv.getter();
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 67240192;
    v11[3] = a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Canvases now stopped for %{public}d, killing process", v9, 8u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return Agent.kill()();
}

uint64_t sub_10001CED0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for AgentDescriptor.Bundle();
  v24[0] = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = a1;
  uint64_t v7 = PurgePayload.workspaceID.getter();
  uint64_t v9 = v8;
  if (qword_10006EC88 != -1) {
    swift_once();
  }
  uint64_t v10 = (uint64_t *)(v2 + 16);
  swift_beginAccess();
  uint64_t v11 = swift_bridgeObjectRetain();
  unint64_t v12 = sub_10001F76C(v11, v7, v9);
  swift_bridgeObjectRelease();
  if (!(v12 >> 62))
  {
    uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v13) {
      goto LABEL_5;
    }
    return swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain();
  uint64_t result = _CocoaArrayWrapper.endIndex.getter();
  uint64_t v13 = result;
  if (!result) {
    return swift_bridgeObjectRelease_n();
  }
LABEL_5:
  if (v13 >= 1)
  {
    uint64_t v15 = 0;
    unint64_t v26 = v12;
    uint64_t v27 = (void (**)(unint64_t, uint64_t))(v24[0] + 8);
    v24[1] = (v24[0] + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    unint64_t v25 = v12 & 0xC000000000000001;
    do
    {
      if (v25)
      {
        uint64_t v17 = specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else
      {
        uint64_t v17 = *(void *)(v12 + 8 * v15 + 32);
        swift_retain();
      }
      if (PurgePayload.killAgents.getter())
      {
        Agent.kill()();
        swift_release();
      }
      uint64_t v30 = v17;
      type metadata accessor for Agent();
      sub_100020E58(&qword_10006FAD0, (void (*)(uint64_t))&type metadata accessor for Agent);
      Invalidatable.invalidate(dsoHandle:file:line:column:function:)();
      Agent.agentBundle.getter();
      swift_beginAccess();
      swift_bridgeObjectRetain();
      unint64_t v18 = sub_10000916C((uint64_t)v6);
      char v20 = v19;
      swift_bridgeObjectRelease();
      if (v20)
      {
        int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v22 = *v10;
        uint64_t v29 = *v10;
        *uint64_t v10 = 0x8000000000000000;
        if (!isUniquelyReferenced_nonNull_native)
        {
          sub_10000D1B8();
          uint64_t v22 = v29;
        }
        uint64_t v16 = *(void (**)(unint64_t, uint64_t))(v24[0] + 8);
        v16(*(void *)(v22 + 48) + *(void *)(v24[0] + 72) * v18, v4);
        uint64_t v23 = v29;
        sub_10000BBE0(v18, v29);
        *uint64_t v10 = v23;
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v16 = *v27;
      }
      ++v15;
      v16((unint64_t)v6, v4);
      swift_endAccess();
      swift_release();
      swift_release();
      unint64_t v12 = v26;
    }
    while (v13 != v15);
    return swift_bridgeObjectRelease_n();
  }
  __break(1u);
  return result;
}

uint64_t sub_10001D260(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for AgentDescriptor.Bundle();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  AgentDescriptor.Bundle.init(bundleID:path:)();
  swift_beginAccess();
  uint64_t v9 = *(void *)(v2 + 16);
  if (*(void *)(v9 + 16) && (unint64_t v10 = sub_10000916C((uint64_t)v8), (v11 & 1) != 0))
  {
    uint64_t v12 = *(void *)(*(void *)(v9 + 56) + 8 * v10);
    swift_endAccess();
    uint64_t v13 = *(void (**)(char *, uint64_t))(v6 + 8);
    swift_retain();
    v13(v8, v5);
  }
  else
  {
    swift_endAccess();
    uint64_t v12 = type metadata accessor for AgentLocatingError();
    sub_100020E58(&qword_10006FAC0, (void (*)(uint64_t))&type metadata accessor for AgentLocatingError);
    swift_allocError();
    *uint64_t v14 = a1;
    v14[1] = a2;
    swift_storeEnumTagMultiPayload();
    swift_bridgeObjectRetain();
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return v12;
}

uint64_t sub_10001D444(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for AgentDescriptor.Bundle();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  AgentDescriptor.bundle.getter();
  swift_beginAccess();
  uint64_t v7 = *(void *)(v1 + 16);
  if (*(void *)(v7 + 16) && (unint64_t v8 = sub_10000916C((uint64_t)v6), (v9 & 1) != 0))
  {
    uint64_t v10 = *(void *)(*(void *)(v7 + 56) + 8 * v8);
    swift_endAccess();
    char v11 = *(void (**)(char *, uint64_t))(v4 + 8);
    swift_retain();
    v11(v6, v3);
  }
  else
  {
    swift_endAccess();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v10 = type metadata accessor for AgentLocatingError();
    sub_100020E58(&qword_10006FAC0, (void (*)(uint64_t))&type metadata accessor for AgentLocatingError);
    swift_allocError();
    uint64_t v13 = v12;
    uint64_t v14 = type metadata accessor for AgentDescriptor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v13, a1, v14);
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
  }
  return v10;
}

uint64_t sub_10001D648@<X0>(uint64_t *a1@<X8>)
{
  if (qword_10006ECC8 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10006FDB8;
  if (byte_10006FDC0)
  {
    swift_errorRetain();
    sub_10000758C(&qword_10006EFF0);
    return swift_willThrowTypedImpl();
  }
  else
  {
    a1[3] = type metadata accessor for StaticPreviewCanvas();
    a1[4] = sub_100020E58(&qword_10006FB58, (void (*)(uint64_t))type metadata accessor for StaticPreviewCanvas);
    *a1 = v2;
    return swift_retain();
  }
}

uint64_t sub_10001D740()
{
  uint64_t v0 = type metadata accessor for BatchIdentity();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10006EC88 != -1) {
    swift_once();
  }
  Agent.batchIdentity.getter();
  assertUnreachable(file:line:column:function:)();
  sub_100020920();
  swift_allocError();
  swift_willThrow();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_10001D88C()
{
  uint64_t v1 = type metadata accessor for ExecutionLane();
  uint64_t v33 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v32 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for DeviceType();
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000758C(&qword_10006FB98);
  __chkstk_darwin(v6 - 8);
  unint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for PreviewCache.Replayable(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v29 - v14;
  assertMainThread(file:line:column:function:)();
  if (qword_10006ECD8 != -1) {
    swift_once();
  }
  if (qword_1000741B8)
  {
    uint64_t v31 = v1;
    uint64_t v16 = qword_1000741B8 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_replayable;
    swift_beginAccess();
    sub_100020EF4(v16, (uint64_t)v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
    {
      swift_retain();
      sub_10000FD9C((uint64_t)v8, &qword_10006FB98);
      sub_10000758C(&qword_10006F000);
      sub_100020EA0();
      swift_allocError();
      *uint64_t v17 = 1;
      uint64_t v18 = static Future.failed(dsoHandle:file:line:column:function:_:)();
      swift_errorRelease();
      swift_release();
    }
    else
    {
      uint64_t v22 = (uint64_t)v15;
      sub_100020F5C((uint64_t)v8, (uint64_t)v15);
      uint64_t v23 = type metadata accessor for SimulatorDevicePayload();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v5, 1, 1, v23);
      swift_retain();
      uint64_t v30 = v15;
      sub_100019824((uint64_t)v15, (uint64_t)v5);
      sub_100021200((uint64_t)v5, (uint64_t (*)(void))&type metadata accessor for DeviceType);
      unint64_t v24 = v32;
      static ExecutionLane.main.getter();
      sub_100020FC0(v22, (uint64_t)v13, type metadata accessor for PreviewCache.Replayable);
      unint64_t v25 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
      uint64_t v26 = swift_allocObject();
      sub_100020F5C((uint64_t)v13, v26 + v25);
      *(void *)(v26 + ((v11 + v25 + 7) & 0xFFFFFFFFFFFFFFF8)) = v0;
      type metadata accessor for PropertyList();
      swift_retain();
      Future.tryThen<A>(dsoHandle:file:line:column:function:on:transform:)();
      swift_release();
      swift_release();
      uint64_t v27 = *(void (**)(char *, uint64_t))(v33 + 8);
      uint64_t v28 = v31;
      v27(v24, v31);
      static ExecutionLane.main.getter();
      swift_retain();
      Future.observeFailure(on:_:)();
      swift_release();
      v27(v24, v28);
      uint64_t v18 = Future.ignoringValue(dsoHandle:file:line:column:function:)();
      swift_release();
      swift_release();
      sub_100021200((uint64_t)v30, type metadata accessor for PreviewCache.Replayable);
    }
    return v18;
  }
  else
  {
    sub_10000758C(&qword_10006F000);
    sub_100020EA0();
    swift_allocError();
    *char v19 = 0;
    uint64_t v20 = static Future.failed(dsoHandle:file:line:column:function:_:)();
    swift_errorRelease();
    return v20;
  }
}

uint64_t sub_10001DEB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v33 = a3;
  uint64_t v28 = a2;
  uint64_t updated = type metadata accessor for UpdateSetupPayload();
  __chkstk_darwin(updated - 8);
  uint64_t v32 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for PropertyList();
  __chkstk_darwin(v6 - 8);
  uint64_t v31 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000758C(&qword_10006FB08);
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = type metadata accessor for ContentCategory();
  __chkstk_darwin(v9 - 8);
  uint64_t v10 = type metadata accessor for ContentIdentifier();
  __chkstk_darwin(v10 - 8);
  uint64_t v11 = type metadata accessor for PreviewType();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10000758C(&qword_10006FB68);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26[1] = v17;
  uint64_t v18 = type metadata accessor for ShellUpdatePayload();
  uint64_t v29 = *(void *)(v18 - 8);
  uint64_t v30 = v18;
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)v26 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000212C8(a1, (uint64_t)v34);
  int v27 = ProcessID.pid.getter();
  uint64_t v21 = type metadata accessor for HostUpdateSeed();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v17, 1, 1, v21);
  uint64_t v22 = enum case for PreviewType.HostLocation.mainScene(_:);
  uint64_t v23 = type metadata accessor for PreviewType.HostLocation();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 104))(v14, v22, v23);
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, enum case for PreviewType.hosted(_:), v11);
  type metadata accessor for PreviewCache.Replayable(0);
  ShellUpdatePayload.contentIdentifier.getter();
  ShellUpdatePayload.contentCategory.getter();
  ShellUpdatePayload.contentOverride.getter();
  ShellUpdatePayload.contentPayload.getter();
  ShellUpdatePayload.staticProducts.getter();
  ShellUpdatePayload.setupPayload.getter();
  ShellUpdatePayload.controlStates.getter();
  ShellUpdatePayload.init(pid:hostUpdateSeed:previewType:contentIdentifier:contentCategory:contentOverride:contentPayload:staticProducts:setupPayload:controlStates:)();
  uint64_t v24 = sub_10001ABDC((uint64_t)v20);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v20, v30);
  return v24;
}

uint64_t sub_10001E328(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_10000758C(&qword_10006FB98);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for PreviewCache.Replayable(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = a2 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_replayable;
  swift_beginAccess();
  sub_100021260((uint64_t)v5, v7);
  swift_endAccess();
  return sub_10002CBE0();
}

uint64_t sub_10001E41C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC12PreviewShell19PreviewShellService_serverFarm;
  uint64_t v2 = type metadata accessor for ServerFarm();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = (char *)v0 + OBJC_IVAR____TtC12PreviewShell19PreviewShellService_pluginRegistry;
  uint64_t v4 = type metadata accessor for PreviewShellPluginRegistry();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *((unsigned int *)*v0 + 12);
  uint64_t v6 = *((unsigned __int16 *)*v0 + 26);

  return _swift_deallocClassInstance(v0, v5, v6);
}

uint64_t sub_10001E518()
{
  return type metadata accessor for PreviewShellService();
}

uint64_t type metadata accessor for PreviewShellService()
{
  uint64_t result = qword_10006FA18;
  if (!qword_10006FA18) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10001E56C()
{
  uint64_t result = type metadata accessor for ServerFarm();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for PreviewShellPluginRegistry();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_10001E658()
{
  return PreviewShellPluginRegistry.providers.getter();
}

uint64_t sub_10001E688@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + OBJC_IVAR____TtC12PreviewShell19PreviewShellService_serverFarm;
  uint64_t v4 = type metadata accessor for ServerFarm();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t sub_10001E700(uint64_t a1, uint64_t a2)
{
  return sub_100019824(a1, a2);
}

uint64_t sub_10001E724()
{
  uint64_t v0 = type metadata accessor for AgentDescriptor();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  PrepareToRelaunchPayload.agentDescriptor.getter();
  uint64_t v4 = sub_1000193A8((uint64_t)v3);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

uint64_t sub_10001E80C(uint64_t a1)
{
  return sub_10001ABDC(a1);
}

uint64_t sub_10001E830(int a1)
{
  return sub_10001C83C(a1);
}

uint64_t sub_10001E854()
{
  return static Future<A>.succeeded(dsoHandle:file:line:column:function:)();
}

uint64_t sub_10001E8C8(uint64_t a1)
{
  return sub_10001CED0(a1);
}

uint64_t sub_10001E8EC()
{
  return OSCapabilities.init(supportsExecutionPoints:supportsPreviewVariants:supportsContentOverrides:supportsScreenshotRequests:supportsNSPreviewHostableMacPreviews:supportsNSPreviewHostableCatalystPreviews:supportsPerUpdateMessageStreams:supportsRegistryPreviews:supportsExternalRegistries:jitCapabilities:)();
}

uint64_t sub_10001E95C()
{
  uint64_t v0 = AgentDescriptor.Bundle.bundleID.getter();
  sub_100021A10(v0, v1);

  return swift_bridgeObjectRelease();
}

uint64_t sub_10001E9B4(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  if (qword_10006ECD8 != -1) {
    uint64_t result = swift_once();
  }
  if (qword_1000741B8) {
    return sub_10002C2CC(v3, a2);
  }
  return result;
}

uint64_t sub_10001EA28(uint64_t a1)
{
  return sub_10001D444(a1);
}

uint64_t sub_10001EA4C(int a1)
{
  return sub_10001B8A4(a1);
}

BOOL sub_10001EA70(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_10001EA88()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10001EAD0()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10001EAFC()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void *sub_10001EB40(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t sub_10001EBE4@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_10001EC14(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10001EC54(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10001EC34(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10001EDC4(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_10001EC54(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000758C(&qword_10006FBB0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
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

uint64_t sub_10001EDC4(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_10000758C(&qword_10006FAF8);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = &_swiftEmptyArrayStorage;
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    sub_10000758C(&qword_10006FB00);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10001EF68(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
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
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
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

uint64_t sub_10001EFF0(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
{
  if (a1)
  {
    a3(&var2);
    if (!v3) {
      char v4 = var2;
    }
  }
  else
  {
    ((void (*)(uint64_t *__return_ptr, void, void))a3)((uint64_t *)((char *)&var2 + 1), 0, 0);
    if (!v3) {
      char v4 = BYTE1(var2);
    }
  }
  return v4 & 1;
}

uint64_t sub_10001F050()
{
  uint64_t v0 = type metadata accessor for DeviceType();
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  BatchIdentity.deviceType.getter();
  uint64_t v3 = type metadata accessor for SimulatorDevicePayload();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v3 - 8) + 48))(v2, 1, v3) == 1)
  {
    sub_10000758C(&qword_10006F000);
    return static Future<A>.succeeded(dsoHandle:file:line:column:function:)();
  }
  else
  {
    sub_100021200((uint64_t)v2, (uint64_t (*)(void))&type metadata accessor for DeviceType);
    if (qword_10006EC88 != -1) {
      swift_once();
    }
    assertUnreachable(file:line:column:function:)();
    sub_10000758C(&qword_10006F000);
    sub_100020920();
    swift_allocError();
    uint64_t v4 = static Future.failed(dsoHandle:file:line:column:function:_:)();
    swift_errorRelease();
  }
  return v4;
}

uint64_t sub_10001F268(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PreviewType.HostLocation();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for PreviewType();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v34 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v33 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v33 - v15;
  uint64_t v17 = type metadata accessor for DeviceType();
  __chkstk_darwin(v17 - 8);
  uint64_t v19 = (char *)&v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  Agent.deviceType.getter();
  uint64_t v20 = type metadata accessor for SimulatorDevicePayload();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 48))(v19, 1, v20) != 1)
  {
    uint64_t v26 = sub_10000758C(&qword_10006FB50);
    __chkstk_darwin(v26);
    uint64_t v32 = a2;
    uint64_t v30 = sub_100020904;
    uint64_t v31 = &v29;
    char v29 = 2;
    uint64_t v25 = static Future.completed(dsoHandle:file:line:column:function:_:)();
    sub_100021200((uint64_t)v19, (uint64_t (*)(void))&type metadata accessor for DeviceType);
    return v25;
  }
  uint64_t v21 = v5;
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  uint64_t v33 = a1;
  v22(v16, a1, v8);
  int v23 = (*(uint64_t (**)(char *, uint64_t))(v9 + 88))(v16, v8);
  if (v23 == enum case for PreviewType.hosted(_:))
  {
    (*(void (**)(char *, uint64_t))(v9 + 96))(v16, v8);
    uint64_t v24 = v21;
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v7, v16, v4);
    if (qword_10006ECD0 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_100025724((uint64_t)v7);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v4);
    return v25;
  }
  if (v23 == enum case for PreviewType.static(_:))
  {
    sub_10000758C(&qword_10006FB50);
    uint64_t v30 = sub_10001D648;
    uint64_t v31 = 0;
    char v29 = 2;
    return static Future.completed(dsoHandle:file:line:column:function:_:)();
  }
  v22(v14, v33, v8);
  unint64_t v35 = 0;
  unint64_t v36 = 0xE000000000000000;
  _StringGuts.grow(_:)(23);
  swift_bridgeObjectRelease();
  unint64_t v35 = 0xD000000000000015;
  unint64_t v36 = 0x8000000100056AF0;
  v22(v34, (uint64_t)v14, v8);
  v28._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v28);
  swift_bridgeObjectRelease();
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10001F76C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v28 = type metadata accessor for BatchIdentity();
  uint64_t result = __chkstk_darwin(v28);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v10 = 0;
  uint64_t v29 = a1;
  uint64_t v13 = *(void *)(a1 + 64);
  uint64_t v12 = a1 + 64;
  uint64_t v11 = v13;
  uint64_t v30 = &_swiftEmptyArrayStorage;
  uint64_t v14 = 1 << *(unsigned char *)(v12 - 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  uint64_t i = v15 & v11;
  uint64_t v26 = v12;
  int64_t v27 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v17 = (void (**)(char *, uint64_t))(v7 + 8);
  if ((v15 & v11) != 0) {
    goto LABEL_7;
  }
LABEL_8:
  while (2)
  {
    int64_t v18 = v10 + 1;
    if (!__OFADD__(v10, 1))
    {
      if (v18 < v27)
      {
        uint64_t v19 = *(void *)(v26 + 8 * v18);
        ++v10;
        if (v19) {
          goto LABEL_23;
        }
        int64_t v10 = v18 + 1;
        if (v18 + 1 >= v27) {
          goto LABEL_29;
        }
        uint64_t v19 = *(void *)(v26 + 8 * v10);
        if (v19) {
          goto LABEL_23;
        }
        int64_t v10 = v18 + 2;
        if (v18 + 2 >= v27) {
          goto LABEL_29;
        }
        uint64_t v19 = *(void *)(v26 + 8 * v10);
        if (v19) {
          goto LABEL_23;
        }
        int64_t v10 = v18 + 3;
        if (v18 + 3 >= v27) {
          goto LABEL_29;
        }
        uint64_t v19 = *(void *)(v26 + 8 * v10);
        if (v19)
        {
LABEL_23:
          for (uint64_t i = (v19 - 1) & v19; ; i &= i - 1)
          {
            swift_retain();
            Agent.batchIdentity.getter();
            uint64_t v21 = BatchIdentity.workspaceID.getter();
            uint64_t v23 = v22;
            (*v17)(v9, v28);
            if (v21 == a2 && v23 == a3) {
              break;
            }
            char v24 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            if (v24) {
              goto LABEL_6;
            }
            uint64_t result = swift_release();
            if (!i) {
              goto LABEL_8;
            }
LABEL_7:
            ;
          }
          swift_bridgeObjectRelease();
LABEL_6:
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          uint64_t result = specialized ContiguousArray._endMutation()();
          if (!i) {
            continue;
          }
          goto LABEL_7;
        }
        int64_t v20 = v18 + 4;
        if (v20 < v27)
        {
          uint64_t v19 = *(void *)(v26 + 8 * v20);
          if (v19)
          {
            int64_t v10 = v20;
            goto LABEL_23;
          }
          while (1)
          {
            int64_t v10 = v20 + 1;
            if (__OFADD__(v20, 1)) {
              goto LABEL_31;
            }
            if (v10 >= v27) {
              break;
            }
            uint64_t v19 = *(void *)(v26 + 8 * v10);
            ++v20;
            if (v19) {
              goto LABEL_23;
            }
          }
        }
      }
LABEL_29:
      swift_release();
      return (uint64_t)v30;
    }
    break;
  }
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_10001FA50(uint64_t a1)
{
  uint64_t v2 = sub_10000758C(&qword_10006FAC8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for AgentDescriptor.Bundle();
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for AgentDescriptor();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t result = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10006ECD8 != -1) {
    uint64_t result = swift_once();
  }
  if (qword_1000741B8)
  {
    LaunchPayload.agentDescriptor.getter();
    AgentDescriptor.bundle.getter();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    uint64_t v13 = type metadata accessor for LaunchPayload();
    uint64_t v14 = *(void *)(v13 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v4, a1, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v4, 0, 1, v13);
    swift_beginAccess();
    sub_100018988((uint64_t)v4, (uint64_t)v7);
    return swift_endAccess();
  }
  return result;
}

uint64_t sub_10001FCAC(void *a1)
{
  return sub_10002098C(a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&dispatch thunk of NonUIContentProviderBox.stop(of:));
}

uint64_t sub_10001FCC4(void *a1)
{
  uint64_t v2 = *(unsigned int *)(v1 + 16);
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  sub_10000FC3C(a1, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 40))(v2, v3, v4);
}

uint64_t sub_10001FD1C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001FD54(uint64_t a1)
{
  return sub_10001CD50(a1, *(_DWORD *)(v1 + 16));
}

uint64_t sub_10001FD60()
{
  uint64_t updated = type metadata accessor for ShellUpdatePayload();
  uint64_t v2 = *(void *)(updated - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, updated);
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_10001FE1C@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for ShellUpdatePayload() - 8);
  unint64_t v6 = (*(void *)(v5 + 64)
      + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
      + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v2 + v6);
  uint64_t v8 = *(void *)(v2 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));

  return sub_10001BAE8(a1, v7, v8, a2);
}

uint64_t sub_10001FED4()
{
  return swift_retain();
}

uint64_t sub_10001FEDC()
{
  uint64_t updated = type metadata accessor for ShellUpdatePayload();
  uint64_t v2 = *(void *)(updated - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, updated);
  swift_release();

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_10001FFC4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for ShellUpdatePayload() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v2 + 16);
  uint64_t v8 = *(void *)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_10001C1DC(a1, a2, v7, v2 + v6, v8);
}

uint64_t sub_100020078()
{
  uint64_t v1 = type metadata accessor for ContentKey();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  unint64_t v5 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t updated = type metadata accessor for ShellUpdatePayload();
  uint64_t v7 = *(void *)(updated - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8 + 16) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, updated);

  return _swift_deallocObject(v0, v10, v11);
}

uint64_t sub_1000201E0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = *(void *)(type metadata accessor for ContentKey() - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v9 = (*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  type metadata accessor for ShellUpdatePayload();
  uint64_t v10 = *(void *)(v3 + v9);
  uint64_t v11 = *(void *)(v3 + v9 + 8);

  return sub_10001C6E0(a1, a2, a3, v3 + v8, v10, v11);
}

uint64_t sub_1000202E0(uint64_t a1)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16);
  uint64_t v4 = sub_10000758C(&qword_10006FB20);
  return v3(a1, a1 + *(int *)(v4 + 48), a1 + *(int *)(v4 + 64));
}

uint64_t sub_100020334(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255) {
    return sub_10002034C();
  }
  return result;
}

uint64_t sub_10002034C()
{
  return swift_release();
}

uint64_t sub_100020354()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100020384(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000762C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000203C8()
{
  uint64_t updated = type metadata accessor for ShellUpdatePayload();
  uint64_t v2 = *(void *)(updated - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 56) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  sub_10000FCE4(v0 + 16);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, updated);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100020494(uint64_t a1, uint64_t a2)
{
  type metadata accessor for ShellUpdatePayload();

  return sub_10001C024(a1, a2, (void *)(v2 + 16));
}

uint64_t sub_100020518(uint64_t a1)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  uint64_t v4 = sub_10000758C(&qword_10006FB18);
  return v3(a1, a1 + *(int *)(v4 + 48));
}

uint64_t sub_100020564()
{
  uint64_t v1 = type metadata accessor for PreviewAgentConnector();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = type metadata accessor for AgentUpdate.Context();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v4 + v5 + v8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);

  return _swift_deallocObject(v0, v10, v11);
}

uint64_t sub_1000206B4(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(type metadata accessor for PreviewAgentConnector() - 8);
  unint64_t v7 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(*(void *)(type metadata accessor for AgentUpdate.Context() - 8) + 80);
  unint64_t v10 = v7 + v8 + v9;
  uint64_t v11 = v2 + v7;
  uint64_t v12 = v2 + (v10 & ~v9);
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v13;
  *uint64_t v13 = v3;
  void v13[4] = v11;
  v13[5] = v12;
  v13[2] = a1;
  v13[3] = a2;
  v13[1] = sub_100020810;
  return _swift_task_switch(sub_10001C5CC, 0, 0);
}

uint64_t sub_100020810()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100020904()
{
  return sub_10001D740();
}

unint64_t sub_100020920()
{
  unint64_t result = qword_10006FCC0;
  if (!qword_10006FCC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006FCC0);
  }
  return result;
}

uint64_t sub_100020974(void *a1)
{
  return sub_10002098C(a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&dispatch thunk of NonUIContentProviderBox.prepareForRelaunch(of:));
}

uint64_t sub_10002098C(void *a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = *(unsigned int *)(v2 + 16);
  uint64_t v5 = a1[3];
  uint64_t v6 = a1[4];
  sub_10000FC3C(a1, v5);
  return a2(v4, v5, v6);
}

uint64_t sub_1000209E0(void *a1)
{
  uint64_t v2 = *(unsigned int *)(v1 + 16);
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  sub_10000FC3C(a1, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v2, v3, v4);
}

uint64_t sub_100020A38()
{
  uint64_t v17 = type metadata accessor for AgentDescriptor.Bundle();
  uint64_t v1 = *(void *)(v17 - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  unint64_t v15 = (*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v16 = type metadata accessor for BatchIdentity();
  uint64_t v4 = *(void *)(v16 - 8);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = (v15 + v5 + 40) & ~v5;
  unint64_t v7 = (*(void *)(v4 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = type metadata accessor for LaunchPayload();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = (v7 + v10 + 9) & ~v10;
  uint64_t v14 = v11 + *(void *)(v9 + 64);
  uint64_t v12 = v2 | v5 | v10 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v0 + v3, v17);
  sub_10000FCE4(v0 + v15);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0 + v6, v16);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v0 + v11, v8);

  return _swift_deallocObject(v0, v14, v12);
}

uint64_t sub_100020C40(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for AgentDescriptor.Bundle() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = *(void *)(type metadata accessor for BatchIdentity() - 8);
  unint64_t v7 = (v5 + *(unsigned __int8 *)(v6 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v8 = (*(void *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = *(void *)(type metadata accessor for LaunchPayload() - 8);
  uint64_t v10 = *(void *)(v1 + 16);
  uint64_t v11 = *(void *)(v1 + v8);
  uint64_t v12 = *(unsigned __int8 *)(v1 + v8 + 8);
  uint64_t v13 = v1 + ((v8 + *(unsigned __int8 *)(v9 + 80) + 9) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));

  return sub_10001A818(a1, v10, v1 + v4, v1 + v5, v1 + v7, v11, v12, v13);
}

unsigned char *sub_100020DA4@<X0>(unsigned char *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3 = *result;
  BOOL v4 = v3 > 0x20;
  uint64_t v5 = (1 << v3) & 0x100003E01;
  BOOL v6 = v4 || v5 == 0;
  BOOL v7 = v6 && (result = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

void *sub_100020E14@<X0>(unsigned char *a1@<X8>)
{
  unint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

uint64_t sub_100020E58(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_100020EA0()
{
  unint64_t result = qword_10006FBA0;
  if (!qword_10006FBA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006FBA0);
  }
  return result;
}

uint64_t sub_100020EF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000758C(&qword_10006FB98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100020F5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PreviewCache.Replayable(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100020FC0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100021028()
{
  uint64_t v1 = (int *)(type metadata accessor for PreviewCache.Replayable(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((*(void *)(*(void *)v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = type metadata accessor for LaunchPayload();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = v6 + v1[7];
  uint64_t updated = type metadata accessor for ShellUpdatePayload();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(updated - 8) + 8))(v8, updated);
  swift_release();

  return _swift_deallocObject(v0, v5, v4);
}

uint64_t sub_100021160(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for PreviewCache.Replayable(0) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_10001DEB4(a1, v1 + v4, *(void *)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_1000211F8(uint64_t a1)
{
  return sub_10001E328(a1, v1);
}

uint64_t sub_100021200(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100021260(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000758C(&qword_10006FB98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000212C8(uint64_t a1, uint64_t a2)
{
  return a2;
}

unsigned char *initializeBufferWithCopyOfBuffer for PreviewShellService.ReloadError(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PreviewShellService.ReloadError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PreviewShellService.ReloadError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x10002148CLL);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_1000214B4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1000214C0(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PreviewShellService.ReloadError()
{
  return &type metadata for PreviewShellService.ReloadError;
}

unint64_t sub_1000214E0()
{
  unint64_t result = qword_10006FBA8;
  if (!qword_10006FBA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006FBA8);
  }
  return result;
}

id sub_100021540(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  v16.receiver = v5;
  v16.super_class = (Class)swift_getObjectType();
  [super initWithWindowScene:a1];
  [v11 setWindowLevel:UIWindowLevelStatusBar];
  objc_allocWithZone((Class)type metadata accessor for ExclusionView());
  id v12 = v11;
  sub_100021760(a2, a3, a4, a5);
  id v13 = objc_allocWithZone((Class)type metadata accessor for CounterRotationViewController());
  uint64_t v14 = (void *)CounterRotationViewController.init(contentView:contentOrientation:)();
  [v12 setRootViewController:v14];

  [v12 setUserInteractionEnabled:0];
  return v12;
}

uint64_t type metadata accessor for ExclusionWindow()
{
  return self;
}

id sub_100021760(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  v20.receiver = v4;
  v20.super_class = (Class)swift_getObjectType();
  [super initWithFrame:0.0, 0.0, 0.0, 0.0];
  id v10 = objc_allocWithZone((Class)UIView);
  id v11 = v9;
  id v12 = [v10 init];
  id v13 = self;
  id v14 = [v13 blackColor];
  [v12 setBackgroundColor:v14];

  [v12 setFrame:a1, a2, a3, a4];
  id v15 = [v12 layer];
  v21.origin.x = a1;
  v21.origin.y = a2;
  v21.size.width = a3;
  v21.size.height = a4;
  [v15 setCornerRadius:CGRectGetHeight(v21) * 0.5];

  id v16 = [v12 layer];
  [v16 setCornerCurve:kCACornerCurveContinuous];

  id v17 = v11;
  id v18 = [v13 clearColor];
  [v17 setBackgroundColor:v18];

  [v17 addSubview:v12];
  return v17;
}

void sub_1000219C4()
{
}

uint64_t type metadata accessor for ExclusionView()
{
  return self;
}

uint64_t sub_100021A10(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  sub_10000758C(&qword_10006FCB0);
  sub_100023028();
  KeyValueMap.guaranteedValue(for:creatingIfNecessaryWith:)();
  uint64_t result = swift_endAccess();
  if (!(v9 >> 62))
  {
    uint64_t v5 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v5) {
      goto LABEL_3;
    }
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v5) {
    return swift_bridgeObjectRelease();
  }
LABEL_3:
  if (v5 >= 1)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if ((v9 & 0xC000000000000001) != 0) {
        id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v7 = *(id *)(v9 + 8 * i + 32);
      }
      int v8 = v7;
      sub_100023084(v7, a1, a2);
    }
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

id sub_100021B68()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unsigned int v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v1[OBJC_IVAR____TtC12PreviewShell19UserAlertController_pendingAlerts] = _swiftEmptyDictionarySingleton;
  uint64_t v7 = OBJC_IVAR____TtC12PreviewShell19UserAlertController_locationSim;
  id v8 = objc_allocWithZone((Class)CLSimulationManager);
  unint64_t v9 = v1;
  *(void *)&v1[v7] = [v8 init];
  static Logger.uv.getter();
  id v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    id v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "AlertService init", v12, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  id v13 = objc_allocWithZone((Class)URTAlertService);
  NSString v14 = String._bridgeToObjectiveC()();
  id v15 = [v13 initWithDomain:v14];

  *(void *)&v9[OBJC_IVAR____TtC12PreviewShell19UserAlertController_underlying] = v15;
  v17.receiver = v9;
  v17.super_class = ObjectType;
  return [super init];
}

void sub_100021D98(void *a1@<X8>)
{
  *a1 = &_swiftEmptyArrayStorage;
}

uint64_t sub_100021DA8()
{
  uint64_t v1 = v0;
  _StringGuts.grow(_:)(130);
  v2._countAndFlagsBits = 0x6669746E6564693CLL;
  v2._object = (void *)0xED0000203A726569;
  String.append(_:)(v2);
  id v3 = [v0 identifier];
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unsigned int v6 = v5;

  v7._countAndFlagsBits = v4;
  v7._object = v6;
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 0x3A656C746974202CLL;
  v8._object = (void *)0xEA00000000002720;
  String.append(_:)(v8);
  id v9 = [v1 title];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v13 = 0;
  }
  sub_10000758C((uint64_t *)&unk_10006FCD0);
  uint64_t v14 = Optional.log.getter();
  id v16 = v15;
  swift_bridgeObjectRelease();
  v17._countAndFlagsBits = v14;
  v17._object = v16;
  String.append(_:)(v17);
  swift_bridgeObjectRelease();
  v18._countAndFlagsBits = 0x617373656D202C27;
  v18._object = (void *)0xED000027203A6567;
  String.append(_:)(v18);
  id v19 = [v1 message:v11, v13];
  if (v19)
  {
    objc_super v20 = v19;
    uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v23 = v22;
  }
  else
  {
    uint64_t v21 = 0;
    uint64_t v23 = 0;
  }
  uint64_t v24 = Optional.log.getter();
  uint64_t v26 = v25;
  swift_bridgeObjectRelease();
  v27._countAndFlagsBits = v24;
  v27._object = v26;
  String.append(_:)(v27);
  swift_bridgeObjectRelease();
  v28._countAndFlagsBits = 0xD000000000000020;
  v28._object = (void *)0x8000000100056E10;
  String.append(_:)(v28);
  id v29 = [v1 allowedApplicationBundleIDs:v21, v23];
  if (v29)
  {
    uint64_t v30 = v29;
    static Array._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v31 = Array.description.getter();
    uint64_t v33 = v32;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v33 = (void *)0xE200000000000000;
    uint64_t v31 = 23899;
  }
  uint64_t v34 = 7104878;
  v35._countAndFlagsBits = v31;
  v35._object = v33;
  String.append(_:)(v35);
  swift_bridgeObjectRelease();
  v36._object = (void *)0x8000000100056E40;
  v36._countAndFlagsBits = 0xD000000000000016;
  String.append(_:)(v36);
  id v37 = [v1 defaultAction];
  if (v37)
  {
    uint64_t v38 = v37;
    id v39 = [v37 title];

    uint64_t v40 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v42 = v41;
  }
  else
  {
    uint64_t v42 = (void *)0xE300000000000000;
    uint64_t v40 = 7104878;
  }
  v43._countAndFlagsBits = v40;
  v43._object = v42;
  String.append(_:)(v43);
  swift_bridgeObjectRelease();
  v44._countAndFlagsBits = 0x65636E6163202C27;
  v44._object = (void *)0xEC00000027203A6CLL;
  String.append(_:)(v44);
  id v45 = [v1 cancelAction];
  if (v45)
  {
    uint64_t v46 = v45;
    id v47 = [v45 title];

    uint64_t v48 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v50 = v49;
  }
  else
  {
    uint64_t v50 = (void *)0xE300000000000000;
    uint64_t v48 = 7104878;
  }
  v51._countAndFlagsBits = v48;
  v51._object = v50;
  String.append(_:)(v51);
  swift_bridgeObjectRelease();
  v52._countAndFlagsBits = 0x726568746F202C27;
  v52._object = (void *)0xEB0000000027203ALL;
  String.append(_:)(v52);
  id v53 = [v1 otherAction];
  if (v53)
  {
    uint64_t v54 = v53;
    id v55 = [v53 title];

    uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    double v57 = v56;
  }
  else
  {
    double v57 = (void *)0xE300000000000000;
  }
  v58._countAndFlagsBits = v34;
  v58._object = v57;
  String.append(_:)(v58);
  swift_bridgeObjectRelease();
  v59._countAndFlagsBits = 4087079;
  v59._object = (void *)0xE300000000000000;
  String.append(_:)(v59);
  return 0;
}

uint64_t sub_100022224(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[12] = a4;
  v5[13] = a5;
  uint64_t v6 = type metadata accessor for Logger();
  v5[14] = v6;
  v5[15] = *(void *)(v6 - 8);
  v5[16] = swift_task_alloc();
  v5[17] = swift_task_alloc();
  type metadata accessor for MainActor();
  v5[18] = static MainActor.shared.getter();
  uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100022328, v8, v7);
}

uint64_t sub_100022328()
{
  uint64_t v54 = v0;
  Swift::String v2 = (id *)(v0 + 12);
  uint64_t v1 = (void *)v0[12];
  swift_release();
  static Logger.uv.getter();
  id v3 = v1;
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  id v47 = (void **)(v0 + 12);
  uint64_t v48 = v0;
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = v0[15];
    uint64_t v49 = v0[14];
    uint64_t v51 = v0[17];
    uint64_t v7 = (void *)v0[12];
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    id v53 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315138;
    uint64_t v9 = sub_100021DA8();
    v0[11] = sub_100013F74(v9, v10, (uint64_t *)&v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "AlertService present %s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    Swift::String v2 = (id *)(v0 + 12);
    swift_slowDealloc();

    uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v11(v51, v49);
  }
  else
  {
    uint64_t v12 = v0[17];
    uint64_t v13 = v0[14];
    uint64_t v14 = v0[15];
    id v15 = (void *)v0[12];

    uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v11(v12, v13);
  }
  id v16 = [*v2 allowedApplicationBundleIDs];
  if (!v16)
  {
    static Logger.uv.getter();
    uint64_t v41 = Logger.logObject.getter();
    os_log_type_t v42 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v41, v42))
    {
      Swift::String v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Swift::String v43 = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "AlertService ignoring system alert", v43, 2u);
      swift_slowDealloc();
    }
    uint64_t v44 = v0[16];
    uint64_t v45 = v0[14];

    v11(v44, v45);
    goto LABEL_26;
  }
  Swift::String v17 = v16;
  uint64_t v18 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v19 = *(void *)(v18 + 16);
  if (!v19)
  {
LABEL_25:
    swift_bridgeObjectRelease();
LABEL_26:
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v46 = (uint64_t (*)(void))v0[1];
    return v46();
  }
  objc_super v20 = (uint64_t *)(v0[13] + OBJC_IVAR____TtC12PreviewShell19UserAlertController_pendingAlerts);
  uint64_t v21 = (uint64_t *)(v18 + 40);
  while (1)
  {
    uint64_t v50 = v19;
    uint64_t v24 = (void *)v0[12];
    uint64_t v26 = *(v21 - 1);
    uint64_t v25 = *v21;
    v0[8] = v26;
    v0[9] = v25;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_10000758C(&qword_10006FCB0);
    sub_100023028();
    KeyValueMap.guaranteedValue(for:creatingIfNecessaryWith:)();
    swift_endAccess();
    uint64_t v52 = v0[10];
    id v27 = v24;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    swift_beginAccess();
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    id v53 = (void *)*v20;
    id v29 = v53;
    *objc_super v20 = 0x8000000000000000;
    unint64_t v31 = sub_100009020(v26, v25);
    uint64_t v32 = v29[2];
    BOOL v33 = (v30 & 1) == 0;
    uint64_t result = v32 + v33;
    if (__OFADD__(v32, v33))
    {
      __break(1u);
LABEL_33:
      __break(1u);
      return result;
    }
    char v35 = v30;
    if (v29[3] < result) {
      break;
    }
    if (isUniquelyReferenced_nonNull_native)
    {
      if (v30) {
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t result = (uint64_t)sub_10000D9CC();
      id v29 = v53;
      if (v35)
      {
LABEL_7:
        uint64_t v22 = v29[7];
        swift_bridgeObjectRelease();
        *(void *)(v22 + 8 * v31) = v52;
        goto LABEL_8;
      }
    }
LABEL_18:
    v29[(v31 >> 6) + 8] |= 1 << v31;
    id v37 = (uint64_t *)(v29[6] + 16 * v31);
    *id v37 = v26;
    v37[1] = v25;
    *(void *)(v29[7] + 8 * v31) = v52;
    uint64_t v38 = v29[2];
    BOOL v39 = __OFADD__(v38, 1);
    uint64_t v40 = v38 + 1;
    if (v39) {
      goto LABEL_33;
    }
    v29[2] = v40;
    swift_bridgeObjectRetain();
LABEL_8:
    uint64_t v23 = *v47;
    *objc_super v20 = (uint64_t)v29;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    sub_100023084(v23, v26, v25);
    swift_bridgeObjectRelease();
    v21 += 2;
    uint64_t v0 = v48;
    uint64_t v19 = v50 - 1;
    if (v50 == 1) {
      goto LABEL_25;
    }
  }
  sub_10000B108(result, isUniquelyReferenced_nonNull_native);
  id v29 = v53;
  uint64_t result = sub_100009020(v26, v25);
  if ((v35 & 1) == (v36 & 1))
  {
    unint64_t v31 = result;
    if (v35) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100022A18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[6] = a4;
  v5[7] = a5;
  uint64_t v6 = type metadata accessor for Logger();
  v5[8] = v6;
  v5[9] = *(void *)(v6 - 8);
  v5[10] = swift_task_alloc();
  type metadata accessor for MainActor();
  v5[11] = static MainActor.shared.getter();
  uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100022B0C, v8, v7);
}

uint64_t sub_100022B0C()
{
  uint64_t v31 = v0;
  uint64_t v1 = *(void **)(v0 + 48);
  swift_release();
  static Logger.uv.getter();
  id v2 = v1;
  id v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v27 = *(void *)(v0 + 72);
    uint64_t v28 = *(void *)(v0 + 64);
    uint64_t v29 = *(void *)(v0 + 80);
    os_log_type_t v5 = *(void **)(v0 + 48);
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v7 = sub_100021DA8();
    *(void *)(v0 + 40) = sub_100013F74(v7, v8, &v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "AlertService dismiss %s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v29, v28);
  }
  else
  {
    uint64_t v10 = *(void *)(v0 + 72);
    uint64_t v9 = *(void *)(v0 + 80);
    uint64_t v11 = *(void *)(v0 + 64);
    uint64_t v12 = *(void **)(v0 + 48);

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  }
  id v13 = [*(id *)(v0 + 48) allowedApplicationBundleIDs];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v16 = *(void *)(v15 + 16);
    if (v16)
    {
      Swift::String v17 = (uint64_t *)(*(void *)(v0 + 56) + OBJC_IVAR____TtC12PreviewShell19UserAlertController_pendingAlerts);
      uint64_t v18 = (uint64_t *)(v15 + 40);
      do
      {
        uint64_t v19 = *(v18 - 1);
        uint64_t v20 = *v18;
        swift_beginAccess();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        unint64_t v21 = sub_100009020(v19, v20);
        LOBYTE(v19) = v22;
        swift_bridgeObjectRelease();
        if (v19)
        {
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v24 = *v17;
          uint64_t v30 = *v17;
          *Swift::String v17 = 0x8000000000000000;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_10000D9CC();
            uint64_t v24 = v30;
          }
          swift_bridgeObjectRelease();
          sub_10000BA08(v21, v24);
          *Swift::String v17 = v24;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease();
        swift_endAccess();
        v18 += 2;
        --v16;
      }
      while (v16);
    }
    swift_bridgeObjectRelease();
  }
  swift_task_dealloc();
  uint64_t v25 = *(uint64_t (**)(void))(v0 + 8);
  return v25();
}

uint64_t type metadata accessor for UserAlertController()
{
  return self;
}

unint64_t sub_100023028()
{
  unint64_t result = qword_10006FCB8;
  if (!qword_10006FCB8)
  {
    sub_10000762C(&qword_10006FCB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006FCB8);
  }
  return result;
}

uint64_t sub_100023084(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for BatchIdentity();
  uint64_t v34 = *(void *)(v6 - 8);
  uint64_t v35 = v6;
  __chkstk_darwin(v6);
  unint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v37 = *(void *)(v9 - 8);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v31 - v13;
  if (qword_10006EC98 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_10001D260(a2, a3);
  BOOL v33 = a1;
  static Logger.uv.getter();
  swift_retain_n();
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v36 = v9;
    uint64_t v19 = (uint8_t *)v18;
    uint64_t v32 = swift_slowAlloc();
    uint64_t v38 = v15;
    v39[0] = v32;
    *(_DWORD *)uint64_t v19 = 136315138;
    uint64_t v31 = v19 + 4;
    type metadata accessor for Agent();
    sub_1000235C0();
    uint64_t v20 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v38 = sub_100013F74(v20, v21, v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "AlertService found agent to handle alert: %s", v19, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v9 = v36;
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  (*(void (**)(char *, uint64_t))(v37 + 8))(v14, v9);
  char v22 = v33;
  if (qword_10006EC88 != -1) {
    swift_once();
  }
  Agent.batchIdentity.getter();
  assertUnreachable(file:line:column:function:)();
  sub_100020920();
  swift_allocError();
  swift_willThrow();
  swift_release();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v8, v35);
  static Logger.uv.getter();
  id v23 = v22;
  uint64_t v24 = Logger.logObject.getter();
  os_log_type_t v25 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = swift_slowAlloc();
    uint64_t v36 = v9;
    uint64_t v27 = (uint8_t *)v26;
    v39[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v27 = 136315138;
    uint64_t v28 = sub_100021DA8();
    uint64_t v38 = sub_100013F74(v28, v29, v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "AlertService was unable to present alert: %s", v27, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_errorRelease();

    return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v12, v36);
  }
  else
  {

    swift_errorRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v12, v9);
  }
}

unint64_t sub_1000235C0()
{
  unint64_t result = qword_10006FCC8;
  if (!qword_10006FCC8)
  {
    type metadata accessor for Agent();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006FCC8);
  }
  return result;
}

uint64_t sub_10002361C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  unint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_100020810;
  return sub_100022A18(a1, v4, v5, v7, v6);
}

uint64_t sub_1000236E0()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100023728(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  unint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_1000237E8;
  return sub_100022224(a1, v4, v5, v7, v6);
}

unint64_t sub_1000237EC(uint64_t a1)
{
  uint64_t v2 = sub_10000758C(&qword_10006FDA0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = _swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000758C(&qword_10006FDA8);
  uint64_t v6 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v24[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_100024964(v12, (uint64_t)v5);
    unint64_t result = sub_1000092D4((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = type metadata accessor for ContentCategory();
    (*(void (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    uint64_t v19 = v7[7];
    uint64_t v20 = type metadata accessor for EntryPointCategory();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v19 + *(void *)(*(void *)(v20 - 8) + 72) * v16, v9, v20);
    uint64_t v21 = v7[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_11;
    }
    v7[2] = v23;
    v12 += v13;
    if (!--v8)
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

uint64_t sub_100023A14()
{
  uint64_t v0 = type metadata accessor for PreviewShellPluginRegistry();
  sub_100023A7C(v0, qword_100074188);
  sub_10000E620(v0, (uint64_t)qword_100074188);
  sub_100023AE0();
  return static PreviewShellPluginRegistry.load<A>(using:location:)();
}

uint64_t *sub_100023A7C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_100023AE0()
{
  unint64_t result = qword_10006FD20;
  if (!qword_10006FD20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006FD20);
  }
  return result;
}

ValueMetadata *type metadata accessor for BuiltinPlugin()
{
  return &type metadata for BuiltinPlugin;
}

unint64_t sub_100023B44()
{
  sub_10000758C(&qword_10006FD98);
  sub_10000758C(&qword_10006FDA0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1000507A0;
  static ContentCategory.previewProvider.getter();
  static EntryPointCategory.previewProvider.getter();
  static ContentCategory.previewPreflight.getter();
  static EntryPointCategory.previewPreflight.getter();
  static ContentCategory.cFunction.getter();
  static EntryPointCategory.cFunction.getter();
  static ContentCategory.registryPreflight.getter();
  static EntryPointCategory.registryPreflight.getter();
  static ContentCategory.registryExecution.getter();
  static EntryPointCategory.registryExecution.getter();
  unint64_t result = sub_1000237EC(v0);
  qword_10006FD00 = result;
  return result;
}

uint64_t sub_100023CA0(uint64_t a1, uint64_t a2)
{
  return sub_1000241C4(a1, a2, &qword_10006ECA8);
}

unint64_t sub_100023CC4()
{
  uint64_t v0 = type metadata accessor for PreviewSourceContentCategory();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000758C(&qword_10006FD98);
  sub_10000758C(&qword_10006FDA0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000507B0;
  static PreviewSourceContentCategory.swiftUIView.getter();
  static ContentCategory.source(_:)();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  static EntryPointCategory.previewInstance.getter();
  static PreviewSourceContentCategory.uiKitView.getter();
  static ContentCategory.source(_:)();
  v5(v3, v0);
  static EntryPointCategory.previewInstance.getter();
  unint64_t result = sub_1000237EC(v4);
  qword_10006FD08 = result;
  return result;
}

uint64_t sub_100023E9C(uint64_t a1, uint64_t a2)
{
  return sub_1000241C4(a1, a2, &qword_10006ECB0);
}

unint64_t sub_100023EC0(uint64_t a1)
{
  return sub_1000240A0(a1, (uint64_t (*)(void))&static ContentCategory.applicationMainPreview.getter, (void (*)(uint64_t))&static EntryPointCategory.mainPreview.getter, &qword_10006FD10);
}

void sub_100023EF4()
{
  id v0 = [self previewSceneSpecification];
  static AgentSceneConfiguration.previewSceneConfiguration(in:specification:)();
}

uint64_t sub_100023F78()
{
  sub_10000758C(&qword_10006FDB0);
  type metadata accessor for PreviewVariantGroup();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1000507C0;
  static PreviewVariantGroup.colorSchemeVariantGroup.getter();
  static PreviewVariantGroup.orientationVariantGroup.getter();
  static PreviewVariantGroup.dynamicTypeVariantGroup.getter();
  return v0;
}

uint64_t sub_100024048(uint64_t a1, uint64_t a2)
{
  return sub_1000241C4(a1, a2, &qword_10006ECB8);
}

unint64_t sub_10002406C(uint64_t a1)
{
  return sub_1000240A0(a1, (uint64_t (*)(void))&static ContentCategory.runningAppPreview.getter, (void (*)(uint64_t))&static EntryPointCategory.runningApp.getter, &qword_10006FD18);
}

unint64_t sub_1000240A0(uint64_t a1, uint64_t (*a2)(void), void (*a3)(uint64_t), unint64_t *a4)
{
  sub_10000758C(&qword_10006FD98);
  sub_10000758C(&qword_10006FDA0);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1000507D0;
  uint64_t v8 = a2();
  a3(v8);
  unint64_t result = sub_1000237EC(v7);
  *a4 = result;
  return result;
}

void *sub_100024194()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_1000241A0(uint64_t a1, uint64_t a2)
{
  return sub_1000241C4(a1, a2, &qword_10006ECC0);
}

uint64_t sub_1000241C4(uint64_t a1, uint64_t a2, void *a3)
{
  if (*a3 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_100024218()
{
  uint64_t v0 = type metadata accessor for ProcessType();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = &v6[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v7 = &type metadata for ApplicationLauncher;
  unint64_t v8 = sub_100024330();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for ProcessType.application(_:), v0);
  PreviewAgentLauncherRegistry.registerLauncher(_:for:)();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return sub_10000FCE4((uint64_t)v6);
}

unint64_t sub_100024330()
{
  unint64_t result = qword_10006FD28;
  if (!qword_10006FD28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006FD28);
  }
  return result;
}

uint64_t sub_100024384()
{
  uint64_t v0 = sub_10000758C(&qword_10006FB08);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000758C(&qword_10006FD30);
  sub_1000246FC();
  static CategoryMap.contentCategories.getter();
  uint64_t v3 = type metadata accessor for ContentOverride();
  uint64_t v4 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);
  v4(v2, 1, 1, v3);
  sub_100020384(&qword_10006FD40, &qword_10006FD30);
  ContentProviderRegistry.register<A>(provider:for:override:)();
  swift_bridgeObjectRelease();
  sub_100024750((uint64_t)v2);
  sub_10000758C(&qword_10006FD48);
  sub_1000247B0();
  static CategoryMap.contentCategories.getter();
  v4(v2, 1, 1, v3);
  sub_100020384(&qword_10006FD58, &qword_10006FD48);
  ContentProviderRegistry.register<A>(provider:for:override:)();
  swift_bridgeObjectRelease();
  sub_100024750((uint64_t)v2);
  sub_10000758C(&qword_10006FD60);
  sub_100024804();
  static CategoryMap.contentCategories.getter();
  v4(v2, 1, 1, v3);
  sub_100020384(&qword_10006FD70, &qword_10006FD60);
  ContentProviderRegistry.register<A>(provider:for:override:)();
  swift_bridgeObjectRelease();
  sub_100024750((uint64_t)v2);
  sub_10000758C(&qword_10006FD78);
  sub_10000758C(&qword_10006FD80);
  type metadata accessor for ContentCategory();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000507D0;
  static ContentCategory.runningAppPreview.getter();
  v4(v2, 1, 1, v3);
  sub_100020384(&qword_10006FD88, &qword_10006FD78);
  ContentProviderRegistry.register<A>(provider:for:override:)();
  swift_bridgeObjectRelease();
  return sub_100024750((uint64_t)v2);
}

unint64_t sub_1000246FC()
{
  unint64_t result = qword_10006FD38;
  if (!qword_10006FD38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006FD38);
  }
  return result;
}

uint64_t sub_100024750(uint64_t a1)
{
  uint64_t v2 = sub_10000758C(&qword_10006FB08);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1000247B0()
{
  unint64_t result = qword_10006FD50;
  if (!qword_10006FD50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006FD50);
  }
  return result;
}

unint64_t sub_100024804()
{
  unint64_t result = qword_10006FD68;
  if (!qword_10006FD68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006FD68);
  }
  return result;
}

ValueMetadata *type metadata accessor for BuiltinPlugin.RunningApp()
{
  return &type metadata for BuiltinPlugin.RunningApp;
}

ValueMetadata *type metadata accessor for BuiltinPlugin.MainPreviewMap()
{
  return &type metadata for BuiltinPlugin.MainPreviewMap;
}

ValueMetadata *type metadata accessor for BuiltinPlugin.PreviewMap()
{
  return &type metadata for BuiltinPlugin.PreviewMap;
}

ValueMetadata *type metadata accessor for BuiltinPlugin.NonUIMap()
{
  return &type metadata for BuiltinPlugin.NonUIMap;
}

unint64_t sub_100024898(uint64_t a1)
{
  unint64_t result = sub_1000247B0();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1000248C0(uint64_t a1)
{
  unint64_t result = sub_100024804();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1000248E8(uint64_t a1)
{
  unint64_t result = sub_100024910();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_100024910()
{
  unint64_t result = qword_10006FD90;
  if (!qword_10006FD90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006FD90);
  }
  return result;
}

uint64_t sub_100024964(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000758C(&qword_10006FDA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1000249CC()
{
  assertMainThread(file:line:column:function:)();
  sub_100024A54(&v0, &v1);
  qword_10006FDB8 = v1;
  byte_10006FDC0 = 0;
}

void sub_100024A54(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = v2;
  sub_1000084B8();
  uint64_t v37 = &type metadata for MainDisplay;
  uint64_t v38 = &off_100062A98;
  v35[0] = v6;
  v35[1] = v7;
  char v36 = v8 & 1;
  BOOL v33 = &type metadata for LocalStaticPersonality;
  unint64_t v34 = sub_100025220();
  sub_10002BBFC(0xD000000000000012, 0x8000000100056F80, 0, 0, (uint64_t)v35, (uint64_t)v32, v31);
  uint64_t v39 = v31[0];
  uint64_t v9 = v31[3];
  unint64_t v11 = (void *)v31[4];
  uint64_t v10 = v31[5];
  uint64_t v12 = (void *)v31[7];
  sub_10000FCE4((uint64_t)v32);
  sub_10000FCE4((uint64_t)v35);
  if (v2) {
    goto LABEL_2;
  }
  unint64_t v29 = (void *)v10;
  uint64_t v30 = (void *)v9;
  type metadata accessor for LocalStaticScene(0);
  swift_allocObject();
  uint64_t v13 = swift_retain();
  uint64_t v14 = sub_100045D8C(v13);
  type metadata accessor for StaticPreviewCanvas();
  char v15 = (void *)swift_allocObject();
  uint64_t v16 = swift_retain();
  uint64_t v17 = sub_100025274(v16, v15);
  swift_release();
  [v11 setRootViewController:v17[3]];
  type metadata accessor for LocalSceneDelegate();
  uint64_t v18 = swift_dynamicCastClass();
  if (!v18)
  {
    type metadata accessor for Unreachable();
    sub_100025648((unint64_t *)&qword_10006F130, (void (*)(uint64_t))&type metadata accessor for Unreachable);
    uint64_t v4 = swift_allocError();
    Unreachable.init(_:diagnostics:file:line:column:function:)();
    swift_willThrow();
    swift_release();
    swift_unknownObjectRelease();

    swift_bridgeObjectRelease();
    swift_release();
    swift_release();

LABEL_2:
    *a1 = v4;
    return;
  }
  uint64_t v19 = v18;
  uint64_t v27 = v11;
  uint64_t v28 = v17;
  uint64_t v20 = sub_100025648(&qword_10006FDF0, (void (*)(uint64_t))type metadata accessor for LocalStaticScene);
  uint64_t v21 = (uint64_t *)(v19 + OBJC_IVAR____TtC12PreviewShell18LocalSceneDelegate_previewShellScene);
  *uint64_t v21 = v14;
  v21[1] = v20;
  swift_retain_n();
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  BOOL v22 = *(void **)(v19 + OBJC_IVAR____TtC12PreviewShell13SceneDelegate_previewSceneSettings);
  if (v22 && *v21)
  {
    uint64_t v23 = v21[1];
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v26 = *(void *)(v23 + 8);
    id v25 = v22;
    swift_unknownObjectRetain();
    sub_10004130C((uint64_t)v25, 0, ObjectType, v26);
    swift_release();
    swift_release();

    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
    swift_release();
  }

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease_n();
  swift_release();

  *a2 = v28;
}

uint64_t type metadata accessor for LocalSceneSpecification()
{
  return self;
}

uint64_t sub_100024EE4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for PreviewPreferences.InterfaceOrientation();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  char v8 = (char *)&v27 - v7;
  uint64_t v9 = PreviewPreferences.preferredSize.getter();
  if (v11)
  {
    PreviewPreferences.preferredOrientation.getter();
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
    int v16 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v6, v2);
    if (v16 == enum case for PreviewPreferences.InterfaceOrientation.portrait(_:))
    {
      uint64_t v17 = (unsigned int *)&enum case for PreviewTraits.Orientation.portrait(_:);
    }
    else
    {
      int v18 = v16;
      if (v16 == enum case for PreviewPreferences.InterfaceOrientation.portraitUpsideDown(_:))
      {
        uint64_t v17 = (unsigned int *)&enum case for PreviewTraits.Orientation.portraitUpsideDown(_:);
      }
      else
      {
        if (v16 != enum case for PreviewPreferences.InterfaceOrientation.landscapeLeft(_:))
        {
          int v26 = enum case for PreviewPreferences.InterfaceOrientation.landscapeRight(_:);
          uint64_t v20 = type metadata accessor for PreviewTraits.Orientation();
          uint64_t v21 = *(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 104);
          if (v18 != v26)
          {
            v21(a1, enum case for PreviewTraits.Orientation.portrait(_:), v20);
            (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
            goto LABEL_13;
          }
          uint64_t v23 = enum case for PreviewTraits.Orientation.landscapeRight(_:);
          BOOL v22 = a1;
LABEL_12:
          v21(v22, v23, v20);
LABEL_13:
          (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
          uint64_t v24 = enum case for SceneLayout.device(_:);
          uint64_t v25 = type metadata accessor for SceneLayout();
          return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 104))(a1, v24, v25);
        }
        uint64_t v17 = (unsigned int *)&enum case for PreviewTraits.Orientation.landscapeLeft(_:);
      }
    }
    uint64_t v19 = *v17;
    uint64_t v20 = type metadata accessor for PreviewTraits.Orientation();
    uint64_t v21 = *(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 104);
    BOOL v22 = a1;
    uint64_t v23 = v19;
    goto LABEL_12;
  }
  *a1 = v9;
  a1[1] = v10;
  uint64_t v12 = enum case for SceneLayout.custom(_:);
  uint64_t v13 = type metadata accessor for SceneLayout();
  uint64_t v14 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 104);

  return v14(a1, v12, v13);
}

uint64_t sub_10002520C()
{
  return 0x636974617453;
}

unint64_t sub_100025220()
{
  unint64_t result = qword_100070140;
  if (!qword_100070140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100070140);
  }
  return result;
}

void *sub_100025274(uint64_t a1, void *a2)
{
  v19[1] = *a2;
  uint64_t v4 = type metadata accessor for ExecutionLane();
  uint64_t v20 = *(void *)(v4 - 8);
  uint64_t v21 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100025648(&qword_10006FDF8, (void (*)(uint64_t))type metadata accessor for LocalStaticScene);
  type metadata accessor for InvalidationHandle();
  swift_allocObject();
  a2[2] = InvalidationHandle.init(dsoHandle:file:line:column:function:name:)();
  static ExecutionLane.main.getter();
  type metadata accessor for FutureSerialQueue();
  swift_allocObject();
  a2[6] = FutureSerialQueue.init(on:)();
  a2[8] = 0;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v10 = *(void *)(v9 + 88);
  uint64_t v11 = *(void *)(v9 + 96);
  uint64_t v12 = (objc_class *)type metadata accessor for CanvasViewController();
  uint64_t v13 = (char *)objc_allocWithZone(v12);
  *(void *)&v13[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_active] = 0;
  *(void *)&v13[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_activating] = 0;
  uint64_t v14 = &v13[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_forcedOrientation];
  uint64_t v15 = type metadata accessor for PreviewPreferences.InterfaceOrientation();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  *(void *)&v13[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_debugOverlay] = 0;
  int v16 = &v13[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_sceneIdentifier];
  *(void *)int v16 = v10;
  *((void *)v16 + 1) = v11;
  v23.receiver = v13;
  v23.super_class = v12;
  swift_bridgeObjectRetain();
  a2[3] = [super initWithNibName:0 bundle:0];
  type metadata accessor for CanvasUpdater();
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = a1;
  v17[4] = v7;
  v17[5] = &_swiftEmptyDictionarySingleton;
  a2[7] = v17;
  a2[4] = a1;
  a2[5] = v7;
  v22[3] = ObjectType;
  v22[4] = *(void *)(*(void *)(*(void *)(v7 + 8) + 8) + 8);
  v22[5] = a2;
  v22[0] = a1;
  sub_100025648(&qword_10006FE00, (void (*)(uint64_t))type metadata accessor for StaticPreviewCanvas);
  swift_retain_n();
  Invalidatable.trackInvalidation(dsoHandle:file:line:column:function:of:)();
  sub_10000FCE4((uint64_t)v22);
  v22[0] = a2;
  static ExecutionLane.main.getter();
  swift_retain();
  Invalidatable.onInvalidation(on:_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v6, v21);
  return a2;
}

uint64_t sub_100025648(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100025690()
{
  return sub_10003A1B4();
}

ValueMetadata *type metadata accessor for LocalStaticPersonality()
{
  return &type metadata for LocalStaticPersonality;
}

unint64_t sub_1000256A8(uint64_t a1)
{
  unint64_t result = sub_1000256D0();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1000256D0()
{
  unint64_t result = qword_10006FE08;
  if (!qword_10006FE08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006FE08);
  }
  return result;
}

uint64_t sub_100025724(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for PreviewType.HostLocation();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (uint64_t *)((char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  if ((*(unsigned int (**)(uint64_t *, uint64_t))(v9 + 88))(v11, v8) == enum case for PreviewType.HostLocation.injectedScene(_:))
  {
    (*(void (**)(uint64_t *, uint64_t))(v9 + 96))(v11, v8);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t))(v9 + 8))(v11, v8);
    uint64_t v13 = 0;
    uint64_t v12 = 0;
  }
  swift_beginAccess();
  uint64_t v14 = *(void *)(v2 + 16);
  if (*(void *)(v14 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v15 = sub_100009240(v13, v12);
    if (v16)
    {
      uint64_t v17 = *(void *)(*(void *)(v14 + 56) + 8 * v15);
      swift_endAccess();
      swift_retain();
      swift_bridgeObjectRelease_n();
      sub_10000758C(&qword_10006FB50);
      v37[3] = type metadata accessor for HostedPreviewCanvas();
      v37[4] = sub_100026184();
      v37[0] = v17;
      uint64_t v18 = static Future.succeeded(dsoHandle:file:line:column:function:_:)();
      sub_10000FCE4((uint64_t)v37);
      return v18;
    }
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  static Logger.uv.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v19 = Logger.logObject.getter();
  os_log_type_t v20 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v34 = v4;
    BOOL v22 = (uint8_t *)v21;
    uint64_t v23 = swift_slowAlloc();
    uint64_t v36 = v13;
    uint64_t v39 = v23;
    uint64_t v35 = v2;
    *(_DWORD *)BOOL v22 = 136446210;
    v37[0] = v36;
    v37[1] = v12;
    swift_bridgeObjectRetain();
    uint64_t v24 = String.init<A>(describing:)();
    v37[0] = sub_100013F74(v24, v25, &v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "InjectedSceneRegistry waiting for injected scene '%{public}s'", v22, 0xCu);
    swift_arrayDestroy();
    uint64_t v13 = v36;
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v34);
    uint64_t v2 = v35;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_10000758C(&qword_10006FB50);
  uint64_t v18 = static Future.create(dsoHandle:file:line:column:function:)();
  int v26 = (uint64_t *)(v2 + 24);
  swift_beginAccess();
  uint64_t v27 = *(void *)(v2 + 24);
  if (!*(void *)(v27 + 16)) {
    goto LABEL_15;
  }
  swift_bridgeObjectRetain();
  unint64_t v28 = sub_100009240(v13, v12);
  if ((v29 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_15:
    swift_endAccess();
    uint64_t v30 = &_swiftEmptyArrayStorage;
    goto LABEL_16;
  }
  uint64_t v30 = *(void **)(*(void *)(v27 + 56) + 8 * v28);
  swift_endAccess();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_16:
  uint64_t v39 = (uint64_t)v30;
  swift_retain();
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  uint64_t v31 = v39;
  swift_beginAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v38 = *v26;
  *int v26 = 0x8000000000000000;
  sub_10000C96C(v31, v13, v12, isUniquelyReferenced_nonNull_native);
  *int v26 = v38;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_release();
  return v18;
}

Swift::Int sub_100025D00()
{
  uint64_t v1 = *(void *)(v0 + 8);
  Hasher.init(_seed:)();
  if (v1)
  {
    Hasher._combine(_:)(1uLL);
    String.hash(into:)();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  return Hasher._finalize()();
}

void sub_100025D70()
{
  if (*(void *)(v0 + 8))
  {
    Hasher._combine(_:)(1uLL);
    String.hash(into:)();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
}

Swift::Int sub_100025DE8()
{
  uint64_t v1 = *(void *)(v0 + 8);
  Hasher.init(_seed:)();
  if (v1)
  {
    Hasher._combine(_:)(1uLL);
    String.hash(into:)();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  return Hasher._finalize()();
}

uint64_t sub_100025E54(void *a1, void *a2)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = a2[1];
  if (!v3) {
    return v4 == 0;
  }
  if (!v4) {
    return 0;
  }
  if (*a1 == *a2 && v3 == v4) {
    return 1;
  }
  else {
    return _stringCompareWithSmolCheck(_:_:expecting:)();
  }
}

uint64_t sub_100025EA0()
{
  type metadata accessor for InjectedSceneRegistry();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = &_swiftEmptyDictionarySingleton;
  *(void *)(result + 24) = &_swiftEmptyDictionarySingleton;
  qword_1000741A0 = result;
  return result;
}

uint64_t sub_100025ED8(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(void, uint64_t, uint64_t))(a2 + 32))(0, ObjectType, a2);
}

uint64_t sub_100025F20()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for InjectedSceneRegistry()
{
  return self;
}

void *initializeBufferWithCopyOfBuffer for InjectedSceneIdentity(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for InjectedSceneIdentity()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for InjectedSceneIdentity(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for InjectedSceneIdentity(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for InjectedSceneIdentity(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for InjectedSceneIdentity(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for InjectedSceneIdentity(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

uint64_t sub_1000260E4(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_1000260FC(void *result, int a2)
{
  if (a2 < 0)
  {
    *__n128 result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for InjectedSceneIdentity()
{
  return &type metadata for InjectedSceneIdentity;
}

unint64_t sub_100026130()
{
  unint64_t result = qword_10006FEB8;
  if (!qword_10006FEB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006FEB8);
  }
  return result;
}

unint64_t sub_100026184()
{
  unint64_t result = qword_100070C10;
  if (!qword_100070C10)
  {
    type metadata accessor for HostedPreviewCanvas();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100070C10);
  }
  return result;
}

uint64_t UIDeviceOrientation.description.getter()
{
  return 0x446E776F6E6B6E75;
}

uint64_t sub_1000262F8()
{
  return UIDeviceOrientation.description.getter();
}

uint64_t sub_100026300(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t sub_100026354(uint64_t a1)
{
  unint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100026398(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

BOOL sub_1000263C0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1000263D4()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_10000758C(&qword_10006F3B0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = &v19[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_10000758C(&qword_10006F3B8);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = &v19[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = type metadata accessor for CancellationToken();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = &v19[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = (uint64_t)&v1[OBJC_IVAR____TtC12PreviewShell18MainViewController_canvasObserver];
  swift_beginAccess();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v13, 1, v9))
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v10 + 16))(v12, v13, v9);
    CancellationToken.cancel(dsoHandle:file:line:column:function:)();
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v12, v9);
  }
  if (*(void *)&v1[OBJC_IVAR____TtC12PreviewShell18MainViewController_previewCanvas])
  {
    swift_retain();
    EventStream.Sink.eventStream.getter();
    swift_release();
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v1;
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = sub_10002A208;
    *(void *)(v15 + 24) = v14;
    char v16 = v1;
    EventStream.observe(dsoHandle:file:line:column:function:_:)();
    swift_release();
    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = 1;
  }
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, v17, 1, v9);
  swift_beginAccess();
  sub_10002A234((uint64_t)v8, v13);
  return swift_endAccess();
}

void sub_10002675C(char a1, int a2)
{
  LODWORD(v3) = a2;
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.uv.getter();
  uint64_t v9 = v2;
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.debug.getter();
  uint64_t v12 = &qword_10006F000;
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v13 = swift_slowAlloc();
    int v32 = v3;
    uint64_t v3 = v13;
    uint64_t v34 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315394;
    LOBYTE(v33) = v9[OBJC_IVAR____TtC12PreviewShell18MainViewController_state];
    uint64_t v14 = String.init<A>(describing:)();
    uint64_t v31 = v5;
    uint64_t v33 = sub_100013F74(v14, v15, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    *(_WORD *)(v3 + 12) = 2080;
    LOBYTE(v33) = a1;
    uint64_t v16 = String.init<A>(describing:)();
    uint64_t v33 = sub_100013F74(v16, v17, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    uint64_t v12 = &qword_10006F000;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Main view controller: transition from '%s' to '%s'", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    LOBYTE(v3) = v32;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v31);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  v9[v12[473]] = a1;
  if (a1)
  {
    if (a1 == 1)
    {
      uint64_t v18 = OBJC_IVAR____TtC12PreviewShell18MainViewController_connectViewController;
      uint64_t v19 = *(void **)&v9[OBJC_IVAR____TtC12PreviewShell18MainViewController_connectViewController];
      if (v19)
      {
        id v20 = *(id *)&v9[OBJC_IVAR____TtC12PreviewShell18MainViewController_connectViewController];
      }
      else
      {
        id v23 = objc_allocWithZone((Class)type metadata accessor for ConnectViewController());
        uint64_t v24 = (void *)ConnectViewController.init()();
        unint64_t v25 = *(void **)&v9[v18];
        *(void *)&v9[v18] = v24;
        id v20 = v24;

        uint64_t v19 = 0;
      }
      id v26 = v19;
      goto LABEL_14;
    }
    uint64_t v22 = *(void *)&v9[OBJC_IVAR____TtC12PreviewShell18MainViewController_previewCanvas];
    if (!v22)
    {
      assertUnreachable(file:line:column:function:)();
      return;
    }
    id v21 = *(id *)(v22 + 24);
  }
  else
  {
    id v21 = sub_1000288BC();
  }
  id v20 = v21;
LABEL_14:
  id v27 = *(id *)&v9[OBJC_IVAR____TtC12PreviewShell18MainViewController_visibleChild];
  if (v27) {
    BOOL v28 = v20 == v27;
  }
  else {
    BOOL v28 = 0;
  }
  if (v28)
  {
  }
  else
  {
    char v29 = v9;
    id v30 = v20;
    sub_10002984C(v30, v3 & 1, v29, v29, v30, v3 & 1);
  }
}

char *sub_100026AEC()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = sub_10000758C(&qword_10006FB38);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10000758C(&qword_10006FF80);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v38 = v5;
  uint64_t v39 = v6;
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000758C(&qword_10006F3B8);
  __chkstk_darwin(v9 - 8);
  os_log_type_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = OBJC_IVAR____TtC12PreviewShell18MainViewController_invalidationHandle;
  type metadata accessor for ConcurrentInvalidationHandle();
  swift_allocObject();
  uint64_t v13 = v0;
  *(void *)&v0[v12] = ConcurrentInvalidationHandle.init(dsoHandle:file:line:column:function:name:)();
  v13[OBJC_IVAR____TtC12PreviewShell18MainViewController_state] = 0;
  *(void *)&v13[OBJC_IVAR____TtC12PreviewShell18MainViewController_visibleChild] = 0;
  *(void *)&v13[OBJC_IVAR____TtC12PreviewShell18MainViewController_splashViewController] = 0;
  *(void *)&v13[OBJC_IVAR____TtC12PreviewShell18MainViewController_connectViewController] = 0;
  uint64_t v14 = &v13[OBJC_IVAR____TtC12PreviewShell18MainViewController_canvasObserver];
  uint64_t v15 = type metadata accessor for CancellationToken();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  v16(v14, 1, 1, v15);
  *(void *)&v13[OBJC_IVAR____TtC12PreviewShell18MainViewController_xcodeObservation] = 0;
  v16(&v13[OBJC_IVAR____TtC12PreviewShell18MainViewController_previewCacheObserver], 1, 1, v15);
  v13[OBJC_IVAR____TtC12PreviewShell18MainViewController_isForeground] = 0;
  *(void *)&v13[OBJC_IVAR____TtC12PreviewShell18MainViewController_xcodeConnectionWaitTimer] = 0;
  *(void *)&v13[OBJC_IVAR____TtC12PreviewShell18MainViewController_previewCanvas] = 0;

  v41.receiver = v13;
  v41.super_class = ObjectType;
  [super initWithNibName:0 bundle:0];
  uint64_t v18 = qword_10006ECD8;
  id v19 = v17;
  if (v18 != -1) {
    swift_once();
  }
  uint64_t v20 = qword_1000741B8;
  if (qword_1000741B8)
  {
    uint64_t v37 = v4;
    swift_retain();
    swift_retain();
    id v21 = v19;
    uint64_t v22 = v8;
    EventStreamObservable.projectedValue.getter();
    swift_release();
    *(void *)(swift_allocObject() + 16) = v21;
    uint64_t v36 = v21;
    id v23 = v21;
    uint64_t v24 = v38;
    EventStream.observe(dsoHandle:file:line:column:function:_:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v22, v24);
    v16(v11, 0, 1, v15);
    uint64_t v25 = (uint64_t)v23 + OBJC_IVAR____TtC12PreviewShell18MainViewController_previewCacheObserver;
    swift_beginAccess();
    sub_10002A234((uint64_t)v11, v25);
    swift_endAccess();
    swift_retain();
    EventStreamObservable.wrappedValue.getter();
    swift_release();
    if ((v40 & 1) == 0)
    {
      swift_retain();
      sub_10002C918((uint64_t)sub_10002A5F8, v20);
      swift_release();
    }
    swift_release();
    id v19 = v36;
    uint64_t v4 = v37;
  }
  uint64_t v26 = type metadata accessor for TaskPriority();
  id v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56);
  v27(v4, 1, 1, v26);
  type metadata accessor for MainActor();
  BOOL v28 = (char *)v19;
  uint64_t v29 = static MainActor.shared.getter();
  id v30 = (void *)swift_allocObject();
  v30[2] = v29;
  v30[3] = &protocol witness table for MainActor;
  v30[4] = v28;
  *(void *)&v28[OBJC_IVAR____TtC12PreviewShell18MainViewController_xcodeObservation] = sub_10002FFFC((uint64_t)v4, (uint64_t)&unk_10006FF90, (uint64_t)v30);
  swift_release();
  v27(v4, 1, 1, v26);
  uint64_t v31 = v28;
  uint64_t v32 = static MainActor.shared.getter();
  uint64_t v33 = (void *)swift_allocObject();
  v33[2] = v32;
  v33[3] = &protocol witness table for MainActor;
  v33[4] = v31;
  sub_10002FFFC((uint64_t)v4, (uint64_t)&unk_10006FFA0, (uint64_t)v33);

  swift_release();
  return v31;
}

uint64_t sub_1000270C0(unsigned char *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for ExecutionLane();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(a1) = *a1;
  static ExecutionLane.main.getter();
  uint64_t v8 = swift_allocObject();
  *(unsigned char *)(v8 + 16) = (_BYTE)a1;
  *(void *)(v8 + 24) = a2;
  id v9 = a2;
  ExecutionLane.execute(_:)();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1000271E0()
{
  uint64_t v1 = type metadata accessor for ExecutionLane();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = &v11[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_10000758C(&qword_10006FF70);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t result = __chkstk_darwin(v5);
  id v9 = &v11[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (v0[OBJC_IVAR____TtC12PreviewShell18MainViewController_isForeground] == 1)
  {
    if (qword_10006EC98 != -1) {
      swift_once();
    }
    ServerFarm.serviceHubServer.getter();
    AggregatingHostServer.connectionMonitor.getter();
    swift_release();
    AggregatingHostServer.ConnectionMonitor.status.getter();
    (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v9, v5);
    type metadata accessor for ServiceHubService();
    sub_10002A1C0(&qword_10006FF78, (void (*)(uint64_t))&type metadata accessor for ServiceHubService);
    uint64_t result = static AggregatingHostServer.ConnectionMonitor.Status.== infix(_:_:)();
    if ((result & 1) != 0
      && !*(void *)&v0[OBJC_IVAR____TtC12PreviewShell18MainViewController_xcodeConnectionWaitTimer])
    {
      if (qword_10006ECD8 != -1) {
        uint64_t result = swift_once();
      }
      if (!qword_1000741B8
        || (swift_retain(),
            swift_retain(),
            EventStreamObservable.wrappedValue.getter(),
            swift_release(),
            uint64_t result = swift_release(),
            v11[15] == 1))
      {
        if (v0[OBJC_IVAR____TtC12PreviewShell18MainViewController_state] - 1 >= 2)
        {
          sub_10001D88C();
          static ExecutionLane.main.getter();
          *(void *)(swift_allocObject() + 16) = v0;
          uint64_t v10 = v0;
          Future.observeFailure(on:_:)();
          swift_release();
          swift_release();
          return (*(uint64_t (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
        }
      }
    }
  }
  return result;
}

uint64_t sub_10002752C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  uint64_t v5 = type metadata accessor for ExecutionLane();
  v4[3] = v5;
  v4[4] = *(void *)(v5 - 8);
  v4[5] = swift_task_alloc();
  uint64_t v6 = sub_10000758C(&qword_10006FFA8);
  v4[6] = v6;
  v4[7] = *(void *)(v6 - 8);
  v4[8] = swift_task_alloc();
  uint64_t v7 = sub_10000758C(&qword_10006FF70);
  v4[9] = v7;
  v4[10] = *(void *)(v7 - 8);
  v4[11] = swift_task_alloc();
  uint64_t v8 = sub_10000758C((uint64_t *)&unk_10006FFB0);
  v4[12] = v8;
  v4[13] = *(void *)(v8 - 8);
  v4[14] = swift_task_alloc();
  v4[15] = type metadata accessor for MainActor();
  v4[16] = static MainActor.shared.getter();
  uint64_t v10 = dispatch thunk of Actor.unownedExecutor.getter();
  v4[17] = v10;
  v4[18] = v9;
  return _swift_task_switch(sub_100027744, v10, v9);
}

uint64_t sub_100027744()
{
  if (qword_10006EC98 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[10];
  uint64_t v1 = v0[11];
  uint64_t v4 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v5 = v0[6];
  uint64_t v6 = v0[7];
  ServerFarm.serviceHubServer.getter();
  AggregatingHostServer.connectionMonitor.getter();
  swift_release();
  AggregatingHostServer.ConnectionMonitor.$status.getter();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v0[19] = v7;
  v0[20] = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v7(v1, v3);
  AsyncStream.makeAsyncIterator()();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  uint64_t v8 = OBJC_IVAR____TtC12PreviewShell18MainViewController_isForeground;
  v0[21] = OBJC_IVAR____TtC12PreviewShell18MainViewController_xcodeConnectionWaitTimer;
  v0[22] = v8;
  v0[23] = OBJC_IVAR____TtC12PreviewShell18MainViewController_state;
  uint64_t v9 = static MainActor.shared.getter();
  v0[24] = v9;
  uint64_t v10 = (void *)swift_task_alloc();
  v0[25] = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_100027910;
  uint64_t v11 = v0[12];
  return AsyncStream.Iterator.next(isolation:)(v0 + 26, v9, &protocol witness table for MainActor, v11);
}

uint64_t sub_100027910()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 144);
  uint64_t v3 = *(void *)(v1 + 136);
  return _swift_task_switch(sub_100027A54, v3, v2);
}

uint64_t sub_100027A54()
{
  if (*(unsigned char *)(v0 + 208) == 2)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 104) + 8))(*(void *)(v0 + 112), *(void *)(v0 + 96));
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    type metadata accessor for ServiceHubService();
    sub_10002A1C0(&qword_10006FF78, (void (*)(uint64_t))&type metadata accessor for ServiceHubService);
    if (static AggregatingHostServer.ConnectionMonitor.Status.== infix(_:_:)())
    {
      uint64_t v3 = *(void *)(v0 + 168);
      uint64_t v4 = *(void *)(v0 + 16);
      if (*(void *)(v4 + v3))
      {
        swift_retain();
        DelayedInvocation.cancel()();
        swift_release();
        uint64_t v3 = *(void *)(v0 + 168);
        uint64_t v4 = *(void *)(v0 + 16);
      }
      *(void *)(v4 + v3) = 0;
      swift_release();
    }
    if (*(unsigned char *)(*(void *)(v0 + 16) + *(void *)(v0 + 176)) == 1)
    {
      uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v0 + 152);
      uint64_t v6 = *(void *)(v0 + 88);
      uint64_t v7 = *(void *)(v0 + 72);
      ServerFarm.serviceHubServer.getter();
      AggregatingHostServer.connectionMonitor.getter();
      swift_release();
      AggregatingHostServer.ConnectionMonitor.status.getter();
      v5(v6, v7);
      if ((static AggregatingHostServer.ConnectionMonitor.Status.== infix(_:_:)() & 1) != 0
        && !*(void *)(*(void *)(v0 + 16) + *(void *)(v0 + 168)))
      {
        if (qword_10006ECD8 != -1) {
          swift_once();
        }
        if (!qword_1000741B8
          || (swift_retain(),
              swift_retain(),
              EventStreamObservable.wrappedValue.getter(),
              swift_release(),
              swift_release(),
              *(unsigned char *)(v0 + 209) == 1))
        {
          uint64_t v11 = *(unsigned __int8 **)(v0 + 16);
          if (v11[*(void *)(v0 + 184)] - 1 >= 2)
          {
            uint64_t v13 = *(void *)(v0 + 32);
            uint64_t v12 = *(void *)(v0 + 40);
            uint64_t v14 = *(void *)(v0 + 24);
            sub_10001D88C();
            static ExecutionLane.main.getter();
            *(void *)(swift_allocObject() + 16) = v11;
            uint64_t v15 = v11;
            Future.observeFailure(on:_:)();
            swift_release();
            swift_release();
            (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
          }
        }
      }
    }
    uint64_t v8 = static MainActor.shared.getter();
    *(void *)(v0 + 192) = v8;
    uint64_t v9 = (void *)swift_task_alloc();
    *(void *)(v0 + 200) = v9;
    *uint64_t v9 = v0;
    v9[1] = sub_100027910;
    uint64_t v10 = *(void *)(v0 + 96);
    return AsyncStream.Iterator.next(isolation:)(v0 + 208, v8, &protocol witness table for MainActor, v10);
  }
}

uint64_t sub_100027E1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[15] = a4;
  uint64_t ObjectType = swift_getObjectType();
  sub_10000758C(&qword_10006F3B8);
  v4[16] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for CancellationToken();
  v4[17] = v7;
  v4[18] = *(void *)(v7 - 8);
  v4[19] = swift_task_alloc();
  v4[20] = type metadata accessor for MainActor();
  v4[21] = static MainActor.shared.getter();
  v4[14] = a4;
  uint64_t v8 = (void *)swift_task_alloc();
  v4[22] = v8;
  uint64_t v9 = sub_10002A1C0(&qword_10006FF68, (void (*)(uint64_t))type metadata accessor for MainViewController);
  void *v8 = v4;
  v8[1] = sub_100027FB4;
  return ConcurrentInvalidatable.invalidation.getter(ObjectType, v9);
}

uint64_t sub_100027FB4()
{
  swift_task_dealloc();
  uint64_t v1 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000280F0, v1, v0);
}

uint64_t sub_1000280F0()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v3 = v0[15];
  swift_release();
  uint64_t v4 = v3 + OBJC_IVAR____TtC12PreviewShell18MainViewController_canvasObserver;
  swift_beginAccess();
  uint64_t v5 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  if (!v5(v4, 1, v1))
  {
    uint64_t v7 = v0[18];
    uint64_t v6 = v0[19];
    uint64_t v8 = v0[17];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v4, v8);
    CancellationToken.cancel(dsoHandle:file:line:column:function:)();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  }
  uint64_t v9 = v0[15];
  uint64_t v21 = OBJC_IVAR____TtC12PreviewShell18MainViewController_xcodeObservation;
  uint64_t v10 = v9;
  if (*(void *)(v9 + OBJC_IVAR____TtC12PreviewShell18MainViewController_xcodeObservation))
  {
    swift_retain();
    Task.cancel()();
    swift_release();
    uint64_t v10 = v0[15];
  }
  uint64_t v11 = v0[17];
  uint64_t v12 = v10 + OBJC_IVAR____TtC12PreviewShell18MainViewController_previewCacheObserver;
  swift_beginAccess();
  if (!v5(v12, 1, v11))
  {
    uint64_t v14 = v0[18];
    uint64_t v13 = v0[19];
    uint64_t v15 = v0[17];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v13, v12, v15);
    CancellationToken.cancel(dsoHandle:file:line:column:function:)();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  }
  uint64_t v16 = v0[16];
  uint64_t v17 = v0[17];
  uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0[18] + 56);
  v18(v16, 1, 1, v17);
  swift_beginAccess();
  sub_10002A234(v16, v4);
  swift_endAccess();
  *(void *)(v9 + v21) = 0;
  swift_release();
  v18(v16, 1, 1, v17);
  swift_beginAccess();
  sub_10002A234(v16, v12);
  swift_endAccess();
  swift_task_dealloc();
  swift_task_dealloc();
  id v19 = (uint64_t (*)(void))v0[1];
  return v19();
}

void sub_1000284B4()
{
  v40.receiver = v0;
  v40.super_class = (Class)swift_getObjectType();
  [super viewDidLayoutSubviews];
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC12PreviewShell18MainViewController_splashViewController];
  if (v1)
  {
    id v2 = [v1 view];
    if (v2)
    {
      uint64_t v3 = v2;
      id v4 = [v0 view];
      if (v4)
      {
        uint64_t v5 = v4;
        [v4 bounds];
        double v7 = v6;
        double v9 = v8;
        double v11 = v10;
        double v13 = v12;

        [v3 setFrame:v7, v9, v11, v13];
        goto LABEL_5;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
LABEL_5:
  uint64_t v14 = *(void **)&v0[OBJC_IVAR____TtC12PreviewShell18MainViewController_connectViewController];
  if (!v14) {
    goto LABEL_9;
  }
  id v15 = [v14 view];
  if (!v15) {
    goto LABEL_16;
  }
  uint64_t v16 = v15;
  id v17 = [v0 view];
  if (!v17)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v18 = v17;
  [v17 bounds];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  [v16 setFrame:v20, v22, v24, v26];
LABEL_9:
  uint64_t v27 = *(void *)&v0[OBJC_IVAR____TtC12PreviewShell18MainViewController_previewCanvas];
  if (!v27) {
    return;
  }
  id v28 = [*(id *)(v27 + 24) view];
  if (!v28) {
    goto LABEL_18;
  }
  uint64_t v29 = v28;
  id v30 = [v0 view];
  if (!v30)
  {
LABEL_19:
    __break(1u);
    return;
  }
  uint64_t v31 = v30;
  [v30 bounds];
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;

  [v29 setFrame:v33, v35, v37, v39];
}

uint64_t sub_100028704(uint64_t a1, double a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  double v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.uv.getter();
  double v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    double v10 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)double v10 = 134217984;
    *(double *)&v13[1] = a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Timed out after %f seconds waiting for any incoming Xcode connection", v10, 0xCu);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v11 = OBJC_IVAR____TtC12PreviewShell18MainViewController_xcodeConnectionWaitTimer;
  if (*(void *)(a1 + OBJC_IVAR____TtC12PreviewShell18MainViewController_xcodeConnectionWaitTimer))
  {
    swift_retain();
    DelayedInvocation.cancel()();
    swift_release();
  }
  *(void *)(a1 + v11) = 0;
  swift_release();
  return sub_1000271E0();
}

id sub_1000288BC()
{
  uint64_t v1 = OBJC_IVAR____TtC12PreviewShell18MainViewController_splashViewController;
  id v2 = *(void **)(v0 + OBJC_IVAR____TtC12PreviewShell18MainViewController_splashViewController);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC12PreviewShell18MainViewController_splashViewController);
  }
  else
  {
    NSString v4 = String._bridgeToObjectiveC()();
    id v5 = [self storyboardWithName:v4 bundle:0];

    id v6 = [v5 instantiateInitialViewController];
    if (!v6) {
      id v6 = [objc_allocWithZone((Class)UIViewController) init];
    }

    double v7 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v6;
    id v3 = v6;

    id v2 = 0;
  }
  id v8 = v2;
  return v3;
}

void sub_1000289B0(char *a1, void *a2, char a3)
{
  [a1 addChildViewController:a2];
  id v6 = [a1 view];
  if (!v6)
  {
    __break(1u);
    goto LABEL_22;
  }
  double v7 = v6;
  id v8 = [a2 view];
  if (!v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  os_log_type_t v9 = v8;
  [v7 insertSubview:v8 atIndex:0];

  id v10 = [a2 view];
  if (!v10)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v11 = v10;
  id v12 = [a1 view];
  if (!v12)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  double v13 = v12;
  [v12 bounds];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  [v11 setFrame:v15, v17, v19, v21];
  id v22 = [a2 view];
  if (!v22)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  double v23 = v22;
  [v22 setAlpha:1.0];

  [a2 didMoveToParentViewController:a1];
  double v24 = *(void **)&a1[OBJC_IVAR____TtC12PreviewShell18MainViewController_visibleChild];
  *(void *)&a1[OBJC_IVAR____TtC12PreviewShell18MainViewController_visibleChild] = a2;
  id v41 = v24;
  if (v24 && (a3 & 1) != 0)
  {
    double v25 = self;
    uint64_t v26 = swift_allocObject();
    *(void *)(v26 + 16) = v41;
    uint64_t v46 = sub_10002A170;
    uint64_t v47 = v26;
    aBlock = _NSConcreteStackBlock;
    uint64_t v43 = 1107296256;
    uint64_t v44 = sub_100026354;
    uint64_t v45 = &unk_1000633D0;
    uint64_t v27 = _Block_copy(&aBlock);
    id v28 = v41;
    id v29 = a2;
    swift_release();
    uint64_t v30 = swift_allocObject();
    *(void *)(v30 + 16) = a1;
    *(void *)(v30 + 24) = v28;
    uint64_t v46 = sub_10002A1B8;
    uint64_t v47 = v30;
    aBlock = _NSConcreteStackBlock;
    uint64_t v43 = 1107296256;
    uint64_t v44 = sub_100026300;
    uint64_t v45 = &unk_100063420;
    uint64_t v31 = _Block_copy(&aBlock);
    id v32 = v28;
    double v33 = a1;
    swift_release();
    [v25 animateWithDuration:v27 animations:v31 completion:0.3];

    _Block_release(v31);
    _Block_release(v27);

    return;
  }
  if (!v24)
  {
    id v39 = a2;
    if (!a2) {
      return;
    }
    goto LABEL_17;
  }
  if (!a2
    || (sub_10002A130(),
        id v40 = v41,
        id v34 = a2,
        char v35 = static NSObject.== infix(_:_:)(),
        v34,
        v40,
        (v35 & 1) == 0))
  {
    [v41 willMoveToParentViewController:0, v40];
    id v37 = [v41 view];
    if (v37)
    {
      double v38 = v37;
      [v37 removeFromSuperview];

LABEL_17:
      [v41 removeFromParentViewController];
      double v36 = v41;
      goto LABEL_18;
    }
LABEL_26:
    __break(1u);
    return;
  }
  double v36 = v40;
LABEL_18:
}

void sub_100028DC4(void *a1)
{
  id v1 = [a1 view];
  if (v1)
  {
    id v2 = v1;
    [v1 setAlpha:0.0];
  }
  else
  {
    __break(1u);
  }
}

void sub_100028E24(int a1, uint64_t a2, id a3)
{
  NSString v4 = *(void **)(a2 + OBJC_IVAR____TtC12PreviewShell18MainViewController_visibleChild);
  if (!v4
    || (sub_10002A130(),
        id v5 = v4,
        id v6 = a3,
        char v7 = static NSObject.== infix(_:_:)(),
        v6,
        v5,
        (v7 & 1) == 0))
  {
    [a3 willMoveToParentViewController:0];
    id v8 = [a3 view];
    if (v8)
    {
      os_log_type_t v9 = v8;
      [v8 removeFromSuperview];

      [a3 removeFromParentViewController];
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_100028F04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  char v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.uv.getter();
  swift_errorRetain();
  swift_errorRetain();
  id v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v15[1] = a2;
    uint64_t v10 = swift_slowAlloc();
    v15[0] = v4;
    uint64_t v11 = (uint8_t *)v10;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v16 = a1;
    uint64_t v17 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    swift_errorRetain();
    sub_10000758C(&qword_10006EFF0);
    uint64_t v13 = String.init<A>(describing:)();
    uint64_t v16 = sub_100013F74(v13, v14, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "failed to load cached preview: %s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, void))(v5 + 8))(v7, v15[0]);
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_10002675C(1, 1);
}

uint64_t sub_100029268()
{
  return type metadata accessor for MainViewController();
}

uint64_t type metadata accessor for MainViewController()
{
  uint64_t result = qword_10006FF38;
  if (!qword_10006FF38) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000292BC()
{
  sub_100029384();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_100029384()
{
  if (!qword_10006FF48)
  {
    type metadata accessor for CancellationToken();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10006FF48);
    }
  }
}

uint64_t getEnumTagSinglePayload for MainViewController.State(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for MainViewController.State(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x100029538);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

unsigned char *sub_100029560(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MainViewController.State()
{
  return &type metadata for MainViewController.State;
}

unint64_t sub_10002957C()
{
  unint64_t result = qword_10006FF50;
  if (!qword_10006FF50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006FF50);
  }
  return result;
}

uint64_t sub_1000295D0()
{
  uint64_t v1 = type metadata accessor for ExecutionLane();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  unsigned int v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  if (qword_10006EC98 != -1) {
    swift_once();
  }
  sub_10001D88C();
  static ExecutionLane.main.getter();
  *(void *)(swift_allocObject() + 16) = v5;
  id v6 = v5;
  Future.observeFailure(on:_:)();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_10002972C()
{
  return swift_retain();
}

uint64_t sub_100029740(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10002A1C0(&qword_10006FF68, (void (*)(uint64_t))type metadata accessor for MainViewController);

  return ConcurrentInvalidatable.invalidate(callsite:trace:)(a1, a2, a3, v6);
}

uint64_t sub_1000297C4()
{
  return sub_10002A1C0(&qword_10006FF58, (void (*)(uint64_t))type metadata accessor for MainViewController);
}

uint64_t sub_10002980C()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100029844(uint64_t a1)
{
  sub_100028F04(a1, *(void *)(v1 + 16));
}

uint64_t sub_10002984C(void *a1, int a2, void *a3, void *a4, void *a5, char a6)
{
  uint64_t v12 = type metadata accessor for Logger();
  uint64_t v53 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  unint64_t v14 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a4;
  *(void *)(v15 + 24) = a5;
  *(unsigned char *)(v15 + 32) = a6;
  id v16 = a4;
  id v17 = a5;
  unsigned __int8 v18 = [a1 supportedInterfaceOrientations];
  id v19 = [a3 view];
  if (!v19)
  {

    __break(1u);
    JUMPOUT(0x100029FF8);
  }
  double v20 = v19;
  id v21 = [v19 window];

  if (!v21) {
    goto LABEL_9;
  }
  id v22 = [v21 windowScene];

  if (!v22) {
    goto LABEL_9;
  }
  int v52 = a2;
  id v23 = [v22 interfaceOrientation];
  if (sub_10002A074((uint64_t)v23) && (v18 & 0x18) == 0x18 || sub_10002A084((uint64_t)v23) && (v18 & 2) != 0)
  {

LABEL_9:
    sub_1000289B0((char *)v16, v17, a6 & 1);
    return swift_release();
  }
  uint64_t v51 = sub_100049170();
  static Logger.uv.getter();
  id v25 = v22;
  uint64_t v26 = Logger.logObject.getter();
  int v27 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v26, (os_log_type_t)v27))
  {
    int v48 = v27;
    os_log_t v49 = v26;
    uint64_t v28 = swift_slowAlloc();
    uint64_t v47 = (void **)swift_slowAlloc();
    aBlock = v47;
    *(_DWORD *)uint64_t v28 = 136315394;
    id v29 = [v25 interfaceOrientation:v47];
    id v50 = v25;
    unint64_t v30 = 0x8000000100057180;
    uint64_t v31 = 0xD000000000000012;
    switch((unint64_t)v29)
    {
      case 0uLL:
        unint64_t v30 = 0xE700000000000000;
        uint64_t v31 = 0x6E776F6E6B6E75;
        break;
      case 1uLL:
        unint64_t v30 = 0xE800000000000000;
        uint64_t v31 = 0x7469617274726F70;
        break;
      case 2uLL:
        break;
      case 3uLL:
        unint64_t v30 = 0xEE00746867695265;
        goto LABEL_20;
      case 4uLL:
        unint64_t v30 = 0xED00007466654C65;
LABEL_20:
        uint64_t v31 = 0x70616373646E616CLL;
        break;
      default:
        unint64_t v30 = 0xEE00746C75616665;
        uint64_t v31 = 0x446E776F6E6B6E75;
        break;
    }
    uint64_t v54 = sub_100013F74(v31, v30, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    id v33 = v50;

    *(_WORD *)(v28 + 12) = 2080;
    unint64_t v34 = 0x8000000100057180;
    char v32 = v52;
    uint64_t v35 = 0xD000000000000012;
    switch(v51)
    {
      case 0:
        unint64_t v34 = 0xE700000000000000;
        uint64_t v35 = 0x6E776F6E6B6E75;
        break;
      case 1:
        unint64_t v34 = 0xE800000000000000;
        uint64_t v35 = 0x7469617274726F70;
        break;
      case 2:
        break;
      case 3:
        unint64_t v34 = 0xED00007466654C65;
        goto LABEL_27;
      case 4:
        unint64_t v34 = 0xEE00746867695265;
LABEL_27:
        uint64_t v35 = 0x70616373646E616CLL;
        break;
      case 5:
        unint64_t v34 = 0xE600000000000000;
        uint64_t v35 = 0x705565636166;
        break;
      case 6:
        unint64_t v34 = 0xE800000000000000;
        uint64_t v35 = 0x6E776F4465636166;
        break;
      default:
        unint64_t v34 = 0xEE00746C75616665;
        uint64_t v35 = 0x446E776F6E6B6E75;
        char v32 = v52;
        break;
    }
    uint64_t v54 = sub_100013F74(v35, v34, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    os_log_t v36 = v49;
    _os_log_impl((void *)&_mh_execute_header, v49, (os_log_type_t)v48, "adjusting device orientation from %s -> %s", (uint8_t *)v28, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v53 + 8))(v14, v12);
    id v25 = v50;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v53 + 8))(v14, v12);
    char v32 = v52;
  }
  id v37 = [self currentDevice];
  uint64_t v38 = swift_allocObject();
  uint64_t v39 = v51;
  *(void *)(v38 + 16) = v37;
  *(void *)(v38 + 24) = v39;
  id v40 = v37;
  id v41 = v40;
  if (v32)
  {
    if ([v40 userInterfaceIdiom]) {
      double v42 = 0.4;
    }
    else {
      double v42 = 0.3;
    }
    uint64_t v43 = self;
    Swift::String v59 = sub_10002A0CC;
    uint64_t v60 = v38;
    aBlock = _NSConcreteStackBlock;
    uint64_t v56 = 1107296256;
    double v57 = sub_100026354;
    Swift::String v58 = &unk_100063330;
    uint64_t v44 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    uint64_t v45 = swift_allocObject();
    *(void *)(v45 + 16) = sub_10002A068;
    *(void *)(v45 + 24) = v15;
    Swift::String v59 = sub_10000FEEC;
    uint64_t v60 = v45;
    aBlock = _NSConcreteStackBlock;
    uint64_t v56 = 1107296256;
    double v57 = sub_100026300;
    Swift::String v58 = &unk_100063380;
    uint64_t v46 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    [v43 animateWithDuration:v44 animations:v46 completion:v42];

    swift_release();
    _Block_release(v46);
    _Block_release(v44);
  }
  else
  {
    [v40 setOrientation:v39 animated:0];
    sub_1000289B0((char *)v16, v17, a6 & 1);

    swift_release();
  }
  return swift_release();
}

uint64_t sub_10002A028()
{
  return _swift_deallocObject(v0, 33, 7);
}

void sub_10002A068()
{
  sub_1000289B0(*(char **)(v0 + 16), *(void **)(v0 + 24), *(unsigned char *)(v0 + 32));
}

BOOL sub_10002A074(uint64_t a1)
{
  return (unint64_t)(a1 - 3) < 2;
}

BOOL sub_10002A084(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

uint64_t sub_10002A094()
{
  return _swift_deallocObject(v0, 32, 7);
}

id sub_10002A0CC()
{
  return [*(id *)(v0 + 16) setOrientation:*(void *)(v0 + 24) animated:0];
}

uint64_t sub_10002A0E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002A0F0()
{
  return swift_release();
}

uint64_t sub_10002A0F8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

unint64_t sub_10002A130()
{
  unint64_t result = qword_10006FF60;
  if (!qword_10006FF60)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10006FF60);
  }
  return result;
}

void sub_10002A170()
{
  sub_100028DC4(*(void **)(v0 + 16));
}

uint64_t sub_10002A178()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_10002A1B8(int a1)
{
  sub_100028E24(a1, *(void *)(v1 + 16), *(id *)(v1 + 24));
}

uint64_t sub_10002A1C0(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_10002A208()
{
}

uint64_t sub_10002A234(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000758C(&qword_10006F3B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_10002A29C()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC12PreviewShell18MainViewController_invalidationHandle;
  type metadata accessor for ConcurrentInvalidationHandle();
  swift_allocObject();
  *(void *)&v0[v2] = ConcurrentInvalidationHandle.init(dsoHandle:file:line:column:function:name:)();
  v0[OBJC_IVAR____TtC12PreviewShell18MainViewController_state] = 0;
  *(void *)&v0[OBJC_IVAR____TtC12PreviewShell18MainViewController_visibleChild] = 0;
  *(void *)&v0[OBJC_IVAR____TtC12PreviewShell18MainViewController_splashViewController] = 0;
  *(void *)&v0[OBJC_IVAR____TtC12PreviewShell18MainViewController_connectViewController] = 0;
  uint64_t v3 = &v0[OBJC_IVAR____TtC12PreviewShell18MainViewController_canvasObserver];
  uint64_t v4 = type metadata accessor for CancellationToken();
  uint64_t v5 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  v5(v3, 1, 1, v4);
  *(void *)&v1[OBJC_IVAR____TtC12PreviewShell18MainViewController_xcodeObservation] = 0;
  v5(&v1[OBJC_IVAR____TtC12PreviewShell18MainViewController_previewCacheObserver], 1, 1, v4);
  v1[OBJC_IVAR____TtC12PreviewShell18MainViewController_isForeground] = 0;
  *(void *)&v1[OBJC_IVAR____TtC12PreviewShell18MainViewController_xcodeConnectionWaitTimer] = 0;
  *(void *)&v1[OBJC_IVAR____TtC12PreviewShell18MainViewController_previewCanvas] = 0;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t sub_10002A444(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *BOOL v7 = v2;
  v7[1] = sub_100020810;
  return sub_10002752C(a1, v4, v5, v6);
}

uint64_t sub_10002A4FC()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10002A53C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *BOOL v7 = v2;
  v7[1] = sub_1000237E8;
  return sub_100027E1C(a1, v4, v5, v6);
}

uint64_t sub_10002A5F0(unsigned char *a1)
{
  return sub_1000270C0(a1, *(void **)(v1 + 16));
}

uint64_t sub_10002A5F8(uint64_t a1)
{
  return sub_10002C88C(a1, v1);
}

uint64_t sub_10002A600()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002A638()
{
  if (*(unsigned char *)(v0 + 16) == 1) {
    return sub_1000271E0();
  }
  return result;
}

uint64_t sub_10002A668(uint64_t a1)
{
  uint64_t v2 = sub_10000758C(&qword_10006F3B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_10002A6FC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  [v2 setRootViewController:0];
  [v2 setHidden:1];
  [*(id *)(a1 + 16) _invalidate];
  id v3 = [self sharedInstance];
  NSString v4 = String._bridgeToObjectiveC()();
  [v3 destroyScene:v4 withTransitionContext:0];
}

uint64_t sub_10002A7CC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v92 = type metadata accessor for SceneConfigurator();
  __chkstk_darwin(v92);
  uint64_t v76 = (uint64_t)&v73 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t updated = type metadata accessor for SceneUpdateTiming();
  uint64_t v90 = *(void *)(updated - 8);
  uint64_t v91 = updated;
  uint64_t v6 = __chkstk_darwin(updated);
  unint64_t v82 = (char *)&v73 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v83 = (char *)&v73 - v9;
  __chkstk_darwin(v8);
  uint64_t v98 = (char *)&v73 - v10;
  uint64_t v11 = type metadata accessor for SceneUpdateHandshake();
  uint64_t v95 = *(void *)(v11 - 8);
  uint64_t v96 = (void (*)(char *, uint64_t))v11;
  __chkstk_darwin(v11);
  uint64_t v94 = (char *)&v73 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = type metadata accessor for Logger();
  uint64_t v86 = *(void *)(v87 - 8);
  __chkstk_darwin(v87);
  unint64_t v14 = (char *)&v73 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for PreviewPreferences();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  unsigned __int8 v18 = (char *)&v73 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for SceneLayout();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v81 = (char *)&v73 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __chkstk_darwin(v21);
  id v25 = (char *)&v73 - v24;
  __chkstk_darwin(v23);
  int v27 = (uint64_t *)((char *)&v73 - v26);
  uint64_t v28 = *(void *)(v2 + 64);
  uint64_t v78 = (void *)(v2 + 40);
  sub_10000FC3C((void *)(v2 + 40), v28);
  SceneUpdateHandshake.preferences.getter();
  sub_100024EE4(v27);
  id v29 = *(void (**)(char *, uint64_t))(v16 + 8);
  uint64_t v80 = v15;
  uint64_t v79 = v16 + 8;
  unint64_t v77 = v29;
  v29(v18, v15);
  static Logger.uv.getter();
  unint64_t v30 = *(void (**)(char *, uint64_t, void (*)(void, void)))(v95 + 16);
  uint64_t v89 = a1;
  v30(v94, a1, (void (*)(void, void))v96);
  uint64_t v31 = *(void (**)(char *, uint64_t *, uint64_t))(v20 + 16);
  uint64_t v84 = v25;
  v97 = v27;
  uint64_t v93 = v19;
  v31(v25, v27, v19);
  uint64_t v88 = v2;
  swift_retain_n();
  uint64_t v85 = v14;
  char v32 = Logger.logObject.getter();
  os_log_type_t v33 = static os_log_type_t.debug.getter();
  int v34 = v33;
  BOOL v35 = os_log_type_enabled(v32, v33);
  uint64_t v99 = v20;
  if (v35)
  {
    uint64_t v36 = swift_slowAlloc();
    uint64_t v73 = (void (*)(char *, char *, uint64_t))v31;
    uint64_t v37 = v36;
    *(void *)&v101[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v37 = 136315650;
    os_log_t v74 = v32;
    int v75 = v34;
    uint64_t v38 = v94;
    SceneUpdateHandshake.preferences.getter();
    sub_10002C284((unint64_t *)&unk_100070160, (void (*)(uint64_t))&type metadata accessor for PreviewPreferences);
    uint64_t v39 = v80;
    uint64_t v40 = dispatch thunk of CustomStringConvertible.description.getter();
    unint64_t v42 = v41;
    v77(v18, v39);
    *(void *)&long long v100 = sub_100013F74(v40, v42, (uint64_t *)v101);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, void))(v95 + 8))(v38, v96);
    *(_WORD *)(v37 + 12) = 2080;
    uint64_t v43 = v88;
    sub_10000FC3C(v78, *(void *)(v88 + 64));
    uint64_t v44 = dispatch thunk of CustomStringConvertible.description.getter();
    *(void *)&long long v100 = sub_100013F74(v44, v45, (uint64_t *)v101);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v37 + 22) = 2080;
    uint64_t v46 = v84;
    uint64_t v47 = v93;
    v73(v81, v84, v93);
    uint64_t v48 = String.init<A>(describing:)();
    *(void *)&long long v100 = sub_100013F74(v48, v49, (uint64_t *)v101);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    id v50 = *(void (**)(char *, uint64_t))(v99 + 8);
    v50(v46, v47);
    os_log_t v51 = v74;
    _os_log_impl((void *)&_mh_execute_header, v74, (os_log_type_t)v75, "Resolved preferences for %s using %s personality, new layout is %s", (uint8_t *)v37, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v86 + 8))(v85, v87);
    uint64_t v53 = v90;
    uint64_t v52 = v91;
    uint64_t v54 = v43;
  }
  else
  {
    (*(void (**)(char *, void))(v95 + 8))(v94, v96);
    uint64_t v54 = v88;
    swift_release_n();
    id v50 = *(void (**)(char *, uint64_t))(v99 + 8);
    v50(v84, v93);

    (*(void (**)(char *, uint64_t))(v86 + 8))(v85, v87);
    uint64_t v53 = v90;
    uint64_t v52 = v91;
  }
  uint64_t v55 = SceneUpdateHandshake.fenceHandle.getter();
  uint64_t v56 = *(void (**)(char *, uint64_t, uint64_t))(v53 + 104);
  if (!v55)
  {
    uint64_t v96 = v50;
    uint64_t v60 = enum case for SceneUpdateTiming.async(_:);
    v56(v83, enum case for SceneUpdateTiming.async(_:), v52);
    uint64_t v58 = enum case for SceneUpdateTiming.fenced(_:);
    v56(v82, enum case for SceneUpdateTiming.fenced(_:), v52);
    sub_10002C284((unint64_t *)&unk_100070150, (void (*)(uint64_t))&type metadata accessor for SceneUpdateTiming);
    dispatch thunk of RawRepresentable.rawValue.getter();
    dispatch thunk of RawRepresentable.rawValue.getter();
    if (v101[0] == v100)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v61 = *(void (**)(char *, uint64_t))(v53 + 8);
      v61(v82, v52);
      v61(v83, v52);
      uint64_t v59 = v99;
    }
    else
    {
      char v62 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v63 = *(void (**)(char *, uint64_t))(v53 + 8);
      v63(v82, v52);
      v63(v83, v52);
      uint64_t v59 = v99;
      if ((v62 & 1) == 0)
      {
        double v57 = 0;
        uint64_t v58 = v60;
        goto LABEL_11;
      }
    }
    double v57 = (char *)[self createForScene:*(void *)(v54 + 104)];
LABEL_11:
    id v50 = v96;
    goto LABEL_12;
  }
  double v57 = (char *)v55;
  uint64_t v58 = enum case for SceneUpdateTiming.fenced(_:);
  uint64_t v59 = v99;
LABEL_12:
  v56(v98, v58, v52);
  uint64_t v64 = v54 + OBJC_IVAR____TtC12PreviewShell14LocalSceneHost_configurator;
  swift_beginAccess();
  uint64_t v65 = v93;
  (*(void (**)(uint64_t, uint64_t *, uint64_t))(v59 + 24))(v64 + *(int *)(v92 + 24), v97, v93);
  uint64_t v66 = swift_endAccess();
  __chkstk_darwin(v66);
  uint64_t v71 = v54;
  uint64_t v72 = v57;
  sub_10003D580((uint64_t)sub_10002C27C, (uint64_t)(&v73 - 4));
  uint64_t v67 = v76;
  sub_10002C0F4(v64, v76);
  long long v68 = *(_OWORD *)(v54 + 104);
  v101[0] = *(_OWORD *)(v54 + 88);
  v101[1] = v68;
  v101[2] = *(_OWORD *)(v54 + 120);
  uint64_t v102 = *(void *)(v54 + 136);
  sub_10003D27C((uint64_t)v101);
  sub_10002C098(v67);
  sub_10000758C(&qword_10006F120);
  uint64_t v72 = v98;
  LOBYTE(v7sub_10002675C(2, 1) = 2;
  uint64_t v69 = static Future.succeeded(dsoHandle:file:line:column:function:_:)();
  [v57 invalidate];

  (*(void (**)(char *, uint64_t))(v53 + 8))(v98, v52);
  v50((char *)v97, v65);
  return v69;
}

void sub_10002B380(void *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v8 = type metadata accessor for SceneConfigurator();
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = a3 + OBJC_IVAR____TtC12PreviewShell14LocalSceneHost_configurator;
  swift_beginAccess();
  sub_10002C0F4(v11, (uint64_t)v10);
  id v12 = a4;
  sub_10003CC2C(a1);
  sub_10002C098((uint64_t)v10);
  if (a4) {
    id v13 = [v12 underlying];
  }
  else {
    id v13 = 0;
  }
  [a2 setAnimationFence:v13];
}

uint64_t sub_10002B494(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for SceneConfigurator();
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = a3 + OBJC_IVAR____TtC12PreviewShell14LocalSceneHost_configurator;
  swift_beginAccess();
  sub_10002C0F4(v8, (uint64_t)v7);
  sub_10003CC2C(a1);
  return sub_10002C098((uint64_t)v7);
}

uint64_t sub_10002B54C()
{
  swift_release();
  swift_bridgeObjectRelease();
  sub_10000FCE4(v0 + 40);

  uint64_t v1 = *(void **)(v0 + 104);
  uint64_t v2 = *(void **)(v0 + 112);
  id v3 = *(void **)(v0 + 120);
  uint64_t v4 = *(void **)(v0 + 136);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  sub_10002C098(v0 + OBJC_IVAR____TtC12PreviewShell14LocalSceneHost_configurator);
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v5, v6);
}

uint64_t sub_10002B610()
{
  return type metadata accessor for LocalSceneHost();
}

uint64_t type metadata accessor for LocalSceneHost()
{
  uint64_t result = qword_10006FFE8;
  if (!qword_10006FFE8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10002B664()
{
  uint64_t result = type metadata accessor for SceneConfigurator();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void destroy for LocalSceneHost.Client(uint64_t a1)
{
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  uint64_t v2 = *(void **)(a1 + 48);
}

void *initializeWithCopy for LocalSceneHost.Client(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = (void *)a2[2];
  uint64_t v5 = (void *)a2[3];
  a1[2] = v4;
  a1[3] = v5;
  uint64_t v7 = (void *)a2[4];
  uint64_t v6 = a2[5];
  a1[4] = v7;
  a1[5] = v6;
  uint64_t v8 = (void *)a2[6];
  a1[6] = v8;
  swift_bridgeObjectRetain();
  id v9 = v4;
  id v10 = v5;
  id v11 = v7;
  swift_unknownObjectRetain();
  id v12 = v8;
  return a1;
}

void *assignWithCopy for LocalSceneHost.Client(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a2[2];
  uint64_t v5 = (void *)a1[2];
  a1[2] = v4;
  id v6 = v4;

  uint64_t v7 = (void *)a2[3];
  uint64_t v8 = (void *)a1[3];
  a1[3] = v7;
  id v9 = v7;

  id v10 = (void *)a2[4];
  id v11 = (void *)a1[4];
  a1[4] = v10;
  id v12 = v10;

  a1[5] = a2[5];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  id v13 = (void *)a1[6];
  uint64_t v14 = (void *)a2[6];
  a1[6] = v14;
  id v15 = v14;

  return a1;
}

__n128 initializeWithTake for LocalSceneHost.Client(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for LocalSceneHost.Client(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  long long v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  uint64_t v5 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  swift_unknownObjectRelease();
  id v6 = *(void **)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);

  return a1;
}

uint64_t getEnumTagSinglePayload for LocalSceneHost.Client(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LocalSceneHost.Client(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LocalSceneHost.Client()
{
  return &type metadata for LocalSceneHost.Client;
}

uint64_t sub_10002B9EC(uint64_t a1)
{
  return sub_10002A7CC(a1);
}

id sub_10002BA10(int a1, id a2)
{
  return [a2 invalidate];
}

uint64_t sub_10002BA20(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  unsigned __int8 v18 = &type metadata for LocalStaticPersonality;
  unint64_t v19 = sub_100025220();
  type metadata accessor for InvalidationHandle();
  swift_allocObject();
  *(void *)(a6 + 16) = InvalidationHandle.init(dsoHandle:file:line:column:function:name:)();
  *(void *)(a6 + 24) = a1;
  *(void *)(a6 + 32) = a2;
  sub_10000FC80((uint64_t)v17, a6 + 40);
  sub_10002C0F4(a3, a6 + OBJC_IVAR____TtC12PreviewShell14LocalSceneHost_configurator);
  *(void *)(a6 + 80) = a4;
  long long v12 = *(_OWORD *)(a5 + 16);
  *(_OWORD *)(a6 + 88) = *(_OWORD *)a5;
  *(_OWORD *)(a6 + 104) = v12;
  *(_OWORD *)(a6 + 120) = *(_OWORD *)(a5 + 32);
  *(void *)(a6 + 136) = *(void *)(a5 + 48);
  uint64_t v13 = swift_allocObject();
  long long v14 = *(_OWORD *)(a5 + 16);
  *(_OWORD *)(v13 + 16) = *(_OWORD *)a5;
  *(_OWORD *)(v13 + 32) = v14;
  *(_OWORD *)(v13 + 48) = *(_OWORD *)(a5 + 32);
  *(void *)(v13 + 64) = *(void *)(a5 + 48);
  *(void *)(v13 + 72) = a6;
  sub_10002C21C(a5);
  sub_10002C21C(a5);
  type metadata accessor for LocalSceneHost();
  sub_10002C284(&qword_100070148, (void (*)(uint64_t))type metadata accessor for LocalSceneHost);
  id v15 = a4;
  swift_retain();
  Invalidatable.onInvalidation(_:)();
  swift_release();
  sub_10002C098(a3);
  sub_10000FCE4((uint64_t)v17);
  return a6;
}

uint64_t sub_10002BBFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v8 = v7;
  uint64_t v56 = a7;
  uint64_t v15 = type metadata accessor for SceneConfigurator();
  uint64_t v16 = v15 - 8;
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v68 = (uint64_t)&v44 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v44 - v19;
  sub_10000FC80(a5, (uint64_t)&v60);
  *((void *)v20 + 5) = 0;
  *((void *)v20 + 6) = 0;
  uint64_t v21 = &v20[*(int *)(v16 + 32)];
  uint64_t v22 = qword_10006ECF8;
  swift_bridgeObjectRetain();
  if (v22 != -1) {
    swift_once();
  }
  uint64_t v23 = type metadata accessor for SceneLayout();
  uint64_t v24 = sub_10000E620(v23, (uint64_t)qword_1000741D8);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v24, v23);
  sub_10000E710(&v60, (uint64_t)v20);
  swift_bridgeObjectRelease();
  *((void *)v20 + 5) = a3;
  *((void *)v20 + 6) = a4;
  sub_10003D7F4(a1, a2, a6, &v60);
  if (v8) {
    return sub_10002C098((uint64_t)v20);
  }
  uint64_t v55 = *((void *)&v60 + 1);
  uint64_t v53 = (void *)v60;
  uint64_t v26 = v62;
  uint64_t v49 = v61;
  int v27 = v64;
  id v50 = v63;
  uint64_t v28 = v66;
  uint64_t v52 = v65;
  v67[0] = *((void *)&v60 + 1);
  v67[1] = v61;
  v67[2] = v62;
  v67[3] = v63;
  v67[4] = v64;
  v67[5] = v65;
  v67[6] = v66;
  uint64_t v47 = (uint64_t)v66;
  sub_10000FC80(a6, (uint64_t)&v60);
  sub_10002C0F4((uint64_t)v20, v68);
  uint64_t v29 = a2;
  uint64_t v51 = a1;
  uint64_t v30 = sub_10002C158((uint64_t)&v60, (uint64_t)v62);
  uint64_t v54 = &v44;
  __chkstk_darwin(v30);
  (*(void (**)(void))(v31 + 16))();
  uint64_t v58 = &type metadata for LocalStaticPersonality;
  unint64_t v59 = sub_100025220();
  type metadata accessor for LocalSceneHost();
  uint64_t v46 = swift_allocObject();
  uint64_t v32 = sub_10002C158((uint64_t)v57, (uint64_t)&type metadata for LocalStaticPersonality);
  uint64_t v48 = &v44;
  __chkstk_darwin(v32);
  (*(void (**)(void))(v33 + 16))();
  id v45 = v28;
  swift_bridgeObjectRetain();
  uint64_t v34 = v49;
  swift_bridgeObjectRetain();
  id v35 = v26;
  id v36 = v50;
  id v37 = v27;
  uint64_t v38 = v52;
  swift_unknownObjectRetain();
  uint64_t v39 = v53;
  uint64_t v40 = sub_10002BA20(v51, v29, v68, v53, (uint64_t)v67, v46);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000FCE4((uint64_t)v57);
  sub_10000FCE4((uint64_t)&v60);
  uint64_t result = sub_10002C098((uint64_t)v20);
  unint64_t v41 = v56;
  uint64_t v42 = v55;
  uint64_t *v56 = v40;
  v41[1] = v42;
  v41[2] = v34;
  v41[3] = (uint64_t)v35;
  v41[4] = (uint64_t)v36;
  v41[5] = (uint64_t)v37;
  uint64_t v43 = v47;
  v41[6] = v38;
  v41[7] = v43;
  return result;
}

uint64_t sub_10002C098(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SceneConfigurator();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10002C0F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SceneConfigurator();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002C158(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_10002C1A8()
{
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 80, 7);
}

void sub_10002C210()
{
  sub_10002A6FC(v0 + 16);
}

uint64_t sub_10002C21C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  long long v3 = *(void **)(a1 + 24);
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  swift_bridgeObjectRetain();
  id v6 = v2;
  id v7 = v3;
  id v8 = v4;
  swift_unknownObjectRetain();
  return a1;
}

void sub_10002C27C(void *a1, void *a2)
{
  sub_10002B380(a1, a2, *(void *)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_10002C284(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10002C2CC(uint64_t a1, uint64_t a2)
{
  uint64_t v39 = a1;
  uint64_t v40 = a2;
  uint64_t v41 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  id v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000758C(&qword_10006FB98);
  __chkstk_darwin(v6 - 8);
  id v37 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for PreviewType();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for LaunchPayload();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v37 - v17;
  uint64_t v38 = v2;
  uint64_t v19 = (uint64_t *)(v2 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_launches);
  swift_beginAccess();
  uint64_t v20 = *v19;
  if (*(void *)(v20 + 16) && (unint64_t v21 = sub_10000916C(v40), (v22 & 1) != 0))
  {
    uint64_t v23 = *(void (**)(char *, unint64_t, uint64_t))(v13 + 16);
    v23(v16, *(void *)(v20 + 56) + *(void *)(v13 + 72) * v21, v12);
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v18, v16, v12);
    swift_endAccess();
    uint64_t v24 = v39;
    ShellUpdatePayload.previewType.getter();
    if ((*(unsigned int (**)(char *, uint64_t))(v9 + 88))(v11, v8) == enum case for PreviewType.hosted(_:))
    {
      (*(void (**)(char *, uint64_t))(v9 + 96))(v11, v8);
      uint64_t v25 = type metadata accessor for PreviewType.HostLocation();
      uint64_t v26 = *(void *)(v25 - 8);
      if ((*(unsigned int (**)(char *, uint64_t))(v26 + 88))(v11, v25) == enum case for PreviewType.HostLocation.mainScene(_:))
      {
        (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v25);
        uint64_t v27 = (uint64_t)v37;
        v23(v37, (unint64_t)v18, v12);
        uint64_t v28 = v18;
        uint64_t v29 = type metadata accessor for PreviewCache.Replayable(0);
        uint64_t v30 = v27 + *(int *)(v29 + 20);
        uint64_t updated = type metadata accessor for ShellUpdatePayload();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(updated - 8) + 16))(v30, v24, updated);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v27, 0, 1, v29);
        uint64_t v32 = v38 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_replayable;
        swift_beginAccess();
        sub_100021260(v27, v32);
        swift_endAccess();
        sub_10002CBE0();
        return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v28, v12);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
        return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v11, v25);
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
      return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    }
  }
  else
  {
    swift_endAccess();
    static Logger.uv.getter();
    uint64_t v34 = Logger.logObject.getter();
    os_log_type_t v35 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v34, v35))
    {
      id v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v36 = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "PreviewCache: ignoring update with no previously stored launch", v36, 2u);
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v41);
  }
}

uint64_t sub_10002C84C()
{
  type metadata accessor for PreviewCache(0);
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_10002E844();
  qword_1000741B8 = v0;
  return result;
}

uint64_t sub_10002C88C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_replayable;
  swift_beginAccess();
  sub_10002FE84(a1, v3);
  swift_endAccess();
  swift_retain();
  EventStreamObservable.wrappedValue.setter();
  return swift_release();
}

uint64_t sub_10002C918(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for DispatchQoS();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[0] = *(void *)(v3 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_persistQueue);
  uint64_t v14 = (void *)swift_allocObject();
  void v14[2] = v3;
  void v14[3] = a1;
  void v14[4] = a2;
  aBlock[4] = sub_10002FBF4;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100026354;
  aBlock[3] = &unk_1000636A8;
  uint64_t v15 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  static DispatchQoS.unspecified.getter();
  v17[1] = &_swiftEmptyArrayStorage;
  sub_10002FC18(&qword_10006EF78, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000758C(&qword_10006EF80);
  sub_10002FC60((unint64_t *)&qword_10006EF88, &qword_10006EF80);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return swift_release();
}

uint64_t sub_10002CBE0()
{
  uint64_t v1 = type metadata accessor for DispatchScheduler();
  __chkstk_darwin(v1);
  uint64_t v2 = sub_10000758C(&qword_10006FB98);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v5 = __chkstk_darwin(v2 - 8);
  uint64_t v6 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v15 - v7;
  uint64_t v9 = v0 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_replayable;
  swift_beginAccess();
  sub_10002FAF4(v9, (uint64_t)v8, &qword_10006FB98);
  uint64_t v10 = (uint64_t *)(v0 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_persistTimer);
  swift_beginAccess();
  if (*v10)
  {
    swift_retain();
    DelayedInvocation.cancel()();
    swift_release();
  }
  id v11 = *(id *)(v0 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_persistQueue);
  DispatchScheduler.init(queue:)();
  sub_10002FAF4((uint64_t)v8, (uint64_t)v6, &qword_10006FB98);
  unint64_t v12 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v0;
  sub_10002ED58((uint64_t)v6, v13 + v12);
  type metadata accessor for DelayedInvocation();
  swift_allocObject();
  swift_retain();
  *uint64_t v10 = DelayedInvocation.init<A>(scheduler:callback:)();
  swift_release();
  swift_beginAccess();
  if (*v10)
  {
    swift_endAccess();
    swift_retain();
    DelayedInvocation.schedule(delay:)(1.0);
    swift_release();
    return sub_10000FD9C((uint64_t)v8, &qword_10006FB98);
  }
  else
  {
    sub_10000FD9C((uint64_t)v8, &qword_10006FB98);
    return swift_endAccess();
  }
}

uint64_t sub_10002CEA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v23 = a2;
  uint64_t v24 = a3;
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v27 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DispatchQoS();
  uint64_t v25 = *(void *)(v6 - 8);
  uint64_t v26 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000758C(&qword_10006FB98);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = __chkstk_darwin(v9 - 8);
  uint64_t v13 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v22 - v14;
  sub_10002D240((uint64_t)&v22 - v14);
  sub_1000074AC();
  uint64_t v16 = (void *)static OS_dispatch_queue.main.getter();
  sub_10002FAF4((uint64_t)v15, (uint64_t)v13, &qword_10006FB98);
  unint64_t v17 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v18 = swift_allocObject();
  uint64_t v19 = v24;
  *(void *)(v18 + 16) = v23;
  *(void *)(v18 + 24) = v19;
  sub_10002ED58((uint64_t)v13, v18 + v17);
  aBlock[4] = sub_10002FE18;
  aBlock[5] = v18;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100026354;
  aBlock[3] = &unk_1000636F8;
  uint64_t v20 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_10002FC18(&qword_10006EF78, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000758C(&qword_10006EF80);
  sub_10002FC60((unint64_t *)&qword_10006EF88, &qword_10006EF80);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v27 + 8))(v5, v3);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v8, v26);
  return sub_10000FD9C((uint64_t)v15, &qword_10006FB98);
}

uint64_t sub_10002D240@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v50 = (char *)v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t updated = type metadata accessor for ShellUpdatePayload();
  uint64_t v45 = *(void *)(updated - 8);
  __chkstk_darwin(updated);
  uint64_t v47 = (char *)v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = type metadata accessor for LaunchPayload();
  uint64_t v46 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v7 = (char *)v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000758C(&qword_100070308);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for URL();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  unint64_t v17 = (char *)v43 - v16;
  if (qword_10006ECE0 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_10000E620(v8, (uint64_t)qword_100070170);
  sub_10002FAF4(v18, (uint64_t)v10, &qword_100070308);
  uint64_t v19 = sub_10000758C(&qword_100070310);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 48))(v10, 1, v19) == 1)
  {
    sub_10000FD9C((uint64_t)v10, &qword_100070308);
    uint64_t v20 = type metadata accessor for PreviewCache.Replayable(0);
    unint64_t v21 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56);
    uint64_t v22 = a1;
  }
  else
  {
    v43[1] = v3;
    v43[2] = v2;
    uint64_t v44 = a1;
    uint64_t v23 = &v10[*(int *)(v19 + 48)];
    uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
    v24(v17, v10, v11);
    v24(v15, v23, v11);
    id v25 = objc_allocWithZone((Class)NSDictionary);
    URL._bridgeToObjectiveC()(v26);
    uint64_t v28 = v27;
    id v29 = [v25 initWithContentsOfURL:v27];

    if (v29)
    {
      uint64_t v51 = 0;
      static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();

      if (v51)
      {
        id v30 = objc_allocWithZone((Class)NSDictionary);
        URL._bridgeToObjectiveC()(v31);
        uint64_t v33 = v32;
        id v34 = [v30 initWithContentsOfURL:v32];

        if (v34)
        {
          uint64_t v51 = 0;
          static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();

          if (v51)
          {
            sub_10002FC18(&qword_100070318, (void (*)(uint64_t))&type metadata accessor for LaunchPayload);
            uint64_t v35 = v49;
            PropertyListRepresentable.init(serializableDictionary:)();
            sub_10002FC18(&qword_100070320, (void (*)(uint64_t))&type metadata accessor for ShellUpdatePayload);
            id v36 = v47;
            uint64_t v37 = updated;
            PropertyListRepresentable.init(serializableDictionary:)();
            uint64_t v39 = *(void (**)(char *, uint64_t))(v12 + 8);
            v39(v15, v11);
            v39(v17, v11);
            uint64_t v40 = v44;
            (*(void (**)(uint64_t, char *, uint64_t))(v46 + 32))(v44, v7, v35);
            uint64_t v41 = type metadata accessor for PreviewCache.Replayable(0);
            (*(void (**)(uint64_t, char *, uint64_t))(v45 + 32))(v40 + *(int *)(v41 + 20), v36, v37);
            return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v40, 0, 1, v41);
          }
        }
        swift_bridgeObjectRelease();
      }
    }
    uint64_t v38 = *(void (**)(char *, uint64_t))(v12 + 8);
    v38(v15, v11);
    v38(v17, v11);
    uint64_t v20 = type metadata accessor for PreviewCache.Replayable(0);
    unint64_t v21 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56);
    uint64_t v22 = v44;
  }
  return v21(v22, 1, 1, v20);
}

uint64_t sub_10002DA4C()
{
  uint64_t v0 = sub_10000758C(&qword_100070308);
  sub_100023A7C(v0, qword_100070170);
  uint64_t v1 = sub_10000E620(v0, (uint64_t)qword_100070170);
  return sub_10002DA9C(v1);
}

uint64_t sub_10002DA9C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000758C(&qword_10006F9E8);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = [self defaultManager];
  id v14 = [v13 URLsForDirectory:9 inDomains:1];

  uint64_t v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(void *)(v15 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v10 + 16))(v8, v15 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80)), v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
  }
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_10000FD9C((uint64_t)v8, &qword_10006F9E8);
    static Logger.uv.getter();
    uint64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "unable to locate documents directory for preview cache", v18, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v19 = sub_10000758C(&qword_100070310);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(a1, 1, 1, v19);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
    URL.appendingPathComponent(_:)();
    uint64_t v21 = sub_10000758C(&qword_100070310);
    URL.appendingPathComponent(_:)();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(a1, 0, 1, v21);
  }
}

uint64_t sub_10002DEC0()
{
  swift_release();
  sub_10000FD9C(v0 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_replayable, &qword_10006FB98);
  swift_bridgeObjectRelease();
  swift_release();

  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_10002DF64()
{
  return type metadata accessor for PreviewCache(0);
}

uint64_t type metadata accessor for PreviewCache(uint64_t a1)
{
  return sub_100014BD8(a1, (uint64_t *)&unk_1000701C8);
}

void sub_10002DF8C()
{
  sub_10002E050();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10002E050()
{
  if (!qword_1000701D8)
  {
    type metadata accessor for PreviewCache.Replayable(255);
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000701D8);
    }
  }
}

uint64_t type metadata accessor for PreviewCache.Replayable(uint64_t a1)
{
  return sub_100014BD8(a1, qword_1000702D0);
}

uint64_t *sub_10002E0C8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for LaunchPayload();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t updated = type metadata accessor for ShellUpdatePayload();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(updated - 8) + 16))(v9, v10, updated);
  }
  return a1;
}

uint64_t sub_10002E1D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LaunchPayload();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t updated = type metadata accessor for ShellUpdatePayload();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(updated - 8) + 8);

  return v7(v5, updated);
}

uint64_t sub_10002E278(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for LaunchPayload();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t updated = type metadata accessor for ShellUpdatePayload();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(updated - 8) + 16))(v8, v9, updated);
  return a1;
}

uint64_t sub_10002E330(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for LaunchPayload();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t updated = type metadata accessor for ShellUpdatePayload();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(updated - 8) + 24))(v8, v9, updated);
  return a1;
}

uint64_t sub_10002E3E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for LaunchPayload();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t updated = type metadata accessor for ShellUpdatePayload();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(updated - 8) + 32))(v8, v9, updated);
  return a1;
}

uint64_t sub_10002E4A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for LaunchPayload();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t updated = type metadata accessor for ShellUpdatePayload();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(updated - 8) + 40))(v8, v9, updated);
  return a1;
}

uint64_t sub_10002E558(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002E56C);
}

uint64_t sub_10002E56C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for LaunchPayload();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t updated = type metadata accessor for ShellUpdatePayload();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(updated - 8) + 48);
    uint64_t v12 = updated;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_10002E664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002E678);
}

uint64_t sub_10002E678(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for LaunchPayload();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t updated = type metadata accessor for ShellUpdatePayload();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(updated - 8) + 56);
    uint64_t v14 = updated;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t sub_10002E77C()
{
  uint64_t result = type metadata accessor for LaunchPayload();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for ShellUpdatePayload();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_10002E844()
{
  uint64_t v1 = v0;
  uint64_t v11 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v2 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v5);
  uint64_t v6 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v6 - 8);
  char v13 = 0;
  sub_10000758C(&qword_100070328);
  swift_allocObject();
  *(void *)(v0 + 16) = EventStreamObservable.init(wrappedValue:emitsInitialValue:)();
  uint64_t v7 = v0 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_replayable;
  uint64_t v8 = type metadata accessor for PreviewCache.Replayable(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *(void *)(v1 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_launches) = _swiftEmptyDictionarySingleton;
  *(void *)(v1 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_persistTimer) = 0;
  uint64_t v10 = OBJC_IVAR____TtC12PreviewShell12PreviewCache_persistQueue;
  sub_1000074AC();
  static DispatchQoS.unspecified.getter();
  uint64_t v12 = &_swiftEmptyArrayStorage;
  sub_10002FC18(&qword_100070330, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_10000758C(&qword_100070338);
  sub_10002FC60(&qword_100070340, &qword_100070338);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v11);
  *(void *)(v1 + v10) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  return v1;
}

void sub_10002EB38(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *a1 = v7;
  uint64_t v8 = *a2;
  if (*a2)
  {
    void *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_10002EBF0()
{
  uint64_t v1 = *(void *)(sub_10000758C(&qword_10006FB98) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_release();
  uint64_t v5 = type metadata accessor for PreviewCache.Replayable(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v0 + v3, 1, v5))
  {
    uint64_t v6 = type metadata accessor for LaunchPayload();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
    uint64_t v7 = v0 + v3 + *(int *)(v5 + 20);
    uint64_t updated = type metadata accessor for ShellUpdatePayload();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(updated - 8) + 8))(v7, updated);
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10002ED58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000758C(&qword_10006FB98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002EDC0()
{
  uint64_t v1 = *(void *)(sub_10000758C(&qword_10006FB98) - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_10002F394(v2);
}

uint64_t sub_10002EE24()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v46 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)v41 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10000758C(&qword_100070308);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)v41 - v11;
  if (qword_10006ECE0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_10000E620(v3, (uint64_t)qword_100070170);
  sub_10002FAF4(v13, (uint64_t)v5, &qword_100070308);
  uint64_t v14 = sub_10000758C(&qword_100070310);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48))(v5, 1, v14) == 1) {
    return sub_10000FD9C((uint64_t)v5, &qword_100070308);
  }
  uint64_t v16 = &v5[*(int *)(v14 + 48)];
  uint64_t v45 = v7;
  os_log_type_t v17 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  v17(v12, v5, v6);
  v17(v10, v16, v6);
  uint64_t v18 = self;
  id v19 = [v18 defaultManager];
  uint64_t v44 = v12;
  URL._bridgeToObjectiveC()(v20);
  uint64_t v22 = v21;
  id v47 = 0;
  unsigned int v23 = [v19 removeItemAtURL:v21 error:&v47];

  id v24 = v47;
  if (!v23) {
    goto LABEL_8;
  }
  id v25 = v47;
  id v26 = [v18 defaultManager];
  URL._bridgeToObjectiveC()(v27);
  id v29 = v28;
  id v47 = 0;
  unsigned int v30 = [v26 removeItemAtURL:v28 error:&v47];

  id v24 = v47;
  if (v30)
  {
    uint64_t v31 = *(void (**)(char *, uint64_t))(v45 + 8);
    id v32 = v47;
    v31(v10, v6);
    return ((uint64_t (*)(char *, uint64_t))v31)(v44, v6);
  }
  else
  {
LABEL_8:
    uint64_t v43 = v10;
    id v33 = v24;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    static Logger.uv.getter();
    swift_errorRetain();
    swift_errorRetain();
    id v34 = Logger.logObject.getter();
    os_log_type_t v35 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v34, v35))
    {
      id v36 = (uint8_t *)swift_slowAlloc();
      uint64_t v42 = (void *)swift_slowAlloc();
      *(_DWORD *)id v36 = 138412290;
      v41[1] = v36 + 4;
      swift_errorRetain();
      uint64_t v37 = v0;
      uint64_t v38 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v47 = v38;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v42 = v38;
      uint64_t v0 = v37;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "Failed to clear persisted cache: %@", v36, 0xCu);
      sub_10000758C(&qword_10006F2A8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();
    }
    uint64_t v39 = v45;
    swift_errorRelease();
    (*(void (**)(char *, uint64_t))(v46 + 8))(v2, v0);
    uint64_t v40 = *(void (**)(char *, uint64_t))(v39 + 8);
    v40(v43, v6);
    return ((uint64_t (*)(char *, uint64_t))v40)(v44, v6);
  }
}

uint64_t sub_10002F394(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v47 = *(void *)(v2 - 8);
  uint64_t v48 = v2;
  __chkstk_darwin(v2);
  uint64_t v49 = (void *)((char *)v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = sub_10000758C(&qword_100070308);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v51 = *(void *)(v7 - 8);
  uint64_t v8 = __chkstk_darwin(v7);
  id v50 = (char *)v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v46 - v10;
  uint64_t v12 = sub_10000758C(&qword_10006FB98);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for PreviewCache.Replayable(0);
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)v46 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002FAF4(a1, (uint64_t)v14, &qword_10006FB98);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    sub_10000FD9C((uint64_t)v14, &qword_10006FB98);
    return sub_10002EE24();
  }
  sub_100020F5C((uint64_t)v14, (uint64_t)v18);
  if (qword_10006ECE0 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_10000E620(v4, (uint64_t)qword_100070170);
  sub_10002FAF4(v20, (uint64_t)v6, &qword_100070308);
  uint64_t v21 = sub_10000758C(&qword_100070310);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 48))(v6, 1, v21) == 1)
  {
    sub_10002FB58((uint64_t)v18);
    return sub_10000FD9C((uint64_t)v6, &qword_100070308);
  }
  uint64_t v22 = &v6[*(int *)(v21 + 48)];
  unsigned int v23 = *(void (**)(char *, char *, uint64_t))(v51 + 32);
  v23(v11, v6, v7);
  id v24 = v50;
  v23(v50, v22, v7);
  type metadata accessor for LaunchPayload();
  sub_10002FC18(&qword_100070318, (void (*)(uint64_t))&type metadata accessor for LaunchPayload);
  PropertyListRepresentable.serializableDictionary.getter();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  URL._bridgeToObjectiveC()(v26);
  uint64_t v28 = v27;
  id v52 = 0;
  unsigned int v29 = [(objc_class *)isa writeToURL:v27 error:&v52];

  id v30 = v52;
  if (!v29)
  {
    uint64_t v37 = v49;
    goto LABEL_11;
  }
  type metadata accessor for ShellUpdatePayload();
  sub_10002FC18(&qword_100070320, (void (*)(uint64_t))&type metadata accessor for ShellUpdatePayload);
  id v31 = v30;
  PropertyListRepresentable.serializableDictionary.getter();
  Class v32 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  URL._bridgeToObjectiveC()(v33);
  os_log_type_t v35 = v34;
  id v52 = 0;
  unsigned int v36 = [(objc_class *)v32 writeToURL:v34 error:&v52];

  id v30 = v52;
  uint64_t v37 = v49;
  if (!v36)
  {
LABEL_11:
    id v40 = v30;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    static Logger.uv.getter();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v41 = Logger.logObject.getter();
    os_log_type_t v42 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = (uint8_t *)swift_slowAlloc();
      uint64_t v49 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v43 = 138412290;
      v46[1] = v43 + 4;
      swift_errorRetain();
      uint64_t v44 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v52 = v44;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v49 = v44;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "Failed to persist preview cache: %@", v43, 0xCu);
      sub_10000758C(&qword_10006F2A8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    (*(void (**)(void *, uint64_t))(v47 + 8))(v37, v48);
    sub_10002EE24();
    swift_errorRelease();
    uint64_t v45 = *(void (**)(char *, uint64_t))(v51 + 8);
    v45(v50, v7);
    v45(v11, v7);
    return sub_10002FB58((uint64_t)v18);
  }
  uint64_t v38 = *(void (**)(char *, uint64_t))(v51 + 8);
  id v39 = v52;
  v38(v24, v7);
  v38(v11, v7);
  return sub_10002FB58((uint64_t)v18);
}

uint64_t sub_10002FAF4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000758C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10002FB58(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PreviewCache.Replayable(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10002FBB4()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10002FBF4()
{
  return sub_10002CEA0(v0[2], v0[3], v0[4]);
}

uint64_t sub_10002FC00(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002FC10()
{
  return swift_release();
}

uint64_t sub_10002FC18(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10002FC60(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000762C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10002FCB0()
{
  uint64_t v1 = *(void *)(sub_10000758C(&qword_10006FB98) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_release();
  uint64_t v5 = type metadata accessor for PreviewCache.Replayable(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v0 + v3, 1, v5))
  {
    uint64_t v6 = type metadata accessor for LaunchPayload();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
    uint64_t v7 = v0 + v3 + *(int *)(v5 + 20);
    uint64_t updated = type metadata accessor for ShellUpdatePayload();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(updated - 8) + 8))(v7, updated);
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10002FE18()
{
  uint64_t v1 = *(void *)(sub_10000758C(&qword_10006FB98) - 8);
  return (*(uint64_t (**)(unint64_t))(v0 + 16))(v0 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
}

uint64_t sub_10002FE84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000758C(&qword_10006FB98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002FEF8()
{
  uint64_t result = type metadata accessor for PreviewAgentConnector();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for EntryPointCategory();
    if (v2 <= 0x3F) {
      return swift_initClassMetadata2();
    }
  }
  return result;
}

uint64_t sub_10002FFFC(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_10000FD9C(a1, &qword_10006FB38);
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

BOOL sub_1000301A8(char a1, char a2)
{
  return a1 == a2;
}

void sub_1000301B8(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int sub_1000301E0(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

BOOL sub_100030228(char *a1, char *a2)
{
  return sub_1000301A8(*a1, *a2);
}

Swift::Int sub_100030240()
{
  return sub_1000301E0(*v0);
}

void sub_100030250(uint64_t a1)
{
  sub_1000301B8(a1, *v1);
}

Swift::Int sub_100030260()
{
  Hasher.init(_seed:)();
  sub_1000301B8((uint64_t)v2, *v0);
  return Hasher._finalize()();
}

uint64_t sub_1000302AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[10] = a4;
  v5[11] = v4;
  v5[8] = a2;
  v5[9] = a3;
  v5[7] = a1;
  uint64_t v6 = type metadata accessor for PreviewAgentConnector();
  v5[12] = v6;
  v5[13] = *(void *)(v6 - 8);
  v5[14] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for AgentSceneConfiguration();
  v5[15] = v7;
  v5[16] = *(void *)(v7 - 8);
  v5[17] = swift_task_alloc();
  sub_10000758C(&qword_100070490);
  v5[18] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for EntryPointCategory();
  v5[19] = v8;
  v5[20] = *(void *)(v8 - 8);
  v5[21] = swift_task_alloc();
  v5[22] = swift_task_alloc();
  type metadata accessor for MainActor();
  v5[23] = static MainActor.shared.getter();
  uint64_t v10 = dispatch thunk of Actor.unownedExecutor.getter();
  v5[24] = v10;
  v5[25] = v9;
  return _swift_task_switch(sub_1000304A0, v10, v9);
}

uint64_t sub_1000304A0()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = *(void *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 96);
  uint64_t v4 = dispatch thunk of static CategoryMap.entryPoints.getter();
  if (*(void *)(v4 + 16) && (unint64_t v5 = sub_1000092D4(v0[7]), (v6 & 1) != 0))
  {
    (*(void (**)(void, unint64_t, void))(v0[20] + 16))(v0[18], *(void *)(v4 + 56) + *(void *)(v0[20] + 72) * v5, v0[19]);
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }
  uint64_t v8 = v0[19];
  uint64_t v9 = v0[20];
  uint64_t v10 = v0[18];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v10, v7, 1, v8);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v10, 1, v8) == 1)
  {
    uint64_t v11 = v0[18];
    swift_release();
    sub_10000FD9C(v11, &qword_100070490);
    static CategoryMap.unhandled(_:)();
    uint64_t v12 = v0[5];
    uint64_t v13 = sub_10000FC3C(v0 + 2, v12);
    uint64_t v14 = *(void *)(v12 - 8);
    uint64_t v15 = swift_task_alloc();
    (*(void (**)(uint64_t, void *, uint64_t))(v14 + 16))(v15, v13, v12);
    if (_getErrorEmbeddedNSError<A>(_:)())
    {
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v15, v12);
    }
    else
    {
      swift_allocError();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32))(v20, v15, v12);
    }
    swift_willThrow();
    swift_task_dealloc();
    sub_10000FCE4((uint64_t)(v0 + 2));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v21 = (uint64_t (*)(void))v0[1];
    return v21();
  }
  else
  {
    uint64_t v17 = v0[8];
    uint64_t v16 = v0[9];
    (*(void (**)(void, void, void))(v0[20] + 32))(v0[22], v0[18], v0[19]);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 16))(v17, v16, v2, v3);
    uint64_t v18 = (void *)swift_task_alloc();
    v0[26] = v18;
    *uint64_t v18 = v0;
    v18[1] = sub_100030814;
    uint64_t v19 = v0[17];
    return PreviewAgentConnector.injectScene(configuration:)(v19);
  }
}

uint64_t sub_100030814(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 216) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[24];
    uint64_t v6 = v4[25];
    uint64_t v7 = sub_100030B74;
  }
  else
  {
    v4[28] = a1;
    uint64_t v5 = v4[24];
    uint64_t v6 = v4[25];
    uint64_t v7 = sub_10003093C;
  }
  return _swift_task_switch(v7, v5, v6);
}

uint64_t sub_10003093C()
{
  uint64_t v21 = v0[28];
  uint64_t v22 = v0[27];
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[21];
  uint64_t v3 = v0[19];
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[14];
  uint64_t v6 = v0[12];
  uint64_t v7 = v0[10];
  uint64_t v19 = v0[22];
  uint64_t v20 = v0[9];
  uint64_t v8 = v0[8];
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v5, v7, v6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v2, v19, v3);
  swift_allocObject();
  swift_unknownObjectRetain();
  uint64_t v9 = sub_100030D0C(v5, v21, v8, v20, v2);
  uint64_t v10 = v0[22];
  if (v22)
  {
    uint64_t v11 = v0[19];
    uint64_t v12 = v0[20];
    (*(void (**)(void, void))(v0[16] + 8))(v0[17], v0[15]);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v13 = (uint64_t (*)(void))v0[1];
    return v13();
  }
  else
  {
    uint64_t v15 = v9;
    uint64_t v16 = v0[20];
    uint64_t v17 = v0[19];
    (*(void (**)(void, void))(v0[16] + 8))(v0[17], v0[15]);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v10, v17);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v18 = (uint64_t (*)(void *))v0[1];
    return v18(v15);
  }
}

uint64_t sub_100030B74()
{
  uint64_t v1 = v0[22];
  uint64_t v2 = v0[19];
  uint64_t v3 = v0[20];
  uint64_t v5 = v0[16];
  uint64_t v4 = v0[17];
  uint64_t v6 = v0[15];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

void *sub_100030C54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_100030D0C(a1, a2, a3, a4, a5);
}

uint64_t sub_100030CD0()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 96) + 24))();
}

void *sub_100030D0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = v5;
  uint64_t v41 = a5;
  uint64_t v12 = *v5;
  uint64_t v37 = v6;
  uint64_t v38 = v12;
  uint64_t v13 = sub_10000758C(&qword_10006FB38);
  __chkstk_darwin(v13 - 8);
  unsigned int v36 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for InvalidationHandle();
  swift_allocObject();
  v5[2] = InvalidationHandle.init(dsoHandle:file:line:column:function:name:)();
  uint64_t v15 = (char *)v5 + qword_100070370;
  *((void *)v15 + 4) = 0;
  *(_OWORD *)uint64_t v15 = 0u;
  *((_OWORD *)v15 + sub_10002675C(2, 1) = 0u;
  *((unsigned char *)v5 + qword_100070378) = 0;
  uint64_t v16 = (char *)v5 + qword_100070348;
  uint64_t v17 = type metadata accessor for PreviewAgentConnector();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(void (**)(char *, uint64_t))(v18 + 16);
  uint64_t v42 = a1;
  uint64_t v39 = v17;
  v19(v16, a1);
  *(void *)((char *)v5 + qword_100070350) = a2;
  uint64_t v20 = (void *)((char *)v5 + qword_100070358);
  *uint64_t v20 = a3;
  v20[1] = a4;
  id v21 = objc_allocWithZone((Class)type metadata accessor for RemoteContentViewController());
  swift_retain_n();
  swift_unknownObjectRetain_n();
  uint64_t v40 = a3;
  uint64_t v22 = v37;
  uint64_t v23 = sub_100015930(a2, a3, a4);
  if (v22)
  {
    swift_unknownObjectRelease();
    swift_release();
    uint64_t v24 = type metadata accessor for EntryPointCategory();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v24 - 8) + 8))(v41, v24);
    id v25 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    uint64_t v26 = v39;
    v25(v42, v39);
    swift_release();
    v25((uint64_t)v16, v26);
    swift_release();
    swift_unknownObjectRelease();
    sub_10000FD9C((uint64_t)v5 + qword_100070370, &qword_100070498);
    swift_deallocPartialClassInstance();
  }
  else
  {
    *(void *)((char *)v5 + qword_100070360) = v23;
    uint64_t v27 = (char *)v5 + qword_100070368;
    uint64_t v28 = type metadata accessor for EntryPointCategory();
    uint64_t v29 = *(void *)(v28 - 8);
    uint64_t v30 = v41;
    (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v27, v41, v28);
    v43[6] = a2;
    void v43[3] = v38;
    v43[4] = swift_getWitnessTable();
    v43[0] = v7;
    type metadata accessor for PreviewSceneAgentProxy();
    sub_100038C58(&qword_100070510, (void (*)(uint64_t))&type metadata accessor for PreviewSceneAgentProxy);
    swift_retain();
    ConcurrentInvalidatable.trackInvalidation(of:)();
    sub_10000FCE4((uint64_t)v43);
    uint64_t v31 = type metadata accessor for TaskPriority();
    uint64_t v32 = (uint64_t)v36;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v36, 1, 1, v31);
    type metadata accessor for MainActor();
    swift_retain();
    swift_retain();
    uint64_t v33 = static MainActor.shared.getter();
    id v34 = (void *)swift_allocObject();
    v34[2] = v33;
    v34[3] = &protocol witness table for MainActor;
    v34[4] = a2;
    v34[5] = v7;
    sub_10002FFFC(v32, (uint64_t)&unk_100070520, (uint64_t)v34);
    swift_release();
    swift_unknownObjectRelease();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v30, v28);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v42, v39);
  }
  return v7;
}

uint64_t sub_100031210(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  v5[5] = a5;
  v5[6] = *a5;
  v5[7] = type metadata accessor for MainActor();
  v5[8] = static MainActor.shared.getter();
  v5[2] = a4;
  uint64_t v7 = (void *)swift_task_alloc();
  v5[9] = v7;
  uint64_t v8 = type metadata accessor for PreviewSceneAgentProxy();
  uint64_t v9 = sub_100038C58(&qword_100070510, (void (*)(uint64_t))&type metadata accessor for PreviewSceneAgentProxy);
  *uint64_t v7 = v5;
  v7[1] = sub_100031344;
  return ConcurrentInvalidatable.invalidation.getter(v8, v9);
}

uint64_t sub_100031344()
{
  swift_task_dealloc();
  uint64_t v1 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100031480, v1, v0);
}

uint64_t sub_100031480()
{
  uint64_t v1 = v0[5];
  swift_release();
  v0[3] = v1;
  swift_getWitnessTable();
  if ((Invalidatable.isInvalidated.getter() & 1) == 0) {
    sub_100031574();
  }
  v0[4] = v0[5];
  Invalidatable.invalidate(dsoHandle:file:line:column:function:)();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

void sub_100031574()
{
  if (!*(unsigned char *)(v0 + qword_100070378))
  {
    *(unsigned char *)(v0 + qword_100070378) = 3;
    sub_100017180();
    uint64_t v1 = v0 + qword_100070370;
    swift_beginAccess();
    if (*(void *)(v1 + 24))
    {
      sub_10000FC80(v1, (uint64_t)v2);
      sub_10000FC3C(v2, v2[3]);
      PreviewAgentConnector.pid.getter();
      dispatch thunk of ProviderUpdateDelegate.notePreviewCrashed(pid:)();
      sub_10000FCE4((uint64_t)v2);
    }
  }
}

uint64_t sub_100031644()
{
  uint64_t v1 = qword_100070378;
  if (*(unsigned char *)(v0 + qword_100070378))
  {
    sub_10000758C(&qword_10006F000);
    return static Future<A>.succeeded(dsoHandle:file:line:column:function:)();
  }
  else
  {
    uint64_t v3 = v0;
    sub_100016AE8();
    uint64_t v4 = v0 + qword_100070370;
    swift_beginAccess();
    if (*(void *)(v4 + 24))
    {
      sub_10000FC80(v4, (uint64_t)v5);
      sub_10000FC3C(v5, v5[3]);
      dispatch thunk of ProviderUpdateDelegate.notePreviewStopped()();
      sub_10000FCE4((uint64_t)v5);
    }
    *(unsigned char *)(v3 + vsub_10002675C(2, 1) = 2;
    sub_100014E08();
    return static CATransaction.afterSynchronize()();
  }
}

uint64_t sub_100031754()
{
  uint64_t v1 = qword_100070378;
  if (*(unsigned char *)(v0 + qword_100070378))
  {
    sub_10000758C(&qword_10006F000);
    return static Future<A>.succeeded(dsoHandle:file:line:column:function:)();
  }
  else
  {
    sub_100016A3C();
    *(unsigned char *)(v0 + vsub_10002675C(2, 1) = 1;
    sub_100014E08();
    return static CATransaction.afterSynchronize()();
  }
}

uint64_t sub_100031808(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v53 = a5;
  uint64_t v60 = a4;
  uint64_t v67 = a2;
  uint64_t v68 = a3;
  uint64_t v72 = a1;
  uint64_t v7 = *v5;
  uint64_t updated = type metadata accessor for SceneUpdateContext();
  uint64_t v71 = *(void *)(updated - 8);
  uint64_t v62 = *(void *)(v71 + 64);
  __chkstk_darwin(updated);
  uint64_t v76 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = v7;
  uint64_t v9 = *(void *)(v7 + 104);
  uint64_t v10 = *(void *)(v7 + 88);
  uint64_t v11 = v5;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v70 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v61 = *(void *)(v70 + 64);
  __chkstk_darwin(AssociatedTypeWitness);
  uint64_t v73 = (char *)&v51 - v12;
  uint64_t v13 = sub_10000758C(&qword_10006FB38);
  __chkstk_darwin(v13 - 8);
  uint64_t v75 = (uint64_t)&v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = type metadata accessor for AgentUpdate.Context();
  uint64_t v69 = *(void *)(v65 - 8);
  uint64_t v59 = *(void *)(v69 + 64);
  __chkstk_darwin(v65);
  uint64_t v64 = (char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for PropertyList();
  __chkstk_darwin(v16 - 8);
  uint64_t v17 = type metadata accessor for EntryPointCategory();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v51 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = type metadata accessor for AgentUpdate();
  uint64_t v57 = *(void *)(v58 - 8);
  __chkstk_darwin(v58);
  uint64_t v22 = (char *)&v51 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000FC80(a5, (uint64_t)&v77);
  uint64_t v23 = (uint64_t)v11 + qword_100070370;
  swift_beginAccess();
  sub_10003746C((uint64_t)&v77, v23);
  swift_endAccess();
  uint64_t v54 = v11;
  uint64_t v56 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)v11 + qword_100070350);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, (uint64_t)v11 + qword_100070368, v17);
  uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 48);
  uint64_t v55 = v9;
  v24(v72, v67, v10, v9);
  id v52 = *(void (**)(char *, uint64_t, uint64_t))(v69 + 16);
  uint64_t v26 = v64;
  uint64_t v25 = v65;
  v52(v64, v68, v65);
  AgentUpdate.init(entryPointCategory:entryPointPayload:entryPointFrameworkPath:context:)();
  uint64_t v66 = v10;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v27 = v60;
  uint64_t v28 = v53;
  uint64_t v67 = PreviewSceneAgentProxy.perform<A>(update:with:delegate:expecting:)();
  (*(void (**)(char *, uint64_t))(v57 + 8))(v22, v58);
  uint64_t v57 = type metadata accessor for TaskPriority();
  uint64_t v29 = *(void *)(v57 - 8);
  uint64_t v56 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 56);
  uint64_t v58 = v29 + 56;
  v56(v75, 1, 1, v57);
  v52(v26, v68, v25);
  uint64_t v30 = v70;
  (*(void (**)(char *, uint64_t, uint64_t))(v70 + 16))(v73, v72, AssociatedTypeWitness);
  uint64_t v31 = v71;
  (*(void (**)(char *, uint64_t, uint64_t))(v71 + 16))(v76, v27, updated);
  sub_10000FC80(v28, (uint64_t)&v77);
  type metadata accessor for MainActor();
  swift_retain();
  uint64_t v32 = v54;
  swift_retain();
  uint64_t v33 = static MainActor.shared.getter();
  uint64_t v34 = v69;
  unint64_t v35 = (*(unsigned __int8 *)(v69 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80);
  unint64_t v36 = (v59 + v35 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v37 = (*(unsigned __int8 *)(v30 + 80) + v36 + 8) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  unint64_t v38 = (v61 + *(unsigned __int8 *)(v31 + 80) + v37) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
  unint64_t v39 = (v62 + v38 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v40 = (char *)swift_allocObject();
  uint64_t v41 = v63;
  *((void *)v40 + 2) = v33;
  *((void *)v40 + 3) = &protocol witness table for MainActor;
  uint64_t v72 = *(void *)(v41 + 80);
  *((void *)v40 + 4) = v72;
  uint64_t v42 = v65;
  *((void *)v40 + 5) = v66;
  uint64_t v68 = *(void *)(v41 + 96);
  uint64_t v43 = v32;
  uint64_t v44 = v55;
  *((void *)v40 + 6) = v68;
  *((void *)v40 + 7) = v44;
  *((void *)v40 + 8) = v67;
  (*(void (**)(char *, char *, uint64_t))(v34 + 32))(&v40[v35], v64, v42);
  *(void *)&v40[v36] = v43;
  (*(void (**)(char *, char *, uint64_t))(v70 + 32))(&v40[v37], v73, AssociatedTypeWitness);
  (*(void (**)(char *, char *, uint64_t))(v71 + 32))(&v40[v38], v76, updated);
  sub_10000E710(&v77, (uint64_t)&v40[v39]);
  type metadata accessor for RenderPayload();
  uint64_t v45 = v66;
  swift_getAssociatedTypeWitness();
  type metadata accessor for CanvasUpdateResult();
  uint64_t v46 = v75;
  uint64_t v47 = sub_1000338B4(v75, (uint64_t)&unk_1000704A8, (uint64_t)v40);
  type metadata accessor for Future();
  v56(v46, 1, 1, v57);
  uint64_t v48 = (void *)swift_allocObject();
  v48[2] = v72;
  v48[3] = v45;
  v48[4] = v68;
  v48[5] = v44;
  v48[6] = v47;
  swift_retain();
  uint64_t v49 = Future<A>.init(dsoHandle:file:line:column:function:priority:operation:)();
  swift_release();
  swift_release();
  return v49;
}

uint64_t sub_100032124(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8)
{
  v8[11] = a8;
  v8[12] = v24;
  v8[9] = a6;
  v8[10] = a7;
  v8[7] = a1;
  v8[8] = a5;
  uint64_t v10 = *a6;
  v8[13] = *a6;
  uint64_t v11 = type metadata accessor for ChromeType();
  v8[14] = v11;
  v8[15] = *(void *)(v11 - 8);
  v8[16] = swift_task_alloc();
  uint64_t updated = type metadata accessor for SceneUpdateContext();
  v8[17] = updated;
  uint64_t v13 = *(void *)(updated - 8);
  v8[18] = v13;
  v8[19] = *(void *)(v13 + 64);
  v8[20] = swift_task_alloc();
  v8[21] = *(void *)(v10 + 104);
  v8[22] = *(void *)(v10 + 88);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8[23] = AssociatedTypeWitness;
  uint64_t v15 = *(void *)(AssociatedTypeWitness - 8);
  v8[24] = v15;
  v8[25] = *(void *)(v15 + 64);
  v8[26] = swift_task_alloc();
  v8[27] = swift_task_alloc();
  uint64_t v16 = swift_getAssociatedTypeWitness();
  v8[28] = v16;
  v8[29] = *(void *)(v16 - 8);
  v8[30] = swift_task_alloc();
  v8[31] = swift_task_alloc();
  uint64_t v17 = type metadata accessor for CanvasControlConfiguration();
  v8[32] = v17;
  v8[33] = *(void *)(v17 - 8);
  v8[34] = swift_task_alloc();
  v8[35] = swift_task_alloc();
  sub_10000758C(&qword_10006FB60);
  v8[36] = swift_task_alloc();
  uint64_t v18 = swift_getAssociatedTypeWitness();
  v8[37] = v18;
  v8[38] = *(void *)(v18 - 8);
  uint64_t v19 = swift_task_alloc();
  v8[39] = v19;
  v8[40] = type metadata accessor for MainActor();
  v8[41] = static MainActor.shared.getter();
  uint64_t v20 = (void *)swift_task_alloc();
  v8[42] = v20;
  uint64_t v21 = sub_10000758C(&qword_10006EFF0);
  *uint64_t v20 = v8;
  v20[1] = sub_100032570;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, void *))Task.value.getter)(v19, a4, v18, v21, &protocol self-conformance witness table for Error);
}

uint64_t sub_100032570()
{
  *(void *)(*(void *)v1 + 344) = v0;
  swift_task_dealloc();
  uint64_t v3 = dispatch thunk of Actor.unownedExecutor.getter();
  if (v0) {
    uint64_t v4 = sub_100032C9C;
  }
  else {
    uint64_t v4 = sub_1000326CC;
  }
  return _swift_task_switch(v4, v3, v2);
}

uint64_t sub_1000326CC()
{
  uint64_t v57 = *(void *)(v0 + 312);
  uint64_t v1 = *(void *)(v0 + 288);
  uint64_t v48 = *(void *)(v0 + 304);
  uint64_t v49 = *(void *)(v0 + 296);
  uint64_t v55 = *(void *)(v0 + 280);
  uint64_t v44 = *(void *)(v0 + 272);
  uint64_t v56 = *(void *)(v0 + 264);
  uint64_t v45 = *(void *)(v0 + 256);
  uint64_t v39 = *(void *)(v0 + 248);
  uint64_t v47 = *(void *)(v0 + 240);
  uint64_t v43 = *(void *)(v0 + 232);
  uint64_t v2 = *(void *)(v0 + 216);
  uint64_t v46 = *(void *)(v0 + 224);
  uint64_t v51 = *(void *)(v0 + 208);
  uint64_t v3 = *(void *)(v0 + 192);
  uint64_t v32 = *(void *)(v0 + 200);
  uint64_t v4 = *(void *)(v0 + 184);
  uint64_t v59 = *(void *)(v0 + 176);
  uint64_t v52 = *(void *)(v0 + 168);
  uint64_t v54 = *(void *)(v0 + 160);
  uint64_t v36 = *(void *)(v0 + 152);
  uint64_t v50 = *(void *)(v0 + 144);
  uint64_t v53 = *(void *)(v0 + 136);
  uint64_t v40 = *(void *)(v0 + 120);
  uint64_t v41 = *(void *)(v0 + 128);
  uint64_t v42 = *(void *)(v0 + 112);
  uint64_t v31 = *(void *)(v0 + 104);
  uint64_t v5 = *(void *)(v0 + 80);
  uint64_t v34 = *(void *)(v0 + 88);
  uint64_t v35 = *(void *)(v0 + 96);
  uint64_t v26 = v5;
  uint64_t v7 = *(void *)(v0 + 64);
  uint64_t v6 = *(void *)(v0 + 72);
  swift_release();
  uint64_t v8 = type metadata accessor for AgentUpdate.Context();
  uint64_t v58 = swift_allocBox();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v9, v7, v8);
  uint64_t updated = type metadata accessor for UpdateSetupPayload();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(updated - 8) + 56))(v1, 1, 1, updated);
  AgentUpdate.Context.setupPayload.setter();
  uint64_t v38 = v6 + qword_100070348;
  uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  uint64_t v11 = v2;
  uint64_t v12 = v2;
  uint64_t v13 = v4;
  v25(v12, v5, v4);
  uint64_t v14 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v15 = (v14 + 56) & ~v14;
  uint64_t v28 = v32 + 7;
  unint64_t v16 = (v15 + v32 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = (char *)swift_allocObject();
  uint64_t v30 = *(void *)(v31 + 80);
  *((void *)v17 + 2) = v30;
  *((void *)v17 + 3) = v59;
  uint64_t v29 = *(void *)(v31 + 96);
  *((void *)v17 + 4) = v29;
  *((void *)v17 + 5) = v52;
  *((void *)v17 + 6) = v6;
  uint64_t v33 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 32);
  uint64_t v27 = v13;
  v33(&v17[v15], v11, v13);
  *(void *)&v17[v16] = v58;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 16))(v54, v34, v53);
  v25(v51, v26, v13);
  sub_10000FC80(v35, v0 + 16);
  unint64_t v18 = (*(unsigned __int8 *)(v50 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80);
  unint64_t v19 = (v36 + v18 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v20 = (v14 + v19 + 8) & ~v14;
  unint64_t v37 = (v20 + v28) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v21 = (char *)swift_allocObject();
  *((void *)v21 + 2) = v30;
  *((void *)v21 + 3) = v59;
  *((void *)v21 + 4) = v29;
  *((void *)v21 + 5) = v52;
  (*(void (**)(char *, uint64_t, uint64_t))(v50 + 32))(&v21[v18], v54, v53);
  *(void *)&v21[v19] = v6;
  v33(&v21[v20], v51, v27);
  *(void *)&v21[v37] = v58;
  sub_10000E710((long long *)(v0 + 16), (uint64_t)&v21[(v37 + 15) & 0xFFFFFFFFFFFFFFF8]);
  uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>), char *, uint64_t (*)(uint64_t), char *, uint64_t, uint64_t))(v52 + 56);
  swift_retain_n();
  swift_retain_n();
  v22(v55, v39, v38, v57, sub_100037B40, v17, sub_100037DB8, v21, v59, v52);
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, void, uint64_t))(v40 + 104))(v41, enum case for ChromeType.unspecified(_:), v42);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 16))(v44, v55, v45);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v43 + 16))(v47, v39, v46);
  type metadata accessor for RenderPayload();
  swift_retain();
  CanvasUpdateResult.init<>(staticChromeType:makeStaticOutput:controlConfiguration:controlStates:)();
  (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v39, v46);
  (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v55, v45);
  (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v57, v49);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v23 = *(uint64_t (**)(void))(v0 + 8);
  return v23();
}

uint64_t sub_100032C9C()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100032D90@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v26 = a3;
  uint64_t v24 = a1;
  uint64_t v29 = a4;
  uint64_t v5 = *a2;
  uint64_t v6 = type metadata accessor for AgentUpdate.Context();
  uint64_t v27 = *(void *)(v6 - 8);
  uint64_t v28 = v6;
  __chkstk_darwin(v6);
  uint64_t v25 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = *(void *)(v5 + 104);
  uint64_t v8 = *(void *)(v5 + 88);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v23 = type metadata accessor for Optional();
  uint64_t v10 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v12 = (char *)&v21 - v11;
  uint64_t v13 = type metadata accessor for PropertyList();
  __chkstk_darwin(v13 - 8);
  uint64_t v14 = type metadata accessor for EntryPointCategory();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = swift_projectBox();
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, (uint64_t)a2 + qword_100070368, v14);
  uint64_t v19 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v12, v24, AssociatedTypeWitness);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v12, 0, 1, AssociatedTypeWitness);
  (*(void (**)(uint64_t, char *, uint64_t))(v22 + 48))(v26, v12, v8);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v23);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v25, v18, v28);
  return AgentUpdate.init(entryPointCategory:entryPointPayload:entryPointFrameworkPath:context:)();
}

uint64_t sub_100033114(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v38 = a2;
  uint64_t v39 = a6;
  uint64_t v42 = a4;
  uint64_t v34 = a1;
  uint64_t v6 = *a3;
  uint64_t v43 = type metadata accessor for AgentUpdate.Context();
  uint64_t v32 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  uint64_t v33 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = v6;
  uint64_t v36 = *(void *)(v6 + 104);
  uint64_t v35 = *(void *)(v6 + 88);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = type metadata accessor for Optional();
  uint64_t v40 = *(void *)(v9 - 8);
  uint64_t v41 = v9;
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v31 - v10;
  uint64_t updated = type metadata accessor for SceneUpdateTiming();
  uint64_t v13 = *(void *)(updated - 8);
  __chkstk_darwin(updated);
  uint64_t v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for SceneUpdateContext();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = swift_projectBox();
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 16);
  uint64_t v22 = v38;
  uint64_t v38 = v16;
  v21(v19, v22, v16);
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, enum case for SceneUpdateTiming.fenced(_:), updated);
  uint64_t v23 = v32;
  SceneUpdateContext.timing.setter();
  uint64_t v24 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v11, v34, AssociatedTypeWitness);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v11, 0, 1, AssociatedTypeWitness);
  swift_beginAccess();
  uint64_t v25 = (uint64_t)v33;
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v33, v20, v43);
  sub_10000FC80(v39, (uint64_t)v44);
  uint64_t v27 = *(void *)(v37 + 96);
  uint64_t v28 = v35;
  v45[0] = *(void *)(v37 + 80);
  uint64_t v26 = v45[0];
  v45[1] = v35;
  uint64_t v29 = v36;
  v45[2] = v27;
  uint64_t v46 = v36;
  uint64_t v46 = type metadata accessor for RemoteContentProvider.ControlInteractionUpdateDelegate(0, (uint64_t)v45);
  uint64_t WitnessTable = swift_getWitnessTable();
  v45[0] = swift_allocObject();
  sub_100033600(v44, v26, v28, v27, v29, v45[0] + 16);
  sub_100031808(v42, (uint64_t)v11, v25, (uint64_t)v19, (uint64_t)v45);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v25, v43);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v11, v41);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v38);
  return sub_10000FCE4((uint64_t)v45);
}

uint64_t sub_100033600@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  sub_10000FC80((uint64_t)a1, (uint64_t)v15);
  sub_10000758C(&qword_1000704E8);
  *(void *)&long long v16 = a2;
  *((void *)&v16 + sub_10002675C(2, 1) = a3;
  *(void *)&long long v17 = a4;
  *((void *)&v17 + sub_10002675C(2, 1) = a5;
  uint64_t updated = type metadata accessor for RemoteContentProvider.ControlInteractionUpdateDelegate(0, (uint64_t)&v16);
  if (swift_dynamicCast())
  {
    sub_10000FC80((uint64_t)v19, (uint64_t)&v16);
    (*(void (**)(long long *, uint64_t))(*(void *)(updated - 8) + 8))(v19, updated);
  }
  else
  {
    uint64_t v20 = 0;
    memset(v19, 0, sizeof(v19));
    uint64_t v13 = type metadata accessor for Optional();
    (*(void (**)(long long *, uint64_t))(*(void *)(v13 - 8) + 8))(v19, v13);
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v18 = 0;
  }
  sub_10000E710(a1, (uint64_t)v15);
  if (*((void *)&v17 + 1))
  {
    sub_10000FCE4((uint64_t)v15);
    sub_10000E710(&v16, (uint64_t)v19);
  }
  else
  {
    sub_10000E710(v15, (uint64_t)v19);
    sub_10000FD9C((uint64_t)&v16, &qword_100070498);
  }
  return sub_10000E710(v19, a6);
}

uint64_t sub_100033788()
{
  uint64_t v0 = sub_10000758C(&qword_10006FB38);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000758C(&qword_1000704C0);
  uint64_t v3 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  swift_retain();
  return Future<A>.init(dsoHandle:file:line:column:function:priority:operation:)();
}

uint64_t sub_1000338B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for TaskPriority();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_10000FD9C(a1, &qword_10006FB38);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_100033A38(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  type metadata accessor for RenderPayload();
  swift_getAssociatedTypeWitness();
  uint64_t updated = type metadata accessor for CanvasUpdateResult();
  uint64_t v7 = sub_10000758C(&qword_10006EFF0);
  *uint64_t v5 = v2;
  v5[1] = sub_100020810;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, void *))Task.value.getter)(a1, a2, updated, v7, &protocol self-conformance witness table for Error);
}

uint64_t sub_100033B5C()
{
  uint64_t v1 = type metadata accessor for PreviewPreferences();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = SceneUpdateHandshake.fenceHandle.getter();
  if (result)
  {
    uint64_t v6 = (void *)result;
    sub_10000FC3C(v0, v0[3]);
    SceneUpdateHandshake.preferences.getter();
    dispatch thunk of CanvasUpdateDelegate.adjust(preferences:fenceHandle:)();

    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return result;
}

uint64_t sub_100033C70()
{
  sub_10000FC3C(v0, v0[3]);
  return dispatch thunk of CanvasUpdateDelegate.adjust(preferences:fenceHandle:)();
}

uint64_t sub_100033CCC(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = v2[3];
  uint64_t v5 = v2[4];
  sub_10000FC3C(v2, v4);
  return a2(v4, v5);
}

uint64_t sub_100033D18()
{
  sub_10000FC3C(v0, v0[3]);
  return dispatch thunk of CanvasUpdateDelegate.notePreviewSuppressed(presentation:)();
}

uint64_t sub_100033D64()
{
  sub_10000FC3C(v0, v0[3]);
  return dispatch thunk of ProviderUpdateDelegate.notePreviewStopped()();
}

uint64_t sub_100033DA0()
{
  sub_10000FC3C(v0, v0[3]);
  return dispatch thunk of ProviderUpdateDelegate.notePreviewCrashed(pid:)();
}

uint64_t sub_100033DF4(uint64_t a1)
{
  return sub_100033CCC(a1, (uint64_t (*)(uint64_t, uint64_t))&dispatch thunk of CanvasUpdateDelegate.notePreviewRequestedKeyStatus());
}

uint64_t sub_100033E20(uint64_t a1)
{
  return sub_100033CCC(a1, (uint64_t (*)(uint64_t, uint64_t))&dispatch thunk of CanvasUpdateDelegate.notePreviewRequestedZoom());
}

uint64_t sub_100033E58()
{
  if (*((unsigned __int8 *)v0 + qword_100070378) - 2 >= 2)
  {
    if (*((unsigned char *)v0 + qword_100070378))
    {
      uint64_t v2 = *v0;
      sub_10000758C(&qword_10006F000);
      long long v3 = *(_OWORD *)(v2 + 96);
      v5[0] = *(_OWORD *)(v2 + 80);
      v5[1] = v3;
      type metadata accessor for RemoteContentProvider.CannotResizeWhileRelaunching(0, (uint64_t)v5);
      swift_getWitnessTable();
      swift_allocError();
      uint64_t v4 = static Future.failed(dsoHandle:file:line:column:function:_:)();
      swift_errorRelease();
      return v4;
    }
    else
    {
      return PreviewSceneAgentProxy.sendCommitPostSynchronize()();
    }
  }
  else
  {
    sub_10000758C(&qword_10006F000);
    return static Future<A>.succeeded(dsoHandle:file:line:column:function:)();
  }
}

uint64_t sub_100033FC8()
{
  uint64_t v1 = sub_10000758C(&qword_10006FB38);
  __chkstk_darwin(v1 - 8);
  long long v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *(void *)(v0 + qword_100070350);
  uint64_t v5 = (void *)PreviewSceneAgentProxy.scene.getter();
  id v6 = [v5 scene];

  sub_10003C258(1, v6);
  uint64_t v7 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v3, 1, 1, v7);
  type metadata accessor for MainActor();
  swift_retain();
  uint64_t v8 = static MainActor.shared.getter();
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = v8;
  v9[3] = &protocol witness table for MainActor;
  v9[4] = v4;
  sub_10002FFFC((uint64_t)v3, (uint64_t)&unk_1000704F8, (uint64_t)v9);
  return swift_release();
}

void sub_100034120()
{
  uint64_t v0 = (void *)PreviewSceneAgentProxy.scene.getter();
  id v1 = [v0 scene];

  sub_10003C258(0, v1);
}

uint64_t sub_100034194(uint64_t a1)
{
  long long v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *long long v3 = v1;
  v3[1] = sub_1000237E8;
  return sub_100034230(a1);
}

uint64_t sub_100034230(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = type metadata accessor for GeometryPayload();
  void v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for PreviewSnapshot();
  v2[7] = v4;
  v2[8] = *(void *)(v4 - 8);
  v2[9] = swift_task_alloc();
  type metadata accessor for MainActor();
  v2[10] = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  v2[11] = v6;
  v2[12] = v5;
  return _swift_task_switch(sub_100034380, v6, v5);
}

uint64_t sub_100034380()
{
  uint64_t v1 = (void *)(v0[3] + qword_100070358);
  v0[13] = *v1;
  v0[14] = v1[1];
  v0[15] = swift_getObjectType();
  v0[16] = dispatch thunk of PreviewShellScene.takeSnapshot()();
  sub_100038C58(&qword_1000704E0, (void (*)(uint64_t))&type metadata accessor for GeometryPayload);
  uint64_t v2 = PreviewSceneAgentProxy.generateStaticOutput<A>(for:expecting:)();
  v0[17] = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[18] = v3;
  uint64_t v4 = sub_10000758C(&qword_10006EFF0);
  *uint64_t v3 = v0;
  v3[1] = sub_100034540;
  uint64_t v5 = v0[6];
  uint64_t v6 = v0[4];
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, void *))Task.value.getter)(v5, v2, v6, v4, &protocol self-conformance witness table for Error);
}

uint64_t sub_100034540()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 152) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 96);
  uint64_t v4 = *(void *)(v2 + 88);
  if (v0) {
    uint64_t v5 = sub_100034810;
  }
  else {
    uint64_t v5 = sub_10003467C;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_10003467C()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[8];
  uint64_t v12 = v0[7];
  uint64_t v4 = v0[5];
  uint64_t v3 = v0[6];
  uint64_t v5 = v0[4];
  uint64_t v11 = (void *)v0[16];
  swift_release();
  GeometryPayload.selectableRegions.getter();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  uint64_t v6 = (void *)dispatch thunk of PreviewShellScene.windowScene.getter();
  id v7 = [v6 screen];

  [v7 scale];
  id v8 = v11;
  PreviewSnapshot.init(image:selectableRegions:cornerRadius:scaleFactor:)();
  PreviewSnapshot.makeRenderPayload()();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v12);

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_100034810()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unint64_t sub_10003489C()
{
  return 0xD000000000000023;
}

uint64_t sub_1000348B8()
{
  return 0;
}

uint64_t sub_1000348C0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return HumanReadableError.errorDescription.getter(a1, WitnessTable);
}

uint64_t sub_100034914(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return HumanReadableError.description.getter(a1, WitnessTable);
}

uint64_t sub_100034968()
{
  swift_release();
  uint64_t v1 = v0 + qword_100070348;
  uint64_t v2 = type metadata accessor for PreviewAgentConnector();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_unknownObjectRelease();

  uint64_t v3 = v0 + qword_100070368;
  uint64_t v4 = type metadata accessor for EntryPointCategory();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_10000FD9C(v0 + qword_100070370, &qword_100070498);
  return v0;
}

uint64_t sub_100034A60()
{
  sub_100034968();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t type metadata accessor for RemoteContentProvider(uint64_t a1, uint64_t a2)
{
  return _swift_getGenericMetadata(a1, a2, &nominal type descriptor for RemoteContentProvider);
}

uint64_t sub_100034AD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 32);
}

uint64_t sub_100034AD8(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *sub_100034B68(unsigned char *result, unsigned int a2, unsigned int a3)
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
        *(_WORD *)(result + sub_10002675C(2, 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x100034C34);
      case 4:
        *(_DWORD *)(result + sub_10002675C(2, 1) = v6;
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
        *(_WORD *)(result + sub_10002675C(2, 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + sub_10002675C(2, 1) = 0;
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

uint64_t type metadata accessor for RemoteContentProvider.ProcessState(uint64_t a1, uint64_t a2)
{
  return _swift_getGenericMetadata(a1, a2, &nominal type descriptor for RemoteContentProvider.ProcessState);
}

uint64_t sub_100034C74()
{
  return swift_getWitnessTable();
}

uint64_t sub_100034C90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static CanvasContentProvider<>.encode(hostedOutput:)(v3, a3);
}

uint64_t sub_100034C9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_100031808(a1, a2, a3, a4, a5);
}

uint64_t sub_100034CC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a1;
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_100034D80;
  return sub_1000302AC(a2, a3, a4, a5);
}

uint64_t sub_100034D80(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (!v1) {
    **(void **)(v4 + 16) = a1;
  }
  unsigned int v6 = *(uint64_t (**)(void))(v5 + 8);
  return v6();
}

uint64_t sub_100034E98()
{
  return static ContentProvider<>.decode(updatePayload:)();
}

uint64_t sub_100034F40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100038C58(&qword_1000704F0, (void (*)(uint64_t))&type metadata accessor for RenderPayload);

  return static ContentProvider<>.encode(staticOutput:)(a1, v3, a3, v6);
}

id sub_100034FC8()
{
  uint64_t v0 = (void *)sub_1000381C8();

  return v0;
}

uint64_t sub_100035000()
{
  return sub_100031644();
}

uint64_t sub_100035024()
{
  return sub_100031754();
}

uint64_t sub_100035048()
{
  return sub_100033E58();
}

uint64_t sub_10003506C()
{
  return sub_100033FC8();
}

void sub_100035090()
{
}

uint64_t sub_1000350B4()
{
  return swift_getWitnessTable();
}

uint64_t sub_1000350D0()
{
  return swift_getWitnessTable();
}

uint64_t sub_1000350EC()
{
  return swift_getWitnessTable();
}

uint64_t sub_100035108@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v21 = a1;
  uint64_t v22 = a2;
  uint64_t v23 = a3;
  uint64_t v3 = sub_10000758C(&qword_100070738);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000758C(&qword_1000706B8);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for PreviewPayload();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for RefinedPreviewPayload();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  long long v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v21, v10);
  sub_100038BF0(v22, (uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    uint64_t v18 = type metadata accessor for GridIndex();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v9, 1, 1, v18);
  }
  else
  {
    sub_1000389B4((uint64_t)v5, (uint64_t)v9);
  }
  RefinedPreviewPayload.init(previewPayload:requestedGroupIndex:)();
  sub_100038C58(&qword_100070740, (void (*)(uint64_t))&type metadata accessor for RefinedPreviewPayload);
  PropertyListRepresentable.propertyList.getter();
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

uint64_t sub_100035414(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v37 = a7;
  uint64_t v38 = a8;
  uint64_t v36 = a6;
  uint64_t v39 = a1;
  uint64_t v40 = a2;
  uint64_t v11 = type metadata accessor for PreviewStructure();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10000758C(&qword_1000706B8);
  __chkstk_darwin(v15);
  long long v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_10000758C(&qword_1000706C0);
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v35 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = a4;
  uint64_t v42 = a3;
  uint64_t v43 = a5;
  uint64_t v44 = v36;
  uint64_t v45 = v37;
  uint64_t v46 = v38;
  uint64_t v23 = v22;
  CanvasControlConfiguration.init(build:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v19 + 16))(v39, v21, v23);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a4, v11);
  int v24 = (*(uint64_t (**)(char *, uint64_t))(v12 + 88))(v14, v11);
  if (v24 == enum case for PreviewStructure.previewGroup(_:))
  {
    (*(void (**)(char *, uint64_t))(v12 + 96))(v14, v11);
    uint64_t v25 = &v14[*(int *)(sub_10000758C(&qword_1000706C8) + 48)];
    uint64_t v26 = type metadata accessor for GridIndex();
    uint64_t v27 = *(void *)(v26 - 8);
    (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v17, v25, v26);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v17, 0, 1, v26);
    uint64_t v28 = type metadata accessor for PreviewGroupMetadata();
    (*(void (**)(char *, uint64_t))(*(void *)(v28 - 8) + 8))(v14, v28);
  }
  else
  {
    int v29 = v24;
    int v30 = enum case for PreviewStructure.singlePreview(_:);
    int v31 = enum case for PreviewStructure.emptyPreviewGroup(_:);
    uint64_t v32 = type metadata accessor for GridIndex();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v17, 1, 1, v32);
    if (v29 != v30 && v29 != v31) {
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    }
  }
  sub_1000389B4((uint64_t)v17, v40);
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v21, v23);
}

uint64_t sub_1000357E8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v59 = a5;
  uint64_t v57 = a4;
  uint64_t v50 = a2;
  uint64_t v51 = a3;
  uint64_t v53 = a1;
  uint64_t v63 = a6;
  uint64_t v6 = sub_10000758C(&qword_1000706D0);
  __chkstk_darwin(v6 - 8);
  uint64_t v49 = (char *)v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000758C(&qword_1000706D8);
  __chkstk_darwin(v8 - 8);
  uint64_t v52 = (char *)v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for CanvasGridControl();
  uint64_t v55 = *(void *)(v10 - 8);
  uint64_t v56 = v10;
  __chkstk_darwin(v10);
  uint64_t v54 = (char *)v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000758C(&qword_1000706E0);
  uint64_t v61 = *(void *)(v12 - 8);
  uint64_t v62 = v12;
  __chkstk_darwin(v12);
  uint64_t v58 = (char *)v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10000758C(&qword_1000706E8);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_10000758C(&qword_1000706F0);
  __chkstk_darwin(v17 - 8);
  uint64_t v19 = (char *)v47 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for CanvasControlDescription.ControlType.GridConfiguration();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = __chkstk_darwin(v20);
  int v24 = (char *)v47 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  uint64_t v26 = (char *)v47 - v25;
  uint64_t v27 = sub_10000758C(&qword_1000706F8);
  uint64_t v60 = *(void *)(v27 - 8);
  uint64_t v28 = __chkstk_darwin(v27);
  int v30 = (char *)v47 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v28);
  uint64_t v32 = (char *)v47 - v31;
  sub_100035F98((uint64_t)v19);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20) == 1)
  {
    sub_10000FD9C((uint64_t)v19, &qword_1000706F0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v61 + 56))(v16, 1, 1, v62);
    type metadata accessor for GridIndex();
    sub_100038C58(&qword_100070700, (void (*)(uint64_t))&type metadata accessor for GridIndex);
    static CanvasControlConfigurationBuilder.buildOptional<A>(_:)();
    sub_10000FD9C((uint64_t)v16, &qword_1000706E8);
  }
  else
  {
    uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v21 + 32);
    uint64_t v48 = v26;
    v33(v26, v19, v20);
    (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v24, v26, v20);
    uint64_t v34 = type metadata accessor for ThumbnailGeometry();
    uint64_t v35 = (uint64_t)v49;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v49, 1, 1, v34);
    uint64_t v36 = swift_allocObject();
    uint64_t v37 = v51;
    *(void *)(v36 + 16) = v50;
    *(void *)(v36 + 24) = v37;
    uint64_t v38 = type metadata accessor for GridIndex();
    uint64_t v50 = v20;
    v47[1] = v38;
    swift_retain();
    static ThumbnailHostFactory.remoteHostFactory(expectedGeometry:previewAgentConnector:makeUpdate:validateReply:)();
    swift_release();
    sub_10000FD9C(v35, &qword_1000706D0);
    uint64_t v39 = swift_allocObject();
    *(void *)(v39 + 16) = v57;
    *(void *)(v39 + 24) = v59;
    swift_retain();
    uint64_t v40 = v54;
    CanvasGridControl.init(configuration:thumbnailHostFactory:action:)();
    sub_100038C58(&qword_100070700, (void (*)(uint64_t))&type metadata accessor for GridIndex);
    uint64_t v41 = v58;
    uint64_t v42 = v56;
    static CanvasControlConfigurationBuilder.buildExpression<A>(_:)();
    (*(void (**)(char *, uint64_t))(v55 + 8))(v40, v42);
    sub_100020384(&qword_100070710, &qword_1000706E0);
    uint64_t v43 = v62;
    static CanvasControlConfigurationBuilder.buildBlock<A>(_:)();
    uint64_t v44 = v61;
    (*(void (**)(char *, void, uint64_t, uint64_t))(v61 + 56))(v16, 0, 1, v43);
    static CanvasControlConfigurationBuilder.buildOptional<A>(_:)();
    sub_10000FD9C((uint64_t)v16, &qword_1000706E8);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v41, v43);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v48, v50);
  }
  sub_100020384(&qword_100070708, &qword_1000706F8);
  static CanvasControlConfigurationBuilder.buildBlock<A>(_:)();
  static CanvasControlConfigurationBuilder.buildFinalResult<A>(_:)();
  uint64_t v45 = *(void (**)(char *, uint64_t))(v60 + 8);
  v45(v30, v27);
  return ((uint64_t (*)(char *, uint64_t))v45)(v32, v27);
}

uint64_t sub_100035F98@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for PreviewStructure();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2, v4);
  int v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == enum case for PreviewStructure.previewGroup(_:))
  {
    (*(void (**)(char *, uint64_t))(v5 + 96))(v7, v4);
    uint64_t v9 = &v7[*(int *)(sub_10000758C(&qword_1000706C8) + 48)];
    uint64_t v10 = type metadata accessor for PreviewGroupMetadata();
    uint64_t v11 = *(void *)(v10 - 8);
    __chkstk_darwin(v10);
    uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v7, v10);
    sub_100036930(a1);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    uint64_t v14 = type metadata accessor for CanvasControlDescription.ControlType.GridConfiguration();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(a1, 0, 1, v14);
    uint64_t v15 = type metadata accessor for GridIndex();
    return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v15 - 8) + 8))(v9, v15);
  }
  else if (v8 == enum case for PreviewStructure.singlePreview(_:))
  {
    uint64_t v17 = type metadata accessor for CanvasControlDescription.ControlType.GridConfiguration();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(a1, 1, 1, v17);
  }
  else if (v8 == enum case for PreviewStructure.emptyPreviewGroup(_:))
  {
    CanvasControlDescription.ControlType.GridConfiguration.init(sections:)();
    uint64_t v18 = type metadata accessor for CanvasControlDescription.ControlType.GridConfiguration();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(a1, 0, 1, v18);
  }
  else
  {
    uint64_t v19 = type metadata accessor for CanvasControlDescription.ControlType.GridConfiguration();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(a1, 1, 1, v19);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_100036314(uint64_t a1, void (*a2)(char *))
{
  uint64_t v4 = sub_10000758C(&qword_1000706B8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for GridIndex();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v6, a1, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  a2(v6);
  return sub_10000FD9C((uint64_t)v6, &qword_1000706B8);
}

double sub_10003644C(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = a2;
  uint64_t v4 = type metadata accessor for GridIndex();
  uint64_t v26 = *(void *)(v4 - 8);
  uint64_t v27 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for PropertyList();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for PreviewStructure();
  uint64_t v29 = *(void *)(v11 - 8);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v25 - v15;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  sub_100038C58(&qword_100070628, (void (*)(uint64_t))&type metadata accessor for PreviewStructure);
  PropertyListRepresentable.init(propertyList:)();
  if (!v2)
  {
    uint64_t v17 = v6;
    uint64_t v19 = v26;
    uint64_t v18 = v27;
    uint64_t v20 = v29;
    (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v14, v16, v11);
    if ((*(unsigned int (**)(char *, uint64_t))(v20 + 88))(v14, v11) == enum case for PreviewStructure.previewGroup(_:))
    {
      (*(void (**)(char *, uint64_t))(v20 + 96))(v14, v11);
      uint64_t v21 = sub_10000758C(&qword_1000706C8);
      (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v17, &v14[*(int *)(v21 + 48)], v18);
      uint64_t v22 = type metadata accessor for PreviewGroupMetadata();
      (*(void (**)(char *, uint64_t))(*(void *)(v22 - 8) + 8))(v14, v22);
      char v23 = static GridIndex.== infix(_:_:)();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v17, v18);
      if (v23) {
        goto LABEL_7;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v20 + 8))(v14, v11);
    }
    sub_100038A40();
    swift_allocError();
    swift_willThrow();
LABEL_7:
    (*(void (**)(char *, uint64_t))(v20 + 8))(v16, v11);
  }
  return 0.0;
}

uint64_t sub_100036808(uint64_t a1, void (*a2)(char *))
{
  uint64_t v4 = sub_10000758C(&qword_1000706B8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for GridIndex();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v6, a1, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  a2(v6);
  return sub_10000FD9C((uint64_t)v6, &qword_1000706B8);
}

uint64_t sub_100036930@<X0>(uint64_t a1@<X8>)
{
  uint64_t v64 = type metadata accessor for CanvasControlDescription.ControlType.GridConfiguration.Item();
  uint64_t v2 = *(void *)(v64 - 8);
  __chkstk_darwin(v64);
  uint64_t v48 = (char *)v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000758C(&qword_100070720);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for CanvasControlDescription.ControlType.GridConfiguration.Section();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v60 = (char *)v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v45 = (char *)v42 - v11;
  sub_10000758C(&qword_100070728);
  uint64_t v12 = type metadata accessor for PreviewGroupMetadata.Section();
  uint64_t v13 = *(void *)(v12 - 8);
  unint64_t v14 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v59 = *(void *)(v13 + 72);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_1000507D0;
  PreviewGroupMetadata.firstSection.getter();
  uint64_t v16 = PreviewGroupMetadata.moreSections.getter();
  uint64_t v65 = v15;
  sub_100038000(v16);
  uint64_t v58 = *(void *)(v65 + 16);
  if (v58)
  {
    v42[1] = a1;
    unint64_t v55 = v65 + v14;
    uint64_t v17 = *(void (**)(char *))(v13 + 16);
    uint64_t v53 = *(void *)(v13 + 64);
    uint64_t v54 = v17;
    uint64_t v56 = v13 + 16;
    uint64_t v51 = (void (**)(char *, uint64_t))(v13 + 8);
    uint64_t v52 = (void (**)(char *, uint64_t))(v2 + 8);
    uint64_t v50 = (uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48);
    uint64_t v44 = v8;
    uint64_t v49 = (void (**)(char *, char *, uint64_t))(v8 + 32);
    v42[0] = v65;
    uint64_t v18 = swift_bridgeObjectRetain();
    uint64_t v19 = 0;
    uint64_t v20 = &_swiftEmptyArrayStorage;
    uint64_t v21 = v2;
    uint64_t v22 = v48;
    uint64_t v43 = v21;
    uint64_t v46 = v7;
    uint64_t v47 = v6;
    uint64_t v57 = v12;
    while (1)
    {
      uint64_t v61 = v42;
      uint64_t v62 = v20;
      __chkstk_darwin(v18);
      int v24 = (char *)v42 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
      v54(v24);
      PreviewGroupMetadata.Section.title.getter();
      CanvasControlDescription.ControlType.GridConfiguration.Item.init(title:)();
      uint64_t v25 = PreviewGroupMetadata.Section.previewCount.getter();
      if (v25 < 0) {
        break;
      }
      uint64_t v26 = v25;
      uint64_t v63 = v19;
      if (v25)
      {
        uint64_t v27 = v64;
        uint64_t v28 = static Array._allocateBufferUninitialized(minimumCapacity:)();
        *(void *)(v28 + 16) = v26;
        uint64_t v29 = v27;
        unint64_t v30 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
        uint64_t v31 = *(void (**)(unint64_t, char *, uint64_t))(v21 + 16);
        v31(v28 + v30, v22, v29);
        uint64_t v32 = v26 - 1;
        if (v26 == 1)
        {
          uint64_t v22 = v48;
        }
        else
        {
          uint64_t v33 = *(void *)(v21 + 72);
          unint64_t v34 = v28 + v33 + v30;
          uint64_t v35 = v48;
          do
          {
            v31(v34, v35, v64);
            v34 += v33;
            --v32;
          }
          while (v32);
          uint64_t v21 = v43;
          uint64_t v22 = v35;
        }
        uint64_t v7 = v46;
        uint64_t v6 = v47;
      }
      (*v52)(v22, v64);
      CanvasControlDescription.ControlType.GridConfiguration.Section.init(title:items:)();
      (*v51)(v24, v57);
      int v36 = (*v50)(v6, 1, v7);
      uint64_t v20 = v62;
      if (v36 == 1)
      {
        uint64_t v18 = sub_10000FD9C((uint64_t)v6, &qword_100070720);
      }
      else
      {
        uint64_t v37 = *v49;
        uint64_t v38 = v45;
        (*v49)(v45, v6, v7);
        v37(v60, v38, v7);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v20 = (void *)sub_1000371EC(0, v20[2] + 1, 1, (unint64_t)v20, &qword_100070730, (uint64_t (*)(void))&type metadata accessor for CanvasControlDescription.ControlType.GridConfiguration.Section, (uint64_t (*)(void))&type metadata accessor for CanvasControlDescription.ControlType.GridConfiguration.Section);
        }
        unint64_t v40 = v20[2];
        unint64_t v39 = v20[3];
        if (v40 >= v39 >> 1) {
          uint64_t v20 = (void *)sub_1000371EC(v39 > 1, v40 + 1, 1, (unint64_t)v20, &qword_100070730, (uint64_t (*)(void))&type metadata accessor for CanvasControlDescription.ControlType.GridConfiguration.Section, (uint64_t (*)(void))&type metadata accessor for CanvasControlDescription.ControlType.GridConfiguration.Section);
        }
        long long v20[2] = v40 + 1;
        uint64_t v18 = ((uint64_t (*)(char *, char *, uint64_t))v37)((char *)v20+ ((*(unsigned __int8 *)(v44 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80))+ *(void *)(v44 + 72) * v40, v60, v7);
      }
      uint64_t v19 = v63 + 1;
      if (v63 + 1 == v58)
      {
        swift_bridgeObjectRelease_n();
        return CanvasControlDescription.ControlType.GridConfiguration.init(sections:)();
      }
    }
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    return CanvasControlDescription.ControlType.GridConfiguration.init(sections:)();
  }
  return result;
}

uint64_t sub_100036FA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for PropertyList();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a2, a1, v4);
}

uint64_t sub_100037010()
{
  return static CanvasControlConfiguration<A>.empty.getter();
}

uint64_t sub_100037018(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1000370F4;
  return v6(a1);
}

uint64_t sub_1000370F4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000371EC(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
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
  sub_10000758C(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (void *)swift_allocObject();
  size_t v19 = j__malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
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
    sub_100038A94(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

uint64_t sub_10003746C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000758C(&qword_100070498);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000374D4()
{
  uint64_t v17 = type metadata accessor for AgentUpdate.Context();
  uint64_t v1 = *(void *)(v17 - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 72) & ~v2;
  unint64_t v14 = (*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v4 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = (v14 + v5 + 8) & ~v5;
  uint64_t v7 = *(void *)(v4 + 64);
  uint64_t updated = type metadata accessor for SceneUpdateContext();
  uint64_t v9 = *(void *)(updated - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = (v6 + v7 + v10) & ~v10;
  uint64_t v15 = v2 | v10 | v5 | 7;
  unint64_t v12 = (*(void *)(v9 + 64) + v11 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v0 + v3, v17);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0 + v6, AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v0 + v11, updated);
  sub_10000FCE4(v0 + v12);

  return _swift_deallocObject(v0, v12 + 40, v15);
}

uint64_t sub_10003770C(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for AgentUpdate.Context() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v8 = (v6 + *(unsigned __int8 *)(v7 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = *(void *)(v7 + 64);
  uint64_t v10 = *(void *)(type metadata accessor for SceneUpdateContext() - 8);
  unint64_t v11 = (v8 + v9 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = v1[2];
  uint64_t v13 = v1[3];
  uint64_t v14 = v1[8];
  uint64_t v15 = *(uint64_t **)((char *)v1 + v6);
  uint64_t v16 = (uint64_t)v1 + v11;
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v17;
  *uint64_t v17 = v2;
  v17[1] = sub_100020810;
  return sub_100032124(a1, v12, v13, v14, (uint64_t)v1 + v5, v15, (uint64_t)v1 + v8, v16);
}

uint64_t sub_100037940()
{
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100037978(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 48);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_1000237E8;
  return sub_100033A38(a1, v4);
}

uint64_t sub_100037A40()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v2 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 56) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, AssociatedTypeWitness);
  swift_release();

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_100037B40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v6 = *(uint64_t **)(v2 + 48);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_100032D90(a1, v6, v7, a2);
}

uint64_t sub_100037C08()
{
  uint64_t updated = type metadata accessor for SceneUpdateContext();
  uint64_t v2 = *(void *)(updated - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  unint64_t v5 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8 + 8) & ~v8;
  uint64_t v10 = v3 | v8 | 7;
  unint64_t v11 = (((*(void *)(v7 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v13 = v10;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, updated);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, AssociatedTypeWitness);
  swift_release();
  sub_10000FCE4(v0 + v11);

  return _swift_deallocObject(v0, v11 + 40, v13);
}

uint64_t sub_100037DB8(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for SceneUpdateContext() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v7 = (v5 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v8 = (*(void *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = *(uint64_t **)(v1 + v5);
  uint64_t v10 = *(void *)(v1 + v8);

  return sub_100033114(a1, v1 + v4, v9, v1 + v7, v10, v1 + ((v8 + 15) & 0xFFFFFFFFFFFFFFF8));
}

uint64_t sub_100037EFC()
{
  return sub_100033788();
}

uint64_t sub_100037F14(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1000237E8;
  return sub_100034194(a1);
}

uint64_t type metadata accessor for RemoteContentProvider.ControlInteractionUpdateDelegate(uint64_t a1, uint64_t a2)
{
  return _swift_getGenericMetadata(a1, a2, &nominal type descriptor for RemoteContentProvider.ControlInteractionUpdateDelegate);
}

uint64_t sub_100037FC8()
{
  sub_10000FCE4(v0 + 16);

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100038000(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(void *)(v3 + 24) >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v23 = v4 + v2;
  }
  else {
    int64_t v23 = v4;
  }
  unint64_t v3 = sub_1000371EC(isUniquelyReferenced_nonNull_native, v23, 1, v3, &qword_100070728, (uint64_t (*)(void))&type metadata accessor for PreviewGroupMetadata.Section, (uint64_t (*)(void))&type metadata accessor for PreviewGroupMetadata.Section);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = (*(void *)(v3 + 24) >> 1) - v9;
  uint64_t v11 = *(void *)(type metadata accessor for PreviewGroupMetadata.Section() - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  if (v10 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v14 = v3 + v13 + v12 * v9;
  unint64_t v15 = a1 + v13;
  uint64_t v16 = v12 * v8;
  unint64_t v17 = v14 + v16;
  unint64_t v18 = v15 + v16;
  if (v15 < v17 && v14 < v18) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v20 = *(void *)(v3 + 16);
  BOOL v21 = __OFADD__(v20, v8);
  uint64_t v22 = v20 + v8;
  if (!v21)
  {
    *(void *)(v3 + 16) = v22;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000381C8()
{
  return *(void *)(v0 + qword_100070360);
}

uint64_t sub_1000381D8()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100038218(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (uint64_t *)v1[4];
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *unint64_t v7 = v2;
  v7[1] = sub_1000237E8;
  return sub_10003BA4C(a1, v4, v5, v6);
}

uint64_t sub_1000382CC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100038304(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000237E8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100070500 + dword_100070500);
  return v6(a1, v4);
}

uint64_t type metadata accessor for RemoteContentProvider.CannotResizeWhileRelaunching(uint64_t a1, uint64_t a2)
{
  return _swift_getGenericMetadata(a1, a2, &nominal type descriptor for RemoteContentProvider.CannotResizeWhileRelaunching);
}

uint64_t sub_1000383D4()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10003841C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = (void *)v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_100020810;
  return sub_100031210(a1, v4, v5, v7, v6);
}

uint64_t sub_1000384DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 40);
}

uint64_t sub_1000384E8(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *sub_100038540(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t *sub_100038568(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    long long v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *long long v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *long long v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

__n128 sub_100038798(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_1000387AC(uint64_t a1, uint64_t a2)
{
  sub_10000FCE4(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t sub_1000387E8(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_100038830(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_100038878()
{
  return swift_getWitnessTable();
}

uint64_t sub_100038894()
{
  return swift_getWitnessTable();
}

uint64_t sub_1000388B0()
{
  return swift_getWitnessTable();
}

uint64_t sub_1000388CC()
{
  return swift_getWitnessTable();
}

ValueMetadata *type metadata accessor for PassThroughUpdateBehavior()
{
  return &type metadata for PassThroughUpdateBehavior;
}

ValueMetadata *type metadata accessor for PreviewUpdateBehavior()
{
  return &type metadata for PreviewUpdateBehavior;
}

uint64_t sub_100038908()
{
  return sub_100038C58(&qword_100070628, (void (*)(uint64_t))&type metadata accessor for PreviewStructure);
}

uint64_t sub_100038950()
{
  return sub_100038C58(&qword_100070630, (void (*)(uint64_t))&type metadata accessor for PreviewPayload);
}

void *sub_100038998()
{
  return &protocol witness table for PropertyList;
}

uint64_t sub_1000389A4@<X0>(uint64_t a1@<X8>)
{
  return sub_1000357E8(v1[3], v1[4], v1[5], v1[6], v1[7], a1);
}

uint64_t sub_1000389B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000758C(&qword_1000706B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100038A1C(uint64_t a1)
{
  return sub_100036314(a1, *(void (**)(char *))(v1 + 16));
}

uint64_t sub_100038A38(uint64_t a1)
{
  return sub_100036808(a1, *(void (**)(char *))(v1 + 16));
}

unint64_t sub_100038A40()
{
  unint64_t result = qword_100070718;
  if (!qword_100070718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100070718);
  }
  return result;
}

uint64_t sub_100038A94(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100038BF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000758C(&qword_100070738);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100038C58(unint64_t *a1, void (*a2)(uint64_t))
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

ValueMetadata *type metadata accessor for PreviewUpdateBehavior.ThumbnailDisplayError()
{
  return &type metadata for PreviewUpdateBehavior.ThumbnailDisplayError;
}

void sub_100038CB8(void *a1)
{
  uint64_t v2 = v1;
  sub_10000FC3C(a1, a1[3]);
  long long v3 = (void *)dispatch thunk of CanvasContentHost.viewController.getter();
  sub_100039098(v3);

  uint64_t v4 = (void *)dispatch thunk of CanvasContentHost.viewController.getter();
  uint64_t v5 = OBJC_IVAR____TtC12PreviewShell20CanvasViewController_activating;
  uint64_t v6 = *(void **)(v2 + OBJC_IVAR____TtC12PreviewShell20CanvasViewController_activating);

  if (v6) {
    BOOL v7 = v4 == v6;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7)
  {
    uint64_t v8 = *(void **)(v2 + v5);
    id v15 = v8;
    uint64_t v9 = dispatch thunk of CanvasContentHost.viewController.getter();
    uint64_t v10 = *(void **)(v2 + v5);
    *(void *)(v2 + v5) = v9;

    if (v8)
    {
      id v11 = *(id *)(v2 + OBJC_IVAR____TtC12PreviewShell20CanvasViewController_active);
      unint64_t v12 = v15;
      if (v11) {
        BOOL v13 = v15 == v11;
      }
      else {
        BOOL v13 = 0;
      }
      if (!v13)
      {
        id v14 = v15;
        sub_100039290(v14);

        unint64_t v12 = v15;
      }
    }
  }
}

void sub_100038DE8(void *a1)
{
  uint64_t v2 = v1;
  sub_10000FC3C(a1, a1[3]);
  long long v3 = (void *)dispatch thunk of CanvasContentHost.viewController.getter();
  sub_100039098(v3);

  id v4 = [v1 view];
  if (!v4)
  {
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v5 = v4;
  uint64_t v6 = (void *)dispatch thunk of CanvasContentHost.viewController.getter();
  id v7 = [v6 view];

  if (!v7)
  {
LABEL_17:
    __break(1u);
    return;
  }
  [v5 bringSubviewToFront:v7];

  uint64_t v8 = OBJC_IVAR____TtC12PreviewShell20CanvasViewController_debugOverlay;
  uint64_t v9 = *(void **)&v2[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_debugOverlay];
  if (v9)
  {
    id v10 = v9;
    PreviewDebugOverlay.bringToFront()();

    id v11 = *(void **)&v2[v8];
    if (v11)
    {
      id v12 = v11;
      PreviewDebugOverlay.contentsUpdated()();
    }
  }
  BOOL v13 = (void *)dispatch thunk of CanvasContentHost.viewController.getter();
  uint64_t v14 = OBJC_IVAR____TtC12PreviewShell20CanvasViewController_active;
  id v15 = *(void **)&v2[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_active];

  if (!v15 || v13 != v15)
  {
    uint64_t v16 = *(void **)&v2[v14];
    id v22 = v16;
    uint64_t v17 = dispatch thunk of CanvasContentHost.viewController.getter();
    unint64_t v18 = *(void **)&v2[v14];
    *(void *)&v2[v14] = v17;

    if (v16)
    {
      id v19 = *(id *)&v2[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_activating];
      uint64_t v20 = v22;
      if (!v19 || v22 != v19)
      {
        id v21 = v22;
        sub_100039290(v21);

        uint64_t v20 = v22;
      }
    }
  }
}

void sub_100039098(void *a1)
{
  id v3 = [a1 parentViewController];
  if (v3)
  {
    id v4 = v3;

    if (v4 == v1) {
      return;
    }
  }
  [v1 addChildViewController:a1];
  id v5 = [v1 view];
  if (!v5)
  {
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v6 = v5;
  id v7 = [a1 view];
  if (!v7)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v8 = v7;
  [v6 addSubview:v7];

  id v9 = [v1 view];
  if (!v9)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  id v10 = v9;
  id v11 = [a1 view];
  if (!v11)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  id v12 = v11;
  [v10 sendSubviewToBack:v11];

  id v13 = [a1 view];
  if (!v13)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v14 = v13;
  id v15 = [v1 view];
  if (!v15)
  {
LABEL_18:
    __break(1u);
    return;
  }
  uint64_t v16 = v15;
  [v15 bounds];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  [v14 setFrame:v18, v20, v22, v24];

  [a1 didMoveToParentViewController:v1];
}

void sub_100039290(void *a1)
{
  id v3 = [a1 parentViewController];
  if (v3)
  {
    id v4 = v3;

    if (v4 == v1)
    {
      [a1 willMoveToParentViewController:0];
      id v5 = [a1 view];
      if (v5)
      {
        uint64_t v6 = v5;
        [v5 removeFromSuperview];

        [a1 removeFromParentViewController];
      }
      else
      {
        __break(1u);
      }
    }
  }
}

uint64_t sub_100039388()
{
  uint64_t v1 = type metadata accessor for PreviewPreferences.InterfaceOrientation();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  id v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  id v7 = (char *)&v13 - v6;
  uint64_t v8 = v0 + OBJC_IVAR____TtC12PreviewShell20CanvasViewController_forcedOrientation;
  swift_beginAccess();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v8, 1, v1))
  {
    id v10 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
    v10(v7, v8, v1);
    v10(v5, (uint64_t)v7, v1);
    int v11 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v5, v1);
    if (v11 != enum case for PreviewPreferences.InterfaceOrientation.portrait(_:))
    {
      if (v11 == enum case for PreviewPreferences.InterfaceOrientation.portraitUpsideDown(_:))
      {
        uint64_t v9 = 4;
        goto LABEL_11;
      }
      if (v11 == enum case for PreviewPreferences.InterfaceOrientation.landscapeLeft(_:))
      {
        uint64_t v9 = 16;
        goto LABEL_11;
      }
      if (v11 == enum case for PreviewPreferences.InterfaceOrientation.landscapeRight(_:))
      {
        uint64_t v9 = 8;
        goto LABEL_11;
      }
      (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
    }
    uint64_t v9 = 30;
LABEL_11:
    (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
    return v9;
  }
  return 30;
}

void sub_1000395A4()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = type metadata accessor for PreviewDebugOverlay.AlignmentEdge();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13.receiver = v1;
  v13.super_class = ObjectType;
  [super viewDidLoad];
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for PreviewDebugOverlay.AlignmentEdge.bottom(_:), v3);
  if ([v1 view])
  {
    id v7 = objc_allocWithZone((Class)type metadata accessor for PreviewDebugOverlay());
    uint64_t v8 = PreviewDebugOverlay.init(edge:parent:)();
    uint64_t v9 = OBJC_IVAR____TtC12PreviewShell20CanvasViewController_debugOverlay;
    id v10 = *(void **)&v1[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_debugOverlay];
    *(void *)&v1[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_debugOverlay] = v8;

    int v11 = *(void **)&v1[v9];
    if (v11)
    {
      id v12 = v11;
      swift_bridgeObjectRetain();
      PreviewDebugOverlay.identifier.setter();
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_100039774()
{
  uint64_t v1 = v0;
  v35.receiver = v0;
  v35.super_class = (Class)swift_getObjectType();
  [super viewWillLayoutSubviews];
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_activating];
  if (v2)
  {
    id v3 = [v2 view];
    if (v3)
    {
      uint64_t v4 = v3;
      id v5 = [v1 view];
      if (v5)
      {
        uint64_t v6 = v5;
        [v5 bounds];
        double v8 = v7;
        double v10 = v9;
        double v12 = v11;
        double v14 = v13;

        [v4 setFrame:v8, v10, v12, v14];
        goto LABEL_5;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
LABEL_5:
  id v15 = *(void **)&v1[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_active];
  if (!v15) {
    goto LABEL_9;
  }
  id v16 = [v15 view];
  if (!v16) {
    goto LABEL_16;
  }
  double v17 = v16;
  id v18 = [v1 view];
  if (!v18)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  double v19 = v18;
  [v18 bounds];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  [v17 setFrame:v21, v23, v25, v27];
LABEL_9:
  uint64_t v28 = OBJC_IVAR____TtC12PreviewShell20CanvasViewController_debugOverlay;
  uint64_t v29 = *(void **)&v1[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_debugOverlay];
  if (!v29) {
    return;
  }
  id v30 = v29;
  id v31 = [v1 view];
  if (!v31)
  {
LABEL_18:
    __break(1u);
    return;
  }
  uint64_t v32 = v31;
  [v31 bounds];

  PreviewDebugOverlay.size.setter();
  uint64_t v33 = *(void **)&v1[v28];
  if (v33)
  {
    id v34 = v33;
    PreviewDebugOverlay.bringToFront()();
  }
}

uint64_t sub_100039A64()
{
  return type metadata accessor for CanvasViewController();
}

uint64_t type metadata accessor for CanvasViewController()
{
  uint64_t result = qword_100070788;
  if (!qword_100070788) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100039AB8()
{
  sub_100039B60();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_100039B60()
{
  if (!qword_100070798)
  {
    type metadata accessor for PreviewPreferences.InterfaceOrientation();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100070798);
    }
  }
}

uint64_t sub_100039BB8(uint64_t a1)
{
  uint64_t v2 = sub_10000758C((uint64_t *)&unk_1000707A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_100039E34()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return [super dealloc];
}

int main(int argc, const char **argv, const char **envp)
{
  id v5 = (objc_class *)type metadata accessor for AppDelegate();
  uint64_t v6 = NSStringFromClass(v5);
  UIApplicationMain(argc, (char **)argv, 0, v6);

  return 0;
}

uint64_t type metadata accessor for AppDelegate()
{
  return self;
}

id sub_100039EE8(void *a1)
{
  id v2 = [a1 role];
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;

  if (v3 == 0xD000000000000017 && v5 == 0x8000000100057090
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    id v6 = [a1 role];
    id v7 = [objc_allocWithZone((Class)UISceneConfiguration) initWithName:0 sessionRole:v6];

    type metadata accessor for LocalSceneDelegate();
  }
  else
  {
    if (static String._unconditionallyBridgeFromObjectiveC(_:)() == v3 && v9 == v5)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        id v12 = [a1 role];
        id v13 = [objc_allocWithZone((Class)UISceneConfiguration) initWithName:0 sessionRole:v12];

        type metadata accessor for DeviceMainSceneDelegate();
        uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
        id v7 = v13;
        [v7 setDelegateClass:ObjCClassFromMetadata];
        NSString v15 = String._bridgeToObjectiveC()();
        id v16 = [self storyboardWithName:v15 bundle:0];

        [v7 setStoryboard:v16];
        return v7;
      }
    }
    id v17 = [a1 role];
    id v7 = [objc_allocWithZone((Class)UISceneConfiguration) initWithName:0 sessionRole:v17];

    type metadata accessor for InjectedSceneDelegate();
  }
  [v7 setDelegateClass:swift_getObjCClassFromMetadata()];
  return v7;
}

uint64_t sub_10003A16C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10003A1B4()
{
  return sub_1000116A8();
}

uint64_t sub_10003A1D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v39 = a5;
  uint64_t v40 = a7;
  uint64_t v44 = a4;
  uint64_t v45 = a6;
  uint64_t v43 = a3;
  uint64_t v37 = a1;
  uint64_t v38 = a2;
  uint64_t v49 = type metadata accessor for AgentUpdate.Context();
  uint64_t v47 = *(void *)(v49 - 8);
  uint64_t v41 = *(void *)(v47 + 64);
  __chkstk_darwin(v49);
  uint64_t v48 = (char *)v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for PropertyList();
  uint64_t v35 = v9;
  uint64_t v46 = *(void *)(v9 - 8);
  uint64_t v10 = *(void *)(v46 + 64);
  __chkstk_darwin(v9);
  int v36 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for PreviewAgentConnector();
  uint64_t v33 = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  __chkstk_darwin(v11);
  id v34 = (char *)v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = type metadata accessor for ContentKey();
  uint64_t v14 = *(void *)(v31 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  __chkstk_darwin(v31);
  uint64_t v32 = (char *)v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = *(void *)(v7 + 48);
  (*(void (**)(void))(v14 + 16))();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v38, v11);
  uint64_t v16 = v46;
  (*(void (**)(char *, uint64_t, uint64_t))(v46 + 16))((char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v39, v9);
  uint64_t v17 = v47;
  (*(void (**)(char *, uint64_t, uint64_t))(v47 + 16))(v48, v40, v49);
  unint64_t v18 = (*(unsigned __int8 *)(v14 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  unint64_t v19 = (v15 + *(unsigned __int8 *)(v12 + 80) + v18) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v20 = (v13 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v21 = (*(unsigned __int8 *)(v16 + 80) + v20 + 16) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v22 = (v10 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v23 = (*(unsigned __int8 *)(v17 + 80) + v22 + 8) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  uint64_t v24 = swift_allocObject();
  uint64_t v25 = v31;
  *(void *)(v24 + 16) = v30[1];
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v24 + v18, v32, v25);
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v24 + v19, v34, v33);
  double v26 = (void *)(v24 + v20);
  uint64_t v27 = v44;
  *double v26 = v43;
  v26[1] = v27;
  (*(void (**)(unint64_t, char *, uint64_t))(v46 + 32))(v24 + v21, v36, v35);
  *(void *)(v24 + v22) = v45;
  (*(void (**)(unint64_t, char *, uint64_t))(v47 + 32))(v24 + v23, v48, v49);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  uint64_t v28 = FutureSerialQueue.enqueue<A>(priority:makeFuture:)();
  swift_release();
  return v28;
}

uint64_t sub_10003A608(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v20 = a8;
  uint64_t v21 = type metadata accessor for ExecutionLane();
  uint64_t v15 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain_n();
  sub_100011920(a2, a3, a4, a5, a6, a7, v20, (uint64_t)sub_10003B42C, a1, (uint64_t)sub_10003B434, a1);
  swift_release_n();
  static ExecutionLane.main.getter();
  type metadata accessor for PropertyList();
  uint64_t v18 = Future.tryThen<A>(dsoHandle:file:line:column:function:on:transform:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v21);
  return v18;
}

uint64_t sub_10003A7E8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_100038CB8(a1);
  uint64_t v3 = enum case for SceneUpdateTiming.async(_:);
  uint64_t updated = type metadata accessor for SceneUpdateTiming();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(updated - 8) + 104);

  return v5(a2, v3, updated);
}

char *sub_10003A864(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ExecutionLane();
  uint64_t v21 = *(void *)(v2 - 8);
  uint64_t v22 = v2;
  __chkstk_darwin(v2);
  uint64_t v20 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t updated = type metadata accessor for CanvasUpdateOutput();
  uint64_t v5 = *(void *)(updated - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = __chkstk_darwin(updated);
  uint64_t v8 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v19 - v9;
  uint64_t v11 = type metadata accessor for CanvasUpdater.UpdateResult(0);
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v12(v10, a1 + *(int *)(v11 + 20), updated);
  uint64_t v13 = (void (*)(void))CanvasUpdateOutput.makeStaticOutput.getter();
  uint64_t v14 = v23;
  v13();
  uint64_t v23 = v14;
  if (v14)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, updated);
    swift_release();
  }
  else
  {
    swift_release();
    v12(v8, (uint64_t)v10, updated);
    unint64_t v15 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    uint64_t v16 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v16 + v15, v8, updated);
    uint64_t v17 = v20;
    static ExecutionLane.any.getter();
    type metadata accessor for PropertyList();
    uint64_t v8 = (char *)Future.mapSuccess<A>(dsoHandle:file:line:column:function:on:_:)();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v17, v22);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, updated);
  }
  return v8;
}

uint64_t sub_10003AB54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v13[1] = a2;
  uint64_t v3 = type metadata accessor for PropertyList();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for ChromeType();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = type metadata accessor for StaticPreviewReply();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  CanvasUpdateOutput.staticChromeType.getter();
  CanvasUpdateOutput.controlDescriptions.getter();
  CanvasUpdateOutput.controlStates.getter();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  StaticPreviewReply.init(chromeType:controlDescriptions:controlStates:contentPayload:)();
  sub_10003B568(&qword_100070978, 255, (void (*)(uint64_t))&type metadata accessor for StaticPreviewReply);
  PropertyListRepresentable.propertyList.getter();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

void sub_10003AD88(uint64_t a1, uint64_t a2, void *a3)
{
}

uint64_t sub_10003ADB0()
{
  if (*(void *)(v0 + 64))
  {
    uint64_t v0 = *(void *)(v0 + 64);
  }
  else
  {
    *(void *)(v0 + 64) = v0;
    swift_retain_n();
  }
  swift_retain();
  return v0;
}

uint64_t sub_10003ADF8()
{
  swift_release();

  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocClassInstance(v0, 72, 7);
}

uint64_t type metadata accessor for StaticPreviewCanvas()
{
  return self;
}

uint64_t sub_10003AE7C()
{
  return static Future<A>.succeeded(dsoHandle:file:line:column:function:)();
}

uint64_t sub_10003AEE8()
{
  return static Future<A>.succeeded(dsoHandle:file:line:column:function:)();
}

uint64_t sub_10003AF54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_10003A1D8(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_10003AF78(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_10003B568(&qword_10006FE00, a2, (void (*)(uint64_t))type metadata accessor for StaticPreviewCanvas);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10003AFD0()
{
  uint64_t v22 = type metadata accessor for ContentKey();
  uint64_t v1 = *(void *)(v22 - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v16 = (v2 + 24) & ~v2;
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v21 = type metadata accessor for PreviewAgentConnector();
  uint64_t v4 = *(void *)(v21 - 8);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v18 = (v16 + v3 + v5) & ~v5;
  unint64_t v15 = (*(void *)(v4 + 64) + v18 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v20 = type metadata accessor for PropertyList();
  uint64_t v6 = *(void *)(v20 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v15 + v7 + 16) & ~v7;
  unint64_t v14 = (*(void *)(v6 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v19 = type metadata accessor for AgentUpdate.Context();
  uint64_t v9 = *(void *)(v19 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = (v14 + v10 + 8) & ~v10;
  uint64_t v17 = v11 + *(void *)(v9 + 64);
  uint64_t v12 = v2 | v5 | v7 | v10 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v0 + v16, v22);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0 + v18, v21);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v8, v20);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v0 + v11, v19);

  return _swift_deallocObject(v0, v17, v12);
}

uint64_t sub_10003B278()
{
  uint64_t v1 = *(void *)(type metadata accessor for ContentKey() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v4 = *(void *)(type metadata accessor for PreviewAgentConnector() - 8);
  unint64_t v5 = (v2 + v3 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(type metadata accessor for PropertyList() - 8);
  unint64_t v8 = (v6 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v9 = (*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v10 = *(void *)(type metadata accessor for AgentUpdate.Context() - 8);
  uint64_t v11 = *(void *)(v0 + 16);
  uint64_t v12 = *(void *)(v0 + v6);
  uint64_t v13 = *(void *)(v0 + v6 + 8);
  uint64_t v14 = *(void *)(v0 + v9);
  uint64_t v15 = v0 + ((v9 + *(unsigned __int8 *)(v10 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));

  return sub_10003A608(v11, v0 + v2, v0 + v5, v12, v13, v0 + v8, v14, v15);
}

uint64_t sub_10003B42C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10003A7E8(a1, a2);
}

void sub_10003B434(void *a1)
{
}

uint64_t sub_10003B458()
{
  uint64_t updated = type metadata accessor for CanvasUpdateOutput();
  uint64_t v2 = *(void *)(updated - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, updated);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10003B4E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for CanvasUpdateOutput();

  return sub_10003AB54(a1, a2);
}

uint64_t sub_10003B568(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_10003B5B0(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SceneSettingsPolicy();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v9 = (void **)((char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  assertMainThread(file:line:column:function:)();
  uint64_t v10 = static ProcessUtilities.processHandle(for:)();
  if (v10 && (uint64_t v11 = (void *)v10, v12 = (void *)RBSProcessHandle.applicationProcess.getter(), v11, v12))
  {
    uint64_t v40 = v12;
    id v39 = [v12 identity];
    uint64_t v13 = (void *)AgentSceneConfiguration.sceneSpecification.getter();
    id v14 = [v13 specification];

    uint64_t v15 = self;
    id v38 = v14;
    id v37 = [v15 parametersForSpecification:v14];
    AgentSceneConfiguration.previewShellScene.getter();
    (*(void (**)(void **, uint64_t, uint64_t))(v7 + 16))(v9, a3, v6);
    int v16 = (*(uint64_t (**)(void **, uint64_t))(v7 + 88))(v9, v6);
    if (v16 == enum case for SceneSettingsPolicy.custom(_:))
    {
      (*(void (**)(void **, uint64_t))(v7 + 96))(v9, v6);
      uint64_t v17 = *v9;
    }
    else
    {
      int v21 = v16;
      uint64_t v36 = v3;
      int v22 = enum case for SceneSettingsPolicy.mirrorParent(_:);
      swift_getObjectType();
      uint64_t v17 = (void *)dispatch thunk of PreviewShellScene.sceneSettings.getter();
      if (v21 != v22) {
        (*(void (**)(void **, uint64_t))(v7 + 8))(v9, v6);
      }
    }
    uint64_t v23 = v40;
    swift_unknownObjectRelease();
    id v24 = [v17 settings];

    id v25 = [v24 copyResettingInterruptionPolicy];
    id v26 = v37;
    [v37 setSettings:v25];

    id v27 = [objc_allocWithZone((Class)FBSMutableSceneDefinition) init];
    AgentSceneConfiguration.sceneIdentifier.getter();
    NSString v28 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v29 = [self identityForIdentifier:v28];

    [v27 setIdentity:v29];
    id v30 = self;
    uint64_t v31 = v39;
    id v32 = [v30 identityForProcessIdentity:v39];
    [v27 setClientIdentity:v32];

    uint64_t v33 = v38;
    [v27 setSpecification:v38];
    id v34 = [self sharedInstance];
    id v35 = [v34 createSceneWithDefinition:v27 initialParameters:v26];

    return (uint64_t)v35;
  }
  else
  {
    uint64_t v18 = type metadata accessor for ProcessError();
    sub_10003C530(&qword_10006EFE0, (void (*)(uint64_t))&type metadata accessor for ProcessError);
    swift_allocError();
    *uint64_t v19 = a1;
    (*(void (**)(_DWORD *, void, uint64_t))(*(void *)(v18 - 8) + 104))(v19, enum case for ProcessError.noProcessForPid(_:), v18);
    return swift_willThrow();
  }
}

uint64_t sub_10003BA4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  v4[3] = a4;
  uint64_t v6 = *a4;
  v4[4] = type metadata accessor for MainActor();
  v4[5] = static MainActor.shared.getter();
  v4[2] = a4;
  uint64_t v7 = (void *)swift_task_alloc();
  v4[6] = v7;
  uint64_t v8 = sub_10003C530(&qword_100070510, (void (*)(uint64_t))&type metadata accessor for PreviewSceneAgentProxy);
  *uint64_t v7 = v4;
  v7[1] = sub_10003BB74;
  return ConcurrentInvalidatable.invalidation.getter(v6, v8);
}

uint64_t sub_10003BB74()
{
  swift_task_dealloc();
  uint64_t v1 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10003BCB0, v1, v0);
}

uint64_t sub_10003BCB0()
{
  swift_release();
  uint64_t v1 = (void *)PreviewSceneAgentProxy.scene.getter();
  id v2 = [v1 scene];

  sub_10003C258(0, v2);
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

void sub_10003BD48()
{
  off_100070980 = &_swiftEmptyDictionarySingleton;
}

id sub_10003BD5C()
{
  id result = [objc_allocWithZone((Class)SBSKeyboardFocusService) init];
  qword_100070988 = (uint64_t)result;
  return result;
}

Swift::Int sub_10003BD90(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_10000758C(&qword_100070998);
    uint64_t v3 = static _SetStorage.allocate(capacity:)();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      Hasher.init(_seed:)();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      Swift::Int result = Hasher._finalize()();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        int v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      int v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *int v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

id sub_10003BF34(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.uv.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v20 = a1;
  if (v10)
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v19 = v4;
    unint64_t v12 = (uint8_t *)v11;
    uint64_t v22 = swift_slowAlloc();
    *(_DWORD *)unint64_t v12 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_100013F74(a1, a2, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Allowing keyboard focus for %s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v19);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  if (qword_10006ECF0 != -1) {
    swift_once();
  }
  uint64_t v13 = (void *)qword_100070988;
  sub_10000758C(&qword_100070990);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000507D0;
  *(void *)(inited + 32) = v20;
  *(void *)(inited + 40) = a2;
  swift_bridgeObjectRetain();
  sub_10003BD90(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  NSString v16 = String._bridgeToObjectiveC()();
  id v17 = [v13 setExternalSceneIdentities:isa forReason:v16];

  return v17;
}

uint64_t sub_10003C258(char a1, id a2)
{
  id v3 = [a2 identityToken];
  id v4 = [v3 stringRepresentation];

  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;

  if (a1)
  {
    if (qword_10006ECE8 != -1) {
      swift_once();
    }
    swift_beginAccess();
    if (*((void *)off_100070980 + 2))
    {
      swift_bridgeObjectRetain();
      sub_100009020(v5, v7);
      if (v8)
      {
        swift_endAccess();
        return swift_bridgeObjectRelease_n();
      }
      swift_bridgeObjectRelease();
    }
    swift_endAccess();
    id v14 = sub_10003BF34(v5, v7);
    swift_beginAccess();
    if (v14)
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      NSString v16 = off_100070980;
      off_100070980 = (_UNKNOWN *)0x8000000000000000;
      sub_10000C624((uint64_t)v14, v5, v7, isUniquelyReferenced_nonNull_native);
      off_100070980 = v16;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_100009958(v5, v7);
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
    }
    return swift_endAccess();
  }
  else
  {
    if (qword_10006ECE8 != -1) {
      swift_once();
    }
    swift_beginAccess();
    BOOL v10 = off_100070980;
    if (*((void *)off_100070980 + 2))
    {
      swift_bridgeObjectRetain();
      unint64_t v11 = sub_100009020(v5, v7);
      if (v12)
      {
        uint64_t v13 = *(void **)(v10[7] + 8 * v11);
        swift_endAccess();
        swift_unknownObjectRetain();
        swift_bridgeObjectRelease();
        [v13 invalidate];
        swift_unknownObjectRelease();
      }
      else
      {
        swift_endAccess();
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_endAccess();
    }
    swift_beginAccess();
    sub_100009958(v5, v7);
    swift_endAccess();
    swift_bridgeObjectRelease();
    return swift_unknownObjectRelease();
  }
}

uint64_t sub_10003C530(unint64_t *a1, void (*a2)(uint64_t))
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

void *sub_10003C578(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  id v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *id v4 = *a2;
    id v4 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    long long v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    uint64_t v8 = a2[6];
    v4[5] = a2[5];
    v4[6] = v8;
    uint64_t v9 = *(int *)(a3 + 24);
    BOOL v10 = (char *)v4 + v9;
    uint64_t v11 = (uint64_t)a2 + v9;
    uint64_t v12 = type metadata accessor for SceneLayout();
    uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
  }
  return v4;
}

uint64_t sub_10003C6A4(uint64_t a1, uint64_t a2)
{
  sub_10000FCE4(a1);
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for SceneLayout();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t sub_10003C720(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  (**(void (***)(void))(v6 - 8))();
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for SceneLayout();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  return a1;
}

uint64_t *sub_10003C7F4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  sub_100038568(a1, a2);
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for SceneLayout();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_10003C894(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = type metadata accessor for SceneLayout();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t sub_10003C920(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10000FCE4(a1);
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for SceneLayout();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_10003C9C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10003C9D4);
}

uint64_t sub_10003C9D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for SceneLayout();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_10003CA84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003CA98);
}

uint64_t sub_10003CA98(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for SceneLayout();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for SceneConfigurator()
{
  uint64_t result = qword_100070A08;
  if (!qword_100070A08) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10003CB8C()
{
  uint64_t result = type metadata accessor for SceneLayout();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_10003CC2C(void *a1)
{
  id v2 = v1;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  [a1 setInterfaceOrientation:sub_10003E5A0()];
  sub_10003EAA0();
  [a1 setFrame:0.0, 0.0, v8, v9];
  [a1 setInterfaceOrientationMode:2];
  [a1 setDeviceOrientation:sub_10003E5A0()];
  uint64_t v10 = v1[3];
  uint64_t v11 = v2[4];
  sub_10000FC3C(v2, v10);
  [a1 setPreviewMaximumSize:sub_100007DA8(v10, v11)];
  type metadata accessor for SceneConfigurator();
  [a1 setPreviewSceneLayout:sub_10003ED94()];
  sub_10003F00C(a1);
  if (qword_10006ECA0 != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for PreviewShellPluginRegistry();
  sub_10000E620(v12, (uint64_t)qword_100074188);
  swift_beginAccess();
  PreviewShellPluginRegistry.sceneConfigurator.getter();
  swift_endAccess();
  if (v46)
  {
    sub_10000E710(&v45, (uint64_t)v47);
    sub_10000FC3C(v47, v47[3]);
    id v13 = [objc_allocWithZone((Class)PSMutableSceneSettings) initWithSettings:a1];
    dispatch thunk of PreviewShellSceneConfigurator.configure(sceneSettings:for:)();

    sub_10000FCE4((uint64_t)v47);
  }
  else
  {
    sub_10003FEDC((uint64_t)&v45);
  }
  static Logger.uv.getter();
  id v14 = a1;
  uint64_t v15 = Logger.logObject.getter();
  int v16 = static os_log_type_t.debug.getter();
  if (!os_log_type_enabled(v15, (os_log_type_t)v16))
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return;
  }
  HIDWORD(v4sub_10002675C(2, 1) = v16;
  uint64_t v43 = v5;
  uint64_t v44 = v4;
  uint64_t v17 = swift_slowAlloc();
  uint64_t v42 = swift_slowAlloc();
  v47[0] = v42;
  *(_DWORD *)uint64_t v17 = 136316162;
  id v18 = [v14 persistenceIdentifier];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v22 = v21;

    *(void *)&long long v45 = sub_100013F74(v20, v22, v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2080;
    [v14 interfaceOrientation];
    id v23 = (id)BSInterfaceOrientationDescription();
    uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v26 = v25;

    *(void *)&long long v45 = sub_100013F74(v24, v26, v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 22) = 2080;
    [v14 frame];
    id v27 = (id)BSStringFromCGRect();
    if (v27)
    {
      NSString v28 = v27;
      uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v31 = v30;

      *(void *)&long long v45 = sub_100013F74(v29, v31, v47);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 32) = 2080;
      [v14 previewMaximumSize];
      id v32 = (id)BSStringFromCGSize();
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v36 = v35;

        *(void *)&long long v45 = sub_100013F74(v34, v36, v47);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        *(_WORD *)(v17 + 42) = 2080;
        [v14 previewSceneLayout];
        id v37 = (id)UVPreviewSceneLayoutDescription();
        uint64_t v38 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v40 = v39;

        *(void *)&long long v45 = sub_100013F74(v38, v40, v47);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v15, BYTE4(v41), "Configuring scene %s with orientation:%s, frame:%s, maxSize:%s, layout:%s", (uint8_t *)v17, 0x34u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v43 + 8))(v7, v44);
        return;
      }
      goto LABEL_14;
    }
  }
  else
  {

    __break(1u);
  }

  __break(1u);
LABEL_14:

  __break(1u);
}

id sub_10003D27C(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for SceneConfigurator();
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for SceneLayout();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v18 - v11;
  id v13 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v13((char *)&v18 - v11, v1 + *(int *)(v3 + 24), v6);
  int v14 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v12, v6);
  if (v14 == enum case for SceneLayout.device(_:))
  {
    (*(void (**)(char *, uint64_t))(v7 + 96))(v12, v6);
    sub_10003E538(a1 + 48, (uint64_t)v21);
    sub_10003E538((uint64_t)v21, (uint64_t)&v19);
    if (v19) {
      [v19 setHidden:0];
    }
    uint64_t v15 = type metadata accessor for PreviewTraits.Orientation();
    return (id)(*(uint64_t (**)(char *, uint64_t))(*(void *)(v15 - 8) + 8))(v12, v15);
  }
  else if (v14 == enum case for SceneLayout.custom(_:))
  {
    sub_10003E538(a1 + 48, (uint64_t)v21);
    sub_10003E538((uint64_t)v21, (uint64_t)&v19);
    id result = v19;
    if (v19) {
      return [v19 setHidden:1];
    }
  }
  else
  {
    sub_10002C0F4(v1, (uint64_t)v5);
    id v19 = 0;
    unint64_t v20 = 0xE000000000000000;
    _StringGuts.grow(_:)(23);
    swift_bridgeObjectRelease();
    id v19 = (id)0xD000000000000015;
    unint64_t v20 = 0x8000000100057C60;
    v13(v10, (uint64_t)&v5[*(int *)(v3 + 24)], v6);
    v17._countAndFlagsBits = String.init<A>(describing:)();
    String.append(_:)(v17);
    swift_bridgeObjectRelease();
    id result = (id)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t sub_10003D580(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  char v18 = 0;
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = a1;
  v6[3] = a2;
  v6[4] = &v18;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_10003FF8C;
  *(void *)(v7 + 24) = v6;
  int v16 = sub_10003FFA8;
  uint64_t v17 = v7;
  aBlock = _NSConcreteStackBlock;
  unint64_t v13 = 1107296256;
  int v14 = sub_10003FE70;
  uint64_t v15 = &unk_100063BE8;
  uint64_t v8 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  [v3 performUpdate:v8];
  _Block_release(v8);
  LOBYTE(v8) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v8)
  {
    __break(1u);
  }
  else
  {
    if ((v18 & 1) == 0)
    {
      aBlock = 0;
      unint64_t v13 = 0xE000000000000000;
      _StringGuts.grow(_:)(40);
      swift_bridgeObjectRelease();
      aBlock = (void **)0xD000000000000026;
      unint64_t v13 = 0x8000000100057C80;
      id v10 = [v3 settings];
      swift_getObjectType();

      v11._countAndFlagsBits = _typeName(_:qualified:)();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      type metadata accessor for Unreachable();
      sub_10003E370();
      swift_allocError();
      Unreachable.init(_:diagnostics:file:line:column:function:)();
      swift_willThrow();
    }
    return swift_release();
  }
  return result;
}

void sub_10003D7F4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  id v9 = [objc_allocWithZone((Class)FBSMutableSceneDefinition) init];
  swift_bridgeObjectRetain();
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v11 = [self identityForIdentifier:v10];

  [v9 setIdentity:v11];
  id v12 = [self localIdentity];
  [v9 setClientIdentity:v12];

  id v13 = [objc_allocWithZone((Class)type metadata accessor for LocalSceneSpecification()) init];
  [v9 setSpecification:v13];

  id v14 = [v9 specification];
  id v15 = [self parametersForSpecification:v14];

  uint64_t v56 = v4;
  uint64_t v57 = a3;
  uint64_t v61 = a1;
  uint64_t v58 = a1;
  uint64_t v59 = a2;
  sub_10003E100((uint64_t)sub_10003E0F4, (uint64_t)v55);
  if (v5)
  {

    int v16 = v15;
LABEL_3:

    return;
  }
  uint64_t v52 = v4;
  id v17 = [self sharedInstance];
  id v18 = [v17 createSceneWithDefinition:v9 initialParameters:v15];

  if (qword_10006EC80 != -1) {
    swift_once();
  }
  sub_10000FC3C(qword_10006F1B0, qword_10006F1C8);
  uint64_t v53 = v18;
  id v19 = [objc_allocWithZone((Class)PSScene) initWithScene:v18];
  dispatch thunk of PreviewShellSceneBinder.bind(scene:)();

  id v20 = [self sharedInstance];
  id v21 = [v20 fbsSceneForScene:v53];

  if (!v21)
  {
    type metadata accessor for Unreachable();
    sub_10003E370();
    swift_allocError();
    Unreachable.init(_:diagnostics:file:line:column:function:)();
    swift_willThrow();

    int v16 = v53;
    goto LABEL_3;
  }
  id v22 = [v21 windowScene];
  if (!v22)
  {
    type metadata accessor for Unreachable();
    sub_10003E370();
    swift_allocError();
    Unreachable.init(_:diagnostics:file:line:column:function:)();
    swift_willThrow();

    int v16 = v21;
    goto LABEL_3;
  }
  int v16 = v22;
  id v23 = [v22 delegate];
  if (!v23)
  {
    type metadata accessor for Unreachable();
    sub_10003E370();
    swift_allocError();
    Unreachable.init(_:diagnostics:file:line:column:function:)();
    swift_willThrow();

    goto LABEL_3;
  }
  uint64_t v50 = v21;
  id v51 = v23;
  id v49 = [objc_allocWithZone((Class)UIWindow) initWithWindowScene:v16];
  [v49 setHidden:0];
  uint64_t v25 = v52[3];
  uint64_t v24 = v52[4];
  sub_10000FC3C(v52, v25);
  id v27 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v24 + 8))(v25, v24);
  NSString v28 = v26;
  if ((v29 & 1) == 0) {
    goto LABEL_17;
  }
  id v30 = [v26 exclusionArea];
  if (!v30) {
    goto LABEL_17;
  }
  unint64_t v31 = v30;
  self;
  id v32 = (void *)swift_dynamicCastObjCClass();
  if (!v32)
  {

LABEL_17:
    id v42 = 0;
    goto LABEL_18;
  }
  [v32 rect];
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  CGFloat v40 = v39;

  id v41 = objc_allocWithZone((Class)type metadata accessor for ExclusionWindow());
  id v42 = sub_100021540(v16, v34, v36, v38, v40);
LABEL_18:
  uint64_t v43 = sub_10003E3C8();
  v60[0] = v61;
  v60[1] = a2;
  v60[2] = v16;
  v60[3] = v49;
  v60[4] = v43;
  v60[5] = v51;
  v60[6] = v42;
  uint64_t v48 = v43;
  swift_bridgeObjectRetain();
  id v46 = v16;
  id v47 = v42;
  swift_unknownObjectRetain();
  id v44 = v49;
  sub_10003D27C((uint64_t)v60);

  swift_unknownObjectRelease();
  uint64_t v45 = v61;
  *a4 = v53;
  a4[1] = v45;
  a4[2] = a2;
  a4[3] = v46;
  a4[4] = v44;
  a4[5] = v48;
  a4[6] = v51;
  a4[7] = v42;
}

uint64_t sub_10003DF08()
{
  uint64_t v0 = type metadata accessor for SceneLayout();
  sub_100023A7C(v0, qword_1000741D8);
  uint64_t v1 = sub_10000E620(v0, (uint64_t)qword_1000741D8);
  uint64_t v2 = enum case for PreviewTraits.Orientation.portrait(_:);
  uint64_t v3 = type metadata accessor for PreviewTraits.Orientation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104))(v1, v2, v3);
  uint64_t v4 = enum case for SceneLayout.device(_:);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);

  return v5(v1, v4, v0);
}

void sub_10003DFE8(void *a1, void *a2)
{
  uint64_t v3 = a2[3];
  uint64_t v4 = a2[4];
  sub_10000FC3C(a2, v3);
  id v5 = sub_100007DF4(v3, v4);
  [a1 setDisplayConfiguration:v5];

  [a1 setLevel:0.0];
  [a1 setForeground:1];
  NSString v6 = String._bridgeToObjectiveC()();
  NSString v7 = (id)UVSceneIdentifierToPersistenceIdentifier();

  if (!v7)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  [a1 setPersistenceIdentifier:v7];

  sub_10003CC2C(a1);
}

void sub_10003E0F4(void *a1)
{
  sub_10003DFE8(a1, *(void **)(v1 + 16));
}

uint64_t sub_10003E100(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  char v17 = 0;
  NSString v6 = (void *)swift_allocObject();
  v6[2] = a1;
  v6[3] = a2;
  v6[4] = &v17;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_10003FD90;
  *(void *)(v7 + 24) = v6;
  id v15 = sub_10003FDAC;
  uint64_t v16 = v7;
  aBlock = _NSConcreteStackBlock;
  unint64_t v12 = 1107296256;
  id v13 = sub_1000162EC;
  id v14 = &unk_100063B70;
  uint64_t v8 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  [v3 updateSettingsWithBlock:v8];
  _Block_release(v8);
  LOBYTE(v8) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v8)
  {
    __break(1u);
  }
  else
  {
    if ((v17 & 1) == 0)
    {
      aBlock = 0;
      unint64_t v12 = 0xE000000000000000;
      _StringGuts.grow(_:)(40);
      swift_bridgeObjectRelease();
      aBlock = (void **)0xD000000000000026;
      unint64_t v12 = 0x8000000100057C80;

      sub_10000758C(&qword_100070A50);
      v10._countAndFlagsBits = _typeName(_:qualified:)();
      String.append(_:)(v10);
      swift_bridgeObjectRelease();
      type metadata accessor for Unreachable();
      sub_10003E370();
      swift_allocError();
      Unreachable.init(_:diagnostics:file:line:column:function:)();
      swift_willThrow();
    }
    return swift_release();
  }
  return result;
}

unint64_t sub_10003E370()
{
  unint64_t result = qword_10006F130;
  if (!qword_10006F130)
  {
    type metadata accessor for Unreachable();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006F130);
  }
  return result;
}

uint64_t sub_10003E3C8()
{
  uint64_t v1 = v0;
  id v2 = [v0 settings];
  if (v2)
  {
    uint64_t v3 = v2;
    self;
    uint64_t result = swift_dynamicCastObjCClass();
    if (result) {
      return result;
    }
  }
  _StringGuts.grow(_:)(40);
  swift_bridgeObjectRelease();

  sub_10000758C(&qword_100070A50);
  v5._countAndFlagsBits = _typeName(_:qualified:)();
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  type metadata accessor for Unreachable();
  sub_10003E370();
  swift_allocError();
  Unreachable.init(_:diagnostics:file:line:column:function:)();
  return swift_willThrow();
}

uint64_t sub_10003E538(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000758C(&qword_100070A48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10003E5A0()
{
  uint64_t v1 = type metadata accessor for SceneConfigurator();
  __chkstk_darwin(v1);
  uint64_t v33 = (uint64_t)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for PreviewTraits.Orientation();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  CGFloat v36 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  double v35 = (char *)&v31 - v8;
  uint64_t v9 = __chkstk_darwin(v7);
  id v11 = (char *)&v31 - v10;
  __chkstk_darwin(v9);
  id v13 = (char *)&v31 - v12;
  uint64_t v14 = type metadata accessor for SceneLayout();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  id v32 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  id v19 = (char *)&v31 - v18;
  uint64_t v34 = v1;
  uint64_t v20 = v0 + *(int *)(v1 + 24);
  id v22 = (void (*)(char *, char *, uint64_t))(v15 + 16);
  id v21 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v21((char *)&v31 - v18, v20, v14);
  int v23 = (*(uint64_t (**)(char *, uint64_t))(v15 + 88))(v19, v14);
  if (v23 == enum case for SceneLayout.device(_:))
  {
    (*(void (**)(char *, uint64_t))(v15 + 96))(v19, v14);
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v13, v19, v3);
    id v22 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
    v22(v11, v13, v3);
    int v24 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v11, v3);
    if (v24 == enum case for PreviewTraits.Orientation.portrait(_:))
    {
      uint64_t v25 = 1;
    }
    else if (v24 == enum case for PreviewTraits.Orientation.portraitUpsideDown(_:))
    {
      uint64_t v25 = 2;
    }
    else if (v24 == enum case for PreviewTraits.Orientation.landscapeLeft(_:))
    {
      uint64_t v25 = 4;
    }
    else
    {
      if (v24 != enum case for PreviewTraits.Orientation.landscapeRight(_:))
      {
        while (1)
        {
          char v29 = v35;
          v22(v35, v13, v3);
          unint64_t v37 = 0;
          unint64_t v38 = 0xE000000000000000;
          _StringGuts.grow(_:)(23);
          swift_bridgeObjectRelease();
          unint64_t v37 = 0xD000000000000015;
          unint64_t v38 = 0x8000000100057D50;
          v22(v36, v29, v3);
          v30._countAndFlagsBits = String.init<A>(describing:)();
          String.append(_:)(v30);
          swift_bridgeObjectRelease();
LABEL_15:
          _assertionFailure(_:_:file:line:flags:)();
          __break(1u);
        }
      }
      uint64_t v25 = 3;
    }
    (*(void (**)(char *, uint64_t))(v4 + 8))(v13, v3);
  }
  else
  {
    if (v23 != enum case for SceneLayout.custom(_:))
    {
      uint64_t v27 = v33;
      sub_10002C0F4(v0, v33);
      unint64_t v37 = 0;
      unint64_t v38 = 0xE000000000000000;
      _StringGuts.grow(_:)(23);
      swift_bridgeObjectRelease();
      unint64_t v37 = 0xD000000000000015;
      unint64_t v38 = 0x8000000100057C60;
      v21(v32, v27 + *(int *)(v34 + 24), v14);
      v28._countAndFlagsBits = String.init<A>(describing:)();
      String.append(_:)(v28);
      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
    return 1;
  }
  return v25;
}

uint64_t sub_10003EAA0()
{
  uint64_t v1 = type metadata accessor for SceneConfigurator();
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for SceneLayout();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v18 - v9;
  id v11 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  v11((char *)&v18 - v9, &v0[*(int *)(v1 + 24)], v4);
  int v12 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v10, v4);
  if (v12 == enum case for SceneLayout.device(_:))
  {
    (*(void (**)(char *, uint64_t))(v5 + 96))(v10, v4);
    uint64_t v13 = *((void *)v0 + 3);
    uint64_t v14 = *((void *)v0 + 4);
    sub_10000FC3C(v0, v13);
    sub_100007DA8(v13, v14);
    uint64_t v15 = type metadata accessor for PreviewTraits.Orientation();
    return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v15 - 8) + 8))(v10, v15);
  }
  else if (v12 == enum case for SceneLayout.custom(_:))
  {
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 96))(v10, v4);
  }
  else
  {
    sub_10002C0F4((uint64_t)v0, (uint64_t)v3);
    unint64_t v18 = 0;
    unint64_t v19 = 0xE000000000000000;
    _StringGuts.grow(_:)(23);
    swift_bridgeObjectRelease();
    unint64_t v18 = 0xD000000000000015;
    unint64_t v19 = 0x8000000100057C60;
    v11(v8, &v3[*(int *)(v1 + 24)], v4);
    v17._countAndFlagsBits = String.init<A>(describing:)();
    String.append(_:)(v17);
    swift_bridgeObjectRelease();
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t sub_10003ED94()
{
  uint64_t v1 = type metadata accessor for SceneLayout();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v8 = (char *)&v16 - v7;
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v16 - v9;
  id v11 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  v11((char *)&v16 - v9, v0, v1);
  int v12 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v10, v1);
  if (v12 == enum case for SceneLayout.device(_:))
  {
    (*(void (**)(char *, uint64_t))(v2 + 96))(v10, v1);
    uint64_t v13 = type metadata accessor for PreviewTraits.Orientation();
    (*(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8))(v10, v13);
    return 0;
  }
  else if (v12 == enum case for SceneLayout.custom(_:))
  {
    return 1;
  }
  else
  {
    v11(v8, v0, v1);
    unint64_t v16 = 0;
    unint64_t v17 = 0xE000000000000000;
    _StringGuts.grow(_:)(23);
    swift_bridgeObjectRelease();
    unint64_t v16 = 0xD000000000000015;
    unint64_t v17 = 0x8000000100057C60;
    v11(v5, (uint64_t)v8, v1);
    v15._countAndFlagsBits = String.init<A>(describing:)();
    String.append(_:)(v15);
    swift_bridgeObjectRelease();
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

void sub_10003F00C(id a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = type metadata accessor for SceneConfigurator();
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v90 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for SceneLayout();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  int v12 = (char *)&v90 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v90 = (char *)&v90 - v13;
  if (v1[1].type)
  {
    swift_bridgeObjectRetain();
    NSString v14 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v15 = [self applicationProxyForIdentifier:v14];

    if (v15)
    {
      id v16 = [v15 appState];
      if (!v16)
      {
        __break(1u);
        goto LABEL_73;
      }
      unint64_t v17 = v16;
      unsigned int v18 = [v16 isValid];

      if (v18)
      {
        uint64_t v93 = (char *)[objc_allocWithZone((Class)type metadata accessor for ApplicationInfo()) initWithApplicationProxy:v15];

        goto LABEL_8;
      }
    }
  }
  uint64_t v93 = 0;
LABEL_8:
  uint64_t v2 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  unint64_t v19 = v90;
  v2(v90, (char *)v3 + *(int *)(v5 + 24), v8);
  int v20 = (*(uint64_t (**)(char *, uint64_t))(v9 + 88))(v19, v8);
  if (v20 == enum case for SceneLayout.device(_:))
  {
    (*(void (**)(char *, uint64_t))(v9 + 96))(v19, v8);
    uint64_t v21 = *(void *)&v3->align;
    offs = v3[1].offs;
    sub_10000FC3C(v3, v21);
    int v23 = (void *)(*((uint64_t (**)(uint64_t, int32_t *))offs + 1))(v21, offs);
    uint64_t v25 = v24;
    [v23 deviceInfoFloatValueForKey:UISDeviceContextDeviceCornerRadiusKey];
    double v27 = v26;

    id v28 = [objc_allocWithZone((Class)BSCornerRadiusConfiguration) initWithCornerRadius:v27];
    [a1 setCornerRadiusConfiguration:v28];

    uint64_t v29 = *(void *)&v3->align;
    Swift::String v30 = v3[1].offs;
    sub_10000FC3C(v3, v29);
    uint64_t v31 = (void *)(*((uint64_t (**)(uint64_t, int32_t *))v30 + 1))(v29, v30);
    uint64_t v33 = v32;
    id v34 = [v32 displayEdgeInfo];
    if (!v34) {
      id v34 = [objc_allocWithZone((Class)UISApplicationSupportDisplayEdgeInfo) init];
    }

    sub_10003F9E8(a1);
    int v12 = v93;
    if (qword_10006ED00 != -1) {
      goto LABEL_71;
    }
    goto LABEL_12;
  }
  if (v20 != enum case for SceneLayout.custom(_:))
  {
LABEL_73:
    sub_10002C0F4((uint64_t)v3, (uint64_t)v7);
    unint64_t v96 = 0;
    unint64_t v97 = 0xE000000000000000;
    _StringGuts.grow(_:)(23);
    swift_bridgeObjectRelease();
    unint64_t v96 = 0xD000000000000015;
    unint64_t v97 = 0x8000000100057C60;
    v2(v12, &v7[*(int *)(v5 + 24)], v8);
    v89._countAndFlagsBits = String.init<A>(describing:)();
    String.append(_:)(v89);
    swift_bridgeObjectRelease();
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return;
  }
  id v61 = [objc_allocWithZone((Class)BSCornerRadiusConfiguration) initWithCornerRadius:0.0];
  [a1 setCornerRadiusConfiguration:v61];

  id v62 = [objc_allocWithZone((Class)UISApplicationSupportDisplayEdgeInfo) init];
  sub_10003F9E8(a1);

  if (qword_10006ED00 != -1) {
    swift_once();
  }
  uint64_t v63 = off_1000709A8;
  uint64_t v64 = (char *)off_1000709A8 + 64;
  uint64_t v65 = 1 << *((unsigned char *)off_1000709A8 + 32);
  uint64_t v66 = -1;
  if (v65 < 64) {
    uint64_t v66 = ~(-1 << v65);
  }
  unint64_t v67 = v66 & *((void *)off_1000709A8 + 8);
  int64_t v68 = (unint64_t)(v65 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v69 = 0;
  uint64_t v3 = &stru_10006D000;
  uint64_t v70 = v93;
  while (1)
  {
    if (v67)
    {
      unint64_t v71 = __clz(__rbit64(v67));
      v67 &= v67 - 1;
      unint64_t v72 = v71 | (v69 << 6);
      goto LABEL_46;
    }
    int64_t v73 = v69 + 1;
    if (__OFADD__(v69, 1))
    {
LABEL_68:
      __break(1u);
LABEL_69:
      __break(1u);
      goto LABEL_70;
    }
    if (v73 >= v68) {
      goto LABEL_66;
    }
    unint64_t v74 = *(void *)&v64[8 * v73];
    ++v69;
    if (!v74)
    {
      int64_t v69 = v73 + 1;
      if (v73 + 1 >= v68) {
        goto LABEL_66;
      }
      unint64_t v74 = *(void *)&v64[8 * v69];
      if (!v74)
      {
        int64_t v69 = v73 + 2;
        if (v73 + 2 >= v68) {
          goto LABEL_66;
        }
        unint64_t v74 = *(void *)&v64[8 * v69];
        if (!v74) {
          break;
        }
      }
    }
LABEL_61:
    unint64_t v67 = (v74 - 1) & v74;
    unint64_t v72 = __clz(__rbit64(v74)) + (v69 << 6);
LABEL_46:
    [a1 setDefaultStatusBarHeight:*(void *)(v63[6] + 8 * v72) forOrientation:0.0 v90];
  }
  int64_t v75 = v73 + 3;
  if (v75 >= v68)
  {
LABEL_66:
    swift_release();
    [a1 setStatusBarHeight:0.0];

    return;
  }
  unint64_t v74 = *(void *)&v64[8 * v75];
  if (v74)
  {
    int64_t v69 = v75;
    goto LABEL_61;
  }
  while (1)
  {
    int64_t v69 = v75 + 1;
    if (__OFADD__(v75, 1)) {
      break;
    }
    if (v69 >= v68) {
      goto LABEL_66;
    }
    unint64_t v74 = *(void *)&v64[8 * v69];
    ++v75;
    if (v74) {
      goto LABEL_61;
    }
  }
LABEL_70:
  __break(1u);
LABEL_71:
  swift_once();
LABEL_12:
  double v35 = off_1000709A8;
  uint64_t v36 = *((void *)off_1000709A8 + 8);
  uint64_t v92 = (char *)off_1000709A8 + 64;
  uint64_t v37 = 1 << *((unsigned char *)off_1000709A8 + 32);
  uint64_t v38 = -1;
  if (v37 < 64) {
    uint64_t v38 = ~(-1 << v37);
  }
  unint64_t v39 = v38 & v36;
  int64_t v94 = (unint64_t)(v37 + 63) >> 6;
  uint64_t v91 = UISDeviceContextDeviceIdiomKey;
  swift_bridgeObjectRetain();
  int64_t v40 = 0;
  id v95 = a1;
  while (2)
  {
    if (v39)
    {
      unint64_t v44 = __clz(__rbit64(v39));
      v39 &= v39 - 1;
      unint64_t v45 = v44 | (v40 << 6);
LABEL_36:
      uint64_t v49 = 8 * v45;
      uint64_t v50 = *(void *)(v35[6] + v49);
      double v43 = *(double *)(v35[7] + v49);
      if (v12)
      {
        uint64_t v51 = *(void *)&v3->align;
        uint64_t v52 = (uint64_t)v3[1].offs;
        sub_10000FC3C(v3, v51);
        uint64_t v53 = v12;
        id v54 = sub_100007DF4(v51, v52);
        uint64_t v56 = *(void *)&v3->align;
        unint64_t v55 = v3[1].offs;
        sub_10000FC3C(v3, v56);
        uint64_t v57 = (void *)(*((uint64_t (**)(uint64_t, int32_t *))v55 + 1))(v56, v55);
        uint64_t v59 = v58;
        uint64_t v60 = (char *)[v57 deviceInfoIntegerValueForKey:v91];

        if ((unint64_t)(v60 - 1) < 7) {
          uint64_t v41 = qword_100051510[(void)(v60 - 1)];
        }
        else {
          uint64_t v41 = -1;
        }

        unsigned int v42 = [v53 statusBarForcedHiddenForInterfaceOrientation:v50 onDisplay:v54 withUserInterfaceIdiom:v41];
        if (v42) {
          double v43 = 0.0;
        }
        int v12 = v93;
      }
      a1 = v95;
      [v95 setDefaultStatusBarHeight:v50 forOrientation:v43];
      continue;
    }
    break;
  }
  int64_t v46 = v40 + 1;
  if (__OFADD__(v40, 1))
  {
    __break(1u);
    goto LABEL_68;
  }
  if (v46 >= v94) {
    goto LABEL_62;
  }
  unint64_t v47 = *(void *)&v92[8 * v46];
  ++v40;
  if (v47) {
    goto LABEL_35;
  }
  int64_t v40 = v46 + 1;
  if (v46 + 1 >= v94) {
    goto LABEL_62;
  }
  unint64_t v47 = *(void *)&v92[8 * v40];
  if (v47) {
    goto LABEL_35;
  }
  int64_t v40 = v46 + 2;
  if (v46 + 2 >= v94) {
    goto LABEL_62;
  }
  unint64_t v47 = *(void *)&v92[8 * v40];
  if (v47)
  {
LABEL_35:
    unint64_t v39 = (v47 - 1) & v47;
    unint64_t v45 = __clz(__rbit64(v47)) + (v40 << 6);
    goto LABEL_36;
  }
  int64_t v48 = v46 + 3;
  if (v48 < v94)
  {
    unint64_t v47 = *(void *)&v92[8 * v48];
    if (!v47)
    {
      while (1)
      {
        int64_t v40 = v48 + 1;
        if (__OFADD__(v48, 1)) {
          goto LABEL_69;
        }
        if (v40 >= v94) {
          goto LABEL_62;
        }
        unint64_t v47 = *(void *)&v92[8 * v40];
        ++v48;
        if (v47) {
          goto LABEL_35;
        }
      }
    }
    int64_t v40 = v48;
    goto LABEL_35;
  }
LABEL_62:
  swift_release();
  if (!v12) {
    goto LABEL_64;
  }
  uint64_t v76 = v12;
  uint64_t v77 = sub_10003E5A0();
  uint64_t v78 = *(void *)&v3->align;
  uint64_t v79 = (uint64_t)v3[1].offs;
  sub_10000FC3C(v3, v78);
  id v80 = sub_100007DF4(v78, v79);
  uint64_t v81 = *(void *)&v3->align;
  unint64_t v82 = v3[1].offs;
  sub_10000FC3C(v3, v81);
  uint64_t v83 = (*((uint64_t (**)(uint64_t, int32_t *))v82 + 1))(v81, v82);
  uint64_t v85 = v84;
  uint64_t v86 = sub_1000082A4((void *)v83);

  LOBYTE(v83) = [v76 statusBarHiddenForInterfaceOrientation:v77 onDisplay:v80 withUserInterfaceIdiom:v86];
  double v87 = 0.0;
  if ((v83 & 1) == 0) {
LABEL_64:
  }
    [a1 defaultStatusBarHeightForOrientation:sub_10003E5A0()];
  [a1 setStatusBarHeight:v87, v90];

  uint64_t v88 = type metadata accessor for PreviewTraits.Orientation();
  (*(void (**)(char *, uint64_t))(*(void *)(v88 - 8) + 8))(v90, v88);
}

id sub_10003F9E8(void *a1)
{
  id v3 = [v1 safeAreaInsetsPortrait];
  UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [a1 setSafeAreaInsetsPortrait:v5, v7, v9, v11];
  id v12 = [v1 peripheryInsets];
  UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper();
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  [a1 setPeripheryInsets:v14, v16, v18, v20];
  id v21 = [v1 homeAffordanceOverlayAllowance];
  if (v21)
  {
    id v22 = v21;
    [v21 doubleValue];
    double v24 = v23;
  }
  else
  {
    double v24 = 0.0;
  }

  return [a1 setHomeAffordanceOverlayAllowance:v24];
}

void *sub_10003FB24()
{
  uint64_t result = sub_10003FB44();
  off_1000709A8 = result;
  return result;
}

void *sub_10003FB44()
{
  sub_10003FF3C();
  uint64_t ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  unint64_t v1 = 0;
  while (v1 < 4)
  {
    Swift::UInt v2 = (Swift::UInt)*(&off_100062628 + v1 + 4);
    [ObjCClassFromMetadata heightForStyle:0 orientation:v2];
    uint64_t v4 = v3;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v7 = sub_1000093A8(v2);
    uint64_t v8 = _swiftEmptyDictionarySingleton[2];
    BOOL v9 = (v6 & 1) == 0;
    uint64_t v10 = v8 + v9;
    if (__OFADD__(v8, v9)) {
      goto LABEL_18;
    }
    char v11 = v6;
    if (_swiftEmptyDictionarySingleton[3] >= v10)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v6) {
          goto LABEL_2;
        }
      }
      else
      {
        sub_10000DD38();
        if (v11) {
          goto LABEL_2;
        }
      }
    }
    else
    {
      sub_10000B734(v10, isUniquelyReferenced_nonNull_native);
      unint64_t v12 = sub_1000093A8(v2);
      if ((v11 & 1) != (v13 & 1)) {
        goto LABEL_20;
      }
      unint64_t v7 = v12;
      if (v11)
      {
LABEL_2:
        *(void *)(_swiftEmptyDictionarySingleton[7] + 8 * v7) = v4;
        goto LABEL_3;
      }
    }
    _swiftEmptyDictionarySingleton[(v7 >> 6) + 8] |= 1 << v7;
    uint64_t v14 = 8 * v7;
    *(void *)(_swiftEmptyDictionarySingleton[6] + v14) = v2;
    *(void *)(_swiftEmptyDictionarySingleton[7] + v14) = v4;
    uint64_t v15 = _swiftEmptyDictionarySingleton[2];
    BOOL v16 = __OFADD__(v15, 1);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_19;
    }
    _swiftEmptyDictionarySingleton[2] = v17;
LABEL_3:
    ++v1;
    swift_bridgeObjectRelease();
    if (v1 == 4) {
      return _swiftEmptyDictionarySingleton;
    }
  }
  __break(1u);
LABEL_18:
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  type metadata accessor for UIInterfaceOrientation(0);
  uint64_t result = (void *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

void sub_10003FD04(void *a1, void (*a2)(uint64_t), uint64_t a3, unsigned char *a4)
{
  self;
  uint64_t v7 = swift_dynamicCastObjCClass();
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = a1;
    a2(v8);

    *a4 = 1;
  }
}

uint64_t sub_10003FD80()
{
  return _swift_deallocObject(v0, 40, 7);
}

void sub_10003FD90(void *a1)
{
  sub_10003FD04(a1, *(void (**)(uint64_t))(v1 + 16), *(void *)(v1 + 24), *(unsigned char **)(v1 + 32));
}

uint64_t sub_10003FD9C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10003FDAC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10003FDD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10003FDE4()
{
  return swift_release();
}

void sub_10003FDEC(void *a1, uint64_t a2, void (*a3)(uint64_t, uint64_t), uint64_t a4, unsigned char *a5)
{
  self;
  uint64_t v9 = swift_dynamicCastObjCClass();
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = a1;
    a3(v10, a2);

    *a5 = 1;
  }
}

void sub_10003FE70(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void (**)(id, id))(a1 + 32);
  id v6 = a2;
  id v5 = a3;
  v4(v6, v5);
}

uint64_t sub_10003FEDC(uint64_t a1)
{
  uint64_t v2 = sub_10000758C(&qword_100070A58);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10003FF3C()
{
  unint64_t result = qword_100070A60;
  if (!qword_100070A60)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100070A60);
  }
  return result;
}

uint64_t sub_10003FF7C()
{
  return _swift_deallocObject(v0, 40, 7);
}

void sub_10003FF8C(void *a1, uint64_t a2)
{
  sub_10003FDEC(a1, a2, *(void (**)(uint64_t, uint64_t))(v2 + 16), *(void *)(v2 + 24), *(unsigned char **)(v2 + 32));
}

uint64_t sub_10003FF98()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10003FFA8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10004006C(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t result = __chkstk_darwin(v3);
  uint64_t v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)&v1[OBJC_IVAR____TtC12PreviewShell13SceneDelegate_windowScene];
  if (v8) {
    BOOL v9 = v8 == a1;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    static Logger.uv.getter();
    uint64_t v10 = v1;
    id v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v26 = a1;
      char v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      uint64_t v30 = v25;
      *(_DWORD *)char v13 = 136446210;
      double v27 = v10;
      type metadata accessor for SceneDelegate();
      double v24 = v10;
      sub_10000758C(&qword_100070C40);
      if (!swift_dynamicCast())
      {

        goto LABEL_14;
      }
      v23[1] = v13 + 4;
      sub_10000E710(v28, (uint64_t)v31);
      uint64_t v15 = v32;
      uint64_t v14 = v33;
      sub_10000FC3C(v31, v32);
      uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v15, v14);
      unint64_t v18 = v17;
      sub_10000FCE4((uint64_t)v31);
      v31[0] = sub_100013F74(v16, v18, &v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      double v19 = v24;

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "%{public}s will enter foreground", v13, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
      a1 = v26;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    }
    uint64_t v30 = (uint64_t)v10;
    type metadata accessor for SceneDelegate();
    double v20 = v10;
    sub_10000758C(&qword_100070C40);
    if (swift_dynamicCast())
    {
      sub_10000E710(v28, (uint64_t)v31);
      uint64_t v21 = v32;
      uint64_t v22 = v33;
      sub_10000FC3C(v31, v32);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 24))(a1, v21, v22);
      return sub_10000FCE4((uint64_t)v31);
    }
LABEL_14:
    uint64_t v29 = 0;
    memset(v28, 0, sizeof(v28));
    sub_100044C9C((uint64_t)v28);
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t sub_100040480(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t result = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)&v1[OBJC_IVAR____TtC12PreviewShell13SceneDelegate_windowScene];
  if (v8) {
    BOOL v9 = v8 == a1;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    static Logger.uv.getter();
    uint64_t v10 = v1;
    id v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v11, v12))
    {
      char v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      uint64_t v28 = v21;
      *(_DWORD *)char v13 = 136446210;
      double v24 = v10;
      type metadata accessor for SceneDelegate();
      double v20 = v10;
      sub_10000758C(&qword_100070C40);
      if (!swift_dynamicCast())
      {

        uint64_t v23 = 0;
        memset(v22, 0, sizeof(v22));
        sub_100044C9C((uint64_t)v22);
        uint64_t result = _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
        return result;
      }
      sub_10000E710(v22, (uint64_t)v25);
      uint64_t v15 = v26;
      uint64_t v14 = v27;
      sub_10000FC3C(v25, v26);
      uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v15, v14);
      unint64_t v18 = v17;
      sub_10000FCE4((uint64_t)v25);
      v25[0] = sub_100013F74(v16, v18, &v28);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      double v19 = v20;

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "%{public}s did enter background", v13, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
  return result;
}

uint64_t sub_1000407F0(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t result = __chkstk_darwin(v3);
  uint64_t v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)&v1[OBJC_IVAR____TtC12PreviewShell13SceneDelegate_windowScene];
  if (v8) {
    BOOL v9 = v8 == a1;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    static Logger.uv.getter();
    uint64_t v10 = v1;
    id v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v26 = a1;
      char v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      uint64_t v30 = v25;
      *(_DWORD *)char v13 = 136446210;
      uint64_t v27 = v10;
      type metadata accessor for SceneDelegate();
      double v24 = v10;
      sub_10000758C(&qword_100070C40);
      if (!swift_dynamicCast())
      {

        goto LABEL_14;
      }
      v23[1] = v13 + 4;
      sub_10000E710(v28, (uint64_t)v31);
      uint64_t v15 = v32;
      uint64_t v14 = v33;
      sub_10000FC3C(v31, v32);
      uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v15, v14);
      unint64_t v18 = v17;
      sub_10000FCE4((uint64_t)v31);
      v31[0] = sub_100013F74(v16, v18, &v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      double v19 = v24;

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "%{public}s did disconnect", v13, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
      a1 = v26;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    }
    uint64_t v30 = (uint64_t)v10;
    type metadata accessor for SceneDelegate();
    double v20 = v10;
    sub_10000758C(&qword_100070C40);
    if (swift_dynamicCast())
    {
      sub_10000E710(v28, (uint64_t)v31);
      uint64_t v21 = v32;
      uint64_t v22 = v33;
      sub_10000FC3C(v31, v32);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 40))(a1, v21, v22);
      return sub_10000FCE4((uint64_t)v31);
    }
LABEL_14:
    uint64_t v29 = 0;
    memset(v28, 0, sizeof(v28));
    sub_100044C9C((uint64_t)v28);
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

id sub_100040D20()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return [super dealloc];
}

uint64_t type metadata accessor for SceneDelegate()
{
  return self;
}

uint64_t sub_100040E1C(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = (objc_class *)type metadata accessor for MainViewController();
  id v7 = [objc_allocWithZone(v6) init];
  v23[3] = v6;
  v23[4] = sub_1000449A0(&qword_100070BF8, (void (*)(uint64_t))type metadata accessor for MainViewController);
  v23[0] = v7;
  type metadata accessor for MainScene(0);
  swift_allocObject();
  id v8 = a1;
  BOOL v9 = (char *)v7;
  id v10 = a2;
  uint64_t v11 = sub_1000487EC(v8, (uint64_t)v23, (uint64_t)v10);

  if (qword_10006ECD0 != -1) {
    swift_once();
  }
  uint64_t v12 = qword_1000741A0;
  uint64_t v13 = swift_retain();
  uint64_t v14 = sub_1000429E4(v13, v12);
  swift_release();
  *(void *)&v9[OBJC_IVAR____TtC12PreviewShell18MainViewController_previewCanvas] = v14;
  swift_retain_n();
  swift_release();
  sub_1000263D4();
  swift_release();
  id v15 = [objc_allocWithZone((Class)UIWindow) initWithWindowScene:v8];
  sub_100044CFC(0, &qword_100070C00);
  id v16 = v15;
  unint64_t v17 = (void *)static UIColor.shellTintColor.getter();
  [v16 setTintColor:v17];

  [v16 setRootViewController:v9];
  [v16 makeKeyAndVisible];
  unint64_t v18 = *(void **)(v3 + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_window);
  *(void *)(v3 + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_window) = v16;
  id v19 = v16;

  double v20 = *(void **)(v3 + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_mainViewController);
  *(void *)(v3 + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_mainViewController) = v9;
  uint64_t v21 = v9;

  *(void *)(v3 + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_previewShellScene) = v11;
  swift_retain();
  swift_release();
  if ((unint64_t)[v8 activationState] <= 1) {
    sub_1000437AC();
  }
  swift_release();

  return swift_release();
}

void sub_1000410CC(void *a1, void *a2)
{
  uint64_t v5 = type metadata accessor for SceneSettingsUpdate();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = [a2 animationFence];

  if (v9)
  {
    id v10 = [a2 animationSettings];

    if (!v10 && a2 != 0)
    {
      id v12 = [self settingsWithDuration:0.3];
      [a2 setAnimationSettings:v12];
    }
  }
  id v13 = [a1 copyRemovingTargetOfEventDeferringEnvironments];
  uint64_t v14 = *(void *)(v2 + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_previewShellScene);
  if (v14)
  {
    id v20 = v13;
    id v15 = objc_allocWithZone((Class)PSSceneSettings);
    swift_retain();
    [v15 initWithSettings:v20];
    id v16 = a2;
    SceneSettingsUpdate.init(sceneSettings:transitionContext:)();
    uint64_t v17 = SceneSettingsUpdate.sceneSettings.getter();
    unint64_t v18 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v17;

    swift_retain();
    EventStream.Sink.send(_:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    swift_release();
  }
  else
  {
  }
}

uint64_t sub_10004130C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for SceneSettingsUpdate();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  [objc_allocWithZone((Class)PSSceneSettings) initWithSettings:a1];
  id v12 = a2;
  SceneSettingsUpdate.init(sceneSettings:transitionContext:)();
  (*(void (**)(char *, uint64_t, uint64_t))(a4 + 40))(v11, a3, a4);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_10004149C()
{
  return swift_release();
}

uint64_t type metadata accessor for DeviceMainSceneDelegate()
{
  return self;
}

unint64_t sub_10004156C()
{
  return 0xD000000000000011;
}

uint64_t sub_100041588(void *a1, void *a2)
{
  return sub_100040E1C(a1, a2);
}

void sub_1000415AC()
{
}

void sub_1000415D0(void *a1, void *a2)
{
}

uint64_t sub_1000415F4()
{
  return sub_1000442E0();
}

void sub_100041670(void *a1, void *a2)
{
  uint64_t v3 = v2;
  type metadata accessor for MainScene(0);
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v18 = 0;
  swift_allocObject();
  id v6 = a1;
  id v7 = a2;
  uint64_t v8 = sub_1000487EC(v6, (uint64_t)&v16, (uint64_t)v7);

  if (qword_10006ECD0 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_1000741A0;
  uint64_t v10 = swift_retain();
  uint64_t v11 = sub_1000429E4(v10, v9);
  swift_release();
  id v12 = objc_allocWithZone((Class)UIWindow);
  id v13 = [v12 initWithWindowScene:v6, v16, v17, v18];
  [v13 setRootViewController:*(void *)(v11 + 24)];
  id v14 = v13;
  [v14 setHidden:0];

  swift_release();
  *(void *)(v3 + OBJC_IVAR____TtC12PreviewShell26SimulatorMainSceneDelegate_previewShellScene) = v8;
  swift_release();
  id v15 = *(void **)(v3 + OBJC_IVAR____TtC12PreviewShell26SimulatorMainSceneDelegate_window);
  *(void *)(v3 + OBJC_IVAR____TtC12PreviewShell26SimulatorMainSceneDelegate_window) = v14;
}

uint64_t sub_1000417E0(uint64_t a1, void *a2)
{
  uint64_t v5 = type metadata accessor for SceneSettingsUpdate();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t result = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(v2 + OBJC_IVAR____TtC12PreviewShell26SimulatorMainSceneDelegate_previewShellScene);
  if (v10)
  {
    id v11 = objc_allocWithZone((Class)PSSceneSettings);
    swift_retain();
    [v11 initWithSettings:a1];
    id v12 = a2;
    SceneSettingsUpdate.init(sceneSettings:transitionContext:)();
    uint64_t v13 = SceneSettingsUpdate.sceneSettings.getter();
    id v14 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v13;

    swift_retain();
    EventStream.Sink.send(_:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    return swift_release();
  }
  return result;
}

uint64_t sub_100041950()
{
  return sub_10004221C(&OBJC_IVAR____TtC12PreviewShell26SimulatorMainSceneDelegate_window);
}

uint64_t type metadata accessor for SimulatorMainSceneDelegate()
{
  return self;
}

unint64_t sub_10004199C()
{
  return 0xD000000000000014;
}

void sub_1000419B8(void *a1, void *a2)
{
}

uint64_t sub_1000419DC(uint64_t a1, void *a2)
{
  return sub_1000417E0(a1, a2);
}

uint64_t sub_100041A00()
{
  return sub_100044734();
}

uint64_t sub_100041A74()
{
  return swift_unknownObjectRelease();
}

uint64_t type metadata accessor for LocalSceneDelegate()
{
  return self;
}

uint64_t sub_100041ABC(uint64_t result, void *a2)
{
  uint64_t v3 = (void *)(*v2 + OBJC_IVAR____TtC12PreviewShell18LocalSceneDelegate_previewShellScene);
  if (*v3)
  {
    uint64_t v5 = result;
    uint64_t v6 = v3[1];
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v8 = *(void *)(v6 + 8);
    swift_unknownObjectRetain();
    sub_10004130C(v5, a2, ObjectType, v8);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_100041B60()
{
  return sub_1000441CC();
}

void sub_100041BDC(void *a1, void *a2)
{
  uint64_t v3 = v2;
  id v6 = [a1 _sceneIdentifier];
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;

  type metadata accessor for HostInjectedScene(0);
  swift_allocObject();
  id v10 = a1;
  id v11 = sub_100046468(v7, v9, v10, a2);
  if (qword_10006ECD0 != -1) {
    swift_once();
  }
  uint64_t v12 = qword_1000741A0;
  uint64_t v13 = swift_retain();
  uint64_t v14 = sub_100042398(v13, v12);
  swift_release();
  id v15 = [objc_allocWithZone((Class)UVInjectedSceneWindow) initWithWindowScene:v10];
  [v15 setHidden:0];
  long long v16 = *(void **)(v14 + 24);
  id v17 = v15;
  id v18 = v16;
  [v17 setRootViewController:v18];

  swift_release();
  *(void *)(v3 + OBJC_IVAR____TtC12PreviewShell21InjectedSceneDelegate_previewShellScene) = v11;
  swift_release();
  uint64_t v19 = *(void **)(v3 + OBJC_IVAR____TtC12PreviewShell21InjectedSceneDelegate_window);
  *(void *)(v3 + OBJC_IVAR____TtC12PreviewShell21InjectedSceneDelegate_window) = v17;
}

uint64_t sub_100041D6C(uint64_t a1, void *a2)
{
  uint64_t v5 = type metadata accessor for SceneSettingsUpdate();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t result = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(v2 + OBJC_IVAR____TtC12PreviewShell21InjectedSceneDelegate_previewShellScene);
  if (v10)
  {
    id v11 = objc_allocWithZone((Class)PSSceneSettings);
    swift_retain();
    [v11 initWithSettings:a1];
    id v12 = a2;
    SceneSettingsUpdate.init(sceneSettings:transitionContext:)();
    uint64_t v13 = SceneSettingsUpdate.sceneSettings.getter();
    uint64_t v14 = *(void **)(v10 + 56);
    *(void *)(v10 + 56) = v13;

    swift_retain();
    EventStream.Sink.send(_:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    return swift_release();
  }
  return result;
}

uint64_t sub_100041EC8(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = OBJC_IVAR____TtC12PreviewShell21InjectedSceneDelegate_window;
  uint64_t v5 = *(void **)(v2 + OBJC_IVAR____TtC12PreviewShell21InjectedSceneDelegate_window);
  if (v5)
  {
    [v5 setHidden:1];
    uint64_t v6 = *(void **)(v2 + v4);
  }
  else
  {
    uint64_t v6 = 0;
  }
  *(void *)(v2 + v4) = 0;

  uint64_t v7 = OBJC_IVAR____TtC12PreviewShell21InjectedSceneDelegate_previewShellScene;
  if (*(void *)(v2 + OBJC_IVAR____TtC12PreviewShell21InjectedSceneDelegate_previewShellScene))
  {
    uint64_t v18 = *(void *)(v2 + OBJC_IVAR____TtC12PreviewShell21InjectedSceneDelegate_previewShellScene);
    uint64_t v16 = type metadata accessor for HostInjectedScene(0);
    uint64_t v17 = sub_1000449A0(&qword_100070C28, (void (*)(uint64_t))type metadata accessor for HostInjectedScene);
    LOBYTE(v15) = 2;
    Invalidatable.invalidate(dsoHandle:file:line:column:function:)();
  }
  *(void *)(v2 + v7) = 0;
  swift_release();
  if (qword_10006ECD0 != -1) {
    swift_once();
  }
  uint64_t v8 = qword_1000741A0;
  id v9 = [a1 _sceneIdentifier:v15, v16, v17, v18];
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;

  swift_beginAccess();
  if (*(void *)(*(void *)(v8 + 16) + 16))
  {
    swift_bridgeObjectRetain();
    sub_100009240(v10, v12);
    if (v13)
    {
      swift_endAccess();
      swift_retain();
      swift_bridgeObjectRelease();
      type metadata accessor for HostedPreviewCanvas();
      sub_1000449A0(&qword_10006F388, (void (*)(uint64_t))type metadata accessor for HostedPreviewCanvas);
      Invalidatable.invalidate(dsoHandle:file:line:column:function:)();
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_100009CC8(v10, v12);
      swift_endAccess();
      swift_release();
      swift_bridgeObjectRelease_n();
      return swift_release();
    }
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

id sub_1000421A8(char *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&a1[*a3] = 0;
  *(void *)&a1[*a4] = 0;
  v9.receiver = a1;
  v9.super_class = ObjectType;
  return [super init];
}

uint64_t sub_100042208()
{
  return sub_10004221C(&OBJC_IVAR____TtC12PreviewShell21InjectedSceneDelegate_window);
}

uint64_t sub_10004221C(void *a1)
{
  return swift_release();
}

uint64_t sub_100042274(uint64_t a1, uint64_t a2, void *a3)
{
  return swift_release();
}

uint64_t type metadata accessor for InjectedSceneDelegate()
{
  return self;
}

void sub_1000422E4(void *a1, void *a2)
{
}

uint64_t sub_100042308(uint64_t a1, void *a2)
{
  return sub_100041D6C(a1, a2);
}

uint64_t sub_10004232C(void *a1)
{
  return sub_100041EC8(a1);
}

uint64_t sub_100042350()
{
  if (*(void *)(v0 + 40)) {
    uint64_t v1 = *(void *)(v0 + 32);
  }
  else {
    uint64_t v1 = 1852399981;
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_100042398(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v38 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000449A0(&qword_100070C30, (void (*)(uint64_t))type metadata accessor for HostInjectedScene);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  swift_beginAccess();
  uint64_t v10 = *(void *)(a2 + 16);
  uint64_t v11 = *(void *)(v10 + 16);
  swift_bridgeObjectRetain();
  if (v11)
  {
    swift_bridgeObjectRetain();
    unint64_t v12 = sub_100009240(v9, v8);
    if (v13)
    {
      uint64_t v14 = *(uint64_t **)(*(void *)(v10 + 56) + 8 * v12);
      swift_endAccess();
      swift_retain();
      swift_bridgeObjectRelease_n();
      assertUnreachable(file:line:column:function:)();
      return (uint64_t)v14;
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v36 = v4;
  uint64_t v37 = a2 + 16;
  swift_endAccess();
  static Logger.uv.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v35 = v7;
    uint64_t v18 = (uint8_t *)v17;
    uint64_t v34 = swift_slowAlloc();
    uint64_t v40 = v34;
    *(_DWORD *)uint64_t v18 = 136446210;
    uint64_t v33 = v18 + 4;
    v39[0] = v9;
    v39[1] = v8;
    swift_bridgeObjectRetain();
    uint64_t v19 = String.init<A>(describing:)();
    v39[0] = sub_100013F74(v19, v20, &v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "registering injected scene '%{public}s'", v18, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v7 = v35;
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v38 + 8))(v6, v36);
  uint64_t v21 = type metadata accessor for HostedPreviewCanvas();
  uint64_t v22 = (uint64_t *)swift_allocObject();
  uint64_t v23 = swift_retain();
  uint64_t v14 = sub_100042FDC(v23, v22);
  swift_release();
  swift_weakAssign();
  v39[0] = v14;
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = a1;
  *(void *)(v24 + 24) = v7;
  sub_1000449A0(&qword_10006F388, (void (*)(uint64_t))type metadata accessor for HostedPreviewCanvas);
  swift_retain();
  Invalidatable.onInvalidation(_:)();
  swift_release();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v40 = *(void *)(a2 + 16);
  *(void *)(a2 + 16) = 0x8000000000000000;
  sub_10000CCE0((uint64_t)v14, v9, v8, isUniquelyReferenced_nonNull_native);
  *(void *)(a2 + 16) = v40;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_beginAccess();
  uint64_t v26 = *(void *)(a2 + 24);
  if (!*(void *)(v26 + 16))
  {
    swift_endAccess();
LABEL_23:
    swift_beginAccess();
    sub_100009A28(v9, v8);
    swift_endAccess();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (uint64_t)v14;
  }
  swift_bridgeObjectRetain();
  unint64_t v27 = sub_100009240(v9, v8);
  if ((v28 & 1) == 0)
  {
    swift_endAccess();
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  unint64_t v29 = *(void *)(*(void *)(v26 + 56) + 8 * v27);
  swift_endAccess();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (!(v29 >> 62))
  {
    uint64_t v30 = *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v30) {
      goto LABEL_12;
    }
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t result = _CocoaArrayWrapper.endIndex.getter();
  uint64_t v30 = result;
  if (!result)
  {
LABEL_22:
    swift_bridgeObjectRelease_n();
    goto LABEL_23;
  }
LABEL_12:
  uint64_t v38 = v9;
  if (v30 >= 1)
  {
    uint64_t v32 = 0;
    do
    {
      if ((v29 & 0xC000000000000001) != 0) {
        specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        swift_retain();
      }
      ++v32;
      v39[3] = v21;
      v39[4] = sub_1000449A0((unint64_t *)&qword_100070C10, (void (*)(uint64_t))type metadata accessor for HostedPreviewCanvas);
      v39[0] = v14;
      swift_retain();
      Promise.succeed(with:)();
      sub_10000FCE4((uint64_t)v39);
      swift_release();
    }
    while (v30 != v32);
    swift_bridgeObjectRelease_n();
    uint64_t v9 = v38;
    goto LABEL_23;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000429E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000449A0(&qword_100070C08, (void (*)(uint64_t))type metadata accessor for MainScene);
  swift_beginAccess();
  uint64_t v9 = *(void *)(a2 + 16);
  if (*(void *)(v9 + 16))
  {
    unint64_t v10 = sub_100009240(0, 0);
    if (v11)
    {
      uint64_t v12 = *(void *)(*(void *)(v9 + 56) + 8 * v10);
      swift_endAccess();
      swift_retain();
      assertUnreachable(file:line:column:function:)();
      return v12;
    }
  }
  swift_endAccess();
  static Logger.uv.getter();
  char v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v32 = v4;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v33 = v8;
    os_log_type_t v16 = (uint8_t *)v15;
    uint64_t v36 = swift_slowAlloc();
    uint64_t v34 = a2 + 16;
    v35[0] = 0;
    *(_DWORD *)os_log_type_t v16 = 136446210;
    uint64_t v31 = v16 + 4;
    v35[1] = 0;
    uint64_t v17 = String.init<A>(describing:)();
    v35[0] = sub_100013F74(v17, v18, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "registering injected scene '%{public}s'", v16, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v8 = v33;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v32);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  uint64_t v19 = type metadata accessor for HostedPreviewCanvas();
  uint64_t v20 = swift_allocObject();
  uint64_t v21 = swift_retain();
  uint64_t v12 = sub_1000433DC(v21, v20);
  swift_release();
  swift_weakAssign();
  v35[0] = v12;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = a1;
  *(void *)(v22 + 24) = v8;
  sub_1000449A0(&qword_10006F388, (void (*)(uint64_t))type metadata accessor for HostedPreviewCanvas);
  swift_retain();
  Invalidatable.onInvalidation(_:)();
  swift_release();
  swift_beginAccess();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v36 = *(void *)(a2 + 16);
  *(void *)(a2 + 16) = 0x8000000000000000;
  sub_10000CCE0(v12, 0, 0, isUniquelyReferenced_nonNull_native);
  *(void *)(a2 + 16) = v36;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_beginAccess();
  uint64_t v24 = *(void *)(a2 + 24);
  if (!*(void *)(v24 + 16) || (unint64_t v25 = sub_100009240(0, 0), (v26 & 1) == 0))
  {
    swift_endAccess();
LABEL_20:
    swift_beginAccess();
    sub_100009A28(0, 0);
    swift_endAccess();
    swift_bridgeObjectRelease();
    return v12;
  }
  unint64_t v27 = *(void *)(*(void *)(v24 + 56) + 8 * v25);
  swift_endAccess();
  if (!(v27 >> 62))
  {
    uint64_t v28 = *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain_n();
    if (v28) {
      goto LABEL_11;
    }
LABEL_19:
    swift_bridgeObjectRelease_n();
    goto LABEL_20;
  }
  swift_bridgeObjectRetain_n();
  uint64_t result = _CocoaArrayWrapper.endIndex.getter();
  uint64_t v28 = result;
  if (!result) {
    goto LABEL_19;
  }
LABEL_11:
  if (v28 >= 1)
  {
    uint64_t v30 = 0;
    do
    {
      if ((v27 & 0xC000000000000001) != 0) {
        specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        swift_retain();
      }
      ++v30;
      v35[3] = v19;
      v35[4] = sub_1000449A0((unint64_t *)&qword_100070C10, (void (*)(uint64_t))type metadata accessor for HostedPreviewCanvas);
      v35[0] = v12;
      swift_retain();
      Promise.succeed(with:)();
      sub_10000FCE4((uint64_t)v35);
      swift_release();
    }
    while (v28 != v30);
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_100042F88()
{
  return 1852399981;
}

uint64_t sub_100042F98()
{
  return 0x6373206C61636F6CLL;
}

uint64_t sub_100042FB8()
{
  return 0x64657463656A6E69;
}

uint64_t *sub_100042FDC(uint64_t a1, uint64_t *a2)
{
  uint64_t v19 = *a2;
  uint64_t v20 = type metadata accessor for ExecutionLane();
  uint64_t v18 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v17 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000449A0(&qword_100070C38, (void (*)(uint64_t))type metadata accessor for HostInjectedScene);
  type metadata accessor for InvalidationHandle();
  swift_allocObject();
  a2[2] = InvalidationHandle.init(dsoHandle:file:line:column:function:name:)();
  *(_OWORD *)(a2 + 7) = 0u;
  *(_OWORD *)(a2 + 9) = 0u;
  *(_OWORD *)((char *)a2 + 84) = 0u;
  sub_10000758C(&qword_100070C20);
  swift_allocObject();
  a2[13] = EventStream.Sink.init()();
  if (*(void *)(a1 + 40))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    unint64_t v7 = *(void *)(a1 + 40);
  }
  else
  {
    unint64_t v7 = 0xE400000000000000;
    uint64_t v6 = 1852399981;
  }
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v9 = (objc_class *)type metadata accessor for CanvasViewController();
  unint64_t v10 = (char *)objc_allocWithZone(v9);
  *(void *)&v10[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_active] = 0;
  *(void *)&v10[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_activating] = 0;
  char v11 = &v10[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_forcedOrientation];
  uint64_t v12 = type metadata accessor for PreviewPreferences.InterfaceOrientation();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  *(void *)&v10[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_debugOverlay] = 0;
  char v13 = (uint64_t *)&v10[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_sceneIdentifier];
  *char v13 = v6;
  v13[1] = v7;
  v22.receiver = v10;
  v22.super_class = v9;
  swift_bridgeObjectRetain();
  a2[3] = (uint64_t)[super initWithNibName:0 bundle:0];
  type metadata accessor for CanvasUpdater();
  os_log_type_t v14 = (void *)swift_allocObject();
  void v14[2] = 0;
  void v14[3] = a1;
  void v14[4] = v5;
  v14[5] = _swiftEmptyDictionarySingleton;
  a2[5] = v5;
  a2[6] = (uint64_t)v14;
  a2[4] = a1;
  void v21[3] = ObjectType;
  void v21[4] = *(void *)(*(void *)(*(void *)(v5 + 8) + 8) + 8);
  uint64_t v21[5] = a2;
  v21[0] = a1;
  sub_1000449A0(&qword_10006F388, (void (*)(uint64_t))type metadata accessor for HostedPreviewCanvas);
  swift_retain_n();
  Invalidatable.trackInvalidation(dsoHandle:file:line:column:function:of:)();
  sub_10000FCE4((uint64_t)v21);
  v21[0] = a2;
  uint64_t v15 = v17;
  static ExecutionLane.main.getter();
  swift_retain();
  Invalidatable.onInvalidation(on:_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v15, v20);
  return a2;
}

uint64_t sub_1000433DC(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = type metadata accessor for ExecutionLane();
  uint64_t v4 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000449A0(&qword_100070C18, (void (*)(uint64_t))type metadata accessor for MainScene);
  type metadata accessor for InvalidationHandle();
  swift_allocObject();
  *(void *)(a2 + 16) = InvalidationHandle.init(dsoHandle:file:line:column:function:name:)();
  *(_OWORD *)(a2 + 56) = 0u;
  *(_OWORD *)(a2 + 72) = 0u;
  *(_OWORD *)(a2 + 84) = 0u;
  sub_10000758C(&qword_100070C20);
  swift_allocObject();
  *(void *)(a2 + 104) = EventStream.Sink.init()();
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v9 = (objc_class *)type metadata accessor for CanvasViewController();
  unint64_t v10 = (char *)objc_allocWithZone(v9);
  *(void *)&v10[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_active] = 0;
  *(void *)&v10[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_activating] = 0;
  char v11 = &v10[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_forcedOrientation];
  uint64_t v12 = type metadata accessor for PreviewPreferences.InterfaceOrientation();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  *(void *)&v10[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_debugOverlay] = 0;
  char v13 = &v10[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_sceneIdentifier];
  *(void *)char v13 = 1852399981;
  *((void *)v13 + sub_10002675C(2, 1) = 0xE400000000000000;
  v19.receiver = v10;
  v19.super_class = v9;
  [super initWithNibName:0 bundle:0];
  type metadata accessor for CanvasUpdater();
  os_log_type_t v14 = (void *)swift_allocObject();
  void v14[2] = 0;
  void v14[3] = a1;
  void v14[4] = v7;
  v14[5] = _swiftEmptyDictionarySingleton;
  *(void *)(a2 + 40) = v7;
  *(void *)(a2 + 48) = v14;
  *(void *)(a2 + 32) = a1;
  v18[3] = ObjectType;
  v18[4] = *(void *)(*(void *)(*(void *)(v7 + 8) + 8) + 8);
  v18[5] = a2;
  v18[0] = a1;
  sub_1000449A0(&qword_10006F388, (void (*)(uint64_t))type metadata accessor for HostedPreviewCanvas);
  swift_retain_n();
  Invalidatable.trackInvalidation(dsoHandle:file:line:column:function:of:)();
  sub_10000FCE4((uint64_t)v18);
  v18[0] = a2;
  static ExecutionLane.main.getter();
  swift_retain();
  Invalidatable.onInvalidation(on:_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v17);
  return a2;
}

void sub_1000437AC()
{
  v21[0] = type metadata accessor for DispatchScheduler();
  __chkstk_darwin(v21[0]);
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = self;
  id v5 = [v4 standardUserDefaults:v21[0]];
  NSString v6 = String._bridgeToObjectiveC()();
  unsigned __int8 v7 = [v5 BOOLForKey:v6];

  if ((v7 & 1) == 0)
  {
    static Logger.uv.getter();
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      unint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "MainSceneDelegate is coming foreground so make icon visible on the home screen", v10, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    id v11 = [v4 standardUserDefaults];
    NSString v12 = String._bridgeToObjectiveC()();
    [v11 setBool:1 forKey:v12];

    char v13 = CFNotificationCenterGetDarwinNotifyCenter();
    if (v13)
    {
      os_log_type_t v14 = v13;
      uint64_t v15 = (__CFString *)String._bridgeToObjectiveC()();
      CFNotificationCenterPostNotification(v14, v15, 0, 0, 1u);
    }
  }
  uint64_t v16 = *(unsigned char **)(v21[1] + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_mainViewController);
  if (v16)
  {
    if ((v16[OBJC_IVAR____TtC12PreviewShell18MainViewController_isForeground] & 1) == 0)
    {
      v16[OBJC_IVAR____TtC12PreviewShell18MainViewController_isForeground] = 1;
      sub_100044CFC(0, (unint64_t *)&qword_10006EF70);
      uint64_t v17 = v16;
      static OS_dispatch_queue.main.getter();
      DispatchScheduler.init(queue:)();
      uint64_t v18 = swift_allocObject();
      *(void *)(v18 + 16) = 0x4000000000000000;
      *(void *)(v18 + 24) = v17;
      type metadata accessor for DelayedInvocation();
      swift_allocObject();
      objc_super v19 = v17;
      uint64_t v20 = DelayedInvocation.init<A>(scheduler:callback:)();
      DelayedInvocation.schedule(delay:)(2.0);
      *(void *)&v19[OBJC_IVAR____TtC12PreviewShell18MainViewController_xcodeConnectionWaitTimer] = v20;

      swift_release();
    }
  }
}

void sub_100043B48(void *a1, void *a2)
{
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  self;
  uint64_t v9 = swift_dynamicCastObjCClass();
  if (v9)
  {
    unint64_t v10 = (void *)v9;
    id v11 = a1;
    id v12 = [v11 _FBSScene];
    id v59 = [v12 settings];

    self;
    uint64_t v13 = swift_dynamicCastObjCClass();
    if (v13)
    {
      os_log_type_t v14 = (void *)v13;
      static Logger.uv.getter();
      id v15 = v2;
      id v16 = a2;
      uint64_t v17 = (char *)v15;
      id v18 = v16;
      objc_super v19 = Logger.logObject.getter();
      int v20 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v19, (os_log_type_t)v20))
      {
        int v53 = v20;
        os_log_t v54 = v19;
        unint64_t v55 = v14;
        uint64_t v56 = v6;
        id v57 = v11;
        uint64_t v58 = v10;
        uint64_t v21 = swift_slowAlloc();
        uint64_t v52 = swift_slowAlloc();
        uint64_t v63 = (char *)v52;
        *(_DWORD *)uint64_t v21 = 136446466;
        uint64_t v60 = v17;
        type metadata accessor for SceneDelegate();
        objc_super v22 = v17;
        sub_10000758C(&qword_100070C40);
        if (!swift_dynamicCast())
        {

          goto LABEL_17;
        }
        sub_10000E710(v61, (uint64_t)v64);
        uint64_t v23 = v65;
        uint64_t v24 = v66;
        sub_10000FC3C(v64, v65);
        uint64_t v25 = (*(uint64_t (**)(uint64_t, uint64_t))(v24 + 8))(v23, v24);
        unint64_t v27 = v26;
        sub_10000FCE4((uint64_t)v64);
        v64[0] = sub_100013F74(v25, v27, (uint64_t *)&v63);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        *(_WORD *)(v21 + 12) = 2082;
        id v28 = [v18 persistentIdentifier];
        uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v31 = v30;

        v64[0] = sub_100013F74(v29, v31, (uint64_t *)&v63);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        os_log_t v32 = v54;
        _os_log_impl((void *)&_mh_execute_header, v54, (os_log_type_t)v53, "%{public}s will connect to session %{public}s", (uint8_t *)v21, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v56 + 8))(v8, v5);
        id v11 = v57;
        unint64_t v10 = v58;
        os_log_type_t v14 = v55;
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      }
      self;
      uint64_t v34 = swift_dynamicCastObjCClass();
      if (v34)
      {
        id v35 = (id)v34;
        id v36 = v59;
      }
      else
      {
        id v37 = [objc_allocWithZone((Class)UVMutablePreviewSceneSettings) initWithSettings:v14];
        [v14 frame];
        [v37 setPreviewMaximumSize:v38, v39];
        id v35 = [objc_allocWithZone((Class)UVPreviewSceneSettings) initWithSettings:v37];
      }
      uint64_t v40 = *(void **)&v17[OBJC_IVAR____TtC12PreviewShell13SceneDelegate_previewSceneSettings];
      *(void *)&v17[OBJC_IVAR____TtC12PreviewShell13SceneDelegate_previewSceneSettings] = v35;
      id v41 = v35;

      unsigned int v42 = *(void **)&v17[OBJC_IVAR____TtC12PreviewShell13SceneDelegate_windowScene];
      *(void *)&v17[OBJC_IVAR____TtC12PreviewShell13SceneDelegate_windowScene] = v10;
      id v43 = v11;

      uint64_t v63 = v17;
      type metadata accessor for SceneDelegate();
      unint64_t v44 = v17;
      sub_10000758C(&qword_100070C40);
      if (swift_dynamicCast())
      {
        sub_10000E710(v61, (uint64_t)v64);
        uint64_t v45 = v65;
        uint64_t v46 = v66;
        sub_10000FC3C(v64, v65);
        (*(void (**)(void *, id, uint64_t, uint64_t))(v46 + 16))(v10, v41, v45, v46);
        sub_10000FCE4((uint64_t)v64);
        sub_10000758C(&qword_10006F448);
        uint64_t v47 = swift_allocObject();
        *(_OWORD *)(v47 + 16) = xmmword_100050140;
        *(void *)(v47 + 32) = v44;
        v64[0] = v47;
        specialized Array._endMutation()();
        int64_t v48 = v44;
        sub_10000758C(&qword_100070C60);
        Class isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        sub_100044CFC(0, &qword_100070C68);
        uint64_t v50 = NSString.init(stringLiteral:)();
        [v10 _registerSettingsDiffActionArray:isa forKey:v50];

        return;
      }
LABEL_17:
      uint64_t v62 = 0;
      memset(v61, 0, sizeof(v61));
      sub_100044C9C((uint64_t)v61);
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return;
    }

    id v33 = v59;
  }
}

uint64_t sub_1000441CC()
{
  uint64_t v1 = (void *)(v0 + OBJC_IVAR____TtC12PreviewShell18LocalSceneDelegate_previewShellScene);
  if (*(void *)(v0 + OBJC_IVAR____TtC12PreviewShell18LocalSceneDelegate_previewShellScene))
  {
    swift_getObjectType();
    Invalidatable.invalidate(dsoHandle:file:line:column:function:)();
  }
  *uint64_t v1 = 0;
  v1[1] = 0;
  uint64_t result = swift_unknownObjectRelease();
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC12PreviewShell13SceneDelegate_previewSceneSettings);
  if (v3)
  {
    if (*v1)
    {
      uint64_t v4 = v1[1];
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v6 = *(void *)(v4 + 8);
      id v7 = v3;
      swift_unknownObjectRetain();
      sub_10004130C((uint64_t)v7, 0, ObjectType, v6);

      return swift_unknownObjectRelease();
    }
  }
  return result;
}

uint64_t sub_1000442E0()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for InvalidationTrace();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10006ECD0 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_1000741A0;
  swift_beginAccess();
  uint64_t v7 = *(void *)(v6 + 16);
  if (*(void *)(v7 + 16) && (unint64_t v8 = sub_100009240(0, 0), (v9 & 1) != 0))
  {
    unint64_t v10 = *(void **)(*(void *)(v7 + 56) + 8 * v8);
    swift_endAccess();
    id v20 = v10;
    type metadata accessor for HostedPreviewCanvas();
    sub_1000449A0(&qword_10006F388, (void (*)(uint64_t))type metadata accessor for HostedPreviewCanvas);
    swift_retain();
    Invalidatable.invalidate(dsoHandle:file:line:column:function:)();
    swift_beginAccess();
    sub_100009CC8(0, 0);
    swift_endAccess();
    swift_release();
    swift_release();
  }
  else
  {
    swift_endAccess();
  }
  uint64_t v11 = OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_window;
  id v12 = *(void **)(v1 + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_window);
  if (v12)
  {
    [v12 setHidden:1];
    uint64_t v13 = *(void **)(v1 + v11);
  }
  else
  {
    uint64_t v13 = 0;
  }
  *(void *)(v1 + v1sub_10002675C(2, 1) = 0;

  uint64_t v14 = OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_mainViewController;
  id v15 = *(void **)(v1 + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_mainViewController);
  if (v15)
  {
    id v20 = *(id *)(v1 + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_mainViewController);
    id v16 = v15;
    static InvalidationTrace.empty.getter();
    type metadata accessor for MainViewController();
    sub_1000449A0(&qword_10006FF58, (void (*)(uint64_t))type metadata accessor for MainViewController);
    AnyInvalidatable.invalidate(file:line:column:function:trace:)();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);

    id v15 = *(void **)(v1 + v14);
  }
  *(void *)(v1 + v14) = 0;

  uint64_t v17 = OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_previewShellScene;
  if (*(void *)(v1 + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_previewShellScene))
  {
    id v20 = *(id *)(v1 + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_previewShellScene);
    type metadata accessor for MainScene(0);
    sub_1000449A0(&qword_100070BF0, (void (*)(uint64_t))type metadata accessor for MainScene);
    Invalidatable.invalidate(dsoHandle:file:line:column:function:)();
  }
  *(void *)(v1 + v17) = 0;
  return swift_release();
}

uint64_t sub_1000446A8()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000446E0()
{
  return sub_100028704(*(void *)(v0 + 24), *(double *)(v0 + 16));
}

uint64_t sub_1000446EC()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100044724()
{
  return sub_100025ED8(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_10004472C()
{
  return sub_10000E7A0();
}

uint64_t sub_100044734()
{
  uint64_t v1 = v0;
  if (qword_10006ECD0 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_1000741A0;
  swift_beginAccess();
  if (*(void *)(*(void *)(v2 + 16) + 16) && (sub_100009240(0, 0), (v3 & 1) != 0))
  {
    swift_endAccess();
    type metadata accessor for HostedPreviewCanvas();
    sub_1000449A0(&qword_10006F388, (void (*)(uint64_t))type metadata accessor for HostedPreviewCanvas);
    swift_retain();
    Invalidatable.invalidate(dsoHandle:file:line:column:function:)();
    swift_beginAccess();
    sub_100009CC8(0, 0);
    swift_endAccess();
    swift_release();
    swift_release();
  }
  else
  {
    swift_endAccess();
  }
  uint64_t v4 = OBJC_IVAR____TtC12PreviewShell26SimulatorMainSceneDelegate_window;
  uint64_t v5 = *(void **)(v1 + OBJC_IVAR____TtC12PreviewShell26SimulatorMainSceneDelegate_window);
  if (v5)
  {
    [v5 setHidden:1];
    uint64_t v6 = *(void **)(v1 + v4);
  }
  else
  {
    uint64_t v6 = 0;
  }
  *(void *)(v1 + v4) = 0;

  uint64_t v7 = OBJC_IVAR____TtC12PreviewShell26SimulatorMainSceneDelegate_previewShellScene;
  if (*(void *)(v1 + OBJC_IVAR____TtC12PreviewShell26SimulatorMainSceneDelegate_previewShellScene))
  {
    type metadata accessor for MainScene(0);
    sub_1000449A0(&qword_100070BF0, (void (*)(uint64_t))type metadata accessor for MainScene);
    Invalidatable.invalidate(dsoHandle:file:line:column:function:)();
  }
  *(void *)(v1 + v7) = 0;
  return swift_release();
}

uint64_t sub_1000449A0(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1000449E8(void *a1, id a2)
{
  if (a2
    && ([a2 copy],
        _bridgeAnyObjectToAny(_:)(),
        swift_unknownObjectRelease(),
        sub_100044CFC(0, (unint64_t *)&unk_100070C50),
        (swift_dynamicCast() & 1) != 0))
  {
    id v4 = v20[0];
    [v20[0] setActions:0];
    if (!a1) {
      goto LABEL_11;
    }
  }
  else
  {
    id v4 = 0;
    if (!a1)
    {
LABEL_11:

      return;
    }
  }
  id v5 = [a1 settings];
  if (!v5) {
    goto LABEL_11;
  }
  uint64_t v6 = v5;
  self;
  uint64_t v7 = swift_dynamicCastObjCClass();
  if (!v7)
  {

    goto LABEL_11;
  }
  unint64_t v8 = (void *)v7;
  self;
  uint64_t v9 = swift_dynamicCastObjCClass();
  if (v9)
  {
    id v10 = (id)v9;
    id v11 = v6;
  }
  else
  {
    id v12 = [objc_allocWithZone((Class)UVMutablePreviewSceneSettings) initWithSettings:v8];
    [v8 frame];
    [v12 setPreviewMaximumSize:v13, v14];
    id v10 = [objc_allocWithZone((Class)UVPreviewSceneSettings) initWithSettings:v12];
  }
  id v15 = *(void **)&v2[OBJC_IVAR____TtC12PreviewShell13SceneDelegate_previewSceneSettings];
  *(void *)&v2[OBJC_IVAR____TtC12PreviewShell13SceneDelegate_previewSceneSettings] = v10;
  id v16 = v10;

  uint64_t v23 = v2;
  type metadata accessor for SceneDelegate();
  uint64_t v17 = v2;
  sub_10000758C(&qword_100070C40);
  if (swift_dynamicCast())
  {
    sub_10000E710((long long *)v20, (uint64_t)v24);
    uint64_t v18 = v25;
    uint64_t v19 = v26;
    sub_10000FC3C(v24, v25);
    (*(void (**)(id, id, uint64_t, uint64_t))(v19 + 32))(v16, v4, v18, v19);

    sub_10000FCE4((uint64_t)v24);
  }
  else
  {
    uint64_t v22 = 0;
    *(_OWORD *)id v20 = 0u;
    long long v21 = 0u;
    sub_100044C9C((uint64_t)v20);
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
}

uint64_t sub_100044C9C(uint64_t a1)
{
  uint64_t v2 = sub_10000758C(&qword_100070C48);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100044CFC(uint64_t a1, unint64_t *a2)
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

void sub_100044D40()
{
  uint64_t v2 = v0;
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(v2 + 24);
  id v8 = *(id *)(v7 + 80);
  static Logger.uv.getter();
  id v9 = v8;
  swift_retain();
  id v10 = Logger.logObject.getter();
  int v11 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v10, (os_log_type_t)v11))
  {
    int v31 = v11;
    uint64_t v32 = v4;
    uint64_t v33 = v3;
    uint64_t v34 = v1;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    uint64_t v36 = v30;
    *(_DWORD *)uint64_t v12 = 136315650;
    uint64_t v13 = *(void *)(v7 + 24);
    unint64_t v14 = *(void *)(v7 + 32);
    swift_bridgeObjectRetain();
    uint64_t v35 = sub_100013F74(v13, v14, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    id v15 = [v9 settings];
    [v15 interfaceOrientation];

    id v16 = (id)BSInterfaceOrientationDescription();
    uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v19 = v18;

    uint64_t v35 = sub_100013F74(v17, v19, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 22) = 2080;
    id v20 = [v9 settings];
    [v20 frame];

    id v21 = (id)BSStringFromCGRect();
    if (!v21)
    {

      __break(1u);
      return;
    }
    uint64_t v22 = v21;
    uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v25 = v24;

    uint64_t v35 = sub_100013F74(v23, v25, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, (os_log_type_t)v31, "Snapshotting scene %s with orientation:%s, frame:%s", (uint8_t *)v12, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v32 + 8))(v6, v33);
  }
  else
  {

    swift_release();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  id v26 = [v9 createSnapshot];
  if (v26
    && (unint64_t v27 = v26, v28 = [v26 CGImage], v27, v28))
  {
  }
  else
  {
    sub_100048E80();
    swift_allocError();
    *uint64_t v29 = v9;
    swift_willThrow();
  }
}

unint64_t sub_100045180(void *a1)
{
  _StringGuts.grow(_:)(34);
  swift_bridgeObjectRelease();
  id v2 = a1;
  id v3 = [v2 description];
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;

  v7._countAndFlagsBits = v4;
  v7._object = v6;
  String.append(_:)(v7);

  swift_bridgeObjectRelease();
  return 0xD000000000000020;
}

unint64_t sub_100045238()
{
  return 0xD00000000000001FLL;
}

unint64_t sub_100045254()
{
  return sub_100045180(*v0);
}

uint64_t sub_10004525C(uint64_t a1)
{
  unint64_t v2 = sub_100049108();

  return HumanReadableError.errorDescription.getter(a1, v2);
}

uint64_t sub_100045298(uint64_t a1)
{
  unint64_t v2 = sub_100049108();

  return HumanReadableError.description.getter(a1, v2);
}

uint64_t sub_1000452D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10000758C(&qword_1000710C8);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  Swift::String v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5);
  id v9 = &v14[-v8];
  uint64_t v10 = v2 + OBJC_IVAR____TtC12PreviewShell15SimDisplayScene____lazy_storage___thumbnailSceneCache;
  swift_beginAccess();
  sub_10002FAF4(v10, (uint64_t)v9, &qword_1000710C8);
  uint64_t v11 = type metadata accessor for ThumbnailSceneCache();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11) != 1) {
    return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v12 + 32))(a1, v9, v11);
  }
  sub_10000FD9C((uint64_t)v9, &qword_1000710C8);
  sub_100048334(&qword_100071078, (void (*)(uint64_t))type metadata accessor for SimDisplayScene);
  swift_retain_n();
  ThumbnailSceneCache.init(in:makeHostingViewController:)();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v12 + 16))(v7, a1, v11);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v12 + 56))(v7, 0, 1, v11);
  swift_beginAccess();
  sub_100048D84((uint64_t)v7, v10);
  return swift_endAccess();
}

uint64_t sub_100045514()
{
  swift_release();
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC12PreviewShell15SimDisplayScene_role;
  uint64_t v2 = type metadata accessor for PreviewSceneRole();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();

  swift_release();
  sub_10000FD9C(v0 + OBJC_IVAR____TtC12PreviewShell15SimDisplayScene____lazy_storage___thumbnailSceneCache, &qword_1000710C8);
  return v0;
}

uint64_t sub_1000455E4()
{
  sub_100045514();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_10004563C()
{
  return type metadata accessor for SimDisplayScene(0);
}

uint64_t type metadata accessor for SimDisplayScene(uint64_t a1)
{
  return sub_100014BD8(a1, (uint64_t *)&unk_100070CB0);
}

void sub_100045664()
{
  type metadata accessor for PreviewSceneRole();
  if (v0 <= 0x3F)
  {
    sub_10004575C();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_10004575C()
{
  if (!qword_100070CC0)
  {
    type metadata accessor for ThumbnailSceneCache();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100070CC0);
    }
  }
}

uint64_t sub_1000457B8()
{
  uint64_t v1 = SceneSettingsUpdate.sceneSettings.getter();
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC12PreviewShell15SimDisplayScene_sceneSettings);
  *(void *)(v0 + OBJC_IVAR____TtC12PreviewShell15SimDisplayScene_sceneSettings) = v1;

  swift_retain();
  EventStream.Sink.send(_:)();

  return swift_release();
}

unint64_t sub_100045828@<X0>(uint64_t *a1@<X8>)
{
  unint64_t result = (*(uint64_t (**)(void))(v1 + OBJC_IVAR____TtC12PreviewShell15SimDisplayScene_findStaticCanvas))();
  if (!v2)
  {
    uint64_t v5 = sub_10003ADB0();
    swift_release();
    a1[3] = (uint64_t)&type metadata for ShellThumbnailFactory;
    unint64_t result = sub_100048DEC();
    a1[4] = result;
    *a1 = v5;
  }
  return result;
}

id sub_1000458A8()
{
  return *(id *)(*(void *)(v0 + 24) + 104);
}

uint64_t sub_1000458B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC12PreviewShell15SimDisplayScene_role;
  uint64_t v4 = type metadata accessor for PreviewSceneRole();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t sub_100045928@<X0>(_DWORD *a1@<X8>)
{
  *a1 = *(_DWORD *)(*(void *)(v1 + OBJC_IVAR____TtC12PreviewShell15SimDisplayScene_display)
                  + OBJC_IVAR____TtC12PreviewShell10SimDisplay_displayID);
  uint64_t v3 = enum case for HostIdentity.simulator(_:);
  uint64_t v4 = type metadata accessor for HostIdentity();
  uint64_t v5 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 104);

  return v5(a1, v3, v4);
}

id sub_1000459BC()
{
  return *(id *)(v0 + OBJC_IVAR____TtC12PreviewShell15SimDisplayScene_sceneSettings);
}

uint64_t sub_1000459CC()
{
  swift_retain();
  EventStream.Sink.eventStream.getter();

  return swift_release();
}

uint64_t sub_100045A1C(uint64_t a1, uint64_t a2)
{
  return sub_1000461A8(a1, a2, (uint64_t)sub_100048ED4);
}

uint64_t sub_100045A34()
{
  return SceneCrashedStyle.init(snapshotStyle:redCrossVisible:reloadHandler:)();
}

uint64_t sub_100045A6C()
{
  return SceneStoppedStyle.init(snapshotStyle:)(1);
}

void sub_100045A74()
{
}

void *sub_100045A8C()
{
  uint64_t v1 = *(void **)(*(void *)(v0 + OBJC_IVAR____TtC12PreviewShell15SimDisplayScene_display)
                + OBJC_IVAR____TtC12PreviewShell10SimDisplay_capabilities);
  id v2 = v1;
  return v1;
}

void *sub_100045ACC()
{
  uint64_t v1 = *(void **)(*(void *)(v0 + OBJC_IVAR____TtC12PreviewShell15SimDisplayScene_display)
                + OBJC_IVAR____TtC12PreviewShell10SimDisplay_capabilities
                + 8);
  id v2 = v1;
  return v1;
}

uint64_t sub_100045B10()
{
  unint64_t v0 = sub_100048E40();

  return static EventStream.empty.getter(v0);
}

uint64_t sub_100045B4C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10000758C(&qword_1000710C8);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  Swift::String v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5);
  id v9 = &v14[-v8];
  uint64_t v10 = v2 + OBJC_IVAR____TtC12PreviewShell16LocalStaticScene____lazy_storage___thumbnailSceneCache;
  swift_beginAccess();
  sub_10002FAF4(v10, (uint64_t)v9, &qword_1000710C8);
  uint64_t v11 = type metadata accessor for ThumbnailSceneCache();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11) != 1) {
    return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v12 + 32))(a1, v9, v11);
  }
  sub_10000FD9C((uint64_t)v9, &qword_1000710C8);
  sub_100048334(&qword_100071060, (void (*)(uint64_t))type metadata accessor for LocalStaticScene);
  swift_retain_n();
  ThumbnailSceneCache.init(in:makeHostingViewController:)();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v12 + 16))(v7, a1, v11);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v12 + 56))(v7, 0, 1, v11);
  swift_beginAccess();
  sub_100048D84((uint64_t)v7, v10);
  return swift_endAccess();
}

uint64_t sub_100045D8C(uint64_t a1)
{
  uint64_t v2 = v1;
  type metadata accessor for InvalidationHandle();
  swift_allocObject();
  LOBYTE(v7) = 2;
  *(void *)(v1 + 16) = InvalidationHandle.init(dsoHandle:file:line:column:function:name:)();
  sub_10000758C(&qword_100071090);
  swift_allocObject();
  *(void *)(v1 + 32) = EventStream.Sink.init()();
  uint64_t v4 = v1 + OBJC_IVAR____TtC12PreviewShell16LocalStaticScene____lazy_storage___thumbnailSceneCache;
  uint64_t v5 = type metadata accessor for ThumbnailSceneCache();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 40) = [objc_allocWithZone((Class)PSSceneSettings) initWithSettings:*(void *)(a1 + 120) v7, 0, 0];
  return v2;
}

uint64_t sub_100045EB4()
{
  swift_release();
  swift_release();
  swift_release();

  sub_10000FD9C((uint64_t)v0 + OBJC_IVAR____TtC12PreviewShell16LocalStaticScene____lazy_storage___thumbnailSceneCache, &qword_1000710C8);
  uint64_t v1 = *((unsigned int *)*v0 + 12);
  uint64_t v2 = *((unsigned __int16 *)*v0 + 26);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_100045F40()
{
  return type metadata accessor for LocalStaticScene(0);
}

uint64_t type metadata accessor for LocalStaticScene(uint64_t a1)
{
  return sub_100014BD8(a1, qword_100070DA8);
}

void sub_100045F68()
{
  sub_10004575C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_100046018@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 24);
  a1[3] = type metadata accessor for LocalSceneHost();
  a1[4] = &off_100063618;
  *a1 = v3;

  return swift_retain();
}

uint64_t sub_100046068()
{
  uint64_t v1 = SceneSettingsUpdate.sceneSettings.getter();
  uint64_t v2 = *(void **)(v0 + 40);
  *(void *)(v0 + 40) = v1;

  swift_retain();
  EventStream.Sink.send(_:)();

  return swift_release();
}

unint64_t sub_1000460C8@<X0>(uint64_t *a1@<X8>)
{
  return sub_100047F18(a1);
}

uint64_t sub_1000460E4()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 24) + 88);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_100046118@<X0>(uint64_t a1@<X8>)
{
  return sub_10004802C(&enum case for PreviewSceneRole.static(_:), (uint64_t (*)(void))&type metadata accessor for PreviewSceneRole, a1);
}

uint64_t sub_100046138@<X0>(uint64_t a1@<X8>)
{
  return sub_10004802C(&enum case for HostIdentity.unknown(_:), (uint64_t (*)(void))&type metadata accessor for HostIdentity, a1);
}

id sub_100046158()
{
  return *(id *)(v0 + 40);
}

uint64_t sub_100046160()
{
  swift_retain();
  EventStream.Sink.eventStream.getter();

  return swift_release();
}

uint64_t sub_1000461A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(v3 + 24);
  swift_retain();
  sub_10003D580(a3, v5);

  return swift_release();
}

uint64_t sub_100046220()
{
  return 0;
}

uint64_t sub_100046228@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10000758C(&qword_1000710C8);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5);
  id v9 = &v14[-v8];
  uint64_t v10 = v2 + OBJC_IVAR____TtC12PreviewShell17HostInjectedScene____lazy_storage___thumbnailSceneCache;
  swift_beginAccess();
  sub_10002FAF4(v10, (uint64_t)v9, &qword_1000710C8);
  uint64_t v11 = type metadata accessor for ThumbnailSceneCache();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11) != 1) {
    return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v12 + 32))(a1, v9, v11);
  }
  sub_10000FD9C((uint64_t)v9, &qword_1000710C8);
  sub_100048334(&qword_100071048, (void (*)(uint64_t))type metadata accessor for HostInjectedScene);
  swift_retain_n();
  ThumbnailSceneCache.init(in:makeHostingViewController:)();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v12 + 16))(v7, a1, v11);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v12 + 56))(v7, 0, 1, v11);
  swift_beginAccess();
  sub_100048D84((uint64_t)v7, v10);
  return swift_endAccess();
}

void *sub_100046468(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v5 = v4;
  type metadata accessor for InvalidationHandle();
  swift_allocObject();
  LOBYTE(v18) = 2;
  v4[2] = InvalidationHandle.init(dsoHandle:file:line:column:function:name:)();
  sub_10000758C(&qword_100071090);
  swift_allocObject();
  v4[3] = EventStream.Sink.init()();
  sub_10000758C(&qword_1000710A0);
  swift_allocObject();
  v4[10] = EventStream.Sink.init()();
  uint64_t v10 = (char *)v4 + OBJC_IVAR____TtC12PreviewShell17HostInjectedScene____lazy_storage___thumbnailSceneCache;
  uint64_t v11 = type metadata accessor for ThumbnailSceneCache();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  swift_weakInit();
  void v5[4] = a1;
  v5[5] = a2;
  v5[6] = a3;
  id v12 = objc_allocWithZone((Class)PSSceneSettings);
  id v13 = a3;
  v5[7] = [v12 initWithSettings:a4, v18, 0, 0];
  *(void *)(swift_allocObject() + 16) = v13;
  sub_10000758C(&qword_1000710A8);
  swift_allocObject();
  id v14 = v13;
  v5[8] = SceneMessenger.init(actionSender:)();
  swift_retain();
  UIScene.setPreviewSceneActionHandler(_:)();
  swift_release();
  uint64_t v15 = v5[8];
  type metadata accessor for HostPreferenceResolver();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  *(void *)(v16 + 24) = _swiftEmptyDictionarySingleton;
  v5[9] = v16;
  swift_retain_n();
  swift_retain();
  SceneMessenger.messageReceiver.setter();
  swift_release();

  return v5;
}

void sub_1000466E8(uint64_t a1, uint64_t a2)
{
  uint64_t v39 = a2;
  uint64_t v3 = sub_10000758C(&qword_1000710B0);
  uint64_t v35 = *(void *)(v3 - 8);
  uint64_t v4 = *(void *)(v35 + 64);
  uint64_t v5 = __chkstk_darwin(v3 - 8);
  uint64_t v33 = (uint64_t)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v34 = (uint64_t)&v32 - v6;
  uint64_t v7 = type metadata accessor for ExecutionLane();
  uint64_t v37 = *(void *)(v7 - 8);
  uint64_t v38 = v7;
  __chkstk_darwin(v7);
  uint64_t v36 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t updated = type metadata accessor for SceneUpdateTiming();
  uint64_t v10 = *(void *)(updated - 8);
  __chkstk_darwin(updated);
  id v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for SceneUpdateSeed();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for HostToShellMessage();
  __chkstk_darwin(v17);
  unint64_t v19 = (void **)((char *)&v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100048A84(a1, (uint64_t)v19);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      id v41 = *v19;
      id v21 = v41;
      EventStream.Sink.send(_:)();
    }
    else if (swift_weakLoadStrong())
    {
      sub_10000F320();
      unint64_t v25 = v36;
      static ExecutionLane.main.getter();
      uint64_t v26 = v34;
      sub_10002FAF4(v39, v34, &qword_1000710B0);
      unint64_t v27 = (*(unsigned __int8 *)(v35 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80);
      uint64_t v28 = swift_allocObject();
      sub_100048C5C(v26, v28 + v27);
      Future.observeCompletion(on:_:)();
      swift_release();
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v37 + 8))(v25, v38);
    }
    else
    {
      uint64_t v29 = v33;
      sub_10002FAF4(v39, v33, &qword_1000710B0);
      uint64_t v30 = type metadata accessor for SceneMessageResponder();
      uint64_t v31 = *(void *)(v30 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30) == 1)
      {
        sub_10000FD9C(v29, &qword_1000710B0);
      }
      else
      {
        sub_100048AE8();
        swift_allocError();
        SceneMessageResponder.reply(error:)();
        swift_errorRelease();
        (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v29, v30);
      }
    }
  }
  else
  {
    uint64_t v22 = *(void **)((char *)v19 + *(int *)(sub_10000758C(&qword_1000710C0) + 48));
    (*(void (**)(char *, void **, uint64_t))(v14 + 32))(v16, v19, v13);
    uint64_t v23 = (unsigned int *)&enum case for SceneUpdateTiming.async(_:);
    uint64_t v24 = v40;
    if (v22) {
      uint64_t v23 = (unsigned int *)&enum case for SceneUpdateTiming.fenced(_:);
    }
    (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *v23, updated);
    sub_100008D5C((uint64_t)v16);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, updated);
    if (v22)
    {
      [v22 applyToScene:*(void *)(v24 + 48)];
      [v22 invalidate];
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
}

uint64_t sub_100046C4C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_10000758C(&qword_1000710B0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002FAF4(a2, (uint64_t)v5, &qword_1000710B0);
  uint64_t v6 = type metadata accessor for SceneMessageResponder();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1) {
    return sub_10000FD9C((uint64_t)v5, &qword_1000710B0);
  }
  SceneMessageResponder.reply(result:)();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v5, v6);
}

uint64_t sub_100046D80()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_release();
  sub_10000FD9C(v0 + OBJC_IVAR____TtC12PreviewShell17HostInjectedScene____lazy_storage___thumbnailSceneCache, &qword_1000710C8);
  swift_weakDestroy();
  return v0;
}

uint64_t sub_100046E00()
{
  sub_100046D80();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_100046E58()
{
  return type metadata accessor for HostInjectedScene(0);
}

uint64_t type metadata accessor for HostInjectedScene(uint64_t a1)
{
  return sub_100014BD8(a1, qword_100070E80);
}

void sub_100046E80()
{
  sub_10004575C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_100046F48()
{
  swift_weakAssign();

  return swift_release();
}

uint64_t sub_100046F90@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 72);
  a1[3] = type metadata accessor for HostPreferenceResolver();
  a1[4] = &off_100062AA8;
  *a1 = v3;

  return swift_retain();
}

uint64_t sub_100046FE0(int a1)
{
  uint64_t v2 = type metadata accessor for ShellToHostMessage();
  __chkstk_darwin(v2);
  uint64_t v4 = (_DWORD *)((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v4 = a1;
  swift_storeEnumTagMultiPayload();
  SceneMessenger.send(message:)();
  return sub_100008FC4((uint64_t)v4);
}

uint64_t sub_10004707C()
{
  return sub_1000470F4();
}

uint64_t sub_100047084()
{
  uint64_t v1 = SceneSettingsUpdate.sceneSettings.getter();
  uint64_t v2 = *(void **)(v0 + 56);
  *(void *)(v0 + 56) = v1;

  swift_retain();
  EventStream.Sink.send(_:)();

  return swift_release();
}

uint64_t sub_1000470E4()
{
  return sub_1000470F4();
}

uint64_t sub_1000470EC()
{
  return sub_1000470F4();
}

uint64_t sub_1000470F4()
{
  uint64_t v0 = type metadata accessor for ShellToHostMessage();
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_storeEnumTagMultiPayload();
  SceneMessenger.send(message:)();
  return sub_100008FC4((uint64_t)v2);
}

uint64_t sub_10004718C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ShellToHostMessage();
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for SuppressedPresentation();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(v4, a1, v5);
  swift_storeEnumTagMultiPayload();
  SceneMessenger.send(message:)();
  return sub_100008FC4((uint64_t)v4);
}

id sub_10004726C()
{
  return *(id *)(v0 + 48);
}

uint64_t sub_100047274@<X0>(uint64_t a1@<X8>)
{
  return sub_10004802C((unsigned int *)&enum case for PreviewSceneRole.hosted(_:), (uint64_t (*)(void))&type metadata accessor for PreviewSceneRole, a1);
}

uint64_t sub_100047294@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 40);
  if (v3)
  {
    *a1 = *(void *)(v1 + 32);
    a1[1] = v3;
    uint64_t v4 = (unsigned int *)&enum case for HostIdentity.injected(_:);
  }
  else
  {
    uint64_t v4 = (unsigned int *)&enum case for HostIdentity.main(_:);
  }
  uint64_t v5 = *v4;
  uint64_t v6 = type metadata accessor for HostIdentity();
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 104))(a1, v5, v6);

  return swift_bridgeObjectRetain();
}

id sub_100047334()
{
  return *(id *)(v0 + 56);
}

uint64_t sub_100047344()
{
  return SceneCrashedStyle.init(snapshotStyle:redCrossVisible:reloadHandler:)();
}

uint64_t sub_10004737C()
{
  return SceneStoppedStyle.init(snapshotStyle:)(2);
}

uint64_t sub_100047384()
{
  return swift_willThrow();
}

uint64_t sub_10004746C()
{
  return EventStream.Sink.eventStream.getter();
}

uint64_t sub_100047490@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10000758C(&qword_1000710C8);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5);
  uint64_t v9 = &v14[-v8];
  uint64_t v10 = v2 + OBJC_IVAR____TtC12PreviewShell9MainScene____lazy_storage___thumbnailSceneCache;
  swift_beginAccess();
  sub_10002FAF4(v10, (uint64_t)v9, &qword_1000710C8);
  uint64_t v11 = type metadata accessor for ThumbnailSceneCache();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11) != 1) {
    return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v12 + 32))(a1, v9, v11);
  }
  sub_10000FD9C((uint64_t)v9, &qword_1000710C8);
  sub_100048334(&qword_100071038, (void (*)(uint64_t))type metadata accessor for MainScene);
  swift_retain_n();
  ThumbnailSceneCache.init(in:makeHostingViewController:)();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v12 + 16))(v7, a1, v11);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v12 + 56))(v7, 0, 1, v11);
  swift_beginAccess();
  sub_100048D84((uint64_t)v7, v10);
  return swift_endAccess();
}

uint64_t sub_1000476D0(uint64_t a1, uint64_t a2, unint64_t *a3, void (*a4)(uint64_t))
{
  uint64_t v6 = sub_100048334(a3, a4);
  id v7 = objc_allocWithZone((Class)type metadata accessor for RemoteContentViewController());
  swift_retain();
  swift_retain();
  return sub_100015930(a1, a2, v6);
}

id sub_10004774C()
{
  id v2 = [*(id *)(v0 + 32) keyWindow];
  if (v2)
  {
    id v3 = v2;
    id v4 = [v2 uv_createSnapshotImageFromIOSurface];
    if (v4)
    {
      id v1 = v4;
    }
    else
    {
      type metadata accessor for LocalSnapshotError();
      sub_100048334(&qword_1000710E8, (void (*)(uint64_t))&type metadata accessor for LocalSnapshotError);
      swift_allocError();
      id v1 = v5;
      id v3 = v3;
      LocalSnapshotError.init(window:)();
      swift_willThrow();
    }
  }
  else
  {
    type metadata accessor for Unreachable();
    sub_100048334((unint64_t *)&qword_10006F130, (void (*)(uint64_t))&type metadata accessor for Unreachable);
    swift_allocError();
    Unreachable.init(_:diagnostics:file:line:column:function:)();
    swift_willThrow();
  }
  return v1;
}

uint64_t sub_1000478F4()
{
  uint64_t updated = type metadata accessor for SceneUpdateTiming();
  uint64_t v1 = *(void *)(updated - 8);
  __chkstk_darwin(updated);
  id v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for PreviewPreferences();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000758C((uint64_t *)&unk_1000707A0);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    id v12 = *(id *)(Strong + 24);
    swift_release();
    SceneUpdateHandshake.preferences.getter();
    PreviewPreferences.preferredOrientation.getter();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v13 = type metadata accessor for PreviewPreferences.InterfaceOrientation();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 0, 1, v13);
    uint64_t v14 = (uint64_t)v12 + OBJC_IVAR____TtC12PreviewShell20CanvasViewController_forcedOrientation;
    swift_beginAccess();
    sub_100048F80((uint64_t)v10, v14);
    swift_endAccess();
    [v12 setNeedsUpdateOfSupportedInterfaceOrientations];
    sub_10000FD9C((uint64_t)v10, (uint64_t *)&unk_1000707A0);
  }
  uint64_t v15 = (void *)SceneUpdateHandshake.fenceHandle.getter();
  [v15 invalidate];

  sub_10000758C(&qword_10006F120);
  SceneUpdateHandshake.timing.getter();
  uint64_t v16 = static Future.succeeded(dsoHandle:file:line:column:function:_:)();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, updated);
  return v16;
}

uint64_t sub_100047C0C()
{
  swift_release();
  swift_release();

  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC12PreviewShell9MainScene_sceneCrashedStyle;
  uint64_t v2 = type metadata accessor for SceneCrashedStyle();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_10000FD9C((uint64_t)v0 + OBJC_IVAR____TtC12PreviewShell9MainScene____lazy_storage___thumbnailSceneCache, &qword_1000710C8);
  swift_weakDestroy();
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_100047CF4()
{
  return type metadata accessor for MainScene(0);
}

uint64_t type metadata accessor for MainScene(uint64_t a1)
{
  return sub_100014BD8(a1, qword_100070F80);
}

void sub_100047D1C()
{
  type metadata accessor for SceneCrashedStyle();
  if (v0 <= 0x3F)
  {
    sub_10004575C();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t sub_100047E10()
{
  swift_weakAssign();

  return swift_release();
}

uint64_t sub_100047E58()
{
  return sub_1000478F4();
}

uint64_t sub_100047E7C@<X0>(void *a1@<X8>)
{
  a1[3] = *v1;
  a1[4] = &off_100063DB0;
  *a1 = v1;
  return swift_retain();
}

uint64_t sub_100047EB8()
{
  uint64_t v1 = SceneSettingsUpdate.sceneSettings.getter();
  uint64_t v2 = *(void **)(v0 + 40);
  *(void *)(v0 + 40) = v1;

  swift_retain();
  EventStream.Sink.send(_:)();

  return swift_release();
}

unint64_t sub_100047F18@<X0>(uint64_t *a1@<X8>)
{
  if (qword_10006ECC8 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10006FDB8;
  if (byte_10006FDC0)
  {
    swift_errorRetain();
    sub_10000758C(&qword_10006EFF0);
    return swift_willThrowTypedImpl();
  }
  else
  {
    swift_retain();
    uint64_t v4 = sub_10003ADB0();
    sub_100048F28(v2, 0);
    a1[3] = (uint64_t)&type metadata for ShellThumbnailFactory;
    unint64_t result = sub_100048DEC();
    a1[4] = result;
    *a1 = v4;
  }
  return result;
}

id sub_100048004()
{
  return *(id *)(v0 + 32);
}

uint64_t sub_10004800C@<X0>(uint64_t a1@<X8>)
{
  return sub_10004802C((unsigned int *)&enum case for HostIdentity.main(_:), (uint64_t (*)(void))&type metadata accessor for HostIdentity, a1);
}

uint64_t sub_10004802C@<X0>(unsigned int *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a2(0);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 104);

  return v6(a3, v4, v5);
}

uint64_t sub_10004809C()
{
  swift_retain();
  EventStream.Sink.eventStream.getter();

  return swift_release();
}

uint64_t sub_1000480E4()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.uv.getter();
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Invalidating scene settings is no-op on injected preview shell scenes.", v6, 2u);
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_100048218@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC12PreviewShell9MainScene_sceneCrashedStyle;
  uint64_t v4 = type metadata accessor for SceneCrashedStyle();
  os_log_type_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

id sub_10004828C()
{
  return sub_10004774C();
}

uint64_t sub_1000482A4()
{
  return sub_100048334(&qword_100070BF0, (void (*)(uint64_t))type metadata accessor for MainScene);
}

uint64_t sub_1000482EC()
{
  return sub_100048334(&qword_100071038, (void (*)(uint64_t))type metadata accessor for MainScene);
}

uint64_t sub_100048334(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10004837C(uint64_t a1)
{
  uint64_t result = sub_100048334(&qword_100071040, (void (*)(uint64_t))type metadata accessor for MainScene);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1000483D4(uint64_t a1)
{
  uint64_t result = sub_100048334(&qword_100070C18, (void (*)(uint64_t))type metadata accessor for MainScene);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10004842C()
{
  return sub_100048334(&qword_100070C28, (void (*)(uint64_t))type metadata accessor for HostInjectedScene);
}

uint64_t sub_100048474()
{
  return sub_100048334(&qword_100071048, (void (*)(uint64_t))type metadata accessor for HostInjectedScene);
}

uint64_t sub_1000484BC(uint64_t a1)
{
  uint64_t result = sub_100048334(&qword_100071050, (void (*)(uint64_t))type metadata accessor for HostInjectedScene);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_100048514(uint64_t a1)
{
  uint64_t result = sub_100048334(&qword_100070C38, (void (*)(uint64_t))type metadata accessor for HostInjectedScene);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10004856C()
{
  return sub_100048334(&qword_100071058, (void (*)(uint64_t))type metadata accessor for LocalStaticScene);
}

uint64_t sub_1000485B4()
{
  return sub_100048334(&qword_100071060, (void (*)(uint64_t))type metadata accessor for LocalStaticScene);
}

uint64_t sub_1000485FC(uint64_t a1)
{
  uint64_t result = sub_100048334(&qword_100071068, (void (*)(uint64_t))type metadata accessor for LocalStaticScene);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_100048654(uint64_t a1)
{
  uint64_t result = sub_100048334(&qword_10006FDF8, (void (*)(uint64_t))type metadata accessor for LocalStaticScene);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1000486AC()
{
  return sub_100048334(&qword_100071070, (void (*)(uint64_t))type metadata accessor for SimDisplayScene);
}

uint64_t sub_1000486F4()
{
  return sub_100048334(&qword_100071078, (void (*)(uint64_t))type metadata accessor for SimDisplayScene);
}

uint64_t sub_10004873C(uint64_t a1)
{
  uint64_t result = sub_100048334(&qword_100071080, (void (*)(uint64_t))type metadata accessor for SimDisplayScene);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_100048794(uint64_t a1)
{
  uint64_t result = sub_100048334(&qword_100071088, (void (*)(uint64_t))type metadata accessor for SimDisplayScene);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1000487EC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for SceneCrashedStyle();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  type metadata accessor for InvalidationHandle();
  swift_allocObject();
  *(void *)(v3 + 16) = InvalidationHandle.init(dsoHandle:file:line:column:function:name:)();
  sub_10000758C(&qword_100071090);
  swift_allocObject();
  *(void *)(v3 + 24) = EventStream.Sink.init()();
  uint64_t v12 = v3 + OBJC_IVAR____TtC12PreviewShell9MainScene____lazy_storage___thumbnailSceneCache;
  uint64_t v13 = type metadata accessor for ThumbnailSceneCache();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  swift_weakInit();
  *(void *)(v4 + 32) = a1;
  sub_10002FAF4(a2, (uint64_t)v18, &qword_100071098);
  id v14 = a1;
  SceneCrashedStyle.init(snapshotStyle:redCrossVisible:reloadHandler:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v4 + OBJC_IVAR____TtC12PreviewShell9MainScene_sceneCrashedStyle, v11, v8);
  id v15 = [objc_allocWithZone((Class)PSSceneSettings) initWithSettings:a3];
  sub_10000FD9C(a2, &qword_100071098);
  *(void *)(v4 + 40) = v15;
  return v4;
}

uint64_t sub_100048A20()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100048A58()
{
  return UIScene.sendPreviewSceneAction(_:)();
}

uint64_t sub_100048A84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HostToShellMessage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_100048AE8()
{
  unint64_t result = qword_1000710B8;
  if (!qword_1000710B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000710B8);
  }
  return result;
}

uint64_t sub_100048B3C()
{
  uint64_t v1 = *(void *)(sub_10000758C(&qword_1000710B0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = type metadata accessor for SceneMessageResponder();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100048C5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000758C(&qword_1000710B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100048CC4(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_10000758C(&qword_1000710B0) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_100046C4C(a1, v4);
}

uint64_t sub_100048D38(uint64_t a1)
{
  return sub_1000476D0(a1, v1, &qword_100071078, (void (*)(uint64_t))type metadata accessor for SimDisplayScene);
}

uint64_t sub_100048D84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000758C(&qword_1000710C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_100048DEC()
{
  unint64_t result = qword_1000710D0;
  if (!qword_1000710D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000710D0);
  }
  return result;
}

unint64_t sub_100048E40()
{
  unint64_t result = qword_1000710D8;
  if (!qword_1000710D8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000710D8);
  }
  return result;
}

unint64_t sub_100048E80()
{
  unint64_t result = qword_1000710E0;
  if (!qword_1000710E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000710E0);
  }
  return result;
}

uint64_t sub_100048ED4(void *a1, uint64_t a2)
{
  return sub_10002B494(a1, a2, v2);
}

uint64_t sub_100048EDC(uint64_t a1)
{
  return sub_1000476D0(a1, v1, &qword_100071060, (void (*)(uint64_t))type metadata accessor for LocalStaticScene);
}

uint64_t sub_100048F28(uint64_t a1, char a2)
{
  if (a2) {
    return swift_errorRelease();
  }
  else {
    return swift_release();
  }
}

uint64_t sub_100048F34(uint64_t a1)
{
  return sub_1000476D0(a1, v1, &qword_100071048, (void (*)(uint64_t))type metadata accessor for HostInjectedScene);
}

uint64_t sub_100048F80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000758C((uint64_t *)&unk_1000707A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_100048FE8(uint64_t a1)
{
  return sub_1000476D0(a1, v1, &qword_100071038, (void (*)(uint64_t))type metadata accessor for MainScene);
}

ValueMetadata *type metadata accessor for SceneSnapshotError()
{
  return &type metadata for SceneSnapshotError;
}

ValueMetadata *type metadata accessor for HostInjectedScene.NoCanvasError()
{
  return &type metadata for HostInjectedScene.NoCanvasError;
}

unint64_t sub_10004905C()
{
  unint64_t result = qword_1000710F0;
  if (!qword_1000710F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000710F0);
  }
  return result;
}

unint64_t sub_1000490B4()
{
  unint64_t result = qword_1000710F8;
  if (!qword_1000710F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000710F8);
  }
  return result;
}

unint64_t sub_100049108()
{
  unint64_t result = qword_100071100;
  if (!qword_100071100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071100);
  }
  return result;
}

uint64_t sub_100049170()
{
  sub_10000758C(&qword_100071108);
  type metadata accessor for UIInterfaceOrientation(0);
  sub_100049370();
  Sequence.firstMap<A>(_:)();
  if (v2) {
    return 0;
  }
  else {
    return v1;
  }
}

BOOL sub_100049208@<W0>(uint64_t *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *a1;
  BOOL result = sub_10002A074(*a1);
  if (result && (a2 & 0x18) == 24)
  {
    char v9 = 0;
  }
  else
  {
    BOOL result = sub_10002A084(v5);
    int v8 = result && (a2 & 2) != 0;
    if (!v8) {
      uint64_t v5 = 0;
    }
    char v9 = v8 ^ 1;
  }
  *(void *)a3 = v5;
  *(unsigned char *)(a3 + 8) = v9 & 1;
  return result;
}

uint64_t UIInterfaceOrientation.description.getter()
{
  return 0x446E776F6E6B6E75;
}

uint64_t sub_100049360()
{
  return UIInterfaceOrientation.description.getter();
}

BOOL sub_100049368@<W0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100049208(a1, *(void *)(v2 + 16), a2);
}

unint64_t sub_100049370()
{
  unint64_t result = qword_100071110;
  if (!qword_100071110)
  {
    sub_10000762C(&qword_100071108);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071110);
  }
  return result;
}

ValueMetadata *type metadata accessor for ShellThumbnailFactory()
{
  return &type metadata for ShellThumbnailFactory;
}

uint64_t sub_1000493DC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v7 = v6;
  uint64_t v62 = a4;
  uint64_t v68 = a3;
  uint64_t v60 = a2;
  uint64_t v11 = sub_10000758C(&qword_10006FB38);
  __chkstk_darwin(v11 - 8);
  id v61 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for PreviewSceneRole();
  __chkstk_darwin(v13 - 8);
  id v59 = (char *)&v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t updated = type metadata accessor for SceneUpdateTiming();
  uint64_t v15 = *(void *)(updated - 8);
  __chkstk_darwin(updated);
  uint64_t v64 = (char *)&v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = type metadata accessor for SceneUpdateSeed();
  uint64_t v55 = *(void *)(v56 - 8);
  __chkstk_darwin(v56);
  uint64_t v63 = (char *)&v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for SceneUpdateContext();
  uint64_t v69 = *(void *)(v18 - 8);
  uint64_t v70 = v18;
  uint64_t v19 = __chkstk_darwin(v18);
  uint64_t v58 = (char *)&v53 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = v20;
  __chkstk_darwin(v19);
  int64_t v73 = (char *)&v53 - v21;
  uint64_t v54 = type metadata accessor for Logger();
  uint64_t v53 = *(void *)(v54 - 8);
  __chkstk_darwin(v54);
  uint64_t v23 = (char *)&v53 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  assertMainThread(file:line:column:function:)();
  uint64_t v79 = 0;
  long long v77 = 0u;
  long long v78 = 0u;
  uint64_t v25 = v7[3];
  uint64_t v24 = v7[4];
  uint64_t v26 = type metadata accessor for CanvasUpdater.UpdateDelegate(0);
  swift_allocObject();
  swift_unknownObjectRetain();
  swift_retain();
  uint64_t v72 = v24;
  uint64_t v27 = sub_1000148A4((uint64_t)&v77, v25, v24, a5, a6);
  swift_unknownObjectRelease();
  swift_release();
  unint64_t v74 = v7;
  if (v7[2])
  {
    *(void *)&long long v77 = v7[2];
    sub_10004CBB4(&qword_10006F688);
    Invalidatable.invalidate(dsoHandle:file:line:column:function:)();
  }
  v74[2] = v27;
  swift_retain();
  swift_release();
  static Logger.uv.getter();
  sub_10000FC80((uint64_t)a1, (uint64_t)&v77);
  swift_retain_n();
  uint64_t v28 = Logger.logObject.getter();
  os_log_type_t v29 = static os_log_type_t.default.getter();
  BOOL v30 = os_log_type_enabled(v28, v29);
  unint64_t v71 = a1;
  uint64_t v66 = v27;
  uint64_t v67 = v26;
  if (v30)
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v76 = swift_slowAlloc();
    *(_DWORD *)uint64_t v31 = 136446466;
    swift_getObjectType();
    uint64_t v32 = dispatch thunk of PreviewShellScene.identifier.getter();
    uint64_t v75 = sub_100013F74(v32, v33, &v76);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v31 + 12) = 2082;
    sub_10000FC3C(&v77, *((uint64_t *)&v78 + 1));
    swift_getDynamicType();
    uint64_t v34 = _typeName(_:qualified:)();
    uint64_t v75 = sub_100013F74(v34, v35, &v76);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_10000FCE4((uint64_t)&v77);
    _os_log_impl((void *)&_mh_execute_header, v28, v29, "Canvas %{public}s performing custom update using %{public}s", (uint8_t *)v31, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_release_n();
    sub_10000FCE4((uint64_t)&v77);
  }

  (*(void (**)(char *, uint64_t))(v53 + 8))(v23, v54);
  uint64_t v37 = v61;
  uint64_t v36 = v62;
  uint64_t v38 = v60;
  uint64_t v39 = v58;
  uint64_t v40 = updated;
  uint64_t v41 = v66;
  (*(void (**)(char *, uint64_t, uint64_t))(v55 + 16))(v63, v66 + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_seed, v56);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v64, v38, v40);
  swift_getObjectType();
  dispatch thunk of PreviewShellScene.role.getter();
  unsigned int v42 = v73;
  SceneUpdateContext.init(seed:timing:role:)();
  sub_10000758C(&qword_100071188);
  uint64_t v43 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v37, 1, 1, v43);
  uint64_t v45 = v69;
  uint64_t v44 = v70;
  (*(void (**)(char *, char *, uint64_t))(v69 + 16))(v39, v42, v70);
  unint64_t v46 = (*(unsigned __int8 *)(v45 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80);
  uint64_t v47 = (char *)swift_allocObject();
  *((void *)v47 + 2) = v68;
  *((void *)v47 + 3) = v36;
  *((void *)v47 + 4) = v41;
  (*(void (**)(char *, char *, uint64_t))(v45 + 32))(&v47[v46], v39, v44);
  swift_retain();
  swift_retain();
  Future<A>.init(dsoHandle:file:line:column:function:priority:operation:)();
  uint64_t v48 = v71[3];
  uint64_t v49 = v71[4];
  uint64_t v50 = sub_10000FC3C(v71, v48);
  sub_1000145DC(v41, (uint64_t)v50, (uint64_t)v74, v48, v49);
  sub_10000758C(&qword_10006F000);
  uint64_t v51 = static Future<A>.zip<A, B>(dsoHandle:file:line:column:function:_:_:)();
  *(void *)&long long v77 = v41;
  sub_10004CBB4(&qword_10006F688);
  swift_retain();
  Invalidatable.onInvalidation(_:)();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v73, v44);
  swift_release();
  return v51;
}

uint64_t sub_100049D20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[10] = a3;
  v4[11] = a4;
  v4[8] = a1;
  v4[9] = a2;
  type metadata accessor for MainActor();
  v4[12] = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  v4[13] = v6;
  v4[14] = v5;
  return _swift_task_switch(sub_100049DBC, v6, v5);
}

uint64_t sub_100049DBC()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = (int *)v0[8];
  v0[5] = type metadata accessor for CanvasUpdater.UpdateDelegate(0);
  v0[6] = sub_10004CBB4(&qword_10006F698);
  v0[2] = v1;
  uint64_t v6 = (int *)((char *)v2 + *v2);
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[15] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_100049EF8;
  uint64_t v4 = v0[11];
  return ((uint64_t (*)(void *, void *, uint64_t))v6)(v0 + 7, v0 + 2, v4);
}

uint64_t sub_100049EF8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 104);
    uint64_t v4 = *(void *)(v2 + 112);
    uint64_t v5 = sub_10004A07C;
  }
  else
  {
    sub_10000FCE4(v2 + 16);
    uint64_t v3 = *(void *)(v2 + 104);
    uint64_t v4 = *(void *)(v2 + 112);
    uint64_t v5 = sub_10004A014;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_10004A014()
{
  swift_release();
  v1.n128_u64[0] = *(void *)(v0 + 56);
  uint64_t v2 = *(uint64_t (**)(__n128))(v0 + 8);
  return v2(v1);
}

uint64_t sub_10004A07C()
{
  swift_release();
  sub_10000FCE4(v0 + 16);
  __n128 v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10004A0EC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v25 = a5;
  uint64_t v26 = a6;
  uint64_t v10 = sub_10000758C(&qword_10006FB38);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t updated = type metadata accessor for SceneUpdateTiming();
  uint64_t v14 = *(void *)(updated - 8);
  __chkstk_darwin(updated);
  uint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100038CB8(a2);
  (*(void (**)(char *, void, uint64_t))(v14 + 104))(v16, enum case for SceneUpdateTiming.async(_:), updated);
  sub_10000FC80((uint64_t)a2, (uint64_t)v27);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a1;
  sub_10000E710(v27, v17 + 24);
  swift_retain();
  sub_1000493DC(a2, (uint64_t)v16, a3, a4, (uint64_t)sub_10004C340, v17);
  swift_release();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, updated);
  uint64_t v18 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v12, 1, 1, v18);
  uint64_t v19 = swift_allocObject();
  uint64_t v20 = v26;
  *(void *)(v19 + 16) = v25;
  *(void *)(v19 + 24) = v20;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = &unk_100071168;
  *(void *)(v21 + 24) = v19;
  type metadata accessor for PreviewSnapshot();
  swift_retain();
  uint64_t v22 = Future.then<A>(dsoHandle:file:line:column:function:priority:transform:)();
  swift_release();
  swift_release();
  sub_10004C75C((uint64_t)v12);
  return v22;
}

uint64_t sub_10004A3E0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v7 = sub_10000758C(&qword_100071180);
  uint64_t v8 = a3;
  uint64_t v9 = a2 + *(int *)(v7 + 48);
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v8 + *v8);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v10;
  *uint64_t v10 = v3;
  v10[1] = sub_1000237E8;
  return v12(a1, a2, v9);
}

uint64_t sub_10004A4E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[25] = a4;
  v5[26] = a5;
  v5[23] = a2;
  v5[24] = a3;
  v5[22] = a1;
  uint64_t v6 = *(void *)(a5 - 8);
  v5[27] = v6;
  v5[28] = *(void *)(v6 + 64);
  v5[29] = swift_task_alloc();
  v5[30] = type metadata accessor for MainActor();
  v5[31] = static MainActor.shared.getter();
  uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter();
  v5[32] = v8;
  v5[33] = v7;
  return _swift_task_switch(sub_10004A5E0, v8, v7);
}

uint64_t sub_10004A5E0()
{
  uint64_t v1 = v0[25];
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v0[34] = 0;
  v0[35] = 0xE000000000000000;
  type metadata accessor for ThumbnailHostFactory();
  uint64_t v2 = (int *)ThumbnailHostFactory.makeHost.getter();
  v0[36] = v3;
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = *(void *)(*(void *)(v1 + 40) + 8);
  uint64_t v8 = (int *)((char *)v2 + *v2);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[37] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_10004A718;
  return ((uint64_t (*)(void *, uint64_t, uint64_t))v8)(v0 + 2, v4, v5);
}

uint64_t sub_10004A718()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 304) = v0;
  swift_task_dealloc();
  swift_release();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v2 + 256);
    uint64_t v4 = *(void *)(v2 + 264);
    uint64_t v5 = sub_10004AD8C;
  }
  else
  {
    uint64_t v3 = *(void *)(v2 + 256);
    uint64_t v4 = *(void *)(v2 + 264);
    uint64_t v5 = sub_10004A85C;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_10004A85C()
{
  uint64_t v22 = *(void *)(v0 + 272);
  uint64_t v19 = *(void *)(v0 + 232);
  uint64_t v1 = *(void *)(v0 + 216);
  uint64_t v20 = *(void *)(v0 + 280);
  uint64_t v2 = *(void *)(v0 + 208);
  uint64_t v21 = *(void *)(v0 + 200);
  uint64_t v3 = *(void *)(v0 + 184);
  uint64_t v4 = *(void *)(v0 + 40);
  uint64_t v5 = *(void *)(v0 + 48);
  uint64_t v6 = sub_10000FC3C((void *)(v0 + 16), v4);
  *(void *)(v0 + 80) = v4;
  *(void *)(v0 + 88) = *(void *)(v5 + 8);
  uint64_t v7 = sub_100014CC4((uint64_t *)(v0 + 56));
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(v7, v6, v4);
  sub_10000FC80(v0 + 16, v0 + 96);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v19, v3, v2);
  unint64_t v8 = (*(unsigned __int8 *)(v1 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v9 = (char *)swift_allocObject();
  *((void *)v9 + 2) = v2;
  *((void *)v9 + 3) = v22;
  *((void *)v9 + 4) = v20;
  sub_10000E710((long long *)(v0 + 96), (uint64_t)(v9 + 40));
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(&v9[v8], v19, v2);
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = v22;
  v10[3] = v20;
  v10[4] = v21;
  sub_10000FC80(v0 + 56, v0 + 136);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = v21;
  sub_10000E710((long long *)(v0 + 136), (uint64_t)(v11 + 3));
  v11[8] = &unk_100071130;
  v11[9] = v9;
  v11[10] = &unk_100071140;
  v11[11] = v10;
  uint64_t v12 = type metadata accessor for PreviewSnapshot();
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  swift_retain();
  swift_retain();
  uint64_t v13 = FutureSerialQueue.enqueue<A>(priority:makeFuture:)();
  *(void *)(v0 + 312) = v13;
  swift_release();
  swift_release();
  swift_release();
  sub_10000FCE4(v0 + 56);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v22;
  *(void *)(v14 + 24) = v20;
  Future.observeCancelation(_:)();
  swift_release();
  uint64_t v15 = static MainActor.shared.getter();
  *(void *)(v0 + 320) = v15;
  uint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v0 + 328) = v16;
  *uint64_t v16 = v0;
  v16[1] = sub_10004ABE0;
  uint64_t v17 = *(void *)(v0 + 176);
  return withTaskCancellationHandler<A>(operation:onCancel:isolation:)(v17, &unk_100071150, v13, sub_10004C26C, v13, v15, &protocol witness table for MainActor, v12);
}

uint64_t sub_10004ABE0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 336) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 256);
    uint64_t v4 = *(void *)(v2 + 264);
    uint64_t v5 = sub_10004ADF8;
  }
  else
  {
    swift_release();
    uint64_t v3 = *(void *)(v2 + 256);
    uint64_t v4 = *(void *)(v2 + 264);
    uint64_t v5 = sub_10004ACFC;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_10004ACFC()
{
  swift_release();
  swift_release();
  sub_10000FCE4(v0 + 16);
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10004AD8C()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10004ADF8()
{
  swift_release();
  swift_release();
  swift_release();
  sub_10000FCE4(v0 + 16);
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10004AE8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[9] = a6;
  v7[10] = a7;
  v7[7] = a4;
  v7[8] = a5;
  v7[5] = a2;
  v7[6] = a3;
  void v7[4] = a1;
  uint64_t v8 = type metadata accessor for Logger();
  v7[11] = v8;
  v7[12] = *(void *)(v8 - 8);
  v7[13] = swift_task_alloc();
  type metadata accessor for MainActor();
  v7[14] = static MainActor.shared.getter();
  uint64_t v10 = dispatch thunk of Actor.unownedExecutor.getter();
  v7[15] = v10;
  v7[16] = v9;
  return _swift_task_switch(sub_10004AF8C, v10, v9);
}

uint64_t sub_10004AF8C()
{
  uint64_t v24 = v0;
  uint64_t v1 = v0;
  static Logger.uv.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = v0[12];
    uint64_t v21 = v0[11];
    uint64_t v22 = v0[13];
    unint64_t v5 = v0[8];
    uint64_t v20 = v0[7];
    uint64_t v6 = swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315394;
    sub_10004C2C0();
    uint64_t v7 = _typeName(_:qualified:)();
    v0[2] = sub_100013F74(v7, v8, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[3] = sub_100013F74(v20, v5, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Hosting thumbnail content for %s, state = %s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v22, v21);
  }
  else
  {
    uint64_t v10 = v0[12];
    uint64_t v9 = v0[13];
    uint64_t v11 = v1[11];
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  }
  uint64_t v12 = (void *)v1[9];
  uint64_t v13 = v12[3];
  uint64_t v14 = v12[4];
  sub_10000FC3C(v12, v13);
  uint64_t v15 = (void *)swift_task_alloc();
  v1[17] = v15;
  *uint64_t v15 = v1;
  v15[1] = sub_10004B21C;
  uint64_t v17 = v1[5];
  uint64_t v16 = v1[6];
  uint64_t v18 = v1[10];
  return dispatch thunk of ThumbnailHost.displayThumbnailAndPerformHandshake(for:context:delegate:)(v18, v16, v17, v13, v14);
}

uint64_t sub_10004B21C(double a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 144) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = *(void *)(v4 + 120);
    uint64_t v6 = *(void *)(v4 + 128);
    uint64_t v7 = sub_10004B3C0;
  }
  else
  {
    *(double *)(v4 + 152) = a1;
    uint64_t v5 = *(void *)(v4 + 120);
    uint64_t v6 = *(void *)(v4 + 128);
    uint64_t v7 = sub_10004B340;
  }
  return _swift_task_switch(v7, v5, v6);
}

uint64_t sub_10004B340()
{
  uint64_t v1 = v0[19];
  uint64_t v2 = (void *)v0[4];
  swift_release();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  os_log_type_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_10004B3C0()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10004B42C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void v6[6] = a5;
  v6[7] = a6;
  v6[4] = a1;
  v6[5] = a4;
  uint64_t v8 = type metadata accessor for Logger();
  v6[8] = v8;
  v6[9] = *(void *)(v8 - 8);
  v6[10] = swift_task_alloc();
  v6[11] = *a3;
  type metadata accessor for MainActor();
  v6[12] = static MainActor.shared.getter();
  uint64_t v10 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10004B530, v10, v9);
}

uint64_t sub_10004B530()
{
  uint64_t v20 = v0;
  uint64_t v1 = v0;
  swift_release();
  static Logger.uv.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = v0[9];
    uint64_t v17 = v0[8];
    uint64_t v18 = v0[10];
    unint64_t v5 = v0[6];
    uint64_t v16 = v0[5];
    uint64_t v6 = swift_slowAlloc();
    v19[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315394;
    sub_10004C2C0();
    uint64_t v7 = _typeName(_:qualified:)();
    v0[2] = sub_100013F74(v7, v8, v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[3] = sub_100013F74(v16, v5, v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Generating thumbnail snapshot for %s, state = %s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v18, v17);
  }
  else
  {
    uint64_t v9 = v0[9];
    uint64_t v10 = v0[10];
    uint64_t v11 = v1[8];
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
  }
  swift_getObjectType();
  dispatch thunk of PreviewShellScene.takeSnapshot()();
  uint64_t v12 = (void *)dispatch thunk of PreviewShellScene.windowScene.getter();
  id v13 = [v12 screen];

  [v13 scale];
  PreviewSnapshot.init(image:selectableRegions:cornerRadius:scaleFactor:)();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v1[1];
  return v14();
}

uint64_t sub_10004B838(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.uv.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v17 = a2;
    uint64_t v12 = v11;
    uint64_t v20 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315394;
    sub_10004C2C0();
    uint64_t v13 = _typeName(_:qualified:)();
    uint64_t v15 = sub_100013F74(v13, v14, &v20);
    uint64_t v18 = v5;
    uint64_t v19 = v15;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_100013F74(v17, a3, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Thumbnail generation canceled for %s, state = %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v18);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

uint64_t sub_10004BA8C(uint64_t a1)
{
  v1[2] = type metadata accessor for MainActor();
  v1[3] = static MainActor.shared.getter();
  os_log_type_t v3 = (void *)swift_task_alloc();
  v1[4] = v3;
  *os_log_type_t v3 = v1;
  v3[1] = sub_10004BB50;
  return Future<A>.value.getter(a1);
}

uint64_t sub_10004BB50()
{
  *(void *)(*(void *)v1 + 40) = v0;
  swift_task_dealloc();
  uint64_t v3 = dispatch thunk of Actor.unownedExecutor.getter();
  if (v0) {
    uint64_t v4 = sub_10004BD10;
  }
  else {
    uint64_t v4 = sub_10004BCAC;
  }
  return _swift_task_switch(v4, v3, v2);
}

uint64_t sub_10004BCAC()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10004BD10()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10004BD74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = *v4;
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_100020810;
  return sub_10004A4E8(a1, a2, a3, v10, a4);
}

uint64_t sub_10004BE3C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 80) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_bridgeObjectRelease();
  sub_10000FCE4(v0 + 40);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10004BF08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = v3[3];
  uint64_t v9 = v3[4];
  uint64_t v10 = (uint64_t)(v3 + 5);
  uint64_t v11 = (uint64_t)v3
      + ((*(unsigned __int8 *)(*(void *)(v3[2] - 8) + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3[2] - 8) + 80));
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v12;
  *uint64_t v12 = v4;
  v12[1] = sub_1000237E8;
  return sub_10004AE8C(a1, a2, a3, v8, v9, v10, v11);
}

uint64_t sub_10004C020()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10004C060(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = v3[2];
  uint64_t v9 = v3[3];
  uint64_t v10 = v3[4];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v11;
  *uint64_t v11 = v4;
  v11[1] = sub_1000237E8;
  return sub_10004B42C(a1, a2, a3, v8, v9, v10);
}

uint64_t sub_10004C12C()
{
  swift_release();
  sub_10000FCE4(v0 + 24);
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 96, 7);
}

uint64_t sub_10004C17C()
{
  return sub_10004A0EC(v0[2], v0 + 3, v0[8], v0[9], v0[10], v0[11]);
}

uint64_t sub_10004C190()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10004C1C8(uint64_t a1)
{
  return sub_10004B838(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10004C1D0(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1000237E8;
  return sub_10004BA8C(a1);
}

uint64_t sub_10004C26C()
{
  return dispatch thunk of Future.cancel(dsoHandle:file:line:column:function:)();
}

unint64_t sub_10004C2C0()
{
  unint64_t result = qword_100071158;
  if (!qword_100071158)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100071158);
  }
  return result;
}

uint64_t sub_10004C300()
{
  swift_release();
  sub_10000FCE4(v0 + 24);

  return _swift_deallocObject(v0, 64, 7);
}

void sub_10004C340(uint64_t a1)
{
  sub_10003AD88(a1, *(void *)(v1 + 16), (void *)(v1 + 24));
}

uint64_t sub_10004C34C(uint64_t a1, void *a2, uint64_t a3, int *a4)
{
  *(void *)(v4 + 16) = *a2;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)a4 + *a4);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v4 + 24) = v7;
  *uint64_t v7 = v4;
  v7[1] = sub_10004C448;
  return v9(a1, a3, v4 + 16);
}

uint64_t sub_10004C448()
{
  *(void *)(*(void *)v1 + 32) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_10004C574;
  }
  else {
    uint64_t v2 = sub_10004C55C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10004C55C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10004C574()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10004C58C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10004C5C4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v8 = *(int **)(v3 + 16);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_100020810;
  uint64_t v10 = (uint64_t (*)(uint64_t, void *, uint64_t, int *))((char *)&dword_100071160 + dword_100071160);
  return v10(a1, a2, a3, v8);
}

uint64_t sub_10004C694(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_1000237E8;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100071170 + dword_100071170);
  return v8(a1, a2, v6);
}

uint64_t sub_10004C75C(uint64_t a1)
{
  uint64_t v2 = sub_10000758C(&qword_10006FB38);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10004C7BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a1;
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_10004C874;
  return sub_100049D20(a2, a3, a4, a5);
}

uint64_t sub_10004C874(double a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (!v1) {
    **(double **)(v4 + 16) = a1;
  }
  uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
  return v6();
}

uint64_t sub_10004C984()
{
  uint64_t updated = type metadata accessor for SceneUpdateContext();
  uint64_t v2 = *(void *)(updated - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, updated);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10004CA58(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for SceneUpdateContext() - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_1000237E8;
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_100071190 + dword_100071190);
  return v10(a1, v5, v6, v7, v8);
}

uint64_t sub_10004CB60()
{
  return dispatch thunk of Future.cancel(dsoHandle:file:line:column:function:)();
}

uint64_t sub_10004CBB4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CanvasUpdater.UpdateDelegate(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t LocalizedError.helpAnchor.getter()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t LocalizedError.failureReason.getter()
{
  return LocalizedError.failureReason.getter();
}

uint64_t LocalizedError.recoverySuggestion.getter()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t URL.absoluteURL.getter()
{
  return URL.absoluteURL.getter();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return type metadata accessor for URL.DirectoryHint();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.appendingPathComponent(_:)()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URL.path.getter()
{
  return URL.path.getter();
}

uint64_t URL.appending<A>(component:directoryHint:)()
{
  return URL.appending<A>(component:directoryHint:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t type metadata accessor for ServiceHubService()
{
  return type metadata accessor for ServiceHubService();
}

uint64_t PreviewAgentConnector.init(pid:agentBundle:serverFarm:sceneInjector:)()
{
  return PreviewAgentConnector.init(pid:agentBundle:serverFarm:sceneInjector:)();
}

uint64_t PreviewAgentConnector.pid.getter()
{
  return PreviewAgentConnector.pid.getter();
}

uint64_t type metadata accessor for PreviewAgentConnector()
{
  return type metadata accessor for PreviewAgentConnector();
}

uint64_t PreviewSceneAgentProxy.generateStaticOutput<A>(for:expecting:)()
{
  return PreviewSceneAgentProxy.generateStaticOutput<A>(for:expecting:)();
}

uint64_t PreviewSceneAgentProxy.sendCommitPostSynchronize()()
{
  return PreviewSceneAgentProxy.sendCommitPostSynchronize()();
}

uint64_t PreviewSceneAgentProxy.scene.getter()
{
  return PreviewSceneAgentProxy.scene.getter();
}

uint64_t PreviewSceneAgentProxy.perform<A>(update:with:delegate:expecting:)()
{
  return PreviewSceneAgentProxy.perform<A>(update:with:delegate:expecting:)();
}

uint64_t type metadata accessor for PreviewSceneAgentProxy()
{
  return type metadata accessor for PreviewSceneAgentProxy();
}

uint64_t PreviewAgentLauncherRegistry.registerLauncher(_:for:)()
{
  return PreviewAgentLauncherRegistry.registerLauncher(_:for:)();
}

uint64_t type metadata accessor for PreviewAgentLauncherRegistry()
{
  return type metadata accessor for PreviewAgentLauncherRegistry();
}

uint64_t PreviewAgentLauncherRegistry.subscript.getter()
{
  return PreviewAgentLauncherRegistry.subscript.getter();
}

uint64_t type metadata accessor for PreviewAgentJITBootstrapMethod()
{
  return type metadata accessor for PreviewAgentJITBootstrapMethod();
}

uint64_t PreviewAgentLaunchConfiguration.binaryType.getter()
{
  return PreviewAgentLaunchConfiguration.binaryType.getter();
}

uint64_t PreviewAgentLaunchConfiguration.agentBundle.getter()
{
  return PreviewAgentLaunchConfiguration.agentBundle.getter();
}

uint64_t PreviewAgentLaunchConfiguration.environment.getter()
{
  return PreviewAgentLaunchConfiguration.environment.getter();
}

uint64_t PreviewAgentLaunchConfiguration.arguments.getter()
{
  return PreviewAgentLaunchConfiguration.arguments.getter();
}

uint64_t type metadata accessor for PreviewAgentLaunchConfiguration()
{
  return type metadata accessor for PreviewAgentLaunchConfiguration();
}

uint64_t PreviewSnapshot.makeRenderPayload()()
{
  return PreviewSnapshot.makeRenderPayload()();
}

uint64_t PreviewSnapshot.init(image:selectableRegions:cornerRadius:scaleFactor:)()
{
  return PreviewSnapshot.init(image:selectableRegions:cornerRadius:scaleFactor:)();
}

uint64_t type metadata accessor for PreviewSnapshot()
{
  return type metadata accessor for PreviewSnapshot();
}

uint64_t dispatch thunk of PreviewShellSceneBinder.bind(scene:)()
{
  return dispatch thunk of PreviewShellSceneBinder.bind(scene:)();
}

uint64_t PreviewShellPluginRegistry.sceneBinder.getter()
{
  return PreviewShellPluginRegistry.sceneBinder.getter();
}

uint64_t PreviewShellPluginRegistry.sceneConfigurator.getter()
{
  return PreviewShellPluginRegistry.sceneConfigurator.getter();
}

uint64_t static PreviewShellPluginRegistry.load<A>(using:location:)()
{
  return static PreviewShellPluginRegistry.load<A>(using:location:)();
}

uint64_t PreviewShellPluginRegistry.launchers.getter()
{
  return PreviewShellPluginRegistry.launchers.getter();
}

uint64_t PreviewShellPluginRegistry.providers.getter()
{
  return PreviewShellPluginRegistry.providers.getter();
}

uint64_t type metadata accessor for PreviewShellPluginRegistry()
{
  return type metadata accessor for PreviewShellPluginRegistry();
}

Swift::Void __swiftcall PreviewShellServiceProtocol.activateServers()()
{
}

uint64_t dispatch thunk of PreviewShellSceneConfigurator.configure(sceneSettings:for:)()
{
  return dispatch thunk of PreviewShellSceneConfigurator.configure(sceneSettings:for:)();
}

uint64_t dispatch thunk of PreviewShellScene.windowScene.getter()
{
  return dispatch thunk of PreviewShellScene.windowScene.getter();
}

uint64_t dispatch thunk of PreviewShellScene.identifier.getter()
{
  return dispatch thunk of PreviewShellScene.identifier.getter();
}

uint64_t dispatch thunk of PreviewShellScene.crashedStyle.getter()
{
  return dispatch thunk of PreviewShellScene.crashedStyle.getter();
}

uint64_t dispatch thunk of PreviewShellScene.hostIdentity.getter()
{
  return dispatch thunk of PreviewShellScene.hostIdentity.getter();
}

uint64_t dispatch thunk of PreviewShellScene.stoppedStyle.getter()
{
  return dispatch thunk of PreviewShellScene.stoppedStyle.getter();
}

uint64_t dispatch thunk of PreviewShellScene.takeSnapshot()()
{
  return dispatch thunk of PreviewShellScene.takeSnapshot()();
}

uint64_t dispatch thunk of PreviewShellScene.sceneSettings.getter()
{
  return dispatch thunk of PreviewShellScene.sceneSettings.getter();
}

uint64_t dispatch thunk of PreviewShellScene.role.getter()
{
  return dispatch thunk of PreviewShellScene.role.getter();
}

uint64_t static PreviewShellPlugin.previewShellSceneBinder.getter()
{
  return static PreviewShellPlugin.previewShellSceneBinder.getter();
}

uint64_t static PreviewShellPlugin.previewShellSceneConfigurator.getter()
{
  return static PreviewShellPlugin.previewShellSceneConfigurator.getter();
}

uint64_t ContentKey.init(for:with:)()
{
  return ContentKey.init(for:with:)();
}

uint64_t type metadata accessor for ContentKey()
{
  return type metadata accessor for ContentKey();
}

uint64_t ServerFarm.serviceHubServer.getter()
{
  return ServerFarm.serviceHubServer.getter();
}

uint64_t ServerFarm.jitBootstrapAgentServer.getter()
{
  return ServerFarm.jitBootstrapAgentServer.getter();
}

uint64_t ServerFarm.init()()
{
  return ServerFarm.init()();
}

uint64_t type metadata accessor for ServerFarm()
{
  return type metadata accessor for ServerFarm();
}

uint64_t dispatch thunk of static CategoryMap.entryPoints.getter()
{
  return dispatch thunk of static CategoryMap.entryPoints.getter();
}

uint64_t static CategoryMap.contentCategories.getter()
{
  return static CategoryMap.contentCategories.getter();
}

uint64_t static CategoryMap.unhandled(_:)()
{
  return static CategoryMap.unhandled(_:)();
}

uint64_t type metadata accessor for ProcessError()
{
  return type metadata accessor for ProcessError();
}

uint64_t BatchIdentity.deviceType.getter()
{
  return BatchIdentity.deviceType.getter();
}

uint64_t BatchIdentity.agentBundle.getter()
{
  return BatchIdentity.agentBundle.getter();
}

uint64_t BatchIdentity.workspaceID.getter()
{
  return BatchIdentity.workspaceID.getter();
}

uint64_t type metadata accessor for BatchIdentity()
{
  return type metadata accessor for BatchIdentity();
}

uint64_t BatchIdentity.init(_:_:)()
{
  return BatchIdentity.init(_:_:)();
}

uint64_t SceneInjector.init(injectScene:)()
{
  return SceneInjector.init(injectScene:)();
}

uint64_t type metadata accessor for SceneInjector()
{
  return type metadata accessor for SceneInjector();
}

uint64_t static ContentProvider<>.decode(updatePayload:)()
{
  return static ContentProvider<>.decode(updatePayload:)();
}

uint64_t ContentProvider.handleHostMessageStream(_:instance:)()
{
  return ContentProvider.handleHostMessageStream(_:instance:)();
}

uint64_t static ProcessUtilities.processHandle(for:)()
{
  return static ProcessUtilities.processHandle(for:)();
}

uint64_t static ProcessUtilities.kill(processHandle:)()
{
  return static ProcessUtilities.kill(processHandle:)();
}

uint64_t dispatch thunk of CanvasContentHost.didActivate()()
{
  return dispatch thunk of CanvasContentHost.didActivate()();
}

uint64_t dispatch thunk of CanvasContentHost.didDeactivate()()
{
  return dispatch thunk of CanvasContentHost.didDeactivate()();
}

uint64_t dispatch thunk of CanvasContentHost.viewController.getter()
{
  return dispatch thunk of CanvasContentHost.viewController.getter();
}

uint64_t dispatch thunk of CanvasContentHost.confirmReadyForDisplayAfterAsyncResize()()
{
  return dispatch thunk of CanvasContentHost.confirmReadyForDisplayAfterAsyncResize()();
}

uint64_t CanvasGridControl.init(configuration:thumbnailHostFactory:action:)()
{
  return CanvasGridControl.init(configuration:thumbnailHostFactory:action:)();
}

uint64_t type metadata accessor for CanvasGridControl()
{
  return type metadata accessor for CanvasGridControl();
}

uint64_t SceneCrashedStyle.init(snapshotStyle:redCrossVisible:reloadHandler:)()
{
  return SceneCrashedStyle.init(snapshotStyle:redCrossVisible:reloadHandler:)();
}

uint64_t SceneCrashedStyle.snapshotStyle.getter()
{
  return SceneCrashedStyle.snapshotStyle.getter();
}

uint64_t static SceneCrashedStyle.none.getter()
{
  return static SceneCrashedStyle.none.getter();
}

uint64_t static SceneCrashedStyle.default.getter()
{
  return static SceneCrashedStyle.default.getter();
}

uint64_t type metadata accessor for SceneCrashedStyle()
{
  return type metadata accessor for SceneCrashedStyle();
}

uint64_t SceneStoppedStyle.snapshotStyle.getter()
{
  return SceneStoppedStyle.snapshotStyle.getter();
}

uint64_t static SceneStoppedStyle.none.getter()
{
  return static SceneStoppedStyle.none.getter();
}

uint64_t static SceneStoppedStyle.default.getter()
{
  return static SceneStoppedStyle.default.getter();
}

uint64_t type metadata accessor for SceneStoppedStyle()
{
  return type metadata accessor for SceneStoppedStyle();
}

uint64_t type metadata accessor for AgentLocatingError()
{
  return type metadata accessor for AgentLocatingError();
}

uint64_t CanvasUpdateOutput.makeStaticOutput.getter()
{
  return CanvasUpdateOutput.makeStaticOutput.getter();
}

uint64_t CanvasUpdateOutput.hostedOutput.getter()
{
  return CanvasUpdateOutput.hostedOutput.getter();
}

uint64_t CanvasUpdateOutput.controlStates.getter()
{
  return CanvasUpdateOutput.controlStates.getter();
}

uint64_t CanvasUpdateOutput.staticChromeType.getter()
{
  return CanvasUpdateOutput.staticChromeType.getter();
}

uint64_t CanvasUpdateOutput.controlDescriptions.getter()
{
  return CanvasUpdateOutput.controlDescriptions.getter();
}

uint64_t type metadata accessor for CanvasUpdateOutput()
{
  return type metadata accessor for CanvasUpdateOutput();
}

uint64_t CanvasUpdateResult.init<>(staticChromeType:makeStaticOutput:controlConfiguration:controlStates:)()
{
  return CanvasUpdateResult.init<>(staticChromeType:makeStaticOutput:controlConfiguration:controlStates:)();
}

uint64_t type metadata accessor for CanvasUpdateResult()
{
  return type metadata accessor for CanvasUpdateResult();
}

uint64_t LocalSnapshotError.init(window:)()
{
  return LocalSnapshotError.init(window:)();
}

uint64_t type metadata accessor for LocalSnapshotError()
{
  return type metadata accessor for LocalSnapshotError();
}

uint64_t UnknownProcessType.init(processType:)()
{
  return UnknownProcessType.init(processType:)();
}

uint64_t type metadata accessor for UnknownProcessType()
{
  return type metadata accessor for UnknownProcessType();
}

uint64_t type metadata accessor for SceneSettingsPolicy()
{
  return type metadata accessor for SceneSettingsPolicy();
}

uint64_t SceneSettingsUpdate.init(sceneSettings:transitionContext:)()
{
  return SceneSettingsUpdate.init(sceneSettings:transitionContext:)();
}

uint64_t SceneSettingsUpdate.sceneSettings.getter()
{
  return SceneSettingsUpdate.sceneSettings.getter();
}

uint64_t type metadata accessor for SceneSettingsUpdate()
{
  return type metadata accessor for SceneSettingsUpdate();
}

uint64_t ThumbnailSceneCache.init(in:makeHostingViewController:)()
{
  return ThumbnailSceneCache.init(in:makeHostingViewController:)();
}

uint64_t type metadata accessor for ThumbnailSceneCache()
{
  return type metadata accessor for ThumbnailSceneCache();
}

uint64_t dispatch thunk of CanvasUpdateDelegate.notePreviewSuppressed(presentation:)()
{
  return dispatch thunk of CanvasUpdateDelegate.notePreviewSuppressed(presentation:)();
}

uint64_t dispatch thunk of CanvasUpdateDelegate.adjust(preferences:fenceHandle:)()
{
  return dispatch thunk of CanvasUpdateDelegate.adjust(preferences:fenceHandle:)();
}

uint64_t ThumbnailHostFactory.makeHost.getter()
{
  return ThumbnailHostFactory.makeHost.getter();
}

uint64_t static ThumbnailHostFactory.remoteHostFactory(expectedGeometry:previewAgentConnector:makeUpdate:validateReply:)()
{
  return static ThumbnailHostFactory.remoteHostFactory(expectedGeometry:previewAgentConnector:makeUpdate:validateReply:)();
}

uint64_t type metadata accessor for ThumbnailHostFactory()
{
  return type metadata accessor for ThumbnailHostFactory();
}

uint64_t static AggregatingHostServer.ConnectionMonitor.Status.== infix(_:_:)()
{
  return static AggregatingHostServer.ConnectionMonitor.Status.== infix(_:_:)();
}

uint64_t AggregatingHostServer.ConnectionMonitor.status.getter()
{
  return AggregatingHostServer.ConnectionMonitor.status.getter();
}

uint64_t AggregatingHostServer.ConnectionMonitor.$status.getter()
{
  return AggregatingHostServer.ConnectionMonitor.$status.getter();
}

uint64_t AggregatingHostServer.connectionMonitor.getter()
{
  return AggregatingHostServer.connectionMonitor.getter();
}

uint64_t ConnectViewController.init()()
{
  return ConnectViewController.init()();
}

uint64_t type metadata accessor for ConnectViewController()
{
  return type metadata accessor for ConnectViewController();
}

uint64_t CrashedViewController.init(style:snapshotImage:)()
{
  return CrashedViewController.init(style:snapshotImage:)();
}

uint64_t type metadata accessor for CrashedViewController()
{
  return type metadata accessor for CrashedViewController();
}

uint64_t StoppedViewController.init(style:snapshotImage:)()
{
  return StoppedViewController.init(style:snapshotImage:)();
}

uint64_t type metadata accessor for StoppedViewController()
{
  return type metadata accessor for StoppedViewController();
}

uint64_t dispatch thunk of ProviderUpdateDelegate.notePreviewCrashed(pid:)()
{
  return dispatch thunk of ProviderUpdateDelegate.notePreviewCrashed(pid:)();
}

uint64_t dispatch thunk of ProviderUpdateDelegate.notePreviewStopped()()
{
  return dispatch thunk of ProviderUpdateDelegate.notePreviewStopped()();
}

uint64_t UnknownContentCategory.init(category:)()
{
  return UnknownContentCategory.init(category:)();
}

uint64_t type metadata accessor for UnknownContentCategory()
{
  return type metadata accessor for UnknownContentCategory();
}

uint64_t static AgentSceneConfiguration.mainSceneConfiguration(in:)()
{
  return static AgentSceneConfiguration.mainSceneConfiguration(in:)();
}

uint64_t AgentSceneConfiguration.previewShellScene.getter()
{
  return AgentSceneConfiguration.previewShellScene.getter();
}

uint64_t static AgentSceneConfiguration.previewSceneConfiguration(in:specification:)()
{
  return static AgentSceneConfiguration.previewSceneConfiguration(in:specification:)();
}

uint64_t AgentSceneConfiguration.sceneIdentifier.getter()
{
  return AgentSceneConfiguration.sceneIdentifier.getter();
}

uint64_t AgentSceneConfiguration.sceneSpecification.getter()
{
  return AgentSceneConfiguration.sceneSpecification.getter();
}

uint64_t type metadata accessor for AgentSceneConfiguration()
{
  return type metadata accessor for AgentSceneConfiguration();
}

uint64_t ContentProviderRegistry.register<A>(provider:for:override:)()
{
  return ContentProviderRegistry.register<A>(provider:for:override:)();
}

{
  return ContentProviderRegistry.register<A>(provider:for:override:)();
}

{
  return ContentProviderRegistry.register<A>(provider:for:override:)();
}

uint64_t ContentProviderRegistry.boxRecipe(for:)()
{
  return ContentProviderRegistry.boxRecipe(for:)();
}

uint64_t type metadata accessor for ContentProviderRegistry()
{
  return type metadata accessor for ContentProviderRegistry();
}

uint64_t dispatch thunk of NonUIContentProviderBox.performUpdate(using:updatePayload:previewType:agentContext:)()
{
  return dispatch thunk of NonUIContentProviderBox.performUpdate(using:updatePayload:previewType:agentContext:)();
}

uint64_t dispatch thunk of CanvasContentProviderBox.notePreviewCrashed(pid:)()
{
  return dispatch thunk of CanvasContentProviderBox.notePreviewCrashed(pid:)();
}

uint64_t dispatch thunk of CanvasContentProviderBox.performUpdate(using:providerPromise:updatePayload:controlStates:agentContext:makeSceneContext:delegate:)()
{
  return dispatch thunk of CanvasContentProviderBox.performUpdate(using:providerPromise:updatePayload:controlStates:agentContext:makeSceneContext:delegate:)();
}

uint64_t dispatch thunk of CanvasContentProviderBox.invalidateProviders()()
{
  return dispatch thunk of CanvasContentProviderBox.invalidateProviders()();
}

uint64_t CanvasControlConfiguration.init(build:)()
{
  return CanvasControlConfiguration.init(build:)();
}

uint64_t type metadata accessor for CanvasControlConfiguration()
{
  return type metadata accessor for CanvasControlConfiguration();
}

uint64_t static CanvasControlConfigurationBuilder.buildBlock<A>(_:)()
{
  return static CanvasControlConfigurationBuilder.buildBlock<A>(_:)();
}

uint64_t static CanvasControlConfigurationBuilder.buildOptional<A>(_:)()
{
  return static CanvasControlConfigurationBuilder.buildOptional<A>(_:)();
}

uint64_t static CanvasControlConfigurationBuilder.buildExpression<A>(_:)()
{
  return static CanvasControlConfigurationBuilder.buildExpression<A>(_:)();
}

uint64_t static CanvasControlConfigurationBuilder.buildFinalResult<A>(_:)()
{
  return static CanvasControlConfigurationBuilder.buildFinalResult<A>(_:)();
}

uint64_t Agent.deviceType.getter()
{
  return Agent.deviceType.getter();
}

uint64_t Agent.agentBundle.getter()
{
  return Agent.agentBundle.getter();
}

uint64_t Agent.batchIdentity.getter()
{
  return Agent.batchIdentity.getter();
}

uint64_t Agent.applyUpdateFor(payload:)()
{
  return Agent.applyUpdateFor(payload:)();
}

uint64_t Agent.pid.getter()
{
  return Agent.pid.getter();
}

uint64_t Agent.kill()()
{
  return Agent.kill()();
}

uint64_t Agent.launch(with:killing:)()
{
  return Agent.launch(with:killing:)();
}

uint64_t Agent.init(launcher:batchIdentity:jitBootstrapAgentServer:jitBootstrapTimeout:)()
{
  return Agent.init(launcher:batchIdentity:jitBootstrapAgentServer:jitBootstrapTimeout:)();
}

uint64_t type metadata accessor for Agent()
{
  return type metadata accessor for Agent();
}

uint64_t type metadata accessor for PreviewStructure()
{
  return type metadata accessor for PreviewStructure();
}

uint64_t RefinedPreviewPayload.init(previewPayload:requestedGroupIndex:)()
{
  return RefinedPreviewPayload.init(previewPayload:requestedGroupIndex:)();
}

uint64_t type metadata accessor for RefinedPreviewPayload()
{
  return type metadata accessor for RefinedPreviewPayload();
}

uint64_t SceneMessenger.init(actionSender:)()
{
  return SceneMessenger.init(actionSender:)();
}

uint64_t SceneMessenger.receiveAction(_:)()
{
  return SceneMessenger.receiveAction(_:)();
}

uint64_t SceneMessenger.messageReceiver.setter()
{
  return SceneMessenger.messageReceiver.setter();
}

uint64_t SceneMessenger.send(message:)()
{
  return SceneMessenger.send(message:)();
}

uint64_t SceneUpdateSeed.init()()
{
  return SceneUpdateSeed.init()();
}

uint64_t type metadata accessor for SceneUpdateSeed()
{
  return type metadata accessor for SceneUpdateSeed();
}

uint64_t SceneUpdateTiming.unknownTimingError.getter()
{
  return SceneUpdateTiming.unknownTimingError.getter();
}

uint64_t type metadata accessor for SceneUpdateTiming()
{
  return type metadata accessor for SceneUpdateTiming();
}

uint64_t type metadata accessor for HostToShellMessage()
{
  return type metadata accessor for HostToShellMessage();
}

uint64_t PreviewPreferences.preferredSize.getter()
{
  return PreviewPreferences.preferredSize.getter();
}

uint64_t type metadata accessor for PreviewPreferences.InterfaceOrientation()
{
  return type metadata accessor for PreviewPreferences.InterfaceOrientation();
}

uint64_t PreviewPreferences.preferredOrientation.getter()
{
  return PreviewPreferences.preferredOrientation.getter();
}

uint64_t type metadata accessor for PreviewPreferences()
{
  return type metadata accessor for PreviewPreferences();
}

uint64_t type metadata accessor for ShellToHostMessage()
{
  return type metadata accessor for ShellToHostMessage();
}

uint64_t SceneMessageResponder.reply(error:)()
{
  return SceneMessageResponder.reply(error:)();
}

uint64_t SceneMessageResponder.reply(result:)()
{
  return SceneMessageResponder.reply(result:)();
}

uint64_t type metadata accessor for SceneMessageResponder()
{
  return type metadata accessor for SceneMessageResponder();
}

uint64_t type metadata accessor for SuppressedPresentation()
{
  return type metadata accessor for SuppressedPresentation();
}

uint64_t BinaryType.cpuType.getter()
{
  return BinaryType.cpuType.getter();
}

uint64_t BinaryType.cpuSubtype.getter()
{
  return BinaryType.cpuSubtype.getter();
}

uint64_t type metadata accessor for BinaryType()
{
  return type metadata accessor for BinaryType();
}

uint64_t type metadata accessor for ChromeType()
{
  return type metadata accessor for ChromeType();
}

uint64_t type metadata accessor for DeviceType()
{
  return type metadata accessor for DeviceType();
}

uint64_t type metadata accessor for PreviewType.HostLocation()
{
  return type metadata accessor for PreviewType.HostLocation();
}

uint64_t type metadata accessor for PreviewType()
{
  return type metadata accessor for PreviewType();
}

uint64_t type metadata accessor for ProcessType()
{
  return type metadata accessor for ProcessType();
}

uint64_t type metadata accessor for SceneLayout()
{
  return type metadata accessor for SceneLayout();
}

uint64_t type metadata accessor for HostIdentity()
{
  return type metadata accessor for HostIdentity();
}

uint64_t PurgePayload.killAgents.getter()
{
  return PurgePayload.killAgents.getter();
}

uint64_t PurgePayload.workspaceID.getter()
{
  return PurgePayload.workspaceID.getter();
}

uint64_t LaunchPayload.environment.getter()
{
  return LaunchPayload.environment.getter();
}

uint64_t LaunchPayload.processType.getter()
{
  return LaunchPayload.processType.getter();
}

uint64_t LaunchPayload.agentDescriptor.getter()
{
  return LaunchPayload.agentDescriptor.getter();
}

uint64_t type metadata accessor for LaunchPayload()
{
  return type metadata accessor for LaunchPayload();
}

uint64_t type metadata accessor for PreviewTraits.Orientation()
{
  return type metadata accessor for PreviewTraits.Orientation();
}

uint64_t type metadata accessor for RenderPayload()
{
  return type metadata accessor for RenderPayload();
}

uint64_t type metadata accessor for HostUpdateSeed()
{
  return type metadata accessor for HostUpdateSeed();
}

uint64_t OSCapabilities.init(supportsExecutionPoints:supportsPreviewVariants:supportsContentOverrides:supportsScreenshotRequests:supportsNSPreviewHostableMacPreviews:supportsNSPreviewHostableCatalystPreviews:supportsPerUpdateMessageStreams:supportsRegistryPreviews:supportsExternalRegistries:jitCapabilities:)()
{
  return OSCapabilities.init(supportsExecutionPoints:supportsPreviewVariants:supportsContentOverrides:supportsScreenshotRequests:supportsNSPreviewHostableMacPreviews:supportsNSPreviewHostableCatalystPreviews:supportsPerUpdateMessageStreams:supportsRegistryPreviews:supportsExternalRegistries:jitCapabilities:)();
}

uint64_t type metadata accessor for PreviewPayload()
{
  return type metadata accessor for PreviewPayload();
}

uint64_t AgentDescriptor.Bundle.init(bundleID:path:)()
{
  return AgentDescriptor.Bundle.init(bundleID:path:)();
}

uint64_t AgentDescriptor.Bundle.bundleID.getter()
{
  return AgentDescriptor.Bundle.bundleID.getter();
}

uint64_t type metadata accessor for AgentDescriptor.Bundle()
{
  return type metadata accessor for AgentDescriptor.Bundle();
}

uint64_t AgentDescriptor.bundle.getter()
{
  return AgentDescriptor.bundle.getter();
}

uint64_t type metadata accessor for AgentDescriptor()
{
  return type metadata accessor for AgentDescriptor();
}

uint64_t static ContentCategory.source(_:)()
{
  return static ContentCategory.source(_:)();
}

uint64_t static ContentCategory.previewProvider.getter()
{
  return static ContentCategory.previewProvider.getter();
}

uint64_t static ContentCategory.previewPreflight.getter()
{
  return static ContentCategory.previewPreflight.getter();
}

uint64_t static ContentCategory.registryExecution.getter()
{
  return static ContentCategory.registryExecution.getter();
}

uint64_t static ContentCategory.registryPreflight.getter()
{
  return static ContentCategory.registryPreflight.getter();
}

uint64_t static ContentCategory.runningAppPreview.getter()
{
  return static ContentCategory.runningAppPreview.getter();
}

uint64_t static ContentCategory.cFunction.getter()
{
  return static ContentCategory.cFunction.getter();
}

uint64_t type metadata accessor for ContentCategory()
{
  return type metadata accessor for ContentCategory();
}

uint64_t type metadata accessor for ContentOverride()
{
  return type metadata accessor for ContentOverride();
}

uint64_t GeometryPayload.selectableRegions.getter()
{
  return GeometryPayload.selectableRegions.getter();
}

uint64_t type metadata accessor for GeometryPayload()
{
  return type metadata accessor for GeometryPayload();
}

uint64_t JITCapabilities.init(supportsJITLinking:supportsLoadCommands:)()
{
  return JITCapabilities.init(supportsJITLinking:supportsLoadCommands:)();
}

uint64_t static JITCapabilities.userDefaultSupportsJITLinking.getter()
{
  return static JITCapabilities.userDefaultSupportsJITLinking.getter();
}

uint64_t type metadata accessor for ContentIdentifier()
{
  return type metadata accessor for ContentIdentifier();
}

uint64_t type metadata accessor for ThumbnailGeometry()
{
  return type metadata accessor for ThumbnailGeometry();
}

uint64_t HostedPreviewReply.init(hostIdentity:sceneLayout:controlDescriptions:controlStates:contentPayload:)()
{
  return HostedPreviewReply.init(hostIdentity:sceneLayout:controlDescriptions:controlStates:contentPayload:)();
}

uint64_t type metadata accessor for HostedPreviewReply()
{
  return type metadata accessor for HostedPreviewReply();
}

uint64_t ShellUpdatePayload.hostUpdateSeed.getter()
{
  return ShellUpdatePayload.hostUpdateSeed.getter();
}

uint64_t ShellUpdatePayload.setupPayload.getter()
{
  return ShellUpdatePayload.setupPayload.getter();
}

uint64_t ShellUpdatePayload.contentPayload.getter()
{
  return ShellUpdatePayload.contentPayload.getter();
}

uint64_t ShellUpdatePayload.previewType.getter()
{
  return ShellUpdatePayload.previewType.getter();
}

uint64_t ShellUpdatePayload.controlStates.getter()
{
  return ShellUpdatePayload.controlStates.getter();
}

uint64_t ShellUpdatePayload.staticProducts.getter()
{
  return ShellUpdatePayload.staticProducts.getter();
}

uint64_t ShellUpdatePayload.contentCategory.getter()
{
  return ShellUpdatePayload.contentCategory.getter();
}

uint64_t ShellUpdatePayload.contentOverride.getter()
{
  return ShellUpdatePayload.contentOverride.getter();
}

uint64_t ShellUpdatePayload.contentIdentifier.getter()
{
  return ShellUpdatePayload.contentIdentifier.getter();
}

uint64_t ShellUpdatePayload.init(pid:hostUpdateSeed:previewType:contentIdentifier:contentCategory:contentOverride:contentPayload:staticProducts:setupPayload:controlStates:)()
{
  return ShellUpdatePayload.init(pid:hostUpdateSeed:previewType:contentIdentifier:contentCategory:contentOverride:contentPayload:staticProducts:setupPayload:controlStates:)();
}

uint64_t ShellUpdatePayload.pid.getter()
{
  return ShellUpdatePayload.pid.getter();
}

uint64_t type metadata accessor for ShellUpdatePayload()
{
  return type metadata accessor for ShellUpdatePayload();
}

uint64_t StaticPreviewReply.init(chromeType:controlDescriptions:controlStates:contentPayload:)()
{
  return StaticPreviewReply.init(chromeType:controlDescriptions:controlStates:contentPayload:)();
}

uint64_t type metadata accessor for StaticPreviewReply()
{
  return type metadata accessor for StaticPreviewReply();
}

uint64_t UpdateSetupPayload.shellDidLoadStaticProducts.setter()
{
  return UpdateSetupPayload.shellDidLoadStaticProducts.setter();
}

uint64_t type metadata accessor for UpdateSetupPayload()
{
  return type metadata accessor for UpdateSetupPayload();
}

uint64_t static PreviewVariantGroup.colorSchemeVariantGroup.getter()
{
  return static PreviewVariantGroup.colorSchemeVariantGroup.getter();
}

uint64_t static PreviewVariantGroup.dynamicTypeVariantGroup.getter()
{
  return static PreviewVariantGroup.dynamicTypeVariantGroup.getter();
}

uint64_t static PreviewVariantGroup.orientationVariantGroup.getter()
{
  return static PreviewVariantGroup.orientationVariantGroup.getter();
}

uint64_t type metadata accessor for PreviewVariantGroup()
{
  return type metadata accessor for PreviewVariantGroup();
}

uint64_t type metadata accessor for SimulatorDevicePayload()
{
  return type metadata accessor for SimulatorDevicePayload();
}

uint64_t CanvasControlDescription.ControlType.GridConfiguration.Item.init(title:)()
{
  return CanvasControlDescription.ControlType.GridConfiguration.Item.init(title:)();
}

uint64_t type metadata accessor for CanvasControlDescription.ControlType.GridConfiguration.Item()
{
  return type metadata accessor for CanvasControlDescription.ControlType.GridConfiguration.Item();
}

uint64_t CanvasControlDescription.ControlType.GridConfiguration.Section.init(title:items:)()
{
  return CanvasControlDescription.ControlType.GridConfiguration.Section.init(title:items:)();
}

uint64_t type metadata accessor for CanvasControlDescription.ControlType.GridConfiguration.Section()
{
  return type metadata accessor for CanvasControlDescription.ControlType.GridConfiguration.Section();
}

uint64_t CanvasControlDescription.ControlType.GridConfiguration.init(sections:)()
{
  return CanvasControlDescription.ControlType.GridConfiguration.init(sections:)();
}

uint64_t type metadata accessor for CanvasControlDescription.ControlType.GridConfiguration()
{
  return type metadata accessor for CanvasControlDescription.ControlType.GridConfiguration();
}

uint64_t PrepareToRelaunchPayload.agentDescriptor.getter()
{
  return PrepareToRelaunchPayload.agentDescriptor.getter();
}

uint64_t static GridIndex.== infix(_:_:)()
{
  return static GridIndex.== infix(_:_:)();
}

uint64_t type metadata accessor for GridIndex()
{
  return type metadata accessor for GridIndex();
}

uint64_t ProcessID.pid.getter()
{
  return ProcessID.pid.getter();
}

uint64_t AgentUpdate.init(entryPointCategory:entryPointPayload:entryPointFrameworkPath:context:)()
{
  return AgentUpdate.init(entryPointCategory:entryPointPayload:entryPointFrameworkPath:context:)();
}

uint64_t AgentUpdate.Context.setupPayload.setter()
{
  return AgentUpdate.Context.setupPayload.setter();
}

uint64_t AgentUpdate.Context.init(contentIdentifier:updateSeed:setupPayload:)()
{
  return AgentUpdate.Context.init(contentIdentifier:updateSeed:setupPayload:)();
}

uint64_t type metadata accessor for AgentUpdate.Context()
{
  return type metadata accessor for AgentUpdate.Context();
}

uint64_t type metadata accessor for AgentUpdate()
{
  return type metadata accessor for AgentUpdate();
}

uint64_t type metadata accessor for PreviewSceneRole()
{
  return type metadata accessor for PreviewSceneRole();
}

uint64_t static EntryPointCategory.previewInstance.getter()
{
  return static EntryPointCategory.previewInstance.getter();
}

uint64_t static EntryPointCategory.previewProvider.getter()
{
  return static EntryPointCategory.previewProvider.getter();
}

uint64_t static EntryPointCategory.previewPreflight.getter()
{
  return static EntryPointCategory.previewPreflight.getter();
}

uint64_t static EntryPointCategory.registryExecution.getter()
{
  return static EntryPointCategory.registryExecution.getter();
}

uint64_t static EntryPointCategory.registryPreflight.getter()
{
  return static EntryPointCategory.registryPreflight.getter();
}

uint64_t static EntryPointCategory.cFunction.getter()
{
  return static EntryPointCategory.cFunction.getter();
}

uint64_t type metadata accessor for EntryPointCategory()
{
  return type metadata accessor for EntryPointCategory();
}

uint64_t SceneUpdateContext.init(seed:timing:role:)()
{
  return SceneUpdateContext.init(seed:timing:role:)();
}

uint64_t SceneUpdateContext.timing.setter()
{
  return SceneUpdateContext.timing.setter();
}

uint64_t type metadata accessor for SceneUpdateContext()
{
  return type metadata accessor for SceneUpdateContext();
}

uint64_t PreviewDebugOverlay.identifier.setter()
{
  return PreviewDebugOverlay.identifier.setter();
}

Swift::Void __swiftcall PreviewDebugOverlay.bringToFront()()
{
}

uint64_t type metadata accessor for PreviewDebugOverlay.AlignmentEdge()
{
  return type metadata accessor for PreviewDebugOverlay.AlignmentEdge();
}

Swift::Void __swiftcall PreviewDebugOverlay.contentsUpdated()()
{
}

uint64_t PreviewDebugOverlay.init(edge:parent:)()
{
  return PreviewDebugOverlay.init(edge:parent:)();
}

uint64_t PreviewDebugOverlay.size.setter()
{
  return PreviewDebugOverlay.size.setter();
}

uint64_t type metadata accessor for PreviewDebugOverlay()
{
  return type metadata accessor for PreviewDebugOverlay();
}

uint64_t SceneUpdateHandshake.updateSeed.getter()
{
  return SceneUpdateHandshake.updateSeed.getter();
}

uint64_t SceneUpdateHandshake.fenceHandle.getter()
{
  return SceneUpdateHandshake.fenceHandle.getter();
}

uint64_t SceneUpdateHandshake.preferences.getter()
{
  return SceneUpdateHandshake.preferences.getter();
}

uint64_t SceneUpdateHandshake.timing.getter()
{
  return SceneUpdateHandshake.timing.getter();
}

uint64_t type metadata accessor for SceneUpdateHandshake()
{
  return type metadata accessor for SceneUpdateHandshake();
}

uint64_t CounterRotationViewController.init(contentView:contentOrientation:)()
{
  return CounterRotationViewController.init(contentView:contentOrientation:)();
}

uint64_t type metadata accessor for CounterRotationViewController()
{
  return type metadata accessor for CounterRotationViewController();
}

uint64_t Identifier.init()()
{
  return Identifier.init()();
}

uint64_t type metadata accessor for Identifier()
{
  return type metadata accessor for Identifier();
}

uint64_t EventStream.Sink.eventStream.getter()
{
  return EventStream.Sink.eventStream.getter();
}

uint64_t EventStream.Sink.send(_:)()
{
  return EventStream.Sink.send(_:)();
}

uint64_t EventStream.Sink.send<A>()()
{
  return EventStream.Sink.send<A>()();
}

uint64_t EventStream.Sink.init()()
{
  return EventStream.Sink.init()();
}

uint64_t EventStream.observe(dsoHandle:file:line:column:function:_:)()
{
  return EventStream.observe(dsoHandle:file:line:column:function:_:)();
}

uint64_t KeyValueMap.guaranteedValue(for:creatingIfNecessaryWith:)()
{
  return KeyValueMap.guaranteedValue(for:creatingIfNecessaryWith:)();
}

uint64_t type metadata accessor for Unreachable()
{
  return type metadata accessor for Unreachable();
}

uint64_t Unreachable.init(_:diagnostics:file:line:column:function:)()
{
  return Unreachable.init(_:diagnostics:file:line:column:function:)();
}

uint64_t type metadata accessor for PropertyList()
{
  return type metadata accessor for PropertyList();
}

uint64_t static ExecutionLane.any.getter()
{
  return static ExecutionLane.any.getter();
}

uint64_t static ExecutionLane.main.getter()
{
  return static ExecutionLane.main.getter();
}

uint64_t ExecutionLane.execute(_:)()
{
  return ExecutionLane.execute(_:)();
}

uint64_t type metadata accessor for ExecutionLane()
{
  return type metadata accessor for ExecutionLane();
}

uint64_t Invalidatable.invalidate(dsoHandle:file:line:column:function:)()
{
  return Invalidatable.invalidate(dsoHandle:file:line:column:function:)();
}

uint64_t Invalidatable.isInvalidated.getter()
{
  return Invalidatable.isInvalidated.getter();
}

uint64_t Invalidatable.onInvalidation(on:_:)()
{
  return Invalidatable.onInvalidation(on:_:)();
}

uint64_t Invalidatable.onInvalidation(_:)()
{
  return Invalidatable.onInvalidation(_:)();
}

uint64_t Invalidatable.trackInvalidation(dsoHandle:file:line:column:function:of:)()
{
  return Invalidatable.trackInvalidation(dsoHandle:file:line:column:function:of:)();
}

uint64_t AnyInvalidatable.invalidate(file:line:column:function:trace:)()
{
  return AnyInvalidatable.invalidate(file:line:column:function:trace:)();
}

uint64_t assertMainThread(file:line:column:function:)()
{
  return assertMainThread(file:line:column:function:)();
}

uint64_t CancellationToken.cancel(dsoHandle:file:line:column:function:)()
{
  return CancellationToken.cancel(dsoHandle:file:line:column:function:)();
}

uint64_t type metadata accessor for CancellationToken()
{
  return type metadata accessor for CancellationToken();
}

Swift::Void __swiftcall DelayedInvocation.cancel()()
{
}

Swift::Void __swiftcall DelayedInvocation.schedule(delay:)(Swift::Double delay)
{
}

uint64_t DelayedInvocation.init<A>(scheduler:callback:)()
{
  return DelayedInvocation.init<A>(scheduler:callback:)();
}

uint64_t type metadata accessor for DelayedInvocation()
{
  return type metadata accessor for DelayedInvocation();
}

uint64_t DispatchScheduler.init(queue:)()
{
  return DispatchScheduler.init(queue:)();
}

uint64_t type metadata accessor for DispatchScheduler()
{
  return type metadata accessor for DispatchScheduler();
}

uint64_t FutureSerialQueue.init(on:)()
{
  return FutureSerialQueue.init(on:)();
}

uint64_t FutureSerialQueue.enqueue<A>(priority:makeFuture:)()
{
  return FutureSerialQueue.enqueue<A>(priority:makeFuture:)();
}

uint64_t type metadata accessor for FutureSerialQueue()
{
  return type metadata accessor for FutureSerialQueue();
}

uint64_t static InvalidationTrace.empty.getter()
{
  return static InvalidationTrace.empty.getter();
}

uint64_t type metadata accessor for InvalidationTrace()
{
  return type metadata accessor for InvalidationTrace();
}

uint64_t assertUnreachable(file:line:column:function:)()
{
  return assertUnreachable(file:line:column:function:)();
}

uint64_t HumanReadableError.isNativeHumanReadable.getter()
{
  return HumanReadableError.isNativeHumanReadable.getter();
}

uint64_t HumanReadableError.canTryAgain.getter()
{
  return HumanReadableError.canTryAgain.getter();
}

uint64_t HumanReadableError.highValueTitle.getter()
{
  return HumanReadableError.highValueTitle.getter();
}

uint64_t HumanReadableError.isPotentialCrash.getter()
{
  return HumanReadableError.isPotentialCrash.getter();
}

uint64_t HumanReadableError.collectDiagnostics(into:)()
{
  return HumanReadableError.collectDiagnostics(into:)();
}

uint64_t HumanReadableError.plistRepresentation.getter()
{
  return HumanReadableError.plistRepresentation.getter();
}

uint64_t HumanReadableError.errorTypeDescription.getter()
{
  return HumanReadableError.errorTypeDescription.getter();
}

uint64_t HumanReadableError.fullDiagnosticsOutput.getter()
{
  return HumanReadableError.fullDiagnosticsOutput.getter();
}

uint64_t HumanReadableError.options.getter()
{
  return HumanReadableError.options.getter();
}

uint64_t HumanReadableError.severity.getter()
{
  return HumanReadableError.severity.getter();
}

uint64_t InvalidationHandle.init(dsoHandle:file:line:column:function:name:)()
{
  return InvalidationHandle.init(dsoHandle:file:line:column:function:name:)();
}

uint64_t type metadata accessor for InvalidationHandle()
{
  return type metadata accessor for InvalidationHandle();
}

uint64_t EventStreamObservable.init(wrappedValue:emitsInitialValue:)()
{
  return EventStreamObservable.init(wrappedValue:emitsInitialValue:)();
}

uint64_t EventStreamObservable.wrappedValue.getter()
{
  return EventStreamObservable.wrappedValue.getter();
}

uint64_t EventStreamObservable.wrappedValue.setter()
{
  return EventStreamObservable.wrappedValue.setter();
}

uint64_t EventStreamObservable.projectedValue.getter()
{
  return EventStreamObservable.projectedValue.getter();
}

uint64_t ConcurrentInvalidatable.trackInvalidation(of:)()
{
  return ConcurrentInvalidatable.trackInvalidation(of:)();
}

uint64_t PropertyListRepresentable.propertyList.getter()
{
  return PropertyListRepresentable.propertyList.getter();
}

uint64_t PropertyListRepresentable.init(propertyList:)()
{
  return PropertyListRepresentable.init(propertyList:)();
}

uint64_t PropertyListRepresentable.serializableDictionary.getter()
{
  return PropertyListRepresentable.serializableDictionary.getter();
}

uint64_t PropertyListRepresentable.init(serializableDictionary:)()
{
  return PropertyListRepresentable.init(serializableDictionary:)();
}

uint64_t ConcurrentInvalidationHandle.init(dsoHandle:file:line:column:function:name:)()
{
  return ConcurrentInvalidationHandle.init(dsoHandle:file:line:column:function:name:)();
}

uint64_t type metadata accessor for ConcurrentInvalidationHandle()
{
  return type metadata accessor for ConcurrentInvalidationHandle();
}

uint64_t isXTP.getter()
{
  return isXTP.getter();
}

uint64_t Future.mapSuccess<A>(dsoHandle:file:line:column:function:on:_:)()
{
  return Future.mapSuccess<A>(dsoHandle:file:line:column:function:on:_:)();
}

uint64_t Future.ignoringValue(dsoHandle:file:line:column:function:)()
{
  return Future.ignoringValue(dsoHandle:file:line:column:function:)();
}

uint64_t Future.observeFinish(_:)()
{
  return Future.observeFinish(_:)();
}

uint64_t Future.observeFailure(on:_:)()
{
  return Future.observeFailure(on:_:)();
}

uint64_t Future.observeSuccess(on:_:)()
{
  return Future.observeSuccess(on:_:)();
}

uint64_t Future.observeSuccess(_:)()
{
  return Future.observeSuccess(_:)();
}

uint64_t Future.observeCompletion(on:_:)()
{
  return Future.observeCompletion(on:_:)();
}

uint64_t Future.observeCancelation(_:)()
{
  return Future.observeCancelation(_:)();
}

uint64_t Future.then<A>(dsoHandle:file:line:column:function:on:transform:)()
{
  return Future.then<A>(dsoHandle:file:line:column:function:on:transform:)();
}

uint64_t Future.then<A>(dsoHandle:file:line:column:function:priority:transform:)()
{
  return Future.then<A>(dsoHandle:file:line:column:function:priority:transform:)();
}

uint64_t dispatch thunk of Future.cancel(dsoHandle:file:line:column:function:)()
{
  return dispatch thunk of Future.cancel(dsoHandle:file:line:column:function:)();
}

uint64_t static Future.create(dsoHandle:file:line:column:function:)()
{
  return static Future.create(dsoHandle:file:line:column:function:)();
}

uint64_t static Future.failed(dsoHandle:file:line:column:function:_:)()
{
  return static Future.failed(dsoHandle:file:line:column:function:_:)();
}

uint64_t Future.tryThen<A>(dsoHandle:file:line:column:function:on:transform:)()
{
  return Future.tryThen<A>(dsoHandle:file:line:column:function:on:transform:)();
}

uint64_t static Future.completed(dsoHandle:file:line:column:function:_:)()
{
  return static Future.completed(dsoHandle:file:line:column:function:_:)();
}

uint64_t Future.__allocating_init(dsoHandle:file:line:column:function:callback:)()
{
  return Future.__allocating_init(dsoHandle:file:line:column:function:callback:)();
}

uint64_t static Future.inverting(dsoHandle:file:line:column:function:accumulateErrors:_:)()
{
  return static Future.inverting(dsoHandle:file:line:column:function:accumulateErrors:_:)();
}

uint64_t static Future.succeeded(dsoHandle:file:line:column:function:_:)()
{
  return static Future.succeeded(dsoHandle:file:line:column:function:_:)();
}

uint64_t Future<A>.init(dsoHandle:file:line:column:function:priority:operation:)()
{
  return Future<A>.init(dsoHandle:file:line:column:function:priority:operation:)();
}

uint64_t static Future<A>.zip<A, B>(dsoHandle:file:line:column:function:_:_:)()
{
  return static Future<A>.zip<A, B>(dsoHandle:file:line:column:function:_:_:)();
}

uint64_t static Future<A>.succeeded(dsoHandle:file:line:column:function:)()
{
  return static Future<A>.succeeded(dsoHandle:file:line:column:function:)();
}

uint64_t type metadata accessor for Future()
{
  return type metadata accessor for Future();
}

uint64_t Promise.trySucceed(with:)()
{
  return Promise.trySucceed(with:)();
}

uint64_t Promise.fail(with:)()
{
  return Promise.fail(with:)();
}

uint64_t Promise.succeed(with:)()
{
  return Promise.succeed(with:)();
}

uint64_t Promise<A>.trySucceed()()
{
  return Promise<A>.trySucceed()();
}

uint64_t PreviewGroupMetadata.firstSection.getter()
{
  return PreviewGroupMetadata.firstSection.getter();
}

uint64_t PreviewGroupMetadata.moreSections.getter()
{
  return PreviewGroupMetadata.moreSections.getter();
}

uint64_t PreviewGroupMetadata.Section.previewCount.getter()
{
  return PreviewGroupMetadata.Section.previewCount.getter();
}

uint64_t PreviewGroupMetadata.Section.title.getter()
{
  return PreviewGroupMetadata.Section.title.getter();
}

uint64_t type metadata accessor for PreviewGroupMetadata.Section()
{
  return type metadata accessor for PreviewGroupMetadata.Section();
}

uint64_t type metadata accessor for PreviewGroupMetadata()
{
  return type metadata accessor for PreviewGroupMetadata();
}

uint64_t static PreviewSourceContentCategory.uiKitView.getter()
{
  return static PreviewSourceContentCategory.uiKitView.getter();
}

uint64_t static PreviewSourceContentCategory.swiftUIView.getter()
{
  return static PreviewSourceContentCategory.swiftUIView.getter();
}

uint64_t type metadata accessor for PreviewSourceContentCategory()
{
  return type metadata accessor for PreviewSourceContentCategory();
}

uint64_t static Logger.uv.getter()
{
  return static Logger.uv.getter();
}

uint64_t static Logger.previews.getter()
{
  return static Logger.previews.getter();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
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

uint64_t static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
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

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t Sequence.firstMap<A>(_:)()
{
  return Sequence.firstMap<A>(_:)();
}

uint64_t Sequence.traverse<A>(dsoHandle:file:line:column:function:andAccumulateErrors:_:)()
{
  return Sequence.traverse<A>(dsoHandle:file:line:column:function:andAccumulateErrors:_:)();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
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

uint64_t Array.description.getter()
{
  return Array.description.getter();
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

uint64_t AsyncStream.makeAsyncIterator()()
{
  return AsyncStream.makeAsyncIterator()();
}

Swift::Void __swiftcall Task.cancel()()
{
}

uint64_t Double.description.getter()
{
  return Double.description.getter();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t static CATransaction.afterSynchronize()()
{
  return static CATransaction.afterSynchronize()();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t RBSProcessHandle.applicationProcess.getter()
{
  return RBSProcessHandle.applicationProcess.getter();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t static UIColor.shellTintColor.getter()
{
  return static UIColor.shellTintColor.getter();
}

uint64_t UIScene.sendPreviewSceneAction(_:)()
{
  return UIScene.sendPreviewSceneAction(_:)();
}

uint64_t UIScene.setPreviewSceneActionHandler(_:)()
{
  return UIScene.setPreviewSceneActionHandler(_:)();
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t NSString.init(stringLiteral:)()
{
  return NSString.init(stringLiteral:)();
}

uint64_t Optional.log.getter()
{
  return Optional.log.getter();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
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

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.member(for:)()
{
  return __CocoaSet.member(for:)();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return _StringGuts._slowWithCString<A>(_:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _getErrorEmbeddedNSError<A>(_:)()
{
  return _getErrorEmbeddedNSError<A>(_:)();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return DefaultStringInterpolation.appendInterpolation<A>(_:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
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

uint64_t _typeName(_:qualified:)()
{
  return _typeName(_:qualified:)();
}

uint64_t BSInterfaceOrientationDescription()
{
  return _BSInterfaceOrientationDescription();
}

uint64_t BSStringFromCGRect()
{
  return _BSStringFromCGRect();
}

uint64_t BSStringFromCGSize()
{
  return _BSStringFromCGSize();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFRelease(CFTypeRef cf)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

uint64_t UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper()
{
  return _UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper();
}

uint64_t UVPreviewSceneLayoutDescription()
{
  return _UVPreviewSceneLayoutDescription();
}

uint64_t UVSceneIdentifierToPersistenceIdentifier()
{
  return _UVSceneIdentifierToPersistenceIdentifier();
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

uint64_t _swift_stdlib_strtod_clocale()
{
  return __swift_stdlib_strtod_clocale();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
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

uint64_t swift_getDynamicType()
{
  return _swift_getDynamicType();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
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

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStaticObject()
{
  return _swift_initStaticObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_projectBox()
{
  return _swift_projectBox();
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

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
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

uint64_t swift_weakAssign()
{
  return _swift_weakAssign();
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

uint64_t swift_willThrowTypedImpl()
{
  return _swift_willThrowTypedImpl();
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _[a1 auditToken];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_hostHandle(void *a1, const char *a2, ...)
{
  return _[a1 hostHandle];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return _[a1 pid];
}

id objc_msgSend_setTargetOfEventDeferringEnvironments_(void *a1, const char *a2, ...)
{
  return [a1 setTargetOfEventDeferringEnvironments:];
}