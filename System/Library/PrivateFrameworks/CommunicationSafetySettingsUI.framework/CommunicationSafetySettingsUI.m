id sub_24A5D64C8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_24A5D6500()
{
  type metadata accessor for FindClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_26B178328 = (uint64_t)result;
  return result;
}

id static NSBundle.communicationSafetySettingsUI.getter()
{
  if (qword_26B178960 != -1) {
    swift_once();
  }
  swift_beginAccess();
  v0 = (void *)qword_26B178328;
  return v0;
}

void static NSBundle.communicationSafetySettingsUI.setter(uint64_t a1)
{
  if (qword_26B178960 != -1) {
    swift_once();
  }
  swift_beginAccess();
  v2 = (void *)qword_26B178328;
  qword_26B178328 = a1;
}

uint64_t (*static NSBundle.communicationSafetySettingsUI.modify())()
{
  if (qword_26B178960 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t type metadata accessor for FindClass()
{
  return self;
}

void type metadata accessor for MOUserSafetyScannableServices(uint64_t a1)
{
}

void type metadata accessor for Name(uint64_t a1)
{
}

void sub_24A5D6734(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_24A5D677C(uint64_t a1, uint64_t a2)
{
  return sub_24A5D6900(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_24A5D67A4(uint64_t a1, id *a2)
{
  uint64_t result = sub_24A5E9620();
  *a2 = 0;
  return result;
}

uint64_t sub_24A5D681C(uint64_t a1, id *a2)
{
  char v3 = sub_24A5E9630();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_24A5D689C@<X0>(uint64_t *a1@<X8>)
{
  sub_24A5E9640();
  uint64_t v2 = sub_24A5E9610();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24A5D68E0(uint64_t a1, uint64_t a2)
{
  return sub_24A5D6900(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_24A5D6900(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_24A5E9640();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_24A5D6944()
{
  sub_24A5E9640();
  sub_24A5E9670();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A5D6998()
{
  sub_24A5E9640();
  sub_24A5E99C0();
  sub_24A5E9670();
  uint64_t v0 = sub_24A5E99E0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24A5D6A10()
{
  uint64_t v0 = sub_24A5E9640();
  uint64_t v2 = v1;
  if (v0 == sub_24A5E9640() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_24A5E99A0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_24A5D6A9C(uint64_t a1)
{
  uint64_t v2 = sub_24A5D6D18((unint64_t *)&unk_2697A6F90, type metadata accessor for MOUserSafetyScannableServices);
  uint64_t v3 = sub_24A5D6D18((unint64_t *)&unk_2697A6D10, type metadata accessor for MOUserSafetyScannableServices);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_24A5D6B58@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_24A5E9610();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24A5D6BA0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24A5E9640();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24A5D6BCC(uint64_t a1)
{
  uint64_t v2 = sub_24A5D6D18(&qword_26B178918, type metadata accessor for Name);
  uint64_t v3 = sub_24A5D6D18((unint64_t *)&unk_2697A6D20, type metadata accessor for Name);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_24A5D6C88()
{
  return sub_24A5D6D18(&qword_2697A6CE8, type metadata accessor for Name);
}

uint64_t sub_24A5D6CD0()
{
  return sub_24A5D6D18(&qword_2697A6CF0, type metadata accessor for Name);
}

uint64_t sub_24A5D6D18(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24A5D6D60()
{
  return sub_24A5D6D18(&qword_2697A6CF8, type metadata accessor for MOUserSafetyScannableServices);
}

uint64_t sub_24A5D6DA8()
{
  return sub_24A5D6D18(&qword_2697A6D00, type metadata accessor for MOUserSafetyScannableServices);
}

uint64_t sub_24A5D6DF0()
{
  return sub_24A5D6D18(&qword_2697A6D08, type metadata accessor for MOUserSafetyScannableServices);
}

uint64_t sub_24A5D6E38()
{
  return sub_24A5D6D18((unint64_t *)&unk_26B178920, type metadata accessor for Name);
}

uint64_t static Logger.CSSUI.getter()
{
  return sub_24A5E91F0();
}

id sub_24A5D70F0(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  uint64_t v3 = (void *)sub_24A5E9610();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_24A5D7268()
{
  return 1;
}

uint64_t sub_24A5D7270()
{
  return sub_24A5E99E0();
}

uint64_t sub_24A5D72B4()
{
  return sub_24A5E99D0();
}

uint64_t sub_24A5D72DC()
{
  return sub_24A5E99E0();
}

const char *sub_24A5D731C()
{
  return "CommunicationSafetySettingsUI";
}

const char *sub_24A5D7330()
{
  return "Enabled";
}

NudityDetectionPreferencesHelper __swiftcall NudityDetectionPreferencesHelper.init()()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (NudityDetectionPreferencesHelper)objc_msgSend(v0, sel_init);
}

id NudityDetectionPreferencesHelper.init()()
{
  v1.super_class = (Class)NudityDetectionPreferencesHelper;
  return objc_msgSendSuper2(&v1, sel_init);
}

unint64_t type metadata accessor for NudityDetectionPreferencesHelper()
{
  unint64_t result = qword_2697A6D90;
  if (!qword_2697A6D90)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2697A6D90);
  }
  return result;
}

unint64_t sub_24A5D747C()
{
  unint64_t result = qword_26B178950;
  if (!qword_26B178950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B178950);
  }
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

BOOL sub_24A5D7520()
{
  if (qword_26B1784D8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v0 = *(void **)(qword_26B1784D0
                + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectiveStore);
  swift_retain();
  id v1 = objc_msgSend(v0, sel_userSafety);
  id v2 = objc_msgSend(v1, sel_scanningPolicy);

  if (v2)
  {
    id v3 = objc_msgSend(v2, sel_policy);
    swift_release();

    return v3 != (id)2;
  }
  else
  {
    swift_release();
    return 1;
  }
}

uint64_t sub_24A5D7628()
{
  if (qword_26B1784D8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v0 = *(void **)(qword_26B1784D0
                + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectiveStore);
  swift_retain();
  id v1 = objc_msgSend(v0, sel_userSafety);
  id v2 = objc_msgSend(v1, sel_scanningPolicy);

  if (v2)
  {
    id v3 = objc_msgSend(v2, sel_policy);
    swift_release();

    if (v3)
    {
      if (qword_26B178960 == -1) {
        goto LABEL_9;
      }
      goto LABEL_10;
    }
  }
  else
  {
    swift_release();
  }
  if (qword_26B178960 != -1) {
LABEL_10:
  }
    swift_once();
LABEL_9:
  swift_beginAccess();
  id v4 = (id)qword_26B178328;
  char v5 = (void *)sub_24A5E9610();
  id v6 = objc_msgSend(v4, sel_localizedStringForKey_value_table_, v5, 0, 0);

  uint64_t v7 = sub_24A5E9640();
  return v7;
}

uint64_t sub_24A5D783C()
{
  uint64_t v0 = sub_24A5E91B0();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_24A5E9600();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v2 = sub_24A5E95E0();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_24A5E9190();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(self, sel_nudityDetectionRowEnabled))
  {
    id v7 = objc_msgSend(self, sel_learnMoreAboutSensitiveContentWarningURL);
    sub_24A5E9180();

    sub_24A5E9170();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    sub_24A5E95D0();
    sub_24A5E95C0();
    sub_24A5E95B0();
    swift_bridgeObjectRelease();
    sub_24A5E95C0();
    sub_24A5E95F0();
    if (qword_26B178960 != -1) {
      swift_once();
    }
    swift_beginAccess();
    id v8 = (id)qword_26B178328;
    sub_24A5E91A0();
    return sub_24A5E9650();
  }
  else
  {
    if (qword_26B178960 != -1) {
      swift_once();
    }
    swift_beginAccess();
    id v10 = (id)qword_26B178328;
    v11 = (void *)sub_24A5E9610();
    id v12 = objc_msgSend(v10, sel_localizedStringForKey_value_table_, v11, 0, 0);

    uint64_t v9 = sub_24A5E9640();
  }
  return v9;
}

uint64_t sub_24A5D7BE4(uint64_t a1, uint64_t a2)
{
  if (qword_26B1784D8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v4 = *(void **)(qword_26B1784D0
                + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectiveStore);
  swift_retain();
  id v5 = objc_msgSend(v4, sel_userSafety);
  id v6 = objc_msgSend(v5, sel_scanningPolicy);

  if (v6)
  {
    id v7 = objc_msgSend(v6, sel_policy);
    swift_release();

    if (v7)
    {
      swift_retain();
      char v8 = sub_24A5E4FC4(a1, a2);
      swift_release();
      if (v8)
      {
        if (qword_26B178960 == -1) {
          goto LABEL_10;
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
    swift_release();
  }
  if (qword_26B178960 != -1) {
LABEL_11:
  }
    swift_once();
LABEL_10:
  swift_beginAccess();
  id v9 = (id)qword_26B178328;
  id v10 = (void *)sub_24A5E9610();
  id v11 = objc_msgSend(v9, sel_localizedStringForKey_value_table_, v10, 0, 0);

  uint64_t v12 = sub_24A5E9640();
  return v12;
}

uint64_t _s5FlagsOwet(unsigned int *a1, int a2)
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

unsigned char *_s5FlagsOwst(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24A5D7F2CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24A5D7F54()
{
  return 0;
}

ValueMetadata *_s5FlagsOMa()
{
  return &_s5FlagsON;
}

unint64_t sub_24A5D7F74()
{
  unint64_t result = qword_2697A6D98;
  if (!qword_2697A6D98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697A6D98);
  }
  return result;
}

void sub_24A5D7FCC()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  uint64_t v1 = (void *)sub_24A5E9610();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2) {
    qword_26B178D28 = (uint64_t)v2;
  }
  else {
    __break(1u);
  }
}

unint64_t sub_24A5D8044()
{
  uint64_t v0 = sub_24A5E9640();
  uint64_t v2 = v1;
  if (v0 == sub_24A5E9640() && v2 == v3)
  {
    swift_bridgeObjectRelease_n();
LABEL_15:
    if (qword_26B178960 == -1) {
      goto LABEL_34;
    }
    goto LABEL_37;
  }
  char v5 = sub_24A5E99A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v5) {
    goto LABEL_15;
  }
  uint64_t v6 = sub_24A5E9640();
  uint64_t v8 = v7;
  if (v6 == sub_24A5E9640() && v8 == v9)
  {
    swift_bridgeObjectRelease_n();
LABEL_18:
    if (qword_26B178960 == -1) {
      goto LABEL_34;
    }
    goto LABEL_37;
  }
  char v11 = sub_24A5E99A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v11) {
    goto LABEL_18;
  }
  uint64_t v12 = sub_24A5E9640();
  uint64_t v14 = v13;
  if (v12 == sub_24A5E9640() && v14 == v15)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_21;
  }
  char v16 = sub_24A5E99A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v16)
  {
LABEL_21:
    if (qword_26B178960 == -1) {
      goto LABEL_34;
    }
    goto LABEL_37;
  }
  uint64_t v17 = sub_24A5E9640();
  uint64_t v19 = v18;
  if (v17 == sub_24A5E9640() && v19 == v20)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_27;
  }
  char v21 = sub_24A5E99A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v21)
  {
LABEL_27:
    if (qword_26B178960 == -1) {
      goto LABEL_34;
    }
    goto LABEL_37;
  }
  uint64_t v22 = sub_24A5E9640();
  uint64_t v24 = v23;
  if (v22 == sub_24A5E9640() && v24 == v25)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v26 = sub_24A5E99A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v26 & 1) == 0) {
      return 0xD000000000000010;
    }
  }
  if (qword_26B178960 != -1) {
LABEL_37:
  }
    swift_once();
LABEL_34:
  swift_beginAccess();
  id v27 = (id)qword_26B178328;
  v28 = (void *)sub_24A5E9610();
  id v29 = objc_msgSend(v27, sel_localizedStringForKey_value_table_, v28, 0, 0);

  uint64_t v30 = sub_24A5E9640();
  return v30;
}

uint64_t sub_24A5D8548@<X0>(uint64_t a1@<X8>)
{
  uint64_t v65 = a1;
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6DA0);
  MEMORY[0x270FA5388](v60);
  uint64_t v64 = (uint64_t)&v56 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6DA8);
  MEMORY[0x270FA5388](v57);
  uint64_t v3 = (char *)&v56 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6DB0);
  MEMORY[0x270FA5388](v59);
  char v5 = (char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697A7000);
  MEMORY[0x270FA5388](v62);
  uint64_t v7 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697A6FF0);
  MEMORY[0x270FA5388](v61);
  uint64_t v9 = (char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6DB8);
  uint64_t v63 = *(void *)(v10 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  v58 = (char *)&v56 - v14;
  uint64_t v15 = sub_24A5E9640();
  uint64_t v17 = v16;
  if (v15 != sub_24A5E9640() || v17 != v18)
  {
    char v19 = sub_24A5E99A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v19) {
      goto LABEL_5;
    }
    uint64_t v27 = sub_24A5E9640();
    uint64_t v29 = v28;
    if (v27 == sub_24A5E9640() && v29 == v30) {
      goto LABEL_10;
    }
    char v31 = sub_24A5E99A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v31) {
      goto LABEL_12;
    }
    uint64_t v35 = sub_24A5E9640();
    uint64_t v37 = v36;
    if (v35 == sub_24A5E9640() && v37 == v38) {
      goto LABEL_10;
    }
    char v39 = sub_24A5E99A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v39) {
      goto LABEL_12;
    }
    uint64_t v40 = sub_24A5E9640();
    uint64_t v42 = v41;
    if (v40 == sub_24A5E9640() && v42 == v43)
    {
LABEL_10:
      swift_bridgeObjectRelease_n();
LABEL_12:
      id v32 = objc_allocWithZone(MEMORY[0x263F4B540]);
      v33 = (void *)sub_24A5E9610();
      objc_msgSend(v32, sel_initWithBundleIdentifier_, v33);

      id v34 = objc_msgSend(self, sel_imageDescriptorNamed_, *MEMORY[0x263F4B5A0]);
      uint64_t v13 = v58;
      sub_24A5E91D0();
      uint64_t v23 = v63;
      (*(void (**)(char *, char *, uint64_t))(v63 + 16))(v5, v13, v10);
      goto LABEL_6;
    }
    char v44 = sub_24A5E99A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v44) {
      goto LABEL_12;
    }
    uint64_t v45 = sub_24A5E9640();
    uint64_t v47 = v46;
    if (v45 == sub_24A5E9640() && v47 == v48)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v23 = v63;
    }
    else
    {
      char v49 = sub_24A5E99A0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v23 = v63;
      if ((v49 & 1) == 0)
      {
        id v53 = objc_allocWithZone(MEMORY[0x263F4B540]);
        v54 = (void *)sub_24A5E9610();
        objc_msgSend(v53, sel_initWithSymbolName_, v54);

        id v55 = objc_msgSend(self, sel_imageDescriptorNamed_, *MEMORY[0x263F4B5A0]);
        sub_24A5E91D0();
        (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v5, v13, v10);
        goto LABEL_27;
      }
    }
    id v50 = objc_allocWithZone(MEMORY[0x263F4B540]);
    v51 = (void *)sub_24A5E9610();
    objc_msgSend(v50, sel_initWithType_, v51);

    id v52 = objc_msgSend(self, sel_imageDescriptorNamed_, *MEMORY[0x263F4B5A0]);
    uint64_t v13 = v58;
    sub_24A5E91D0();
    (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v5, v13, v10);
LABEL_27:
    swift_storeEnumTagMultiPayload();
    sub_24A5D90E8();
    sub_24A5E9410();
    uint64_t v24 = &qword_2697A7000;
    sub_24A5D922C((uint64_t)v7, v64, &qword_2697A7000);
    swift_storeEnumTagMultiPayload();
    sub_24A5D91B4((unint64_t *)&qword_2697A6DC0, (uint64_t *)&unk_2697A6FF0, (void (*)(void))sub_24A5D918C);
    sub_24A5D918C();
    sub_24A5E9410();
    uint64_t v25 = (uint64_t)v7;
    goto LABEL_7;
  }
  swift_bridgeObjectRelease_n();
LABEL_5:
  id v20 = objc_allocWithZone(MEMORY[0x263F4B540]);
  char v21 = (void *)sub_24A5E9610();
  objc_msgSend(v20, sel_initWithType_, v21);

  id v22 = objc_msgSend(self, sel_imageDescriptorNamed_, *MEMORY[0x263F4B5A0]);
  uint64_t v13 = v58;
  sub_24A5E91D0();
  uint64_t v23 = v63;
  (*(void (**)(char *, char *, uint64_t))(v63 + 16))(v5, v13, v10);
LABEL_6:
  swift_storeEnumTagMultiPayload();
  sub_24A5D90E8();
  sub_24A5E9410();
  sub_24A5D922C((uint64_t)v7, (uint64_t)v3, &qword_2697A7000);
  swift_storeEnumTagMultiPayload();
  sub_24A5D918C();
  sub_24A5E9410();
  sub_24A5D9290((uint64_t)v7, &qword_2697A7000);
  uint64_t v24 = (uint64_t *)&unk_2697A6FF0;
  sub_24A5D922C((uint64_t)v9, v64, (uint64_t *)&unk_2697A6FF0);
  swift_storeEnumTagMultiPayload();
  sub_24A5D91B4((unint64_t *)&qword_2697A6DC0, (uint64_t *)&unk_2697A6FF0, (void (*)(void))sub_24A5D918C);
  sub_24A5E9410();
  uint64_t v25 = (uint64_t)v9;
LABEL_7:
  sub_24A5D9290(v25, v24);
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v13, v10);
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

unint64_t sub_24A5D90E8()
{
  unint64_t result = qword_2697A6FD0;
  if (!qword_2697A6FD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2697A6DB8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697A6FD0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_24A5D918C()
{
  return sub_24A5D91B4(&qword_2697A6DC8, &qword_2697A7000, (void (*)(void))sub_24A5D90E8);
}

uint64_t sub_24A5D91B4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24A5D922C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24A5D9290(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *initializeBufferWithCopyOfBuffer for AnalyticsSection(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for AnalyticsSection()
{
  return swift_release();
}

void *assignWithCopy for AnalyticsSection(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for AnalyticsSection(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for AnalyticsSection(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 16)) {
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

uint64_t storeEnumTagSinglePayload for AnalyticsSection(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
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
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AnalyticsSection()
{
  return &type metadata for AnalyticsSection;
}

uint64_t *sub_24A5D947C(uint64_t *a1, uint64_t *a2)
{
  int v4 = *(_DWORD *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697A6DD0) - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v6 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v6 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v5 = sub_24A5E9430();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_24A5D9588(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6DD0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_24A5E9430();
    uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
    return v3(a1, v2);
  }
  else
  {
    return swift_release();
  }
}

void *sub_24A5D962C(void *a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6DD0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_24A5E9430();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_24A5D96E8(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_24A5D9290((uint64_t)a1, &qword_2697A6DD0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6DD0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = sub_24A5E9430();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_24A5D97BC(void *a1, const void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6DD0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_24A5E9430();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v4 - 8) + 64));
  }
  return a1;
}

void *sub_24A5D9880(void *a1, const void *a2)
{
  if (a1 != a2)
  {
    sub_24A5D9290((uint64_t)a1, &qword_2697A6DD0);
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6DD0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v5 = sub_24A5E9430();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v4 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_24A5D995C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24A5D9970);
}

uint64_t sub_24A5D9970(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6DD8);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_24A5D99E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24A5D99F4);
}

uint64_t sub_24A5D99F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6DD8);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for SafetyResourcesSection(uint64_t a1)
{
  return sub_24A5DB6C4(a1, (uint64_t *)&unk_2697A6DE0);
}

void sub_24A5D9A88()
{
  sub_24A5D9B14();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_24A5D9B14()
{
  if (!qword_2697A6DF0)
  {
    sub_24A5E9430();
    unint64_t v0 = sub_24A5E9260();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2697A6DF0);
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for NudityDetectionToggleSection(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for NudityDetectionToggleSection()
{
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for NudityDetectionToggleSection(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for NudityDetectionToggleSection(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for NudityDetectionToggleSection(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NudityDetectionToggleSection(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for NudityDetectionToggleSection(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NudityDetectionToggleSection()
{
  return &type metadata for NudityDetectionToggleSection;
}

uint64_t sub_24A5D9DD0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24A5D9DEC()
{
  sub_24A5E93E0();
  if (qword_26B178960 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v0 = (id)qword_26B178328;
  sub_24A5E9460();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6E18);
  sub_24A5DD5F0(&qword_2697A6E20, &qword_2697A6E18);
  return sub_24A5E9560();
}

uint64_t sub_24A5D9F5C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SafetyResourcesSection(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  sub_24A5DD380(a1, (uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for SafetyResourcesSection);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  sub_24A5DC714((uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5, type metadata accessor for SafetyResourcesSection);
  return sub_24A5E94F0();
}

uint64_t sub_24A5DA0B0()
{
  uint64_t v0 = sub_24A5E9430();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A5DBBDC((uint64_t)v3);
  sub_24A5E9420();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

void sub_24A5DA194(void *a1)
{
  if (a1)
  {
    id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F67DD0]), sel_init);
    objc_msgSend(a1, sel_presentViewController_animated_completion_, v2, 1, 0);
  }
}

uint64_t sub_24A5DA210@<X0>(uint64_t a1@<X8>)
{
  return sub_24A5DA6B8(a1);
}

uint64_t sub_24A5DA234()
{
  return sub_24A5E94C0();
}

uint64_t sub_24A5DA254(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ImproveNudityDetectionExplainerText(0);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (uint64_t *)&v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = &v17[-v8];
  uint64_t v18 = a1;
  uint64_t v19 = a2;
  sub_24A5E93E0();
  if (qword_26B178960 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v10 = (id)qword_26B178328;
  uint64_t v20 = sub_24A5E9460();
  uint64_t v21 = v11;
  char v22 = v12 & 1;
  uint64_t v23 = v13;
  *uint64_t v7 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6DD0);
  swift_storeEnumTagMultiPayload();
  uint64_t v14 = (id *)((char *)v7 + *(int *)(v4 + 20));
  *uint64_t v14 = sub_24A5DA7A0();
  v14[1] = v15;
  sub_24A5DC714((uint64_t)v7, (uint64_t)v9, type metadata accessor for ImproveNudityDetectionExplainerText);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6DF8);
  sub_24A5DD5F0(&qword_2697A6E00, &qword_2697A6DF8);
  sub_24A5DC594(&qword_2697A6E08, (void (*)(uint64_t))type metadata accessor for ImproveNudityDetectionExplainerText);
  return sub_24A5E9550();
}

uint64_t sub_24A5DA4F0()
{
  return sub_24A5E9500();
}

uint64_t sub_24A5DA5F4@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24A5E9230();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

void sub_24A5DA674()
{
}

uint64_t sub_24A5DA69C@<X0>(uint64_t a1@<X8>)
{
  return sub_24A5DA6B8(a1);
}

uint64_t sub_24A5DA6B8@<X0>(uint64_t a1@<X8>)
{
  sub_24A5E93E0();
  if (qword_26B178960 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v2 = (id)qword_26B178328;
  uint64_t result = sub_24A5E9460();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_24A5DA798()
{
  return sub_24A5DA254(*v0, v0[1]);
}

id sub_24A5DA7A0()
{
  uint64_t v0 = sub_24A5E9200();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  char v3 = (char *)&v17[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = (void *)sub_24A5E9610();
  id v5 = objc_msgSend(self, sel_bundleWithIdentifier_, v4);

  if (!v5) {
    goto LABEL_6;
  }
  id result = objc_msgSend(self, sel_flowWithBundle_, v5);
  if (result)
  {
    uint64_t v7 = result;
    id v8 = objc_msgSend(result, sel_localizedButtonTitle);

    if (v8)
    {
      uint64_t v9 = sub_24A5E9640();

LABEL_11:
      return (id)v9;
    }

LABEL_6:
    sub_24A5E91F0();
    id v10 = sub_24A5E91E0();
    os_log_type_t v11 = sub_24A5E9750();
    if (os_log_type_enabled(v10, v11))
    {
      char v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      v17[0] = v13;
      *(_DWORD *)char v12 = 136315138;
      uint64_t v16 = sub_24A5DBEDC(0xD00000000000001FLL, 0x800000024A5EB1B0, v17);
      sub_24A5E97A0();
      _os_log_impl(&dword_24A5D4000, v10, v11, "We couldn't find our bundle for %s, falling back to placeholder text", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5C8D00](v13, -1, -1);
      MEMORY[0x24C5C8D00](v12, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    if (qword_26B178960 != -1) {
      swift_once();
    }
    swift_beginAccess();
    id v14 = (id)qword_26B178328;
    uint64_t v15 = (void *)sub_24A5E9610();
    id v5 = objc_msgSend(v14, sel_localizedStringForKey_value_table_, v15, 0, 0);

    uint64_t v9 = sub_24A5E9640();
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_24A5DAB0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6E98);
  MEMORY[0x270FA5388](v30);
  id v5 = (uint64_t *)((char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = type metadata accessor for ImproveNudityDetectionExplainerText(0);
  uint64_t v28 = *(void *)(v6 - 8);
  uint64_t v7 = *(void *)(v28 + 64);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = sub_24A5E92A0();
  uint64_t v31 = *(void *)(v8 - 8);
  uint64_t v32 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v29 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24A5E93D0();
  MEMORY[0x270FA5388](v10 - 8);
  sub_24A5E93C0();
  sub_24A5E93B0();
  sub_24A5E93A0();
  sub_24A5E93B0();
  sub_24A5E93F0();
  if (qword_26B178960 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v11 = (id)qword_26B178328;
  uint64_t v12 = sub_24A5E9460();
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  char v18 = v17 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  sub_24A5DD380(a1, (uint64_t)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ImproveNudityDetectionExplainerText);
  unint64_t v20 = (*(unsigned __int8 *)(v28 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
  uint64_t v21 = swift_allocObject();
  sub_24A5DC714((uint64_t)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v21 + v20, type metadata accessor for ImproveNudityDetectionExplainerText);
  char v22 = v29;
  sub_24A5E9290();
  uint64_t v23 = v31;
  uint64_t v24 = v32;
  (*(void (**)(char *, char *, uint64_t))(v31 + 16))((char *)v5 + *(int *)(v30 + 28), v22, v32);
  *id v5 = KeyPath;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6EA0);
  sub_24A5D922C((uint64_t)v5, a2 + *(int *)(v25 + 36), &qword_2697A6E98);
  *(void *)a2 = v12;
  *(void *)(a2 + 8) = v14;
  *(unsigned char *)(a2 + 16) = v18;
  *(void *)(a2 + 24) = v16;
  sub_24A5DD58C(v12, v14, v18);
  swift_bridgeObjectRetain();
  sub_24A5D9290((uint64_t)v5, &qword_2697A6E98);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v22, v24);
  sub_24A5DD59C(v12, v14, v18);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A5DAF40(uint64_t a1)
{
  uint64_t v2 = sub_24A5E92A0();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_24A5E9370();
}

void sub_24A5DB008()
{
  uint64_t v0 = sub_24A5E9430();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24A5E9200();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (void *)sub_24A5E9610();
  id v9 = objc_msgSend(self, sel_presenterForPrivacySplashWithIdentifier_, v8);

  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = sub_24A5DBBDC((uint64_t)v3);
    MEMORY[0x270FA5388](v11);
    *(&v15 - 2) = (uint64_t)v10;
    sub_24A5E9420();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_24A5E9280();
  }
  else
  {
    sub_24A5E91F0();
    uint64_t v12 = sub_24A5E91E0();
    os_log_type_t v13 = sub_24A5E9750();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_24A5D4000, v12, v13, "Failed to create privacyPresenter for com.apple.onboarding.improvescw", v14, 2u);
      MEMORY[0x24C5C8D00](v14, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    sub_24A5E9270();
  }
}

void sub_24A5DB2D0(void *a1, void *a2)
{
  uint64_t v4 = sub_24A5E9200();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    id v13 = a1;
    objc_msgSend(a2, sel_setPresentingViewController_, v13);
    objc_msgSend(a2, sel_present);
    uint64_t v8 = v13;
  }
  else
  {
    sub_24A5E91F0();
    id v9 = sub_24A5E91E0();
    uint64_t v10 = sub_24A5E9750();
    if (os_log_type_enabled(v9, (os_log_type_t)v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_24A5D4000, v9, (os_log_type_t)v10, "Failed to get hosting controller", v11, 2u);
      MEMORY[0x24C5C8D00](v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_24A5DB48C@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_24A5E9400();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6E90);
  return sub_24A5DAB0C(v1, a1 + *(int *)(v3 + 44));
}

uint64_t sub_24A5DB4D8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  sub_24A5DC838((uint64_t)&v2);
  swift_retain();
  sub_24A5E9570();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6E40);
  sub_24A5E9520();
  swift_release();
  sub_24A5DC864((uint64_t)&v2);
  swift_release();
  sub_24A5DC890();
  return sub_24A5E9500();
}

uint64_t sub_24A5DB5B0()
{
  return sub_24A5E9560();
}

uint64_t sub_24A5DB66C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24A5DB688()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata accessor for ImproveNudityDetectionExplainerText(uint64_t a1)
{
  return sub_24A5DB6C4(a1, (uint64_t *)&unk_2697A6E50);
}

uint64_t sub_24A5DB6C4(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24A5DB6FC()
{
  return sub_24A5DA4F0();
}

uint64_t sub_24A5DB704@<X0>(uint64_t a1@<X8>)
{
  sub_24A5E93E0();
  if (qword_26B178960 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v2 = (id)qword_26B178328;
  uint64_t result = sub_24A5E9460();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_24A5DB7FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_24A5E91B0();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v23 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24A5E9140();
  uint64_t v21 = *(void *)(v4 - 8);
  uint64_t v22 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24A5E9600();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v8 = sub_24A5E95E0();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v9 = sub_24A5E9150();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v10 = sub_24A5E9190();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  id v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = objc_msgSend(self, sel_learnMoreAboutSensitiveContentWarningURL);
  sub_24A5E9180();

  sub_24A5E9170();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  sub_24A5E95D0();
  sub_24A5E95C0();
  sub_24A5E95B0();
  swift_bridgeObjectRelease();
  sub_24A5E95C0();
  sub_24A5E95F0();
  if (qword_26B178960 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v15 = objc_msgSend((id)qword_26B178328, sel_bundleURL);
  sub_24A5E9180();

  (*(void (**)(char *, void, uint64_t))(v21 + 104))(v6, *MEMORY[0x263F06D20], v22);
  sub_24A5E91A0();
  sub_24A5E9160();
  uint64_t result = sub_24A5E9470();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v17;
  *(unsigned char *)(a1 + 16) = v18 & 1;
  *(void *)(a1 + 24) = v19;
  return result;
}

uint64_t sub_24A5DBBDC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24A5E9390();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6DD0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A5D922C(v2, (uint64_t)v10, &qword_2697A6DD0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_24A5E9430();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_24A5E9760();
    id v14 = sub_24A5E9440();
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v19[1] = a1;
      uint64_t v18 = v17;
      uint64_t v20 = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      v19[2] = sub_24A5DBEDC(0xD000000000000022, 0x800000024A5EB510, &v20);
      sub_24A5E97A0();
      _os_log_impl(&dword_24A5D4000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5C8D00](v18, -1, -1);
      MEMORY[0x24C5C8D00](v16, -1, -1);
    }

    sub_24A5E9380();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_24A5DBE94()
{
  return sub_24A5E9350();
}

uint64_t sub_24A5DBEB8()
{
  return sub_24A5E9350();
}

uint64_t sub_24A5DBEDC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24A5DBFB0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24A5DC534((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_24A5DC534((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_24A5DBFB0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24A5E97B0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24A5DC16C(a5, a6);
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
  uint64_t v8 = sub_24A5E9860();
  if (!v8)
  {
    sub_24A5E9910();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24A5E9970();
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

uint64_t sub_24A5DC16C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24A5DC204(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24A5DC3E4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24A5DC3E4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24A5DC204(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24A5DC37C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24A5E9830();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24A5E9910();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24A5E9690();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24A5E9970();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24A5E9910();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24A5DC37C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B178990);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24A5DC3E4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B178990);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  os_log_type_t v13 = a4 + 32;
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
  uint64_t result = sub_24A5E9970();
  __break(1u);
  return result;
}

uint64_t sub_24A5DC534(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24A5DC594(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_24A5DC5E0()
{
}

uint64_t sub_24A5DC608()
{
  return sub_24A5D9F5C(*(void *)(v0 + 16));
}

uint64_t sub_24A5DC610()
{
  uint64_t v1 = *(void *)(type metadata accessor for SafetyResourcesSection(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6DD0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_24A5E9430();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_24A5DC714(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24A5DC77C()
{
  type metadata accessor for SafetyResourcesSection(0);
  return sub_24A5DA0B0();
}

uint64_t sub_24A5DC7DC()
{
  return sub_24A5DB4D8(*(uint64_t **)(v0 + 16));
}

unint64_t sub_24A5DC7E4()
{
  unint64_t result = qword_2697A6E38;
  if (!qword_2697A6E38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697A6E38);
  }
  return result;
}

uint64_t sub_24A5DC838(uint64_t a1)
{
  return a1;
}

uint64_t sub_24A5DC864(uint64_t a1)
{
  return a1;
}

unint64_t sub_24A5DC890()
{
  unint64_t result = qword_2697A6E48;
  if (!qword_2697A6E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697A6E48);
  }
  return result;
}

uint64_t *sub_24A5DC8E4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6DD0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_24A5E9430();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (uint64_t *)((char *)a1 + v9);
    size_t v11 = (uint64_t *)((char *)a2 + v9);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_24A5DCA0C(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6DD0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_24A5E9430();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }
  return swift_bridgeObjectRelease();
}

void *sub_24A5DCAB0(void *a1, void *a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6DD0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_24A5E9430();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_24A5DCB88(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24A5D9290((uint64_t)a1, &qword_2697A6DD0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6DD0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_24A5E9430();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_24A5DCC8C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6DD0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_24A5E9430();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *sub_24A5DCD60(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24A5D9290((uint64_t)a1, &qword_2697A6DD0);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6DD0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_24A5E9430();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v12 = *(void *)v10;
  uint64_t v11 = *((void *)v10 + 1);
  *(void *)uint64_t v9 = v12;
  *((void *)v9 + 1) = v11;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24A5DCE5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24A5DCE70);
}

uint64_t sub_24A5DCE70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6DD8);
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

uint64_t sub_24A5DCF38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24A5DCF4C);
}

uint64_t sub_24A5DCF4C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6DD8);
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

void sub_24A5DD010()
{
  sub_24A5D9B14();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

ValueMetadata *type metadata accessor for NudityDetectionToggleText()
{
  return &type metadata for NudityDetectionToggleText;
}

ValueMetadata *type metadata accessor for NudityDetectionToggleLabel()
{
  return &type metadata for NudityDetectionToggleLabel;
}

unint64_t sub_24A5DD0C8()
{
  unint64_t result = qword_2697A6E60;
  if (!qword_2697A6E60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2697A6E68);
    sub_24A5DD5F0(&qword_2697A6E00, &qword_2697A6DF8);
    sub_24A5DC594(&qword_2697A6E08, (void (*)(uint64_t))type metadata accessor for ImproveNudityDetectionExplainerText);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697A6E60);
  }
  return result;
}

unint64_t sub_24A5DD1A8()
{
  unint64_t result = qword_2697A6E70;
  if (!qword_2697A6E70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2697A6E78);
    sub_24A5DD5F0(&qword_2697A6E20, &qword_2697A6E18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697A6E70);
  }
  return result;
}

unint64_t sub_24A5DD258()
{
  unint64_t result = qword_2697A6E80;
  if (!qword_2697A6E80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2697A6E88);
    sub_24A5DD5F0(&qword_2697A6E30, &qword_2697A6E28);
    sub_24A5DC7E4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697A6E80);
  }
  return result;
}

uint64_t sub_24A5DD304()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24A5DD320()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24A5DD33C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24A5DD358()
{
  return sub_24A5E9360();
}

uint64_t sub_24A5DD380(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24A5DD3E8()
{
  uint64_t v1 = *(void *)(type metadata accessor for ImproveNudityDetectionExplainerText(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6DD0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_24A5E9430();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

void sub_24A5DD50C()
{
  type metadata accessor for ImproveNudityDetectionExplainerText(0);
  sub_24A5DB008();
}

uint64_t sub_24A5DD58C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_24A5DD59C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

void sub_24A5DD5AC(void *a1)
{
  sub_24A5DB2D0(a1, *(void **)(v1 + 16));
}

uint64_t sub_24A5DD5B4()
{
  return sub_24A5DD5F0(&qword_2697A6EA8, &qword_2697A6EB0);
}

uint64_t sub_24A5DD5F0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24A5DD634()
{
  return MEMORY[0x263F1A820];
}

uint64_t NudityDetectionAppsRootView.init()@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for NudityDetectionRootModel(0);
  sub_24A5DE92C(&qword_2697A6E10, (void (*)(uint64_t))type metadata accessor for NudityDetectionRootModel);
  uint64_t result = sub_24A5E9320();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t NudityDetectionAppsRootView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v19 = a1;
  uint64_t v2 = sub_24A5E92E0();
  uint64_t v18 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6EB8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6EC0);
  uint64_t v9 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v20 = *v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6EC8);
  sub_24A5DD5F0(&qword_2697A6ED0, &qword_2697A6EC8);
  sub_24A5E9450();
  sub_24A5E9580();
  uint64_t v12 = sub_24A5DD5F0(&qword_2697A6ED8, &qword_2697A6EB8);
  uint64_t v13 = sub_24A5DE92C(&qword_2697A6EE0, MEMORY[0x263F18F38]);
  sub_24A5E94D0();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v4, v2);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v21 = v5;
  uint64_t v22 = v2;
  uint64_t v23 = v12;
  uint64_t v24 = v13;
  swift_getOpaqueTypeConformance2();
  uint64_t v14 = v17;
  sub_24A5E9490();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v14);
}

uint64_t sub_24A5DD9F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for SafetyResourcesSection(0);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (uint64_t *)&v21[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = &v21[-v8];
  type metadata accessor for NudityDetectionRootModel(0);
  sub_24A5DE92C(&qword_2697A6E10, (void (*)(uint64_t))type metadata accessor for NudityDetectionRootModel);
  swift_retain();
  sub_24A5E92F0();
  swift_release();
  swift_getKeyPath();
  sub_24A5E9310();
  swift_release();
  swift_release();
  uint64_t v10 = v23;
  uint64_t v11 = v24;
  int v22 = v25;
  *uint64_t v7 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6DD0);
  swift_storeEnumTagMultiPayload();
  sub_24A5DE980((uint64_t)v7, (uint64_t)v9);
  if (a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_24A5E9230();
    swift_release();
    swift_release();
    swift_release();
    if (v23)
    {
      uint64_t v12 = sub_24A5E9320();
      uint64_t v14 = v13;
      uint64_t v15 = sub_24A5E9320();
      uint64_t v17 = v16;
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      uint64_t v17 = 0;
      uint64_t v12 = 1;
    }
    sub_24A5DE9E4((uint64_t)v9, (uint64_t)v7);
    *(void *)a2 = v10;
    *(void *)(a2 + 8) = v11;
    *(unsigned char *)(a2 + 16) = v22;
    *(void *)(a2 + 24) = 0;
    *(void *)(a2 + 32) = 0;
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6F10);
    sub_24A5DE9E4((uint64_t)v7, a2 + *(int *)(v18 + 48));
    uint64_t v19 = (uint64_t *)(a2 + *(int *)(v18 + 64));
    *uint64_t v19 = v12;
    v19[1] = v14;
    v19[2] = v15;
    void v19[3] = v17;
    swift_retain();
    swift_retain();
    sub_24A5DEA48(v12);
    sub_24A5DEA90((uint64_t)v9);
    sub_24A5DEAEC(v12);
    sub_24A5DEA90((uint64_t)v7);
    swift_bridgeObjectRelease();
    swift_release();
    return swift_release();
  }
  else
  {
    uint64_t result = sub_24A5E9300();
    __break(1u);
  }
  return result;
}

uint64_t sub_24A5DDCDC@<X0>(uint64_t a1@<X8>)
{
  return sub_24A5DD9F0(*(void *)(v1 + 16), a1);
}

uint64_t sub_24A5DDCE4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24A5DDD00@<X0>(uint64_t a1@<X8>)
{
  uint64_t v19 = a1;
  uint64_t v2 = sub_24A5E92E0();
  uint64_t v18 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6EB8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6EC0);
  uint64_t v9 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v20 = *v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6EC8);
  sub_24A5DD5F0(&qword_2697A6ED0, &qword_2697A6EC8);
  sub_24A5E9450();
  sub_24A5E9580();
  uint64_t v12 = sub_24A5DD5F0(&qword_2697A6ED8, &qword_2697A6EB8);
  uint64_t v13 = sub_24A5DE92C(&qword_2697A6EE0, MEMORY[0x263F18F38]);
  sub_24A5E94D0();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v4, v2);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v21 = v5;
  uint64_t v22 = v2;
  uint64_t v23 = v12;
  uint64_t v24 = v13;
  swift_getOpaqueTypeConformance2();
  uint64_t v14 = v17;
  sub_24A5E9490();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v14);
}

ValueMetadata *type metadata accessor for NudityDetectionAppsRootView()
{
  return &type metadata for NudityDetectionAppsRootView;
}

uint64_t sub_24A5DE054()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for NudityDetectionEntryListSection()
{
  return &type metadata for NudityDetectionEntryListSection;
}

uint64_t sub_24A5DE168()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24A5DE184()
{
  sub_24A5E93E0();
  if (qword_26B178960 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v0 = (id)qword_26B178328;
  sub_24A5E9460();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6EE8);
  sub_24A5DE594();
  return sub_24A5E9540();
}

uint64_t sub_24A5DE2D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6EE8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_24A5E9230();
    swift_release();
    swift_release();
    swift_release();
    swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1788D8);
    sub_24A5DD5F0(&qword_2697A6F00, (uint64_t *)&unk_26B1788D8);
    sub_24A5DE608();
    sub_24A5E9530();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
  }
  else
  {
    type metadata accessor for NudityDetectionRootModel(0);
    sub_24A5DE92C(&qword_2697A6E10, (void (*)(uint64_t))type metadata accessor for NudityDetectionRootModel);
    uint64_t result = sub_24A5E9300();
    __break(1u);
  }
  return result;
}

uint64_t sub_24A5DE4FC@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for NudityDetectionEntry(0);
  sub_24A5DE92C(&qword_2697A6F08, (void (*)(uint64_t))type metadata accessor for NudityDetectionEntry);
  swift_retain();
  uint64_t result = sub_24A5E92B0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24A5DE584()
{
  return sub_24A5DE184();
}

uint64_t sub_24A5DE58C@<X0>(uint64_t a1@<X8>)
{
  return sub_24A5DE2D0(*(void *)(v1 + 16), a1);
}

unint64_t sub_24A5DE594()
{
  unint64_t result = qword_2697A6EF0;
  if (!qword_2697A6EF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2697A6EE8);
    sub_24A5DE608();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697A6EF0);
  }
  return result;
}

unint64_t sub_24A5DE608()
{
  unint64_t result = qword_2697A6EF8;
  if (!qword_2697A6EF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697A6EF8);
  }
  return result;
}

uint64_t sub_24A5DE65C@<X0>(uint64_t a1@<X8>)
{
  sub_24A5DEE10();
  swift_bridgeObjectRetain();
  uint64_t result = sub_24A5E9480();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_24A5DE6C8()
{
  return sub_24A5E9500();
}

uint64_t sub_24A5DE808@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24A5E9230();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24A5DE88C()
{
  return sub_24A5E9240();
}

uint64_t sub_24A5DE90C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = (void *)(*a1 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI20NudityDetectionEntry_defaultsKey);
  uint64_t v3 = v2[1];
  *a2 = *v2;
  a2[1] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24A5DE92C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24A5DE980(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SafetyResourcesSection(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A5DE9E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SafetyResourcesSection(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A5DEA48(uint64_t result)
{
  if (result != 1)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_24A5DEA90(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SafetyResourcesSection(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24A5DEAEC(uint64_t result)
{
  if (result != 1)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for NudityDetectionEntryRow(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for NudityDetectionEntryRow()
{
  return swift_release();
}

void *assignWithCopy for NudityDetectionEntryRow(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

void *assignWithTake for NudityDetectionEntryRow(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for NudityDetectionEntryRow(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for NudityDetectionEntryRow(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for NudityDetectionEntryRow()
{
  return &type metadata for NudityDetectionEntryRow;
}

unint64_t sub_24A5DEC78()
{
  unint64_t result = qword_2697A6F18;
  if (!qword_2697A6F18)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2697A6F20);
    sub_24A5DE594();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697A6F18);
  }
  return result;
}

uint64_t sub_24A5DED00()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24A5DED24()
{
  return sub_24A5E94E0();
}

uint64_t sub_24A5DEDA0@<X0>(uint64_t a1@<X8>)
{
  return sub_24A5DE65C(a1);
}

uint64_t sub_24A5DEDA8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t))(**(void **)(v1 + 24) + 144);
  uint64_t v4 = swift_retain();
  uint64_t v5 = v3(v4);
  uint64_t result = swift_release();
  *a1 = v5;
  return result;
}

unint64_t sub_24A5DEE10()
{
  unint64_t result = qword_2697A7010;
  if (!qword_2697A7010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697A7010);
  }
  return result;
}

uint64_t sub_24A5DEE64()
{
  return sub_24A5DD5F0(&qword_2697A6F38, &qword_2697A6F40);
}

uint64_t sub_24A5DEEB0@<X0>(unsigned char *a1@<X8>)
{
  return sub_24A5DEFA0(a1);
}

void sub_24A5DEEC4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24A5E9240();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24A5E9230();
  swift_release();
  swift_release();
  sub_24A5E33C8(v0);
}

uint64_t sub_24A5DEF8C@<X0>(unsigned char *a1@<X8>)
{
  return sub_24A5DEFA0(a1);
}

uint64_t sub_24A5DEFA0@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24A5E9230();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24A5DF01C()
{
  return sub_24A5DF044();
}

uint64_t sub_24A5DF044()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24A5E9240();
  uint64_t v1 = *(void (**)(void))(v0 + 32);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24A5E9230();
  swift_release();
  swift_release();
  v1(v3);
  return swift_release();
}

uint64_t sub_24A5DF124()
{
  return sub_24A5E9510();
}

uint64_t sub_24A5DF138()
{
  return sub_24A5E0174();
}

uint64_t sub_24A5DF14C()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI20NudityDetectionEntry_defaultsKey);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_24A5DF188()
{
  return 0xD00000000000001ALL;
}

uint64_t sub_24A5DF1A4()
{
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI20NudityDetectionEntry__enabled;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697A6F48);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_24A5DF26C@<X0>(void *a1@<X8>)
{
  uint64_t v2 = (void *)(*v1 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI20NudityDetectionEntry_defaultsKey);
  uint64_t v3 = v2[1];
  *a1 = *v2;
  a1[1] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24A5DF288()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 256))();
}

uint64_t sub_24A5DF2D4@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for NudityDetectionEntry(0);
  uint64_t result = sub_24A5E9210();
  *a1 = result;
  return result;
}

uint64_t sub_24A5DF314()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6FD8);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = *(id *)(v0 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI28NudityDetectionSystemService_service);
  sub_24A5D8548((uint64_t)v3);

  sub_24A5E8F00();
  return sub_24A5E9510();
}

uint64_t sub_24A5DF3C0()
{
  return 0;
}

void sub_24A5DF52C()
{
}

uint64_t sub_24A5DF53C()
{
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI20NudityDetectionEntry__enabled;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697A6F48);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();

  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

void *sub_24A5DF614(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = v4;
  uint64_t v9 = (char *)v4 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI18NudityDetectionApp__displayScale;
  *(void *)uint64_t v9 = swift_getKeyPath();
  v9[8] = 0;
  uint64_t v10 = (void *)((char *)v4 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI18NudityDetectionApp_iconBundleID);
  *uint64_t v10 = 0;
  v10[1] = 0;
  swift_retain();
  id v11 = objc_msgSend(a4, sel_bundleIdentifier);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = sub_24A5E9640();
    uint64_t v15 = v14;

    *(void *)((char *)v4 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI18NudityDetectionApp_application) = a4;
    id v16 = a4;
    swift_release();
    v4[2] = 0;
    v4[3] = 0xE000000000000000;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v4[4] = a1;
    v4[5] = a2;
    swift_beginAccess();
    swift_retain();
    sub_24A5E9220();
    swift_endAccess();
    uint64_t v17 = (void *)((char *)v4 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI20NudityDetectionEntry_defaultsKey);
    *uint64_t v17 = v13;
    v17[1] = v15;
    swift_release();
    sub_24A5E8FF8(0, (unint64_t *)&unk_2697A7020);
    swift_bridgeObjectRetain();
    swift_retain();
    id v18 = sub_24A5DF9F4();
    uint64_t v21 = v18;
    if (v18)
    {
      swift_bridgeObjectRelease();
      swift_retain();
      id v22 = objc_msgSend(v21, sel_localizedName);
      uint64_t v23 = sub_24A5E9640();
      uint64_t v25 = v24;

      v5[2] = v23;
      v5[3] = v25;
      swift_release();
      swift_bridgeObjectRelease();
      id v26 = objc_msgSend(v21, sel_bundleIdentifier);
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = sub_24A5E9640();
        uint64_t v30 = v29;

        swift_release();
        swift_release();
      }
      else
      {

        swift_release();
        swift_release();

        uint64_t v28 = 0;
        uint64_t v30 = 0;
      }
      uint64_t v36 = (void *)((char *)v5 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI18NudityDetectionApp_iconBundleID);
      *uint64_t v36 = v28;
      v36[1] = v30;
    }
    else
    {
      id v19 = objc_allocWithZone(MEMORY[0x263F01878]);
      swift_bridgeObjectRetain();
      id v20 = sub_24A5E54E4(v13, v15, 1);
      uint64_t v31 = v20;
      if (v20)
      {
        swift_bridgeObjectRelease();
        swift_retain();
        id v32 = objc_msgSend(v31, sel_localizedName);
        uint64_t v33 = sub_24A5E9640();
        uint64_t v35 = v34;

        swift_release();
        swift_release();

        v5[2] = v33;
        v5[3] = v35;
        swift_release();
      }
      else
      {
        swift_release();

        swift_release();
        v5[2] = v13;
        v5[3] = v15;
      }
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_release();

    sub_24A5E8EF4(*(void *)v9, v9[8]);
    swift_release();
    swift_bridgeObjectRelease();
    type metadata accessor for NudityDetectionApp(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v5;
}

id sub_24A5DF9F4()
{
  v5[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v0 = (void *)sub_24A5E9610();
  swift_bridgeObjectRelease();
  v5[0] = 0;
  id v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleRecordWithApplicationIdentifier_error_, v0, v5);

  if (v1)
  {
    id v2 = v5[0];
  }
  else
  {
    id v3 = v5[0];
    sub_24A5E9130();

    swift_willThrow();
  }
  return v1;
}

uint64_t sub_24A5DFACC()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6DB8);
  MEMORY[0x270FA5388](v0);
  id v1 = objc_allocWithZone(MEMORY[0x263F4B540]);
  swift_bridgeObjectRetain();
  id v2 = (void *)sub_24A5E9610();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_initWithBundleIdentifier_, v2);

  id v3 = objc_msgSend(self, sel_imageDescriptorNamed_, *MEMORY[0x263F4B5A0]);
  sub_24A5E91D0();
  sub_24A5DD5F0((unint64_t *)&qword_2697A6FD0, &qword_2697A6DB8);
  return sub_24A5E9510();
}

unint64_t sub_24A5DFC20()
{
  return 0xD000000000000012;
}

uint64_t sub_24A5DFD80()
{
  sub_24A5E8EF4(*(void *)(v0 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI18NudityDetectionApp__displayScale), *(unsigned char *)(v0 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI18NudityDetectionApp__displayScale + 8));

  return swift_bridgeObjectRelease();
}

uint64_t sub_24A5DFDDC()
{
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI20NudityDetectionEntry__enabled;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697A6F48);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  sub_24A5E8EF4(*(void *)(v0 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI18NudityDetectionApp__displayScale), *(unsigned char *)(v0 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI18NudityDetectionApp__displayScale + 8));

  swift_bridgeObjectRelease();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_24A5DFEE0()
{
  type metadata accessor for NudityDetectionRootModel(0);
  uint64_t v0 = swift_allocObject();
  uint64_t result = NudityDetectionRootModel.init()();
  qword_26B1784D0 = v0;
  return result;
}

uint64_t NudityDetectionRootModel.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  NudityDetectionRootModel.init()();
  return v0;
}

uint64_t static NudityDetectionRootModel.shared.getter()
{
  if (qword_26B1784D8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_retain();
}

uint64_t static NudityDetectionRootModel.shared.setter(uint64_t a1)
{
  if (qword_26B1784D8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  qword_26B1784D0 = a1;
  return swift_release();
}

uint64_t (*static NudityDetectionRootModel.shared.modify())()
{
  if (qword_26B1784D8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_24A5E00D8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24A5E9230();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_24A5E014C()
{
  return sub_24A5E0174();
}

uint64_t sub_24A5E0160()
{
  return sub_24A5E0174();
}

uint64_t sub_24A5E0174()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24A5E9230();
  swift_release();
  swift_release();
  return v1;
}

void sub_24A5E01E0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24A5E9240();
  if (qword_26B178910 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B178D28;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24A5E9230();
  swift_release();
  swift_release();
  unsigned __int8 v1 = (void *)sub_24A5E9700();
  uint64_t v2 = (void *)sub_24A5E9610();
  objc_msgSend(v0, sel_setValue_forKey_, v1, v2);
}

id sub_24A5E0318()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F53EE0]);
  unsigned __int8 v1 = (void *)sub_24A5E9610();
  uint64_t v2 = (void *)sub_24A5E9610();
  id v3 = objc_msgSend(v0, sel_initWithName_sharedContainer_, v1, v2);

  id v4 = v3;
  id v5 = objc_msgSend(v4, sel_userSafety);
  id v6 = objc_msgSend(v5, sel_scanningPolicy);

  if (!v6 || (id v7 = objc_msgSend(v6, sel_policy), v6, !v7)) {
    objc_msgSend(v4, sel_setActive_, 0);
  }
  objc_msgSend(v4, sel_setSyncToWatch_, 1);

  return v4;
}

uint64_t NudityDetectionRootModel.init()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24A5E9200();
  uint64_t v52 = *(void *)(v2 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  v51 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v49 - v5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1788B8);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = v1 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel__detectionEntries;
  aBlock[0] = MEMORY[0x263F8EE78];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1788D8);
  sub_24A5E9220();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v11, v10, v7);
  uint64_t v12 = OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectiveStore;
  *(void *)(v1 + v12) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F53ED0]), sel_init);
  uint64_t v13 = OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectivePublisher;
  uint64_t v14 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B178980);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24A5EAA70;
  id v16 = (void *)*MEMORY[0x263F53E80];
  *(void *)(inited + 32) = *MEMORY[0x263F53E80];
  id v17 = v16;
  sub_24A5E8060(inited);
  swift_setDeallocating();
  type metadata accessor for Name(0);
  swift_arrayDestroy();
  sub_24A5E8E08(&qword_26B178918, type metadata accessor for Name);
  id v18 = (void *)sub_24A5E9710();
  swift_bridgeObjectRelease();
  id v19 = objc_msgSend(v14, sel_publisherForGroups_, v18);

  *(void *)(v1 + v13) = v19;
  *(void *)(v1 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectivePublisherSink) = 0;
  uint64_t v20 = OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_localStore;
  *(void *)(v1 + v20) = sub_24A5E0318();
  uint64_t v21 = OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy;
  *(void *)(v1 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy) = 0;
  sub_24A5E91F0();
  id v22 = sub_24A5E91E0();
  os_log_type_t v23 = sub_24A5E9770();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v24 = 0;
    _os_log_impl(&dword_24A5D4000, v22, v23, "init NudityDetectionModel", v24, 2u);
    MEMORY[0x24C5C8D00](v24, -1, -1);
  }

  uint64_t v25 = v52 + 8;
  id v26 = *(void (**)(char *, uint64_t))(v52 + 8);
  v26(v6, v2);
  uint64_t v27 = OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_localStore;
  id v28 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_localStore), sel_userSafety);
  id v29 = objc_msgSend(v28, sel_scanningPolicy);

  uint64_t v30 = *(void **)(v1 + v21);
  *(void *)(v1 + v21) = v29;

  uint64_t v31 = *(void **)(v1 + v21);
  if (v31 && objc_msgSend(v31, sel_policy)) {
    unsigned __int8 v32 = objc_msgSend(*(id *)(v1 + v27), sel_active);
  }
  else {
    unsigned __int8 v32 = 0;
  }
  swift_beginAccess();
  unsigned __int8 v54 = v32;
  sub_24A5E9220();
  swift_endAccess();
  if (qword_26B178910 != -1) {
    swift_once();
  }
  uint64_t v33 = (void *)qword_26B178D28;
  uint64_t v34 = (void *)sub_24A5E9610();
  LOBYTE(v33) = objc_msgSend(v33, sel_BOOLForKey_, v34);

  swift_beginAccess();
  unsigned __int8 v54 = v33;
  sub_24A5E9220();
  swift_endAccess();
  sub_24A5E91F0();
  swift_retain_n();
  uint64_t v35 = sub_24A5E91E0();
  os_log_type_t v36 = sub_24A5E9770();
  if (os_log_type_enabled(v35, v36))
  {
    uint64_t v37 = (uint8_t *)swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    id v50 = v26;
    char v39 = (void *)v38;
    *(_DWORD *)uint64_t v37 = 138412290;
    uint64_t v52 = v25;
    uint64_t v40 = v2;
    uint64_t v41 = *(void **)(v1 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectiveStore);
    aBlock[0] = v41;
    id v42 = v41;
    sub_24A5E97A0();
    *char v39 = v41;
    uint64_t v2 = v40;
    swift_release_n();
    _os_log_impl(&dword_24A5D4000, v35, v36, "effective publisher: %@", v37, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B178970);
    swift_arrayDestroy();
    uint64_t v43 = v39;
    id v26 = v50;
    MEMORY[0x24C5C8D00](v43, -1, -1);
    MEMORY[0x24C5C8D00](v37, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  v26(v51, v2);
  char v44 = *(void **)(v1 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectivePublisher);
  aBlock[4] = sub_24A5E8290;
  aBlock[5] = v1;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24A5E12E8;
  aBlock[3] = &block_descriptor;
  uint64_t v45 = _Block_copy(aBlock);
  swift_retain();
  id v46 = v44;
  swift_release();
  id v47 = objc_msgSend(v46, sel_sinkWithReceiveInput_, v45);
  _Block_release(v45);

  *(void *)(v1 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectivePublisherSink) = v47;
  swift_unknownObjectRelease();
  sub_24A5E1398();
  return v1;
}

void sub_24A5E0B94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A5E9200();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v34 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v29 - v8;
  uint64_t v33 = "8D951C99FindClass";
  sub_24A5E91F0();
  swift_bridgeObjectRetain_n();
  uint64_t v10 = sub_24A5E91E0();
  os_log_type_t v11 = sub_24A5E9770();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v30 = v5;
    uint64_t v14 = v13;
    uint64_t v36 = v13;
    uint64_t v31 = v4;
    uint64_t v32 = a2;
    *(_DWORD *)uint64_t v12 = 136315138;
    type metadata accessor for Name(0);
    sub_24A5E8E08(&qword_26B178918, type metadata accessor for Name);
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_24A5E9730();
    unint64_t v17 = v16;
    swift_bridgeObjectRelease();
    uint64_t v35 = sub_24A5DBEDC(v15, v17, &v36);
    uint64_t v4 = v31;
    a2 = v32;
    sub_24A5E97A0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A5D4000, v10, v11, "effective store publisher updated: %s", v12, 0xCu);
    swift_arrayDestroy();
    uint64_t v18 = v14;
    uint64_t v5 = v30;
    MEMORY[0x24C5C8D00](v18, -1, -1);
    MEMORY[0x24C5C8D00](v12, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v19 = *(void (**)(char *, uint64_t))(v5 + 8);
  v19(v9, v4);
  id v20 = (id)*MEMORY[0x263F53E80];
  char v21 = sub_24A5E1120((uint64_t)v20, a1);

  if (v21)
  {
    sub_24A5E91F0();
    id v22 = sub_24A5E91E0();
    os_log_type_t v23 = sub_24A5E9770();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_24A5D4000, v22, v23, "updating our effective store", v24, 2u);
      MEMORY[0x24C5C8D00](v24, -1, -1);
    }

    v19(v34, v4);
    id v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F53ED0]), sel_init);
    id v26 = *(void **)(a2 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectiveStore);
    *(void *)(a2 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectiveStore) = v25;

    id v27 = objc_msgSend(self, sel_defaultCenter);
    id v28 = (void *)sub_24A5E9610();
    objc_msgSend(v27, sel_postNotificationName_object_, v28, a2);
  }
}

uint64_t sub_24A5E0FC0(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) != 0)
  {
    id v3 = a1;
    char v4 = sub_24A5E9800();

    return v4 & 1;
  }
  if (!*(void *)(a2 + 16)
    || (uint64_t v6 = sub_24A5E9780(),
        uint64_t v7 = -1 << *(unsigned char *)(a2 + 32),
        unint64_t v8 = v6 & ~v7,
        uint64_t v9 = a2 + 56,
        ((*(void *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0))
  {
LABEL_11:
    char v12 = 0;
    return v12 & 1;
  }
  sub_24A5E8FF8(0, (unint64_t *)&unk_26B1788F8);
  id v10 = *(id *)(*(void *)(a2 + 48) + 8 * v8);
  char v11 = sub_24A5E9790();

  if ((v11 & 1) == 0)
  {
    uint64_t v13 = ~v7;
    unint64_t v14 = (v8 + 1) & v13;
    if ((*(void *)(v9 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      do
      {
        id v15 = *(id *)(*(void *)(a2 + 48) + 8 * v14);
        char v12 = sub_24A5E9790();

        if (v12) {
          break;
        }
        unint64_t v14 = (v14 + 1) & v13;
      }
      while (((*(void *)(v9 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) != 0);
      return v12 & 1;
    }
    goto LABEL_11;
  }
  char v12 = 1;
  return v12 & 1;
}

uint64_t sub_24A5E1120(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16))
  {
    sub_24A5E9640();
    sub_24A5E99C0();
    sub_24A5E9670();
    uint64_t v3 = sub_24A5E99E0();
    swift_bridgeObjectRelease();
    uint64_t v4 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v5 = v3 & ~v4;
    uint64_t v6 = a2 + 56;
    if ((*(void *)(a2 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
    {
      uint64_t v7 = sub_24A5E9640();
      uint64_t v9 = v8;
      if (v7 == sub_24A5E9640() && v9 == v10)
      {
LABEL_17:
        swift_bridgeObjectRelease_n();
        goto LABEL_18;
      }
      char v12 = sub_24A5E99A0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v12)
      {
LABEL_18:
        char v20 = 1;
        return v20 & 1;
      }
      uint64_t v13 = ~v4;
      unint64_t v14 = (v5 + 1) & v13;
      if ((*(void *)(v6 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
      {
        while (1)
        {
          uint64_t v15 = sub_24A5E9640();
          uint64_t v17 = v16;
          if (v15 == sub_24A5E9640() && v17 == v18) {
            break;
          }
          char v20 = sub_24A5E99A0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v20 & 1) == 0)
          {
            unint64_t v14 = (v14 + 1) & v13;
            if ((*(void *)(v6 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14)) {
              continue;
            }
          }
          return v20 & 1;
        }
        goto LABEL_17;
      }
    }
  }
  char v20 = 0;
  return v20 & 1;
}

uint64_t sub_24A5E12E8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  type metadata accessor for Name(0);
  sub_24A5E8E08(&qword_26B178918, type metadata accessor for Name);
  uint64_t v2 = sub_24A5E9720();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A5E1398()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24A5E9200();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v153 = (char *)v149 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  v151 = (char *)v149 - v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v149 - v8;
  sub_24A5E91F0();
  swift_retain_n();
  uint64_t v10 = sub_24A5E91E0();
  os_log_type_t v11 = sub_24A5E9770();
  BOOL v12 = os_log_type_enabled(v10, v11);
  uint64_t v150 = v1;
  v156 = (void *)v2;
  uint64_t v154 = v3;
  v152 = "8D951C99FindClass";
  if (v12)
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315138;
    v158[0] = v14;
    id v157 = *(id *)(v1 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy);
    id v15 = v157;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B178940);
    uint64_t v16 = sub_24A5E9660();
    id v157 = (id)sub_24A5DBEDC(v16, v17, v158);
    uint64_t v1 = v150;
    sub_24A5E97A0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A5D4000, v10, v11, "reload entries from policy: %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5C8D00](v14, -1, -1);
    MEMORY[0x24C5C8D00](v13, -1, -1);

    v155 = *(void (**)(char *, void *))(v3 + 8);
    v155(v9, v156);
  }
  else
  {

    swift_release_n();
    v155 = *(void (**)(char *, void *))(v3 + 8);
    v155(v9, (void *)v2);
  }
  v162 = (void *)MEMORY[0x263F8EE78];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B178988);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24A5EAA80;
  id v19 = (void *)*MEMORY[0x263F53E90];
  *(void *)(inited + 32) = *MEMORY[0x263F53E90];
  char v20 = (void *)*MEMORY[0x263F53E98];
  char v21 = (void *)*MEMORY[0x263F53EA0];
  *(void *)(inited + 40) = *MEMORY[0x263F53E98];
  *(void *)(inited + 48) = v21;
  id v22 = (void *)*MEMORY[0x263F53EB0];
  *(void *)(inited + 56) = *MEMORY[0x263F53EB0];
  swift_retain();
  id v23 = v19;
  id v24 = v20;
  id v25 = v21;
  id v26 = v22;
  uint64_t v27 = sub_24A5E87B0(inited, v1, &v162);
  swift_release();
  swift_setDeallocating();
  type metadata accessor for MOUserSafetyScannableServices(0);
  v149[1] = v28;
  swift_arrayDestroy();
  v161 = (void *)v27;
  uint64_t v29 = v151;
  sub_24A5E91F0();
  swift_retain_n();
  uint64_t v30 = sub_24A5E91E0();
  os_log_type_t v31 = sub_24A5E9770();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    v158[0] = v33;
    *(_DWORD *)uint64_t v32 = 136315138;
    id v34 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectiveStore), sel_userSafety);
    id v35 = objc_msgSend(v34, sel_allowedClients);

    if (v35)
    {
      sub_24A5E8FF8(0, (unint64_t *)&unk_26B1788F8);
      sub_24A5E8DA0();
      uint64_t v36 = (void *)sub_24A5E9720();
    }
    else
    {
      uint64_t v36 = 0;
    }
    id v157 = v36;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1788E8);
    uint64_t v38 = sub_24A5E9660();
    id v157 = (id)sub_24A5DBEDC(v38, v39, v158);
    sub_24A5E97A0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A5D4000, v30, v31, "reload apps from effective store: %s", v32, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5C8D00](v33, -1, -1);
    MEMORY[0x24C5C8D00](v32, -1, -1);

    uint64_t v37 = v156;
    v155(v151, v156);
  }
  else
  {

    swift_release_n();
    uint64_t v37 = v156;
    v155(v29, v156);
  }
  uint64_t v40 = v153;
  unint64_t v160 = MEMORY[0x263F8EE78];
  id v41 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectiveStore), sel_userSafety);
  id v42 = objc_msgSend(v41, sel_allowedClients);

  if (v42)
  {
    sub_24A5E8FF8(0, (unint64_t *)&unk_26B1788F8);
    sub_24A5E8DA0();
    unint64_t v43 = sub_24A5E9720();
  }
  else
  {
    unint64_t v43 = MEMORY[0x263F8EE88];
  }
  swift_retain();
  sub_24A5E88B0(v43, v1, &v160);
  unint64_t v45 = v44;
  swift_bridgeObjectRelease();
  swift_release();
  unint64_t v159 = v45;
  sub_24A5E2E40(&v159);
  sub_24A5E91F0();
  id v46 = sub_24A5E91E0();
  os_log_type_t v47 = sub_24A5E9770();
  if (os_log_type_enabled(v46, v47))
  {
    uint64_t v48 = swift_slowAlloc();
    uint64_t v49 = swift_slowAlloc();
    v158[0] = v49;
    *(_DWORD *)uint64_t v48 = 136315394;
    swift_beginAccess();
    uint64_t v50 = type metadata accessor for NudityDetectionEntry(0);
    uint64_t v51 = swift_bridgeObjectRetain();
    uint64_t v52 = MEMORY[0x24C5C8490](v51, v50);
    unint64_t v54 = v53;
    swift_bridgeObjectRelease();
    id v157 = (id)sub_24A5DBEDC(v52, v54, v158);
    sub_24A5E97A0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v48 + 12) = 2080;
    swift_beginAccess();
    uint64_t v55 = swift_bridgeObjectRetain();
    uint64_t v56 = MEMORY[0x24C5C8490](v55, v50);
    unint64_t v58 = v57;
    swift_bridgeObjectRelease();
    id v157 = (id)sub_24A5DBEDC(v56, v58, v158);
    sub_24A5E97A0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A5D4000, v46, v47, "loadedServices: %s,\napps: %s", (uint8_t *)v48, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C5C8D00](v49, -1, -1);
    MEMORY[0x24C5C8D00](v48, -1, -1);

    uint64_t v59 = v153;
    uint64_t v60 = v156;
  }
  else
  {

    uint64_t v59 = v40;
    uint64_t v60 = v37;
  }
  v155(v59, v60);
  swift_beginAccess();
  swift_beginAccess();
  unint64_t v61 = swift_bridgeObjectRetain();
  sub_24A5E2EC8(v61);
  swift_endAccess();
  uint64_t v62 = v161;
  swift_getKeyPath();
  swift_getKeyPath();
  id v157 = v62;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_24A5E9240();
  if (v160 >> 62) {
    goto LABEL_93;
  }
  if (!*(void *)((v160 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_95:
    swift_bridgeObjectRelease();
LABEL_98:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  while (1)
  {
    uint64_t v63 = OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy;
    uint64_t v64 = *(void **)(v1 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy);
    if (v64 && (id v65 = objc_msgSend(v64, sel_allServices)) != 0)
    {
      v66 = v65;
      sub_24A5E8FF8(0, (unint64_t *)&unk_2697A6F80);
      sub_24A5E8E08((unint64_t *)&unk_2697A6F90, type metadata accessor for MOUserSafetyScannableServices);
      v156 = (void *)sub_24A5E95A0();
    }
    else
    {
      v156 = (void *)sub_24A5E3094(MEMORY[0x263F8EE78]);
    }
    v152 = (char *)v63;
    v67 = *(void **)(v1 + v63);
    if (v67 && (id v68 = objc_msgSend(v67, sel_allApplications)) != 0)
    {
      v69 = v68;
      sub_24A5E8FF8(0, (unint64_t *)&unk_26B1788F8);
      sub_24A5E8FF8(0, (unint64_t *)&unk_2697A6F80);
      sub_24A5E8DA0();
      uint64_t v70 = sub_24A5E95A0();
    }
    else
    {
      uint64_t v70 = sub_24A5E31A0(MEMORY[0x263F8EE78]);
    }
    v71 = v162;
    v155 = (void (*)(char *, void *))v162[2];
    if (v155) {
      break;
    }
LABEL_47:
    unint64_t v100 = v160;
    if (v160 >> 62)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v101 = sub_24A5E9920();
      swift_bridgeObjectRelease();
      if (!v101)
      {
LABEL_97:
        swift_bridgeObjectRelease();
        v139 = self;
        sub_24A5E8FF8(0, (unint64_t *)&unk_2697A6F80);
        sub_24A5E8E08((unint64_t *)&unk_2697A6F90, type metadata accessor for MOUserSafetyScannableServices);
        v140 = (void *)sub_24A5E9590();
        swift_bridgeObjectRelease();
        sub_24A5E8FF8(0, (unint64_t *)&unk_26B1788F8);
        sub_24A5E8DA0();
        v141 = (void *)sub_24A5E9590();
        swift_bridgeObjectRelease();
        id v142 = objc_msgSend(v139, sel_nudityDetectionPolicyWithAllServices_allApplications_, v140, v141);

        uint64_t v143 = v150;
        v144 = v152;
        v145 = *(void **)&v152[v150];
        *(void *)&v152[v150] = v142;

        id v146 = objc_msgSend(*(id *)(v143 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_localStore), sel_userSafety);
        id v147 = *(id *)&v144[v143];
        objc_msgSend(v146, sel_setScanningPolicy_, v147);

        swift_bridgeObjectRelease();
        goto LABEL_98;
      }
    }
    else
    {
      uint64_t v101 = *(void *)((v160 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v101) {
        goto LABEL_97;
      }
    }
    v155 = (void (*)(char *, void *))(v100 & 0xC000000000000001);
    uint64_t v1 = 4;
    uint64_t v154 = v100;
    v153 = (char *)v101;
    while (1)
    {
      id v103 = v155 ? (id)MEMORY[0x24C5C8620](v1 - 4, v100) : *(id *)(v100 + 8 * v1);
      v104 = v103;
      uint64_t v105 = v1 - 3;
      if (__OFADD__(v1 - 4, 1)) {
        break;
      }
      id v106 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, 1);
      unint64_t v107 = v70 & 0xC000000000000001;
      if (v106)
      {
        id v108 = v106;
        if (v107)
        {
          if (v70 < 0) {
            uint64_t v109 = v70;
          }
          else {
            uint64_t v109 = v70 & 0xFFFFFFFFFFFFFF8;
          }
          uint64_t v110 = sub_24A5E98E0();
          if (__OFADD__(v110, 1)) {
            goto LABEL_89;
          }
          uint64_t v70 = sub_24A5E5A38(v109, v110 + 1);
        }
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        id v157 = (id)v70;
        unint64_t v113 = sub_24A5E56D0((uint64_t)v104);
        uint64_t v114 = *(void *)(v70 + 16);
        BOOL v115 = (v112 & 1) == 0;
        uint64_t v116 = v114 + v115;
        if (__OFADD__(v114, v115)) {
          goto LABEL_88;
        }
        char v117 = v112;
        if (*(void *)(v70 + 24) >= v116)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
            sub_24A5E6C88();
          }
        }
        else
        {
          sub_24A5E5C8C(v116, isUniquelyReferenced_nonNull_native);
          unint64_t v118 = sub_24A5E56D0((uint64_t)v104);
          if ((v117 & 1) != (v119 & 1)) {
            goto LABEL_100;
          }
          unint64_t v113 = v118;
        }
        uint64_t v70 = (uint64_t)v157;
        if (v117)
        {
          uint64_t v102 = *((void *)v157 + 7);

          *(void *)(v102 + 8 * v113) = v108;
        }
        else
        {
          *((void *)v157 + (v113 >> 6) + 8) |= 1 << v113;
          *(void *)(*(void *)(v70 + 48) + 8 * v113) = v104;
          *(void *)(*(void *)(v70 + 56) + 8 * v113) = v108;
          uint64_t v129 = *(void *)(v70 + 16);
          BOOL v97 = __OFADD__(v129, 1);
          uint64_t v130 = v129 + 1;
          if (v97) {
            goto LABEL_91;
          }
          *(void *)(v70 + 16) = v130;
          id v131 = v104;
        }

        swift_bridgeObjectRelease();
        unint64_t v100 = v154;
        uint64_t v101 = (uint64_t)v153;
      }
      else if (v107)
      {
        if (v70 < 0) {
          uint64_t v120 = v70;
        }
        else {
          uint64_t v120 = v70 & 0xFFFFFFFFFFFFFF8;
        }
        id v121 = v104;
        swift_bridgeObjectRetain();
        uint64_t v122 = sub_24A5E98F0();

        if (v122)
        {
          swift_unknownObjectRelease();
          uint64_t v123 = sub_24A5E98E0();
          uint64_t v124 = sub_24A5E5A38(v120, v123);
          swift_retain();
          unint64_t v125 = sub_24A5E56D0((uint64_t)v121);
          char v127 = v126;
          swift_release();
          if ((v127 & 1) == 0) {
            goto LABEL_92;
          }

          v128 = *(void **)(*(void *)(v124 + 56) + 8 * v125);
          sub_24A5E6290(v125, v124);

          swift_bridgeObjectRelease();
          uint64_t v70 = v124;
        }
        else
        {

          swift_bridgeObjectRelease();
        }
      }
      else
      {
        swift_bridgeObjectRetain();
        unint64_t v132 = sub_24A5E56D0((uint64_t)v104);
        char v134 = v133;
        swift_bridgeObjectRelease();
        if (v134)
        {
          char v135 = swift_isUniquelyReferenced_nonNull_native();
          id v157 = (id)v70;
          if ((v135 & 1) == 0)
          {
            sub_24A5E6C88();
            uint64_t v70 = (uint64_t)v157;
          }

          v136 = *(void **)(*(void *)(v70 + 56) + 8 * v132);
          sub_24A5E6290(v132, v70);

          swift_bridgeObjectRelease();
        }
        else
        {
        }
      }
      ++v1;
      if (v105 == v101) {
        goto LABEL_97;
      }
    }
    __break(1u);
LABEL_87:
    __break(1u);
LABEL_88:
    __break(1u);
LABEL_89:
    __break(1u);
LABEL_90:
    __break(1u);
LABEL_91:
    __break(1u);
LABEL_92:
    __break(1u);
LABEL_93:
    swift_bridgeObjectRetain();
    uint64_t v137 = sub_24A5E9920();
    swift_bridgeObjectRelease();
    if (!v137)
    {
      swift_bridgeObjectRetain();
      uint64_t v138 = sub_24A5E9920();
      swift_bridgeObjectRelease();
      if (!v138) {
        goto LABEL_95;
      }
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v72 = 0;
  while (1)
  {
    v74 = (void *)v71[v72 + 4];
    id v75 = objc_allocWithZone(NSNumber);
    uint64_t v1 = v74;
    id v76 = objc_msgSend(v75, sel_initWithBool_, 1);
    if (v76) {
      break;
    }
    swift_bridgeObjectRetain();
    unint64_t v88 = sub_24A5E5714(v1);
    char v90 = v89;
    swift_bridgeObjectRelease();
    if ((v90 & 1) == 0)
    {

      goto LABEL_30;
    }
    v91 = v156;
    char v92 = swift_isUniquelyReferenced_nonNull_native();
    id v157 = v91;
    if ((v92 & 1) == 0)
    {
      sub_24A5E6E30();
      v156 = v157;
    }
    uint64_t v93 = (uint64_t)v156;

    v94 = *(void **)(*(void *)(v93 + 56) + 8 * v88);
    sub_24A5E6444(v88, v93);

LABEL_29:
    swift_bridgeObjectRelease();
LABEL_30:
    if (v155 == (void (*)(char *, void *))++v72)
    {
      swift_bridgeObjectRelease();
      goto LABEL_47;
    }
  }
  id v77 = v76;
  v78 = v156;
  char v79 = swift_isUniquelyReferenced_nonNull_native();
  id v157 = v78;
  unint64_t v81 = sub_24A5E5714(v1);
  uint64_t v82 = v78[2];
  BOOL v83 = (v80 & 1) == 0;
  uint64_t v84 = v82 + v83;
  if (__OFADD__(v82, v83)) {
    goto LABEL_87;
  }
  char v85 = v80;
  if (v156[3] >= v84)
  {
    if ((v79 & 1) == 0) {
      sub_24A5E6E30();
    }
LABEL_42:
    v156 = v157;
    if (v85)
    {
      uint64_t v73 = v156[7];

      *(void *)(v73 + 8 * v81) = v77;
    }
    else
    {
      v95 = v156;
      v156[(v81 >> 6) + 8] |= 1 << v81;
      *(void *)(v95[6] + 8 * v81) = v1;
      *(void *)(v95[7] + 8 * v81) = v77;
      uint64_t v96 = v95[2];
      BOOL v97 = __OFADD__(v96, 1);
      uint64_t v98 = v96 + 1;
      if (v97) {
        goto LABEL_90;
      }
      v156[2] = v98;
      id v99 = (id)v1;
    }
    goto LABEL_29;
  }
  sub_24A5E5F60(v84, v79);
  unint64_t v86 = sub_24A5E5714(v1);
  if ((v85 & 1) == (v87 & 1))
  {
    unint64_t v81 = v86;
    goto LABEL_42;
  }
  sub_24A5E99B0();
  __break(1u);
LABEL_100:
  sub_24A5E8FF8(0, (unint64_t *)&unk_26B1788F8);
  uint64_t result = sub_24A5E99B0();
  __break(1u);
  return result;
}

uint64_t sub_24A5E2638@<X0>(void **a1@<X0>, uint64_t a2@<X1>, void **a3@<X2>, void *a4@<X8>)
{
  uint64_t v6 = *a1;
  uint64_t v7 = OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy;
  uint64_t v8 = *(void **)(a2 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy);
  if (v8)
  {
    id v9 = objc_msgSend(v8, sel_allServices);
    if (v9)
    {
      uint64_t v10 = v9;
      type metadata accessor for MOUserSafetyScannableServices(0);
      sub_24A5E8FF8(0, (unint64_t *)&unk_2697A6F80);
      sub_24A5E8E08((unint64_t *)&unk_2697A6F90, type metadata accessor for MOUserSafetyScannableServices);
      uint64_t v11 = sub_24A5E95A0();

      if (*(void *)(v11 + 16))
      {
        id v12 = v6;
        sub_24A5E5714((uint64_t)v12);
        char v14 = v13;

        if (v14)
        {
          swift_bridgeObjectRelease();
          goto LABEL_12;
        }
      }
      swift_bridgeObjectRelease();
    }
  }
  id v15 = *a3;
  id v16 = v6;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a3 = v15;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    id v15 = sub_24A5E55C0(0, v15[2] + 1, 1, v15);
    *a3 = v15;
  }
  unint64_t v19 = v15[2];
  unint64_t v18 = v15[3];
  if (v19 >= v18 >> 1) {
    id v15 = sub_24A5E55C0((void *)(v18 > 1), v19 + 1, 1, v15);
  }
  v15[2] = v19 + 1;
  v15[v19 + 4] = v16;
  *a3 = v15;
LABEL_12:
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a2;
  *(void *)(v20 + 24) = v6;
  char v21 = *(void **)(a2 + v7);
  if (!v21)
  {
    id v30 = v6;
    swift_retain();
    goto LABEL_20;
  }
  id v22 = v6;
  swift_retain();
  id v23 = objc_msgSend(v21, sel_allServices);
  if (v23)
  {
    id v24 = v23;
    type metadata accessor for MOUserSafetyScannableServices(0);
    sub_24A5E8FF8(0, (unint64_t *)&unk_2697A6F80);
    sub_24A5E8E08((unint64_t *)&unk_2697A6F90, type metadata accessor for MOUserSafetyScannableServices);
    uint64_t v25 = sub_24A5E95A0();

    if (*(void *)(v25 + 16))
    {
      id v26 = v22;
      unint64_t v27 = sub_24A5E5714((uint64_t)v26);
      if (v28)
      {
        id v29 = *(id *)(*(void *)(v25 + 56) + 8 * v27);

        swift_bridgeObjectRelease();
        objc_msgSend(v29, sel_BOOLValue);

        goto LABEL_20;
      }
    }
    swift_bridgeObjectRelease();
  }
LABEL_20:
  type metadata accessor for NudityDetectionSystemService(0);
  os_log_type_t v31 = (void *)swift_allocObject();
  *(void *)((char *)v31 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI28NudityDetectionSystemService_service) = v6;
  uint64_t v32 = sub_24A5E9640();
  uint64_t v34 = v33;
  v31[2] = 0;
  v31[3] = 0xE000000000000000;
  id v35 = v6;
  swift_retain();
  swift_bridgeObjectRelease();
  v31[4] = sub_24A5E90FC;
  v31[5] = v20;
  swift_beginAccess();
  swift_retain();
  sub_24A5E9220();
  swift_endAccess();
  uint64_t v36 = (void *)((char *)v31 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI20NudityDetectionEntry_defaultsKey);
  *uint64_t v36 = v32;
  v36[1] = v34;
  swift_release();
  swift_retain();
  unint64_t v37 = sub_24A5D8044();
  uint64_t v39 = v38;
  swift_release();
  v31[2] = v37;
  v31[3] = v39;
  swift_release();
  uint64_t result = swift_bridgeObjectRelease();
  *a4 = v31;
  return result;
}

void *sub_24A5E2A40(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(void *)(a2 + 16))
    {
      unint64_t v6 = sub_24A5E56D0((uint64_t)a1);
      if (v7)
      {
        uint64_t v5 = *(void **)(*(void *)(a2 + 56) + 8 * v6);
        id v8 = v5;
        return v5;
      }
    }
    return 0;
  }
  id v3 = a1;
  uint64_t v4 = sub_24A5E98F0();

  if (!v4) {
    return 0;
  }
  sub_24A5E8FF8(0, (unint64_t *)&unk_2697A6F80);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  uint64_t v5 = v10;
  swift_unknownObjectRelease();
  return v5;
}

id sub_24A5E2B18@<X0>(id *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, void *a4@<X8>)
{
  id v8 = *a1;
  id result = objc_msgSend(*a1, sel_bundleIdentifier);
  if (result)
  {
    uint64_t v10 = result;
    sub_24A5E9640();

    sub_24A5E8FF8(0, (unint64_t *)&unk_2697A7020);
    id result = sub_24A5DF9F4();
    if (v4)
    {

      id result = 0;
      goto LABEL_19;
    }
    if (!result) {
      goto LABEL_19;
    }

    uint64_t v11 = OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy;
    id v12 = *(void **)(a2 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy);
    unint64_t v13 = 0x265288000uLL;
    if (!v12) {
      goto LABEL_9;
    }
    id v14 = objc_msgSend(v12, sel_allApplications);
    if (!v14) {
      goto LABEL_9;
    }
    id v15 = v14;
    sub_24A5E8FF8(0, (unint64_t *)&unk_26B1788F8);
    sub_24A5E8FF8(0, (unint64_t *)&unk_2697A6F80);
    sub_24A5E8DA0();
    uint64_t v16 = sub_24A5E95A0();

    id v17 = v8;
    unint64_t v18 = sub_24A5E2A40(v17, v16);

    unint64_t v13 = 0x265288000;
    swift_bridgeObjectRelease();
    if (v18)
    {
    }
    else
    {
LABEL_9:
      id v19 = v8;
      MEMORY[0x24C5C8480]();
      if (*(void *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      {
        sub_24A5E96D0();
        unint64_t v13 = 0x265288000;
      }
      sub_24A5E96F0();
      sub_24A5E96C0();
    }
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = a2;
    *(void *)(v20 + 24) = v8;
    char v21 = *(void **)(a2 + v11);
    if (v21)
    {
      id v22 = v8;
      swift_retain();
      id v23 = [v21 *(SEL *)(v13 + 2872)];
      if (v23)
      {
        id v24 = v23;
        sub_24A5E8FF8(0, (unint64_t *)&unk_26B1788F8);
        sub_24A5E8FF8(0, (unint64_t *)&unk_2697A6F80);
        sub_24A5E8DA0();
        uint64_t v25 = sub_24A5E95A0();

        id v26 = v22;
        unint64_t v27 = sub_24A5E2A40(v26, v25);

        swift_bridgeObjectRelease();
        if (v27)
        {
          uint64_t v28 = (uint64_t)objc_msgSend(v27, sel_BOOLValue);

LABEL_18:
          type metadata accessor for NudityDetectionApp(0);
          swift_allocObject();
          id result = sub_24A5DF614((uint64_t)sub_24A5E9038, v20, v28, v8);
          goto LABEL_19;
        }
      }
    }
    else
    {
      id v29 = v8;
      swift_retain();
    }
    uint64_t v28 = 1;
    goto LABEL_18;
  }
LABEL_19:
  *a4 = result;
  return result;
}

uint64_t sub_24A5E2E40(unint64_t *a1)
{
  unint64_t v2 = *a1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *a1 = v2;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v2 & 0x8000000000000000) != 0
    || (v2 & 0x4000000000000000) != 0)
  {
    sub_24A5E7FE4(v2);
    unint64_t v2 = v4;
    *a1 = v4;
  }
  uint64_t v5 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v7[0] = (v2 & 0xFFFFFFFFFFFFFF8) + 32;
  v7[1] = v5;
  sub_24A5E6FD8(v7);
  return sub_24A5E96C0();
}

uint64_t sub_24A5E2EC8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_24A5E9920();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_24A5E9920();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x24C5C8630](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_24A5E7DC0(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_24A5E9920();
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
  return sub_24A5E96C0();
}

unint64_t sub_24A5E3094(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6FA8);
  unint64_t v2 = (void *)sub_24A5E9960();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unint64_t v4 = (void **)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = *(v4 - 1);
    id v7 = v5;
    unint64_t result = sub_24A5E5714((uint64_t)v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v2[6] + v10) = v6;
    *(void *)(v2[7] + v10) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 2;
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

unint64_t sub_24A5E31A0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6FA0);
  unint64_t v2 = (void *)sub_24A5E9960();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unint64_t v4 = (void **)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = *(v4 - 1);
    id v7 = v5;
    unint64_t result = sub_24A5E56D0((uint64_t)v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v2[6] + v10) = v6;
    *(void *)(v2[7] + v10) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 2;
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

unint64_t sub_24A5E32AC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697A6FC0);
  unint64_t v2 = (void *)sub_24A5E9960();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    id v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_24A5E57A8(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
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

void sub_24A5E33C8(int a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24A5E9200();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v96 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A5E91F0();
  id v8 = sub_24A5E91E0();
  os_log_type_t v9 = sub_24A5E9770();
  BOOL v10 = os_log_type_enabled(v8, v9);
  int v98 = a1;
  uint64_t v99 = v2;
  if (v10)
  {
    char v11 = a1;
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315138;
    aBlock[0] = v13;
    if (v11) {
      uint64_t v14 = 0x64656C62616E65;
    }
    else {
      uint64_t v14 = 0x64656C6261736964;
    }
    if (v11) {
      unint64_t v15 = 0xE700000000000000;
    }
    else {
      unint64_t v15 = 0xE800000000000000;
    }
    uint64_t v103 = sub_24A5DBEDC(v14, v15, aBlock);
    sub_24A5E97A0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A5D4000, v8, v9, "toggle all %s", v12, 0xCu);
    swift_arrayDestroy();
    uint64_t v16 = v13;
    uint64_t v2 = v99;
    MEMORY[0x24C5C8D00](v16, -1, -1);
    MEMORY[0x24C5C8D00](v12, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t KeyPath = OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy;
  unint64_t v18 = *(void **)(v2 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy);
  unint64_t v19 = 0x26B178000;
  if (v18 && objc_msgSend(v18, sel_policy)) {
    goto LABEL_79;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24A5E9230();
  swift_release();
  swift_release();
  uint64_t v20 = aBlock[0];
  if ((unint64_t)aBlock[0] >> 62) {
    goto LABEL_77;
  }
  uint64_t v21 = *(void *)((aBlock[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v97 = KeyPath;
  if (!v21)
  {
LABEL_78:
    swift_bridgeObjectRelease();
    uint64_t v84 = self;
    type metadata accessor for MOUserSafetyScannableServices(0);
    sub_24A5E8FF8(0, (unint64_t *)&unk_2697A6F80);
    sub_24A5E8E08((unint64_t *)&unk_2697A6F90, type metadata accessor for MOUserSafetyScannableServices);
    char v85 = (void *)sub_24A5E9590();
    swift_bridgeObjectRelease();
    sub_24A5E8FF8(0, (unint64_t *)&unk_26B1788F8);
    sub_24A5E8DA0();
    unint64_t v86 = (void *)sub_24A5E9590();
    swift_bridgeObjectRelease();
    id v87 = objc_msgSend(v84, sel_nudityDetectionPolicyWithAllServices_allApplications_, v85, v86);

    uint64_t v2 = v99;
    uint64_t v88 = v97;
    char v89 = *(void **)(v99 + v97);
    *(void *)(v99 + v97) = v87;

    unint64_t v19 = 0x26B178000uLL;
    id v90 = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_localStore), sel_userSafety);
    id v91 = *(id *)(v2 + v88);
    objc_msgSend(v90, sel_setScanningPolicy_, v91);

LABEL_79:
    char v92 = v98 & 1;
    objc_msgSend(*(id *)(v2 + *(void *)(v19 + 3320)), sel_setActive_, v98 & 1);
    uint64_t v93 = (void *)sub_24A5E9610();
    uint64_t v94 = swift_allocObject();
    *(unsigned char *)(v94 + 16) = v92;
    aBlock[4] = (uint64_t)sub_24A5E8E60;
    aBlock[5] = v94;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_24A5E3FE0;
    aBlock[3] = (uint64_t)&block_descriptor_108;
    v95 = _Block_copy(aBlock);
    swift_release();
    AnalyticsSendEventLazy();
    _Block_release(v95);

    return;
  }
  while (v21 >= 1)
  {
    uint64_t v22 = 0;
    unint64_t v102 = v20 & 0xC000000000000001;
    uint64_t v23 = MEMORY[0x263F8EE80];
    id v24 = (void *)MEMORY[0x263F8EE80];
    uint64_t v100 = v20;
    uint64_t v101 = v21;
    while (1)
    {
      if (v102)
      {
        uint64_t v27 = MEMORY[0x24C5C8620](v22, v20);
      }
      else
      {
        uint64_t v27 = *(void *)(v20 + 8 * v22 + 32);
        swift_retain();
      }
      type metadata accessor for NudityDetectionSystemService(0);
      uint64_t v28 = swift_dynamicCastClass();
      if (!v28) {
        goto LABEL_40;
      }
      id v29 = *(void **)(v28 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI28NudityDetectionSystemService_service);
      id v30 = objc_allocWithZone(NSNumber);
      swift_retain();
      id v31 = v29;
      id v32 = objc_msgSend(v30, sel_initWithBool_, 1);
      if (v32) {
        break;
      }
      swift_bridgeObjectRetain();
      unint64_t v41 = sub_24A5E5714((uint64_t)v31);
      char v43 = v42;
      swift_bridgeObjectRelease();
      if (v43)
      {
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        aBlock[0] = (uint64_t)v24;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_24A5E6E30();
          id v24 = (void *)aBlock[0];
        }

        unint64_t v45 = *(void **)(v24[7] + 8 * v41);
        sub_24A5E6444(v41, (uint64_t)v24);
        swift_release();

        swift_bridgeObjectRelease();
      }
      else
      {
        swift_release();
      }
LABEL_40:
      type metadata accessor for NudityDetectionApp(0);
      uint64_t v52 = swift_dynamicCastClass();
      if (v52)
      {
        unint64_t v53 = *(void **)(v52 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI18NudityDetectionApp_application);
        id v54 = objc_allocWithZone(NSNumber);
        swift_retain();
        id v55 = v53;
        id v56 = objc_msgSend(v54, sel_initWithBool_, 1);
        unint64_t v57 = v23 & 0xC000000000000001;
        if (v56)
        {
          id v58 = v56;
          if (v57)
          {
            if (v23 < 0) {
              uint64_t v59 = v23;
            }
            else {
              uint64_t v59 = v23 & 0xFFFFFFFFFFFFFF8;
            }
            uint64_t v60 = sub_24A5E98E0();
            if (__OFADD__(v60, 1)) {
              goto LABEL_73;
            }
            uint64_t v23 = sub_24A5E5A38(v59, v60 + 1);
          }
          uint64_t KeyPath = swift_isUniquelyReferenced_nonNull_native();
          aBlock[0] = v23;
          unint64_t v62 = sub_24A5E56D0((uint64_t)v55);
          uint64_t v63 = *(void *)(v23 + 16);
          BOOL v64 = (v61 & 1) == 0;
          uint64_t v65 = v63 + v64;
          if (__OFADD__(v63, v64)) {
            goto LABEL_72;
          }
          uint64_t v20 = v61;
          if (*(void *)(v23 + 24) >= v65)
          {
            if ((KeyPath & 1) == 0) {
              sub_24A5E6C88();
            }
          }
          else
          {
            sub_24A5E5C8C(v65, KeyPath);
            unint64_t v66 = sub_24A5E56D0((uint64_t)v55);
            if ((v20 & 1) != (v67 & 1)) {
              goto LABEL_82;
            }
            unint64_t v62 = v66;
          }
          uint64_t v23 = aBlock[0];
          if (v20)
          {
            uint64_t v25 = *(void *)(aBlock[0] + 56);

            *(void *)(v25 + 8 * v62) = v58;
          }
          else
          {
            *(void *)(aBlock[0] + 8 * (v62 >> 6) + 64) |= 1 << v62;
            *(void *)(*(void *)(v23 + 48) + 8 * v62) = v55;
            *(void *)(*(void *)(v23 + 56) + 8 * v62) = v58;
            uint64_t v76 = *(void *)(v23 + 16);
            BOOL v49 = __OFADD__(v76, 1);
            uint64_t v77 = v76 + 1;
            if (v49) {
              goto LABEL_75;
            }
            *(void *)(v23 + 16) = v77;
            id v78 = v55;
          }
          swift_release();

          swift_bridgeObjectRelease();
          uint64_t v20 = v100;
        }
        else
        {
          if (!v57)
          {
            swift_bridgeObjectRetain();
            unint64_t v79 = sub_24A5E56D0((uint64_t)v55);
            char v81 = v80;
            swift_bridgeObjectRelease();
            if ((v81 & 1) == 0)
            {
              swift_release();

              goto LABEL_17;
            }
            char v82 = swift_isUniquelyReferenced_nonNull_native();
            aBlock[0] = v23;
            if ((v82 & 1) == 0)
            {
              sub_24A5E6C88();
              uint64_t v23 = aBlock[0];
            }

            BOOL v83 = *(void **)(*(void *)(v23 + 56) + 8 * v79);
            sub_24A5E6290(v79, v23);
            swift_release();

            goto LABEL_69;
          }
          if (v23 < 0) {
            uint64_t v68 = v23;
          }
          else {
            uint64_t v68 = v23 & 0xFFFFFFFFFFFFFF8;
          }
          id v69 = v55;
          swift_bridgeObjectRetain();
          uint64_t v70 = sub_24A5E98F0();

          if (!v70)
          {
            swift_release();

LABEL_69:
            swift_bridgeObjectRelease();
            goto LABEL_17;
          }
          swift_unknownObjectRelease();
          uint64_t v71 = sub_24A5E98E0();
          uint64_t v72 = sub_24A5E5A38(v68, v71);
          swift_retain();
          uint64_t KeyPath = sub_24A5E56D0((uint64_t)v69);
          char v74 = v73;
          swift_release();
          if ((v74 & 1) == 0) {
            goto LABEL_76;
          }

          id v75 = *(void **)(*(void *)(v72 + 56) + 8 * KeyPath);
          sub_24A5E6290(KeyPath, v72);
          swift_release();

          swift_bridgeObjectRelease();
          uint64_t v23 = v72;
        }
      }
LABEL_17:
      ++v22;
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(aBlock[0]) = 1;
      swift_retain();
      sub_24A5E9240();
      id v26 = *(void (**)(void))(v27 + 32);
      swift_getKeyPath();
      uint64_t KeyPath = swift_getKeyPath();
      swift_retain();
      sub_24A5E9230();
      swift_release();
      swift_release();
      v26(LOBYTE(aBlock[0]));
      swift_release();
      swift_release();
      if (v101 == v22) {
        goto LABEL_78;
      }
    }
    id v33 = v32;
    uint64_t KeyPath = swift_isUniquelyReferenced_nonNull_native();
    aBlock[0] = (uint64_t)v24;
    unint64_t v35 = sub_24A5E5714((uint64_t)v31);
    uint64_t v36 = v24[2];
    BOOL v37 = (v34 & 1) == 0;
    uint64_t v38 = v36 + v37;
    if (!__OFADD__(v36, v37))
    {
      uint64_t v20 = v34;
      if (v24[3] >= v38)
      {
        if (KeyPath)
        {
          id v24 = (void *)aBlock[0];
          if ((v34 & 1) == 0) {
            goto LABEL_37;
          }
        }
        else
        {
          sub_24A5E6E30();
          id v24 = (void *)aBlock[0];
          if ((v20 & 1) == 0) {
            goto LABEL_37;
          }
        }
      }
      else
      {
        sub_24A5E5F60(v38, KeyPath);
        unint64_t v39 = sub_24A5E5714((uint64_t)v31);
        if ((v20 & 1) != (v40 & 1)) {
          goto LABEL_81;
        }
        unint64_t v35 = v39;
        id v24 = (void *)aBlock[0];
        if ((v20 & 1) == 0)
        {
LABEL_37:
          v24[(v35 >> 6) + 8] |= 1 << v35;
          uint64_t v47 = 8 * v35;
          *(void *)(v24[6] + v47) = v31;
          *(void *)(v24[7] + v47) = v33;
          uint64_t v48 = v24[2];
          BOOL v49 = __OFADD__(v48, 1);
          uint64_t v50 = v48 + 1;
          if (v49) {
            goto LABEL_74;
          }
          v24[2] = v50;
          id v51 = v31;
          goto LABEL_39;
        }
      }
      uint64_t v46 = v24[7];
      uint64_t KeyPath = 8 * v35;

      *(void *)(v46 + 8 * v35) = v33;
LABEL_39:
      swift_release();

      swift_bridgeObjectRelease();
      uint64_t v20 = v100;
      goto LABEL_40;
    }
    __break(1u);
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
LABEL_74:
    __break(1u);
LABEL_75:
    __break(1u);
LABEL_76:
    __break(1u);
LABEL_77:
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_24A5E9920();
    swift_bridgeObjectRelease();
    uint64_t v97 = KeyPath;
    if (!v21) {
      goto LABEL_78;
    }
  }
  __break(1u);
LABEL_81:
  type metadata accessor for MOUserSafetyScannableServices(0);
  sub_24A5E99B0();
  __break(1u);
LABEL_82:
  sub_24A5E8FF8(0, (unint64_t *)&unk_26B1788F8);
  sub_24A5E99B0();
  __break(1u);
}

unint64_t sub_24A5E3F54(char a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6FB8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24A5EAA70;
  *(void *)(inited + 32) = 0x64656C62616E65;
  *(void *)(inited + 40) = 0xE700000000000000;
  *(void *)(inited + 48) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, a1 & 1);
  return sub_24A5E32AC(inited);
}

id sub_24A5E3FE0(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_24A5E8FF8(0, &qword_2697A6FB0);
    uint64_t v4 = (void *)sub_24A5E9590();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

void sub_24A5E407C(void *a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_24A5E9200();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  os_log_type_t v9 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A5E91F0();
  id v10 = a1;
  char v11 = sub_24A5E91E0();
  os_log_type_t v12 = sub_24A5E9770();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v46 = v6;
    uint64_t v14 = v13;
    uint64_t v45 = swift_slowAlloc();
    uint64_t v49 = v45;
    *(_DWORD *)uint64_t v14 = 136315394;
    uint64_t v15 = sub_24A5E9640();
    char v16 = a2;
    uint64_t v18 = sub_24A5DBEDC(v15, v17, &v49);
    uint64_t v47 = v3;
    uint64_t v48 = v18;
    sub_24A5E97A0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    if (a2) {
      uint64_t v19 = 0x64656C62616E65;
    }
    else {
      uint64_t v19 = 0x64656C6261736964;
    }
    if (a2) {
      unint64_t v20 = 0xE700000000000000;
    }
    else {
      unint64_t v20 = 0xE800000000000000;
    }
    uint64_t v48 = sub_24A5DBEDC(v19, v20, &v49);
    uint64_t v3 = v47;
    sub_24A5E97A0();
    a2 = v16;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A5D4000, v11, v12, "toggle service %s: %s", (uint8_t *)v14, 0x16u);
    uint64_t v21 = v45;
    swift_arrayDestroy();
    MEMORY[0x24C5C8D00](v21, -1, -1);
    MEMORY[0x24C5C8D00](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v46);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  uint64_t v22 = OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy;
  uint64_t v23 = *(void **)(v3 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy);
  if (v23)
  {
    id v24 = v23;
    if (objc_msgSend(v24, sel_policy) == (id)1)
    {
      id v25 = objc_msgSend(v24, sel_allServices);
      if (v25)
      {
        id v26 = v25;
        uint64_t v47 = v3;
        type metadata accessor for MOUserSafetyScannableServices(0);
        sub_24A5E8FF8(0, (unint64_t *)&unk_2697A6F80);
        sub_24A5E8E08((unint64_t *)&unk_2697A6F90, type metadata accessor for MOUserSafetyScannableServices);
        uint64_t v27 = sub_24A5E95A0();

        uint64_t v49 = v27;
        id v28 = objc_allocWithZone(NSNumber);
        id v29 = v10;
        id v30 = objc_msgSend(v28, sel_initWithBool_, a2 & 1);
        if (v30)
        {
          uint64_t v31 = (uint64_t)v30;
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v48 = v27;
          sub_24A5E67AC(v31, v29, isUniquelyReferenced_nonNull_native);
          uint64_t v49 = v48;

          swift_bridgeObjectRelease();
        }
        else
        {
          id v33 = (void *)sub_24A5E5970((uint64_t)v29);
        }
        uint64_t v34 = (void *)sub_24A5E9590();
        swift_bridgeObjectRelease();
        id v35 = objc_msgSend(v24, sel_allApplications);
        if (v35)
        {
          uint64_t v36 = v35;
          sub_24A5E8FF8(0, (unint64_t *)&unk_26B1788F8);
          sub_24A5E8DA0();
          sub_24A5E95A0();
        }
        else
        {
          sub_24A5E31A0(MEMORY[0x263F8EE78]);
        }
        BOOL v37 = self;
        sub_24A5E8FF8(0, (unint64_t *)&unk_26B1788F8);
        sub_24A5E8DA0();
        uint64_t v38 = (void *)sub_24A5E9590();
        swift_bridgeObjectRelease();
        id v39 = objc_msgSend(v37, sel_nudityDetectionPolicyWithAllServices_allApplications_, v34, v38);

        uint64_t v40 = v47;
        unint64_t v41 = *(void **)(v47 + v22);
        *(void *)(v47 + v22) = v39;

        id v42 = objc_msgSend(*(id *)(v40 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_localStore), sel_userSafety);
        id v43 = *(id *)(v40 + v22);
        objc_msgSend(v42, sel_setScanningPolicy_, v43);
      }
    }
  }
}

void sub_24A5E45E8(void *a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_24A5E9200();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  os_log_type_t v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A5E91F0();
  id v10 = a1;
  char v11 = sub_24A5E91E0();
  os_log_type_t v12 = sub_24A5E9770();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v50 = v7;
    uint64_t v14 = v13;
    uint64_t v15 = swift_slowAlloc();
    os_log_t v47 = v11;
    char v16 = (void *)v15;
    uint64_t v48 = swift_slowAlloc();
    uint64_t v52 = (uint64_t)v10;
    uint64_t v53 = v48;
    *(_DWORD *)uint64_t v14 = 138412546;
    uint64_t v51 = v3;
    uint64_t v49 = v6;
    id v17 = v10;
    id v18 = v10;
    sub_24A5E97A0();
    *char v16 = v17;

    id v10 = v17;
    *(_WORD *)(v14 + 12) = 2080;
    if (a2) {
      uint64_t v19 = 0x64656C62616E65;
    }
    else {
      uint64_t v19 = 0x64656C6261736964;
    }
    if (a2) {
      unint64_t v20 = 0xE700000000000000;
    }
    else {
      unint64_t v20 = 0xE800000000000000;
    }
    uint64_t v52 = sub_24A5DBEDC(v19, v20, &v53);
    sub_24A5E97A0();
    uint64_t v3 = v51;
    swift_bridgeObjectRelease();
    os_log_t v21 = v47;
    _os_log_impl(&dword_24A5D4000, v47, v12, "toggle app %@: %s", (uint8_t *)v14, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B178970);
    swift_arrayDestroy();
    MEMORY[0x24C5C8D00](v16, -1, -1);
    uint64_t v22 = v48;
    swift_arrayDestroy();
    MEMORY[0x24C5C8D00](v22, -1, -1);
    MEMORY[0x24C5C8D00](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v50 + 8))(v9, v49);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  uint64_t v23 = OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy;
  id v24 = *(void **)(v3 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy);
  if (v24)
  {
    id v25 = v24;
    if (objc_msgSend(v25, sel_policy) == (id)1)
    {
      id v26 = objc_msgSend(v25, sel_allApplications);
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v51 = v3;
        sub_24A5E8FF8(0, (unint64_t *)&unk_26B1788F8);
        sub_24A5E8FF8(0, (unint64_t *)&unk_2697A6F80);
        sub_24A5E8DA0();
        uint64_t v28 = sub_24A5E95A0();

        uint64_t v53 = v28;
        id v29 = objc_allocWithZone(NSNumber);
        id v30 = v10;
        id v31 = objc_msgSend(v29, sel_initWithBool_, a2 & 1);
        if (v31)
        {
          uint64_t v32 = (uint64_t)v31;
          if ((v28 & 0xC000000000000001) != 0)
          {
            if (v28 >= 0) {
              v28 &= 0xFFFFFFFFFFFFFF8uLL;
            }
            uint64_t v33 = sub_24A5E98E0();
            if (__OFADD__(v33, 1))
            {
              __break(1u);
              return;
            }
            uint64_t v28 = sub_24A5E5A38(v28, v33 + 1);
          }
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v52 = v28;
          sub_24A5E6638(v32, v30, isUniquelyReferenced_nonNull_native);
          uint64_t v53 = v52;

          swift_bridgeObjectRelease();
        }
        else
        {
          id v35 = (void *)sub_24A5E5820((unint64_t)v30);
        }
        id v36 = objc_msgSend(v25, sel_allServices);
        if (v36)
        {
          BOOL v37 = v36;
          type metadata accessor for MOUserSafetyScannableServices(0);
          sub_24A5E8E08((unint64_t *)&unk_2697A6F90, type metadata accessor for MOUserSafetyScannableServices);
          sub_24A5E95A0();
        }
        else
        {
          sub_24A5E3094(MEMORY[0x263F8EE78]);
        }
        uint64_t v38 = self;
        type metadata accessor for MOUserSafetyScannableServices(0);
        sub_24A5E8E08((unint64_t *)&unk_2697A6F90, type metadata accessor for MOUserSafetyScannableServices);
        id v39 = (void *)sub_24A5E9590();
        swift_bridgeObjectRelease();
        uint64_t v40 = (void *)sub_24A5E9590();
        swift_bridgeObjectRelease();
        id v41 = objc_msgSend(v38, sel_nudityDetectionPolicyWithAllServices_allApplications_, v39, v40);

        uint64_t v42 = v51;
        id v43 = *(void **)(v51 + v23);
        *(void *)(v51 + v23) = v41;

        id v44 = objc_msgSend(*(id *)(v42 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_localStore), sel_userSafety);
        id v45 = *(id *)(v42 + v23);
        objc_msgSend(v44, sel_setScanningPolicy_, v45);
      }
    }
  }
}

BOOL sub_24A5E4BF8()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectiveStore), sel_userSafety);
  id v2 = objc_msgSend(v1, sel_scanningPolicy);

  if (!v2) {
    return 0;
  }
  id v3 = objc_msgSend(v2, sel_policy);

  return v3 == (id)2;
}

uint64_t sub_24A5E4C80(uint64_t a1, uint64_t a2)
{
  id v3 = sub_24A5E8C24(a1, a2);
  if (v3)
  {
    uint64_t v4 = v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B178988);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24A5EAA80;
    uint64_t v6 = (void *)*MEMORY[0x263F53E90];
    *(void *)(inited + 32) = *MEMORY[0x263F53E90];
    uint64_t v7 = (void *)*MEMORY[0x263F53E98];
    uint64_t v8 = (void *)*MEMORY[0x263F53EA0];
    *(void *)(inited + 40) = *MEMORY[0x263F53E98];
    *(void *)(inited + 48) = v8;
    os_log_type_t v9 = (void *)*MEMORY[0x263F53EB0];
    *(void *)(inited + 56) = *MEMORY[0x263F53EB0];
    id v10 = v6;
    id v11 = v7;
    id v12 = v8;
    id v13 = v9;
    char v14 = sub_24A5E4E6C((uint64_t)v4, inited);
    swift_setDeallocating();
    type metadata accessor for MOUserSafetyScannableServices(0);
    swift_arrayDestroy();

    return v14 & 1;
  }
  id v16 = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectiveStore), sel_userSafety);
  id v17 = objc_msgSend(v16, sel_allowedClients);

  if (!v17)
  {
    char v14 = 0;
    return v14 & 1;
  }
  sub_24A5E8FF8(0, (unint64_t *)&unk_26B1788F8);
  sub_24A5E8DA0();
  uint64_t v18 = sub_24A5E9720();

  id v19 = objc_allocWithZone(MEMORY[0x263F53EB8]);
  swift_bridgeObjectRetain();
  unint64_t v20 = (void *)sub_24A5E9610();
  swift_bridgeObjectRelease();
  id v21 = objc_msgSend(v19, sel_initWithBundleIdentifier_, v20);

  LOBYTE(v19) = sub_24A5E0FC0(v21, v18);
  swift_bridgeObjectRelease();
  return v19 & 1;
}

uint64_t sub_24A5E4E6C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_24A5E9640();
  uint64_t v5 = v4;
  if (v3 == sub_24A5E9640() && v5 == v6)
  {
LABEL_20:
    swift_bridgeObjectRelease_n();
    return 1;
  }
  char v8 = sub_24A5E99A0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (v8)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    return 1;
  }
  if (v2 == 1)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v10 = 5;
  while (1)
  {
    uint64_t v11 = v10 - 3;
    if (__OFADD__(v10 - 4, 1)) {
      break;
    }
    uint64_t v12 = sub_24A5E9640();
    uint64_t v14 = v13;
    if (v12 == sub_24A5E9640() && v14 == v15)
    {
      swift_bridgeObjectRelease();
      goto LABEL_20;
    }
    char v17 = sub_24A5E99A0();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v17) {
      goto LABEL_7;
    }
    ++v10;
    if (v11 == v2) {
      goto LABEL_17;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_24A5E4FC4(uint64_t a1, uint64_t a2)
{
  id v3 = sub_24A5E8C24(a1, a2);
  if (!v3)
  {
    id v17 = objc_allocWithZone(MEMORY[0x263F53EB8]);
    swift_bridgeObjectRetain();
    uint64_t v18 = (void *)sub_24A5E9610();
    swift_bridgeObjectRelease();
    id v4 = objc_msgSend(v17, sel_initWithBundleIdentifier_, v18);

    id v19 = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectiveStore), sel_userSafety);
    id v20 = objc_msgSend(v19, sel_scanningPolicy);

    if (!v20) {
      goto LABEL_16;
    }
    id v7 = objc_msgSend(v20, sel_policy);

    if (!v7) {
      goto LABEL_16;
    }
    if (v7 == (id)1)
    {
      uint64_t v22 = *(void **)(v2 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy);
      if (v22)
      {
        id v23 = objc_msgSend(v22, sel_allApplications);
        if (v23)
        {
          id v24 = v23;
          sub_24A5E8FF8(0, (unint64_t *)&unk_26B1788F8);
          sub_24A5E8FF8(0, (unint64_t *)&unk_2697A6F80);
          sub_24A5E8DA0();
          uint64_t v25 = sub_24A5E95A0();

          id v26 = v4;
          uint64_t v27 = sub_24A5E2A40(v26, v25);

          swift_bridgeObjectRelease();
          if (v27)
          {
            id v16 = objc_msgSend(v27, sel_BOOLValue);

            return (uint64_t)v16;
          }

          return 1;
        }
      }
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  id v4 = v3;
  id v5 = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectiveStore), sel_userSafety);
  id v6 = objc_msgSend(v5, sel_scanningPolicy);

  if (!v6) {
    goto LABEL_16;
  }
  id v7 = objc_msgSend(v6, sel_policy);

  if (!v7) {
    goto LABEL_16;
  }
  if (v7 != (id)1)
  {
LABEL_13:
    if (v7 == (id)2)
    {
LABEL_14:

      return 1;
    }
LABEL_16:

    return 0;
  }
  char v8 = *(void **)(v2 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy);
  if (!v8) {
    goto LABEL_14;
  }
  id v9 = objc_msgSend(v8, sel_allServices);
  if (!v9) {
    goto LABEL_14;
  }
  uint64_t v10 = v9;
  type metadata accessor for MOUserSafetyScannableServices(0);
  sub_24A5E8FF8(0, (unint64_t *)&unk_2697A6F80);
  sub_24A5E8E08((unint64_t *)&unk_2697A6F90, type metadata accessor for MOUserSafetyScannableServices);
  uint64_t v11 = sub_24A5E95A0();

  if (!*(void *)(v11 + 16))
  {

LABEL_24:
    swift_bridgeObjectRelease();
    return 1;
  }
  id v12 = v4;
  unint64_t v13 = sub_24A5E5714((uint64_t)v12);
  if ((v14 & 1) == 0)
  {

    goto LABEL_24;
  }
  id v15 = *(id *)(*(void *)(v11 + 56) + 8 * v13);

  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(v15, sel_BOOLValue);

  return (uint64_t)v16;
}

uint64_t NudityDetectionRootModel.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel__detectionEntries;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1788B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel__nudityDetectionEnabled;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697A6F48);
  id v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5(v0 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel__nudityDetectionAnalyticsEnabled, v4);

  swift_unknownObjectRelease();
  return v0;
}

uint64_t NudityDetectionRootModel.__deallocating_deinit()
{
  NudityDetectionRootModel.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_24A5E54A4@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for NudityDetectionRootModel(0);
  uint64_t result = sub_24A5E9210();
  *a1 = result;
  return result;
}

id sub_24A5E54E4(uint64_t a1, uint64_t a2, char a3)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  id v5 = (void *)sub_24A5E9610();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  id v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_allowPlaceholder_error_, v5, a3 & 1, v10);

  if (v6)
  {
    id v7 = v10[0];
  }
  else
  {
    id v8 = v10[0];
    sub_24A5E9130();

    swift_willThrow();
  }
  return v6;
}

void *sub_24A5E55C0(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B178988);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      id v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      unint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_24A5E86A8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_24A5E56D0(uint64_t a1)
{
  uint64_t v2 = sub_24A5E9780();
  return sub_24A5E6910(a1, v2);
}

unint64_t sub_24A5E5714(uint64_t a1)
{
  sub_24A5E9640();
  sub_24A5E99C0();
  sub_24A5E9670();
  uint64_t v2 = sub_24A5E99E0();
  swift_bridgeObjectRelease();
  return sub_24A5E6A2C(a1, v2);
}

unint64_t sub_24A5E57A8(uint64_t a1, uint64_t a2)
{
  sub_24A5E99C0();
  sub_24A5E9670();
  uint64_t v4 = sub_24A5E99E0();
  return sub_24A5E6BA4(a1, a2, v4);
}

uint64_t sub_24A5E5820(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  if ((v4 & 0xC000000000000001) == 0)
  {
LABEL_8:
    swift_bridgeObjectRetain();
    a1 = sub_24A5E56D0(a1);
    char v13 = v12;
    swift_bridgeObjectRelease();
    if (v13)
    {
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v9 = *v2;
      uint64_t v17 = *v2;
      uint64_t *v2 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_24A5E6C88();
        uint64_t v9 = v17;
      }
      goto LABEL_11;
    }
    return 0;
  }
  if (v4 < 0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = v4 & 0xFFFFFFFFFFFFFF8;
  }
  swift_bridgeObjectRetain();
  id v6 = (id)a1;
  uint64_t v7 = sub_24A5E98F0();

  if (!v7)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_unknownObjectRelease();
  uint64_t v8 = sub_24A5E98E0();
  uint64_t v9 = sub_24A5E5A38(v5, v8);
  swift_retain();
  a1 = sub_24A5E56D0((uint64_t)v6);
  char v11 = v10;
  swift_release();
  if ((v11 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
LABEL_11:

  uint64_t v15 = *(void *)(*(void *)(v9 + 56) + 8 * a1);
  sub_24A5E6290(a1, v9);
  uint64_t *v2 = v9;
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_24A5E5970(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_24A5E5714(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  uint64_t v10 = *v2;
  uint64_t *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_24A5E6E30();
    uint64_t v7 = v10;
  }

  uint64_t v8 = *(void *)(*(void *)(v7 + 56) + 8 * v4);
  sub_24A5E6444(v4, v7);
  uint64_t *v2 = v7;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_24A5E5A38(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6FA0);
    uint64_t v2 = sub_24A5E9950();
    uint64_t v18 = v2;
    sub_24A5E98D0();
    uint64_t v3 = sub_24A5E9900();
    if (v3)
    {
      uint64_t v4 = v3;
      sub_24A5E8FF8(0, (unint64_t *)&unk_26B1788F8);
      do
      {
        swift_dynamicCast();
        sub_24A5E8FF8(0, (unint64_t *)&unk_2697A6F80);
        swift_dynamicCast();
        uint64_t v2 = v18;
        unint64_t v12 = *(void *)(v18 + 16);
        if (*(void *)(v18 + 24) <= v12)
        {
          sub_24A5E5C8C(v12 + 1, 1);
          uint64_t v2 = v18;
        }
        uint64_t result = sub_24A5E9780();
        uint64_t v6 = v2 + 64;
        uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v8 = result & ~v7;
        unint64_t v9 = v8 >> 6;
        if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v13 = 0;
          unint64_t v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v15 = v9 == v14;
            if (v9 == v14) {
              unint64_t v9 = 0;
            }
            v13 |= v15;
            uint64_t v16 = *(void *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          unint64_t v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        uint64_t v11 = 8 * v10;
        *(void *)(*(void *)(v2 + 48) + v11) = v17;
        *(void *)(*(void *)(v2 + 56) + v11) = v4;
        ++*(void *)(v2 + 16);
        uint64_t v4 = sub_24A5E9900();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE80];
  }
  return v2;
}

uint64_t sub_24A5E5C8C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6FA0);
  uint64_t v6 = sub_24A5E9940();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  id v36 = v2;
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    id v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v37 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v36;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v37 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    id v31 = *(void **)(*(void *)(v5 + 48) + v30);
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      id v33 = v31;
      id v34 = v32;
    }
    uint64_t result = sub_24A5E9780();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  id v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *id v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24A5E5F60(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6FA8);
  char v39 = a2;
  uint64_t v6 = sub_24A5E9940();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v38 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  id v36 = v2;
  int64_t v37 = (unint64_t)(v8 + 63) >> 6;
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
    if (v22 >= v37) {
      break;
    }
    id v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v38 + 8 * v22);
    ++v13;
    if (!v24)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v37) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v38 + 8 * v13);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v36;
          if ((v39 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v13 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v37) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v38 + 8 * v13);
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
    uint64_t v30 = 8 * v21;
    id v31 = *(void **)(*(void *)(v5 + 48) + v30);
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + v30);
    if ((v39 & 1) == 0)
    {
      id v33 = v31;
      id v34 = v32;
    }
    sub_24A5E9640();
    sub_24A5E99C0();
    sub_24A5E9670();
    uint64_t v14 = sub_24A5E99E0();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = v14 & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v11 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v11 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v11 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v11 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  id v23 = (void *)(v5 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *id v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void sub_24A5E6290(unint64_t a1, uint64_t a2)
{
  int64_t v3 = a1;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t v8 = sub_24A5E97D0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        id v10 = *(id *)(*(void *)(a2 + 48) + 8 * v6);
        uint64_t v11 = sub_24A5E9780();

        unint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v3 >= (uint64_t)v12)
          {
LABEL_16:
            uint64_t v15 = *(void *)(a2 + 48);
            unint64_t v16 = (void *)(v15 + 8 * v3);
            unint64_t v17 = (void *)(v15 + 8 * v6);
            if (v3 != v6 || v16 >= v17 + 1) {
              *unint64_t v16 = *v17;
            }
            uint64_t v18 = *(void *)(a2 + 56);
            uint64_t v19 = (void *)(v18 + 8 * v3);
            unint64_t v20 = (void *)(v18 + 8 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v19 >= v20 + 1))
            {
              *uint64_t v19 = *v20;
              int64_t v3 = v6;
            }
          }
        }
        else if (v12 >= v9 || v3 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v22 = *v21;
    uint64_t v23 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v21 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    uint64_t v23 = *v21;
    uint64_t v22 = (-1 << a1) - 1;
  }
  *unint64_t v21 = v23 & v22;
  uint64_t v24 = *(void *)(a2 + 16);
  BOOL v25 = __OFSUB__(v24, 1);
  uint64_t v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
}

unint64_t sub_24A5E6444(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_24A5E97D0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        unint64_t v9 = *(void **)(*(void *)(a2 + 48) + 8 * v6);
        sub_24A5E9640();
        sub_24A5E99C0();
        id v10 = v9;
        sub_24A5E9670();
        uint64_t v11 = sub_24A5E99E0();

        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8) {
            goto LABEL_5;
          }
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          uint64_t v13 = *(void *)(a2 + 48);
          uint64_t v14 = (void *)(v13 + 8 * v3);
          uint64_t v15 = (void *)(v13 + 8 * v6);
          if (v3 != v6 || v14 >= v15 + 1) {
            *uint64_t v14 = *v15;
          }
          uint64_t v16 = *(void *)(a2 + 56);
          unint64_t v17 = (void *)(v16 + 8 * v3);
          uint64_t v18 = (void *)(v16 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v17 >= v18 + 1))
          {
            *unint64_t v17 = *v18;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    uint64_t v21 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v21 = *v19;
    uint64_t v20 = (-1 << result) - 1;
  }
  *uint64_t v19 = v21 & v20;
  uint64_t v22 = *(void *)(a2 + 16);
  BOOL v23 = __OFSUB__(v22, 1);
  uint64_t v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_24A5E6638(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_24A5E56D0((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_24A5E6C88();
LABEL_7:
    uint64_t v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];

      *(void *)(v16 + 8 * v9) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_24A5E5C8C(v12, a3 & 1);
  unint64_t v17 = sub_24A5E56D0((uint64_t)a2);
  if ((v13 & 1) != (v18 & 1))
  {
LABEL_17:
    sub_24A5E8FF8(0, (unint64_t *)&unk_26B1788F8);
    sub_24A5E99B0();
    __break(1u);
    return;
  }
  unint64_t v9 = v17;
  uint64_t v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  uint64_t v19 = 8 * v9;
  *(void *)(v15[6] + v19) = a2;
  *(void *)(v15[7] + v19) = a1;
  uint64_t v20 = v15[2];
  BOOL v21 = __OFADD__(v20, 1);
  uint64_t v22 = v20 + 1;
  if (v21)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v15[2] = v22;
  id v23 = a2;
}

void sub_24A5E67AC(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_24A5E5714((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_24A5E6E30();
LABEL_7:
    uint64_t v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];

      *(void *)(v16 + 8 * v9) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_24A5E5F60(v12, a3 & 1);
  unint64_t v17 = sub_24A5E5714((uint64_t)a2);
  if ((v13 & 1) != (v18 & 1))
  {
LABEL_17:
    type metadata accessor for MOUserSafetyScannableServices(0);
    sub_24A5E99B0();
    __break(1u);
    return;
  }
  unint64_t v9 = v17;
  uint64_t v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  uint64_t v19 = 8 * v9;
  *(void *)(v15[6] + v19) = a2;
  *(void *)(v15[7] + v19) = a1;
  uint64_t v20 = v15[2];
  BOOL v21 = __OFADD__(v20, 1);
  uint64_t v22 = v20 + 1;
  if (v21)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v15[2] = v22;
  id v23 = a2;
}

unint64_t sub_24A5E6910(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_24A5E8FF8(0, (unint64_t *)&unk_26B1788F8);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_24A5E9790();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_24A5E9790();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_24A5E6A2C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_24A5E9640();
    uint64_t v8 = v7;
    if (v6 == sub_24A5E9640() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_24A5E99A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_24A5E9640();
          uint64_t v15 = v14;
          if (v13 == sub_24A5E9640() && v15 == v16) {
            break;
          }
          char v18 = sub_24A5E99A0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_24A5E6BA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24A5E99A0() & 1) == 0)
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
      while (!v14 && (sub_24A5E99A0() & 1) == 0);
    }
  }
  return v6;
}

id sub_24A5E6C88()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6FA0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24A5E9930();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    char v18 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = v18;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_24A5E6E30()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697A6FA8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24A5E9930();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    char v18 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = v18;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_24A5E6FD8(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = a1;
  uint64_t v4 = a1[1];
  uint64_t result = sub_24A5E9990();
  uint64_t v104 = v4;
  if (result >= v4)
  {
    if (v4 < 0) {
      goto LABEL_140;
    }
    if ((unint64_t)v4 < 2) {
      return result;
    }
    uint64_t v11 = (uint64_t *)*v3;
    uint64_t v12 = -1;
    uint64_t v13 = 1;
    sub_24A5DEE10();
    for (unint64_t i = v11; ; ++i)
    {
      uint64_t v15 = v12;
      uint64_t v16 = i;
      do
      {
        uint64_t result = sub_24A5E97C0();
        if (result != -1) {
          break;
        }
        if (!v11)
        {
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
          goto LABEL_149;
        }
        uint64_t v17 = *v16;
        *uint64_t v16 = v16[1];
        v16[1] = v17;
        --v16;
      }
      while (!__CFADD__(v15++, 1));
      ++v13;
      --v12;
      if (v13 == v4) {
        return result;
      }
    }
  }
  if (v4 >= 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = v4 + 1;
  }
  if (v4 < -1)
  {
LABEL_149:
    uint64_t result = sub_24A5E9910();
    __break(1u);
    return result;
  }
  uint64_t v7 = result;
  uint64_t v97 = v3;
  if (v4 < 2)
  {
    id v19 = (char *)MEMORY[0x263F8EE78];
    uint64_t v106 = MEMORY[0x263F8EE78];
    uint64_t v103 = (char *)((MEMORY[0x263F8EE78] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v4 != 1)
    {
      unint64_t v22 = *(void *)(MEMORY[0x263F8EE78] + 16);
      goto LABEL_106;
    }
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v6 >> 1;
    type metadata accessor for NudityDetectionEntry(0);
    uint64_t v10 = sub_24A5E96E0();
    *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) = v9;
    uint64_t v3 = v8;
    uint64_t v103 = (char *)((v10 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v106 = v10;
  }
  uint64_t v100 = v7;
  uint64_t v20 = 0;
  uint64_t v21 = *v3;
  uint64_t v98 = *v3 - 8;
  uint64_t v99 = *v3 + 16;
  id v19 = (char *)MEMORY[0x263F8EE78];
  do
  {
    uint64_t v23 = v20++;
    uint64_t v101 = v23;
    if (v20 < v4)
    {
      sub_24A5DEE10();
      uint64_t v24 = sub_24A5E97C0();
      uint64_t v20 = v23 + 2;
      if (v23 + 2 < v4)
      {
        uint64_t v25 = v99 + 8 * v23;
        while ((v24 == -1) != (sub_24A5E97C0() != -1))
        {
          ++v20;
          v25 += 8;
          if (v104 == v20)
          {
            uint64_t v20 = v104;
            uint64_t v4 = v104;
            goto LABEL_29;
          }
        }
        uint64_t v4 = v104;
      }
LABEL_29:
      if (v24 == -1)
      {
        if (v20 < v23) {
          goto LABEL_144;
        }
        if (v23 < v20)
        {
          uint64_t v26 = (uint64_t *)(v98 + 8 * v20);
          uint64_t v27 = v20;
          uint64_t v28 = v23;
          uint64_t v29 = (uint64_t *)(v21 + 8 * v23);
          do
          {
            if (v28 != --v27)
            {
              if (!v21) {
                goto LABEL_147;
              }
              uint64_t v30 = *v29;
              *uint64_t v29 = *v26;
              *uint64_t v26 = v30;
            }
            ++v28;
            --v26;
            ++v29;
          }
          while (v28 < v27);
        }
      }
    }
    if (v20 < v4)
    {
      if (__OFSUB__(v20, v23)) {
        goto LABEL_139;
      }
      if (v20 - v23 < v100)
      {
        if (__OFADD__(v23, v100)) {
          goto LABEL_141;
        }
        if (v23 + v100 >= v4) {
          uint64_t v31 = v4;
        }
        else {
          uint64_t v31 = v23 + v100;
        }
        if (v31 < v23)
        {
LABEL_142:
          __break(1u);
          goto LABEL_143;
        }
        if (v20 != v31)
        {
          sub_24A5DEE10();
          uint64_t v32 = (uint64_t *)(v98 + 8 * v20);
          do
          {
            id v33 = v32;
            do
            {
              if (sub_24A5E97C0() != -1) {
                break;
              }
              if (!v21) {
                goto LABEL_145;
              }
              uint64_t v34 = *v33;
              uint64_t *v33 = v33[1];
              v33[1] = v34;
              --v33;
              ++v23;
            }
            while (v20 != v23);
            ++v20;
            ++v32;
            uint64_t v23 = v101;
          }
          while (v20 != v31);
          uint64_t v20 = v31;
        }
      }
    }
    if (v20 < v23) {
      goto LABEL_134;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      id v19 = sub_24A5E7AC4(0, *((void *)v19 + 2) + 1, 1, v19);
    }
    unint64_t v36 = *((void *)v19 + 2);
    unint64_t v35 = *((void *)v19 + 3);
    unint64_t v22 = v36 + 1;
    if (v36 >= v35 >> 1) {
      id v19 = sub_24A5E7AC4((char *)(v35 > 1), v36 + 1, 1, v19);
    }
    *((void *)v19 + 2) = v22;
    int64_t v37 = v19 + 32;
    uint64_t v38 = &v19[16 * v36 + 32];
    *(void *)uint64_t v38 = v23;
    *((void *)v38 + 1) = v20;
    if (v36)
    {
      uint64_t v102 = v20;
      while (1)
      {
        unint64_t v39 = v22 - 1;
        if (v22 >= 4)
        {
          id v44 = &v37[16 * v22];
          uint64_t v45 = *((void *)v44 - 8);
          uint64_t v46 = *((void *)v44 - 7);
          BOOL v50 = __OFSUB__(v46, v45);
          uint64_t v47 = v46 - v45;
          if (v50) {
            goto LABEL_123;
          }
          uint64_t v49 = *((void *)v44 - 6);
          uint64_t v48 = *((void *)v44 - 5);
          BOOL v50 = __OFSUB__(v48, v49);
          uint64_t v42 = v48 - v49;
          char v43 = v50;
          if (v50) {
            goto LABEL_124;
          }
          unint64_t v51 = v22 - 2;
          uint64_t v52 = &v37[16 * v22 - 32];
          uint64_t v54 = *(void *)v52;
          uint64_t v53 = *((void *)v52 + 1);
          BOOL v50 = __OFSUB__(v53, v54);
          uint64_t v55 = v53 - v54;
          if (v50) {
            goto LABEL_126;
          }
          BOOL v50 = __OFADD__(v42, v55);
          uint64_t v56 = v42 + v55;
          if (v50) {
            goto LABEL_129;
          }
          if (v56 >= v47)
          {
            char v74 = &v37[16 * v39];
            uint64_t v76 = *(void *)v74;
            uint64_t v75 = *((void *)v74 + 1);
            BOOL v50 = __OFSUB__(v75, v76);
            uint64_t v77 = v75 - v76;
            if (v50) {
              goto LABEL_133;
            }
            BOOL v67 = v42 < v77;
            goto LABEL_93;
          }
        }
        else
        {
          if (v22 != 3)
          {
            uint64_t v68 = *((void *)v19 + 4);
            uint64_t v69 = *((void *)v19 + 5);
            BOOL v50 = __OFSUB__(v69, v68);
            uint64_t v61 = v69 - v68;
            char v62 = v50;
            goto LABEL_87;
          }
          uint64_t v41 = *((void *)v19 + 4);
          uint64_t v40 = *((void *)v19 + 5);
          BOOL v50 = __OFSUB__(v40, v41);
          uint64_t v42 = v40 - v41;
          char v43 = v50;
        }
        if (v43) {
          goto LABEL_125;
        }
        unint64_t v51 = v22 - 2;
        unint64_t v57 = &v37[16 * v22 - 32];
        uint64_t v59 = *(void *)v57;
        uint64_t v58 = *((void *)v57 + 1);
        BOOL v60 = __OFSUB__(v58, v59);
        uint64_t v61 = v58 - v59;
        char v62 = v60;
        if (v60) {
          goto LABEL_128;
        }
        uint64_t v63 = &v37[16 * v39];
        uint64_t v65 = *(void *)v63;
        uint64_t v64 = *((void *)v63 + 1);
        BOOL v50 = __OFSUB__(v64, v65);
        uint64_t v66 = v64 - v65;
        if (v50) {
          goto LABEL_131;
        }
        if (__OFADD__(v61, v66)) {
          goto LABEL_132;
        }
        if (v61 + v66 >= v42)
        {
          BOOL v67 = v42 < v66;
LABEL_93:
          if (v67) {
            unint64_t v39 = v51;
          }
          goto LABEL_95;
        }
LABEL_87:
        if (v62) {
          goto LABEL_127;
        }
        uint64_t v70 = &v37[16 * v39];
        uint64_t v72 = *(void *)v70;
        uint64_t v71 = *((void *)v70 + 1);
        BOOL v50 = __OFSUB__(v71, v72);
        uint64_t v73 = v71 - v72;
        if (v50) {
          goto LABEL_130;
        }
        if (v73 < v61) {
          goto LABEL_21;
        }
LABEL_95:
        unint64_t v78 = v39 - 1;
        if (v39 - 1 >= v22)
        {
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
          goto LABEL_142;
        }
        if (!v21) {
          goto LABEL_146;
        }
        unint64_t v79 = v19;
        uint64_t v80 = v21;
        char v81 = &v37[16 * v78];
        uint64_t v82 = *(void *)v81;
        BOOL v83 = v37;
        unint64_t v84 = v39;
        char v85 = &v37[16 * v39];
        uint64_t v86 = *((void *)v85 + 1);
        uint64_t v87 = v80;
        sub_24A5E77C8((char *)(v80 + 8 * *(void *)v81), (char *)(v80 + 8 * *(void *)v85), v80 + 8 * v86, v103);
        if (v1) {
          goto LABEL_103;
        }
        if (v86 < v82) {
          goto LABEL_120;
        }
        if (v84 > *((void *)v79 + 2)) {
          goto LABEL_121;
        }
        *(void *)char v81 = v82;
        *(void *)&v83[16 * v78 + 8] = v86;
        unint64_t v88 = *((void *)v79 + 2);
        if (v84 >= v88) {
          goto LABEL_122;
        }
        id v19 = v79;
        unint64_t v22 = v88 - 1;
        memmove(v85, v85 + 16, 16 * (v88 - 1 - v84));
        int64_t v37 = v83;
        *((void *)v79 + 2) = v88 - 1;
        uint64_t v21 = v87;
        uint64_t v20 = v102;
        if (v88 <= 2) {
          goto LABEL_21;
        }
      }
    }
    unint64_t v22 = 1;
LABEL_21:
    uint64_t v4 = v104;
  }
  while (v20 < v104);
  uint64_t v2 = v1;
LABEL_106:
  char v89 = v19;
  uint64_t v105 = v2;
  if (v22 >= 2)
  {
    uint64_t v90 = *v97;
    do
    {
      unint64_t v91 = v22 - 2;
      if (v22 < 2) {
        goto LABEL_135;
      }
      if (!v90) {
        goto LABEL_148;
      }
      char v92 = v89;
      uint64_t v93 = *(void *)&v89[16 * v91 + 32];
      uint64_t v94 = *(void *)&v89[16 * v22 + 24];
      sub_24A5E77C8((char *)(v90 + 8 * v93), (char *)(v90 + 8 * *(void *)&v89[16 * v22 + 16]), v90 + 8 * v94, v103);
      if (v105) {
        break;
      }
      if (v94 < v93) {
        goto LABEL_136;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        char v92 = sub_24A5E7C7C((uint64_t)v92);
      }
      if (v91 >= *((void *)v92 + 2)) {
        goto LABEL_137;
      }
      v95 = &v92[16 * v91 + 32];
      *(void *)v95 = v93;
      *((void *)v95 + 1) = v94;
      unint64_t v96 = *((void *)v92 + 2);
      if (v22 > v96) {
        goto LABEL_138;
      }
      memmove(&v92[16 * v22 + 16], &v92[16 * v22 + 32], 16 * (v96 - v22));
      char v89 = v92;
      *((void *)v92 + 2) = v96 - 1;
      unint64_t v22 = v96 - 1;
    }
    while (v96 > 2);
  }
LABEL_103:
  swift_bridgeObjectRelease();
  *(void *)((v106 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
  sub_24A5E96C0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A5E77C8(char *__src, char *a2, unint64_t a3, char *a4)
{
  uint64_t v5 = a2;
  uint64_t v6 = __src;
  int64_t v7 = a2 - __src;
  int64_t v8 = a2 - __src + 7;
  if (a2 - __src >= 0) {
    int64_t v8 = a2 - __src;
  }
  uint64_t v9 = v8 >> 3;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v11 = a3 - (void)a2;
  }
  uint64_t v12 = v11 >> 3;
  uint64_t v23 = __src;
  unint64_t v22 = a4;
  if (v9 >= v11 >> 3)
  {
    if (v10 >= -7)
    {
      if (a4 != a2 || &a2[8 * v12] <= a4) {
        memmove(a4, a2, 8 * v12);
      }
      uint64_t v15 = &a4[8 * v12];
      uint64_t v21 = v15;
      uint64_t v23 = v5;
      if (v6 < v5 && v10 >= 8)
      {
        sub_24A5DEE10();
        uint64_t v16 = (char *)(a3 - 8);
        uint64_t v17 = v5;
        while (1)
        {
          char v18 = v16 + 8;
          v17 -= 8;
          if (sub_24A5E97C0() == -1)
          {
            if (v18 != v5 || v16 >= v5) {
              *(void *)uint64_t v16 = *(void *)v17;
            }
            uint64_t v23 = v17;
            if (v17 <= v6) {
              goto LABEL_43;
            }
          }
          else
          {
            uint64_t v21 = v15 - 8;
            if (v18 < v15 || v16 >= v15 || v18 != v15) {
              *(void *)uint64_t v16 = *((void *)v15 - 1);
            }
            uint64_t v17 = v5;
            v15 -= 8;
            if (v5 <= v6) {
              goto LABEL_43;
            }
          }
          v16 -= 8;
          uint64_t v5 = v17;
          if (v15 <= a4) {
            goto LABEL_43;
          }
        }
      }
      goto LABEL_43;
    }
  }
  else if (v7 >= -7)
  {
    if (a4 != __src || &__src[8 * v9] <= a4) {
      memmove(a4, __src, 8 * v9);
    }
    uint64_t v21 = &a4[8 * v9];
    if ((unint64_t)v5 < a3 && v7 >= 8)
    {
      sub_24A5DEE10();
      uint64_t v13 = a4;
      do
      {
        if (sub_24A5E97C0() == -1)
        {
          unint64_t v14 = v5 + 8;
          if (v6 < v5 || v6 >= v14 || v6 != v5) {
            *(void *)uint64_t v6 = *(void *)v5;
          }
        }
        else
        {
          if (v6 != v13) {
            *(void *)uint64_t v6 = *(void *)v13;
          }
          v13 += 8;
          unint64_t v22 = v13;
          unint64_t v14 = v5;
        }
        v6 += 8;
        if (v13 >= &a4[8 * v9]) {
          break;
        }
        uint64_t v5 = v14;
      }
      while ((unint64_t)v14 < a3);
      uint64_t v23 = v6;
    }
LABEL_43:
    sub_24A5E7BC0((void **)&v23, (const void **)&v22, &v21);
    return 1;
  }
  uint64_t result = sub_24A5E9970();
  __break(1u);
  return result;
}

char *sub_24A5E7AC4(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697A7018);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_24A5E7BC0(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_24A5E9970();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_24A5E7C7C(uint64_t a1)
{
  return sub_24A5E7AC4(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void (*sub_24A5E7C90(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_24A5E7D40(v6, a2, a3);
  return sub_24A5E7CF8;
}

void sub_24A5E7CF8(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_24A5E7D40(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = MEMORY[0x24C5C8620](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    uint64_t v4 = swift_retain();
LABEL_5:
    *uint64_t v3 = v4;
    return destroy for AnalyticsSection;
  }
  __break(1u);
  return result;
}

uint64_t sub_24A5E7DC0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_24A5E9920();
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
    uint64_t v10 = sub_24A5E9920();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_24A5DD5F0(&qword_2697A7008, (uint64_t *)&unk_26B1788D8);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1788D8);
          uint64_t v12 = sub_24A5E7C90(v16, i, a3);
          uint64_t v14 = *v13;
          swift_retain();
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
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
    type metadata accessor for NudityDetectionEntry(0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_24A5E9970();
  __break(1u);
  return result;
}

void sub_24A5E7FE4(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_24A5E9920();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x24C5C8630);
}

uint64_t sub_24A5E8060(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B178978);
    uint64_t v3 = sub_24A5E9810();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v31 = v1;
    uint64_t v32 = a1 + 32;
    while (1)
    {
      unint64_t v6 = *(void **)(v32 + 8 * v4);
      sub_24A5E9640();
      sub_24A5E99C0();
      id v7 = v6;
      sub_24A5E9670();
      uint64_t v8 = sub_24A5E99E0();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = v8 & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = sub_24A5E9640();
        uint64_t v17 = v16;
        if (v15 == sub_24A5E9640() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        char v20 = sub_24A5E99A0();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_4;
        }
        uint64_t v21 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v21;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v22 = sub_24A5E9640();
          uint64_t v24 = v23;
          if (v22 == sub_24A5E9640() && v24 == v25) {
            goto LABEL_3;
          }
          char v27 = sub_24A5E99A0();
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
          if (v27) {
            goto LABEL_4;
          }
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      *(void *)(*(void *)(v3 + 48) + 8 * v11) = v7;
      uint64_t v28 = *(void *)(v3 + 16);
      BOOL v29 = __OFADD__(v28, 1);
      uint64_t v30 = v28 + 1;
      if (v29)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v30;
LABEL_5:
      if (++v4 == v31) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

void sub_24A5E8290(uint64_t a1)
{
  sub_24A5E0B94(a1, v1);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_24A5E82B0()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_24A5E82BC()
{
  return type metadata accessor for NudityDetectionEntry(0);
}

uint64_t type metadata accessor for NudityDetectionEntry(uint64_t a1)
{
  return sub_24A5DB6C4(a1, qword_26B178340);
}

void sub_24A5E82E4()
{
  sub_24A5E838C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_24A5E838C()
{
  if (!qword_26B1788D0)
  {
    unint64_t v0 = sub_24A5E9250();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B1788D0);
    }
  }
}

uint64_t sub_24A5E83E4()
{
  return type metadata accessor for NudityDetectionSystemService(0);
}

uint64_t type metadata accessor for NudityDetectionSystemService(uint64_t a1)
{
  return sub_24A5DB6C4(a1, qword_26B178730);
}

uint64_t sub_24A5E840C()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_24A5E8450()
{
  return type metadata accessor for NudityDetectionApp(0);
}

uint64_t type metadata accessor for NudityDetectionApp(uint64_t a1)
{
  return sub_24A5DB6C4(a1, qword_2697A6F68);
}

uint64_t sub_24A5E8478()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_24A5E84D4()
{
  return type metadata accessor for NudityDetectionRootModel(0);
}

uint64_t type metadata accessor for NudityDetectionRootModel(uint64_t a1)
{
  return sub_24A5DB6C4(a1, qword_26B1784E8);
}

void sub_24A5E84FC()
{
  sub_24A5E8640();
  if (v0 <= 0x3F)
  {
    sub_24A5E838C();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for NudityDetectionRootModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for NudityDetectionRootModel);
}

uint64_t dispatch thunk of NudityDetectionRootModel.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 360))();
}

uint64_t dispatch thunk of NudityDetectionRootModel.communicationSafetyModeEnabled.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 408))();
}

void sub_24A5E8640()
{
  if (!qword_26B1788C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_26B1788D8);
    unint64_t v0 = sub_24A5E9250();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B1788C8);
    }
  }
}

uint64_t sub_24A5E869C()
{
  return MEMORY[0x263F8D320];
}

uint64_t sub_24A5E86A8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      type metadata accessor for MOUserSafetyScannableServices(0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_24A5E9970();
  __break(1u);
  return result;
}

uint64_t sub_24A5E87B0(uint64_t a1, uint64_t a2, void **a3)
{
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v5)
  {
    uint64_t v13 = MEMORY[0x263F8EE78];
    sub_24A5E9890();
    for (unint64_t i = (void **)(a1 + 32); ; ++i)
    {
      unint64_t v11 = *i;
      uint64_t v10 = v11;
      sub_24A5E2638(&v11, a2, a3, &v12);

      if (v3) {
        break;
      }
      sub_24A5E9870();
      sub_24A5E98A0();
      sub_24A5E98B0();
      sub_24A5E9880();
      if (!--v5) {
        return v13;
      }
    }
    return swift_release();
  }
  return result;
}

void sub_24A5E88B0(unint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  unint64_t v6 = a1;
  uint64_t v27 = MEMORY[0x263F8EE78];
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_24A5E97E0();
    sub_24A5E8FF8(0, (unint64_t *)&unk_26B1788F8);
    sub_24A5E8DA0();
    sub_24A5E9740();
    unint64_t v6 = (unint64_t)v26[1];
    uint64_t v23 = v26[2];
    id v7 = v26[3];
    int64_t v8 = (int64_t)v26[4];
    unint64_t v9 = (unint64_t)v26[5];
  }
  else
  {
    uint64_t v10 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v23 = (void *)(a1 + 56);
    uint64_t v11 = ~v10;
    uint64_t v12 = -v10;
    if (v12 < 64) {
      uint64_t v13 = ~(-1 << v12);
    }
    else {
      uint64_t v13 = -1;
    }
    unint64_t v9 = v13 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    id v7 = (id)v11;
    int64_t v8 = 0;
  }
  int64_t v22 = ((unint64_t)v7 + 64) >> 6;
  while ((v6 & 0x8000000000000000) != 0)
  {
    uint64_t v17 = sub_24A5E97F0();
    if (!v17) {
      goto LABEL_39;
    }
    uint64_t v25 = v17;
    sub_24A5E8FF8(0, (unint64_t *)&unk_26B1788F8);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v18 = v26[0];
    swift_unknownObjectRelease();
    int64_t v16 = v8;
    uint64_t v14 = v9;
    if (!v18) {
      goto LABEL_39;
    }
LABEL_28:
    v26[0] = v18;
    sub_24A5E2B18(v26, a2, a3, &v25);

    if (v4)
    {
      sub_24A5E8FF0();
      swift_bridgeObjectRelease();
      return;
    }
    if (v25)
    {
      MEMORY[0x24C5C8480]();
      if (*(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_24A5E96D0();
      }
      sub_24A5E96F0();
      sub_24A5E96C0();
    }
    int64_t v8 = v16;
    unint64_t v9 = v14;
  }
  if (v9)
  {
    uint64_t v14 = (v9 - 1) & v9;
    unint64_t v15 = __clz(__rbit64(v9)) | (v8 << 6);
    int64_t v16 = v8;
LABEL_27:
    id v18 = *(id *)(*(void *)(v6 + 48) + 8 * v15);
    if (!v18) {
      goto LABEL_39;
    }
    goto LABEL_28;
  }
  int64_t v16 = v8 + 1;
  if (!__OFADD__(v8, 1))
  {
    if (v16 >= v22) {
      goto LABEL_39;
    }
    unint64_t v19 = v23[v16];
    if (!v19)
    {
      int64_t v20 = v8 + 2;
      if (v8 + 2 >= v22) {
        goto LABEL_39;
      }
      unint64_t v19 = v23[v20];
      if (v19) {
        goto LABEL_25;
      }
      int64_t v20 = v8 + 3;
      if (v8 + 3 >= v22) {
        goto LABEL_39;
      }
      unint64_t v19 = v23[v20];
      if (v19) {
        goto LABEL_25;
      }
      int64_t v20 = v8 + 4;
      if (v8 + 4 >= v22) {
        goto LABEL_39;
      }
      unint64_t v19 = v23[v20];
      if (v19)
      {
LABEL_25:
        int64_t v16 = v20;
      }
      else
      {
        int64_t v16 = v8 + 5;
        if (v8 + 5 >= v22) {
          goto LABEL_39;
        }
        unint64_t v19 = v23[v16];
        if (!v19)
        {
          uint64_t v21 = (char *)(v8 + 6);
          while ((char *)v22 != v21)
          {
            unint64_t v19 = v23[(void)v21++];
            if (v19)
            {
              int64_t v16 = (int64_t)(v21 - 1);
              goto LABEL_26;
            }
          }
LABEL_39:
          sub_24A5E8FF0();
          return;
        }
      }
    }
LABEL_26:
    uint64_t v14 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v16 << 6);
    goto LABEL_27;
  }
  __break(1u);
}

id sub_24A5E8C24(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000013 && a2 == 0x800000024A5EB110 || (sub_24A5E99A0() & 1) != 0)
  {
    uint64_t v4 = (id *)MEMORY[0x263F53EA0];
  }
  else if (a1 == 0xD00000000000001BLL && a2 == 0x800000024A5EB130 || (sub_24A5E99A0() & 1) != 0)
  {
    uint64_t v4 = (id *)MEMORY[0x263F53E98];
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x800000024A5EB0F0 || (sub_24A5E99A0() & 1) != 0)
  {
    uint64_t v4 = (id *)MEMORY[0x263F53EA8];
  }
  else
  {
    if ((a1 != 0xD000000000000012 || a2 != 0x800000024A5EB8D0) && (sub_24A5E99A0() & 1) == 0) {
      return 0;
    }
    uint64_t v4 = (id *)MEMORY[0x263F53EB0];
  }
  id v5 = *v4;
  id v6 = *v4;
  return v5;
}

unint64_t sub_24A5E8DA0()
{
  unint64_t result = qword_26B178908;
  if (!qword_26B178908)
  {
    sub_24A5E8FF8(255, (unint64_t *)&unk_26B1788F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B178908);
  }
  return result;
}

uint64_t sub_24A5E8E08(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24A5E8E50()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unint64_t sub_24A5E8E60()
{
  return sub_24A5E3F54(*(unsigned char *)(v0 + 16));
}

uint64_t sub_24A5E8E70@<X0>(unsigned char *a1@<X8>)
{
  return sub_24A5DEFA0(a1);
}

uint64_t sub_24A5E8E98()
{
  return sub_24A5DF044();
}

uint64_t sub_24A5E8EC8@<X0>(unsigned char *a1@<X8>)
{
  return sub_24A5DEFA0(a1);
}

uint64_t sub_24A5E8EF4(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

unint64_t sub_24A5E8F00()
{
  unint64_t result = qword_2697A6FE0;
  if (!qword_2697A6FE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2697A6FD8);
    sub_24A5E8F7C();
    sub_24A5D918C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697A6FE0);
  }
  return result;
}

unint64_t sub_24A5E8F7C()
{
  unint64_t result = qword_2697A6DC0;
  if (!qword_2697A6DC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2697A6FF0);
    sub_24A5D918C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697A6DC0);
  }
  return result;
}

uint64_t sub_24A5E8FF0()
{
  return swift_release();
}

uint64_t sub_24A5E8FF8(uint64_t a1, unint64_t *a2)
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

void sub_24A5E9038(char a1)
{
  sub_24A5E45E8(*(void **)(v1 + 24), a1);
}

uint64_t sub_24A5E9064@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_24A5E9330();
  *a1 = v3;
  return result;
}

uint64_t sub_24A5E9090()
{
  return sub_24A5E9340();
}

uint64_t objectdestroy_130Tm()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_24A5E90FC(char a1)
{
  sub_24A5E407C(*(void **)(v1 + 24), a1);
}

uint64_t sub_24A5E9130()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24A5E9140()
{
  return MEMORY[0x270EEF870]();
}

uint64_t sub_24A5E9150()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_24A5E9160()
{
  return MEMORY[0x270EEF8D8]();
}

uint64_t sub_24A5E9170()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_24A5E9180()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_24A5E9190()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24A5E91A0()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_24A5E91B0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_24A5E91C0()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_24A5E91D0()
{
  return MEMORY[0x270F87508]();
}

uint64_t sub_24A5E91E0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24A5E91F0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24A5E9200()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24A5E9210()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_24A5E9220()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_24A5E9230()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_24A5E9240()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_24A5E9250()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_24A5E9260()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_24A5E9270()
{
  return MEMORY[0x270EFF808]();
}

uint64_t sub_24A5E9280()
{
  return MEMORY[0x270EFF818]();
}

uint64_t sub_24A5E9290()
{
  return MEMORY[0x270EFF838]();
}

uint64_t sub_24A5E92A0()
{
  return MEMORY[0x270EFF850]();
}

uint64_t sub_24A5E92B0()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_24A5E92C0()
{
  return MEMORY[0x270EFFB88]();
}

uint64_t sub_24A5E92D0()
{
  return MEMORY[0x270EFFBA0]();
}

uint64_t sub_24A5E92E0()
{
  return MEMORY[0x270F00388]();
}

uint64_t sub_24A5E92F0()
{
  return MEMORY[0x270F00820]();
}

uint64_t sub_24A5E9300()
{
  return MEMORY[0x270F00828]();
}

uint64_t sub_24A5E9310()
{
  return MEMORY[0x270F00838]();
}

uint64_t sub_24A5E9320()
{
  return MEMORY[0x270F00840]();
}

uint64_t sub_24A5E9330()
{
  return MEMORY[0x270F00940]();
}

uint64_t sub_24A5E9340()
{
  return MEMORY[0x270F00948]();
}

uint64_t sub_24A5E9350()
{
  return MEMORY[0x270F00D10]();
}

uint64_t sub_24A5E9360()
{
  return MEMORY[0x270F00DF0]();
}

uint64_t sub_24A5E9370()
{
  return MEMORY[0x270F00E00]();
}

uint64_t sub_24A5E9380()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_24A5E9390()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_24A5E93A0()
{
  return MEMORY[0x270F01228]();
}

uint64_t sub_24A5E93B0()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_24A5E93C0()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_24A5E93D0()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_24A5E93E0()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_24A5E93F0()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_24A5E9400()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_24A5E9410()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_24A5E9420()
{
  return MEMORY[0x270F02948]();
}

uint64_t sub_24A5E9430()
{
  return MEMORY[0x270F02950]();
}

uint64_t sub_24A5E9440()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_24A5E9450()
{
  return MEMORY[0x270F02D68]();
}

uint64_t sub_24A5E9460()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_24A5E9470()
{
  return MEMORY[0x270F03248]();
}

uint64_t sub_24A5E9480()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_24A5E9490()
{
  return MEMORY[0x270F5D070]();
}

uint64_t sub_24A5E94A0()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_24A5E94B0()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_24A5E94C0()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_24A5E94D0()
{
  return MEMORY[0x270F04248]();
}

uint64_t sub_24A5E94E0()
{
  return MEMORY[0x270F04748]();
}

uint64_t sub_24A5E94F0()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_24A5E9500()
{
  return MEMORY[0x270F04AB0]();
}

uint64_t sub_24A5E9510()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_24A5E9520()
{
  return MEMORY[0x270F04B98]();
}

uint64_t sub_24A5E9530()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_24A5E9540()
{
  return MEMORY[0x270F04D40]();
}

uint64_t sub_24A5E9550()
{
  return MEMORY[0x270F04D50]();
}

uint64_t sub_24A5E9560()
{
  return MEMORY[0x270F04D70]();
}

uint64_t sub_24A5E9570()
{
  return MEMORY[0x270F05140]();
}

uint64_t sub_24A5E9580()
{
  return MEMORY[0x270F051A8]();
}

uint64_t sub_24A5E9590()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24A5E95A0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_24A5E95B0()
{
  return MEMORY[0x270EF1908]();
}

uint64_t sub_24A5E95C0()
{
  return MEMORY[0x270EF1918]();
}

uint64_t sub_24A5E95D0()
{
  return MEMORY[0x270EF1928]();
}

uint64_t sub_24A5E95E0()
{
  return MEMORY[0x270EF1938]();
}

uint64_t sub_24A5E95F0()
{
  return MEMORY[0x270EF1950]();
}

uint64_t sub_24A5E9600()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_24A5E9610()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24A5E9620()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_24A5E9630()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_24A5E9640()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24A5E9650()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_24A5E9660()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24A5E9670()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24A5E9680()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24A5E9690()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24A5E96A0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_24A5E96B0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_24A5E96C0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24A5E96D0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_24A5E96E0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_24A5E96F0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_24A5E9700()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_24A5E9710()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_24A5E9720()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_24A5E9730()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_24A5E9740()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_24A5E9750()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24A5E9760()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_24A5E9770()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24A5E9780()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_24A5E9790()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_24A5E97A0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24A5E97B0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24A5E97C0()
{
  return MEMORY[0x270EF24F0]();
}

uint64_t sub_24A5E97D0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24A5E97E0()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_24A5E97F0()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_24A5E9800()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_24A5E9810()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_24A5E9820()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24A5E9830()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24A5E9840()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24A5E9850()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_24A5E9860()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24A5E9870()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_24A5E9880()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_24A5E9890()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_24A5E98A0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_24A5E98B0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_24A5E98C0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24A5E98D0()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_24A5E98E0()
{
  return MEMORY[0x270F9EF88]();
}

uint64_t sub_24A5E98F0()
{
  return MEMORY[0x270F9EFB0]();
}

uint64_t sub_24A5E9900()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_24A5E9910()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24A5E9920()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24A5E9930()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24A5E9940()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24A5E9950()
{
  return MEMORY[0x270F9F0A8]();
}

uint64_t sub_24A5E9960()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24A5E9970()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24A5E9990()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_24A5E99A0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24A5E99B0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24A5E99C0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24A5E99D0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24A5E99E0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}