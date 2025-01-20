uint64_t sub_486C()
{
  uint64_t result;

  sub_6830(0, &qword_C488);
  result = sub_6FD0();
  qword_C4A8 = result;
  return result;
}

uint64_t sub_48E4()
{
  return swift_allocObject();
}

uint64_t sub_48F4(uint64_t a1)
{
  sub_4BB4(a1, v3);
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  uint64_t v1 = sub_6BF0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  return v1;
}

uint64_t sub_4954(uint64_t a1)
{
  sub_6DA0();
  type metadata accessor for SettingsFlowDelegatePlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = [self bundleForClass:ObjCClassFromMetadata];
  sub_6D90();

  if (_MergedGlobals != -1) {
    swift_once();
  }
  sub_6FB0();
  OUTLINED_FUNCTION_8();
  sub_4BB4(a1, v10);
  sub_69D4((uint64_t)v10, (uint64_t)v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_C4A0);
  type metadata accessor for NoOpFlow();
  if (swift_dynamicCast())
  {
    swift_release();
    sub_6FB0();
    OUTLINED_FUNCTION_8();
    sub_6C50();
  }
  else
  {
    sub_6FB0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_C470);
    uint64_t v4 = OUTLINED_FUNCTION_4();
    *(_OWORD *)(v4 + 16) = xmmword_7210;
    sub_69D4((uint64_t)v10, (uint64_t)v9);
    uint64_t v5 = sub_6F90();
    uint64_t v7 = v6;
    *(void *)(v4 + 56) = &type metadata for String;
    *(void *)(v4 + 64) = sub_6608();
    *(void *)(v4 + 32) = v5;
    *(void *)(v4 + 40) = v7;
    sub_6F40();
    swift_bridgeObjectRelease();
    __swift_project_boxed_opaque_existential_1(v10, v10[3]);
    sub_6BF0();
    sub_6C60();
    swift_release();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
}

uint64_t sub_4BB4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_6F30();
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  __chkstk_darwin();
  OUTLINED_FUNCTION_3();
  uint64_t v8 = v7 - v6;
  uint64_t v54 = sub_6D40();
  OUTLINED_FUNCTION_0();
  uint64_t v52 = v9;
  __chkstk_darwin();
  OUTLINED_FUNCTION_3();
  uint64_t v53 = v11 - v10;
  uint64_t v12 = sub_6E80();
  OUTLINED_FUNCTION_0();
  uint64_t v51 = v13;
  __chkstk_darwin();
  OUTLINED_FUNCTION_3();
  uint64_t v16 = v15 - v14;
  uint64_t v17 = sub_6ED0();
  OUTLINED_FUNCTION_0();
  uint64_t v19 = v18;
  __chkstk_darwin();
  OUTLINED_FUNCTION_3();
  uint64_t v22 = v21 - v20;
  sub_6F00();
  sub_6EF0();
  sub_6EE0();
  swift_release();
  v24 = *(uint64_t (**)(uint64_t, uint64_t))(v19 + 88);
  uint64_t v23 = v19 + 88;
  int v25 = v24(v22, v17);
  if (v25 == enum case for SupportedFlowDomain.invalidParse(_:))
  {
    if (_MergedGlobals == -1)
    {
LABEL_3:
      sub_6FC0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_C470);
      uint64_t v26 = OUTLINED_FUNCTION_4();
      *(_OWORD *)(v26 + 16) = xmmword_7210;
      v27 = *(void (**)(void))(v52 + 16);
      uint64_t v28 = v53;
      OUTLINED_FUNCTION_1();
      v27();
      OUTLINED_FUNCTION_15();
      OUTLINED_FUNCTION_5();
      *(void *)(v26 + 56) = &type metadata for String;
      unint64_t v29 = sub_6608();
      OUTLINED_FUNCTION_13(v29);
LABEL_4:
      OUTLINED_FUNCTION_14();
      swift_bridgeObjectRelease();
      ((void (*)(uint64_t, uint64_t, uint64_t))v27)(v28, a1, v23);
LABEL_5:
      uint64_t v30 = sub_6F90();
      uint64_t v32 = v31;
      uint64_t v33 = type metadata accessor for NoOpFlow();
      uint64_t v34 = swift_allocObject();
      *(void *)(v34 + 16) = v30;
      *(void *)(v34 + 24) = v32;
      a2[3] = v33;
      uint64_t result = sub_68CC(&qword_C6C0, (void (*)(void))type metadata accessor for NoOpFlow);
      a2[4] = result;
      *a2 = v34;
      return result;
    }
LABEL_43:
    swift_once();
    goto LABEL_3;
  }
  if (v25 != enum case for SupportedFlowDomain.playbackControls(_:))
  {
    if (v25 == enum case for SupportedFlowDomain.settings(_:))
    {
      sub_57CC(a1);
      if (_MergedGlobals != -1) {
        swift_once();
      }
      sub_6FB0();
      OUTLINED_FUNCTION_9();
      sub_6EC0();
      sub_6EB0();
      sub_6EA0();
      swift_release();
      if (v58) {
        goto LABEL_15;
      }
    }
    else
    {
      if (v25 == enum case for SupportedFlowDomain.invalidDomainIdentifier(_:))
      {
        if (_MergedGlobals == -1) {
          goto LABEL_3;
        }
        goto LABEL_43;
      }
      if (v25 == enum case for SupportedFlowDomain.unsupportedSiriX(_:))
      {
        if (_MergedGlobals != -1) {
          swift_once();
        }
        sub_6FC0();
        __swift_instantiateConcreteTypeFromMangledName(&qword_C470);
        uint64_t v39 = OUTLINED_FUNCTION_4();
        *(_OWORD *)(v39 + 16) = xmmword_7210;
        OUTLINED_FUNCTION_17();
        v41(*(void *)(v40 - 256), a1, v54);
        uint64_t v5 = (void *)sub_6F90();
        uint64_t v43 = v42;
        *(void *)(v39 + 56) = &type metadata for String;
        *(void *)(v39 + 64) = sub_6608();
        *(void *)(v39 + 32) = v5;
        *(void *)(v39 + 40) = v43;
        OUTLINED_FUNCTION_14();
        swift_bridgeObjectRelease();
        type metadata accessor for NoOpFlow();
        uint64_t v38 = swift_allocObject();
        *(void *)(v38 + 16) = 0xD000000000000024;
        *(void *)(v38 + 24) = 0x8000000000007840;
        goto LABEL_26;
      }
      if (v25 != enum case for SupportedFlowDomain.clarityUIEnabled(_:))
      {
        if (v25 == enum case for SupportedFlowDomain.deviceExpertTellMeGenerated(_:))
        {
          sub_6E70();
          BOOL v48 = sub_6E60();
          (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v16, v12);
          if (!v48)
          {
            OUTLINED_FUNCTION_17();
            v50(*(void *)(v49 - 256), a1, v54);
            goto LABEL_5;
          }
          sub_6D30();
          sub_6F60();
          OUTLINED_FUNCTION_16();
          uint64_t v5 = (void *)sub_6F50();
          uint64_t v58 = sub_6E40();
          v59 = &protocol witness table for CoreAnalyticsLogger;
          __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v57);
          sub_6E30();
          sub_6DE0();
          OUTLINED_FUNCTION_16();
          sub_6DD0();
          uint64_t v58 = sub_6E00();
          v59 = &protocol witness table for BiomeEventSender;
          __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v57);
          sub_6DF0();
          sub_6CC0();
          v56[3] = sub_6E20();
          v56[4] = (uint64_t)&protocol witness table for TipKitEventSender;
          __swift_allocate_boxed_opaque_existential_1(v56);
          sub_6E10();
          sub_6D10();
          OUTLINED_FUNCTION_16();
          sub_6D00();
          sub_6D50();
          sub_6DC0();
          OUTLINED_FUNCTION_16();
          uint64_t v38 = sub_6DB0();
          OUTLINED_FUNCTION_7();
          uint64_t result = sub_698C(&qword_C498, 255, (void (*)(uint64_t))&type metadata accessor for DeviceExpertTellMeGeneratedFlow);
          goto LABEL_28;
        }
        if (v25 != enum case for SupportedFlowDomain.deviceExpertSetting(_:))
        {
          uint64_t result = sub_7000();
          __break(1u);
          return result;
        }
        if (_MergedGlobals != -1) {
          swift_once();
        }
        sub_6FB0();
        OUTLINED_FUNCTION_9();
        type metadata accessor for IntelligenceFlow();
        uint64_t v38 = swift_allocObject();
        OUTLINED_FUNCTION_7();
        v44 = (unint64_t *)&unk_C6B8;
        v45 = type metadata accessor for IntelligenceFlow;
LABEL_27:
        uint64_t result = sub_68CC(v44, (void (*)(void))v45);
LABEL_28:
        v5[4] = result;
        *uint64_t v5 = v38;
        return result;
      }
      if (_MergedGlobals != -1) {
        swift_once();
      }
      sub_6FB0();
      OUTLINED_FUNCTION_9();
      sub_6EC0();
      sub_6EB0();
      sub_6E90();
      swift_release();
      if (v58)
      {
LABEL_15:
        sub_6910(&v57, (uint64_t)&v60);
        return sub_6910(&v60, (uint64_t)a2);
      }
    }
    sub_686C((uint64_t)&v57);
    sub_6FC0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_C470);
    uint64_t v46 = OUTLINED_FUNCTION_4();
    *(_OWORD *)(v46 + 16) = xmmword_7210;
    v27 = *(void (**)(void))(v52 + 16);
    uint64_t v28 = v53;
    OUTLINED_FUNCTION_1();
    v27();
    OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_5();
    *(void *)(v46 + 56) = &type metadata for String;
    unint64_t v47 = sub_6608();
    OUTLINED_FUNCTION_13(v47);
    goto LABEL_4;
  }
  sub_6F20();
  uint64_t v36 = sub_6F10();
  v37 = (void (*)(uint64_t, uint64_t))v5[1];
  ++v5;
  v37(v8, v3);
  if (!v36)
  {
    if (_MergedGlobals != -1) {
      swift_once();
    }
    sub_6FB0();
    OUTLINED_FUNCTION_9();
    type metadata accessor for NoOpFlow();
    uint64_t v38 = swift_allocObject();
    *(void *)(v38 + 16) = 0xD000000000000044;
    *(void *)(v38 + 24) = 0x80000000000079A0;
LABEL_26:
    OUTLINED_FUNCTION_7();
    v44 = &qword_C6C0;
    v45 = type metadata accessor for NoOpFlow;
    goto LABEL_27;
  }
  if (_MergedGlobals != -1) {
    swift_once();
  }
  sub_6FB0();
  OUTLINED_FUNCTION_9();
  uint64_t result = sub_6BE0();
  a2[3] = result;
  a2[4] = (uint64_t)&protocol witness table for AnyFlow;
  *a2 = v36;
  return result;
}

uint64_t sub_57CC(uint64_t a1)
{
  uint64_t v4 = sub_6D40();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  __chkstk_darwin();
  OUTLINED_FUNCTION_3();
  uint64_t v9 = v8 - v7;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v8 - v7, a1, v4);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v6 + 88))(v9, v4) != enum case for Parse.uso(_:))
  {
    if (_MergedGlobals != -1) {
      swift_once();
    }
    goto LABEL_16;
  }
  if (_MergedGlobals != -1) {
    swift_once();
  }
  sub_6FB0();
  OUTLINED_FUNCTION_8();
  sub_6D80();
  if (!sub_6D70() || (sub_6D60(), swift_release(), uint64_t v10 = sub_6E50(), v12 = v11, swift_release(), !v12))
  {
LABEL_16:
    sub_6FB0();
    OUTLINED_FUNCTION_8();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v9, v4);
  }
  BOOL v13 = v10 == 48 && v12 == 0xE100000000000000;
  if (v13 || (sub_7010() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    sub_6FB0();
    OUTLINED_FUNCTION_8();
    id v14 = [objc_allocWithZone((Class)SAIntentGroupIntentSignal) init];
    sub_6830(0, &qword_C480);
    id v15 = sub_5C30(0, 0, 0);
    sub_66C4(0xD00000000000003ALL, 0x8000000000007720, v15, (SEL *)&selRef__setExtensionBundleId_);
    id v16 = [objc_allocWithZone((Class)SAIntentGroupProtobufMessage) init];
    sub_6654([v15 backingStore]);
    Class isa = 0;
    if (v18 >> 60 != 15)
    {
      OUTLINED_FUNCTION_5();
      Class isa = sub_6BC0().super.isa;
      sub_67C4(v1, v2);
    }
    [v16 setData:isa];

    id v19 = [v15 typeName];
    sub_6F80();
    OUTLINED_FUNCTION_5();

    sub_66C4(v1, v2, v16, (SEL *)&selRef_setTypeName_);
    [v14 setIntent:v16];
    sub_6CD0();
    __swift_project_boxed_opaque_existential_1(v22, v22[3]);
    sub_6D20();

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  }
  else
  {
    sub_6FB0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_C470);
    uint64_t v21 = OUTLINED_FUNCTION_4();
    *(_OWORD *)(v21 + 16) = xmmword_7210;
    *(void *)(v21 + 56) = &type metadata for String;
    *(void *)(v21 + 64) = sub_6608();
    *(void *)(v21 + 32) = v10;
    *(void *)(v21 + 40) = v12;
    sub_6F40();
    swift_bridgeObjectRelease();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v9, v4);
}

id sub_5C30(void *a1, uint64_t a2, void *a3)
{
  id v5 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithSettingMetadata:a1 binaryValue:a2 temporalEventTrigger:a3];

  return v5;
}

uint64_t sub_5C94()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for SettingsFlowDelegatePlugin()
{
  return self;
}

uint64_t sub_5CC8(uint64_t a1)
{
  return sub_4954(a1);
}

uint64_t sub_5CEC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_48E4();
  *a1 = result;
  return result;
}

uint64_t sub_5D20(uint64_t a1)
{
  return sub_48F4(a1);
}

uint64_t sub_5D48()
{
  return 0;
}

void sub_5D50()
{
  sub_6FE0(54);
  v3._object = (void *)0x80000000000074E0;
  v3._countAndFlagsBits = 0xD000000000000034;
  sub_6FA0(v3);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void **)(v0 + 24);
  swift_bridgeObjectRetain();
  v4._countAndFlagsBits = v2;
  v4._object = v1;
  sub_6FA0(v4);
  swift_bridgeObjectRelease();
  sub_6FF0();
  __break(1u);
}

uint64_t sub_5E04()
{
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for NoOpFlow()
{
  return self;
}

uint64_t sub_5E60()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_11(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_6A38;
  uint64_t v3 = OUTLINED_FUNCTION_10();
  return Flow.onAsync(input:)(v3);
}

void sub_5EF4()
{
}

uint64_t sub_5F0C()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6();
  uint64_t v3 = swift_task_alloc();
  Swift::String v4 = (void *)OUTLINED_FUNCTION_11(v3);
  *Swift::String v4 = v5;
  v4[1] = sub_6A40;
  return Flow.execute()(v2, v1, v0);
}

uint64_t sub_5FB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for NoOpFlow();

  return Flow<>.exitValue.getter(v3, a2);
}

uint64_t sub_5FEC()
{
  return 1;
}

uint64_t sub_5FF4()
{
  OUTLINED_FUNCTION_18();
  v0[2] = v1;
  uint64_t v2 = sub_6C70();
  v0[3] = v2;
  v0[4] = *(void *)(v2 - 8);
  v0[5] = swift_task_alloc();
  return _swift_task_switch(sub_60B0, 0, 0);
}

uint64_t sub_60B0()
{
  OUTLINED_FUNCTION_12();
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v3 = v0[3];
  uint64_t v4 = sub_6CE0();
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v4);
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for FlowUnhandledReason.needsIntelligenceFlowFallback(_:), v3);
  sub_6CF0();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_6184()
{
  return sub_6C00();
}

uint64_t type metadata accessor for IntelligenceFlow()
{
  return self;
}

uint64_t sub_6234()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_11(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_62C8;
  uint64_t v3 = OUTLINED_FUNCTION_10();
  return Flow.onAsync(input:)(v3);
}

uint64_t sub_62C8()
{
  OUTLINED_FUNCTION_18();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_2();
  uint64_t v5 = *v0;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(v2);
}

uint64_t sub_639C()
{
  return sub_6184();
}

uint64_t sub_63C0()
{
  OUTLINED_FUNCTION_18();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_11(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_6450;
  return sub_5FF4();
}

uint64_t sub_6450()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2();
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_651C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for IntelligenceFlow();

  return Flow<>.exitValue.getter(v3, a2);
}

uint64_t sub_6554(uint64_t a1, uint64_t a2)
{
  return sub_698C(&qword_C468, a2, (void (*)(uint64_t))type metadata accessor for SettingsFlowDelegatePlugin);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_6608()
{
  unint64_t result = qword_C478;
  if (!qword_C478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C478);
  }
  return result;
}

uint64_t sub_6654(void *a1)
{
  id v2 = [a1 data];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_6BD0();

  return v3;
}

void sub_66C4(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  NSString v6 = sub_6F70();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, *a4, v6);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_67C4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_67D8(a1, a2);
  }
  return a1;
}

uint64_t sub_67D8(uint64_t a1, unint64_t a2)
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

uint64_t sub_6830(uint64_t a1, unint64_t *a2)
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

uint64_t sub_686C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_C490);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_68CC(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_6910(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_698C(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_69D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t OUTLINED_FUNCTION_4()
{
  return swift_allocObject();
}

void OUTLINED_FUNCTION_7()
{
  *(void *)(*(void *)(v1 - 336) + 24) = v0;
}

uint64_t OUTLINED_FUNCTION_8()
{
  return sub_6F40();
}

uint64_t OUTLINED_FUNCTION_9()
{
  return sub_6F40();
}

uint64_t OUTLINED_FUNCTION_10()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_13(uint64_t result)
{
  v1[8] = result;
  v1[4] = v2;
  v1[5] = v3;
  return result;
}

uint64_t OUTLINED_FUNCTION_14()
{
  return sub_6F40();
}

uint64_t OUTLINED_FUNCTION_15()
{
  return sub_6F90();
}

uint64_t OUTLINED_FUNCTION_16()
{
  return swift_allocObject();
}

NSData sub_6BC0()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_6BD0()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_6BE0()
{
  return type metadata accessor for AnyFlow();
}

uint64_t sub_6BF0()
{
  return Flow.eraseToAnyFlow()();
}

uint64_t sub_6C00()
{
  return Flow.deferToExecuteAsync(_:)();
}

uint64_t sub_6C10()
{
  return Flow.flexibleExecutionSupport.getter();
}

uint64_t sub_6C50()
{
  return static FlowSearchResult.noFlow.getter();
}

uint64_t sub_6C60()
{
  return static FlowSearchResult.flow(_:)();
}

uint64_t sub_6C70()
{
  return type metadata accessor for FlowUnhandledReason();
}

uint64_t sub_6C80()
{
  return FlowPlugin.findFlowFor(parse:)();
}

uint64_t sub_6C90()
{
  return FlowPlugin.makeFlowFrame(parse:)();
}

void sub_6CA0(Swift::String refId)
{
}

void sub_6CB0()
{
}

uint64_t sub_6CC0()
{
  return static SiriKitEventSender.current.getter();
}

uint64_t sub_6CD0()
{
  return static AceService.current.getter();
}

uint64_t sub_6CE0()
{
  return type metadata accessor for PrescribedTool();
}

uint64_t sub_6CF0()
{
  return static ExecuteResponse.unhandled(reason:)();
}

uint64_t sub_6D00()
{
  return ResponseFactory.init()();
}

uint64_t sub_6D10()
{
  return type metadata accessor for ResponseFactory();
}

uint64_t sub_6D20()
{
  return dispatch thunk of AceServiceInvoker.submitAndForget(_:)();
}

uint64_t sub_6D30()
{
  return static OutputPublisherFactory.makeOutputPublisherAsync()();
}

uint64_t sub_6D40()
{
  return type metadata accessor for Parse();
}

uint64_t sub_6D50()
{
  return static Device.current.getter();
}

uint64_t sub_6D60()
{
  return SiriEnvironment.currentRequest.getter();
}

uint64_t sub_6D70()
{
  return static SiriEnvironment.forCurrentTask.getter();
}

uint64_t sub_6D80()
{
  return type metadata accessor for SiriEnvironment();
}

uint64_t sub_6D90()
{
  return static CATExecutor.registerBundle(bundle:templateDir:)();
}

uint64_t sub_6DA0()
{
  return type metadata accessor for CATExecutor();
}

uint64_t sub_6DB0()
{
  return DeviceExpertTellMeGeneratedFlow.init(outputPublisher:assistantSupportClient:analyticsManager:biomeEventSender:siriKitEventSender:tipKitEventSender:responseGenerator:deviceState:)();
}

uint64_t sub_6DC0()
{
  return type metadata accessor for DeviceExpertTellMeGeneratedFlow();
}

uint64_t sub_6DD0()
{
  return AnalyticsManager.init(backend:)();
}

uint64_t sub_6DE0()
{
  return type metadata accessor for AnalyticsManager();
}

uint64_t sub_6DF0()
{
  return static BiomeEventSender.shared.getter();
}

uint64_t sub_6E00()
{
  return type metadata accessor for BiomeEventSender();
}

uint64_t sub_6E10()
{
  return static TipKitEventSender.shared.getter();
}

uint64_t sub_6E20()
{
  return type metadata accessor for TipKitEventSender();
}

uint64_t sub_6E30()
{
  return CoreAnalyticsLogger.init()();
}

uint64_t sub_6E40()
{
  return type metadata accessor for CoreAnalyticsLogger();
}

uint64_t sub_6E50()
{
  return CurrentRequest.resultCandidateId.getter();
}

BOOL sub_6E60()
{
  return SettingsFeatureFlagsImpl.isSettingsTellMeGeneratedEnabled()();
}

uint64_t sub_6E70()
{
  return static SettingsFeatureFlagsImpl.shared.getter();
}

uint64_t sub_6E80()
{
  return type metadata accessor for SettingsFeatureFlagsImpl();
}

uint64_t sub_6E90()
{
  return dispatch thunk of FlowProvider.getFlowForClarityUI()();
}

uint64_t sub_6EA0()
{
  return dispatch thunk of FlowProvider.getFlowForParse(parse:)();
}

uint64_t sub_6EB0()
{
  return static FlowProvider.shared.getter();
}

uint64_t sub_6EC0()
{
  return type metadata accessor for FlowProvider();
}

uint64_t sub_6ED0()
{
  return type metadata accessor for SupportedFlowDomain();
}

uint64_t sub_6EE0()
{
  return dispatch thunk of SupportedFlowDomainProvider.getSupportedFlowDomain(parse:)();
}

uint64_t sub_6EF0()
{
  return static SupportedFlowDomainProvider.shared.getter();
}

uint64_t sub_6F00()
{
  return type metadata accessor for SupportedFlowDomainProvider();
}

uint64_t sub_6F10()
{
  return ControlsFlowProvider.makeFlow(for:)();
}

uint64_t sub_6F20()
{
  return ControlsFlowProvider.init()();
}

uint64_t sub_6F30()
{
  return type metadata accessor for ControlsFlowProvider();
}

uint64_t sub_6F40()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t sub_6F50()
{
  return AssistantSupportClient.init()();
}

uint64_t sub_6F60()
{
  return type metadata accessor for AssistantSupportClient();
}

NSString sub_6F70()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_6F80()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_6F90()
{
  return String.init<A>(describing:)();
}

void sub_6FA0(Swift::String a1)
{
}

uint64_t sub_6FB0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_6FC0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_6FD0()
{
  return OS_os_log.init(subsystem:category:)();
}

void sub_6FE0(Swift::Int a1)
{
}

uint64_t sub_6FF0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_7000()
{
  return _diagnoseUnexpectedEnumCase<A>(type:)();
}

uint64_t sub_7010()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
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

void objc_release(id a1)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
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

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}