uint64_t sub_100005574()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t vars8;

  v0 = sub_10000720C(&qword_1000184F0);
  v1 = sub_1000086A4(&qword_1000184F8, &qword_1000184F0);

  return TabView<>.init(content:)(sub_100005608, 0, v0, v1);
}

uint64_t sub_100005608@<X0>(char *a1@<X8>)
{
  v29 = a1;
  uint64_t v28 = sub_10000720C(&qword_100018500);
  uint64_t v25 = *(void *)(v28 - 8);
  uint64_t v1 = v25;
  uint64_t v2 = __chkstk_darwin(v28);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v6 = (char *)&v23 - v5;
  uint64_t v7 = sub_10000720C(&qword_100018508);
  uint64_t v27 = *(void *)(v7 - 8);
  uint64_t v8 = v27;
  uint64_t v9 = __chkstk_darwin(v7);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v23 - v12;
  sub_100007298();
  View.tabItem<A>(_:)();
  v30 = sub_1000065C0;
  uint64_t v31 = 0;
  char v32 = 0;
  sub_1000072EC();
  v24 = v6;
  View.tabItem<A>(_:)();
  v14 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v26 = v11;
  v14(v11, v13, v7);
  v15 = *(void (**)(char *, char *, uint64_t))(v1 + 16);
  v16 = v6;
  uint64_t v17 = v28;
  v15(v4, v16, v28);
  v18 = v29;
  v14(v29, v11, v7);
  uint64_t v19 = sub_10000720C(&qword_100018520);
  v15(&v18[*(int *)(v19 + 48)], v4, v17);
  v20 = *(void (**)(char *, uint64_t))(v25 + 8);
  v20(v24, v17);
  v21 = *(void (**)(char *, uint64_t))(v27 + 8);
  v21(v13, v7);
  v20(v4, v17);
  return ((uint64_t (*)(char *, uint64_t))v21)(v26, v7);
}

uint64_t sub_100005920@<X0>(uint64_t a1@<X8>)
{
  return sub_10000594C(a1);
}

uint64_t sub_100005934@<X0>(uint64_t a1@<X8>)
{
  return sub_10000594C(a1);
}

uint64_t sub_10000594C@<X0>(uint64_t a1@<X8>)
{
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t result = Text.init(_:tableName:bundle:comment:)();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_1000059AC()
{
  uint64_t v0 = sub_10000720C(&qword_1000184D0);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000720C(&qword_1000184D8);
  sub_1000086A4(&qword_1000184E0, &qword_1000184D8);
  WindowGroup.init(id:title:lazyContent:)();
  sub_1000086A4(&qword_1000184E8, &qword_1000184D0);
  static SceneBuilder.buildBlock<A>(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

id sub_100005B34()
{
  type metadata accessor for AssetMovieViewController();
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  return [v0 init];
}

uint64_t sub_100005B7C()
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)();
}

uint64_t sub_100005BB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000086F8();

  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100005C1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000086F8();

  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100005C80()
{
  return static View._viewListCount(inputs:)();
}

void sub_100005C9C()
{
}

uint64_t sub_100005CC4@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_100005CD0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10000720C(&qword_100018528);
  uint64_t v3 = *(void *)(v2 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v89 = (char *)v85 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for iosmacHardware();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v9 = (char *)v85 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  v98 = (char *)v85 - v11;
  __chkstk_darwin(v10);
  v105 = (uint64_t (*)@<X0>(uint64_t *@<X8>))((char *)v85 - v12);
  uint64_t v13 = static iosmacHardware.allCases.getter();
  *(void *)(v1 + 16) = v13;
  unint64_t v14 = sub_1000063D8((uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v15 = *(void *)(v13 + 16);
  if (v15)
  {
    v106 = (void *)v14;
    uint64_t v86 = v3;
    uint64_t v87 = v2;
    uint64_t v88 = v1;
    uint64_t v17 = *(void (**)(char *, uint64_t (*)@<X0>(uint64_t *@<X8>), uint64_t))(v6 + 16);
    uint64_t v16 = v6 + 16;
    uint64_t v18 = *(unsigned __int8 *)(v16 + 64);
    uint64_t v19 = (v18 + 32) & ~v18;
    uint64_t v20 = v13 + v19;
    uint64_t v93 = *(void *)(v16 + 56);
    uint64_t v94 = v16;
    uint64_t v96 = v19 + v7;
    v97 = v17;
    uint64_t v95 = v18 | 7;
    v21 = (void (**)(void, void, void))(v16 + 16);
    v92 = (void (**)(uint64_t (*)@<X0>(uint64_t *@<X8>), uint64_t))(v16 - 8);
    v85[1] = v13;
    swift_bridgeObjectRetain();
    v22 = 0;
    uint64_t v23 = 0;
    v24 = 0;
    uint64_t v25 = 0;
    v26 = v105;
    uint64_t v90 = v19;
    uint64_t v91 = v5;
    while (1)
    {
      uint64_t v102 = (uint64_t)v22;
      uint64_t v103 = v25;
      uint64_t v107 = v23;
      v104 = v24;
      uint64_t v100 = v20;
      uint64_t v101 = v15;
      uint64_t v27 = v20;
      uint64_t v28 = v97;
      v97((char *)v26, (uint64_t (*)@<X0>(uint64_t *@<X8>))v27, v5);
      uint64_t v29 = v5;
      uint64_t v30 = iosmacHardware.imageName.getter();
      uint64_t v32 = v31 ? v30 : 7104878;
      uint64_t v33 = v31 ? v31 : 0xE300000000000000;
      v34 = v98;
      v28(v98, v105, v5);
      uint64_t v35 = swift_allocObject();
      *(void *)(v35 + 16) = v32;
      *(void *)(v35 + 24) = v33;
      uint64_t v36 = v35 + v19;
      v37 = v34;
      v38 = v105;
      v39 = v21;
      v99 = (void (*)(uint64_t, char *, uint64_t))*v21;
      v99(v36, v37, v29);
      swift_bridgeObjectRetain();
      sub_100007770(v102);
      v40 = v9;
      v41 = v9;
      v42 = v38;
      uint64_t v43 = v29;
      uint64_t v44 = v33;
      v28(v41, v38, v43);
      uint64_t v45 = swift_allocObject();
      *(void *)(v45 + 16) = sub_1000076EC;
      *(void *)(v45 + 24) = v35;
      uint64_t v102 = v35;
      uint64_t v107 = v45;
      sub_100007770((uint64_t)v104);
      v46 = v106;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v108 = v46;
      uint64_t v48 = v32;
      unint64_t v50 = sub_1000075A8(v32, v44);
      uint64_t v51 = v46[2];
      BOOL v52 = (v49 & 1) == 0;
      uint64_t v53 = v51 + v52;
      if (__OFADD__(v51, v52)) {
        break;
      }
      char v54 = v49;
      if (v46[3] >= v53)
      {
        v58 = v40;
        if (isUniquelyReferenced_nonNull_native)
        {
          v55 = v106;
        }
        else
        {
          sub_100007BF8();
          v55 = v108;
        }
      }
      else
      {
        sub_1000077C4(v53, isUniquelyReferenced_nonNull_native);
        v55 = v108;
        unint64_t v56 = sub_1000075A8(v48, v44);
        if ((v54 & 1) != (v57 & 1)) {
          goto LABEL_29;
        }
        unint64_t v50 = v56;
        v58 = v40;
      }
      v21 = v39;
      swift_bridgeObjectRelease();
      uint64_t v59 = swift_bridgeObjectRetain();
      v26 = v42;
      uint64_t v9 = v58;
      if ((v54 & 1) == 0)
      {
        uint64_t v60 = (*(uint64_t (**)(uint64_t))(v107 + 16))(v59);
        v55[(v50 >> 6) + 8] |= 1 << v50;
        v61 = (uint64_t *)(v55[6] + 16 * v50);
        uint64_t *v61 = v48;
        v61[1] = v44;
        v62 = (uint64_t *)(v55[7] + 32 * v50);
        uint64_t *v62 = v60;
        v62[1] = v63;
        v62[2] = v64;
        v62[3] = v65;
        uint64_t v66 = v55[2];
        BOOL v67 = __OFADD__(v66, 1);
        uint64_t v68 = v66 + 1;
        if (v67) {
          goto LABEL_28;
        }
        v55[2] = v68;
        swift_bridgeObjectRetain();
      }
      uint64_t v69 = v55[7];
      v106 = v55;
      swift_bridgeObjectRelease();
      uint64_t v70 = v69 + 32 * v50;
      unint64_t v73 = *(void *)(v70 + 24);
      v72 = (unint64_t *)(v70 + 24);
      unint64_t v71 = v73;
      char v74 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t *v72 = v73;
      if ((v74 & 1) == 0)
      {
        unint64_t v71 = sub_100007340(0, *(void *)(v71 + 16) + 1, 1, v71);
        unint64_t *v72 = v71;
      }
      uint64_t v19 = v90;
      unint64_t v76 = *(void *)(v71 + 16);
      unint64_t v75 = *(void *)(v71 + 24);
      if (v76 >= v75 >> 1)
      {
        unint64_t v71 = sub_100007340(v75 > 1, v76 + 1, 1, v71);
        unint64_t *v72 = v71;
      }
      *(void *)(v71 + 16) = v76 + 1;
      uint64_t v77 = v93;
      unint64_t v78 = v71 + v19 + v76 * v93;
      uint64_t v5 = v91;
      v99(v78, v9, v91);
      swift_bridgeObjectRelease();
      (*v92)(v26, v5);
      uint64_t v20 = v100 + v77;
      v24 = sub_100007790;
      v22 = sub_1000076EC;
      uint64_t v23 = v102;
      uint64_t v25 = v107;
      uint64_t v15 = v101 - 1;
      if (v101 == 1)
      {
        swift_bridgeObjectRelease();
        v105 = sub_100007790;
        v79 = sub_1000076EC;
        uint64_t v1 = v88;
        uint64_t v2 = v87;
        uint64_t v3 = v86;
        goto LABEL_26;
      }
    }
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
  }
  else
  {
    v79 = 0;
    v105 = 0;
    uint64_t v107 = 0;
LABEL_26:
    uint64_t v80 = swift_bridgeObjectRetain();
    v81 = sub_100008018(v80);
    swift_bridgeObjectRelease();
    v108 = v81;
    swift_getKeyPath();
    v82 = v89;
    KeyPathComparator.init<A>(_:order:)();
    sub_10000720C(&qword_100018530);
    sub_1000086A4(&qword_100018538, &qword_100018530);
    sub_1000086A4(&qword_100018540, &qword_100018528);
    uint64_t v83 = Sequence.sorted<A>(using:)();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v82, v2);
    swift_bridgeObjectRelease();
    *(void *)(v1 + 24) = v83;
    swift_bridgeObjectRelease();
    sub_100007770((uint64_t)v79);
    sub_100007770((uint64_t)v105);
    return v1;
  }
  return result;
}

unint64_t sub_1000063D8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000720C(&qword_100018548);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = a1 + 40;
  while (1)
  {
    uint64_t v5 = *(void *)(v4 - 8);
    uint64_t v6 = *(void *)v4;
    uint64_t v7 = *(void *)(v4 + 8);
    long long v16 = *(_OWORD *)(v4 + 16);
    uint64_t v8 = *(void *)(v4 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_1000075A8(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    uint64_t v12 = v2[7] + 32 * result;
    *(void *)uint64_t v12 = v7;
    *(_OWORD *)(v12 + 8) = v16;
    *(void *)(v12 + 24) = v8;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v2[2] = v15;
    v4 += 48;
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

uint64_t sub_100006530()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t sub_100006570@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000065C0()
{
  type metadata accessor for AirDropImages.Model();
  uint64_t v0 = swift_allocObject();
  sub_100005CD0();
  return v0;
}

uint64_t sub_1000065F8()
{
  return Section<>.init<A>(_:content:)();
}

uint64_t sub_1000066C4@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  *(void *)a3 = static HorizontalAlignment.leading.getter();
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 1;
  uint64_t v6 = sub_10000720C(&qword_1000185B0);
  return sub_10000673C(a1, a2, (char *)(a3 + *(int *)(v6 + 44)));
}

uint64_t sub_10000673C@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, char *a3@<X8>)
{
  uint64_t v6 = sub_10000720C(&qword_1000185B8);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  char v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)v17 - v11;
  v17[1] = a2;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_10000720C(&qword_1000185C0);
  sub_10000720C(&qword_1000185C8);
  sub_1000086A4(&qword_1000185D0, &qword_1000185C0);
  sub_1000086A4(&qword_1000185D8, &qword_1000185C8);
  sub_1000085D4(&qword_1000185E0, 255, (void (*)(uint64_t))&type metadata accessor for iosmacHardware);
  ForEach<>.init(_:content:)();
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v13(v10, v12, v6);
  *(void *)a3 = a1;
  uint64_t v14 = sub_10000720C(&qword_1000185E8);
  v13(&a3[*(int *)(v14 + 48)], v10, v6);
  uint64_t v15 = *(void (**)(char *, uint64_t))(v7 + 8);
  swift_retain();
  v15(v12, v6);
  v15(v10, v6);
  return swift_release();
}

__n128 sub_1000069B8@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2 = static VerticalAlignment.center.getter();
  sub_100006A24((uint64_t)&v6);
  char v3 = v7;
  uint64_t v4 = v8;
  __n128 result = v6;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(__n128 *)(a1 + 24) = result;
  *(unsigned char *)(a1 + 40) = v3;
  *(void *)(a1 + 48) = v4;
  return result;
}

uint64_t sub_100006A24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for iosmacHardware.Model();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for LocalizedStringKey.StringInterpolation();
  __chkstk_darwin(v6 - 8);
  LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v7._countAndFlagsBits = 0;
  v7._object = (void *)0xE000000000000000;
  LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v7);
  iosmacHardware.model.getter();
  uint64_t v8 = iosmacHardware.Model.id.getter();
  char v10 = v9;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v11._countAndFlagsBits = v8;
  v11._object = v10;
  LocalizedStringKey.StringInterpolation.appendInterpolation(_:)(v11);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 2108704;
  v12._object = (void *)0xE300000000000000;
  LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v12);
  LocalizedStringKey.init(stringInterpolation:)();
  uint64_t result = Text.init(_:tableName:bundle:comment:)();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v14;
  *(unsigned char *)(a1 + 16) = v15 & 1;
  *(void *)(a1 + 24) = v16;
  return result;
}

uint64_t sub_100006BEC()
{
  type metadata accessor for AirDropImages.Model();
  sub_1000085D4(&qword_100018560, v0, (void (*)(uint64_t))type metadata accessor for AirDropImages.Model);
  StateObject.wrappedValue.getter();
  swift_bridgeObjectRetain();
  swift_release();
  sub_10000720C(&qword_100018568);
  sub_10000837C();
  List<>.init(content:)();
  return swift_bridgeObjectRelease();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100006D30()
{
  unint64_t result = qword_100018420;
  if (!qword_100018420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018420);
  }
  return result;
}

uint64_t type metadata accessor for AirDropImages.Model()
{
  return self;
}

uint64_t sub_100006DAC()
{
  return swift_retain();
}

uint64_t destroy for AirDropImages()
{
  return sub_100006DC4();
}

uint64_t sub_100006DC4()
{
  return swift_release();
}

uint64_t _s16ProductKitViewer13AirDropImagesVwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_100006DAC();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for AirDropImages(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_100006DAC();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_100006DC4();
  return a1;
}

__n128 initializeWithTake for AirDropImages(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AirDropImages(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_100006DC4();
  return a1;
}

uint64_t getEnumTagSinglePayload for AirDropImages(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AirDropImages(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AirDropImages()
{
  return &type metadata for AirDropImages;
}

uint64_t initializeBufferWithCopyOfBuffer for AirDropImages.Model.Row(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AirDropImages.Model.Row()
{
  swift_bridgeObjectRelease();
  swift_release();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for AirDropImages.Model.Row(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AirDropImages.Model.Row(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for AirDropImages.Model.Row(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for AirDropImages.Model.Row(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AirDropImages.Model.Row(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AirDropImages.Model.Row(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AirDropImages.Model.Row()
{
  return &type metadata for AirDropImages.Model.Row;
}

ValueMetadata *type metadata accessor for ProductKitViewerApp()
{
  return &type metadata for ProductKitViewerApp;
}

void *sub_1000071BC()
{
  return &protocol witness table for String;
}

uint64_t sub_1000071C8(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_100012818, 1);
}

void *sub_1000071E4()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_1000071F0(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_1000127F0, 1);
}

uint64_t sub_10000720C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100007250(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100007298()
{
  unint64_t result = qword_100018510;
  if (!qword_100018510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018510);
  }
  return result;
}

unint64_t sub_1000072EC()
{
  unint64_t result = qword_100018518;
  if (!qword_100018518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018518);
  }
  return result;
}

uint64_t sub_100007340(char a1, int64_t a2, char a3, unint64_t a4)
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
  sub_10000720C(&qword_100018558);
  uint64_t v10 = *(void *)(type metadata accessor for iosmacHardware() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for iosmacHardware() - 8);
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
    sub_100008218(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

unint64_t sub_1000075A8(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_100007B14(a1, a2, v4);
}

uint64_t sub_100007620()
{
  uint64_t v1 = type metadata accessor for iosmacHardware();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000076EC()
{
  type metadata accessor for iosmacHardware();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  iosmacHardware.image.getter();
  return v1;
}

uint64_t sub_100007770(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100007780()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100007790@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  return result;
}

uint64_t sub_1000077C4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10000720C(&qword_100018548);
  char v40 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v39 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  v37 = v2;
  int64_t v38 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v38) {
      break;
    }
    uint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v39 + 8 * v22);
    ++v13;
    if (!v24)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v38) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v39 + 8 * v13);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v38)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v37;
          if ((v40 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v39 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v13 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v38) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v39 + 8 * v13);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(v5 + 56) + 32 * v21;
    uint64_t v34 = *(void *)v33;
    long long v41 = *(_OWORD *)(v33 + 8);
    uint64_t v35 = *(void *)(v33 + 24);
    if ((v40 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
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
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v16 == v27;
        if (v16 == v27) {
          unint64_t v16 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v11 + 8 * v16);
      }
      while (v29 == -1);
      unint64_t v17 = __clz(__rbit64(~v29)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v32;
    v18[1] = v31;
    uint64_t v19 = *(void *)(v7 + 56) + 32 * v17;
    *(void *)uint64_t v19 = v34;
    *(_OWORD *)(v19 + 8) = v41;
    *(void *)(v19 + 24) = v35;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v37;
  uint64_t v23 = (void *)(v5 + 64);
  if ((v40 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v36 = 1 << *(unsigned char *)(v5 + 32);
  if (v36 >= 64) {
    bzero(v23, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v36;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_100007B14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
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
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

void *sub_100007BF8()
{
  uint64_t v1 = v0;
  sub_10000720C(&qword_100018548);
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
    int64_t v27 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v27 >= v13) {
      goto LABEL_26;
    }
    unint64_t v28 = *(void *)(v6 + 8 * v27);
    ++v9;
    if (!v28)
    {
      int64_t v9 = v27 + 1;
      if (v27 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v28 = *(void *)(v6 + 8 * v9);
      if (!v28) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v28 - 1) & v28;
    unint64_t v15 = __clz(__rbit64(v28)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    uint64_t v21 = *(void *)(v2 + 56) + v20;
    uint64_t v22 = *(void *)v21;
    uint64_t v23 = *(void *)(v21 + 24);
    unint64_t v24 = (void *)(*(void *)(v4 + 48) + v16);
    long long v25 = *(_OWORD *)(v21 + 8);
    void *v24 = v19;
    v24[1] = v18;
    uint64_t v26 = *(void *)(v4 + 56) + v20;
    *(void *)uint64_t v26 = v22;
    *(_OWORD *)(v26 + 8) = v25;
    *(void *)(v26 + 24) = v23;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v29 = v27 + 2;
  if (v29 >= v13) {
    goto LABEL_26;
  }
  unint64_t v28 = *(void *)(v6 + 8 * v29);
  if (v28)
  {
    int64_t v9 = v29;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v28 = *(void *)(v6 + 8 * v9);
    ++v29;
    if (v28) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_100007DEC(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a4 + 64;
  uint64_t v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v7 = ~(-1 << -(char)v6);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v11 = 0;
    uint64_t v9 = 0;
LABEL_39:
    *uint64_t result = a4;
    result[1] = v5;
    result[2] = ~v6;
    result[3] = v11;
    result[4] = v8;
    return (void *)v9;
  }
  uint64_t v9 = a3;
  if (!a3)
  {
    int64_t v11 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  uint64_t v10 = a2;
  uint64_t v23 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v24 = result;
  int64_t v11 = 0;
  uint64_t v12 = 0;
  int64_t v13 = (unint64_t)(63 - v6) >> 6;
  if (!v8) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v14 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  unint64_t v15 = v14 | (v11 << 6);
  while (1)
  {
    ++v12;
    uint64_t v19 = (void *)(*(void *)(a4 + 56) + 32 * v15);
    uint64_t v20 = v19[1];
    uint64_t v22 = v19[2];
    uint64_t v21 = v19[3];
    *uint64_t v10 = *v19;
    v10[1] = v20;
    v10[2] = v22;
    v10[3] = v21;
    if (v12 == v9)
    {
      swift_bridgeObjectRetain();
      swift_retain();
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v10 += 4;
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v8) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v16 >= v13) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v5 + 8 * v16);
    if (!v17)
    {
      v11 += 2;
      if (v16 + 1 >= v13)
      {
        unint64_t v8 = 0;
        int64_t v11 = v16;
      }
      else
      {
        unint64_t v17 = *(void *)(v5 + 8 * v11);
        if (v17) {
          goto LABEL_14;
        }
        int64_t v18 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v5 + 8 * v18);
        if (v17)
        {
LABEL_17:
          int64_t v16 = v18;
          goto LABEL_18;
        }
        int64_t v11 = v16 + 3;
        if (v16 + 3 < v13)
        {
          unint64_t v17 = *(void *)(v5 + 8 * v11);
          if (v17)
          {
LABEL_14:
            int64_t v16 = v11;
            goto LABEL_18;
          }
          int64_t v18 = v16 + 4;
          if (v16 + 4 >= v13)
          {
LABEL_33:
            unint64_t v8 = 0;
            goto LABEL_37;
          }
          unint64_t v17 = *(void *)(v5 + 8 * v18);
          if (!v17)
          {
            while (1)
            {
              int64_t v16 = v18 + 1;
              if (__OFADD__(v18, 1)) {
                goto LABEL_42;
              }
              if (v16 >= v13)
              {
                unint64_t v8 = 0;
                int64_t v11 = v13 - 1;
                goto LABEL_37;
              }
              unint64_t v17 = *(void *)(v5 + 8 * v16);
              ++v18;
              if (v17) {
                goto LABEL_18;
              }
            }
          }
          goto LABEL_17;
        }
        unint64_t v8 = 0;
        int64_t v11 = v16 + 2;
      }
LABEL_37:
      uint64_t v9 = v12;
LABEL_38:
      uint64_t v6 = v23;
      uint64_t result = v24;
      goto LABEL_39;
    }
LABEL_18:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v16 << 6);
    int64_t v11 = v16;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

void *sub_100008018(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptyArrayStorage;
  }
  sub_10000720C(&qword_100018550);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 1;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 5);
  uint64_t v6 = sub_100007DEC(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_100008100();
  if (v6 != (void *)v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }
  return v3;
}

uint64_t sub_100008100()
{
  return swift_release();
}

uint64_t sub_10000810C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a2;
  *(void *)(v5 + 24) = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_10000720C(&qword_100018530);
  sub_10000720C(&qword_100018580);
  sub_1000086A4(&qword_100018598, &qword_100018530);
  sub_1000083F0();
  sub_100008520();
  return ForEach<>.init(_:content:)();
}

uint64_t sub_100008218(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for iosmacHardware() - 8);
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100008370()
{
  return sub_10000810C(v0[2], v0[3], v0[4]);
}

unint64_t sub_10000837C()
{
  unint64_t result = qword_100018570;
  if (!qword_100018570)
  {
    sub_100007250(&qword_100018568);
    sub_1000083F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018570);
  }
  return result;
}

unint64_t sub_1000083F0()
{
  unint64_t result = qword_100018578;
  if (!qword_100018578)
  {
    sub_100007250(&qword_100018580);
    sub_1000086A4(&qword_100018588, &qword_100018590);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018578);
  }
  return result;
}

uint64_t sub_10000849C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000084D4(uint64_t *a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v3 = a1[3];
  uint64_t v5 = *a1;
  long long v6 = *(_OWORD *)(a1 + 1);
  uint64_t v7 = v3;
  return v2(&v5);
}

unint64_t sub_100008520()
{
  unint64_t result = qword_1000185A0;
  if (!qword_1000185A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000185A0);
  }
  return result;
}

uint64_t sub_100008574@<X0>(uint64_t a1@<X8>)
{
  return sub_1000066C4(*(void *)(v1 + 32), *(void *)(v1 + 40), a1);
}

unint64_t sub_100008580()
{
  unint64_t result = qword_1000185A8;
  if (!qword_1000185A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000185A8);
  }
  return result;
}

uint64_t sub_1000085D4(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

ValueMetadata *type metadata accessor for AssetMovieViewControllerView()
{
  return &type metadata for AssetMovieViewControllerView;
}

uint64_t sub_10000862C()
{
  return sub_1000086A4(&qword_1000184E8, &qword_1000184D0);
}

uint64_t sub_100008668()
{
  return sub_1000086A4(&qword_1000185F0, &qword_1000185F8);
}

uint64_t sub_1000086A4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007250(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void *sub_1000086EC()
{
  return &protocol witness table for Never;
}

unint64_t sub_1000086F8()
{
  unint64_t result = qword_100018600;
  if (!qword_100018600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018600);
  }
  return result;
}

uint64_t sub_100008750()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16ProductKitViewer24MobileAssetBundleManager_repositoryURL;
  uint64_t v2 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  uint64_t v3 = v0 + OBJC_IVAR____TtC16ProductKitViewer24MobileAssetBundleManager__selectedProduct;
  uint64_t v4 = sub_10000720C(&qword_1000187C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC16ProductKitViewer24MobileAssetBundleManager__color;
  uint64_t v6 = sub_10000720C(&qword_1000187D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  uint64_t v7 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v8 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v7, v8);
}

uint64_t sub_1000088A0()
{
  return type metadata accessor for MobileAssetBundleManager();
}

uint64_t type metadata accessor for MobileAssetBundleManager()
{
  uint64_t result = qword_100018648;
  if (!qword_100018648) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000088F4()
{
  type metadata accessor for URL();
  if (v0 <= 0x3F)
  {
    sub_100008A2C(319, &qword_100018658, &qword_100018660);
    if (v1 <= 0x3F)
    {
      sub_100008A2C(319, &qword_100018668, (uint64_t *)&unk_100018670);
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_100008A2C(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    sub_100007250(a3);
    unint64_t v4 = type metadata accessor for Published();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_100008A7C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MobileAssetBundleManager();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t *sub_100008ABC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for URL();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (char *)a1 + v8;
    unint64_t v11 = (char *)a2 + v8;
    uint64_t v12 = *((void *)v11 + 1);
    *(void *)uint64_t v10 = *(void *)v11;
    *((void *)v10 + 1) = v12;
    uint64_t v13 = *((void *)v11 + 3);
    *((void *)v10 + 2) = *((void *)v11 + 2);
    *((void *)v10 + 3) = v13;
    uint64_t v14 = *((void *)v11 + 5);
    *((void *)v10 + 4) = *((void *)v11 + 4);
    *((void *)v10 + 5) = v14;
    *((_OWORD *)v10 + 3) = *((_OWORD *)v11 + 3);
    v10[64] = v11[64];
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_100008BD4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100008C70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  uint64_t v11 = *(void *)(v10 + 8);
  *(void *)uint64_t v9 = *(void *)v10;
  *(void *)(v9 + 8) = v11;
  uint64_t v12 = *(void *)(v10 + 24);
  *(void *)(v9 + 16) = *(void *)(v10 + 16);
  *(void *)(v9 + 24) = v12;
  uint64_t v13 = *(void *)(v10 + 40);
  *(void *)(v9 + 32) = *(void *)(v10 + 32);
  *(void *)(v9 + 40) = v13;
  *(_OWORD *)(v9 + 48) = *(_OWORD *)(v10 + 48);
  *(unsigned char *)(v9 + 64) = *(unsigned char *)(v10 + 64);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_100008D38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)uint64_t v8 = *(void *)(a2 + v7);
  *(void *)(v8 + 8) = *(void *)(a2 + v7 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v8 + 16) = *(void *)(v9 + 16);
  *(void *)(v8 + 24) = *(void *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v8 + 32) = *(void *)(v9 + 32);
  *(void *)(v8 + 40) = *(void *)(v9 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v8 + 48) = *(void *)(v9 + 48);
  *(void *)(v8 + 56) = *(void *)(v9 + 56);
  *(unsigned char *)(v8 + 64) = *(unsigned char *)(v9 + 64);
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100008E50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  long long v11 = *(_OWORD *)(v10 + 48);
  *(_OWORD *)(v9 + 32) = *(_OWORD *)(v10 + 32);
  *(_OWORD *)(v9 + 48) = v11;
  *(unsigned char *)(v9 + 64) = *(unsigned char *)(v10 + 64);
  long long v12 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v12;
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  return a1;
}

uint64_t sub_100008EEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a2 + v7 + 8);
  *(void *)uint64_t v8 = *(void *)(a2 + v7);
  *(void *)(v8 + 8) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(v9 + 24);
  *(void *)(v8 + 16) = *(void *)(v9 + 16);
  *(void *)(v8 + 24) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(v9 + 40);
  *(void *)(v8 + 32) = *(void *)(v9 + 32);
  *(void *)(v8 + 40) = v12;
  swift_bridgeObjectRelease();
  *(_OWORD *)(v8 + 48) = *(_OWORD *)(v9 + 48);
  *(unsigned char *)(v8 + 64) = *(unsigned char *)(v9 + 64);
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100008FC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100008FD8);
}

uint64_t sub_100008FD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_10000909C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000090B0);
}

uint64_t sub_1000090B0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for URL();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for MobileAssetBundle()
{
  uint64_t result = qword_100018830;
  if (!qword_100018830) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000091BC()
{
  uint64_t result = type metadata accessor for URL();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_100009260(uint64_t a1)
{
  type metadata accessor for URL();
  sub_100009AE0(&qword_100018878, (void (*)(uint64_t))&type metadata accessor for URL);
  dispatch thunk of Hashable.hash(into:)();
  uint64_t v3 = type metadata accessor for MobileAssetBundle();
  uint64_t v4 = v1 + *(int *)(v3 + 20);
  Swift::UInt v5 = *(void *)(v4 + 48);
  Swift::UInt v8 = *(void *)(v4 + 56);
  Swift::UInt8 v9 = *(unsigned char *)(v4 + 64);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Hasher._combine(_:)(v5);
  Hasher._combine(_:)(v8);
  Hasher._combine(_:)(v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(v1 + *(int *)(v3 + 24));
  swift_bridgeObjectRetain();
  sub_1000096F0(a1, v6);

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100009404()
{
  Hasher.init(_seed:)();
  sub_100009260((uint64_t)v1);
  return Hasher._finalize()();
}

Swift::Int sub_100009448()
{
  Hasher.init(_seed:)();
  sub_100009260((uint64_t)v1);
  return Hasher._finalize()();
}

uint64_t sub_100009488()
{
  return sub_100009AE0(&qword_100018870, (void (*)(uint64_t))type metadata accessor for MobileAssetBundle);
}

uint64_t sub_1000094D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = __chkstk_darwin(v4);
  __chkstk_darwin(v5);
  Swift::UInt8 v9 = (char *)&v28 - v8;
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10 == *(void *)(a2 + 16))
  {
    if (!v10 || a1 == a2)
    {
      char v23 = 1;
    }
    else
    {
      uint64_t v11 = *(unsigned __int8 *)(v6 + 80);
      uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
      uint64_t v12 = v6 + 16;
      uint64_t v31 = v7;
      uint64_t v32 = v13;
      uint64_t v14 = (v11 + 32) & ~v11;
      uint64_t v15 = *(void *)(v12 + 56);
      uint64_t v33 = v12;
      uint64_t v29 = v15;
      uint64_t v30 = (void (**)(uint64_t, uint64_t))(v12 - 8);
      uint64_t v16 = v10 - 1;
      uint64_t v17 = v7;
      do
      {
        uint64_t v18 = a1;
        uint64_t v19 = v9;
        uint64_t v20 = v9;
        uint64_t v21 = v32;
        v32((uint64_t)v19, a1 + v14, v4);
        uint64_t v22 = a2;
        v21(v17, a2 + v14, v4);
        Swift::UInt8 v9 = v20;
        sub_100009AE0(&qword_100018888, (void (*)(uint64_t))&type metadata accessor for URL);
        char v23 = dispatch thunk of static Equatable.== infix(_:_:)();
        unint64_t v24 = *v30;
        (*v30)(v17, v4);
        v24((uint64_t)v20, v4);
        BOOL v26 = v16-- != 0;
        if ((v23 & 1) == 0) {
          break;
        }
        v14 += v29;
        a2 = v22;
        a1 = v18;
      }
      while (v26);
    }
  }
  else
  {
    char v23 = 0;
  }
  return v23 & 1;
}

uint64_t sub_1000096F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000720C(&qword_100018880);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  Swift::UInt v11 = *(void *)(a2 + 16);
  uint64_t v27 = a1;
  Hasher._combine(_:)(v11);
  if (v11)
  {
    uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    uint64_t v14 = a2 + ((*(unsigned __int8 *)(v12 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 64));
    unint64_t v15 = v12 + 40;
    uint64_t v16 = v12;
    uint64_t v17 = (uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 32);
    unint64_t v24 = (void (**)(char *, char *, uint64_t))(v16 + 16);
    long long v25 = v13;
    uint64_t v18 = (void (**)(char *, uint64_t))(v16 - 8);
    uint64_t v26 = v16;
    uint64_t v19 = *(void *)(v16 + 56);
    unint64_t v22 = v15 & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    uint64_t v23 = v19;
    while (1)
    {
      v25(v10, v14, v4);
      uint64_t v20 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))v15;
      (*(void (**)(char *, void, uint64_t, uint64_t))v15)(v10, 0, 1, v4);
      uint64_t result = (*v17)(v10, 1, v4);
      if (result == 1) {
        break;
      }
      (*v24)(v7, v10, v4);
      sub_100009AE0(&qword_100018878, (void (*)(uint64_t))&type metadata accessor for URL);
      dispatch thunk of Hashable.hash(into:)();
      (*v18)(v7, v4);
      v14 += v23;
      if (!--v11) {
        return v20(v10, 1, 1, v4);
      }
    }
  }
  else
  {
    uint64_t v20 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
    return v20(v10, 1, 1, v4);
  }
  return result;
}

uint64_t sub_100009964(uint64_t a1, uint64_t a2)
{
  if ((static URL.== infix(_:_:)() & 1) == 0) {
    return 0;
  }
  uint64_t v25 = type metadata accessor for MobileAssetBundle();
  uint64_t v4 = *(int *)(v25 + 20);
  uint64_t v5 = *(void *)(a1 + v4);
  uint64_t v6 = *(void *)(a1 + v4 + 8);
  uint64_t v7 = *(void *)(a1 + v4 + 16);
  uint64_t v8 = *(void *)(a1 + v4 + 24);
  uint64_t v9 = *(void *)(a1 + v4 + 32);
  uint64_t v10 = *(void *)(a1 + v4 + 40);
  uint64_t v30 = *(void *)(a1 + v4 + 48);
  uint64_t v31 = *(void *)(a1 + v4 + 56);
  int v11 = *(unsigned __int8 *)(a1 + v4 + 64);
  uint64_t v12 = a2 + v4;
  uint64_t v14 = *(void *)(v12 + 16);
  uint64_t v13 = *(void *)(v12 + 24);
  uint64_t v15 = *(void *)(v12 + 32);
  uint64_t v16 = *(void *)(v12 + 40);
  uint64_t v28 = *(void *)(v12 + 48);
  uint64_t v29 = *(void *)(v12 + 56);
  int v26 = *(unsigned __int8 *)(v12 + 64);
  int v27 = v11;
  BOOL v17 = v5 == *(void *)v12 && v6 == *(void *)(v12 + 8);
  if (!v17 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
    return 0;
  }
  BOOL v18 = v7 == v14 && v8 == v13;
  if (!v18 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
    return 0;
  }
  BOOL v19 = v9 == v15 && v10 == v16;
  if (!v19 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
    return 0;
  }
  BOOL v20 = v30 == v28 && v31 == v29;
  if (!v20 || ((v27 ^ v26) & 1) != 0) {
    return 0;
  }
  uint64_t v21 = *(int *)(v25 + 24);
  uint64_t v22 = *(void *)(a1 + v21);
  uint64_t v23 = *(void *)(a2 + v21);

  return sub_1000094D0(v22, v23);
}

uint64_t sub_100009AE0(unint64_t *a1, void (*a2)(uint64_t))
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

__n128 initializeWithTake for MobileAssetProperties(uint64_t a1, uint64_t a2)
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

ValueMetadata *type metadata accessor for MobileAssetProperties()
{
  return &type metadata for MobileAssetProperties;
}

uint64_t destroy for MobileAssetProperties.Color()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MobileAssetProperties.Color(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MobileAssetProperties.Color(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

__n128 initializeWithTake for MobileAssetProperties.Color(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for MobileAssetProperties.Color(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for MobileAssetProperties.Color(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 33)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MobileAssetProperties.Color(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 33) = 1;
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
    *(unsigned char *)(result + 33) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MobileAssetProperties.Color()
{
  return &type metadata for MobileAssetProperties.Color;
}

unint64_t sub_100009D70(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x54746375646F7250;
      break;
    case 2:
      unint64_t result = 0x4E746E6169726156;
      break;
    case 3:
      return result;
    case 4:
      unint64_t result = 0x746E65746E6F435FLL;
      break;
    case 5:
      unint64_t result = 0x7269757165525F5FLL;
      break;
    default:
      unint64_t result = 19523;
      break;
  }
  return result;
}

unint64_t sub_100009E60(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x54746375646F7250;
      break;
    case 2:
      unint64_t result = 0x4E746E6169726156;
      break;
    case 3:
      return result;
    case 4:
      unint64_t result = 0x746E65746E6F435FLL;
      break;
    case 5:
      unint64_t result = 0x7269757165525F5FLL;
      break;
    default:
      unint64_t result = 19523;
      break;
  }
  return result;
}

Swift::Int sub_100009F50()
{
  Swift::UInt8 v1 = *(unsigned char *)(v0 + 32);
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100009FF0()
{
  Swift::UInt8 v1 = *(unsigned char *)(v0 + 32);
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Hasher._combine(_:)(v1);
}

Swift::Int sub_10000A078()
{
  Swift::UInt8 v1 = *(unsigned char *)(v0 + 32);
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_10000A114(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v2;
  char v6 = *(unsigned char *)(a1 + 32);
  long long v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  char v8 = *(unsigned char *)(a2 + 32);
  return sub_10000C580((uint64_t)v5, (uint64_t)v7) & 1;
}

unint64_t sub_10000A164()
{
  unint64_t result = qword_100018890;
  if (!qword_100018890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018890);
  }
  return result;
}

uint64_t sub_10000A1B8(unsigned __int8 *a1, char *a2)
{
  return sub_10000A1C4(*a1, *a2);
}

uint64_t sub_10000A1C4(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000015;
  unint64_t v3 = 0x8000000100012480;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000015;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x54746375646F7250;
      unint64_t v3 = 0xEB00000000657079;
      break;
    case 2:
      unint64_t v3 = 0xEB00000000656D61;
      unint64_t v5 = 0x4E746E6169726156;
      break;
    case 3:
      break;
    case 4:
      unint64_t v3 = 0xEF6E6F6973726556;
      unint64_t v5 = 0x746E65746E6F435FLL;
      break;
    case 5:
      unint64_t v3 = 0xEE00534F79426465;
      unint64_t v5 = 0x7269757165525F5FLL;
      break;
    default:
      unint64_t v3 = 0xE200000000000000;
      unint64_t v5 = 19523;
      break;
  }
  unint64_t v6 = 0x8000000100012480;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xEB00000000657079;
      if (v5 == 0x54746375646F7250) {
        goto LABEL_16;
      }
      goto LABEL_19;
    case 2:
      unint64_t v6 = 0xEB00000000656D61;
      if (v5 != 0x4E746E6169726156) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 3:
      goto LABEL_15;
    case 4:
      unint64_t v6 = 0xEF6E6F6973726556;
      unint64_t v2 = 0x746E65746E6F435FLL;
LABEL_15:
      if (v5 == v2) {
        goto LABEL_16;
      }
      goto LABEL_19;
    case 5:
      unint64_t v6 = 0xEE00534F79426465;
      if (v5 != 0x7269757165525F5FLL) {
        goto LABEL_19;
      }
      goto LABEL_16;
    default:
      unint64_t v6 = 0xE200000000000000;
      if (v5 != 19523) {
        goto LABEL_19;
      }
LABEL_16:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_19:
      }
        char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

Swift::Int sub_10000A408()
{
  return sub_10000A410();
}

Swift::Int sub_10000A410()
{
  return Hasher._finalize()();
}

uint64_t sub_10000A548()
{
  return sub_10000A550();
}

uint64_t sub_10000A550()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000A674()
{
  return sub_10000A67C();
}

Swift::Int sub_10000A67C()
{
  return Hasher._finalize()();
}

unint64_t sub_10000A7B0@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_10000C808(*a1);
  *a2 = result;
  return result;
}

unint64_t sub_10000A7E0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_100009D70(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_10000A80C()
{
  return sub_100009E60(*v0);
}

unint64_t sub_10000A814@<X0>(Swift::String a1@<X1:X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_10000C808(a1);
  *a2 = result;
  return result;
}

uint64_t sub_10000A83C()
{
  return 0;
}

void sub_10000A848(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_10000A854(uint64_t a1)
{
  unint64_t v2 = sub_10000CC4C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000A890(uint64_t a1)
{
  unint64_t v2 = sub_10000CC4C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000A8CC(void *a1)
{
  uint64_t v3 = sub_10000720C(&qword_1000188B8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10000CC08(a1, a1[3]);
  sub_10000CC4C();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v8[15] = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v1)
  {
    v8[14] = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[13] = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[12] = 3;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[11] = 4;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[10] = 5;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

Swift::Int sub_10000AACC()
{
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Hasher._combine(_:)(*(void *)(v0 + 48));
  Hasher._combine(_:)(*(void *)(v0 + 56));
  Hasher._combine(_:)(*(unsigned char *)(v0 + 64) & 1);
  return Hasher._finalize()();
}

__n128 sub_10000ABA8@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_10000C854(a1, (uint64_t)v6);
  if (!v2)
  {
    long long v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(unsigned char *)(a2 + 64) = v7;
    __n128 result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_10000ABFC(void *a1)
{
  return sub_10000A8CC(a1);
}

void sub_10000AC18()
{
  Swift::UInt v1 = *(void *)(v0 + 48);
  Swift::UInt v2 = *(void *)(v0 + 56);
  Swift::UInt8 v3 = *(unsigned char *)(v0 + 64);
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Hasher._combine(_:)(v1);
  Hasher._combine(_:)(v2);
  Hasher._combine(_:)(v3);
}

Swift::Int sub_10000ACF4()
{
  Swift::UInt v1 = *(void *)(v0 + 48);
  Swift::UInt v2 = *(void *)(v0 + 56);
  Swift::UInt8 v3 = *(unsigned char *)(v0 + 64);
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Hasher._combine(_:)(v1);
  Hasher._combine(_:)(v2);
  Hasher._combine(_:)(v3);
  return Hasher._finalize()();
}

uint64_t sub_10000ADE0(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 48);
  _OWORD v7[2] = *(_OWORD *)(a1 + 32);
  v7[3] = v2;
  char v8 = *(unsigned char *)(a1 + 64);
  long long v3 = *(_OWORD *)(a1 + 16);
  v7[0] = *(_OWORD *)a1;
  v7[1] = v3;
  long long v4 = *(_OWORD *)(a2 + 48);
  v9[2] = *(_OWORD *)(a2 + 32);
  v9[3] = v4;
  char v10 = *(unsigned char *)(a2 + 64);
  long long v5 = *(_OWORD *)(a2 + 16);
  v9[0] = *(_OWORD *)a2;
  v9[1] = v5;
  return sub_10000C608((uint64_t)v7, (uint64_t)v9) & 1;
}

unint64_t sub_10000AE40()
{
  unint64_t result = qword_100018898;
  if (!qword_100018898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018898);
  }
  return result;
}

uint64_t sub_10000AE94(uint64_t result, unint64_t a2)
{
  uint64_t v3 = HIBYTE(a2) & 0xF;
  uint64_t v4 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0) {
        unint64_t v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        unint64_t v6 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
      }
      uint64_t v7 = (uint64_t)sub_10000BA18(v6, v4, 10);
      char v9 = v8 & 1;
      goto LABEL_37;
    }
    v23[0] = result;
    v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (!v3) {
        goto LABEL_50;
      }
      if (v3 == 1 || (BYTE1(result) - 48) > 9u) {
        goto LABEL_34;
      }
      uint64_t v7 = (BYTE1(result) - 48);
      uint64_t v14 = v3 - 2;
      if (v14)
      {
        uint64_t v15 = (unsigned __int8 *)v23 + 2;
        while (1)
        {
          unsigned int v16 = *v15 - 48;
          if (v16 > 9) {
            goto LABEL_34;
          }
          uint64_t v17 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
            goto LABEL_34;
          }
          uint64_t v7 = v17 + v16;
          if (__OFADD__(v17, v16)) {
            goto LABEL_34;
          }
          char v9 = 0;
          ++v15;
          if (!--v14) {
            goto LABEL_37;
          }
        }
      }
    }
    else
    {
      if (result == 45)
      {
        if (v3)
        {
          if (v3 != 1 && (BYTE1(result) - 48) <= 9u)
          {
            uint64_t v7 = -(uint64_t)(BYTE1(result) - 48);
            uint64_t v10 = v3 - 2;
            if (v10)
            {
              int v11 = (unsigned __int8 *)v23 + 2;
              while (1)
              {
                unsigned int v12 = *v11 - 48;
                if (v12 > 9) {
                  goto LABEL_34;
                }
                uint64_t v13 = 10 * v7;
                if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
                  goto LABEL_34;
                }
                uint64_t v7 = v13 - v12;
                if (__OFSUB__(v13, v12)) {
                  goto LABEL_34;
                }
                char v9 = 0;
                ++v11;
                if (!--v10) {
                  goto LABEL_37;
                }
              }
            }
            goto LABEL_36;
          }
LABEL_34:
          uint64_t v7 = 0;
          char v9 = 1;
          goto LABEL_37;
        }
        __break(1u);
LABEL_50:
        __break(1u);
        return result;
      }
      if (!v3 || (result - 48) > 9u) {
        goto LABEL_34;
      }
      uint64_t v7 = (result - 48);
      uint64_t v18 = v3 - 1;
      if (v18)
      {
        BOOL v19 = (unsigned __int8 *)v23 + 1;
        while (1)
        {
          unsigned int v20 = *v19 - 48;
          if (v20 > 9) {
            goto LABEL_34;
          }
          uint64_t v21 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
            goto LABEL_34;
          }
          uint64_t v7 = v21 + v20;
          if (__OFADD__(v21, v20)) {
            goto LABEL_34;
          }
          char v9 = 0;
          ++v19;
          if (!--v18) {
            goto LABEL_37;
          }
        }
      }
    }
LABEL_36:
    char v9 = 0;
    goto LABEL_37;
  }
  uint64_t v7 = (uint64_t)sub_10000B930(result, a2, 10);
  char v9 = v22;
LABEL_37:
  swift_bridgeObjectRelease();
  if (v9) {
    return 0;
  }
  else {
    return v7;
  }
}

BOOL sub_10000B0E4(uint64_t a1, uint64_t a2)
{
  return sub_10000C264(*(void *)a1, *(void *)(a1 + 8), *(void *)a2, *(void *)(a2 + 8));
}

BOOL sub_10000B0F8(uint64_t a1, uint64_t a2)
{
  return !sub_10000C264(*(void *)a2, *(void *)(a2 + 8), *(void *)a1, *(void *)(a1 + 8));
}

BOOL sub_10000B120(uint64_t a1, uint64_t a2)
{
  return !sub_10000C264(*(void *)a1, *(void *)(a1 + 8), *(void *)a2, *(void *)(a2 + 8));
}

BOOL sub_10000B150(uint64_t a1, uint64_t a2)
{
  return sub_10000C264(*(void *)a2, *(void *)(a2 + 8), *(void *)a1, *(void *)(a1 + 8));
}

uint64_t sub_10000B15C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10000720C(&qword_1000188F8);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000CC08(a1, a1[3]);
  sub_10000D414();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  long long v8 = *(_OWORD *)(v2 + 48);
  v11[2] = *(_OWORD *)(v2 + 32);
  v11[3] = v8;
  char v12 = *(unsigned char *)(v2 + 64);
  long long v9 = *(_OWORD *)(v2 + 16);
  v11[0] = *(_OWORD *)v2;
  v11[1] = v9;
  sub_10000D4BC();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

Swift::Int sub_10000B2B4()
{
  Hasher.init(_seed:)();
  Swift::UInt v1 = *(void *)(v0 + 48);
  Swift::UInt v2 = *(void *)(v0 + 56);
  char v3 = *(unsigned char *)(v0 + 64);
  sub_10000D510(v0);
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Hasher._combine(_:)(v1);
  Hasher._combine(_:)(v2);
  Hasher._combine(_:)(v3 & 1);
  sub_10000D55C(v0);
  return Hasher._finalize()();
}

uint64_t sub_10000B3BC()
{
  return 1;
}

Swift::Int sub_10000B3C4()
{
  return Hasher._finalize()();
}

uint64_t sub_10000B41C()
{
  return String.hash(into:)();
}

Swift::Int sub_10000B438()
{
  return Hasher._finalize()();
}

uint64_t sub_10000B48C@<X0>(Swift::String *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100014C18, *a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3 != 0;
  return result;
}

void sub_10000B4E0(void *a1@<X8>)
{
  *a1 = 0xD000000000000015;
  a1[1] = 0x8000000100011EC0;
}

unint64_t sub_10000B500()
{
  return 0xD000000000000015;
}

uint64_t sub_10000B51C@<X0>(Swift::String string@<0:X0, 8:X1>, BOOL *a2@<X8>)
{
  object = string._object;
  v3._countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100014C50, v3);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

void sub_10000B574(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_10000B580(uint64_t a1)
{
  unint64_t v2 = sub_10000D414();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000B5BC(uint64_t a1)
{
  unint64_t v2 = sub_10000D414();

  return CodingKey.debugDescription.getter(a1, v2);
}

__n128 sub_10000B5F8@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_10000D26C(a1, (uint64_t)v6);
  if (!v2)
  {
    long long v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(unsigned char *)(a2 + 64) = v7;
    __n128 result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_10000B64C(void *a1)
{
  return sub_10000B15C(a1);
}

Swift::Int sub_10000B664()
{
  return sub_10000B2B4();
}

uint64_t sub_10000B6A8()
{
  Swift::UInt v1 = *(void *)(v0 + 48);
  Swift::UInt v2 = *(void *)(v0 + 56);
  Swift::UInt8 v4 = *(unsigned char *)(v0 + 64);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Hasher._combine(_:)(v1);
  Hasher._combine(_:)(v2);
  Hasher._combine(_:)(v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000B7BC()
{
  Swift::UInt v2 = *(void *)(v0 + 48);
  Swift::UInt v1 = *(void *)(v0 + 56);
  Swift::UInt8 v3 = *(unsigned char *)(v0 + 64);
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Hasher._combine(_:)(v2);
  Hasher._combine(_:)(v1);
  Hasher._combine(_:)(v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

BOOL sub_10000B8D4(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 48);
  _OWORD v7[2] = *(_OWORD *)(a1 + 32);
  v7[3] = v2;
  char v8 = *(unsigned char *)(a1 + 64);
  long long v3 = *(_OWORD *)(a1 + 16);
  v7[0] = *(_OWORD *)a1;
  v7[1] = v3;
  long long v4 = *(_OWORD *)(a2 + 48);
  v9[2] = *(_OWORD *)(a2 + 32);
  v9[3] = v4;
  char v10 = *(unsigned char *)(a2 + 64);
  long long v5 = *(_OWORD *)(a2 + 16);
  v9[0] = *(_OWORD *)a2;
  v9[1] = v5;
  return sub_10000C6E0((uint64_t)v7, (uint64_t)v9);
}

unsigned __int8 *sub_10000B930(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = String.init<A>(_:)();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    char v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_10000BC94();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    char v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    char v7 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
  }
LABEL_7:
  int v11 = sub_10000BA18(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_10000BA18(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_10000BC94()
{
  unint64_t v0 = String.subscript.getter();
  uint64_t v4 = sub_10000BD14(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_10000BD14(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_10000BE6C(a1, a2, a3, a4);
    if (!v9
      || (uint64_t v10 = v9,
          unsigned int v11 = sub_10000BF6C(v9, 0),
          unint64_t v12 = sub_10000BFD4((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4),
          swift_bridgeObjectRetain(),
          swift_bridgeObjectRelease(),
          v12 == v10))
    {
      uint64_t v13 = static String._uncheckedFromUTF8(_:)();
      swift_release();
      return v13;
    }
    __break(1u);
  }
  else
  {
    if ((a4 & 0x2000000000000000) != 0)
    {
      v14[0] = a3;
      v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
      return static String._uncheckedFromUTF8(_:)();
    }
    if ((a3 & 0x1000000000000000) != 0) {
      goto LABEL_4;
    }
  }
  _StringObject.sharedUTF8.getter();
LABEL_4:

  return static String._uncheckedFromUTF8(_:)();
}

uint64_t sub_10000BE6C(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_10000C1E8(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_10000C1E8(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
  }
  __break(1u);
  return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
}

void *sub_10000BF6C(uint64_t a1, uint64_t a2)
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
  sub_10000720C(&qword_1000188A0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_10000BFD4(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    _OWORD v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    __n128 result = v12;
    if (v17 == v15) {
      __n128 result = sub_10000C1E8(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      __n128 result = String.UTF8View._foreignSubscript(position:)();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        __n128 result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          __n128 result = _StringObject.sharedUTF8.getter();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    __n128 result = sub_10000C1E8(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = String.UTF8View._foreignIndex(after:)();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_10000C1E8(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = String.UTF16View.index(_:offsetBy:)();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = String.UTF8View._foreignIndex(_:offsetBy:)();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

BOOL sub_10000C264(BOOL result, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = HIBYTE(a2) & 0xF;
  uint64_t v8 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v9) {
    goto LABEL_32;
  }
  uint64_t v10 = result;
  if ((a2 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = (uint64_t)sub_10000B930(v10, a2, 10);
    char v31 = v30;
    swift_bridgeObjectRelease();
    if ((v31 & 1) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  if ((a2 & 0x2000000000000000) != 0)
  {
    v32[0] = result;
    v32[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (v7)
      {
        if (v7 != 1 && (BYTE1(result) - 48) <= 9u)
        {
          uint64_t v14 = (BYTE1(result) - 48);
          if (v7 == 2) {
            goto LABEL_33;
          }
          if ((BYTE2(result) - 48) <= 9u)
          {
            uint64_t v14 = 10 * (BYTE1(result) - 48) + (BYTE2(result) - 48);
            uint64_t v15 = v7 - 3;
            if (v7 == 3) {
              goto LABEL_33;
            }
            uint64_t v16 = (unsigned __int8 *)v32 + 3;
            while (1)
            {
              unsigned int v17 = *v16 - 48;
              if (v17 > 9) {
                break;
              }
              uint64_t v18 = 10 * v14;
              if ((unsigned __int128)(v14 * (__int128)10) >> 64 != (10 * v14) >> 63) {
                break;
              }
              uint64_t v14 = v18 + v17;
              if (__OFADD__(v18, v17)) {
                break;
              }
              ++v16;
              if (!--v15) {
                goto LABEL_33;
              }
            }
          }
        }
        goto LABEL_32;
      }
    }
    else
    {
      if (result != 45)
      {
        if (v7 && (result - 48) <= 9u)
        {
          uint64_t v14 = result - 48;
          if (v7 == 1) {
            goto LABEL_33;
          }
          if ((BYTE1(result) - 48) <= 9u)
          {
            uint64_t v14 = 10 * (result - 48) + (BYTE1(result) - 48);
            uint64_t v22 = v7 - 2;
            if (v7 == 2) {
              goto LABEL_33;
            }
            unint64_t v23 = (unsigned __int8 *)v32 + 2;
            while (1)
            {
              unsigned int v24 = *v23 - 48;
              if (v24 > 9) {
                break;
              }
              uint64_t v25 = 10 * v14;
              if ((unsigned __int128)(v14 * (__int128)10) >> 64 != (10 * v14) >> 63) {
                break;
              }
              uint64_t v14 = v25 + v24;
              if (__OFADD__(v25, v24)) {
                break;
              }
              ++v23;
              if (!--v22) {
                goto LABEL_33;
              }
            }
          }
        }
        goto LABEL_32;
      }
      if (v7)
      {
        if (v7 != 1 && (BYTE1(result) - 48) <= 9u)
        {
          if (v7 == 2)
          {
            uint64_t v14 = -(uint64_t)(BYTE1(result) - 48);
            goto LABEL_33;
          }
          if ((BYTE2(result) - 48) <= 9u)
          {
            uint64_t v14 = -10 * (BYTE1(result) - 48) - (BYTE2(result) - 48);
            uint64_t v26 = v7 - 3;
            if (v7 == 3) {
              goto LABEL_33;
            }
            unint64_t v27 = (unsigned __int8 *)v32 + 3;
            while (1)
            {
              unsigned int v28 = *v27 - 48;
              if (v28 > 9) {
                break;
              }
              uint64_t v29 = 10 * v14;
              if ((unsigned __int128)(v14 * (__int128)10) >> 64 != (10 * v14) >> 63) {
                break;
              }
              uint64_t v14 = v29 - v28;
              if (__OFSUB__(v29, v28)) {
                break;
              }
              ++v27;
              if (!--v26) {
                goto LABEL_33;
              }
            }
          }
        }
LABEL_32:
        uint64_t v14 = 0x8000000000000000;
        goto LABEL_33;
      }
      __break(1u);
    }
    __break(1u);
    return result;
  }
  if ((result & 0x1000000000000000) != 0) {
    uint64_t v11 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
  }
  else {
    uint64_t v11 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
  }
  unint64_t v12 = sub_10000BA18(v11, v8, 10);
  if (v13) {
    goto LABEL_32;
  }
  uint64_t v14 = (uint64_t)v12;
LABEL_33:
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_10000AE94(a3, a4);
  return (v20 & 1) == 0 && v19 > v14;
}

uint64_t sub_10000C580(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v4 || (char v5 = _stringCompareWithSmolCheck(_:_:expecting:)(), v6 = 0, (v5 & 1) != 0))
  {
    BOOL v7 = *(void *)(a1 + 16) == *(void *)(a2 + 16) && *(void *)(a1 + 24) == *(void *)(a2 + 24);
    if (v7 || (char v8 = _stringCompareWithSmolCheck(_:_:expecting:)(), v6 = 0, (v8 & 1) != 0)) {
      char v6 = ((*(unsigned char *)(a1 + 32) & 1) == 0) ^ *(unsigned char *)(a2 + 32);
    }
  }
  return v6 & 1;
}

uint64_t sub_10000C608(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v4 || (char v5 = _stringCompareWithSmolCheck(_:_:expecting:)(), v6 = 0, (v5 & 1) != 0))
  {
    BOOL v7 = *(void *)(a1 + 16) == *(void *)(a2 + 16) && *(void *)(a1 + 24) == *(void *)(a2 + 24);
    if (v7 || (char v8 = _stringCompareWithSmolCheck(_:_:expecting:)(), v6 = 0, (v8 & 1) != 0))
    {
      if (*(void *)(a1 + 32) == *(void *)(a2 + 32) && *(void *)(a1 + 40) == *(void *)(a2 + 40)
        || (char v9 = _stringCompareWithSmolCheck(_:_:expecting:)(), v6 = 0, (v9 & 1) != 0))
      {
        if (*(void *)(a1 + 48) == *(void *)(a2 + 48) && *(void *)(a1 + 56) == *(void *)(a2 + 56)) {
          char v6 = ((*(unsigned char *)(a1 + 64) & 1) == 0) ^ *(unsigned char *)(a2 + 64);
        }
        else {
          char v6 = 0;
        }
      }
    }
  }
  return v6 & 1;
}

BOOL sub_10000C6E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 24);
  uint64_t v9 = *(void *)(a2 + 32);
  uint64_t v10 = *(void *)(a2 + 40);
  uint64_t v11 = *(void *)(a2 + 48);
  uint64_t v15 = *(void *)(a2 + 56);
  uint64_t v16 = *(void *)(a1 + 56);
  char v13 = *(unsigned char *)(a2 + 64);
  char v14 = *(unsigned char *)(a1 + 64);
  return (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8)
       || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      && (v2 == v7 && v4 == v8 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      && (v3 == v9 && v5 == v10 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      && v6 == v11
      && v16 == v15
      && (v14 & 1) == (v13 & 1);
}

unint64_t sub_10000C808(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100014B68, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 6) {
    return 6;
  }
  else {
    return v3;
  }
}

uint64_t sub_10000C854@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_10000720C(&qword_1000188A8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000CC08(a1, a1[3]);
  sub_10000CC4C();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return sub_10000CCA0((uint64_t)a1);
  }
  char v35 = 0;
  uint64_t v9 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v11 = v10;
  uint64_t v29 = v9;
  char v34 = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v14 = v13;
  uint64_t v27 = v12;
  char v33 = 2;
  swift_bridgeObjectRetain();
  uint64_t v15 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v28 = v16;
  uint64_t v24 = v15;
  uint64_t v26 = v14;
  char v32 = 3;
  swift_bridgeObjectRetain();
  uint64_t v25 = 0;
  uint64_t v23 = KeyedDecodingContainer.decode(_:forKey:)();
  char v31 = 4;
  uint64_t v17 = KeyedDecodingContainer.decode(_:forKey:)();
  char v30 = 5;
  char v18 = KeyedDecodingContainer.decode(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_10000CCA0((uint64_t)a1);
  uint64_t v19 = v28;
  swift_bridgeObjectRelease();
  uint64_t v20 = v26;
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v29;
  *(void *)(a2 + 8) = v11;
  *(void *)(a2 + 16) = v27;
  *(void *)(a2 + 24) = v20;
  *(void *)(a2 + 32) = v24;
  *(void *)(a2 + 40) = v19;
  *(void *)(a2 + 48) = v23;
  *(void *)(a2 + 56) = v17;
  *(unsigned char *)(a2 + 64) = v18 & 1;
  return result;
}

void *sub_10000CC08(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_10000CC4C()
{
  unint64_t result = qword_1000188B0;
  if (!qword_1000188B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000188B0);
  }
  return result;
}

uint64_t sub_10000CCA0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unsigned char *initializeBufferWithCopyOfBuffer for MobileAssetProperties.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MobileAssetProperties.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for MobileAssetProperties.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x10000CE5CLL);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

uint64_t sub_10000CE84(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000CE8C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MobileAssetProperties.CodingKeys()
{
  return &type metadata for MobileAssetProperties.CodingKeys;
}

uint64_t _s16ProductKitViewer21MobileAssetPropertiesVwxx_0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t _s16ProductKitViewer21MobileAssetPropertiesVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s16ProductKitViewer21MobileAssetPropertiesVwca_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  return a1;
}

uint64_t _s16ProductKitViewer21MobileAssetPropertiesVwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  return a1;
}

uint64_t _s16ProductKitViewer21MobileAssetPropertiesVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 65)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_10000D0A8(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 64) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 65) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MobileAssetPropertyList()
{
  return &type metadata for MobileAssetPropertyList;
}

unint64_t sub_10000D110()
{
  unint64_t result = qword_1000188C0;
  if (!qword_1000188C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000188C0);
  }
  return result;
}

unint64_t sub_10000D168()
{
  unint64_t result = qword_1000188C8;
  if (!qword_1000188C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000188C8);
  }
  return result;
}

unint64_t sub_10000D1C0()
{
  unint64_t result = qword_1000188D0;
  if (!qword_1000188D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000188D0);
  }
  return result;
}

unint64_t sub_10000D218()
{
  unint64_t result = qword_1000188D8;
  if (!qword_1000188D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000188D8);
  }
  return result;
}

uint64_t sub_10000D26C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_10000720C(&qword_1000188E0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000CC08(a1, a1[3]);
  sub_10000D414();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return sub_10000CCA0((uint64_t)a1);
  }
  sub_10000D468();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  long long v15 = v18;
  long long v16 = v17;
  long long v14 = v19;
  uint64_t v9 = v20;
  uint64_t v10 = v21;
  char v11 = v22;
  uint64_t result = sub_10000CCA0((uint64_t)a1);
  long long v13 = v15;
  *(_OWORD *)a2 = v16;
  *(_OWORD *)(a2 + 16) = v13;
  *(_OWORD *)(a2 + 32) = v14;
  *(void *)(a2 + 48) = v9;
  *(void *)(a2 + 56) = v10;
  *(unsigned char *)(a2 + 64) = v11;
  return result;
}

unint64_t sub_10000D414()
{
  unint64_t result = qword_1000188E8;
  if (!qword_1000188E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000188E8);
  }
  return result;
}

unint64_t sub_10000D468()
{
  unint64_t result = qword_1000188F0;
  if (!qword_1000188F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000188F0);
  }
  return result;
}

unint64_t sub_10000D4BC()
{
  unint64_t result = qword_100018900;
  if (!qword_100018900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018900);
  }
  return result;
}

uint64_t sub_10000D510(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000D55C(uint64_t a1)
{
  return a1;
}

uint64_t getEnumTagSinglePayload for MobileAssetPropertyList.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for MobileAssetPropertyList.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10000D698);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000D6C0()
{
  return 0;
}

ValueMetadata *type metadata accessor for MobileAssetPropertyList.CodingKeys()
{
  return &type metadata for MobileAssetPropertyList.CodingKeys;
}

unint64_t sub_10000D6DC()
{
  unint64_t result = qword_100018908;
  if (!qword_100018908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018908);
  }
  return result;
}

unint64_t sub_10000D734()
{
  unint64_t result = qword_100018910;
  if (!qword_100018910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018910);
  }
  return result;
}

unint64_t sub_10000D78C()
{
  unint64_t result = qword_100018918;
  if (!qword_100018918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018918);
  }
  return result;
}

BOOL sub_10000D7E4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_10000D7FC()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000D844()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10000D870()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

id sub_10000D8B4()
{
  uint64_t v1 = sub_10000720C(&qword_100018958);
  __chkstk_darwin(v1 - 8);
  int v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v4 = (objc_class *)type metadata accessor for AssetMovieViewController();
  v12.receiver = v0;
  v12.super_class = v4;
  [super viewDidLoad];
  id result = [v0 view];
  if (result)
  {
    uint64_t v6 = result;
    id v7 = [self systemBackgroundColor];
    [v6 setBackgroundColor:v7];

    uint64_t v8 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v3, 1, 1, v8);
    type metadata accessor for MainActor();
    id v9 = v0;
    uint64_t v10 = static MainActor.shared.getter();
    char v11 = (void *)swift_allocObject();
    v11[2] = v10;
    v11[3] = &protocol witness table for MainActor;
    _OWORD v11[4] = v9;
    sub_10001042C((uint64_t)v3, (uint64_t)&unk_100018968, (uint64_t)v11);
    return (id)swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000DA4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[11] = a4;
  uint64_t v5 = type metadata accessor for HeadphonePairing.Assets.VideoViewIdentifier();
  v4[12] = v5;
  v4[13] = *(void *)(v5 - 8);
  v4[14] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for HeadphonePairing.Assets();
  v4[15] = v6;
  v4[16] = *(void *)(v6 - 8);
  v4[17] = swift_task_alloc();
  sub_10000720C(&qword_100018980);
  v4[18] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for HeadphonePairing.Configuration();
  v4[19] = v7;
  v4[20] = *(void *)(v7 - 8);
  v4[21] = swift_task_alloc();
  v4[22] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for HeadphoneHardwareModel();
  v4[23] = v8;
  v4[24] = *(void *)(v8 - 8);
  v4[25] = swift_task_alloc();
  v4[26] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for AirTagPairing.Assets.ViewIdentifier();
  v4[27] = v9;
  v4[28] = *(void *)(v9 - 8);
  v4[29] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for AirTagPairing.Assets();
  v4[30] = v10;
  v4[31] = *(void *)(v10 - 8);
  v4[32] = swift_task_alloc();
  sub_10000720C(&qword_100018988);
  v4[33] = swift_task_alloc();
  uint64_t v11 = type metadata accessor for AirTagPairing.Configuration();
  v4[34] = v11;
  v4[35] = *(void *)(v11 - 8);
  v4[36] = swift_task_alloc();
  v4[37] = swift_task_alloc();
  uint64_t v12 = type metadata accessor for PersonalizationAssetManager.PrePairingAssetInfo();
  v4[38] = v12;
  v4[39] = *(void *)(v12 - 8);
  v4[40] = swift_task_alloc();
  v4[41] = swift_task_alloc();
  uint64_t v13 = type metadata accessor for AirTagPairing.Configuration.Color();
  v4[42] = v13;
  v4[43] = *(void *)(v13 - 8);
  v4[44] = swift_task_alloc();
  v4[45] = swift_task_alloc();
  uint64_t v14 = type metadata accessor for AirTagHardwareModel();
  v4[46] = v14;
  v4[47] = *(void *)(v14 - 8);
  v4[48] = swift_task_alloc();
  v4[49] = swift_task_alloc();
  type metadata accessor for MainActor();
  v4[50] = static MainActor.shared.getter();
  uint64_t v16 = dispatch thunk of Actor.unownedExecutor.getter();
  v4[51] = v16;
  v4[52] = v15;
  return _swift_task_switch(sub_10000DF3C, v16, v15);
}

uint64_t sub_10000DF3C()
{
  if (*(unsigned char *)(v0[11] + OBJC_IVAR____TtC16ProductKitViewer24AssetMovieViewController_mode))
  {
    uint64_t v1 = v0[39];
    uint64_t v2 = v0[40];
    uint64_t v4 = v0[25];
    uint64_t v3 = v0[26];
    uint64_t v6 = v0[23];
    uint64_t v5 = v0[24];
    uint64_t v7 = v0[22];
    uint64_t v31 = v0[38];
    uint64_t v33 = v0[21];
    uint64_t v8 = v0[20];
    uint64_t v35 = v0[19];
    uint64_t v9 = v0[18];
    (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v3, enum case for HeadphoneHardwareModel.airPodsPro(_:), v6);
    static PersonalizationAssetManager.PrePairingAssetInfo.fixture_airpods_test1.getter();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v3, v6);
    DefaultAssetRequestTimeout.getter();
    HeadphonePairing.Configuration.init(hardwareModel:color:timeout:)();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v9, v2, v31);
    uint64_t v10 = enum case for PersonalizationAssetManager.AssetInfo.prePairing(_:);
    uint64_t v11 = type metadata accessor for PersonalizationAssetManager.AssetInfo();
    uint64_t v12 = *(void *)(v11 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 104))(v9, v10, v11);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    HeadphonePairing.Configuration.engravingInformation.setter();
    type metadata accessor for HeadphonePairing.AssetRequest();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v33, v7, v35);
    v0[56] = AbstractAssetRequest.__allocating_init(configuration:)();
    uint64_t v13 = (void *)swift_task_alloc();
    v0[57] = v13;
    void *v13 = v0;
    v13[1] = sub_10000F10C;
    uint64_t v14 = v0[17];
    return HeadphonePairing.AssetRequest.assets()(v14);
  }
  else
  {
    uint64_t v15 = v0[48];
    uint64_t v16 = v0[49];
    uint64_t v18 = v0[46];
    uint64_t v17 = v0[47];
    uint64_t v19 = v0[45];
    uint64_t v21 = v0[42];
    uint64_t v20 = v0[43];
    uint64_t v22 = v0[41];
    uint64_t v23 = v0[39];
    uint64_t v29 = v0[37];
    uint64_t v30 = v0[38];
    uint64_t v32 = v0[35];
    uint64_t v34 = v0[36];
    uint64_t v36 = v0[34];
    uint64_t v27 = v0[44];
    uint64_t v28 = v0[33];
    (*(void (**)(uint64_t, void, uint64_t))(v17 + 104))(v16, enum case for AirTagHardwareModel.original(_:), v18);
    (*(void (**)(uint64_t, void, uint64_t))(v20 + 104))(v19, enum case for AirTagPairing.Configuration.Color.white(_:), v21);
    static PersonalizationAssetManager.PrePairingAssetInfo.fixture_airtag_anusree_AB21.getter();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v15, v16, v18);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v27, v19, v21);
    AirTagPairing.Configuration.init(hardwareModel:color:timeout:)();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v28, v22, v30);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v23 + 56))(v28, 0, 1, v30);
    AirTagPairing.Configuration.engravingInformation.setter();
    type metadata accessor for AirTagPairing.AssetRequest();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16))(v34, v29, v36);
    v0[53] = AbstractAssetRequest.__allocating_init(configuration:)();
    uint64_t v24 = (void *)swift_task_alloc();
    v0[54] = v24;
    void *v24 = v0;
    v24[1] = sub_10000E36C;
    uint64_t v25 = v0[32];
    return AirTagPairing.AssetRequest.assets()(v25);
  }
}

uint64_t sub_10000E36C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 440) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 416);
  uint64_t v4 = *(void *)(v2 + 408);
  if (v0) {
    uint64_t v5 = sub_10000FE90;
  }
  else {
    uint64_t v5 = sub_10000E4A8;
  }
  return _swift_task_switch(v5, v4, v3);
}

id sub_10000E4A8()
{
  uint64_t v97 = v0[49];
  uint64_t v1 = v0[47];
  uint64_t v93 = v0[46];
  uint64_t v2 = v0[43];
  uint64_t v90 = v0[42];
  id v91 = (id)v0[45];
  uint64_t v3 = v0[39];
  uint64_t v88 = v0[38];
  uint64_t v89 = v0[41];
  uint64_t v4 = v0[35];
  uint64_t v85 = v0[34];
  uint64_t v86 = v0[37];
  uint64_t v6 = v0[31];
  uint64_t v5 = v0[32];
  uint64_t v7 = v0[29];
  uint64_t v84 = v0[30];
  uint64_t v8 = v0[27];
  uint64_t v9 = v0[28];
  swift_release();
  (*(void (**)(uint64_t, void, uint64_t))(v9 + 104))(v7, enum case for AirTagPairing.Assets.ViewIdentifier.intro(_:), v8);
  id v87 = (id)AirTagPairing.Assets.view(_:)();
  uint64_t v96 = v10;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v84);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v86, v85);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v89, v88);
  (*(void (**)(id, uint64_t))(v2 + 8))(v91, v90);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v97, v93);
  uint64_t v94 = (void *)v0[11];
  [v87 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v87 setAlpha:0.0];
  id v11 = [v87 layer];
  id v12 = [self redColor];
  id v13 = [v12 CGColor];

  [v11 setBorderColor:v13];
  id v14 = [v87 layer];
  [v14 setBorderWidth:1.0];

  sub_100010F5C(0, &qword_1000189A0);
  sub_100010F5C(0, &qword_1000189A8);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v87;
  *(void *)(v15 + 24) = v96;
  id v16 = v87;
  uint64_t v81 = v15;
  v100.value.super.super.Class isa = (Class)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
  v17.super.super.super.super.Class isa = UIButton.init(type:primaryAction:)(UIButtonTypeSystem, v100).super.super.super.super.isa;
  NSString v18 = String._bridgeToObjectiveC()();
  -[objc_class setTitle:forState:](v17.super.super.super.super.isa, "setTitle:forState:", v18, 0, 0, 0, 0, sub_100010EC4, v81);

  [(objc_class *)v17.super.super.super.super.isa setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v16;
  *(void *)(v19 + 24) = v96;
  id v20 = v16;
  uint64_t v82 = v19;
  v101.value.super.super.Class isa = (Class)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
  v21.super.super.super.super.Class isa = UIButton.init(type:primaryAction:)(UIButtonTypeSystem, v101).super.super.super.super.isa;
  NSString v22 = String._bridgeToObjectiveC()();
  -[objc_class setTitle:forState:](v21.super.super.super.super.isa, "setTitle:forState:", v22, 0, 0, 0, 0, sub_100010EDC, v82);

  Class isa = v21.super.super.super.super.isa;
  [(objc_class *)v21.super.super.super.super.isa setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v20;
  *(void *)(v23 + 24) = v96;
  id v24 = v20;
  uint64_t v83 = v23;
  v102.value.super.super.Class isa = (Class)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
  v25.super.super.super.super.Class isa = UIButton.init(type:primaryAction:)(UIButtonTypeSystem, v102).super.super.super.super.isa;
  NSString v26 = String._bridgeToObjectiveC()();
  -[objc_class setTitle:forState:](v25.super.super.super.super.isa, "setTitle:forState:", v26, 0, 0, 0, 0, sub_100010EF4, v83);

  [(objc_class *)v25.super.super.super.super.isa setTranslatesAutoresizingMaskIntoConstraints:0];
  id result = [v94 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v28 = result;
  uint64_t v29 = (void *)v0[11];
  uint64_t v95 = v24;
  [result addSubview:v24];

  id result = [v29 view];
  if (!result)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v30 = result;
  uint64_t v31 = (void *)v0[11];
  [result addSubview:v17.super.super.super.super.isa];

  id result = [v31 view];
  if (!result)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v32 = result;
  Class v92 = v17.super.super.super.super.isa;
  uint64_t v33 = (void *)v0[11];
  [result addSubview:v21.super.super.super.super.isa];

  id result = [v33 view];
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v34 = result;
  uint64_t v35 = (void *)v0[11];
  [result addSubview:v25.super.super.super.super.isa];

  sub_10000720C(&qword_1000189B0);
  uint64_t v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_1000123C0;
  id v37 = [v24 centerXAnchor];
  id result = [v35 view];
  if (!result)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  int64_t v38 = result;
  uint64_t v39 = (void *)v0[11];
  id v40 = [result centerXAnchor];

  id v41 = [v37 constraintEqualToAnchor:v40];
  *(void *)(v36 + 32) = v41;
  id v42 = [v95 centerYAnchor];
  id result = [v39 view];
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v43 = result;
  uint64_t v44 = (void *)v0[11];
  id v45 = [result centerYAnchor];

  id v46 = [v42 constraintEqualToAnchor:v45];
  *(void *)(v36 + 40) = v46;
  id v47 = [v95 widthAnchor];
  id v48 = [v47 constraintEqualToConstant:350.0];

  *(void *)(v36 + 48) = v48;
  id v49 = [v95 heightAnchor];
  id v50 = [v49 constraintEqualToConstant:362.0];

  *(void *)(v36 + 56) = v50;
  id v51 = [(objc_class *)v21.super.super.super.super.isa centerXAnchor];
  id result = [v44 view];
  if (!result)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  BOOL v52 = result;
  uint64_t v53 = (void *)v0[11];
  id v54 = [result centerXAnchor];

  id v55 = [v51 constraintEqualToAnchor:v54];
  *(void *)(v36 + 64) = v55;
  id v56 = [(objc_class *)v21.super.super.super.super.isa topAnchor];
  id v57 = [v95 bottomAnchor];
  id v58 = [v56 constraintEqualToAnchor:v57 constant:10.0];

  *(void *)(v36 + 72) = v58;
  id v59 = [(objc_class *)v25.super.super.super.super.isa centerXAnchor];
  id result = [v53 view];
  if (!result)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v60 = result;
  v61 = (void *)v0[11];
  id v62 = [result centerXAnchor];

  id v63 = [v59 constraintEqualToAnchor:v62];
  *(void *)(v36 + 80) = v63;
  id v64 = [(objc_class *)v25.super.super.super.super.isa topAnchor];
  id v65 = [(objc_class *)v21.super.super.super.super.isa bottomAnchor];
  id v66 = [v64 constraintEqualToAnchor:v65 constant:10.0];

  *(void *)(v36 + 88) = v66;
  id v67 = [(objc_class *)v92 centerXAnchor];
  id result = [v61 view];
  if (!result)
  {
LABEL_21:
    __break(1u);
    return result;
  }
  uint64_t v68 = result;
  uint64_t v69 = self;
  id v70 = [v68 centerXAnchor];

  id v71 = [v67 constraintEqualToAnchor:v70];
  *(void *)(v36 + 96) = v71;
  id v72 = [(objc_class *)v92 topAnchor];
  id v73 = [(objc_class *)v25.super.super.super.super.isa bottomAnchor];
  id v74 = [v72 constraintEqualToAnchor:v73 constant:10.0];

  *(void *)(v36 + 104) = v74;
  specialized Array._endMutation()();
  sub_100010F5C(0, &qword_1000189B8);
  Class v75 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v69 activateConstraints:v75];

  unint64_t v76 = self;
  uint64_t v77 = swift_allocObject();
  *(void *)(v77 + 16) = v95;
  *(void *)(v77 + 24) = v96;
  v0[6] = sub_100010F98;
  v0[7] = v77;
  v0[2] = _NSConcreteStackBlock;
  v0[3] = 1107296256;
  v0[4] = sub_1000103E8;
  v0[5] = &unk_100015280;
  unint64_t v78 = _Block_copy(v0 + 2);
  id v79 = v95;
  swift_release();
  [v76 animateWithDuration:v78 animations:0.3];

  _Block_release(v78);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v80 = (uint64_t (*)(void))v0[1];
  return (id)v80();
}

uint64_t sub_10000F10C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 464) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 416);
  uint64_t v4 = *(void *)(v2 + 408);
  if (v0) {
    uint64_t v5 = sub_10001014C;
  }
  else {
    uint64_t v5 = sub_10000F248;
  }
  return _swift_task_switch(v5, v4, v3);
}

id sub_10000F248()
{
  uint64_t v1 = v0[39];
  uint64_t v86 = v0[38];
  id v87 = (id)v0[40];
  uint64_t v93 = v0[26];
  uint64_t v2 = v0[24];
  id v89 = (id)v0[23];
  uint64_t v3 = v0[20];
  uint64_t v84 = v0[19];
  uint64_t v85 = v0[22];
  uint64_t v4 = v0[16];
  uint64_t v5 = v0[17];
  uint64_t v6 = v0[14];
  uint64_t v83 = v0[15];
  uint64_t v7 = v0[12];
  uint64_t v8 = v0[13];
  swift_release();
  (*(void (**)(uint64_t, void, uint64_t))(v8 + 104))(v6, enum case for HeadphonePairing.Assets.VideoViewIdentifier.loopCharged(_:), v7);
  uint64_t v9 = (void *)HeadphonePairing.Assets.videoView(_:)();
  uint64_t v92 = v10;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v83);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v85, v84);
  (*(void (**)(id, uint64_t))(v1 + 8))(v87, v86);
  (*(void (**)(uint64_t, id))(v2 + 8))(v93, v89);
  id v90 = (id)v0[11];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 setAlpha:0.0];
  id v11 = [v9 layer];
  id v12 = [self redColor];
  id v13 = [v12 CGColor];

  [v11 setBorderColor:v13];
  id v14 = [v9 layer];
  [v14 setBorderWidth:1.0];

  sub_100010F5C(0, &qword_1000189A0);
  sub_100010F5C(0, &qword_1000189A8);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v9;
  *(void *)(v15 + 24) = v92;
  id v16 = v9;
  v96.value.super.super.Class isa = (Class)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
  v17.super.super.super.super.Class isa = UIButton.init(type:primaryAction:)(UIButtonTypeSystem, v96).super.super.super.super.isa;
  NSString v18 = String._bridgeToObjectiveC()();
  -[objc_class setTitle:forState:](v17.super.super.super.super.isa, "setTitle:forState:", v18, 0, 0, 0, 0, sub_100010EC4, v15);

  [(objc_class *)v17.super.super.super.super.isa setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v16;
  *(void *)(v19 + 24) = v92;
  id v20 = v16;
  uint64_t v81 = v19;
  v97.value.super.super.Class isa = (Class)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
  v21.super.super.super.super.Class isa = UIButton.init(type:primaryAction:)(UIButtonTypeSystem, v97).super.super.super.super.isa;
  NSString v22 = String._bridgeToObjectiveC()();
  -[objc_class setTitle:forState:](v21.super.super.super.super.isa, "setTitle:forState:", v22, 0, 0, 0, 0, sub_100010EDC, v81);

  Class isa = v21.super.super.super.super.isa;
  [(objc_class *)v21.super.super.super.super.isa setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v20;
  *(void *)(v23 + 24) = v92;
  id v24 = v20;
  uint64_t v82 = v23;
  v98.value.super.super.Class isa = (Class)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
  v25.super.super.super.super.Class isa = UIButton.init(type:primaryAction:)(UIButtonTypeSystem, v98).super.super.super.super.isa;
  NSString v26 = String._bridgeToObjectiveC()();
  -[objc_class setTitle:forState:](v25.super.super.super.super.isa, "setTitle:forState:", v26, 0, 0, 0, 0, sub_100010EF4, v82);

  [(objc_class *)v25.super.super.super.super.isa setTranslatesAutoresizingMaskIntoConstraints:0];
  id result = [v90 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v28 = result;
  uint64_t v29 = (void *)v0[11];
  id v91 = v24;
  [result addSubview:v24];

  id result = [v29 view];
  if (!result)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v30 = result;
  uint64_t v31 = (void *)v0[11];
  [result addSubview:v17.super.super.super.super.isa];

  id result = [v31 view];
  if (!result)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v32 = result;
  Class v88 = v17.super.super.super.super.isa;
  uint64_t v33 = (void *)v0[11];
  [result addSubview:v21.super.super.super.super.isa];

  id result = [v33 view];
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v34 = result;
  uint64_t v35 = (void *)v0[11];
  [result addSubview:v25.super.super.super.super.isa];

  sub_10000720C(&qword_1000189B0);
  uint64_t v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_1000123C0;
  id v37 = [v24 centerXAnchor];
  id result = [v35 view];
  if (!result)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  int64_t v38 = result;
  uint64_t v39 = (void *)v0[11];
  id v40 = [result centerXAnchor];

  id v41 = [v37 constraintEqualToAnchor:v40];
  *(void *)(v36 + 32) = v41;
  id v42 = [v91 centerYAnchor];
  id result = [v39 view];
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v43 = result;
  uint64_t v44 = (void *)v0[11];
  id v45 = [result centerYAnchor];

  id v46 = [v42 constraintEqualToAnchor:v45];
  *(void *)(v36 + 40) = v46;
  id v47 = [v91 widthAnchor];
  id v48 = [v47 constraintEqualToConstant:350.0];

  *(void *)(v36 + 48) = v48;
  id v49 = [v91 heightAnchor];
  id v50 = [v49 constraintEqualToConstant:362.0];

  *(void *)(v36 + 56) = v50;
  id v51 = [(objc_class *)v21.super.super.super.super.isa centerXAnchor];
  id result = [v44 view];
  if (!result)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  BOOL v52 = result;
  uint64_t v53 = (void *)v0[11];
  id v54 = [result centerXAnchor];

  id v55 = [v51 constraintEqualToAnchor:v54];
  *(void *)(v36 + 64) = v55;
  id v56 = [(objc_class *)v21.super.super.super.super.isa topAnchor];
  id v57 = [v91 bottomAnchor];
  id v58 = [v56 constraintEqualToAnchor:v57 constant:10.0];

  *(void *)(v36 + 72) = v58;
  id v59 = [(objc_class *)v25.super.super.super.super.isa centerXAnchor];
  id result = [v53 view];
  if (!result)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v60 = result;
  v61 = (void *)v0[11];
  id v62 = [result centerXAnchor];

  id v63 = [v59 constraintEqualToAnchor:v62];
  *(void *)(v36 + 80) = v63;
  id v64 = [(objc_class *)v25.super.super.super.super.isa topAnchor];
  id v65 = [(objc_class *)v21.super.super.super.super.isa bottomAnchor];
  id v66 = [v64 constraintEqualToAnchor:v65 constant:10.0];

  *(void *)(v36 + 88) = v66;
  id v67 = [(objc_class *)v88 centerXAnchor];
  id result = [v61 view];
  if (!result)
  {
LABEL_21:
    __break(1u);
    return result;
  }
  uint64_t v68 = result;
  uint64_t v69 = self;
  id v70 = [v68 centerXAnchor];

  id v71 = [v67 constraintEqualToAnchor:v70];
  *(void *)(v36 + 96) = v71;
  id v72 = [(objc_class *)v88 topAnchor];
  id v73 = [(objc_class *)v25.super.super.super.super.isa bottomAnchor];
  id v74 = [v72 constraintEqualToAnchor:v73 constant:10.0];

  *(void *)(v36 + 104) = v74;
  specialized Array._endMutation()();
  sub_100010F5C(0, &qword_1000189B8);
  Class v75 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v69 activateConstraints:v75];

  unint64_t v76 = self;
  uint64_t v77 = swift_allocObject();
  *(void *)(v77 + 16) = v91;
  *(void *)(v77 + 24) = v92;
  v0[6] = sub_100010F98;
  v0[7] = v77;
  v0[2] = _NSConcreteStackBlock;
  v0[3] = 1107296256;
  v0[4] = sub_1000103E8;
  v0[5] = &unk_100015280;
  unint64_t v78 = _Block_copy(v0 + 2);
  id v79 = v91;
  swift_release();
  [v76 animateWithDuration:v78 animations:0.3];

  _Block_release(v78);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v80 = (uint64_t (*)(void))v0[1];
  return (id)v80();
}

uint64_t sub_10000FE90()
{
  uint64_t v1 = v0[37];
  uint64_t v2 = v0[34];
  uint64_t v3 = v0[35];
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  uint64_t v4 = v0[55];
  uint64_t v5 = v0[49];
  uint64_t v6 = v0[46];
  uint64_t v7 = v0[47];
  uint64_t v8 = v0[45];
  uint64_t v9 = v0[42];
  uint64_t v10 = v0[43];
  (*(void (**)(void, void))(v0[39] + 8))(v0[41], v0[38]);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  sub_10000720C(&qword_100018990);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1000123D0;
  _StringGuts.grow(_:)(17);
  v0[8] = 0;
  v0[9] = 0xE000000000000000;
  v12._countAndFlagsBits = 0x6465766965636552;
  v12._object = (void *)0xEF20726F72726520;
  String.append(_:)(v12);
  v0[10] = v4;
  sub_10000720C(&qword_100018998);
  _print_unlocked<A, B>(_:_:)();
  uint64_t v13 = v0[8];
  uint64_t v14 = v0[9];
  *(void *)(v11 + 56) = &type metadata for String;
  *(void *)(v11 + 32) = v13;
  *(void *)(v11 + 40) = v14;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  swift_errorRelease();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_10001014C()
{
  swift_release();
  swift_release();
  uint64_t v1 = v0[58];
  uint64_t v3 = v0[39];
  uint64_t v2 = v0[40];
  uint64_t v4 = v0[38];
  uint64_t v5 = v0[26];
  uint64_t v6 = v0[23];
  uint64_t v7 = v0[24];
  (*(void (**)(void, void))(v0[20] + 8))(v0[22], v0[19]);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  sub_10000720C(&qword_100018990);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1000123D0;
  _StringGuts.grow(_:)(17);
  v0[8] = 0;
  v0[9] = 0xE000000000000000;
  v9._countAndFlagsBits = 0x6465766965636552;
  v9._object = (void *)0xEF20726F72726520;
  String.append(_:)(v9);
  v0[10] = v1;
  sub_10000720C(&qword_100018998);
  _print_unlocked<A, B>(_:_:)();
  uint64_t v10 = v0[8];
  uint64_t v11 = v0[9];
  *(void *)(v8 + 56) = &type metadata for String;
  *(void *)(v8 + 32) = v10;
  *(void *)(v8 + 40) = v11;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  swift_errorRelease();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  Swift::String v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_1000103E8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_10001042C(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_100010B68(a1);
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

id sub_100010730()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AssetMovieViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for AssetMovieViewController()
{
  return self;
}

uint64_t getEnumTagSinglePayload for AssetMovieViewController.Mode(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AssetMovieViewController.Mode(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *id result = a2 + 1;
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
        JUMPOUT(0x1000108E4);
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
          *id result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_10001090C(unsigned char *result, char a2)
{
  *id result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AssetMovieViewController.Mode()
{
  return &type metadata for AssetMovieViewController.Mode;
}

unint64_t sub_10001092C()
{
  unint64_t result = qword_100018950;
  if (!qword_100018950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018950);
  }
  return result;
}

uint64_t sub_100010980()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000109C0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *BOOL v7 = v2;
  v7[1] = sub_100010A74;
  return sub_10000DA4C(a1, v4, v5, v6);
}

uint64_t sub_100010A74()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100010B68(uint64_t a1)
{
  uint64_t v2 = sub_10000720C(&qword_100018958);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100010BC8(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100010CA4;
  return v6(a1);
}

uint64_t sub_100010CA4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100010D9C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100010DD4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100010A74;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100018970 + dword_100018970);
  return v6(a1, v4);
}

uint64_t sub_100010E8C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100010EC4(uint64_t a1)
{
  return sub_100010F0C(a1, (uint64_t (*)(uint64_t, uint64_t))&dispatch thunk of VideoPlaybackControllable.transitionToFeatures());
}

uint64_t sub_100010EDC(uint64_t a1)
{
  return sub_100010F0C(a1, (uint64_t (*)(uint64_t, uint64_t))&dispatch thunk of VideoPlaybackControllable.play());
}

uint64_t sub_100010EF4(uint64_t a1)
{
  return sub_100010F0C(a1, (uint64_t (*)(uint64_t, uint64_t))&dispatch thunk of VideoPlaybackControllable.stop());
}

uint64_t sub_100010F0C(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(v2 + 24);
  uint64_t ObjectType = swift_getObjectType();
  return a2(ObjectType, v4);
}

uint64_t sub_100010F5C(uint64_t a1, unint64_t *a2)
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

id sub_100010F98()
{
  return [*(id *)(v0 + 16) setAlpha:1.0];
}

uint64_t sub_100010FAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100010FBC()
{
  return swift_release();
}

uint64_t KeyPathComparator.init<A>(_:order:)()
{
  return KeyPathComparator.init<A>(_:order:)();
}

uint64_t static URL.== infix(_:_:)()
{
  return static URL.== infix(_:_:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t type metadata accessor for AirTagPairing.AssetRequest()
{
  return type metadata accessor for AirTagPairing.AssetRequest();
}

uint64_t AirTagPairing.Configuration.init(hardwareModel:color:timeout:)()
{
  return AirTagPairing.Configuration.init(hardwareModel:color:timeout:)();
}

uint64_t AirTagPairing.Configuration.engravingInformation.setter()
{
  return AirTagPairing.Configuration.engravingInformation.setter();
}

uint64_t type metadata accessor for AirTagPairing.Configuration.Color()
{
  return type metadata accessor for AirTagPairing.Configuration.Color();
}

uint64_t type metadata accessor for AirTagPairing.Configuration()
{
  return type metadata accessor for AirTagPairing.Configuration();
}

uint64_t type metadata accessor for AirTagPairing.Assets.ViewIdentifier()
{
  return type metadata accessor for AirTagPairing.Assets.ViewIdentifier();
}

uint64_t AirTagPairing.Assets.view(_:)()
{
  return AirTagPairing.Assets.view(_:)();
}

uint64_t type metadata accessor for AirTagPairing.Assets()
{
  return type metadata accessor for AirTagPairing.Assets();
}

uint64_t iosmacHardware.Model.id.getter()
{
  return iosmacHardware.Model.id.getter();
}

uint64_t type metadata accessor for iosmacHardware.Model()
{
  return type metadata accessor for iosmacHardware.Model();
}

uint64_t iosmacHardware.image.getter()
{
  return iosmacHardware.image.getter();
}

uint64_t iosmacHardware.model.getter()
{
  return iosmacHardware.model.getter();
}

uint64_t static iosmacHardware.allCases.getter()
{
  return static iosmacHardware.allCases.getter();
}

uint64_t iosmacHardware.imageName.getter()
{
  return iosmacHardware.imageName.getter();
}

uint64_t type metadata accessor for iosmacHardware()
{
  return type metadata accessor for iosmacHardware();
}

uint64_t type metadata accessor for HeadphonePairing.AssetRequest()
{
  return type metadata accessor for HeadphonePairing.AssetRequest();
}

uint64_t HeadphonePairing.Configuration.init(hardwareModel:color:timeout:)()
{
  return HeadphonePairing.Configuration.init(hardwareModel:color:timeout:)();
}

uint64_t HeadphonePairing.Configuration.engravingInformation.setter()
{
  return HeadphonePairing.Configuration.engravingInformation.setter();
}

uint64_t type metadata accessor for HeadphonePairing.Configuration()
{
  return type metadata accessor for HeadphonePairing.Configuration();
}

uint64_t type metadata accessor for HeadphonePairing.Assets.VideoViewIdentifier()
{
  return type metadata accessor for HeadphonePairing.Assets.VideoViewIdentifier();
}

uint64_t HeadphonePairing.Assets.videoView(_:)()
{
  return HeadphonePairing.Assets.videoView(_:)();
}

uint64_t type metadata accessor for HeadphonePairing.Assets()
{
  return type metadata accessor for HeadphonePairing.Assets();
}

uint64_t type metadata accessor for AirTagHardwareModel()
{
  return type metadata accessor for AirTagHardwareModel();
}

uint64_t AbstractAssetRequest.__allocating_init(configuration:)()
{
  return AbstractAssetRequest.__allocating_init(configuration:)();
}

uint64_t type metadata accessor for HeadphoneHardwareModel()
{
  return type metadata accessor for HeadphoneHardwareModel();
}

uint64_t DefaultAssetRequestTimeout.getter()
{
  return DefaultAssetRequestTimeout.getter();
}

uint64_t static PersonalizationAssetManager.PrePairingAssetInfo.fixture_airpods_test1.getter()
{
  return static PersonalizationAssetManager.PrePairingAssetInfo.fixture_airpods_test1.getter();
}

uint64_t static PersonalizationAssetManager.PrePairingAssetInfo.fixture_airtag_anusree_AB21.getter()
{
  return static PersonalizationAssetManager.PrePairingAssetInfo.fixture_airtag_anusree_AB21.getter();
}

uint64_t type metadata accessor for PersonalizationAssetManager.PrePairingAssetInfo()
{
  return type metadata accessor for PersonalizationAssetManager.PrePairingAssetInfo();
}

uint64_t type metadata accessor for PersonalizationAssetManager.AssetInfo()
{
  return type metadata accessor for PersonalizationAssetManager.AssetInfo();
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t type metadata accessor for Published()
{
  return type metadata accessor for Published();
}

uint64_t StateObject.wrappedValue.getter()
{
  return StateObject.wrappedValue.getter();
}

uint64_t WindowGroup.init(id:title:lazyContent:)()
{
  return WindowGroup.init(id:title:lazyContent:)();
}

uint64_t static SceneBuilder.buildBlock<A>(_:)()
{
  return static SceneBuilder.buildBlock<A>(_:)();
}

uint64_t static VerticalAlignment.center.getter()
{
  return static VerticalAlignment.center.getter();
}

Swift::Void __swiftcall LocalizedStringKey.StringInterpolation.appendInterpolation(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall LocalizedStringKey.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t type metadata accessor for LocalizedStringKey.StringInterpolation()
{
  return type metadata accessor for LocalizedStringKey.StringInterpolation();
}

uint64_t LocalizedStringKey.init(stringLiteral:)()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t LocalizedStringKey.init(stringInterpolation:)()
{
  return LocalizedStringKey.init(stringInterpolation:)();
}

uint64_t static HorizontalAlignment.leading.getter()
{
  return static HorizontalAlignment.leading.getter();
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

uint64_t UIViewControllerRepresentable<>.makeCoordinator()()
{
  return UIViewControllerRepresentable<>.makeCoordinator()();
}

uint64_t static App.main()()
{
  return static App.main()();
}

uint64_t List<>.init(content:)()
{
  return List<>.init(content:)();
}

uint64_t Text.init(_:tableName:bundle:comment:)()
{
  return Text.init(_:tableName:bundle:comment:)();
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

uint64_t View.tabItem<A>(_:)()
{
  return View.tabItem<A>(_:)();
}

uint64_t ForEach<>.init(_:content:)()
{
  return ForEach<>.init(_:content:)();
}

uint64_t Section<>.init<A>(_:content:)()
{
  return Section<>.init<A>(_:content:)();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
}

uint64_t Sequence.sorted<A>(using:)()
{
  return Sequence.sorted<A>(using:)();
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

uint64_t UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)()
{
  return UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
}

UIButton __swiftcall UIButton.init(type:primaryAction:)(UIButtonType type, UIAction_optional primaryAction)
{
  return (UIButton)UIButton.init(type:primaryAction:)(type, primaryAction.value.super.super.isa, *(void *)&primaryAction.is_nil);
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
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

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t print(_:separator:terminator:)()
{
  return print(_:separator:terminator:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void bzero(void *a1, size_t a2)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
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

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}