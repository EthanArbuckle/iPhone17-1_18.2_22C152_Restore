uint64_t NetworkInterface.hash(into:)()
{
  return sub_1BF466A68();
}

uint64_t NetworkInterface.hashValue.getter()
{
  return sub_1BF466A98();
}

BOOL sub_1BF43419C(char *a1, char *a2)
{
  return static NetworkInterface.__derived_enum_equals(_:_:)(*a1, *a2);
}

uint64_t sub_1BF4341A8()
{
  return NetworkInterface.hashValue.getter();
}

uint64_t sub_1BF4341B0()
{
  return NetworkInterface.hash(into:)();
}

unint64_t sub_1BF4341BC()
{
  unint64_t result = qword_1EA1485D8;
  if (!qword_1EA1485D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1485D8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for NetworkInterface(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFB)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v5 = v6 - 6;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for NetworkInterface(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BF43435CLL);
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

ValueMetadata *type metadata accessor for NetworkInterface()
{
  return &type metadata for NetworkInterface;
}

id sub_1BF434394()
{
  id result = objc_msgSend(self, sel_sharedDefaultEvaluator);
  if (result)
  {
    v1 = result;
    uint64_t v2 = swift_allocObject();
    sub_1BF434444(v1);
    return (id)v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BF4343FC(unint64_t a1)
{
  if (a1 < 5) {
    return (a1 + 1);
  }
  else {
    return 1;
  }
}

uint64_t sub_1BF43440C()
{
  uint64_t result = sub_1BF465F78();
  qword_1EBA92E88 = result;
  return result;
}

uint64_t sub_1BF434444(void *a1)
{
  uint64_t v2 = v1;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = 0;
  swift_getKeyPath();
  swift_allocObject();
  swift_weakInit();
  id v4 = a1;
  uint64_t v5 = sub_1BF464DB8();

  swift_release();
  swift_release();
  unsigned int v6 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = v5;

  return v2;
}

id sub_1BF43451C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_path);
  *a2 = result;
  return result;
}

uint64_t sub_1BF434558()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1BF4345B0();
    return swift_release();
  }
  return result;
}

void sub_1BF4345B0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BF465418();
  MEMORY[0x1F4188790](v3 - 8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
  sub_1BF465478();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BF4756C0;
  v17 = v2;
  v16[0] = v0;
  swift_retain();
  id v4 = (id)AMSLogKey();
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = sub_1BF465FA8();
    uint64_t v8 = v7;

    sub_1BF465408();
    sub_1BF4653F8();
    __swift_project_boxed_opaque_existential_2(v16, (uint64_t)v17);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    v14[0] = DynamicType;
    sub_1BF4653D8();
    sub_1BF3A7DB8((uint64_t)v14);
    sub_1BF4653F8();
    uint64_t MetatypeMetadata = MEMORY[0x1E4FBB1A0];
    v14[0] = v6;
    v14[1] = v8;
    sub_1BF4653D8();
  }
  else
  {
    sub_1BF465408();
    sub_1BF4653F8();
    __swift_project_boxed_opaque_existential_2(v16, (uint64_t)v17);
    uint64_t v10 = swift_getDynamicType();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    v14[0] = v10;
    sub_1BF4653D8();
  }
  sub_1BF3A7DB8((uint64_t)v14);
  sub_1BF4653F8();
  sub_1BF465428();
  type metadata accessor for Log();
  __swift_destroy_boxed_opaque_existential_2((uint64_t)v16);
  sub_1BF4653A8();
  sub_1BF4653A8();
  BOOL v11 = sub_1BF434A2C();
  v17 = (ValueMetadata *)MEMORY[0x1E4FBB390];
  LOBYTE(v16[0]) = v11;
  sub_1BF465438();
  sub_1BF3A7DB8((uint64_t)v16);
  sub_1BF4653A8();
  char v12 = sub_1BF434A84();
  v17 = &type metadata for NetworkInterface;
  LOBYTE(v16[0]) = v12;
  sub_1BF465438();
  sub_1BF3A7DB8((uint64_t)v16);
  sub_1BF42B61C();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(self, sel_defaultCenter);
  if (qword_1EBA92E98 != -1) {
    swift_once();
  }
  objc_msgSend(v13, sel_postNotificationName_object_, qword_1EBA92E88, v1, v14[0]);
}

uint64_t sub_1BF434988()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + 24);
  if (v2)
  {
    id v3 = v2;
    sub_1BF464D68();
  }
  return v1;
}

uint64_t sub_1BF4349D4()
{
  sub_1BF434988();

  return MEMORY[0x1F4186488](v0, 32, 7);
}

uint64_t type metadata accessor for NWPathNetworkInquiry()
{
  return self;
}

BOOL sub_1BF434A2C()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_path);
  unint64_t v2 = (unint64_t)objc_msgSend(v1, sel_status);

  return (v2 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

uint64_t sub_1BF434A84()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_path);
  id v2 = objc_msgSend(v1, sel_interface);

  if (!v2) {
    return 0;
  }
  id v3 = objc_msgSend(v2, sel_type);

  return sub_1BF4343FC((unint64_t)v3);
}

id sub_1BF434B18(SEL *a1)
{
  id v3 = objc_msgSend(*(id *)(v1 + 16), sel_path);
  id v4 = [v3 *a1];

  return v4;
}

uint64_t sub_1BF434B68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v5;
  if (qword_1EBA92E98 != -1) {
    swift_once();
  }
  BOOL v11 = (void *)qword_1EBA92E88;
  void v16[3] = v10;
  v16[0] = v5;
  sub_1BF3AA4C4(a1, (uint64_t)v15);
  uint64_t v12 = type metadata accessor for CommonNetworkObservation();
  swift_allocObject();
  id v13 = v11;
  swift_retain();
  swift_retain();
  uint64_t result = sub_1BF3ED034(v13, v16, (uint64_t)v15, a2, a3);
  a4[3] = v12;
  a4[4] = (uint64_t)&off_1F1AAF0D0;
  *a4 = result;
  return result;
}

BOOL sub_1BF434C8C()
{
  return sub_1BF434A2C();
}

uint64_t sub_1BF434CB4()
{
  return sub_1BF434A84();
}

unint64_t sub_1BF434CD8()
{
  return (unint64_t)sub_1BF434B18((SEL *)&selRef_isExpensive) & 1;
}

unint64_t sub_1BF434D08()
{
  return (unint64_t)sub_1BF434B18((SEL *)&selRef_isConstrained) & 1;
}

uint64_t sub_1BF434D38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_1BF434B68(a1, a2, a3, a4);
}

char *keypath_get_selector_path()
{
  return sel_path;
}

uint64_t sub_1BF434D6C()
{
  swift_weakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BF434DA4()
{
  return sub_1BF434558();
}

id sub_1BF434DAC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  sub_1BF466058();
  swift_bridgeObjectRelease();
  type metadata accessor for Artwork();
  swift_allocObject();
  uint64_t v6 = Artwork.init(template:size:backgroundColor:style:crop:variants:cachePath:accessibilityIdentifier:)(0x656372756F736572, 0xEB000000002F2F3ALL, 0, 0, 25186, 0xE200000000000000, MEMORY[0x1E4FBC860], 0, 0.0, 0.0, 0, 0);
  uint64_t v7 = *(void **)(a3 + 16);
  id v8 = v7;

  return sub_1BF434EB0(0, v6, v7, a3, v7, a4);
}

id sub_1BF434EB0(int a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v69 = a5;
  id v68 = a3;
  int v66 = a1;
  __src[11] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94B20);
  MEMORY[0x1F4188790](v9 - 8);
  BOOL v11 = (char *)&v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1BF464E58();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  v15 = (char *)&v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BF3A9E60(0, qword_1EBA96530);
  sub_1BF465708();
  sub_1BF465CC8();
  v16 = (void *)__src[0];
  sub_1BF3B8628(*(void *)(a2 + 64), *(void *)(a2 + 72), *(double *)(a2 + 32), *(double *)(a2 + 40), *(double *)(a2 + 32), *(double *)(a2 + 40));
  double v18 = v17;
  double v20 = v19;
  uint64_t v21 = swift_retain();
  ArtworkRequest.init(artwork:exactSize:)(v21, (uint64_t)__src, v18, v20);
  ArtworkRequest.makeURL()();
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12) == 1)
  {
    sub_1BF3ADDF0((uint64_t)v11, &qword_1EBA94B20);
    type metadata accessor for Log();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
    uint64_t v22 = sub_1BF465478();
    OUTLINED_FUNCTION_0_2(v22);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BF474A50;
    sub_1BF4653A8();
    v73 = &type metadata for ArtworkRequest;
    v72[0] = (id)swift_allocObject();
    memcpy((char *)v72[0] + 16, __src, 0x58uLL);
    sub_1BF465438();
    sub_1BF3ADDF0((uint64_t)v72, &qword_1EBA96600);
    sub_1BF42B5AC();

    sub_1BF430988(a4);
    swift_bridgeObjectRelease();
    swift_release();

    return 0;
  }
  id v63 = a6;
  uint64_t v64 = a4;
  sub_1BF3BC3D8((uint64_t)__src);
  v23 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
  v60 = v15;
  v23(v15, v11, v12);
  id v24 = objc_msgSend(self, sel_mainBundle);
  if (qword_1EA147648 != -1) {
    swift_once();
  }
  v62 = (ValueMetadata *)v12;
  uint64_t v61 = v13;
  id v65 = v16;
  uint64_t v25 = qword_1EA150C08;
  uint64_t v26 = qword_1EA147640;
  id v27 = (id)qword_1EA150C08;
  if (v26 != -1) {
    swift_once();
  }
  uint64_t v28 = qword_1EA150C00;
  v72[0] = (id)MEMORY[0x1E4FBC860];
  id v29 = (id)qword_1EA150C00;
  if (v24)
  {
    id v30 = v24;
    MEMORY[0x1C18A98D0]();
    OUTLINED_FUNCTION_2_32();
    if (v31) {
      OUTLINED_FUNCTION_1_30();
    }
    sub_1BF4661A8();
    sub_1BF466168();
  }
  if (v25)
  {
    id v32 = v27;
    MEMORY[0x1C18A98D0]();
    OUTLINED_FUNCTION_2_32();
    if (v31) {
      OUTLINED_FUNCTION_1_30();
    }
    sub_1BF4661A8();
    sub_1BF466168();
  }
  id v33 = v69;
  v34 = v60;
  if (v28)
  {
    id v35 = v29;
    MEMORY[0x1C18A98D0]();
    OUTLINED_FUNCTION_2_32();
    if (v31) {
      OUTLINED_FUNCTION_1_30();
    }
    sub_1BF4661A8();
    sub_1BF466168();
  }

  v36 = (void *)sub_1BF464DE8();
  sub_1BF3A9E60(0, (unint64_t *)&qword_1EBA93460);
  v37 = (void *)sub_1BF466128();
  swift_bridgeObjectRelease();
  id v38 = v65;
  id v39 = objc_msgSend(v65, sel_fetchImageWithURL_searchBundles_, v36, v37);

  v72[0] = 0;
  id v40 = objc_msgSend(v39, sel_resultWithError_, v72);

  if (!v40)
  {
    id v44 = v72[0];
    v45 = (void *)sub_1BF464D88();

    swift_willThrow();
    uint64_t v67 = type metadata accessor for Log();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
    uint64_t v46 = sub_1BF465478();
    OUTLINED_FUNCTION_0_2(v46);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BF4756B0;
    sub_1BF4653A8();
    v47 = v34;
    v48 = v62;
    v73 = v62;
    boxed_opaque_existential_2Tm = __swift_allocate_boxed_opaque_existential_2Tm((uint64_t *)v72);
    uint64_t v50 = v61;
    (*(void (**)(uint64_t *, char *, ValueMetadata *))(v61 + 16))(boxed_opaque_existential_2Tm, v47, v48);
    sub_1BF465438();
    sub_1BF3ADDF0((uint64_t)v72, &qword_1EBA96600);
    sub_1BF4653A8();
    swift_getErrorValue();
    uint64_t v51 = v70;
    v52 = v71;
    v73 = v71;
    v53 = __swift_allocate_boxed_opaque_existential_2Tm((uint64_t *)v72);
    (*((void (**)(uint64_t *, uint64_t, ValueMetadata *))v52[-1].Description + 2))(v53, v51, v52);
    sub_1BF465438();
    sub_1BF3ADDF0((uint64_t)v72, &qword_1EBA96600);
    sub_1BF42B5AC();

    swift_bridgeObjectRelease();
    sub_1BF430988(v64);
    swift_release();

    (*(void (**)(char *, ValueMetadata *))(v50 + 8))(v47, v48);
    return 0;
  }
  char v41 = v66 & 1;
  id v42 = v72[0];
  if (v33) {
    id v43 = objc_msgSend(v40, sel_imageWithTintColor_, v33);
  }
  else {
    id v43 = v40;
  }
  v55 = v43;
  sub_1BF3A9E60(0, &qword_1EA1485E0);
  id v56 = v55;
  id v57 = v63;
  id v58 = sub_1BF435C0C(v56, v57, v41);
  id v54 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_attributedStringWithAttachment_, v58);

  sub_1BF430988(v64);
  swift_release();

  (*(void (**)(char *, ValueMetadata *))(v61 + 8))(v34, v62);
  return v54;
}

uint64_t sub_1BF435794()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 104, 7);
}

uint64_t OUTLINED_FUNCTION_1_30()
{
  return sub_1BF466188();
}

id sub_1BF435814()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB0848]), sel_init);
  objc_msgSend(v0, sel_setFirstLineHeadIndent_, 0.0);
  objc_msgSend(v0, sel_setHeadIndent_, 40.0);
  sub_1BF4358D0(MEMORY[0x1E4FBC860], v0);
  objc_msgSend(v0, sel_setDefaultTabInterval_, 40.0);
  objc_msgSend(v0, sel_setParagraphSpacing_, 18.0);
  objc_msgSend(v0, sel_setAlignment_, 4);
  return v0;
}

void sub_1BF4358D0(uint64_t a1, void *a2)
{
  sub_1BF435944();
  id v3 = (id)sub_1BF466128();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setTabStops_, v3);
}

unint64_t sub_1BF435944()
{
  unint64_t result = qword_1EBA94238;
  if (!qword_1EBA94238)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBA94238);
  }
  return result;
}

uint64_t sub_1BF435984(void *a1)
{
  uint64_t result = (uint64_t)objc_msgSend(v1, sel_length);
  uint64_t v4 = result;
  if (result >= 1)
  {
    uint64_t v5 = 0;
    while (1)
    {
      uint64_t result = (uint64_t)objc_msgSend(a1, sel_characterIsMember_, objc_msgSend(v1, sel_characterAtIndex_, v5));
      if ((result & 1) == 0) {
        break;
      }
      if (v4 == ++v5) {
        goto LABEL_18;
      }
    }
    if (v4 == v5) {
      goto LABEL_18;
    }
LABEL_9:
    uint64_t v6 = v4 - 1;
    if (__OFSUB__(v4, 1))
    {
      __break(1u);
    }
    else
    {
      while (v6 >= v5)
      {
        uint64_t result = (uint64_t)objc_msgSend(a1, sel_characterIsMember_, objc_msgSend(v1, sel_characterAtIndex_, v6));
        if (!result) {
          break;
        }
        if (__OFSUB__(v6--, 1))
        {
          __break(1u);
          break;
        }
      }
      uint64_t v8 = v4 - v6;
      if (!__OFSUB__(v4, v6))
      {
        if (!__OFSUB__(v8, 1))
        {
          objc_msgSend(v1, sel_deleteCharactersInRange_, v6 + 1, v8 - 1);
          uint64_t v4 = v5;
          goto LABEL_18;
        }
LABEL_23:
        __break(1u);
        return result;
      }
    }
    __break(1u);
    goto LABEL_23;
  }
  if (result)
  {
    uint64_t v5 = 0;
    goto LABEL_9;
  }
LABEL_18:

  return (uint64_t)objc_msgSend(v1, sel_deleteCharactersInRange_, 0, v4);
}

char *sub_1BF435AC0(void *a1)
{
  if ((uint64_t)objc_msgSend(v1, sel_length) < 1) {
    return 0;
  }
  uint64_t result = (char *)objc_msgSend(v1, sel_length);
  if (!__OFSUB__(result, 1)) {
    return (char *)objc_msgSend(a1, sel_characterIsMember_, objc_msgSend(v1, sel_characterAtIndex_, result - 1));
  }
  __break(1u);
  return result;
}

id sub_1BF435B44(void *a1)
{
  uint64_t v3 = (uint64_t)objc_msgSend(v1, sel_length);
  uint64_t v4 = v3;
  if (v3 < 1)
  {
    if (!v3) {
      goto LABEL_10;
    }
    uint64_t v5 = 0;
    goto LABEL_9;
  }
  uint64_t v5 = 0;
  while ((objc_msgSend(a1, sel_characterIsMember_, objc_msgSend(v1, sel_characterAtIndex_, v5)) & 1) != 0)
  {
    if (v4 == ++v5) {
      goto LABEL_10;
    }
  }
  if (v4 != v5) {
LABEL_9:
  }
    uint64_t v4 = v5;
LABEL_10:

  return objc_msgSend(v1, sel_deleteCharactersInRange_, 0, v4);
}

id sub_1BF435C0C(void *a1, void *a2, char a3)
{
  id v6 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  objc_msgSend(v6, sel_setImage_, a1);
  objc_msgSend(a2, sel_pointSize);
  double v8 = v7;
  objc_msgSend(a1, sel_size);
  double v10 = v9;
  objc_msgSend(a1, sel_size);
  double v12 = v8 * (v10 / v11);
  objc_msgSend(v6, sel_bounds);
  double v14 = v13;
  if (a3)
  {
    objc_msgSend(a2, sel_capHeight);
    double v15 = round(v16 - v8) * 0.5 + 0.5;
  }
  else
  {
    objc_msgSend(v6, sel_bounds);
    double v12 = v12 * 0.85;
    double v8 = v8 * 0.85;
  }
  objc_msgSend(v6, sel_setBounds_, v14, v15, v12, v8);

  return v6;
}

uint64_t sub_1BF435D4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BF435DA0(a1, a2, a3);
}

uint64_t sub_1BF435DA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1BF465898();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  *(void *)(v3 + qword_1EBA94C88) = 0;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v5);
  uint64_t v8 = sub_1BF4656C8();
  sub_1BF436030();
  swift_retain();
  sub_1BF4656F8();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a3, v5);
  double v9 = *(void **)(v8 + qword_1EBA94C88);
  *(void *)(v8 + qword_1EBA94C88) = v11[1];

  return v8;
}

void sub_1BF435EFC()
{
}

uint64_t ObjectGraph.deinit()
{
  uint64_t v0 = sub_1BF465718();

  return v0;
}

uint64_t ObjectGraph.__deallocating_deinit()
{
  uint64_t v0 = sub_1BF465718();

  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t type metadata accessor for ObjectGraph()
{
  uint64_t result = qword_1EBA94C90;
  if (!qword_1EBA94C90) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1BF435FDC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1BF436028()
{
  return type metadata accessor for ObjectGraph();
}

unint64_t sub_1BF436030()
{
  unint64_t result = qword_1EBA96510;
  if (!qword_1EBA96510)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBA96510);
  }
  return result;
}

void *PageActionDefinition.__allocating_init(id:model:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t result = (void *)swift_allocObject();
  result[4] = a3;
  result[5] = a4;
  result[6] = a5;
  result[2] = a1;
  result[3] = a2;
  return result;
}

void *PageActionDefinition.init(id:model:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[4] = a3;
  v5[5] = a4;
  v5[6] = a5;
  v5[2] = a1;
  v5[3] = a2;
  return v5;
}

uint64_t PageActionDefinition.id.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PageActionDefinition.model.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t PageActionDefinition.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PageActionDefinition.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186488](v0, 56, 7);
}

uint64_t type metadata accessor for PageActionDefinition()
{
  return self;
}

uint64_t PageActionLoader.pageActionDefinition(withLocation:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v7 = sub_1BF4363D0(a1, a2);
  unint64_t v8 = v7;
  if (v7 >> 62)
  {
    uint64_t v9 = sub_1BF466878();
    if (!v9) {
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v9 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v9) {
      goto LABEL_24;
    }
  }
  sub_1BF3A7D90(0, (v8 & 0xC000000000000001) == 0, v8);
  if ((v8 & 0xC000000000000001) != 0)
  {
LABEL_29:
    uint64_t v4 = MEMORY[0x1C18A9F80](0, v8);
  }
  else
  {
    uint64_t v4 = *(void *)(v8 + 32);
    swift_retain();
  }
  BOOL v10 = *(void *)(v4 + 16) == a3 && *(void *)(v4 + 24) == a4;
  if (v10 || (sub_1BF466968() & 1) != 0)
  {
LABEL_10:
    swift_bridgeObjectRelease();
    return v4;
  }
  uint64_t result = swift_release();
  if (v9 == 1)
  {
LABEL_24:
    swift_bridgeObjectRelease();
    sub_1BF436834();
    swift_allocError();
    swift_willThrow();
    return v4;
  }
  uint64_t v12 = 5;
  while (1)
  {
    unint64_t v13 = v12 - 4;
    if ((v8 & 0xC000000000000001) != 0)
    {
      uint64_t v4 = MEMORY[0x1C18A9F80](v12 - 4, v8);
      goto LABEL_17;
    }
    if (v13 >= *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      break;
    }
    uint64_t v4 = *(void *)(v8 + 8 * v12);
    swift_retain();
LABEL_17:
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v12 - 3;
    if (v14)
    {
      __break(1u);
      goto LABEL_29;
    }
    BOOL v16 = *(void *)(v4 + 16) == a3 && *(void *)(v4 + 24) == a4;
    if (v16 || (sub_1BF466968() & 1) != 0) {
      goto LABEL_10;
    }
    uint64_t result = swift_release();
    ++v12;
    if (v15 == v9) {
      goto LABEL_24;
    }
  }
  __break(1u);
  return result;
}

uint64_t static PageActionLoaderError.__derived_enum_equals(_:_:)()
{
  return 1;
}

uint64_t PageActionLoaderError.hash(into:)()
{
  return sub_1BF466A68();
}

uint64_t PageActionLoaderError.hashValue.getter()
{
  return sub_1BF466A98();
}

uint64_t sub_1BF4363D0(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  uint64_t v7 = sub_1BF465418();
  MEMORY[0x1F4188790](v7 - 8);
  swift_beginAccess();
  uint64_t v8 = v2[3];
  if (*(void *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v9 = sub_1BF44C030((uint64_t)a1, a2);
    if (v10)
    {
      uint64_t v11 = *(void *)(*(void *)(v8 + 56) + 8 * v9);
      swift_endAccess();
      swift_bridgeObjectRetain();
LABEL_10:
      swift_bridgeObjectRelease();
      return v11;
    }
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  uint64_t v12 = sub_1BF43A680(a1, a2);
  if (dynamic_cast_existential_1_conditional(v12))
  {
    uint64_t v11 = (*(uint64_t (**)(void))(v21 + 8))();
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v22 = swift_bridgeObjectRetain();
    sub_1BF441AB4(v22, (uint64_t)a1, a2, v23, v24, v25, v26, v27, v30, v31[0]);
    swift_endAccess();
    goto LABEL_10;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
  sub_1BF465478();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BF474840;
  uint64_t v34 = v6;
  v33[0] = v3;
  swift_retain();
  id v13 = (id)AMSLogKey();
  uint64_t v14 = MEMORY[0x1E4FBB1A0];
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = sub_1BF465FA8();
    uint64_t v18 = v17;

    sub_1BF465408();
    sub_1BF4653F8();
    __swift_project_boxed_opaque_existential_2(v33, v34);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    v31[0] = DynamicType;
    sub_1BF4653D8();
    sub_1BF3A7DB8((uint64_t)v31);
    sub_1BF4653F8();
    uint64_t MetatypeMetadata = v14;
    v31[0] = v16;
    v31[1] = v18;
  }
  else
  {
    sub_1BF465408();
    sub_1BF4653F8();
    __swift_project_boxed_opaque_existential_2(v33, v34);
    uint64_t v28 = swift_getDynamicType();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    v31[0] = v28;
  }
  sub_1BF4653D8();
  sub_1BF3A7DB8((uint64_t)v31);
  sub_1BF4653F8();
  sub_1BF465428();
  type metadata accessor for Log();
  __swift_destroy_boxed_opaque_existential_2((uint64_t)v33);
  sub_1BF4653A8();
  uint64_t v34 = v14;
  v33[0] = a1;
  v33[1] = a2;
  swift_bridgeObjectRetain();
  sub_1BF465438();
  sub_1BF3A7DB8((uint64_t)v33);
  sub_1BF42B5AC();
  swift_bridgeObjectRelease();
  return MEMORY[0x1E4FBC860];
}

uint64_t PageActionLoader.deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PageActionLoader.__deallocating_deinit()
{
  PageActionLoader.deinit();

  return MEMORY[0x1F4186488](v0, 32, 7);
}

unint64_t sub_1BF436834()
{
  unint64_t result = qword_1EA1485E8;
  if (!qword_1EA1485E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1485E8);
  }
  return result;
}

unint64_t sub_1BF436884()
{
  unint64_t result = qword_1EA1485F0;
  if (!qword_1EA1485F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1485F0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for PageActionLoaderError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1BF43696CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for PageActionLoaderError()
{
  return &type metadata for PageActionLoaderError;
}

uint64_t type metadata accessor for PageActionLoader()
{
  return self;
}

void *PageDefinition.__allocating_init(id:viewControllerProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  return result;
}

void *PageDefinition.init(id:viewControllerProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a1;
  v4[3] = a2;
  v4[4] = a3;
  v4[5] = a4;
  return v4;
}

uint64_t PageDefinition.id.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PageDefinition.viewControllerProvider.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_retain();
  return v1;
}

uint64_t PageDefinition.deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t PageDefinition.__deallocating_deinit()
{
  PageDefinition.deinit();

  return MEMORY[0x1F4186488](v0, 48, 7);
}

uint64_t type metadata accessor for PageDefinition()
{
  return self;
}

uint64_t static PageLoaderError.__derived_enum_equals(_:_:)()
{
  return 1;
}

uint64_t PageLoaderError.hash(into:)()
{
  return sub_1BF466A68();
}

uint64_t PageLoaderError.hashValue.getter()
{
  return sub_1BF466A98();
}

uint64_t PageLoader.pageDefinition(withLocation:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v7 = sub_1BF436D44(a1, a2);
  unint64_t v8 = v7;
  if (v7 >> 62)
  {
    uint64_t v9 = sub_1BF466878();
    if (!v9) {
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v9 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v9) {
      goto LABEL_24;
    }
  }
  sub_1BF3A7D90(0, (v8 & 0xC000000000000001) == 0, v8);
  if ((v8 & 0xC000000000000001) != 0)
  {
LABEL_29:
    uint64_t v4 = MEMORY[0x1C18A9F80](0, v8);
  }
  else
  {
    uint64_t v4 = *(void *)(v8 + 32);
    swift_retain();
  }
  BOOL v10 = *(void *)(v4 + 16) == a3 && *(void *)(v4 + 24) == a4;
  if (v10 || (sub_1BF466968() & 1) != 0)
  {
LABEL_10:
    swift_bridgeObjectRelease();
    return v4;
  }
  uint64_t result = swift_release();
  if (v9 == 1)
  {
LABEL_24:
    swift_bridgeObjectRelease();
    sub_1BF4371A8();
    swift_allocError();
    swift_willThrow();
    return v4;
  }
  uint64_t v12 = 5;
  while (1)
  {
    unint64_t v13 = v12 - 4;
    if ((v8 & 0xC000000000000001) != 0)
    {
      uint64_t v4 = MEMORY[0x1C18A9F80](v12 - 4, v8);
      goto LABEL_17;
    }
    if (v13 >= *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      break;
    }
    uint64_t v4 = *(void *)(v8 + 8 * v12);
    swift_retain();
LABEL_17:
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v12 - 3;
    if (v14)
    {
      __break(1u);
      goto LABEL_29;
    }
    BOOL v16 = *(void *)(v4 + 16) == a3 && *(void *)(v4 + 24) == a4;
    if (v16 || (sub_1BF466968() & 1) != 0) {
      goto LABEL_10;
    }
    uint64_t result = swift_release();
    ++v12;
    if (v15 == v9) {
      goto LABEL_24;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1BF436D44(void *a1, uint64_t a2)
{
  int v3 = v2;
  uint64_t v6 = *v2;
  uint64_t v7 = sub_1BF465418();
  MEMORY[0x1F4188790](v7 - 8);
  swift_beginAccess();
  uint64_t v8 = v2[3];
  if (*(void *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v9 = sub_1BF44C030((uint64_t)a1, a2);
    if (v10)
    {
      uint64_t v11 = *(void *)(*(void *)(v8 + 56) + 8 * v9);
      swift_endAccess();
      swift_bridgeObjectRetain();
LABEL_10:
      swift_bridgeObjectRelease();
      return v11;
    }
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  uint64_t v12 = sub_1BF43A680(a1, a2);
  if (dynamic_cast_existential_1_conditional(v12))
  {
    uint64_t v11 = (*(uint64_t (**)(void))(v21 + 8))();
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v22 = swift_bridgeObjectRetain();
    sub_1BF441BB4(v22, (uint64_t)a1, a2, v23, v24, v25, v26, v27, v30, v31[0]);
    swift_endAccess();
    goto LABEL_10;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
  sub_1BF465478();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BF474840;
  uint64_t v34 = v6;
  v33[0] = v3;
  swift_retain();
  id v13 = (id)AMSLogKey();
  uint64_t v14 = MEMORY[0x1E4FBB1A0];
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = sub_1BF465FA8();
    uint64_t v18 = v17;

    sub_1BF465408();
    sub_1BF4653F8();
    __swift_project_boxed_opaque_existential_2(v33, v34);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    v31[0] = DynamicType;
    sub_1BF4653D8();
    sub_1BF3A7DB8((uint64_t)v31);
    sub_1BF4653F8();
    uint64_t MetatypeMetadata = v14;
    v31[0] = v16;
    v31[1] = v18;
  }
  else
  {
    sub_1BF465408();
    sub_1BF4653F8();
    __swift_project_boxed_opaque_existential_2(v33, v34);
    uint64_t v28 = swift_getDynamicType();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    v31[0] = v28;
  }
  sub_1BF4653D8();
  sub_1BF3A7DB8((uint64_t)v31);
  sub_1BF4653F8();
  sub_1BF465428();
  type metadata accessor for Log();
  __swift_destroy_boxed_opaque_existential_2((uint64_t)v33);
  sub_1BF4653A8();
  uint64_t v34 = v14;
  v33[0] = a1;
  v33[1] = a2;
  swift_bridgeObjectRetain();
  sub_1BF465438();
  sub_1BF3A7DB8((uint64_t)v33);
  sub_1BF42B5AC();
  swift_bridgeObjectRelease();
  return MEMORY[0x1E4FBC860];
}

uint64_t PageLoader.deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PageLoader.__deallocating_deinit()
{
  PageLoader.deinit();

  return MEMORY[0x1F4186488](v0, 32, 7);
}

unint64_t sub_1BF4371A8()
{
  unint64_t result = qword_1EA1485F8;
  if (!qword_1EA1485F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1485F8);
  }
  return result;
}

unint64_t sub_1BF4371F8()
{
  unint64_t result = qword_1EA148600;
  if (!qword_1EA148600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA148600);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for PageLoaderError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1BF4372E0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for PageLoaderError()
{
  return &type metadata for PageLoaderError;
}

uint64_t type metadata accessor for PageLoader()
{
  return self;
}

uint64_t sub_1BF437340(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = 0;
    int v3 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v5 = *v3++;
      uint64_t v4 = v5;
      if ((v5 & ~v2) == 0) {
        uint64_t v4 = 0;
      }
      v2 |= v4;
      --v1;
    }
    while (v1);
  }
  else
  {
    uint64_t v2 = 0;
  }
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_1BF437394(uint64_t a1, uint64_t a2)
{
  return a2 | a1;
}

uint64_t sub_1BF43739C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = CGSizeMake(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1BF4373C8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = j__OUTLINED_FUNCTION_22_3(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_1BF4373FC@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1BF43742C(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_1BF43742C(uint64_t a1, uint64_t a2)
{
  return a2 ^ a1;
}

BOOL sub_1BF437434(void *a1, uint64_t *a2)
{
  return sub_1BF43743C(a1, *a2);
}

BOOL sub_1BF43743C(void *a1, uint64_t a2)
{
  uint64_t v3 = *v2 & a2;
  if (v3 != a2) {
    *v2 |= a2;
  }
  *a1 = a2;
  return v3 != a2;
}

uint64_t sub_1BF437468@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1BF43749C(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_1BF43749C(uint64_t a1)
{
  uint64_t result = *v1 & a1;
  if (result) {
    *v1 &= ~a1;
  }
  return result;
}

uint64_t sub_1BF4374C0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1BF4374F4(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_1BF4374F4(uint64_t a1)
{
  uint64_t v2 = *v1;
  *v1 |= a1;
  return v2 & a1;
}

void sub_1BF43750C(uint64_t *a1)
{
}

void sub_1BF437514(uint64_t a1)
{
  OUTLINED_FUNCTION_25_3(*v1 | a1);
}

void sub_1BF437520(uint64_t *a1)
{
}

void sub_1BF437528(uint64_t a1)
{
  OUTLINED_FUNCTION_25_3(*v1 & a1);
}

void sub_1BF437534(uint64_t *a1)
{
}

void sub_1BF43753C(uint64_t a1)
{
  OUTLINED_FUNCTION_25_3(*v1 ^ a1);
}

uint64_t sub_1BF437548@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1BF437578(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_1BF437578(uint64_t a1, uint64_t a2)
{
  return a2 & ~a1;
}

BOOL sub_1BF437580(uint64_t *a1)
{
  return sub_1BF43758C(*a1, *v1);
}

BOOL sub_1BF43758C(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_1BF437598(uint64_t *a1)
{
  return sub_1BF4375A4(*a1, *v1);
}

BOOL sub_1BF4375A4(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_1BF4375B0(uint64_t *a1)
{
  return sub_1BF4375BC(*a1, *v1);
}

BOOL sub_1BF4375BC(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

BOOL sub_1BF4375C8(uint64_t a1)
{
  return a1 == 0;
}

void sub_1BF4375D4(uint64_t *a1)
{
}

void sub_1BF4375DC(uint64_t a1)
{
  OUTLINED_FUNCTION_25_3(*v1 & ~a1);
}

uint64_t sub_1BF4375E8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = CGSizeMake(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_1BF437618@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1BF437340(a1);
  *a2 = result;
  return result;
}

uint64_t sub_1BF437640()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1BF465778();
  MEMORY[0x1F4188790](v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 24) = 0;
  sub_1BF465548();
  sub_1BF465708();
  sub_1BF465CC8();
  sub_1BF465B88();
  swift_allocObject();
  uint64_t v3 = sub_1BF465B78();
  swift_release();
  *(void *)(v1 + 16) = v3;
  return v1;
}

void PageRenderMetricsPresenterWrapper.start(_:)()
{
  OUTLINED_FUNCTION_21_6();
  uint64_t v1 = OUTLINED_FUNCTION_24_2();
  uint64_t v2 = OUTLINED_FUNCTION_44(v1);
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_1_31();
  if (v3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
    uint64_t v5 = OUTLINED_FUNCTION_10_4();
    OUTLINED_FUNCTION_0_2(v5);
    uint64_t v6 = (__n128 *)OUTLINED_FUNCTION_2_33();
    uint64_t v7 = OUTLINED_FUNCTION_18_4(v6, (__n128)xmmword_1BF474A50);
    OUTLINED_FUNCTION_10_14(v7);
    if ((id)AMSLogKey())
    {
      sub_1BF465FA8();
      OUTLINED_FUNCTION_15_5();
      OUTLINED_FUNCTION_6_10();
      OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_4_17();
      uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_12_11(MetatypeMetadata);
      sub_1BF3A7DB8((uint64_t)v10);
      OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_9_15(MEMORY[0x1E4FBB1A0]);
    }
    else
    {
      OUTLINED_FUNCTION_11_5();
      OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_3_25();
      uint64_t v9 = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_13_10(v9);
    }
    sub_1BF3A7DB8((uint64_t)v10);
    sub_1BF4653F8();
    OUTLINED_FUNCTION_14_6();
    type metadata accessor for Log();
    OUTLINED_FUNCTION_5_18();
    OUTLINED_FUNCTION_19_5();
    sub_1BF4653A8();
    sub_1BF42B5AC();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_27_3();
    sub_1BF465B68();
    swift_release();
    uint64_t v4 = *(void *)(v0 + 24);
    if ((v4 & 1) == 0) {
      *(void *)(v0 + 24) = v4 | 1;
    }
  }
  OUTLINED_FUNCTION_20_4();
}

uint64_t type metadata accessor for PageRenderMetricsPresenterWrapper()
{
  return self;
}

void PageRenderMetricsPresenterWrapper.end(_:)()
{
  OUTLINED_FUNCTION_21_6();
  uint64_t v1 = OUTLINED_FUNCTION_24_2();
  uint64_t v2 = OUTLINED_FUNCTION_44(v1);
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_1_31();
  if ((v3 & 2) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
    uint64_t v5 = OUTLINED_FUNCTION_10_4();
    OUTLINED_FUNCTION_0_2(v5);
    uint64_t v6 = (__n128 *)OUTLINED_FUNCTION_2_33();
    uint64_t v7 = OUTLINED_FUNCTION_18_4(v6, (__n128)xmmword_1BF474A50);
    OUTLINED_FUNCTION_10_14(v7);
    if ((id)AMSLogKey())
    {
      sub_1BF465FA8();
      OUTLINED_FUNCTION_15_5();
      OUTLINED_FUNCTION_6_10();
      OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_4_17();
      uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_12_11(MetatypeMetadata);
      sub_1BF3A7DB8((uint64_t)v10);
      OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_9_15(MEMORY[0x1E4FBB1A0]);
    }
    else
    {
      OUTLINED_FUNCTION_11_5();
      OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_3_25();
      uint64_t v9 = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_13_10(v9);
    }
    sub_1BF3A7DB8((uint64_t)v10);
    sub_1BF4653F8();
    OUTLINED_FUNCTION_14_6();
    type metadata accessor for Log();
    OUTLINED_FUNCTION_5_18();
    OUTLINED_FUNCTION_19_5();
    sub_1BF4653A8();
    sub_1BF42B5AC();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_27_3();
    sub_1BF465B58();
    swift_release();
    uint64_t v4 = *(void *)(v0 + 24);
    if ((v4 & 2) == 0) {
      *(void *)(v0 + 24) = v4 | 2;
    }
  }
  OUTLINED_FUNCTION_20_4();
}

Swift::Void __swiftcall PageRenderMetricsPresenterWrapper.viewDidLoad()()
{
  OUTLINED_FUNCTION_21_6();
  uint64_t v1 = OUTLINED_FUNCTION_23_5();
  uint64_t v2 = OUTLINED_FUNCTION_44(v1);
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_1_31();
  if ((v3 & 4) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
    uint64_t v5 = OUTLINED_FUNCTION_10_4();
    OUTLINED_FUNCTION_0_2(v5);
    uint64_t v6 = (__n128 *)OUTLINED_FUNCTION_2_33();
    uint64_t v7 = OUTLINED_FUNCTION_18_4(v6, (__n128)xmmword_1BF474A50);
    OUTLINED_FUNCTION_10_14(v7);
    if ((id)AMSLogKey())
    {
      sub_1BF465FA8();
      OUTLINED_FUNCTION_15_5();
      OUTLINED_FUNCTION_6_10();
      OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_4_17();
      uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_12_11(MetatypeMetadata);
      sub_1BF3A7DB8((uint64_t)v10);
      OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_9_15(MEMORY[0x1E4FBB1A0]);
    }
    else
    {
      OUTLINED_FUNCTION_11_5();
      OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_3_25();
      uint64_t v9 = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_13_10(v9);
    }
    sub_1BF3A7DB8((uint64_t)v10);
    sub_1BF4653F8();
    OUTLINED_FUNCTION_14_6();
    type metadata accessor for Log();
    OUTLINED_FUNCTION_5_18();
    OUTLINED_FUNCTION_19_5();
    sub_1BF4653A8();
    sub_1BF42B5AC();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_26_4();
    OUTLINED_FUNCTION_28_3();
    sub_1BF465AA8();
    swift_release();
    uint64_t v4 = *(void *)(v0 + 24);
    if ((v4 & 4) == 0) {
      *(void *)(v0 + 24) = v4 | 4;
    }
  }
  OUTLINED_FUNCTION_20_4();
}

Swift::Void __swiftcall PageRenderMetricsPresenterWrapper.viewWillAppear()()
{
  OUTLINED_FUNCTION_21_6();
  uint64_t v1 = OUTLINED_FUNCTION_23_5();
  uint64_t v2 = OUTLINED_FUNCTION_44(v1);
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_1_31();
  if ((v3 & 8) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
    uint64_t v5 = OUTLINED_FUNCTION_10_4();
    OUTLINED_FUNCTION_0_2(v5);
    uint64_t v6 = (__n128 *)OUTLINED_FUNCTION_2_33();
    uint64_t v7 = OUTLINED_FUNCTION_18_4(v6, (__n128)xmmword_1BF474A50);
    OUTLINED_FUNCTION_10_14(v7);
    if ((id)AMSLogKey())
    {
      sub_1BF465FA8();
      OUTLINED_FUNCTION_15_5();
      OUTLINED_FUNCTION_6_10();
      OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_4_17();
      uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_12_11(MetatypeMetadata);
      sub_1BF3A7DB8((uint64_t)v10);
      OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_9_15(MEMORY[0x1E4FBB1A0]);
    }
    else
    {
      OUTLINED_FUNCTION_11_5();
      OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_3_25();
      uint64_t v9 = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_13_10(v9);
    }
    sub_1BF3A7DB8((uint64_t)v10);
    sub_1BF4653F8();
    OUTLINED_FUNCTION_14_6();
    type metadata accessor for Log();
    OUTLINED_FUNCTION_5_18();
    OUTLINED_FUNCTION_19_5();
    sub_1BF4653A8();
    sub_1BF42B5AC();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_26_4();
    OUTLINED_FUNCTION_28_3();
    sub_1BF465AB8();
    swift_release();
    uint64_t v4 = *(void *)(v0 + 24);
    if ((v4 & 8) == 0) {
      *(void *)(v0 + 24) = v4 | 8;
    }
  }
  OUTLINED_FUNCTION_20_4();
}

Swift::Void __swiftcall PageRenderMetricsPresenterWrapper.viewDidAppear()()
{
  OUTLINED_FUNCTION_21_6();
  uint64_t v1 = OUTLINED_FUNCTION_23_5();
  uint64_t v2 = OUTLINED_FUNCTION_44(v1);
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_1_31();
  if ((v3 & 0x10) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
    uint64_t v5 = OUTLINED_FUNCTION_10_4();
    OUTLINED_FUNCTION_0_2(v5);
    uint64_t v6 = (__n128 *)OUTLINED_FUNCTION_2_33();
    uint64_t v7 = OUTLINED_FUNCTION_18_4(v6, (__n128)xmmword_1BF474A50);
    OUTLINED_FUNCTION_10_14(v7);
    if ((id)AMSLogKey())
    {
      sub_1BF465FA8();
      OUTLINED_FUNCTION_15_5();
      OUTLINED_FUNCTION_6_10();
      OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_4_17();
      uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_12_11(MetatypeMetadata);
      sub_1BF3A7DB8((uint64_t)v10);
      OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_9_15(MEMORY[0x1E4FBB1A0]);
    }
    else
    {
      OUTLINED_FUNCTION_11_5();
      OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_3_25();
      uint64_t v9 = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_13_10(v9);
    }
    sub_1BF3A7DB8((uint64_t)v10);
    sub_1BF4653F8();
    OUTLINED_FUNCTION_14_6();
    type metadata accessor for Log();
    OUTLINED_FUNCTION_5_18();
    OUTLINED_FUNCTION_19_5();
    sub_1BF4653A8();
    sub_1BF42B5AC();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_27_3();
    sub_1BF465B38();
    swift_release();
    uint64_t v4 = *(void *)(v0 + 24);
    if ((v4 & 0x10) == 0) {
      *(void *)(v0 + 24) = v4 | 0x10;
    }
  }
  OUTLINED_FUNCTION_20_4();
}

Swift::Void __swiftcall PageRenderMetricsPresenterWrapper.viewDidDisappear()()
{
  OUTLINED_FUNCTION_21_6();
  uint64_t v1 = OUTLINED_FUNCTION_23_5();
  uint64_t v2 = OUTLINED_FUNCTION_44(v1);
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_1_31();
  if ((v3 & 0x20) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
    uint64_t v5 = OUTLINED_FUNCTION_10_4();
    OUTLINED_FUNCTION_0_2(v5);
    uint64_t v6 = (__n128 *)OUTLINED_FUNCTION_2_33();
    uint64_t v7 = OUTLINED_FUNCTION_18_4(v6, (__n128)xmmword_1BF474A50);
    OUTLINED_FUNCTION_10_14(v7);
    if ((id)AMSLogKey())
    {
      sub_1BF465FA8();
      OUTLINED_FUNCTION_15_5();
      OUTLINED_FUNCTION_6_10();
      OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_4_17();
      uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_12_11(MetatypeMetadata);
      sub_1BF3A7DB8((uint64_t)v10);
      OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_9_15(MEMORY[0x1E4FBB1A0]);
    }
    else
    {
      OUTLINED_FUNCTION_11_5();
      OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_3_25();
      uint64_t v9 = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_13_10(v9);
    }
    sub_1BF3A7DB8((uint64_t)v10);
    sub_1BF4653F8();
    OUTLINED_FUNCTION_14_6();
    type metadata accessor for Log();
    OUTLINED_FUNCTION_5_18();
    OUTLINED_FUNCTION_19_5();
    sub_1BF4653A8();
    sub_1BF42B5AC();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_26_4();
    OUTLINED_FUNCTION_28_3();
    sub_1BF465AC8();
    swift_release();
    uint64_t v4 = *(void *)(v0 + 24);
    if ((v4 & 0x20) == 0) {
      *(void *)(v0 + 24) = v4 | 0x20;
    }
  }
  OUTLINED_FUNCTION_20_4();
}

void PageRenderMetricsPresenterWrapper.viewWillDisappear(forReason:)()
{
  OUTLINED_FUNCTION_21_6();
  uint64_t v1 = OUTLINED_FUNCTION_24_2();
  uint64_t v2 = OUTLINED_FUNCTION_44(v1);
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_1_31();
  if ((v3 & 0x40) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
    uint64_t v5 = OUTLINED_FUNCTION_10_4();
    OUTLINED_FUNCTION_0_2(v5);
    uint64_t v6 = (__n128 *)OUTLINED_FUNCTION_2_33();
    uint64_t v7 = OUTLINED_FUNCTION_18_4(v6, (__n128)xmmword_1BF474A50);
    OUTLINED_FUNCTION_10_14(v7);
    if ((id)AMSLogKey())
    {
      sub_1BF465FA8();
      OUTLINED_FUNCTION_15_5();
      OUTLINED_FUNCTION_6_10();
      OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_4_17();
      uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_12_11(MetatypeMetadata);
      sub_1BF3A7DB8((uint64_t)v10);
      OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_9_15(MEMORY[0x1E4FBB1A0]);
    }
    else
    {
      OUTLINED_FUNCTION_11_5();
      OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_3_25();
      uint64_t v9 = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_13_10(v9);
    }
    sub_1BF3A7DB8((uint64_t)v10);
    sub_1BF4653F8();
    OUTLINED_FUNCTION_14_6();
    type metadata accessor for Log();
    OUTLINED_FUNCTION_5_18();
    OUTLINED_FUNCTION_19_5();
    sub_1BF4653A8();
    sub_1BF42B5AC();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_27_3();
    sub_1BF465B48();
    swift_release();
    uint64_t v4 = *(void *)(v0 + 24);
    if ((v4 & 0x40) == 0) {
      *(void *)(v0 + 24) = v4 | 0x40;
    }
  }
  OUTLINED_FUNCTION_20_4();
}

Swift::Void __swiftcall PageRenderMetricsPresenterWrapper.viewDidReceiveMemoryWarning()()
{
  OUTLINED_FUNCTION_21_6();
  uint64_t v1 = OUTLINED_FUNCTION_23_5();
  uint64_t v2 = OUTLINED_FUNCTION_44(v1);
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_1_31();
  if (v3 < 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
    uint64_t v5 = OUTLINED_FUNCTION_10_4();
    OUTLINED_FUNCTION_0_2(v5);
    uint64_t v6 = (__n128 *)OUTLINED_FUNCTION_2_33();
    uint64_t v7 = OUTLINED_FUNCTION_18_4(v6, (__n128)xmmword_1BF474A50);
    OUTLINED_FUNCTION_10_14(v7);
    if ((id)AMSLogKey())
    {
      sub_1BF465FA8();
      OUTLINED_FUNCTION_15_5();
      OUTLINED_FUNCTION_6_10();
      OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_4_17();
      uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_12_11(MetatypeMetadata);
      sub_1BF3A7DB8((uint64_t)v10);
      OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_9_15(MEMORY[0x1E4FBB1A0]);
    }
    else
    {
      OUTLINED_FUNCTION_11_5();
      OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_3_25();
      uint64_t v9 = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_13_10(v9);
    }
    sub_1BF3A7DB8((uint64_t)v10);
    sub_1BF4653F8();
    OUTLINED_FUNCTION_14_6();
    type metadata accessor for Log();
    OUTLINED_FUNCTION_5_18();
    OUTLINED_FUNCTION_19_5();
    sub_1BF4653A8();
    sub_1BF42B5AC();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_26_4();
    OUTLINED_FUNCTION_28_3();
    sub_1BF465AD8();
    swift_release();
    uint64_t v4 = *(void *)(v0 + 24);
    if ((v4 & 0x80) == 0) {
      *(void *)(v0 + 24) = v4 | 0x80;
    }
  }
  OUTLINED_FUNCTION_20_4();
}

uint64_t PageRenderMetricsPresenterWrapper.deinit()
{
  swift_release();
  return v0;
}

uint64_t PageRenderMetricsPresenterWrapper.__deallocating_deinit()
{
  swift_release();

  return MEMORY[0x1F4186488](v0, 32, 7);
}

ValueMetadata *type metadata accessor for PageRenderMetricsPresenterWrapper.PageRenderEvent()
{
  return &type metadata for PageRenderMetricsPresenterWrapper.PageRenderEvent;
}

unint64_t sub_1BF4384C0()
{
  unint64_t result = qword_1EA148608;
  if (!qword_1EA148608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA148608);
  }
  return result;
}

unint64_t sub_1BF438510()
{
  unint64_t result = qword_1EA148610;
  if (!qword_1EA148610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA148610);
  }
  return result;
}

unint64_t sub_1BF438560()
{
  unint64_t result = qword_1EA148618;
  if (!qword_1EA148618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA148618);
  }
  return result;
}

unint64_t sub_1BF4385B0()
{
  unint64_t result = qword_1EA148620;
  if (!qword_1EA148620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA148620);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_33()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_3_25()
{
  __swift_project_boxed_opaque_existential_2((void *)(v0 - 96), *(void *)(v0 - 72));
  return swift_getDynamicType();
}

uint64_t OUTLINED_FUNCTION_4_17()
{
  __swift_project_boxed_opaque_existential_2((void *)(v0 - 96), *(void *)(v0 - 72));
  return swift_getDynamicType();
}

uint64_t OUTLINED_FUNCTION_5_18()
{
  return __swift_destroy_boxed_opaque_existential_2(v0 - 96);
}

uint64_t OUTLINED_FUNCTION_9_15@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v3 - 104) = a1;
  *(void *)(v3 - 128) = v1;
  *(void *)(v3 - 120) = v2;
  return sub_1BF4653D8();
}

uint64_t OUTLINED_FUNCTION_10_14(uint64_t a1)
{
  *(void *)(v2 - 72) = a1;
  *(void *)(v2 - 96) = v1;
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_12_11(uint64_t a1)
{
  *(void *)(v2 - 104) = a1;
  *(void *)(v2 - 128) = v1;
  return sub_1BF4653D8();
}

uint64_t OUTLINED_FUNCTION_13_10(uint64_t a1)
{
  *(void *)(v2 - 104) = a1;
  *(void *)(v2 - 128) = v1;
  return sub_1BF4653D8();
}

uint64_t OUTLINED_FUNCTION_14_6()
{
  return sub_1BF465428();
}

void OUTLINED_FUNCTION_15_5()
{
}

uint64_t OUTLINED_FUNCTION_18_4(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return type metadata accessor for PageRenderMetricsPresenterWrapper();
}

uint64_t OUTLINED_FUNCTION_22_3(uint64_t a1, uint64_t a2)
{
  return a2 & a1;
}

uint64_t OUTLINED_FUNCTION_23_5()
{
  return sub_1BF465418();
}

uint64_t OUTLINED_FUNCTION_24_2()
{
  return sub_1BF465418();
}

void OUTLINED_FUNCTION_25_3(uint64_t a1@<X8>)
{
  void *v1 = a1;
}

uint64_t OUTLINED_FUNCTION_26_4()
{
  return sub_1BF465B88();
}

uint64_t OUTLINED_FUNCTION_27_3()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_28_3()
{
  return swift_retain();
}

uint64_t *sub_1BF438878(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_1BF464E58();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    char v10 = (char *)a2 + v8;
    uint64_t v11 = sub_1BF465C08();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t sub_1BF438980(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BF464E58();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_1BF465C08();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t sub_1BF438A28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BF464E58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1BF465C08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t sub_1BF438AE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BF464E58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1BF465C08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_1BF438B98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BF464E58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1BF465C08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_1BF438C50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BF464E58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1BF465C08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_1BF438D08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BF438D1C);
}

uint64_t sub_1BF438D1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1BF464E58();
  OUTLINED_FUNCTION_1_3();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = sub_1BF465C08();
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }

  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t sub_1BF438D98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BF438DAC);
}

uint64_t sub_1BF438DAC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1BF464E58();
  OUTLINED_FUNCTION_1_3();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    uint64_t v10 = sub_1BF465C08();
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }

  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t type metadata accessor for PageUrlFieldsProvider()
{
  uint64_t result = qword_1EBA93A78;
  if (!qword_1EBA93A78) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1BF438E78()
{
  uint64_t result = sub_1BF464E58();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1BF465C08();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_1BF438F40(uint64_t a1)
{
  uint64_t v2 = sub_1BF464DD8();
  v5[3] = MEMORY[0x1E4FBB1A0];
  v5[0] = v2;
  v5[1] = v3;
  __swift_mutable_project_boxed_opaque_existential_1(a1, *(void *)(a1 + 24));
  sub_1BF4658C8();
  return __swift_destroy_boxed_opaque_existential_2((uint64_t)v5);
}

uint64_t sub_1BF438FDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 20);
  uint64_t v5 = sub_1BF465C08();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_1BF43904C(uint64_t a1)
{
  return sub_1BF438F40(a1);
}

uint64_t sub_1BF439064()
{
  sub_1BF3A9E60(0, (unint64_t *)&qword_1EBA941F8);
  uint64_t result = sub_1BF466538();
  qword_1EA148630 = result;
  return result;
}

char *sub_1BF4390B8()
{
  uint64_t v1 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic10PlayButton_backgroundView;
  id v2 = objc_allocWithZone(MEMORY[0x1E4F16708]);
  uint64_t v3 = v0;
  *(void *)&v0[v1] = objc_msgSend(v2, sel_init);
  uint64_t v4 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic10PlayButton_glyphView;
  *(void *)&v3[v4] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1838]), sel_init);
  uint64_t v5 = &v3[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic10PlayButton_tapActionBlock];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  *(void *)&v3[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic10PlayButton_tapGestureRecognizer] = 0;

  v22.receiver = v3;
  v22.super_class = (Class)type metadata accessor for PlayButton();
  id v6 = objc_msgSendSuper2(&v22, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v7 = self;
  uint64_t v8 = (char *)v6;
  id v9 = objc_msgSend(v7, sel_boldSystemFontOfSize_, 60.0);
  id v10 = objc_msgSend(self, sel_configurationWithFont_, v9);
  sub_1BF3A9E60(0, (unint64_t *)&qword_1EBA94200);
  id v11 = v10;
  id v12 = sub_1BF439388(0xD000000000000010, 0x80000001BF46E720, v10);
  if (v12)
  {
    id v13 = v12;
    id v14 = objc_msgSend(v12, sel_imageWithRenderingMode_, 2);
  }
  else
  {
    id v14 = 0;
  }
  uint64_t v15 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic10PlayButton_glyphView;
  uint64_t v16 = *(void **)&v8[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic10PlayButton_glyphView];
  objc_msgSend(v16, sel_setImage_, v14);
  uint64_t v17 = qword_1EA147690;
  id v18 = v16;
  if (v17 != -1) {
    swift_once();
  }
  objc_msgSend(v18, sel_setTintColor_, qword_1EA148630);

  double v19 = *(void **)&v8[v15];
  objc_msgSend(v19, sel_setUserInteractionEnabled_, 0);
  double v20 = *(void **)&v8[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic10PlayButton_backgroundView];
  objc_msgSend(v20, sel_addSubview_applyingMaterialStyle_tintEffectStyle_, v19, 0, 0);
  objc_msgSend(v20, sel_setUserInteractionEnabled_, 0);
  objc_msgSend(v20, sel_setCircular_, 1);
  objc_msgSend(v8, sel_addSubview_, v20);
  objc_msgSend(v8, sel_addTarget_action_forControlEvents_, v8, sel_didTap, 64);

  return v8;
}

id sub_1BF439388(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (void *)sub_1BF465F78();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_systemImageNamed_withConfiguration_, v4, a3);

  return v5;
}

void sub_1BF43941C()
{
  uint64_t v1 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic10PlayButton_backgroundView;
  *(void *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F16708]), sel_init);
  uint64_t v2 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic10PlayButton_glyphView;
  *(void *)&v0[v2] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1838]), sel_init);
  uint64_t v3 = &v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic10PlayButton_tapActionBlock];
  *(void *)uint64_t v3 = 0;
  *((void *)v3 + 1) = 0;
  *(void *)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic10PlayButton_tapGestureRecognizer] = 0;

  sub_1BF466868();
  __break(1u);
}

uint64_t sub_1BF439500(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(v2 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic10PlayButton_tapActionBlock);
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic10PlayButton_tapActionBlock);
  *uint64_t v3 = a1;
  v3[1] = a2;
  return sub_1BF3CBCFC(v4);
}

double sub_1BF439520(double a1, double a2)
{
  double result = OUTLINED_FUNCTION_0_30(a1, a2);
  if (v5 ^ v6 | v4) {
    return v3;
  }
  return result;
}

id sub_1BF439550()
{
  v11.receiver = v0;
  v11.super_class = (Class)type metadata accessor for PlayButton();
  objc_msgSendSuper2(&v11, sel_layoutSubviews);
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic10PlayButton_backgroundView];
  OUTLINED_FUNCTION_1_32();
  objc_msgSend(v1, sel_setFrame_);
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic10PlayButton_glyphView];
  OUTLINED_FUNCTION_1_32();
  objc_msgSend(v2, sel_sizeThatFits_, v3, v4);
  double v6 = v5;
  double v8 = v7;
  OUTLINED_FUNCTION_1_32();
  CGFloat v9 = CGRectGetMidX(v12) - v6 * 0.5;
  OUTLINED_FUNCTION_1_32();
  return objc_msgSend(v2, sel_setFrame_, v9, CGRectGetMidY(v13) - v8 * 0.5, v6, v8);
}

void sub_1BF43967C()
{
  uint64_t v1 = *(void (**)(uint64_t))(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic10PlayButton_tapActionBlock);
  if (v1)
  {
    uint64_t v2 = swift_retain();
    v1(v2);
    sub_1BF3CBCFC((uint64_t)v1);
  }
}

void sub_1BF43972C()
{
}

id sub_1BF43976C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PlayButton();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PlayButton()
{
  return self;
}

double OUTLINED_FUNCTION_0_30(double result, double a2)
{
  if (a2 < result) {
    double result = a2;
  }
  if (result > 60.0) {
    return 60.0;
  }
  return result;
}

id OUTLINED_FUNCTION_1_32()
{
  return [v0 (SEL)(v1 + 2072)];
}

uint64_t PluginComponent.component.getter()
{
  return *(void *)v0;
}

uint64_t PluginComponent.componentModel.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BF3AA4C4(v1 + 16, a1);
}

uint64_t PluginComponent.location.getter()
{
  uint64_t v1 = *(void *)(v0 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PluginComponent.id.getter()
{
  return sub_1BF465638();
}

uint64_t PluginComponent.segue.getter()
{
  return sub_1BF465648();
}

uint64_t PluginComponent.impressionMetrics.getter()
{
  __swift_project_boxed_opaque_existential_2((void *)(v0 + 16), *(void *)(v0 + 40));
  return sub_1BF465E88();
}

uint64_t PluginComponent.init(deserializing:using:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __n128 *a3@<X8>)
{
  uint64_t v57 = sub_1BF465508();
  OUTLINED_FUNCTION_0_0();
  uint64_t v59 = v7;
  MEMORY[0x1F4188790](v8);
  v53.n128_u64[0] = (unint64_t)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1BF465388();
  OUTLINED_FUNCTION_0_0();
  uint64_t v58 = v11;
  MEMORY[0x1F4188790](v12);
  id v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EBA95CC0 != -1) {
    swift_once();
  }
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA96420);
  uint64_t v16 = __swift_project_value_buffer(v15, (uint64_t)qword_1EBA987B0);
  uint64_t v17 = type metadata accessor for ComponentLoader();
  id v18 = MEMORY[0x1C18A8CD0](v61, v16, v17);
  if (v61[0])
  {
    uint64_t v56 = v61[0];
    id v54 = a3;
    uint64_t v55 = v10;
    MEMORY[0x1F4188790](v18);
    *(&v49 - 2) = a2;
    sub_1BF3B5724();
    if (v3)
    {
      swift_release();
      uint64_t v23 = OUTLINED_FUNCTION_2_34();
      v24(v23);
      return (*(uint64_t (**)(uint64_t, uint64_t))(v58 + 8))(a1, v55);
    }
    else
    {
      uint64_t v34 = v19;
      uint64_t v35 = v20;
      unint64_t v36 = v21;
      unint64_t v37 = v22;
      uint64_t v52 = a1;
      id v38 = v54;
      v54[3].n128_u64[1] = (unint64_t)v19;
      v38[4].n128_u64[0] = v20;
      v38[4].n128_u64[1] = v21;
      v38[5].n128_u64[0] = v22;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      ComponentLoader.componentDefinition(withLocation:)(v34, v35, v36, v37, v64);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __n128 v51 = v64[2];
      *id v38 = v64[0];
      uint64_t v39 = v65;
      (*(void (**)(char *, uint64_t, uint64_t))(v58 + 16))(v14, v52, v55);
      uint64_t v40 = v59;
      char v41 = *(void (**)(unint64_t, uint64_t, uint64_t))(v59 + 16);
      uint64_t v50 = a2;
      uint64_t v42 = a2;
      uint64_t v43 = v57;
      v41(v53.n128_u64[0], v42, v57);
      __n128 v62 = v51;
      uint64_t v63 = v39;
      __swift_allocate_boxed_opaque_existential_2Tm(v61);
      sub_1BF465798();
      __n128 v53 = v62;
      unint64_t v44 = v62.n128_u64[0];
      v45 = __swift_project_boxed_opaque_existential_2(v61, v62.n128_i64[0]);
      *(__n128 *)&v60[3] = v53;
      boxed_opaque_existential_2Tm = __swift_allocate_boxed_opaque_existential_2Tm(v60);
      (*(void (**)(uint64_t *, void *, unint64_t))(*(void *)(v44 - 8) + 16))(boxed_opaque_existential_2Tm, v45, v44);
      swift_release();
      sub_1BF43A12C((uint64_t)v64);
      (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v50, v43);
      uint64_t v47 = OUTLINED_FUNCTION_4_18();
      v48(v47);
      sub_1BF3A6D50((long long *)v60, (uint64_t)&v54[1]);
      return __swift_destroy_boxed_opaque_existential_2((uint64_t)v61);
    }
  }
  else
  {
    type metadata accessor for Log();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
    uint64_t v26 = sub_1BF465478();
    OUTLINED_FUNCTION_0_2(v26);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BF474AE0;
    sub_1BF4653A8();
    sub_1BF42B5AC();
    swift_bridgeObjectRelease();
    uint64_t v27 = sub_1BF465E58();
    sub_1BF3EC904();
    swift_allocError();
    uint64_t v28 = a1;
    uint64_t v30 = v29;
    *id v29 = sub_1BF4654D8();
    v30[1] = v31;
    v30[2] = (uint64_t)&type metadata for PluginComponent;
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v27 - 8) + 104))(v30, *MEMORY[0x1E4F717D8], v27);
    swift_willThrow();
    uint64_t v32 = OUTLINED_FUNCTION_2_34();
    v33(v32);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v58 + 8))(v28, v10);
  }
}

uint64_t sub_1BF43A0E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __n128 *a3@<X8>)
{
  return PluginComponent.init(deserializing:using:)(a1, a2, a3);
}

uint64_t sub_1BF43A0F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = sub_1BF45D19C(a1, a2);
  *a3 = result;
  a3[1] = v5;
  a3[2] = v6;
  a3[3] = v7;
  return result;
}

uint64_t sub_1BF43A124@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BF43A0F8(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_1BF43A12C(uint64_t a1)
{
  return a1;
}

unint64_t sub_1BF43A15C()
{
  unint64_t result = qword_1EBA94968;
  if (!qword_1EBA94968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA94968);
  }
  return result;
}

uint64_t destroy for PluginComponent(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_2(a1 + 16);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PluginComponent(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v4 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 16, a2 + 16);
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  uint64_t v6 = *(void *)(a2 + 72);
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = v6;
  *(void *)(a1 + 80) = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PluginComponent(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 16), (uint64_t *)(a2 + 16));
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PluginComponent(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __swift_destroy_boxed_opaque_existential_2(a1 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PluginComponent(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 88))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PluginComponent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PluginComponent()
{
  return &type metadata for PluginComponent;
}

uint64_t OUTLINED_FUNCTION_2_34()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_26()
{
  uint64_t v1 = *(void *)(v0 + 40);
  __swift_project_boxed_opaque_existential_2((void *)(v0 + 16), v1);
  return v1;
}

uint64_t OUTLINED_FUNCTION_4_18()
{
  return v0;
}

id sub_1BF43A460()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_1BF465F78();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithPath_, v1);

  return v2;
}

uint64_t sub_1BF43A4D4(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = a2;
  sub_1BF43D64C(a1, (uint64_t)sub_1BF43D5E8, 0, isUniquelyReferenced_nonNull_native, &v8);
  uint64_t v6 = v8;
  swift_bridgeObjectRelease();
  if (v2) {
    swift_bridgeObjectRelease();
  }
  return v6;
}

unint64_t sub_1BF43A560()
{
  return 0xD000000000000026;
}

unint64_t sub_1BF43A5F0()
{
  return sub_1BF43A560();
}

uint64_t sub_1BF43A5F8()
{
  *(void *)(v0 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA934B8);
  *(void *)(v0 + 24) = sub_1BF465EC8();
  uint64_t v2 = sub_1BF43B314();
  if (v1)
  {
    swift_release();
  }
  else
  {
    *(void *)(v0 + 16) = v2;
    swift_bridgeObjectRelease();
  }
  return v0;
}

uint64_t sub_1BF43A680(void *a1, uint64_t a2)
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94B20);
  uint64_t v6 = OUTLINED_FUNCTION_44(v5);
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_8_5();
  uint64_t v106 = v7;
  uint64_t v107 = sub_1BF464E58();
  OUTLINED_FUNCTION_0_0();
  uint64_t v99 = v8;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_36_3();
  v97 = v10;
  MEMORY[0x1F4188790](v11);
  v98 = (char *)&v94 - v12;
  uint64_t v13 = sub_1BF465418();
  uint64_t v14 = OUTLINED_FUNCTION_44(v13);
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_1_4();
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
  uint64_t v16 = sub_1BF465478();
  OUTLINED_FUNCTION_0_2(v16);
  uint64_t v18 = *(void *)(v17 + 72);
  uint64_t v20 = *(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (v20 + 32) & ~v20;
  uint64_t v103 = v15;
  uint64_t v101 = v21 + 3 * v18;
  uint64_t v102 = v20 | 7;
  uint64_t v22 = swift_allocObject();
  long long v100 = xmmword_1BF474840;
  *(_OWORD *)(v22 + 16) = xmmword_1BF474840;
  uint64_t v105 = v21;
  uint64_t v104 = type metadata accessor for PluginLoader();
  uint64_t v118 = v104;
  v116 = v2;
  v109 = v2;
  swift_retain();
  id v23 = (id)AMSLogKey();
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = sub_1BF465FA8();
    uint64_t v108 = v18;
    uint64_t v26 = a1;
    uint64_t v27 = a2;
    uint64_t v28 = v25;
    uint64_t v30 = v29;

    OUTLINED_FUNCTION_9_16();
    OUTLINED_FUNCTION_1_33();
    OUTLINED_FUNCTION_2_15(&v116);
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    OUTLINED_FUNCTION_2_35(MetatypeMetadata);
    sub_1BF3ADDF0((uint64_t)&v113, &qword_1EBA96600);
    OUTLINED_FUNCTION_6_1();
    uint64_t v115 = MEMORY[0x1E4FBB1A0];
    v113 = (uint64_t *)v28;
    uint64_t v114 = v30;
    a2 = v27;
    a1 = v26;
    uint64_t v18 = v108;
    sub_1BF4653D8();
  }
  else
  {
    OUTLINED_FUNCTION_8_18();
    OUTLINED_FUNCTION_1_33();
    OUTLINED_FUNCTION_2_15(&v116);
    uint64_t v32 = swift_getMetatypeMetadata();
    OUTLINED_FUNCTION_2_35(v32);
  }
  sub_1BF3ADDF0((uint64_t)&v113, &qword_1EBA96600);
  OUTLINED_FUNCTION_14_7();
  sub_1BF465428();
  uint64_t v33 = type metadata accessor for Log();
  __swift_destroy_boxed_opaque_existential_2((uint64_t)&v116);
  OUTLINED_FUNCTION_19_0();
  uint64_t v118 = MEMORY[0x1E4FBB1A0];
  v116 = (uint64_t *)a1;
  uint64_t v117 = a2;
  swift_bridgeObjectRetain();
  sub_1BF465438();
  sub_1BF3ADDF0((uint64_t)&v116, &qword_1EBA96600);
  sub_1BF42B5E4();
  swift_bridgeObjectRelease();
  if (a1 == (void *)0xD000000000000025 && a2 == 0x80000001BF46DC30 || (sub_1BF466968() & 1) != 0) {
    return type metadata accessor for FrameworkDynamicUIPlugin();
  }
  unint64_t v36 = v109;
  swift_beginAccess();
  uint64_t v37 = v36[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  ObjCClassMetadata = (uint64_t *)sub_1BF449BD8((uint64_t)a1, a2, v37);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!ObjCClassMetadata)
  {
    uint64_t v108 = v33;
    uint64_t v96 = 2 * v18;
    uint64_t v38 = v36[2];
    v95 = a1;
    if (v38)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v39 = v106;
      sub_1BF449C18((uint64_t)a1, a2, v38, v106);
      uint64_t v40 = v39;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v41 = v39;
      uint64_t v42 = v107;
      if (__swift_getEnumTagSinglePayload(v41, 1, v107) != 1)
      {
        uint64_t v101 = a2;
        uint64_t v43 = v99;
        unint64_t v44 = v98;
        (*(void (**)(char *, uint64_t, uint64_t))(v99 + 32))(v98, v40, v42);
        sub_1BF3D2A50();
        v45 = *(void (**)(uint64_t *, char *, uint64_t))(v43 + 16);
        ObjCClassMetadata = v97;
        v45(v97, v44, v42);
        id v46 = sub_1BF43B278((uint64_t)ObjCClassMetadata);
        if (v46)
        {
          uint64_t v47 = v46;
          v116 = 0;
          unsigned int v48 = objc_msgSend(v46, sel_loadAndReturnError_, &v116);
          ObjCClassMetadata = v109;
          if (v48)
          {
            uint64_t v49 = v116;
            if (objc_msgSend(v47, sel_principalClass))
            {
              ObjCClassMetadata = (uint64_t *)swift_getObjCClassMetadata();
              swift_beginAccess();
              uint64_t v50 = v101;
              swift_bridgeObjectRetain();
              sub_1BF4419EC((uint64_t)ObjCClassMetadata, (uint64_t)v95, v50, v51, v52, v53, v54, v55, v94, (uint64_t)v95);
              swift_endAccess();

              swift_bridgeObjectRelease();
              uint64_t v56 = OUTLINED_FUNCTION_24_3();
              v57(v56);
              return (uint64_t)ObjCClassMetadata;
            }
            *(_OWORD *)(OUTLINED_FUNCTION_4_19() + 16) = xmmword_1BF474A50;
            OUTLINED_FUNCTION_11_15();
            id v81 = (id)AMSLogKey();
            if (v81)
            {
              v82 = v81;
              uint64_t v110 = sub_1BF465FA8();
              uint64_t v84 = v83;

              OUTLINED_FUNCTION_9_16();
              OUTLINED_FUNCTION_1_33();
              OUTLINED_FUNCTION_2_15(&v116);
              uint64_t v85 = swift_getMetatypeMetadata();
              OUTLINED_FUNCTION_2_35(v85);
              ObjCClassMetadata = &qword_1EBA96600;
              OUTLINED_FUNCTION_39_3();
              OUTLINED_FUNCTION_6_1();
              uint64_t v115 = MEMORY[0x1E4FBB1A0];
              v113 = (uint64_t *)v110;
              uint64_t v114 = v84;
              sub_1BF4653D8();
              OUTLINED_FUNCTION_39_3();
            }
            else
            {
              OUTLINED_FUNCTION_8_18();
              OUTLINED_FUNCTION_1_33();
              OUTLINED_FUNCTION_2_15(&v116);
              uint64_t v89 = swift_getMetatypeMetadata();
              OUTLINED_FUNCTION_2_35(v89);
              sub_1BF3ADDF0((uint64_t)&v113, &qword_1EBA96600);
            }
            OUTLINED_FUNCTION_14_7();
            OUTLINED_FUNCTION_12_12();
            __swift_destroy_boxed_opaque_existential_2((uint64_t)&v116);
            OUTLINED_FUNCTION_19_0();
            OUTLINED_FUNCTION_30_4();
            swift_bridgeObjectRelease();
            sub_1BF43E01C();
            uint64_t v90 = swift_allocError();
            OUTLINED_FUNCTION_25_4(v90, v91);
          }
          else
          {
            v71 = v116;
            uint64_t v72 = sub_1BF464D88();

            uint64_t v110 = v72;
            swift_willThrow();
            *(_OWORD *)(OUTLINED_FUNCTION_4_19() + 16) = xmmword_1BF474A50;
            OUTLINED_FUNCTION_11_15();
            id v73 = (id)AMSLogKey();
            if (v73)
            {
              v74 = v73;
              v109 = (uint64_t *)sub_1BF465FA8();
              uint64_t v76 = v75;

              OUTLINED_FUNCTION_9_16();
              OUTLINED_FUNCTION_1_33();
              OUTLINED_FUNCTION_2_15(&v116);
              uint64_t v77 = swift_getMetatypeMetadata();
              OUTLINED_FUNCTION_2_35(v77);
              OUTLINED_FUNCTION_39_3();
              OUTLINED_FUNCTION_6_1();
              uint64_t v115 = MEMORY[0x1E4FBB1A0];
              v113 = v109;
              uint64_t v114 = v76;
              sub_1BF4653D8();
              OUTLINED_FUNCTION_39_3();
            }
            else
            {
              OUTLINED_FUNCTION_8_18();
              OUTLINED_FUNCTION_1_33();
              OUTLINED_FUNCTION_2_15(&v116);
              uint64_t v86 = swift_getMetatypeMetadata();
              OUTLINED_FUNCTION_2_35(v86);
              sub_1BF3ADDF0((uint64_t)&v113, &qword_1EBA96600);
            }
            OUTLINED_FUNCTION_14_7();
            OUTLINED_FUNCTION_12_12();
            __swift_destroy_boxed_opaque_existential_2((uint64_t)&v116);
            sub_1BF465408();
            sub_1BF4653F8();
            swift_getErrorValue();
            uint64_t v87 = v111;
            ObjCClassMetadata = v112;
            uint64_t v118 = (uint64_t)v112;
            boxed_opaque_existential_2Tm = __swift_allocate_boxed_opaque_existential_2Tm((uint64_t *)&v116);
            (*(void (**)(uint64_t *, uint64_t, uint64_t *))(*(ObjCClassMetadata - 1) + 16))(boxed_opaque_existential_2Tm, v87, ObjCClassMetadata);
            sub_1BF4653D8();
            sub_1BF3ADDF0((uint64_t)&v116, &qword_1EBA96600);
            sub_1BF4653F8();
            OUTLINED_FUNCTION_12_12();
            OUTLINED_FUNCTION_30_4();
            swift_bridgeObjectRelease();
          }
          swift_willThrow();
        }
        else
        {
          *(_OWORD *)(OUTLINED_FUNCTION_4_19() + 16) = xmmword_1BF474A50;
          uint64_t v118 = v104;
          v116 = v109;
          swift_retain();
          id v66 = (id)AMSLogKey();
          if (v66)
          {
            uint64_t v67 = v66;
            ObjCClassMetadata = (uint64_t *)sub_1BF465FA8();
            uint64_t v69 = v68;

            OUTLINED_FUNCTION_9_16();
            OUTLINED_FUNCTION_1_33();
            OUTLINED_FUNCTION_2_15(&v116);
            uint64_t v70 = swift_getMetatypeMetadata();
            OUTLINED_FUNCTION_2_35(v70);
            sub_1BF3ADDF0((uint64_t)&v113, &qword_1EBA96600);
            OUTLINED_FUNCTION_6_1();
            uint64_t v115 = MEMORY[0x1E4FBB1A0];
            v113 = ObjCClassMetadata;
            uint64_t v114 = v69;
            sub_1BF4653D8();
          }
          else
          {
            OUTLINED_FUNCTION_8_18();
            OUTLINED_FUNCTION_1_33();
            OUTLINED_FUNCTION_2_15(&v116);
            uint64_t v78 = swift_getMetatypeMetadata();
            OUTLINED_FUNCTION_2_35(v78);
          }
          sub_1BF3ADDF0((uint64_t)&v113, &qword_1EBA96600);
          OUTLINED_FUNCTION_14_7();
          OUTLINED_FUNCTION_12_12();
          __swift_destroy_boxed_opaque_existential_2((uint64_t)&v116);
          OUTLINED_FUNCTION_19_0();
          OUTLINED_FUNCTION_30_4();
          swift_bridgeObjectRelease();
          sub_1BF43E01C();
          uint64_t v79 = swift_allocError();
          OUTLINED_FUNCTION_25_4(v79, v80);
          swift_willThrow();
        }
        uint64_t v92 = OUTLINED_FUNCTION_24_3();
        v93(v92);
        return (uint64_t)ObjCClassMetadata;
      }
    }
    else
    {
      uint64_t v40 = v106;
      __swift_storeEnumTagSinglePayload(v106, 1, 1, v107);
    }
    sub_1BF3ADDF0(v40, &qword_1EBA94B20);
    *(_OWORD *)(swift_allocObject() + 16) = v100;
    OUTLINED_FUNCTION_11_15();
    id v58 = (id)AMSLogKey();
    if (v58)
    {
      uint64_t v59 = v58;
      uint64_t v110 = sub_1BF465FA8();
      uint64_t v61 = v60;

      OUTLINED_FUNCTION_9_16();
      OUTLINED_FUNCTION_1_33();
      OUTLINED_FUNCTION_2_15(&v116);
      uint64_t v62 = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_2_35(v62);
      sub_1BF3ADDF0((uint64_t)&v113, &qword_1EBA96600);
      OUTLINED_FUNCTION_6_1();
      ObjCClassMetadata = (uint64_t *)MEMORY[0x1E4FBB1A0];
      uint64_t v115 = MEMORY[0x1E4FBB1A0];
      v113 = (uint64_t *)v110;
      uint64_t v114 = v61;
      sub_1BF4653D8();
      sub_1BF3ADDF0((uint64_t)&v113, &qword_1EBA96600);
    }
    else
    {
      OUTLINED_FUNCTION_8_18();
      OUTLINED_FUNCTION_1_33();
      OUTLINED_FUNCTION_2_15(&v116);
      uint64_t v63 = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_2_35(v63);
      sub_1BF3ADDF0((uint64_t)&v113, &qword_1EBA96600);
      ObjCClassMetadata = (uint64_t *)MEMORY[0x1E4FBB1A0];
    }
    OUTLINED_FUNCTION_14_7();
    OUTLINED_FUNCTION_12_12();
    __swift_destroy_boxed_opaque_existential_2((uint64_t)&v116);
    OUTLINED_FUNCTION_19_0();
    uint64_t v118 = (uint64_t)ObjCClassMetadata;
    uint64_t v64 = v95;
    v116 = (uint64_t *)v95;
    uint64_t v117 = a2;
    swift_bridgeObjectRetain();
    sub_1BF465438();
    sub_1BF3ADDF0((uint64_t)&v116, &qword_1EBA96600);
    OUTLINED_FUNCTION_30_4();
    swift_bridgeObjectRelease();
    sub_1BF43E01C();
    swift_allocError();
    *uint64_t v65 = v64;
    v65[1] = a2;
    swift_bridgeObjectRetain();
    swift_willThrow();
  }
  return (uint64_t)ObjCClassMetadata;
}

id sub_1BF43B278(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v3 = (void *)sub_1BF464DE8();
  id v4 = objc_msgSend(v2, sel_initWithURL_, v3);

  uint64_t v5 = sub_1BF464E58();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  return v4;
}

uint64_t sub_1BF43B314()
{
  uint64_t result = sub_1BF43B3A8(0xD00000000000002DLL, 0x80000001BF46E830, 0x736E4967756C50, 0xE700000000000000);
  if (!v0)
  {
    uint64_t v2 = result;
    sub_1BF464E58();
    uint64_t v3 = sub_1BF465EC8();
    return sub_1BF43A4D4(v3, v2);
  }
  return result;
}

uint64_t sub_1BF43B3A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v112 = a3;
  uint64_t v8 = sub_1BF464E58();
  OUTLINED_FUNCTION_0_0();
  uint64_t v87 = v9;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_8_5();
  uint64_t v103 = v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94B20);
  uint64_t v13 = OUTLINED_FUNCTION_44(v12);
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_36_3();
  uint64_t v88 = v14;
  MEMORY[0x1F4188790](v15);
  uint64_t v92 = (char *)&v85 - v16;
  uint64_t v17 = sub_1BF465418();
  uint64_t v18 = OUTLINED_FUNCTION_44(v17);
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_1_4();
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
  uint64_t v20 = sub_1BF465478();
  OUTLINED_FUNCTION_0_2(v20);
  uint64_t v22 = *(void *)(v21 + 72);
  uint64_t v24 = *(unsigned __int8 *)(v23 + 80);
  uint64_t v25 = (v24 + 32) & ~v24;
  uint64_t v101 = v22;
  uint64_t v99 = v19;
  uint64_t v96 = v24 | 7;
  uint64_t v97 = v25 + 2 * v22;
  uint64_t v26 = swift_allocObject();
  long long v94 = xmmword_1BF474A50;
  *(_OWORD *)(v26 + 16) = xmmword_1BF474A50;
  uint64_t v98 = v25;
  uint64_t v93 = type metadata accessor for PluginLoader();
  uint64_t v111 = v93;
  uint64_t v109 = v4;
  uint64_t v100 = v4;
  swift_retain();
  id v27 = (id)AMSLogKey();
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = (void *)sub_1BF465FA8();
    uint64_t v104 = v30;
    id v105 = v29;

    OUTLINED_FUNCTION_9_16();
    OUTLINED_FUNCTION_1_33();
    OUTLINED_FUNCTION_2_15(&v109);
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    OUTLINED_FUNCTION_5_19(MetatypeMetadata);
    sub_1BF3ADDF0((uint64_t)&v106, &qword_1EBA96600);
    OUTLINED_FUNCTION_6_1();
    uint64_t v108 = MEMORY[0x1E4FBB1A0];
    uint64_t v106 = (uint64_t)v105;
    uint64_t v107 = v104;
    sub_1BF4653D8();
  }
  else
  {
    OUTLINED_FUNCTION_8_18();
    OUTLINED_FUNCTION_1_33();
    OUTLINED_FUNCTION_2_15(&v109);
    uint64_t v32 = swift_getMetatypeMetadata();
    OUTLINED_FUNCTION_5_19(v32);
  }
  sub_1BF3ADDF0((uint64_t)&v106, &qword_1EBA96600);
  OUTLINED_FUNCTION_14_7();
  OUTLINED_FUNCTION_12_12();
  uint64_t v33 = type metadata accessor for Log();
  __swift_destroy_boxed_opaque_existential_2((uint64_t)&v109);
  sub_1BF465408();
  sub_1BF4653F8();
  uint64_t v111 = MEMORY[0x1E4FBB1A0];
  uint64_t v109 = a1;
  uint64_t v110 = a2;
  swift_bridgeObjectRetain();
  sub_1BF4653D8();
  sub_1BF3ADDF0((uint64_t)&v109, &qword_1EBA96600);
  sub_1BF4653F8();
  OUTLINED_FUNCTION_12_12();
  uint64_t v95 = v33;
  sub_1BF42B61C();
  swift_bridgeObjectRelease();
  unint64_t v34 = sub_1BF3D2A50();
  swift_bridgeObjectRetain();
  id v35 = sub_1BF43A460();
  uint64_t v102 = v8;
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = (void *)sub_1BF465F78();
    if (a4) {
      uint64_t v38 = (void *)sub_1BF465F78();
    }
    else {
      uint64_t v38 = 0;
    }
    id v46 = objc_msgSend(v36, sel_pathsForResourcesOfType_inDirectory_, v37, v38);

    uint64_t v47 = sub_1BF466138();
    uint64_t v48 = *(void *)(v47 + 16);
    if (v48)
    {
      id v86 = v36;
      uint64_t v89 = (void (**)(uint64_t, uint64_t, uint64_t))(v87 + 32);
      uint64_t v90 = (void (**)(uint64_t, uint64_t))(v87 + 8);
      uint64_t v85 = v47;
      uint64_t v49 = v47 + 40;
      uint64_t v50 = MEMORY[0x1E4FBC868];
      unint64_t v91 = v34;
      do
      {
        swift_bridgeObjectRetain();
        id v51 = sub_1BF43A460();
        if (v51)
        {
          id v52 = v51;
          uint64_t v53 = sub_1BF43DA30(v52);
          if (v54)
          {
            uint64_t v55 = v53;
            uint64_t v56 = v54;
            id v105 = v52;
            id v57 = objc_msgSend(v52, sel_bundleURL, v85, v86);
            uint64_t v58 = (uint64_t)v92;
            sub_1BF464E08();

            uint64_t v59 = v58;
            __swift_storeEnumTagSinglePayload(v58, 0, 1, v8);
            if (__swift_getEnumTagSinglePayload(v58, 1, v8) == 1)
            {
              sub_1BF3ADDF0(v58, &qword_1EBA94B20);
              swift_bridgeObjectRetain();
              unint64_t v60 = sub_1BF44C030(v55, v56);
              char v62 = v61;
              swift_bridgeObjectRelease();
              if (v62)
              {
                swift_isUniquelyReferenced_nonNull_native();
                uint64_t v109 = v50;
                __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA93480);
                uint64_t v8 = v102;
                sub_1BF466818();
                uint64_t v50 = v109;
                swift_bridgeObjectRelease();
                uint64_t v63 = v88;
                (*(void (**)(uint64_t, unint64_t, uint64_t))(v87 + 32))(v88, *(void *)(v50 + 56) + *(void *)(v87 + 72) * v60, v8);
                uint64_t v64 = MEMORY[0x1E4FBB1A0];
                sub_1BF466838();
                swift_bridgeObjectRelease();
                uint64_t v65 = 0;
              }
              else
              {
                uint64_t v65 = 1;
                uint64_t v63 = v88;
                uint64_t v64 = MEMORY[0x1E4FBB1A0];
              }
              __swift_storeEnumTagSinglePayload(v63, v65, 1, v8);
              swift_bridgeObjectRelease();
              sub_1BF3ADDF0(v63, &qword_1EBA94B20);
            }
            else
            {
              uint64_t v66 = v103;
              (*v89)(v103, v59, v8);
              swift_isUniquelyReferenced_nonNull_native();
              uint64_t v109 = v50;
              sub_1BF43CFF0(v66, v55, v56);
              uint64_t v50 = v109;
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v64 = MEMORY[0x1E4FBB1A0];
            }
            uint64_t v112 = v50;
            uint64_t v67 = swift_allocObject();
            *(_OWORD *)(v67 + 16) = v94;
            OUTLINED_FUNCTION_31_5();
            id v68 = (id)AMSLogKey();
            if (v68)
            {
              uint64_t v69 = v68;
              uint64_t v70 = sub_1BF465FA8();
              uint64_t v72 = v71;

              OUTLINED_FUNCTION_9_16();
              OUTLINED_FUNCTION_1_33();
              OUTLINED_FUNCTION_2_15(&v109);
              uint64_t v73 = swift_getMetatypeMetadata();
              OUTLINED_FUNCTION_5_19(v73);
              sub_1BF3ADDF0((uint64_t)&v106, &qword_1EBA96600);
              OUTLINED_FUNCTION_6_1();
              uint64_t v108 = v64;
              uint64_t v106 = v70;
              uint64_t v107 = v72;
              sub_1BF4653D8();
            }
            else
            {
              OUTLINED_FUNCTION_8_18();
              OUTLINED_FUNCTION_1_33();
              OUTLINED_FUNCTION_2_15(&v109);
              uint64_t v74 = swift_getMetatypeMetadata();
              OUTLINED_FUNCTION_5_19(v74);
            }
            sub_1BF3ADDF0((uint64_t)&v106, &qword_1EBA96600);
            uint64_t v75 = v67 + v98;
            OUTLINED_FUNCTION_14_7();
            OUTLINED_FUNCTION_12_12();
            __swift_destroy_boxed_opaque_existential_2((uint64_t)&v109);
            uint64_t v104 = v75 + v101;
            sub_1BF465408();
            sub_1BF4653F8();
            id v76 = v105;
            id v77 = objc_msgSend(v105, sel_bundleURL);
            uint64_t v78 = v103;
            sub_1BF464E08();

            uint64_t v79 = sub_1BF464DD8();
            uint64_t v81 = v80;
            uint64_t v82 = v78;
            uint64_t v8 = v102;
            (*v90)(v82, v102);
            uint64_t v111 = MEMORY[0x1E4FBB1A0];
            uint64_t v109 = v79;
            uint64_t v110 = v81;
            sub_1BF4653D8();
            sub_1BF3ADDF0((uint64_t)&v109, &qword_1EBA96600);
            sub_1BF4653F8();
            sub_1BF465428();
            sub_1BF42B61C();

            swift_bridgeObjectRelease();
            uint64_t v50 = v112;
          }
          else
          {
          }
        }
        v49 += 16;
        --v48;
      }
      while (v48);

      swift_bridgeObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease();
      return MEMORY[0x1E4FBC868];
    }
  }
  else
  {
    uint64_t v39 = MEMORY[0x1E4FBB1A0];
    *(_OWORD *)(swift_allocObject() + 16) = v94;
    OUTLINED_FUNCTION_31_5();
    id v40 = (id)AMSLogKey();
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = sub_1BF465FA8();
      uint64_t v44 = v43;

      OUTLINED_FUNCTION_9_16();
      OUTLINED_FUNCTION_1_33();
      OUTLINED_FUNCTION_2_15(&v109);
      uint64_t v45 = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_5_19(v45);
      sub_1BF3ADDF0((uint64_t)&v106, &qword_1EBA96600);
      OUTLINED_FUNCTION_6_1();
      uint64_t v108 = v39;
      uint64_t v106 = v42;
      uint64_t v107 = v44;
      sub_1BF4653D8();
    }
    else
    {
      OUTLINED_FUNCTION_8_18();
      OUTLINED_FUNCTION_1_33();
      OUTLINED_FUNCTION_2_15(&v109);
      uint64_t v83 = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_5_19(v83);
    }
    sub_1BF3ADDF0((uint64_t)&v106, &qword_1EBA96600);
    OUTLINED_FUNCTION_14_7();
    sub_1BF465428();
    __swift_destroy_boxed_opaque_existential_2((uint64_t)&v109);
    sub_1BF4653A8();
    OUTLINED_FUNCTION_30_4();
    swift_bridgeObjectRelease();
    return sub_1BF465EC8();
  }
  return v50;
}

uint64_t sub_1BF43BDB8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1BF43BDE0()
{
  sub_1BF43BDB8();

  return MEMORY[0x1F4186488](v0, 32, 7);
}

uint64_t type metadata accessor for PluginLoader()
{
  return self;
}

void sub_1BF43BE38(uint64_t a1, char a2)
{
  uint64_t v4 = v2;
  OUTLINED_FUNCTION_18_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965B0);
  uint64_t v6 = OUTLINED_FUNCTION_27_4();
  if (v3[2])
  {
    OUTLINED_FUNCTION_17_7();
    OUTLINED_FUNCTION_34_3();
    uint64_t v7 = v6 + 64;
    swift_retain();
    uint64_t v8 = 0;
    if (!v2) {
      goto LABEL_4;
    }
LABEL_3:
    OUTLINED_FUNCTION_42_2();
    for (uint64_t i = v9 | (v8 << 6); ; uint64_t i = v13 + (v8 << 6))
    {
      uint64_t v14 = (uint64_t *)(v3[6] + 16 * i);
      uint64_t v16 = *v14;
      uint64_t v15 = v14[1];
      uint64_t v17 = (_OWORD *)(v3[7] + 32 * i);
      if (a2)
      {
        sub_1BF3A8B54(v17, v33);
      }
      else
      {
        sub_1BF3A8B64((uint64_t)v17, (uint64_t)v33);
        swift_bridgeObjectRetain();
      }
      sub_1BF466A58();
      sub_1BF466028();
      unint64_t v18 = sub_1BF466A98() & ~(-1 << *(unsigned char *)(v6 + 32));
      if (((-1 << v18) & ~*(void *)(v7 + 8 * (v18 >> 6))) == 0)
      {
        OUTLINED_FUNCTION_22_4();
        while (++v20 != v21 || (v19 & 1) == 0)
        {
          BOOL v22 = v20 == v21;
          if (v20 == v21) {
            uint64_t v20 = 0;
          }
          v19 |= v22;
          if (*(void *)(v7 + 8 * v20) != -1)
          {
            OUTLINED_FUNCTION_21_7();
            goto LABEL_28;
          }
        }
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_23_6();
LABEL_28:
      OUTLINED_FUNCTION_20_5();
      *(void *)(v7 + v23) |= v24;
      uint64_t v26 = (void *)(*(void *)(v6 + 48) + 16 * v25);
      *uint64_t v26 = v16;
      v26[1] = v15;
      sub_1BF3A8B54(v33, (_OWORD *)(*(void *)(v6 + 56) + 32 * v25));
      OUTLINED_FUNCTION_29_4();
      if (v2) {
        goto LABEL_3;
      }
LABEL_4:
      uint64_t v11 = v8 + 1;
      if (__OFADD__(v8, 1)) {
        goto LABEL_37;
      }
      if (v11 >= v31) {
        goto LABEL_30;
      }
      ++v8;
      if (!v32[v11])
      {
        uint64_t v8 = v11 + 1;
        if (v11 + 1 >= v31) {
          goto LABEL_30;
        }
        if (!v32[v8])
        {
          uint64_t v12 = v11 + 2;
          if (v12 >= v31)
          {
LABEL_30:
            swift_release();
            uint64_t v4 = (void *)v30;
            if (a2)
            {
              OUTLINED_FUNCTION_16_8();
              if (v28 != v29) {
                OUTLINED_FUNCTION_38_1(v27, v30, v31, v32);
              }
              else {
                OUTLINED_FUNCTION_33_3(v27, v30, v31, v32);
              }
              v3[2] = 0;
            }
            break;
          }
          if (!v32[v12])
          {
            while (1)
            {
              uint64_t v8 = v12 + 1;
              if (__OFADD__(v12, 1)) {
                goto LABEL_38;
              }
              if (v8 >= v31) {
                goto LABEL_30;
              }
              ++v12;
              if (v32[v8]) {
                goto LABEL_15;
              }
            }
          }
          uint64_t v8 = v12;
        }
      }
LABEL_15:
      OUTLINED_FUNCTION_41_2();
    }
  }
  swift_release();
  *uint64_t v4 = v6;
}

uint64_t sub_1BF43C078(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v49 = sub_1BF464E58();
  uint64_t v5 = *(void *)(v49 - 8);
  MEMORY[0x1F4188790](v49);
  uint64_t v48 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965A8);
  int v47 = a2;
  uint64_t v8 = sub_1BF466888();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_40;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 64);
  uint64_t v44 = (void *)(v7 + 64);
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  uint64_t v42 = v2;
  int64_t v43 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v45 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v46 = v5;
  uint64_t v14 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
  uint64_t v15 = v8 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  if (!v13) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v18 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v18 | (v17 << 6); ; unint64_t i = __clz(__rbit64(v22)) + (v17 << 6))
  {
    uint64_t v24 = *(void *)(v7 + 56);
    uint64_t v25 = v7;
    uint64_t v26 = (uint64_t *)(*(void *)(v7 + 48) + 16 * i);
    uint64_t v27 = *v26;
    uint64_t v28 = v26[1];
    uint64_t v29 = *(void *)(v46 + 72);
    uint64_t v30 = v24 + v29 * i;
    if (v47)
    {
      (*v14)(v48, v30, v49);
    }
    else
    {
      (*v45)(v48, v30, v49);
      swift_bridgeObjectRetain();
    }
    sub_1BF466A58();
    sub_1BF466028();
    uint64_t result = sub_1BF466A98();
    uint64_t v31 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6))) == 0)
    {
      char v35 = 0;
      unint64_t v36 = (unint64_t)(63 - v31) >> 6;
      while (++v33 != v36 || (v35 & 1) == 0)
      {
        BOOL v37 = v33 == v36;
        if (v33 == v36) {
          unint64_t v33 = 0;
        }
        v35 |= v37;
        uint64_t v38 = *(void *)(v15 + 8 * v33);
        if (v38 != -1)
        {
          unint64_t v34 = __clz(__rbit64(~v38)) + (v33 << 6);
          goto LABEL_31;
        }
      }
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    unint64_t v34 = __clz(__rbit64((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
LABEL_31:
    *(void *)(v15 + ((v34 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v34;
    uint64_t v39 = (void *)(*(void *)(v9 + 48) + 16 * v34);
    *uint64_t v39 = v27;
    v39[1] = v28;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v14)(*(void *)(v9 + 56) + v29 * v34, v48, v49);
    ++*(void *)(v9 + 16);
    uint64_t v7 = v25;
    if (v13) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v20 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      goto LABEL_42;
    }
    if (v20 >= v43)
    {
      swift_release();
      uint64_t v3 = v42;
      uint64_t v21 = v44;
      goto LABEL_35;
    }
    uint64_t v21 = v44;
    unint64_t v22 = v44[v20];
    ++v17;
    if (!v22)
    {
      int64_t v17 = v20 + 1;
      if (v20 + 1 >= v43) {
        goto LABEL_33;
      }
      unint64_t v22 = v44[v17];
      if (!v22) {
        break;
      }
    }
LABEL_18:
    unint64_t v13 = (v22 - 1) & v22;
  }
  int64_t v23 = v20 + 2;
  if (v23 < v43)
  {
    unint64_t v22 = v44[v23];
    if (!v22)
    {
      while (1)
      {
        int64_t v17 = v23 + 1;
        if (__OFADD__(v23, 1)) {
          goto LABEL_43;
        }
        if (v17 >= v43) {
          goto LABEL_33;
        }
        unint64_t v22 = v44[v17];
        ++v23;
        if (v22) {
          goto LABEL_18;
        }
      }
    }
    int64_t v17 = v23;
    goto LABEL_18;
  }
LABEL_33:
  swift_release();
  uint64_t v3 = v42;
LABEL_35:
  if (v47)
  {
    uint64_t v40 = 1 << *(unsigned char *)(v7 + 32);
    if (v40 >= 64) {
      sub_1BF43D4C4(0, (unint64_t)(v40 + 63) >> 6, v21);
    }
    else {
      *uint64_t v21 = -1 << v40;
    }
    *(void *)(v7 + 16) = 0;
  }
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v9;
  return result;
}

void sub_1BF43C454(uint64_t a1, char a2)
{
  uint64_t v4 = v2;
  OUTLINED_FUNCTION_18_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965B8);
  uint64_t v6 = OUTLINED_FUNCTION_27_4();
  uint64_t v7 = v6;
  if (*(void *)(v3 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v3 + 32);
    BOOL v37 = v2;
    uint64_t v38 = v3 + 64;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v3 + 64);
    int64_t v11 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v12 = v6 + 64;
    swift_retain();
    int64_t v13 = 0;
    if (!v10) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v14 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v13 << 6))
    {
      uint64_t v20 = *(void *)(v3 + 48) + 40 * i;
      if (a2)
      {
        long long v21 = *(_OWORD *)v20;
        long long v22 = *(_OWORD *)(v20 + 16);
        uint64_t v42 = *(void *)(v20 + 32);
        long long v40 = v21;
        long long v41 = v22;
        sub_1BF3A8B54((_OWORD *)(*(void *)(v3 + 56) + 32 * i), v39);
      }
      else
      {
        sub_1BF3C6640(v20, (uint64_t)&v40);
        sub_1BF3A8B64(*(void *)(v3 + 56) + 32 * i, (uint64_t)v39);
      }
      unint64_t v23 = sub_1BF4666E8() & ~(-1 << *(unsigned char *)(v7 + 32));
      if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) == 0)
      {
        OUTLINED_FUNCTION_22_4();
        while (++v25 != v26 || (v24 & 1) == 0)
        {
          BOOL v27 = v25 == v26;
          if (v25 == v26) {
            uint64_t v25 = 0;
          }
          v24 |= v27;
          if (*(void *)(v12 + 8 * v25) != -1)
          {
            OUTLINED_FUNCTION_21_7();
            goto LABEL_31;
          }
        }
        __break(1u);
LABEL_42:
        __break(1u);
LABEL_43:
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_23_6();
LABEL_31:
      OUTLINED_FUNCTION_20_5();
      *(void *)(v12 + v28) |= v29;
      uint64_t v31 = *(void *)(v7 + 48) + 40 * v30;
      long long v32 = v40;
      long long v33 = v41;
      *(void *)(v31 + 32) = v42;
      *(_OWORD *)uint64_t v31 = v32;
      *(_OWORD *)(v31 + 16) = v33;
      sub_1BF3A8B54(v39, (_OWORD *)(*(void *)(v7 + 56) + 32 * v30));
      OUTLINED_FUNCTION_29_4();
      if (v10) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v16 = v13 + 1;
      if (__OFADD__(v13, 1)) {
        goto LABEL_42;
      }
      if (v16 >= v11) {
        break;
      }
      int64_t v17 = (void *)(v3 + 64);
      unint64_t v18 = *(void *)(v38 + 8 * v16);
      ++v13;
      if (!v18)
      {
        int64_t v13 = v16 + 1;
        if (v16 + 1 >= v11) {
          goto LABEL_33;
        }
        unint64_t v18 = *(void *)(v38 + 8 * v13);
        if (!v18)
        {
          int64_t v19 = v16 + 2;
          if (v19 >= v11)
          {
LABEL_33:
            swift_release();
            uint64_t v4 = v37;
            if ((a2 & 1) == 0) {
              goto LABEL_40;
            }
            goto LABEL_36;
          }
          unint64_t v18 = *(void *)(v38 + 8 * v19);
          if (!v18)
          {
            while (1)
            {
              int64_t v13 = v19 + 1;
              if (__OFADD__(v19, 1)) {
                goto LABEL_43;
              }
              if (v13 >= v11) {
                goto LABEL_33;
              }
              unint64_t v18 = *(void *)(v38 + 8 * v13);
              ++v19;
              if (v18) {
                goto LABEL_18;
              }
            }
          }
          int64_t v13 = v19;
        }
      }
LABEL_18:
      unint64_t v10 = (v18 - 1) & v18;
    }
    swift_release();
    uint64_t v4 = v37;
    int64_t v17 = (void *)(v3 + 64);
    if ((a2 & 1) == 0) {
      goto LABEL_40;
    }
LABEL_36:
    OUTLINED_FUNCTION_16_8();
    if (v35 != v36) {
      void *v17 = -1 << v34;
    }
    else {
      sub_1BF43D4C4(0, (unint64_t)(v34 + 63) >> 6, v17);
    }
    *(void *)(v3 + 16) = 0;
  }
LABEL_40:
  swift_release();
  *uint64_t v4 = v7;
}

void sub_1BF43C704(uint64_t a1, char a2)
{
  uint64_t v4 = v2;
  OUTLINED_FUNCTION_18_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA148660);
  char v41 = a2;
  uint64_t v6 = sub_1BF466888();
  if (v3[2])
  {
    OUTLINED_FUNCTION_17_7();
    OUTLINED_FUNCTION_34_3();
    uint64_t v7 = v6 + 64;
    swift_retain();
    uint64_t v8 = 0;
    long long v40 = v3;
    if (!v2) {
      goto LABEL_4;
    }
LABEL_3:
    OUTLINED_FUNCTION_42_2();
    for (uint64_t i = v10 | (v8 << 6); ; uint64_t i = v14 + (v8 << 6))
    {
      uint64_t v15 = (uint64_t *)(v3[6] + 16 * i);
      uint64_t v17 = *v15;
      uint64_t v16 = v15[1];
      unint64_t v18 = (char *)(v3[7] + i * v9);
      char v19 = *v18;
      uint64_t v20 = *((void *)v18 + 1);
      long long v21 = (void *)*((void *)v18 + 2);
      if ((v41 & 1) == 0)
      {
        id v22 = v21;
        swift_bridgeObjectRetain();
        swift_retain();
      }
      sub_1BF466A58();
      sub_1BF466028();
      unint64_t v23 = sub_1BF466A98() & ~(-1 << *(unsigned char *)(v6 + 32));
      if (((-1 << v23) & ~*(void *)(v7 + 8 * (v23 >> 6))) == 0)
      {
        OUTLINED_FUNCTION_22_4();
        while (++v25 != v26 || (v24 & 1) == 0)
        {
          BOOL v27 = v25 == v26;
          if (v25 == v26) {
            uint64_t v25 = 0;
          }
          v24 |= v27;
          if (*(void *)(v7 + 8 * v25) != -1)
          {
            OUTLINED_FUNCTION_21_7();
            goto LABEL_27;
          }
        }
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_23_6();
LABEL_27:
      OUTLINED_FUNCTION_20_5();
      *(void *)(v7 + v28) |= v29;
      uint64_t v31 = (void *)(*(void *)(v6 + 48) + 16 * v30);
      *uint64_t v31 = v17;
      v31[1] = v16;
      uint64_t v33 = *(void *)(v6 + 56) + v30 * v32;
      *(unsigned char *)uint64_t v33 = v19;
      *(void *)(v33 + 8) = v20;
      *(void *)(v33 + 16) = v21;
      OUTLINED_FUNCTION_29_4();
      uint64_t v3 = v40;
      if (v2) {
        goto LABEL_3;
      }
LABEL_4:
      uint64_t v12 = v8 + 1;
      if (__OFADD__(v8, 1)) {
        goto LABEL_36;
      }
      if (v12 >= v38) {
        goto LABEL_29;
      }
      ++v8;
      if (!v39[v12])
      {
        uint64_t v8 = v12 + 1;
        if (v12 + 1 >= v38) {
          goto LABEL_29;
        }
        if (!v39[v8])
        {
          uint64_t v13 = v12 + 2;
          if (v13 >= v38)
          {
LABEL_29:
            swift_release();
            uint64_t v4 = (void *)v37;
            if (v41)
            {
              OUTLINED_FUNCTION_16_8();
              if (v35 != v36) {
                OUTLINED_FUNCTION_38_1(v34, v37, v38, v39);
              }
              else {
                OUTLINED_FUNCTION_33_3(v34, v37, v38, v39);
              }
              v3[2] = 0;
            }
            break;
          }
          if (!v39[v13])
          {
            while (1)
            {
              uint64_t v8 = v13 + 1;
              if (__OFADD__(v13, 1)) {
                goto LABEL_37;
              }
              if (v8 >= v38) {
                goto LABEL_29;
              }
              ++v13;
              if (v39[v8]) {
                goto LABEL_15;
              }
            }
          }
          uint64_t v8 = v13;
        }
      }
LABEL_15:
      OUTLINED_FUNCTION_41_2();
    }
  }
  swift_release();
  *uint64_t v4 = v6;
}

void sub_1BF43C980(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1BF44C030(a2, a3);
  OUTLINED_FUNCTION_6_19();
  if (v9)
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v10 = v7;
  char v11 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA93498);
  if ((OUTLINED_FUNCTION_19_6() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v12 = sub_1BF44C030(a2, a3);
  if ((v11 & 1) != (v13 & 1))
  {
LABEL_11:
    sub_1BF4669C8();
    __break(1u);
    return;
  }
  unint64_t v10 = v12;
LABEL_5:
  uint64_t v14 = *v3;
  if (v11)
  {
    *(void *)(v14[7] + 8 * v10) = a1;
    OUTLINED_FUNCTION_20_4();
  }
  else
  {
    sub_1BF43D174(v10, a2, a3, a1, v14);
    OUTLINED_FUNCTION_20_4();
    swift_bridgeObjectRetain();
  }
}

void sub_1BF43CA7C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_1BF4656A8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  unint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BF44C0A8();
  OUTLINED_FUNCTION_6_19();
  if (v13)
  {
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v14 = v11;
  char v15 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA93478);
  if (sub_1BF466818())
  {
    unint64_t v16 = sub_1BF44C0A8();
    if ((v15 & 1) == (v17 & 1))
    {
      unint64_t v14 = v16;
      goto LABEL_5;
    }
LABEL_10:
    sub_1BF4669C8();
    __break(1u);
    return;
  }
LABEL_5:
  unint64_t v18 = *v2;
  if (v15)
  {
    uint64_t v19 = v18[7];
    swift_release();
    *(void *)(v19 + 8 * v14) = a1;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, a2, v5);
    sub_1BF43D1BC(v14, (uint64_t)v10, a1, v18);
  }
  OUTLINED_FUNCTION_29_0();
}

void sub_1BF43CBD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_1BF43CBDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_1BF43CBE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  OUTLINED_FUNCTION_13_11(a1, a2, a3);
  OUTLINED_FUNCTION_6_19();
  if (v12)
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v13 = v10;
  char v14 = v11;
  __swift_instantiateConcreteTypeFromMangledName(a5);
  if ((OUTLINED_FUNCTION_19_6() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v15 = sub_1BF44C030(v7, v6);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_11:
    sub_1BF4669C8();
    __break(1u);
    return;
  }
  unint64_t v13 = v15;
LABEL_5:
  uint64_t v17 = *v8;
  if (v14)
  {
    uint64_t v18 = *(void *)(v17 + 56);
    swift_bridgeObjectRelease();
    *(void *)(v18 + 8 * v13) = v5;
    OUTLINED_FUNCTION_29_0();
  }
  else
  {
    sub_1BF43D484(v13, v7, v6, v5, v17);
    OUTLINED_FUNCTION_29_0();
    swift_bridgeObjectRetain();
  }
}

void sub_1BF43CCD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

_OWORD *sub_1BF43CCDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_13_11(a1, a2, a3);
  OUTLINED_FUNCTION_6_19();
  if (v9)
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v10 = v7;
  char v11 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA934A0);
  if ((OUTLINED_FUNCTION_19_6() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v12 = sub_1BF44C030(v5, v4);
  if ((v11 & 1) != (v13 & 1))
  {
LABEL_13:
    uint64_t result = (_OWORD *)sub_1BF4669C8();
    __break(1u);
    return result;
  }
  unint64_t v10 = v12;
LABEL_5:
  char v14 = *v6;
  if (v11)
  {
    __swift_destroy_boxed_opaque_existential_2(v14[7] + 32 * v10);
    OUTLINED_FUNCTION_20_4();
    return sub_1BF3A8B54(v15, v16);
  }
  else
  {
    sub_1BF43D274(v10, v5, v4, v3, v14);
    OUTLINED_FUNCTION_20_4();
    return (_OWORD *)swift_bridgeObjectRetain();
  }
}

void sub_1BF43CDD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1BF44C030(a3, a4);
  OUTLINED_FUNCTION_6_19();
  if (v11)
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v12 = v9;
  char v13 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA934C0);
  if ((sub_1BF466818() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v14 = sub_1BF44C030(a3, a4);
  if ((v13 & 1) != (v15 & 1))
  {
LABEL_11:
    sub_1BF4669C8();
    __break(1u);
    return;
  }
  unint64_t v12 = v14;
LABEL_5:
  uint64_t v16 = *v4;
  if (v13)
  {
    uint64_t v17 = (uint64_t *)(*(void *)(v16 + 56) + 16 * v12);
    swift_bridgeObjectRelease();
    uint64_t *v17 = a1;
    v17[1] = a2;
    OUTLINED_FUNCTION_29_0();
  }
  else
  {
    sub_1BF43D2E0(v12, a3, a4, a1, a2, v16);
    OUTLINED_FUNCTION_29_0();
    swift_bridgeObjectRetain();
  }
}

void sub_1BF43CEFC(uint64_t a1)
{
  sub_1BF44C198();
  OUTLINED_FUNCTION_6_19();
  if (v5)
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v6 = v3;
  char v7 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA934B0);
  if ((sub_1BF466818() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v8 = sub_1BF44C198();
  if ((v7 & 1) != (v9 & 1))
  {
LABEL_11:
    type metadata accessor for QueuePriority(0);
    sub_1BF4669C8();
    __break(1u);
    return;
  }
  unint64_t v6 = v8;
LABEL_5:
  if (v7)
  {
    *(void *)(*(void *)(*(void *)v1 + 56) + 8 * v6) = a1;
    OUTLINED_FUNCTION_20_4();
  }
  else
  {
    OUTLINED_FUNCTION_20_4();
    sub_1BF43D324(v10, v11, v12, v13);
  }
}

uint64_t sub_1BF43CFF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v4 = (void **)v3;
  unint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_1BF44C030(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA93480);
  if ((sub_1BF466818() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_1BF44C030(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_13:
    uint64_t result = sub_1BF4669C8();
    __break(1u);
    return result;
  }
  unint64_t v11 = v13;
LABEL_5:
  char v15 = *v4;
  if (v12)
  {
    uint64_t v16 = v15[7];
    uint64_t v17 = sub_1BF464E58();
    uint64_t v18 = *(void *)(v17 - 8);
    uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 40);
    uint64_t v20 = v17;
    uint64_t v21 = v16 + *(void *)(v18 + 72) * v11;
    return v19(v21, a1, v20);
  }
  else
  {
    sub_1BF43D3D4(v11, a2, a3, a1, v15);
    return swift_bridgeObjectRetain();
  }
}

void sub_1BF43D15C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_1BF43D168(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

unint64_t sub_1BF43D174(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  char v5 = (void *)(a5[6] + 16 * result);
  *char v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

uint64_t sub_1BF43D1BC(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_1BF4656A8();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

_OWORD *sub_1BF43D274(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_1BF3A8B54(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

uint64_t sub_1BF43D2E0(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result = OUTLINED_FUNCTION_26_5(a1, a6 + 8 * (a1 >> 6));
  uint64_t v8 = (void *)(v7[6] + 16 * result);
  *uint64_t v8 = v9;
  v8[1] = v10;
  uint64_t v11 = (void *)(v7[7] + 16 * result);
  *uint64_t v11 = v12;
  v11[1] = v13;
  uint64_t v14 = v7[2];
  BOOL v15 = __OFADD__(v14, 1);
  uint64_t v16 = v14 + 1;
  if (v15) {
    __break(1u);
  }
  else {
    v7[2] = v16;
  }
  return result;
}

unint64_t sub_1BF43D324(unint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  *(void *)(a4[6] + 8 * result) = a2;
  *(void *)(a4[7] + 8 * result) = a3;
  uint64_t v4 = a4[2];
  BOOL v5 = __OFADD__(v4, 1);
  uint64_t v6 = v4 + 1;
  if (v5) {
    __break(1u);
  }
  else {
    a4[2] = v6;
  }
  return result;
}

void *sub_1BF43D368(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = OUTLINED_FUNCTION_26_5(a1, a4 + 8 * (a1 >> 6));
  uint64_t result = memcpy((void *)(*(void *)(v8 + 48) + 88 * v7), v9, 0x58uLL);
  *(void *)(*(void *)(a4 + 56) + 8 * a1) = a3;
  uint64_t v11 = *(void *)(a4 + 16);
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    *(void *)(a4 + 16) = v13;
  }
  return result;
}

uint64_t sub_1BF43D3D4(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = (void *)(a5[6] + 16 * a1);
  *uint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = sub_1BF464E58();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1, a4, v10);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

uint64_t sub_1BF43D484(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = OUTLINED_FUNCTION_26_5(a1, a5 + 8 * (a1 >> 6));
  uint64_t v7 = (void *)(v6[6] + 16 * result);
  *uint64_t v7 = v8;
  v7[1] = v9;
  *(void *)(v6[7] + 8 * result) = v10;
  uint64_t v11 = v6[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    v6[2] = v13;
  }
  return result;
}

uint64_t sub_1BF43D4C4(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_1BF43D4E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a2;
}

uint64_t sub_1BF43D520(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_1BF464E58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a4, v7);
  swift_bridgeObjectRetain();
  return a2;
}

uint64_t sub_1BF43D5A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1BF3C6640(a3, a1);

  return sub_1BF3A8B64(a4, a2);
}

uint64_t sub_1BF43D5E8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = (uint64_t)a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94808) + 48);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94818);
  uint64_t result = sub_1BF43D520((uint64_t)a2 + *(int *)(v5 + 48), *a1, a1[1], v4);
  *a2 = result;
  a2[1] = v7;
  return result;
}

uint64_t sub_1BF43D64C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  uint64_t v44 = a5;
  uint64_t v9 = sub_1BF464E58();
  uint64_t v40 = *(void *)(v9 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v9);
  uint64_t v39 = (char *)v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)v38 - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94820);
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v16 = (void *)((char *)v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1BF43DAA4(a1, a2, a3, &v43);
  v38[2] = a1;
  swift_bridgeObjectRetain();
  v38[1] = a3;
  swift_retain();
  sub_1BF43DCCC((uint64_t)v16);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94818);
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17) == 1)
  {
LABEL_15:
    swift_release();
    swift_bridgeObjectRelease();
    sub_1BF3A8B4C();
    return swift_release();
  }
  char v41 = *(void (**)(char *, char *, uint64_t))(v40 + 32);
  uint64_t v42 = v40 + 32;
  v38[5] = v40 + 8;
  v38[6] = v40 + 16;
  v38[4] = v40 + 40;
  while (1)
  {
    uint64_t v19 = *v16;
    uint64_t v18 = v16[1];
    uint64_t v20 = v13;
    v41(v13, (char *)v16 + *(int *)(v17 + 48), v9);
    uint64_t v21 = *v44;
    unint64_t v23 = sub_1BF44C030(v19, v18);
    uint64_t v24 = *(void *)(v21 + 16);
    BOOL v25 = (v22 & 1) == 0;
    uint64_t v26 = v24 + v25;
    if (__OFADD__(v24, v25)) {
      break;
    }
    char v27 = v22;
    if (*(void *)(v21 + 24) >= v26)
    {
      if (a4)
      {
        if (v22) {
          goto LABEL_10;
        }
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA93480);
        sub_1BF466828();
        if (v27) {
          goto LABEL_10;
        }
      }
    }
    else
    {
      sub_1BF43C078(v26, a4 & 1);
      unint64_t v28 = sub_1BF44C030(v19, v18);
      if ((v27 & 1) != (v29 & 1)) {
        goto LABEL_18;
      }
      unint64_t v23 = v28;
      if (v27)
      {
LABEL_10:
        uint64_t v31 = v39;
        uint64_t v30 = v40;
        uint64_t v13 = v20;
        (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v39, v20, v9);
        (*(void (**)(char *, uint64_t))(v30 + 8))(v20, v9);
        swift_bridgeObjectRelease();
        (*(void (**)(unint64_t, char *, uint64_t))(v30 + 40))(*(void *)(*v44 + 56) + *(void *)(v30 + 72) * v23, v31, v9);
        goto LABEL_14;
      }
    }
    uint64_t v32 = (void *)*v44;
    *(void *)(*v44 + 8 * (v23 >> 6) + 64) |= 1 << v23;
    uint64_t v33 = (uint64_t *)(v32[6] + 16 * v23);
    *uint64_t v33 = v19;
    v33[1] = v18;
    uint64_t v13 = v20;
    v41((char *)(v32[7] + *(void *)(v40 + 72) * v23), v20, v9);
    uint64_t v34 = v32[2];
    BOOL v35 = __OFADD__(v34, 1);
    uint64_t v36 = v34 + 1;
    if (v35) {
      goto LABEL_17;
    }
    v32[2] = v36;
LABEL_14:
    sub_1BF43DCCC((uint64_t)v16);
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94818);
    a4 = 1;
    if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17) == 1) {
      goto LABEL_15;
    }
  }
  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  uint64_t result = sub_1BF4669C8();
  __break(1u);
  return result;
}

uint64_t sub_1BF43DA30(void *a1)
{
  id v2 = objc_msgSend(a1, sel_bundleIdentifier);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_1BF465FA8();

  return v3;
}

uint64_t sub_1BF43DAA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  *a4 = a1;
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v6 = v7;
  a4[1] = result;
  a4[2] = ~v4;
  if (-v4 < 64) {
    uint64_t v8 = ~(-1 << -(char)v4);
  }
  else {
    uint64_t v8 = -1;
  }
  a4[3] = 0;
  a4[4] = v8 & v6;
  a4[5] = a2;
  a4[6] = a3;
  return result;
}

uint64_t sub_1BF43DAE0@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  int64_t v5 = v1[3];
  int64_t v7 = v5;
  unint64_t v8 = v1[4];
  if (v8)
  {
    uint64_t v9 = (v8 - 1) & v8;
    unint64_t v10 = __clz(__rbit64(v8)) | (v5 << 6);
LABEL_3:
    uint64_t v11 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v10);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    sub_1BF3A8B64(*(void *)(v3 + 56) + 32 * v10, (uint64_t)v24);
    *(void *)&long long v23 = v13;
    *((void *)&v23 + 1) = v12;
    swift_bridgeObjectRetain();
    goto LABEL_23;
  }
  int64_t v14 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    return result;
  }
  int64_t v15 = (unint64_t)(v6 + 64) >> 6;
  if (v14 < v15)
  {
    unint64_t v16 = *(void *)(v4 + 8 * v14);
    if (v16)
    {
LABEL_7:
      uint64_t v9 = (v16 - 1) & v16;
      unint64_t v10 = __clz(__rbit64(v16)) + (v14 << 6);
      int64_t v7 = v14;
      goto LABEL_3;
    }
    int64_t v17 = v5 + 2;
    int64_t v7 = v5 + 1;
    if (v5 + 2 < v15)
    {
      unint64_t v16 = *(void *)(v4 + 8 * v17);
      if (v16)
      {
LABEL_10:
        int64_t v14 = v17;
        goto LABEL_7;
      }
      int64_t v7 = v5 + 2;
      if (v5 + 3 < v15)
      {
        unint64_t v16 = *(void *)(v4 + 8 * (v5 + 3));
        if (v16)
        {
          int64_t v14 = v5 + 3;
          goto LABEL_7;
        }
        int64_t v17 = v5 + 4;
        int64_t v7 = v5 + 3;
        if (v5 + 4 < v15)
        {
          unint64_t v16 = *(void *)(v4 + 8 * v17);
          if (v16) {
            goto LABEL_10;
          }
          int64_t v14 = v5 + 5;
          int64_t v7 = v5 + 4;
          if (v5 + 5 < v15)
          {
            unint64_t v16 = *(void *)(v4 + 8 * v14);
            if (v16) {
              goto LABEL_7;
            }
            int64_t v7 = v15 - 1;
            int64_t v18 = v5 + 6;
            while (v18 < v15)
            {
              unint64_t v16 = *(void *)(v4 + 8 * v18++);
              if (v16)
              {
                int64_t v14 = v18 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  uint64_t v9 = 0;
  memset(v24, 0, sizeof(v24));
  long long v23 = 0u;
LABEL_23:
  uint64_t *v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  uint64_t v19 = (void (*)(_OWORD *))v1[5];
  uint64_t result = sub_1BF430924((uint64_t)&v23, (uint64_t)v22, &qword_1EBA964D0);
  if (*((void *)&v22[0] + 1))
  {
    v21[0] = v22[0];
    v21[1] = v22[1];
    v21[2] = v22[2];
    v19(v21);
    return sub_1BF3ADDF0((uint64_t)v21, &qword_1EBA964C8);
  }
  else
  {
    a1[1] = 0u;
    a1[2] = 0u;
    *a1 = 0u;
  }
  return result;
}

uint64_t sub_1BF43DCCC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94808);
  MEMORY[0x1F4188790](v3);
  int64_t v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94810);
  uint64_t v7 = MEMORY[0x1F4188790](v6 - 8);
  uint64_t result = MEMORY[0x1F4188790](v7);
  unint64_t v10 = (char *)&v37 - v9;
  uint64_t v11 = *v1;
  uint64_t v12 = v1[1];
  uint64_t v14 = v1[2];
  int64_t v13 = v1[3];
  int64_t v15 = v13;
  unint64_t v16 = v1[4];
  uint64_t v38 = v5;
  uint64_t v42 = v17;
  if (!v16)
  {
    int64_t v26 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      return result;
    }
    int64_t v27 = (unint64_t)(v14 + 64) >> 6;
    if (v26 < v27)
    {
      unint64_t v28 = *(void *)(v12 + 8 * v26);
      if (v28)
      {
LABEL_7:
        uint64_t v39 = v14;
        uint64_t v40 = v12;
        uint64_t v41 = a1;
        uint64_t v18 = (v28 - 1) & v28;
        unint64_t v19 = __clz(__rbit64(v28)) + (v26 << 6);
        int64_t v15 = v26;
        goto LABEL_3;
      }
      int64_t v29 = v13 + 2;
      int64_t v15 = v13 + 1;
      if (v13 + 2 < v27)
      {
        unint64_t v28 = *(void *)(v12 + 8 * v29);
        if (v28)
        {
LABEL_10:
          int64_t v26 = v29;
          goto LABEL_7;
        }
        int64_t v15 = v13 + 2;
        if (v13 + 3 < v27)
        {
          unint64_t v28 = *(void *)(v12 + 8 * (v13 + 3));
          if (v28)
          {
            int64_t v26 = v13 + 3;
            goto LABEL_7;
          }
          int64_t v29 = v13 + 4;
          int64_t v15 = v13 + 3;
          if (v13 + 4 < v27)
          {
            unint64_t v28 = *(void *)(v12 + 8 * v29);
            if (v28) {
              goto LABEL_10;
            }
            int64_t v26 = v13 + 5;
            int64_t v15 = v13 + 4;
            if (v13 + 5 < v27)
            {
              unint64_t v28 = *(void *)(v12 + 8 * v26);
              if (v28) {
                goto LABEL_7;
              }
              int64_t v15 = v27 - 1;
              int64_t v30 = v13 + 6;
              while (v30 < v27)
              {
                unint64_t v28 = *(void *)(v12 + 8 * v30++);
                if (v28)
                {
                  int64_t v26 = v30 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 1, 1, v3);
    uint64_t v18 = 0;
    goto LABEL_23;
  }
  uint64_t v39 = v14;
  uint64_t v40 = v12;
  uint64_t v41 = a1;
  uint64_t v18 = (v16 - 1) & v16;
  unint64_t v19 = __clz(__rbit64(v16)) | (v13 << 6);
LABEL_3:
  uint64_t v20 = *(void *)(v11 + 56);
  uint64_t v21 = (uint64_t *)(*(void *)(v11 + 48) + 16 * v19);
  uint64_t v22 = v11;
  uint64_t v23 = *v21;
  uint64_t v24 = v21[1];
  uint64_t v25 = sub_1BF464E58();
  (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v25 - 8) + 16))(&v10[*(int *)(v3 + 48)], v20 + *(void *)(*(void *)(v25 - 8) + 72) * v19, v25);
  *(void *)unint64_t v10 = v23;
  *((void *)v10 + 1) = v24;
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v3);
  uint64_t v11 = v22;
  swift_bridgeObjectRetain();
  uint64_t v12 = v40;
  a1 = v41;
  uint64_t v14 = v39;
LABEL_23:
  uint64_t *v1 = v11;
  v1[1] = v12;
  v1[2] = v14;
  v1[3] = v15;
  v1[4] = v18;
  uint64_t v31 = (void (*)(uint64_t))v1[5];
  uint64_t v32 = v42;
  sub_1BF430924((uint64_t)v10, v42, &qword_1EBA94810);
  uint64_t v33 = 1;
  if (__swift_getEnumTagSinglePayload(v32, 1, v3) != 1)
  {
    uint64_t v34 = v32;
    uint64_t v35 = (uint64_t)v38;
    sub_1BF430924(v34, (uint64_t)v38, &qword_1EBA94808);
    v31(v35);
    sub_1BF3ADDF0(v35, &qword_1EBA94808);
    uint64_t v33 = 0;
  }
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94818);
  return __swift_storeEnumTagSinglePayload(a1, v33, 1, v36);
}

unint64_t sub_1BF43E01C()
{
  unint64_t result = qword_1EA148658;
  if (!qword_1EA148658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA148658);
  }
  return result;
}

uint64_t sub_1BF43E068@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  int64_t v5 = v1[3];
  int64_t v7 = v5;
  unint64_t v8 = v1[4];
  if (v8)
  {
    uint64_t v9 = (v8 - 1) & v8;
    unint64_t v10 = __clz(__rbit64(v8)) | (v5 << 6);
LABEL_3:
    sub_1BF3C6640(*(void *)(v3 + 48) + 40 * v10, (uint64_t)v20);
    sub_1BF3A8B64(*(void *)(v3 + 56) + 32 * v10, (uint64_t)&v20[2] + 8);
    goto LABEL_23;
  }
  int64_t v11 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    return result;
  }
  int64_t v12 = (unint64_t)(v6 + 64) >> 6;
  if (v11 < v12)
  {
    unint64_t v13 = *(void *)(v4 + 8 * v11);
    if (v13)
    {
LABEL_7:
      uint64_t v9 = (v13 - 1) & v13;
      unint64_t v10 = __clz(__rbit64(v13)) + (v11 << 6);
      int64_t v7 = v11;
      goto LABEL_3;
    }
    int64_t v14 = v5 + 2;
    int64_t v7 = v5 + 1;
    if (v5 + 2 < v12)
    {
      unint64_t v13 = *(void *)(v4 + 8 * v14);
      if (v13)
      {
LABEL_10:
        int64_t v11 = v14;
        goto LABEL_7;
      }
      int64_t v7 = v5 + 2;
      if (v5 + 3 < v12)
      {
        unint64_t v13 = *(void *)(v4 + 8 * (v5 + 3));
        if (v13)
        {
          int64_t v11 = v5 + 3;
          goto LABEL_7;
        }
        int64_t v14 = v5 + 4;
        int64_t v7 = v5 + 3;
        if (v5 + 4 < v12)
        {
          unint64_t v13 = *(void *)(v4 + 8 * v14);
          if (v13) {
            goto LABEL_10;
          }
          int64_t v11 = v5 + 5;
          int64_t v7 = v5 + 4;
          if (v5 + 5 < v12)
          {
            unint64_t v13 = *(void *)(v4 + 8 * v11);
            if (v13) {
              goto LABEL_7;
            }
            int64_t v7 = v12 - 1;
            int64_t v15 = v5 + 6;
            while (v15 < v12)
            {
              unint64_t v13 = *(void *)(v4 + 8 * v15++);
              if (v13)
              {
                int64_t v11 = v15 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  uint64_t v9 = 0;
  uint64_t v21 = 0;
  memset(v20, 0, sizeof(v20));
LABEL_23:
  uint64_t *v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  unint64_t v16 = (void (*)(unsigned char *))v1[5];
  uint64_t result = sub_1BF430924((uint64_t)v20, (uint64_t)__src, &qword_1EBA965A0);
  if (__src[3])
  {
    memcpy(v18, __src, sizeof(v18));
    v16(v18);
    return sub_1BF3ADDF0((uint64_t)v18, &qword_1EBA96598);
  }
  else
  {
    *(void *)(a1 + 64) = 0;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

ValueMetadata *type metadata accessor for PluginLoader.LoadingError()
{
  return &type metadata for PluginLoader.LoadingError;
}

uint64_t OUTLINED_FUNCTION_1_33()
{
  return sub_1BF4653F8();
}

uint64_t OUTLINED_FUNCTION_2_35(uint64_t a1)
{
  *(void *)(v2 - 136) = a1;
  *(void *)(v2 - 160) = v1;
  return sub_1BF4653D8();
}

uint64_t OUTLINED_FUNCTION_4_19()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_5_19(uint64_t a1)
{
  *(void *)(v2 - 128) = a1;
  *(void *)(v2 - 152) = v1;
  return sub_1BF4653D8();
}

uint64_t OUTLINED_FUNCTION_8_18()
{
  return sub_1BF465408();
}

uint64_t OUTLINED_FUNCTION_9_16()
{
  return sub_1BF465408();
}

uint64_t OUTLINED_FUNCTION_11_15()
{
  *(void *)(v1 - 104) = *(void *)(v1 - 272);
  *(void *)(v1 - 128) = v0;
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_12_12()
{
  return sub_1BF465428();
}

unint64_t OUTLINED_FUNCTION_13_11(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BF44C030(a2, a3);
}

uint64_t OUTLINED_FUNCTION_14_7()
{
  return sub_1BF4653F8();
}

uint64_t OUTLINED_FUNCTION_19_6()
{
  return sub_1BF466818();
}

uint64_t OUTLINED_FUNCTION_24_3()
{
  return *(void *)(v0 - 336);
}

uint64_t OUTLINED_FUNCTION_25_4(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(v2 - 296);
  *a2 = *(void *)(v2 - 360);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_26_5@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 + 64) |= 1 << result;
  return result;
}

uint64_t OUTLINED_FUNCTION_27_4()
{
  return sub_1BF466888();
}

void OUTLINED_FUNCTION_29_4()
{
  ++*(void *)(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_30_4()
{
  return sub_1BF42B5AC();
}

uint64_t OUTLINED_FUNCTION_31_5()
{
  *(void *)(v0 - 96) = *(void *)(v0 - 264);
  *(void *)(v0 - 120) = *(void *)(v0 - 200);
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_33_3@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, void *a4)
{
  return sub_1BF43D4C4(0, (unint64_t)(a1 + 63) >> 6, a4);
}

void OUTLINED_FUNCTION_38_1(char a1@<W8>, uint64_t a2, uint64_t a3, void *a4)
{
  *a4 = -1 << a1;
}

uint64_t OUTLINED_FUNCTION_39_3()
{
  return sub_1BF3ADDF0(v1 - 160, v0);
}

uint64_t PreferredSizing.deinit()
{
  return v0;
}

uint64_t PreferredSizing.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t type metadata accessor for PreferredSizing()
{
  return self;
}

uint64_t sub_1BF43E630@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  sub_1BF43E734(a1, (uint64_t)v11);
  if (v12 == 2)
  {
    sub_1BF43E79C((uint64_t)v11);
    if (a2)
    {
      uint64_t result = sub_1BF43E79C(a1);
      *(void *)a3 = a2;
      *(unsigned char *)(a3 + 32) = 0;
    }
    else
    {
      sub_1BF43E7FC();
      uint64_t v8 = swift_allocError();
      sub_1BF43E79C(a1);
      v9[0] = v8;
      char v10 = 0;
      return sub_1BF43E848((uint64_t)v9, a3);
    }
  }
  else
  {

    sub_1BF43E79C(a1);
    sub_1BF43E8A4((uint64_t)v11, (uint64_t)v9);
    uint64_t result = sub_1BF43E8A4((uint64_t)v9, (uint64_t)v11);
    if (v12 == 1)
    {
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      char v7 = 2;
    }
    else
    {
      uint64_t result = sub_1BF3F1164((uint64_t)v11, a3);
      char v7 = 1;
    }
    *(unsigned char *)(a3 + 32) = v7;
  }
  return result;
}

uint64_t sub_1BF43E734(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA931D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BF43E79C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA931D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1BF43E7FC()
{
  unint64_t result = qword_1EA148668;
  if (!qword_1EA148668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA148668);
  }
  return result;
}

uint64_t sub_1BF43E848(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1BF43E8A4(uint64_t a1, uint64_t a2)
{
  return a2;
}

unsigned char *_s19InitializationErrorOwst(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1BF43E99CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *_s19InitializationErrorOMa()
{
  return &_s19InitializationErrorON;
}

unint64_t sub_1BF43E9D8()
{
  unint64_t result = qword_1EA148670;
  if (!qword_1EA148670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA148670);
  }
  return result;
}

void destroy for PreviousResultingActionOutcome(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 32);
  if (v1 >= 2) {
    unsigned int v1 = *(_DWORD *)a1 + 2;
  }
  if (v1 == 1)
  {
    if (*(void *)(a1 + 24)) {
      __swift_destroy_boxed_opaque_existential_2(a1);
    }
  }
  else if (!v1)
  {
  }
}

uint64_t initializeWithCopy for PreviousResultingActionOutcome(uint64_t a1, uint64_t *a2)
{
  unsigned int v3 = *((unsigned __int8 *)a2 + 32);
  if (v3 >= 2) {
    unsigned int v3 = *(_DWORD *)a2 + 2;
  }
  if (v3 == 1)
  {
    uint64_t v6 = a2[3];
    if (v6)
    {
      *(void *)(a1 + 24) = v6;
      (**(void (***)(uint64_t))(v6 - 8))(a1);
    }
    else
    {
      long long v9 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v9;
    }
    char v8 = 1;
    goto LABEL_11;
  }
  if (v3)
  {
    long long v7 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v7;
    char v8 = *((unsigned char *)a2 + 32);
LABEL_11:
    *(unsigned char *)(a1 + 32) = v8;
    return a1;
  }
  uint64_t v4 = *a2;
  id v5 = (id)*a2;
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 32) = 0;
  return a1;
}

uint64_t assignWithCopy for PreviousResultingActionOutcome(uint64_t a1, long long *a2)
{
  if ((long long *)a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 32);
    if (v4 >= 2) {
      unsigned int v4 = *(_DWORD *)a1 + 2;
    }
    if (v4 == 1)
    {
      if (*(void *)(a1 + 24)) {
        __swift_destroy_boxed_opaque_existential_2(a1);
      }
    }
    else if (!v4)
    {
    }
    unsigned int v5 = *((unsigned __int8 *)a2 + 32);
    if (v5 >= 2) {
      unsigned int v5 = *(_DWORD *)a2 + 2;
    }
    if (v5 == 1)
    {
      uint64_t v8 = *((void *)a2 + 3);
      if (v8)
      {
        *(void *)(a1 + 24) = v8;
        (**(void (***)(uint64_t, long long *))(v8 - 8))(a1, a2);
      }
      else
      {
        long long v11 = a2[1];
        *(_OWORD *)a1 = *a2;
        *(_OWORD *)(a1 + 16) = v11;
      }
      *(unsigned char *)(a1 + 32) = 1;
    }
    else if (v5)
    {
      long long v9 = *a2;
      long long v10 = a2[1];
      *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
      *(_OWORD *)a1 = v9;
      *(_OWORD *)(a1 + 16) = v10;
    }
    else
    {
      uint64_t v6 = *(void **)a2;
      id v7 = v6;
      *(void *)a1 = v6;
      *(unsigned char *)(a1 + 32) = 0;
    }
  }
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for PreviousResultingActionOutcome(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 32);
    if (v4 >= 2) {
      unsigned int v4 = *(_DWORD *)a1 + 2;
    }
    if (v4 == 1)
    {
      if (*(void *)(a1 + 24)) {
        __swift_destroy_boxed_opaque_existential_2(a1);
      }
    }
    else if (!v4)
    {
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 32);
    if (v5 >= 2) {
      unsigned int v5 = *(_DWORD *)a2 + 2;
    }
    if (v5 == 1)
    {
      long long v6 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v6;
    }
    else
    {
      if (!v5)
      {
        *(void *)a1 = *(void *)a2;
        *(unsigned char *)(a1 + 32) = 0;
        return a1;
      }
      long long v7 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v7;
      LOBYTE(v5) = *(unsigned char *)(a2 + 32);
    }
    *(unsigned char *)(a1 + 32) = v5;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviousResultingActionOutcome(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 >= 3) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PreviousResultingActionOutcome(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 32) = 0;
    *(_OWORD *)__n128 result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1BF43ED70(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 32);
  if (result >= 2) {
    return (*(_DWORD *)a1 + 2);
  }
  return result;
}

uint64_t sub_1BF43ED8C(uint64_t result, unsigned int a2)
{
  if (a2 > 1)
  {
    *(_OWORD *)uint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)uint64_t result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for PreviousResultingActionOutcome()
{
  return &type metadata for PreviousResultingActionOutcome;
}

void sub_1BF43EDC0(void *a1, uint64_t a2, NSObject *a3)
{
  swift_beginAccess();
  long long v6 = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = a1;

  id v7 = a1;
  dispatch_group_leave(a3);
}

BOOL static NSOperationQueuePriority.< infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 < a2;
}

uint64_t sub_1BF43EE34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 == a1 && a4 == a2) {
    return 0;
  }
  OUTLINED_FUNCTION_0_31(a1, a2, a3);
  return sub_1BF466968();
}

BOOL sub_1BF43EE58(uint64_t a1, uint64_t a2)
{
  return a2 < a1;
}

uint64_t sub_1BF43EE64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 == a1 && a4 == a2)
  {
    char v5 = 1;
  }
  else
  {
    OUTLINED_FUNCTION_0_31(a1, a2, a3);
    char v5 = sub_1BF466968() ^ 1;
  }
  return v5 & 1;
}

BOOL sub_1BF43EEA0(uint64_t a1, uint64_t a2)
{
  return a2 >= a1;
}

uint64_t sub_1BF43EEAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 == a3 && a2 == a4) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1BF466968() ^ 1;
  }
  return v5 & 1;
}

BOOL sub_1BF43EEE8(uint64_t a1, uint64_t a2)
{
  return a1 >= a2;
}

unint64_t sub_1BF43EEF8()
{
  unint64_t result = qword_1EBA941C0;
  if (!qword_1EBA941C0)
  {
    type metadata accessor for QueuePriority(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA941C0);
  }
  return result;
}

BOOL sub_1BF43EF48(uint64_t *a1, uint64_t *a2)
{
  return static NSOperationQueuePriority.< infix(_:_:)(*a1, *a2);
}

BOOL sub_1BF43EF54(uint64_t *a1, uint64_t *a2)
{
  return sub_1BF43EEA0(*a1, *a2);
}

BOOL sub_1BF43EF60(uint64_t *a1, uint64_t *a2)
{
  return sub_1BF43EEE8(*a1, *a2);
}

BOOL sub_1BF43EF6C(uint64_t *a1, uint64_t *a2)
{
  return sub_1BF43EE58(*a1, *a2);
}

uint64_t OUTLINED_FUNCTION_0_31(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t sub_1BF43EF98@<X0>(unsigned __int8 a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94B20);
  uint64_t v5 = MEMORY[0x1F4188790](v4 - 8);
  id v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  long long v9 = (char *)&v21 - v8;
  if (a1 - 2 < 2)
  {
    id v10 = objc_msgSend(self, sel_settingsURL);
    if (v10)
    {
      long long v11 = v10;
      sub_1BF464E08();

      uint64_t v12 = sub_1BF464E58();
      uint64_t v13 = 0;
    }
    else
    {
      uint64_t v12 = sub_1BF464E58();
      uint64_t v13 = 1;
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v7, v13, 1, v12);
    uint64_t v20 = (uint64_t)v7;
    return sub_1BF426698(v20, a2);
  }
  if (a1)
  {
    id v16 = objc_msgSend(self, sel_settingsURL);
    if (v16)
    {
      uint64_t v17 = v16;
      sub_1BF464E08();

      uint64_t v18 = sub_1BF464E58();
      uint64_t v19 = 0;
    }
    else
    {
      uint64_t v18 = sub_1BF464E58();
      uint64_t v19 = 1;
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v9, v19, 1, v18);
    uint64_t v20 = (uint64_t)v9;
    return sub_1BF426698(v20, a2);
  }
  uint64_t v14 = sub_1BF464E58();

  return __swift_storeEnumTagSinglePayload(a2, 1, 1, v14);
}

uint64_t sub_1BF43F154(uint64_t a1, char a2)
{
  switch(a2)
  {
    case 1:
      uint64_t v4 = 0xD000000000000013;
      uint64_t v3 = 0x80000001BF46EA10;
      break;
    case 2:
      uint64_t v4 = 0xD00000000000001ALL;
      uint64_t v3 = 0x80000001BF46E9F0;
      break;
    case 3:
      uint64_t v4 = 0xD000000000000017;
      uint64_t v3 = 0x80000001BF46E9D0;
      break;
    default:
      uint64_t v3 = 0x80000001BF46EA30;
      uint64_t v4 = 0xD000000000000012;
      break;
  }
  return sub_1BF43F21C(v4, v3, a1);
}

uint64_t sub_1BF43F21C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4 = objc_msgSend(self, sel_wapiCapability);
  type metadata accessor for Localizations();
  if (v4) {
    uint64_t v5 = 1312902231;
  }
  else {
    uint64_t v5 = 1229343063;
  }
  unint64_t v8 = v5 & 0xFFFF0000FFFFFFFFLL | 0x5F00000000;
  sub_1BF466058();
  uint64_t v6 = sub_1BF42AC0C(v8, 0xE500000000000000, a3);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t ResultingActionDispatcher.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  ResultingActionDispatcher.init()();
  return v0;
}

uint64_t sub_1BF43F31C()
{
  return sub_1BF465D78();
}

unint64_t ResultingActionDispatcher.PerformError.errorDescription.getter(char a1)
{
  if (a1) {
    return 0xD000000000000049;
  }
  else {
    return 0xD000000000000057;
  }
}

BOOL static ResultingActionDispatcher.PerformError.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t ResultingActionDispatcher.PerformError.hash(into:)()
{
  return sub_1BF466A68();
}

uint64_t ResultingActionDispatcher.PerformError.hashValue.getter()
{
  return sub_1BF466A98();
}

BOOL sub_1BF43F3FC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return static ResultingActionDispatcher.PerformError.__derived_enum_equals(_:_:)(*a1, *a2);
}

uint64_t sub_1BF43F408()
{
  return ResultingActionDispatcher.PerformError.hashValue.getter();
}

uint64_t sub_1BF43F410()
{
  return ResultingActionDispatcher.PerformError.hash(into:)();
}

unint64_t sub_1BF43F418()
{
  return ResultingActionDispatcher.PerformError.errorDescription.getter(*v0);
}

void *ResultingActionDispatcher.init()()
{
  sub_1BF4656A8();
  type metadata accessor for ResultingActionImplementationBox();
  sub_1BF442BD4(&qword_1EBA94068, MEMORY[0x1E4F71238]);
  v0[3] = 0;
  v0[2] = 0;
  v0[4] = sub_1BF465EC8();
  swift_beginAccess();
  v0[2] = 0;
  swift_release();
  return v0;
}

uint64_t ResultingActionDispatcher.next.getter()
{
  return swift_retain();
}

uint64_t ResultingActionDispatcher.next.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_release();
}

uint64_t (*ResultingActionDispatcher.next.modify())()
{
  return j_j__swift_endAccess;
}

void *ResultingActionDispatcher.targetQueue.getter()
{
  OUTLINED_FUNCTION_3_5();
  uint64_t v1 = *(void **)(v0 + 24);
  id v2 = v1;
  return v1;
}

void ResultingActionDispatcher.targetQueue.setter(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = a1;
}

uint64_t (*ResultingActionDispatcher.targetQueue.modify())()
{
  return j__swift_endAccess;
}

uint64_t ResultingActionDispatcher.add<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a2 - 8);
  MEMORY[0x1F4188790](a1);
  OUTLINED_FUNCTION_1_8();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = sub_1BF4656A8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_1_4();
  swift_getAssociatedTypeWitness();
  sub_1BF4656B8();
  type metadata accessor for ConcreteResultingActionImplementationBox();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v8, a1, a2);
  uint64_t v13 = ConcreteResultingActionImplementationBox.__allocating_init(_:)();
  OUTLINED_FUNCTION_15_3();
  sub_1BF441A04(v13, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v2, v9);
}

uint64_t sub_1BF43F81C()
{
  uint64_t v1 = sub_1BF4656A8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_1_4();
  sub_1BF4656B8();
  OUTLINED_FUNCTION_15_3();
  uint64_t v5 = swift_retain();
  sub_1BF441A04(v5, v0);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
}

Swift::Void __swiftcall ResultingActionDispatcher.removeAllImplementations()()
{
}

uint64_t ResultingActionDispatcher.removeImplementation(forType:)()
{
  uint64_t v1 = sub_1BF4656A8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_52_0();
  swift_getMetatypeMetadata();
  sub_1BF465698();
  OUTLINED_FUNCTION_15_3();
  sub_1BF4413A0();
  swift_endAccess();
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
}

uint64_t ResultingActionDispatcher.perform(_:withMetrics:asPartOf:previousActionOutcome:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v52 = a3;
  uint64_t v43 = a2;
  uint64_t v44 = a1;
  uint64_t v45 = sub_1BF465188();
  OUTLINED_FUNCTION_0_0();
  uint64_t v49 = v7;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_8_5();
  uint64_t v42 = v9;
  OUTLINED_FUNCTION_68();
  uint64_t v47 = sub_1BF4651C8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v46 = v10;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_1_8();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = type metadata accessor for ResultingActionDispatcher.MetricsBehavior();
  uint64_t v16 = OUTLINED_FUNCTION_0_2(v15);
  uint64_t v18 = v17;
  uint64_t v20 = *(void *)(v19 + 64);
  MEMORY[0x1F4188790](v16);
  uint64_t v21 = (char *)&v38 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA964A0);
  uint64_t v50 = sub_1BF465DB8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94108);
  uint64_t v22 = sub_1BF465DB8();
  unint64_t v48 = sub_1BF3B0644();
  uint64_t v39 = sub_1BF466458();
  sub_1BF3AA4C4(a1, (uint64_t)v59);
  sub_1BF441CAC(a2, (uint64_t)v21);
  sub_1BF3C694C(a4, (uint64_t)v58, &qword_1EBA93DE0);
  uint64_t v23 = *(unsigned __int8 *)(v18 + 80);
  uint64_t v24 = (v23 + 64) & ~v23;
  uint64_t v40 = v24;
  uint64_t v41 = v23 | 7;
  unint64_t v25 = (v24 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v26 = (v24 + v20 + 47) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = v51;
  sub_1BF3A6D50(v59, v27 + 24);
  sub_1BF441E34((uint64_t)v21, v27 + v24);
  sub_1BF3C65E4((uint64_t)v58, v27 + v25, &qword_1EBA93DE0);
  *(void *)(v27 + v26) = v52;
  *(void *)(v27 + ((v26 + 15) & 0xFFFFFFFFFFFFFFF8)) = v22;
  uint64_t v56 = sub_1BF441E98;
  uint64_t v57 = v27;
  *(void *)&long long aBlock = MEMORY[0x1E4F143A8];
  *((void *)&aBlock + 1) = 1107296256;
  uint64_t v54 = sub_1BF3AC814;
  uint64_t v55 = &block_descriptor_15;
  unint64_t v28 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  sub_1BF4651A8();
  *(void *)&long long aBlock = MEMORY[0x1E4FBC860];
  sub_1BF442BD4((unint64_t *)&qword_1EBA963D0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA964D8);
  sub_1BF3C612C((unint64_t *)&qword_1EBA964E0, &qword_1EBA964D8);
  uint64_t v29 = v42;
  sub_1BF466608();
  int64_t v30 = (void *)v39;
  MEMORY[0x1C18A9C40](0, v14, v29, v28);
  _Block_release(v28);

  OUTLINED_FUNCTION_2_5();
  v31();
  OUTLINED_FUNCTION_2_5();
  v32();
  uint64_t v33 = swift_allocObject();
  swift_weakInit();
  sub_1BF3AA4C4(v44, (uint64_t)&aBlock);
  sub_1BF441CAC(v43, (uint64_t)v21);
  uint64_t v34 = swift_allocObject();
  *(void *)(v34 + 16) = v33;
  sub_1BF3A6D50(&aBlock, v34 + 24);
  sub_1BF441E34((uint64_t)v21, v34 + v40);
  *(void *)(v34 + v25) = v52;
  uint64_t v35 = v50;
  *(void *)(v34 + ((v25 + 15) & 0xFFFFFFFFFFFFFFF8)) = v50;
  swift_retain();
  swift_retain();
  uint64_t v36 = (void *)sub_1BF466458();
  sub_1BF4420FC(v36, (uint64_t)sub_1BF442060, v34);

  swift_release();
  swift_release();
  return v35;
}

uint64_t sub_1BF43FEEC(uint64_t a1, void *a2, void (*a3)(uint64_t, uint64_t, uint64_t), uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = sub_1BF440380(a2, a3, a4, a5);
  sub_1BF3B0644();
  uint64_t v6 = (void *)sub_1BF466458();
  sub_1BF442CC0(v5, v6);

  return swift_release();
}

uint64_t sub_1BF43FF94(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (!result) {
    return result;
  }
  sub_1BF3C694C(a1, (uint64_t)&v30, (uint64_t *)&unk_1EBA931D8);
  if (*((void *)&v31 + 1) == 1)
  {
    sub_1BF4227B0((uint64_t)&v30);
    sub_1BF442268();
    uint64_t v12 = (void *)swift_allocError();
    *uint64_t v13 = 1;
  }
  else
  {
    if (*((void *)&v31 + 1) == 2) {
      sub_1BF3C6A30((uint64_t)&v30, (uint64_t *)&unk_1EBA931D8);
    }
    else {
      sub_1BF4227B0((uint64_t)&v30);
    }
    id v14 = a2;
    uint64_t v12 = a2;
  }
  uint64_t v32 = 0;
  long long v30 = 0u;
  long long v31 = 0u;
  sub_1BF3AA4C4(a4, (uint64_t)&v25);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA94030);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA931C8);
  if (swift_dynamicCast())
  {
    sub_1BF3A6D50(&v22, (uint64_t)v27);
    uint64_t v15 = v28;
    uint64_t v16 = v29;
    __swift_project_boxed_opaque_existential_2(v27, v28);
    if (v12) {
      (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(v16 + 16))(&v25, v15, v16);
    }
    else {
      (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(v16 + 24))(&v25, v15, v16);
    }
    goto LABEL_15;
  }
  uint64_t v24 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  sub_1BF3C6A30((uint64_t)&v22, &qword_1EBA931D0);
  sub_1BF3AA4C4(a4, (uint64_t)&v25);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA931C0);
  if (swift_dynamicCast())
  {
    sub_1BF3A6D50(&v22, (uint64_t)v27);
    uint64_t v17 = v28;
    uint64_t v18 = v29;
    __swift_project_boxed_opaque_existential_2(v27, v28);
    (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(v18 + 16))(&v25, v17, v18);
LABEL_15:
    sub_1BF3C6A30((uint64_t)&v30, &qword_1EBA94040);
    sub_1BF3C65E4((uint64_t)&v25, (uint64_t)&v30, &qword_1EBA94040);
    __swift_destroy_boxed_opaque_existential_2((uint64_t)v27);
    goto LABEL_16;
  }
  uint64_t v24 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  sub_1BF3C6A30((uint64_t)&v22, (uint64_t *)&unk_1EA1486B0);
LABEL_16:
  sub_1BF3C694C((uint64_t)&v30, (uint64_t)&v25, &qword_1EBA94040);
  if (v26)
  {
    sub_1BF3A6D50(&v25, (uint64_t)v27);
    sub_1BF3C694C(a1, (uint64_t)&v22, (uint64_t *)&unk_1EBA931D8);
    id v19 = a2;
    sub_1BF43E630((uint64_t)&v22, a2, (uint64_t)&v25);
    sub_1BF442C64((uint64_t)&v25, (uint64_t)&v22);
    uint64_t v20 = ResultingActionDispatcher.perform(_:withMetrics:asPartOf:previousActionOutcome:)(v27, a5, a6, &v22);
    sub_1BF3C6A30((uint64_t)&v22, &qword_1EBA93DE0);
    sub_1BF3B0644();
    uint64_t v21 = (void *)sub_1BF466458();
    sub_1BF442CC0(v20, v21);
    swift_release();
    swift_release();

    sub_1BF442D60((uint64_t)&v25);
    __swift_destroy_boxed_opaque_existential_2((uint64_t)v27);
  }
  else
  {
    sub_1BF3C6A30((uint64_t)&v25, &qword_1EBA94040);
    sub_1BF465D78();
    swift_release();
  }
  return sub_1BF3C6A30((uint64_t)&v30, &qword_1EBA94040);
}

uint64_t sub_1BF440380(void *a1, void (*a2)(uint64_t, uint64_t, uint64_t), uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v31 = sub_1BF4656A8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_52_0();
  uint64_t v13 = sub_1BF465238();
  OUTLINED_FUNCTION_0_0();
  uint64_t v15 = v14;
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_3_18();
  OUTLINED_FUNCTION_3_5();
  uint64_t v17 = (void *)v4[3];
  if (!v17
    || (*uint64_t v6 = v17,
        (*(void (**)(void *, void, uint64_t))(v15 + 104))(v6, *MEMORY[0x1E4FBCBF0], v13),
        id v18 = v17,
        char v19 = sub_1BF465278(),
        uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v15 + 8))(v6, v13),
        (v19 & 1) != 0))
  {
    uint64_t v21 = a1[3];
    long long v22 = __swift_project_boxed_opaque_existential_2(a1, v21);
    uint64_t v35 = v21;
    boxed_opaque_existential_2Tm = __swift_allocate_boxed_opaque_existential_2Tm((uint64_t *)&v33);
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v21 - 8) + 16))(boxed_opaque_existential_2Tm, v22, v21);
    sub_1BF465698();
    OUTLINED_FUNCTION_3_5();
    uint64_t v24 = v4[4];
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_1BF449EE4(v5, v24);
    swift_bridgeObjectRelease();
    if (v25)
    {
      sub_1BF440918(a1, a2, a4);
      OUTLINED_FUNCTION_3_5();
      uint64_t v27 = v4[2];
      if (v27)
      {
        uint64_t v28 = *(void (**)(void *, uint64_t, void))(*(void *)v25 + 80);
        swift_retain();
        v28(a1, a3, a4);
        sub_1BF3AA4C4((uint64_t)a1, (uint64_t)&v33);
        sub_1BF3C694C(a3, (uint64_t)v32, &qword_1EBA93DE0);
        uint64_t v29 = swift_allocObject();
        *(void *)(v29 + 16) = v27;
        sub_1BF3A6D50(&v33, v29 + 24);
        sub_1BF3C65E4((uint64_t)v32, v29 + 64, &qword_1EBA93DE0);
        *(void *)(v29 + 104) = a4;
        uint64_t v35 = sub_1BF4657C8();
        uint64_t v36 = MEMORY[0x1E4F713E0];
        __swift_allocate_boxed_opaque_existential_2Tm((uint64_t *)&v33);
        swift_retain();
        swift_retain();
        sub_1BF4657B8();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94108);
        sub_1BF3C612C(&qword_1EA1486A0, &qword_1EBA94108);
        uint64_t v26 = sub_1BF465D68();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        __swift_destroy_boxed_opaque_existential_2((uint64_t)&v33);
        goto LABEL_8;
      }
      uint64_t v26 = (*(uint64_t (**)(void *, uint64_t, void))(*(void *)v25 + 80))(a1, a3, a4);
    }
    else
    {
      OUTLINED_FUNCTION_3_5();
      if (!v4[2])
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94108);
        long long v33 = 0uLL;
        uint64_t v34 = 0;
        uint64_t v35 = 1;
        uint64_t v26 = sub_1BF465D38();
        goto LABEL_8;
      }
      swift_retain();
      uint64_t v26 = sub_1BF440380(a1, a2, a3, a4);
    }
    swift_release();
LABEL_8:
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v5, v31);
    return v26;
  }
  __break(1u);
  return result;
}

uint64_t sub_1BF4407DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = type metadata accessor for ResultingActionDispatcher.MetricsBehavior();
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = &v15[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1BF422B48(a1, (uint64_t)v17);
  if (v18 == 1)
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA940A8);
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, v12);
    uint64_t v13 = sub_1BF440380(a3, v11, a4, a5);
    sub_1BF3EE1F4((uint64_t)v11);
  }
  else
  {
    sub_1BF3C65E4((uint64_t)v17, (uint64_t)v16, &qword_1EBA96600);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94108);
    sub_1BF3C694C((uint64_t)v16, (uint64_t)v15, &qword_1EBA96600);
    uint64_t v13 = sub_1BF465D38();
    sub_1BF3C6A30((uint64_t)v16, &qword_1EBA96600);
  }
  return v13;
}

uint64_t sub_1BF440918(void *a1, void (*a2)(uint64_t, uint64_t, uint64_t), void (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v95 = a2;
  uint64_t v87 = a1;
  uint64_t v6 = sub_1BF465538();
  OUTLINED_FUNCTION_0_0();
  uint64_t v78 = v7;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_1_4();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94048);
  MEMORY[0x1F4188790](v9 - 8);
  OUTLINED_FUNCTION_8_5();
  uint64_t v77 = v10;
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA940C8);
  OUTLINED_FUNCTION_0_0();
  uint64_t v93 = v11;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_8_5();
  uint64_t v89 = v13;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA940B0);
  OUTLINED_FUNCTION_0_0();
  uint64_t v85 = v15;
  uint64_t v86 = v14;
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_8_5();
  uint64_t v83 = v16;
  OUTLINED_FUNCTION_68();
  uint64_t v84 = sub_1BF465788();
  OUTLINED_FUNCTION_0_0();
  uint64_t v82 = v17;
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_8_5();
  uint64_t v81 = v19;
  OUTLINED_FUNCTION_68();
  sub_1BF465618();
  OUTLINED_FUNCTION_0_0();
  uint64_t v79 = v21;
  uint64_t v80 = v20;
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_8_5();
  uint64_t v94 = v22;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94078);
  MEMORY[0x1F4188790](v23 - 8);
  OUTLINED_FUNCTION_3_18();
  uint64_t v24 = sub_1BF465778();
  OUTLINED_FUNCTION_0_0();
  uint64_t v91 = v25;
  MEMORY[0x1F4188790](v26);
  OUTLINED_FUNCTION_8_5();
  uint64_t v90 = v27;
  OUTLINED_FUNCTION_68();
  uint64_t v28 = (void *)sub_1BF465948();
  OUTLINED_FUNCTION_0_0();
  uint64_t v30 = v29;
  uint64_t v32 = MEMORY[0x1F4188790](v31);
  uint64_t v92 = (char *)&v74 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v32);
  uint64_t v35 = (char *)&v74 - v34;
  uint64_t v36 = type metadata accessor for ResultingActionDispatcher.MetricsBehavior();
  MEMORY[0x1F4188790](v36 - 8);
  OUTLINED_FUNCTION_1_8();
  uint64_t v39 = v38 - v37;
  sub_1BF441CAC((uint64_t)v95, v38 - v37);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA940A8);
  uint64_t result = __swift_getEnumTagSinglePayload(v39, 1, v40);
  if (result != 1)
  {
    (*(void (**)(char *, uint64_t, void *))(v30 + 32))(v35, v39, v28);
    uint64_t v95 = a3;
    sub_1BF4656F8();
    if (__swift_getEnumTagSinglePayload(v4, 1, v24) == 1)
    {
      sub_1BF3C6A30(v4, &qword_1EBA94078);
      sub_1BF442268();
      swift_allocError();
      *uint64_t v42 = 0;
      swift_willThrow();
      return (*(uint64_t (**)(char *, void *))(v30 + 8))(v35, v28);
    }
    else
    {
      uint64_t v74 = v3;
      uint64_t v43 = v6;
      uint64_t v44 = *(void (**)(uint64_t, uint64_t, uint64_t))(v91 + 32);
      uint64_t v76 = v24;
      v44(v90, v4, v24);
      __swift_project_boxed_opaque_existential_2(v87, v87[3]);
      uint64_t v45 = v94;
      sub_1BF465488();
      uint64_t v75 = v30;
      uint64_t v46 = *(void (**)(char *, char *, void *))(v30 + 16);
      uint64_t v87 = v28;
      v46(v92, v35, v28);
      sub_1BF465608();
      sub_1BF4658E8();
      sub_1BF465928();
      OUTLINED_FUNCTION_2_5();
      v47();
      OUTLINED_FUNCTION_2_5();
      v48();
      uint64_t v49 = v89;
      sub_1BF4658D8();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA94140);
      char v50 = sub_1BF465908();
      uint64_t v51 = (void (*)(uint64_t, uint64_t))*((void *)v93 + 1);
      uint64_t v52 = v88;
      v93 += 8;
      v51(v49, v88);
      uint64_t v53 = v35;
      if ((v50 & 1) == 0)
      {
        sub_1BF465978();
        sub_1BF4656F8();
        if (v96)
        {
          uint64_t v54 = v77;
          sub_1BF465968();
          uint64_t v55 = sub_1BF465568();
          if (__swift_getEnumTagSinglePayload(v54, 1, v55))
          {
            swift_release();
            sub_1BF3C6A30(v54, &qword_1EBA94048);
          }
          else
          {
            uint64_t v56 = sub_1BF465558();
            sub_1BF3C6A30(v54, &qword_1EBA94048);
            if (v56)
            {
              uint64_t v96 = v56;
              uint64_t v57 = v89;
              sub_1BF4658D8();
              sub_1BF465928();
              swift_release();
              v51(v57, v52);
              swift_bridgeObjectRelease();
            }
            else
            {
              swift_release();
            }
          }
        }
        uint64_t v45 = v94;
      }
      uint64_t v58 = sub_1BF4655F8();
      uint64_t v59 = *(void *)(v58 + 16);
      if (v59)
      {
        uint64_t v93 = v35;
        uint64_t v95 = *(void (**)(uint64_t, uint64_t, uint64_t))(v78 + 16);
        uint64_t v60 = *(unsigned __int8 *)(v78 + 80);
        uint64_t v89 = v58;
        uint64_t v61 = v58 + ((v60 + 32) & ~v60);
        uint64_t v62 = *(void *)(v78 + 72);
        uint64_t v63 = (void (**)(uint64_t, uint64_t))(v78 + 8);
        uint64_t v64 = v92;
        uint64_t v65 = v74;
        do
        {
          v95(v65, v61, v43);
          sub_1BF465758();
          swift_release();
          (*v63)(v65, v43);
          v61 += v62;
          --v59;
        }
        while (v59);
        swift_bridgeObjectRelease();
        uint64_t v66 = v79;
        uint64_t v67 = v80;
        uint64_t v53 = v93;
        uint64_t v68 = v94;
        uint64_t v69 = v87;
        uint64_t v70 = v75;
        uint64_t v71 = v64;
      }
      else
      {
        uint64_t v68 = v45;
        swift_bridgeObjectRelease();
        uint64_t v66 = v79;
        uint64_t v67 = v80;
        uint64_t v69 = v87;
        uint64_t v70 = v75;
        uint64_t v71 = v92;
      }
      uint64_t v72 = *(void (**)(char *, void *))(v70 + 8);
      v72(v71, v69);
      (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v68, v67);
      OUTLINED_FUNCTION_2_5();
      v73();
      return ((uint64_t (*)(char *, void *))v72)(v53, v69);
    }
  }
  return result;
}

uint64_t ResultingActionDispatcher.deinit()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void *)(v0 + 16);
  *(void *)(v0 + 16) = 0;
  if (v1)
  {
    do
    {
      if (!swift_isUniquelyReferenced_native()) {
        break;
      }
      uint64_t v2 = *(void *)(v1 + 16);
      swift_retain();
      swift_release();
      uint64_t v1 = v2;
    }
    while (v2);
  }
  swift_release();
  return v0;
}

uint64_t ResultingActionDispatcher.__deallocating_deinit()
{
  ResultingActionDispatcher.deinit();

  return MEMORY[0x1F4186488](v0, 40, 7);
}

uint64_t ResultingActionDispatcher.debugDescription.getter()
{
  OUTLINED_FUNCTION_3_5();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA148680);
  sub_1BF3C612C(&qword_1EA148688, &qword_1EA148680);
  sub_1BF3B45B4();
  sub_1BF466108();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_5();
  if (*(void *)(v0 + 16))
  {
    type metadata accessor for ResultingActionDispatcher();
    swift_retain();
    sub_1BF465FF8();
  }
  sub_1BF466768();
  uint64_t v1 = sub_1BF466AE8();
  swift_bridgeObjectRelease();
  sub_1BF466058();
  sub_1BF466058();
  swift_bridgeObjectRelease();
  sub_1BF466058();
  sub_1BF466058();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_1BF441300@<X0>(uint64_t *a1@<X8>)
{
  sub_1BF4656A8();
  sub_1BF442BD4(&qword_1EA1486A8, MEMORY[0x1E4F71238]);
  uint64_t result = sub_1BF466928();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1BF44137C()
{
  return ResultingActionDispatcher.debugDescription.getter();
}

uint64_t sub_1BF4413A0()
{
  uint64_t v1 = v0;
  swift_bridgeObjectRetain();
  unint64_t v2 = sub_1BF44C0A8();
  char v4 = v3;
  swift_bridgeObjectRelease();
  if ((v4 & 1) == 0) {
    return 0;
  }
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v1;
  uint64_t *v1 = 0x8000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA93478);
  sub_1BF466818();
  uint64_t v5 = *(void *)(v9 + 48);
  uint64_t v6 = sub_1BF4656A8();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5 + *(void *)(*(void *)(v6 - 8) + 72) * v2, v6);
  uint64_t v7 = *(void *)(*(void *)(v9 + 56) + 8 * v2);
  type metadata accessor for ResultingActionImplementationBox();
  sub_1BF442BD4(&qword_1EBA94068, MEMORY[0x1E4F71238]);
  sub_1BF466838();
  uint64_t *v1 = v9;
  swift_bridgeObjectRelease();
  return v7;
}

void sub_1BF441508(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_14_8();
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  swift_bridgeObjectRetain();
  unint64_t v18 = sub_1BF44C030(v15, v13);
  LOBYTE(v13) = v19;
  swift_bridgeObjectRelease();
  if (v13)
  {
    swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_9_17();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA934A0);
    OUTLINED_FUNCTION_7_15();
    swift_bridgeObjectRelease();
    sub_1BF3A8B54((_OWORD *)(*(void *)(a10 + 56) + 32 * v18), v17);
    sub_1BF466838();
    *uint64_t v11 = a10;
    OUTLINED_FUNCTION_8_19();
    swift_bridgeObjectRelease();
  }
  else
  {
    _OWORD *v17 = 0u;
    v17[1] = 0u;
    OUTLINED_FUNCTION_8_19();
  }
}

void sub_1BF441610(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_14_8();
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  swift_bridgeObjectRetain();
  sub_1BF44C030(v15, v13);
  LOBYTE(v13) = v16;
  swift_bridgeObjectRelease();
  if (v13)
  {
    swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_13_12();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA934C0);
    OUTLINED_FUNCTION_18_6();
    swift_bridgeObjectRelease();
    sub_1BF466838();
    *uint64_t v11 = a10;
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_8_19();
}

void sub_1BF4416F4()
{
  OUTLINED_FUNCTION_14_8();
  sub_1BF44C198();
  if (v1)
  {
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v2 = *v0;
    *uint64_t v0 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA934B0);
    OUTLINED_FUNCTION_7_15();
    type metadata accessor for QueuePriority(0);
    sub_1BF442BD4(&qword_1EBA93450, type metadata accessor for QueuePriority);
    sub_1BF466838();
    *uint64_t v0 = v2;
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_8_19();
}

void sub_1BF4417F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_14_8();
  uint64_t v11 = v10;
  swift_bridgeObjectRetain();
  sub_1BF44C13C();
  char v13 = v12;
  swift_bridgeObjectRelease();
  if (v13)
  {
    swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_13_12();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA93470);
    OUTLINED_FUNCTION_18_6();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA931B8);
    sub_1BF3C18C0();
    sub_1BF466838();
    *uint64_t v11 = a10;
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_8_19();
}

void sub_1BF4418EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_14_8();
  uint64_t v11 = v10;
  char v13 = v12;
  swift_bridgeObjectRetain();
  unint64_t v14 = sub_1BF44BFF0();
  char v16 = v15;
  swift_bridgeObjectRelease();
  if (v16)
  {
    swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_9_17();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA148278);
    OUTLINED_FUNCTION_7_15();
    sub_1BF3BC338(*(void *)(a10 + 48) + 40 * v14);
    sub_1BF3A8B54((_OWORD *)(*(void *)(a10 + 56) + 32 * v14), v13);
    sub_1BF466838();
    *uint64_t v11 = a10;
    OUTLINED_FUNCTION_8_19();
    swift_bridgeObjectRelease();
  }
  else
  {
    *char v13 = 0u;
    v13[1] = 0u;
    OUTLINED_FUNCTION_8_19();
  }
}

uint64_t sub_1BF4419EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_1BF441BE4(a1, a2, a3, (uint64_t)sub_1BF43C980, a5, a6, a7, a8, a9, a10);
}

uint64_t sub_1BF441A04(uint64_t a1, uint64_t a2)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v6 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  sub_1BF43CA7C(a1, a2);
  *uint64_t v2 = v6;

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BF441A84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_1BF441BE4(a1, a2, a3, (uint64_t)sub_1BF43CBD0, a5, a6, a7, a8, a9, a10);
}

uint64_t sub_1BF441A9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_1BF441BE4(a1, a2, a3, (uint64_t)sub_1BF43CBDC, a5, a6, a7, a8, a9, a10);
}

uint64_t sub_1BF441AB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_1BF441BE4(a1, a2, a3, (uint64_t)sub_1BF43CCD0, a5, a6, a7, a8, a9, a10);
}

uint64_t sub_1BF441ACC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_14_8();
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  swift_isUniquelyReferenced_nonNull_native();
  OUTLINED_FUNCTION_3_27();
  sub_1BF43CCDC(v16, v14, v12);
  *uint64_t v10 = a10;
  OUTLINED_FUNCTION_8_19();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BF441B44(uint64_t a1)
{
  swift_isUniquelyReferenced_nonNull_native();
  OUTLINED_FUNCTION_3_27();
  sub_1BF43CEFC(a1);
  void *v1 = v4;

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BF441BB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_1BF441BE4(a1, a2, a3, (uint64_t)sub_1BF43D15C, a5, a6, a7, a8, a9, a10);
}

uint64_t sub_1BF441BCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_1BF441BE4(a1, a2, a3, (uint64_t)sub_1BF43D168, a5, a6, a7, a8, a9, a10);
}

uint64_t sub_1BF441BE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_14_8();
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  swift_isUniquelyReferenced_nonNull_native();
  OUTLINED_FUNCTION_3_27();
  v12(v18, v16, v14);
  *uint64_t v10 = a10;
  OUTLINED_FUNCTION_8_19();
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for ResultingActionDispatcher.MetricsBehavior()
{
  uint64_t result = qword_1EBA93C40;
  if (!qword_1EBA93C40) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1BF441CAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ResultingActionDispatcher.MetricsBehavior();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BF441D10()
{
  uint64_t v1 = type metadata accessor for ResultingActionDispatcher.MetricsBehavior();
  OUTLINED_FUNCTION_0_2(v1);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 64) & ~v3;
  unint64_t v6 = (v4 + *(void *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  __swift_destroy_boxed_opaque_existential_2(v0 + 24);
  uint64_t v7 = v0 + v4;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA940A8);
  if (!__swift_getEnumTagSinglePayload(v7, 1, v8))
  {
    sub_1BF465948();
    OUTLINED_FUNCTION_0_3();
    (*(void (**)(uint64_t))(v9 + 8))(v7);
  }
  uint64_t v10 = v0 + v6;
  if (*(unsigned char *)(v0 + v6 + 32) == 1)
  {
    if (*(void *)(v10 + 24)) {
      __swift_destroy_boxed_opaque_existential_2(v10);
    }
  }
  else if (!*(unsigned char *)(v0 + v6 + 32))
  {
  }
  OUTLINED_FUNCTION_11_16();
  swift_release();

  return MEMORY[0x1F4186498](v0, v7, v3);
}

uint64_t sub_1BF441E34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ResultingActionDispatcher.MetricsBehavior();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BF441E98()
{
  uint64_t v1 = type metadata accessor for ResultingActionDispatcher.MetricsBehavior();
  OUTLINED_FUNCTION_0_2(v1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v7 = v6 + *(void *)(v5 + 64);
  uint64_t v8 = *(void *)(v0 + 16);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + ((v7 + 47) & 0xFFFFFFFFFFFFFFF8));

  return sub_1BF43FEEC(v8, (void *)(v0 + 24), (void (*)(uint64_t, uint64_t, uint64_t))(v0 + v6), v0 + ((v7 + 7) & 0xFFFFFFFFFFFFFFF8), v9);
}

uint64_t block_copy_helper_15(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_15()
{
  return swift_release();
}

uint64_t sub_1BF441F38()
{
  swift_weakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BF441F70()
{
  uint64_t v1 = type metadata accessor for ResultingActionDispatcher.MetricsBehavior();
  OUTLINED_FUNCTION_0_2(v1);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 64) & ~v3;
  swift_release();
  __swift_destroy_boxed_opaque_existential_2(v0 + 24);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA940A8);
  if (!__swift_getEnumTagSinglePayload(v0 + v4, 1, v5))
  {
    sub_1BF465948();
    OUTLINED_FUNCTION_0_3();
    (*(void (**)(uint64_t))(v6 + 8))(v0 + v4);
  }
  OUTLINED_FUNCTION_11_16();
  swift_release();

  return MEMORY[0x1F4186498](v0, v0 + v4, v3);
}

uint64_t sub_1BF442060(uint64_t a1, void *a2)
{
  uint64_t v5 = type metadata accessor for ResultingActionDispatcher.MetricsBehavior();
  OUTLINED_FUNCTION_0_2(v5);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = *(void *)(v2 + 16);
  uint64_t v12 = *(void *)(v2 + ((*(void *)(v9 + 64) + v10 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_1BF43FF94(a1, a2, v11, v2 + 24, v2 + v10, v12);
}

uint64_t sub_1BF4420FC(void *a1, uint64_t a2, uint64_t a3)
{
  v10[3] = sub_1BF3B0644();
  v10[4] = MEMORY[0x1E4F71860];
  v10[0] = a1;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a3;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  swift_retain_n();
  id v8 = a1;
  sub_1BF465D18();
  swift_release();
  swift_release();
  return __swift_destroy_boxed_opaque_existential_2((uint64_t)v10);
}

uint64_t type metadata accessor for ResultingActionDispatcher()
{
  return self;
}

unint64_t sub_1BF442218()
{
  unint64_t result = qword_1EA148690;
  if (!qword_1EA148690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA148690);
  }
  return result;
}

unint64_t sub_1BF442268()
{
  unint64_t result = qword_1EA148698;
  if (!qword_1EA148698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA148698);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for ResultingActionDispatcher.MetricsBehavior(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA940A8);
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v9 = sub_1BF465948();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for ResultingActionDispatcher.MetricsBehavior(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA940A8);
  uint64_t result = __swift_getEnumTagSinglePayload(a1, 1, v2);
  if (!result)
  {
    uint64_t v4 = sub_1BF465948();
    int v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
    return v5(a1, v4);
  }
  return result;
}

void *initializeWithCopy for ResultingActionDispatcher.MetricsBehavior(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA940A8);
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_1BF465948();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  return a1;
}

void *assignWithCopy for ResultingActionDispatcher.MetricsBehavior(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA940A8);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (!EnumTagSinglePayload)
  {
    if (!v8)
    {
      uint64_t v11 = sub_1BF465948();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 24))(a1, a2, v11);
      return a1;
    }
    sub_1BF3C6A30((uint64_t)a1, &qword_1EBA940A8);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v9 = sub_1BF465948();
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  return a1;
}

void *initializeWithTake for ResultingActionDispatcher.MetricsBehavior(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA940A8);
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_1BF465948();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  return a1;
}

void *assignWithTake for ResultingActionDispatcher.MetricsBehavior(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA940A8);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (!EnumTagSinglePayload)
  {
    if (!v8)
    {
      uint64_t v11 = sub_1BF465948();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 40))(a1, a2, v11);
      return a1;
    }
    sub_1BF3C6A30((uint64_t)a1, &qword_1EBA940A8);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v9 = sub_1BF465948();
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ResultingActionDispatcher.MetricsBehavior(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BF442878);
}

uint64_t sub_1BF442878(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA940A8);
  unsigned int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(a1, a2, v4);
  if (EnumTagSinglePayload >= 2) {
    return EnumTagSinglePayload - 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ResultingActionDispatcher.MetricsBehavior(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BF4428D8);
}

uint64_t sub_1BF4428D8(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 1);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA940A8);

  return __swift_storeEnumTagSinglePayload(a1, v5, a3, v6);
}

uint64_t sub_1BF442938(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA940A8);

  return __swift_getEnumTagSinglePayload(a1, 1, v2);
}

uint64_t sub_1BF442980(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA940A8);

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v4);
}

uint64_t sub_1BF4429D0()
{
  uint64_t result = sub_1BF465948();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ResultingActionDispatcher.PerformError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BF442B14);
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

ValueMetadata *type metadata accessor for ResultingActionDispatcher.PerformError()
{
  return &type metadata for ResultingActionDispatcher.PerformError;
}

uint64_t sub_1BF442B4C()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_2(v0 + 24);
  unint64_t v1 = (id *)(v0 + 64);
  if (*(unsigned char *)(v0 + 96) == 1)
  {
    if (*(void *)(v0 + 88)) {
      __swift_destroy_boxed_opaque_existential_2((uint64_t)v1);
    }
  }
  else if (!*(unsigned char *)(v0 + 96))
  {
  }
  swift_release();

  return MEMORY[0x1F4186498](v0, 112, 7);
}

uint64_t sub_1BF442BC0(uint64_t a1)
{
  return sub_1BF4407DC(a1, *(void *)(v1 + 16), v1 + 24, v1 + 64, *(void *)(v1 + 104));
}

uint64_t sub_1BF442BD4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1BF442C1C()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BF442C54(uint64_t a1)
{
  return sub_1BF4226BC(a1, *(void (**)(unsigned char *, void))(v1 + 16));
}

uint64_t sub_1BF442C5C(uint64_t a1)
{
  return sub_1BF422750(a1, *(void (**)(void *, uint64_t))(v1 + 16));
}

uint64_t sub_1BF442C64(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1BF442CC0(uint64_t a1, void *a2)
{
  v5[3] = sub_1BF3B0644();
  void v5[4] = MEMORY[0x1E4F71860];
  v5[0] = a2;
  swift_retain_n();
  id v3 = a2;
  sub_1BF465D18();
  swift_release_n();
  return __swift_destroy_boxed_opaque_existential_2((uint64_t)v5);
}

uint64_t sub_1BF442D60(uint64_t a1)
{
  return a1;
}

uint64_t sub_1BF442DB4()
{
  return sub_1BF43F31C();
}

void OUTLINED_FUNCTION_3_27()
{
  *uint64_t v0 = 0x8000000000000000;
}

uint64_t OUTLINED_FUNCTION_7_15()
{
  return sub_1BF466818();
}

void OUTLINED_FUNCTION_9_17()
{
  *uint64_t v0 = 0x8000000000000000;
}

uint64_t OUTLINED_FUNCTION_11_16()
{
  return swift_release();
}

void OUTLINED_FUNCTION_13_12()
{
  *uint64_t v0 = 0x8000000000000000;
}

uint64_t OUTLINED_FUNCTION_18_6()
{
  return sub_1BF466818();
}

uint64_t ConcreteResultingActionImplementationBox.__allocating_init(_:)()
{
  uint64_t v0 = swift_allocObject();
  ConcreteResultingActionImplementationBox.init(_:)();
  return v0;
}

void sub_1BF442EEC()
{
}

uint64_t ResultingActionImplementationBox.deinit()
{
  return v0;
}

uint64_t ResultingActionImplementationBox.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t ConcreteResultingActionImplementationBox.init(_:)()
{
  OUTLINED_FUNCTION_0_32();
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v2 + 96) - 8) + 32))(v0 + *(void *)(v1 + 112));
  return v0;
}

uint64_t sub_1BF442FBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_32();
  uint64_t v7 = *(void *)(v6 + 104);
  uint64_t v9 = *(void *)(v8 + 96);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v11 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1F4188790](AssociatedTypeWitness);
  uint64_t v13 = &v17[-v12 - 8];
  sub_1BF3AA4C4(a1, (uint64_t)v17);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA94030);
  swift_dynamicCast();
  uint64_t v14 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 24))(v13, a2, a3, v9, v7);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, AssociatedTypeWitness);
  return v14;
}

uint64_t sub_1BF44314C()
{
  OUTLINED_FUNCTION_0_32();
  return (*(uint64_t (**)(uint64_t))(*(void *)(*(void *)(v2 + 96) - 8) + 8))(v0 + *(void *)(v1 + 112));
}

uint64_t ConcreteResultingActionImplementationBox.deinit()
{
  OUTLINED_FUNCTION_0_32();
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v2 + 96) - 8) + 8))(v0 + *(void *)(v1 + 112));
  return v0;
}

uint64_t ConcreteResultingActionImplementationBox.__deallocating_deinit()
{
  ConcreteResultingActionImplementationBox.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t type metadata accessor for ResultingActionImplementationBox()
{
  return self;
}

uint64_t sub_1BF443288()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for ConcreteResultingActionImplementationBox()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t destroy for ResultingActionOutcome(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 24);
  LODWORD(v2) = -1;
  if (v1 < 0xFFFFFFFF) {
    uint64_t v2 = *(void *)(a1 + 24);
  }
  if ((int)v2 - 1 < 0)
  {
    if (v1) {
      return __swift_destroy_boxed_opaque_existential_2(a1);
    }
  }
  return a1;
}

uint64_t initializeWithCopy for ResultingActionOutcome(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 24);
  LODWORD(v4) = -1;
  if (v3 < 0xFFFFFFFF) {
    uint64_t v4 = *(void *)(a2 + 24);
  }
  if ((int)v4 - 1 < 0 && v3)
  {
    *(void *)(a1 + 24) = v3;
    (**(void (***)(uint64_t))(v3 - 8))(a1);
  }
  else
  {
    long long v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
  }
  return a1;
}

uint64_t assignWithCopy for ResultingActionOutcome(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 24);
  LODWORD(v5) = -1;
  if (v4 >= 0xFFFFFFFF) {
    LODWORD(v6) = -1;
  }
  else {
    uint64_t v6 = *(void *)(a1 + 24);
  }
  int v7 = v6 - 1;
  unint64_t v8 = *(void *)(a2 + 24);
  if (v8 < 0xFFFFFFFF) {
    uint64_t v5 = *(void *)(a2 + 24);
  }
  int v9 = v5 - 1;
  if (v7 < 0)
  {
    if (v9 < 0)
    {
      if (!v4) {
        goto LABEL_8;
      }
      if (v8)
      {
        __swift_assign_boxed_opaque_existential_0((uint64_t *)a1, (uint64_t *)a2);
        return a1;
      }
    }
    else if (!v4)
    {
      goto LABEL_13;
    }
    __swift_destroy_boxed_opaque_existential_2(a1);
    goto LABEL_13;
  }
  if ((v9 & 0x80000000) == 0)
  {
LABEL_13:
    long long v10 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v10;
    return a1;
  }
LABEL_8:
  if (!v8) {
    goto LABEL_13;
  }
  *(void *)(a1 + 24) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1, a2);
  return a1;
}

uint64_t assignWithTake for ResultingActionOutcome(uint64_t a1, _OWORD *a2)
{
  unint64_t v4 = *(void *)(a1 + 24);
  LODWORD(v5) = -1;
  if (v4 < 0xFFFFFFFF) {
    uint64_t v5 = *(void *)(a1 + 24);
  }
  if ((int)v5 - 1 < 0 && v4) {
    __swift_destroy_boxed_opaque_existential_2(a1);
  }
  long long v6 = a2[1];
  *(_OWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 16) = v6;
  return a1;
}

uint64_t getEnumTagSinglePayload for ResultingActionOutcome(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  if ((v4 + 1) >= 2) {
    return v4;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ResultingActionOutcome(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_OWORD *)uint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)uint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_1BF4435B4(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 24);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  int v2 = v1 - 1;
  if (v2 < 0) {
    int v2 = -1;
  }
  return (v2 + 1);
}

void *sub_1BF4435D8(void *result, unsigned int a2)
{
  if (a2 > 0x7FFFFFFE)
  {
    result[2] = 0;
    result[3] = 0;
    *uint64_t result = a2 - 0x7FFFFFFF;
    result[1] = 0;
  }
  else if (a2)
  {
    result[3] = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ResultingActionOutcome()
{
  return &type metadata for ResultingActionOutcome;
}

uint64_t sub_1BF443618(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BF465C08();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_1BF443684(uint64_t a1)
{
  uint64_t v2 = sub_1BF465C08();
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_1BF4436E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BF465C08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_1BF44374C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BF465C08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_1BF4437B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BF465C08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_1BF443814(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BF465C08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_1BF443878(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BF44388C);
}

uint64_t sub_1BF44388C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BF465C08();

  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t sub_1BF4438D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BF4438E8);
}

uint64_t sub_1BF4438E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BF465C08();

  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

uint64_t type metadata accessor for SendMethodFieldsProvider()
{
  uint64_t result = qword_1EBA93BD8;
  if (!qword_1EBA93BD8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1BF44397C(uint64_t a1)
{
  v2[3] = MEMORY[0x1E4FBB1A0];
  v2[0] = 0x646975736D61;
  v2[1] = 0xE600000000000000;
  __swift_mutable_project_boxed_opaque_existential_1(a1, *(void *)(a1 + 24));
  sub_1BF4658C8();
  return __swift_destroy_boxed_opaque_existential_2((uint64_t)v2);
}

uint64_t sub_1BF443A1C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1BF465C08();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_1BF443A84(uint64_t a1)
{
  return sub_1BF44397C(a1);
}

uint64_t sub_1BF443A9C()
{
  return swift_initClassMetadata2();
}

void *sub_1BF443AE0()
{
  uint64_t v1 = *(void **)(v0 + qword_1EA1486C0);
  id v2 = v1;
  return v1;
}

void sub_1BF443B10()
{
  *(void *)&v0[qword_1EA1486C0] = 0;

  sub_1BF466868();
  __break(1u);
}

void sub_1BF443B7C(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  sub_1BF443B10();
}

void sub_1BF443B98()
{
  OUTLINED_FUNCTION_0_33();
  OUTLINED_FUNCTION_0_33();
  v19.receiver = v0;
  v19.super_class = (Class)type metadata accessor for SwiftUIHostingViewController();
  objc_msgSendSuper2(&v19, sel_viewDidLoad);
  uint64_t v1 = sub_1BF443AE0();
  if (v1)
  {
    id v2 = v1;
    objc_msgSend(v0, sel_addChildViewController_, v1);
    id v3 = objc_msgSend(v2, sel_view);
    if (v3)
    {
      uint64_t v4 = v3;
      id v5 = objc_msgSend(v0, sel_view);
      objc_msgSend(v5, sel_bounds);
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;

      objc_msgSend(v4, sel_setFrame_, v7, v9, v11, v13);
      id v14 = objc_msgSend(v2, sel_view);
      if (v14)
      {
        uint64_t v15 = v14;
        objc_msgSend(v14, sel_setAutoresizingMask_, 18);

        id v16 = objc_msgSend(v0, sel_view);
        id v17 = objc_msgSend(v2, sel_view);
        if (v17)
        {
          uint64_t v18 = v17;
          objc_msgSend(v16, sel_addSubview_, v17);

          objc_msgSend(v2, sel_didMoveToParentViewController_, v0);
          return;
        }
LABEL_9:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_9;
  }
}

void sub_1BF443D6C(void *a1)
{
  id v1 = a1;
  sub_1BF443B98();
}

void sub_1BF443DB4()
{
}

void sub_1BF443DE4()
{
}

void sub_1BF443DF4()
{
}

void sub_1BF443E24(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3) {
    sub_1BF465FA8();
  }
  id v5 = a4;
  sub_1BF443DF4();
}

id sub_1BF443E4C()
{
  OUTLINED_FUNCTION_0_33();
  OUTLINED_FUNCTION_0_33();
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SwiftUIHostingViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1BF443EB8(uint64_t a1)
{
}

uint64_t type metadata accessor for SwiftUIHostingViewController()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1BF443EEC()
{
  uint64_t result = sub_1BF465F78();
  qword_1EBA92900 = result;
  return result;
}

id sub_1BF443F28()
{
  sub_1BF3A9E60(0, (unint64_t *)&qword_1EBA93460);
  id result = sub_1BF42B038();
  qword_1EBA92800 = (uint64_t)result;
  return result;
}

uint64_t SymbolFactory.__allocating_init(asPartOf:)(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t SymbolFactory.init(asPartOf:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return v1;
}

UIImage_optional __swiftcall SymbolFactory.symbol(withName:configuration:)(Swift::String withName, UIImageSymbolConfiguration configuration)
{
  object = withName._object;
  uint64_t countAndFlagsBits = withName._countAndFlagsBits;
  uint64_t v6 = sub_1BF465418();
  MEMORY[0x1F4188790](v6 - 8);
  OUTLINED_FUNCTION_1_8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
  sub_1BF465478();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BF475650;
  uint64_t v35 = type metadata accessor for SymbolFactory();
  v34[0] = v2;
  swift_retain();
  id v7 = (id)AMSLogKey();
  if (v7)
  {
    double v8 = v7;
    uint64_t v9 = sub_1BF465FA8();
    double v10 = object;
    isa = configuration.super.super.isa;
    uint64_t v12 = countAndFlagsBits;
    uint64_t v14 = v13;

    sub_1BF465408();
    sub_1BF4653F8();
    __swift_project_boxed_opaque_existential_2(v34, v35);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    v32[0] = DynamicType;
    sub_1BF4653D8();
    sub_1BF3A7DB8((uint64_t)v32);
    sub_1BF4653F8();
    uint64_t v16 = MEMORY[0x1E4FBB1A0];
    uint64_t MetatypeMetadata = MEMORY[0x1E4FBB1A0];
    v32[0] = v9;
    v32[1] = v14;
    uint64_t countAndFlagsBits = v12;
    configuration.super.super.isa = isa;
    object = v10;
    sub_1BF4653D8();
    sub_1BF3A7DB8((uint64_t)v32);
    uint64_t v17 = v16;
  }
  else
  {
    sub_1BF465408();
    sub_1BF4653F8();
    __swift_project_boxed_opaque_existential_2(v34, v35);
    uint64_t v18 = swift_getDynamicType();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    v32[0] = v18;
    sub_1BF4653D8();
    sub_1BF3A7DB8((uint64_t)v32);
    uint64_t v17 = MEMORY[0x1E4FBB1A0];
  }
  sub_1BF4653F8();
  sub_1BF465428();
  type metadata accessor for Log();
  __swift_destroy_boxed_opaque_existential_2((uint64_t)v34);
  sub_1BF4653A8();
  uint64_t v35 = v17;
  v34[0] = countAndFlagsBits;
  v34[1] = object;
  swift_bridgeObjectRetain();
  sub_1BF465438();
  sub_1BF3A7DB8((uint64_t)v34);
  sub_1BF4653A8();
  uint64_t v35 = sub_1BF3A9E60(0, &qword_1EBA928F8);
  v34[0] = configuration.super.super.isa;
  objc_super v19 = configuration.super.super.isa;
  sub_1BF465438();
  sub_1BF3A7DB8((uint64_t)v34);
  sub_1BF42B5E4();
  swift_bridgeObjectRelease();
  uint64_t v20 = sub_1BF444404();
  uint64_t v22 = sub_1BF444594(countAndFlagsBits, (uint64_t)object, v20, v21);
  uint64_t v24 = v23;
  swift_bridgeObjectRelease();
  if (qword_1EBA92810 != -1) {
    swift_once();
  }
  uint64_t v25 = (void *)qword_1EBA92800;
  id v26 = (id)qword_1EBA92800;
  uint64_t v27 = (objc_class *)sub_1BF444630(v22, v24, v19, v25);

  swift_bridgeObjectRelease();
  if (!v27)
  {
    uint64_t v29 = (void *)qword_1EBA92800;
    id v30 = (id)qword_1EBA92800;
    uint64_t v27 = (objc_class *)sub_1BF444630(countAndFlagsBits, (uint64_t)object, v19, v29);
  }
  uint64_t v31 = v27;
  result.value.super.isa = v31;
  result.is_nil = v28;
  return result;
}

uint64_t type metadata accessor for SymbolFactory()
{
  return self;
}

uint64_t sub_1BF444404()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA940E0);
  OUTLINED_FUNCTION_0_0();
  uint64_t v2 = v1;
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_1_8();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = sub_1BF465C58();
  OUTLINED_FUNCTION_0_0();
  uint64_t v9 = v8;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_1_8();
  uint64_t v13 = v12 - v11;
  sub_1BF465708();
  swift_retain();
  sub_1BF465CC8();
  swift_release();
  if (qword_1EBA92908 != -1) {
    swift_once();
  }
  sub_1BF465C48();
  sub_1BF465C38();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v6, v0);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v13, v7);
  return v15;
}

uint64_t sub_1BF444594(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a1;
  if (a4)
  {
    swift_bridgeObjectRetain();
    sub_1BF466058();
    swift_bridgeObjectRetain();
    sub_1BF466058();
    swift_bridgeObjectRelease();
    return a1;
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return v4;
}

id sub_1BF444630(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  sub_1BF3A9E60(0, (unint64_t *)&qword_1EBA94200);
  id v8 = a4;
  id v9 = a3;
  swift_bridgeObjectRetain();
  return sub_1BF4446B0(a1, a2, a4, a3);
}

id sub_1BF4446B0(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6 = (void *)sub_1BF465F78();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_imageNamed_inBundle_withConfiguration_, v6, a3, a4);

  return v7;
}

uint64_t SymbolFactory.deinit()
{
  swift_release();
  return v0;
}

uint64_t SymbolFactory.__deallocating_deinit()
{
  swift_release();

  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t sub_1BF44478C()
{
  uint64_t v1 = *(void **)(v0 + qword_1EBA939E8);
  objc_msgSend(v1, sel_lock);
  uint64_t v2 = OUTLINED_FUNCTION_0_7();
  sub_1BF3CBD0C(v2);
  uint64_t v3 = OUTLINED_FUNCTION_0_7();
  sub_1BF444808(v3, v4);
  objc_msgSend(v1, sel_unlock);
  uint64_t v5 = OUTLINED_FUNCTION_0_7();

  return sub_1BF3CBCFC(v5);
}

uint64_t sub_1BF444808(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(v2 + qword_1EBA939E0);
  uint64_t v4 = *(void *)(v2 + qword_1EBA939E0);
  *uint64_t v3 = a1;
  v3[1] = a2;
  return sub_1BF3CBCFC(v4);
}

uint64_t sub_1BF444828()
{
  uint64_t v1 = *(void **)(v0 + qword_1EBA939E8);
  objc_msgSend(v1, sel_lock);
  uint64_t v2 = *(void *)(v0 + qword_1EBA939E0);
  sub_1BF3CBD0C(v2);
  objc_msgSend(v1, sel_unlock);
  return v2;
}

uint64_t sub_1BF44489C(uint64_t a1, char a2)
{
  LOBYTE(v7) = a2 & 1;
  uint64_t result = (uint64_t)objc_msgSend(v2, sel_isCancelled, a1, v7);
  if ((result & 1) == 0)
  {
    uint64_t result = sub_1BF444828();
    if (result)
    {
      uint64_t v4 = (void (*)(uint64_t *))result;
      sub_1BF44478C();
      v4(&v6);
      uint64_t v5 = OUTLINED_FUNCTION_0_7();
      return sub_1BF3CBCFC(v5);
    }
  }
  return result;
}

void sub_1BF44493C()
{
  sub_1BF3D2FD8();
  uint64_t v1 = *(void *)(v0 + qword_1EA148748);
  uint64_t v2 = *(void *)(v0 + qword_1EA148748 + 8);
  swift_bridgeObjectRetain();
  id v3 = sub_1BF444A2C(v1, v2);
  if (v3)
  {
    id v7 = v3;
    sub_1BF44489C((uint64_t)v3, 0);
    uint64_t v4 = v7;
  }
  else
  {
    sub_1BF3C69E4();
    uint64_t v5 = swift_allocError();
    *(_OWORD *)uint64_t v6 = xmmword_1BF4760D0;
    *(unsigned char *)(v6 + 16) = 3;
    sub_1BF44489C(v5, 1);
    uint64_t v4 = (void *)v5;
  }
}

id sub_1BF444A2C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = (void *)sub_1BF465F78();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = 0;
  }
  id v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel__systemImageNamed_, v2);

  return v3;
}

void sub_1BF444A9C(void *a1)
{
  id v1 = a1;
  sub_1BF44493C();
}

void sub_1BF444AE4()
{
}

void sub_1BF444B14()
{
}

uint64_t sub_1BF444B24()
{
  return OUTLINED_FUNCTION_0_34();
}

uint64_t sub_1BF444B34()
{
  return OUTLINED_FUNCTION_0_34();
}

uint64_t type metadata accessor for SystemImageFetchOperation()
{
  uint64_t result = qword_1EA148750;
  if (!qword_1EA148750) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1BF444B8C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1BF444BD0()
{
  return type metadata accessor for SystemImageFetchOperation();
}

uint64_t OUTLINED_FUNCTION_0_34()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BF444BE0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1BF444C28()
{
  sub_1BF444CB8();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_1BF444C68()
{
  sub_1BF444C28();

  return MEMORY[0x1F4186488](v0, 32, 7);
}

uint64_t type metadata accessor for TieredAssetCache()
{
  return __swift_instantiateGenericMetadata();
}

id sub_1BF444CB8()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BF465418();
  MEMORY[0x1F4188790](v3 - 8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
  sub_1BF465478();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BF474840;
  uint64_t v16 = v2;
  v15[0] = v0;
  swift_retain();
  id v4 = (id)AMSLogKey();
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = sub_1BF465FA8();
    uint64_t v8 = v7;

    sub_1BF465408();
    sub_1BF4653F8();
    __swift_project_boxed_opaque_existential_2(v15, v16);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    v13[0] = DynamicType;
    sub_1BF4653D8();
    sub_1BF3A7DB8((uint64_t)v13);
    sub_1BF4653F8();
    uint64_t MetatypeMetadata = MEMORY[0x1E4FBB1A0];
    v13[0] = v6;
    v13[1] = v8;
    sub_1BF4653D8();
  }
  else
  {
    sub_1BF465408();
    sub_1BF4653F8();
    __swift_project_boxed_opaque_existential_2(v15, v16);
    uint64_t v10 = swift_getDynamicType();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    v13[0] = v10;
    sub_1BF4653D8();
  }
  sub_1BF3A7DB8((uint64_t)v13);
  sub_1BF4653F8();
  sub_1BF465428();
  type metadata accessor for Log();
  __swift_destroy_boxed_opaque_existential_2((uint64_t)v15);
  sub_1BF4653A8();
  sub_1BF465458();
  sub_1BF42B61C();
  swift_bridgeObjectRelease();
  uint64_t v11 = (void *)v0[2];
  objc_msgSend((id)v1[2], sel_lock);
  sub_1BF4453AC();
  return objc_msgSend(v11, sel_unlock);
}

uint64_t sub_1BF444FB4()
{
  sub_1BF445904();
  type metadata accessor for TieredAssetCacheArena.Segment();
  sub_1BF4661F8();
  sub_1BF465E28();
  return v1;
}

uint64_t sub_1BF445078()
{
  uint64_t v0 = sub_1BF465188();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965D8);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1BF474AE0;
  sub_1BF465178();
  v6[1] = v4;
  sub_1BF3B070C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA964D8);
  sub_1BF3AC870();
  sub_1BF466608();
  sub_1BF466468();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_1BF445210()
{
  return swift_endAccess();
}

uint64_t sub_1BF4452B8@<X0>(uint64_t *a1@<X8>)
{
  swift_beginAccess();
  type metadata accessor for TieredAssetCacheArena.Segment();
  sub_1BF4661F8();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  uint64_t result = sub_1BF466208();
  *a1 = result;
  return result;
}

uint64_t sub_1BF4453AC()
{
  return swift_endAccess();
}

uint64_t sub_1BF4454B4()
{
  uint64_t v1 = *v0;
  uint64_t v2 = sub_1BF465418();
  MEMORY[0x1F4188790](v2 - 8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
  sub_1BF465478();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BF474840;
  uint64_t v18 = v1;
  v17[0] = v0;
  swift_retain();
  id v3 = (id)AMSLogKey();
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_1BF465FA8();
    uint64_t v7 = v6;

    sub_1BF465408();
    sub_1BF4653F8();
    __swift_project_boxed_opaque_existential_2(v17, v18);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    v15[0] = DynamicType;
    sub_1BF4653D8();
    sub_1BF3A7DB8((uint64_t)v15);
    sub_1BF4653F8();
    uint64_t MetatypeMetadata = MEMORY[0x1E4FBB1A0];
    v15[0] = v5;
    v15[1] = v7;
    sub_1BF4653D8();
  }
  else
  {
    sub_1BF465408();
    sub_1BF4653F8();
    __swift_project_boxed_opaque_existential_2(v17, v18);
    uint64_t v9 = swift_getDynamicType();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    v15[0] = v9;
    sub_1BF4653D8();
  }
  sub_1BF3A7DB8((uint64_t)v15);
  sub_1BF4653F8();
  sub_1BF465428();
  type metadata accessor for Log();
  __swift_destroy_boxed_opaque_existential_2((uint64_t)v17);
  sub_1BF4653A8();
  sub_1BF465458();
  sub_1BF42B61C();
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_1BF444FB4();
  uint64_t v11 = type metadata accessor for TieredAssetCacheArena.Segment();
  v17[0] = sub_1BF466148();
  if (v17[0] != MEMORY[0x1C18A9980](v10, v11))
  {
    do
    {
      char v13 = sub_1BF466198();
      sub_1BF466178();
      if (v13) {
        swift_retain();
      }
      else {
        sub_1BF4667B8();
      }
      swift_bridgeObjectRetain();
      MEMORY[0x1C18A9990](v17, v10, v11);
      swift_bridgeObjectRelease();
      sub_1BF445078();
      swift_release();
      uint64_t v14 = v17[0];
    }
    while (v14 != MEMORY[0x1C18A9980](v10, v11));
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BF445860()
{
  swift_retain();
  sub_1BF4454B4();

  return swift_release();
}

uint64_t type metadata accessor for TieredAssetCacheArena()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for TieredAssetCacheArena.Segment()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1BF4458CC()
{
  return sub_1BF445210();
}

uint64_t sub_1BF4458E8@<X0>(uint64_t *a1@<X8>)
{
  return sub_1BF4452B8(a1);
}

unint64_t sub_1BF445904()
{
  unint64_t result = qword_1EBA96500;
  if (!qword_1EBA96500)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBA96500);
  }
  return result;
}

BOOL sub_1BF445944(void *a1)
{
  return *a1 == v1;
}

void sub_1BF445958(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v25 = MEMORY[0x1E4FBC860];
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1BF466648();
    sub_1BF445E1C();
    sub_1BF445E5C();
    sub_1BF466268();
    uint64_t v1 = v20;
    uint64_t v18 = v21;
    uint64_t v2 = v22;
    int64_t v3 = v23;
    unint64_t v4 = v24;
  }
  else
  {
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v18 = a1 + 56;
    uint64_t v2 = ~v5;
    uint64_t v6 = -v5;
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v4 = v7 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    int64_t v3 = 0;
  }
  int64_t v8 = (unint64_t)(v2 + 64) >> 6;
  while (v1 < 0)
  {
    if (!sub_1BF4666B8()) {
      goto LABEL_39;
    }
    sub_1BF445E1C();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v12 = v19;
    swift_unknownObjectRelease();
    int64_t v11 = v3;
    uint64_t v9 = v4;
    if (!v19) {
      goto LABEL_39;
    }
LABEL_26:
    self;
    uint64_t v15 = (void *)swift_dynamicCastObjCClass();
    if (!v15)
    {

      goto LABEL_32;
    }
    id v16 = objc_msgSend(v15, sel_keyWindow);

    int64_t v3 = v11;
    unint64_t v4 = v9;
    if (v16)
    {
      MEMORY[0x1C18A98D0]();
      if (*(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_1BF466188();
      }
      sub_1BF4661A8();
      sub_1BF466168();
LABEL_32:
      int64_t v3 = v11;
      unint64_t v4 = v9;
    }
  }
  if (v4)
  {
    uint64_t v9 = (v4 - 1) & v4;
    unint64_t v10 = __clz(__rbit64(v4)) | (v3 << 6);
    int64_t v11 = v3;
LABEL_25:
    id v12 = *(id *)(*(void *)(v1 + 48) + 8 * v10);
    if (!v12) {
      goto LABEL_39;
    }
    goto LABEL_26;
  }
  int64_t v11 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v11 >= v8) {
      goto LABEL_39;
    }
    unint64_t v13 = *(void *)(v18 + 8 * v11);
    if (!v13)
    {
      int64_t v14 = v3 + 2;
      if (v3 + 2 >= v8) {
        goto LABEL_39;
      }
      unint64_t v13 = *(void *)(v18 + 8 * v14);
      if (v13) {
        goto LABEL_23;
      }
      int64_t v14 = v3 + 3;
      if (v3 + 3 >= v8) {
        goto LABEL_39;
      }
      unint64_t v13 = *(void *)(v18 + 8 * v14);
      if (v13) {
        goto LABEL_23;
      }
      int64_t v14 = v3 + 4;
      if (v3 + 4 >= v8) {
        goto LABEL_39;
      }
      unint64_t v13 = *(void *)(v18 + 8 * v14);
      if (v13)
      {
LABEL_23:
        int64_t v11 = v14;
      }
      else
      {
        int64_t v11 = v3 + 5;
        if (v3 + 5 >= v8) {
          goto LABEL_39;
        }
        unint64_t v13 = *(void *)(v18 + 8 * v11);
        if (!v13)
        {
          int64_t v17 = v3 + 6;
          while (v17 < v8)
          {
            unint64_t v13 = *(void *)(v18 + 8 * v17++);
            if (v13)
            {
              int64_t v11 = v17 - 1;
              goto LABEL_24;
            }
          }
LABEL_39:
          sub_1BF3A8B4C();
          return;
        }
      }
    }
LABEL_24:
    uint64_t v9 = (v13 - 1) & v13;
    unint64_t v10 = __clz(__rbit64(v13)) + (v11 << 6);
    goto LABEL_25;
  }
  __break(1u);
}

void *static UIApplication.isCompact()()
{
  unint64_t result = (void *)static UIApplication.window.getter();
  if (result)
  {
    uint64_t v1 = result;
    objc_msgSend(result, sel_frame);
    double Width = CGRectGetWidth(v3);

    return (void *)(Width < 375.0);
  }
  return result;
}

void *UIApplication.regularWidth.unsafeMutableAddressor()
{
  return &static UIApplication.regularWidth;
}

double static UIApplication.regularWidth.getter()
{
  return 375.0;
}

uint64_t static UIApplication.window.getter()
{
  id v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedApplication);
  id v1 = objc_msgSend(v0, sel_connectedScenes);

  sub_1BF445E1C();
  sub_1BF445E5C();
  uint64_t v2 = sub_1BF466248();

  sub_1BF445958(v2);
  unint64_t v4 = v3;
  swift_bridgeObjectRelease();
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1BF466878();
    swift_bridgeObjectRelease();
    if (!v5) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v5) {
      goto LABEL_6;
    }
  }
  sub_1BF3A7D90(0, (v4 & 0xC000000000000001) == 0, v4);
  if ((v4 & 0xC000000000000001) != 0) {
    id v6 = (id)MEMORY[0x1C18A9F80](0, v4);
  }
  else {
    id v6 = *(id *)(v4 + 32);
  }
  uint64_t v5 = (uint64_t)v6;
LABEL_6:
  swift_bridgeObjectRelease();
  return v5;
}

unint64_t sub_1BF445E1C()
{
  unint64_t result = qword_1EBA94AC0;
  if (!qword_1EBA94AC0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBA94AC0);
  }
  return result;
}

unint64_t sub_1BF445E5C()
{
  unint64_t result = qword_1EBA94AC8;
  if (!qword_1EBA94AC8)
  {
    sub_1BF445E1C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA94AC8);
  }
  return result;
}

void *static UIApplication.hasNotch()()
{
  unint64_t result = (void *)static UIApplication.window.getter();
  if (result)
  {
    id v1 = result;
    objc_msgSend(result, sel_safeAreaInsets);
    double v3 = v2;

    return (void *)(v3 > 0.0);
  }
  return result;
}

void sub_1BF445EF8(double a1)
{
  id v3 = objc_msgSend(v1, sel_layer);
  objc_msgSend(v3, sel_setCornerRadius_, a1);

  id v4 = objc_msgSend(v1, sel_layer);
  objc_msgSend(v4, sel_setMasksToBounds_, 1);
}

void sub_1BF445F9C(void (*a1)(), uint64_t a2, double a3, double a4)
{
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(double *)(v9 + 24) = a3;
  uint64_t v15 = sub_1BF446208;
  uint64_t v16 = v9;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 1107296256;
  unint64_t v13 = sub_1BF3AC814;
  int64_t v14 = &block_descriptor_16;
  unint64_t v10 = _Block_copy(&v11);
  swift_release();
  if (a1)
  {
    uint64_t v15 = a1;
    uint64_t v16 = a2;
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 1107296256;
    unint64_t v13 = sub_1BF44622C;
    int64_t v14 = &block_descriptor_6_0;
    a1 = (void (*)())_Block_copy(&v11);
    swift_retain();
    swift_release();
  }
  objc_msgSend(self, sel_animateWithDuration_delay_options_animations_completion_, 134, v10, a1, a4, 0.0);
  _Block_release(a1);
  _Block_release(v10);
}

uint64_t sub_1BF44612C()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1BF446164(uint64_t a1, double a2)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess();
  id v4 = (void *)MEMORY[0x1C18AAE10](v3);
  if (v4)
  {
    uint64_t v5 = v4;
    objc_msgSend(v4, sel_setAlpha_, a2);
  }
}

uint64_t sub_1BF4461D0()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1BF446208()
{
  sub_1BF446164(*(void *)(v0 + 16), *(double *)(v0 + 24));
}

uint64_t block_copy_helper_16(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_16()
{
  return swift_release();
}

uint64_t sub_1BF44622C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

id sub_1BF446288()
{
  id v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_defaultSessionConfiguration);
  objc_msgSend(v0, sel_setHTTPShouldUsePipelining_, 1);
  objc_msgSend(v0, sel_setTimeoutIntervalForRequest_, 30.0);
  return v0;
}

void sub_1BF4462EC()
{
  sub_1BF446350();
  id v0 = sub_1BF446288();
  id v1 = objc_msgSend(self, sel_sessionWithConfiguration_, v0);

  qword_1EBA987F8 = (uint64_t)v1;
}

unint64_t sub_1BF446350()
{
  unint64_t result = qword_1EBA93458;
  if (!qword_1EBA93458)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBA93458);
  }
  return result;
}

uint64_t Video.__allocating_init(id:videoUrl:preview:allowsAutoPlay:looping:canPlayFullScreen:playbackControls:autoPlayPlaybackControls:templateMediaEvent:templateClickEvent:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6, char a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12)
{
  uint64_t v17 = swift_allocObject();
  Video.init(id:videoUrl:preview:allowsAutoPlay:looping:canPlayFullScreen:playbackControls:autoPlayPlaybackControls:templateMediaEvent:templateClickEvent:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10 & 1, a11, a12);
  return v17;
}

uint64_t Video.init(id:videoUrl:preview:allowsAutoPlay:looping:canPlayFullScreen:playbackControls:autoPlayPlaybackControls:templateMediaEvent:templateClickEvent:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6, char a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12)
{
  sub_1BF464EC8();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1F4188790](v19);
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  uint64_t v20 = v12 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_videoUrl;
  uint64_t v21 = sub_1BF464E58();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = v20;
  uint64_t v24 = a3;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v23, a3, v21);
  *(void *)(v12 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_preview) = a4;
  *(unsigned char *)(v12 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_allowsAutoPlay) = a5;
  *(unsigned char *)(v12 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_looping) = a6;
  *(unsigned char *)(v12 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_canPlayFullScreen) = a7;
  *(void *)(v12 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_playbackControls) = a8;
  if (a10) {
    a9 = a8;
  }
  *(void *)(v12 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_autoPlayPlaybackControls) = a9;
  sub_1BF446688(a11, v12 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_templateMediaEvent);
  sub_1BF446688(a12, v12 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_templateClickEvent);
  swift_retain();
  sub_1BF464EB8();
  uint64_t v26 = sub_1BF464EA8();
  uint64_t v28 = v27;
  swift_release();
  sub_1BF3C6A30(a12, (uint64_t *)&unk_1EA1488E0);
  sub_1BF3C6A30(a11, (uint64_t *)&unk_1EA1488E0);
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v24, v21);
  OUTLINED_FUNCTION_2_5();
  v29();
  id v30 = (uint64_t *)(v12 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_playbackId);
  *id v30 = v26;
  v30[1] = v28;
  return v12;
}

uint64_t sub_1BF446688(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA1488E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t Video.__allocating_init(deserializing:using:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  Video.init(deserializing:using:)(a1, a2);
  return v4;
}

uint64_t Video.init(deserializing:using:)(uint64_t a1, unint64_t a2)
{
  unint64_t v103 = a2;
  uint64_t v112 = a1;
  sub_1BF464EC8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v97 = v3;
  uint64_t v98 = v2;
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_8_5();
  uint64_t v96 = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA1488E0);
  MEMORY[0x1F4188790](v5 - 8);
  OUTLINED_FUNCTION_8_5();
  uint64_t v95 = v6;
  sub_1BF465508();
  OUTLINED_FUNCTION_0_0();
  uint64_t v109 = v8;
  uint64_t v110 = v7;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_36_3();
  uint64_t v101 = v9;
  MEMORY[0x1F4188790](v10);
  uint64_t v92 = (char *)v91 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94B20);
  MEMORY[0x1F4188790](v12 - 8);
  int64_t v14 = (char *)v91 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1BF465388();
  OUTLINED_FUNCTION_0_0();
  uint64_t v17 = v16;
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_36_3();
  uint64_t v94 = v19;
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_10_15();
  OUTLINED_FUNCTION_6_13();
  MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_10_15();
  OUTLINED_FUNCTION_6_13();
  MEMORY[0x1F4188790](v22);
  OUTLINED_FUNCTION_10_15();
  OUTLINED_FUNCTION_6_13();
  MEMORY[0x1F4188790](v23);
  OUTLINED_FUNCTION_10_15();
  OUTLINED_FUNCTION_6_13();
  MEMORY[0x1F4188790](v24);
  uint64_t v26 = (char *)v91 - v25;
  uint64_t v27 = sub_1BF464E58();
  OUTLINED_FUNCTION_0_0();
  uint64_t v107 = v28;
  MEMORY[0x1F4188790](v29);
  OUTLINED_FUNCTION_8_5();
  uint64_t v106 = v30;
  uint64_t v108 = type metadata accessor for Log();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
  sub_1BF465478();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BF474A50;
  sub_1BF4653A8();
  v111[0] = 0;
  v111[1] = 0xE000000000000000;
  sub_1BF466768();
  sub_1BF466058();
  uint64_t v31 = v112;
  sub_1BF466808();
  v111[3] = MEMORY[0x1E4FBB1A0];
  uint64_t v32 = v31;
  sub_1BF465438();
  sub_1BF3C6A30((uint64_t)v111, &qword_1EBA96600);
  sub_1BF42B5E4();
  swift_bridgeObjectRelease();
  sub_1BF465398();
  sub_1BF465308();
  uint64_t v35 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
  uint64_t v33 = v17 + 8;
  uint64_t v34 = v35;
  uint64_t v36 = v26;
  uint64_t v37 = v15;
  v35((uint64_t)v36, v15);
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v27) == 1)
  {
    sub_1BF3C6A30((uint64_t)v14, &qword_1EBA94B20);
    uint64_t v38 = sub_1BF465E58();
    sub_1BF3EC904();
    swift_allocError();
    uint64_t v39 = v104;
    OUTLINED_FUNCTION_1_34();
    *uint64_t v40 = 0x6C72556F65646976;
    v40[1] = 0xE800000000000000;
    v40[2] = v41;
    (*(void (**)(void))(*(void *)(v38 - 8) + 104))();
    swift_willThrow();
    OUTLINED_FUNCTION_2_5();
    v42();
    v34(v32, v37);
    type metadata accessor for Video();
    OUTLINED_FUNCTION_1_34();
    swift_deallocPartialClassInstance();
  }
  else
  {
    id v105 = (void (*)(uint64_t))v34;
    uint64_t v108 = v33;
    uint64_t v44 = v106;
    uint64_t v43 = v107;
    (*(void (**)(uint64_t, char *, uint64_t))(v107 + 32))(v106, v14, v27);
    uint64_t v45 = v104;
    uint64_t v46 = *(void (**)(uint64_t, uint64_t, uint64_t))(v43 + 16);
    v91[1] = v27;
    v46(v104 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_videoUrl, v44, v27);
    type metadata accessor for Artwork();
    sub_1BF465398();
    uint64_t v47 = v109 + 16;
    unint64_t v48 = *(void (**)(char *, unint64_t, uint64_t))(v109 + 16);
    unint64_t v49 = v103;
    v48(v92, v103, v110);
    char v50 = v93;
    Artwork.__allocating_init(deserializing:using:)();
    uint64_t v100 = v47;
    uint64_t v102 = (void (*)(uint64_t, unint64_t))v48;
    if (v50)
    {

      uint64_t v51 = 0;
    }
    uint64_t v93 = 0;
    *(void *)(v45 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_preview) = v51;
    uint64_t v52 = v91[3];
    sub_1BF465398();
    char v53 = sub_1BF465318();
    uint64_t v54 = v105;
    ((void (*)(uint64_t, uint64_t))v105)(v52, v37);
    *(unsigned char *)(v45 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_allowsAutoPlay) = (v53 == 2) | v53 & 1;
    sub_1BF465398();
    char v55 = sub_1BF465318();
    uint64_t v56 = OUTLINED_FUNCTION_5_20();
    v54(v56);
    *(unsigned char *)(v45 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_looping) = (v55 == 2) | v55 & 1;
    sub_1BF465398();
    char v57 = sub_1BF465318();
    uint64_t v58 = OUTLINED_FUNCTION_5_20();
    v54(v58);
    *(unsigned char *)(v45 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_canPlayFullScreen) = (v57 == 2) | v57 & 1;
    uint64_t v59 = v94;
    OUTLINED_FUNCTION_8_20();
    char v60 = sub_1BF465348();
    uint64_t v61 = OUTLINED_FUNCTION_5_20();
    v54(v61);
    uint64_t v99 = v37;
    if (v60)
    {
      uint64_t v62 = v110;
      unint64_t v63 = v49;
      uint64_t v64 = 15;
    }
    else
    {
      OUTLINED_FUNCTION_8_20();
      uint64_t v65 = v101;
      unint64_t v63 = v49;
      uint64_t v62 = v110;
      v102(v101, v49);
      uint64_t v64 = VideoControls.init(deserializing:using:)(v59, v65);
    }
    uint64_t v66 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_playbackControls;
    *(void *)(v45 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_playbackControls) = v64;
    OUTLINED_FUNCTION_13_13();
    char v67 = sub_1BF465348();
    ((void (*)(uint64_t, uint64_t))v105)(v59, v99);
    if (v67)
    {
      uint64_t v68 = *(void *)(v45 + v66);
      uint64_t v69 = v101;
    }
    else
    {
      OUTLINED_FUNCTION_13_13();
      uint64_t v69 = v101;
      ((void (*)(uint64_t, unint64_t, uint64_t))v102)(v101, v63, v62);
      uint64_t v68 = VideoControls.init(deserializing:using:)(v59, v69);
    }
    *(void *)(v45 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_autoPlayPlaybackControls) = v68;
    sub_1BF465538();
    unint64_t v103 = 0xD000000000000012;
    sub_1BF465398();
    uint64_t v70 = v110;
    ((void (*)(uint64_t, unint64_t, uint64_t))v102)(v69, v63, v110);
    unint64_t v71 = v63;
    uint64_t v72 = v59;
    uint64_t v73 = v95;
    OUTLINED_FUNCTION_12_13();
    sub_1BF4657A8();
    sub_1BF447230(v73, v45 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_templateMediaEvent);
    sub_1BF465398();
    ((void (*)(uint64_t, unint64_t, uint64_t))v102)(v69, v71, v70);
    OUTLINED_FUNCTION_12_13();
    sub_1BF4657A8();
    sub_1BF447230(v73, v45 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_templateClickEvent);
    sub_1BF464EB8();
    uint64_t v74 = sub_1BF464EA8();
    uint64_t v76 = v75;
    OUTLINED_FUNCTION_2_5();
    v77();
    uint64_t v78 = (uint64_t *)(v45 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_playbackId);
    uint64_t v79 = v45;
    *uint64_t v78 = v74;
    v78[1] = v76;
    uint64_t v80 = v112;
    sub_1BF465398();
    uint64_t v81 = sub_1BF465358();
    uint64_t v83 = v82;
    OUTLINED_FUNCTION_2_5();
    v84();
    uint64_t v85 = v80;
    uint64_t v86 = v99;
    uint64_t v87 = (void (*)(uint64_t, uint64_t))v105;
    ((void (*)(uint64_t, uint64_t))v105)(v85, v99);
    uint64_t v88 = v86;
    uint64_t v39 = v79;
    v87(v72, v88);
    OUTLINED_FUNCTION_2_5();
    v89();
    *(void *)(v79 + 16) = v81;
    *(void *)(v79 + 24) = v83;
  }
  return v39;
}

uint64_t type metadata accessor for Video()
{
  uint64_t result = qword_1EA148760;
  if (!qword_1EA148760) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1BF447230(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA1488E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t Video.id.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Video.videoUrl.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_videoUrl;
  sub_1BF464E58();
  OUTLINED_FUNCTION_0_3();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);

  return v6(a1, v3, v4);
}

uint64_t Video.preview.getter()
{
  return swift_retain();
}

uint64_t Video.allowsAutoPlay.getter()
{
  return OUTLINED_FUNCTION_11_17(OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_allowsAutoPlay);
}

uint64_t Video.looping.getter()
{
  return OUTLINED_FUNCTION_11_17(OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_looping);
}

uint64_t Video.canPlayFullScreen.getter()
{
  return OUTLINED_FUNCTION_11_17(OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_canPlayFullScreen);
}

uint64_t Video.playbackControls.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_playbackControls);
}

uint64_t Video.autoPlayPlaybackControls.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_autoPlayPlaybackControls);
}

uint64_t Video.playbackId.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_playbackId);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Video.templateMediaEvent.getter@<X0>(uint64_t a1@<X8>)
{
  return OUTLINED_FUNCTION_6_20(a1, OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_templateMediaEvent);
}

uint64_t Video.templateClickEvent.getter@<X0>(uint64_t a1@<X8>)
{
  return OUTLINED_FUNCTION_6_20(a1, OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_templateClickEvent);
}

BOOL static Video.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((MEMORY[0x1C18A85B0](a1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_videoUrl, a2 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_videoUrl) & 1) == 0)return 0; {
  uint64_t v4 = *(void *)(a1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_preview);
  }
  uint64_t v5 = *(void *)(a2 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_preview);
  BOOL result = (v4 | v5) == 0;
  if (v4)
  {
    if (v5)
    {
      type metadata accessor for Artwork();
      swift_retain();
      uint64_t v7 = swift_retain();
      char v8 = static Artwork.== infix(_:_:)(v7, v5);
      swift_release();
      swift_release();
      return v8 & 1;
    }
  }
  return result;
}

uint64_t Video.deinit()
{
  swift_bridgeObjectRelease();
  sub_1BF464E58();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_5();
  v1();
  swift_release();
  swift_bridgeObjectRelease();
  sub_1BF3C6A30(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_templateMediaEvent, (uint64_t *)&unk_1EA1488E0);
  sub_1BF3C6A30(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_templateClickEvent, (uint64_t *)&unk_1EA1488E0);
  return v0;
}

uint64_t Video.__deallocating_deinit()
{
  Video.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1BF44759C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = Video.__allocating_init(deserializing:using:)(a1, a2);
  if (!v3) {
    *a3 = result;
  }
  return result;
}

BOOL sub_1BF4475C8(uint64_t *a1, uint64_t *a2)
{
  return static Video.== infix(_:_:)(*a1, *a2);
}

uint64_t sub_1BF4475EC()
{
  return type metadata accessor for Video();
}

void sub_1BF4475F4()
{
  sub_1BF464E58();
  if (v0 <= 0x3F)
  {
    sub_1BF4476F8();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_1BF4476F8()
{
  if (!qword_1EA148A50)
  {
    sub_1BF465538();
    unint64_t v0 = sub_1BF466588();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA148A50);
    }
  }
}

uint64_t OUTLINED_FUNCTION_5_20()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_20@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return sub_1BF446688(v2 + a2, a1);
}

uint64_t OUTLINED_FUNCTION_8_20()
{
  return sub_1BF465398();
}

uint64_t OUTLINED_FUNCTION_11_17@<X0>(uint64_t a1@<X8>)
{
  return *(unsigned __int8 *)(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_12_13()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_13_13()
{
  return sub_1BF465398();
}

uint64_t VideoFillMode.contentMode.getter(char a1)
{
  if (a1) {
    return 2;
  }
  else {
    return 1;
  }
}

id VideoFillMode.videoGravity.getter(char a1)
{
  uint64_t v1 = (id *)MEMORY[0x1E4F15AF8];
  if ((a1 & 1) == 0) {
    uint64_t v1 = (id *)MEMORY[0x1E4F15AF0];
  }
  return *v1;
}

BOOL static VideoFillMode.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t VideoFillMode.hash(into:)()
{
  return sub_1BF466A68();
}

uint64_t VideoFillMode.hashValue.getter()
{
  return sub_1BF466A98();
}

BOOL sub_1BF44789C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return static VideoFillMode.__derived_enum_equals(_:_:)(*a1, *a2);
}

uint64_t sub_1BF4478A8()
{
  return VideoFillMode.hashValue.getter();
}

uint64_t sub_1BF4478B0()
{
  return VideoFillMode.hash(into:)();
}

uint64_t VideoConfiguration.fillMode.getter()
{
  return *v0;
}

uint64_t VideoConfiguration.fillMode.setter(uint64_t result)
{
  unsigned char *v1 = result & 1;
  return result;
}

uint64_t (*VideoConfiguration.fillMode.modify())(void)
{
  return CGSizeMake;
}

uint64_t VideoConfiguration.aspectRatio.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for VideoConfiguration() + 20);

  return sub_1BF447978(v3, a1);
}

uint64_t type metadata accessor for VideoConfiguration()
{
  uint64_t result = qword_1EA148790;
  if (!qword_1EA148790) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1BF447978(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA148770);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t VideoConfiguration.aspectRatio.setter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_1_35() + 20);

  return sub_1BF447A1C(v0, v2);
}

uint64_t sub_1BF447A1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA148770);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*VideoConfiguration.aspectRatio.modify())(void)
{
  return CGSizeMake;
}

uint64_t VideoConfiguration.playbackControls.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for VideoConfiguration() + 24));
}

uint64_t VideoConfiguration.playbackControls.setter()
{
  uint64_t result = OUTLINED_FUNCTION_1_35();
  *(void *)(v1 + *(int *)(result + 24)) = v0;
  return result;
}

uint64_t (*VideoConfiguration.playbackControls.modify())(void)
{
  return CGSizeMake;
}

uint64_t VideoConfiguration.autoPlayPlaybackControls.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for VideoConfiguration() + 28));
}

uint64_t VideoConfiguration.autoPlayPlaybackControls.setter()
{
  uint64_t result = OUTLINED_FUNCTION_1_35();
  *(void *)(v1 + *(int *)(result + 28)) = v0;
  return result;
}

uint64_t (*VideoConfiguration.autoPlayPlaybackControls.modify())(void)
{
  return CGSizeMake;
}

uint64_t VideoConfiguration.canPlayFullScreen.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for VideoConfiguration() + 32));
}

uint64_t VideoConfiguration.canPlayFullScreen.setter()
{
  uint64_t result = OUTLINED_FUNCTION_1_35();
  *(unsigned char *)(v1 + *(int *)(result + 32)) = v0;
  return result;
}

uint64_t (*VideoConfiguration.canPlayFullScreen.modify())(void)
{
  return CGSizeMake;
}

uint64_t VideoConfiguration.allowsAutoPlay.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for VideoConfiguration() + 36));
}

uint64_t VideoConfiguration.allowsAutoPlay.setter()
{
  uint64_t result = OUTLINED_FUNCTION_1_35();
  *(unsigned char *)(v1 + *(int *)(result + 36)) = v0;
  return result;
}

uint64_t (*VideoConfiguration.allowsAutoPlay.modify())(void)
{
  return CGSizeMake;
}

uint64_t VideoConfiguration.looping.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for VideoConfiguration() + 40));
}

uint64_t VideoConfiguration.looping.setter()
{
  uint64_t result = OUTLINED_FUNCTION_1_35();
  *(unsigned char *)(v1 + *(int *)(result + 40)) = v0;
  return result;
}

uint64_t (*VideoConfiguration.looping.modify())(void)
{
  return CGSizeMake;
}

uint64_t VideoConfiguration.roundedCorners.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for VideoConfiguration() + 44));
}

uint64_t VideoConfiguration.roundedCorners.setter()
{
  uint64_t result = OUTLINED_FUNCTION_1_35();
  *(unsigned char *)(v1 + *(int *)(result + 44)) = v0;
  return result;
}

uint64_t (*VideoConfiguration.roundedCorners.modify())(void)
{
  return CGSizeMake;
}

uint64_t VideoConfiguration.deviceCornerRadiusFactor.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for VideoConfiguration() + 48));
}

uint64_t VideoConfiguration.deviceCornerRadiusFactor.setter(uint64_t a1, char a2)
{
  uint64_t result = type metadata accessor for VideoConfiguration();
  uint64_t v6 = v2 + *(int *)(result + 48);
  *(void *)uint64_t v6 = a1;
  *(unsigned char *)(v6 + 8) = a2 & 1;
  return result;
}

uint64_t (*VideoConfiguration.deviceCornerRadiusFactor.modify())(void)
{
  return CGSizeMake;
}

uint64_t VideoConfiguration.init(fillMode:aspectRatio:playbackControls:autoPlayPlaybackControls:canPlayFullScreen:allowsAutoPlay:looping:roundedCorners:deviceCornerRadiusFactor:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, char a6@<W5>, char a7@<W6>, char a8@<W7>, unsigned char *a9@<X8>, uint64_t a10, char a11)
{
  char v16 = a1 & 1;
  uint64_t v17 = (int *)type metadata accessor for VideoConfiguration();
  uint64_t v18 = (uint64_t)&a9[v17[5]];
  uint64_t v19 = sub_1BF465018();
  __swift_storeEnumTagSinglePayload(v18, 1, 1, v19);
  uint64_t v20 = &a9[v17[12]];
  *(void *)uint64_t v20 = 0;
  v20[8] = 1;
  *a9 = v16;
  uint64_t result = sub_1BF447A1C(a2, v18);
  *(void *)&a9[v17[6]] = a3;
  *(void *)&a9[v17[7]] = a4;
  a9[v17[8]] = a5;
  a9[v17[9]] = a6;
  a9[v17[10]] = a7;
  a9[v17[11]] = a8;
  *(void *)uint64_t v20 = a10;
  v20[8] = a11 & 1;
  return result;
}

uint64_t static VideoConfiguration.defaultConfiguration.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA148770);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1BF465018();
  __swift_storeEnumTagSinglePayload((uint64_t)v4, 1, 1, v5);
  uint64_t v6 = (int *)type metadata accessor for VideoConfiguration();
  uint64_t v7 = (uint64_t)&a1[v6[5]];
  __swift_storeEnumTagSinglePayload(v7, 1, 1, v5);
  char v8 = &a1[v6[12]];
  *(void *)char v8 = 0;
  v8[8] = 1;
  *a1 = 1;
  uint64_t result = sub_1BF447A1C((uint64_t)v4, v7);
  *(void *)&a1[v6[6]] = 15;
  *(void *)&a1[v6[7]] = 15;
  a1[v6[8]] = 0;
  a1[v6[9]] = 1;
  a1[v6[10]] = 1;
  a1[v6[11]] = 0;
  *(void *)char v8 = 0;
  v8[8] = 1;
  return result;
}

uint64_t static VideoConfiguration.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v104 = sub_1BF465018();
  uint64_t v101 = *(void *)(v104 - 8);
  MEMORY[0x1F4188790](v104);
  OUTLINED_FUNCTION_8_5();
  uint64_t v100 = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA148770);
  MEMORY[0x1F4188790](v5 - 8);
  OUTLINED_FUNCTION_8_5();
  uint64_t v102 = v6;
  unint64_t v103 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EA148778);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = &v97[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = type metadata accessor for VideoConfiguration();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1F4188790](v11);
  uint64_t v109 = &v97[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  OUTLINED_FUNCTION_0_35();
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_10_15();
  uint64_t v108 = v14;
  OUTLINED_FUNCTION_0_35();
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_10_15();
  uint64_t v107 = v16;
  OUTLINED_FUNCTION_0_35();
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_10_15();
  uint64_t v106 = v18;
  OUTLINED_FUNCTION_0_35();
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_10_15();
  uint64_t v117 = v20;
  OUTLINED_FUNCTION_0_35();
  MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_10_15();
  uint64_t v116 = v22;
  OUTLINED_FUNCTION_0_35();
  MEMORY[0x1F4188790](v23);
  OUTLINED_FUNCTION_10_15();
  uint64_t v115 = v24;
  OUTLINED_FUNCTION_0_35();
  MEMORY[0x1F4188790](v25);
  OUTLINED_FUNCTION_10_15();
  uint64_t v114 = v26;
  OUTLINED_FUNCTION_0_35();
  MEMORY[0x1F4188790](v27);
  OUTLINED_FUNCTION_10_15();
  uint64_t v113 = v28;
  OUTLINED_FUNCTION_0_35();
  MEMORY[0x1F4188790](v29);
  OUTLINED_FUNCTION_10_15();
  uint64_t v112 = v30;
  OUTLINED_FUNCTION_0_35();
  MEMORY[0x1F4188790](v31);
  OUTLINED_FUNCTION_10_15();
  uint64_t v111 = v32;
  OUTLINED_FUNCTION_0_35();
  MEMORY[0x1F4188790](v33);
  OUTLINED_FUNCTION_10_15();
  uint64_t v110 = v34;
  OUTLINED_FUNCTION_0_35();
  uint64_t v36 = MEMORY[0x1F4188790](v35);
  uint64_t v38 = &v97[-v37];
  uint64_t v39 = MEMORY[0x1F4188790](v36);
  uint64_t v41 = &v97[-v40];
  uint64_t v42 = MEMORY[0x1F4188790](v39);
  uint64_t v44 = &v97[-v43];
  MEMORY[0x1F4188790](v42);
  uint64_t v46 = &v97[-v45];
  int v47 = *a1;
  int v48 = *a2;
  sub_1BF4489B8((uint64_t)a1, (uint64_t)&v97[-v45]);
  id v105 = a2;
  sub_1BF4489B8((uint64_t)a2, (uint64_t)v44);
  if (v47 != v48)
  {
    sub_1BF448A1C((uint64_t)v44);
    sub_1BF448A1C((uint64_t)v46);
LABEL_9:
    uint64_t v55 = v108;
    uint64_t v54 = (uint64_t)v109;
    uint64_t v57 = v106;
    uint64_t v56 = v107;
    uint64_t v53 = (uint64_t)v105;
    sub_1BF4489B8((uint64_t)a1, (uint64_t)v41);
    sub_1BF4489B8(v53, (uint64_t)v38);
LABEL_10:
    sub_1BF448A1C((uint64_t)v38);
    sub_1BF448A1C((uint64_t)v41);
    uint64_t v59 = v110;
    sub_1BF4489B8((uint64_t)a1, v110);
    uint64_t v60 = v111;
    sub_1BF4489B8(v53, v111);
LABEL_11:
    sub_1BF448A1C(v60);
    sub_1BF448A1C(v59);
    uint64_t v61 = v112;
    sub_1BF4489B8((uint64_t)a1, v112);
    uint64_t v62 = v113;
    sub_1BF4489B8(v53, v113);
    uint64_t v64 = v116;
    uint64_t v63 = v117;
LABEL_12:
    sub_1BF448A1C(v62);
    sub_1BF448A1C(v61);
    uint64_t v65 = v114;
    sub_1BF4489B8((uint64_t)a1, v114);
    uint64_t v66 = v115;
    sub_1BF4489B8(v53, v115);
LABEL_13:
    sub_1BF448A1C(v66);
    sub_1BF448A1C(v65);
    sub_1BF4489B8((uint64_t)a1, v64);
    sub_1BF4489B8(v53, v63);
LABEL_14:
    sub_1BF448A1C(v63);
    sub_1BF448A1C(v64);
    sub_1BF4489B8((uint64_t)a1, v57);
    sub_1BF4489B8(v53, v56);
LABEL_15:
    sub_1BF448A1C(v56);
    sub_1BF448A1C(v57);
    sub_1BF4489B8((uint64_t)a1, v55);
    sub_1BF4489B8(v53, v54);
LABEL_16:
    sub_1BF448A1C(v54);
    sub_1BF448A1C(v55);
    return 0;
  }
  uint64_t v49 = *(int *)(v10 + 20);
  uint64_t v50 = (uint64_t)&v44[v49];
  uint64_t v51 = (uint64_t)&v9[v103[12]];
  sub_1BF447978((uint64_t)&v46[v49], (uint64_t)v9);
  sub_1BF447978(v50, v51);
  uint64_t v52 = v104;
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v104) == 1)
  {
    sub_1BF448A1C((uint64_t)v44);
    sub_1BF448A1C((uint64_t)v46);
    if (__swift_getEnumTagSinglePayload(v51, 1, v52) == 1)
    {
      unint64_t v103 = (int *)v10;
      sub_1BF3E9E30((uint64_t)v9, &qword_1EA148770);
      sub_1BF4489B8((uint64_t)a1, (uint64_t)v41);
      uint64_t v53 = (uint64_t)v105;
      sub_1BF4489B8((uint64_t)v105, (uint64_t)v38);
      uint64_t v55 = v108;
      uint64_t v54 = (uint64_t)v109;
      uint64_t v57 = v106;
      uint64_t v56 = v107;
      goto LABEL_19;
    }
LABEL_8:
    sub_1BF3E9E30((uint64_t)v9, &qword_1EA148778);
    goto LABEL_9;
  }
  uint64_t v58 = v102;
  sub_1BF447978((uint64_t)v9, v102);
  if (__swift_getEnumTagSinglePayload(v51, 1, v52) == 1)
  {
    sub_1BF448A1C((uint64_t)v44);
    sub_1BF448A1C((uint64_t)v46);
    (*(void (**)(uint64_t, uint64_t))(v101 + 8))(v58, v52);
    goto LABEL_8;
  }
  unint64_t v103 = (int *)v10;
  uint64_t v69 = v101;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v101 + 32))(v100, v51, v52);
  sub_1BF448A78();
  uint64_t v70 = v100;
  uint64_t v99 = v9;
  uint64_t v71 = v58;
  int v98 = sub_1BF465F68();
  uint64_t v72 = *(void (**)(uint64_t, uint64_t))(v69 + 8);
  v72(v70, v52);
  sub_1BF448A1C((uint64_t)v44);
  sub_1BF448A1C((uint64_t)v46);
  v72(v71, v52);
  sub_1BF3E9E30((uint64_t)v99, &qword_1EA148770);
  sub_1BF4489B8((uint64_t)a1, (uint64_t)v41);
  uint64_t v53 = (uint64_t)v105;
  sub_1BF4489B8((uint64_t)v105, (uint64_t)v38);
  uint64_t v55 = v108;
  uint64_t v54 = (uint64_t)v109;
  uint64_t v57 = v106;
  uint64_t v56 = v107;
  if ((v98 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_19:
  uint64_t v73 = v103[6];
  uint64_t v74 = *(void *)&v41[v73];
  uint64_t v75 = *(void *)&v38[v73];
  sub_1BF448A1C((uint64_t)v38);
  sub_1BF448A1C((uint64_t)v41);
  uint64_t v59 = v110;
  sub_1BF4489B8((uint64_t)a1, v110);
  uint64_t v60 = v111;
  sub_1BF4489B8(v53, v111);
  if (v74 != v75) {
    goto LABEL_11;
  }
  uint64_t v76 = v103[7];
  uint64_t v77 = *(void *)(v59 + v76);
  uint64_t v78 = v59;
  uint64_t v79 = *(void *)(v60 + v76);
  sub_1BF448A1C(v60);
  sub_1BF448A1C(v78);
  uint64_t v80 = v112;
  sub_1BF4489B8((uint64_t)a1, v112);
  uint64_t v81 = v113;
  sub_1BF4489B8(v53, v113);
  BOOL v82 = v77 == v79;
  uint64_t v61 = v80;
  uint64_t v62 = v81;
  uint64_t v64 = v116;
  uint64_t v63 = v117;
  if (!v82) {
    goto LABEL_12;
  }
  LODWORD(v111) = *(unsigned __int8 *)(v61 + v103[8]);
  sub_1BF448A1C(v61);
  LODWORD(v112) = *(unsigned __int8 *)(v62 + v103[8]);
  sub_1BF448A1C(v62);
  uint64_t v65 = v114;
  sub_1BF4489B8((uint64_t)a1, v114);
  uint64_t v66 = v115;
  sub_1BF4489B8(v53, v115);
  if (v111 != v112) {
    goto LABEL_13;
  }
  uint64_t v83 = v65;
  int v84 = *(unsigned __int8 *)(v65 + v103[9]);
  sub_1BF448A1C(v83);
  uint64_t v85 = v66;
  int v86 = *(unsigned __int8 *)(v66 + v103[9]);
  sub_1BF448A1C(v85);
  sub_1BF4489B8((uint64_t)a1, v64);
  sub_1BF4489B8(v53, v63);
  if (v84 != v86) {
    goto LABEL_14;
  }
  uint64_t v87 = v103;
  int v88 = *(unsigned __int8 *)(v64 + v103[10]);
  sub_1BF448A1C(v64);
  LODWORD(v87) = *(unsigned __int8 *)(v63 + v87[10]);
  sub_1BF448A1C(v63);
  sub_1BF4489B8((uint64_t)a1, v57);
  sub_1BF4489B8(v53, v56);
  if (v88 != v87) {
    goto LABEL_15;
  }
  uint64_t v89 = v103;
  int v90 = *(unsigned __int8 *)(v57 + v103[11]);
  sub_1BF448A1C(v57);
  LODWORD(v89) = *(unsigned __int8 *)(v56 + v89[11]);
  sub_1BF448A1C(v56);
  sub_1BF4489B8((uint64_t)a1, v55);
  sub_1BF4489B8(v53, v54);
  if (v90 != v89) {
    goto LABEL_16;
  }
  uint64_t v91 = v103;
  uint64_t v92 = v55 + v103[12];
  double v93 = *(double *)v92;
  char v94 = *(unsigned char *)(v92 + 8);
  sub_1BF448A1C(v55);
  uint64_t v95 = v54 + v91[12];
  double v96 = *(double *)v95;
  uint64_t v67 = *(unsigned __int8 *)(v95 + 8);
  sub_1BF448A1C(v54);
  if ((v94 & 1) == 0) {
    return (v93 == v96) & ~v67;
  }
  return v67;
}

uint64_t sub_1BF4489B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for VideoConfiguration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BF448A1C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for VideoConfiguration();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1BF448A78()
{
  unint64_t result = qword_1EA148780;
  if (!qword_1EA148780)
  {
    sub_1BF465018();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA148780);
  }
  return result;
}

unint64_t sub_1BF448ACC()
{
  unint64_t result = qword_1EA148788;
  if (!qword_1EA148788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA148788);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for VideoFillMode(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BF448BE8);
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

ValueMetadata *type metadata accessor for VideoFillMode()
{
  return &type metadata for VideoFillMode;
}

void *initializeBufferWithCopyOfBuffer for VideoConfiguration(unsigned char *a1, void *a2, int *a3)
{
  unsigned int v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *unsigned int v4 = *a2;
    unsigned int v4 = (void *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(unsigned char *)a2;
    uint64_t v7 = a3[5];
    uint64_t v8 = &a1[v7];
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_1BF465018();
    if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
    {
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA148770);
      memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(unsigned char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
    }
    uint64_t v13 = a3[7];
    *(void *)((char *)v4 + a3[6]) = *(void *)((char *)a2 + a3[6]);
    *(void *)((char *)v4 + v13) = *(void *)((char *)a2 + v13);
    uint64_t v14 = a3[9];
    *((unsigned char *)v4 + a3[8]) = *((unsigned char *)a2 + a3[8]);
    *((unsigned char *)v4 + v14) = *((unsigned char *)a2 + v14);
    uint64_t v15 = a3[11];
    *((unsigned char *)v4 + a3[10]) = *((unsigned char *)a2 + a3[10]);
    *((unsigned char *)v4 + v15) = *((unsigned char *)a2 + v15);
    uint64_t v16 = a3[12];
    uint64_t v17 = (char *)v4 + v16;
    uint64_t v18 = (char *)a2 + v16;
    *(void *)uint64_t v17 = *(void *)v18;
    v17[8] = v18[8];
  }
  return v4;
}

uint64_t destroy for VideoConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_1BF465018();
  uint64_t result = __swift_getEnumTagSinglePayload(v2, 1, v3);
  if (!result)
  {
    int v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v5(v2, v3);
  }
  return result;
}

unsigned char *initializeWithCopy for VideoConfiguration(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_1BF465018();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA148770);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  uint64_t v11 = a3[7];
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  *(void *)&a1[v11] = *(void *)&a2[v11];
  uint64_t v12 = a3[9];
  a1[a3[8]] = a2[a3[8]];
  a1[v12] = a2[v12];
  uint64_t v13 = a3[11];
  a1[a3[10]] = a2[a3[10]];
  a1[v13] = a2[v13];
  uint64_t v14 = a3[12];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  *(void *)uint64_t v15 = *(void *)v16;
  v15[8] = v16[8];
  return a1;
}

unsigned char *assignWithCopy for VideoConfiguration(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_1BF465018();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (!EnumTagSinglePayload)
  {
    uint64_t v12 = *(void *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v12 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(unsigned char *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA148770);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
LABEL_7:
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  a1[a3[8]] = a2[a3[8]];
  a1[a3[9]] = a2[a3[9]];
  a1[a3[10]] = a2[a3[10]];
  a1[a3[11]] = a2[a3[11]];
  uint64_t v14 = a3[12];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  uint64_t v17 = *(void *)v16;
  v15[8] = v16[8];
  *(void *)uint64_t v15 = v17;
  return a1;
}

unsigned char *initializeWithTake for VideoConfiguration(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_1BF465018();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA148770);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  uint64_t v11 = a3[7];
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  *(void *)&a1[v11] = *(void *)&a2[v11];
  uint64_t v12 = a3[9];
  a1[a3[8]] = a2[a3[8]];
  a1[v12] = a2[v12];
  uint64_t v13 = a3[11];
  a1[a3[10]] = a2[a3[10]];
  a1[v13] = a2[v13];
  uint64_t v14 = a3[12];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  *(void *)uint64_t v15 = *(void *)v16;
  v15[8] = v16[8];
  return a1;
}

unsigned char *assignWithTake for VideoConfiguration(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_1BF465018();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (!EnumTagSinglePayload)
  {
    uint64_t v12 = *(void *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v12 + 40))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(unsigned char *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA148770);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
LABEL_7:
  uint64_t v14 = a3[7];
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  *(void *)&a1[v14] = *(void *)&a2[v14];
  uint64_t v15 = a3[9];
  a1[a3[8]] = a2[a3[8]];
  a1[v15] = a2[v15];
  uint64_t v16 = a3[11];
  a1[a3[10]] = a2[a3[10]];
  a1[v16] = a2[v16];
  uint64_t v17 = a3[12];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  *(void *)uint64_t v18 = *(void *)v19;
  v18[8] = v19[8];
  return a1;
}

uint64_t getEnumTagSinglePayload for VideoConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BF44946C);
}

uint64_t sub_1BF44946C(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 254)
  {
    unsigned int v4 = *a1;
    if (v4 >= 2) {
      return v4 - 1;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA148770);
    uint64_t v9 = (uint64_t)&a1[*(int *)(a3 + 20)];
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for VideoConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BF449504);
}

unsigned char *sub_1BF449504(unsigned char *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 254)
  {
    *uint64_t result = a2 + 1;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA148770);
    uint64_t v8 = (uint64_t)&v5[*(int *)(a4 + 20)];
    return (unsigned char *)__swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_1BF449584()
{
  sub_1BF44963C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_1BF44963C()
{
  if (!qword_1EA1487A0)
  {
    sub_1BF465018();
    unint64_t v0 = sub_1BF466588();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA1487A0);
    }
  }
}

uint64_t OUTLINED_FUNCTION_1_35()
{
  return type metadata accessor for VideoConfiguration();
}

void *VideoControls.all.unsafeMutableAddressor()
{
  return &static VideoControls.all;
}

uint64_t VideoControls.init(deserializing:using:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_1BF465388();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  uint64_t v6 = MEMORY[0x1F4188790](v5);
  uint64_t v7 = MEMORY[0x1F4188790](v6);
  MEMORY[0x1F4188790](v7);
  sub_1BF465398();
  char v8 = sub_1BF465318();
  uint64_t v9 = *(void (**)(void))(v3 + 8);
  OUTLINED_FUNCTION_0_36();
  v9();
  int v10 = v8 & 1;
  sub_1BF465398();
  char v11 = sub_1BF465318();
  OUTLINED_FUNCTION_0_36();
  v9();
  unsigned int v12 = v10 & 0xFFFFFFFD | (2 * (v11 & 1));
  sub_1BF465398();
  char v13 = sub_1BF465318();
  OUTLINED_FUNCTION_0_36();
  v9();
  unsigned int v14 = v12 & 0xFFFFFFFB | (4 * (v13 & 1));
  sub_1BF465398();
  char v15 = sub_1BF465318();
  OUTLINED_FUNCTION_0_36();
  v9();
  unsigned int v16 = v14 & 0xFFFFFFF7 | (8 * (v15 & 1));
  sub_1BF465398();
  char v17 = sub_1BF465318();
  OUTLINED_FUNCTION_0_36();
  v9();
  uint64_t v18 = sub_1BF465508();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8))(a2, v18);
  OUTLINED_FUNCTION_0_36();
  v9();
  return v16 & 0xFFFFFFEF | (16 * (v17 & 1));
}

void *VideoControls.prominentPlay.unsafeMutableAddressor()
{
  return &static VideoControls.prominentPlay;
}

uint64_t static VideoControls.prominentPlay.getter()
{
  return 1;
}

void *VideoControls.fullScreenToggle.unsafeMutableAddressor()
{
  return &static VideoControls.fullScreenToggle;
}

uint64_t static VideoControls.fullScreenToggle.getter()
{
  return 2;
}

void *VideoControls.inlinePlayPause.unsafeMutableAddressor()
{
  return &static VideoControls.inlinePlayPause;
}

uint64_t static VideoControls.inlinePlayPause.getter()
{
  return 4;
}

void *VideoControls.muteUnmute.unsafeMutableAddressor()
{
  return &static VideoControls.muteUnmute;
}

uint64_t static VideoControls.muteUnmute.getter()
{
  return 8;
}

void *VideoControls.scrubber.unsafeMutableAddressor()
{
  return &static VideoControls.scrubber;
}

uint64_t static VideoControls.scrubber.getter()
{
  return 16;
}

uint64_t static VideoControls.all.getter()
{
  return 15;
}

void *VideoControls.inline.unsafeMutableAddressor()
{
  return &static VideoControls.inline;
}

uint64_t static VideoControls.inline.getter()
{
  return 14;
}

void *VideoControls.none.unsafeMutableAddressor()
{
  return &static VideoControls.none;
}

uint64_t static VideoControls.none.getter()
{
  return 0;
}

BOOL VideoControls.containsInlineControls.getter(char a1)
{
  return (a1 & 0xE) != 0;
}

uint64_t sub_1BF449A48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = VideoControls.init(deserializing:using:)(a1, a2);
  *a3 = result;
  return result;
}

unint64_t sub_1BF449A7C()
{
  unint64_t result = qword_1EA1487A8;
  if (!qword_1EA1487A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1487A8);
  }
  return result;
}

unint64_t sub_1BF449ACC()
{
  unint64_t result = qword_1EA1487B0;
  if (!qword_1EA1487B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1487B0);
  }
  return result;
}

unint64_t sub_1BF449B1C()
{
  unint64_t result = qword_1EA1487B8;
  if (!qword_1EA1487B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1487B8);
  }
  return result;
}

unint64_t sub_1BF449B6C()
{
  unint64_t result = qword_1EA1487C0;
  if (!qword_1EA1487C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1487C0);
  }
  return result;
}

ValueMetadata *type metadata accessor for VideoControls()
{
  return &type metadata for VideoControls;
}

uint64_t sub_1BF449BD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (unint64_t v4 = sub_1BF44C030(a1, a2), (v5 & 1) != 0)) {
    return *(void *)(*(void *)(a3 + 56) + 8 * v4);
  }
  else {
    return 0;
  }
}

uint64_t sub_1BF449C18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_1BF44C030(a1, a2), (v7 & 1) != 0))
  {
    unint64_t v8 = v6;
    uint64_t v9 = *(void *)(a3 + 56);
    uint64_t v10 = sub_1BF464E58();
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(a4, v9 + *(void *)(*(void *)(v10 - 8) + 72) * v8, v10);
    uint64_t v11 = a4;
    uint64_t v12 = 0;
    uint64_t v13 = v10;
  }
  else
  {
    uint64_t v13 = sub_1BF464E58();
    uint64_t v11 = a4;
    uint64_t v12 = 1;
  }

  return __swift_storeEnumTagSinglePayload(v11, v12, 1, v13);
}

double sub_1BF449CDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return OUTLINED_FUNCTION_14_9();
  }
  unint64_t v3 = sub_1BF44C030(a1, a2);
  if ((v4 & 1) == 0) {
    return OUTLINED_FUNCTION_14_9();
  }
  uint64_t v5 = OUTLINED_FUNCTION_17_8(v3);

  sub_1BF3A8B64(v5, v6);
  return result;
}

uint64_t sub_1BF449D34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  sub_1BF44C030(a1, a2);
  if ((v4 & 1) == 0) {
    return 0;
  }
  OUTLINED_FUNCTION_27_5();
  return v3;
}

uint64_t sub_1BF449D7C(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16) && (unint64_t v3 = sub_1BF44C198(), (v4 & 1) != 0)) {
    return *(void *)(*(void *)(a2 + 56) + 8 * v3);
  }
  else {
    return 0;
  }
}

double sub_1BF449DC4(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return OUTLINED_FUNCTION_14_9();
  }
  unint64_t v2 = sub_1BF44BFF0();
  if ((v3 & 1) == 0) {
    return OUTLINED_FUNCTION_14_9();
  }
  uint64_t v4 = OUTLINED_FUNCTION_17_8(v2);

  sub_1BF3A8B64(v4, v5);
  return result;
}

double sub_1BF449E1C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_1BF44C030(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 40 * v6;
    sub_1BF3AA4C4(v8, a4);
  }
  else
  {
    *(void *)(a4 + 32) = 0;
    return OUTLINED_FUNCTION_14_9();
  }
  return result;
}

double sub_1BF449E84(uint64_t a1, uint64_t a2)
{
  return sub_1BF449F28(a1, a2, (uint64_t (*)(void))sub_1BF44C1F8);
}

uint64_t sub_1BF449E9C(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  sub_1BF44C1F8(a1);
  if ((v3 & 1) == 0) {
    return 0;
  }
  OUTLINED_FUNCTION_27_5();
  return v2;
}

uint64_t sub_1BF449EE4(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16) && (sub_1BF44C0A8(), (v2 & 1) != 0)) {
    return swift_retain();
  }
  else {
    return 0;
  }
}

double sub_1BF449F28(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  if (!*(void *)(a2 + 16)) {
    return OUTLINED_FUNCTION_14_9();
  }
  uint64_t v3 = a3();
  if ((v4 & 1) == 0) {
    return OUTLINED_FUNCTION_14_9();
  }
  uint64_t v5 = OUTLINED_FUNCTION_17_8(v3);

  sub_1BF3A8B64(v5, v6);
  return result;
}

void sub_1BF449F84()
{
  uint64_t v1 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_playerObserversAdded;
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_playerObserversAdded) & 1) == 0)
  {
    char v2 = (void *)OUTLINED_FUNCTION_25_5();
    uint64_t v3 = (void *)OUTLINED_FUNCTION_21_8();
    [v3 v4];

    *(unsigned char *)(v0 + v1) = 1;
  }
}

void sub_1BF449FEC()
{
  uint64_t v2 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_playerObserversAdded;
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_playerObserversAdded) == 1)
  {
    uint64_t v3 = (void *)OUTLINED_FUNCTION_25_5();
    objc_msgSend(v0, sel_removeObserver_forKeyPath_context_, v1, v3, &unk_1EA1487C8);

    *(unsigned char *)(v1 + v2) = 0;
  }
}

void sub_1BF44A054()
{
  OUTLINED_FUNCTION_26_0();
  if (v2)
  {
    uint64_t v3 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_playerItemObserversAdded;
    if ((*(unsigned char *)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_playerItemObserversAdded) & 1) == 0)
    {
      id v4 = v2;
      uint64_t v5 = (void *)OUTLINED_FUNCTION_16_9();
      objc_msgSend(v0, sel_addObserver_forKeyPath_options_context_, v1, v5, 5, &unk_1EA1487C8);

      uint64_t v6 = (void *)sub_1BF465F78();
      char v7 = (void *)OUTLINED_FUNCTION_21_8();
      [v7 v8];

      uint64_t v9 = self;
      id v10 = objc_msgSend(v9, sel_defaultCenter);
      uint64_t v11 = (void *)OUTLINED_FUNCTION_6_21();
      OUTLINED_FUNCTION_3_28();

      id v12 = objc_msgSend(v9, sel_defaultCenter);
      uint64_t v13 = (void *)OUTLINED_FUNCTION_6_21();
      OUTLINED_FUNCTION_3_28();

      id v14 = objc_msgSend(v9, sel_defaultCenter);
      char v15 = (void *)OUTLINED_FUNCTION_6_21();
      OUTLINED_FUNCTION_3_28();

      id v16 = objc_msgSend(v9, sel_defaultCenter);
      char v17 = (void *)OUTLINED_FUNCTION_6_21();
      objc_msgSend(v16, sel_addObserver_selector_name_object_, v1, sel_playbackErrorOccurredWithNotification_, v17, v0);

      *(unsigned char *)(v1 + v3) = 1;
    }
  }
  OUTLINED_FUNCTION_29_0();
}

void sub_1BF44A238()
{
  OUTLINED_FUNCTION_26_0();
  if (v2)
  {
    uint64_t v3 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_playerItemObserversAdded;
    if (*(unsigned char *)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_playerItemObserversAdded) == 1)
    {
      id v4 = v2;
      uint64_t v5 = (void *)OUTLINED_FUNCTION_16_9();
      OUTLINED_FUNCTION_20_6((uint64_t)v5, sel_removeObserver_forKeyPath_context_);

      uint64_t v6 = (void *)sub_1BF465F78();
      OUTLINED_FUNCTION_20_6((uint64_t)v6, sel_removeObserver_forKeyPath_context_);

      char v7 = self;
      id v8 = objc_msgSend(v7, sel_defaultCenter);
      uint64_t v9 = (void *)OUTLINED_FUNCTION_6_21();
      OUTLINED_FUNCTION_4_20();

      id v10 = objc_msgSend(v7, sel_defaultCenter);
      uint64_t v11 = (void *)OUTLINED_FUNCTION_6_21();
      OUTLINED_FUNCTION_4_20();

      id v12 = objc_msgSend(v7, sel_defaultCenter);
      uint64_t v13 = (void *)OUTLINED_FUNCTION_6_21();
      OUTLINED_FUNCTION_4_20();

      id v14 = objc_msgSend(v7, sel_defaultCenter);
      char v15 = (void *)OUTLINED_FUNCTION_6_21();
      objc_msgSend(v14, sel_removeObserver_name_object_, v1, v15, v0);

      *(unsigned char *)(v1 + v3) = 0;
    }
  }
  OUTLINED_FUNCTION_29_0();
}

void sub_1BF44A3E4(void *a1, void *a2)
{
  uint64_t v5 = v2;
  uint64_t v7 = sub_1BF465188();
  OUTLINED_FUNCTION_0_6();
  uint64_t v9 = v8;
  MEMORY[0x1F4188790](v10);
  uint64_t v11 = OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_6();
  uint64_t v13 = v12;
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_1_4();
  char v15 = (void *)sub_1BF465F78();
  id v16 = objc_msgSend(a1, sel_statusOfValueForKey_error_, v15, 0);

  if (v16 == (id)2)
  {
    objc_msgSend(a1, sel_duration);
    double Seconds = CMTimeGetSeconds(&time);
    if (Seconds >= 5.0) {
      double v18 = Seconds + -5.0;
    }
    else {
      double v18 = Seconds;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94860);
    CMTimeValue v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_1BF476FF0;
    CMTimeValue v20 = sub_1BF466508();
    CMTimeScale v22 = v21;
    uint64_t v38 = v9;
    uint64_t v39 = v13;
    CMTimeEpoch v24 = v23;
    unint64_t v25 = HIDWORD(v21);
    uint64_t v40 = v11;
    uint64_t v26 = self;
    time.value = v20;
    time.timescale = v22;
    time.flags = v25;
    time.epoch = v24;
    *(void *)(v19 + 32) = objc_msgSend(v26, sel_valueWithCMTime_, &time);
    time.value = v19;
    sub_1BF466168();
    sub_1BF3A9E60(0, &qword_1EA148808);
    OUTLINED_FUNCTION_22_5();
    uint64_t v27 = (void *)sub_1BF466128();
    swift_bridgeObjectRelease();
    sub_1BF3A9E60(0, (unint64_t *)&qword_1EBA96560);
    uint64_t v28 = (void *)sub_1BF466458();
    uint64_t v29 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v30 = swift_allocObject();
    *(void *)(v30 + 16) = v29;
    *(double *)(v30 + 24) = Seconds;
    *(double *)(v30 + 32) = v18;
    uint64_t v45 = sub_1BF44CE28;
    uint64_t v46 = v30;
    time.value = MEMORY[0x1E4F143A8];
    *(void *)&time.timescale = 1107296256;
    time.epoch = (CMTimeEpoch)sub_1BF3AC814;
    uint64_t v44 = &block_descriptor_30;
    uint64_t v31 = _Block_copy(&time);
    swift_release();
    id v32 = objc_msgSend(a2, sel_addBoundaryTimeObserverForTimes_queue_usingBlock_, v27, v28, v31);
    _Block_release(v31);

    sub_1BF4665E8();
    swift_unknownObjectRelease();
    uint64_t v33 = (void *)sub_1BF466458();
    sub_1BF3A8B64((uint64_t)v47, (uint64_t)v42);
    uint64_t v34 = swift_allocObject();
    *(void *)(v34 + 16) = v5;
    sub_1BF3A8B54(v42, (_OWORD *)(v34 + 24));
    uint64_t v45 = sub_1BF44CE74;
    uint64_t v46 = v34;
    time.value = MEMORY[0x1E4F143A8];
    *(void *)&time.timescale = 1107296256;
    time.epoch = (CMTimeEpoch)sub_1BF3AC814;
    uint64_t v44 = &block_descriptor_36;
    uint64_t v35 = _Block_copy(&time);
    id v36 = v5;
    swift_release();
    sub_1BF4651A8();
    time.value = MEMORY[0x1E4FBC860];
    sub_1BF44CEE8((unint64_t *)&qword_1EBA963D0, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA964D8);
    sub_1BF3AC870();
    OUTLINED_FUNCTION_10_16();
    sub_1BF466608();
    uint64_t v37 = OUTLINED_FUNCTION_23_7();
    MEMORY[0x1C18A9C40](v37);
    _Block_release(v35);

    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v3, v7);
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v4, v40);
    __swift_destroy_boxed_opaque_existential_2((uint64_t)v47);
  }
}

void sub_1BF44A890(uint64_t a1, double a2, double a3)
{
  uint64_t v5 = a1 + 16;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x1C18AAE10](v5);
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    uint64_t v8 = MEMORY[0x1C18AAE10](v6 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_delegate);

    if (v8)
    {
      double v9 = a2 - a3;
      long long v10 = 0u;
      long long v11 = 0u;
      uint64_t v12 = 0;
      char v13 = 3;
      sub_1BF450F80(&v9);
      swift_unknownObjectRelease();
    }
  }
}

uint64_t sub_1BF44A934(uint64_t a1, uint64_t a2)
{
  sub_1BF3A8B64(a2, (uint64_t)v5);
  uint64_t v3 = a1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_timeBoundaryObserver;
  swift_beginAccess();
  sub_1BF44CE80((uint64_t)v5, v3);
  return swift_endAccess();
}

uint64_t sub_1BF44A9A0(void *a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_timeBoundaryObserver;
  swift_beginAccess();
  sub_1BF3F24A0(v3, (uint64_t)&v5);
  if (!*((void *)&v6 + 1)) {
    return sub_1BF3A7DB8((uint64_t)&v5);
  }
  sub_1BF3A8B54(&v5, &v7);
  __swift_project_boxed_opaque_existential_2(&v7, v8);
  objc_msgSend(a1, sel_removeTimeObserver_, sub_1BF466958());
  swift_unknownObjectRelease();
  long long v5 = 0u;
  long long v6 = 0u;
  swift_beginAccess();
  sub_1BF44CE80((uint64_t)&v5, v3);
  swift_endAccess();
  return __swift_destroy_boxed_opaque_existential_2((uint64_t)&v7);
}

void sub_1BF44AA8C()
{
  OUTLINED_FUNCTION_26_0();
  long long v5 = v4;
  long long v6 = v3;
  uint64_t v7 = v2;
  uint64_t v8 = v1;
  if (!v4 || v4 != &unk_1EA1487C8)
  {
    if (v1) {
      uint64_t v8 = (void *)sub_1BF465F78();
    }
    sub_1BF3F24A0(v7, (uint64_t)v25);
    uint64_t v12 = v26;
    if (v26)
    {
      __swift_project_boxed_opaque_existential_2(v25, v26);
      OUTLINED_FUNCTION_0_6();
      uint64_t v14 = v13;
      MEMORY[0x1F4188790](v15);
      char v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v14 + 16))(v17);
      uint64_t v18 = sub_1BF466958();
      (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v12);
      __swift_destroy_boxed_opaque_existential_2((uint64_t)v25);
      if (!v6)
      {
LABEL_13:
        CMTimeValue v19 = (objc_class *)type metadata accessor for VideoObserver();
        v24.receiver = v0;
        v24.super_class = v19;
        objc_msgSendSuper2(&v24, sel_observeValueForKeyPath_ofObject_change_context_, v8, v18, v6, v5);

        swift_unknownObjectRelease();
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v18 = 0;
      if (!v6) {
        goto LABEL_13;
      }
    }
    type metadata accessor for NSKeyValueChangeKey(0);
    sub_1BF44CEE8(&qword_1EA147948, type metadata accessor for NSKeyValueChangeKey);
    long long v6 = (void *)sub_1BF465E98();
    goto LABEL_13;
  }
  if (v1 && v3)
  {
    sub_1BF3F24A0(v2, (uint64_t)v25);
    if (v26)
    {
      sub_1BF3A9E60(0, &qword_1EA1487F0);
      if (OUTLINED_FUNCTION_26_6())
      {
        uint64_t v9 = OUTLINED_FUNCTION_24_4();
        sub_1BF44AE64(v9, v10, v11, v5);
LABEL_21:

        goto LABEL_14;
      }
    }
    else
    {
      sub_1BF3A7DB8((uint64_t)v25);
    }
    sub_1BF3F24A0(v7, (uint64_t)v25);
    if (!v26)
    {
      sub_1BF3A7DB8((uint64_t)v25);
      goto LABEL_14;
    }
    sub_1BF3A9E60(0, &qword_1EA148810);
    if (OUTLINED_FUNCTION_26_6())
    {
      uint64_t v20 = OUTLINED_FUNCTION_24_4();
      sub_1BF44B1AC(v20, v21, v22);
      goto LABEL_21;
    }
  }
LABEL_14:
  OUTLINED_FUNCTION_29_0();
}

void sub_1BF44AE64(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  BOOL v8 = a2 == 0x737574617473 && a3 == 0xE600000000000000;
  char v9 = v8;
  uint64_t v10 = (id *)MEMORY[0x1E4F284C8];
  if (!v8 && (OUTLINED_FUNCTION_7_16() & 1) == 0) {
    goto LABEL_17;
  }
  id v11 = *v10;
  OUTLINED_FUNCTION_30_5((uint64_t)v11, v12, (uint64_t (*)(void))sub_1BF44C1F8);

  if (v23[3])
  {
    if ((OUTLINED_FUNCTION_11_18() & 1) != 0 && v22 == 1)
    {
      if (!MEMORY[0x1C18AAE10](v4 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_delegate)) {
        return;
      }
      id v13 = objc_msgSend(a4, sel_error);
      if (v13)
      {
        v23[0] = v13;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA930E8);
        sub_1BF3A9E60(0, &qword_1EA148800);
        uint64_t v14 = OUTLINED_FUNCTION_15_6() != 0;
      }
      else
      {
        uint64_t v14 = 0;
      }
      uint64_t v21 = 1;
LABEL_42:
      v23[0] = v21;
      v23[1] = v14;
      memset(&v23[2], 0, 32);
      char v24 = 0;
      sub_1BF450F80((uint64_t)v23);
      swift_unknownObjectRelease();

      return;
    }
  }
  else
  {
    sub_1BF3A7DB8((uint64_t)v23);
  }
  if ((v9 & 1) == 0)
  {
LABEL_17:
    if ((OUTLINED_FUNCTION_7_16() & 1) == 0) {
      goto LABEL_28;
    }
    id v11 = *v10;
  }
  id v15 = v11;
  OUTLINED_FUNCTION_30_5((uint64_t)v15, v16, (uint64_t (*)(void))sub_1BF44C1F8);

  if (v23[3])
  {
    if ((OUTLINED_FUNCTION_11_18() & 1) != 0 && v22 == 2)
    {
      if (!MEMORY[0x1C18AAE10](v4 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_delegate)) {
        return;
      }
      id v17 = objc_msgSend(a4, sel_error);
      if (v17)
      {
        v23[0] = v17;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA930E8);
        sub_1BF3A9E60(0, &qword_1EA148800);
        if (OUTLINED_FUNCTION_15_6()) {
          uint64_t v14 = 2;
        }
        else {
          uint64_t v14 = 0;
        }
      }
      else
      {
        uint64_t v14 = 0;
      }
      uint64_t v21 = 2;
      goto LABEL_42;
    }
  }
  else
  {
    sub_1BF3A7DB8((uint64_t)v23);
  }
LABEL_28:
  if (a2 == 0xD000000000000016 && a3 == 0x80000001BF46F080 || (sub_1BF466968())
    && MEMORY[0x1C18AAE10](v4 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_delegate))
  {
    id v18 = *v10;
    OUTLINED_FUNCTION_30_5((uint64_t)v18, v19, (uint64_t (*)(void))sub_1BF44C1F8);

    if (v23[3])
    {
      if (OUTLINED_FUNCTION_11_18())
      {
        uint64_t v20 = v22;
LABEL_37:
        v23[0] = v20;
        memset(&v23[1], 0, 40);
        char v24 = 1;
        sub_1BF450F80((uint64_t)v23);
        swift_unknownObjectRelease();
        return;
      }
    }
    else
    {
      sub_1BF3A7DB8((uint64_t)v23);
    }
    uint64_t v20 = 0;
    goto LABEL_37;
  }
}

uint64_t sub_1BF44B1AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v4 = a2 == 1702125938 && a3 == 0xE400000000000000;
  if (v4 || (uint64_t result = sub_1BF466968(), (result & 1) != 0))
  {
    id v6 = (id)*MEMORY[0x1E4F284C8];
    OUTLINED_FUNCTION_30_5((uint64_t)v6, v7, (uint64_t (*)(void))sub_1BF44C1F8);

    if ((void)v11)
    {
      uint64_t result = swift_dynamicCast();
      if (result)
      {
        uint64_t result = MEMORY[0x1C18AAE10](v3 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_delegate);
        if (result)
        {
          uint64_t v9 = v8;
          long long v10 = 0u;
          long long v11 = 0u;
          uint64_t v12 = 0;
          char v13 = 4;
          sub_1BF450F80((uint64_t)&v9);
          return swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      return sub_1BF3A7DB8((uint64_t)&v9);
    }
  }
  return result;
}

void sub_1BF44B2C4()
{
}

void sub_1BF44B2E4(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x1C18AAE10](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = MEMORY[0x1C18AAE10](v2 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_delegate);

    if (v4)
    {
      uint64_t v5 = 1;
      long long v6 = 0u;
      long long v7 = 0u;
      uint64_t v8 = 0;
      char v9 = 5;
      sub_1BF450F80((uint64_t)&v5);
      swift_unknownObjectRelease();
    }
  }
}

void sub_1BF44B3C0()
{
}

void sub_1BF44B3E0()
{
  OUTLINED_FUNCTION_26_0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = sub_1BF465188();
  OUTLINED_FUNCTION_0_6();
  uint64_t v8 = v7;
  MEMORY[0x1F4188790](v9);
  uint64_t v16 = OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_6();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_1_4();
  sub_1BF3A9E60(0, (unint64_t *)&qword_1EBA96560);
  char v13 = (void *)sub_1BF466458();
  uint64_t v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v17[4] = v5;
  v17[5] = v14;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 1107296256;
  v17[2] = sub_1BF3AC814;
  void v17[3] = v3;
  id v15 = _Block_copy(v17);
  swift_release();
  sub_1BF4651A8();
  v17[0] = MEMORY[0x1E4FBC860];
  sub_1BF44CEE8((unint64_t *)&qword_1EBA963D0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA964D8);
  sub_1BF3AC870();
  OUTLINED_FUNCTION_10_16();
  sub_1BF466608();
  MEMORY[0x1C18A9C40](0, v1, v0, v15);
  _Block_release(v15);

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v0, v6);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v1, v16);
  OUTLINED_FUNCTION_29_0();
}

void sub_1BF44B604(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x1C18AAE10](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = MEMORY[0x1C18AAE10](v2 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_delegate);

    if (v4)
    {
      memset(v5, 0, sizeof(v5));
      char v6 = 5;
      sub_1BF450F80((uint64_t)v5);
      swift_unknownObjectRelease();
    }
  }
}

void sub_1BF44B6D8()
{
  OUTLINED_FUNCTION_26_0();
  uint64_t v3 = v2;
  uint64_t v4 = sub_1BF465188();
  OUTLINED_FUNCTION_0_6();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  uint64_t v8 = OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_6();
  uint64_t v10 = v9;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_1_4();
  sub_1BF3A9E60(0, (unint64_t *)&qword_1EBA96560);
  uint64_t v12 = (void *)sub_1BF466458();
  uint64_t v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v3;
  *(void *)(v14 + 24) = v13;
  v18[4] = sub_1BF44BFCC;
  v18[5] = v14;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 1107296256;
  v18[2] = sub_1BF3AC814;
  v18[3] = &block_descriptor_17;
  id v15 = _Block_copy(v18);
  id v16 = v3;
  swift_release();
  sub_1BF4651A8();
  v18[0] = MEMORY[0x1E4FBC860];
  sub_1BF44CEE8((unint64_t *)&qword_1EBA963D0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA964D8);
  sub_1BF3AC870();
  OUTLINED_FUNCTION_10_16();
  sub_1BF466608();
  uint64_t v17 = OUTLINED_FUNCTION_23_7();
  MEMORY[0x1C18A9C40](v17);
  _Block_release(v15);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0, v4);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v1, v8);
  OUTLINED_FUNCTION_29_0();
}

void sub_1BF44B924(void *a1, uint64_t a2)
{
  uint64_t v3 = a2 + 16;
  id v4 = objc_msgSend(a1, sel_name);
  uint64_t v5 = (void *)sub_1BF465F78();
  uint64_t v6 = sub_1BF465FA8();
  uint64_t v8 = v7;
  if (v6 == sub_1BF465FA8() && v8 == v9)
  {

    swift_bridgeObjectRelease_n();
    goto LABEL_13;
  }
  char v11 = sub_1BF466968();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v11)
  {
LABEL_13:
    swift_beginAccess();
    uint64_t v20 = MEMORY[0x1C18AAE10](v3);
    if (v20)
    {
      uint64_t v21 = (void *)v20;
      uint64_t v22 = MEMORY[0x1C18AAE10](v20 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_delegate);

      if (v22)
      {
        uint64_t v44 = 2;
        long long v45 = 0u;
        long long v46 = 0u;
        uint64_t v47 = 0;
        char v48 = 5;
        sub_1BF450F80((uint64_t)&v44);
        swift_unknownObjectRelease();
      }
    }
    return;
  }
  id v12 = objc_msgSend(a1, sel_name);
  uint64_t v13 = (void *)sub_1BF465F78();
  uint64_t v14 = sub_1BF465FA8();
  uint64_t v16 = v15;
  if (v14 == sub_1BF465FA8() && v16 == v17)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v19 = sub_1BF466968();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v19 & 1) == 0) {
      return;
    }
  }
  if (objc_msgSend(a1, sel_object))
  {
    sub_1BF4665E8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v43, 0, sizeof(v43));
  }
  sub_1BF3F1164((uint64_t)v43, (uint64_t)&v44);
  if (!(void)v46)
  {
    sub_1BF3A7DB8((uint64_t)&v44);
    return;
  }
  sub_1BF3A9E60(0, &qword_1EA1487F0);
  if (swift_dynamicCast())
  {
    id v23 = objc_msgSend(v42, sel_errorLog);
    if (!v23) {
      goto LABEL_34;
    }
    char v24 = v23;
    id v25 = objc_msgSend(v23, sel_events);

    sub_1BF3A9E60(0, &qword_1EA1487F8);
    unint64_t v26 = sub_1BF466138();

    if (v26 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v27 = sub_1BF466878();
      swift_bridgeObjectRelease();
      if (v27)
      {
LABEL_26:
        BOOL v28 = __OFSUB__(v27, 1);
        uint64_t v29 = v27 - 1;
        if (v28)
        {
          __break(1u);
        }
        else
        {
          sub_1BF3A7D90(v29, (v26 & 0xC000000000000001) == 0, v26);
          if ((v26 & 0xC000000000000001) == 0)
          {
            id v30 = *(id *)(v26 + 8 * v29 + 32);
            goto LABEL_29;
          }
        }
        id v30 = (id)MEMORY[0x1C18A9F80](v29, v26);
LABEL_29:
        uint64_t v31 = v30;
        swift_bridgeObjectRelease();
        swift_beginAccess();
        uint64_t v32 = MEMORY[0x1C18AAE10](v3);
        if (v32)
        {
          uint64_t v33 = (void *)v32;
          uint64_t v34 = MEMORY[0x1C18AAE10](v32 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_delegate);

          if (v34)
          {
            id v35 = objc_msgSend(v31, sel_errorStatusCode);
            id v36 = objc_msgSend(v31, sel_errorDomain);
            uint64_t v37 = sub_1BF465FA8();
            uint64_t v39 = v38;

            uint64_t v40 = sub_1BF44CD08(v31);
            uint64_t v44 = (uint64_t)v35;
            *(void *)&long long v45 = 0;
            *((void *)&v45 + 1) = v37;
            *(void *)&long long v46 = v39;
            *((void *)&v46 + 1) = v40;
            uint64_t v47 = v41;
            char v48 = 2;
            sub_1BF450F80((uint64_t)&v44);
            swift_bridgeObjectRelease();

            swift_unknownObjectRelease();
LABEL_37:
            swift_bridgeObjectRelease();
            return;
          }
        }

LABEL_34:
        return;
      }
    }
    else
    {
      uint64_t v27 = *(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v27) {
        goto LABEL_26;
      }
    }

    goto LABEL_37;
  }
}

id sub_1BF44BE10()
{
  *(void *)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_playerItemObserversAdded] = 0;
  v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_playerObserversAdded] = 0;
  type metadata accessor for VideoObserver();
  double v1 = OUTLINED_FUNCTION_14_9();
  v4.receiver = v0;
  v4.super_class = v2;
  return objc_msgSendSuper2(&v4, sel_init, v1);
}

id sub_1BF44BEB0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VideoObserver();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for VideoObserver()
{
  return self;
}

uint64_t sub_1BF44BF54()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BF44BF8C()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1BF44BFCC()
{
  sub_1BF44B924(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t block_copy_helper_17(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_17()
{
  return swift_release();
}

unint64_t sub_1BF44BFF0()
{
  sub_1BF4666E8();
  uint64_t v0 = OUTLINED_FUNCTION_22_5();

  return sub_1BF44C278(v0, v1);
}

unint64_t sub_1BF44C030(uint64_t a1, uint64_t a2)
{
  sub_1BF466A58();
  sub_1BF466028();
  uint64_t v4 = sub_1BF466A98();

  return sub_1BF44C340(a1, a2, v4);
}

unint64_t sub_1BF44C0A8()
{
  sub_1BF4656A8();
  sub_1BF44CEE8(&qword_1EBA94068, MEMORY[0x1E4F71238]);
  sub_1BF465EF8();
  uint64_t v0 = OUTLINED_FUNCTION_22_5();

  return sub_1BF44C424(v0, v1);
}

unint64_t sub_1BF44C13C()
{
  OUTLINED_FUNCTION_19_7();
  ArtworkRequest.hash(into:)();
  uint64_t v1 = sub_1BF466A98();

  return sub_1BF44C5E4(v0, v1);
}

unint64_t sub_1BF44C198()
{
  OUTLINED_FUNCTION_19_7();
  sub_1BF466A68();
  uint64_t v1 = sub_1BF466A98();

  return sub_1BF44CB68(v0, v1);
}

uint64_t sub_1BF44C1F8(uint64_t a1)
{
  sub_1BF465FA8();
  OUTLINED_FUNCTION_29_5();
  sub_1BF466028();
  uint64_t v2 = sub_1BF466A98();
  swift_bridgeObjectRelease();
  return sub_1BF44CC04(a1, v2);
}

unint64_t sub_1BF44C278(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_1BF3C6640(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x1C18A9EB0](v9, a1);
      sub_1BF3BC338((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_1BF44C340(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1BF466968() & 1) == 0)
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
      while (!v14 && (sub_1BF466968() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1BF44C424(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_1BF4656A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  char v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    BOOL v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_1BF44CEE8(&qword_1EBA94070, MEMORY[0x1E4F71238]);
      char v15 = sub_1BF465F68();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

unint64_t sub_1BF44C5E4(double *a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v33 = v2 + 64;
    uint64_t v34 = ~v4;
    uint64_t v37 = *((void *)a1 + 1);
    double v38 = *a1;
    do
    {
      uint64_t v7 = *(void *)(v2 + 48) + 88 * v5;
      double v9 = *(double *)(v7 + 16);
      double v8 = *(double *)(v7 + 24);
      uint64_t v10 = *(unsigned __int8 *)(v7 + 32);
      uint64_t v11 = *(void *)(v7 + 40);
      uint64_t v12 = *(void *)(v7 + 48);
      uint64_t v14 = *(void *)(v7 + 56);
      uint64_t v13 = *(void *)(v7 + 64);
      uint64_t v35 = *(void *)(v7 + 80);
      uint64_t v36 = *(unsigned __int8 *)(v7 + 72);
      BOOL v15 = *(void *)v7 == *(void *)&v38 && *(void *)(v7 + 8) == v37;
      if (!v15 && (sub_1BF466968() & 1) == 0 || v9 != a1[2] || v8 != a1[3]) {
        goto LABEL_63;
      }
      unint64_t v16 = 0xEB00000000646569;
      uint64_t v17 = 0x6669636570736E75;
      switch(v10)
      {
        case 1:
          uint64_t v17 = 0x526465646E756F72;
          unint64_t v16 = 0xEB00000000746365;
          break;
        case 2:
          unint64_t v16 = 0xE500000000000000;
          uint64_t v17 = 0x646E756F72;
          break;
        case 3:
          unint64_t v16 = 0xE400000000000000;
          uint64_t v17 = 1819044208;
          break;
        case 4:
          unint64_t v16 = 0xE300000000000000;
          uint64_t v17 = 7364969;
          break;
        case 5:
          unint64_t v16 = 0xE600000000000000;
          uint64_t v17 = 0x746365527674;
          break;
        case 6:
          uint64_t v17 = 0x656E726F64616E75;
          unint64_t v16 = 0xE900000000000064;
          break;
        default:
          break;
      }
      uint64_t v18 = 0x6669636570736E75;
      unint64_t v19 = 0xEB00000000646569;
      switch(*((unsigned char *)a1 + 32))
      {
        case 1:
          uint64_t v18 = 0x526465646E756F72;
          unint64_t v19 = 0xEB00000000746365;
          break;
        case 2:
          unint64_t v19 = 0xE500000000000000;
          uint64_t v18 = 0x646E756F72;
          break;
        case 3:
          unint64_t v19 = 0xE400000000000000;
          uint64_t v18 = 1819044208;
          break;
        case 4:
          unint64_t v19 = 0xE300000000000000;
          uint64_t v18 = 7364969;
          break;
        case 5:
          unint64_t v19 = 0xE600000000000000;
          uint64_t v18 = 0x746365527674;
          break;
        case 6:
          uint64_t v18 = 0x656E726F64616E75;
          unint64_t v19 = 0xE900000000000064;
          break;
        default:
          break;
      }
      if (v17 == v18 && v16 == v19)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v21 = sub_1BF466968();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v21 & 1) == 0) {
          goto LABEL_47;
        }
      }
      BOOL v22 = v11 == *((void *)a1 + 5) && v12 == *((void *)a1 + 6);
      if (!v22 && (sub_1BF466968() & 1) == 0)
      {
LABEL_47:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v2 = v32;
        uint64_t v3 = v33;
        goto LABEL_63;
      }
      uint64_t v23 = *((void *)a1 + 8);
      if (v13)
      {
        uint64_t v2 = v32;
        uint64_t v3 = v33;
        if (!v23 || (v14 == *((void *)a1 + 7) ? (BOOL v24 = v13 == v23) : (BOOL v24 = 0), !v24 && (sub_1BF466968() & 1) == 0))
        {
LABEL_48:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_63;
        }
      }
      else
      {
        uint64_t v2 = v32;
        uint64_t v3 = v33;
        if (v23) {
          goto LABEL_48;
        }
      }
      unint64_t v25 = 0xE300000000000000;
      uint64_t v26 = 6778480;
      switch(v36)
      {
        case 1:
          unint64_t v25 = 0xE400000000000000;
          uint64_t v26 = 1734701162;
          break;
        case 2:
          unint64_t v25 = 0xE400000000000000;
          uint64_t v26 = 1667851624;
          break;
        case 3:
          uint64_t v26 = 7496556;
          break;
        default:
          break;
      }
      unint64_t v27 = 0xE300000000000000;
      uint64_t v28 = 6778480;
      switch(*((unsigned char *)a1 + 72))
      {
        case 1:
          unint64_t v27 = 0xE400000000000000;
          uint64_t v28 = 1734701162;
          break;
        case 2:
          unint64_t v27 = 0xE400000000000000;
          uint64_t v28 = 1667851624;
          break;
        case 3:
          uint64_t v28 = 7496556;
          break;
        default:
          break;
      }
      if (v26 == v28 && v25 == v27)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        uint64_t v3 = v33;
LABEL_62:
        if (v35 == *((void *)a1 + 10)) {
          return v5;
        }
        goto LABEL_63;
      }
      char v30 = sub_1BF466968();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v3 = v33;
      if (v30) {
        goto LABEL_62;
      }
LABEL_63:
      unint64_t v5 = (v5 + 1) & v34;
    }
    while (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
  return v5;
}

unint64_t sub_1BF44CB68(uint64_t a1, uint64_t a2)
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

uint64_t sub_1BF44CC04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  uint64_t v5 = a2 & ~v4;
  OUTLINED_FUNCTION_1_36();
  if (v6)
  {
    uint64_t v7 = OUTLINED_FUNCTION_18_7();
    if (v7 == OUTLINED_FUNCTION_28_4() && v3 == v8)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v10 = OUTLINED_FUNCTION_13_14();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0)
    {
      uint64_t v11 = ~v4;
      uint64_t v5 = (v5 + 1) & v11;
      OUTLINED_FUNCTION_1_36();
      if (v12)
      {
        while (1)
        {
          uint64_t v13 = OUTLINED_FUNCTION_18_7();
          if (v13 == OUTLINED_FUNCTION_28_4() && v3 == v14) {
            break;
          }
          char v16 = OUTLINED_FUNCTION_12_14();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v16 & 1) == 0)
          {
            uint64_t v5 = (v5 + 1) & v11;
            OUTLINED_FUNCTION_1_36();
            if (v17) {
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

uint64_t sub_1BF44CD08(void *a1)
{
  id v1 = objc_msgSend(a1, sel_errorComment);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_1BF465FA8();

  return v3;
}

void sub_1BF44CD6C()
{
  sub_1BF44B604(v0);
}

void sub_1BF44CD74()
{
  sub_1BF44B2E4(v0);
}

uint64_t sub_1BF44CD7C()
{
  sub_1BF465FA8();
  sub_1BF466A58();
  sub_1BF466028();
  uint64_t v0 = sub_1BF466A98();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1BF44CDF0()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

void sub_1BF44CE28()
{
  sub_1BF44A890(*(void *)(v0 + 16), *(double *)(v0 + 24), *(double *)(v0 + 32));
}

uint64_t sub_1BF44CE34()
{
  __swift_destroy_boxed_opaque_existential_2(v0 + 24);

  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1BF44CE74()
{
  return sub_1BF44A934(*(void *)(v0 + 16), v0 + 24);
}

uint64_t sub_1BF44CE80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA96600);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BF44CEE8(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    OUTLINED_FUNCTION_22_5();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_1BF44CF2C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if (a7 == 2)
  {
    swift_bridgeObjectRetain();
    return (id)swift_bridgeObjectRetain();
  }
  else if (!a7)
  {
    return a2;
  }
  return result;
}

uint64_t destroy for VideoObserver.Change(uint64_t a1)
{
  return sub_1BF44CFA4(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned char *)(a1 + 48));
}

uint64_t sub_1BF44CFA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if (a7 == 2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else if (!a7)
  {
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

uint64_t initializeWithCopy for VideoObserver.Change(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  char v9 = *(unsigned char *)(a2 + 48);
  sub_1BF44CF2C(*(void *)a2, v4, v5, v6, v7, v8, v9);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(unsigned char *)(a1 + 48) = v9;
  return a1;
}

uint64_t assignWithCopy for VideoObserver.Change(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  char v9 = *(unsigned char *)(a2 + 48);
  sub_1BF44CF2C(*(void *)a2, v4, v5, v6, v7, v8, v9);
  uint64_t v10 = *(void *)a1;
  uint64_t v11 = *(void *)(a1 + 8);
  uint64_t v12 = *(void *)(a1 + 16);
  uint64_t v13 = *(void *)(a1 + 24);
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 40);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  char v16 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v9;
  sub_1BF44CFA4(v10, v11, v12, v13, v14, v15, v16);
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for VideoObserver.Change(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 48);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  long long v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  char v11 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v3;
  sub_1BF44CFA4(v4, v6, v5, v7, v8, v9, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for VideoObserver.Change(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFB && *(unsigned char *)(a1 + 49))
    {
      int v2 = *(_DWORD *)a1 + 250;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 48);
      if (v3 <= 5) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for VideoObserver.Change(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)__n128 result = a2 - 251;
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 49) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 49) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 48) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1BF44D218(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 48) <= 4u) {
    return *(unsigned __int8 *)(a1 + 48);
  }
  else {
    return (*(_DWORD *)a1 + 5);
  }
}

uint64_t sub_1BF44D230(uint64_t result, unsigned int a2)
{
  if (a2 >= 5)
  {
    *(void *)__n128 result = a2 - 5;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)(result + 40) = 0;
    LOBYTE(a2) = 5;
  }
  *(unsigned char *)(result + 48) = a2;
  return result;
}

ValueMetadata *type metadata accessor for VideoObserver.Change()
{
  return &type metadata for VideoObserver.Change;
}

id OUTLINED_FUNCTION_3_28()
{
  return objc_msgSend(v2, (SEL)(v5 + 2840), v1, v3, v4, v0);
}

id OUTLINED_FUNCTION_4_20()
{
  return objc_msgSend(v2, (SEL)(v4 + 1688), v1, v3, v0);
}

uint64_t OUTLINED_FUNCTION_6_21()
{
  return sub_1BF465F78();
}

uint64_t OUTLINED_FUNCTION_7_16()
{
  return sub_1BF466968();
}

uint64_t OUTLINED_FUNCTION_11_18()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_12_14()
{
  return sub_1BF466968();
}

uint64_t OUTLINED_FUNCTION_13_14()
{
  return sub_1BF466968();
}

double OUTLINED_FUNCTION_14_9()
{
  double result = 0.0;
  *uint64_t v0 = 0u;
  v0[1] = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_15_6()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_16_9()
{
  return sub_1BF465F78();
}

uint64_t OUTLINED_FUNCTION_17_8(uint64_t a1)
{
  return *(void *)(v1 + 56) + 32 * a1;
}

uint64_t OUTLINED_FUNCTION_18_7()
{
  return sub_1BF465FA8();
}

uint64_t OUTLINED_FUNCTION_19_7()
{
  return sub_1BF466A58();
}

id OUTLINED_FUNCTION_20_6(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3, v4, v5);
}

uint64_t OUTLINED_FUNCTION_21_8()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_22_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_23_7()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_24_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_25_5()
{
  return sub_1BF465F78();
}

uint64_t OUTLINED_FUNCTION_26_6()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_27_5()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_28_4()
{
  return sub_1BF465FA8();
}

uint64_t OUTLINED_FUNCTION_29_5()
{
  return sub_1BF466A58();
}

double OUTLINED_FUNCTION_30_5(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return sub_1BF449F28(a1, v3, a3);
}

uint64_t __swift_memcpy3_1(uint64_t result, __int16 *a2)
{
  __int16 v2 = *a2;
  *(unsigned char *)(result + 2) = *((unsigned char *)a2 + 2);
  *(_WORD *)double result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for VideoPlaybackChecks(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v3 = -1;
    return (v3 + 1);
  }
  if (a2 >= 0xFF)
  {
    if ((a2 + 33554177) >> 24)
    {
      int v2 = *((unsigned __int8 *)a1 + 3);
      if (*((unsigned char *)a1 + 3)) {
        goto LABEL_5;
      }
    }
    else
    {
      int v2 = *(unsigned __int16 *)((char *)a1 + 3);
      if (*(unsigned __int16 *)((char *)a1 + 3))
      {
LABEL_5:
        int v3 = (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v2 << 24)) - 16776962;
        return (v3 + 1);
      }
    }
  }
  unsigned int v4 = *(unsigned __int8 *)a1;
  BOOL v5 = v4 >= 2;
  int v3 = (v4 + 2147483646) & 0x7FFFFFFF;
  if (!v5) {
    int v3 = -1;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for VideoPlaybackChecks(uint64_t result, unsigned int a2, unsigned int a3)
{
  if ((a3 + 33554177) >> 24) {
    int v3 = 1;
  }
  else {
    int v3 = 2;
  }
  if (a3 <= 0xFE) {
    int v3 = 0;
  }
  if (a2 > 0xFE)
  {
    *(_WORD *)double result = a2 - 255;
    *(unsigned char *)(result + 2) = (a2 - 255) >> 16;
    if (v3)
    {
      unsigned int v4 = ((a2 - 255) >> 24) + 1;
      if (v3 == 2) {
        *(_WORD *)(result + 3) = v4;
      }
      else {
        *(unsigned char *)(result + 3) = v4;
      }
    }
  }
  else
  {
    if (!v3) {
      goto LABEL_10;
    }
    if (v3 == 2)
    {
      *(_WORD *)(result + 3) = 0;
LABEL_10:
      if (!a2) {
        return result;
      }
LABEL_16:
      *(unsigned char *)double result = a2 + 1;
      return result;
    }
    *(unsigned char *)(result + 3) = 0;
    if (a2) {
      goto LABEL_16;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VideoPlaybackChecks()
{
  return &type metadata for VideoPlaybackChecks;
}

Float64 CMTime.seconds.getter(CMTimeValue a1, uint64_t a2, CMTimeEpoch a3)
{
  time.value = a1;
  *(void *)&time.timescale = a2;
  time.epoch = a3;
  return CMTimeGetSeconds(&time);
}

uint64_t Double.cmTime.getter()
{
  return sub_1BF466508();
}

void sub_1BF44D6D0()
{
  off_1EA148818 = &unk_1F1AAC300;
}

uint64_t sub_1BF44D6E4()
{
  uint64_t result = sub_1BF465FA8();
  qword_1EA148820 = result;
  *(void *)algn_1EA148828 = v1;
  return result;
}

uint64_t sub_1BF44D714()
{
  uint64_t v0 = sub_1BF465DD8();
  MEMORY[0x1F4188790](v0 - 8);
  uint64_t v1 = sub_1BF465DF8();
  __swift_allocate_value_buffer(v1, qword_1EA150C68);
  __swift_project_value_buffer(v1, (uint64_t)qword_1EA150C68);
  sub_1BF465DC8();
  return sub_1BF465DE8();
}

uint64_t sub_1BF44D7F4(unsigned __int8 a1)
{
  int v2 = v1;
  uint64_t v4 = sub_1BF465188();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1BF4651C8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  char v11 = (char *)&aBlock[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = &v2[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_state];
  uint64_t result = swift_beginAccess();
  int v14 = *v12;
  if (v14 != a1)
  {
    sub_1BF3A9E60(0, (unint64_t *)&qword_1EBA96560);
    uint64_t v15 = (void *)sub_1BF466458();
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v2;
    *(unsigned char *)(v16 + 24) = v14;
    aBlock[4] = sub_1BF452DEC;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1BF3AC814;
    aBlock[3] = &block_descriptor_60;
    char v17 = _Block_copy(aBlock);
    uint64_t v18 = v2;
    swift_release();
    sub_1BF4651A8();
    aBlock[0] = MEMORY[0x1E4FBC860];
    sub_1BF452BD4((unint64_t *)&qword_1EBA963D0, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA964D8);
    sub_1BF3AC870();
    sub_1BF466608();
    MEMORY[0x1C18A9C40](0, v11, v7, v17);
    _Block_release(v17);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return result;
}

uint64_t sub_1BF44DAE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_delegate;
  swift_beginAccess();
  uint64_t result = MEMORY[0x1C18AAE10](v4);
  if (result)
  {
    uint64_t v6 = *(void *)(v4 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 8))(a2, a1, ObjectType, v6);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t VideoPlayer.state.getter()
{
  OUTLINED_FUNCTION_1_5();
  return *v0;
}

uint64_t sub_1BF44DBB4(unsigned __int8 a1)
{
  int v3 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_state);
  OUTLINED_FUNCTION_9_18();
  unsigned __int8 v4 = *v3;
  *int v3 = a1;
  return sub_1BF44D7F4(v4);
}

uint64_t VideoPlayer.videoUrl.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_videoUrl;
  OUTLINED_FUNCTION_3_5();
  return sub_1BF452C84(v3, a1, &qword_1EBA94B20);
}

uint64_t VideoPlayer.videoUrl.setter(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_videoUrl;
  OUTLINED_FUNCTION_15_3();
  sub_1BF4148F0(a1, v3);
  return swift_endAccess();
}

uint64_t (*VideoPlayer.videoUrl.modify())()
{
  return j_j__swift_endAccess;
}

void sub_1BF44DCF8(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_1BF44DE7C(v1);
}

id sub_1BF44DD28()
{
  id v1 = (id *)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playerItem];
  swift_beginAccess();
  id v2 = *v1;
  sub_1BF44A238();

  objc_msgSend(v0, sel_replaceCurrentItemWithPlayerItem_, 0);
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for VideoPlayer(0);
  return objc_msgSendSuper2(&v4, sel_pause);
}

void sub_1BF44DDCC()
{
  id v1 = (id *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playerItem);
  swift_beginAccess();
  id v2 = *v1;
  sub_1BF44A054();
}

void *VideoPlayer.playerItem.getter()
{
  OUTLINED_FUNCTION_1_5();
  id v1 = *v0;
  id v2 = v1;
  return v1;
}

void sub_1BF44DE7C(void *a1)
{
  sub_1BF44DD28();
  uint64_t v3 = (void **)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playerItem);
  OUTLINED_FUNCTION_9_18();
  objc_super v4 = *v3;
  *uint64_t v3 = a1;
  id v5 = a1;

  sub_1BF44DDCC();
}

id sub_1BF44DEE4()
{
  OUTLINED_FUNCTION_1_5();
  id result = *v0;
  if (*v0) {
    return objc_msgSend(result, sel_asset);
  }
  return result;
}

uint64_t sub_1BF44DF30()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94B20);
  MEMORY[0x1F4188790](v2 - 8);
  objc_super v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1BF465DF8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA148870);
  MEMORY[0x1F4188790](v9 - 8);
  char v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for VideoPlaybackFailure(0);
  MEMORY[0x1F4188790](v12);
  int v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_failure;
  swift_beginAccess();
  sub_1BF452C84(v15, (uint64_t)v11, &qword_1EA148870);
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12) == 1) {
    return sub_1BF3DDEA8((uint64_t)v11, &qword_1EA148870);
  }
  sub_1BF452CE4((uint64_t)v11, (uint64_t)v14);
  if (qword_1EA1476B0 != -1) {
    swift_once();
  }
  uint64_t v17 = __swift_project_value_buffer(v5, (uint64_t)qword_1EA150C68);
  uint64_t v28 = v6;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v17, v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
  sub_1BF465478();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BF4756B0;
  sub_1BF4653A8();
  *((void *)&v30 + 1) = v12;
  boxed_opaque_existential_2Tm = __swift_allocate_boxed_opaque_existential_2Tm((uint64_t *)&v29);
  sub_1BF452D48((uint64_t)v14, (uint64_t)boxed_opaque_existential_2Tm);
  sub_1BF465438();
  sub_1BF3DDEA8((uint64_t)&v29, &qword_1EBA96600);
  sub_1BF4653A8();
  uint64_t v19 = v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_videoUrl;
  swift_beginAccess();
  sub_1BF452C84(v19, (uint64_t)v4, &qword_1EBA94B20);
  uint64_t v20 = sub_1BF464E58();
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v20) == 1)
  {
    sub_1BF3DDEA8((uint64_t)v4, &qword_1EBA94B20);
    long long v29 = 0u;
    long long v30 = 0u;
  }
  else
  {
    *((void *)&v30 + 1) = v20;
    char v21 = __swift_allocate_boxed_opaque_existential_2Tm((uint64_t *)&v29);
    (*(void (**)(uint64_t *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v21, v4, v20);
  }
  sub_1BF4653C8();
  sub_1BF3DDEA8((uint64_t)&v29, &qword_1EBA96600);
  sub_1BF465C78();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v8, v5);
  uint64_t v22 = v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_delegate;
  swift_beginAccess();
  uint64_t result = MEMORY[0x1C18AAE10](v22);
  if (result)
  {
    uint64_t v23 = *(void *)(v22 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(char *, uint64_t, uint64_t))(v23 + 56))(v14, ObjectType, v23);
    uint64_t result = swift_unknownObjectRelease();
  }
  uint64_t v25 = *(void *)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_failureCount);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_failureCount) = v27;
    sub_1BF44E49C();
    return sub_1BF4524AC((uint64_t)v14);
  }
  return result;
}

uint64_t sub_1BF44E42C(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_failure;
  OUTLINED_FUNCTION_15_3();
  sub_1BF452C1C(a1, v3);
  swift_endAccess();
  sub_1BF44DF30();
  return sub_1BF3DDEA8(a1, &qword_1EA148870);
}

void sub_1BF44E49C()
{
  if ((unint64_t)(*(void *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_failureCount) - 3) >= 0xFFFFFFFFFFFFFFFELL)
  {
    VideoPlayer.releaseAssets()();
    VideoPlayer.startPreloading()();
  }
}

uint64_t sub_1BF44E4E4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1BF465188();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = &v20[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_1BF4651C8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = &v20[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playbackChecks) == 1
    && *(unsigned char *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playbackChecks + 1) != 0
    && *(unsigned char *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playbackChecks + 2) != 0)
  {
    uint64_t v12 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_state);
    swift_beginAccess();
    int v13 = *v12;
    if (v13 == 6 || v13 == 1) {
      sub_1BF44DBB4(2u);
    }
  }
  uint64_t v15 = (unsigned char *)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_shouldBePlaying);
  uint64_t result = swift_beginAccess();
  if (*v15 == 1)
  {
    sub_1BF3A9E60(0, (unint64_t *)&qword_1EBA96560);
    uint64_t v17 = (void *)sub_1BF466458();
    uint64_t v18 = swift_allocObject();
    swift_unknownObjectWeakInit();
    aBlock[4] = sub_1BF452DAC;
    aBlock[5] = v18;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1BF3AC814;
    aBlock[3] = &block_descriptor_54_0;
    uint64_t v19 = _Block_copy(aBlock);
    swift_release();
    sub_1BF4651A8();
    aBlock[0] = MEMORY[0x1E4FBC860];
    sub_1BF452BD4((unint64_t *)&qword_1EBA963D0, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA964D8);
    sub_1BF3AC870();
    sub_1BF466608();
    MEMORY[0x1C18A9C40](0, v9, v5, v19);
    _Block_release(v19);

    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return result;
}

void sub_1BF44E834(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = (void *)MEMORY[0x1C18AAE10](v1);
  if (v2)
  {
    uint64_t v3 = v2;
    objc_msgSend(v2, sel_play);
  }
}

uint64_t VideoPlayer.isPlaying.getter()
{
  OUTLINED_FUNCTION_1_5();
  if (*v0 == 7) {
    return 0;
  }
  objc_msgSend(v1, sel_rate);
  if (v2 <= 0.0) {
    return 0;
  }
  id v3 = objc_msgSend(v1, sel_error);
  if (v3)
  {

    return 0;
  }
  return 1;
}

uint64_t VideoPlayer.shouldBePlaying.getter()
{
  OUTLINED_FUNCTION_1_5();
  return *v0;
}

uint64_t VideoPlayer.shouldBePlaying.setter(char a1)
{
  uint64_t result = OUTLINED_FUNCTION_1_21();
  unsigned char *v1 = a1;
  return result;
}

uint64_t (*VideoPlayer.shouldBePlaying.modify())()
{
  return j__swift_endAccess;
}

uint64_t VideoPlayer.shouldLoopPlayback.getter()
{
  OUTLINED_FUNCTION_1_5();
  return *v0;
}

uint64_t VideoPlayer.shouldLoopPlayback.setter(char a1)
{
  uint64_t result = OUTLINED_FUNCTION_1_21();
  unsigned char *v1 = a1;
  return result;
}

uint64_t (*VideoPlayer.shouldLoopPlayback.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BF44EA78()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_lastPlaybackTimeGuard);
  objc_msgSend(v1, sel_lock);
  objc_msgSend(v1, sel_unlock);
  return OUTLINED_FUNCTION_56();
}

id sub_1BF44EAF4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v9 = *(void **)(v4 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_lastPlaybackTimeGuard);
  objc_msgSend(v9, sel_lock);
  uint64_t v10 = v4 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_lastPlaybackTimeUnsynchronized;
  *(void *)uint64_t v10 = a1;
  *(void *)(v10 + 8) = a2;
  *(void *)(v10 + 16) = a3;
  *(unsigned char *)(v10 + 24) = a4 & 1;

  return objc_msgSend(v9, sel_unlock);
}

uint64_t VideoPlayer.delegate.getter()
{
  OUTLINED_FUNCTION_1_5();
  return MEMORY[0x1C18AAE10](v0);
}

uint64_t VideoPlayer.delegate.setter(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1_21();
  *(void *)(v2 + 8) = a2;
  OUTLINED_FUNCTION_56();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*VideoPlayer.delegate.modify(void *a1))(uint64_t a1, char a2)
{
  id v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_delegate;
  v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_15_3();
  uint64_t v6 = MEMORY[0x1C18AAE10](v5);
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_1BF44EC90;
}

void sub_1BF44EC90(uint64_t a1, char a2)
{
  id v3 = *(void **)a1;
  *(void *)(*(void *)(*(void *)a1 + 40) + *(void *)(*(void *)a1 + 48) + 8) = *(void *)(*(void *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }

  free(v3);
}

char *VideoPlayer.__allocating_init(with:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return VideoPlayer.init(with:)(a1);
}

char *VideoPlayer.init(with:)(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94B20);
  uint64_t v4 = OUTLINED_FUNCTION_44(v3);
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_1_8();
  uint64_t v7 = v6 - v5;
  v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_state] = 0;
  uint64_t v8 = (uint64_t)&v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_videoUrl];
  uint64_t v9 = sub_1BF464E58();
  __swift_storeEnumTagSinglePayload(v8, 1, 1, v9);
  uint64_t v10 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_videoObserver;
  id v11 = objc_allocWithZone((Class)type metadata accessor for VideoObserver());
  uint64_t v12 = v1;
  *(void *)&v1[v10] = objc_msgSend(v11, sel_init);
  *(void *)&v12[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playerItem] = 0;
  uint64_t v13 = (uint64_t)&v12[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_failure];
  uint64_t v14 = type metadata accessor for VideoPlaybackFailure(0);
  __swift_storeEnumTagSinglePayload(v13, 1, 1, v14);
  *(void *)&v12[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_failureCount] = 0;
  uint64_t v15 = &v12[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playbackChecks];
  *(_WORD *)uint64_t v15 = 0;
  v15[2] = 0;
  v12[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_shouldBePlaying] = 0;
  v12[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_shouldLoopPlayback] = 0;
  uint64_t v16 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_lastPlaybackTimeGuard;
  *(void *)&v12[v16] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F71960]), sel_init);
  uint64_t v17 = &v12[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_lastPlaybackTimeUnsynchronized];
  *(void *)uint64_t v17 = 0;
  *((void *)v17 + 1) = 0;
  *((void *)v17 + 2) = 0;
  unsigned char v17[24] = 1;
  *(void *)&v12[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v18 = *(void *)(v9 - 8);
  OUTLINED_FUNCTION_13_15();
  v19();
  __swift_storeEnumTagSinglePayload(v7, 0, 1, v9);
  OUTLINED_FUNCTION_15_3();
  sub_1BF4148F0(v7, v8);
  swift_endAccess();

  v23.receiver = v12;
  v23.super_class = (Class)type metadata accessor for VideoPlayer(0);
  uint64_t v20 = (char *)objc_msgSendSuper2(&v23, sel_init);
  objc_msgSend(v20, sel_setPreventsDisplaySleepDuringVideoPlayback_, 0);
  objc_msgSend(v20, sel_setMuted_, 1);
  objc_msgSend(v20, sel_setActionAtItemEnd_, 1);
  *(void *)(*(void *)&v20[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_videoObserver]
            + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_delegate
            + 8) = &off_1F1AB27A0;
  swift_unknownObjectWeakAssign();
  char v21 = v20;
  sub_1BF449F84();

  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(a1, v9);
  return v21;
}

uint64_t type metadata accessor for VideoPlaybackFailure(uint64_t a1)
{
  return sub_1BF4248DC(a1, (uint64_t *)&unk_1EA148878);
}

uint64_t type metadata accessor for VideoPlayer(uint64_t a1)
{
  return sub_1BF4248DC(a1, (uint64_t *)&unk_1EA148888);
}

id VideoPlayer.__deallocating_deinit()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_videoObserver;
  uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_videoObserver];
  uint64_t v4 = (id *)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playerItem];
  OUTLINED_FUNCTION_3_5();
  id v5 = *v4;
  id v6 = v3;
  sub_1BF44A238();

  id v7 = *(id *)&v1[v2];
  sub_1BF449FEC();

  id v8 = *(id *)&v1[v2];
  sub_1BF44A9A0(v1);

  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for VideoPlayer(0);
  return objc_msgSendSuper2(&v10, sel_dealloc);
}

Swift::Void __swiftcall VideoPlayer.play()()
{
  uint64_t v1 = v0;
  uint64_t v2 = &v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_shouldBePlaying];
  OUTLINED_FUNCTION_9_18();
  *uint64_t v2 = 1;
  if ((VideoPlayer.isPlaying.getter() & 1) == 0)
  {
    uint64_t v3 = &v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_state];
    OUTLINED_FUNCTION_3_5();
    if (*v3)
    {
      uint64_t v4 = (id *)&v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playerItem];
      OUTLINED_FUNCTION_3_5();
      if (*v4)
      {
        id v5 = *v4;
        id v6 = objc_msgSend(v1, sel_currentItem);

        if (!v6)
        {
          sub_1BF449F84();
          objc_msgSend(v1, sel_replaceCurrentItemWithPlayerItem_, v5);
        }
        id v7 = &v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playbackChecks];
        if (v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playbackChecks] == 1
          && (v7[1] & 1) != 0
          && (v7[2] & 1) != 0)
        {
          v8.receiver = v1;
          v8.super_class = (Class)type metadata accessor for VideoPlayer(0);
          objc_msgSendSuper2(&v8, sel_play);
        }
      }
    }
    else
    {
      VideoPlayer.startPreloading()();
    }
  }
}

Swift::Void __swiftcall VideoPlayer.pause()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VideoPlayer(0);
  objc_msgSendSuper2(&v2, sel_pause);
  uint64_t v1 = &v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_shouldBePlaying];
  OUTLINED_FUNCTION_9_18();
  char *v1 = 0;
}

Swift::Void __swiftcall VideoPlayer.restart()()
{
  if (*((unsigned char *)v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playbackChecks) == 1
    && *((unsigned char *)v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playbackChecks + 1) != 0
    && *((unsigned char *)v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playbackChecks + 2) != 0)
  {
    uint64_t v3 = MEMORY[0x1E4F1FA48];
    uint64_t v4 = *MEMORY[0x1E4F1FA48];
    uint64_t v5 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    v7.receiver = v0;
    v7.super_class = (Class)type metadata accessor for VideoPlayer(0);
    v6[0] = v4;
    v6[1] = *(void *)(v3 + 8);
    void v6[2] = v5;
    objc_msgSendSuper2(&v7, sel_seekToTime_, v6);
  }
}

Swift::Void __swiftcall VideoPlayer.startPreloading()()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94B20);
  uint64_t v3 = OUTLINED_FUNCTION_44(v2);
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_1_8();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = sub_1BF464E58();
  OUTLINED_FUNCTION_0_0();
  uint64_t v9 = v8;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_1_8();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_videoUrl;
  OUTLINED_FUNCTION_3_5();
  sub_1BF452C84(v14, v6, &qword_1EBA94B20);
  if (__swift_getEnumTagSinglePayload(v6, 1, v7) == 1)
  {
    sub_1BF3DDEA8(v6, &qword_1EBA94B20);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(v13, v6, v7);
    uint64_t v15 = (unsigned char *)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_state);
    OUTLINED_FUNCTION_3_5();
    if (*v15)
    {
      uint64_t v16 = OUTLINED_FUNCTION_10_17();
      v17(v16);
    }
    else
    {
      id v18 = sub_1BF44DEE4();
      objc_msgSend(v18, sel_cancelLoading);

      sub_1BF44DBB4(1u);
      uint64_t v19 = v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_delegate;
      OUTLINED_FUNCTION_3_5();
      if (MEMORY[0x1C18AAE10](v19))
      {
        uint64_t v20 = *(void *)(v19 + 8);
        uint64_t ObjectType = swift_getObjectType();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 32))(v1, ObjectType, v20);
        swift_unknownObjectRelease();
      }
      sub_1BF3A9E60(0, &qword_1EA148868);
      sub_1BF3CE600(v13);
      swift_allocObject();
      swift_unknownObjectWeakInit();
      swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v22 = sub_1BF3A9E60(0, (unint64_t *)&qword_1EBA96560);
      swift_retain();
      uint64_t v23 = sub_1BF466458();
      v26[3] = v22;
      v26[4] = MEMORY[0x1E4F71860];
      v26[0] = v23;
      sub_1BF465D18();
      swift_release();
      swift_release();
      swift_release();
      __swift_destroy_boxed_opaque_existential_2((uint64_t)v26);
      uint64_t v24 = OUTLINED_FUNCTION_10_17();
      v25(v24);
      swift_release();
    }
  }
}

uint64_t sub_1BF44F7C4()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1BF44F7FC(void **a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a2 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x1C18AAE10](v3);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    sub_1BF44F958(v2);
  }
}

void sub_1BF44F858(void **a1)
{
  sub_1BF44F7FC(a1, v1);
}

void sub_1BF44F860(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA148870);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (uint64_t *)((char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x1C18AAE10](a2 + 16);
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    *uint64_t v5 = sub_1BF464D78();
    uint64_t v8 = type metadata accessor for VideoPlaybackFailure(0);
    swift_storeEnumTagMultiPayload();
    __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v8);
    sub_1BF44E42C(v5);
  }
}

void sub_1BF44F950(uint64_t a1)
{
  sub_1BF44F860(a1, v1);
}

void sub_1BF44F958(void *a1)
{
  if (qword_1EA1476A0 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)sub_1BF466128();
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = a1;
  v7[4] = sub_1BF452ACC;
  v7[5] = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 1107296256;
  v7[2] = sub_1BF3AC814;
  v7[3] = &block_descriptor_18;
  uint64_t v5 = _Block_copy(v7);
  id v6 = a1;
  swift_release();
  objc_msgSend(v6, sel_loadValuesAsynchronouslyForKeys_completionHandler_, v2, v5);
  _Block_release(v5);
}

void sub_1BF44FAAC(uint64_t a1, void *a2)
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  uint64_t v108 = sub_1BF465188();
  uint64_t v106 = *(void *)(v108 - 8);
  MEMORY[0x1F4188790](v108);
  uint64_t v104 = (char *)&v95 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1BF4651C8();
  uint64_t v105 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  unint64_t v103 = (char *)&v95 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = sub_1BF465DF8();
  uint64_t v101 = *(void *)(v102 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v102);
  uint64_t v99 = (char *)&v95 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v100 = (char *)&v95 - v9;
  uint64_t v10 = sub_1BF464E58();
  uint64_t v107 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v95 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1488A0);
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)&v95 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94B20);
  uint64_t v17 = MEMORY[0x1F4188790](v16 - 8);
  uint64_t v98 = (uint64_t)&v95 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x1F4188790](v17);
  char v21 = (char *)&v95 - v20;
  uint64_t v22 = MEMORY[0x1F4188790](v19);
  uint64_t v24 = (char *)&v95 - v23;
  MEMORY[0x1F4188790](v22);
  BOOL v26 = (char *)&v95 - v25;
  swift_beginAccess();
  uint64_t v27 = MEMORY[0x1C18AAE10](a1 + 16);
  if (!v27) {
    return;
  }
  uint64_t v28 = v27;
  uint64_t v97 = v5;
  id v110 = a2;
  id v29 = objc_msgSend(a2, sel_URL);
  uint64_t v109 = (void *)v28;
  id v30 = v29;
  sub_1BF464E08();

  uint64_t v31 = v109;
  __swift_storeEnumTagSinglePayload((uint64_t)v26, 0, 1, v10);
  uint64_t v32 = (uint64_t)v31 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_videoUrl;
  swift_beginAccess();
  sub_1BF452C84(v32, (uint64_t)v24, &qword_1EBA94B20);
  uint64_t v33 = (uint64_t)&v15[*(int *)(v13 + 48)];
  sub_1BF452C84((uint64_t)v26, (uint64_t)v15, &qword_1EBA94B20);
  sub_1BF452C84((uint64_t)v24, v33, &qword_1EBA94B20);
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v10) == 1)
  {
    sub_1BF3DDEA8((uint64_t)v24, &qword_1EBA94B20);
    sub_1BF3DDEA8((uint64_t)v26, &qword_1EBA94B20);
    if (__swift_getEnumTagSinglePayload(v33, 1, v10) == 1)
    {
      sub_1BF3DDEA8((uint64_t)v15, &qword_1EBA94B20);
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  sub_1BF452C84((uint64_t)v15, (uint64_t)v21, &qword_1EBA94B20);
  if (__swift_getEnumTagSinglePayload(v33, 1, v10) == 1)
  {
    sub_1BF3DDEA8((uint64_t)v24, &qword_1EBA94B20);
    sub_1BF3DDEA8((uint64_t)v26, &qword_1EBA94B20);
    (*(void (**)(char *, uint64_t))(v107 + 8))(v21, v10);
    uint64_t v31 = v109;
LABEL_7:
    sub_1BF3DDEA8((uint64_t)v15, &qword_1EA1488A0);
LABEL_8:

    return;
  }
  uint64_t v34 = v107;
  (*(void (**)(char *, uint64_t, uint64_t))(v107 + 32))(v12, v33, v10);
  sub_1BF452BD4(&qword_1EA1488A8, MEMORY[0x1E4F276F0]);
  char v35 = sub_1BF465F68();
  uint64_t v36 = *(void (**)(char *, uint64_t))(v34 + 8);
  v36(v12, v10);
  sub_1BF3DDEA8((uint64_t)v24, &qword_1EBA94B20);
  sub_1BF3DDEA8((uint64_t)v26, &qword_1EBA94B20);
  v36(v21, v10);
  sub_1BF3DDEA8((uint64_t)v15, &qword_1EBA94B20);
  uint64_t v31 = v109;
  if ((v35 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_10:
  uint64_t v96 = v32;
  if (qword_1EA1476A0 != -1) {
    swift_once();
  }
  uint64_t v37 = *((void *)off_1EA148818 + 2);
  uint64_t v38 = v108;
  if (v37)
  {
    uint64_t v95 = swift_bridgeObjectRetain();
    uint64_t v39 = (uint64_t *)(v95 + 40);
    while (1)
    {
      uint64_t v41 = *(v39 - 1);
      uint64_t v40 = *v39;
      uint64_t v42 = swift_allocObject();
      *(void *)(v42 + 16) = 0;
      swift_bridgeObjectRetain();
      uint64_t v43 = (void *)sub_1BF465F78();
      *(void *)&long long aBlock = *(void *)(v42 + 16);
      id v44 = objc_msgSend(v110, sel_statusOfValueForKey_error_, v43, &aBlock, v95, v96);

      long long v45 = (void *)aBlock;
      long long v46 = *(void **)(v42 + 16);
      *(void *)(v42 + 16) = aBlock;
      id v47 = v45;

      if (v44 == (id)3) {
        break;
      }
      v39 += 2;
      swift_bridgeObjectRelease();
      swift_release();
      if (!--v37)
      {
        swift_bridgeObjectRelease();
        uint64_t v38 = v108;
        goto LABEL_17;
      }
    }
    swift_bridgeObjectRelease();
    if (qword_1EA1476B0 != -1) {
      swift_once();
    }
    uint64_t v73 = v102;
    uint64_t v74 = __swift_project_value_buffer(v102, (uint64_t)qword_1EA150C68);
    uint64_t v75 = v101;
    (*(void (**)(char *, uint64_t, uint64_t))(v101 + 16))(v100, v74, v73);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
    sub_1BF465478();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BF474840;
    sub_1BF4653A8();
    *((void *)&v112 + 1) = MEMORY[0x1E4FBB1A0];
    *(void *)&long long aBlock = v41;
    *((void *)&aBlock + 1) = v40;
    swift_bridgeObjectRetain();
    sub_1BF465438();
    sub_1BF3DDEA8((uint64_t)&aBlock, &qword_1EBA96600);
    uint64_t v76 = *(void **)(v42 + 16);
    uint64_t v77 = v108;
    if (v76)
    {
      *((void *)&v112 + 1) = sub_1BF3A9E60(0, &qword_1EA148800);
      *(void *)&long long aBlock = v76;
    }
    else
    {
      long long aBlock = 0u;
      long long v112 = 0u;
    }
    id v86 = v76;
    sub_1BF465468();
    sub_1BF3DDEA8((uint64_t)&aBlock, &qword_1EBA96600);
    uint64_t v87 = v100;
    sub_1BF465C78();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v75 + 8))(v87, v73);
    sub_1BF3A9E60(0, (unint64_t *)&qword_1EBA96560);
    int v88 = (void *)sub_1BF466458();
    uint64_t v89 = (void *)swift_allocObject();
    int v90 = v109;
    v89[2] = v109;
    v89[3] = v41;
    v89[4] = v40;
    v89[5] = v42;
    uint64_t v113 = sub_1BF452BC8;
    uint64_t v114 = v89;
    *(void *)&long long aBlock = MEMORY[0x1E4F143A8];
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v112 = sub_1BF3AC814;
    *((void *)&v112 + 1) = &block_descriptor_50;
    uint64_t v91 = _Block_copy(&aBlock);
    id v92 = v90;
    swift_retain();
    swift_release();
    double v93 = v103;
    sub_1BF4651A8();
    *(void *)&long long aBlock = MEMORY[0x1E4FBC860];
    sub_1BF452BD4((unint64_t *)&qword_1EBA963D0, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA964D8);
    sub_1BF3AC870();
    char v94 = v104;
    sub_1BF466608();
    MEMORY[0x1C18A9C40](0, v93, v94, v91);
    _Block_release(v91);

    (*(void (**)(char *, uint64_t))(v106 + 8))(v94, v77);
    (*(void (**)(char *, uint64_t))(v105 + 8))(v93, v97);
    swift_release();
  }
  else
  {
LABEL_17:
    id v48 = v110;
    if (objc_msgSend(v110, sel_isPlayable))
    {
      id v49 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F16620]), sel_initWithAsset_, v48);
      objc_msgSend(v49, sel_setPreferredForwardBufferDuration_, 5.0);
      uint64_t v50 = v109;
      uint64_t v51 = sub_1BF44EA78();
      if ((v54 & 1) == 0)
      {
        uint64_t v55 = v51;
        unsigned int v56 = v52;
        uint64_t v57 = v53;
        unint64_t v58 = HIDWORD(v52);
        uint64_t v113 = (uint64_t (*)())CGSizeMake;
        uint64_t v114 = 0;
        *(void *)&long long aBlock = MEMORY[0x1E4F143A8];
        *((void *)&aBlock + 1) = 1107296256;
        *(void *)&long long v112 = sub_1BF44622C;
        *((void *)&v112 + 1) = &block_descriptor_44_1;
        uint64_t v59 = _Block_copy(&aBlock);
        *(void *)&long long aBlock = v55;
        *((void *)&aBlock + 1) = __PAIR64__(v58, v56);
        *(void *)&long long v112 = v57;
        objc_msgSend(v49, sel_seekToTime_completionHandler_, &aBlock, v59);
        _Block_release(v59);
        sub_1BF44EAF4(0, 0, 0, 1);
      }
      sub_1BF3A9E60(0, (unint64_t *)&qword_1EBA96560);
      uint64_t v60 = (void *)sub_1BF466458();
      uint64_t v61 = (void *)swift_allocObject();
      v61[2] = v50;
      uint64_t v61[3] = v49;
      v61[4] = v48;
      uint64_t v113 = sub_1BF452B74;
      uint64_t v114 = v61;
      *(void *)&long long aBlock = MEMORY[0x1E4F143A8];
      *((void *)&aBlock + 1) = 1107296256;
      *(void *)&long long v112 = sub_1BF3AC814;
      *((void *)&v112 + 1) = &block_descriptor_41;
      uint64_t v62 = _Block_copy(&aBlock);
      id v63 = v50;
      id v64 = v49;
      id v65 = v48;
      swift_release();
      uint64_t v66 = v103;
      sub_1BF4651A8();
      *(void *)&long long aBlock = MEMORY[0x1E4FBC860];
      sub_1BF452BD4((unint64_t *)&qword_1EBA963D0, MEMORY[0x1E4FBCB00]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA964D8);
      sub_1BF3AC870();
      uint64_t v67 = v104;
      sub_1BF466608();
      MEMORY[0x1C18A9C40](0, v66, v67, v62);
      _Block_release(v62);

      (*(void (**)(char *, uint64_t))(v106 + 8))(v67, v38);
      (*(void (**)(char *, uint64_t))(v105 + 8))(v66, v97);
    }
    else
    {
      if (qword_1EA1476B0 != -1) {
        swift_once();
      }
      uint64_t v68 = v102;
      uint64_t v69 = __swift_project_value_buffer(v102, (uint64_t)qword_1EA150C68);
      uint64_t v70 = v101;
      uint64_t v71 = v99;
      (*(void (**)(char *, uint64_t, uint64_t))(v101 + 16))(v99, v69, v68);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
      sub_1BF465478();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BF474A50;
      sub_1BF4653A8();
      uint64_t v72 = v98;
      sub_1BF452C84(v96, v98, &qword_1EBA94B20);
      if (__swift_getEnumTagSinglePayload(v72, 1, v10) == 1)
      {
        sub_1BF3DDEA8(v72, &qword_1EBA94B20);
        long long aBlock = 0u;
        long long v112 = 0u;
      }
      else
      {
        *((void *)&v112 + 1) = v10;
        boxed_opaque_existential_2Tm = __swift_allocate_boxed_opaque_existential_2Tm((uint64_t *)&aBlock);
        (*(void (**)(uint64_t *, uint64_t, uint64_t))(v107 + 32))(boxed_opaque_existential_2Tm, v72, v10);
      }
      sub_1BF465468();
      sub_1BF3DDEA8((uint64_t)&aBlock, &qword_1EBA96600);
      sub_1BF465C78();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v70 + 8))(v71, v68);
      sub_1BF3A9E60(0, (unint64_t *)&qword_1EBA96560);
      uint64_t v79 = (void *)sub_1BF466458();
      uint64_t v80 = swift_allocObject();
      uint64_t v81 = v109;
      *(void *)(v80 + 16) = v109;
      uint64_t v113 = sub_1BF452B24;
      uint64_t v114 = (void *)v80;
      *(void *)&long long aBlock = MEMORY[0x1E4F143A8];
      *((void *)&aBlock + 1) = 1107296256;
      *(void *)&long long v112 = sub_1BF3AC814;
      *((void *)&v112 + 1) = &block_descriptor_35;
      BOOL v82 = _Block_copy(&aBlock);
      id v83 = v81;
      swift_release();
      int v84 = v103;
      sub_1BF4651A8();
      *(void *)&long long aBlock = MEMORY[0x1E4FBC860];
      sub_1BF452BD4((unint64_t *)&qword_1EBA963D0, MEMORY[0x1E4FBCB00]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA964D8);
      sub_1BF3AC870();
      uint64_t v85 = v104;
      sub_1BF466608();
      MEMORY[0x1C18A9C40](0, v84, v85, v82);
      _Block_release(v82);

      (*(void (**)(char *, uint64_t))(v106 + 8))(v85, v38);
      (*(void (**)(char *, uint64_t))(v105 + 8))(v84, v97);
    }
  }
}

uint64_t sub_1BF450BD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA148870);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (uint64_t *)((char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  uint64_t v10 = *(void **)(a4 + 16);
  *uint64_t v9 = a2;
  v9[1] = a3;
  v9[2] = v10;
  uint64_t v11 = type metadata accessor for VideoPlaybackFailure(0);
  swift_storeEnumTagMultiPayload();
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
  id v12 = v10;
  swift_bridgeObjectRetain();
  return sub_1BF44E42C(v9);
}

uint64_t sub_1BF450CC8()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA148870);
  MEMORY[0x1F4188790](v0 - 8);
  uint64_t v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for VideoPlaybackFailure(0);
  swift_storeEnumTagMultiPayload();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 0, 1, v3);
  return sub_1BF44E42C(v2);
}

uint64_t sub_1BF450D74(char *a1, void *a2, void *a3)
{
  id v6 = a2;
  sub_1BF44DE7C(a2);
  sub_1BF44A3E4(a3, a1);
  a1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playbackChecks] = 1;
  sub_1BF44E4E4();
  uint64_t v7 = &a1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_delegate];
  swift_beginAccess();
  uint64_t result = MEMORY[0x1C18AAE10](v7);
  if (result)
  {
    uint64_t v9 = *((void *)v7 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 40))(a1, ObjectType, v9);
    return swift_unknownObjectRelease();
  }
  return result;
}

Swift::Void __swiftcall VideoPlayer.releaseAssets()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA148870);
  uint64_t v2 = OUTLINED_FUNCTION_44(v1);
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_1_8();
  uint64_t v5 = v4 - v3;
  id v6 = (id *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playerItem);
  OUTLINED_FUNCTION_3_5();
  if (*v6)
  {
    uint64_t v7 = (OpaqueCMTimebase *)objc_msgSend(*v6, sel_timebase);
    if (v7)
    {
      uint64_t v8 = v7;
      CMTimebaseGetTime(&v13, v7);
      sub_1BF44EAF4(v13.value, *(uint64_t *)&v13.timescale, v13.epoch, 0);
    }
  }
  id v9 = sub_1BF44DEE4();
  objc_msgSend(v9, sel_cancelLoading);

  sub_1BF44DE7C(0);
  uint64_t v10 = v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playbackChecks;
  *(_WORD *)uint64_t v10 = 0;
  *(unsigned char *)(v10 + 2) = 0;
  sub_1BF44E4E4();
  uint64_t v11 = type metadata accessor for VideoPlaybackFailure(0);
  __swift_storeEnumTagSinglePayload(v5, 1, 1, v11);
  uint64_t v12 = sub_1BF44E42C(v5);
  *(void *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_failureCount) = 0;
  sub_1BF44E49C(v12);
  sub_1BF44DBB4(0);
}

void sub_1BF450F80(uint64_t a1)
{
  sub_1BF4529EC(a1, (uint64_t)v84);
  uint64_t v2 = v85;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94B20);
  uint64_t v4 = OUTLINED_FUNCTION_44(v3);
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v73 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  id v9 = (char *)&v73 - v8;
  uint64_t v10 = sub_1BF465DF8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v12 = v11;
  uint64_t v14 = MEMORY[0x1F4188790](v13);
  MEMORY[0x1F4188790](v14);
  uint64_t v16 = (char *)&v73 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA148870);
  uint64_t v18 = OUTLINED_FUNCTION_44(v17);
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_1_8();
  uint64_t v21 = v20 - v19;
  sub_1BF4529EC(a1, (uint64_t)&v86);
  uint64_t v22 = *(void *)&v86;
  switch(v92)
  {
    case 1:
      uint64_t v23 = v79;
      uint64_t v24 = &v79[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_state];
      OUTLINED_FUNCTION_3_5();
      int v25 = *v24;
      if (v25 != 5 && ((v22 & 1) == 0 || v25 != 7))
      {
        if (v22) {
          unsigned __int8 v26 = 3;
        }
        else {
          unsigned __int8 v26 = 6;
        }
        sub_1BF44DBB4(v26);
      }
      v23[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playbackChecks + 1] = v22;
      goto LABEL_13;
    case 2:
      int v75 = v87;
      uint64_t v73 = v88;
      uint64_t v27 = v91;
      uint64_t v74 = v90;
      uint64_t v28 = qword_1EA1476B0;
      uint64_t v77 = v89;
      swift_bridgeObjectRetain();
      uint64_t v78 = v27;
      swift_bridgeObjectRetain();
      if (v28 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v10, (uint64_t)qword_1EA150C68);
      OUTLINED_FUNCTION_13_15();
      v29();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
      uint64_t v30 = sub_1BF465478();
      OUTLINED_FUNCTION_0_2(v30);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BF47A750;
      sub_1BF4653A8();
      uint64_t v31 = &v79[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_videoUrl];
      OUTLINED_FUNCTION_3_5();
      uint64_t v76 = v31;
      sub_1BF452C84((uint64_t)v31, (uint64_t)v7, &qword_1EBA94B20);
      uint64_t v32 = sub_1BF464E58();
      if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v32) == 1)
      {
        sub_1BF3DDEA8((uint64_t)v7, &qword_1EBA94B20);
        OUTLINED_FUNCTION_15_7();
      }
      else
      {
        uint64_t v83 = v32;
        __swift_allocate_boxed_opaque_existential_2Tm(&v81);
        OUTLINED_FUNCTION_5_4();
        (*(void (**)(void))(v42 + 32))();
      }
      sub_1BF4653C8();
      sub_1BF3DDEA8((uint64_t)&v81, &qword_1EBA96600);
      sub_1BF4653A8();
      if (v75)
      {
        OUTLINED_FUNCTION_15_7();
      }
      else
      {
        uint64_t v83 = MEMORY[0x1E4FBB550];
        uint64_t v81 = v22;
      }
      sub_1BF465438();
      sub_1BF3DDEA8((uint64_t)&v81, &qword_1EBA96600);
      sub_1BF4653A8();
      uint64_t v43 = MEMORY[0x1E4FBB1A0];
      if (v77)
      {
        uint64_t v83 = MEMORY[0x1E4FBB1A0];
        uint64_t v81 = v73;
        uint64_t v82 = v77;
      }
      else
      {
        OUTLINED_FUNCTION_15_7();
      }
      sub_1BF465438();
      sub_1BF3DDEA8((uint64_t)&v81, &qword_1EBA96600);
      sub_1BF4653A8();
      if (v78)
      {
        uint64_t v83 = v43;
        uint64_t v81 = v74;
        uint64_t v82 = v78;
      }
      else
      {
        OUTLINED_FUNCTION_15_7();
      }
      sub_1BF465438();
      sub_1BF3DDEA8((uint64_t)&v81, &qword_1EBA96600);
      sub_1BF465C78();
      swift_bridgeObjectRelease();
      uint64_t v51 = OUTLINED_FUNCTION_56();
      v52(v51);
      sub_1BF452C84((uint64_t)v76, v21, &qword_1EBA94B20);
      uint64_t v53 = type metadata accessor for VideoPlaybackFailure(0);
      swift_storeEnumTagMultiPayload();
      __swift_storeEnumTagSinglePayload(v21, 0, 1, v53);
      sub_1BF44E42C(v21);
      return;
    case 3:
      double v33 = v86;
      uint64_t v34 = &v79[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_delegate];
      OUTLINED_FUNCTION_3_5();
      if (!MEMORY[0x1C18AAE10](v34)) {
        return;
      }
      uint64_t v35 = *((void *)v34 + 1);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, double))(v35 + 16))(ObjectType, v35, v33);
      goto LABEL_61;
    case 4:
      float v37 = *(float *)&v86;
      if (*(float *)&v86 == 0.0
        && (uint64_t v38 = &v79[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_state],
            OUTLINED_FUNCTION_3_5(),
            *v38 == 5))
      {
        unsigned __int8 v39 = 4;
      }
      else
      {
        if (v37 <= 0.0) {
          return;
        }
        unsigned __int8 v39 = 5;
      }
      sub_1BF44DBB4(v39);
      return;
    case 5:
      if (v90 | v91 | *(void *)&v86 | v89 | v88 | v87)
      {
        if (*(void *)&v86 != 1 || v90 | v91 | v89 | v88 | v87)
        {
          if (qword_1EA1476B0 != -1) {
            swift_once();
          }
          __swift_project_value_buffer(v10, (uint64_t)qword_1EA150C68);
          OUTLINED_FUNCTION_13_15();
          v62();
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
          uint64_t v63 = sub_1BF465478();
          OUTLINED_FUNCTION_0_2(v63);
          *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BF474A50;
          sub_1BF4653A8();
          id v64 = &v79[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_videoUrl];
          OUTLINED_FUNCTION_3_5();
          sub_1BF452C84((uint64_t)v64, (uint64_t)v9, &qword_1EBA94B20);
          uint64_t v65 = sub_1BF464E58();
          if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v65) == 1)
          {
            sub_1BF3DDEA8((uint64_t)v9, &qword_1EBA94B20);
            OUTLINED_FUNCTION_15_7();
          }
          else
          {
            uint64_t v83 = v65;
            __swift_allocate_boxed_opaque_existential_2Tm(&v81);
            OUTLINED_FUNCTION_5_4();
            (*(void (**)(void))(v69 + 32))();
          }
          sub_1BF4653C8();
          sub_1BF3DDEA8((uint64_t)&v81, &qword_1EBA96600);
          sub_1BF465C68();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v12 + 8))(v16, v10);
        }
        else
        {
          uint64_t v40 = v79;
          uint64_t v41 = &v79[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_shouldLoopPlayback];
          OUTLINED_FUNCTION_3_5();
          if (*v41 == 1)
          {
            OUTLINED_FUNCTION_6_22(sel_seekToTime_, MEMORY[0x1E4F1FA48]);
            objc_msgSend(v40, sel_play);
          }
          else
          {
            sub_1BF44DBB4(7u);
            objc_msgSend(v40, sel_pause);
            OUTLINED_FUNCTION_6_22(sel_seekToTime_, MEMORY[0x1E4F1FA48]);
          }
          uint64_t v66 = &v40[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_delegate];
          OUTLINED_FUNCTION_3_5();
          if (MEMORY[0x1C18AAE10](v66))
          {
            uint64_t v67 = *((void *)v66 + 1);
            uint64_t v68 = swift_getObjectType();
            (*(void (**)(char *, uint64_t, uint64_t))(v67 + 24))(v40, v68, v67);
            goto LABEL_61;
          }
        }
      }
      else
      {
        id v44 = v79;
        id v45 = objc_msgSend(v79, sel_currentItem);
        if (!v45) {
          return;
        }
        long long v46 = v45;
        id v47 = &v44[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_delegate];
        OUTLINED_FUNCTION_3_5();
        if (MEMORY[0x1C18AAE10](v47))
        {
          uint64_t v48 = *((void *)v47 + 1);
          uint64_t v49 = swift_getObjectType();
          objc_msgSend(v46, sel_currentTime);
          Float64 Seconds = CMTimeGetSeconds(&time);
          (*(void (**)(char *, uint64_t, uint64_t, Float64))(v48 + 48))(v44, v49, v48, Seconds);

LABEL_61:
          swift_unknownObjectRelease();
          return;
        }
      }
      return;
    default:
      if (*(void *)&v86 == 2)
      {
        char v54 = (void *)v87;
        if (!v87)
        {
          id v55 = v2;
LABEL_70:
          OUTLINED_FUNCTION_12_15();
          __swift_storeEnumTagSinglePayload(v21, 0, 1, (uint64_t)v54);
          id v72 = v55;
          sub_1BF44E42C(v21);
          uint64_t v71 = a1;
          goto LABEL_71;
        }
        sub_1BF452A48(a1, (void (*)(void, void, void, void, void, void, void))sub_1BF44CF2C);
        id v55 = v2;
        id v56 = objc_msgSend(v54, sel_domain);
        uint64_t v57 = sub_1BF465FA8();
        uint64_t v59 = v58;

        if (qword_1EA1476A8 != -1) {
          swift_once();
        }
        if (v57 == qword_1EA148820 && v59 == *(void *)algn_1EA148828)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          char v61 = sub_1BF466968();
          swift_bridgeObjectRelease();
          if ((v61 & 1) == 0)
          {
LABEL_69:
            sub_1BF452A48(a1, (void (*)(void, void, void, void, void, void, void))sub_1BF44CFA4);
            goto LABEL_70;
          }
        }
        if (objc_msgSend(v54, sel_code) == (id)-11839)
        {
          OUTLINED_FUNCTION_12_15();
          __swift_storeEnumTagSinglePayload(v21, 0, 1, (uint64_t)v54);
          id v70 = v55;
          sub_1BF44E42C(v21);
          sub_1BF452A48(a1, (void (*)(void, void, void, void, void, void, void))sub_1BF44CFA4);
          uint64_t v71 = a1;
LABEL_71:
          sub_1BF452A48(v71, (void (*)(void, void, void, void, void, void, void))sub_1BF44CFA4);
          return;
        }
        goto LABEL_69;
      }
      if (*(void *)&v86 == 1)
      {
        v79[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playbackChecks + 2] = 1;
LABEL_13:
        sub_1BF44E4E4();
      }
      return;
  }
}

id VideoPlayer.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void VideoPlayer.init()()
{
}

id VideoPlayer.__allocating_init(url:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  uint64_t v4 = (void *)sub_1BF464DE8();
  id v5 = objc_msgSend(v3, sel_initWithURL_, v4);

  sub_1BF464E58();
  OUTLINED_FUNCTION_5_4();
  (*(void (**)(uint64_t))(v6 + 8))(a1);
  return v5;
}

void VideoPlayer.init(url:)()
{
}

id VideoPlayer.__allocating_init(playerItem:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithPlayerItem_, a1);

  return v3;
}

void VideoPlayer.init(playerItem:)()
{
}

uint64_t sub_1BF451DDC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = VideoPlayer.state.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1BF451E08(unsigned __int8 *a1)
{
  return sub_1BF44DBB4(*a1);
}

void *sub_1BF451E30@<X0>(void *a1@<X8>)
{
  uint64_t result = VideoPlayer.playerItem.getter();
  *a1 = result;
  return result;
}

char *initializeBufferWithCopyOfBuffer for VideoPlaybackFailure(char *a1, char **a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *(void *)a1 = *a2;
    a1 = &v10[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v7 = a2[1];
        *(void *)a1 = *a2;
        *((void *)a1 + 1) = v7;
        uint64_t v8 = a2[2];
        *((void *)a1 + 2) = v8;
        swift_bridgeObjectRetain();
        id v9 = v8;
        goto LABEL_10;
      case 1u:
        uint64_t v11 = sub_1BF464E58();
        if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v11))
        {
          uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94B20);
          memcpy(a1, a2, *(void *)(*(void *)(v12 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char **, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
          __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v11);
        }
        goto LABEL_10;
      case 2u:
      case 3u:
        uint64_t v13 = *a2;
        *(void *)a1 = *a2;
        uint64_t v14 = v13;
LABEL_10:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(v6 + 64));
        break;
    }
  }
  return a1;
}

void destroy for VideoPlaybackFailure(void **a1)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      swift_bridgeObjectRelease();
      uint64_t v2 = a1[2];
      goto LABEL_4;
    case 1u:
      uint64_t v3 = sub_1BF464E58();
      if (!__swift_getEnumTagSinglePayload((uint64_t)a1, 1, v3))
      {
        uint64_t v4 = *(void (**)(void **, uint64_t))(*(void *)(v3 - 8) + 8);
        v4(a1, v3);
      }
      break;
    case 2u:
    case 3u:
      uint64_t v2 = *a1;
LABEL_4:

      break;
    default:
      return;
  }
}

void *initializeWithCopy for VideoPlaybackFailure(void *a1, void *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      uint64_t v7 = (void *)a2[2];
      a1[2] = v7;
      swift_bridgeObjectRetain();
      id v8 = v7;
      goto LABEL_8;
    case 1u:
      uint64_t v9 = sub_1BF464E58();
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v9))
      {
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94B20);
        memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v9);
      }
      goto LABEL_8;
    case 2u:
    case 3u:
      uint64_t v11 = (void *)*a2;
      *a1 = *a2;
      id v12 = v11;
LABEL_8:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

void *assignWithCopy for VideoPlaybackFailure(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1BF4524AC((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        *a1 = *a2;
        a1[1] = a2[1];
        uint64_t v6 = (void *)a2[2];
        a1[2] = v6;
        swift_bridgeObjectRetain();
        id v7 = v6;
        goto LABEL_9;
      case 1u:
        uint64_t v8 = sub_1BF464E58();
        if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v8))
        {
          uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94B20);
          memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
          __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v8);
        }
        goto LABEL_9;
      case 2u:
      case 3u:
        uint64_t v10 = (void *)*a2;
        *a1 = *a2;
        id v11 = v10;
LABEL_9:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_1BF4524AC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for VideoPlaybackFailure(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *initializeWithTake for VideoPlaybackFailure(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1BF464E58();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
    {
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94B20);
      memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for VideoPlaybackFailure(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1BF4524AC((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_1BF464E58();
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
      {
        uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94B20);
        memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_1BF45274C()
{
  return swift_storeEnumTagMultiPayload();
}

void sub_1BF45275C()
{
  sub_1BF452998(319, (unint64_t *)&qword_1EBA94B28, MEMORY[0x1E4F276F0]);
  if (v0 <= 0x3F) {
    swift_initEnumMetadataMultiPayload();
  }
}

uint64_t sub_1BF452818()
{
  return type metadata accessor for VideoPlayer(0);
}

void sub_1BF452834()
{
  sub_1BF452998(319, (unint64_t *)&qword_1EBA94B28, MEMORY[0x1E4F276F0]);
  if (v0 <= 0x3F)
  {
    sub_1BF452998(319, &qword_1EA148898, (void (*)(uint64_t))type metadata accessor for VideoPlaybackFailure);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_1BF452998(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1BF466588();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1BF4529EC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1BF452A48(uint64_t a1, void (*a2)(void, void, void, void, void, void, void))
{
  return a1;
}

uint64_t sub_1BF452A8C()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1BF452ACC()
{
  sub_1BF44FAAC(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t block_copy_helper_18(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_18()
{
  return swift_release();
}

uint64_t sub_1BF452AEC()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BF452B24()
{
  return sub_1BF450CC8();
}

uint64_t sub_1BF452B2C()
{
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1BF452B74()
{
  return sub_1BF450D74(*(char **)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_1BF452B80()
{
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1BF452BC8()
{
  return sub_1BF450BD8(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_1BF452BD4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1BF452C1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA148870);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BF452C84(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_5_4();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_1BF452CE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for VideoPlaybackFailure(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BF452D48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for VideoPlaybackFailure(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1BF452DAC()
{
  sub_1BF44E834(v0);
}

uint64_t sub_1BF452DB4()
{
  return MEMORY[0x1F4186498](v0, 25, 7);
}

uint64_t sub_1BF452DEC()
{
  return sub_1BF44DAE4(*(void *)(v0 + 16), *(unsigned __int8 *)(v0 + 24));
}

id OUTLINED_FUNCTION_6_22@<X0>(const char *a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)(v5 - 280) = v2;
  *(void *)(v5 - 272) = *(void *)(a2 + 8);
  *(void *)(v5 - 264) = v3;
  return objc_msgSend(v4, a1, v5 - 280);
}

uint64_t OUTLINED_FUNCTION_9_18()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_10_17()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_12_15()
{
  void *v1 = v0;
  type metadata accessor for VideoPlaybackFailure(0);
  return swift_storeEnumTagMultiPayload();
}

double OUTLINED_FUNCTION_15_7()
{
  double result = 0.0;
  *(_OWORD *)(v0 - 256) = 0u;
  *(_OWORD *)(v0 - 240) = 0u;
  return result;
}

BOOL static VideoPlayerState.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t VideoPlayerState.hash(into:)()
{
  return sub_1BF466A68();
}

uint64_t VideoPlayerState.hashValue.getter()
{
  return sub_1BF466A98();
}

BOOL sub_1BF452F68(char *a1, char *a2)
{
  return static VideoPlayerState.__derived_enum_equals(_:_:)(*a1, *a2);
}

uint64_t sub_1BF452F74()
{
  return VideoPlayerState.hashValue.getter();
}

uint64_t sub_1BF452F7C()
{
  return VideoPlayerState.hash(into:)();
}

unint64_t sub_1BF452F88()
{
  unint64_t result = qword_1EA1488B0;
  if (!qword_1EA1488B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1488B0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for VideoPlayerState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *unint64_t result = a2 + 7;
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
        JUMPOUT(0x1BF4530A0);
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
          *unint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VideoPlayerState()
{
  return &type metadata for VideoPlayerState;
}

uint64_t sub_1BF4530D8(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v2 = sub_1BF466638();
    uint64_t v4 = v3;
    char v5 = 1;
  }
  else
  {
    uint64_t v2 = sub_1BF45B64C(a1);
    uint64_t v4 = v6;
    char v5 = v7 & 1;
  }
  uint64_t v8 = sub_1BF45B380(a1);
  uint64_t v10 = v9;
  char v12 = v11 & 1;
  BOOL v13 = sub_1BF45B6CC(v2, v4, v5, v8, v9, v11 & 1);
  sub_1BF45B700(v8, v10, v12);
  if (v13)
  {
    sub_1BF45B700(v2, v4, v5);
    return 0;
  }
  else
  {
    sub_1BF45B3D4(v2, v4, v5, a1);
    uint64_t v14 = v15;
    sub_1BF45B700(v2, v4, v5);
  }
  return v14;
}

uint64_t VideoView.objectGraph.getter()
{
  return swift_weakLoadStrong();
}

uint64_t VideoView.objectGraph.setter()
{
  return swift_release();
}

uint64_t (*VideoView.objectGraph.modify(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_objectGraph;
  v3[4] = v1;
  v3[5] = v4;
  OUTLINED_FUNCTION_32_4();
  v3[3] = swift_weakLoadStrong();
  return sub_1BF4532D4;
}

id VideoView.previewFrameArtwork.getter()
{
  return OUTLINED_FUNCTION_28_5(OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_previewFrameArtwork);
}

uint64_t sub_1BF4532E4()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer);
  if (v1)
  {
    uint64_t v2 = v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_delegate;
    swift_beginAccess();
    *(void *)(v2 + 8) = 0;
    return swift_unknownObjectWeakAssign();
  }
  return result;
}

id sub_1BF45334C()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer;
  uint64_t v3 = *(void *)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer];
  if (v3)
  {
    uint64_t v4 = v3 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_delegate;
    swift_beginAccess();
    *(void *)(v4 + 8) = &protocol witness table for VideoView;
    swift_unknownObjectWeakAssign();
    uint64_t v5 = *(void *)&v1[v2];
    if (v5)
    {
      uint64_t v6 = &v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_configuration];
      swift_beginAccess();
      char v7 = v6[*(int *)(type metadata accessor for VideoConfiguration() + 40)];
      uint64_t v8 = (char *)(v5 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_shouldLoopPlayback);
      swift_beginAccess();
      *uint64_t v8 = v7;
    }
  }
  uint64_t v9 = *(void **)&v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController];
  if (v9) {
    objc_msgSend(v9, sel_setPlayer_, *(void *)&v1[v2]);
  }
  uint64_t v10 = &v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayerDelegate];
  id result = (id)MEMORY[0x1C18AAE10](&v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayerDelegate]);
  if (result)
  {
    uint64_t v12 = *((void *)v10 + 1);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v14 = *(void **)&v1[v2];
    uint64_t v15 = *(void (**)(void *, uint64_t, uint64_t))(v12 + 8);
    id v16 = v14;
    v15(v14, ObjectType, v12);

    id result = (id)swift_unknownObjectRelease();
  }
  uint64_t v17 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_unmuteAfterVideoPlayerCreation;
  if (v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_unmuteAfterVideoPlayerCreation] == 1)
  {
    objc_msgSend(v1, sel_updateAudioSessionCategoryWithIsAudioOn_, 1);
    id result = *(id *)&v1[v2];
    if (result) {
      id result = objc_msgSend(result, sel_setMuted_, 0);
    }
    v1[v17] = 0;
  }
  return result;
}

void sub_1BF453504(void *a1)
{
  sub_1BF4532E4();
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer);
  *(void *)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer) = a1;
  id v4 = a1;

  sub_1BF45334C();
}

id VideoView.backgroundColor.getter()
{
  v3.receiver = v0;
  v3.super_class = (Class)swift_getObjectType();
  id v1 = objc_msgSendSuper2(&v3, sel_backgroundColor);

  return v1;
}

void VideoView.backgroundColor.setter(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v4 = *(void **)&v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController];
  if (!v4) {
    goto LABEL_4;
  }
  id v5 = objc_msgSend(v4, sel_view);
  if (v5)
  {
    uint64_t v6 = v5;
    objc_msgSend(v5, sel_setBackgroundColor_, a1);

LABEL_4:
    v7.receiver = v1;
    v7.super_class = ObjectType;
    objc_msgSendSuper2(&v7, sel_setBackgroundColor_, a1);

    return;
  }
  __break(1u);
}

void (*VideoView.backgroundColor.modify(objc_super *a1))(uint64_t a1, char a2)
{
  a1[1].super_class = v1;
  uint64_t ObjectType = swift_getObjectType();
  a1->receiver = v1;
  a1->super_class = (Class)ObjectType;
  a1[1].receiver = [(objc_super *)a1 backgroundColor];
  return sub_1BF453760;
}

void sub_1BF453760(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (a2)
  {
    id v3 = v2;
    VideoView.backgroundColor.setter(v2);
  }
  else
  {
    VideoView.backgroundColor.setter(*(void **)(a1 + 16));
  }
}

id VideoView.frame.getter()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_frame);
}

id VideoView.frame.setter()
{
  OUTLINED_FUNCTION_10_1();
  uint64_t ObjectType = swift_getObjectType();
  double v1 = OUTLINED_FUNCTION_9_2();
  objc_msgSendSuper2(v2, v3, v1, v0, ObjectType);
  return sub_1BF453928();
}

id sub_1BF453928()
{
  double v1 = v0;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = sub_1BF465188();
  uint64_t v45 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  id v5 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_1BF4651C8();
  uint64_t v43 = *(void *)(v44 - 8);
  MEMORY[0x1F4188790](v44);
  objc_super v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1BF465198();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  char v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = &v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_isFullScreen];
  swift_beginAccess();
  if (*v12 != 1)
  {
LABEL_4:
    v51.receiver = v1;
    v51.super_class = ObjectType;
    objc_msgSendSuper2(&v51, sel_frame);
    double v24 = v23;
    double v26 = v25;
    id v27 = objc_msgSend(self, sel_mainScreen);
    objc_msgSend(v27, sel_scale);
    double v29 = v28;

    double v22 = v24 * v29;
    double v21 = v26 * v29;
    goto LABEL_6;
  }
  uint64_t v42 = v3;
  sub_1BF45B850((uint64_t)&v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_networkInquiry], (uint64_t)aBlock, &qword_1EA147DE8);
  BOOL v13 = v48;
  if (v48)
  {
    uint64_t v14 = v7;
    uint64_t v15 = v5;
    id v16 = ObjectType;
    uint64_t v17 = v49;
    __swift_project_boxed_opaque_existential_2(aBlock, (uint64_t)v48);
    uint64_t v18 = (uint64_t (*)(void *, char *(*)()))*((void *)v17 + 4);
    uint64_t v19 = v17;
    uint64_t ObjectType = v16;
    id v5 = v15;
    objc_super v7 = v14;
    char v20 = v18(v13, v19);
    __swift_destroy_boxed_opaque_existential_2((uint64_t)aBlock);
    double v21 = 0.0;
    double v22 = 0.0;
    uint64_t v3 = v42;
    if ((v20 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_4;
  }
  sub_1BF3E9E30((uint64_t)aBlock, &qword_1EA147DE8);
  double v21 = 0.0;
  double v22 = 0.0;
  uint64_t v3 = v42;
LABEL_6:
  uint64_t v30 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer;
  uint64_t v31 = *(void *)&v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer];
  if (!v31
    || (uint64_t v32 = (id *)(v31 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playerItem),
        swift_beginAccess(),
        !*v32)
    || ((id result = objc_msgSend(*v32, sel_preferredMaximumResolution), v35 == v22) ? (v36 = v34 == v21) : (v36 = 0), !v36))
  {
    sub_1BF3A9E60(0, (unint64_t *)&qword_1EBA96560);
    (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x1E4FBCB48], v8);
    float v37 = (void *)sub_1BF4664A8();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    uint64_t v38 = *(void **)&v1[v30];
    uint64_t v39 = swift_allocObject();
    *(void *)(v39 + 16) = v38;
    *(double *)(v39 + 24) = v22;
    *(double *)(v39 + 32) = v21;
    uint64_t v49 = sub_1BF45B8E0;
    uint64_t v50 = v39;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1BF3AC814;
    uint64_t v48 = &block_descriptor_66;
    uint64_t v40 = _Block_copy(aBlock);
    id v41 = v38;
    sub_1BF4651A8();
    uint64_t v46 = MEMORY[0x1E4FBC860];
    sub_1BF45B330((unint64_t *)&qword_1EBA963D0, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA964D8);
    sub_1BF3CEC60((unint64_t *)&qword_1EBA964E0, &qword_1EBA964D8);
    sub_1BF466608();
    MEMORY[0x1C18A9C40](0, v7, v5, v40);
    _Block_release(v40);

    (*(void (**)(char *, uint64_t))(v45 + 8))(v5, v3);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v7, v44);
    return (id)swift_release();
  }
  return result;
}

void (*VideoView.frame.modify(objc_super **a1))(double **a1, char a2)
{
  uint64_t v3 = (objc_super *)malloc(0x60uLL);
  *a1 = v3;
  v3[5].receiver = v1;
  uint64_t ObjectType = swift_getObjectType();
  v3[5].super_class = (Class)ObjectType;
  v3[2].receiver = v1;
  v3[2].super_class = (Class)ObjectType;
  objc_msgSendSuper2(v3 + 2, sel_frame);
  v3->receiver = v5;
  v3->super_class = v6;
  v3[1].receiver = v7;
  v3[1].super_class = v8;
  return sub_1BF453F08;
}

void sub_1BF453F08(double **a1, char a2)
{
  objc_super v2 = *a1;
  double v3 = **a1;
  double v4 = (*a1)[1];
  double v5 = (*a1)[2];
  double v6 = (*a1)[3];
  uint64_t v8 = (void *)*((void *)*a1 + 10);
  objc_super v7 = (objc_class *)*((void *)*a1 + 11);
  uint64_t v9 = (objc_super *)*a1;
  if (a2)
  {
    v9[3].receiver = v8;
    v9[3].super_class = v7;
    objc_msgSendSuper2(v9 + 3, sel_setFrame_, v3, v4, v5, v6);
  }
  else
  {
    v9[4].receiver = v8;
    v9[4].super_class = v7;
    objc_msgSendSuper2(v9 + 4, sel_setFrame_, v3, v4, v5, v6);
    sub_1BF453928();
  }

  free(v2);
}

void sub_1BF453F78()
{
  double v1 = v0;
  double v2 = sub_1BF4540E0();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = &v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_additionalControlInsets];
  double v10 = *(double *)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_additionalControlInsets];
  double v11 = *(double *)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_additionalControlInsets + 16];
  id v12 = objc_msgSend(v0, sel_traitCollection);
  char v13 = sub_1BF4664B8();

  uint64_t v14 = *(void **)&v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController];
  if (v14)
  {
    uint64_t v15 = 8;
    if (v13) {
      uint64_t v16 = 24;
    }
    else {
      uint64_t v16 = 8;
    }
    if ((v13 & 1) == 0) {
      uint64_t v15 = 24;
    }
    double v17 = v4 + *(double *)&v9[v16];
    double v18 = v8 + *(double *)&v9[v15];
    uint64_t v19 = self;
    id v20 = v14;
    id v21 = objc_msgSend(v19, sel_valueWithUIEdgeInsets_, v2 + v10, v17, v6 + v11, v18);
    objc_msgSend(v20, sel_setOverrideLayoutMarginsWhenEmbeddedInline_, v21);
  }
}

double sub_1BF4540E0()
{
  id v0 = objc_msgSend(self, sel_currentDevice);
  id v1 = objc_msgSend(v0, sel_userInterfaceIdiom);

  double result = 6.0;
  if (v1 == (id)1) {
    return 8.0;
  }
  return result;
}

void VideoView.__allocating_init(video:objectGraph:aspectRatio:contentSize:)()
{
  OUTLINED_FUNCTION_26_0();
  uint64_t v45 = v2;
  uint64_t v46 = v1;
  uint64_t v48 = v3;
  uint64_t v49 = v4;
  uint64_t v50 = v5;
  uint64_t v7 = v6;
  int v47 = v8 & 1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA1488E0);
  uint64_t v10 = OUTLINED_FUNCTION_44(v9);
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_32_3();
  uint64_t v44 = v11 - v12;
  MEMORY[0x1F4188790](v13);
  uint64_t v43 = (uint64_t)&v41 - v14;
  uint64_t v42 = sub_1BF464E58();
  OUTLINED_FUNCTION_0_0();
  uint64_t v16 = v15;
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_1_8();
  uint64_t v20 = v19 - v18;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA148770);
  uint64_t v22 = OUTLINED_FUNCTION_44(v21);
  MEMORY[0x1F4188790](v22);
  OUTLINED_FUNCTION_8_9();
  uint64_t v23 = type metadata accessor for VideoConfiguration();
  double v24 = (int *)(v23 - 8);
  MEMORY[0x1F4188790](v23);
  OUTLINED_FUNCTION_32_3();
  uint64_t v27 = v25 - v26;
  MEMORY[0x1F4188790](v28);
  uint64_t v30 = (char *)&v41 - v29;
  uint64_t v31 = sub_1BF465018();
  __swift_storeEnumTagSinglePayload(v0, 1, 1, v31);
  uint64_t v32 = (uint64_t)&v30[v24[7]];
  __swift_storeEnumTagSinglePayload(v32, 1, 1, v31);
  double v33 = &v30[v24[14]];
  *(void *)double v33 = 0;
  v33[8] = 1;
  *uint64_t v30 = 1;
  sub_1BF447A1C(v0, v32);
  uint64_t v34 = v24[8];
  uint64_t v35 = v24[9];
  uint64_t v36 = v24[10];
  uint64_t v37 = v24[11];
  uint64_t v38 = v24[12];
  v30[v24[13]] = 0;
  *(void *)double v33 = 0;
  v33[8] = 1;
  v30[v37] = *(unsigned char *)(v7 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_allowsAutoPlay);
  v30[v38] = *(unsigned char *)(v7 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_looping);
  *(void *)&v30[v35] = *(void *)(v7 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_autoPlayPlaybackControls);
  v30[v36] = *(unsigned char *)(v7 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_canPlayFullScreen);
  *(void *)&v30[v34] = *(void *)(v7 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_playbackControls);
  sub_1BF454518(v50, v32);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v20, v7 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_videoUrl, v42);
  sub_1BF4598A8((uint64_t)v30, v27, (void (*)(void))type metadata accessor for VideoConfiguration);
  sub_1BF45B850(v7 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_templateMediaEvent, v43, (uint64_t *)&unk_1EA1488E0);
  sub_1BF45B850(v7 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_templateClickEvent, v44, (uint64_t *)&unk_1EA1488E0);
  swift_bridgeObjectRetain();
  swift_retain();
  VideoView.__allocating_init(playbackId:url:configuration:templateMediaEvent:templateClickEvent:asPartOf:)();
  *(void *)&v39[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_video] = v7;
  uint64_t v40 = v39;
  swift_retain();
  swift_release();
  VideoView.apply(video:withContentSize:)(v7, v48, v49, v47);
  swift_release();
  swift_release();

  sub_1BF3E9E30(v50, &qword_1EA148770);
  sub_1BF4598FC((uint64_t)v30, (void (*)(void))type metadata accessor for VideoConfiguration);
  OUTLINED_FUNCTION_29_0();
}

uint64_t sub_1BF454518(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA148770);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

void VideoView.__allocating_init(playbackId:url:configuration:templateMediaEvent:templateClickEvent:asPartOf:)()
{
  OUTLINED_FUNCTION_26_0();
  uint64_t v38 = v2;
  Class v39 = v0;
  uint64_t v41 = v3;
  uint64_t v42 = v4;
  uint64_t v36 = v5;
  uint64_t v37 = v6;
  uint64_t v8 = v7;
  uint64_t v35 = v7;
  uint64_t v40 = v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA1488E0);
  uint64_t v11 = OUTLINED_FUNCTION_44(v10);
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_32_3();
  uint64_t v14 = v12 - v13;
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (char *)&v34 - v16;
  uint64_t v18 = type metadata accessor for VideoConfiguration();
  uint64_t v19 = OUTLINED_FUNCTION_44(v18);
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_1_8();
  uint64_t v22 = v21 - v20;
  uint64_t v23 = sub_1BF464E58();
  OUTLINED_FUNCTION_0_0();
  uint64_t v25 = v24;
  MEMORY[0x1F4188790](v26);
  OUTLINED_FUNCTION_24_0();
  uint64_t v27 = OUTLINED_FUNCTION_0_7();
  v28(v27);
  sub_1BF4598A8(v8, v22, (void (*)(void))type metadata accessor for VideoConfiguration);
  uint64_t v29 = v37;
  sub_1BF45B850(v37, (uint64_t)v17, (uint64_t *)&unk_1EA1488E0);
  uint64_t v30 = v38;
  sub_1BF45B850(v38, v14, (uint64_t *)&unk_1EA1488E0);
  uint64_t v31 = type metadata accessor for NWPathNetworkInquiry();
  id v32 = sub_1BF434394();
  v43[3] = v31;
  v43[4] = &off_1F1AB19B0;
  v43[0] = v32;
  id v33 = objc_allocWithZone(v39);
  sub_1BF4548F4(v40, v41, v1, v22, (uint64_t)v17, v14, (uint64_t)v43);
  sub_1BF3E9E30(v30, (uint64_t *)&unk_1EA1488E0);
  sub_1BF3E9E30(v29, (uint64_t *)&unk_1EA1488E0);
  sub_1BF4598FC(v35, (void (*)(void))type metadata accessor for VideoConfiguration);
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v36, v23);
  OUTLINED_FUNCTION_29_0();
}

uint64_t VideoView.apply(video:withContentSize:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v9 = (void *)(v4 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playbackId);
  OUTLINED_FUNCTION_3_5();
  BOOL v10 = *v9 == *(void *)(a1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_playbackId)
     && v9[1] == *(void *)(a1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_playbackId + 8);
  if (v10 || (uint64_t result = sub_1BF466968(), (result & 1) != 0))
  {
    *(void *)(v4 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_video) = a1;
    swift_release();
    swift_retain();
    VideoView.startPreloading()();
    OUTLINED_FUNCTION_3_5();
    uint64_t result = swift_weakLoadStrong();
    if (result)
    {
      if ((a4 & 1) == 0)
      {
        uint64_t v12 = (void *)(*(void *)(v4 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_previewFrameArtwork)
                       + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic16ArtworkImageView_artworkSize);
        OUTLINED_FUNCTION_9_18();
        *uint64_t v12 = a2;
        v12[1] = a3;
      }
      if (*(void *)(a1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_preview))
      {
        swift_retain();
        ArtworkImageView.apply(artwork:asPartOf:)();
        swift_release();
      }
      return swift_release();
    }
  }
  return result;
}

char *sub_1BF4548F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  swift_weakInit();
  OUTLINED_FUNCTION_25_6(OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_fullScreenDelegate);
  OUTLINED_FUNCTION_25_6(OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayerDelegate);
  uint64_t v12 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_previewFrameArtwork;
  id v13 = objc_allocWithZone((Class)type metadata accessor for ArtworkImageView());
  uint64_t v14 = v7;
  OUTLINED_FUNCTION_44_3();
  *(void *)&v7[v12] = ArtworkImageView.init(artworkSize:frame:)();
  v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_animatePreviewFrameTransitions] = 0;
  *(void *)&v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer] = 0;
  *(void *)&v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController] = 0;
  *(void *)&v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_video] = 0;
  uint64_t v15 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playButton;
  *(void *)&v14[v15] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PlayButton()), sel_init);
  uint64_t v16 = &v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_additionalControlInsets];
  long long v17 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
  *(_OWORD *)uint64_t v16 = *MEMORY[0x1E4FB2848];
  *((_OWORD *)v16 + 1) = v17;
  uint64_t v18 = &v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_prominentPlayButtonLocationOverride];
  *(void *)uint64_t v18 = 0;
  *((void *)v18 + 1) = 0;
  v18[16] = 1;
  *(void *)&v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_preferredUnobscuredArea] = 1;
  v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_unmuteAfterVideoPlayerCreation] = 0;
  *(void *)&v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_isFullScreen] = 0;
  v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_isTransitioningToFullscreen] = 0;
  v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_wasAudioOnPreFullScreen] = 0;
  v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_prefersMinimalPlaybackControls] = 0;
  *(void *)&v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_currentTouch] = 0;
  v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_releaseAssetsAtNextPauseState] = 0;
  OUTLINED_FUNCTION_9_18();
  swift_weakAssign();
  uint64_t v19 = &v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playbackId];
  *(void *)uint64_t v19 = a1;
  *((void *)v19 + 1) = a2;
  uint64_t v20 = &v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoUrl];
  uint64_t v21 = sub_1BF464E58();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v38 = v21;
  (*(void (**)(char *, uint64_t))(v22 + 16))(v20, a3);
  uint64_t v39 = a5;
  sub_1BF45B850(a5, (uint64_t)&v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_templateMediaEvent], (uint64_t *)&unk_1EA1488E0);
  sub_1BF45B850(a6, (uint64_t)&v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_templateClickEvent], (uint64_t *)&unk_1EA1488E0);
  sub_1BF4598A8(a4, (uint64_t)&v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_configuration], (void (*)(void))type metadata accessor for VideoConfiguration);
  sub_1BF45B850(a7, (uint64_t)&v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_networkInquiry], &qword_1EA147DE8);

  v43.receiver = v14;
  v43.super_class = ObjectType;
  uint64_t v23 = (char *)objc_msgSendSuper2(&v43, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v23, sel_setClipsToBounds_, 0);
  uint64_t v24 = *(void **)&v23[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_previewFrameArtwork];
  objc_msgSend(v24, sel_setUserInteractionEnabled_, 0);
  objc_msgSend(v24, sel_setClipsToBounds_, 1);
  objc_msgSend(v23, sel_addSubview_, v24);
  uint64_t v25 = self;
  id v26 = objc_msgSend(v25, sel_defaultCenter);
  uint64_t v27 = v23;
  uint64_t v28 = (void *)sub_1BF465F78();
  objc_msgSend(v26, sel_addObserver_selector_name_object_, v27, sel_didChangeAutoPlayVideoSetting, v28, 0);

  id v29 = objc_msgSend(v25, sel_defaultCenter);
  objc_msgSend(v29, sel_addObserver_selector_name_object_, v27, sel_handleMediaServicesReset, *MEMORY[0x1E4F15048], 0);

  OUTLINED_FUNCTION_3_5();
  if (swift_weakLoadStrong())
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94838);
    sub_1BF4656F8();
    swift_release();
    if (v42)
    {
      if (objc_msgSend(v42, sel_respondsToSelector_, sel_isVideoAudioEnabled))
      {
        unsigned __int8 v30 = objc_msgSend(v42, sel_isVideoAudioEnabled);
        swift_unknownObjectRelease();
        v27[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_unmuteAfterVideoPlayerCreation] = v30;
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
  uint64_t v31 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playButton;
  objc_msgSend(*(id *)&v27[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playButton], sel_setHidden_, 1);
  id v32 = *(void **)&v27[v31];
  uint64_t v33 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v34 = v32;
  swift_retain();
  sub_1BF439500((uint64_t)sub_1BF45B8A0, v33);

  swift_release();
  objc_msgSend(v27, sel_addSubview_, *(void *)&v27[v31]);
  sub_1BF455928();
  swift_release();

  sub_1BF3E9E30(a7, &qword_1EA147DE8);
  sub_1BF3E9E30(a6, (uint64_t *)&unk_1EA1488E0);
  sub_1BF3E9E30(v39, (uint64_t *)&unk_1EA1488E0);
  sub_1BF4598FC(a4, (void (*)(void))type metadata accessor for VideoConfiguration);
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(a3, v38);
  return v27;
}

void sub_1BF454EDC(uint64_t a1)
{
  uint64_t v2 = sub_1BF465418();
  MEMORY[0x1F4188790](v2 - 8);
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x1C18AAE10](a1 + 16);
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
    sub_1BF465478();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BF474A50;
    uint64_t v26 = type metadata accessor for VideoView();
    v25[0] = v4;
    uint64_t v5 = v4;
    id v6 = (id)AMSLogKey();
    uint64_t v7 = MEMORY[0x1E4FBB1A0];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = sub_1BF465FA8();
      uint64_t v11 = v10;

      sub_1BF465408();
      sub_1BF4653F8();
      __swift_project_boxed_opaque_existential_2(v25, v26);
      uint64_t DynamicType = swift_getDynamicType();
      uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
      v23[0] = DynamicType;
      sub_1BF4653D8();
      sub_1BF3E9E30((uint64_t)v23, &qword_1EBA96600);
      sub_1BF4653F8();
      uint64_t MetatypeMetadata = v7;
      v23[0] = v9;
      v23[1] = v11;
      sub_1BF4653D8();
    }
    else
    {
      sub_1BF465408();
      sub_1BF4653F8();
      __swift_project_boxed_opaque_existential_2(v25, v26);
      uint64_t v13 = swift_getDynamicType();
      uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
      v23[0] = v13;
      sub_1BF4653D8();
    }
    sub_1BF3E9E30((uint64_t)v23, &qword_1EBA96600);
    sub_1BF4653F8();
    sub_1BF465428();
    type metadata accessor for Log();
    __swift_destroy_boxed_opaque_existential_2((uint64_t)v25);
    uint64_t v26 = v7;
    v25[0] = 0x7061742079616C50;
    v25[1] = 0xEB00000000646570;
    sub_1BF465438();
    sub_1BF3E9E30((uint64_t)v25, &qword_1EBA96600);
    sub_1BF42B5E4();
    swift_bridgeObjectRelease();
    VideoView.play()();
    uint64_t v14 = &v5[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_delegate];
    swift_beginAccess();
    if (MEMORY[0x1C18AAE10](v14))
    {
      uint64_t v15 = *((void *)v14 + 1);
      swift_getObjectType();
      uint64_t v16 = *(void (**)(void))(v15 + 40);
      long long v17 = v5;
      v16();

      swift_unknownObjectRelease();
    }
    if (VideoView.allowsAutoPlay.getter()) {
      goto LABEL_18;
    }
    uint64_t v18 = &v5[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_configuration];
    swift_beginAccess();
    if ((v18[*(int *)(type metadata accessor for VideoConfiguration() + 24)] & 8) == 0) {
      goto LABEL_18;
    }
    uint64_t v19 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer;
    if (*(void *)&v5[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer])
    {
      objc_msgSend(v5, sel_updateAudioSessionCategoryWithIsAudioOn_, 1);
      uint64_t v20 = *(void **)&v5[v19];
      if (v20) {
        objc_msgSend(v20, sel_setMuted_, 0);
      }
      goto LABEL_18;
    }
    swift_beginAccess();
    if (swift_weakLoadStrong())
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94838);
      sub_1BF4656F8();
      swift_release();
      if (v22)
      {
        if (objc_msgSend(v22, sel_respondsToSelector_, sel_isVideoAudioEnabled))
        {
          unsigned __int8 v21 = objc_msgSend(v22, sel_isVideoAudioEnabled);
          swift_unknownObjectRelease();
          v5[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_unmuteAfterVideoPlayerCreation] = v21;
LABEL_18:

          return;
        }
        swift_unknownObjectRelease();
      }
    }
    v5[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_unmuteAfterVideoPlayerCreation] = 1;
    goto LABEL_18;
  }
}

Swift::Void __swiftcall VideoView.play()()
{
  OUTLINED_FUNCTION_26_0();
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = sub_1BF465418();
  uint64_t v4 = OUTLINED_FUNCTION_44(v3);
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_24_0();
  uint64_t v5 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer;
  uint64_t v6 = *(void *)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer];
  uint64_t v7 = MEMORY[0x1E4FBB1A0];
  if (!v6)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
    uint64_t v8 = OUTLINED_FUNCTION_21_3();
    OUTLINED_FUNCTION_0_2(v8);
    *(_OWORD *)(OUTLINED_FUNCTION_13_16() + 16) = xmmword_1BF474A50;
    uint64_t v32 = ObjectType;
    unint64_t v30 = (unint64_t)v0;
    v0;
    id v9 = (id)AMSLogKey();
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = sub_1BF465FA8();
      uint64_t v13 = v12;

      sub_1BF465408();
      OUTLINED_FUNCTION_4_7();
      OUTLINED_FUNCTION_2_15(&v30);
      uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_15_8(MetatypeMetadata);
      sub_1BF3E9E30((uint64_t)&v27, &qword_1EBA96600);
      OUTLINED_FUNCTION_6_1();
      uint64_t v29 = MEMORY[0x1E4FBB1A0];
      uint64_t v27 = v11;
      uint64_t v7 = MEMORY[0x1E4FBB1A0];
      uint64_t v28 = v13;
      sub_1BF4653D8();
    }
    else
    {
      sub_1BF465408();
      OUTLINED_FUNCTION_4_7();
      OUTLINED_FUNCTION_2_15(&v30);
      uint64_t v15 = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_15_8(v15);
    }
    sub_1BF3E9E30((uint64_t)&v27, &qword_1EBA96600);
    sub_1BF4653F8();
    sub_1BF465428();
    type metadata accessor for Log();
    __swift_destroy_boxed_opaque_existential_2((uint64_t)&v30);
    uint64_t v32 = v7;
    unint64_t v30 = 0x6964616F6C657250;
    unint64_t v31 = 0xEA0000000000676ELL;
    sub_1BF465438();
    sub_1BF3E9E30((uint64_t)&v30, &qword_1EBA96600);
    sub_1BF42B654();
    swift_bridgeObjectRelease();
    VideoView.startPreloading()();
    uint64_t v6 = *(void *)&v1[v5];
    if (!v6) {
      goto LABEL_7;
    }
  }
  uint64_t v16 = (unsigned char *)(v6 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_shouldBePlaying);
  OUTLINED_FUNCTION_3_5();
  if ((*v16 & 1) == 0)
  {
    swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    sub_1BF4565E4(sub_1BF4565DC);
    swift_release_n();
  }
  else
  {
LABEL_7:
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
    uint64_t v17 = OUTLINED_FUNCTION_21_3();
    OUTLINED_FUNCTION_0_2(v17);
    *(_OWORD *)(OUTLINED_FUNCTION_13_16() + 16) = xmmword_1BF474A50;
    uint64_t v32 = ObjectType;
    unint64_t v30 = (unint64_t)v1;
    uint64_t v18 = v1;
    id v19 = (id)AMSLogKey();
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = sub_1BF465FA8();
      uint64_t v23 = v22;

      sub_1BF465408();
      OUTLINED_FUNCTION_4_7();
      OUTLINED_FUNCTION_2_15(&v30);
      uint64_t v24 = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_15_8(v24);
      sub_1BF3E9E30((uint64_t)&v27, &qword_1EBA96600);
      OUTLINED_FUNCTION_6_1();
      uint64_t v29 = MEMORY[0x1E4FBB1A0];
      uint64_t v27 = v21;
      uint64_t v28 = v23;
      sub_1BF4653D8();
    }
    else
    {
      sub_1BF465408();
      OUTLINED_FUNCTION_4_7();
      OUTLINED_FUNCTION_2_15(&v30);
      uint64_t v25 = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_15_8(v25);
    }
    sub_1BF3E9E30((uint64_t)&v27, &qword_1EBA96600);
    sub_1BF4653F8();
    sub_1BF465428();
    __swift_destroy_boxed_opaque_existential_2((uint64_t)&v30);
    unint64_t v30 = 0;
    unint64_t v31 = 0xE000000000000000;
    sub_1BF466768();
    swift_bridgeObjectRelease();
    unint64_t v30 = 0xD000000000000026;
    unint64_t v31 = 0x80000001BF46F320;
    if (*(void *)&v1[v5]) {
      OUTLINED_FUNCTION_3_5();
    }
    uint64_t v26 = MEMORY[0x1E4FBB1A0];
    type metadata accessor for Log();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1488F8);
    sub_1BF465FF8();
    sub_1BF466058();
    swift_bridgeObjectRelease();
    uint64_t v32 = v26;
    sub_1BF465438();
    sub_1BF3E9E30((uint64_t)&v30, &qword_1EBA96600);
    sub_1BF42B5E4();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_29_0();
}

uint64_t VideoView.allowsAutoPlay.getter()
{
  swift_getObjectType();
  OUTLINED_FUNCTION_3_5();
  type metadata accessor for VideoConfiguration();
  OUTLINED_FUNCTION_3_5();
  swift_weakLoadStrong();
  static VideoView.isAutoPlayAllowed(videoConfigurationAutoPlay:objectGraph:)();
  char v1 = v0;
  swift_release();
  return v1 & 1;
}

void sub_1BF455928()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v2 = sub_1BF465418();
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v3 = *(void *)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer];
  if (v3)
  {
    uint64_t v4 = &v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_configuration];
    swift_beginAccess();
    char v5 = v4[*(int *)(type metadata accessor for VideoConfiguration() + 40)];
    uint64_t v6 = (char *)(v3 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_shouldLoopPlayback);
    swift_beginAccess();
    *uint64_t v6 = v5;
  }
  uint64_t v7 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController;
  uint64_t v8 = *(void **)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController];
  if (v8)
  {
    id v9 = &v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_configuration];
    swift_beginAccess();
    objc_msgSend(v8, sel_setAllowsEnteringFullScreen_, v9[*(int *)(type metadata accessor for VideoConfiguration() + 32)]);
  }
  uint64_t v10 = *(void **)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_previewFrameArtwork];
  uint64_t v11 = &v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_configuration];
  swift_beginAccess();
  if (*v11) {
    uint64_t v12 = 2;
  }
  else {
    uint64_t v12 = 1;
  }
  objc_msgSend(v10, sel_setContentMode_, v12);
  uint64_t v13 = *(void **)&v0[v7];
  if (v13)
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F15AF8];
    if (!*v11) {
      uint64_t v14 = (void *)MEMORY[0x1E4F15AF0];
    }
    objc_msgSend(v13, sel_setVideoGravity_forLayoutClass_, *v14, 0);
  }
  uint64_t v15 = type metadata accessor for VideoConfiguration();
  objc_msgSend(v0, sel_setUserInteractionEnabled_, *(void *)&v11[*(int *)(v15 + 24)] != 0);
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playButton], sel_setHidden_, (*(void *)&v11[*(int *)(v15 + 24)] & 1) == 0);
  uint64_t v16 = *(void **)&v0[v7];
  if (v16)
  {
    objc_msgSend(v16, sel_setShowsPlaybackControls_, (*(void *)&v11[*(int *)(v15 + 24)] & 0xELL) != 0);
    uint64_t v17 = *(void **)&v0[v7];
    if (v17) {
      objc_msgSend(v17, sel_setShowsMinimalPlaybackControlsWhenEmbeddedInline_, (*(void *)&v11[*(int *)(v15 + 24)] & 4) == 0);
    }
  }
  uint64_t v31 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
  uint64_t v30 = *(void *)(*(void *)(sub_1BF465478() - 8) + 72);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BF474A50;
  uint64_t v36 = ObjectType;
  unint64_t v34 = (unint64_t)v0;
  uint64_t v18 = v0;
  id v19 = (id)AMSLogKey();
  uint64_t v20 = MEMORY[0x1E4FBB1A0];
  if (v19)
  {
    uint64_t v21 = v19;
    uint64_t v22 = sub_1BF465FA8();
    uint64_t v24 = v23;

    sub_1BF465408();
    sub_1BF4653F8();
    __swift_project_boxed_opaque_existential_2(&v34, v36);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    v32[0] = DynamicType;
    sub_1BF4653D8();
    sub_1BF3E9E30((uint64_t)v32, &qword_1EBA96600);
    sub_1BF4653F8();
    uint64_t MetatypeMetadata = v20;
    v32[0] = v22;
    v32[1] = v24;
    sub_1BF4653D8();
  }
  else
  {
    sub_1BF465408();
    sub_1BF4653F8();
    __swift_project_boxed_opaque_existential_2(&v34, v36);
    uint64_t v26 = swift_getDynamicType();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    v32[0] = v26;
    sub_1BF4653D8();
  }
  sub_1BF3E9E30((uint64_t)v32, &qword_1EBA96600);
  sub_1BF4653F8();
  sub_1BF465428();
  __swift_destroy_boxed_opaque_existential_2((uint64_t)&v34);
  unint64_t v34 = 0;
  unint64_t v35 = 0xE000000000000000;
  sub_1BF466768();
  swift_bridgeObjectRelease();
  unint64_t v34 = 0xD00000000000001BLL;
  unint64_t v35 = 0x80000001BF46F8B0;
  if ((VideoView.allowsAutoPlay.getter() & 1) == 0) {
    swift_beginAccess();
  }
  type metadata accessor for Log();
  sub_1BF466058();
  swift_bridgeObjectRelease();
  uint64_t v36 = MEMORY[0x1E4FBB1A0];
  sub_1BF465438();
  sub_1BF3E9E30((uint64_t)&v34, &qword_1EBA96600);
  sub_1BF42B5E4();
  swift_bridgeObjectRelease();
  uint64_t v27 = *(void **)&v0[v31];
  if (v27)
  {
    if ((v11[*(int *)(v15 + 24)] & 8) != 0)
    {
      uint64_t v29 = 1;
    }
    else
    {
      uint64_t v28 = &v18[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_isFullScreen];
      swift_beginAccess();
      uint64_t v29 = *v28;
    }
    objc_msgSend(v27, sel_setPlaybackControlsIncludeVolumeControls_, v29, v30);
  }
  sub_1BF457940();
  sub_1BF458480();
  sub_1BF453F78();
}

void sub_1BF455EF0()
{
  char v1 = v0;
  swift_weakInit();
  OUTLINED_FUNCTION_25_6(OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_fullScreenDelegate);
  OUTLINED_FUNCTION_25_6(OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayerDelegate);
  uint64_t v2 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_previewFrameArtwork;
  id v3 = objc_allocWithZone((Class)type metadata accessor for ArtworkImageView());
  OUTLINED_FUNCTION_44_3();
  *(void *)&v0[v2] = ArtworkImageView.init(artworkSize:frame:)();
  v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_animatePreviewFrameTransitions] = 0;
  *(void *)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer] = 0;
  *(void *)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController] = 0;
  *(void *)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_video] = 0;
  uint64_t v4 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playButton;
  *(void *)&v1[v4] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PlayButton()), sel_init);
  char v5 = &v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_additionalControlInsets];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
  *char v5 = *MEMORY[0x1E4FB2848];
  v5[1] = v6;
  uint64_t v7 = &v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_prominentPlayButtonLocationOverride];
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  v7[16] = 1;
  *(void *)&v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_preferredUnobscuredArea] = 1;
  v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_unmuteAfterVideoPlayerCreation] = 0;
  *(void *)&v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_isFullScreen] = 0;
  v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_isTransitioningToFullscreen] = 0;
  v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_wasAudioOnPreFullScreen] = 0;
  v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_prefersMinimalPlaybackControls] = 0;
  *(void *)&v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_currentTouch] = 0;
  v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_releaseAssetsAtNextPauseState] = 0;

  sub_1BF466868();
  __break(1u);
}

uint64_t VideoView.playbackId.getter()
{
  char v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playbackId);
  OUTLINED_FUNCTION_3_5();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t VideoView.playbackId.setter(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1_21();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*VideoView.playbackId.modify())()
{
  return j__swift_endAccess;
}

uint64_t VideoView.delegate.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_delegate;
  OUTLINED_FUNCTION_3_5();
  return MEMORY[0x1C18AAE10](v1);
}

uint64_t VideoView.delegate.setter(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1_21();
  *(void *)(v2 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t (*VideoView.delegate.modify(void *a1))()
{
  id v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_delegate;
  v3[5] = v1;
  v3[6] = v4;
  OUTLINED_FUNCTION_32_4();
  uint64_t v5 = MEMORY[0x1C18AAE10](v1);
  uint64_t v6 = *(void *)(v1 + 8);
  v3[3] = v5;
  v3[4] = v6;
  return sub_1BF4562C8;
}

uint64_t VideoView.state.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_state);
  OUTLINED_FUNCTION_3_5();
  return *v2;
}

Swift::Void __swiftcall VideoView.startPreloading()()
{
  uint64_t v2 = sub_1BF464E58();
  OUTLINED_FUNCTION_0_0();
  uint64_t v4 = v3;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_24_0();
  sub_1BF457308();
  uint64_t v6 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer;
  uint64_t v7 = *(void **)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer);
  if (v7
    || ((*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoUrl, v2), v8 = objc_allocWithZone((Class)type metadata accessor for VideoPlayer(0)), v9 = VideoPlayer.init(with:)(v1), sub_1BF453504(v9), (uint64_t v7 = *(void **)(v0 + v6)) != 0))
  {
    id v10 = v7;
    VideoPlayer.startPreloading()();
  }
}

uint64_t sub_1BF45640C()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1BF456444(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  type metadata accessor for Log();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
  sub_1BF465478();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BF474A50;
  sub_1BF4653A8();
  uint64_t v8 = MEMORY[0x1E4FBB1A0];
  unint64_t v6 = 0xD00000000000001CLL;
  unint64_t v7 = 0x80000001BF46F8D0;
  sub_1BF465438();
  sub_1BF3E9E30((uint64_t)&v6, &qword_1EBA96600);
  sub_1BF42B654();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x1C18AAE10](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = *(void **)(v2 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer);
    if (v4)
    {
      id v5 = v4;

      objc_msgSend(v5, sel_play, v6, v7);
      uint64_t v3 = v5;
    }
  }
}

void sub_1BF4565DC()
{
  sub_1BF456444(v0);
}

void sub_1BF4565E4(void (*a1)(void))
{
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer);
  if (v3)
  {
    id v4 = v3;
    if objc_msgSend(v4, sel_isMuted) && (VideoView.allowsAutoPlay.getter())
    {
      sub_1BF3A9E60(0, &qword_1EA148A58);
      sub_1BF458CEC();

      return;
    }
  }
  if (a1) {
    a1();
  }
}

Swift::Void __swiftcall VideoView.pause()()
{
  uint64_t v1 = *(char **)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer);
  if (v1)
  {
    uint64_t v2 = &v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_shouldBePlaying];
    OUTLINED_FUNCTION_3_5();
    if (*v2 == 1) {
      objc_msgSend(v1, sel_pause);
    }
  }
}

Swift::Void __swiftcall VideoView.restart()()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer);
  if (v1)
  {
    id v2 = v1;
    VideoPlayer.restart()();
  }
}

uint64_t VideoView.isPlaying.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer);
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  char v3 = VideoPlayer.isPlaying.getter();

  return v3 & 1;
}

uint64_t VideoView.shouldBePlaying.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer);
  if (!v1) {
    return 0;
  }
  id v2 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_shouldBePlaying);
  OUTLINED_FUNCTION_3_5();
  return *v2;
}

void static VideoView.isAutoPlayAllowed(videoConfigurationAutoPlay:objectGraph:)()
{
  OUTLINED_FUNCTION_26_0();
  uint64_t v1 = v0;
  char v3 = v2;
  uint64_t v4 = sub_1BF465418();
  uint64_t v5 = OUTLINED_FUNCTION_44(v4);
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_8_9();
  if ((v3 & 1) == 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
    uint64_t v17 = OUTLINED_FUNCTION_21_3();
    OUTLINED_FUNCTION_0_2(v17);
    uint64_t v18 = (__n128 *)OUTLINED_FUNCTION_14_10();
    OUTLINED_FUNCTION_43_3(v18, (__n128)xmmword_1BF474A50);
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA148900);
    id v20 = (id)OUTLINED_FUNCTION_40_1(v19);
    uint64_t v21 = MEMORY[0x1E4FBB1A0];
    if (v20)
    {
      uint64_t v22 = v20;
      uint64_t v23 = sub_1BF465FA8();
      uint64_t v25 = v24;

      OUTLINED_FUNCTION_6_8();
      OUTLINED_FUNCTION_5_7();
      OUTLINED_FUNCTION_1_9();
      uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_2_16(MetatypeMetadata);
      OUTLINED_FUNCTION_26_7();
      OUTLINED_FUNCTION_6_1();
      uint64_t v50 = v21;
      uint64_t v48 = v23;
      uint64_t v49 = v25;
      sub_1BF4653D8();
      OUTLINED_FUNCTION_26_7();
    }
    else
    {
      OUTLINED_FUNCTION_7_8();
      OUTLINED_FUNCTION_5_7();
      OUTLINED_FUNCTION_1_9();
      uint64_t v36 = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_2_16(v36);
      sub_1BF3E9E30((uint64_t)&v48, &qword_1EBA96600);
    }
    OUTLINED_FUNCTION_10_6();
    sub_1BF465428();
    type metadata accessor for Log();
    __swift_destroy_boxed_opaque_existential_2((uint64_t)&v51);
    uint64_t v53 = v21;
    OUTLINED_FUNCTION_37_4();
    sub_1BF3E9E30((uint64_t)&v51, &qword_1EBA96600);
    sub_1BF42B61C();
    goto LABEL_18;
  }
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28F80]), sel_init);
  unsigned __int8 v7 = objc_msgSend(v6, sel_isLowPowerModeEnabled);

  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
    uint64_t v8 = OUTLINED_FUNCTION_21_3();
    OUTLINED_FUNCTION_0_2(v8);
    id v9 = (__n128 *)OUTLINED_FUNCTION_14_10();
    OUTLINED_FUNCTION_43_3(v9, (__n128)xmmword_1BF474A50);
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA148900);
    id v11 = (id)OUTLINED_FUNCTION_40_1(v10);
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = sub_1BF465FA8();
      uint64_t v15 = v14;

      OUTLINED_FUNCTION_6_8();
      OUTLINED_FUNCTION_5_7();
      OUTLINED_FUNCTION_1_9();
      uint64_t v16 = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_2_16(v16);
      OUTLINED_FUNCTION_26_7();
      OUTLINED_FUNCTION_6_1();
      uint64_t v50 = MEMORY[0x1E4FBB1A0];
      uint64_t v48 = v13;
      uint64_t v49 = v15;
      sub_1BF4653D8();
      OUTLINED_FUNCTION_26_7();
    }
    else
    {
      OUTLINED_FUNCTION_7_8();
      OUTLINED_FUNCTION_5_7();
      OUTLINED_FUNCTION_1_9();
      uint64_t v37 = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_2_16(v37);
      sub_1BF3E9E30((uint64_t)&v48, &qword_1EBA96600);
    }
    OUTLINED_FUNCTION_10_6();
    sub_1BF465428();
    type metadata accessor for Log();
    __swift_destroy_boxed_opaque_existential_2((uint64_t)&v51);
    uint64_t v53 = MEMORY[0x1E4FBB1A0];
    unint64_t v51 = 0x504C206E69207349;
    unint64_t v52 = 0xE90000000000004DLL;
    sub_1BF465438();
    sub_1BF3E9E30((uint64_t)&v51, &qword_1EBA96600);
    sub_1BF42B5E4();
LABEL_18:
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  if (!v1) {
    goto LABEL_12;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94838);
  sub_1BF4656F8();
  if (!v51) {
    goto LABEL_12;
  }
  if ((objc_msgSend((id)v51, sel_respondsToSelector_, sel_isAutoPlayAllowed) & 1) == 0
    || (objc_msgSend((id)v51, sel_isAutoPlayAllowed) & 1) != 0)
  {
    swift_unknownObjectRelease();
LABEL_12:
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
    uint64_t v27 = OUTLINED_FUNCTION_21_3();
    OUTLINED_FUNCTION_0_2(v27);
    uint64_t v28 = (__n128 *)OUTLINED_FUNCTION_14_10();
    OUTLINED_FUNCTION_43_3(v28, (__n128)xmmword_1BF474A50);
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA148900);
    id v30 = (id)OUTLINED_FUNCTION_40_1(v29);
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = sub_1BF465FA8();
      uint64_t v34 = v33;

      OUTLINED_FUNCTION_6_8();
      OUTLINED_FUNCTION_5_7();
      OUTLINED_FUNCTION_1_9();
      uint64_t v35 = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_2_16(v35);
      OUTLINED_FUNCTION_26_7();
      OUTLINED_FUNCTION_6_1();
      uint64_t v50 = MEMORY[0x1E4FBB1A0];
      uint64_t v48 = v32;
      uint64_t v49 = v34;
      sub_1BF4653D8();
      OUTLINED_FUNCTION_26_7();
    }
    else
    {
      OUTLINED_FUNCTION_7_8();
      OUTLINED_FUNCTION_5_7();
      OUTLINED_FUNCTION_1_9();
      uint64_t v38 = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_2_16(v38);
      sub_1BF3E9E30((uint64_t)&v48, &qword_1EBA96600);
    }
    OUTLINED_FUNCTION_10_6();
    sub_1BF465428();
    type metadata accessor for Log();
    __swift_destroy_boxed_opaque_existential_2((uint64_t)&v51);
    uint64_t v53 = MEMORY[0x1E4FBB1A0];
    unint64_t v51 = 0xD000000000000017;
    unint64_t v52 = 0x80000001BF46F370;
    sub_1BF465438();
    sub_1BF3E9E30((uint64_t)&v51, &qword_1EBA96600);
    sub_1BF42B5E4();
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
  uint64_t v39 = OUTLINED_FUNCTION_21_3();
  OUTLINED_FUNCTION_0_2(v39);
  *(_OWORD *)(OUTLINED_FUNCTION_13_16() + 16) = xmmword_1BF474A50;
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA148900);
  id v41 = (id)OUTLINED_FUNCTION_40_1(v40);
  if (v41)
  {
    id v42 = v41;
    uint64_t v43 = sub_1BF465FA8();
    uint64_t v45 = v44;

    OUTLINED_FUNCTION_6_8();
    OUTLINED_FUNCTION_5_7();
    OUTLINED_FUNCTION_1_9();
    uint64_t v46 = swift_getMetatypeMetadata();
    OUTLINED_FUNCTION_2_16(v46);
    OUTLINED_FUNCTION_39_4();
    OUTLINED_FUNCTION_6_1();
    uint64_t v50 = MEMORY[0x1E4FBB1A0];
    uint64_t v48 = v43;
    uint64_t v49 = v45;
    sub_1BF4653D8();
    OUTLINED_FUNCTION_39_4();
  }
  else
  {
    OUTLINED_FUNCTION_7_8();
    OUTLINED_FUNCTION_5_7();
    OUTLINED_FUNCTION_1_9();
    uint64_t v47 = swift_getMetatypeMetadata();
    OUTLINED_FUNCTION_2_16(v47);
    sub_1BF3E9E30((uint64_t)&v48, &qword_1EBA96600);
  }
  OUTLINED_FUNCTION_10_6();
  sub_1BF465428();
  type metadata accessor for Log();
  __swift_destroy_boxed_opaque_existential_2((uint64_t)&v51);
  uint64_t v53 = MEMORY[0x1E4FBB1A0];
  OUTLINED_FUNCTION_37_4();
  sub_1BF3E9E30((uint64_t)&v51, &qword_1EBA96600);
  sub_1BF42B5E4();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
LABEL_22:
  OUTLINED_FUNCTION_29_0();
}

void sub_1BF456E98()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  char v2 = &v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_isTransitioningToFullscreen];
  swift_beginAccess();
  *char v2 = 0;
  char v3 = &v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_isFullScreen];
  swift_beginAccess();
  objc_msgSend(v0, sel_setUserInteractionEnabled_, (*v3 & 1) == 0);
  v11.receiver = v0;
  v11.super_class = ObjectType;
  id v4 = objc_msgSendSuper2(&v11, sel_backgroundColor);
  if (!v4) {
    id v4 = objc_msgSend(self, sel_ams_placeholderBackground);
  }
  uint64_t v5 = *(void **)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController];
  if (v5)
  {
    id v6 = objc_msgSend(v5, sel_view);
    if (!v6)
    {
      __break(1u);
      return;
    }
    unsigned __int8 v7 = v6;
    if (*v3 == 1) {
      id v8 = objc_msgSend(self, sel_clearColor);
    }
    else {
      id v8 = v4;
    }
    id v9 = v8;
    objc_msgSend(v7, sel_setBackgroundColor_, v8);
  }
  sub_1BF455928();
  if ((*v3 & 1) == 0)
  {
    uint64_t v10 = *(void **)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer];
    if (v10) {
      objc_msgSend(v10, sel_setMuted_, (v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_wasAudioOnPreFullScreen] & 1) == 0);
    }
  }
  sub_1BF453928();
  objc_msgSend(v0, sel_setNeedsLayout);
}

uint64_t VideoView.isFullScreen.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_isFullScreen);
  OUTLINED_FUNCTION_3_5();
  return *v1;
}

void VideoView.isFullScreen.setter(char a1)
{
  OUTLINED_FUNCTION_33_4(OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_isFullScreen);
  OUTLINED_FUNCTION_9_18();
  unsigned char *v1 = a1;
  sub_1BF456E98();
}

void (*VideoView.isFullScreen.modify(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  OUTLINED_FUNCTION_0_18();
  return sub_1BF457130;
}

void sub_1BF457130(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_1BF456E98();
  }
}

uint64_t VideoView.isTransitioningToFullscreen.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_isTransitioningToFullscreen);
  OUTLINED_FUNCTION_3_5();
  return *v1;
}

uint64_t VideoView.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_configuration;
  OUTLINED_FUNCTION_3_5();
  return sub_1BF4598A8(v3, a1, (void (*)(void))type metadata accessor for VideoConfiguration);
}

uint64_t VideoView.configuration.setter(uint64_t a1)
{
  OUTLINED_FUNCTION_33_4(OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_configuration);
  swift_beginAccess();
  sub_1BF457594(a1, v1);
  swift_endAccess();
  sub_1BF455928();
  return sub_1BF4598FC(a1, (void (*)(void))type metadata accessor for VideoConfiguration);
}

void (*VideoView.configuration.modify(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  OUTLINED_FUNCTION_0_18();
  return sub_1BF4572D0;
}

void sub_1BF4572D0(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_1BF455928();
  }
}

void sub_1BF457308()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v2 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController;
  if (!*(void *)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController])
  {
    uint64_t v3 = (objc_class *)ObjectType;
    id v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DynamicVideoPlayerViewController()), sel_init);
    objc_msgSend(v4, sel_setShowsPlaybackControls_, 0);
    objc_msgSend(v4, sel_setUpdatesNowPlayingInfoCenter_, 0);
    objc_msgSend(v4, sel_setCanPausePlaybackWhenExitingFullScreen_, 0);
    objc_msgSend(v4, sel_setPreferredUnobscuredArea_, *(void *)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_preferredUnobscuredArea]);
    objc_msgSend(v4, sel_setShowsMinimalPlaybackControlsWhenEmbeddedInline_, 1);
    objc_msgSend(v4, sel_setDelegate_, v0);
    id v5 = objc_msgSend(v4, sel_view);
    if (v5)
    {
      id v6 = v5;
      objc_msgSend(v5, sel_setClipsToBounds_, 1);

      id v7 = objc_msgSend(v4, sel_view);
      if (v7)
      {
        id v8 = v7;
        v16.receiver = v0;
        v16.super_class = v3;
        id v9 = objc_msgSendSuper2(&v16, sel_backgroundColor);
        if (!v9) {
          id v9 = objc_msgSend(self, sel_ams_placeholderBackground);
        }
        objc_msgSend(v8, sel_setBackgroundColor_, v9);

        objc_msgSend(v4, sel_setModalPresentationStyle_, 5);
        objc_msgSend(v4, sel_setCanToggleVideoGravityWhenEmbeddedInline_, 0);
        id v10 = objc_msgSend(v4, sel_view);
        if (v10)
        {
          objc_super v11 = v10;
          objc_msgSend(v0, sel_bounds);
          objc_msgSend(v11, sel_setFrame_);

          if (*(void *)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer]) {
            objc_msgSend(v4, sel_setPlayer_);
          }
          id v12 = objc_msgSend(v4, sel_view);
          if (v12)
          {
            uint64_t v13 = v12;
            objc_msgSend(v0, sel_insertSubview_atIndex_, v12, 0);

            uint64_t v14 = *(void **)&v0[v2];
            *(void *)&v0[v2] = v4;
            id v15 = v4;

            sub_1BF455928();
            return;
          }
LABEL_15:
          __break(1u);
          return;
        }
LABEL_14:
        __break(1u);
        goto LABEL_15;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_14;
  }
}

uint64_t sub_1BF457594(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for VideoConfiguration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

Swift::Void __swiftcall VideoView.releaseAssets(now:)(Swift::Bool now)
{
  if (now)
  {
    uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer);
    if (v2)
    {
      id v3 = v2;
      VideoPlayer.releaseAssets()();
    }
  }
  else
  {
    *(unsigned char *)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_releaseAssetsAtNextPauseState) = 1;
  }
}

void sub_1BF457674()
{
}

Swift::Void __swiftcall VideoView.layoutSubviews()()
{
  uint64_t v1 = v0;
  v22.receiver = v0;
  v22.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v22, sel_layoutSubviews);
  objc_msgSend(v0, sel_bounds);
  double width = v23.size.width;
  double height = v23.size.height;
  double MaxX = CGRectGetMaxX(v23);
  v24.origin.x = OUTLINED_FUNCTION_36_4();
  double MaxY = CGRectGetMaxY(v24);
  id v6 = *(void **)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController];
  if (v6)
  {
    id v7 = objc_msgSend(v6, sel_view);
    if (!v7)
    {
      __break(1u);
      return;
    }
    id v8 = v7;
    double v9 = OUTLINED_FUNCTION_36_4();
    objc_msgSend(v10, v11, v9);
  }
  double v12 = MaxX * 0.5;
  double v13 = MaxY * 0.5;
  uint64_t v14 = *(char **)&v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_previewFrameArtwork];
  objc_msgSend(v14, sel_frame);
  objc_msgSend(v14, sel_setFrame_);
  id v15 = (double *)&v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic16ArtworkImageView_artworkSize];
  OUTLINED_FUNCTION_9_18();
  if (*v15 != width || v15[1] != height)
  {
    double *v15 = width;
    v15[1] = height;
    uint64_t v17 = *(void *)&v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_video];
    if (v17)
    {
      if (*(void *)(v17 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_preview))
      {
        OUTLINED_FUNCTION_3_5();
        if (swift_weakLoadStrong())
        {
          swift_retain();
          ArtworkImageView.apply(artwork:asPartOf:)();
          swift_release();
          swift_release();
        }
      }
    }
  }
  objc_msgSend(v14, sel_setCenter_, v12, MaxY * 0.5);
  uint64_t v18 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playButton;
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playButton], sel_sizeThatFits_, width, height);
  uint64_t v21 = (double *)&v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_prominentPlayButtonLocationOverride];
  if ((v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_prominentPlayButtonLocationOverride + 16] & 1) == 0)
  {
    double v12 = *v21;
    double v13 = v21[1];
  }
  objc_msgSend(*(id *)&v1[v18], sel_setFrame_, v12 - v19 * 0.5, v13 - v20 * 0.5);
}

uint64_t sub_1BF457940()
{
  uint64_t v1 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_releaseAssetsAtNextPauseState;
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_releaseAssetsAtNextPauseState) == 1
    && VideoView.state.getter() == 4)
  {
    *(unsigned char *)(v0 + v1) = 0;
    uint64_t v2 = (void *)swift_allocObject();
    swift_unknownObjectWeakInit();
    id v3 = (uint64_t (*)())sub_1BF45B70C;
  }
  else
  {
    id v3 = 0;
    uint64_t v2 = 0;
  }
  unsigned __int8 v4 = VideoView.isPlaying.getter();
  id v5 = *(void **)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer);
  if (v5 && (id v6 = objc_msgSend(v5, sel_currentItem)) != 0)
  {
    id v7 = v6;
    objc_msgSend(v6, sel_currentTime);
    sub_1BF466508();
    char v8 = sub_1BF4664F8();
  }
  else
  {
    char v8 = 1;
  }
  double v9 = (unsigned char *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_isFullScreen);
  swift_beginAccess();
  sub_1BF457B5C(v8 & ~(*v9 | v4) & 1, *(unsigned char *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_animatePreviewFrameTransitions), v3, v2);
  sub_1BF458204(((*v9 | v4) & 1) == 0);
  return sub_1BF3CBCFC((uint64_t)v3);
}

void sub_1BF457AE0(char a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v2 = a2 + 16;
    swift_beginAccess();
    uint64_t v3 = MEMORY[0x1C18AAE10](v2);
    if (v3)
    {
      unsigned __int8 v4 = (void *)v3;
      id v5 = *(void **)(v3 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer);
      if (v5)
      {
        id v6 = v5;

        VideoPlayer.releaseAssets()();
        unsigned __int8 v4 = v6;
      }
    }
  }
}

void sub_1BF457B5C(char a1, char a2, uint64_t (*a3)(), void *a4)
{
  uint64_t ObjectType = (void *)swift_getObjectType();
  uint64_t v11 = sub_1BF465418();
  MEMORY[0x1F4188790](v11 - 8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
  sub_1BF465478();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BF474840;
  uint64_t v37 = ObjectType;
  uint64_t aBlock = (uint64_t)v4;
  id v12 = v4;
  id v13 = (id)AMSLogKey();
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = sub_1BF465FA8();
    uint64_t v17 = v16;

    sub_1BF465408();
    sub_1BF4653F8();
    __swift_project_boxed_opaque_existential_2(&aBlock, (uint64_t)v37);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    v40[0] = DynamicType;
    sub_1BF4653D8();
    sub_1BF3E9E30((uint64_t)v40, &qword_1EBA96600);
    sub_1BF4653F8();
    uint64_t MetatypeMetadata = MEMORY[0x1E4FBB1A0];
    v40[0] = v15;
    v40[1] = v17;
  }
  else
  {
    sub_1BF465408();
    sub_1BF4653F8();
    __swift_project_boxed_opaque_existential_2(&aBlock, (uint64_t)v37);
    uint64_t v19 = swift_getDynamicType();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    v40[0] = v19;
  }
  sub_1BF4653D8();
  sub_1BF3E9E30((uint64_t)v40, &qword_1EBA96600);
  sub_1BF4653F8();
  sub_1BF465428();
  __swift_destroy_boxed_opaque_existential_2((uint64_t)&aBlock);
  sub_1BF4653A8();
  uint64_t aBlock = 0x6D617246776F6873;
  unint64_t v35 = 0xEB00000000203A65;
  type metadata accessor for Log();
  sub_1BF466058();
  swift_bridgeObjectRelease();
  uint64_t v37 = (void *)MEMORY[0x1E4FBB1A0];
  sub_1BF465438();
  sub_1BF3E9E30((uint64_t)&aBlock, &qword_1EBA96600);
  sub_1BF42B5E4();
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
  {
    uint64_t v25 = self;
    uint64_t v26 = swift_allocObject();
    *(void *)(v26 + 16) = v12;
    *(unsigned char *)(v26 + 24) = a1 & 1;
    CGRect v23 = (void *)swift_allocObject();
    v23[2] = sub_1BF45B750;
    void v23[3] = v26;
    uint64_t v38 = sub_1BF45B76C;
    uint64_t v39 = v23;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    unint64_t v35 = 1107296256;
    uint64_t v36 = sub_1BF458458;
    uint64_t v37 = &block_descriptor_32_0;
    objc_super v22 = _Block_copy(&aBlock);
    char v20 = (char)v39;
    id v27 = v12;
    swift_retain();
    swift_release();
    objc_msgSend((id)v25, sel_performWithoutAnimation_, v22);
    _Block_release(v22);
    LOBYTE(v25) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    if ((v25 & 1) == 0) {
      return;
    }
    __break(1u);
    goto LABEL_12;
  }
  char v20 = a1 & 1;
  double v5 = 0.2;
  if (a1) {
    double v6 = 0.2;
  }
  else {
    double v6 = 0.5;
  }
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v12;
  *(unsigned char *)(v21 + 24) = v20;
  uint64_t v38 = (uint64_t (*)())sub_1BF45B794;
  uint64_t v39 = (void *)v21;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v7 = 1107296256;
  unint64_t v35 = 1107296256;
  uint64_t v36 = sub_1BF3AC814;
  uint64_t v37 = &block_descriptor_38_0;
  objc_super v22 = _Block_copy(&aBlock);
  CGRect v23 = v12;
  swift_release();
  if (!a3)
  {
LABEL_12:
    CGRect v24 = 0;
    goto LABEL_13;
  }
  uint64_t v38 = a3;
  uint64_t v39 = a4;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  unint64_t v35 = 1107296256;
  uint64_t v36 = sub_1BF44622C;
  uint64_t v37 = &block_descriptor_47_0;
  CGRect v24 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
LABEL_13:
  uint64_t v28 = self;
  objc_msgSend(v28, sel_animateWithDuration_delay_options_animations_completion_, 4, v22, v24, v6, 0.0);
  _Block_release(v24);
  _Block_release(v22);
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = v23;
  *(unsigned char *)(v29 + 24) = v20;
  uint64_t v38 = sub_1BF45B74C;
  uint64_t v39 = (void *)v29;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  unint64_t v35 = v7;
  uint64_t v36 = sub_1BF3AC814;
  uint64_t v37 = &block_descriptor_44_2;
  id v30 = _Block_copy(&aBlock);
  uint64_t v31 = v23;
  swift_release();
  objc_msgSend(v28, sel_animateWithDuration_delay_options_animations_completion_, 4, v30, 0, v5, 0.0);
  _Block_release(v30);
}

void sub_1BF458204(char a1)
{
  uint64_t v3 = self;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v1;
  *(unsigned char *)(v4 + 24) = a1;
  v7[4] = sub_1BF45B74C;
  v7[5] = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 1107296256;
  v7[2] = sub_1BF3AC814;
  v7[3] = &block_descriptor_23_1;
  double v5 = _Block_copy(v7);
  id v6 = v1;
  swift_release();
  objc_msgSend(v3, sel_animateWithDuration_delay_options_animations_completion_, 4, v5, 0, 0.2, 0.0);
  _Block_release(v5);
}

id sub_1BF458304(uint64_t a1, char a2)
{
  uint64_t v4 = a1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayerDelegate;
  if (MEMORY[0x1C18AAE10](a1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayerDelegate))
  {
    uint64_t v5 = *(void *)(v4 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(void, uint64_t, uint64_t))(v5 + 16))(a2 & 1, ObjectType, v5);
    swift_unknownObjectRelease();
  }
  uint64_t v7 = *(void **)(a1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_previewFrameArtwork);
  double v8 = 0.0;
  if (a2) {
    double v8 = 1.0;
  }

  return objc_msgSend(v7, sel_setAlpha_, v8);
}

void sub_1BF4583B0(uint64_t a1, char a2)
{
  uint64_t v4 = a1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayerDelegate;
  if (MEMORY[0x1C18AAE10](a1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayerDelegate))
  {
    uint64_t v5 = *(void *)(v4 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(void, uint64_t, uint64_t))(v5 + 16))(a2 & 1, ObjectType, v5);
    swift_unknownObjectRelease();
  }
  double v7 = 0.0;
  if (a2) {
    double v7 = 1.0;
  }
  objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_previewFrameArtwork), sel_setAlpha_, v7);
  VideoView.layoutSubviews()();
}

uint64_t sub_1BF458458(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

id sub_1BF458480()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v2 = sub_1BF465418();
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v3 = &v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_isFullScreen];
  swift_beginAccess();
  uint64_t v4 = &off_1EA148000;
  if (*v3 == 1)
  {
    uint64_t v5 = *(void **)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController];
    if (v5) {
      objc_msgSend(v5, sel_setShowsPlaybackControls_, 1);
    }
  }
  else
  {
    char v6 = VideoView.isPlaying.getter();
    uint64_t v7 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController;
    double v8 = *(void **)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController];
    if (v6)
    {
      if (v8)
      {
        double v9 = &v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_configuration];
        swift_beginAccess();
        objc_msgSend(v8, sel_setShowsPlaybackControls_, (*(void *)&v9[*(int *)(type metadata accessor for VideoConfiguration() + 24)] & 0xELL) != 0);
        id v10 = *(void **)&v0[v7];
        if (v10) {
          objc_msgSend(v10, sel_flashPlaybackControlsWithDuration_, 5.0);
        }
      }
    }
    else if (v8)
    {
      objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController], sel_setShowsPlaybackControls_, 0);
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
  sub_1BF465478();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BF474A50;
  uint64_t v28 = ObjectType;
  unint64_t v26 = (unint64_t)v0;
  uint64_t v11 = v0;
  id v12 = (id)AMSLogKey();
  uint64_t v13 = MEMORY[0x1E4FBB1A0];
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = sub_1BF465FA8();
    uint64_t v17 = v16;

    sub_1BF465408();
    sub_1BF4653F8();
    __swift_project_boxed_opaque_existential_2(&v26, v28);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    v24[0] = DynamicType;
    sub_1BF4653D8();
    sub_1BF3E9E30((uint64_t)v24, &qword_1EBA96600);
    sub_1BF4653F8();
    uint64_t v19 = v13;
    uint64_t MetatypeMetadata = v13;
    v24[0] = v15;
    v24[1] = v17;
    uint64_t v4 = &off_1EA148000;
  }
  else
  {
    uint64_t v19 = MEMORY[0x1E4FBB1A0];
    sub_1BF465408();
    sub_1BF4653F8();
    __swift_project_boxed_opaque_existential_2(&v26, v28);
    uint64_t v20 = swift_getDynamicType();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    v24[0] = v20;
  }
  sub_1BF4653D8();
  sub_1BF3E9E30((uint64_t)v24, &qword_1EBA96600);
  sub_1BF4653F8();
  sub_1BF465428();
  __swift_destroy_boxed_opaque_existential_2((uint64_t)&v26);
  unint64_t v26 = 0;
  unint64_t v27 = 0xE000000000000000;
  sub_1BF466768();
  swift_bridgeObjectRelease();
  unint64_t v26 = 0xD00000000000002ALL;
  unint64_t v27 = 0x80000001BF46F880;
  uint64_t v21 = *(char **)((char *)v4[283] + (void)v11);
  if (v21) {
    unsigned __int8 v22 = objc_msgSend(v21, sel_showsPlaybackControls);
  }
  else {
    unsigned __int8 v22 = 2;
  }
  type metadata accessor for Log();
  LOBYTE(v24[0]) = v22;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA148A60);
  sub_1BF465FF8();
  sub_1BF466058();
  swift_bridgeObjectRelease();
  uint64_t v28 = v19;
  sub_1BF465438();
  sub_1BF3E9E30((uint64_t)&v26, &qword_1EBA96600);
  sub_1BF42B5E4();
  swift_bridgeObjectRelease();
  return objc_msgSend(v11, sel_accessibilityUpdatePlayerControllerControls);
}

uint64_t VideoView.prefersMinimalPlaybackControls.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_prefersMinimalPlaybackControls);
  OUTLINED_FUNCTION_3_5();
  return *v1;
}

uint64_t VideoView.prefersMinimalPlaybackControls.setter(char a1)
{
  uint64_t result = OUTLINED_FUNCTION_1_21();
  unsigned char *v1 = a1;
  return result;
}

uint64_t (*VideoView.prefersMinimalPlaybackControls.modify())()
{
  return j_j__swift_endAccess;
}

void sub_1BF458998()
{
  sub_1BF3A9E60(0, &qword_1EA148A58);
  id v0 = (id)*MEMORY[0x1E4F15050];
  sub_1BF458A28();
}

void sub_1BF458A28()
{
  OUTLINED_FUNCTION_26_0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  double v9 = v8;
  uint64_t v11 = v10;
  sub_1BF465188();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1F4188790](v12);
  uint64_t v22 = OUTLINED_FUNCTION_29_6();
  OUTLINED_FUNCTION_0_0();
  uint64_t v14 = v13;
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_1_4();
  if (qword_1EA1476B8 != -1) {
    swift_once();
  }
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = v5;
  void v16[3] = v3;
  void v16[4] = v11;
  v16[5] = v9;
  v16[6] = v7;
  v23[4] = sub_1BF45B320;
  v23[5] = v16;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 1107296256;
  v23[2] = sub_1BF3AC814;
  void v23[3] = &block_descriptor_10_0;
  uint64_t v17 = _Block_copy(v23);
  sub_1BF3CBD0C(v5);
  id v18 = v11;
  id v19 = v9;
  sub_1BF4651A8();
  sub_1BF45B330((unint64_t *)&qword_1EBA963D0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA964D8);
  sub_1BF3CEC60((unint64_t *)&qword_1EBA964E0, &qword_1EBA964D8);
  sub_1BF466608();
  MEMORY[0x1C18A9C40](0, v1, v0, v17);
  _Block_release(v17);
  uint64_t v20 = OUTLINED_FUNCTION_0_7();
  v21(v20);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v1, v22);
  swift_release();
  OUTLINED_FUNCTION_29_0();
}

void sub_1BF458CEC()
{
  OUTLINED_FUNCTION_26_0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  sub_1BF465188();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1F4188790](v6);
  uint64_t v7 = OUTLINED_FUNCTION_29_6();
  OUTLINED_FUNCTION_0_0();
  uint64_t v9 = v8;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_1_4();
  if (qword_1EA1476B8 != -1) {
    swift_once();
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v5;
  *(void *)(v11 + 24) = v3;
  v15[4] = sub_1BF45B7D4;
  v15[5] = v11;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 1107296256;
  v15[2] = sub_1BF3AC814;
  void v15[3] = &block_descriptor_53_0;
  uint64_t v12 = _Block_copy(v15);
  sub_1BF3CBD0C(v5);
  sub_1BF4651A8();
  sub_1BF45B330((unint64_t *)&qword_1EBA963D0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA964D8);
  sub_1BF3CEC60((unint64_t *)&qword_1EBA964E0, &qword_1EBA964D8);
  sub_1BF466608();
  MEMORY[0x1C18A9C40](0, v1, v0, v12);
  _Block_release(v12);
  uint64_t v13 = OUTLINED_FUNCTION_0_7();
  v14(v13);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v1, v7);
  swift_release();
  OUTLINED_FUNCTION_29_0();
}

char *sub_1BF458F48(char *result, double a2, double a3)
{
  if (result)
  {
    uint64_t v5 = (id *)&result[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playerItem];
    swift_beginAccess();
    return (char *)objc_msgSend(*v5, sel_setPreferredMaximumResolution_, a2, a3);
  }
  return result;
}

void VideoView.videoDidChangeState(to:videoPlayer:)()
{
  OUTLINED_FUNCTION_26_0();
  uint64_t v2 = v1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v4 = sub_1BF465418();
  uint64_t v5 = OUTLINED_FUNCTION_44(v4);
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_1_8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
  uint64_t v6 = sub_1BF465478();
  OUTLINED_FUNCTION_0_2(v6);
  uint64_t v7 = (__n128 *)swift_allocObject();
  OUTLINED_FUNCTION_43_3(v7, (__n128)xmmword_1BF474A50);
  uint64_t v23 = ObjectType;
  uint64_t v21 = (uint64_t)v0;
  uint64_t v8 = v0;
  id v9 = (id)AMSLogKey();
  uint64_t v10 = MEMORY[0x1E4FBB1A0];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = sub_1BF465FA8();
    uint64_t v14 = v13;

    sub_1BF465408();
    sub_1BF4653F8();
    __swift_project_boxed_opaque_existential_2(&v21, v23);
    swift_getDynamicType();
    swift_getMetatypeMetadata();
    sub_1BF4653D8();
    OUTLINED_FUNCTION_39_4();
    OUTLINED_FUNCTION_6_1();
    uint64_t MetatypeMetadata = v10;
    v19[0] = v12;
    v19[1] = v14;
    sub_1BF4653D8();
    OUTLINED_FUNCTION_39_4();
  }
  else
  {
    sub_1BF465408();
    sub_1BF4653F8();
    __swift_project_boxed_opaque_existential_2(&v21, v23);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    v19[0] = DynamicType;
    sub_1BF4653D8();
    sub_1BF3E9E30((uint64_t)v19, &qword_1EBA96600);
  }
  sub_1BF4653F8();
  sub_1BF465428();
  type metadata accessor for Log();
  __swift_destroy_boxed_opaque_existential_2((uint64_t)&v21);
  uint64_t v21 = 0;
  unint64_t v22 = 0xE000000000000000;
  sub_1BF466768();
  swift_bridgeObjectRelease();
  uint64_t v21 = 0x6863206574617453;
  unint64_t v22 = 0xEF203A6465676E61;
  LOBYTE(v19[0]) = v2;
  sub_1BF465FF8();
  sub_1BF466058();
  swift_bridgeObjectRelease();
  uint64_t v23 = v10;
  sub_1BF465438();
  sub_1BF3E9E30((uint64_t)&v21, &qword_1EBA96600);
  sub_1BF42B5E4();
  swift_bridgeObjectRelease();
  uint64_t v16 = &v8[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_delegate];
  OUTLINED_FUNCTION_3_5();
  if (MEMORY[0x1C18AAE10](v16))
  {
    uint64_t v17 = *((void *)v16 + 1);
    uint64_t v18 = swift_getObjectType();
    (*(void (**)(uint64_t, char *, _UNKNOWN **, uint64_t, uint64_t))(v17 + 8))(v2, v8, &protocol witness table for VideoView, v18, v17);
    swift_unknownObjectRelease();
  }
  sub_1BF458480();
  sub_1BF457940();
  OUTLINED_FUNCTION_29_0();
}

Swift::Void __swiftcall VideoView.playbackWillEnd(in:)(Swift::Double in)
{
  OUTLINED_FUNCTION_33_4(OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_delegate);
  OUTLINED_FUNCTION_3_5();
  if (MEMORY[0x1C18AAE10]())
  {
    uint64_t v4 = *(void *)(v2 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t, Swift::Double))(v4 + 16))(v1, &protocol witness table for VideoView, ObjectType, v4, in);
    swift_unknownObjectRelease();
  }
}

void VideoView.videoDidPlayToEnd(videoPlayer:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_delegate;
  OUTLINED_FUNCTION_3_5();
  if (MEMORY[0x1C18AAE10](v2))
  {
    uint64_t v3 = *(void *)(v2 + 8);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v5 = v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_configuration;
    OUTLINED_FUNCTION_3_5();
    uint64_t v6 = type metadata accessor for VideoConfiguration();
    (*(void (**)(void, uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v3 + 24))(*(unsigned __int8 *)(v5 + *(int *)(v6 + 40)), v0, &protocol witness table for VideoView, ObjectType, v3);
    swift_unknownObjectRelease();
  }
  uint64_t v7 = (unsigned char *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_isFullScreen);
  OUTLINED_FUNCTION_3_5();
  if (*v7 == 1)
  {
    uint64_t v8 = *(void **)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController);
    if (v8)
    {
      uint64_t v9 = swift_allocObject();
      swift_unknownObjectWeakInit();
      aBlock[4] = sub_1BF4595C0;
      aBlock[5] = v9;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1BF4595C8;
      void aBlock[3] = &block_descriptor_19;
      uint64_t v10 = _Block_copy(aBlock);
      id v11 = v8;
      swift_release();
      objc_msgSend(v11, sel_exitFullScreenAnimated_completionHandler_, 1, v10);
      _Block_release(v10);
    }
  }
}

void sub_1BF459548(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x1C18AAE10](v3);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = (unsigned char *)(v4 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_isFullScreen);
    swift_beginAccess();
    *uint64_t v6 = 0;
    sub_1BF456E98();
  }
}

void sub_1BF4595C0(uint64_t a1, uint64_t a2)
{
  sub_1BF459548(a1, a2, v2);
}

void sub_1BF4595C8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t block_copy_helper_19(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_19()
{
  return swift_release();
}

void VideoView.handleVideoPlaybackFailure(_:)()
{
  type metadata accessor for VideoPlaybackFailure(0);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_8_9();
  uint64_t v3 = OUTLINED_FUNCTION_0_7();
  sub_1BF4598A8(v3, v4, v5);
  if (swift_getEnumCaseMultiPayload() == 3)
  {
    id v6 = *v0;
    id v7 = objc_msgSend(self, sel_defaultCenter);
    uint64_t v8 = (void *)sub_1BF465F78();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA942A0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1BF474A50;
    uint64_t v10 = MEMORY[0x1E4FBB1A0];
    sub_1BF466708();
    id v11 = (uint64_t *)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playbackId);
    OUTLINED_FUNCTION_3_5();
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    *(void *)(inited + 96) = v10;
    *(void *)(inited + 72) = v13;
    *(void *)(inited + 80) = v12;
    swift_bridgeObjectRetain();
    sub_1BF466708();
    *(void *)(inited + 168) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA148928);
    *(void *)(inited + 144) = v6;
    id v14 = v6;
    uint64_t v15 = sub_1BF465EC8();
    sub_1BF45AFEC((uint64_t)v8, 0, v15, v7);
  }
  else
  {
    sub_1BF4598FC((uint64_t)v0, (void (*)(void))type metadata accessor for VideoPlaybackFailure);
  }
}

uint64_t sub_1BF4598A8(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_0_3();
  uint64_t v4 = OUTLINED_FUNCTION_45_3();
  v5(v4);
  return a2;
}

uint64_t sub_1BF4598FC(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_0_3();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

void VideoView.touchesBegan(_:with:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_currentTouch;
  id v7 = *(void **)&v2[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_currentTouch];
  if (!v7
    || objc_msgSend(v7, sel_phase) == (id)3
    || (uint64_t v8 = *(void **)&v2[v6]) != 0 && objc_msgSend(v8, sel_phase) == (id)4)
  {
    uint64_t v9 = swift_bridgeObjectRetain();
    uint64_t v10 = (void *)sub_1BF4530D8(v9);
    swift_bridgeObjectRelease();
    if (v10)
    {
      id v11 = *(void **)&v3[v6];
      *(void *)&v3[v6] = v10;
      id v12 = v10;

      objc_msgSend(v12, sel_locationInView_, v3);
      id v13 = objc_msgSend(v3, sel_hitTest_withEvent_, a2);
      if (v13)
      {
        id v14 = v13;
        sub_1BF3A9E60(0, &qword_1EA148948);
        uint64_t v15 = v3;
        id v16 = v14;
        LOBYTE(v14) = sub_1BF466558();

        if ((v14 & 1) == 0)
        {
          sub_1BF3A9E60(0, &qword_1EA148938);
          sub_1BF45B088();
          id v17 = v16;
          uint64_t v18 = (void *)sub_1BF466238();
          objc_msgSend(v17, sel_touchesBegan_withEvent_, v18, a2);
        }
      }

      sub_1BF3A9E60(0, &qword_1EA148938);
      sub_1BF45B088();
      id v19 = (void *)OUTLINED_FUNCTION_30_6();
      objc_msgSendSuper2(&v20, sel_touchesBegan_withEvent_, v19, a2, v3, ObjectType, v21.receiver, v21.super_class, v22.receiver, v22.super_class);
    }
    else
    {
      sub_1BF3A9E60(0, &qword_1EA148938);
      sub_1BF45B088();
      id v19 = (void *)OUTLINED_FUNCTION_30_6();
      objc_msgSendSuper2(&v21, sel_touchesBegan_withEvent_, v19, a2, v20.receiver, v20.super_class, v3, ObjectType, v22.receiver, v22.super_class);
    }
  }
  else
  {
    sub_1BF3A9E60(0, &qword_1EA148938);
    sub_1BF45B088();
    id v19 = (void *)OUTLINED_FUNCTION_30_6();
    objc_msgSendSuper2(&v22, sel_touchesBegan_withEvent_, v19, a2, v20.receiver, v20.super_class, v21.receiver, v21.super_class, v3, ObjectType);
  }
}

void VideoView.touchesEnded(_:with:)(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_1BF459BE8(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) != 0)
  {
    id v3 = a1;
    char v4 = sub_1BF4666C8();

    return v4 & 1;
  }
  if (!*(void *)(a2 + 16)
    || (uint64_t v6 = sub_1BF466548(),
        uint64_t v7 = -1 << *(unsigned char *)(a2 + 32),
        unint64_t v8 = v6 & ~v7,
        uint64_t v9 = a2 + 56,
        ((*(void *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0))
  {
LABEL_11:
    char v12 = 0;
    return v12 & 1;
  }
  sub_1BF3A9E60(0, &qword_1EA148938);
  id v10 = *(id *)(*(void *)(a2 + 48) + 8 * v8);
  char v11 = sub_1BF466558();

  if ((v11 & 1) == 0)
  {
    uint64_t v13 = ~v7;
    unint64_t v14 = (v8 + 1) & v13;
    if ((*(void *)(v9 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      do
      {
        id v15 = *(id *)(*(void *)(a2 + 48) + 8 * v14);
        char v12 = sub_1BF466558();

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

void VideoView.touchesCancelled(_:with:)(uint64_t a1, uint64_t a2)
{
}

void sub_1BF459D6C(uint64_t a1, uint64_t a2, SEL *a3)
{
  uint64_t v5 = v3;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v9 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_currentTouch;
  id v10 = *(void **)&v5[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_currentTouch];
  if (!v10) {
    goto LABEL_8;
  }
  id v11 = v10;
  if ((sub_1BF459BE8(v11, a1) & 1) == 0)
  {

LABEL_8:
    sub_1BF3A9E60(0, &qword_1EA148938);
    sub_1BF45B088();
    id v19 = (void *)sub_1BF466238();
    objc_msgSendSuper2(&v21, *a3, v19, a2, v20.receiver, v20.super_class, v5, ObjectType);
    goto LABEL_11;
  }
  char v12 = *(void **)&v5[v9];
  *(void *)&v5[v9] = 0;

  objc_msgSend(v11, sel_locationInView_, v5);
  id v13 = objc_msgSend(v5, sel_hitTest_withEvent_, a2);
  if (v13)
  {
    unint64_t v14 = v13;
    sub_1BF3A9E60(0, &qword_1EA148948);
    id v15 = v5;
    id v16 = v14;
    LOBYTE(v14) = sub_1BF466558();

    if ((v14 & 1) == 0)
    {
      sub_1BF3A9E60(0, &qword_1EA148938);
      sub_1BF45B088();
      id v17 = v16;
      uint64_t v18 = (void *)sub_1BF466238();
      objc_msgSend(v17, *a3, v18, a2);

      id v11 = v17;
    }
  }
  else
  {
    id v16 = v11;
  }

  sub_1BF3A9E60(0, &qword_1EA148938);
  sub_1BF45B088();
  id v19 = (void *)sub_1BF466238();
  objc_msgSendSuper2(&v20, *a3, v19, a2, v5, ObjectType, v21.receiver, v21.super_class);
LABEL_11:
}

uint64_t sub_1BF459F9C(void *a1, uint64_t a2, uint64_t a3, void *a4, void (*a5)(uint64_t, void *))
{
  sub_1BF3A9E60(0, &qword_1EA148938);
  sub_1BF45B088();
  uint64_t v8 = sub_1BF466248();
  id v9 = a4;
  id v10 = a1;
  a5(v8, a4);

  return swift_bridgeObjectRelease();
}

void sub_1BF45A04C()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer);
  if (v1)
  {
    uint64_t v2 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_shouldBePlaying);
    swift_beginAccess();
    LODWORD(v2) = *v2;
    sub_1BF453504(0);
    if (v2 == 1)
    {
      VideoView.startPreloading()();
      VideoView.play()();
    }
  }
  else
  {
    sub_1BF453504(0);
  }
}

uint64_t VideoView.playerViewController(_:willBeginFullScreenPresentationWithAnimationCoordinator:)()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_fullScreenDelegate;
  if (MEMORY[0x1C18AAE10](v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_fullScreenDelegate))
  {
    uint64_t v2 = *(void *)(v1 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(ObjectType, v2);
    swift_unknownObjectRelease();
  }
  char v4 = (unsigned char *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_isTransitioningToFullscreen);
  uint64_t result = OUTLINED_FUNCTION_9_18();
  *char v4 = 1;
  return result;
}

void *sub_1BF45A268()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController);
  id v2 = v1;
  return v1;
}

id sub_1BF45A2CC()
{
  return OUTLINED_FUNCTION_28_5(OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playButton);
}

id VideoView.__allocating_init(frame:)()
{
  OUTLINED_FUNCTION_10_1();
  id v1 = objc_allocWithZone(v0);
  double v4 = OUTLINED_FUNCTION_9_2();

  return objc_msgSend(v2, v3, v4);
}

void VideoView.init(frame:)()
{
}

id VideoView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t (*sub_1BF45A598(void *a1))()
{
  id v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_objectGraph;
  v3[4] = v1;
  v3[5] = v4;
  swift_beginAccess();
  v3[3] = swift_weakLoadStrong();
  return sub_1BF4532D4;
}

void sub_1BF45A61C()
{
  OUTLINED_FUNCTION_34_4();
  swift_weakAssign();
  if (v1)
  {
    swift_release();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_release();
  }

  free(v0);
}

uint64_t (*sub_1BF45A698(void *a1))()
{
  id v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_delegate;
  v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x1C18AAE10](v5);
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_1BF4562C8;
}

void sub_1BF45A720()
{
  OUTLINED_FUNCTION_34_4();
  *(void *)(v0[5] + v0[6] + 8) = v0[4];
  swift_unknownObjectWeakAssign();
  if (v1)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }

  free(v0);
}

void (*sub_1BF45A7B4(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1BF4572D0;
}

id sub_1BF45A840()
{
  id v1 = objc_msgSend(v0, sel_superview);

  return v1;
}

id sub_1BF45A880(uint64_t a1)
{
  return objc_msgSend(v1, sel_isDescendantOfView_, a1);
}

id sub_1BF45A8AC(uint64_t a1)
{
  return objc_msgSend(v1, sel_convertRect_toView_, a1);
}

uint64_t sub_1BF45A8C0()
{
  uint64_t v0 = sub_1BF466448();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  id v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1BF466418();
  MEMORY[0x1F4188790](v4);
  uint64_t v5 = sub_1BF4651C8();
  MEMORY[0x1F4188790](v5 - 8);
  sub_1BF3A9E60(0, (unint64_t *)&qword_1EBA96560);
  sub_1BF4651B8();
  v7[1] = MEMORY[0x1E4FBC860];
  sub_1BF45B330((unint64_t *)&unk_1EBA96550, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA964E8);
  sub_1BF3CEC60(&qword_1EBA964F0, &qword_1EBA964E8);
  sub_1BF466608();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FBCC58], v0);
  uint64_t result = sub_1BF466498();
  qword_1EA1488C0 = result;
  return result;
}

void sub_1BF45AB10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v12[1] = *(id *)MEMORY[0x1E4F143B8];
  id v8 = objc_msgSend(self, sel_sharedInstance);
  v12[0] = 0;
  LODWORD(a4) = objc_msgSend(v8, sel_setCategory_mode_options_error_, a3, a4, a5, v12);

  if (a4)
  {
    id v9 = v12[0];
  }
  else
  {
    id v10 = v12[0];
    id v11 = (void *)sub_1BF464D88();

    swift_willThrow();
  }
  sub_1BF45AD98();
}

void sub_1BF45AC38()
{
  v10[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_sharedInstance);
  unsigned __int8 v2 = objc_msgSend(v1, sel_categoryOptions);

  if ((v2 & 1) == 0)
  {
    id v3 = objc_msgSend(v0, sel_sharedInstance);
    uint64_t v4 = *MEMORY[0x1E4F14F98];
    uint64_t v5 = *MEMORY[0x1E4F15050];
    v10[0] = 0;
    unsigned int v6 = objc_msgSend(v3, sel_setCategory_mode_options_error_, v4, v5, 1, v10);

    if (v6)
    {
      id v7 = v10[0];
    }
    else
    {
      id v8 = v10[0];
      id v9 = (void *)sub_1BF464D88();

      swift_willThrow();
    }
  }
  sub_1BF45AD98();
}

void sub_1BF45AD98()
{
  OUTLINED_FUNCTION_26_0();
  uint64_t v20 = v1;
  uint64_t v21 = v2;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = sub_1BF465188();
  OUTLINED_FUNCTION_0_0();
  uint64_t v9 = v8;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_1_8();
  uint64_t v13 = v12 - v11;
  uint64_t v22 = sub_1BF4651C8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v15 = v14;
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_1_4();
  sub_1BF3A9E60(0, (unint64_t *)&qword_1EBA96560);
  id v17 = (void *)sub_1BF466458();
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v6;
  *(void *)(v18 + 24) = v4;
  v23[4] = v20;
  v23[5] = v18;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 1107296256;
  v23[2] = sub_1BF3AC814;
  void v23[3] = v21;
  id v19 = _Block_copy(v23);
  sub_1BF3CBD0C(v6);
  swift_release();
  sub_1BF4651A8();
  v23[0] = MEMORY[0x1E4FBC860];
  sub_1BF45B330((unint64_t *)&qword_1EBA963D0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA964D8);
  sub_1BF3CEC60((unint64_t *)&qword_1EBA964E0, &qword_1EBA964D8);
  sub_1BF466608();
  MEMORY[0x1C18A9C40](0, v0, v13, v19);
  _Block_release(v19);

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v13, v7);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v0, v22);
  OUTLINED_FUNCTION_29_0();
}

void sub_1BF45AFEC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = (id)sub_1BF465E98();
  swift_bridgeObjectRelease();
  objc_msgSend(a4, sel_postNotificationName_object_userInfo_, a1, a2, v7);
}

unint64_t sub_1BF45B088()
{
  unint64_t result = qword_1EA148940;
  if (!qword_1EA148940)
  {
    sub_1BF3A9E60(255, &qword_1EA148938);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA148940);
  }
  return result;
}

uint64_t sub_1BF45B0E8()
{
  return type metadata accessor for VideoView();
}

uint64_t type metadata accessor for VideoView()
{
  uint64_t result = qword_1EA148A40;
  if (!qword_1EA148A40) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1BF45B138()
{
  sub_1BF4476F8();
  if (v0 <= 0x3F)
  {
    sub_1BF464E58();
    if (v1 <= 0x3F)
    {
      type metadata accessor for VideoConfiguration();
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

uint64_t sub_1BF45B2D0()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return MEMORY[0x1F4186498](v0, 56, 7);
}

void sub_1BF45B320()
{
  sub_1BF45AB10(v0[2], v0[3], v0[4], v0[5], v0[6]);
}

uint64_t sub_1BF45B330(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1BF45B380(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0) {
    return sub_1BF4666D8();
  }
  else {
    return 1 << *(unsigned char *)(a1 + 32);
  }
}

void sub_1BF45B3D4(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      if (a4 < 0) {
        uint64_t v7 = a4;
      }
      else {
        uint64_t v7 = a4 & 0xFFFFFFFFFFFFFF8;
      }
      MEMORY[0x1C18A9E60](a1, a2, v7);
      sub_1BF3A9E60(0, &qword_1EA148938);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
LABEL_27:
    __break(1u);
    return;
  }
  if (a3) {
    goto LABEL_13;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_20;
  }
  __break(1u);
LABEL_13:
  if (sub_1BF466668() != *(_DWORD *)(a4 + 36))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  sub_1BF466678();
  sub_1BF3A9E60(0, &qword_1EA148938);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  uint64_t v4 = v17;
  swift_unknownObjectRelease();
  uint64_t v8 = sub_1BF466548();
  uint64_t v9 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v6 = v8 & ~v9;
  if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
  {
LABEL_26:

    __break(1u);
    goto LABEL_27;
  }
  id v10 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
  char v11 = sub_1BF466558();

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = ~v9;
    do
    {
      unint64_t v6 = (v6 + 1) & v12;
      if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_26;
      }
      id v13 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
      char v14 = sub_1BF466558();
    }
    while ((v14 & 1) == 0);
  }

LABEL_20:
  uint64_t v15 = *(void **)(*(void *)(a4 + 48) + 8 * v6);

  id v16 = v15;
}

uint64_t sub_1BF45B64C(uint64_t a1)
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
  uint64_t v2 = 64;
  for (uint64_t i = 9; i - 7 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    unint64_t v1 = *(void *)(a1 + 8 * i);
    v2 += 64;
    if (v1) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

BOOL sub_1BF45B6CC(uint64_t a1, int a2, char a3, uint64_t a4, int a5, char a6)
{
  if (a3)
  {
    if (a6) {
LABEL_9:
    }
      JUMPOUT(0x1C18A9E10);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (a6) {
    goto LABEL_8;
  }
  if (a2 != a5)
  {
    __break(1u);
    goto LABEL_8;
  }
  return a1 == a4;
}

uint64_t sub_1BF45B700(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1BF45B70C(char a1)
{
  sub_1BF457AE0(a1, v1);
}

uint64_t sub_1BF45B714()
{
  return MEMORY[0x1F4186498](v0, 25, 7);
}

void sub_1BF45B750()
{
  sub_1BF4583B0(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_1BF45B75C()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BF45B76C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

id sub_1BF45B794()
{
  return sub_1BF458304(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

id sub_1BF45B7A0()
{
  double v1 = 0.0;
  if (*(unsigned char *)(v0 + 24)) {
    double v1 = 1.0;
  }
  return objc_msgSend(*(id *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playButton), sel_setAlpha_, v1);
}

void sub_1BF45B7D4()
{
}

uint64_t objectdestroy_12Tm()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BF45B820()
{
  double v1 = *(uint64_t (**)(void))(v0 + 16);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t sub_1BF45B850(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_0_3();
  uint64_t v4 = OUTLINED_FUNCTION_45_3();
  v5(v4);
  return a2;
}

void sub_1BF45B8A0()
{
  sub_1BF454EDC(v0);
}

uint64_t sub_1BF45B8A8()
{
  return MEMORY[0x1F4186498](v0, 40, 7);
}

char *sub_1BF45B8E0()
{
  return sub_1BF458F48(*(char **)(v0 + 16), *(double *)(v0 + 24), *(double *)(v0 + 32));
}

uint64_t OUTLINED_FUNCTION_13_16()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_14_10()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_15_8(uint64_t a1)
{
  *(void *)(v2 - 144) = a1;
  *(void *)(v2 - 168) = v1;
  return sub_1BF4653D8();
}

uint64_t OUTLINED_FUNCTION_25_6@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 + a1 + 8) = 0;
  return swift_unknownObjectWeakInit();
}

uint64_t OUTLINED_FUNCTION_26_7()
{
  return sub_1BF3E9E30(v1 - 144, v0);
}

id OUTLINED_FUNCTION_28_5@<X0>(uint64_t a1@<X8>)
{
  return *(id *)(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_29_6()
{
  return sub_1BF4651C8();
}

uint64_t OUTLINED_FUNCTION_30_6()
{
  return sub_1BF466238();
}

uint64_t OUTLINED_FUNCTION_32_4()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_33_4@<X0>(uint64_t a1@<X8>)
{
  return v1 + a1;
}

double OUTLINED_FUNCTION_36_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_37_4()
{
  *(void *)(v2 - 112) = v0;
  *(void *)(v2 - 104) = (v1 - 32) | 0x8000000000000000;
  return sub_1BF465438();
}

uint64_t OUTLINED_FUNCTION_39_4()
{
  return sub_1BF3E9E30(v1 - 144, v0);
}

uint64_t OUTLINED_FUNCTION_40_1(uint64_t a1)
{
  *(void *)(v2 - 88) = a1;
  *(void *)(v2 - 112) = v1;
  return AMSLogKey();
}

__n128 *OUTLINED_FUNCTION_43_3(__n128 *result, __n128 a2)
{
  result[1] = a2;
  return result;
}

double OUTLINED_FUNCTION_44_3()
{
  return 0.0;
}

uint64_t OUTLINED_FUNCTION_45_3()
{
  return v0;
}

uint64_t static NSNotificationName.VideoDecoderUnavailable.getter()
{
  return sub_1BF465F78();
}

const char *VideoDecoderUnavailableUserInfoKey.playbackId.unsafeMutableAddressor()
{
  return "PlaybackId";
}

const char *VideoDecoderUnavailableUserInfoKey.error.unsafeMutableAddressor()
{
  return "videoViewError";
}

uint64_t static VideoDecoderUnavailableUserInfoKey.playbackId.getter()
{
  return 0x6B63616279616C50;
}

uint64_t static VideoDecoderUnavailableUserInfoKey.error.getter()
{
  return 0x6569566F65646976;
}

ValueMetadata *type metadata accessor for VideoDecoderUnavailableUserInfoKey()
{
  return &type metadata for VideoDecoderUnavailableUserInfoKey;
}

void sub_1BF45BBA8(char a1, double a2, double a3, double a4, double a5)
{
  id v11 = objc_msgSend(v5, sel_superview);
  if (v11)
  {
    uint64_t v12 = v11;
    if (a1)
    {
      id v13 = objc_msgSend(v11, sel_safeAreaLayoutGuide);
      id v14 = objc_msgSend(v13, sel_topAnchor);

      id v15 = objc_msgSend(v12, sel_safeAreaLayoutGuide);
      id v16 = objc_msgSend(v15, sel_bottomAnchor);
    }
    else
    {
      id v14 = objc_msgSend(v11, sel_topAnchor);
      id v16 = objc_msgSend(v12, sel_bottomAnchor);
    }
    objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94860);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_1BF47AB00;
    id v18 = objc_msgSend(v5, sel_topAnchor);
    id v19 = objc_msgSend(v18, sel_constraintEqualToAnchor_constant_, v14, a2);

    *(void *)(v17 + 32) = v19;
    id v20 = objc_msgSend(v5, sel_leadingAnchor);
    id v21 = objc_msgSend(v12, sel_leadingAnchor);
    id v22 = objc_msgSend(v20, sel_constraintEqualToAnchor_constant_, v21, a3);

    *(void *)(v17 + 40) = v22;
    id v23 = objc_msgSend(v5, sel_bottomAnchor);
    id v24 = objc_msgSend(v23, sel_constraintEqualToAnchor_constant_, v16, -a4);

    *(void *)(v17 + 48) = v24;
    id v25 = objc_msgSend(v5, sel_trailingAnchor);
    id v26 = objc_msgSend(v12, sel_trailingAnchor);
    id v27 = objc_msgSend(v25, sel_constraintEqualToAnchor_constant_, v26, -a5);

    *(void *)(v17 + 56) = v27;
    sub_1BF466168();
    sub_1BF3BC5DC();
    uint64_t v30 = sub_1BF466128();
    swift_bridgeObjectRelease();
    objc_msgSend(v12, sel_addConstraints_, v30);

    OUTLINED_FUNCTION_0_37();
  }
  else
  {
    OUTLINED_FUNCTION_0_37();
  }
}

void sub_1BF45BEB0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  id v8 = objc_msgSend(v3, sel_superview);
  if (v8)
  {
    id v24 = v8;
    objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA94860);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_1BF47AB10;
    id v10 = objc_msgSend(v4, sel_centerXAnchor);
    id v11 = objc_msgSend(v24, sel_centerXAnchor);
    id v12 = objc_msgSend(v10, sel_constraintEqualToAnchor_, v11);

    *(void *)(v9 + 32) = v12;
    id v13 = objc_msgSend(v4, sel_centerYAnchor);
    id v14 = objc_msgSend(v24, sel_centerYAnchor);
    id v15 = objc_msgSend(v13, sel_constraintEqualToAnchor_, v14);

    *(void *)(v9 + 40) = v15;
    sub_1BF466168();
    sub_1BF3BC5DC();
    id v16 = (void *)sub_1BF466128();
    swift_bridgeObjectRelease();
    objc_msgSend(v24, sel_addConstraints_, v16);

    if ((a3 & 1) == 0)
    {
      double v17 = *(double *)&a2;
      uint64_t v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_1BF47AB10;
      id v19 = objc_msgSend(v4, sel_widthAnchor);
      id v20 = objc_msgSend(v19, sel_constraintEqualToConstant_, *(double *)&a1);

      *(void *)(v18 + 32) = v20;
      id v21 = objc_msgSend(v4, sel_heightAnchor);
      id v22 = objc_msgSend(v21, sel_constraintEqualToConstant_, v17);

      *(void *)(v18 + 40) = v22;
      sub_1BF466168();
      id v23 = (void *)sub_1BF466128();
      swift_bridgeObjectRelease();
      objc_msgSend(v4, sel_addConstraints_, v23);
    }
  }
}

void sub_1BF45C1B4(char a1)
{
  id v3 = objc_msgSend(v1, sel_layer);
  id v5 = v3;
  uint64_t v4 = (void *)MEMORY[0x1E4F39EA0];
  if (a1) {
    uint64_t v4 = (void *)MEMORY[0x1E4F39EA8];
  }
  objc_msgSend(v3, sel_setCornerCurve_, *v4);
}

uint64_t sub_1BF45C234(void *a1, uint64_t a2)
{
  uint64_t v5 = sub_1BF465508();
  OUTLINED_FUNCTION_0_0();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_52_0();
  uint64_t v9 = sub_1BF45C480(a1);
  if (!v9) {
    return 0;
  }
  uint64_t v10 = v9;
  sub_1BF465708();
  sub_1BF465CC8();
  uint64_t v11 = (*(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 32))(a1, v2, a2);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v2, v5);
  swift_release();
  return v11;
}

uint64_t sub_1BF45C330(void *a1, uint64_t a2)
{
  uint64_t v5 = sub_1BF465508();
  OUTLINED_FUNCTION_0_0();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_52_0();
  uint64_t v9 = sub_1BF45C480(a1);
  if (!v9
    || (uint64_t v10 = v9,
        sub_1BF465708(),
        sub_1BF465CC8(),
        uint64_t v11 = (*(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 32))(a1, v2, a2),
        (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v2, v5),
        swift_release(),
        !v11))
  {
    sub_1BF45CC5C();
    swift_allocError();
    objc_allocWithZone((Class)type metadata accessor for ErrorViewController());
    swift_retain();
    sub_1BF415E08();
    return v12;
  }
  return v11;
}

uint64_t sub_1BF45C480(void *a1)
{
  uint64_t v2 = sub_1BF465418();
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v3 = sub_1BF465388();
  uint64_t v24 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1BF465508();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v23 - v11;
  sub_1BF465708();
  sub_1BF465CC8();
  id v25 = a1;
  sub_1BF465398();
  id v13 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  id v26 = v12;
  v13(v10, v12, v6);
  id v14 = (void *)Location.init(deserializing:using:)((uint64_t)v5, (uint64_t)v10);
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  type metadata accessor for PageLoader();
  sub_1BF465CC8();
  uint64_t v24 = v20;
  id v25 = v14;
  uint64_t v21 = PageLoader.pageDefinition(withLocation:)(v14, v16, v20, v18);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v26, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v21;
}

unint64_t sub_1BF45CC5C()
{
  unint64_t result = qword_1EA148A70;
  if (!qword_1EA148A70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA148A70);
  }
  return result;
}

uint64_t sub_1BF45CCA8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

unsigned char *storeEnumTagSinglePayload for ViewControllerFactory.PresentationError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1BF45CD84);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ViewControllerFactory.PresentationError()
{
  return &type metadata for ViewControllerFactory.PresentationError;
}

ValueMetadata *type metadata accessor for ViewControllerFactory()
{
  return &type metadata for ViewControllerFactory;
}

unint64_t sub_1BF45CDD4()
{
  unint64_t result = qword_1EA148A78;
  if (!qword_1EA148A78)
  {
    type metadata accessor for FlowAction();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA148A78);
  }
  return result;
}

uint64_t sub_1BF45CE24(void *a1)
{
  return sub_1BF45C330(a1, *v1);
}

unint64_t sub_1BF45CE30()
{
  unint64_t result = qword_1EA148A80;
  if (!qword_1EA148A80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA148A80);
  }
  return result;
}

uint64_t sub_1BF45CE7C(uint64_t a1, uint64_t a2)
{
  return sub_1BF45D048(a1, a2, (void (*)(void))type metadata accessor for Artwork, (uint64_t (*)(uint64_t, uint64_t))Artwork.__allocating_init(deserializing:using:));
}

uint64_t sub_1BF45CEA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BF465508();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = &v19[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_1BF465388();
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = &v19[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *, uint64_t))(v11 + 16))(v10, a1);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  return VisualAreaArtwork.LayoutConstraints.init(deserializing:using:)((uint64_t)v10, (uint64_t)v7, v12, v13, v14, v15, v16, v17);
}

uint64_t sub_1BF45D048(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v8 = sub_1BF465508();
  OUTLINED_FUNCTION_0_0();
  uint64_t v10 = v9;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_1_8();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = sub_1BF465388();
  OUTLINED_FUNCTION_0_0();
  uint64_t v17 = v16;
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_1_8();
  uint64_t v21 = v20 - v19;
  a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v21, a1, v15);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v14, a2, v8);
  return a4(v21, v14);
}

uint64_t sub_1BF45D19C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BF465508();
  OUTLINED_FUNCTION_0_0();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_1_8();
  uint64_t v10 = v9 - v8;
  sub_1BF465388();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_1_8();
  uint64_t v14 = v13 - v12;
  (*(void (**)(uint64_t, uint64_t))(v15 + 16))(v13 - v12, a1);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v10, a2, v4);
  return Location.init(deserializing:using:)(v14, v10);
}

uint64_t VisualAreaArtwork.accessibilityAlignment.getter()
{
  return *v0;
}

uint64_t VisualAreaArtwork.artwork.getter()
{
  return swift_retain();
}

uint64_t VisualAreaArtwork.horizontalAlignment.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t VisualAreaArtwork.layoutConstraints.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t VisualAreaArtwork.init(deserializing:using:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_1BF3B60B8();
  if (v2)
  {

    char v6 = 4;
  }
  else
  {
    char v6 = v5;
  }
  MEMORY[0x1F4188790](v5);
  uint64_t v20 = a1;
  uint64_t v7 = sub_1BF3B5124(0x6B726F77747261, 0xE700000000000000, &type metadata for VisualAreaArtwork, sub_1BF45D9A4, &v19);
  MEMORY[0x1F4188790](v7);
  uint64_t v20 = a1;
  swift_retain();
  sub_1BF3B5428();
  uint64_t v9 = v8;
  int v21 = v10;
  uint64_t v22 = v11;
  uint64_t v23 = v12;
  sub_1BF3B60B8();
  char v14 = v13;
  sub_1BF465508();
  OUTLINED_FUNCTION_1_18();
  OUTLINED_FUNCTION_2_5();
  v15();
  sub_1BF465388();
  OUTLINED_FUNCTION_1_18();
  OUTLINED_FUNCTION_2_5();
  v16();
  uint64_t result = swift_release();
  *(unsigned char *)a2 = v6;
  *(void *)(a2 + 8) = v7;
  *(unsigned char *)(a2 + 16) = v14;
  uint64_t v18 = v22;
  *(void *)(a2 + 24) = v23;
  *(void *)(a2 + 32) = v18;
  *(void *)(a2 + 40) = v9;
  *(unsigned char *)(a2 + 48) = v21 & 1;
  return result;
}

uint64_t sub_1BF45D600()
{
  uint64_t v0 = sub_1BF4668B8();
  swift_bridgeObjectRelease();
  if (v0 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (v0) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t sub_1BF45D654(char a1)
{
  if (a1) {
    return 0x6D6F74737563;
  }
  else {
    return 0x3630335F61657261;
  }
}

double sub_1BF45D68C@<D0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  VisualAreaArtwork.init(deserializing:using:)(a1, (uint64_t)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    double result = *(double *)&v7;
    *(_OWORD *)(a2 + 32) = v7;
    *(unsigned char *)(a2 + 48) = v8;
  }
  return result;
}

uint64_t sub_1BF45D6DC(char *a1, char *a2)
{
  return sub_1BF3B0F1C(*a1, *a2);
}

uint64_t sub_1BF45D6E8()
{
  return sub_1BF3A3AFC();
}

uint64_t sub_1BF45D6F0()
{
  return sub_1BF3B2FAC();
}

uint64_t sub_1BF45D6F8()
{
  return sub_1BF3A3CB8();
}

uint64_t sub_1BF45D700@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1BF45D600();
  *a1 = result;
  return result;
}

uint64_t sub_1BF45D730@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1BF45D654(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t VisualAreaArtwork.LayoutConstraints.init(deserializing:using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1BF3B5F40(1684957547, 0xE400000000000000, (uint64_t)&type metadata for VisualAreaArtwork.LayoutConstraints, a4, a5, a6, a7, a8);
  if (!v8)
  {
    if (v10)
    {
      sub_1BF425AC8();
      sub_1BF425AC8();
      uint64_t v15 = v14;
      sub_1BF425AC8();
      uint64_t v9 = v15;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  sub_1BF465508();
  OUTLINED_FUNCTION_1_18();
  OUTLINED_FUNCTION_2_5();
  v11();
  sub_1BF465388();
  OUTLINED_FUNCTION_1_18();
  OUTLINED_FUNCTION_2_5();
  v12();
  return v9;
}

uint64_t sub_1BF45D934@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t result = VisualAreaArtwork.LayoutConstraints.init(deserializing:using:)(a1, a2, a3, a4, a5, a6, a7, a8);
  if (!v9)
  {
    *(void *)a9 = result;
    *(void *)(a9 + 8) = v12;
    *(void *)(a9 + 16) = v13;
    *(unsigned char *)(a9 + 24) = v14 & 1;
  }
  return result;
}

uint64_t sub_1BF45D96C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = sub_1BF45CEA8(a1, a2);
  *(void *)a3 = result;
  *(void *)(a3 + 8) = v5;
  *(void *)(a3 + 16) = v6;
  *(unsigned char *)(a3 + 24) = v7;
  *(unsigned char *)(a3 + 25) = v8 & 1;
  return result;
}

uint64_t sub_1BF45D9A4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1BF45D048(a1, *(void *)(v2 + 16), (void (*)(void))type metadata accessor for DynamicArtwork, DynamicArtwork.__allocating_init(deserializing:using:));
  *a2 = result;
  return result;
}

uint64_t sub_1BF45D9F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1BF45D96C(a1, *(void *)(v2 + 16), a2);
}

uint64_t destroy for VisualAreaArtwork()
{
  return swift_release();
}

uint64_t initializeWithCopy for VisualAreaArtwork(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 33) = *(_OWORD *)(a2 + 33);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for VisualAreaArtwork(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 33) = *(_OWORD *)(a2 + 33);
  *(_OWORD *)(a1 + 24) = v4;
  return a1;
}

uint64_t assignWithTake for VisualAreaArtwork(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 33) = *(_OWORD *)(a2 + 33);
  return a1;
}

uint64_t getEnumTagSinglePayload for VisualAreaArtwork(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 49))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for VisualAreaArtwork(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 49) = 1;
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
    *(unsigned char *)(result + 49) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VisualAreaArtwork()
{
  return &type metadata for VisualAreaArtwork;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for VisualAreaArtwork.LayoutConstraints(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for VisualAreaArtwork.LayoutConstraints(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)(result + 16) = 0;
    *(_DWORD *)__n128 result = a2 - 1;
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
  *(unsigned char *)(result + 25) = v3;
  return result;
}

uint64_t sub_1BF45DC20(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1BF45DC3C(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
    char v2 = 1;
  }
  else
  {
    char v2 = 0;
  }
  *(unsigned char *)(result + 24) = v2;
  return result;
}

ValueMetadata *type metadata accessor for VisualAreaArtwork.LayoutConstraints()
{
  return &type metadata for VisualAreaArtwork.LayoutConstraints;
}

unsigned char *storeEnumTagSinglePayload for VisualAreaArtwork.LayoutConstraints.Keys.Kind(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x1BF45DD3CLL);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VisualAreaArtwork.LayoutConstraints.Keys.Kind()
{
  return &type metadata for VisualAreaArtwork.LayoutConstraints.Keys.Kind;
}

unint64_t sub_1BF45DD78()
{
  unint64_t result = qword_1EA148A88;
  if (!qword_1EA148A88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA148A88);
  }
  return result;
}

uint64_t AlignableVisualAreaArtwork.accessibilityAlignment.getter()
{
  return *v0;
}

uint64_t AlignableVisualAreaArtwork.artwork.getter()
{
  return swift_retain();
}

uint64_t AlignableVisualAreaArtwork.sizeConstraints.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BF3AA4C4(v1 + 16, a1);
}

uint64_t AlignableVisualAreaArtwork.horizontalAlignment.getter()
{
  return *(unsigned __int8 *)(v0 + 56);
}

uint64_t AlignableVisualAreaArtwork.init(artwork:sizeConstraints:horizontalAlignment:accessibilityAlignment:)@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, char a3@<W2>, char a4@<W3>, uint64_t a5@<X8>)
{
  *(void *)(a5 + 8) = a1;
  uint64_t result = sub_1BF3A6D50(a2, a5 + 16);
  *(unsigned char *)(a5 + 56) = a3;
  *(unsigned char *)a5 = a4;
  return result;
}

uint64_t sub_1BF45DE34()
{
  return swift_retain();
}

uint64_t sub_1BF45DE3C@<X0>(uint64_t a1@<X8>)
{
  return sub_1BF3AA4C4(v1 + 16, a1);
}

id AlignableVisualAreaImageViewContainer.visualAreaImageView.getter()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_visualAreaImageView));
}

uint64_t AlignableVisualAreaImageViewContainer.horizontalAlignment.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_horizontalAlignment);
  OUTLINED_FUNCTION_7_12();
  return *v1;
}

uint64_t AlignableVisualAreaImageViewContainer.horizontalAlignment.setter(char a1)
{
  uint64_t result = OUTLINED_FUNCTION_1_21();
  unsigned char *v1 = a1;
  return result;
}

uint64_t (*AlignableVisualAreaImageViewContainer.horizontalAlignment.modify())()
{
  return j__swift_endAccess;
}

uint64_t AlignableVisualAreaImageViewContainer.accessibilityAlignment.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_accessibilityAlignment);
  OUTLINED_FUNCTION_7_12();
  return *v1;
}

uint64_t AlignableVisualAreaImageViewContainer.accessibilityAlignment.setter(char a1)
{
  uint64_t result = OUTLINED_FUNCTION_1_21();
  unsigned char *v1 = a1;
  return result;
}

uint64_t (*AlignableVisualAreaImageViewContainer.accessibilityAlignment.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BF45DFD0()
{
  uint64_t v1 = v0;
  id v2 = objc_msgSend(v0, sel_traitCollection);
  char v3 = sub_1BF4664C8();

  if (v3)
  {
    unsigned int v4 = &v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_accessibilityAlignment];
    OUTLINED_FUNCTION_3_5();
    uint64_t result = *v4;
    if (result != 4) {
      return result;
    }
    unsigned int v6 = &v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_horizontalAlignment];
  }
  else
  {
    unsigned int v6 = &v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_horizontalAlignment];
  }
  OUTLINED_FUNCTION_7_12();
  return *v6;
}

void *VisualAreaImageView.SizeConstraints.zero.unsafeMutableAddressor()
{
  return &static VisualAreaImageView.SizeConstraints.zero;
}

char *AlignableVisualAreaImageViewContainer.__allocating_init(artworkSize:sizeConstraints:horizontalAlignment:accessibilityAlignment:)(uint64_t a1, char a2, char a3)
{
  OUTLINED_FUNCTION_35_3();
  id v7 = objc_allocWithZone(v3);
  return AlignableVisualAreaImageViewContainer.init(artworkSize:sizeConstraints:horizontalAlignment:accessibilityAlignment:)(a1, a2, a3);
}

char *AlignableVisualAreaImageViewContainer.init(artworkSize:sizeConstraints:horizontalAlignment:accessibilityAlignment:)(uint64_t a1, char a2, char a3)
{
  OUTLINED_FUNCTION_35_3();
  id v7 = &v3[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_accessibilityAlignment];
  v3[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_accessibilityAlignment] = 4;
  sub_1BF3AA4C4(v8, (uint64_t)v13);
  objc_allocWithZone((Class)type metadata accessor for VisualAreaImageView());
  uint64_t v9 = v3;
  *(void *)&v9[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_visualAreaImageView] = sub_1BF45EC30((uint64_t)v13);
  v9[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_horizontalAlignment] = a2;
  OUTLINED_FUNCTION_9_18();
  *id v7 = a3;

  v12.receiver = v9;
  v12.super_class = (Class)type metadata accessor for AlignableVisualAreaImageViewContainer();
  char v10 = (char *)OUTLINED_FUNCTION_18_8(&v12, sel_initWithFrame_);
  objc_msgSend(v10, sel_addSubview_, *(void *)&v10[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_visualAreaImageView]);
  __swift_destroy_boxed_opaque_existential_2(a1);
  return v10;
}

uint64_t type metadata accessor for VisualAreaImageView()
{
  return self;
}

void sub_1BF45E20C()
{
  v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_accessibilityAlignment] = 4;

  OUTLINED_FUNCTION_8_21();
  __break(1u);
}

Swift::Void __swiftcall AlignableVisualAreaImageViewContainer.layoutSubviews()()
{
  uint64_t v5 = sub_1BF465418();
  uint64_t v6 = OUTLINED_FUNCTION_44(v5);
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_1_2();
  id v7 = (objc_class *)type metadata accessor for AlignableVisualAreaImageViewContainer();
  v42.receiver = v0;
  v42.super_class = v7;
  objc_msgSendSuper2(&v42, sel_layoutSubviews);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
  uint64_t v8 = sub_1BF465478();
  OUTLINED_FUNCTION_0_2(v8);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BF474840;
  uint64_t v41 = (uint64_t)v7;
  v40[0] = v0;
  uint64_t v9 = v0;
  id v10 = (id)AMSLogKey();
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = sub_1BF465FA8();
    uint64_t v14 = v13;

    OUTLINED_FUNCTION_6_10();
    OUTLINED_FUNCTION_2_2();
    __swift_project_boxed_opaque_existential_2(v40, v41);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    v38[0] = DynamicType;
    sub_1BF4653D8();
    sub_1BF3A7DB8((uint64_t)v38);
    OUTLINED_FUNCTION_6_1();
    uint64_t MetatypeMetadata = MEMORY[0x1E4FBB1A0];
    v38[0] = v12;
    v38[1] = v14;
    sub_1BF4653D8();
  }
  else
  {
    OUTLINED_FUNCTION_11_5();
    OUTLINED_FUNCTION_2_2();
    __swift_project_boxed_opaque_existential_2(v40, v41);
    uint64_t v16 = swift_getDynamicType();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    v38[0] = v16;
    sub_1BF4653D8();
  }
  sub_1BF3A7DB8((uint64_t)v38);
  sub_1BF4653F8();
  sub_1BF465428();
  type metadata accessor for Log();
  __swift_destroy_boxed_opaque_existential_2((uint64_t)v40);
  sub_1BF4653A8();
  OUTLINED_FUNCTION_13_17();
  OUTLINED_FUNCTION_14_11();
  type metadata accessor for CGRect(0);
  uint64_t v41 = v17;
  uint64_t v18 = (void *)swift_allocObject();
  v40[0] = v18;
  v18[2] = v1;
  v18[3] = v2;
  v18[4] = v3;
  v18[5] = v4;
  sub_1BF465438();
  sub_1BF3A7DB8((uint64_t)v40);
  sub_1BF42B5E4();
  swift_bridgeObjectRelease();
  uint64_t v19 = *(void **)&v9[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_visualAreaImageView];
  OUTLINED_FUNCTION_13_17();
  double Width = CGRectGetWidth(v43);
  VisualAreaImageView.updateArtworkSizeForMaxWidth(_:)(Width);
  OUTLINED_FUNCTION_13_17();
  objc_msgSend(v19, sel_measurementsWithFitting_in_, v9, v21, v22);
  double v24 = v23;
  double v26 = v25;
  OUTLINED_FUNCTION_13_17();
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  char v35 = sub_1BF45DFD0();
  id v36 = objc_msgSend(v9, sel_traitCollection);
  char v37 = sub_1BF3FB600(v35, v36);
  CGRect.alignedFrame(for:resolvedHorizontalAlignment:)(v37, v24, v26, v28, v30, v32, v34);
  OUTLINED_FUNCTION_14_11();

  OUTLINED_FUNCTION_13_17();
  sub_1BF4664E8();
  objc_msgSend(v19, sel_setFrame_);
}

uint64_t AlignableVisualAreaImageViewContainer.apply(model:asPartOf:)(unsigned __int8 *a1, uint64_t a2)
{
  int v5 = a1[56];
  if (v5 != 4)
  {
    uint64_t v6 = (unsigned char *)(v2
                 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_horizontalAlignment);
    OUTLINED_FUNCTION_9_18();
    *uint64_t v6 = v5;
  }
  int v7 = *a1;
  if (v7 != 4)
  {
    uint64_t v8 = (unsigned char *)(v2
                 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_accessibilityAlignment);
    OUTLINED_FUNCTION_9_18();
    *uint64_t v8 = v7;
  }
  return sub_1BF45FA90((uint64_t)a1, a2, *(void **)(v2+ OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_visualAreaImageView));
}

id AlignableVisualAreaImageViewContainer.hasContent.getter()
{
  return objc_msgSend(*(id *)(v0+ OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_visualAreaImageView), sel_hasContent);
}

id _s27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainerC12sizeThatFitsySo6CGSizeVAFF_0()
{
  return objc_msgSend(v0, sel_measurementsWithFitting_in_, v0);
}

id AlignableVisualAreaImageViewContainer.measurements(fitting:in:)(uint64_t a1, double a2, double a3)
{
  uint64_t v7 = sub_1BF465418();
  uint64_t v8 = OUTLINED_FUNCTION_44(v7);
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_1_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
  uint64_t v9 = sub_1BF465478();
  OUTLINED_FUNCTION_0_2(v9);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BF474840;
  uint64_t v23 = type metadata accessor for AlignableVisualAreaImageViewContainer();
  v22[0] = v3;
  id v10 = v3;
  id v11 = (id)AMSLogKey();
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = sub_1BF465FA8();
    uint64_t v15 = v14;

    OUTLINED_FUNCTION_6_10();
    OUTLINED_FUNCTION_2_2();
    uint64_t v16 = OUTLINED_FUNCTION_20_7();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    v20[0] = v16;
    sub_1BF4653D8();
    sub_1BF3A7DB8((uint64_t)v20);
    OUTLINED_FUNCTION_6_1();
    uint64_t MetatypeMetadata = MEMORY[0x1E4FBB1A0];
    v20[0] = v13;
    v20[1] = v15;
    sub_1BF4653D8();
  }
  else
  {
    OUTLINED_FUNCTION_11_5();
    OUTLINED_FUNCTION_2_2();
    uint64_t v17 = OUTLINED_FUNCTION_19_8();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    v20[0] = v17;
    sub_1BF4653D8();
  }
  sub_1BF3A7DB8((uint64_t)v20);
  sub_1BF4653F8();
  sub_1BF465428();
  type metadata accessor for Log();
  __swift_destroy_boxed_opaque_existential_2((uint64_t)v22);
  sub_1BF4653A8();
  type metadata accessor for CGSize(0);
  uint64_t v23 = v18;
  *(double *)double v22 = a2;
  *(double *)&v22[1] = a3;
  sub_1BF465438();
  sub_1BF3A7DB8((uint64_t)v22);
  sub_1BF42B5E4();
  swift_bridgeObjectRelease();
  return objc_msgSend(*(id *)&v10[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_visualAreaImageView], sel_measurementsWithFitting_in_, a1, a2, a3);
}

void AlignableVisualAreaImageViewContainer.init()()
{
}

void AlignableVisualAreaImageViewContainer.init(frame:)()
{
}

id AlignableVisualAreaImageViewContainer.__deallocating_deinit()
{
  return sub_1BF45F9F8(type metadata accessor for AlignableVisualAreaImageViewContainer);
}

double static VisualAreaImageView.SizeConstraints.area3064(maxWidth:)()
{
  return 60.0;
}

double static VisualAreaImageView.SizeConstraints.zero.getter()
{
  return 0.0;
}

void VisualAreaImageView.SizeConstraints.maxHeight.setter(double a1)
{
  double *v1 = a1;
}

uint64_t (*VisualAreaImageView.SizeConstraints.maxHeight.modify())(void)
{
  return CGSizeMake;
}

double VisualAreaImageView.SizeConstraints.maxWidth.getter(double a1, double a2)
{
  return a2;
}

void VisualAreaImageView.SizeConstraints.maxWidth.setter(double a1)
{
  *(double *)(v1 + 8) = a1;
}

uint64_t (*VisualAreaImageView.SizeConstraints.maxWidth.modify())(void)
{
  return CGSizeMake;
}

double VisualAreaImageView.SizeConstraints.visualAreaAllotted.getter(double a1, double a2, double a3)
{
  return a3;
}

void VisualAreaImageView.SizeConstraints.visualAreaAllotted.setter(double a1)
{
  *(double *)(v1 + 16) = a1;
}

uint64_t (*VisualAreaImageView.SizeConstraints.visualAreaAllotted.modify())(void)
{
  return CGSizeMake;
}

void sub_1BF45EC00(double a1)
{
  double *v1 = a1;
}

void sub_1BF45EC08(double a1)
{
  *(double *)(v1 + 8) = a1;
}

uint64_t (*sub_1BF45EC10())(void)
{
  return CGSizeMake;
}

char *sub_1BF45EC30(uint64_t a1)
{
  OUTLINED_FUNCTION_35_3();
  int v5 = &v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_applyCachedArtwork];
  uint64_t v6 = (objc_class *)type metadata accessor for ArtworkImageView();
  *(void *)int v5 = 0;
  *((void *)v5 + 1) = 0;
  id v7 = objc_allocWithZone(v6);
  uint64_t v8 = v1;
  *(void *)&v8[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_artworkImageView] = ArtworkImageView.init(artworkSize:frame:)();
  uint64_t v9 = &v8[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_artworkSize];
  *(void *)uint64_t v9 = v3;
  *((void *)v9 + 1) = v2;
  sub_1BF3AA4C4(a1, (uint64_t)&v8[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_sizeConstraints]);

  v13.receiver = v8;
  v13.super_class = (Class)type metadata accessor for VisualAreaImageView();
  id v10 = (char *)OUTLINED_FUNCTION_18_8(&v13, sel_initWithFrame_);
  id v11 = &v10[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_artworkImageView];
  OUTLINED_FUNCTION_3_5();
  objc_msgSend(v10, sel_addSubview_, *(void *)v11);
  __swift_destroy_boxed_opaque_existential_2(a1);
  return v10;
}

uint64_t type metadata accessor for AlignableVisualAreaImageViewContainer()
{
  return self;
}

uint64_t sub_1BF45ED5C()
{
  return MEMORY[0x1F4186498](v0, 48, 7);
}

void sub_1BF45ED6C()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_applyCachedArtwork];
  *(void *)uint64_t v1 = 0;
  *((void *)v1 + 1) = 0;

  OUTLINED_FUNCTION_8_21();
  __break(1u);
}

void sub_1BF45EDE0(id *a1)
{
}

id VisualAreaImageView.artworkImageView.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_artworkImageView);
  OUTLINED_FUNCTION_7_12();
  uint64_t v2 = *v1;

  return v2;
}

void sub_1BF45EE58(void *a1)
{
  OUTLINED_FUNCTION_1_21();
  uint64_t v3 = *v1;
  char *v1 = a1;
}

uint64_t sub_1BF45EE98(uint64_t a1)
{
  sub_1BF3AA4C4(a1, (uint64_t)v2);
  return sub_1BF45EF20(v2);
}

uint64_t VisualAreaImageView.sizeConstraints.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_sizeConstraints;
  OUTLINED_FUNCTION_3_5();
  return sub_1BF3AA4C4(v3, a1);
}

uint64_t sub_1BF45EF20(long long *a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_sizeConstraints;
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_2(v3);
  sub_1BF3A6D50(a1, v3);
  return swift_endAccess();
}

uint64_t sub_1BF45EF84()
{
  return sub_1BF45EFE8();
}

double VisualAreaImageView.artworkSize.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_artworkSize;
  OUTLINED_FUNCTION_7_12();
  return *(double *)v1;
}

uint64_t sub_1BF45EFE8()
{
  OUTLINED_FUNCTION_35_3();
  uint64_t v3 = (void *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_artworkSize);
  uint64_t result = OUTLINED_FUNCTION_9_18();
  *uint64_t v3 = v2;
  v3[1] = v1;
  return result;
}

Swift::Void __swiftcall VisualAreaImageView.layoutSubviews()()
{
  uint64_t v1 = sub_1BF465418();
  uint64_t v2 = OUTLINED_FUNCTION_44(v1);
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_1_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
  uint64_t v3 = sub_1BF465478();
  OUTLINED_FUNCTION_0_2(v3);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BF474A50;
  uint64_t v4 = (objc_class *)type metadata accessor for VisualAreaImageView();
  double v21 = v4;
  v20[0] = v0;
  id v5 = v0;
  id v6 = (id)AMSLogKey();
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = sub_1BF465FA8();
    uint64_t v10 = v9;

    OUTLINED_FUNCTION_6_10();
    OUTLINED_FUNCTION_2_2();
    uint64_t v11 = OUTLINED_FUNCTION_20_7();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    v18[0] = v11;
    sub_1BF4653D8();
    sub_1BF3A7DB8((uint64_t)v18);
    OUTLINED_FUNCTION_6_1();
    uint64_t MetatypeMetadata = MEMORY[0x1E4FBB1A0];
    v18[0] = v8;
    v18[1] = v10;
    sub_1BF4653D8();
  }
  else
  {
    OUTLINED_FUNCTION_11_5();
    OUTLINED_FUNCTION_2_2();
    uint64_t v12 = OUTLINED_FUNCTION_19_8();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    v18[0] = v12;
    sub_1BF4653D8();
  }
  sub_1BF3A7DB8((uint64_t)v18);
  sub_1BF4653F8();
  sub_1BF465428();
  type metadata accessor for Log();
  __swift_destroy_boxed_opaque_existential_2((uint64_t)v20);
  double v21 = v4;
  v20[0] = v5;
  objc_super v13 = (char *)v5;
  sub_1BF465438();
  sub_1BF3A7DB8((uint64_t)v20);
  sub_1BF42B5E4();
  swift_bridgeObjectRelease();
  v17.receiver = v13;
  v17.super_class = v4;
  objc_msgSendSuper2(&v17, sel_layoutSubviews);
  uint64_t v14 = (void **)&v13[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_artworkImageView];
  OUTLINED_FUNCTION_7_12();
  uint64_t v15 = *v14;
  OUTLINED_FUNCTION_7_12();
  id v16 = v15;
  objc_msgSend(v16, sel_frame);
  objc_msgSend(v16, sel_setFrame_);
}

double VisualAreaImageView.measurements(fitting:in:)(double a1)
{
  return _s27AppleMediaServicesUIDynamic19VisualAreaImageViewC12sizeThatFitsySo6CGSizeVAFF_0(a1);
}

id VisualAreaImageView.hasContent.getter()
{
  uint64_t v1 = (id *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_artworkImageView);
  OUTLINED_FUNCTION_7_12();
  return objc_msgSend(*v1, sel_hasContent);
}

void VisualAreaImageView.updateArtworkSizeForMaxWidth(_:)(double a1)
{
  uint64_t v3 = sub_1BF465418();
  uint64_t v4 = OUTLINED_FUNCTION_44(v3);
  MEMORY[0x1F4188790](v4);
  id v5 = (double *)&v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_artworkSize];
  OUTLINED_FUNCTION_9_18();
  double v6 = *v5;
  double v7 = v5[1];
  double v8 = _s27AppleMediaServicesUIDynamic19VisualAreaImageViewC12sizeThatFitsySo6CGSizeVAFF_0(a1);
  *id v5 = v8;
  v5[1] = v9;
  if (v6 != v8 || v7 != v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
    uint64_t v11 = sub_1BF465478();
    OUTLINED_FUNCTION_0_2(v11);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BF475650;
    uint64_t v24 = type metadata accessor for VisualAreaImageView();
    *(void *)&long long v23 = v1;
    uint64_t v12 = v1;
    id v13 = (id)AMSLogKey();
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = sub_1BF465FA8();
      uint64_t v17 = v16;

      sub_1BF465408();
      sub_1BF4653F8();
      OUTLINED_FUNCTION_17_9();
      uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_16_10(MetatypeMetadata);
      sub_1BF3A7DB8((uint64_t)v22);
      OUTLINED_FUNCTION_6_1();
      void v22[3] = MEMORY[0x1E4FBB1A0];
      v22[0] = v15;
      v22[1] = v17;
      sub_1BF4653D8();
    }
    else
    {
      sub_1BF465408();
      sub_1BF4653F8();
      OUTLINED_FUNCTION_17_9();
      uint64_t v19 = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_16_10(v19);
    }
    sub_1BF3A7DB8((uint64_t)v22);
    sub_1BF4653F8();
    sub_1BF465428();
    type metadata accessor for Log();
    __swift_destroy_boxed_opaque_existential_2((uint64_t)&v23);
    sub_1BF4653A8();
    type metadata accessor for CGSize(0);
    uint64_t v21 = v20;
    uint64_t v24 = v20;
    *(double *)&long long v23 = v6;
    *((double *)&v23 + 1) = v7;
    sub_1BF465438();
    sub_1BF3A7DB8((uint64_t)&v23);
    sub_1BF4653A8();
    uint64_t v24 = v21;
    long long v23 = *(_OWORD *)v5;
    sub_1BF465438();
    sub_1BF3A7DB8((uint64_t)&v23);
    sub_1BF42B654();
    swift_bridgeObjectRelease();
    objc_msgSend(v12, sel_setNeedsLayout);
  }
}

double _s27AppleMediaServicesUIDynamic19VisualAreaImageViewC12sizeThatFitsySo6CGSizeVAFF_0(double a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_sizeConstraints;
  OUTLINED_FUNCTION_3_5();
  sub_1BF3AA4C4(v4, (uint64_t)v17);
  if (a1 <= 0.0)
  {
    __swift_project_boxed_opaque_existential_2(v17, v18);
    uint64_t v5 = OUTLINED_FUNCTION_6_23();
    a1 = v6(v5);
  }
  __swift_project_boxed_opaque_existential_2(v17, v18);
  uint64_t v7 = OUTLINED_FUNCTION_6_23();
  double v9 = v8(v7);
  if (v9 < a1) {
    a1 = v9;
  }
  uint64_t v10 = v18;
  uint64_t v11 = v19;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v17, v18);
  (*(void (**)(uint64_t, uint64_t, double))(v11 + 40))(v10, v11, a1);
  uint64_t v12 = (void *)(v2 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_artworkImageView);
  OUTLINED_FUNCTION_7_12();
  id v13 = (double *)(*v12 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic16ArtworkImageView_artworkSize);
  OUTLINED_FUNCTION_7_12();
  CGSize.sizeWithVisualAreaConstraints(_:)(v17, *v13, v13[1]);
  double v15 = v14;
  __swift_destroy_boxed_opaque_existential_2((uint64_t)v17);
  return v15;
}

uint64_t VisualAreaImageView.apply(model:asPartOf:)(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[3];
  uint64_t v5 = a1[4];
  double v6 = __swift_project_boxed_opaque_existential_2(a1, v4);

  return sub_1BF46016C((uint64_t)v6, a2, v2, v4, v5);
}

id VisualAreaImageView.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void VisualAreaImageView.init()()
{
}

id _s27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainerC5frameACSo6CGRectV_tcfC_0(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void VisualAreaImageView.init(frame:)()
{
}

void sub_1BF45F9AC()
{
}

id VisualAreaImageView.__deallocating_deinit()
{
  return sub_1BF45F9F8(type metadata accessor for VisualAreaImageView);
}

id sub_1BF45F9F8(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_1BF45FA90(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = sub_1BF465418();
  MEMORY[0x1F4188790](v5 - 8);
  v49[3] = &type metadata for AlignableVisualAreaArtwork;
  v49[4] = &protocol witness table for AlignableVisualAreaArtwork;
  uint64_t v6 = swift_allocObject();
  v49[0] = v6;
  sub_1BF460BCC(a1, v6 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
  sub_1BF465478();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BF474840;
  CGRect v43 = (ValueMetadata *)type metadata accessor for VisualAreaImageView();
  uint64_t v45 = v43;
  *(void *)&long long v44 = a3;
  uint64_t v7 = a3;
  id v8 = (id)AMSLogKey();
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = sub_1BF465FA8();
    uint64_t v12 = v11;

    sub_1BF465408();
    sub_1BF4653F8();
    __swift_project_boxed_opaque_existential_2(&v44, (uint64_t)v45);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    uint64_t v46 = DynamicType;
    sub_1BF4653D8();
    sub_1BF3A7DB8((uint64_t)&v46);
    sub_1BF4653F8();
    uint64_t MetatypeMetadata = MEMORY[0x1E4FBB1A0];
    uint64_t v46 = v10;
    uint64_t v47 = v12;
  }
  else
  {
    sub_1BF465408();
    sub_1BF4653F8();
    __swift_project_boxed_opaque_existential_2(&v44, (uint64_t)v45);
    uint64_t v14 = swift_getDynamicType();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    uint64_t v46 = v14;
  }
  sub_1BF4653D8();
  sub_1BF3A7DB8((uint64_t)&v46);
  sub_1BF4653F8();
  sub_1BF465428();
  type metadata accessor for Log();
  __swift_destroy_boxed_opaque_existential_2((uint64_t)&v44);
  sub_1BF4653A8();
  double v15 = __swift_project_boxed_opaque_existential_2(v49, (uint64_t)&type metadata for AlignableVisualAreaArtwork);
  uint64_t v45 = &type metadata for AlignableVisualAreaArtwork;
  boxed_opaque_existential_2Tm = __swift_allocate_boxed_opaque_existential_2Tm((uint64_t *)&v44);
  initializeWithCopy for AlignableVisualAreaArtwork((uint64_t)boxed_opaque_existential_2Tm, (uint64_t)v15);
  sub_1BF465438();
  sub_1BF3A7DB8((uint64_t)&v44);
  sub_1BF42B654();
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(v6 + 24);
  sub_1BF3AA4C4(v6 + 32, (uint64_t)&v44);
  uint64_t v18 = (uint64_t)&v7[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_sizeConstraints];
  swift_beginAccess();
  swift_retain();
  __swift_destroy_boxed_opaque_existential_2(v18);
  sub_1BF3A6D50(&v44, v18);
  swift_endAccess();
  uint64_t v19 = *(void *)(v17 + 24);
  double v20 = *(double *)(v19 + 32);
  double v21 = *(double *)(v19 + 40);
  sub_1BF3AA4C4(v18, (uint64_t)&v44);
  CGSize.sizeWithVisualAreaConstraints(_:)(&v44, v20, v21);
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  __swift_destroy_boxed_opaque_existential_2((uint64_t)&v44);
  double v26 = &v7[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_artworkSize];
  swift_beginAccess();
  *(void *)double v26 = v23;
  *((void *)v26 + 1) = v25;
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BF474840;
  uint64_t v45 = v43;
  *(void *)&long long v44 = v7;
  double v27 = v7;
  id v28 = (id)AMSLogKey();
  if (v28)
  {
    double v29 = v28;
    uint64_t v30 = sub_1BF465FA8();
    uint64_t v32 = v31;

    sub_1BF465408();
    sub_1BF4653F8();
    __swift_project_boxed_opaque_existential_2(&v44, (uint64_t)v45);
    uint64_t v33 = swift_getDynamicType();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    uint64_t v46 = v33;
    sub_1BF4653D8();
    sub_1BF3A7DB8((uint64_t)&v46);
    sub_1BF4653F8();
    uint64_t MetatypeMetadata = MEMORY[0x1E4FBB1A0];
    uint64_t v46 = v30;
    uint64_t v47 = v32;
  }
  else
  {
    sub_1BF465408();
    sub_1BF4653F8();
    __swift_project_boxed_opaque_existential_2(&v44, (uint64_t)v45);
    uint64_t v34 = swift_getDynamicType();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    uint64_t v46 = v34;
  }
  sub_1BF4653D8();
  sub_1BF3A7DB8((uint64_t)&v46);
  sub_1BF4653F8();
  sub_1BF465428();
  __swift_destroy_boxed_opaque_existential_2((uint64_t)&v44);
  sub_1BF4653A8();
  uint64_t v35 = *(void *)v26;
  uint64_t v36 = *((void *)v26 + 1);
  type metadata accessor for CGSize(0);
  uint64_t v45 = v37;
  *(void *)&long long v44 = v35;
  *((void *)&v44 + 1) = v36;
  sub_1BF465438();
  sub_1BF3A7DB8((uint64_t)&v44);
  sub_1BF42B654();
  swift_bridgeObjectRelease();
  uint64_t v38 = (id *)&v27[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_artworkImageView];
  swift_beginAccess();
  objc_msgSend(*v38, sel_removeFromSuperview);
  id v39 = objc_allocWithZone((Class)type metadata accessor for ArtworkImageView());
  id v40 = ArtworkImageView.init(artworkSize:frame:)();
  sub_1BF45EE58(v40);
  objc_msgSend(v27, sel_addSubview_, *v38);
  id v41 = *v38;
  ArtworkImageView.apply(dynamicArtwork:asPartOf:)();
  swift_release();

  return __swift_destroy_boxed_opaque_existential_2((uint64_t)v49);
}

uint64_t sub_1BF46016C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = sub_1BF465418();
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v56 = a4;
  uint64_t v57 = a5;
  boxed_opaque_existential_2Tm = __swift_allocate_boxed_opaque_existential_2Tm(v55);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 16))(boxed_opaque_existential_2Tm, a1, a4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA965E0);
  sub_1BF465478();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BF474840;
  uint64_t v49 = type metadata accessor for VisualAreaImageView();
  uint64_t v51 = v49;
  *(void *)&long long v50 = a3;
  uint64_t v10 = a3;
  id v11 = (id)AMSLogKey();
  uint64_t v12 = MEMORY[0x1E4FBB1A0];
  if (v11)
  {
    id v13 = v11;
    uint64_t v14 = sub_1BF465FA8();
    uint64_t v16 = v15;

    sub_1BF465408();
    sub_1BF4653F8();
    __swift_project_boxed_opaque_existential_2(&v50, v51);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    uint64_t v52 = DynamicType;
    sub_1BF4653D8();
    sub_1BF3A7DB8((uint64_t)&v52);
    sub_1BF4653F8();
    uint64_t MetatypeMetadata = v12;
    uint64_t v52 = v14;
    uint64_t v53 = v16;
  }
  else
  {
    sub_1BF465408();
    sub_1BF4653F8();
    __swift_project_boxed_opaque_existential_2(&v50, v51);
    uint64_t v18 = swift_getDynamicType();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    uint64_t v52 = v18;
  }
  sub_1BF4653D8();
  sub_1BF3A7DB8((uint64_t)&v52);
  sub_1BF4653F8();
  sub_1BF465428();
  type metadata accessor for Log();
  __swift_destroy_boxed_opaque_existential_2((uint64_t)&v50);
  sub_1BF4653A8();
  uint64_t v19 = v56;
  double v20 = __swift_project_boxed_opaque_existential_2(v55, v56);
  uint64_t v51 = v19;
  double v21 = __swift_allocate_boxed_opaque_existential_2Tm((uint64_t *)&v50);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v19 - 8) + 16))(v21, v20, v19);
  sub_1BF465438();
  sub_1BF3A7DB8((uint64_t)&v50);
  sub_1BF42B654();
  swift_bridgeObjectRelease();
  uint64_t v22 = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 8))(a4, a5);
  (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(a5 + 16))(&v50, a4, a5);
  uint64_t v23 = (uint64_t)&v10[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_sizeConstraints];
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_2(v23);
  sub_1BF3A6D50(&v50, v23);
  swift_endAccess();
  uint64_t v24 = *(void *)(v22 + 24);
  double v25 = *(double *)(v24 + 32);
  double v26 = *(double *)(v24 + 40);
  sub_1BF3AA4C4(v23, (uint64_t)&v50);
  CGSize.sizeWithVisualAreaConstraints(_:)(&v50, v25, v26);
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  __swift_destroy_boxed_opaque_existential_2((uint64_t)&v50);
  uint64_t v31 = &v10[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_artworkSize];
  swift_beginAccess();
  *(void *)uint64_t v31 = v28;
  *((void *)v31 + 1) = v30;
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BF474840;
  uint64_t v51 = v49;
  *(void *)&long long v50 = v10;
  uint64_t v32 = v10;
  id v33 = (id)AMSLogKey();
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = sub_1BF465FA8();
    uint64_t v37 = v36;

    sub_1BF465408();
    sub_1BF4653F8();
    __swift_project_boxed_opaque_existential_2(&v50, v51);
    uint64_t v38 = swift_getDynamicType();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    uint64_t v52 = v38;
    sub_1BF4653D8();
    sub_1BF3A7DB8((uint64_t)&v52);
    sub_1BF4653F8();
    uint64_t MetatypeMetadata = MEMORY[0x1E4FBB1A0];
    uint64_t v52 = v35;
    uint64_t v53 = v37;
  }
  else
  {
    sub_1BF465408();
    sub_1BF4653F8();
    __swift_project_boxed_opaque_existential_2(&v50, v51);
    uint64_t v39 = swift_getDynamicType();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    uint64_t v52 = v39;
  }
  sub_1BF4653D8();
  sub_1BF3A7DB8((uint64_t)&v52);
  sub_1BF4653F8();
  sub_1BF465428();
  __swift_destroy_boxed_opaque_existential_2((uint64_t)&v50);
  sub_1BF4653A8();
  uint64_t v40 = *(void *)v31;
  uint64_t v41 = *((void *)v31 + 1);
  type metadata accessor for CGSize(0);
  uint64_t v51 = v42;
  *(void *)&long long v50 = v40;
  *((void *)&v50 + 1) = v41;
  sub_1BF465438();
  sub_1BF3A7DB8((uint64_t)&v50);
  sub_1BF42B654();
  swift_bridgeObjectRelease();
  CGRect v43 = (id *)&v32[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_artworkImageView];
  swift_beginAccess();
  objc_msgSend(*v43, sel_removeFromSuperview);
  id v44 = objc_allocWithZone((Class)type metadata accessor for ArtworkImageView());
  id v45 = ArtworkImageView.init(artworkSize:frame:)();
  sub_1BF45EE58(v45);
  objc_msgSend(v32, sel_addSubview_, *v43);
  id v46 = *v43;
  ArtworkImageView.apply(dynamicArtwork:asPartOf:)();
  swift_release();

  return __swift_destroy_boxed_opaque_existential_2((uint64_t)v55);
}

id sub_1BF4608A0@<X0>(void *a1@<X8>)
{
  id result = VisualAreaImageView.artworkImageView.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1BF4608D0@<X0>(uint64_t a1@<X8>)
{
  return VisualAreaImageView.sizeConstraints.getter(a1);
}

void sub_1BF4608F8(uint64_t a1@<X8>)
{
  *(double *)a1 = VisualAreaImageView.artworkSize.getter();
  *(void *)(a1 + 8) = v2;
}

uint64_t destroy for AlignableVisualAreaArtwork(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_2(a1 + 16);
}

uint64_t initializeWithCopy for AlignableVisualAreaArtwork(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = a2 + 16;
  long long v5 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v5;
  uint64_t v6 = v5;
  uint64_t v7 = **(void (***)(uint64_t, uint64_t, uint64_t))(v5 - 8);
  swift_retain();
  v7(a1 + 16, v4, v6);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

uint64_t assignWithCopy for AlignableVisualAreaArtwork(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 16), (uint64_t *)(a2 + 16));
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

__n128 __swift_memcpy57_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for AlignableVisualAreaArtwork(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  __swift_destroy_boxed_opaque_existential_2(a1 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for AlignableVisualAreaArtwork(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 57))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AlignableVisualAreaArtwork(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 56) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 57) = 1;
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
    *(unsigned char *)(result + 57) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AlignableVisualAreaArtwork()
{
  return &type metadata for AlignableVisualAreaArtwork;
}

ValueMetadata *type metadata accessor for VisualAreaImageView.SizeConstraints()
{
  return &type metadata for VisualAreaImageView.SizeConstraints;
}

uint64_t sub_1BF460B8C()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_2(v0 + 32);

  return MEMORY[0x1F4186498](v0, 73, 7);
}

uint64_t sub_1BF460BCC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_6_23()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8_21()
{
  return sub_1BF466868();
}

id OUTLINED_FUNCTION_13_17()
{
  return [v0 (SEL)(v1 + 2072)];
}

uint64_t OUTLINED_FUNCTION_16_10(uint64_t a1)
{
  *(void *)(v2 - 184) = a1;
  *(void *)(v2 - 208) = v1;
  return sub_1BF4653D8();
}

uint64_t OUTLINED_FUNCTION_17_9()
{
  __swift_project_boxed_opaque_existential_2((void *)(v0 - 176), *(void *)(v0 - 152));
  return swift_getDynamicType();
}

id OUTLINED_FUNCTION_18_8(objc_super *a1, SEL a2)
{
  return objc_msgSendSuper2(a1, a2, 0.0, 0.0, 0.0, 0.0);
}

uint64_t OUTLINED_FUNCTION_19_8()
{
  __swift_project_boxed_opaque_existential_2((void *)(v0 - 128), *(void *)(v0 - 104));
  return swift_getDynamicType();
}

uint64_t OUTLINED_FUNCTION_20_7()
{
  __swift_project_boxed_opaque_existential_2((void *)(v0 - 128), *(void *)(v0 - 104));
  return swift_getDynamicType();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t deviceIsRunningInternalBuild()
{
  return MEMORY[0x1F40CD648]("com.apple.AppleMediaServicesUIDynamic");
}

uint64_t deviceIsRunningSeedBuild()
{
  return 0;
}

void AMSUIDMarkdownParserStartDocument(void *a1)
{
  id v1 = a1;
  id v2 = [v1 delegate];
  [v2 parserDidStartDocument:v1];
}

void AMSUIDMarkdownParserEndDocument(void *a1)
{
  id v1 = a1;
  id v2 = [v1 delegate];
  [v2 parserDidEndDocument:v1];
}

uint64_t AMSUIDMarkdownParserStartElement(void *a1, const xmlChar *a2, xmlChar **a3)
{
  id v10 = a1;
  if (xmlStrEqual(a2, (const xmlChar *)"artwork"))
  {
    long long v5 = [v10 delegate];
    uint64_t v6 = NSDictionaryFromAttributes(a3);
    uint64_t v7 = [v6 objectForKeyedSubscript:@"id"];
    [v5 parser:v10 didFindArtworkWithIdentifier:v7];

LABEL_3:
LABEL_8:

    goto LABEL_9;
  }
  if (xmlStrEqual(a2, (const xmlChar *)"li"))
  {
    long long v5 = [v10 delegate];
    [v5 parserDidStartListElement:v10];
    goto LABEL_8;
  }
  uint64_t v12 = 0;
  if (TryListTypeFromName(a2, &v12))
  {
    long long v5 = [v10 delegate];
    [v5 parser:v10 didStartListOfStyle:v12];
    goto LABEL_8;
  }
  uint64_t v11 = 0;
  if (TryTextElementFromName(a2, &v11))
  {
    long long v5 = [v10 delegate];
    uint64_t v8 = v11;
    uint64_t v6 = NSDictionaryFromAttributes(a3);
    [v5 parser:v10 didStartElement:v8 attributes:v6];
    goto LABEL_3;
  }
LABEL_9:

  return MEMORY[0x1F41817F8]();
}

uint64_t AMSUIDMarkdownParserEndElement(void *a1, const xmlChar *a2)
{
  id v5 = a1;
  if (xmlStrEqual(a2, (const xmlChar *)"br"))
  {
    uint64_t v3 = [v5 delegate];
    [v3 parserDidFindNewline:v5];
  }
  else if (xmlStrEqual(a2, (const xmlChar *)"li"))
  {
    uint64_t v3 = [v5 delegate];
    [v3 parserDidEndListElement:v5];
  }
  else
  {
    uint64_t v7 = 0;
    if (TryListTypeFromName(a2, &v7))
    {
      uint64_t v3 = [v5 delegate];
      [v3 parser:v5 didEndListOfStyle:v7];
    }
    else
    {
      uint64_t v6 = 0;
      if (!TryTextElementFromName(a2, &v6)) {
        goto LABEL_10;
      }
      uint64_t v3 = [v5 delegate];
      [v3 parser:v5 didEndElement:v6];
    }
  }

LABEL_10:

  return MEMORY[0x1F41817F8]();
}

void AMSUIDMarkdownParserCharacters(void *a1, __CFString *a2, int a3)
{
  id v7 = a1;
  id v5 = NSStringFromXmlChar(a2, a3);
  if (v5)
  {
    uint64_t v6 = [v7 delegate];
    [v6 parser:v7 didFindCharacters:v5];
  }
}

void AMSUIDMarkdownParserError(void *a1)
{
  id v3 = a1;
  xmlErrorPtr LastError = xmlCtxtGetLastError((void *)[v3 _parserContext]);
  if (LastError)
  {
    xmlErrorPtr v2 = LastError;
    [v3 reportParseError:LastError];
    if (v2->level == XML_ERR_FATAL) {
      xmlStopParser((xmlParserCtxtPtr)[v3 _parserContext]);
    }
  }
}

id NSDictionaryFromAttributes(xmlChar **a1)
{
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v3 = *a1;
    if (*a1)
    {
      long long v4 = a1 + 2;
      do
      {
        id v5 = *(v4 - 1);
        int v6 = xmlStrlen(v3);
        id v7 = NSStringFromXmlChar((__CFString *)v3, v6);
        int v8 = xmlStrlen(v5);
        uint64_t v9 = NSStringFromXmlChar((__CFString *)v5, v8);
        [v2 setObject:v9 forKeyedSubscript:v7];

        id v10 = *v4;
        v4 += 2;
        id v3 = v10;
      }
      while (v10);
    }
  }
  else
  {
    id v2 = (id)MEMORY[0x1E4F1CC08];
  }

  return v2;
}

uint64_t TryListTypeFromName(const xmlChar *a1, uint64_t *a2)
{
  if (xmlStrEqual(a1, (const xmlChar *)"ol"))
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t result = xmlStrEqual(a1, (const xmlChar *)"ul");
    if (!result) {
      return result;
    }
    uint64_t v4 = 1;
  }
  *a2 = v4;
  return 1;
}

uint64_t TryTextElementFromName(const xmlChar *a1, uint64_t *a2)
{
  if (xmlStrEqual(a1, (const xmlChar *)"b") || xmlStrEqual(a1, (const xmlChar *)"em"))
  {
    uint64_t v4 = 1;
LABEL_4:
    *a2 = v4;
    return 1;
  }
  if (xmlStrEqual(a1, (const xmlChar *)"a"))
  {
    uint64_t v4 = 3;
    goto LABEL_4;
  }
  if (xmlStrEqual(a1, (const xmlChar *)"appl"))
  {
    uint64_t v4 = 0;
    goto LABEL_4;
  }
  if (xmlStrEqual(a1, (const xmlChar *)"i"))
  {
    uint64_t v4 = 2;
    goto LABEL_4;
  }
  if (xmlStrEqual(a1, (const xmlChar *)"u"))
  {
    uint64_t v4 = 4;
    goto LABEL_4;
  }
  if (xmlStrEqual(a1, (const xmlChar *)"strike") || xmlStrEqual(a1, (const xmlChar *)"del"))
  {
    uint64_t v4 = 5;
    goto LABEL_4;
  }
  if (xmlStrEqual(a1, (const xmlChar *)"p") || xmlStrEqual(a1, (const xmlChar *)"div"))
  {
    uint64_t v4 = 6;
    goto LABEL_4;
  }
  if (xmlStrEqual(a1, (const xmlChar *)"s"))
  {
    uint64_t v4 = 7;
    goto LABEL_4;
  }
  uint64_t result = xmlStrEqual(a1, (const xmlChar *)"symbol");
  if (result)
  {
    uint64_t v4 = 8;
    goto LABEL_4;
  }
  return result;
}

__CFString *NSStringFromXmlChar(__CFString *a1, uint64_t a2)
{
  if (a1)
  {
    if (a2) {
      a1 = (__CFString *)[[NSString alloc] initWithBytes:a1 length:a2 encoding:4];
    }
    else {
      a1 = &stru_1F1AB35C0;
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

void sub_1BF463D5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a2 == 1)
  {
    id v9 = objc_begin_catch(exception_object);
    id v10 = [v9 description];
    NSLog(&cfstr_UnableToCopyMi.isa);

    objc_end_catch();
    JUMPOUT(0x1BF463D3CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_1BF46499C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_1BF464BD8()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1BF464BE8()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1BF464BF8()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1BF464C08()
{
  return MEMORY[0x1F40E32B0]();
}

uint64_t sub_1BF464C18()
{
  return MEMORY[0x1F40E3340]();
}

uint64_t sub_1BF464C28()
{
  return MEMORY[0x1F40E3368]();
}

uint64_t sub_1BF464C38()
{
  return MEMORY[0x1F4129430]();
}

uint64_t sub_1BF464C48()
{
  return MEMORY[0x1F40E33F0]();
}

uint64_t sub_1BF464C58()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_1BF464C68()
{
  return MEMORY[0x1F40E3550]();
}

uint64_t sub_1BF464C78()
{
  return MEMORY[0x1F40E3578]();
}

uint64_t sub_1BF464C88()
{
  return MEMORY[0x1F40E3590]();
}

uint64_t sub_1BF464C98()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t sub_1BF464CA8()
{
  return MEMORY[0x1F40E35C0]();
}

uint64_t sub_1BF464CB8()
{
  return MEMORY[0x1F40E35C8]();
}

uint64_t sub_1BF464CC8()
{
  return MEMORY[0x1F40E35D8]();
}

uint64_t sub_1BF464CD8()
{
  return MEMORY[0x1F40E3668]();
}

uint64_t sub_1BF464CE8()
{
  return MEMORY[0x1F40E36C8]();
}

uint64_t sub_1BF464CF8()
{
  return MEMORY[0x1F40E3760]();
}

uint64_t sub_1BF464D08()
{
  return MEMORY[0x1F40E3778]();
}

uint64_t sub_1BF464D18()
{
  return MEMORY[0x1F40E37B8]();
}

uint64_t sub_1BF464D28()
{
  return MEMORY[0x1F40E3A90]();
}

uint64_t sub_1BF464D38()
{
  return MEMORY[0x1F40E3A98]();
}

uint64_t sub_1BF464D48()
{
  return MEMORY[0x1F40E3AB0]();
}

uint64_t sub_1BF464D58()
{
  return MEMORY[0x1F40E3AC0]();
}

uint64_t sub_1BF464D68()
{
  return MEMORY[0x1F40E4460]();
}

uint64_t sub_1BF464D78()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1BF464D88()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1BF464D98()
{
  return MEMORY[0x1F40E4740]();
}

uint64_t sub_1BF464DA8()
{
  return MEMORY[0x1F40E4748]();
}

uint64_t sub_1BF464DB8()
{
  return MEMORY[0x1F40E4758]();
}

uint64_t sub_1BF464DC8()
{
  return MEMORY[0x1F40E48B0]();
}

uint64_t sub_1BF464DD8()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1BF464DE8()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1BF464DF8()
{
  return MEMORY[0x1F40E4A50]();
}

uint64_t sub_1BF464E08()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1BF464E18()
{
  return MEMORY[0x1F40E4AA0]();
}

uint64_t sub_1BF464E28()
{
  return MEMORY[0x1F40E4B00]();
}

uint64_t sub_1BF464E38()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1BF464E48()
{
  return MEMORY[0x1F40E4B40]();
}

uint64_t sub_1BF464E58()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1BF464E68()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1BF464E78()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1BF464E88()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1BF464E98()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1BF464EA8()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1BF464EB8()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1BF464EC8()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1BF464ED8()
{
  return MEMORY[0x1F40E5648]();
}

uint64_t sub_1BF464EE8()
{
  return MEMORY[0x1F4129440]();
}

uint64_t sub_1BF464EF8()
{
  return MEMORY[0x1F40E5840]();
}

uint64_t sub_1BF464F08()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1BF464F18()
{
  return MEMORY[0x1F40E5F50]();
}

uint64_t sub_1BF464F28()
{
  return MEMORY[0x1F40E5F60]();
}

uint64_t sub_1BF464F38()
{
  return MEMORY[0x1F40E5F70]();
}

uint64_t sub_1BF464F48()
{
  return MEMORY[0x1F40E5F80]();
}

uint64_t sub_1BF464F58()
{
  return MEMORY[0x1F4119150]();
}

uint64_t sub_1BF464F68()
{
  return MEMORY[0x1F410A870]();
}

uint64_t sub_1BF464F78()
{
  return MEMORY[0x1F410A878]();
}

uint64_t sub_1BF464F88()
{
  return MEMORY[0x1F410A880]();
}

uint64_t sub_1BF464F98()
{
  return MEMORY[0x1F410A8D8]();
}

uint64_t sub_1BF464FA8()
{
  return MEMORY[0x1F410A8F0]();
}

uint64_t sub_1BF464FB8()
{
  return MEMORY[0x1F410A8F8]();
}

uint64_t sub_1BF464FC8()
{
  return MEMORY[0x1F410A9F0]();
}

uint64_t sub_1BF464FD8()
{
  return MEMORY[0x1F410A9F8]();
}

uint64_t sub_1BF464FE8()
{
  return MEMORY[0x1F410AA00]();
}

uint64_t sub_1BF464FF8()
{
  return MEMORY[0x1F41884F0]();
}

uint64_t sub_1BF465008()
{
  return MEMORY[0x1F4129470]();
}

uint64_t sub_1BF465018()
{
  return MEMORY[0x1F4129580]();
}

uint64_t sub_1BF465028()
{
  return MEMORY[0x1F41295A0]();
}

uint64_t sub_1BF465038()
{
  return MEMORY[0x1F4129780]();
}

uint64_t sub_1BF465048()
{
  return MEMORY[0x1F40F9E10]();
}

uint64_t sub_1BF465058()
{
  return MEMORY[0x1F40F9E50]();
}

uint64_t sub_1BF465068()
{
  return MEMORY[0x1F40F9E60]();
}

uint64_t sub_1BF465078()
{
  return MEMORY[0x1F40F9E70]();
}

uint64_t sub_1BF465098()
{
  return MEMORY[0x1F40F9E90]();
}

uint64_t sub_1BF4650A8()
{
  return MEMORY[0x1F40F9E98]();
}

uint64_t sub_1BF4650B8()
{
  return MEMORY[0x1F40F9EB0]();
}

uint64_t sub_1BF4650C8()
{
  return MEMORY[0x1F40F9EC0]();
}

uint64_t sub_1BF4650D8()
{
  return MEMORY[0x1F40F9ED0]();
}

uint64_t sub_1BF4650E8()
{
  return MEMORY[0x1F40F9EE0]();
}

uint64_t sub_1BF465108()
{
  return MEMORY[0x1F40F9F00]();
}

uint64_t sub_1BF465118()
{
  return MEMORY[0x1F40FB920]();
}

uint64_t sub_1BF465128()
{
  return MEMORY[0x1F40FC6F0]();
}

uint64_t sub_1BF465138()
{
  return MEMORY[0x1F40FC700]();
}

uint64_t sub_1BF465148()
{
  return MEMORY[0x1F4186C60]();
}

uint64_t sub_1BF465158()
{
  return MEMORY[0x1F4186C78]();
}

uint64_t sub_1BF465168()
{
  return MEMORY[0x1F4186C80]();
}

uint64_t sub_1BF465178()
{
  return MEMORY[0x1F4186C98]();
}

uint64_t sub_1BF465188()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1BF465198()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t sub_1BF4651A8()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1BF4651B8()
{
  return MEMORY[0x1F4186D08]();
}

uint64_t sub_1BF4651C8()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1BF4651D8()
{
  return MEMORY[0x1F4186E10]();
}

uint64_t sub_1BF4651E8()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1BF4651F8()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1BF465208()
{
  return MEMORY[0x1F4186EB0]();
}

uint64_t sub_1BF465218()
{
  return MEMORY[0x1F4186EC0]();
}

uint64_t sub_1BF465228()
{
  return MEMORY[0x1F4186EE8]();
}

uint64_t sub_1BF465238()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_1BF465248()
{
  return MEMORY[0x1F4186F08]();
}

uint64_t sub_1BF465258()
{
  return MEMORY[0x1F4186F18]();
}

uint64_t sub_1BF465268()
{
  return MEMORY[0x1F4186F30]();
}

uint64_t sub_1BF465278()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_1BF465288()
{
  return MEMORY[0x1F41278B8]();
}

uint64_t sub_1BF465298()
{
  return MEMORY[0x1F41278E0]();
}

uint64_t sub_1BF4652A8()
{
  return MEMORY[0x1F41278F0]();
}

uint64_t sub_1BF4652B8()
{
  return MEMORY[0x1F4127948]();
}

uint64_t sub_1BF4652C8()
{
  return MEMORY[0x1F4127950]();
}

uint64_t sub_1BF4652D8()
{
  return MEMORY[0x1F4127968]();
}

uint64_t sub_1BF4652E8()
{
  return MEMORY[0x1F4127970]();
}

uint64_t sub_1BF4652F8()
{
  return MEMORY[0x1F4127978]();
}

uint64_t sub_1BF465308()
{
  return MEMORY[0x1F4127980]();
}

uint64_t sub_1BF465318()
{
  return MEMORY[0x1F4127988]();
}

uint64_t sub_1BF465328()
{
  return MEMORY[0x1F41279A8]();
}

uint64_t sub_1BF465338()
{
  return MEMORY[0x1F41279D0]();
}

uint64_t sub_1BF465348()
{
  return MEMORY[0x1F41279D8]();
}

uint64_t sub_1BF465358()
{
  return MEMORY[0x1F41279E8]();
}

uint64_t sub_1BF465368()
{
  return MEMORY[0x1F41279F0]();
}

uint64_t sub_1BF465378()
{
  return MEMORY[0x1F41279F8]();
}

uint64_t sub_1BF465388()
{
  return MEMORY[0x1F4127A00]();
}

uint64_t sub_1BF465398()
{
  return MEMORY[0x1F4127A08]();
}

uint64_t sub_1BF4653A8()
{
  return MEMORY[0x1F4127A18]();
}

uint64_t sub_1BF4653B8()
{
  return MEMORY[0x1F4127A20]();
}

uint64_t sub_1BF4653C8()
{
  return MEMORY[0x1F4127A28]();
}

uint64_t sub_1BF4653D8()
{
  return MEMORY[0x1F4127A38]();
}

uint64_t sub_1BF4653E8()
{
  return MEMORY[0x1F4127A48]();
}

uint64_t sub_1BF4653F8()
{
  return MEMORY[0x1F4127A50]();
}

uint64_t sub_1BF465408()
{
  return MEMORY[0x1F4127A58]();
}

uint64_t sub_1BF465418()
{
  return MEMORY[0x1F4127A60]();
}

uint64_t sub_1BF465428()
{
  return MEMORY[0x1F4127A68]();
}

uint64_t sub_1BF465438()
{
  return MEMORY[0x1F4127A70]();
}

uint64_t sub_1BF465448()
{
  return MEMORY[0x1F4127A78]();
}

uint64_t sub_1BF465458()
{
  return MEMORY[0x1F4127A80]();
}

uint64_t sub_1BF465468()
{
  return MEMORY[0x1F4127A88]();
}

uint64_t sub_1BF465478()
{
  return MEMORY[0x1F4127A90]();
}

uint64_t sub_1BF465488()
{
  return MEMORY[0x1F4127AB0]();
}

uint64_t sub_1BF465498()
{
  return MEMORY[0x1F4127AD0]();
}

uint64_t sub_1BF4654A8()
{
  return MEMORY[0x1F4127AD8]();
}

uint64_t sub_1BF4654B8()
{
  return MEMORY[0x1F4127AE8]();
}

uint64_t sub_1BF4654C8()
{
  return MEMORY[0x1F4127AF0]();
}

uint64_t sub_1BF4654D8()
{
  return MEMORY[0x1F4127B08]();
}

uint64_t sub_1BF4654E8()
{
  return MEMORY[0x1F4127B20]();
}

uint64_t sub_1BF4654F8()
{
  return MEMORY[0x1F4127B30]();
}

uint64_t sub_1BF465508()
{
  return MEMORY[0x1F4127B38]();
}

uint64_t sub_1BF465518()
{
  return MEMORY[0x1F4127B40]();
}

uint64_t sub_1BF465528()
{
  return MEMORY[0x1F4127BB0]();
}

uint64_t sub_1BF465538()
{
  return MEMORY[0x1F4127BD0]();
}

uint64_t sub_1BF465548()
{
  return MEMORY[0x1F4127BD8]();
}

uint64_t sub_1BF465558()
{
  return MEMORY[0x1F4127BE8]();
}

uint64_t sub_1BF465568()
{
  return MEMORY[0x1F4127C90]();
}

uint64_t sub_1BF465578()
{
  return MEMORY[0x1F4127CD0]();
}

uint64_t sub_1BF465588()
{
  return MEMORY[0x1F4127CD8]();
}

uint64_t sub_1BF465598()
{
  return MEMORY[0x1F4127CE0]();
}

uint64_t sub_1BF4655B8()
{
  return MEMORY[0x1F4127D00]();
}

uint64_t sub_1BF4655C8()
{
  return MEMORY[0x1F4127D10]();
}

uint64_t sub_1BF4655D8()
{
  return MEMORY[0x1F4127D20]();
}

uint64_t sub_1BF4655E8()
{
  return MEMORY[0x1F4127D98]();
}

uint64_t sub_1BF4655F8()
{
  return MEMORY[0x1F4127DB0]();
}

uint64_t sub_1BF465608()
{
  return MEMORY[0x1F4127DB8]();
}

uint64_t sub_1BF465618()
{
  return MEMORY[0x1F4127DC0]();
}

uint64_t sub_1BF465628()
{
  return MEMORY[0x1F4127EA8]();
}

uint64_t sub_1BF465638()
{
  return MEMORY[0x1F4127EE8]();
}

uint64_t sub_1BF465648()
{
  return MEMORY[0x1F4127EF0]();
}

uint64_t sub_1BF465658()
{
  return MEMORY[0x1F4127EF8]();
}

uint64_t sub_1BF465668()
{
  return MEMORY[0x1F4127F68]();
}

uint64_t sub_1BF465678()
{
  return MEMORY[0x1F4127F70]();
}

uint64_t sub_1BF465688()
{
  return MEMORY[0x1F4127F78]();
}

uint64_t sub_1BF465698()
{
  return MEMORY[0x1F4127FA8]();
}

uint64_t sub_1BF4656A8()
{
  return MEMORY[0x1F4127FB0]();
}

uint64_t sub_1BF4656B8()
{
  return MEMORY[0x1F4127FB8]();
}

uint64_t sub_1BF4656C8()
{
  return MEMORY[0x1F4128028]();
}

uint64_t sub_1BF4656D8()
{
  return MEMORY[0x1F4128030]();
}

uint64_t sub_1BF4656E8()
{
  return MEMORY[0x1F4128040]();
}

uint64_t sub_1BF4656F8()
{
  return MEMORY[0x1F4128070]();
}

uint64_t sub_1BF465708()
{
  return MEMORY[0x1F4128078]();
}

uint64_t sub_1BF465718()
{
  return MEMORY[0x1F4128080]();
}

uint64_t sub_1BF465728()
{
  return MEMORY[0x1F4128088]();
}

uint64_t sub_1BF465738()
{
  return MEMORY[0x1F41280A0]();
}

uint64_t sub_1BF465748()
{
  return MEMORY[0x1F4128100]();
}

uint64_t sub_1BF465758()
{
  return MEMORY[0x1F4128158]();
}

uint64_t sub_1BF465768()
{
  return MEMORY[0x1F4128160]();
}

uint64_t sub_1BF465778()
{
  return MEMORY[0x1F4128168]();
}

uint64_t sub_1BF465788()
{
  return MEMORY[0x1F4128340]();
}

uint64_t sub_1BF465798()
{
  return MEMORY[0x1F4128360]();
}

uint64_t sub_1BF4657A8()
{
  return MEMORY[0x1F4128368]();
}

uint64_t sub_1BF4657B8()
{
  return MEMORY[0x1F4128410]();
}

uint64_t sub_1BF4657C8()
{
  return MEMORY[0x1F4128418]();
}

uint64_t sub_1BF4657D8()
{
  return MEMORY[0x1F4128428]();
}

uint64_t sub_1BF4657E8()
{
  return MEMORY[0x1F4128430]();
}

uint64_t sub_1BF4657F8()
{
  return MEMORY[0x1F4128470]();
}

uint64_t sub_1BF465808()
{
  return MEMORY[0x1F4128478]();
}

uint64_t sub_1BF465818()
{
  return MEMORY[0x1F4128480]();
}

uint64_t sub_1BF465828()
{
  return MEMORY[0x1F4128488]();
}

uint64_t sub_1BF465838()
{
  return MEMORY[0x1F4128490]();
}

uint64_t sub_1BF465848()
{
  return MEMORY[0x1F4128498]();
}

uint64_t sub_1BF465858()
{
  return MEMORY[0x1F41284A8]();
}

uint64_t sub_1BF465868()
{
  return MEMORY[0x1F41284C8]();
}

uint64_t sub_1BF465878()
{
  return MEMORY[0x1F41284D0]();
}

uint64_t sub_1BF465888()
{
  return MEMORY[0x1F41284D8]();
}

uint64_t sub_1BF465898()
{
  return MEMORY[0x1F41285D8]();
}

uint64_t sub_1BF4658A8()
{
  return MEMORY[0x1F4128608]();
}

uint64_t sub_1BF4658B8()
{
  return MEMORY[0x1F4128618]();
}

uint64_t sub_1BF4658C8()
{
  return MEMORY[0x1F4128628]();
}

uint64_t sub_1BF4658D8()
{
  return MEMORY[0x1F4128630]();
}

uint64_t sub_1BF4658E8()
{
  return MEMORY[0x1F4128638]();
}

uint64_t sub_1BF4658F8()
{
  return MEMORY[0x1F4128640]();
}

uint64_t sub_1BF465908()
{
  return MEMORY[0x1F4128648]();
}

uint64_t sub_1BF465918()
{
  return MEMORY[0x1F4128678]();
}

uint64_t sub_1BF465928()
{
  return MEMORY[0x1F4128680]();
}

uint64_t sub_1BF465938()
{
  return MEMORY[0x1F4128688]();
}

uint64_t sub_1BF465948()
{
  return MEMORY[0x1F4128690]();
}

uint64_t sub_1BF465958()
{
  return MEMORY[0x1F4128698]();
}

uint64_t sub_1BF465968()
{
  return MEMORY[0x1F41286C0]();
}

uint64_t sub_1BF465978()
{
  return MEMORY[0x1F41286D0]();
}

uint64_t sub_1BF465998()
{
  return MEMORY[0x1F41287C8]();
}

uint64_t sub_1BF4659A8()
{
  return MEMORY[0x1F41288C8]();
}

uint64_t sub_1BF4659B8()
{
  return MEMORY[0x1F41288D0]();
}

uint64_t sub_1BF4659C8()
{
  return MEMORY[0x1F41288E8]();
}

uint64_t sub_1BF4659D8()
{
  return MEMORY[0x1F41288F0]();
}

uint64_t sub_1BF4659E8()
{
  return MEMORY[0x1F4128900]();
}

uint64_t sub_1BF4659F8()
{
  return MEMORY[0x1F4128908]();
}

uint64_t sub_1BF465A08()
{
  return MEMORY[0x1F4128910]();
}

uint64_t sub_1BF465A18()
{
  return MEMORY[0x1F4128918]();
}

uint64_t sub_1BF465A28()
{
  return MEMORY[0x1F4128928]();
}

uint64_t sub_1BF465A38()
{
  return MEMORY[0x1F4128938]();
}

uint64_t sub_1BF465A48()
{
  return MEMORY[0x1F4128958]();
}

uint64_t sub_1BF465A58()
{
  return MEMORY[0x1F4128960]();
}

uint64_t sub_1BF465A68()
{
  return MEMORY[0x1F4128980]();
}

uint64_t sub_1BF465A78()
{
  return MEMORY[0x1F4128988]();
}

uint64_t sub_1BF465A88()
{
  return MEMORY[0x1F41289A0]();
}

uint64_t sub_1BF465A98()
{
  return MEMORY[0x1F41289B0]();
}

uint64_t sub_1BF465AA8()
{
  return MEMORY[0x1F4128A00]();
}

uint64_t sub_1BF465AB8()
{
  return MEMORY[0x1F4128A10]();
}

uint64_t sub_1BF465AC8()
{
  return MEMORY[0x1F4128A18]();
}

uint64_t sub_1BF465AD8()
{
  return MEMORY[0x1F4128A28]();
}

uint64_t sub_1BF465AE8()
{
  return MEMORY[0x1F4128A60]();
}

uint64_t sub_1BF465AF8()
{
  return MEMORY[0x1F4128A68]();
}

uint64_t sub_1BF465B08()
{
  return MEMORY[0x1F4128A80]();
}

uint64_t sub_1BF465B18()
{
  return MEMORY[0x1F4128B28]();
}

uint64_t sub_1BF465B28()
{
  return MEMORY[0x1F4128B38]();
}

uint64_t sub_1BF465B38()
{
  return MEMORY[0x1F4128B68]();
}

uint64_t sub_1BF465B48()
{
  return MEMORY[0x1F4128B70]();
}

uint64_t sub_1BF465B58()
{
  return MEMORY[0x1F4128B78]();
}

uint64_t sub_1BF465B68()
{
  return MEMORY[0x1F4128B80]();
}

uint64_t sub_1BF465B78()
{
  return MEMORY[0x1F4128B88]();
}

uint64_t sub_1BF465B88()
{
  return MEMORY[0x1F4128B90]();
}

uint64_t sub_1BF465B98()
{
  return MEMORY[0x1F4128C10]();
}

uint64_t sub_1BF465BA8()
{
  return MEMORY[0x1F4128C18]();
}

uint64_t sub_1BF465BB8()
{
  return MEMORY[0x1F4128C48]();
}

uint64_t sub_1BF465BC8()
{
  return MEMORY[0x1F4128C78]();
}

uint64_t sub_1BF465BD8()
{
  return MEMORY[0x1F4128C90]();
}

uint64_t sub_1BF465BE8()
{
  return MEMORY[0x1F4128CD0]();
}

uint64_t sub_1BF465BF8()
{
  return MEMORY[0x1F4128CE0]();
}

uint64_t sub_1BF465C08()
{
  return MEMORY[0x1F4128CF8]();
}

uint64_t sub_1BF465C18()
{
  return MEMORY[0x1F4128D20]();
}

uint64_t sub_1BF465C28()
{
  return MEMORY[0x1F4128D70]();
}

uint64_t sub_1BF465C38()
{
  return MEMORY[0x1F4128D78]();
}

uint64_t sub_1BF465C48()
{
  return MEMORY[0x1F4128DA8]();
}

uint64_t sub_1BF465C58()
{
  return MEMORY[0x1F4128DE0]();
}

uint64_t sub_1BF465C68()
{
  return MEMORY[0x1F4128E60]();
}

uint64_t sub_1BF465C78()
{
  return MEMORY[0x1F4128E68]();
}

uint64_t sub_1BF465C88()
{
  return MEMORY[0x1F4128F60]();
}

uint64_t sub_1BF465C98()
{
  return MEMORY[0x1F4128F68]();
}

uint64_t sub_1BF465CA8()
{
  return MEMORY[0x1F4128F78]();
}

uint64_t sub_1BF465CB8()
{
  return MEMORY[0x1F4128F80]();
}

uint64_t sub_1BF465CC8()
{
  return MEMORY[0x1F4128F88]();
}

uint64_t sub_1BF465CD8()
{
  return MEMORY[0x1F4129098]();
}

uint64_t sub_1BF465CE8()
{
  return MEMORY[0x1F41290A0]();
}

uint64_t sub_1BF465CF8()
{
  return MEMORY[0x1F41290A8]();
}

uint64_t sub_1BF465D08()
{
  return MEMORY[0x1F41290B0]();
}

uint64_t sub_1BF465D18()
{
  return MEMORY[0x1F41290C0]();
}

uint64_t sub_1BF465D28()
{
  return MEMORY[0x1F41290D0]();
}

uint64_t sub_1BF465D38()
{
  return MEMORY[0x1F41290D8]();
}

uint64_t sub_1BF465D48()
{
  return MEMORY[0x1F41290E0]();
}

uint64_t sub_1BF465D58()
{
  return MEMORY[0x1F41290E8]();
}

uint64_t sub_1BF465D68()
{
  return MEMORY[0x1F41290F0]();
}

uint64_t sub_1BF465D78()
{
  return MEMORY[0x1F41290F8]();
}

uint64_t sub_1BF465D88()
{
  return MEMORY[0x1F4129100]();
}

uint64_t sub_1BF465D98()
{
  return MEMORY[0x1F4129110]();
}

uint64_t sub_1BF465DA8()
{
  return MEMORY[0x1F4129118]();
}

uint64_t sub_1BF465DB8()
{
  return MEMORY[0x1F4129120]();
}

uint64_t sub_1BF465DC8()
{
  return MEMORY[0x1F4129170]();
}

uint64_t sub_1BF465DD8()
{
  return MEMORY[0x1F4129180]();
}

uint64_t sub_1BF465DE8()
{
  return MEMORY[0x1F4129190]();
}

uint64_t sub_1BF465DF8()
{
  return MEMORY[0x1F4129198]();
}

uint64_t sub_1BF465E08()
{
  return MEMORY[0x1F41291F8]();
}

uint64_t sub_1BF465E18()
{
  return MEMORY[0x1F4129200]();
}

uint64_t sub_1BF465E28()
{
  return MEMORY[0x1F4129208]();
}

uint64_t sub_1BF465E38()
{
  return MEMORY[0x1F4129210]();
}

uint64_t sub_1BF465E48()
{
  return MEMORY[0x1F4129248]();
}

uint64_t sub_1BF465E58()
{
  return MEMORY[0x1F4129250]();
}

uint64_t sub_1BF465E68()
{
  return MEMORY[0x1F41292F8]();
}

uint64_t sub_1BF465E78()
{
  return MEMORY[0x1F4129300]();
}

uint64_t sub_1BF465E88()
{
  return MEMORY[0x1F4129348]();
}

uint64_t sub_1BF465E98()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1BF465EA8()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1BF465EB8()
{
  return MEMORY[0x1F4183320]();
}

uint64_t sub_1BF465EC8()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1BF465ED8()
{
  return MEMORY[0x1F4183460]();
}

uint64_t sub_1BF465EE8()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t sub_1BF465EF8()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1BF465F08()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1BF465F18()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1BF465F28()
{
  return MEMORY[0x1F4183748]();
}

uint64_t sub_1BF465F38()
{
  return MEMORY[0x1F4183758]();
}

uint64_t sub_1BF465F48()
{
  return MEMORY[0x1F4183760]();
}

uint64_t sub_1BF465F58()
{
  return MEMORY[0x1F4183768]();
}

uint64_t sub_1BF465F68()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1BF465F78()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1BF465F88()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1BF465F98()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1BF465FA8()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1BF465FB8()
{
  return MEMORY[0x1F40E61F8]();
}

uint64_t sub_1BF465FC8()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1BF465FD8()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1BF465FE8()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1BF465FF8()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1BF466008()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1BF466018()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1BF466028()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1BF466038()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1BF466048()
{
  return MEMORY[0x1F4183A10]();
}

uint64_t sub_1BF466058()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1BF466068()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1BF466078()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1BF466088()
{
  return MEMORY[0x1F4183AA8]();
}

uint64_t sub_1BF466098()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1BF4660A8()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1BF4660B8()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1BF4660C8()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1BF4660D8()
{
  return MEMORY[0x1F4183BF8]();
}

uint64_t sub_1BF4660E8()
{
  return MEMORY[0x1F4183C18]();
}

uint64_t sub_1BF4660F8()
{
  return MEMORY[0x1F4183C70]();
}

uint64_t sub_1BF466108()
{
  return MEMORY[0x1F4183CF0]();
}

uint64_t sub_1BF466118()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1BF466128()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1BF466138()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1BF466148()
{
  return MEMORY[0x1F4183E88]();
}

uint64_t sub_1BF466158()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1BF466168()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1BF466178()
{
  return MEMORY[0x1F4183EA8]();
}

uint64_t sub_1BF466188()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1BF466198()
{
  return MEMORY[0x1F4183F18]();
}

uint64_t sub_1BF4661A8()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1BF4661C8()
{
  return MEMORY[0x1F4183F78]();
}

uint64_t sub_1BF4661D8()
{
  return MEMORY[0x1F4183F88]();
}

uint64_t sub_1BF4661F8()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1BF466208()
{
  return MEMORY[0x1F4183FD8]();
}

uint64_t sub_1BF466218()
{
  return MEMORY[0x1F4183FF0]();
}

uint64_t sub_1BF466228()
{
  return MEMORY[0x1F4184070]();
}

uint64_t sub_1BF466238()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1BF466248()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1BF466258()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1BF466268()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1BF466288()
{
  return MEMORY[0x1F4184368]();
}

uint64_t sub_1BF466298()
{
  return MEMORY[0x1F4184370]();
}

uint64_t sub_1BF4662A8()
{
  return MEMORY[0x1F4184378]();
}

uint64_t sub_1BF4662C8()
{
  return MEMORY[0x1F41843A0]();
}

uint64_t sub_1BF4662D8()
{
  return MEMORY[0x1F41843A8]();
}

uint64_t sub_1BF4662E8()
{
  return MEMORY[0x1F41843D0]();
}

uint64_t sub_1BF4662F8()
{
  return MEMORY[0x1F41843D8]();
}

uint64_t sub_1BF466308()
{
  return MEMORY[0x1F4184410]();
}

uint64_t sub_1BF466318()
{
  return MEMORY[0x1F4184430]();
}

uint64_t sub_1BF466328()
{
  return MEMORY[0x1F4184580]();
}

uint64_t sub_1BF466338()
{
  return MEMORY[0x1F40E64D8]();
}

uint64_t sub_1BF466348()
{
  return MEMORY[0x1F4129390]();
}

uint64_t sub_1BF466358()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1BF466368()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1BF466378()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1BF466388()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1BF466398()
{
  return MEMORY[0x1F40D96C8]();
}

uint64_t sub_1BF4663A8()
{
  return MEMORY[0x1F40D96D8]();
}

uint64_t sub_1BF4663B8()
{
  return MEMORY[0x1F40D96E0]();
}

uint64_t sub_1BF4663C8()
{
  return MEMORY[0x1F40D96E8]();
}

uint64_t sub_1BF4663D8()
{
  return MEMORY[0x1F40D9700]();
}

uint64_t sub_1BF4663E8()
{
  return MEMORY[0x1F4186F90]();
}

uint64_t sub_1BF4663F8()
{
  return MEMORY[0x1F4186FA0]();
}

uint64_t sub_1BF466408()
{
  return MEMORY[0x1F4186FC0]();
}

uint64_t sub_1BF466418()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1BF466428()
{
  return MEMORY[0x1F4186FF0]();
}

uint64_t sub_1BF466438()
{
  return MEMORY[0x1F4187000]();
}

uint64_t sub_1BF466448()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1BF466458()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1BF466468()
{
  return MEMORY[0x1F41870C0]();
}

uint64_t sub_1BF466478()
{
  return MEMORY[0x1F41870D8]();
}

uint64_t sub_1BF466488()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1BF466498()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1BF4664A8()
{
  return MEMORY[0x1F4187110]();
}

uint64_t sub_1BF4664B8()
{
  return MEMORY[0x1F4129DB0]();
}

uint64_t sub_1BF4664C8()
{
  return MEMORY[0x1F4129DB8]();
}

uint64_t sub_1BF4664D8()
{
  return MEMORY[0x1F41665D8]();
}

uint64_t sub_1BF4664E8()
{
  return MEMORY[0x1F4129DE0]();
}

uint64_t sub_1BF4664F8()
{
  return MEMORY[0x1F4186B18]();
}

uint64_t sub_1BF466508()
{
  return MEMORY[0x1F4186B50]();
}

uint64_t sub_1BF466518()
{
  return MEMORY[0x1F4129E18]();
}

uint64_t sub_1BF466528()
{
  return MEMORY[0x1F41293F8]();
}

uint64_t sub_1BF466538()
{
  return MEMORY[0x1F4166800]();
}

uint64_t sub_1BF466548()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1BF466558()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1BF466578()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1BF466588()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1BF466598()
{
  return MEMORY[0x1F40E6C30]();
}

uint64_t sub_1BF4665A8()
{
  return MEMORY[0x1F40E6C68]();
}

uint64_t sub_1BF4665B8()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_1BF4665C8()
{
  return MEMORY[0x1F40E6CB8]();
}

uint64_t sub_1BF4665D8()
{
  return MEMORY[0x1F40E6D58]();
}

uint64_t sub_1BF4665E8()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1BF466608()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1BF466618()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1BF466628()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1BF466638()
{
  return MEMORY[0x1F4184B58]();
}

uint64_t sub_1BF466648()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1BF466658()
{
  return MEMORY[0x1F4184B78]();
}

uint64_t sub_1BF466668()
{
  return MEMORY[0x1F4184B80]();
}

uint64_t sub_1BF466678()
{
  return MEMORY[0x1F4184B88]();
}

uint64_t sub_1BF466688()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1BF466698()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1BF4666A8()
{
  return MEMORY[0x1F4184BB0]();
}

uint64_t sub_1BF4666B8()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1BF4666C8()
{
  return MEMORY[0x1F4184BC8]();
}

uint64_t sub_1BF4666D8()
{
  return MEMORY[0x1F4184BD0]();
}

uint64_t sub_1BF4666E8()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1BF4666F8()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1BF466708()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1BF466718()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1BF466728()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1BF466738()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1BF466748()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1BF466758()
{
  return MEMORY[0x1F4184CC0]();
}

uint64_t sub_1BF466768()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1BF466778()
{
  return MEMORY[0x1F4184D28]();
}

uint64_t sub_1BF466788()
{
  return MEMORY[0x1F4184D30]();
}

uint64_t sub_1BF466798()
{
  return MEMORY[0x1F4184D38]();
}

uint64_t sub_1BF4667A8()
{
  return MEMORY[0x1F4184D40]();
}

uint64_t sub_1BF4667B8()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t sub_1BF4667C8()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1BF4667D8()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1BF4667E8()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1BF4667F8()
{
  return MEMORY[0x1F4185048]();
}

uint64_t sub_1BF466808()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1BF466818()
{
  return MEMORY[0x1F41851A0]();
}

uint64_t sub_1BF466828()
{
  return MEMORY[0x1F41851B8]();
}

uint64_t sub_1BF466838()
{
  return MEMORY[0x1F41851C0]();
}

uint64_t sub_1BF466848()
{
  return MEMORY[0x1F41851F8]();
}

uint64_t sub_1BF466858()
{
  return MEMORY[0x1F4185270]();
}

uint64_t sub_1BF466868()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1BF466878()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1BF466888()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1BF466898()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1BF4668A8()
{
  return MEMORY[0x1F4185450]();
}

uint64_t sub_1BF4668B8()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1BF4668C8()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1BF4668D8()
{
  return MEMORY[0x1F4185570]();
}

uint64_t sub_1BF4668E8()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1BF4668F8()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1BF466908()
{
  return MEMORY[0x1F4185698]();
}

uint64_t sub_1BF466918()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1BF466928()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1BF466938()
{
  return MEMORY[0x1F41859A8]();
}

uint64_t sub_1BF466948()
{
  return MEMORY[0x1F4185A18]();
}

uint64_t sub_1BF466958()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1BF466968()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1BF466978()
{
  return MEMORY[0x1F4185BB8]();
}

uint64_t sub_1BF466988()
{
  return MEMORY[0x1F4185D10]();
}

uint64_t sub_1BF466998()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_1BF4669A8()
{
  return MEMORY[0x1F4185DA0]();
}

uint64_t sub_1BF4669B8()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1BF4669C8()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1BF4669F8()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1BF466A08()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1BF466A18()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1BF466A28()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1BF466A38()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1BF466A58()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1BF466A68()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1BF466A78()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1BF466A88()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_1BF466A98()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1BF466AA8()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1BF466AB8()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1BF466AE8()
{
  return MEMORY[0x1F4186318]();
}

uint64_t AMSError()
{
  return MEMORY[0x1F410A918]();
}

uint64_t AMSLogKey()
{
  return MEMORY[0x1F410A940]();
}

uint64_t AMSSetLogKey()
{
  return MEMORY[0x1F410A958]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D20](retstr, sx, sy, sz);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFRelease(CFTypeRef cf)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x1F40DC100](time);
  return result;
}

CMTime *__cdecl CMTimebaseGetTime(CMTime *__return_ptr retstr, CMTimebaseRef timebase)
{
  return (CMTime *)MEMORY[0x1F40DC260](retstr, timebase);
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x1F417CDE8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x1F4166B50]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4166C50]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CTServerConnectionCopyCellularUsagePolicy()
{
  return MEMORY[0x1F40DF020]();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x1F40DF0C8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x1F4186398]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

htmlParserCtxtPtr htmlCreateMemoryParserCtxt(const char *buffer, int size)
{
  return (htmlParserCtxtPtr)MEMORY[0x1F4182578](buffer, *(void *)&size);
}

int htmlCtxtUseOptions(htmlParserCtxtPtr ctxt, int options)
{
  return MEMORY[0x1F4182588](ctxt, *(void *)&options);
}

int htmlParseDocument(htmlParserCtxtPtr ctxt)
{
  return MEMORY[0x1F41825A0](ctxt);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1F4186478]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x1F41864B0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1F4186568]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1F41866A0]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x1F41866E8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x1F41868A0]();
}

uint64_t swift_weakCopyAssign()
{
  return MEMORY[0x1F41868A8]();
}

uint64_t swift_weakCopyInit()
{
  return MEMORY[0x1F41868B0]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

uint64_t swift_weakTakeAssign()
{
  return MEMORY[0x1F41868D0]();
}

uint64_t swift_weakTakeInit()
{
  return MEMORY[0x1F41868D8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1F41868E8]();
}

xmlErrorPtr xmlCtxtGetLastError(void *ctx)
{
  return (xmlErrorPtr)MEMORY[0x1F4182628](ctx);
}

void xmlFreeDoc(xmlDocPtr cur)
{
}

void xmlFreeParserCtxt(xmlParserCtxtPtr ctxt)
{
}

void xmlInitParser(void)
{
}

void xmlStopParser(xmlParserCtxtPtr ctxt)
{
}

int xmlStrEqual(const xmlChar *str1, const xmlChar *str2)
{
  return MEMORY[0x1F4182930](str1, str2);
}

int xmlStrlen(const xmlChar *str)
{
  return MEMORY[0x1F4182948](str);
}