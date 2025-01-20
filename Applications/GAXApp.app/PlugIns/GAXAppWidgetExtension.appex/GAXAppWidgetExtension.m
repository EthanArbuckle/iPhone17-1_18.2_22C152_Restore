uint64_t sub_100003A54()
{
  return sub_100003B3C(&qword_10000C188);
}

uint64_t type metadata accessor for StartGuidedAccessIntent()
{
  uint64_t result = qword_10000C2A0;
  if (!qword_10000C2A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100003AD4()
{
  return sub_100003B3C(&qword_10000C190);
}

uint64_t sub_100003B08()
{
  return sub_100003B3C((unint64_t *)&unk_10000C198);
}

uint64_t sub_100003B3C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for StartGuidedAccessIntent();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100003B80()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100003B9C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100003C08()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_100003C18@<X0>(uint64_t a1@<X8>)
{
  uint64_t v31 = a1;
  sub_100006E40();
  __chkstk_darwin();
  uint64_t v1 = sub_100005EBC(&qword_10000C320);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v27 = v1;
  uint64_t v28 = v2;
  __chkstk_darwin();
  v4 = (char *)v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005EBC(&qword_10000C328);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v29 = v5;
  uint64_t v30 = v6;
  __chkstk_darwin();
  v26 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25[0] = off_10000C170;
  v25[1] = qword_10000C168;
  type metadata accessor for StartGuidedAccessIntent();
  type metadata accessor for GAXAppReferenceClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v9 = self;
  swift_bridgeObjectRetain();
  v10 = (objc_class *)[v9 bundleForClass:ObjCClassFromMetadata];
  v23._countAndFlagsBits = 0x8000000100007540;
  v36._countAndFlagsBits = 0x545F544547444957;
  v36._object = (void *)0xEC000000454C5449;
  v38.value._countAndFlagsBits = 0;
  v38.value._object = 0;
  v11.super.isa = v10;
  v40._countAndFlagsBits = 0;
  v40._object = (void *)0xE000000000000000;
  sub_100006D50(v36, v38, v11, v40, v23);

  sub_100006E30();
  sub_100005EBC(&qword_10000C330);
  sub_100003B3C(&qword_10000C188);
  v24._object = (void *)sub_1000069B8(&qword_10000C338, &qword_10000C330);
  sub_100006E50();
  v12 = (objc_class *)[v9 bundleForClass:ObjCClassFromMetadata];
  v24._countAndFlagsBits = 0x8000000100007580;
  v37._object = (void *)0x8000000100007560;
  v37._countAndFlagsBits = 0xD000000000000012;
  v39.value._countAndFlagsBits = 0;
  v39.value._object = 0;
  v13.super.isa = v12;
  v41._countAndFlagsBits = 0;
  v41._object = (void *)0xE000000000000000;
  uint64_t v14 = sub_100006D50(v37, v39, v13, v41, v24);
  v16 = v15;

  uint64_t v32 = v14;
  v33 = v16;
  uint64_t v17 = sub_1000069B8(&qword_10000C340, &qword_10000C320);
  unint64_t v18 = sub_1000069FC();
  v20 = v26;
  uint64_t v19 = v27;
  sub_100006E00();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v4, v19);
  uint64_t v32 = v19;
  v33 = &type metadata for String;
  uint64_t v34 = v17;
  unint64_t v35 = v18;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v29;
  sub_100006E10();
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v20, v21);
}

uint64_t sub_100004068()
{
  type metadata accessor for GAXAppReferenceClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v1 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v4._countAndFlagsBits = 0x8000000100007540;
  v5._countAndFlagsBits = 0x545F544547444957;
  v5._object = (void *)0xEC000000454C5449;
  v6.value._countAndFlagsBits = 0;
  v6.value._object = 0;
  v2.super.isa = v1;
  v7._countAndFlagsBits = 0;
  v7._object = (void *)0xE000000000000000;
  sub_100006D50(v5, v6, v2, v7, v4);

  sub_1000069FC();
  return sub_100006E20();
}

uint64_t sub_10000416C()
{
  uint64_t v0 = sub_100006D70();
  sub_1000068C0(v0, qword_10000C3F8);
  sub_1000067C0(v0, (uint64_t)qword_10000C3F8);
  return sub_100006D60();
}

uint64_t sub_1000041D0(uint64_t a1)
{
  v2[31] = a1;
  v2[32] = v1;
  sub_100005EBC(&qword_10000C240);
  v2[33] = swift_task_alloc();
  uint64_t v3 = sub_100006DA0();
  v2[34] = v3;
  v2[35] = *(void *)(v3 - 8);
  v2[36] = swift_task_alloc();
  return _swift_task_switch(sub_1000042C0, 0, 0);
}

uint64_t sub_1000042C0()
{
  if (_AXSGuidedAccessEnabledNoCaching())
  {
    uint64_t v1 = (void *)swift_task_alloc();
    v0[37] = v1;
    *uint64_t v1 = v0;
    v1[1] = sub_100004628;
    return _swift_task_switch(sub_1000056E4, 0, 0);
  }
  else
  {
    uint64_t v2 = v0[34];
    uint64_t v3 = v0[35];
    uint64_t v4 = v0[33];
    sub_1000067F8(v0[32], v4);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v4, 1, v2) == 1)
    {
      sub_100006860(v0[33]);
      if (qword_10000C180 != -1) {
        swift_once();
      }
      uint64_t v5 = sub_100006DC0();
      sub_1000067C0(v5, (uint64_t)qword_10000C410);
      Swift::String_optional v6 = sub_100006DB0();
      os_log_type_t v7 = sub_100006EA0();
      if (os_log_type_enabled(v6, v7))
      {
        v8 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "Unable to create Guided Access settings URL.", v8, 2u);
        swift_slowDealloc();
      }

      sub_100006D40();
      swift_task_dealloc();
      swift_task_dealloc();
      v9 = (uint64_t (*)(void))v0[1];
      return v9();
    }
    else
    {
      (*(void (**)(void, void, void))(v0[35] + 32))(v0[36], v0[33], v0[34]);
      id v10 = [objc_allocWithZone((Class)_LSOpenConfiguration) init];
      v0[46] = v10;
      [v10 setSensitive:1];
      id v11 = [self defaultWorkspace];
      v0[47] = v11;
      if (v11)
      {
        NSBundle v13 = v11;
        sub_100006D80(v12);
        uint64_t v15 = v14;
        v0[48] = v14;
        v0[10] = v0;
        v0[15] = v0 + 30;
        v0[11] = sub_100004D4C;
        uint64_t v16 = swift_continuation_init();
        v0[18] = _NSConcreteStackBlock;
        v0[19] = 0x40000000;
        v0[20] = sub_1000055D0;
        v0[21] = &unk_1000085A0;
        v0[22] = v16;
        [v13 openURL:v15 configuration:v10 completionHandler:v0 + 18];
        id v11 = v0 + 10;
      }
      else
      {
        __break(1u);
      }
      return _swift_continuation_await(v11);
    }
  }
}

uint64_t sub_100004628(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 304) = a1;
  *(void *)(v3 + 312) = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_100004728, 0, 0);
}

uint64_t sub_100004728()
{
  unint64_t v1 = v0[39];
  uint64_t v2 = v0[38] & 0xFFFFFFFFFFFFLL;
  if ((v1 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(v1) & 0xF;
  }
  if (v2)
  {
    id v3 = [self defaultWorkspace];
    v0[40] = v3;
    if (v3)
    {
      uint64_t v4 = v3;
      NSString v5 = sub_100006E70();
      v0[41] = v5;
      swift_bridgeObjectRelease();
      id v6 = [objc_allocWithZone((Class)_LSOpenConfiguration) init];
      v0[42] = v6;
      v0[2] = v0;
      v0[7] = v0 + 50;
      v0[3] = sub_1000049C8;
      uint64_t v7 = swift_continuation_init();
      v0[23] = _NSConcreteStackBlock;
      v0[24] = 0x40000000;
      v0[25] = sub_100005960;
      v0[26] = &unk_100008588;
      v0[27] = v7;
      [v4 openApplicationWithBundleIdentifier:v5 usingConfiguration:v6 completionHandler:v0 + 23];
      id v3 = v0 + 2;
    }
    else
    {
      __break(1u);
    }
    return _swift_continuation_await(v3);
  }
  else
  {
    swift_bridgeObjectRelease();
    if (qword_10000C180 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_100006DC0();
    sub_1000067C0(v8, (uint64_t)qword_10000C410);
    v9 = sub_100006DB0();
    os_log_type_t v10 = sub_100006EA0();
    if (os_log_type_enabled(v9, v10))
    {
      id v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Unable to start Guided Access from Control Center because there was no effective app.", v11, 2u);
      swift_slowDealloc();
    }

    sub_100006D40();
    swift_task_dealloc();
    swift_task_dealloc();
    v12 = (uint64_t (*)(void))v0[1];
    return v12();
  }
}

uint64_t sub_1000049C8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 344) = v1;
  if (v1) {
    uint64_t v2 = sub_100005180;
  }
  else {
    uint64_t v2 = sub_100004AD8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100004AD8()
{
  uint64_t v1 = *(void **)(v0 + 328);
  uint64_t v2 = *(void **)(v0 + 336);

  id v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 352) = v3;
  *id v3 = v0;
  v3[1] = sub_100004B84;
  return static Task<>.sleep(nanoseconds:)(1000000000);
}

uint64_t sub_100004B84()
{
  *(void *)(*(void *)v1 + 360) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1000053B4;
  }
  else {
    uint64_t v2 = sub_100004C98;
  }
  return _swift_task_switch(v2, 0, 0);
}

id sub_100004C98()
{
  id result = [self server];
  if (result)
  {
    uint64_t v2 = result;
    [result toggleGuidedAccess];

    sub_100006D40();
    swift_task_dealloc();
    swift_task_dealloc();
    id v3 = *(uint64_t (**)(void))(v0 + 8);
    return (id)v3();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100004D4C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 112);
  *(void *)(*(void *)v0 + 392) = v1;
  if (v1) {
    uint64_t v2 = sub_100004F28;
  }
  else {
    uint64_t v2 = sub_100004E5C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100004E5C()
{
  uint64_t v2 = (void *)v0[47];
  uint64_t v1 = (void *)v0[48];
  id v3 = (void *)v0[46];
  uint64_t v5 = v0[35];
  uint64_t v4 = v0[36];
  uint64_t v6 = v0[34];

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  swift_bridgeObjectRelease();
  sub_100006D40();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_100004F28()
{
  uint64_t v1 = (void *)v0[48];
  id v3 = (void *)v0[46];
  uint64_t v2 = (void *)v0[47];
  swift_willThrow();

  if (qword_10000C180 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_100006DC0();
  sub_1000067C0(v4, (uint64_t)qword_10000C410);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v5 = sub_100006DB0();
  os_log_type_t v6 = sub_100006EA0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    swift_errorRetain();
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    v0[28] = v9;
    sub_100006EC0();
    void *v8 = v9;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Unable to open Guided Access settings from Control Center: %@", v7, 0xCu);
    sub_100005EBC(&qword_10000C300);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v11 = v0[35];
  uint64_t v10 = v0[36];
  uint64_t v12 = v0[34];
  swift_errorRelease();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  sub_100006D40();
  swift_task_dealloc();
  swift_task_dealloc();
  NSBundle v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_100005180()
{
  uint64_t v1 = (void *)v0[42];
  id v3 = (void *)v0[40];
  uint64_t v2 = (void *)v0[41];
  swift_willThrow();

  if (qword_10000C180 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_100006DC0();
  sub_1000067C0(v4, (uint64_t)qword_10000C410);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v5 = sub_100006DB0();
  os_log_type_t v6 = sub_100006EA0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    swift_errorRetain();
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    v0[29] = v9;
    sub_100006EC0();
    void *v8 = v9;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Unable to open application from Control Center: %@", v7, 0xCu);
    sub_100005EBC(&qword_10000C300);
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
  sub_100006D40();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_1000053B4()
{
  if (qword_10000C180 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100006DC0();
  sub_1000067C0(v1, (uint64_t)qword_10000C410);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_100006DB0();
  os_log_type_t v3 = sub_100006EA0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 138412290;
    swift_errorRetain();
    uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 232) = v6;
    sub_100006EC0();
    *uint64_t v5 = v6;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Unable to open application from Control Center: %@", v4, 0xCu);
    sub_100005EBC(&qword_10000C300);
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
  sub_100006D40();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_1000055D0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100005EBC(&qword_10000C310);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    if (a2) {
      uint64_t v8 = sub_100006E60();
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v10 = v8;
    sub_100006924((uint64_t)&v10, *(void *)(*(void *)(v3 + 64) + 40), &qword_10000C308);
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_1000056C8()
{
  return _swift_task_switch(sub_1000056E4, 0, 0);
}

uint64_t sub_1000056E4()
{
  id v1 = [self server];
  v0[17] = v1;
  if (v1)
  {
    uint64_t v2 = v1;
    v0[2] = v0;
    v0[7] = v0 + 15;
    v0[3] = sub_10000580C;
    uint64_t v3 = swift_continuation_init();
    v0[10] = _NSConcreteStackBlock;
    v0[11] = 0x40000000;
    v0[12] = sub_100005A14;
    v0[13] = &unk_1000085B8;
    v0[14] = v3;
    [v2 guidedAccessEffectiveAppBundleIdentifier:v0 + 10];
    id v1 = v0 + 2;
  }
  else
  {
    __break(1u);
  }
  return _swift_continuation_await(v1);
}

uint64_t sub_10000580C()
{
  return _swift_task_switch(sub_1000058EC, 0, 0);
}

uint64_t sub_1000058EC()
{
  unint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 120);

  if (v1) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  if (v1) {
    unint64_t v4 = v1;
  }
  else {
    unint64_t v4 = 0xE000000000000000;
  }
  uint64_t v5 = *(uint64_t (**)(uint64_t, unint64_t))(v0 + 8);
  return v5(v3, v4);
}

uint64_t sub_100005960(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100005EBC(&qword_10000C310);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    **(unsigned char **)(*(void *)(v3 + 64) + 40) = a2;
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_100005A14(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v3 = sub_100006E80();
  }
  else {
    uint64_t v3 = 0;
  }
  v5[0] = v3;
  v5[1] = a2;
  sub_100006924((uint64_t)v5, *(void *)(*(void *)(v2 + 64) + 40), &qword_10000C318);
  return swift_continuation_resume();
}

uint64_t sub_100005A84@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C178 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006D70();
  uint64_t v3 = sub_1000067C0(v2, (uint64_t)qword_10000C3F8);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100005B40(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100005BD8;
  return sub_1000041D0(a1);
}

uint64_t sub_100005BD8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100005CCC()
{
  return URL.init(string:)(0xD000000000000032, 0x8000000100007470);
}

uint64_t sub_100005CE8(uint64_t a1)
{
  uint64_t v2 = sub_100003B3C(&qword_10000C188);

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t type metadata accessor for GAXAppReferenceClass()
{
  return self;
}

uint64_t *sub_100005D64(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *(void *)(sub_100005EBC(&qword_10000C240) - 8);
  int v5 = *(_DWORD *)(v4 + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = sub_100006DA0();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t sub_100005EBC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005F00(uint64_t a1)
{
  uint64_t v2 = sub_100006DA0();
  uint64_t v5 = *(void *)(v2 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v2);
  if (!result)
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    return v4(a1, v2);
  }
  return result;
}

void *sub_100005FD0(void *a1, const void *a2)
{
  uint64_t v4 = sub_100006DA0();
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    uint64_t v6 = sub_100005EBC(&qword_10000C240);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(a1, a2, v4);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *sub_1000060E0(void *a1, void *a2)
{
  uint64_t v4 = sub_100006DA0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 24))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    uint64_t v9 = sub_100005EBC(&qword_10000C240);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 16))(a1, a2, v4);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

void *sub_10000625C(void *a1, const void *a2)
{
  uint64_t v4 = sub_100006DA0();
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    uint64_t v6 = sub_100005EBC(&qword_10000C240);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(a1, a2, v4);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *sub_10000636C(void *a1, void *a2)
{
  uint64_t v4 = sub_100006DA0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 40))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    uint64_t v9 = sub_100005EBC(&qword_10000C240);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 32))(a1, a2, v4);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

uint64_t sub_1000064E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000064FC);
}

uint64_t sub_1000064FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005EBC(&qword_10000C240);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_10000656C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100006580);
}

uint64_t sub_100006580(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005EBC(&qword_10000C240);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

void sub_1000065F4()
{
  sub_100006680();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100006680()
{
  if (!qword_10000C2B0)
  {
    sub_100006DA0();
    unint64_t v0 = sub_100006EB0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10000C2B0);
    }
  }
}

uint64_t sub_1000066D8()
{
  return sub_1000069B8(&qword_10000C2E0, &qword_10000C2E8);
}

uint64_t sub_100006714(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

id sub_10000675C()
{
  uint64_t v0 = sub_100006DC0();
  sub_1000068C0(v0, qword_10000C410);
  sub_1000067C0(v0, (uint64_t)qword_10000C410);
  id result = (id)GAXLogCommon();
  if (result) {
    return (id)sub_100006DD0();
  }
  __break(1u);
  return result;
}

uint64_t sub_1000067C0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1000067F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005EBC(&qword_10000C240);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006860(uint64_t a1)
{
  uint64_t v2 = sub_100005EBC(&qword_10000C240);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *sub_1000068C0(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100006924(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005EBC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

ValueMetadata *type metadata accessor for GAXAppWidget()
{
  return &type metadata for GAXAppWidget;
}

uint64_t sub_100006998()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000069B8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100006714(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000069FC()
{
  unint64_t result = qword_10000C348;
  if (!qword_10000C348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C348);
  }
  return result;
}

uint64_t sub_100006A50()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100006B20()
{
  unint64_t v0 = sub_100006C1C();

  return static WidgetBundleBuilder.buildBlock<A>(_:)(v0, &type metadata for GAXAppWidget, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100006B9C()
{
  unint64_t result = qword_10000C350;
  if (!qword_10000C350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C350);
  }
  return result;
}

ValueMetadata *type metadata accessor for GAXAppWidgetBundle()
{
  return &type metadata for GAXAppWidgetBundle;
}

uint64_t sub_100006C00()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100006C1C()
{
  unint64_t result = qword_10000C358;
  if (!qword_10000C358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C358);
  }
  return result;
}

uint64_t sub_100006C70()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_100006CE0()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_100006CF0()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100006D00()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_100006D10()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100006D20()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100006D40()
{
  return static IntentResult.result<>()();
}

uint64_t sub_100006D50(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_100006D60()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100006D70()
{
  return type metadata accessor for LocalizedStringResource();
}

void sub_100006D80(NSURL *retstr@<X8>)
{
}

uint64_t sub_100006DA0()
{
  return type metadata accessor for URL();
}

uint64_t sub_100006DB0()
{
  return Logger.logObject.getter();
}

uint64_t sub_100006DC0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100006DD0()
{
  return Logger.init(_:)();
}

uint64_t sub_100006DE0()
{
  return static WidgetBundle.main()();
}

uint64_t sub_100006E00()
{
  return WidgetConfiguration.description<A>(_:)();
}

uint64_t sub_100006E10()
{
  return WidgetConfiguration.showsInSystemSpaces()();
}

uint64_t sub_100006E20()
{
  return Label<>.init<A>(_:systemImage:)();
}

uint64_t sub_100006E30()
{
  return static ControlSize._1x1.getter();
}

uint64_t sub_100006E40()
{
  return type metadata accessor for ControlSize();
}

uint64_t sub_100006E50()
{
  return ControlButton.init<A>(kind:intent:displayName:preferredSize:title:affordances:)();
}

uint64_t sub_100006E60()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_100006E70()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100006E80()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100006EA0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100006EB0()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100006EC0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t GAXLogCommon()
{
  return _GAXLogCommon();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t _AXSGuidedAccessEnabledNoCaching()
{
  return __AXSGuidedAccessEnabledNoCaching();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_resume()
{
  return _swift_continuation_resume();
}

uint64_t swift_continuation_throwingResume()
{
  return _swift_continuation_throwingResume();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_once()
{
  return _swift_once();
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

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}