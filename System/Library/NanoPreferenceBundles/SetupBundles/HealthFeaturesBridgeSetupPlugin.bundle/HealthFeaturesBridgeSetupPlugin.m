uint64_t type metadata accessor for HealthFeaturesViewController()
{
  uint64_t result;

  result = qword_14B68;
  if (!qword_14B68) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_3308()
{
  return swift_initClassMetadata2();
}

id sub_336C()
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return Strong;
}

uint64_t sub_33A0()
{
  return swift_unknownObjectWeakAssign();
}

char *sub_33B4(uint64_t a1)
{
  swift_unknownObjectWeakInit();
  *(void *)(v1 + qword_14B60) = 0;
  *(void *)(v1 + qword_14B58) = a1;
  sub_3FF8();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain_n();
  sub_D158();
  swift_release_n();
  swift_release();
  swift_release();
  type metadata accessor for HealthFeaturesSetupFlowController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v4 = self;
  swift_bridgeObjectRetain();
  v5 = (objc_class *)[v4 bundleForClass:ObjCClassFromMetadata];
  v18._countAndFlagsBits = 0xE000000000000000;
  v20._object = (void *)0x800000000000E570;
  v20._countAndFlagsBits = 0xD000000000000022;
  v22.value._countAndFlagsBits = 0;
  v22.value._object = 0;
  v6.super.isa = v5;
  v24._countAndFlagsBits = 0;
  v24._object = (void *)0xE000000000000000;
  sub_D148(v20, v22, v6, v24, v18);

  v7 = (objc_class *)[v4 bundleForClass:ObjCClassFromMetadata];
  v21._countAndFlagsBits = 0xD000000000000023;
  v19._countAndFlagsBits = 0xE000000000000000;
  v21._object = (void *)0x800000000000E5A0;
  v23.value._countAndFlagsBits = 0;
  v23.value._object = 0;
  v8.super.isa = v7;
  v25._countAndFlagsBits = 0;
  v25._object = (void *)0xE000000000000000;
  sub_D148(v21, v23, v8, v25, v19);

  v9 = (char *)(id)sub_D2C8();
  id v10 = objc_msgSend(v9, "hxui_addContinueButtonWithAccessibilityIdentifier:", 0, 0, 0);
  self;
  uint64_t v11 = swift_dynamicCastObjCClass();
  if (!v11)
  {

    uint64_t v11 = 0;
  }
  uint64_t v12 = qword_14B60;
  v13 = *(void **)&v9[qword_14B60];
  *(void *)&v9[qword_14B60] = v11;

  v14 = *(void **)&v9[v12];
  if (v14)
  {
    id v15 = v14;
    id v16 = (id)BPSPillSelectedColor();
    [v15 setTintColor:v16];
  }
  swift_release();
  return v9;
}

void sub_3670()
{
  uint64_t v1 = (char *)objc_allocWithZone(v0);
  swift_unknownObjectWeakInit();
  *(void *)&v1[qword_14B60] = 0;

  sub_D588();
  __break(1u);
}

void sub_3700(void *a1)
{
  v2.receiver = a1;
  v2.super_class = (Class)type metadata accessor for HealthFeaturesViewController();
  id v1 = v2.receiver;
  objc_msgSendSuper2(&v2, "viewDidLoad");
  sub_5374();
}

uint64_t sub_3764()
{
  id v1 = *(void **)(v0 + qword_14B60);
  if (v1) {
    [v1 showsBusyIndicator];
  }
  uint64_t v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_5BD4((uint64_t)sub_4230, v2);
  return swift_release_n();
}

void sub_3808(uint64_t a1)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v3 = (void *)Strong;
    v4 = *(void **)(Strong + qword_14B60);
    if (v4) {
      [v4 hidesBusyIndicator];
    }
    sub_4238(a1, (uint64_t)&v6);
    if (v7)
    {
      sub_391C(v6, v7, v8, v9, v10);
    }
    else
    {
      v5 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v5)
      {
        __break(1u);
        return;
      }
      [v5 miniFlowStepComplete:v3];
      swift_unknownObjectRelease();
    }
  }
}

void sub_38D4(void *a1)
{
  id v1 = a1;
  sub_3764();
}

void sub_391C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, int a5)
{
  uint64_t v6 = v5;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v10 = sub_D338();
  uint64_t v39 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  NSString v13 = sub_D3B8();
  swift_bridgeObjectRelease();
  uint64_t v37 = a3;
  NSString v14 = sub_D3B8();
  swift_bridgeObjectRelease();
  id v15 = [self alertControllerWithTitle:v13 message:v14 preferredStyle:1];

  type metadata accessor for HealthFeaturesSetupFlowController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v17 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v32._countAndFlagsBits = 0xE000000000000000;
  v42._object = (void *)0x800000000000E680;
  v42._countAndFlagsBits = 0xD000000000000029;
  v43.value._countAndFlagsBits = 0;
  v43.value._object = 0;
  v18.super.isa = v17;
  v44._countAndFlagsBits = 0;
  v44._object = (void *)0xE000000000000000;
  sub_D148(v42, v43, v18, v44, v32);

  uint64_t v19 = swift_allocObject();
  int v36 = a5;
  *(unsigned char *)(v19 + 16) = a5;
  *(void *)(v19 + 24) = v6;
  id v20 = v6;
  NSString v21 = sub_D3B8();
  swift_bridgeObjectRelease();
  aBlock[4] = (uint64_t)sub_42F4;
  aBlock[5] = v19;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_3EA4;
  aBlock[3] = (uint64_t)&unk_10878;
  Swift::String_optional v22 = _Block_copy(aBlock);
  swift_release();
  id v23 = [self actionWithTitle:v21 style:1 handler:v22];
  _Block_release(v22);

  [v15 addAction:v23];
  sub_D318();
  swift_bridgeObjectRetain_n();
  v38 = v12;
  Swift::String v24 = sub_D328();
  os_log_type_t v25 = sub_D448();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v26 = 136315651;
    uint64_t v34 = v10;
    uint64_t v27 = sub_D5E8();
    uint64_t ObjectType = (uint64_t)v15;
    uint64_t v28 = v39;
    uint64_t v40 = sub_BF60(v27, v29, aBlock);
    sub_D498();
    swift_bridgeObjectRelease();
    *(_WORD *)(v26 + 12) = 2080;
    if (v36) {
      uint64_t v30 = 1702195828;
    }
    else {
      uint64_t v30 = 0x65736C6166;
    }
    if (v36) {
      unint64_t v31 = 0xE400000000000000;
    }
    else {
      unint64_t v31 = 0xE500000000000000;
    }
    uint64_t v40 = sub_BF60(v30, v31, aBlock);
    sub_D498();
    swift_bridgeObjectRelease();
    *(_WORD *)(v26 + 22) = 2081;
    swift_bridgeObjectRetain();
    uint64_t v40 = sub_BF60(v37, a4, aBlock);
    sub_D498();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v24, v25, "%s Showing alert (progress after: %s) with message: %{private}s", (uint8_t *)v26, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v28 + 8))(v38, v34);
    id v15 = (id)ObjectType;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v38, v10);
  }
  [v20 presentViewController:v15 animated:1 completion:0];
}

void sub_3E34(uint64_t a1, char a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      [Strong miniFlowStepComplete:a3];
      swift_unknownObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_3EA4(uint64_t a1, void *a2)
{
  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_3F0C()
{
  sub_4294(v0 + qword_14B50);
  swift_release();
  id v1 = *(void **)(v0 + qword_14B60);
}

id sub_3F5C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HealthFeaturesViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_3F94(uint64_t a1)
{
  sub_4294(a1 + qword_14B50);
  swift_release();
  objc_super v2 = *(void **)(a1 + qword_14B60);
}

uint64_t sub_3FF0()
{
  return type metadata accessor for HealthFeaturesViewController();
}

void sub_3FF8()
{
  if (!qword_14C78)
  {
    type metadata accessor for HealthFeaturesViewModel();
    sub_4060();
    unint64_t v0 = sub_D178();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_14C78);
    }
  }
}

unint64_t sub_4060()
{
  unint64_t result = qword_14C80;
  if (!qword_14C80)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_14C80);
  }
  return result;
}

double sub_40B4@<D0>(_OWORD *a1@<X8>)
{
  sub_3FF8();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_D158();
  swift_release();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_415C()
{
  return sub_D168();
}

uint64_t sub_41F8()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_4230(uint64_t a1)
{
}

uint64_t sub_4238(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_4294(uint64_t a1)
{
  return a1;
}

uint64_t sub_42BC()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_42F4(uint64_t a1)
{
  sub_3E34(a1, *(unsigned char *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_4300(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_4310()
{
  return swift_release();
}

uint64_t sub_4318()
{
  sub_3FF8();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_D158();
  swift_release();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_43B0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_3FF8();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_D158();
  swift_release();
  swift_release();
  swift_release();
  swift_getObjectType();
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = a1;
  v6[3] = a2;
  v6[4] = v5;
  swift_retain();
  sub_D248();
  swift_unknownObjectRelease();
  return swift_release();
}

uint64_t sub_44F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = a3;
  uint64_t v25 = a4;
  uint64_t v23 = a2;
  uint64_t v5 = sub_D348();
  uint64_t v28 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_D378();
  uint64_t v26 = *(void *)(v8 - 8);
  uint64_t v27 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_9F0C(0);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  __chkstk_darwin(v11 - 8);
  NSString v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_9254();
  id v15 = (void *)sub_D458();
  sub_9FF8(a1, (uint64_t)v14, (uint64_t (*)(void))sub_9F0C);
  unint64_t v16 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v17 = (v13 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v18 = swift_allocObject();
  sub_A1A4((uint64_t)v14, v18 + v16, (uint64_t (*)(void))sub_9F0C);
  uint64_t v19 = (void *)(v18 + v17);
  uint64_t v20 = v24;
  *uint64_t v19 = v23;
  v19[1] = v20;
  *(void *)(v18 + ((v17 + 23) & 0xFFFFFFFFFFFFFFF8)) = v25;
  aBlock[4] = sub_A20C;
  aBlock[5] = v18;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_5330;
  aBlock[3] = &unk_10A80;
  NSString v21 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_D368();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_A40C(&qword_14E78, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_92F0(0, (unint64_t *)&unk_14F70, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_9344();
  sub_D4C8();
  sub_D468();
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v10, v27);
}

uint64_t sub_4898(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3, uint64_t a4)
{
  v90 = a2;
  uint64_t v91 = a4;
  uint64_t v89 = a3;
  uint64_t v92 = sub_D1B8();
  uint64_t v85 = *(void *)(v92 - 8);
  __chkstk_darwin(v92);
  uint64_t v6 = (char *)&v80 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_D338();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v87 = v7;
  uint64_t v88 = v8;
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v80 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  v86 = (char *)&v80 - v13;
  __chkstk_darwin(v12);
  id v15 = (char *)&v80 - v14;
  uint64_t v16 = sub_D1D8();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v80 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  Swift::String_optional v22 = (char *)&v80 - v21;
  sub_9F0C(0);
  __chkstk_darwin(v23);
  uint64_t v25 = (uint64_t *)((char *)&v80 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_9FF8(a1, (uint64_t)v25, (uint64_t (*)(void))sub_9F0C);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, uint64_t *, uint64_t))(v17 + 32))(v22, v25, v16);
    sub_D308();
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v20, v22, v16);
    uint64_t v26 = sub_D328();
    os_log_type_t v27 = sub_D428();
    int v28 = v27;
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v29 = swift_slowAlloc();
      uint64_t v93 = swift_slowAlloc();
      v94[0] = v93;
      *(_DWORD *)uint64_t v29 = 136315394;
      LODWORD(v92) = v28;
      uint64_t v30 = sub_D5E8();
      uint64_t v95 = sub_BF60(v30, v31, v94);
      sub_D498();
      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 12) = 2082;
      sub_A40C(&qword_14E70, (void (*)(uint64_t))&type metadata accessor for AdvertisableFeatureError);
      uint64_t v32 = sub_D5C8();
      uint64_t v95 = sub_BF60(v32, v33, v94);
      sub_D498();
      swift_bridgeObjectRelease();
      uint64_t v34 = *(void (**)(char *, uint64_t))(v17 + 8);
      v34(v20, v16);
      _os_log_impl(&dword_0, v26, (os_log_type_t)v92, "[%s] Error when determining advertisable features, should not display: %{public}s", (uint8_t *)v29, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      uint64_t v34 = *(void (**)(char *, uint64_t))(v17 + 8);
      v34(v20, v16);
    }

    (*(void (**)(char *, uint64_t))(v88 + 8))(v15, v87);
    v90(0);
    return ((uint64_t (*)(char *, uint64_t))v34)(v22, v16);
  }
  uint64_t v35 = *v25;
  uint64_t v93 = *v25 & 0xC000000000000001;
  if (v93) {
    uint64_t v36 = sub_D518();
  }
  else {
    uint64_t v36 = *(void *)(v35 + 16);
  }
  v38 = v86;
  uint64_t v39 = v92;
  if (v36)
  {
    sub_D308();
    swift_bridgeObjectRetain();
    uint64_t v40 = sub_D328();
    int v41 = sub_D448();
    if (!os_log_type_enabled(v40, (os_log_type_t)v41))
    {

      swift_bridgeObjectRelease_n();
LABEL_39:
      (*(void (**)(char *, uint64_t))(v88 + 8))(v38, v87);
      return v90(1);
    }
    int v82 = v41;
    uint64_t v42 = swift_slowAlloc();
    uint64_t v81 = swift_slowAlloc();
    v99[0] = v81;
    *(_DWORD *)uint64_t v42 = 136315395;
    uint64_t v43 = sub_D5E8();
    v94[0] = sub_BF60(v43, v44, v99);
    sub_D498();
    swift_bridgeObjectRelease();
    v83 = (uint8_t *)v42;
    os_log_t v84 = v40;
    *(_WORD *)(v42 + 12) = 2081;
    if (v93) {
      uint64_t v45 = sub_D518();
    }
    else {
      uint64_t v45 = *(void *)(v35 + 16);
    }
    v51 = &_swiftEmptyArrayStorage;
    if (!v45)
    {
LABEL_38:
      v94[0] = (uint64_t)v51;
      v75 = v83;
      sub_A454(0, &qword_14EC8, (uint64_t (*)(void, void *))&type metadata accessor for Array);
      sub_A398();
      uint64_t v76 = sub_D398();
      unint64_t v78 = v77;
      swift_bridgeObjectRelease();
      v94[0] = sub_BF60(v76, v78, v99);
      sub_D498();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      os_log_t v79 = v84;
      _os_log_impl(&dword_0, v84, (os_log_type_t)v82, "[%s] Should display with advertisable features: %{private}s", v75, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      goto LABEL_39;
    }
    v98 = &_swiftEmptyArrayStorage;
    sub_9788(0, v45 & ~(v45 >> 63), 0);
    if (v93)
    {
      uint64_t v52 = sub_D4D8();
      char v54 = 1;
    }
    else
    {
      uint64_t v52 = sub_9CA4(v35);
      char v54 = v55 & 1;
    }
    uint64_t v95 = v52;
    uint64_t v96 = v53;
    char v97 = v54;
    if ((v45 & 0x8000000000000000) == 0)
    {
      v56 = (void (**)(char *, uint64_t))(v85 + 8);
      uint64_t v57 = v35 & 0xFFFFFFFFFFFFFF8;
      if (v35 < 0) {
        uint64_t v57 = v35;
      }
      uint64_t v91 = v57;
      do
      {
        sub_9A10(v95, v96, v97, v35);
        sub_D1E8();
        uint64_t v67 = sub_D1A8();
        uint64_t v69 = v68;
        (*v56)(v6, v39);
        swift_release();
        v70 = v98;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_9788(0, v70[2] + 1, 1);
          v70 = v98;
        }
        unint64_t v72 = v70[2];
        unint64_t v71 = v70[3];
        if (v72 >= v71 >> 1)
        {
          sub_9788(v71 > 1, v72 + 1, 1);
          v70 = v98;
        }
        v70[2] = v72 + 1;
        v73 = (char *)&v70[2 * v72];
        *((void *)v73 + 4) = v67;
        *((void *)v73 + 5) = v69;
        if (v93)
        {
          if ((v97 & 1) == 0) {
            goto LABEL_41;
          }
          if (sub_D4E8()) {
            swift_isUniquelyReferenced_nonNull_native();
          }
          sub_A2F0(0, &qword_14EC0, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for Set.Index);
          v74 = (void (*)(uint64_t *, void))sub_D418();
          sub_D538();
          v74(v94, 0);
        }
        else
        {
          uint64_t v58 = v95;
          uint64_t v59 = v96;
          char v60 = v97;
          int64_t v61 = sub_992C(v95, v96, v97, v35);
          uint64_t v63 = v62;
          char v65 = v64;
          char v66 = v60;
          uint64_t v39 = v92;
          sub_A38C(v58, v59, v66);
          uint64_t v95 = v61;
          uint64_t v96 = v63;
          char v97 = v65 & 1;
        }
        --v45;
      }
      while (v45);
      sub_A38C(v95, v96, v97);
      v51 = v98;
      v38 = v86;
      goto LABEL_38;
    }
    __break(1u);
LABEL_41:
    uint64_t result = swift_bridgeObjectRelease();
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_D308();
    v46 = sub_D328();
    os_log_type_t v47 = sub_D448();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc();
      v94[0] = swift_slowAlloc();
      *(_DWORD *)v48 = 136315138;
      uint64_t v49 = sub_D5E8();
      uint64_t v95 = sub_BF60(v49, v50, v94);
      sub_D498();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v46, v47, "[%s] No advertisable features to display", v48, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v88 + 8))(v11, v87);
    return v90(0);
  }
  return result;
}

uint64_t sub_5330(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_5374()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  uint64_t v3 = sub_D338();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t result = __chkstk_darwin(v3);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((v1[8] & 1) == 0)
  {
    *((unsigned char *)v1 + 64) = 1;
    sub_D308();
    uint64_t v8 = sub_D328();
    os_log_type_t v9 = sub_D448();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v15 = v2;
      uint64_t v11 = (uint8_t *)v10;
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 136315138;
      v14[1] = v11 + 4;
      uint64_t v12 = sub_D5E8();
      uint64_t v16 = sub_BF60(v12, v13, &v17);
      sub_D498();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v8, v9, "[%s] Performing prerequisite work", v11, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v2 = v15;
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    sub_3FF8();
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v16 = (uint64_t)v1;
    swift_retain();
    sub_D158();
    swift_release();
    swift_release();
    swift_release();
    swift_getObjectType();
    *(void *)(swift_allocObject() + 16) = v2;
    sub_D218();
    swift_unknownObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_5654(uint64_t a1, NSObject *a2)
{
  os_log_t v45 = a2;
  uint64_t v3 = sub_D1D8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  unint64_t v44 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  os_log_type_t v9 = (char *)&v39 - v8;
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v39 - v10;
  uint64_t v12 = sub_D338();
  uint64_t v46 = *(void *)(v12 - 8);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v39 - v16;
  sub_9404();
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v39 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_9FF8(a1, (uint64_t)v20, (uint64_t (*)(void))sub_9404);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v43 = v12;
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v11, v20, v3);
    sub_D308();
    uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
    v21(v9, v11, v3);
    Swift::String_optional v22 = sub_D328();
    os_log_type_t v23 = sub_D428();
    int v24 = v23;
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v25 = swift_slowAlloc();
      int v41 = v24;
      uint64_t v26 = v25;
      uint64_t v42 = swift_slowAlloc();
      uint64_t v48 = v42;
      *(_DWORD *)uint64_t v26 = 136315394;
      uint64_t v40 = v26 + 4;
      uint64_t v27 = sub_D5E8();
      os_log_t v45 = v22;
      uint64_t v47 = sub_BF60(v27, v28, &v48);
      sub_D498();
      swift_bridgeObjectRelease();
      *(_WORD *)(v26 + 12) = 2082;
      uint64_t v40 = v26 + 14;
      v21(v44, v9, v3);
      uint64_t v29 = sub_D3C8();
      uint64_t v47 = sub_BF60(v29, v30, &v48);
      sub_D498();
      swift_bridgeObjectRelease();
      unint64_t v31 = *(void (**)(char *, uint64_t))(v4 + 8);
      v31(v9, v3);
      os_log_t v32 = v45;
      _os_log_impl(&dword_0, v45, (os_log_type_t)v41, "[%s] Prerequisite work failed to complete with error: %{public}s", (uint8_t *)v26, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      unint64_t v31 = *(void (**)(char *, uint64_t))(v4 + 8);
      v31(v9, v3);
    }
    (*(void (**)(char *, uint64_t))(v46 + 8))(v15, v43);
    return ((uint64_t (*)(char *, uint64_t))v31)(v11, v3);
  }
  else
  {
    sub_D308();
    unint64_t v33 = sub_D328();
    os_log_type_t v34 = sub_D448();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      uint64_t v48 = swift_slowAlloc();
      *(_DWORD *)uint64_t v35 = 136315138;
      uint64_t v36 = sub_D5E8();
      uint64_t v47 = sub_BF60(v36, v37, &v48);
      sub_D498();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v33, v34, "[%s] Prerequisite work completed", v35, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v17, v12);
  }
}

uint64_t sub_5BD4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = a1;
  v6[3] = a2;
  v6[4] = v5;
  swift_retain();
  sub_7568((uint64_t)sub_977C, (uint64_t)v6);

  return swift_release();
}

uint64_t sub_5C88(uint64_t a1, void (*a2)(_OWORD *), uint64_t a3, uint64_t a4)
{
  uint64_t v47 = a4;
  uint64_t v50 = a3;
  uint64_t v6 = sub_D1D8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v46 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v42 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v42 - v13;
  uint64_t v15 = sub_D338();
  uint64_t v48 = *(void *)(v15 - 8);
  uint64_t v49 = v15;
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v42 - v19;
  sub_9404();
  __chkstk_darwin(v21);
  os_log_type_t v23 = (char *)&v42 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_9FF8(a1, (uint64_t)v23, (uint64_t (*)(void))sub_9404);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    os_log_t v45 = a2;
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v14, v23, v6);
    sub_D308();
    int v24 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
    v24(v12, v14, v6);
    uint64_t v25 = sub_D328();
    os_log_type_t v26 = sub_D428();
    int v27 = v26;
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v28 = swift_slowAlloc();
      os_log_t v43 = v25;
      unint64_t v44 = v14;
      uint64_t v29 = v28;
      *(void *)&v52[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v29 = 136315394;
      uint64_t v42 = v29 + 4;
      uint64_t v30 = sub_D5E8();
      uint64_t v51 = sub_BF60(v30, v31, (uint64_t *)v52);
      LODWORD(v47) = v27;
      sub_D498();
      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 12) = 2082;
      uint64_t v42 = v29 + 14;
      v24(v46, v12, v6);
      uint64_t v32 = sub_D3C8();
      uint64_t v51 = sub_BF60(v32, v33, (uint64_t *)v52);
      sub_D498();
      swift_bridgeObjectRelease();
      os_log_type_t v34 = *(void (**)(char *, uint64_t))(v7 + 8);
      v34(v12, v6);
      os_log_t v35 = v43;
      _os_log_impl(&dword_0, v43, (os_log_type_t)v47, "[%s] Commit enablement failed with error: %{public}s", (uint8_t *)v29, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v14 = v44;
      swift_slowDealloc();
    }
    else
    {
      os_log_type_t v34 = *(void (**)(char *, uint64_t))(v7 + 8);
      v34(v12, v6);
    }
    (*(void (**)(char *, uint64_t))(v48 + 8))(v18, v49);
    sub_9D2C((uint64_t)v52);
    v45(v52);
    sub_9E6C((uint64_t *)v52);
    return ((uint64_t (*)(char *, uint64_t))v34)(v14, v6);
  }
  else
  {
    sub_D308();
    uint64_t v36 = sub_D328();
    os_log_type_t v37 = sub_D448();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      *(void *)&v52[0] = swift_slowAlloc();
      *(_DWORD *)v38 = 136315138;
      uint64_t v39 = sub_D5E8();
      uint64_t v51 = sub_BF60(v39, v40, (uint64_t *)v52);
      sub_D498();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v36, v37, "[%s] Commit enablement completed", v38, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v48 + 8))(v20, v49);
    char v53 = 0;
    memset(v52, 0, sizeof(v52));
    return ((uint64_t (*)(_OWORD *))a2)(v52);
  }
}

uint64_t sub_6238(uint64_t a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v118 = a3;
  v119 = a2;
  uint64_t v117 = *v3;
  uint64_t v5 = sub_D338();
  uint64_t v115 = *(void *)(v5 - 8);
  uint64_t v116 = v5;
  uint64_t v6 = __chkstk_darwin(v5);
  v114 = (char *)&v105 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  v113 = (char *)&v105 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v105 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = ((char *)&v105 - v14);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v105 - v16;
  uint64_t v18 = sub_D258();
  uint64_t v112 = *(void *)(v18 - 8);
  uint64_t v19 = __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v105 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v19);
  int v24 = (char *)&v105 - v23;
  __chkstk_darwin(v22);
  os_log_type_t v26 = (char *)&v105 - v25;
  type metadata accessor for HealthFeaturesViewController();
  uint64_t v27 = a1;
  if (swift_dynamicCastClass())
  {
    uint64_t v28 = (void *)swift_allocObject();
    uint64_t v30 = v118;
    uint64_t v29 = v119;
    v28[2] = v3;
    v28[3] = v29;
    uint64_t v31 = v117;
    v28[4] = v30;
    v28[5] = v31;
    swift_retain();
    swift_retain();
    sub_7D24((uint64_t (*)(void))sub_9770, (uint64_t)v28);
    return swift_release();
  }
  uint64_t v108 = (uint64_t)v21;
  v109 = v24;
  os_log_t v106 = v15;
  v107 = v17;
  os_log_type_t v34 = v113;
  unint64_t v33 = v114;
  v110 = v26;
  uint64_t v111 = v18;
  swift_getObjectType();
  if (swift_conformsToProtocol2()) {
    uint64_t v35 = v27;
  }
  else {
    uint64_t v35 = 0;
  }
  if (v35)
  {
    uint64_t v36 = v3[9];
    uint64_t v37 = v115;
    if (v36)
    {
      uint64_t v39 = v111;
      uint64_t v38 = v112;
      uint64_t v40 = (uint64_t)v110;
      (*(void (**)(char *, void, uint64_t))(v112 + 104))(v110, enum case for AdvertisableFeaturePostCommitWorkItem.showMedicationsThatAffectHeartRate(_:), v111);
      v114 = (char *)v27;
      swift_unknownObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t result = sub_7444(v40, v36);
      if (v41)
      {
        v75 = v12;
        sub_D308();
        uint64_t v76 = v108;
        v113 = *(char **)(v38 + 16);
        ((void (*)(uint64_t, uint64_t, uint64_t))v113)(v108, v40, v39);
        swift_bridgeObjectRetain();
        unint64_t v77 = sub_D328();
        os_log_type_t v78 = sub_D428();
        int v79 = v78;
        BOOL v80 = os_log_type_enabled(v77, v78);
        uint64_t v81 = v116;
        if (v80)
        {
          uint64_t v82 = swift_slowAlloc();
          LODWORD(v107) = v79;
          uint64_t v83 = v82;
          v120[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v83 = 136315651;
          os_log_t v106 = v77;
          uint64_t v84 = sub_D5E8();
          uint64_t v121 = sub_BF60(v84, v85, v120);
          sub_D498();
          swift_bridgeObjectRelease();
          *(_WORD *)(v83 + 12) = 2081;
          ((void (*)(char *, uint64_t, uint64_t))v113)(v109, v76, v111);
          uint64_t v86 = sub_D3C8();
          uint64_t v87 = v75;
          uint64_t v121 = sub_BF60(v86, v88, v120);
          sub_D498();
          swift_bridgeObjectRelease();
          uint64_t v89 = v76;
          v90 = *(void (**)(uint64_t, uint64_t))(v38 + 8);
          v90(v89, v111);
          *(_WORD *)(v83 + 22) = 2081;
          swift_bridgeObjectRetain();
          uint64_t v91 = sub_D3F8();
          unint64_t v93 = v92;
          swift_bridgeObjectRelease();
          uint64_t v121 = sub_BF60(v91, v93, v120);
          uint64_t v40 = (uint64_t)v110;
          sub_D498();
          swift_bridgeObjectRelease_n();
          uint64_t v39 = v111;
          swift_bridgeObjectRelease();
          os_log_t v94 = v106;
          _os_log_impl(&dword_0, v106, (os_log_type_t)v107, "[%s] completed post-commit work item not found: %{private}s, in list %{private}s", (uint8_t *)v83, 0x20u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          (*(void (**)(char *, uint64_t))(v115 + 8))(v87, v116);
        }
        else
        {
          uint64_t v95 = v76;
          v90 = *(void (**)(uint64_t, uint64_t))(v38 + 8);
          v90(v95, v39);

          swift_bridgeObjectRelease_n();
          (*(void (**)(char *, uint64_t))(v115 + 8))(v75, v81);
        }
        v119(0);
        swift_unknownObjectRelease();
        return ((uint64_t (*)(uint64_t, uint64_t))v90)(v40, v39);
      }
      else
      {
        uint64_t v42 = result + 1;
        uint64_t v43 = v116;
        if (__OFADD__(result, 1))
        {
          __break(1u);
          goto LABEL_34;
        }
        uint64_t v44 = (uint64_t)v109;
        if (v42 < *(void *)(v36 + 16))
        {
          if ((v42 & 0x8000000000000000) == 0)
          {
            (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v109, v36+ ((*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80))+ *(void *)(v38 + 72) * v42, v39);
            swift_bridgeObjectRelease();
            os_log_t v45 = sub_8AF8(v44);
            uint64_t v108 = v46;
            uint64_t v48 = *(char **)(v38 + 8);
            uint64_t v47 = v38 + 8;
            v113 = v48;
            ((void (*)(uint64_t, uint64_t))v48)(v44, v39);
            uint64_t v49 = v107;
            sub_D308();
            id v50 = v45;
            uint64_t v51 = sub_D328();
            os_log_type_t v52 = sub_D448();
            if (os_log_type_enabled(v51, v52))
            {
              uint64_t v53 = swift_slowAlloc();
              uint64_t v112 = v47;
              uint64_t v54 = v53;
              uint64_t v121 = swift_slowAlloc();
              *(_DWORD *)uint64_t v54 = 136315395;
              uint64_t v55 = sub_D5E8();
              v120[0] = sub_BF60(v55, v56, &v121);
              sub_D498();
              swift_bridgeObjectRelease();
              *(_WORD *)(v54 + 12) = 2081;
              v120[0] = (uint64_t)v45;
              v120[1] = v108;
              sub_9668();
              id v57 = v50;
              uint64_t v58 = sub_D3C8();
              v120[0] = sub_BF60(v58, v59, &v121);
              uint64_t v40 = (uint64_t)v110;
              sub_D498();

              swift_bridgeObjectRelease();
              _os_log_impl(&dword_0, v51, v52, "[%s] next post-commit work item view controller: %{private}s", (uint8_t *)v54, 0x16u);
              swift_arrayDestroy();
              uint64_t v39 = v111;
              swift_slowDealloc();
              swift_slowDealloc();

              (*(void (**)(char *, uint64_t))(v37 + 8))(v107, v116);
            }
            else
            {

              (*(void (**)(char *, uint64_t))(v37 + 8))(v49, v43);
            }
            v103 = (void (*)(void *))v119;
            id v104 = v50;
            v103(v45);
            swift_unknownObjectRelease();

            return ((uint64_t (*)(uint64_t, uint64_t))v113)(v40, v39);
          }
LABEL_34:
          __break(1u);
          return result;
        }
        swift_bridgeObjectRelease();
        os_log_t v96 = v106;
        sub_D308();
        char v97 = sub_D328();
        os_log_type_t v98 = sub_D448();
        if (os_log_type_enabled(v97, v98))
        {
          os_log_t v99 = v96;
          v100 = (uint8_t *)swift_slowAlloc();
          v120[0] = swift_slowAlloc();
          *(_DWORD *)v100 = 136315138;
          uint64_t v101 = sub_D5E8();
          uint64_t v121 = sub_BF60(v101, v102, v120);
          sub_D498();
          uint64_t v40 = (uint64_t)v110;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_0, v97, v98, "[%s] completed post-commit work item is the last item.", v100, 0xCu);
          swift_arrayDestroy();
          uint64_t v38 = v112;
          swift_slowDealloc();
          swift_slowDealloc();

          (*(void (**)(os_log_t, uint64_t))(v37 + 8))(v99, v116);
        }
        else
        {

          (*(void (**)(os_log_t, uint64_t))(v37 + 8))(v96, v116);
        }
        v119(0);
        swift_unknownObjectRelease();
        return (*(uint64_t (**)(uint64_t, uint64_t))(v38 + 8))(v40, v39);
      }
    }
    else
    {
      swift_unknownObjectRetain();
      sub_D308();
      v70 = sub_D328();
      os_log_type_t v71 = sub_D428();
      if (os_log_type_enabled(v70, v71))
      {
        unint64_t v72 = (uint8_t *)swift_slowAlloc();
        v120[0] = swift_slowAlloc();
        *(_DWORD *)unint64_t v72 = 136315138;
        uint64_t v73 = sub_D5E8();
        uint64_t v121 = sub_BF60(v73, v74, v120);
        sub_D498();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_0, v70, v71, "[%s] post-commit work items list not found. Must determinePostCommitWork() first", v72, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v37 + 8))(v34, v116);
      v119(0);
      return swift_unknownObjectRelease();
    }
  }
  else
  {
    char v60 = v33;
    sub_D308();
    swift_unknownObjectRetain_n();
    int64_t v61 = sub_D328();
    os_log_type_t v62 = sub_D428();
    BOOL v63 = os_log_type_enabled(v61, v62);
    uint64_t v64 = v115;
    if (v63)
    {
      uint64_t v65 = swift_slowAlloc();
      v120[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v65 = 136315395;
      uint64_t v66 = sub_D5E8();
      uint64_t v121 = sub_BF60(v66, v67, v120);
      sub_D498();
      swift_bridgeObjectRelease();
      *(_WORD *)(v65 + 12) = 2081;
      uint64_t v121 = v27;
      sub_9610();
      swift_unknownObjectRetain();
      uint64_t v68 = sub_D3C8();
      uint64_t v121 = sub_BF60(v68, v69, v120);
      sub_D498();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v61, v62, "[%s] unable to determine next step view controller for: %{private}s", (uint8_t *)v65, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_unknownObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v64 + 8))(v60, v116);
    return ((uint64_t (*)(void))v119)(0);
  }
}

void sub_6FB0(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  uint64_t v38 = a4;
  uint64_t v7 = sub_D338();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v34 - v12;
  *(void *)(a2 + 72) = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 16))
  {
    uint64_t v37 = v8;
    uint64_t v14 = *(void *)(sub_D258() - 8);
    uint64_t v15 = sub_8AF8(a1 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80)));
    uint64_t v17 = v16;
    sub_D308();
    id v18 = v15;
    uint64_t v19 = sub_D328();
    os_log_type_t v20 = sub_D448();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v36 = a3;
      uint64_t v22 = v21;
      uint64_t v40 = swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 136315395;
      uint64_t v35 = v7;
      uint64_t v23 = sub_D5E8();
      v39[0] = sub_BF60(v23, v24, &v40);
      sub_D498();
      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2081;
      v39[0] = (uint64_t)v15;
      v39[1] = v17;
      sub_9668();
      id v25 = v18;
      uint64_t v26 = sub_D3C8();
      v39[0] = sub_BF60(v26, v27, &v40);
      sub_D498();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v19, v20, "[%s] first post-commit work item view controller: %{private}s", (uint8_t *)v22, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      a3 = v36;
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v37 + 8))(v11, v35);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v37 + 8))(v11, v7);
    }
    id v33 = v18;
    a3(v15);
  }
  else
  {
    sub_D308();
    uint64_t v28 = sub_D328();
    os_log_type_t v29 = sub_D448();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v37 = v8;
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      v39[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v30 = 136315138;
      uint64_t v31 = sub_D5E8();
      uint64_t v40 = sub_BF60(v31, v32, v39);
      sub_D498();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v28, v29, "[%s] determined post-commit work is not necessary", v30, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v37 + 8))(v13, v7);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    }
    a3(0);
  }
}

uint64_t sub_7444(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  uint64_t v4 = *(void *)(sub_D258() - 8);
  uint64_t v5 = a2 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v6 = *(void *)(v4 + 72);
  sub_A40C(&qword_14EA0, (void (*)(uint64_t))&type metadata accessor for AdvertisableFeaturePostCommitWorkItem);
  uint64_t v7 = 0;
  while ((sub_D3A8() & 1) == 0)
  {
    ++v7;
    v5 += v6;
    if (v2 == v7) {
      return 0;
    }
  }
  return v7;
}

uint64_t sub_7568(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_D338();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_D308();
  uint64_t v10 = sub_D328();
  os_log_type_t v11 = sub_D448();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v19 = v6;
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v20 = a1;
    uint64_t v23 = v13;
    uint64_t v21 = a2;
    *(_DWORD *)uint64_t v12 = 136315138;
    uint64_t v14 = sub_D5E8();
    uint64_t v22 = sub_BF60(v14, v15, &v23);
    a2 = v21;
    sub_D498();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v10, v11, "[%s] Commit enablement starting", v12, 0xCu);
    swift_arrayDestroy();
    a1 = v20;
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v19);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  sub_3FF8();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v22 = v3;
  swift_retain();
  sub_D158();
  swift_release();
  swift_release();
  swift_release();
  swift_getObjectType();
  sub_D228();
  swift_unknownObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v22 = v3;
  swift_retain();
  sub_D158();
  swift_release();
  swift_release();
  swift_release();
  swift_getObjectType();
  uint64_t v16 = swift_allocObject();
  swift_weakInit();
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = v16;
  v17[3] = a1;
  v17[4] = a2;
  swift_retain();
  swift_retain();
  sub_D208();
  swift_unknownObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t sub_7918(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v23 = a3;
  uint64_t v7 = sub_D348();
  uint64_t v27 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_D378();
  uint64_t v25 = *(void *)(v10 - 8);
  uint64_t v26 = v10;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_9404();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  __chkstk_darwin(v13 - 8);
  sub_9254();
  uint64_t v24 = sub_D458();
  sub_9FF8(a1, (uint64_t)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))sub_9404);
  unint64_t v16 = (*(unsigned __int8 *)(v14 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = (void *)swift_allocObject();
  uint64_t v18 = v23;
  v17[2] = a2;
  v17[3] = v18;
  v17[4] = a4;
  sub_A1A4((uint64_t)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v17 + v16, (uint64_t (*)(void))sub_9404);
  aBlock[4] = sub_95A8;
  aBlock[5] = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_5330;
  aBlock[3] = &unk_10990;
  uint64_t v19 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  sub_D368();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_A40C(&qword_14E78, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_92F0(0, (unint64_t *)&unk_14F70, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_9344();
  sub_D4C8();
  uint64_t v20 = (void *)v24;
  sub_D468();
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v27 + 8))(v9, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v12, v26);
}

uint64_t sub_7CB0(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3, uint64_t a4)
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    *(unsigned char *)(Strong + 65) = 1;
    swift_release();
  }
  return a2(a4);
}

uint64_t sub_7D24(uint64_t (*a1)(void), uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v31 = a2;
  uint64_t v5 = *v2;
  uint64_t v6 = sub_D338();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v27 - v11;
  if (*((unsigned char *)v3 + 65) == 1)
  {
    uint64_t v30 = a1;
    sub_D308();
    uint64_t v13 = sub_D328();
    os_log_type_t v14 = sub_D448();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v29 = v6;
      unint64_t v16 = (uint8_t *)v15;
      uint64_t v32 = swift_slowAlloc();
      *(_DWORD *)unint64_t v16 = 136315138;
      uint64_t v17 = sub_D5E8();
      uint64_t v28 = v5;
      uint64_t v33 = sub_BF60(v17, v18, &v32);
      sub_D498();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v13, v14, "[%s] Determine post-commit work starting", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v29);
      uint64_t v19 = v28;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
      uint64_t v19 = v5;
    }
    sub_3FF8();
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v33 = (uint64_t)v3;
    swift_retain();
    sub_D158();
    swift_release();
    swift_release();
    swift_release();
    swift_getObjectType();
    uint64_t v25 = (void *)swift_allocObject();
    v25[2] = v30;
    v25[3] = v31;
    v25[4] = v19;
    swift_retain();
    sub_D238();
    swift_unknownObjectRelease();
    return swift_release();
  }
  else
  {
    sub_D308();
    uint64_t v20 = sub_D328();
    os_log_type_t v21 = sub_D428();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v29 = v6;
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 136315138;
      uint64_t v23 = sub_D5E8();
      uint64_t v33 = sub_BF60(v23, v24, &v32);
      sub_D498();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v20, v21, "[%s] Commit enablement must be called at least once before post-commit work", v22, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v29);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    }
    return a1(&_swiftEmptyArrayStorage);
  }
}

uint64_t sub_81AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = a3;
  uint64_t v25 = a4;
  uint64_t v23 = a2;
  uint64_t v5 = sub_D348();
  uint64_t v28 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_D378();
  uint64_t v26 = *(void *)(v8 - 8);
  uint64_t v27 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_9218(0);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  __chkstk_darwin(v11 - 8);
  os_log_type_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_9254();
  uint64_t v15 = (void *)sub_D458();
  sub_9FF8(a1, (uint64_t)v14, (uint64_t (*)(void))sub_9218);
  unint64_t v16 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v17 = (v13 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v18 = swift_allocObject();
  sub_A1A4((uint64_t)v14, v18 + v16, (uint64_t (*)(void))sub_9218);
  uint64_t v19 = (void *)(v18 + v17);
  uint64_t v20 = v24;
  *uint64_t v19 = v23;
  v19[1] = v20;
  *(void *)(v18 + ((v17 + 23) & 0xFFFFFFFFFFFFFFF8)) = v25;
  aBlock[4] = sub_92AC;
  aBlock[5] = v18;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_5330;
  aBlock[3] = &unk_108F0;
  os_log_type_t v21 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_D368();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_A40C(&qword_14E78, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_92F0(0, (unint64_t *)&unk_14F70, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_9344();
  sub_D4C8();
  sub_D468();
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v10, v27);
}

uint64_t sub_8554(uint64_t a1, void (*a2)(void *), uint64_t a3, uint64_t a4)
{
  uint64_t v49 = a4;
  uint64_t v52 = a3;
  uint64_t v6 = sub_D1D8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v48 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v43 - v11;
  __chkstk_darwin(v10);
  os_log_type_t v14 = (char *)&v43 - v13;
  uint64_t v15 = sub_D338();
  uint64_t v50 = *(void *)(v15 - 8);
  uint64_t v51 = v15;
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v43 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v43 - v19;
  sub_9218(0);
  __chkstk_darwin(v21);
  uint64_t v23 = (uint64_t *)((char *)&v43 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_9FF8(a1, (uint64_t)v23, (uint64_t (*)(void))sub_9218);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v47 = a2;
    (*(void (**)(char *, uint64_t *, uint64_t))(v7 + 32))(v14, v23, v6);
    sub_D308();
    uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
    v24(v12, v14, v6);
    uint64_t v25 = sub_D328();
    os_log_type_t v26 = sub_D428();
    int v27 = v26;
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v28 = swift_slowAlloc();
      os_log_t v45 = v25;
      uint64_t v46 = v14;
      uint64_t v29 = v28;
      uint64_t v54 = swift_slowAlloc();
      *(_DWORD *)uint64_t v29 = 136315394;
      uint64_t v44 = v29 + 4;
      uint64_t v30 = sub_D5E8();
      uint64_t v53 = sub_BF60(v30, v31, &v54);
      LODWORD(v49) = v27;
      sub_D498();
      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 12) = 2082;
      uint64_t v44 = v29 + 14;
      v24(v48, v12, v6);
      uint64_t v32 = sub_D3C8();
      uint64_t v53 = sub_BF60(v32, v33, &v54);
      sub_D498();
      swift_bridgeObjectRelease();
      uint64_t v34 = *(void (**)(char *, uint64_t))(v7 + 8);
      v34(v12, v6);
      os_log_t v35 = v45;
      _os_log_impl(&dword_0, v45, (os_log_type_t)v49, "[%s] Determine post-commit work failed with error: %{public}s", (uint8_t *)v29, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      os_log_type_t v14 = v46;
      swift_slowDealloc();
    }
    else
    {
      uint64_t v34 = *(void (**)(char *, uint64_t))(v7 + 8);
      v34(v12, v6);
    }
    (*(void (**)(char *, uint64_t))(v50 + 8))(v18, v51);
    v47(&_swiftEmptyArrayStorage);
    return ((uint64_t (*)(char *, uint64_t))v34)(v14, v6);
  }
  else
  {
    uint64_t v36 = (void *)*v23;
    sub_D308();
    uint64_t v37 = sub_D328();
    os_log_type_t v38 = sub_D448();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      *(_DWORD *)uint64_t v39 = 136315138;
      uint64_t v40 = sub_D5E8();
      uint64_t v53 = sub_BF60(v40, v41, &v54);
      sub_D498();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v37, v38, "[%s] Determine post-commit work completed", v39, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v50 + 8))(v20, v51);
    a2(v36);
    return swift_bridgeObjectRelease();
  }
}

void *sub_8AF8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_D338();
  uint64_t v32 = *(void *)(v4 - 8);
  uint64_t v33 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_D2D8();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_D258();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  os_log_type_t v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  int v15 = (*(uint64_t (**)(char *, uint64_t))(v12 + 88))(v14, v11);
  if (v15 == enum case for AdvertisableFeaturePostCommitWorkItem.cancelPendingHealthAppDeepLinkIfPresent(_:))
  {
LABEL_8:
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    return 0;
  }
  if (v15 != enum case for AdvertisableFeaturePostCommitWorkItem.showMedicationsThatAffectHeartRate(_:))
  {
    sub_D308();
    swift_retain_n();
    uint64_t v22 = sub_D328();
    os_log_type_t v23 = sub_D438();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      uint64_t v35 = v31;
      *(_DWORD *)uint64_t v24 = 136315394;
      uint64_t v25 = sub_D5E8();
      uint64_t v34 = sub_BF60(v25, v26, &v35);
      sub_D498();
      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 2080;
      uint64_t v34 = v2;
      type metadata accessor for HealthFeaturesViewModel();
      swift_retain();
      uint64_t v27 = sub_D3C8();
      uint64_t v34 = sub_BF60(v27, v28, &v35);
      sub_D498();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v22, v23, "[%s] Unrecognized value: %s", (uint8_t *)v24, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    (*(void (**)(char *, uint64_t))(v32 + 8))(v6, v33);
    goto LABEL_8;
  }
  uint64_t v16 = *(void **)(v2 + 16);
  id v17 = objc_allocWithZone((Class)type metadata accessor for MedicationsThatAffectHeartRateMiniFlowStepController());
  swift_unknownObjectWeakInit();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for MedicationsAffectHeartRateOnboardingViewController.ActionStyle.continue(_:), v7);
  id v18 = v16;
  id v19 = (id)BPSPillSelectedColor();
  uint64_t v20 = (void *)sub_D2E8();
  sub_A40C(&qword_14E58, (void (*)(uint64_t))type metadata accessor for MedicationsThatAffectHeartRateMiniFlowStepController);
  id v21 = v20;
  sub_D2F8();

  return v20;
}

uint64_t sub_8FD8()
{
  sub_A4A8(v0 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocClassInstance(v0, 96, 7);
}

uint64_t type metadata accessor for HealthFeaturesViewModel()
{
  return self;
}

uint64_t sub_9054@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_D1C8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_9188((void *)(*(void *)a1 + 24), *(void *)(*(void *)a1 + 48));
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for AdvertisableFeature.Location.watchPairing(_:), v4);
  uint64_t v8 = sub_D298();
  uint64_t v10 = v9;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  *a2 = v8;
  a2[1] = v10;
  return result;
}

void *sub_9188(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_91D4()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_920C(uint64_t a1)
{
  return sub_81AC(a1, v1[2], v1[3], v1[4]);
}

void sub_9218(uint64_t a1)
{
}

unint64_t sub_9254()
{
  unint64_t result = qword_14F60;
  if (!qword_14F60)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_14F60);
  }
  return result;
}

uint64_t sub_9294()
{
  return sub_A078((uint64_t (*)(void))sub_9218);
}

uint64_t sub_92AC()
{
  return sub_A238((uint64_t (*)(void))sub_9218, (uint64_t (*)(unint64_t, uint64_t, uint64_t, uint64_t))sub_8554);
}

uint64_t sub_92D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_92E8()
{
  return swift_release();
}

void sub_92F0(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_D408();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unint64_t sub_9344()
{
  unint64_t result = qword_14E80;
  if (!qword_14E80)
  {
    sub_92F0(255, (unint64_t *)&unk_14F70, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14E80);
  }
  return result;
}

uint64_t sub_93B8()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_93F0()
{
  return sub_9724(40);
}

uint64_t sub_93F8(uint64_t a1)
{
  return sub_7918(a1, v1[2], v1[3], v1[4]);
}

void sub_9404()
{
  if (!qword_14E88)
  {
    sub_D1D8();
    sub_A40C(&qword_14E70, (void (*)(uint64_t))&type metadata accessor for AdvertisableFeatureError);
    unint64_t v0 = sub_D5D8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_14E88);
    }
  }
}

uint64_t sub_94A4()
{
  sub_9404();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_release();
  swift_release();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_D1D8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_95A8()
{
  sub_9404();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = v0[2];
  uint64_t v4 = (uint64_t (*)(uint64_t))v0[3];
  uint64_t v5 = v0[4];
  uint64_t v6 = (uint64_t)v0 + ((*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return sub_7CB0(v3, v4, v5, v6);
}

unint64_t sub_9610()
{
  unint64_t result = qword_14F50;
  if (!qword_14F50)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_14F50);
  }
  return result;
}

void sub_9668()
{
  if (!qword_14E90)
  {
    sub_96D0(255, &qword_14E98);
    unint64_t v0 = sub_D488();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_14E90);
    }
  }
}

uint64_t sub_96D0(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_971C()
{
  return sub_9724(48);
}

uint64_t sub_9724(uint64_t a1)
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v1, a1, 7);
}

void sub_9770(uint64_t a1)
{
  sub_6FB0(a1, *(void *)(v1 + 16), *(void (**)(void))(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_977C(uint64_t a1)
{
  return sub_5C88(a1, *(void (**)(_OWORD *))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_9788(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_97A8(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_97A8(char a1, int64_t a2, char a3, char *a4)
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
    sub_A454(0, (unint64_t *)&unk_14EE0, (uint64_t (*)(void, void *))&type metadata accessor for _ContiguousArrayStorage);
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
  os_log_type_t v14 = a4 + 32;
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
  uint64_t result = sub_D5A8();
  __break(1u);
  return result;
}

int64_t sub_992C(int64_t result, int a2, char a3, uint64_t a4)
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

uint64_t sub_9A10(uint64_t result, int a2, char a3, uint64_t a4)
{
  unint64_t v5 = result;
  if ((a4 & 0xC000000000000001) == 0)
  {
    if ((a3 & 1) == 0)
    {
      if (result < 0 || 1 << *(unsigned char *)(a4 + 32) <= result)
      {
        __break(1u);
      }
      else if ((*(void *)(a4 + 8 * ((unint64_t)result >> 6) + 56) >> result))
      {
        if (*(_DWORD *)(a4 + 36) == a2)
        {
LABEL_17:
          uint64_t v6 = *(void *)(*(void *)(a4 + 48) + 8 * v5);
          swift_retain();
          return v6;
        }
        __break(1u);
        goto LABEL_10;
      }
      __break(1u);
      goto LABEL_21;
    }
LABEL_10:
    uint64_t result = sub_D4F8();
    if (result == *(_DWORD *)(a4 + 36))
    {
      sub_D508();
      sub_D1F8();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      sub_A40C(&qword_14EB8, (void (*)(uint64_t))&type metadata accessor for AdvertisableFeatureModel);
      uint64_t v7 = sub_D388();
      uint64_t v8 = -1 << *(unsigned char *)(a4 + 32);
      unint64_t v5 = v7 & ~v8;
      if ((*(void *)(a4 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        uint64_t v9 = ~v8;
        sub_A40C(&qword_14ED8, (void (*)(uint64_t))&type metadata accessor for AdvertisableFeatureModel);
        while ((sub_D3A8() & 1) == 0)
        {
          unint64_t v5 = (v5 + 1) & v9;
          if (((*(void *)(a4 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) == 0) {
            goto LABEL_15;
          }
        }
      }
      else
      {
LABEL_15:
        swift_release();
        __break(1u);
      }
      swift_release();
      goto LABEL_17;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (a3)
  {
    sub_D528();
    sub_D1F8();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    uint64_t v6 = v10;
    swift_unknownObjectRelease();
    return v6;
  }
LABEL_22:
  __break(1u);
  return result;
}

uint64_t sub_9CA4(uint64_t a1)
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
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 72);
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

void sub_9D2C(uint64_t a1@<X8>)
{
  type metadata accessor for HealthFeaturesSetupFlowController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v3 = self;
  unint64_t v4 = (objc_class *)[v3 bundleForClass:ObjCClassFromMetadata];
  v14._countAndFlagsBits = 0xE000000000000000;
  v16._object = (void *)0x800000000000E800;
  v16._countAndFlagsBits = 0xD000000000000028;
  v18.value._countAndFlagsBits = 0;
  v18.value._object = 0;
  v5.super.isa = v4;
  v20._countAndFlagsBits = 0;
  v20._object = (void *)0xE000000000000000;
  uint64_t v6 = sub_D148(v16, v18, v5, v20, v14);
  uint64_t v8 = v7;

  uint64_t v9 = (objc_class *)[v3 bundleForClass:ObjCClassFromMetadata];
  v17._countAndFlagsBits = 0xD00000000000002ALL;
  v15._countAndFlagsBits = 0xE000000000000000;
  v17._object = (void *)0x800000000000E830;
  v19.value._countAndFlagsBits = 0;
  v19.value._object = 0;
  v10.super.isa = v9;
  v21._countAndFlagsBits = 0;
  v21._object = (void *)0xE000000000000000;
  uint64_t v11 = sub_D148(v17, v19, v10, v21, v15);
  uint64_t v13 = v12;

  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v8;
  *(void *)(a1 + 16) = v11;
  *(void *)(a1 + 24) = v13;
  *(unsigned char *)(a1 + 32) = 1;
}

uint64_t *sub_9E6C(uint64_t *a1)
{
  return a1;
}

uint64_t sub_9EA4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_9EE8()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_9EF8(uint64_t a1)
{
  return sub_5654(a1, *(NSObject **)(v1 + 16));
}

uint64_t sub_9F00(uint64_t a1)
{
  return sub_44F0(a1, v1[2], v1[3], v1[4]);
}

void sub_9F0C(uint64_t a1)
{
}

void sub_9F48(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    a5(255, a3, a4);
    sub_D1D8();
    sub_A40C(&qword_14E70, (void (*)(uint64_t))&type metadata accessor for AdvertisableFeatureError);
    unint64_t v6 = sub_D5D8();
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

uint64_t sub_9FF8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_A060()
{
  return sub_A078((uint64_t (*)(void))sub_9F0C);
}

uint64_t sub_A078(uint64_t (*a1)(void))
{
  uint64_t v2 = *(void *)(a1(0) - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_D1D8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v1 + v4, v6);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_release();

  return _swift_deallocObject(v1, ((((v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8, v3 | 7);
}

uint64_t sub_A1A4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_A20C()
{
  return sub_A238((uint64_t (*)(void))sub_9F0C, (uint64_t (*)(unint64_t, uint64_t, uint64_t, uint64_t))sub_4898);
}

uint64_t sub_A238(uint64_t (*a1)(void), uint64_t (*a2)(unint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v3 = *(void *)(a1(0) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = *(void *)(v2 + v5);
  uint64_t v7 = *(void *)(v2 + v5 + 8);
  uint64_t v8 = *(void *)(v2 + ((v5 + 23) & 0xFFFFFFFFFFFFFFF8));

  return a2(v2 + v4, v6, v7, v8);
}

void sub_A2F0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = sub_D1F8();
    uint64_t v7 = sub_A40C(&qword_14EB8, (void (*)(uint64_t))&type metadata accessor for AdvertisableFeatureModel);
    unint64_t v8 = a3(a1, v6, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_A38C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_A398()
{
  unint64_t result = qword_14ED0;
  if (!qword_14ED0)
  {
    sub_A454(255, &qword_14EC8, (uint64_t (*)(void, void *))&type metadata accessor for Array);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14ED0);
  }
  return result;
}

uint64_t sub_A40C(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_A454(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void, void *))
{
  if (!*a2)
  {
    unint64_t v4 = a3(0, &type metadata for String);
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_A4A8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t initializeBufferWithCopyOfBuffer for HealthFeaturesViewModel.ProgressionResult(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

unint64_t destroy for HealthFeaturesViewModel.ProgressionResult(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for HealthFeaturesViewModel.ProgressionResult(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    long long v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    uint64_t v4 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(void *)(a1 + 24) = v4;
    *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t assignWithCopy for HealthFeaturesViewModel.ProgressionResult(uint64_t a1, long long *a2)
{
  unint64_t v4 = *((void *)a2 + 1);
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = *((void *)a2 + 1);
      *(void *)(a1 + 16) = *((void *)a2 + 2);
      *(void *)(a1 + 24) = *((void *)a2 + 3);
      *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    long long v5 = *a2;
    long long v6 = a2[1];
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
    *(_OWORD *)a1 = v5;
    *(_OWORD *)(a1 + 16) = v6;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  *(void *)(a1 + 24) = *((void *)a2 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
  return a1;
}

__n128 initializeWithTake for HealthFeaturesViewModel.ProgressionResult(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for HealthFeaturesViewModel.ProgressionResult(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_5:
    long long v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    goto LABEL_6;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
LABEL_6:
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for HealthFeaturesViewModel.ProgressionResult(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 33)) {
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

uint64_t storeEnumTagSinglePayload for HealthFeaturesViewModel.ProgressionResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(unsigned char *)(result + 32) = 0;
    *(_OWORD *)__n128 result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

uint64_t sub_A82C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

uint64_t sub_A848(uint64_t result, int a2)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
  }
  else if (a2)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for HealthFeaturesViewModel.ProgressionResult()
{
  return &type metadata for HealthFeaturesViewModel.ProgressionResult;
}

char *sub_A898(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = OBJC_IVAR____TtC31HealthFeaturesBridgeSetupPlugin33HealthFeaturesSetupFlowController____lazy_storage___firstStepViewController;
  uint64_t v5 = *(void **)&v3[OBJC_IVAR____TtC31HealthFeaturesBridgeSetupPlugin33HealthFeaturesSetupFlowController____lazy_storage___firstStepViewController];
  if (v5)
  {
    long long v6 = *(char **)&v3[OBJC_IVAR____TtC31HealthFeaturesBridgeSetupPlugin33HealthFeaturesSetupFlowController____lazy_storage___firstStepViewController];
  }
  else
  {
    sub_CCA4(0, &qword_14F40, a3, (void (*)(uint64_t))type metadata accessor for HealthFeaturesSetupFlowController, (void (*)(uint64_t))type metadata accessor for HealthFeaturesViewModel);
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v13 = v3;
    uint64_t v7 = v3;
    sub_D158();

    swift_release();
    swift_release();
    id v8 = objc_allocWithZone((Class)type metadata accessor for HealthFeaturesViewController());
    uint64_t v9 = sub_33B4(v14);
    swift_unknownObjectWeakAssign();
    NSBundle v10 = *(void **)&v13[v4];
    *(void *)&v13[v4] = v9;
    long long v6 = v9;

    uint64_t v5 = 0;
  }
  id v11 = v5;
  return v6;
}

uint64_t sub_A9D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_CCA4(0, &qword_14F40, a3, (void (*)(uint64_t))type metadata accessor for HealthFeaturesSetupFlowController, (void (*)(uint64_t))type metadata accessor for HealthFeaturesViewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = v3;
  sub_D158();

  swift_release();
  swift_release();
  return v6;
}

unsigned char *sub_AAA0()
{
  uint64_t v1 = sub_D348();
  uint64_t v25 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  unint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_D378();
  uint64_t v4 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_D358();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  NSBundle v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = OBJC_IVAR____TtC31HealthFeaturesBridgeSetupPlugin33HealthFeaturesSetupFlowController_featureIdentifiers;
  uint64_t v12 = v0;
  *(void *)&v0[v11] = sub_D198();
  *(void *)&v12[OBJC_IVAR____TtC31HealthFeaturesBridgeSetupPlugin33HealthFeaturesSetupFlowController____lazy_storage___firstStepViewController] = 0;
  uint64_t v13 = OBJC_IVAR____TtC31HealthFeaturesBridgeSetupPlugin33HealthFeaturesSetupFlowController__viewModel;
  sub_CCA4(0, &qword_14F40, v14, (void (*)(uint64_t))type metadata accessor for HealthFeaturesSetupFlowController, (void (*)(uint64_t))type metadata accessor for HealthFeaturesViewModel);
  swift_allocObject();
  *(void *)&v12[v13] = sub_D188();
  v12[OBJC_IVAR____TtC31HealthFeaturesBridgeSetupPlugin33HealthFeaturesSetupFlowController_isLoadingConfiguration] = 0;

  Swift::String v15 = (objc_class *)type metadata accessor for HealthFeaturesSetupFlowController();
  v28.receiver = v12;
  v28.super_class = v15;
  Swift::String v16 = objc_msgSendSuper2(&v28, "init");
  v16[OBJC_IVAR____TtC31HealthFeaturesBridgeSetupPlugin33HealthFeaturesSetupFlowController_isLoadingConfiguration] = 1;
  sub_CD40(0, (unint64_t *)&qword_14F60);
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for DispatchQoS.QoSClass.userInitiated(_:), v7);
  Swift::String v17 = v16;
  Swift::String_optional v18 = (void *)sub_D478();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v17;
  aBlock[4] = sub_CBD0;
  aBlock[5] = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_5330;
  aBlock[3] = &unk_10BB0;
  Swift::String v20 = _Block_copy(aBlock);
  Swift::String v21 = v17;
  sub_D368();
  unint64_t v26 = &_swiftEmptyArrayStorage;
  sub_CC5C(&qword_14E78, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_CBF0(0, (unint64_t *)&unk_14F70, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
  sub_9344();
  sub_D4C8();
  sub_D468();

  _Block_release(v20);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v3, v1);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v24);
  swift_release();
  return v21;
}

uint64_t sub_AF24(void *a1, uint64_t a2, uint64_t a3)
{
  sub_CCA4(0, &qword_14F40, a3, (void (*)(uint64_t))type metadata accessor for HealthFeaturesSetupFlowController, (void (*)(uint64_t))type metadata accessor for HealthFeaturesViewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = a1;
  sub_D158();

  swift_release();
  swift_release();
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_43B0((uint64_t)sub_CC54, v5);
  swift_release();
  return swift_release_n();
}

id sub_B044(char a1)
{
  swift_beginAccess();
  id result = (id)swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    unint64_t v3 = result;
    *((unsigned char *)result
    + OBJC_IVAR____TtC31HealthFeaturesBridgeSetupPlugin33HealthFeaturesSetupFlowController_isLoadingConfiguration) = 0;
    id result = [result delegate];
    if (a1)
    {
      if (result)
      {
        id v4 = &selRef_buddyControllerReleaseHold_;
LABEL_7:
        objc_msgSend(result, *v4, v3);

        return (id)swift_unknownObjectRelease();
      }
      __break(1u);
    }
    else if (result)
    {
      id v4 = &selRef_buddyControllerReleaseHoldAndSkip_;
      goto LABEL_7;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_B1C4(uint64_t a1)
{
  uint64_t ObjectType = swift_getObjectType();
  sub_CCA4(0, &qword_14F40, v4, (void (*)(uint64_t))type metadata accessor for HealthFeaturesSetupFlowController, (void (*)(uint64_t))type metadata accessor for HealthFeaturesViewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  id v5 = v1;
  sub_D158();

  swift_release();
  uint64_t result = swift_release();
  if (a1)
  {
    uint64_t v7 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v8 = (void *)swift_allocObject();
    v8[2] = v7;
    v8[3] = a1;
    v8[4] = ObjectType;
    swift_retain();
    uint64_t v9 = swift_unknownObjectRetain();
    sub_6238(v9, (void (*)(void))sub_C6D4, (uint64_t)v8);
    swift_release();
    swift_release();
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_B338(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_D338();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    NSBundle v10 = (void *)Strong;
    if (a1)
    {
      id v11 = a1;
      sub_B74C(v11);
    }
    else
    {
      sub_D308();
      swift_unknownObjectRetain_n();
      uint64_t v12 = sub_D328();
      os_log_type_t v13 = sub_D448();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = swift_slowAlloc();
        uint64_t v20 = swift_slowAlloc();
        uint64_t v22 = v20;
        *(_DWORD *)uint64_t v14 = 136315394;
        uint64_t v15 = sub_D5E8();
        uint64_t v21 = sub_BF60(v15, v16, &v22);
        sub_D498();
        swift_bridgeObjectRelease();
        *(_WORD *)(v14 + 12) = 2082;
        uint64_t v21 = a3;
        sub_CBF0(0, &qword_14F48, (uint64_t (*)(uint64_t))sub_9610, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
        swift_unknownObjectRetain();
        uint64_t v17 = sub_D3C8();
        uint64_t v21 = sub_BF60(v17, v18, &v22);
        sub_D498();
        swift_unknownObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_0, v12, v13, "[%s] no controllers to present after %{public}s", (uint8_t *)v14, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_unknownObjectRelease_n();
      }
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      id v19 = [v10 delegate];
      if (v19)
      {
        [v19 buddyControllerDone:v10];

        swift_unknownObjectRelease();
      }
      else
      {
        __break(1u);
      }
    }
  }
}

id sub_B74C(void *a1)
{
  uint64_t v2 = v1;
  swift_getObjectType();
  uint64_t v4 = sub_D338();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_D308();
  id v8 = a1;
  uint64_t v9 = sub_D328();
  os_log_type_t v10 = sub_D448();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v20 = v18;
    *(_DWORD *)uint64_t v11 = 136315394;
    uint64_t v12 = sub_D5E8();
    uint64_t v19 = sub_BF60(v12, v13, &v20);
    sub_D498();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2082;
    swift_getObjectType();
    uint64_t v17 = v4;
    uint64_t v19 = (uint64_t)v8;
    swift_getWitnessTable();
    uint64_t v14 = sub_D5B8();
    uint64_t v19 = sub_BF60(v14, v15, &v20);
    sub_D498();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v9, v10, "[%s] pushing next step controller %{public}s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v17);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  [v8 setMiniFlowDelegate:v2];
  return [v2 pushController:v8 animated:1];
}

uint64_t sub_BA0C(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  unint64_t v3 = *(uint64_t (**)(void *))(a1 + 32);
  id v4 = a2;
  LOBYTE(v2) = v3(v2);

  return v2 & 1;
}

id sub_BA58()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HealthFeaturesSetupFlowController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for HealthFeaturesSetupFlowController()
{
  return self;
}

uint64_t sub_BB0C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_D268();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *a1;
  id v9 = [objc_allocWithZone((Class)HKHealthStore) init];
  uint64_t v10 = sub_D2B8();
  swift_allocObject();
  id v11 = v9;
  uint64_t v12 = sub_D2A8();
  uint64_t v21 = v10;
  uint64_t v22 = (void *)sub_CC5C(&qword_14F80, (void (*)(uint64_t))&type metadata accessor for CountryOracle);
  *(void *)&long long v20 = v12;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for PluginAdvertisableFeatureSourceContext.DeviceSource.activeDevice(_:), v4);
  uint64_t v13 = sub_D288();
  swift_allocObject();
  uint64_t v14 = sub_D278();
  uint64_t v15 = *(void *)(v8
                  + OBJC_IVAR____TtC31HealthFeaturesBridgeSetupPlugin33HealthFeaturesSetupFlowController_featureIdentifiers);
  uint64_t v21 = v13;
  uint64_t v22 = &protocol witness table for HealthPluginAdvertisableFeatureManagerFactory;
  *(void *)&long long v20 = v14;
  type metadata accessor for HealthFeaturesViewModel();
  uint64_t v16 = swift_allocObject();
  *(_WORD *)(v16 + 64) = 0;
  *(void *)(v16 + 72) = 0;
  sub_CCA4(0, (unint64_t *)&qword_14C78, 255, (void (*)(uint64_t))type metadata accessor for HealthFeaturesViewModel, (void (*)(uint64_t))sub_4060);
  swift_allocObject();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v17 = sub_D188();
  *(void *)(v16 + 16) = v11;
  *(void *)(v16 + 80) = v15;
  *(void *)(v16 + 88) = v17;
  sub_CD18(&v20, v16 + 24);
  uint64_t result = swift_release();
  *a2 = v16;
  return result;
}

uint64_t sub_BDA4@<X0>(void **a1@<X0>, uint64_t a2@<X2>, void *a3@<X8>)
{
  uint64_t v4 = *a1;
  sub_CCA4(0, &qword_14F40, a2, (void (*)(uint64_t))type metadata accessor for HealthFeaturesSetupFlowController, (void (*)(uint64_t))type metadata accessor for HealthFeaturesViewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  id v5 = v4;
  sub_D158();

  swift_release();
  uint64_t result = swift_release();
  *a3 = v7;
  return result;
}

uint64_t sub_BE78(uint64_t a1, void **a2, uint64_t a3)
{
  unint64_t v3 = *a2;
  sub_CCA4(0, &qword_14F40, a3, (void (*)(uint64_t))type metadata accessor for HealthFeaturesSetupFlowController, (void (*)(uint64_t))type metadata accessor for HealthFeaturesViewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  id v4 = v3;
  return sub_D168();
}

id sub_BF34()
{
  uint64_t v0 = (void *)HKPreferredRegulatoryDomainProvider();

  return v0;
}

uint64_t sub_BF60(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_C034(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_C5F8((uint64_t)v12, *a3);
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
      sub_C5F8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_A4A8((uint64_t)v12);
  return v7;
}

uint64_t sub_C034(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_D4A8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_C1F0(a5, a6);
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
  uint64_t v8 = sub_D568();
  if (!v8)
  {
    sub_D578();
    __break(1u);
LABEL_17:
    uint64_t result = sub_D5A8();
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

uint64_t sub_C1F0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_C288(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_C488(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_C488(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_C288(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_C400(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_D548();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_D578();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_D3D8();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_D5A8();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_D578();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_C400(uint64_t a1, uint64_t a2)
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
  sub_CE08(0, &qword_14F38, (uint64_t)&type metadata for UInt8, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_C488(char a1, int64_t a2, char a3, char *a4)
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
    sub_CE08(0, &qword_14F38, (uint64_t)&type metadata for UInt8, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
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
  uint64_t result = sub_D5A8();
  __break(1u);
  return result;
}

uint64_t sub_C5F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_C65C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_C694()
{
  swift_release();
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_C6D4(void *a1)
{
  sub_B338(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

void sub_C6E0()
{
  uint64_t v0 = sub_D338();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&aBlock[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v4 = self;
  id v5 = [v4 sharedInstance];
  if (!v5)
  {
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    return;
  }
  unint64_t v6 = v5;
  int64_t v7 = (uint64_t (*)())[v4 activeDeviceSelectorBlock];
  if (v7)
  {
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v7;
    uint64_t v9 = swift_allocObject();
    int64_t v7 = sub_CF10;
    *(void *)(v9 + 16) = sub_CF10;
    *(void *)(v9 + 24) = v8;
    uint64_t v22 = sub_CF48;
    uint64_t v23 = v9;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_BA0C;
    uint64_t v21 = &unk_10C28;
    uint64_t v10 = _Block_copy(aBlock);
    swift_release();
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = [v6 getAllDevicesWithArchivedAltAccountDevicesMatching:v10];
  sub_CD30((uint64_t)v7);
  _Block_release(v10);

  if (!v11) {
    goto LABEL_24;
  }
  sub_CD40(0, &qword_14F88);
  unint64_t v12 = sub_D3E8();

  if (v12 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_D598();
    swift_bridgeObjectRelease();
    if (v15) {
      goto LABEL_8;
    }
  }
  else if (*(void *)((char *)&dword_10 + (v12 & 0xFFFFFFFFFFFFFF8)))
  {
LABEL_8:
    if ((v12 & 0xC000000000000001) != 0)
    {
      id v13 = (id)sub_D558();
      goto LABEL_11;
    }
    if (*(void *)((char *)&dword_10 + (v12 & 0xFFFFFFFFFFFFFF8)))
    {
      id v13 = *(id *)(v12 + 32);
LABEL_11:
      uint64_t v14 = v13;
      swift_bridgeObjectRelease();
      if ([v14 valueForProperty:NRDevicePropertyIsAltAccount])
      {
        sub_D4B8();

        swift_unknownObjectRelease();
      }
      else
      {

        memset(v24, 0, sizeof(v24));
      }
      sub_CD7C((uint64_t)v24, (uint64_t)aBlock);
      if (v21) {
        swift_dynamicCast();
      }
      else {
        sub_CE54((uint64_t)aBlock);
      }
      return;
    }
    __break(1u);
    goto LABEL_23;
  }
  swift_bridgeObjectRelease();
  sub_D308();
  uint64_t v16 = sub_D328();
  os_log_type_t v17 = sub_D428();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl(&dword_0, v16, v17, "Unable to get activePairingDevice", v18, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

void sub_CAC4(uint64_t a1)
{
  if (a1)
  {
    sub_CD40(0, &qword_14F58);
    if (swift_dynamicCastMetatype())
    {
      id v2 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
      uint64_t v3 = (void *)swift_dynamicCastObjCProtocolConditional();
      if (v3)
      {
        sub_B74C(v3);

        return;
      }
    }
  }
  id v4 = [v1 delegate];
  if (v4)
  {
    [v4 buddyControllerDone:v1];
    swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_CB98()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_CBD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_AF24(*(void **)(v3 + 16), a2, a3);
}

uint64_t sub_CBD8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_CBE8()
{
  return swift_release();
}

void sub_CBF0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

id sub_CC54(char a1)
{
  return sub_B044(a1);
}

uint64_t sub_CC5C(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_CCA4(uint64_t a1, unint64_t *a2, uint64_t a3, void (*a4)(uint64_t), void (*a5)(uint64_t))
{
  if (!*a2)
  {
    a4(a3);
    a5(255);
    unint64_t v7 = sub_D178();
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_CD18(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_CD30(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_CD40(uint64_t a1, unint64_t *a2)
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

uint64_t sub_CD7C(uint64_t a1, uint64_t a2)
{
  sub_CE08(0, (unint64_t *)&unk_14F90, (uint64_t)&type metadata for Any + 8, (uint64_t (*)(void, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_CE08(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_CE54(uint64_t a1)
{
  sub_CE08(0, (unint64_t *)&unk_14F90, (uint64_t)&type metadata for Any + 8, (uint64_t (*)(void, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_CED8()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_CF10()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_CF38()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_CF48()
{
  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t type metadata accessor for MedicationsThatAffectHeartRateMiniFlowStepController()
{
  uint64_t result = qword_14FA8;
  if (!qword_14FA8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_CFC8()
{
  return swift_initClassMetadata2();
}

id sub_D014()
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return Strong;
}

uint64_t sub_D048()
{
  return swift_unknownObjectWeakAssign();
}

void sub_D05C()
{
}

uint64_t sub_D08C()
{
  return sub_4294(v0 + qword_14FA0);
}

id sub_D09C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MedicationsThatAffectHeartRateMiniFlowStepController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_D0D4(uint64_t a1)
{
  return sub_4294(a1 + qword_14FA0);
}

uint64_t sub_D0E4()
{
  return type metadata accessor for MedicationsThatAffectHeartRateMiniFlowStepController();
}

uint64_t sub_D0EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, Swift::String a9)
{
  v10._countAndFlagsBits = swift_unknownObjectWeakLoadStrong();
  if (v10._countAndFlagsBits)
  {
    [(id)v10._countAndFlagsBits miniFlowStepComplete:v9];
    return swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
    return sub_D148(v10, v11, v12, v13, a9);
  }
}

uint64_t sub_D148(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_D158()
{
  return static AtomicLazy.subscript.getter();
}

uint64_t sub_D168()
{
  return static AtomicLazy.subscript.setter();
}

uint64_t sub_D178()
{
  return type metadata accessor for AtomicLazy();
}

uint64_t sub_D188()
{
  return AtomicLazy.init(_:)();
}

uint64_t sub_D198()
{
  return static AdvertisableFeature.Identifier.watchPairingFlowIdentifiers.getter();
}

uint64_t sub_D1A8()
{
  return AdvertisableFeature.Identifier.rawValue.getter();
}

uint64_t sub_D1B8()
{
  return type metadata accessor for AdvertisableFeature.Identifier();
}

uint64_t sub_D1C8()
{
  return type metadata accessor for AdvertisableFeature.Location();
}

uint64_t sub_D1D8()
{
  return type metadata accessor for AdvertisableFeatureError();
}

uint64_t sub_D1E8()
{
  return AdvertisableFeatureModel.identifier.getter();
}

uint64_t sub_D1F8()
{
  return type metadata accessor for AdvertisableFeatureModel();
}

uint64_t sub_D208()
{
  return dispatch thunk of AdvertisableFeatureManaging.commitEnablement(completion:)();
}

uint64_t sub_D218()
{
  return dispatch thunk of AdvertisableFeatureManaging.performPrerequisiteWork(completion:)();
}

uint64_t sub_D228()
{
  return dispatch thunk of AdvertisableFeatureManaging.freezeAdvertisementState()();
}

uint64_t sub_D238()
{
  return dispatch thunk of AdvertisableFeatureManaging.determinePostCommitWorkItems(completion:)();
}

uint64_t sub_D248()
{
  return dispatch thunk of AdvertisableFeatureManaging.determineCurrentAdvertisedFeatures(completion:)();
}

uint64_t sub_D258()
{
  return type metadata accessor for AdvertisableFeaturePostCommitWorkItem();
}

uint64_t sub_D268()
{
  return type metadata accessor for PluginAdvertisableFeatureSourceContext.DeviceSource();
}

uint64_t sub_D278()
{
  return HealthPluginAdvertisableFeatureManagerFactory.init(healthStore:countryProvider:activeDeviceSource:queue:)();
}

uint64_t sub_D288()
{
  return type metadata accessor for HealthPluginAdvertisableFeatureManagerFactory();
}

uint64_t sub_D298()
{
  return dispatch thunk of HealthPluginAdvertisableFeatureManagerProviding.makeAdvertisableFeatureManager(location:featureIdentifiers:includeFeaturesMadeAvailableByBuddy:)();
}

uint64_t sub_D2A8()
{
  return CountryOracle.init(mobileCountryCodeManagerProvider:)();
}

uint64_t sub_D2B8()
{
  return type metadata accessor for CountryOracle();
}

uint64_t sub_D2C8()
{
  return AdvertisableFeatureOnboardingViewController.init(featureManager:featureIdentifiers:title:detailText:subtitleText:icon:)();
}

uint64_t sub_D2D8()
{
  return type metadata accessor for MedicationsAffectHeartRateOnboardingViewController.ActionStyle();
}

uint64_t sub_D2E8()
{
  return MedicationsAffectHeartRateOnboardingViewController.init(healthStore:actionStyle:primaryButtonTintColorOverride:)();
}

uint64_t sub_D2F8()
{
  return dispatch thunk of MedicationsAffectHeartRateOnboardingViewController.delegate.setter();
}

uint64_t sub_D308()
{
  return static Logger.advertisableFeatures.getter();
}

uint64_t sub_D318()
{
  return static Logger.general.getter();
}

uint64_t sub_D328()
{
  return Logger.logObject.getter();
}

uint64_t sub_D338()
{
  return type metadata accessor for Logger();
}

uint64_t sub_D348()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_D358()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t sub_D368()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_D378()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_D388()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_D398()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_D3A8()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_D3B8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_D3C8()
{
  return String.init<A>(describing:)();
}

Swift::Int sub_D3D8()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_D3E8()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_D3F8()
{
  return Array.description.getter();
}

uint64_t sub_D408()
{
  return type metadata accessor for Array();
}

uint64_t sub_D418()
{
  return Set.Index._asCocoa.modify();
}

uint64_t sub_D428()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_D438()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_D448()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_D458()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_D468()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_D478()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t sub_D488()
{
  return type metadata accessor for Optional();
}

uint64_t sub_D498()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_D4A8()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_D4B8()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_D4C8()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_D4D8()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t sub_D4E8()
{
  return __CocoaSet.Index.handleBitPattern.getter();
}

uint64_t sub_D4F8()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t sub_D508()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t sub_D518()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_D528()
{
  return __CocoaSet.element(at:)();
}

uint64_t sub_D538()
{
  return __CocoaSet.formIndex(after:isUnique:)();
}

uint64_t sub_D548()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_D558()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_D568()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_D578()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_D588()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_D598()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_D5A8()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_D5B8()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_D5C8()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_D5D8()
{
  return type metadata accessor for Result();
}

uint64_t sub_D5E8()
{
  return _typeName(_:qualified:)();
}

uint64_t BPSPillSelectedColor()
{
  return _BPSPillSelectedColor();
}

uint64_t HAFeatureFlagBridgeHealthFeaturesOnboardingEnabled()
{
  return _HAFeatureFlagBridgeHealthFeaturesOnboardingEnabled();
}

uint64_t HKPreferredRegulatoryDomainProvider()
{
  return _HKPreferredRegulatoryDomainProvider();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
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
  return _objc_msgSendSuper2(a1, a2);
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

uint64_t swift_conformsToProtocol2()
{
  return _swift_conformsToProtocol2();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastMetatype()
{
  return _swift_dynamicCastMetatype();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return _swift_dynamicCastObjCProtocolConditional();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return _swift_getExistentialTypeMetadata();
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

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
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