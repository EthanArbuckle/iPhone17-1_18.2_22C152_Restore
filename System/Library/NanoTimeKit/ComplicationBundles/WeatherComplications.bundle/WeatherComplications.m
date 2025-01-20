id sub_237924E28(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  uint64_t v7;
  __CFString **v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t vars8;

  v6 = [a1 objectForKeyedSubscript:*MEMORY[0x263F85FB0]];
  v7 = [v6 unsignedIntegerValue];

  if (a3)
  {
    if (a3 != 1)
    {
      v9 = 0;
      goto LABEL_8;
    }
    v8 = NWCWFWeatherConditionsNighttimeImages;
  }
  else
  {
    v8 = NWCWFWeatherConditionsDaytimeImages;
  }
  v9 = v8[v7];
  if (v9)
  {
    v10 = [MEMORY[0x263F82818] configurationWithScale:a4];
    v11 = [MEMORY[0x263F827E8] systemImageNamed:v9 withConfiguration:v10];
    v12 = [v11 imageWithRenderingMode:1];

    goto LABEL_9;
  }
LABEL_8:
  v12 = 0;
LABEL_9:

  return v12;
}

uint64_t sub_237924F18(void *a1)
{
  v1 = [a1 objectForKeyedSubscript:*MEMORY[0x263F85FB0]];
  uint64_t v2 = [v1 unsignedIntegerValue];

  return v2;
}

__n128 sub_237924FC4(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_237924FD4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_237924FF4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
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
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CLLocationCoordinate2D(uint64_t a1)
{
}

void type metadata accessor for CLKComplicationFamily(uint64_t a1)
{
}

uint64_t sub_237925044@<X0>(char *a1@<X8>)
{
  v47 = a1;
  uint64_t v1 = sub_23796E2D8();
  uint64_t v45 = *(void *)(v1 - 8);
  uint64_t v46 = v1;
  MEMORY[0x270FA5388](v1);
  v43 = (char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_23796E358();
  MEMORY[0x270FA5388](v3 - 8);
  v44 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for WindTemplateModel();
  MEMORY[0x270FA5388](v5 - 8);
  v41 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_23796E2A8();
  uint64_t v48 = *(void *)(v40 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v40);
  v42 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  v10 = (char *)&v39 - v9;
  sub_2379265BC(&qword_268937248);
  uint64_t v11 = *(void *)(sub_2379265BC(&qword_268937250) - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v39 = (unsigned char *)(4 * v12);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_2379710C0;
  unint64_t v15 = v14 + v13;
  *(unsigned char *)(v14 + v13) = 2;
  v16 = self;
  id v17 = objc_msgSend(v16, sel_milesPerHour);
  sub_237926638(0, (unint64_t *)&qword_268937258);
  sub_23796E1B8();
  *(unsigned char *)(v15 + v12) = 0;
  id v18 = objc_msgSend(v16, sel_milesPerHour);
  sub_23796E1B8();
  *(unsigned char *)(v15 + 2 * v12) = 15;
  id v19 = objc_msgSend(v16, sel_milesPerHour);
  sub_23796E1B8();
  uint64_t v20 = 3 * v12;
  uint64_t v21 = v40;
  *(unsigned char *)(v15 + v20) = 2;
  id v22 = objc_msgSend(v16, sel_milesPerHour);
  sub_23796E1B8();
  v39[v15] = 0;
  id v23 = objc_msgSend(v16, sel_milesPerHour);
  uint64_t v24 = sub_23796E1B8();
  uint64_t v52 = 0;
  uint64_t v53 = MEMORY[0x263F8EE78];
  sub_23792D380(v24);
  v25 = v42;
  sub_23796E1F8();
  v49 = &v52;
  uint64_t v50 = v14;
  v51 = &v53;
  sub_23796E258();
  v26 = *(void (**)(char *, uint64_t))(v48 + 8);
  v26(v25, v21);
  v26(v10, v21);
  uint64_t v27 = (uint64_t)v41;
  swift_bridgeObjectRelease();
  id v28 = objc_allocWithZone(MEMORY[0x263F58060]);
  sub_237926638(0, (unint64_t *)&qword_268937260);
  swift_bridgeObjectRetain();
  v29 = (void *)sub_23796EB08();
  swift_bridgeObjectRelease();
  v39 = objc_msgSend(v28, sel_initWithEntries_, v29);

  uint64_t v30 = sub_2379393A8(v27);
  v42 = v10;
  sub_23792D380(v30);
  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v31 = (id)qword_268937660;
  v32 = (void *)sub_23796EA68();
  v33 = (void *)sub_23796EA68();
  id v34 = objc_msgSend(v31, sel_localizedStringForKey_value_table_, v32, 0, v33);

  sub_23796EA98();
  sub_23796E348();
  v35 = v43;
  sub_23796E2C8();
  sub_23796E2B8();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v35, v46);
  uint64_t v36 = type metadata accessor for WindRectangularTemplateModel();
  v37 = v47;
  sub_23796E8A8();
  *(void *)v37 = v39;
  sub_237926674(v27, (uint64_t)&v37[*(int *)(v36 + 20)]);
  (*(void (**)(char *, char *, uint64_t))(v48 + 32))(&v37[*(int *)(v36 + 24)], v42, v21);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2379256C0(uint64_t a1, unint64_t *a2, unsigned char *a3, void *a4)
{
  uint64_t v40 = a4;
  sub_2379265BC(&qword_268937268);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v39 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_23796E318();
  uint64_t v8 = *(void *)(v7 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2379265BC(&qword_268937250);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  unint64_t v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  id v17 = (char *)&v36 - v16;
  unint64_t v18 = *a2;
  v41 = a2;
  if (!v18)
  {
    uint64_t v23 = 0;
    uint64_t v38 = 0;
    goto LABEL_6;
  }
  uint64_t v37 = v7;
  if (qword_2689370E8 != -1) {
    goto LABEL_14;
  }
  while (1)
  {
    id v19 = (id)qword_268937668;
    uint64_t v20 = (void *)sub_23796E228();
    id v21 = objc_msgSend(v19, sel_stringFromDate_, v20);

    uint64_t v38 = sub_23796EA98();
    uint64_t v23 = v22;

    unint64_t v18 = *v41;
    if ((*v41 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else
    {
      uint64_t v7 = v37;
LABEL_6:
      if (v18 < *((void *)a3 + 2))
      {
        uint64_t v24 = *(int *)(v11 + 48);
        uint64_t v37 = v23;
        v25 = &v17[v24];
        sub_2379266D8((uint64_t)&a3[((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))+ *(void *)(v12 + 72) * v18], (uint64_t)v17, &qword_268937250);
        a3 = &v15[*(int *)(v11 + 48)];
        *unint64_t v15 = *v17;
        uint64_t v11 = sub_2379265BC(&qword_268937230);
        uint64_t v26 = *(void *)(v11 - 8);
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v26 + 16))(a3, v25, v11);
        uint64_t v12 = sub_23796E7C8();
        uint64_t v28 = v27;
        sub_23796E308();
        sub_23796E198();
        (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
        uint64_t v29 = v42;
        uint64_t v30 = v43;
        long long v47 = v44;
        sub_237926600((uint64_t)&v47);
        long long v46 = v45;
        sub_237926600((uint64_t)&v46);
        uint64_t v8 = (uint64_t)v39;
        sub_23796E348();
        uint64_t v31 = sub_23796E358();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v8, 0, 1, v31);
        id v32 = objc_allocWithZone(MEMORY[0x263F58068]);
        sub_237933770(v12, v28, v29, v30, v38, v37, 1, v8);
        uint64_t v33 = (*(uint64_t (**)(unsigned char *, uint64_t))(v26 + 8))(a3, v11);
        id v34 = v40;
        MEMORY[0x237E25BF0](v33);
        unint64_t v15 = *(unsigned char **)((*v34 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if ((unint64_t)v15 < *(void *)((*v34 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          goto LABEL_8;
        }
        goto LABEL_12;
      }
    }
    __break(1u);
LABEL_12:
    sub_23796EB38();
LABEL_8:
    sub_23796EB58();
    sub_23796EB28();
    uint64_t result = sub_23792673C((uint64_t)v17, &qword_268937250);
    if (!__OFADD__(*v41, 1)) {
      break;
    }
    __break(1u);
LABEL_14:
    swift_once();
  }
  ++*v41;
  return result;
}

uint64_t sub_237925B40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 24);
  uint64_t v5 = sub_23796E2A8();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

void *sub_237925BB4@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_237925BC4(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_237925BD0(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_237925BE4(uint64_t a1)
{
  uint64_t result = sub_237927DA8(&qword_268937168, (void (*)(uint64_t))type metadata accessor for WindRectangularTemplateModel);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata accessor for WindRectangularTemplateModel()
{
  uint64_t result = qword_268937278;
  if (!qword_268937278) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_237925C88(uint64_t a1, uint64_t a2)
{
  return sub_237925DF4(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_237925CA0(uint64_t a1, id *a2)
{
  uint64_t result = sub_23796EA78();
  *a2 = 0;
  return result;
}

uint64_t sub_237925D18(uint64_t a1, id *a2)
{
  char v3 = sub_23796EA88();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_237925D98@<X0>(uint64_t *a1@<X8>)
{
  sub_23796EA98();
  uint64_t v2 = sub_23796EA68();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_237925DDC(uint64_t a1, uint64_t a2)
{
  return sub_237925DF4(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_237925DF4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_23796EA98();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_237925E38()
{
  sub_23796EA98();
  sub_23796EAB8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_237925E8C()
{
  sub_23796EA98();
  sub_23796EDD8();
  sub_23796EAB8();
  uint64_t v0 = sub_23796EDE8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_237925F00()
{
  uint64_t v0 = sub_23796EA98();
  uint64_t v2 = v1;
  if (v0 == sub_23796EA98() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_23796EDB8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_237925F8C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_23796EA68();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_237925FD4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23796EA98();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_237926000(uint64_t a1)
{
  uint64_t v2 = sub_237927DA8(&qword_2689372B8, type metadata accessor for Key);
  uint64_t v3 = sub_237927DA8((unint64_t *)&unk_2689372C0, type metadata accessor for Key);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_2379260BC(uint64_t a1, uint64_t a2)
{
  uint64_t v29 = a1;
  uint64_t v3 = sub_23796E318();
  uint64_t v34 = *(void *)(v3 - 8);
  uint64_t v35 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v33 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2379265BC(&qword_268937230);
  uint64_t v31 = *(void *)(v5 - 8);
  uint64_t v32 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v30 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_23796E448();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2379265BC(&qword_268937238);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_2379265BC(&qword_268937240);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_23796E7F8();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2379266D8(a2, (uint64_t)v13, &qword_268937238);
  uint64_t v21 = sub_23796E548();
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v13, 1, v21) == 1)
  {
    sub_23792673C((uint64_t)v13, &qword_268937238);
    uint64_t v23 = 1;
  }
  else
  {
    sub_23796E528();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v13, v21);
    uint64_t v23 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v16, v23, 1, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v29, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
  {
    sub_23796E418();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    sub_23792673C((uint64_t)v16, &qword_268937240);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v20, v16, v17);
  }
  sub_23796E7D8();
  uint64_t v24 = sub_23796E7C8();
  v25 = v30;
  sub_23796E7E8();
  uint64_t v26 = v33;
  sub_23796E308();
  sub_23796E198();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v26, v35);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v25, v32);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  long long v39 = v36;
  sub_237926600((uint64_t)&v39);
  long long v38 = v37;
  sub_237926600((uint64_t)&v38);
  return v24;
}

uint64_t sub_2379265BC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_237926600(uint64_t a1)
{
  return a1;
}

uint64_t sub_23792662C(uint64_t a1)
{
  return sub_2379256C0(a1, *(unint64_t **)(v1 + 16), *(unsigned char **)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_237926638(uint64_t a1, unint64_t *a2)
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

uint64_t sub_237926674(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WindTemplateModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2379266D8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_2379265BC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23792673C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_2379265BC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void type metadata accessor for Key(uint64_t a1)
{
}

void sub_2379267AC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void **sub_2379267F4(void **a1, void **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v30 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v5 = a3[5];
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_23796E2A8();
    uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
    v10 = v4;
    uint64_t v43 = v9;
    uint64_t v44 = v8;
    v9(v6, v7, v8);
    uint64_t v11 = (int *)type metadata accessor for WindTemplateModel();
    uint64_t v12 = v11[5];
    uint64_t v13 = &v6[v12];
    uint64_t v14 = &v7[v12];
    uint64_t v15 = *(void *)&v7[v12 + 8];
    *(void *)uint64_t v13 = *(void *)&v7[v12];
    *((void *)v13 + 1) = v15;
    uint64_t v16 = *(void *)&v7[v12 + 24];
    *((void *)v13 + 2) = *(void *)&v7[v12 + 16];
    *((void *)v13 + 3) = v16;
    uint64_t v17 = (int *)sub_23796E8C8();
    uint64_t v18 = v17[6];
    uint64_t v40 = &v14[v18];
    v41 = &v13[v18];
    uint64_t v19 = sub_23796E358();
    uint64_t v20 = *(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16);
    uint64_t v21 = v19;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v22 = v41;
    uint64_t v42 = v20;
    v20(v22, v40, v21);
    uint64_t v23 = v17;
    v13[v17[7]] = v14[v17[7]];
    *(_OWORD *)&v13[v17[8]] = *(_OWORD *)&v14[v17[8]];
    v6[v11[6]] = v7[v11[6]];
    uint64_t v24 = v11[7];
    v25 = &v6[v24];
    uint64_t v26 = &v7[v24];
    uint64_t v27 = sub_2379265BC(&qword_268937230);
    uint64_t v28 = *(void *)(v27 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
    {
      uint64_t v29 = sub_2379265BC((uint64_t *)&unk_268937840);
      memcpy(v25, v26, *(void *)(*(void *)(v29 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v25, v26, v27);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
    }
    uint64_t v30 = a1;
    v43((char *)a1 + a3[6], (char *)a2 + a3[6], v44);
    uint64_t v31 = a3[7];
    uint64_t v32 = (void **)((char *)a1 + v31);
    uint64_t v33 = (char *)a2 + v31;
    uint64_t v34 = *(uint64_t *)((char *)a2 + v31 + 8);
    void *v32 = *(void **)((char *)a2 + v31);
    v32[1] = v34;
    uint64_t v35 = *(uint64_t *)((char *)a2 + v31 + 24);
    v32[2] = *(void **)((char *)a2 + v31 + 16);
    v32[3] = v35;
    uint64_t v36 = v23[6];
    long long v37 = (char *)v32 + v36;
    long long v38 = &v33[v36];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v42(v37, v38, v21);
    *((unsigned char *)v32 + v23[7]) = v33[v23[7]];
    *(_OWORD *)((char *)v32 + v23[8]) = *(_OWORD *)&v33[v23[8]];
  }
  return v30;
}

uint64_t sub_237926B1C(id *a1, int *a2)
{
  uint64_t v4 = (char *)a1 + a2[5];
  uint64_t v5 = sub_23796E2A8();
  uint64_t v6 = *(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  uint64_t v7 = type metadata accessor for WindTemplateModel();
  uint64_t v8 = &v4[*(int *)(v7 + 20)];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_23796E8C8();
  v10 = &v8[*(int *)(v9 + 24)];
  uint64_t v11 = sub_23796E358();
  uint64_t v18 = *(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8);
  v18(v10, v11);
  uint64_t v12 = &v4[*(int *)(v7 + 28)];
  uint64_t v13 = sub_2379265BC(&qword_268937230);
  uint64_t v14 = *(void *)(v13 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13)) {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v12, v13);
  }
  v6((char *)a1 + a2[6], v5);
  uint64_t v15 = (char *)a1 + a2[7];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v16 = &v15[*(int *)(v9 + 24)];

  return ((uint64_t (*)(char *, uint64_t))v18)(v16, v11);
}

void **sub_237926D04(void **a1, void **a2, int *a3)
{
  int v3 = *a2;
  *a1 = *a2;
  uint64_t v4 = a3[5];
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_23796E2A8();
  uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
  id v9 = v3;
  v41 = v8;
  uint64_t v42 = v7;
  v8(v5, v6, v7);
  v10 = (int *)type metadata accessor for WindTemplateModel();
  uint64_t v11 = v10[5];
  uint64_t v12 = &v5[v11];
  uint64_t v13 = &v6[v11];
  uint64_t v14 = *(void *)&v6[v11 + 8];
  *(void *)uint64_t v12 = *(void *)&v6[v11];
  *((void *)v12 + 1) = v14;
  uint64_t v15 = *(void *)&v6[v11 + 24];
  *((void *)v12 + 2) = *(void *)&v6[v11 + 16];
  *((void *)v12 + 3) = v15;
  uint64_t v16 = (int *)sub_23796E8C8();
  uint64_t v17 = v16[6];
  long long v38 = &v13[v17];
  long long v39 = &v12[v17];
  uint64_t v18 = sub_23796E358();
  uint64_t v19 = *(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16);
  uint64_t v20 = v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v21 = v39;
  uint64_t v40 = v19;
  v19(v21, v38, v20);
  uint64_t v22 = v16;
  v12[v16[7]] = v13[v16[7]];
  *(_OWORD *)&v12[v16[8]] = *(_OWORD *)&v13[v16[8]];
  v5[v10[6]] = v6[v10[6]];
  uint64_t v23 = v10[7];
  uint64_t v24 = &v5[v23];
  v25 = &v6[v23];
  uint64_t v26 = sub_2379265BC(&qword_268937230);
  uint64_t v27 = *(void *)(v26 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26))
  {
    uint64_t v28 = sub_2379265BC((uint64_t *)&unk_268937840);
    memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v24, v25, v26);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
  }
  v41((char *)a1 + a3[6], (char *)a2 + a3[6], v42);
  uint64_t v29 = a3[7];
  uint64_t v30 = (void **)((char *)a1 + v29);
  uint64_t v31 = (char *)a2 + v29;
  uint64_t v32 = *(uint64_t *)((char *)a2 + v29 + 8);
  *uint64_t v30 = *(void **)((char *)a2 + v29);
  v30[1] = v32;
  uint64_t v33 = *(uint64_t *)((char *)a2 + v29 + 24);
  v30[2] = *(void **)((char *)a2 + v29 + 16);
  v30[3] = v33;
  uint64_t v34 = v16[6];
  uint64_t v35 = (char *)v30 + v34;
  uint64_t v36 = &v31[v34];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v40(v35, v36, v20);
  *((unsigned char *)v30 + v22[7]) = v31[v22[7]];
  *(_OWORD *)((char *)v30 + v22[8]) = *(_OWORD *)&v31[v22[8]];
  return a1;
}

void **sub_237926FE0(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a1;
  *a1 = *a2;
  id v8 = v6;

  uint64_t v44 = a3;
  uint64_t v9 = *(int *)(a3 + 20);
  v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_23796E2A8();
  uint64_t v42 = *(void (**)(char *, char *))(*(void *)(v12 - 8) + 24);
  uint64_t v43 = v12;
  v42(v10, v11);
  uint64_t v13 = (int *)type metadata accessor for WindTemplateModel();
  uint64_t v14 = v13[5];
  uint64_t v15 = &v10[v14];
  uint64_t v16 = &v11[v14];
  *(void *)uint64_t v15 = *(void *)&v11[v14];
  *((void *)v15 + 1) = *(void *)&v11[v14 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v15 + 2) = *((void *)v16 + 2);
  *((void *)v15 + 3) = *((void *)v16 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = (int *)sub_23796E8C8();
  uint64_t v18 = v17[6];
  uint64_t v19 = &v15[v18];
  uint64_t v20 = &v16[v18];
  uint64_t v21 = sub_23796E358();
  uint64_t v40 = *(void (**)(char *, char *))(*(void *)(v21 - 8) + 24);
  uint64_t v41 = v21;
  v40(v19, v20);
  v15[v17[7]] = v16[v17[7]];
  uint64_t v22 = v17[8];
  uint64_t v23 = &v15[v22];
  uint64_t v24 = &v16[v22];
  *(void *)uint64_t v23 = *(void *)v24;
  *((void *)v23 + 1) = *((void *)v24 + 1);
  v10[v13[6]] = v11[v13[6]];
  uint64_t v25 = v13[7];
  uint64_t v26 = &v10[v25];
  uint64_t v27 = &v11[v25];
  uint64_t v28 = sub_2379265BC(&qword_268937230);
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v29 + 48);
  LODWORD(v20) = v30(v26, 1, v28);
  int v31 = v30(v27, 1, v28);
  if (!v20)
  {
    if (!v31)
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 24))(v26, v27, v28);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v29 + 8))(v26, v28);
    goto LABEL_6;
  }
  if (v31)
  {
LABEL_6:
    uint64_t v32 = sub_2379265BC((uint64_t *)&unk_268937840);
    memcpy(v26, v27, *(void *)(*(void *)(v32 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v26, v27, v28);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
LABEL_7:
  ((void (*)(char *, char *, uint64_t))v42)((char *)a1 + *(int *)(v44 + 24), (char *)a2 + *(int *)(v44 + 24), v43);
  uint64_t v33 = *(int *)(v44 + 28);
  uint64_t v34 = (void **)((char *)a1 + v33);
  uint64_t v35 = (char *)a2 + v33;
  *uint64_t v34 = *(void **)((char *)a2 + v33);
  v34[1] = *(void **)((char *)a2 + v33 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v34[2] = *((void *)v35 + 2);
  v34[3] = *((void *)v35 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  ((void (*)(char *, char *, uint64_t))v40)((char *)v34 + v17[6], &v35[v17[6]], v41);
  *((unsigned char *)v34 + v17[7]) = v35[v17[7]];
  uint64_t v36 = v17[8];
  long long v37 = (void *)((char *)v34 + v36);
  long long v38 = &v35[v36];
  void *v37 = *(void *)v38;
  v37[1] = *((void *)v38 + 1);
  return a1;
}

char *sub_237927370(char *a1, char *a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = a3[5];
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_23796E2A8();
  int v31 = *(void (**)(char *, char *))(*(void *)(v7 - 8) + 32);
  uint64_t v32 = v7;
  v31(v5, v6);
  id v8 = (int *)type metadata accessor for WindTemplateModel();
  uint64_t v9 = v8[5];
  v10 = &v5[v9];
  uint64_t v11 = &v6[v9];
  long long v12 = *(_OWORD *)&v6[v9 + 16];
  *(_OWORD *)v10 = *(_OWORD *)&v6[v9];
  *((_OWORD *)v10 + 1) = v12;
  uint64_t v13 = (int *)sub_23796E8C8();
  uint64_t v14 = v13[6];
  uint64_t v15 = &v10[v14];
  uint64_t v16 = &v11[v14];
  uint64_t v17 = sub_23796E358();
  uint64_t v18 = v15;
  uint64_t v19 = *(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32);
  v19(v18, v16, v17);
  v10[v13[7]] = v11[v13[7]];
  *(_OWORD *)&v10[v13[8]] = *(_OWORD *)&v11[v13[8]];
  v5[v8[6]] = v6[v8[6]];
  uint64_t v20 = v8[7];
  uint64_t v21 = &v5[v20];
  uint64_t v22 = &v6[v20];
  uint64_t v23 = sub_2379265BC(&qword_268937230);
  uint64_t v24 = *(void *)(v23 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
  {
    uint64_t v25 = sub_2379265BC((uint64_t *)&unk_268937840);
    memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v21, v22, v23);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  }
  ((void (*)(char *, char *, uint64_t))v31)(&a1[a3[6]], &a2[a3[6]], v32);
  uint64_t v26 = a3[7];
  uint64_t v27 = &a1[v26];
  uint64_t v28 = &a2[v26];
  long long v29 = *(_OWORD *)&a2[v26 + 16];
  *(_OWORD *)uint64_t v27 = *(_OWORD *)&a2[v26];
  *((_OWORD *)v27 + 1) = v29;
  v19(&a1[v26 + v13[6]], &a2[v26 + v13[6]], v17);
  v27[v13[7]] = v28[v13[7]];
  *(_OWORD *)&v27[v13[8]] = *(_OWORD *)&v28[v13[8]];
  return a1;
}

void **sub_237927608(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v40 = a3;
  uint64_t v7 = *(int *)(a3 + 20);
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_23796E2A8();
  long long v38 = *(void (**)(char *, char *))(*(void *)(v10 - 8) + 40);
  uint64_t v39 = v10;
  v38(v8, v9);
  uint64_t v11 = (int *)type metadata accessor for WindTemplateModel();
  uint64_t v12 = v11[5];
  uint64_t v13 = &v8[v12];
  uint64_t v14 = &v9[v12];
  uint64_t v15 = *(void *)&v9[v12 + 8];
  *(void *)uint64_t v13 = *(void *)&v9[v12];
  *((void *)v13 + 1) = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = *((void *)v14 + 3);
  *((void *)v13 + 2) = *((void *)v14 + 2);
  *((void *)v13 + 3) = v16;
  swift_bridgeObjectRelease();
  uint64_t v17 = (int *)sub_23796E8C8();
  uint64_t v18 = v17[6];
  uint64_t v19 = &v13[v18];
  uint64_t v20 = &v14[v18];
  uint64_t v21 = sub_23796E358();
  uint64_t v36 = *(void (**)(char *, char *))(*(void *)(v21 - 8) + 40);
  uint64_t v37 = v21;
  v36(v19, v20);
  v13[v17[7]] = v14[v17[7]];
  *(_OWORD *)&v13[v17[8]] = *(_OWORD *)&v14[v17[8]];
  v8[v11[6]] = v9[v11[6]];
  uint64_t v22 = v11[7];
  uint64_t v23 = &v8[v22];
  uint64_t v24 = &v9[v22];
  uint64_t v25 = sub_2379265BC(&qword_268937230);
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v26 + 48);
  LODWORD(v20) = v27(v23, 1, v25);
  int v28 = v27(v24, 1, v25);
  if (!v20)
  {
    if (!v28)
    {
      (*(void (**)(char *, char *, uint64_t))(v26 + 40))(v23, v24, v25);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v26 + 8))(v23, v25);
    goto LABEL_6;
  }
  if (v28)
  {
LABEL_6:
    uint64_t v29 = sub_2379265BC((uint64_t *)&unk_268937840);
    memcpy(v23, v24, *(void *)(*(void *)(v29 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v23, v24, v25);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
LABEL_7:
  ((void (*)(char *, char *, uint64_t))v38)((char *)a1 + *(int *)(v40 + 24), (char *)a2 + *(int *)(v40 + 24), v39);
  uint64_t v30 = *(int *)(v40 + 28);
  int v31 = (void **)((char *)a1 + v30);
  uint64_t v32 = (void **)((char *)a2 + v30);
  uint64_t v33 = v32[1];
  *int v31 = *v32;
  v31[1] = v33;
  swift_bridgeObjectRelease();
  uint64_t v34 = v32[3];
  v31[2] = v32[2];
  v31[3] = v34;
  swift_bridgeObjectRelease();
  ((void (*)(char *, char *, uint64_t))v36)((char *)v31 + v17[6], (char *)v32 + v17[6], v37);
  *((unsigned char *)v31 + v17[7]) = *((unsigned char *)v32 + v17[7]);
  *(_OWORD *)((char *)v31 + v17[8]) = *(_OWORD *)((char *)v32 + v17[8]);
  return a1;
}

uint64_t sub_237927934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_237927948);
}

uint64_t sub_237927948(char *a1, uint64_t a2, int *a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *(void *)a1;
    if (*(void *)a1 >= 0xFFFFFFFFuLL) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  uint64_t v8 = type metadata accessor for WindTemplateModel();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a2)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a3[5];
LABEL_9:
    uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
    return v13(&a1[v11], a2, v9);
  }
  uint64_t v12 = sub_23796E2A8();
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a3[6];
    goto LABEL_9;
  }
  uint64_t v14 = sub_23796E8C8();
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = &a1[a3[7]];

  return v15(v17, a2, v16);
}

uint64_t sub_237927AC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_237927AD4);
}

char *sub_237927AD4(char *result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)uint64_t result = (a2 - 1);
    return result;
  }
  uint64_t v8 = type metadata accessor for WindTemplateModel();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[5];
LABEL_7:
    uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return (char *)v13(&v5[v11], a2, a2, v9);
  }
  uint64_t v12 = sub_23796E2A8();
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[6];
    goto LABEL_7;
  }
  uint64_t v14 = sub_23796E8C8();
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  uint64_t v16 = v14;
  uint64_t v17 = &v5[a4[7]];

  return (char *)v15(v17, a2, a2, v16);
}

uint64_t sub_237927C4C()
{
  uint64_t result = type metadata accessor for WindTemplateModel();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_23796E2A8();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_23796E8C8();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_237927D60()
{
  return sub_237927DA8(&qword_268937910, (void (*)(uint64_t))type metadata accessor for WindTemplateModel);
}

uint64_t sub_237927DA8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_237927DF0(uint64_t a1)
{
  uint64_t result = sub_237927DA8(&qword_268937290, (void (*)(uint64_t))type metadata accessor for WindRectangularTemplateModel);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_237927E48(uint64_t a1)
{
  uint64_t result = sub_237927DA8(&qword_268937298, (void (*)(uint64_t))type metadata accessor for WindRectangularTemplateModel);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_237927EA0()
{
  return sub_237927DA8(&qword_2689372A0, type metadata accessor for Key);
}

uint64_t sub_237927EE8()
{
  return sub_237927DA8(&qword_2689372A8, type metadata accessor for Key);
}

uint64_t sub_237927F30()
{
  return sub_237927DA8(&qword_2689372B0, type metadata accessor for Key);
}

uint64_t sub_237927F78()
{
  type metadata accessor for UVTemplateFormatter();
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = *(void *)sub_23796E978();
  strcpy((char *)(v0 + 24), "sun.max.fill");
  *(unsigned char *)(v0 + 37) = 0;
  *(_WORD *)(v0 + 38) = -5120;
  uint64_t v2 = sub_2379290B0(&qword_268937338, v1, (void (*)(uint64_t))type metadata accessor for UVTemplateFormatter);
  *(void *)&xmmword_268939420 = v0;
  *((void *)&xmmword_268939420 + 1) = v2;

  return swift_retain();
}

id sub_237928028(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for UVTemplateModel();
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2379291E0(a1, (uint64_t)v5);
  uint64_t v6 = (void *)sub_237955398(&v5[*(int *)(v3 + 28)], v5[*(int *)(v3 + 20) + 8]);
  id v7 = objc_msgSend(self, sel_systemCyanColor);
  objc_msgSend(v6, sel_setTintColor_, v7);

  sub_237929244((uint64_t)v5);
  uint64_t v8 = (*(uint64_t (**)(void, void, uint64_t))(**(void **)(v1 + 16) + 88))(*(void *)(a1 + *(int *)(v3 + 20)), *(unsigned __int8 *)(a1 + *(int *)(v3 + 20) + 8), 2);
  uint64_t v10 = v9;
  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v11 = (id)qword_268937660;
  uint64_t v12 = (void *)sub_23796EA68();
  uint64_t v13 = (void *)sub_23796EA68();
  id v14 = objc_msgSend(v11, sel_localizedStringForKey_value_table_, v12, 0, v13);

  sub_23796EA98();
  sub_2379265BC((uint64_t *)&unk_268937390);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_2379713F0;
  *(void *)(v15 + 56) = MEMORY[0x263F8D310];
  *(void *)(v15 + 64) = sub_23792918C();
  *(void *)(v15 + 32) = v8;
  *(void *)(v15 + 40) = v10;
  sub_23796EAA8();
  swift_bridgeObjectRelease();
  uint64_t v16 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  uint64_t v17 = self;
  id v18 = objc_msgSend(v17, sel_textProviderWithText_, v16);

  swift_bridgeObjectRetain();
  uint64_t v19 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v20 = objc_msgSend(v17, sel_textProviderWithText_, v19);

  id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD0F8]), sel_initWithHeaderTextProvider_body1TextProvider_body2TextProvider_, v6, v18, v20);
  return v21;
}

id sub_237928374(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = type metadata accessor for UVTemplateModel();
  (*(void (**)(void, void, uint64_t))(*(void *)v3 + 88))(*(void *)(a1 + *(int *)(v4 + 20)), *(unsigned __int8 *)(a1 + *(int *)(v4 + 20) + 8), 1);
  uint64_t v5 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(self, sel_textProviderWithText_, v5);

  id v7 = v6;
  id v8 = sub_237928EC8(a1);
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD148]), sel_initWithTextProvider_imageProvider_, v7, v8);

  return v9;
}

id sub_237928468(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for UVTemplateModel();
  uint64_t v4 = (uint64_t *)(a1 + *(int *)(v3 + 20));
  if ((v4[1] & 1) != 0 || (uint64_t v5 = (uint64_t *)(a1 + *(int *)(v3 + 24)), (v6 = v5[1]) == 0))
  {
    if (qword_2689370E0 != -1) {
      swift_once();
    }
    id v23 = (id)qword_268937660;
    uint64_t v24 = (void *)sub_23796EA68();
    uint64_t v25 = (void *)sub_23796EA68();
    id v26 = objc_msgSend(v23, sel_localizedStringForKey_value_table_, v24, 0, v25);

    uint64_t v20 = sub_23796EA98();
    uint64_t v22 = v27;
  }
  else
  {
    uint64_t v7 = *v4;
    uint64_t v8 = *v5;
    uint64_t v9 = qword_2689370E0;
    swift_bridgeObjectRetain();
    if (v9 != -1) {
      swift_once();
    }
    id v10 = (id)qword_268937660;
    id v11 = (void *)sub_23796EA68();
    uint64_t v12 = (void *)sub_23796EA68();
    id v13 = objc_msgSend(v10, sel_localizedStringForKey_value_table_, v11, 0, v12);

    sub_23796EA98();
    sub_2379265BC((uint64_t *)&unk_268937390);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_237971400;
    uint64_t v15 = (*(uint64_t (**)(uint64_t, void, void))(**(void **)(v1 + 16) + 88))(v7, 0, 0);
    uint64_t v17 = v16;
    uint64_t v18 = MEMORY[0x263F8D310];
    *(void *)(v14 + 56) = MEMORY[0x263F8D310];
    unint64_t v19 = sub_23792918C();
    *(void *)(v14 + 32) = v15;
    *(void *)(v14 + 40) = v17;
    *(void *)(v14 + 96) = v18;
    *(void *)(v14 + 104) = v19;
    *(void *)(v14 + 64) = v19;
    *(void *)(v14 + 72) = v8;
    *(void *)(v14 + 80) = v6;
    uint64_t v20 = sub_23796EAA8();
    uint64_t v22 = v21;
    swift_bridgeObjectRelease();
  }
  uint64_t v32 = v22;
  sub_237929138();
  sub_23796EC58();
  swift_bridgeObjectRelease();
  int v28 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v29 = objc_msgSend(self, sel_textProviderWithText_, v28, v20, v32);

  id v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD138]), sel_initWithTextProvider_, v29);
  return v30;
}

id sub_2379287BC(uint64_t a1)
{
  return sub_2379287E4(a1, (Class *)0x263EFD038, (Class *)0x263EFD048);
}

id sub_2379287D0(uint64_t a1)
{
  return sub_2379287E4(a1, (Class *)0x263EFD0B0, (Class *)0x263EFD0C0);
}

id sub_2379287E4(uint64_t a1, Class *a2, Class *a3)
{
  id v3 = sub_237928B60(a1);
  uint64_t v5 = v4;
  int v31 = v6;
  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v7 = (id)qword_268937660;
  uint64_t v8 = (void *)sub_23796EA68();
  uint64_t v9 = (void *)sub_23796EA68();
  id v10 = objc_msgSend(v7, sel_localizedStringForKey_value_table_, v8, 0, v9);

  uint64_t v11 = sub_23796EA98();
  uint64_t v13 = v12;

  BOOL v14 = v11 == 1702195828 && v13 == 0xE400000000000000;
  if (!v14 && (sub_23796EDB8() & 1) == 0)
  {
    if (v11 == 0x65736C6166 && v13 == 0xE500000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v28 = sub_23796EDB8();
      swift_bridgeObjectRelease();
      if ((v28 & 1) == 0) {
        goto LABEL_9;
      }
    }
    id v26 = v31;
    id v25 = objc_msgSend(objc_allocWithZone(*a3), sel_initWithGaugeProvider_bottomTextProvider_centerTextProvider_, v3, v31, v5);
    goto LABEL_10;
  }
  swift_bridgeObjectRelease();
LABEL_9:
  swift_bridgeObjectRetain();
  uint64_t v15 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(self, sel_symbolImageProviderWithSystemName_, v15);

  uint64_t v17 = (void *)sub_23792D570();
  objc_msgSend(v16, sel_setTintColor_, v17);

  uint64_t v18 = (void *)qword_268937660;
  id v19 = v16;
  id v20 = v18;
  uint64_t v21 = (void *)sub_23796EA68();
  uint64_t v22 = (void *)sub_23796EA68();
  id v23 = objc_msgSend(v20, sel_localizedStringForKey_value_table_, v21, 0, v22);

  sub_23796EA98();
  uint64_t v24 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  objc_msgSend(v19, sel_setAccessibilityLabel_, v24);

  id v25 = objc_msgSend(objc_allocWithZone(*a2), sel_initWithGaugeProvider_bottomImageProvider_centerTextProvider_, v3, v19, v5);
  id v26 = v5;
  uint64_t v5 = v3;
  id v3 = v19;
LABEL_10:

  return v25;
}

id sub_237928B60(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for UVTemplateModel();
  uint64_t v4 = a1 + *(int *)(v3 + 20);
  uint64_t v5 = *(void *)v4;
  uint64_t v6 = *(unsigned __int8 *)(v4 + 8);
  float v7 = 0.0;
  if ((v6 & 1) == 0)
  {
    uint64_t v8 = *(void *)(a1 + *(int *)(v3 + 36));
    float v7 = (float)((float)v5 / (float)v8) > 0.0 ? (float)v5 / (float)v8 : 0.0;
    if (v7 >= 1.0) {
      float v7 = 1.0;
    }
  }
  sub_2379290F8();
  swift_bridgeObjectRetain();
  uint64_t v9 = (void *)sub_23796EB08();
  swift_bridgeObjectRelease();
  id v10 = self;
  *(float *)&double v11 = v7;
  id v12 = objc_msgSend(v10, sel_gaugeProviderWithStyle_gaugeColors_gaugeColorLocations_fillFraction_, 0, v9, 0, v11);

  (*(void (**)(uint64_t, uint64_t, uint64_t))(**(void **)(v1 + 16) + 88))(v5, v6, 1);
  uint64_t v13 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  BOOL v14 = self;
  objc_msgSend(v14, sel_textProviderWithText_, v13);

  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v15 = (id)qword_268937660;
  id v16 = (void *)sub_23796EA68();
  uint64_t v17 = (void *)sub_23796EA68();
  id v18 = objc_msgSend(v15, sel_localizedStringForKey_value_table_, v16, 0, v17);

  sub_23796EA98();
  id v19 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v20 = objc_msgSend(v14, sel_textProviderWithText_, v19);

  id v21 = v20;
  uint64_t v22 = (void *)sub_23792D570();
  objc_msgSend(v21, sel_setTintColor_, v22);

  return v12;
}

uint64_t sub_237928E18()
{
  swift_release();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for UVTemplateFormatter()
{
  return self;
}

uint64_t sub_237928E7C()
{
  return sub_2379290B0(&qword_268937330, 255, (void (*)(uint64_t))type metadata accessor for UVTemplateModel);
}

id sub_237928EC8(uint64_t a1)
{
  uint64_t v2 = (void *)sub_23796EA68();
  id v3 = objc_msgSend(self, sel_symbolImageProviderWithSystemName_, v2);

  uint64_t v4 = type metadata accessor for UVTemplateModel();
  uint64_t v5 = *(void **)(a1 + *(int *)(v4 + 32));
  if (v5)
  {
    id v6 = *(id *)(a1 + *(int *)(v4 + 32));
  }
  else
  {
    id v6 = objc_msgSend(self, sel_systemCyanColor);
    uint64_t v5 = 0;
  }
  id v7 = v5;
  objc_msgSend(v3, sel_setTintColor_, v6);
  uint64_t v8 = qword_2689370E0;
  id v9 = v3;
  if (v8 != -1) {
    swift_once();
  }
  id v10 = (id)qword_268937660;
  double v11 = (void *)sub_23796EA68();
  id v12 = (void *)sub_23796EA68();
  id v13 = objc_msgSend(v10, sel_localizedStringForKey_value_table_, v11, 0, v12);

  sub_23796EA98();
  BOOL v14 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_setAccessibilityLabel_, v14);

  return v9;
}

uint64_t sub_2379290B0(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

unint64_t sub_2379290F8()
{
  unint64_t result = qword_268937340;
  if (!qword_268937340)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268937340);
  }
  return result;
}

unint64_t sub_237929138()
{
  unint64_t result = qword_268937370;
  if (!qword_268937370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268937370);
  }
  return result;
}

unint64_t sub_23792918C()
{
  unint64_t result = qword_268937348;
  if (!qword_268937348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268937348);
  }
  return result;
}

uint64_t sub_2379291E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UVTemplateModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_237929244(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UVTemplateModel();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2379292A0()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Settings()
{
  return self;
}

uint64_t sub_2379292D4()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DateFormatterCache()
{
  return self;
}

uint64_t sub_237929330()
{
  type metadata accessor for ConditionRectangularTemplateFormatter();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_23792B320(&qword_2689373E8, v1, (void (*)(uint64_t))type metadata accessor for ConditionRectangularTemplateFormatter);
  *(void *)&xmmword_268939430 = v0;
  *((void *)&xmmword_268939430 + 1) = result;
  return result;
}

unint64_t sub_2379293A0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_2379265BC(&qword_2689373E0);
  uint64_t v2 = (void *)sub_23796ED78();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_23794A8CC(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    double v11 = (uint64_t *)(v2[6] + 16 * result);
    *double v11 = v5;
    v11[1] = v6;
    id v12 = (void *)(v2[7] + 16 * result);
    *id v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
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

unint64_t sub_2379294C4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_2379265BC(&qword_2689373D8);
  uint64_t v2 = (void *)sub_23796ED78();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_23794A8CC(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    double v11 = (uint64_t *)(v2[6] + 16 * result);
    *double v11 = v5;
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

unint64_t sub_2379295E0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_2379265BC((uint64_t *)&unk_268937400);
  uint64_t v2 = (void *)sub_23796ED78();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = *(v4 - 1);
    id v7 = v5;
    unint64_t result = sub_23794A944((uint64_t)v6);
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

unint64_t sub_2379296EC(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_2379265BC(&qword_2689373C8);
    uint64_t v2 = (void *)sub_23796ED78();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v33 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v32 = (unint64_t)(63 - v3) >> 6;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t i = 0;
  id v8 = (unint64_t *)&unk_2689373D0;
  unint64_t v9 = 0x263F58060uLL;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v17 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v17 >= v32) {
    goto LABEL_32;
  }
  unint64_t v18 = *(void *)(v33 + 8 * v17);
  int64_t v19 = i + 1;
  if (!v18)
  {
    int64_t v19 = i + 2;
    if (i + 2 >= v32) {
      goto LABEL_32;
    }
    unint64_t v18 = *(void *)(v33 + 8 * v19);
    if (!v18)
    {
      int64_t v19 = i + 3;
      if (i + 3 >= v32) {
        goto LABEL_32;
      }
      unint64_t v18 = *(void *)(v33 + 8 * v19);
      if (!v18)
      {
        int64_t v19 = i + 4;
        if (i + 4 >= v32) {
          goto LABEL_32;
        }
        unint64_t v18 = *(void *)(v33 + 8 * v19);
        if (!v18)
        {
          int64_t v20 = i + 5;
          if (i + 5 < v32)
          {
            unint64_t v18 = *(void *)(v33 + 8 * v20);
            if (v18)
            {
              int64_t v19 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v19 = v20 + 1;
              if (__OFADD__(v20, 1)) {
                goto LABEL_36;
              }
              if (v19 >= v32) {
                break;
              }
              unint64_t v18 = *(void *)(v33 + 8 * v19);
              ++v20;
              if (v18) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_23792B318();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  uint64_t v34 = (v18 - 1) & v18;
  unint64_t v16 = __clz(__rbit64(v18)) + (v19 << 6);
  for (i = v19; ; unint64_t v16 = __clz(__rbit64(v5)) | (i << 6))
  {
    id v21 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v16);
    uint64_t v23 = *v21;
    uint64_t v22 = v21[1];
    uint64_t v24 = *(void **)(*(void *)(v1 + 56) + 8 * v16);
    sub_237926638(0, v8);
    swift_bridgeObjectRetain();
    id v25 = v24;
    sub_2379265BC((uint64_t *)&unk_2689377F0);
    swift_dynamicCast();
    unint64_t result = sub_23794A8CC(v23, v22);
    unint64_t v26 = result;
    if (v27)
    {
      uint64_t v10 = v1;
      int64_t v11 = i;
      unint64_t v12 = v9;
      uint64_t v13 = v8;
      uint64_t v14 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *uint64_t v14 = v23;
      v14[1] = v22;
      uint64_t v15 = v2[7];
      unint64_t result = swift_unknownObjectRelease();
      *(void *)(v15 + 8 * v26) = v35;
      id v8 = v13;
      unint64_t v9 = v12;
      int64_t i = v11;
      uint64_t v1 = v10;
      unint64_t v5 = v34;
      if (!v34) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v28 = (uint64_t *)(v2[6] + 16 * result);
    *char v28 = v23;
    v28[1] = v22;
    *(void *)(v2[7] + 8 * result) = v35;
    uint64_t v29 = v2[2];
    BOOL v30 = __OFADD__(v29, 1);
    uint64_t v31 = v29 + 1;
    if (v30) {
      goto LABEL_34;
    }
    v2[2] = v31;
    unint64_t v5 = v34;
    if (!v34) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v34 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_237929A20(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_2379265BC(&qword_2689373F0);
    uint64_t v2 = sub_23796ED78();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v29 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v28 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v30 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v10 = v9 | (v30 << 6);
      goto LABEL_28;
    }
    int64_t v11 = v30 + 1;
    if (__OFADD__(v30, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v11 >= v28) {
      goto LABEL_37;
    }
    unint64_t v12 = *(void *)(v29 + 8 * v11);
    int64_t v13 = v30 + 1;
    if (!v12)
    {
      int64_t v13 = v30 + 2;
      if (v30 + 2 >= v28) {
        goto LABEL_37;
      }
      unint64_t v12 = *(void *)(v29 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v30 + 3;
        if (v30 + 3 >= v28) {
          goto LABEL_37;
        }
        unint64_t v12 = *(void *)(v29 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v30 + 4;
          if (v30 + 4 >= v28) {
            goto LABEL_37;
          }
          unint64_t v12 = *(void *)(v29 + 8 * v13);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v30 = v13;
LABEL_28:
    unint64_t v16 = *(void **)(*(void *)(a1 + 56) + 8 * v10);
    *(void *)&v33[0] = *(void *)(*(void *)(a1 + 48) + 8 * v10);
    uint64_t v15 = *(void **)&v33[0];
    *(void *)&v32[0] = v16;
    sub_237926638(0, &qword_2689373F8);
    id v17 = v15;
    id v18 = v16;
    swift_dynamicCast();
    uint64_t v19 = *(void *)&v33[0];
    sub_23792B368((_OWORD *)((char *)v33 + 8), v31);
    sub_23792B368(v31, v33);
    sub_23792B368(v33, v32);
    sub_23796EA98();
    sub_23796EDD8();
    sub_23796EAB8();
    uint64_t v20 = sub_23796EDE8();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v21 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v22 = v20 & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v6 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v8 = __clz(__rbit64((-1 << v22) & ~*(void *)(v6 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_38;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v6 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v8 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v6 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
    *(void *)(*(void *)(v2 + 48) + 8 * v8) = v19;
    uint64_t result = (uint64_t)sub_23792B368(v32, (_OWORD *)(*(void *)(v2 + 56) + 32 * v8));
    ++*(void *)(v2 + 16);
  }
  int64_t v14 = v30 + 5;
  if (v30 + 5 >= v28)
  {
LABEL_37:
    swift_release();
    sub_23792B318();
    return v2;
  }
  unint64_t v12 = *(void *)(v29 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v30 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v28) {
      goto LABEL_37;
    }
    unint64_t v12 = *(void *)(v29 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ConditionRectangularTemplateFormatter()
{
  return self;
}

uint64_t sub_237929DF8()
{
  return sub_23792B320((unint64_t *)&unk_268937350, 255, (void (*)(uint64_t))type metadata accessor for ConditionRectangularTemplateModel);
}

void *sub_237929E44(void **a1)
{
  uint64_t v2 = sub_2379265BC(&qword_268937360);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  *(void *)&long long v152 = (char *)&v138 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  v151 = (uint64_t *)((char *)&v138 - v6);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  unint64_t v9 = (char *)&v138 - v8;
  MEMORY[0x270FA5388](v7);
  int64_t v11 = (char *)&v138 - v10;
  uint64_t v12 = sub_2379265BC(&qword_268937368);
  int64_t v13 = *(void **)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v154 = (char *)&v138 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v155 = (char *)&v138 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v138 - v18;
  uint64_t v20 = (int *)type metadata accessor for ConditionTemplateModel();
  MEMORY[0x270FA5388](v20);
  unint64_t v22 = (char *)&v138 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = *(void *)sub_23796E968();
  uint64_t v150 = type metadata accessor for ConditionRectangularTemplateModel();
  uint64_t v24 = *(int *)(v150 + 20);
  v157 = a1;
  sub_23792B140((uint64_t)a1 + v24, (uint64_t)v22);
  sub_23792B1A4((uint64_t)&v22[v20[8]], (uint64_t)v11);
  unint64_t v25 = (uint64_t (*)(char *, uint64_t, uint64_t))v13[6];
  int v26 = v25(v11, 1, v12);
  v156 = v22;
  if (v26 == 1)
  {
    swift_retain();
LABEL_7:
    sub_23792B20C((uint64_t)v11);
    if (qword_2689370E0 != -1) {
      swift_once();
    }
    id v37 = (id)qword_268937660;
    long long v38 = (void *)sub_23796EA68();
    uint64_t v39 = (void *)sub_23796EA68();
    id v40 = objc_msgSend(v37, sel_localizedStringForKey_value_table_, v38, 0, v39);

    uint64_t v41 = sub_23796EA98();
    uint64_t v43 = v42;

    uint64_t v158 = v41;
    uint64_t v159 = v43;
    sub_237929138();
    sub_23796EC58();
    swift_bridgeObjectRelease();
    id v44 = (id)qword_268937660;
    long long v45 = (void *)sub_23796EA68();
    long long v46 = (void *)sub_23796EA68();
    id v47 = objc_msgSend(v44, sel_localizedStringForKey_value_table_, v45, 0, v46);

    uint64_t v48 = sub_23796EA98();
    uint64_t v50 = v49;

    uint64_t v158 = v48;
    uint64_t v159 = v50;
    sub_23796EC58();
    swift_bridgeObjectRelease();
    v51 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    uint64_t v52 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    id v53 = objc_msgSend(self, sel_textProviderWithText_shortText_, v51, v52);

    v54 = self;
    id v55 = v53;
    id v56 = objc_msgSend(v54, sel_grayColor);
    objc_msgSend(v55, sel_setTintColor_, v56);

    goto LABEL_10;
  }
  uint64_t v153 = v23;
  uint64_t v27 = v11;
  int64_t v28 = (void (*)(char *, char *, uint64_t))v13[4];
  v28(v19, v27, v12);
  sub_23792B1A4((uint64_t)&v22[v20[10]], (uint64_t)v9);
  int v29 = v25(v9, 1, v12);
  int64_t v30 = v22;
  uint64_t v31 = v12;
  if (v29 == 1)
  {
    int64_t v32 = (void (*)(char *, uint64_t))v13[1];
    swift_retain();
    v32(v19, v12);
    int64_t v11 = v9;
    goto LABEL_7;
  }
  v148 = v19;
  v149 = v13;
  uint64_t v33 = v155;
  uint64_t v34 = v30;
  v28(v155, v9, v12);
  uint64_t v35 = (uint64_t)v151;
  sub_23792B1A4((uint64_t)&v34[v20[9]], (uint64_t)v151);
  if (v25((char *)v35, 1, v31) == 1)
  {
    uint64_t v36 = (void (*)(char *, uint64_t))v149[1];
    swift_retain();
    v36(v33, v31);
    v36(v148, v31);
    int64_t v11 = (char *)v35;
    goto LABEL_7;
  }
  v28(v154, (char *)v35, v31);
  v68 = v149;
  v69 = (void (*)(uint64_t, char *, uint64_t))v149[2];
  uint64_t v70 = v152;
  v151 = v149 + 2;
  v146 = v69;
  v69(v152, v148, v31);
  v145 = (void (*)(uint64_t, void, uint64_t, uint64_t))v68[7];
  v144 = v68 + 7;
  v145(v70, 0, 1, v31);
  v71 = *(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)v153 + 152);
  uint64_t v72 = *(void *)v153 + 152;
  swift_retain();
  v143 = v71;
  uint64_t v142 = v72;
  uint64_t v73 = v71(v70, 1, 0);
  uint64_t v75 = v74;
  sub_23792B20C(v70);
  v76 = (char *)v157 + *(int *)(v150 + 28);
  BOOL v77 = v76[*(int *)(sub_23796E8C8() + 28)] == 1;
  uint64_t v147 = v31;
  if (v77)
  {
    if (qword_2689370E0 != -1) {
      swift_once();
    }
    id v78 = (id)qword_268937660;
    v79 = (void *)sub_23796EA68();
    v80 = (void *)sub_23796EA68();
    id v81 = objc_msgSend(v78, sel_localizedStringForKey_value_table_, v79, 0, v80);

    sub_23796EA98();
    sub_2379265BC((uint64_t *)&unk_268937390);
    uint64_t v82 = swift_allocObject();
    *(_OWORD *)(v82 + 16) = xmmword_2379713F0;
    *(void *)(v82 + 56) = MEMORY[0x263F8D310];
    *(void *)(v82 + 64) = sub_23792918C();
    *(void *)(v82 + 32) = v73;
    *(void *)(v82 + 40) = v75;
    swift_bridgeObjectRetain();
    sub_23796EAA8();
    swift_bridgeObjectRelease();
    v83 = (void *)sub_23796EA68();
    id v84 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.376470588, 0.788235294, 0.97254902, 1.0);
    id v85 = (id)NWCGlyphPrefixedTextProvider();
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_2689370E0 != -1) {
      swift_once();
    }
    id v86 = (id)qword_268937660;
    v87 = (void *)sub_23796EA68();
    v88 = (void *)sub_23796EA68();
    id v89 = objc_msgSend(v86, sel_localizedStringForKey_value_table_, v87, 0, v88);

    sub_23796EA98();
    sub_2379265BC((uint64_t *)&unk_268937390);
    uint64_t v90 = swift_allocObject();
    *(_OWORD *)(v90 + 16) = xmmword_2379713F0;
    *(void *)(v90 + 56) = MEMORY[0x263F8D310];
    *(void *)(v90 + 64) = sub_23792918C();
    *(void *)(v90 + 32) = v73;
    *(void *)(v90 + 40) = v75;
    swift_bridgeObjectRetain();
    sub_23796EAA8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    id v84 = (id)sub_23796EA68();
    swift_bridgeObjectRelease();
    id v85 = objc_msgSend(self, sel_textProviderWithText_, v84);
    swift_bridgeObjectRelease();
  }
  id v141 = v85;

  v91 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  objc_msgSend(v85, sel_setAccessibilityLabel_, v91);

  id v140 = self;
  id v92 = objc_msgSend(v140, sel_systemCyanColor);
  objc_msgSend(v85, sel_setTintColor_, v92);

  uint64_t v93 = v152;
  uint64_t v94 = v147;
  v95 = v146;
  v146(v152, v33, v147);
  v96 = v145;
  v145(v93, 0, 1, v94);
  v97 = v143;
  uint64_t v98 = v143(v93, 1, 0);
  uint64_t v150 = v99;
  sub_23792B20C(v93);
  v95(v93, v154, v94);
  v96(v93, 0, 1, v94);
  uint64_t v100 = v97(v93, 1, 0);
  uint64_t v102 = v101;
  sub_23792B20C(v93);
  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v103 = (id)qword_268937660;
  v104 = (void *)sub_23796EA68();
  v105 = (void *)sub_23796EA68();
  id v106 = objc_msgSend(v103, sel_localizedStringForKey_value_table_, v104, 0, v105);

  sub_23796EA98();
  v151 = (void *)sub_2379265BC((uint64_t *)&unk_268937390);
  uint64_t v107 = swift_allocObject();
  long long v152 = xmmword_237971400;
  *(_OWORD *)(v107 + 16) = xmmword_237971400;
  uint64_t v108 = MEMORY[0x263F8D310];
  *(void *)(v107 + 56) = MEMORY[0x263F8D310];
  unint64_t v109 = sub_23792918C();
  uint64_t v139 = v98;
  *(void *)(v107 + 32) = v98;
  uint64_t v110 = v150;
  *(void *)(v107 + 40) = v150;
  *(void *)(v107 + 96) = v108;
  *(void *)(v107 + 104) = v109;
  *(void *)(v107 + 64) = v109;
  *(void *)(v107 + 72) = v100;
  *(void *)(v107 + 80) = v102;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23796EAA8();
  swift_bridgeObjectRelease();
  v111 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v112 = objc_msgSend(self, sel_textProviderWithText_, v111);

  id v113 = v112;
  id v114 = objc_msgSend(v140, sel_whiteColor);
  objc_msgSend(v113, sel_setTintColor_, v114);

  v146 = (void (*)(uint64_t, char *, uint64_t))v100;
  v115 = (void *)qword_268937660;
  id v116 = v113;
  id v117 = v115;
  v118 = (void *)sub_23796EA68();
  v119 = (void *)sub_23796EA68();
  id v120 = objc_msgSend(v117, sel_localizedStringForKey_value_table_, v118, 0, v119);

  sub_23796EA98();
  uint64_t v121 = swift_allocObject();
  *(_OWORD *)(v121 + 16) = v152;
  uint64_t v122 = MEMORY[0x263F8D310];
  *(void *)(v121 + 56) = MEMORY[0x263F8D310];
  *(void *)(v121 + 64) = v109;
  *(void *)(v121 + 32) = v139;
  *(void *)(v121 + 40) = v110;
  *(void *)(v121 + 96) = v122;
  *(void *)(v121 + 104) = v109;
  *(void *)(v121 + 72) = v146;
  *(void *)(v121 + 80) = v102;
  sub_23796EAA8();
  swift_bridgeObjectRelease();
  v123 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  objc_msgSend(v116, sel_setAccessibilityLabel_, v123);

  uint64_t v124 = sub_237926638(0, (unint64_t *)&qword_2689373A0);
  id v125 = (id)qword_268937660;
  v126 = (void *)sub_23796EA68();
  v127 = (void *)sub_23796EA68();
  id v128 = objc_msgSend(v125, sel_localizedStringForKey_value_table_, v126, 0, v127);

  uint64_t v150 = sub_23796EA98();
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = v152;
  *(void *)(inited + 56) = sub_237926638(0, (unint64_t *)&unk_268937810);
  *(void *)(inited + 64) = sub_23792B2C8((unint64_t *)&unk_2689373B0, (unint64_t *)&unk_268937810);
  v130 = v141;
  *(void *)(inited + 32) = v141;
  *(void *)(inited + 96) = v124;
  *(void *)(inited + 104) = sub_23792B2C8((unint64_t *)&unk_268937820, (unint64_t *)&qword_2689373A0);
  *(void *)(inited + 72) = v116;
  id v131 = v116;
  id v132 = v130;
  uint64_t v133 = sub_23796EDF8();
  swift_setDeallocating();
  sub_2379265BC(&qword_2689373C0);
  swift_arrayDestroy();
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v135 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v55 = objc_msgSend(ObjCClassFromMetadata, sel_textProviderWithFormat_arguments_, v135, v133);

  v136 = (void (*)(char *, uint64_t))v149[1];
  uint64_t v137 = v147;
  v136(v154, v147);
  v136(v155, v137);
  v136(v148, v137);
LABEL_10:
  sub_237926638(0, &qword_268937378);
  uint64_t v57 = swift_getObjCClassFromMetadata();
  id v58 = objc_msgSend(self, sel_fullColorImageProviderWithImageViewClass_, v57);
  v59 = *v157;
  sub_2379265BC((uint64_t *)&unk_268937380);
  uint64_t v60 = swift_initStackObject();
  *(_OWORD *)(v60 + 16) = xmmword_2379713F0;
  *(void *)(v60 + 32) = sub_23796EA98();
  *(void *)(v60 + 40) = v61;
  *(void *)(v60 + 48) = v59;
  id v62 = v59;
  unint64_t v63 = sub_2379294C4(v60);
  sub_2379296EC(v63);
  swift_bridgeObjectRelease();
  sub_2379265BC((uint64_t *)&unk_2689377F0);
  v64 = (void *)sub_23796EA08();
  swift_bridgeObjectRelease();
  objc_msgSend(v58, sel_setMetadata_, v64);

  id v65 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD0E0]), sel_initWithTextProvider_imageProvider_, v55, v58);
  v66 = sub_23794B3A8();

  swift_release();
  sub_23792B26C((uint64_t)v156);
  return v66;
}

uint64_t sub_23792B140(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ConditionTemplateModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23792B1A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2379265BC(&qword_268937360);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23792B20C(uint64_t a1)
{
  uint64_t v2 = sub_2379265BC(&qword_268937360);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23792B26C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ConditionTemplateModel();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23792B2C8(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_237926638(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23792B318()
{
  return swift_release();
}

uint64_t sub_23792B320(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

_OWORD *sub_23792B368(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_23792B378()
{
  uint64_t v1 = (void *)(v0
                + OBJC_IVAR____TtC20WeatherComplications20ChanceRainDataSource____lazy_storage___rectangularFormatter);
  if (*(void *)(v0
                 + OBJC_IVAR____TtC20WeatherComplications20ChanceRainDataSource____lazy_storage___rectangularFormatter))
  {
    uint64_t v2 = *(void *)(v0
                   + OBJC_IVAR____TtC20WeatherComplications20ChanceRainDataSource____lazy_storage___rectangularFormatter);
  }
  else
  {
    if (qword_2689370F0 != -1) {
      swift_once();
    }
    uint64_t v2 = qword_268939460;
    uint64_t v3 = *(void *)algn_268939468;
    void *v1 = qword_268939460;
    v1[1] = v3;
    swift_unknownObjectRetain_n();
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRetain();
  return v2;
}

uint64_t sub_23792B428()
{
  uint64_t v1 = (void *)(v0 + OBJC_IVAR____TtC20WeatherComplications20ChanceRainDataSource____lazy_storage___nhpFormatter);
  if (*(void *)(v0 + OBJC_IVAR____TtC20WeatherComplications20ChanceRainDataSource____lazy_storage___nhpFormatter))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC20WeatherComplications20ChanceRainDataSource____lazy_storage___nhpFormatter);
  }
  else
  {
    if (qword_268937118 != -1) {
      swift_once();
    }
    uint64_t v2 = qword_2689394A0;
    uint64_t v3 = *(void *)algn_2689394A8;
    void *v1 = qword_2689394A0;
    v1[1] = v3;
    swift_unknownObjectRetain_n();
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRetain();
  return v2;
}

unint64_t sub_23792B4D8()
{
  return 0xD000000000000026;
}

char *sub_23792B534(void *a1, uint64_t a2, void *a3)
{
  uint64_t v7 = &v3[OBJC_IVAR____TtC20WeatherComplications20ChanceRainDataSource____lazy_storage___rectangularFormatter];
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  uint64_t v8 = &v3[OBJC_IVAR____TtC20WeatherComplications20ChanceRainDataSource____lazy_storage___nhpFormatter];
  *(void *)uint64_t v8 = 0;
  *((void *)v8 + 1) = 0;
  uint64_t v9 = OBJC_IVAR____TtC20WeatherComplications20ChanceRainDataSource_nhpLocationCache;
  uint64_t v10 = qword_2689370C0;
  int64_t v11 = v3;
  if (v10 != -1) {
    swift_once();
  }
  *(void *)&v3[v9] = qword_268937410;
  swift_retain();
  sub_23796E9D8();
  sub_23796E9D8();
  *(void *)&v11[OBJC_IVAR____TtC20WeatherComplications20ChanceRainDataSource_nhpFamilies] = &unk_26EA95CD0;

  v16.receiver = v11;
  v16.super_class = (Class)type metadata accessor for ChanceRainDataSource(0);
  id v12 = objc_msgSendSuper2(&v16, sel_initWithComplication_family_forDevice_, a1, a2, a3);
  uint64_t v13 = qword_268937108;
  uint64_t v14 = (char *)v12;
  if (v13 != -1) {
    swift_once();
  }
  *(_OWORD *)&v14[OBJC_IVAR____TtC20WeatherComplications14BaseDataSource_templateFormatter] = xmmword_268939490;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
  return v14;
}

uint64_t sub_23792B77C()
{
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_237971400;
  sub_23796E6A8();
  sub_23796E688();
  sub_23792CF90();
  sub_2379265BC(&qword_268937490);
  sub_23792CFE8();
  return sub_23796EC88();
}

uint64_t sub_23792B894@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_23796E2A8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (uint64_t)objc_msgSend(v1, sel_family);
  sub_23796E298();
  LOBYTE(v7) = sub_23792BFB8(v7);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v8 = sub_23796E9E8();
  uint64_t v9 = &OBJC_IVAR____TtC20WeatherComplications20ChanceRainDataSource_nhpLogger;
  if ((v7 & 1) == 0) {
    uint64_t v9 = &OBJC_IVAR____TtC20WeatherComplications20ChanceRainDataSource_logger;
  }
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, &v1[*v9], v8);
}

uint64_t sub_23792B9D8()
{
  if (sub_23792BFB8((uint64_t)objc_msgSend(v0, sel_family))) {
    return sub_23792B428();
  }
  if (objc_msgSend(v0, sel_family) == (id)11) {
    return sub_23792B378();
  }
  return swift_unknownObjectRetain();
}

uint64_t sub_23792BB3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v43 = a4;
  uint64_t v44 = a6;
  uint64_t v41 = a3;
  uint64_t v42 = a5;
  uint64_t v8 = sub_23796E6D8();
  uint64_t v40 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2379265BC(&qword_268937478);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_2379265BC(&qword_268937470);
  MEMORY[0x270FA5388](v14 - 8);
  objc_super v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_23796E2A8();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_23792BFB8(a1))
  {
    uint64_t v36 = v10;
    id v37 = v20;
    uint64_t v21 = v40;
    long long v38 = v16;
    uint64_t v39 = v18;
    uint64_t v41 = a2;
    sub_2379266D8(v43, (uint64_t)v13, &qword_268937478);
    uint64_t v22 = sub_23796E508();
    uint64_t v23 = *(void *)(v22 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v13, 1, v22) == 1)
    {
      sub_23792673C((uint64_t)v13, &qword_268937478);
      unint64_t v25 = v38;
      uint64_t v24 = v39;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v39 + 56))(v38, 1, 1, v17);
      int v26 = v37;
    }
    else
    {
      sub_2379265BC(&qword_268937480);
      uint64_t v32 = v21;
      uint64_t v33 = swift_allocObject();
      *(_OWORD *)(v33 + 16) = xmmword_237971400;
      sub_23796E6A8();
      sub_23796E688();
      uint64_t v45 = v33;
      sub_23792CF90();
      sub_2379265BC(&qword_268937490);
      sub_23792CFE8();
      uint64_t v34 = (uint64_t)v36;
      sub_23796EC88();
      unint64_t v25 = v38;
      sub_237967AA8(v34, v38);
      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v34, v8);
      (*(void (**)(char *, uint64_t))(v23 + 8))(v13, v22);
      uint64_t v24 = v39;
      (*(void (**)(char *, void, uint64_t, uint64_t))(v39 + 56))(v25, 0, 1, v17);
      int v35 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48))(v25, 1, v17);
      int v26 = v37;
      if (v35 != 1)
      {
        (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v37, v25, v17);
        goto LABEL_10;
      }
    }
    sub_23796E298();
    sub_23792673C((uint64_t)v25, &qword_268937470);
LABEL_10:
    sub_23796E268();
    return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v26, v17);
  }
  uint64_t v27 = v41;
  uint64_t v28 = v42;
  uint64_t v29 = v43;
  uint64_t v30 = v44;

  return sub_23794EBAC(a2, v27, v29, v28, v30);
}

uint64_t sub_23792BFB8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_23796E598();
  uint64_t v52 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2379265BC(&qword_2689374A0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2379265BC(&qword_268937478);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_2379265BC(&qword_268937470);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  objc_super v16 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v48 - v18;
  uint64_t result = MEMORY[0x270FA5388](v17);
  uint64_t v22 = (char *)&v48 - v21;
  uint64_t v23 = *(void **)(v2 + OBJC_IVAR____TtC20WeatherComplications20ChanceRainDataSource_nhpFamilies);
  uint64_t v24 = v23[2];
  if (!v24) {
    return 0;
  }
  if (v23[4] == a1) {
    goto LABEL_5;
  }
  if (v24 == 1) {
    return 0;
  }
  if (v23[5] == a1)
  {
LABEL_5:
    sub_2379266D8(v2 + OBJC_IVAR____TtC20WeatherComplications14BaseDataSource_forecast, (uint64_t)v12, &qword_268937478);
    uint64_t v25 = sub_23796E508();
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 48))(v12, 1, v25))
    {
      sub_23796E4E8();
      uint64_t v26 = sub_2379265BC(&qword_2689374A8);
      if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v26 - 8) + 48))(v9, 1, v26))
      {
        uint64_t v27 = v2;
        sub_23796E868();
        sub_23796E588();
        (*(void (**)(char *, uint64_t))(v52 + 8))(v6, v4);
        sub_23792673C((uint64_t)v9, &qword_2689374A0);
        sub_23792673C((uint64_t)v12, &qword_268937478);
        uint64_t v45 = sub_23796E2A8();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v22, 0, 1, v45);
        goto LABEL_9;
      }
      sub_23792673C((uint64_t)v9, &qword_2689374A0);
    }
    uint64_t v27 = v2;
    sub_23792673C((uint64_t)v12, &qword_268937478);
    uint64_t v28 = sub_23796E2A8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v22, 1, 1, v28);
LABEL_9:
    uint64_t v29 = OBJC_IVAR____TtC20WeatherComplications14BaseDataSource_location;
    uint64_t v30 = (double *)(v27 + *(int *)(sub_23796E8C8() + 32) + v29);
    double v31 = *v30;
    double v32 = v30[1];
    uint64_t v54 = 0;
    unint64_t v55 = 0xE000000000000000;
    sub_23796EB78();
    sub_23796EAD8();
    sub_23796EB78();
    uint64_t v34 = v54;
    unint64_t v33 = v55;
    sub_2379266D8((uint64_t)v22, (uint64_t)v19, &qword_268937470);
    swift_bridgeObjectRetain();
    int v35 = sub_23796E9C8();
    int v36 = sub_23796EBD8();
    if (os_log_type_enabled(v35, (os_log_type_t)v36))
    {
      int v50 = v36;
      uint64_t v51 = v34;
      uint64_t v52 = v27;
      uint64_t v37 = swift_slowAlloc();
      uint64_t v49 = swift_slowAlloc();
      uint64_t v54 = v49;
      *(_DWORD *)uint64_t v37 = 136315395;
      sub_2379266D8((uint64_t)v19, (uint64_t)v16, &qword_268937470);
      uint64_t v38 = sub_23796E2A8();
      uint64_t v39 = *(void *)(v38 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48))(v16, 1, v38) == 1)
      {
        sub_23792673C((uint64_t)v16, &qword_268937470);
        unint64_t v40 = 0xE300000000000000;
        uint64_t v41 = 7104878;
      }
      else
      {
        uint64_t v41 = sub_23796E1D8();
        unint64_t v40 = v42;
        (*(void (**)(char *, uint64_t))(v39 + 8))(v16, v38);
      }
      uint64_t v53 = sub_23794E554(v41, v40, &v54);
      sub_23796EC38();
      swift_bridgeObjectRelease();
      sub_23792673C((uint64_t)v19, &qword_268937470);
      *(_WORD *)(v37 + 12) = 2081;
      swift_bridgeObjectRetain();
      uint64_t v53 = sub_23794E554(v51, v33, &v54);
      sub_23796EC38();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_237922000, v35, (os_log_type_t)v50, "nhpDate: %s, coordinate: %{private}s", (uint8_t *)v37, 0x16u);
      uint64_t v43 = v49;
      swift_arrayDestroy();
      MEMORY[0x237E264A0](v43, -1, -1);
      MEMORY[0x237E264A0](v37, -1, -1);
    }
    else
    {

      sub_23792673C((uint64_t)v19, &qword_268937470);
      swift_bridgeObjectRelease_n();
    }
    BOOL v44 = sub_23792CAC8((uint64_t)v22, v31, v32);
    sub_23792673C((uint64_t)v22, &qword_268937470);
    return v44;
  }
  if (v24 == 2) {
    return 0;
  }
  for (uint64_t i = 6; ; ++i)
  {
    uint64_t v47 = i - 3;
    if (__OFADD__(i - 4, 1)) {
      break;
    }
    if (v23[i] == a1) {
      goto LABEL_5;
    }
    BOOL v44 = 0;
    if (v47 == v24) {
      return v44;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_23792C798()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC20WeatherComplications20ChanceRainDataSource_nhpLogger;
  uint64_t v2 = sub_23796E9E8();
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC20WeatherComplications20ChanceRainDataSource_logger, v2);

  return swift_bridgeObjectRelease();
}

id sub_23792C874()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ChanceRainDataSource(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23792C98C()
{
  return type metadata accessor for ChanceRainDataSource(0);
}

uint64_t type metadata accessor for ChanceRainDataSource(uint64_t a1)
{
  return sub_23792CEBC(a1, (uint64_t *)&unk_268937448);
}

uint64_t sub_23792C9B4()
{
  uint64_t result = sub_23796E9E8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_23792CA70()
{
  type metadata accessor for NHPLocationCache(0);
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = 0;
  *(void *)(v0 + 24) = 0;
  *(unsigned char *)(v0 + 32) = 1;
  uint64_t result = sub_23796E1E8();
  qword_268937410 = v0;
  return result;
}

BOOL sub_23792CAC8(uint64_t a1, double a2, double a3)
{
  uint64_t v7 = sub_2379265BC(&qword_268937470);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_23796E2A8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v28 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v28 - v18;
  if ((*(unsigned char *)(v3 + 32) & 1) != 0
    || (*(double *)(v3 + 16) == a2 ? (BOOL v20 = *(double *)(v3 + 24) == a3) : (BOOL v20 = 0), !v20))
  {
    *(double *)(v3 + 16) = a2;
    *(double *)(v3 + 24) = a3;
    *(unsigned char *)(v3 + 32) = 0;
    sub_23796E1E8();
    uint64_t v21 = v3 + OBJC_IVAR____TtC20WeatherComplicationsP33_C744A1176000CEBEC10BC3DB63BD29F816NHPLocationCache_lastNHPDate;
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 40))(v21, v19, v10);
    swift_endAccess();
  }
  sub_2379266D8(a1, (uint64_t)v9, &qword_268937470);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_23792673C((uint64_t)v9, &qword_268937470);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v17, v9, v10);
    uint64_t v22 = v3 + OBJC_IVAR____TtC20WeatherComplicationsP33_C744A1176000CEBEC10BC3DB63BD29F816NHPLocationCache_lastNHPDate;
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 24))(v22, v17, v10);
    swift_endAccess();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v17, v10);
  }
  sub_23796E298();
  uint64_t v23 = v3 + OBJC_IVAR____TtC20WeatherComplicationsP33_C744A1176000CEBEC10BC3DB63BD29F816NHPLocationCache_lastNHPDate;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v23, v10);
  sub_23796E208();
  double v25 = v24;
  uint64_t v26 = *(void (**)(char *, uint64_t))(v11 + 8);
  v26(v14, v10);
  v26(v19, v10);
  return v25 < 86400.0;
}

uint64_t sub_23792CDF4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20WeatherComplicationsP33_C744A1176000CEBEC10BC3DB63BD29F816NHPLocationCache_lastNHPDate;
  uint64_t v2 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_23792CE94()
{
  return type metadata accessor for NHPLocationCache(0);
}

uint64_t type metadata accessor for NHPLocationCache(uint64_t a1)
{
  return sub_23792CEBC(a1, (uint64_t *)&unk_268937460);
}

uint64_t sub_23792CEBC(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_23792CEF4()
{
  uint64_t result = sub_23796E2A8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unint64_t sub_23792CF90()
{
  unint64_t result = qword_268937488;
  if (!qword_268937488)
  {
    sub_23796E6D8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268937488);
  }
  return result;
}

unint64_t sub_23792CFE8()
{
  unint64_t result = qword_268937498;
  if (!qword_268937498)
  {
    sub_23792D044(&qword_268937490);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268937498);
  }
  return result;
}

uint64_t sub_23792D044(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_23792D08C(char *a1, uint64_t a2)
{
  uint64_t v4 = sub_23796E2A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_23796E9E8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (uint64_t)objc_msgSend(a1, sel_family);
  sub_23796E298();
  LOBYTE(v12) = sub_23792BFB8(v12);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v13 = &OBJC_IVAR____TtC20WeatherComplications20ChanceRainDataSource_nhpLogger;
  if ((v12 & 1) == 0) {
    uint64_t v13 = &OBJC_IVAR____TtC20WeatherComplications20ChanceRainDataSource_logger;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v11, &a1[*v13], v8);
  uint64_t v14 = sub_23796E9C8();
  os_log_type_t v15 = sub_23796EBE8();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_237922000, v14, v15, "Migrating to widget.", v16, 2u);
    MEMORY[0x237E264A0](v16, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  id v17 = objc_allocWithZone(MEMORY[0x263EFD238]);
  uint64_t v18 = (void *)sub_23796EA68();
  uint64_t v19 = (void *)sub_23796EA68();
  BOOL v20 = (void *)sub_23796EA68();
  id v21 = objc_msgSend(v17, sel_initWithExtensionBundleIdentifier_containerBundleIdentifier_kind_intent_, v18, v19, v20, 0);

  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v21);
}

uint64_t sub_23792D384@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_23796E2A8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2379265BC(&qword_268937470);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = objc_msgSend(self, sel_complicationDate);
  if (v9)
  {
    uint64_t v10 = v9;
    sub_23796E288();

    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
    v11(v8, v5, v2);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v8, 0, 1, v2);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) != 1) {
      return ((uint64_t (*)(uint64_t, char *, uint64_t))v11)(a1, v8, v2);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v8, 1, 1, v2);
  }
  sub_23796E298();
  return sub_23792673C((uint64_t)v8, &qword_268937470);
}

unint64_t sub_23792D570()
{
  uint64_t v1 = type metadata accessor for UVTemplateModel();
  uint64_t v2 = MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(int *)(v2 + 40);
  unint64_t v6 = *(void *)(v0 + v5);
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_23796ED48();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  sub_23792E610(v0, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for UVTemplateModel);
  if (v7 < 2)
  {
    sub_237929244((uint64_t)v4);
  }
  else
  {
    char v8 = v4[*(int *)(v1 + 20) + 8];
    unint64_t result = sub_237929244((uint64_t)v4);
    if ((v8 & 1) == 0)
    {
      unint64_t v10 = *(void *)(v0 + v5);
      if (v10 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v11 = sub_23796ED48();
        unint64_t result = swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      uint64_t v12 = v0 + *(int *)(v1 + 20);
      double v13 = 0.0;
      if ((*(unsigned char *)(v12 + 8) & 1) == 0)
      {
        float v14 = (float)*(uint64_t *)v12 / (float)*(uint64_t *)(v0 + *(int *)(v1 + 36));
        if (v14 > 0.0) {
          double v13 = fminf(v14, 1.0);
        }
      }
      double v15 = v13 * (double)v11;
      if ((~*(void *)&v15 & 0x7FF0000000000000) != 0)
      {
        if (v15 > -9.22337204e18)
        {
          if (v15 < 9.22337204e18)
          {
            if (v10 >> 62)
            {
              swift_bridgeObjectRetain();
              uint64_t v16 = sub_23796ED48();
              unint64_t result = swift_bridgeObjectRelease();
            }
            else
            {
              uint64_t v16 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
            }
            if (!__OFSUB__(v16, 1))
            {
              if (v16 - 1 >= ((uint64_t)v15 & ~((uint64_t)v15 >> 63))) {
                unint64_t result = (uint64_t)v15 & ~((uint64_t)v15 >> 63);
              }
              else {
                unint64_t result = v16 - 1;
              }
              if ((v10 & 0xC000000000000001) == 0)
              {
                if ((result & 0x8000000000000000) != 0)
                {
                  __break(1u);
                }
                else if (result < *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
                {
                  uint64_t v18 = *(void **)(v10 + 8 * result + 32);
                  return (unint64_t)v18;
                }
                __break(1u);
                return result;
              }
              return MEMORY[0x237E25DC0](result, v10);
            }
LABEL_35:
            __break(1u);
            return MEMORY[0x237E25DC0](result, v10);
          }
LABEL_34:
          __break(1u);
          goto LABEL_35;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      goto LABEL_34;
    }
  }
  id v17 = objc_msgSend(self, sel_whiteColor);

  return (unint64_t)v17;
}

uint64_t sub_23792D83C()
{
  if ((*(unsigned char *)(v0 + *(int *)(type metadata accessor for UVTemplateModel() + 20) + 8) & 1) == 0)
  {
    sub_23792E5BC();
    sub_23796EC68();
  }
  sub_23796EAD8();
  swift_bridgeObjectRelease();
  sub_23796EAD8();
  return 0x3A7865646E497675;
}

uint64_t sub_23792D8EC()
{
  uint64_t v0 = sub_23796E808();
  uint64_t v1 = *(void *)v0;
  uint64_t v2 = *(void *)(*(void *)v0 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v7 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_23796ED08();
    uint64_t v4 = 40;
    do
    {
      id v5 = *(id *)(v1 + v4);
      sub_23796ECE8();
      sub_23796ED18();
      sub_23796ED28();
      sub_23796ECF8();
      v4 += 16;
      --v2;
    }
    while (v2);
    uint64_t v3 = v7;
    swift_bridgeObjectRelease();
  }
  return v3;
}

uint64_t sub_23792D9B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v55 = a2;
  uint64_t v3 = sub_2379265BC(&qword_2689374B8);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v54 = (uint64_t)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v53 = (char *)&v51 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v51 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v51 - v11;
  uint64_t v13 = sub_23796E2A8();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v59 = (char *)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v51 - v17;
  uint64_t v19 = sub_2379265BC(&qword_268937478);
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  uint64_t v22 = (char *)&v51 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  double v24 = (char *)&v51 - v23;
  uint64_t v52 = type metadata accessor for TemplateData();
  sub_2379266D8(a1 + *(int *)(v52 + 20), (uint64_t)v24, &qword_268937478);
  double v25 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  uint64_t v60 = a1;
  uint64_t v61 = v13;
  uint64_t v51 = v25;
  v25(v18, a1, v13);
  uint64_t v57 = v24;
  sub_2379266D8((uint64_t)v24, (uint64_t)v22, &qword_268937478);
  uint64_t v26 = sub_23796E508();
  uint64_t v27 = *(void *)(v26 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v22, 1, v26) == 1)
  {
    sub_23792673C((uint64_t)v22, &qword_268937478);
    memset(v65, 0, sizeof(v65));
    uint64_t v66 = 0;
  }
  else
  {
    sub_23796E498();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v22, v26);
  }
  uint64_t v28 = v55;
  sub_2379266D8((uint64_t)v65, (uint64_t)v62, &qword_2689374C0);
  uint64_t v29 = v63;
  uint64_t v56 = v14;
  id v58 = v18;
  if (v63)
  {
    uint64_t v30 = v64;
    sub_23792E528(v62, v63);
    (*(void (**)(uint64_t, uint64_t))(v30 + 96))(v29, v30);
    uint64_t v31 = sub_23796E858();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v12, 0, 1, v31);
    sub_23792E56C((uint64_t)v62);
  }
  else
  {
    sub_23792673C((uint64_t)v62, &qword_2689374C0);
    uint64_t v31 = sub_23796E858();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v12, 1, 1, v31);
  }
  sub_2379266D8((uint64_t)v12, (uint64_t)v10, &qword_2689374B8);
  sub_23796E858();
  uint64_t v32 = *(void *)(v31 - 8);
  unint64_t v33 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48);
  if (v33(v10, 1, v31) == 1)
  {
    sub_23792673C((uint64_t)v10, &qword_2689374B8);
    uint64_t v34 = 0;
  }
  else
  {
    sub_23796E848();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v10, v31);
    sub_23796E818();
    sub_2379290F8();
    uint64_t v34 = sub_23796EC18();
  }
  uint64_t v35 = (uint64_t)v53;
  v51(v59, v60, v61);
  sub_2379266D8((uint64_t)v12, v35, &qword_2689374B8);
  unsigned int v36 = v33((char *)v35, 1, v31);
  if (v36 == 1)
  {
    sub_23792673C(v35, &qword_2689374B8);
    uint64_t v37 = 0;
  }
  else
  {
    uint64_t v37 = sub_23796E838();
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v35, v31);
  }
  uint64_t v38 = v54;
  sub_2379266D8((uint64_t)v12, v54, &qword_2689374B8);
  if (v33((char *)v38, 1, v31) == 1)
  {
    sub_23792673C(v38, &qword_2689374B8);
    uint64_t v39 = 0;
    unint64_t v40 = 0xE000000000000000;
  }
  else
  {
    sub_23796E848();
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v38, v31);
    uint64_t v39 = sub_23796E828();
    unint64_t v40 = v41;
  }
  uint64_t v42 = v56;
  BOOL v43 = v36 == 1;
  uint64_t v44 = v60 + *(int *)(v52 + 24);
  uint64_t v45 = (int *)type metadata accessor for UVTemplateModel();
  sub_23792E610(v44, v28 + v45[7], MEMORY[0x263F580A0]);
  uint64_t v46 = v61;
  (*(void (**)(uint64_t, char *, uint64_t))(v42 + 32))(v28, v59, v61);
  uint64_t v47 = v28 + v45[5];
  *(void *)uint64_t v47 = v37;
  *(unsigned char *)(v47 + 8) = v43;
  uint64_t v48 = (uint64_t *)(v28 + v45[6]);
  *uint64_t v48 = v39;
  v48[1] = v40;
  *(void *)(v28 + v45[8]) = v34;
  *(void *)(v28 + v45[9]) = 11;
  uint64_t v49 = v45[10];
  *(void *)(v28 + v49) = sub_23792D8EC();
  sub_23792673C((uint64_t)v12, &qword_2689374B8);
  sub_23792673C((uint64_t)v65, &qword_2689374C0);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v58, v46);
  return sub_23792673C((uint64_t)v57, &qword_268937478);
}

uint64_t sub_23792E094@<X0>(uint64_t a1@<X8>)
{
  uint64_t v24 = sub_23796E2D8();
  uint64_t v2 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_23796E358();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v25 = sub_23796E2A8();
  uint64_t v6 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23792D384((uint64_t)v8);
  uint64_t v9 = sub_23796E828();
  uint64_t v22 = v10;
  uint64_t v23 = v9;
  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v11 = (id)qword_268937660;
  uint64_t v12 = (void *)sub_23796EA68();
  uint64_t v13 = (void *)sub_23796EA68();
  id v14 = objc_msgSend(v11, sel_localizedStringForKey_value_table_, v12, 0, v13);

  sub_23796EA98();
  sub_23796E348();
  sub_23796E2C8();
  sub_23796E2B8();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v24);
  uint64_t v15 = (int *)type metadata accessor for UVTemplateModel();
  sub_23796E8A8();
  id v16 = objc_msgSend(self, sel_orangeColor);
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(a1, v8, v25);
  uint64_t v17 = a1 + v15[5];
  *(void *)uint64_t v17 = 6;
  *(unsigned char *)(v17 + 8) = 0;
  uint64_t v18 = (uint64_t *)(a1 + v15[6]);
  uint64_t v19 = v22;
  *uint64_t v18 = v23;
  v18[1] = v19;
  *(void *)(a1 + v15[8]) = v16;
  *(void *)(a1 + v15[9]) = 11;
  uint64_t v20 = v15[10];
  uint64_t result = sub_23792D8EC();
  *(void *)(a1 + v20) = result;
  return result;
}

unint64_t sub_23792E3F4(uint64_t a1)
{
  unint64_t result = sub_23792E41C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23792E41C()
{
  unint64_t result = qword_2689374B0;
  if (!qword_2689374B0)
  {
    type metadata accessor for UVTemplateModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689374B0);
  }
  return result;
}

uint64_t type metadata accessor for UVTemplateModel()
{
  uint64_t result = qword_2689374C8;
  if (!qword_2689374C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_23792E4C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_23796E2A8();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

void *sub_23792E528(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_23792E56C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_23792E5BC()
{
  unint64_t result = qword_268937800;
  if (!qword_268937800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268937800);
  }
  return result;
}

uint64_t sub_23792E610(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t *sub_23792E678(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v27 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v27 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_23796E2A8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (char *)a1 + v8;
    id v11 = (char *)a2 + v8;
    *(void *)uint64_t v10 = *(void *)v11;
    v10[8] = v11[8];
    uint64_t v12 = (uint64_t *)((char *)a1 + v9);
    uint64_t v13 = (uint64_t *)((char *)a2 + v9);
    uint64_t v14 = v13[1];
    *uint64_t v12 = *v13;
    v12[1] = v14;
    uint64_t v15 = a3[7];
    id v16 = (uint64_t *)((char *)a1 + v15);
    uint64_t v17 = (char *)a2 + v15;
    uint64_t v18 = *(uint64_t *)((char *)a2 + v15 + 8);
    void *v16 = *(uint64_t *)((char *)a2 + v15);
    v16[1] = v18;
    uint64_t v19 = *(uint64_t *)((char *)a2 + v15 + 24);
    v16[2] = *(uint64_t *)((char *)a2 + v15 + 16);
    v16[3] = v19;
    uint64_t v20 = (int *)sub_23796E8C8();
    uint64_t v21 = v20[6];
    uint64_t v30 = &v17[v21];
    uint64_t v31 = (char *)v16 + v21;
    uint64_t v22 = sub_23796E358();
    uint64_t v29 = *(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v29(v31, v30, v22);
    *((unsigned char *)v16 + v20[7]) = v17[v20[7]];
    *(_OWORD *)((char *)v16 + v20[8]) = *(_OWORD *)&v17[v20[8]];
    uint64_t v23 = a3[8];
    uint64_t v24 = a3[9];
    uint64_t v25 = *(void **)((char *)a2 + v23);
    *(uint64_t *)((char *)a1 + v23) = (uint64_t)v25;
    *(uint64_t *)((char *)a1 + v24) = *(uint64_t *)((char *)a2 + v24);
    *(uint64_t *)((char *)a1 + a3[10]) = *(uint64_t *)((char *)a2 + a3[10]);
    id v26 = v25;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_23792E858(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + *(int *)(a2 + 28);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = v5 + *(int *)(sub_23796E8C8() + 24);
  uint64_t v7 = sub_23796E358();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  return swift_bridgeObjectRelease();
}

uint64_t sub_23792E950(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(void *)uint64_t v9 = *(void *)v10;
  *(unsigned char *)(v9 + 8) = *(unsigned char *)(v10 + 8);
  id v11 = (void *)(a1 + v8);
  uint64_t v12 = (void *)(a2 + v8);
  uint64_t v13 = v12[1];
  *id v11 = *v12;
  v11[1] = v13;
  uint64_t v14 = a3[7];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = a2 + v14;
  uint64_t v17 = *(void *)(a2 + v14 + 8);
  *uint64_t v15 = *(void *)(a2 + v14);
  v15[1] = v17;
  uint64_t v18 = *(void *)(a2 + v14 + 24);
  v15[2] = *(void *)(a2 + v14 + 16);
  v15[3] = v18;
  uint64_t v19 = (int *)sub_23796E8C8();
  uint64_t v20 = v19[6];
  uint64_t v28 = v16 + v20;
  uint64_t v29 = (char *)v15 + v20;
  uint64_t v21 = sub_23796E358();
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v27(v29, v28, v21);
  *((unsigned char *)v15 + v19[7]) = *(unsigned char *)(v16 + v19[7]);
  *(_OWORD *)((char *)v15 + v19[8]) = *(_OWORD *)(v16 + v19[8]);
  uint64_t v22 = a3[8];
  uint64_t v23 = a3[9];
  uint64_t v24 = *(void **)(a2 + v22);
  *(void *)(a1 + v22) = v24;
  *(void *)(a1 + v23) = *(void *)(a2 + v23);
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  id v25 = v24;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23792EAE0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = *v9;
  *(unsigned char *)(v8 + 8) = *((unsigned char *)v9 + 8);
  *(void *)uint64_t v8 = v10;
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  *uint64_t v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = a3[7];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = a2 + v14;
  *uint64_t v15 = *(void *)(a2 + v14);
  v15[1] = *(void *)(a2 + v14 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v15[2] = *(void *)(v16 + 16);
  v15[3] = *(void *)(v16 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = (int *)sub_23796E8C8();
  uint64_t v18 = v17[6];
  uint64_t v19 = (char *)v15 + v18;
  uint64_t v20 = v16 + v18;
  uint64_t v21 = sub_23796E358();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 24))(v19, v20, v21);
  *((unsigned char *)v15 + v17[7]) = *(unsigned char *)(v16 + v17[7]);
  uint64_t v22 = v17[8];
  uint64_t v23 = (void *)((char *)v15 + v22);
  uint64_t v24 = (void *)(v16 + v22);
  *uint64_t v23 = *v24;
  v23[1] = v24[1];
  uint64_t v25 = a3[8];
  id v26 = *(void **)(a1 + v25);
  uint64_t v27 = *(void **)(a2 + v25);
  *(void *)(a1 + v25) = v27;
  id v28 = v27;

  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23792ECB0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(void *)uint64_t v9 = *(void *)v10;
  *(unsigned char *)(v9 + 8) = *(unsigned char *)(v10 + 8);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  uint64_t v11 = a3[7];
  uint64_t v12 = (_OWORD *)(a1 + v11);
  uint64_t v13 = a2 + v11;
  long long v14 = *(_OWORD *)(a2 + v11 + 16);
  *uint64_t v12 = *(_OWORD *)(a2 + v11);
  v12[1] = v14;
  uint64_t v15 = (int *)sub_23796E8C8();
  uint64_t v16 = v15[6];
  uint64_t v17 = (char *)v12 + v16;
  uint64_t v18 = v13 + v16;
  uint64_t v19 = sub_23796E358();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
  *((unsigned char *)v12 + v15[7]) = *(unsigned char *)(v13 + v15[7]);
  *(_OWORD *)((char *)v12 + v15[8]) = *(_OWORD *)(v13 + v15[8]);
  uint64_t v20 = a3[9];
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(void *)(a1 + v20) = *(void *)(a2 + v20);
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  return a1;
}

uint64_t sub_23792EDF4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(void *)uint64_t v9 = *(void *)v10;
  *(unsigned char *)(v9 + 8) = *(unsigned char *)(v10 + 8);
  uint64_t v11 = (void *)(a1 + v8);
  uint64_t v12 = (uint64_t *)(a2 + v8);
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  *uint64_t v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = a2 + v15;
  uint64_t v18 = *(void *)(a2 + v15 + 8);
  void *v16 = *(void *)(a2 + v15);
  v16[1] = v18;
  swift_bridgeObjectRelease();
  uint64_t v19 = *(void *)(v17 + 24);
  v16[2] = *(void *)(v17 + 16);
  v16[3] = v19;
  swift_bridgeObjectRelease();
  uint64_t v20 = (int *)sub_23796E8C8();
  uint64_t v21 = v20[6];
  uint64_t v22 = (char *)v16 + v21;
  uint64_t v23 = v17 + v21;
  uint64_t v24 = sub_23796E358();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v24 - 8) + 40))(v22, v23, v24);
  *((unsigned char *)v16 + v20[7]) = *(unsigned char *)(v17 + v20[7]);
  *(_OWORD *)((char *)v16 + v20[8]) = *(_OWORD *)(v17 + v20[8]);
  uint64_t v25 = a3[8];
  id v26 = *(void **)(a1 + v25);
  *(void *)(a1 + v25) = *(void *)(a2 + v25);

  uint64_t v27 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + v27) = *(void *)(a2 + v27);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23792EF70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23792EF84);
}

uint64_t sub_23792EF84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23796E2A8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_23796E8C8();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 28);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 40));
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t sub_23792F098(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23792F0AC);
}

uint64_t sub_23792F0AC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_23796E2A8();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_23796E8C8();
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 40)) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 28);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t sub_23792F1BC()
{
  uint64_t result = sub_23796E2A8();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_23796E8C8();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_23792F2BC(void (**a1)(char *, char *, uint64_t), int a2)
{
  LODWORD(v135) = a2;
  uint64_t v3 = sub_2379265BC(&qword_268937268);
  MEMORY[0x270FA5388](v3 - 8);
  v126 = (char *)&v100 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2379265BC(&qword_268937238);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  v104 = (char *)&v100 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  id v112 = (char *)&v100 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v132 = (uint64_t)&v100 - v10;
  uint64_t v11 = sub_23796E448();
  uint64_t v114 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v100 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v129 = sub_2379265BC(&qword_2689374E0);
  uint64_t v124 = *(unsigned int (***)(char *, uint64_t, uint64_t))(v129 - 8);
  MEMORY[0x270FA5388](v129);
  id v113 = (char *)&v100 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_2379265BC(&qword_2689374E8);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  id v128 = (char **)((char *)&v100 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v16);
  v127 = (char *)&v100 - v18;
  uint64_t v136 = sub_23796E358();
  uint64_t v131 = *(void *)(v136 - 8);
  MEMORY[0x270FA5388](v136);
  v130 = (char *)&v100 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_2379265BC(&qword_268937478);
  uint64_t v21 = MEMORY[0x270FA5388](v20 - 8);
  uint64_t v111 = (uint64_t)&v100 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v100 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v100 - v26;
  uint64_t v28 = sub_23796E2A8();
  uint64_t v29 = *(void (***)(char *, uint64_t))(v28 - 8);
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  uint64_t v32 = (char *)&v100 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = MEMORY[0x270FA5388](v30);
  uint64_t v35 = (char *)&v100 - v34;
  MEMORY[0x270FA5388](v33);
  uint64_t v37 = (char *)&v100 - v36;
  ((void (*)(char *, void, uint64_t))v29[2])((char *)&v100 - v36, a1, v28);
  if (v135)
  {
    uint64_t v138 = MEMORY[0x263F8EE78];
    char v137 = 1;
    uint64_t v38 = sub_23796E1F8();
    MEMORY[0x270FA5388](v38);
    *(&v100 - 4) = v134;
    *(&v100 - 3) = &v137;
    *(&v100 - 2) = (char *)&v138;
    sub_23796E258();
    uint64_t v39 = v29[1];
    v39(v35, v28);
    id v40 = objc_allocWithZone(MEMORY[0x263F58060]);
    sub_237933904();
    unint64_t v41 = (void *)sub_23796EB08();
    swift_bridgeObjectRelease();
    id v42 = objc_msgSend(v40, sel_initWithEntries_, v41);

    v39(v37, v28);
    return (uint64_t)v42;
  }
  v135 = v32;
  uint64_t v125 = type metadata accessor for TemplateData();
  uint64_t v43 = *(int *)(v125 + 20);
  uint64_t v133 = a1;
  sub_2379266D8((uint64_t)a1 + v43, (uint64_t)v27, &qword_268937478);
  uint64_t v110 = v27;
  sub_2379266D8((uint64_t)v27, (uint64_t)v25, &qword_268937478);
  uint64_t v44 = sub_23796E508();
  uint64_t v45 = *(void *)(v44 - 8);
  uint64_t v46 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v45 + 48);
  uint64_t v106 = v45 + 48;
  v105 = v46;
  if (v46((uint64_t)v25, 1, v44) == 1)
  {
    sub_23792673C((uint64_t)v25, &qword_268937478);
LABEL_38:
    uint64_t v138 = MEMORY[0x263F8EE78];
    char v137 = 1;
    uint64_t v94 = sub_23796E1F8();
    MEMORY[0x270FA5388](v94);
    *(&v100 - 4) = v134;
    *(&v100 - 3) = &v137;
    *(&v100 - 2) = (char *)&v138;
    sub_23796E258();
    v95 = v29[1];
    v95(v35, v28);
    id v96 = objc_allocWithZone(MEMORY[0x263F58060]);
    sub_237933904();
    v97 = (void *)sub_23796EB08();
    swift_bridgeObjectRelease();
    id v42 = objc_msgSend(v96, sel_initWithEntries_, v97);

    sub_23792673C((uint64_t)v110, &qword_268937478);
    v95(v37, v28);
    return (uint64_t)v42;
  }
  v123 = v29;
  uint64_t v47 = sub_23796E488();
  int v50 = *(void (**)(uint64_t, uint64_t))(v45 + 8);
  uint64_t v49 = v45 + 8;
  uint64_t v48 = v50;
  v50((uint64_t)v25, v44);
  if (*(void *)(v47 + 16) != 5)
  {
    swift_bridgeObjectRelease();
    uint64_t v29 = v123;
    goto LABEL_38;
  }
  uint64_t v101 = v48;
  uint64_t v109 = v47;
  uint64_t v102 = v49;
  uint64_t v103 = v44;
  uint64_t v100 = v37;
  uint64_t v138 = MEMORY[0x263F8EE78];
  uint64_t v51 = (char *)v133 + *(int *)(v125 + 24);
  uint64_t v119 = sub_23796E8C8();
  id v120 = v51;
  uint64_t v52 = &v51[*(int *)(v119 + 24)];
  uint64_t v53 = v131 + 16;
  v118 = *(uint64_t (**)(char *, char *, uint64_t))(v131 + 16);
  uint64_t result = v118(v130, v52, v136);
  uint64_t v55 = 0;
  uint64_t v107 = v114 + 16;
  uint64_t v133 = (void (**)(char *, char *, uint64_t))(v114 + 32);
  uint64_t v56 = v124;
  v124 += 6;
  uint64_t v125 = (uint64_t)(v56 + 7);
  id v117 = (void (**)(char *, void, uint64_t, uint64_t))(v53 + 40);
  id v116 = (unsigned int (**)(char *, uint64_t, uint64_t))(v53 + 32);
  uint64_t v131 = v53;
  uint64_t v108 = (void (**)(char *, uint64_t))(v53 - 8);
  ++v123;
  v115 = (uint64_t (**)(char *, uint64_t))(v114 + 8);
  uint64_t v121 = v11;
  uint64_t v122 = v28;
  uint64_t v57 = v132;
  v59 = v128;
  uint64_t v58 = v129;
LABEL_7:
  if (((unint64_t)v55 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_42;
  }
  if ((unint64_t)v55 >= *(void *)(v109 + 16))
  {
LABEL_42:
    __break(1u);
    return result;
  }
  uint64_t v60 = v114;
  uint64_t v61 = &v113[*(int *)(v58 + 48)];
  (*(void (**)(char *, unint64_t, uint64_t))(v114 + 16))(v61, v109+ ((*(unsigned __int8 *)(v60 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80))+ *(void *)(v60 + 72) * (void)v55, v11);
  id v62 = (char *)v59 + *(int *)(v58 + 48);
  char *v59 = v55;
  (*(void (**)(char *, char *, uint64_t))(v60 + 32))(v62, v61, v11);
  uint64_t v63 = 0;
  ++v55;
  while (1)
  {
    (*(void (**)(char **, uint64_t, uint64_t, uint64_t))v125)(v59, v63, 1, v58);
    uint64_t v64 = v127;
    sub_237933DD4((uint64_t)v59, (uint64_t)v127, &qword_2689374E8);
    if ((*v124)(v64, 1, v58) == 1) {
      break;
    }
    uint64_t v65 = *(void *)v64;
    (*v133)(v13, &v64[*(int *)(v58 + 48)], v11);
    sub_23796E408();
    v134 = v55;
    if (!v65)
    {
      uint64_t v72 = v111;
      sub_2379266D8((uint64_t)v110, v111, &qword_268937478);
      uint64_t v73 = v103;
      int v74 = v105(v72, 1, v103);
      uint64_t v75 = (uint64_t)v112;
      if (v74 == 1)
      {
        sub_23792673C(v72, &qword_268937478);
        goto LABEL_19;
      }
      uint64_t v76 = (uint64_t)v104;
      sub_23796E4A8();
      v101(v72, v73);
      uint64_t v77 = sub_23796E548();
      uint64_t v78 = *(void *)(v77 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v78 + 48))(v76, 1, v77) == 1)
      {
        sub_23792673C(v76, &qword_268937238);
        uint64_t v57 = v132;
LABEL_19:
        uint64_t v79 = sub_23796E548();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v79 - 8) + 56))(v75, 1, 1, v79);
      }
      else
      {
        sub_23796E908();
        (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v76, v77);
        uint64_t v57 = v132;
      }
      sub_237933DD4(v75, v57, &qword_268937238);
      uint64_t v70 = 0;
      goto LABEL_22;
    }
    if (qword_2689370C8 != -1) {
      swift_once();
    }
    uint64_t v66 = (void *)*((void *)off_2689374D8 + 2);
    swift_retain();
    v67 = (void *)sub_23796E228();
    id v68 = objc_msgSend(v66, sel_stringFromDate_, v67);

    sub_23796EA98();
    uint64_t v70 = v69;
    swift_release();

    uint64_t v71 = sub_23796E548();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v71 - 8) + 56))(v57, 1, 1, v71);
LABEL_22:
    sub_23796EBF8();
    sub_2379260BC((uint64_t)v13, v57);
    uint64_t v81 = v80;
    uint64_t v83 = v82;
    id v84 = v13;
    char v85 = sub_23796E3C8();
    id v86 = v126;
    uint64_t v87 = v136;
    v118(v126, v130, v136);
    (*v117)(v86, 0, 1, v87);
    if (v81)
    {
      v88 = (void *)sub_23796EA68();
      swift_bridgeObjectRelease();
    }
    else
    {
      v88 = 0;
    }
    uint64_t v13 = v84;
    v59 = v128;
    if (v83)
    {
      id v89 = (void *)sub_23796EA68();
      swift_bridgeObjectRelease();
      uint64_t v90 = v136;
      if (v70) {
        goto LABEL_27;
      }
    }
    else
    {
      id v89 = 0;
      uint64_t v90 = v136;
      if (v70)
      {
LABEL_27:
        v91 = (void *)sub_23796EA68();
        swift_bridgeObjectRelease();
        goto LABEL_30;
      }
    }
    v91 = 0;
LABEL_30:
    uint64_t v58 = v129;
    if ((*v116)(v86, 1, v90) == 1)
    {
      id v92 = 0;
    }
    else
    {
      uint64_t v93 = v86;
      id v92 = (void *)sub_23796E338();
      (*v108)(v93, v90);
    }
    objc_msgSend(objc_allocWithZone(MEMORY[0x263F58068]), sel_initWithTopString_middleString_bottomString_isDay_timeZone_, v88, v89, v91, v85 & 1, v92);

    MEMORY[0x237E25BF0]();
    if (*(void *)((v138 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v138 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_23796EB38();
    }
    sub_23796EB58();
    sub_23796EB28();
    uint64_t v57 = v132;
    sub_23792673C(v132, &qword_268937238);
    uint64_t v28 = v122;
    (*v123)(v135, v122);
    uint64_t v11 = v121;
    uint64_t result = (*v115)(v13, v121);
    uint64_t v55 = v134;
    if (v134 != (char *)5) {
      goto LABEL_7;
    }
    uint64_t v63 = 1;
  }
  swift_bridgeObjectRelease();
  id v98 = objc_allocWithZone(MEMORY[0x263F58060]);
  sub_237933904();
  uint64_t v99 = (void *)sub_23796EB08();
  swift_bridgeObjectRelease();
  id v42 = objc_msgSend(v98, sel_initWithEntries_, v99);

  (*v108)(v130, v136);
  sub_23792673C((uint64_t)v110, &qword_268937478);
  (*v123)(v100, v28);
  return (uint64_t)v42;
}

uint64_t sub_237930244(char *a1, int a2)
{
  LODWORD(v135) = a2;
  uint64_t v3 = sub_2379265BC(&qword_268937268);
  MEMORY[0x270FA5388](v3 - 8);
  v127 = (char *)&v101 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2379265BC(&qword_268937238);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  v105 = (char *)&v101 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  id v113 = (char *)&v101 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v133 = (uint64_t)&v101 - v10;
  uint64_t v11 = sub_23796E448();
  uint64_t v115 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v101 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v130 = sub_2379265BC(&qword_2689374E0);
  uint64_t v124 = *(unsigned int (***)(char *, uint64_t, uint64_t))(v130 - 8);
  MEMORY[0x270FA5388](v130);
  uint64_t v114 = (char *)&v101 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_2379265BC(&qword_2689374E8);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v129 = (char *)&v101 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  id v128 = (char *)&v101 - v18;
  uint64_t v137 = sub_23796E358();
  uint64_t v132 = *(void *)(v137 - 8);
  MEMORY[0x270FA5388](v137);
  uint64_t v131 = (char *)&v101 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_2379265BC(&qword_268937478);
  uint64_t v21 = MEMORY[0x270FA5388](v20 - 8);
  uint64_t v112 = (uint64_t)&v101 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v101 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v101 - v26;
  uint64_t v28 = sub_23796E2A8();
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  uint64_t v136 = (char *)&v101 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  uint64_t v34 = (char *)&v101 - v33;
  MEMORY[0x270FA5388](v32);
  uint64_t v36 = (char *)&v101 - v35;
  (*(void (**)(char *, char *, uint64_t))(v29 + 16))((char *)&v101 - v35, a1, v28);
  if (v135)
  {
    uint64_t v139 = MEMORY[0x263F8EE78];
    char v138 = 1;
    uint64_t v37 = sub_23796E1F8();
    MEMORY[0x270FA5388](v37);
    *(&v101 - 4) = v134;
    *(&v101 - 3) = &v138;
    *(&v101 - 2) = (char *)&v139;
    sub_23796E258();
    uint64_t v38 = *(void (**)(char *, uint64_t))(v29 + 8);
    v38(v34, v28);
    id v39 = objc_allocWithZone(MEMORY[0x263F58060]);
    sub_237933904();
    id v40 = (void *)sub_23796EB08();
    swift_bridgeObjectRelease();
    id v41 = objc_msgSend(v39, sel_initWithEntries_, v40);

    v38(v36, v28);
    return (uint64_t)v41;
  }
  uint64_t v126 = v11;
  uint64_t v135 = type metadata accessor for TemplateData();
  id v42 = a1;
  sub_2379266D8((uint64_t)&a1[*(int *)(v135 + 20)], (uint64_t)v27, &qword_268937478);
  uint64_t v111 = v27;
  sub_2379266D8((uint64_t)v27, (uint64_t)v25, &qword_268937478);
  uint64_t v43 = sub_23796E508();
  uint64_t v44 = *(void *)(v43 - 8);
  uint64_t v45 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v44 + 48);
  uint64_t v107 = v44 + 48;
  uint64_t v106 = v45;
  if (v45((uint64_t)v25, 1, v43) == 1)
  {
    sub_23792673C((uint64_t)v25, &qword_268937478);
LABEL_38:
    uint64_t v139 = MEMORY[0x263F8EE78];
    char v138 = 1;
    uint64_t v95 = sub_23796E1F8();
    MEMORY[0x270FA5388](v95);
    *(&v101 - 4) = v134;
    *(&v101 - 3) = &v138;
    *(&v101 - 2) = (char *)&v139;
    sub_23796E258();
    id v96 = *(void (**)(char *, uint64_t))(v29 + 8);
    v96(v34, v28);
    id v97 = objc_allocWithZone(MEMORY[0x263F58060]);
    sub_237933904();
    id v98 = (void *)sub_23796EB08();
    swift_bridgeObjectRelease();
    id v41 = objc_msgSend(v97, sel_initWithEntries_, v98);

    sub_23792673C((uint64_t)v111, &qword_268937478);
    v96(v36, v28);
    return (uint64_t)v41;
  }
  uint64_t v125 = (void (**)(unint64_t *, uint64_t, uint64_t, uint64_t))v42;
  uint64_t v46 = sub_23796E488();
  uint64_t v49 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
  uint64_t v47 = v44 + 8;
  uint64_t v48 = v49;
  v49((uint64_t)v25, v43);
  if (*(void *)(v46 + 16) != 5)
  {
    swift_bridgeObjectRelease();
    goto LABEL_38;
  }
  uint64_t v102 = v48;
  uint64_t v110 = v46;
  uint64_t v103 = v47;
  uint64_t v104 = v43;
  uint64_t v101 = v36;
  uint64_t v139 = MEMORY[0x263F8EE78];
  int v50 = (char *)v125 + *(int *)(v135 + 24);
  uint64_t v120 = sub_23796E8C8();
  uint64_t v121 = v50;
  uint64_t v51 = &v50[*(int *)(v120 + 24)];
  uint64_t v52 = v132 + 16;
  uint64_t v119 = *(uint64_t (**)(char *, char *, uint64_t))(v132 + 16);
  uint64_t result = v119(v131, v51, v137);
  unint64_t v54 = 0;
  uint64_t v108 = v115 + 16;
  v134 = (char *)(v115 + 32);
  uint64_t v55 = v124;
  v124 += 6;
  uint64_t v125 = (void (**)(unint64_t *, uint64_t, uint64_t, uint64_t))(v55 + 7);
  v118 = (void (**)(char *, void, uint64_t, uint64_t))(v52 + 40);
  id v117 = (unsigned int (**)(char *, uint64_t, uint64_t))(v52 + 32);
  uint64_t v132 = v52;
  uint64_t v109 = (void (**)(char *, uint64_t))(v52 - 8);
  v123 = (void (**)(char *, uint64_t))(v29 + 8);
  id v116 = (uint64_t (**)(char *, uint64_t))(v115 + 8);
  uint64_t v122 = v28;
  uint64_t v56 = v133;
  uint64_t v57 = v126;
  v59 = (unint64_t *)v129;
  uint64_t v58 = v130;
LABEL_7:
  if ((v54 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_42;
  }
  if (v54 >= *(void *)(v110 + 16))
  {
LABEL_42:
    __break(1u);
    return result;
  }
  uint64_t v60 = v115;
  uint64_t v61 = &v114[*(int *)(v58 + 48)];
  (*(void (**)(char *, unint64_t, uint64_t))(v115 + 16))(v61, v110+ ((*(unsigned __int8 *)(v60 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80))+ *(void *)(v60 + 72) * v54, v57);
  id v62 = (char *)v59 + *(int *)(v58 + 48);
  unint64_t *v59 = v54;
  (*(void (**)(char *, char *, uint64_t))(v60 + 32))(v62, v61, v57);
  uint64_t v63 = 0;
  ++v54;
  while (1)
  {
    (*v125)(v59, v63, 1, v58);
    uint64_t v64 = v128;
    sub_237933DD4((uint64_t)v59, (uint64_t)v128, &qword_2689374E8);
    if ((*v124)(v64, 1, v58) == 1) {
      break;
    }
    uint64_t v65 = *(void *)v64;
    (*(void (**)(char *, char *, uint64_t))v134)(v13, &v64[*(int *)(v58 + 48)], v57);
    sub_23796E408();
    uint64_t v135 = v54;
    if (!v65)
    {
      uint64_t v72 = v112;
      sub_2379266D8((uint64_t)v111, v112, &qword_268937478);
      uint64_t v73 = v104;
      int v74 = v106(v72, 1, v104);
      uint64_t v75 = (uint64_t)v113;
      if (v74 == 1)
      {
        sub_23792673C(v72, &qword_268937478);
        goto LABEL_19;
      }
      uint64_t v76 = (uint64_t)v105;
      sub_23796E4A8();
      v102(v72, v73);
      uint64_t v77 = sub_23796E548();
      uint64_t v78 = *(void *)(v77 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v78 + 48))(v76, 1, v77) == 1)
      {
        sub_23792673C(v76, &qword_268937238);
        uint64_t v56 = v133;
LABEL_19:
        uint64_t v79 = sub_23796E548();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v79 - 8) + 56))(v75, 1, 1, v79);
      }
      else
      {
        sub_23796E908();
        (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v76, v77);
        uint64_t v56 = v133;
      }
      sub_237933DD4(v75, v56, &qword_268937238);
      uint64_t v70 = 0;
      goto LABEL_22;
    }
    if (qword_2689370C8 != -1) {
      swift_once();
    }
    uint64_t v66 = (void *)*((void *)off_2689374D8 + 2);
    swift_retain();
    v67 = (void *)sub_23796E228();
    id v68 = objc_msgSend(v66, sel_stringFromDate_, v67);

    sub_23796EA98();
    uint64_t v70 = v69;
    swift_release();

    uint64_t v71 = sub_23796E548();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v71 - 8) + 56))(v56, 1, 1, v71);
LABEL_22:
    char v80 = sub_23796EBF8();
    sub_23794678C((uint64_t)v13, v56, v80 & 1);
    uint64_t v82 = v81;
    uint64_t v84 = v83;
    char v85 = v13;
    char v86 = sub_23796E3C8();
    uint64_t v87 = v127;
    uint64_t v88 = v137;
    v119(v127, v131, v137);
    (*v118)(v87, 0, 1, v88);
    if (v82)
    {
      id v89 = (void *)sub_23796EA68();
      swift_bridgeObjectRelease();
    }
    else
    {
      id v89 = 0;
    }
    uint64_t v13 = v85;
    v59 = (unint64_t *)v129;
    if (v84)
    {
      uint64_t v90 = (void *)sub_23796EA68();
      swift_bridgeObjectRelease();
      uint64_t v91 = v137;
      if (v70) {
        goto LABEL_27;
      }
    }
    else
    {
      uint64_t v90 = 0;
      uint64_t v91 = v137;
      if (v70)
      {
LABEL_27:
        id v92 = (void *)sub_23796EA68();
        swift_bridgeObjectRelease();
        goto LABEL_30;
      }
    }
    id v92 = 0;
LABEL_30:
    uint64_t v58 = v130;
    if ((*v117)(v87, 1, v91) == 1)
    {
      uint64_t v93 = 0;
    }
    else
    {
      uint64_t v94 = v87;
      uint64_t v93 = (void *)sub_23796E338();
      (*v109)(v94, v91);
    }
    objc_msgSend(objc_allocWithZone(MEMORY[0x263F58068]), sel_initWithTopString_middleString_bottomString_isDay_timeZone_, v89, v90, v92, v86 & 1, v93);

    MEMORY[0x237E25BF0]();
    if (*(void *)((v139 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v139 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_23796EB38();
    }
    sub_23796EB58();
    sub_23796EB28();
    uint64_t v56 = v133;
    sub_23792673C(v133, &qword_268937238);
    uint64_t v28 = v122;
    (*v123)(v136, v122);
    uint64_t v57 = v126;
    uint64_t result = (*v116)(v13, v126);
    unint64_t v54 = v135;
    if (v135 != 5) {
      goto LABEL_7;
    }
    uint64_t v63 = 1;
  }
  swift_bridgeObjectRelease();
  id v99 = objc_allocWithZone(MEMORY[0x263F58060]);
  sub_237933904();
  uint64_t v100 = (void *)sub_23796EB08();
  swift_bridgeObjectRelease();
  id v41 = objc_msgSend(v99, sel_initWithEntries_, v100);

  (*v109)(v131, v137);
  sub_23792673C((uint64_t)v111, &qword_268937478);
  (*v123)(v101, v28);
  return (uint64_t)v41;
}

uint64_t sub_2379311CC(void (**a1)(char *, char *, uint64_t), char a2)
{
  uint64_t v4 = sub_2379265BC(&qword_268937268);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v130 = (char *)&v104 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2379265BC(&qword_268937508);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v129 = (char *)&v104 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2379265BC(&qword_268937238);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v108 = (char *)&v104 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v114 = (char *)&v104 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v140 = (uint64_t)&v104 - v13;
  uint64_t v132 = sub_23796E448();
  uint64_t v117 = *(void *)(v132 - 8);
  MEMORY[0x270FA5388](v132);
  uint64_t v142 = (char *)&v104 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_2379265BC(&qword_2689374E0);
  uint64_t v138 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  id v116 = (char *)&v104 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_2379265BC(&qword_2689374E8);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  uint64_t v20 = (char *)&v104 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v131 = (char *)&v104 - v21;
  uint64_t v141 = sub_23796E358();
  uint64_t v135 = *(void *)(v141 - 8);
  MEMORY[0x270FA5388](v141);
  v134 = (char *)&v104 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_2379265BC(&qword_268937478);
  uint64_t v24 = MEMORY[0x270FA5388](v23 - 8);
  uint64_t v115 = (uint64_t)&v104 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v104 - v27;
  MEMORY[0x270FA5388](v26);
  uint64_t v30 = (char *)&v104 - v29;
  uint64_t v31 = sub_23796E2A8();
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  uint64_t v133 = (char *)&v104 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = MEMORY[0x270FA5388](v33);
  uint64_t v37 = (char *)&v104 - v36;
  MEMORY[0x270FA5388](v35);
  id v39 = (char *)&v104 - v38;
  (*(void (**)(char *, char *, uint64_t))(v32 + 16))((char *)&v104 - v38, (char *)a1, v31);
  if (a2)
  {
    uint64_t v144 = MEMORY[0x263F8EE78];
    char v143 = 1;
    uint64_t v40 = sub_23796E1F8();
    MEMORY[0x270FA5388](v40);
    *(&v104 - 4) = (char *)v139;
    *(&v104 - 3) = &v143;
    *(&v104 - 2) = (char *)&v144;
    sub_23796E258();
    id v41 = *(void (**)(char *, uint64_t))(v32 + 8);
    v41(v37, v31);
    id v42 = objc_allocWithZone(MEMORY[0x263F58060]);
    sub_237933904();
    uint64_t v43 = (void *)sub_23796EB08();
    swift_bridgeObjectRelease();
    id v44 = objc_msgSend(v42, sel_initWithEntries_, v43);

    v41(v39, v31);
    return (uint64_t)v44;
  }
  id v128 = (unint64_t *)v20;
  uint64_t v137 = type metadata accessor for TemplateData();
  sub_2379266D8((uint64_t)a1 + *(int *)(v137 + 20), (uint64_t)v30, &qword_268937478);
  id v113 = v30;
  sub_2379266D8((uint64_t)v30, (uint64_t)v28, &qword_268937478);
  uint64_t v45 = sub_23796E508();
  uint64_t v46 = *(void *)(v45 - 8);
  uint64_t v47 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v46 + 48);
  uint64_t v110 = v46 + 48;
  uint64_t v109 = v47;
  if (v47((uint64_t)v28, 1, v45) == 1)
  {
    sub_23792673C((uint64_t)v28, &qword_268937478);
LABEL_38:
    uint64_t v144 = MEMORY[0x263F8EE78];
    char v143 = 1;
    uint64_t v98 = sub_23796E1F8();
    MEMORY[0x270FA5388](v98);
    *(&v104 - 4) = (char *)v139;
    *(&v104 - 3) = &v143;
    *(&v104 - 2) = (char *)&v144;
    sub_23796E258();
    id v99 = *(void (**)(char *, uint64_t))(v32 + 8);
    v99(v37, v31);
    id v100 = objc_allocWithZone(MEMORY[0x263F58060]);
    sub_237933904();
    uint64_t v101 = (void *)sub_23796EB08();
    swift_bridgeObjectRelease();
    id v44 = objc_msgSend(v100, sel_initWithEntries_, v101);

    sub_23792673C((uint64_t)v113, &qword_268937478);
    v99(v39, v31);
    return (uint64_t)v44;
  }
  uint64_t v136 = a1;
  uint64_t v48 = sub_23796E488();
  uint64_t v51 = *(void (**)(uint64_t, uint64_t))(v46 + 8);
  uint64_t v49 = v46 + 8;
  int v50 = v51;
  v51((uint64_t)v28, v45);
  if (*(void *)(v48 + 16) != 5)
  {
    swift_bridgeObjectRelease();
    goto LABEL_38;
  }
  v105 = v50;
  uint64_t v112 = v48;
  uint64_t v106 = v49;
  uint64_t v107 = v45;
  uint64_t v104 = v39;
  uint64_t v144 = MEMORY[0x263F8EE78];
  uint64_t v52 = (char *)v136 + *(int *)(v137 + 24);
  uint64_t v123 = sub_23796E8C8();
  uint64_t v53 = *(int *)(v123 + 24);
  uint64_t v124 = v52;
  unint64_t v54 = &v52[v53];
  uint64_t v55 = v135 + 16;
  uint64_t v122 = *(uint64_t (**)(char *, char *, uint64_t))(v135 + 16);
  uint64_t result = v122(v134, v54, v141);
  unint64_t v57 = 0;
  uint64_t v136 = (void (**)(char *, char *, uint64_t))(v117 + 32);
  uint64_t v137 = v117 + 16;
  uint64_t v126 = (unsigned int (**)(char *, uint64_t, uint64_t))(v138 + 48);
  v127 = (void (**)(unint64_t *, uint64_t, uint64_t, uint64_t))(v138 + 56);
  uint64_t v121 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v117 + 56);
  uint64_t v120 = (void (**)(char *, void, uint64_t, uint64_t))(v55 + 40);
  uint64_t v119 = (unsigned int (**)(char *, uint64_t, uint64_t))(v55 + 32);
  uint64_t v135 = v55;
  uint64_t v111 = (void (**)(char *, uint64_t))(v55 - 8);
  uint64_t v125 = (void (**)(char *, uint64_t))(v32 + 8);
  v118 = (uint64_t (**)(char *, uint64_t))(v117 + 8);
  uint64_t v58 = v132;
  v59 = v128;
LABEL_7:
  if ((v57 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_42;
  }
  if (v57 >= *(void *)(v112 + 16))
  {
LABEL_42:
    __break(1u);
    return result;
  }
  uint64_t v60 = v57 + 1;
  uint64_t v61 = v117;
  id v62 = &v116[*(int *)(v15 + 48)];
  (*(void (**)(char *, unint64_t, uint64_t))(v117 + 16))(v62, v112+ ((*(unsigned __int8 *)(v61 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v61 + 80))+ *(void *)(v61 + 72) * v57, v58);
  uint64_t v63 = (char *)v59 + *(int *)(v15 + 48);
  unint64_t *v59 = v57;
  (*(void (**)(char *, char *, uint64_t))(v61 + 32))(v63, v62, v58);
  for (uint64_t i = 0; ; uint64_t i = 1)
  {
    (*v127)(v59, i, 1, v15);
    uint64_t v65 = v131;
    sub_237933DD4((uint64_t)v59, (uint64_t)v131, &qword_2689374E8);
    if ((*v126)(v65, 1, v15) == 1) {
      break;
    }
    uint64_t v66 = *(void *)v65;
    (*v136)(v142, &v65[*(int *)(v15 + 48)], v58);
    sub_23796E408();
    uint64_t v139 = v60;
    if (!v66)
    {
      uint64_t v73 = v115;
      sub_2379266D8((uint64_t)v113, v115, &qword_268937478);
      uint64_t v74 = v107;
      if (v109(v73, 1, v107) == 1)
      {
        uint64_t v75 = v73;
        uint64_t v76 = &qword_268937478;
        goto LABEL_19;
      }
      uint64_t v77 = v108;
      sub_23796E4A8();
      v105(v73, v74);
      uint64_t v78 = sub_23796E548();
      uint64_t v79 = *(void *)(v78 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v79 + 48))(v77, 1, v78) == 1)
      {
        uint64_t v75 = (uint64_t)v77;
        uint64_t v76 = &qword_268937238;
LABEL_19:
        sub_23792673C(v75, v76);
        uint64_t v80 = (uint64_t)v114;
        uint64_t v81 = sub_23796E548();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v81 - 8) + 56))(v80, 1, 1, v81);
      }
      else
      {
        uint64_t v82 = v114;
        sub_23796E908();
        uint64_t v83 = v78;
        uint64_t v80 = (uint64_t)v82;
        (*(void (**)(char *, uint64_t))(v79 + 8))(v77, v83);
      }
      sub_237933DD4(v80, v140, &qword_268937238);
      uint64_t v138 = 0;
      uint64_t v71 = 0;
      goto LABEL_22;
    }
    if (qword_2689370C8 != -1) {
      swift_once();
    }
    v67 = (void *)*((void *)off_2689374D8 + 2);
    swift_retain();
    id v68 = (void *)sub_23796E228();
    id v69 = objc_msgSend(v67, sel_stringFromDate_, v68);

    uint64_t v138 = sub_23796EA98();
    uint64_t v71 = v70;
    swift_release();

    uint64_t v72 = sub_23796E548();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v72 - 8) + 56))(v140, 1, 1, v72);
LABEL_22:
    uint64_t v84 = v15;
    uint64_t v85 = v31;
    sub_23796EBF8();
    if (qword_268937148 != -1) {
      swift_once();
    }
    char v86 = off_268937950;
    uint64_t v87 = (uint64_t)v129;
    (*(void (**)(char *, char *, uint64_t))v137)(v129, v142, v58);
    (*v121)(v87, 0, 1, v58);
    (*(void (**)(uint64_t))(*(void *)v86 + 144))(v87);
    sub_23792673C(v87, &qword_268937508);
    sub_23796E3B8();
    uint64_t v89 = v88;
    char v90 = sub_23796E3C8();
    uint64_t v91 = v130;
    uint64_t v92 = v141;
    v122(v130, v134, v141);
    (*v120)(v91, 0, 1, v92);
    uint64_t v93 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    if (v89)
    {
      uint64_t v94 = (void *)sub_23796EA68();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v94 = 0;
    }
    uint64_t v31 = v85;
    uint64_t v58 = v132;
    uint64_t v15 = v84;
    if (v71)
    {
      uint64_t v95 = (void *)sub_23796EA68();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v95 = 0;
    }
    uint64_t v96 = v141;
    if ((*v119)(v91, 1, v141) == 1)
    {
      id v97 = 0;
    }
    else
    {
      id v97 = (void *)sub_23796E338();
      (*v111)(v91, v96);
    }
    objc_msgSend(objc_allocWithZone(MEMORY[0x263F58068]), sel_initWithTopString_middleString_bottomString_isDay_timeZone_, v93, v94, v95, v90 & 1, v97);

    MEMORY[0x237E25BF0]();
    if (*(void *)((v144 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v144 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_23796EB38();
    }
    sub_23796EB58();
    sub_23796EB28();
    sub_23792673C(v140, &qword_268937238);
    (*v125)(v133, v31);
    uint64_t result = (*v118)(v142, v58);
    v59 = v128;
    unint64_t v57 = v139;
    if (v139 != 5) {
      goto LABEL_7;
    }
    uint64_t v60 = 5;
  }
  swift_bridgeObjectRelease();
  id v102 = objc_allocWithZone(MEMORY[0x263F58060]);
  sub_237933904();
  uint64_t v103 = (void *)sub_23796EB08();
  swift_bridgeObjectRelease();
  id v44 = objc_msgSend(v102, sel_initWithEntries_, v103);

  (*v111)(v134, v141);
  sub_23792673C((uint64_t)v113, &qword_268937478);
  (*v125)(v104, v31);
  return (uint64_t)v44;
}

void sub_237932244()
{
}

void sub_23793225C()
{
  id v1 = objc_msgSend(*v0, sel_hourlyEntryModels);
  sub_237933904();
  unint64_t v2 = sub_23796EB18();

  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
LABEL_21:
    swift_bridgeObjectRelease();
    sub_2379265BC(&qword_2689374F0);
    sub_237933E38();
    sub_23796EA48();
    swift_bridgeObjectRelease();
    sub_23796EAD8();
    swift_bridgeObjectRelease();
    sub_23796EAD8();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_23796ED48();
  swift_bridgeObjectRelease();
  if (!v3) {
    goto LABEL_21;
  }
LABEL_3:
  if (v3 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v6 = (id)MEMORY[0x237E25DC0](v4, v2);
      }
      else {
        id v6 = *(id *)(v2 + 8 * v4 + 32);
      }
      uint64_t v7 = v6;
      id v8 = objc_msgSend(v6, sel_topString, 40);
      if (v8)
      {
        uint64_t v9 = v8;
        sub_23796EA98();
      }
      sub_23796EAD8();
      swift_bridgeObjectRelease();
      sub_23796EAD8();
      id v10 = objc_msgSend(v7, sel_middleString);
      if (v10)
      {
        uint64_t v11 = v10;
        sub_23796EA98();
      }
      sub_23796EAD8();
      swift_bridgeObjectRelease();
      sub_23796EAD8();
      id v12 = objc_msgSend(v7, sel_bottomString);
      if (v12)
      {
        uint64_t v13 = v12;
        sub_23796EA98();
      }
      sub_23796EAD8();
      swift_bridgeObjectRelease();
      sub_23796EAD8();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v5 = sub_237933944(0, v5[2] + 1, 1, v5);
      }
      unint64_t v15 = v5[2];
      unint64_t v14 = v5[3];
      if (v15 >= v14 >> 1) {
        uint64_t v5 = sub_237933944((void *)(v14 > 1), v15 + 1, 1, v5);
      }
      ++v4;
      v5[2] = v15 + 1;
      uint64_t v16 = &v5[2 * v15];
      v16[4] = v17;
      v16[5] = 0xE100000000000000;
    }
    while (v3 != v4);
    goto LABEL_21;
  }
  __break(1u);
}

uint64_t sub_2379325A8@<X0>(void (**a1)(char *, char *, uint64_t)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v24 = type metadata accessor for TemplateData();
  MEMORY[0x270FA5388](v24);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for ChanceRainTemplateModel();
  uint64_t v7 = v6 - 8;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v23 = (uint64_t)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v23 - v10;
  uint64_t v12 = sub_23796E2A8();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  unint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v13 + 16))(v15, a1, v12);
  sub_237940B60((uint64_t)a1, (uint64_t)v11);
  char v16 = v11[*(int *)(v7 + 32) + 8];
  uint64_t v17 = sub_2379311CC(a1, v16);
  sub_2379494EC();
  if ((v18 & 1) != 0 && (v16 & 1) == 0)
  {
    sub_23793C4F8((uint64_t)v5);
    uint64_t v19 = v23;
    sub_237940B60((uint64_t)v5, v23);
    sub_237934014((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for TemplateData);
    sub_237934014((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for ChanceRainTemplateModel);
    sub_237933FAC(v19, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for ChanceRainTemplateModel);
  }
  uint64_t v20 = (uint64_t)a1 + *(int *)(v24 + 24);
  uint64_t v21 = (int *)type metadata accessor for ChanceRainRectangularTemplateModel();
  sub_23793345C(v20, (uint64_t)a2 + v21[7]);
  *a2 = v17;
  sub_237933FAC((uint64_t)v11, (uint64_t)a2 + v21[5], (uint64_t (*)(void))type metadata accessor for ChanceRainTemplateModel);
  return (*(uint64_t (**)(char *, char *, uint64_t))(v13 + 32))((char *)a2 + v21[6], v15, v12);
}

uint64_t sub_237932860@<X0>(char *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v23 = type metadata accessor for TemplateData();
  MEMORY[0x270FA5388](v23);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for ConditionTemplateModel();
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v22 - v10;
  uint64_t v12 = sub_23796E2A8();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  unint64_t v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v15, a1, v12);
  sub_2379428CC((uint64_t)a1, (uint64_t)v11);
  char v16 = sub_237942628();
  uint64_t v17 = sub_237930244(a1, v16 & 1);
  sub_2379494EC();
  if ((v18 & 1) != 0 && (sub_237942628() & 1) == 0)
  {
    sub_23793C4F8((uint64_t)v5);
    sub_2379428CC((uint64_t)v5, (uint64_t)v9);
    sub_237934014((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for TemplateData);
    sub_237934014((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for ConditionTemplateModel);
    sub_237933FAC((uint64_t)v9, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for ConditionTemplateModel);
  }
  uint64_t v19 = (uint64_t)&a1[*(int *)(v23 + 24)];
  uint64_t v20 = (int *)type metadata accessor for ConditionRectangularTemplateModel();
  sub_23793345C(v19, (uint64_t)a2 + v20[7]);
  *a2 = v17;
  sub_237933FAC((uint64_t)v11, (uint64_t)a2 + v20[5], (uint64_t (*)(void))type metadata accessor for ConditionTemplateModel);
  return (*(uint64_t (**)(char *, char *, uint64_t))(v13 + 32))((char *)a2 + v20[6], v15, v12);
}

uint64_t sub_237932B18@<X0>(unint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v24 = type metadata accessor for TemplateData();
  MEMORY[0x270FA5388](v24);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for UVTemplateModel();
  uint64_t v7 = v6 - 8;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v23 = (uint64_t)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v23 - v10;
  uint64_t v12 = sub_23796E2A8();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  unint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v15, a1, v12);
  sub_23792D9B0(a1, (uint64_t)v11);
  int v16 = v11[*(int *)(v7 + 28) + 8];
  uint64_t v17 = sub_237934EF4(a1, v16);
  sub_2379494EC();
  if ((v18 & 1) != 0 && (v16 & 1) == 0)
  {
    sub_23793C4F8((uint64_t)v5);
    uint64_t v19 = v23;
    sub_23792D9B0((uint64_t)v5, v23);
    sub_237934014((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for TemplateData);
    sub_237934014((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for UVTemplateModel);
    sub_237933FAC(v19, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for UVTemplateModel);
  }
  uint64_t v20 = a1 + *(int *)(v24 + 24);
  uint64_t v21 = (int *)type metadata accessor for UVRectangularTemplateModel();
  sub_23793345C(v20, (uint64_t)a2 + v21[7]);
  *a2 = v17;
  sub_237933FAC((uint64_t)v11, (uint64_t)a2 + v21[5], (uint64_t (*)(void))type metadata accessor for UVTemplateModel);
  return (*(uint64_t (**)(char *, char *, uint64_t))(v13 + 32))((char *)a2 + v21[6], v15, v12);
}

uint64_t sub_237932DD0@<X0>(void (**a1)(char *, char *, uint64_t)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v43 = a2;
  uint64_t v42 = type metadata accessor for TemplateData();
  MEMORY[0x270FA5388](v42);
  uint64_t v38 = (uint64_t)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2379265BC((uint64_t *)&unk_268937840);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v39 = (uint64_t)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v37 - v7;
  uint64_t v9 = type metadata accessor for WindTemplateModel();
  uint64_t v10 = v9 - 8;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v37 = (uint64_t)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v37 - v13;
  uint64_t v15 = sub_23796E2A8();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  char v18 = *(void (**)(void))(v16 + 16);
  uint64_t v40 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = v19;
  v18();
  sub_237939CB8((uint64_t)a1, (uint64_t)v14);
  uint64_t v20 = (uint64_t)&v14[*(int *)(v10 + 36)];
  sub_2379266D8(v20, (uint64_t)v8, (uint64_t *)&unk_268937840);
  uint64_t v21 = sub_2379265BC(&qword_268937230);
  uint64_t v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 48);
  BOOL v23 = v22(v8, 1, v21) == 1;
  uint64_t v24 = (uint64_t)v8;
  uint64_t v25 = a1;
  sub_23792673C(v24, (uint64_t *)&unk_268937840);
  uint64_t v26 = sub_23792F2BC(a1, v23);
  sub_2379494EC();
  if (v27)
  {
    uint64_t v28 = v20;
    uint64_t v29 = v39;
    sub_2379266D8(v28, v39, (uint64_t *)&unk_268937840);
    int v30 = v22((char *)v29, 1, v21);
    sub_23792673C(v29, (uint64_t *)&unk_268937840);
    if (v30 != 1)
    {
      uint64_t v31 = v38;
      sub_23793C4F8(v38);
      uint64_t v32 = v37;
      sub_237939CB8(v31, v37);
      sub_237934014(v31, (uint64_t (*)(void))type metadata accessor for TemplateData);
      sub_237934014((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for WindTemplateModel);
      sub_237933FAC(v32, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for WindTemplateModel);
    }
  }
  uint64_t v33 = (uint64_t)v25 + *(int *)(v42 + 24);
  uint64_t v34 = (int *)type metadata accessor for WindRectangularTemplateModel();
  uint64_t v35 = v43;
  sub_23793345C(v33, (uint64_t)v43 + v34[7]);
  uint64_t *v35 = v26;
  sub_237933FAC((uint64_t)v14, (uint64_t)v35 + v34[5], (uint64_t (*)(void))type metadata accessor for WindTemplateModel);
  return (*(uint64_t (**)(char *, char *, uint64_t))(v16 + 32))((char *)v35 + v34[6], v40, v41);
}

uint64_t sub_2379331BC()
{
  id v0 = sub_237933204();
  type metadata accessor for DateFormatterCache();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v0;
  *(void *)(result + 24) = 10;
  off_2689374D8 = (_UNKNOWN *)result;
  return result;
}

id sub_237933204()
{
  uint64_t v0 = sub_2379265BC(&qword_268937268);
  MEMORY[0x270FA5388](v0 - 8);
  unint64_t v2 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_23796E318();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  sub_23796E2E8();
  uint64_t v8 = (void *)sub_23796E2F8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  objc_msgSend(v7, sel_setLocale_, v8);

  uint64_t v9 = (void *)sub_23796EA68();
  objc_msgSend(v7, sel_setDateFormat_, v9);

  sub_23796E328();
  uint64_t v10 = sub_23796E358();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v2, 1, v10) != 1)
  {
    uint64_t v12 = (void *)sub_23796E338();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v2, v10);
  }
  objc_msgSend(v7, sel_setTimeZone_, v12);

  return v7;
}

uint64_t sub_23793345C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23796E8C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2379334C0(uint64_t a1, uint64_t a2, unsigned char *a3, void *a4)
{
  uint64_t v6 = sub_2379265BC(&qword_268937268);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2689370C8 != -1) {
    swift_once();
  }
  uint64_t v9 = (void *)*((void *)off_2689374D8 + 2);
  swift_retain();
  uint64_t v10 = (void *)sub_23796E228();
  id v11 = objc_msgSend(v9, sel_stringFromDate_, v10);

  sub_23796EA98();
  uint64_t v13 = v12;
  swift_release();

  if (*a3 == 1)
  {
    swift_bridgeObjectRelease();
    uint64_t v13 = 0;
    *a3 = 0;
  }
  sub_23796E348();
  uint64_t v14 = sub_23796E358();
  uint64_t v15 = *(void *)(v14 - 8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v8, 0, 1, v14);
  if (v13)
  {
    uint64_t v16 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v16 = 0;
  }
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v8, 1, v14) == 1)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = (void *)sub_23796E338();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v8, v14);
  }
  objc_msgSend(objc_allocWithZone(MEMORY[0x263F58068]), sel_initWithTopString_middleString_bottomString_isDay_timeZone_, 0, 0, v16, 1, v17);

  MEMORY[0x237E25BF0]();
  if (*(void *)((*a4 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*a4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_23796EB38();
  }
  sub_23796EB58();
  return sub_23796EB28();
}

id sub_237933770(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8)
{
  uint64_t v9 = v8;
  if (a2)
  {
    uint64_t v14 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v15 = 0;
    if (a6) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v14 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v15 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  if (a6)
  {
LABEL_4:
    uint64_t v16 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v16 = 0;
LABEL_8:
  uint64_t v17 = sub_23796E358();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(a8, 1, v17) != 1)
  {
    uint64_t v19 = (void *)sub_23796E338();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(a8, v17);
  }
  id v20 = objc_msgSend(v9, sel_initWithTopString_middleString_bottomString_isDay_timeZone_, v14, v15, v16, a7 & 1, v19);

  return v20;
}

unint64_t sub_237933904()
{
  unint64_t result = qword_268937260;
  if (!qword_268937260)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268937260);
  }
  return result;
}

void *sub_237933944(void *result, int64_t a2, char a3, void *a4)
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
      sub_2379265BC(&qword_268937500);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_237933E94(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_237933A54(void *result, int64_t a2, char a3, void *a4)
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
      sub_2379265BC(&qword_268937510);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_237934074(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_237933B64(char a1, int64_t a2, char a3, unint64_t a4)
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
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  sub_2379265BC(&qword_268937518);
  uint64_t v10 = *(void *)(sub_2379265BC(&qword_268937520) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_23796ED38();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_2379265BC(&qword_268937520) - 8);
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
    sub_237934168(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_237933DD4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_2379265BC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_237933E38()
{
  unint64_t result = qword_2689374F8;
  if (!qword_2689374F8)
  {
    sub_23792D044(&qword_2689374F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689374F8);
  }
  return result;
}

uint64_t sub_237933E94(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_23796ED88();
  __break(1u);
  return result;
}

uint64_t sub_237933F8C(uint64_t a1)
{
  return sub_2379334C0(a1, *(void *)(v1 + 16), *(unsigned char **)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_237933FAC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_237934014(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_237934074(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_23796ED88();
  __break(1u);
  return result;
}

uint64_t sub_237934168(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_2379265BC(&qword_268937520) - 8);
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
  uint64_t result = sub_23796ED88();
  __break(1u);
  return result;
}

uint64_t sub_2379342C8@<X0>(char **a1@<X8>)
{
  unint64_t v54 = a1;
  uint64_t v53 = sub_23796E2D8();
  uint64_t v51 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  int v50 = (char *)&v46 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_23796E358();
  uint64_t v2 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  uint64_t v49 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_23796E8C8();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v52 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2379265BC(&qword_268937268);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_23796E2A8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  BOOL v15 = (char *)&v46 - v14;
  uint64_t v56 = type metadata accessor for UVTemplateModel();
  uint64_t v16 = MEMORY[0x270FA5388](v56);
  unint64_t v18 = (char *)&v46 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v57 = (uint64_t)&v46 - v19;
  uint64_t v20 = sub_23792E094((uint64_t)&v46 - v19);
  uint64_t v21 = MEMORY[0x263F8EE78];
  uint64_t v65 = MEMORY[0x263F8EE78];
  sub_23792D380(v20);
  sub_23796E1F8();
  id v62 = &v65;
  sub_23796E248();
  uint64_t v47 = v10;
  uint64_t v22 = *(void (**)(char *, uint64_t))(v10 + 8);
  v22(v13, v9);
  uint64_t v48 = v9;
  v22(v15, v9);
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v64 = v21;
  uint64_t v58 = (unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48);
  v59 = (void (**)(char *, void, uint64_t, uint64_t))(v2 + 56);
  uint64_t v55 = (void (**)(char *, uint64_t))(v2 + 8);
  char v25 = 1;
  uint64_t v60 = v15;
  do
  {
    if ((v25 & 1) != 0 && (uint64_t v26 = (uint64_t *)(v57 + *(int *)(v56 + 20)), (v26[1] & 1) == 0))
    {
      uint64_t v63 = *v26;
      sub_23792E5BC();
      sub_23796EC68();
      uint64_t v27 = v28;
    }
    else
    {
      uint64_t v27 = 0;
    }
    if ((unint64_t)v24 >= *(void *)(v65 + 16))
    {
      __break(1u);
      goto LABEL_19;
    }
    uint64_t v63 = qword_26EA95C78[(void)v24 + 4];
    sub_23792E5BC();
    swift_bridgeObjectRetain();
    sub_23796EC68();
    sub_23796E348();
    (*v59)(v8, 0, 1, v61);
    if (v27)
    {
      uint64_t v29 = (void *)sub_23796EA68();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v29 = 0;
    }
    int v30 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    uint64_t v31 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    uint64_t v32 = v61;
    if ((*v58)(v8, 1, v61) == 1)
    {
      uint64_t v33 = 0;
    }
    else
    {
      uint64_t v33 = (void *)sub_23796E338();
      (*v55)(v8, v32);
    }
    objc_msgSend(objc_allocWithZone(MEMORY[0x263F58068]), sel_initWithTopString_middleString_bottomString_isDay_timeZone_, v29, v30, v31, 1, v33);

    MEMORY[0x237E25BF0]();
    if (*(void *)((v64 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v64 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_23796EB38();
    }
    ++v24;
    sub_23796EB58();
    sub_23796EB28();
    char v25 = 0;
    v23 += 16;
    BOOL v15 = v60;
  }
  while (v24 != (char *)7);
  id v34 = objc_allocWithZone(MEMORY[0x263F58060]);
  sub_237933904();
  uint64_t v35 = (void *)sub_23796EB08();
  swift_bridgeObjectRelease();
  uint64_t v24 = (char *)objc_msgSend(v34, sel_initWithEntries_, v35);

  uint64_t v36 = sub_23792E094((uint64_t)v18);
  sub_23792D380(v36);
  if (qword_2689370E0 == -1) {
    goto LABEL_17;
  }
LABEL_19:
  swift_once();
LABEL_17:
  id v37 = (id)qword_268937660;
  uint64_t v38 = (void *)sub_23796EA68();
  uint64_t v39 = (void *)sub_23796EA68();
  id v40 = objc_msgSend(v37, sel_localizedStringForKey_value_table_, v38, 0, v39);

  sub_23796EA98();
  sub_23796E348();
  uint64_t v41 = v50;
  sub_23796E2C8();
  sub_23796E2B8();
  (*(void (**)(char *, uint64_t))(v51 + 8))(v41, v53);
  uint64_t v42 = (uint64_t)v52;
  sub_23796E8A8();
  sub_237929244(v57);
  uint64_t v43 = (char *)v54;
  char *v54 = v24;
  id v44 = (int *)type metadata accessor for UVRectangularTemplateModel();
  sub_237935F78((uint64_t)v18, (uint64_t)&v43[v44[5]], (uint64_t (*)(void))type metadata accessor for UVTemplateModel);
  (*(void (**)(char *, char *, uint64_t))(v47 + 32))(&v43[v44[6]], v15, v48);
  sub_237935F78(v42, (uint64_t)&v43[v44[7]], MEMORY[0x263F580A0]);
  return swift_bridgeObjectRelease();
}

uint64_t sub_237934AB4(uint64_t a1, uint64_t *a2)
{
  if (qword_2689370C8 != -1) {
    swift_once();
  }
  uint64_t v3 = (void *)*((void *)off_2689374D8 + 2);
  swift_retain();
  uint64_t v4 = (void *)sub_23796E228();
  id v5 = objc_msgSend(v3, sel_stringFromDate_, v4);

  uint64_t v6 = sub_23796EA98();
  uint64_t v8 = v7;
  swift_release();

  uint64_t v9 = (void *)*a2;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *a2 = (uint64_t)v9;
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_237933944(0, v9[2] + 1, 1, v9);
    uint64_t v9 = (void *)result;
    *a2 = result;
  }
  unint64_t v12 = v9[2];
  unint64_t v11 = v9[3];
  if (v12 >= v11 >> 1)
  {
    uint64_t result = (uint64_t)sub_237933944((void *)(v11 > 1), v12 + 1, 1, v9);
    uint64_t v9 = (void *)result;
    *a2 = result;
  }
  v9[2] = v12 + 1;
  uint64_t v13 = &v9[2 * v12];
  v13[4] = v6;
  v13[5] = v8;
  return result;
}

uint64_t sub_237934BEC(uint64_t a1)
{
  uint64_t result = sub_2379372E4(&qword_268937528, (void (*)(uint64_t))type metadata accessor for UVRectangularTemplateModel);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata accessor for UVRectangularTemplateModel()
{
  uint64_t result = qword_268937540;
  if (!qword_268937540) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_237934C90(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = sub_2379265BC(&qword_268937268);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2689370C8 != -1) {
    swift_once();
  }
  uint64_t v7 = (void *)*((void *)off_2689374D8 + 2);
  swift_retain();
  uint64_t v8 = (void *)sub_23796E228();
  id v9 = objc_msgSend(v7, sel_stringFromDate_, v8);

  sub_23796EA98();
  swift_release();

  sub_23796E348();
  uint64_t v10 = sub_23796E358();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v6, 0, 1, v10);
  unint64_t v12 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  uint64_t v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v6, 1, v10) != 1)
  {
    uint64_t v13 = (void *)sub_23796E338();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v10);
  }
  objc_msgSend(objc_allocWithZone(MEMORY[0x263F58068]), sel_initWithTopString_middleString_bottomString_isDay_timeZone_, 0, 0, v12, 1, v13);

  MEMORY[0x237E25BF0]();
  if (*(void *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_23796EB38();
  }
  sub_23796EB58();
  return sub_23796EB28();
}

uint64_t sub_237934EF4(unint64_t a1, int a2)
{
  LODWORD(v126) = a2;
  uint64_t v3 = sub_2379265BC(&qword_268937268);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v97 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v120 = sub_23796E858();
  uint64_t v108 = *(void (***)(char *, uint64_t))(v120 - 8);
  MEMORY[0x270FA5388](v120);
  uint64_t v119 = (char *)&v97 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v123 = sub_23796E3A8();
  uint64_t v118 = *(void *)(v123 - 8);
  MEMORY[0x270FA5388](v123);
  uint64_t v122 = (char *)&v97 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v125 = sub_2379265BC(&qword_268937530);
  uint64_t v107 = *(unsigned int (***)(char *, uint64_t, uint64_t))(v125 - 8);
  MEMORY[0x270FA5388](v125);
  uint64_t v117 = (char *)&v97 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2379265BC(&qword_268937538);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v124 = (char *)&v97 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v121 = (char *)&v97 - v12;
  uint64_t v13 = sub_23796E358();
  uint64_t v128 = *(void *)(v13 - 8);
  uint64_t v129 = v13;
  MEMORY[0x270FA5388](v13);
  v127 = (char *)&v97 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_2379265BC(&qword_268937508);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v97 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v111 = sub_23796E448();
  uint64_t v110 = *(void *)(v111 - 8);
  MEMORY[0x270FA5388](v111);
  id v113 = (char *)&v97 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_2379265BC(&qword_268937478);
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  uint64_t v22 = (char *)&v97 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  char v25 = (char *)&v97 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v97 - v26;
  uint64_t v28 = sub_23796E2A8();
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  uint64_t v32 = (char *)&v97 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v30);
  id v34 = (char *)&v97 - v33;
  (*(void (**)(char *, unint64_t, uint64_t))(v29 + 16))((char *)&v97 - v33, a1, v28);
  if (v126)
  {
    uint64_t v35 = type metadata accessor for UVRectangularTemplateModel();
    uint64_t v131 = MEMORY[0x263F8EE78];
    uint64_t v36 = sub_23796E1F8();
    MEMORY[0x270FA5388](v36);
    *(&v97 - 2) = v35;
    *(&v97 - 1) = (uint64_t)&v131;
    sub_23796E248();
    id v37 = *(void (**)(char *, uint64_t))(v29 + 8);
    v37(v32, v28);
    id v38 = objc_allocWithZone(MEMORY[0x263F58060]);
    sub_237933904();
    uint64_t v39 = (void *)sub_23796EB08();
    swift_bridgeObjectRelease();
    id v40 = objc_msgSend(v38, sel_initWithEntries_, v39);

    v37(v34, v28);
    return (uint64_t)v40;
  }
  uint64_t v115 = v5;
  uint64_t v112 = v34;
  uint64_t v116 = type metadata accessor for TemplateData();
  uint64_t v41 = *(int *)(v116 + 20);
  unint64_t v126 = a1;
  sub_237935E98(a1 + v41, (uint64_t)v27);
  uint64_t v109 = v27;
  sub_237935E98((uint64_t)v27, (uint64_t)v25);
  uint64_t v42 = sub_23796E508();
  uint64_t v43 = *(void *)(v42 - 8);
  id v44 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v43 + 48);
  if (v44(v25, 1, v42) == 1)
  {
    sub_23792673C((uint64_t)v25, &qword_268937478);
LABEL_9:
    uint64_t v46 = v112;
LABEL_12:
    uint64_t v50 = type metadata accessor for UVRectangularTemplateModel();
    uint64_t v131 = MEMORY[0x263F8EE78];
    uint64_t v51 = sub_23796E1F8();
    MEMORY[0x270FA5388](v51);
    *(&v97 - 2) = v50;
    *(&v97 - 1) = (uint64_t)&v131;
    sub_23796E248();
    uint64_t v52 = *(void (**)(char *, uint64_t))(v29 + 8);
    v52(v32, v28);
    id v53 = objc_allocWithZone(MEMORY[0x263F58060]);
    sub_237933904();
    unint64_t v54 = (void *)sub_23796EB08();
    swift_bridgeObjectRelease();
    id v40 = objc_msgSend(v53, sel_initWithEntries_, v54);

    sub_23792673C((uint64_t)v109, &qword_268937478);
    v52(v46, v28);
    return (uint64_t)v40;
  }
  uint64_t v114 = v28;
  uint64_t v45 = sub_23796E468();
  uint64_t v106 = *(void (***)(unint64_t *, uint64_t, uint64_t, uint64_t))(v43 + 8);
  ((void (*)(char *, uint64_t))v106)(v25, v42);
  if (*(void *)(v45 + 16) != 7)
  {
    swift_bridgeObjectRelease();
    uint64_t v28 = v114;
    goto LABEL_9;
  }
  uint64_t v99 = v45;
  sub_237935E98((uint64_t)v109, (uint64_t)v22);
  if (v44(v22, 1, v42) == 1)
  {
    sub_23792673C((uint64_t)v22, &qword_268937478);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v110 + 56))(v17, 1, 1, v111);
    uint64_t v28 = v114;
    uint64_t v46 = v112;
LABEL_11:
    swift_bridgeObjectRelease();
    sub_23792673C((uint64_t)v17, &qword_268937508);
    goto LABEL_12;
  }
  uint64_t v46 = v112;
  sub_23796E478();
  ((void (*)(char *, uint64_t))v106)(v22, v42);
  uint64_t v47 = v110;
  uint64_t v48 = v111;
  int v49 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v110 + 48))(v17, 1, v111);
  uint64_t v28 = v114;
  if (v49 == 1) {
    goto LABEL_11;
  }
  (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v113, v17, v48);
  uint64_t v131 = MEMORY[0x263F8EE78];
  unint64_t v56 = v126 + *(int *)(v116 + 24);
  unint64_t v57 = v56 + *(int *)(sub_23796E8C8() + 24);
  uint64_t v58 = v128 + 16;
  v105 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v128 + 16);
  uint64_t result = v105(v127, v57, v129);
  unint64_t v59 = 0;
  uint64_t v60 = *(void *)(v99 + 16);
  uint64_t v97 = v118 + 16;
  uint64_t v116 = v118 + 32;
  uint64_t v106 = (void (**)(unint64_t *, uint64_t, uint64_t, uint64_t))(v107 + 7);
  v107 += 6;
  id v100 = v108 + 1;
  uint64_t v108 = (void (**)(char *, uint64_t))(v29 + 8);
  uint64_t v103 = (void (**)(char *, void, uint64_t, uint64_t))(v58 + 40);
  id v102 = (uint64_t (**)(char *, uint64_t, uint64_t))(v58 + 32);
  uint64_t v128 = v58;
  uint64_t v98 = (void (**)(char *, uint64_t))(v58 - 8);
  uint64_t v101 = (uint64_t (**)(char *, uint64_t))(v118 + 8);
  id v62 = v122;
  uint64_t v61 = v123;
  uint64_t v64 = (unint64_t *)v124;
  uint64_t v63 = v125;
  uint64_t v104 = v60;
  if (v60) {
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v65 = 1;
  for (uint64_t i = v60; ; uint64_t i = v126)
  {
    (*v106)(v64, v65, 1, v63);
    uint64_t v74 = v121;
    sub_237935F08((uint64_t)v64, (uint64_t)v121);
    if ((*v107)(v74, 1, v63) == 1)
    {
      swift_bridgeObjectRelease();
      id v95 = objc_allocWithZone(MEMORY[0x263F58060]);
      sub_237933904();
      uint64_t v96 = (void *)sub_23796EB08();
      swift_bridgeObjectRelease();
      id v40 = objc_msgSend(v95, sel_initWithEntries_, v96, v97);

      (*v98)(v127, v129);
      (*(void (**)(char *, uint64_t))(v110 + 8))(v113, v111);
      sub_23792673C((uint64_t)v109, &qword_268937478);
      (*v108)(v112, v28);
      return (uint64_t)v40;
    }
    unint64_t v126 = i;
    uint64_t v75 = *(void *)v74;
    (*(void (**)(char *, char *, uint64_t))v116)(v62, &v74[*(int *)(v63 + 48)], v61);
    if (v75)
    {
      uint64_t v76 = 0;
      uint64_t v78 = v119;
      uint64_t v77 = v120;
      uint64_t v79 = v100;
    }
    else
    {
      uint64_t v78 = v119;
      sub_23796E428();
      uint64_t v80 = sub_23796E838();
      uint64_t v79 = v100;
      uint64_t v77 = v120;
      (*v100)(v78, v120);
      uint64_t v130 = v80;
      sub_23792E5BC();
      sub_23796EC68();
      uint64_t v76 = v81;
    }
    sub_23796E398();
    uint64_t v82 = sub_23796E838();
    (*v79)(v78, v77);
    uint64_t v130 = v82;
    sub_23792E5BC();
    sub_23796EC68();
    if (qword_2689370C8 != -1) {
      swift_once();
    }
    uint64_t v83 = off_2689374D8;
    swift_retain();
    sub_23796E388();
    uint64_t v84 = (void *)v83[2];
    uint64_t v85 = (void *)sub_23796E228();
    id v86 = objc_msgSend(v84, sel_stringFromDate_, v85, v97);

    sub_23796EA98();
    swift_release();

    uint64_t v28 = v114;
    (*v108)(v32, v114);
    uint64_t v87 = v115;
    uint64_t v88 = v129;
    v105(v115, (unint64_t)v127, v129);
    (*v103)(v87, 0, 1, v88);
    if (v76)
    {
      uint64_t v89 = (void *)sub_23796EA68();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v89 = 0;
    }
    char v90 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    uint64_t v91 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    uint64_t v92 = v129;
    int v93 = (*v102)(v87, 1, v129);
    uint64_t v64 = (unint64_t *)v124;
    if (v93 == 1)
    {
      uint64_t v94 = 0;
    }
    else
    {
      uint64_t v94 = (void *)sub_23796E338();
      (*v98)(v87, v92);
    }
    id v62 = v122;
    uint64_t v61 = v123;
    objc_msgSend(objc_allocWithZone(MEMORY[0x263F58068]), sel_initWithTopString_middleString_bottomString_isDay_timeZone_, v89, v90, v91, 1, v94);

    MEMORY[0x237E25BF0]();
    if (*(void *)((v131 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v131 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_23796EB38();
    }
    sub_23796EB58();
    sub_23796EB28();
    uint64_t result = (*v101)(v62, v61);
    uint64_t v63 = v125;
    unint64_t v59 = v126;
    uint64_t v60 = v104;
    if (v126 == v104) {
      goto LABEL_15;
    }
LABEL_16:
    if (v59 >= *(void *)(v99 + 16)) {
      break;
    }
    unint64_t v126 = v59 + 1;
    v67 = v62;
    uint64_t v68 = v28;
    id v69 = v32;
    unint64_t v70 = v59;
    uint64_t v71 = v118;
    uint64_t v72 = &v117[*(int *)(v63 + 48)];
    (*(void (**)(char *, unint64_t, uint64_t))(v118 + 16))(v72, v99+ ((*(unsigned __int8 *)(v71 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v71 + 80))+ *(void *)(v71 + 72) * v59, v61);
    uint64_t v73 = (char *)v64 + *(int *)(v63 + 48);
    unint64_t *v64 = v70;
    uint64_t v32 = v69;
    uint64_t v28 = v68;
    id v62 = v67;
    (*(void (**)(char *, char *, uint64_t))(v71 + 32))(v73, v72, v61);
    uint64_t v65 = 0;
  }
  __break(1u);
  return result;
}

uint64_t sub_237935E98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2379265BC(&qword_268937478);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_237935F00(uint64_t a1)
{
  return sub_237934C90(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_237935F08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2379265BC(&qword_268937538);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_237935F70(uint64_t a1)
{
  return sub_237934AB4(a1, *(uint64_t **)(v1 + 16));
}

uint64_t sub_237935F78(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void **sub_237935FE0(void **a1, void **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    uint64_t v6 = a3[5];
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v45 = sub_23796E2A8();
    id v44 = *(void (**)(char *, char *, uint64_t))(*(void *)(v45 - 8) + 16);
    uint64_t v9 = v4;
    v44(v7, v8, v45);
    uint64_t v10 = (int *)type metadata accessor for UVTemplateModel();
    uint64_t v11 = v10[5];
    uint64_t v12 = &v7[v11];
    uint64_t v13 = &v8[v11];
    *(void *)uint64_t v12 = *(void *)v13;
    v12[8] = v13[8];
    uint64_t v14 = v10[6];
    uint64_t v15 = &v7[v14];
    uint64_t v16 = &v8[v14];
    uint64_t v43 = *((void *)v16 + 1);
    *(void *)uint64_t v15 = *(void *)v16;
    *((void *)v15 + 1) = v43;
    uint64_t v17 = v10[7];
    uint64_t v18 = &v7[v17];
    uint64_t v19 = &v8[v17];
    uint64_t v20 = *(void *)&v8[v17 + 8];
    *(void *)uint64_t v18 = *(void *)&v8[v17];
    *((void *)v18 + 1) = v20;
    uint64_t v42 = *(void *)&v8[v17 + 24];
    *((void *)v18 + 2) = *(void *)&v8[v17 + 16];
    *((void *)v18 + 3) = v42;
    uint64_t v21 = (int *)sub_23796E8C8();
    uint64_t v22 = v21[6];
    id v40 = &v19[v22];
    uint64_t v41 = &v18[v22];
    uint64_t v23 = sub_23796E358();
    uint64_t v24 = *(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v24(v41, v40, v23);
    v18[v21[7]] = v19[v21[7]];
    *(_OWORD *)&v18[v21[8]] = *(_OWORD *)&v19[v21[8]];
    uint64_t v25 = v10[8];
    uint64_t v26 = *(void **)&v8[v25];
    *(void *)&v7[v25] = v26;
    *(void *)&v7[v10[9]] = *(void *)&v8[v10[9]];
    *(void *)&v7[v10[10]] = *(void *)&v8[v10[10]];
    uint64_t v27 = a3[6];
    uint64_t v28 = (char *)v5 + v27;
    uint64_t v29 = (char *)a2 + v27;
    id v30 = v26;
    swift_bridgeObjectRetain();
    v44(v28, v29, v45);
    uint64_t v31 = a3[7];
    uint64_t v32 = (void **)((char *)v5 + v31);
    uint64_t v33 = (char *)a2 + v31;
    uint64_t v34 = *(uint64_t *)((char *)a2 + v31 + 8);
    void *v32 = *(void **)((char *)a2 + v31);
    v32[1] = v34;
    uint64_t v35 = *(uint64_t *)((char *)a2 + v31 + 24);
    _OWORD v32[2] = *(void **)((char *)a2 + v31 + 16);
    v32[3] = v35;
    uint64_t v36 = v21[6];
    id v37 = (char *)v32 + v36;
    id v38 = &v33[v36];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v24(v37, v38, v23);
    *((unsigned char *)v32 + v21[7]) = v33[v21[7]];
    *(_OWORD *)((char *)v32 + v21[8]) = *(_OWORD *)&v33[v21[8]];
  }
  return v5;
}

uint64_t sub_23793629C(id *a1, int *a2)
{
  uint64_t v4 = (char *)a1 + a2[5];
  uint64_t v5 = sub_23796E2A8();
  uint64_t v6 = *(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  uint64_t v7 = type metadata accessor for UVTemplateModel();
  swift_bridgeObjectRelease();
  uint64_t v8 = &v4[*(int *)(v7 + 28)];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_23796E8C8();
  uint64_t v10 = &v8[*(int *)(v9 + 24)];
  uint64_t v11 = sub_23796E358();
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v15)((void *)(v11 - 8), v10, v11);

  swift_bridgeObjectRelease();
  v6((char *)a1 + a2[6], v5);
  uint64_t v12 = (char *)a1 + a2[7];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v13 = &v12[*(int *)(v9 + 24)];

  return v15(v13, v11);
}

void **sub_237936430(void **a1, void **a2, int *a3)
{
  int v3 = *a2;
  *a1 = *a2;
  uint64_t v4 = a3[5];
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v43 = sub_23796E2A8();
  uint64_t v42 = *(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 16);
  id v7 = v3;
  v42(v5, v6, v43);
  uint64_t v8 = (int *)type metadata accessor for UVTemplateModel();
  uint64_t v9 = v8[5];
  uint64_t v10 = &v5[v9];
  uint64_t v11 = &v6[v9];
  *(void *)uint64_t v10 = *(void *)v11;
  v10[8] = v11[8];
  uint64_t v12 = v8[6];
  uint64_t v13 = &v5[v12];
  uint64_t v14 = &v6[v12];
  uint64_t v40 = *((void *)v14 + 1);
  *(void *)uint64_t v13 = *(void *)v14;
  *((void *)v13 + 1) = v40;
  uint64_t v15 = v8[7];
  uint64_t v16 = &v5[v15];
  uint64_t v17 = &v6[v15];
  uint64_t v18 = *(void *)&v6[v15 + 8];
  *(void *)uint64_t v16 = *(void *)&v6[v15];
  *((void *)v16 + 1) = v18;
  uint64_t v19 = *(void *)&v6[v15 + 24];
  *((void *)v16 + 2) = *(void *)&v6[v15 + 16];
  *((void *)v16 + 3) = v19;
  uint64_t v20 = (int *)sub_23796E8C8();
  uint64_t v21 = v20[6];
  id v38 = &v17[v21];
  uint64_t v39 = &v16[v21];
  uint64_t v22 = sub_23796E358();
  uint64_t v41 = *(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v41(v39, v38, v22);
  v16[v20[7]] = v17[v20[7]];
  *(_OWORD *)&v16[v20[8]] = *(_OWORD *)&v17[v20[8]];
  uint64_t v23 = v8[8];
  uint64_t v24 = *(void **)&v6[v23];
  *(void *)&v5[v23] = v24;
  *(void *)&v5[v8[9]] = *(void *)&v6[v8[9]];
  *(void *)&v5[v8[10]] = *(void *)&v6[v8[10]];
  uint64_t v25 = a3[6];
  uint64_t v26 = (char *)a1 + v25;
  uint64_t v27 = (char *)a2 + v25;
  id v28 = v24;
  swift_bridgeObjectRetain();
  v42(v26, v27, v43);
  uint64_t v29 = a3[7];
  id v30 = (void **)((char *)a1 + v29);
  uint64_t v31 = (char *)a2 + v29;
  uint64_t v32 = *(uint64_t *)((char *)a2 + v29 + 8);
  *id v30 = *(void **)((char *)a2 + v29);
  v30[1] = v32;
  uint64_t v33 = *(uint64_t *)((char *)a2 + v29 + 24);
  v30[2] = *(void **)((char *)a2 + v29 + 16);
  v30[3] = v33;
  uint64_t v34 = v20[6];
  uint64_t v35 = (char *)v30 + v34;
  uint64_t v36 = &v31[v34];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v41(v35, v36, v22);
  *((unsigned char *)v30 + v20[7]) = v31[v20[7]];
  *(_OWORD *)((char *)v30 + v20[8]) = *(_OWORD *)&v31[v20[8]];
  return a1;
}

void **sub_237936698(void **a1, void **a2, int *a3)
{
  uint64_t v4 = *a2;
  uint64_t v6 = *a1;
  *a1 = *a2;
  id v8 = v4;

  uint64_t v9 = a3[5];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v45 = sub_23796E2A8();
  id v44 = *(void (**)(char *, char *, uint64_t))(*(void *)(v45 - 8) + 24);
  v44(v10, v11, v45);
  uint64_t v12 = (int *)type metadata accessor for UVTemplateModel();
  uint64_t v13 = v12[5];
  uint64_t v14 = &v10[v13];
  uint64_t v15 = &v11[v13];
  char v16 = v15[8];
  *(void *)uint64_t v14 = *(void *)v15;
  v14[8] = v16;
  uint64_t v17 = v12[6];
  uint64_t v18 = &v10[v17];
  uint64_t v19 = &v11[v17];
  *(void *)uint64_t v18 = *(void *)v19;
  *((void *)v18 + 1) = *((void *)v19 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v20 = v12[7];
  uint64_t v21 = &v10[v20];
  uint64_t v22 = &v11[v20];
  *(void *)uint64_t v21 = *(void *)&v11[v20];
  *((void *)v21 + 1) = *(void *)&v11[v20 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v21 + 2) = *((void *)v22 + 2);
  *((void *)v21 + 3) = *((void *)v22 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v23 = (int *)sub_23796E8C8();
  uint64_t v24 = v23[6];
  uint64_t v25 = &v21[v24];
  uint64_t v26 = &v22[v24];
  uint64_t v42 = sub_23796E358();
  uint64_t v27 = *(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 24);
  v27(v25, v26, v42);
  v21[v23[7]] = v22[v23[7]];
  uint64_t v28 = v23[8];
  uint64_t v29 = &v21[v28];
  id v30 = &v22[v28];
  *(void *)uint64_t v29 = *(void *)v30;
  *((void *)v29 + 1) = *((void *)v30 + 1);
  uint64_t v31 = v12[8];
  uint64_t v32 = *(void **)&v10[v31];
  uint64_t v33 = *(void **)&v11[v31];
  *(void *)&v10[v31] = v33;
  id v34 = v33;

  *(void *)&v10[v12[9]] = *(void *)&v11[v12[9]];
  *(void *)&v10[v12[10]] = *(void *)&v11[v12[10]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v44((char *)a1 + a3[6], (char *)a2 + a3[6], v45);
  uint64_t v35 = a3[7];
  uint64_t v36 = (char *)a1 + v35;
  id v37 = (char *)a2 + v35;
  *(void *)uint64_t v36 = *(void **)((char *)a2 + v35);
  *((void *)v36 + 1) = *(void **)((char *)a2 + v35 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v36 + 2) = *((void *)v37 + 2);
  *((void *)v36 + 3) = *((void *)v37 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v27(&v36[v23[6]], &v37[v23[6]], v42);
  v36[v23[7]] = v37[v23[7]];
  uint64_t v38 = v23[8];
  uint64_t v39 = &v36[v38];
  uint64_t v40 = &v37[v38];
  *(void *)uint64_t v39 = *(void *)v40;
  *((void *)v39 + 1) = *((void *)v40 + 1);
  return a1;
}

char *sub_237936970(char *a1, char *a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = a3[5];
  uint64_t v4 = &a1[v3];
  uint64_t v5 = &a2[v3];
  uint64_t v27 = sub_23796E2A8();
  uint64_t v26 = *(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 32);
  v26(v4, v5, v27);
  uint64_t v6 = (int *)type metadata accessor for UVTemplateModel();
  uint64_t v7 = v6[5];
  id v8 = &v4[v7];
  uint64_t v9 = &v5[v7];
  *(void *)id v8 = *(void *)v9;
  v8[8] = v9[8];
  *(_OWORD *)&v4[v6[6]] = *(_OWORD *)&v5[v6[6]];
  uint64_t v10 = v6[7];
  uint64_t v11 = &v4[v10];
  uint64_t v12 = &v5[v10];
  long long v13 = *(_OWORD *)&v5[v10 + 16];
  *(_OWORD *)uint64_t v11 = *(_OWORD *)&v5[v10];
  *((_OWORD *)v11 + 1) = v13;
  uint64_t v14 = (int *)sub_23796E8C8();
  uint64_t v15 = v14[6];
  uint64_t v24 = &v11[v15];
  char v16 = &v12[v15];
  uint64_t v17 = sub_23796E358();
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32);
  v18(v24, v16, v17);
  v11[v14[7]] = v12[v14[7]];
  *(_OWORD *)&v11[v14[8]] = *(_OWORD *)&v12[v14[8]];
  *(void *)&v4[v6[8]] = *(void *)&v5[v6[8]];
  *(void *)&v4[v6[9]] = *(void *)&v5[v6[9]];
  *(void *)&v4[v6[10]] = *(void *)&v5[v6[10]];
  v26(&a1[a3[6]], &a2[a3[6]], v27);
  uint64_t v19 = a3[7];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  long long v22 = *(_OWORD *)&a2[v19 + 16];
  *(_OWORD *)uint64_t v20 = *(_OWORD *)&a2[v19];
  *((_OWORD *)v20 + 1) = v22;
  v18(&a1[v19 + v14[6]], &a2[v19 + v14[6]], v17);
  v20[v14[7]] = v21[v14[7]];
  *(_OWORD *)&v20[v14[8]] = *(_OWORD *)&v21[v14[8]];
  return a1;
}

void **sub_237936B68(void **a1, void **a2, int *a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = a3[5];
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v40 = sub_23796E2A8();
  uint64_t v39 = *(void (**)(char *, char *, uint64_t))(*(void *)(v40 - 8) + 40);
  v39(v8, v9, v40);
  uint64_t v10 = (int *)type metadata accessor for UVTemplateModel();
  uint64_t v11 = v10[5];
  uint64_t v12 = &v8[v11];
  long long v13 = &v9[v11];
  *(void *)uint64_t v12 = *(void *)v13;
  v12[8] = v13[8];
  uint64_t v14 = v10[6];
  uint64_t v15 = &v8[v14];
  char v16 = &v9[v14];
  uint64_t v18 = *(void *)v16;
  uint64_t v17 = *((void *)v16 + 1);
  *(void *)uint64_t v15 = v18;
  *((void *)v15 + 1) = v17;
  swift_bridgeObjectRelease();
  uint64_t v19 = v10[7];
  uint64_t v20 = &v8[v19];
  uint64_t v21 = &v9[v19];
  uint64_t v22 = *(void *)&v9[v19 + 8];
  *(void *)uint64_t v20 = *(void *)&v9[v19];
  *((void *)v20 + 1) = v22;
  swift_bridgeObjectRelease();
  uint64_t v23 = *((void *)v21 + 3);
  *((void *)v20 + 2) = *((void *)v21 + 2);
  *((void *)v20 + 3) = v23;
  swift_bridgeObjectRelease();
  uint64_t v24 = (int *)sub_23796E8C8();
  uint64_t v25 = v24[6];
  uint64_t v26 = &v20[v25];
  uint64_t v27 = &v21[v25];
  uint64_t v37 = sub_23796E358();
  uint64_t v28 = *(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 40);
  v28(v26, v27, v37);
  v20[v24[7]] = v21[v24[7]];
  *(_OWORD *)&v20[v24[8]] = *(_OWORD *)&v21[v24[8]];
  uint64_t v29 = v10[8];
  id v30 = *(void **)&v8[v29];
  *(void *)&v8[v29] = *(void *)&v9[v29];

  *(void *)&v8[v10[9]] = *(void *)&v9[v10[9]];
  *(void *)&v8[v10[10]] = *(void *)&v9[v10[10]];
  swift_bridgeObjectRelease();
  v39((char *)a1 + a3[6], (char *)a2 + a3[6], v40);
  uint64_t v31 = a3[7];
  uint64_t v32 = (char *)a1 + v31;
  uint64_t v33 = (char *)a2 + v31;
  uint64_t v34 = *(uint64_t *)((char *)a2 + v31 + 8);
  *(void *)uint64_t v32 = *(void **)((char *)a2 + v31);
  *((void *)v32 + 1) = v34;
  swift_bridgeObjectRelease();
  uint64_t v35 = *((void *)v33 + 3);
  *((void *)v32 + 2) = *((void *)v33 + 2);
  *((void *)v32 + 3) = v35;
  swift_bridgeObjectRelease();
  v28(&v32[v24[6]], &v33[v24[6]], v37);
  v32[v24[7]] = v33[v24[7]];
  *(_OWORD *)&v32[v24[8]] = *(_OWORD *)&v33[v24[8]];
  return a1;
}

uint64_t sub_237936DC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_237936DD4);
}

uint64_t sub_237936DD4(char *a1, uint64_t a2, int *a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *(void *)a1;
    if (*(void *)a1 >= 0xFFFFFFFFuLL) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  uint64_t v8 = type metadata accessor for UVTemplateModel();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a2)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a3[5];
LABEL_9:
    long long v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
    return v13(&a1[v11], a2, v9);
  }
  uint64_t v12 = sub_23796E2A8();
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a3[6];
    goto LABEL_9;
  }
  uint64_t v14 = sub_23796E8C8();
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = &a1[a3[7]];

  return v15(v17, a2, v16);
}

uint64_t sub_237936F4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_237936F60);
}

char *sub_237936F60(char *result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)uint64_t result = (a2 - 1);
    return result;
  }
  uint64_t v8 = type metadata accessor for UVTemplateModel();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[5];
LABEL_7:
    long long v13 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return (char *)v13(&v5[v11], a2, a2, v9);
  }
  uint64_t v12 = sub_23796E2A8();
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[6];
    goto LABEL_7;
  }
  uint64_t v14 = sub_23796E8C8();
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  uint64_t v16 = v14;
  uint64_t v17 = &v5[a4[7]];

  return (char *)v15(v17, a2, a2, v16);
}

uint64_t sub_2379370D8()
{
  uint64_t result = type metadata accessor for UVTemplateModel();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_23796E2A8();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_23796E8C8();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_2379371EC()
{
  return sub_2379372E4(&qword_268937330, (void (*)(uint64_t))type metadata accessor for UVTemplateModel);
}

uint64_t sub_237937234(uint64_t a1)
{
  uint64_t result = sub_2379372E4((unint64_t *)&unk_2689377D0, (void (*)(uint64_t))type metadata accessor for UVRectangularTemplateModel);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23793728C(uint64_t a1)
{
  uint64_t result = sub_2379372E4(&qword_268937550, (void (*)(uint64_t))type metadata accessor for UVRectangularTemplateModel);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2379372E4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_237937330()
{
  type metadata accessor for WeatherTemplateFormatter();
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = *(void *)sub_23796E968();
  uint64_t v2 = sub_237939304(&qword_268937568, v1, (void (*)(uint64_t))type metadata accessor for WeatherTemplateFormatter);
  *(void *)&xmmword_268939440 = v0;
  *((void *)&xmmword_268939440 + 1) = v2;

  return swift_retain();
}

id sub_2379373C0(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for WeatherTemplateModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(**(void **)(v1 + 16) + 152))(a1 + *(int *)(v3 + 24), 1, 2);
  uint64_t v4 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(self, sel_textProviderWithText_, v4);

  uint64_t v6 = self;
  id v7 = v5;
  id v8 = objc_msgSend(v6, sel_systemCyanColor);
  objc_msgSend(v7, sel_setTintColor_, v8);

  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD120]), sel_initWithTextProvider_, v7);
  id v10 = objc_msgSend(v6, sel_systemCyanColor);
  objc_msgSend(v9, sel_setTintColor_, v10);

  return v9;
}

id sub_23793751C(uint64_t a1)
{
  uint64_t v2 = sub_2379265BC(&qword_268937570);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v75 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_23796E5E8();
  uint64_t v86 = *(void *)(v5 - 8);
  uint64_t v87 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v84 = (char *)&v75 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2379265BC(&qword_268937360);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v78 = (uint64_t)&v75 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v83 = (uint64_t)&v75 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v80 = (char *)&v75 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v75 - v14;
  uint64_t v16 = sub_2379265BC(&qword_268937368);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v77 = (char *)&v75 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v79 = (char *)&v75 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v75 - v22;
  uint64_t v24 = (int *)type metadata accessor for WeatherTemplateModel();
  MEMORY[0x270FA5388](v24);
  uint64_t v26 = (char *)&v75 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_237939228(a1, (uint64_t)v26);
  uint64_t v27 = &v26[v24[5]];
  char v28 = sub_2379506F4();
  uint64_t v29 = (void *)sub_237955398(v27, v28 & 1);
  id v30 = objc_msgSend(self, sel_systemCyanColor);
  uint64_t v88 = v29;
  objc_msgSend(v29, sel_setTintColor_, v30);

  uint64_t v31 = v16;
  uint64_t v32 = v17;
  uint64_t v33 = a1;
  sub_23793934C((uint64_t)v26);
  sub_2379266D8(a1 + v24[6], (uint64_t)v15, &qword_268937360);
  uint64_t v82 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48);
  unsigned int v34 = v82(v15, 1, v31);
  uint64_t v85 = v32;
  if (v34 == 1)
  {
    uint64_t v35 = &qword_268937360;
    uint64_t v36 = (uint64_t)v15;
LABEL_5:
    sub_23792673C(v36, v35);
    goto LABEL_9;
  }
  (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v23, v15, v31);
  sub_2379266D8(a1 + v24[7], (uint64_t)v4, &qword_268937570);
  uint64_t v38 = v86;
  uint64_t v37 = v87;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v86 + 48))(v4, 1, v87) == 1)
  {
    (*(void (**)(char *, uint64_t))(v32 + 8))(v23, v31);
    uint64_t v35 = &qword_268937570;
    uint64_t v36 = (uint64_t)v4;
    goto LABEL_5;
  }
  (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v84, v4, v37);
  uint64_t v39 = (uint64_t)v80;
  (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v80, v23, v31);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v32 + 56))(v39, 0, 1, v31);
  uint64_t v76 = v23;
  uint64_t v40 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(**(void **)(v81 + 16) + 152))(v39, 1, 2);
  uint64_t v42 = v41;
  sub_23792673C(v39, &qword_268937360);
  uint64_t v81 = v31;
  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v43 = (id)qword_268937660;
  id v44 = (void *)sub_23796EA68();
  uint64_t v45 = (void *)sub_23796EA68();
  id v46 = objc_msgSend(v43, sel_localizedStringForKey_value_table_, v44, 0, v45);

  uint64_t v80 = (char *)sub_23796EA98();
  sub_2379265BC((uint64_t *)&unk_268937390);
  uint64_t v47 = swift_allocObject();
  *(_OWORD *)(v47 + 16) = xmmword_237971400;
  *(void *)(v47 + 56) = MEMORY[0x263F8D310];
  unint64_t v48 = sub_23792918C();
  *(void *)(v47 + 64) = v48;
  *(void *)(v47 + 32) = v40;
  *(void *)(v47 + 40) = v42;
  swift_bridgeObjectRetain();
  int v49 = v84;
  uint64_t v50 = sub_23796E5C8();
  *(void *)(v47 + 96) = MEMORY[0x263F8D310];
  *(void *)(v47 + 104) = v48;
  *(void *)(v47 + 72) = v50;
  *(void *)(v47 + 80) = v51;
  sub_23796EAA8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v86 + 8))(v49, v87);
  uint64_t v31 = v81;
  (*(void (**)(char *, uint64_t))(v85 + 8))(v76, v81);
LABEL_9:
  uint64_t v52 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v53 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  unint64_t v54 = self;
  id v55 = objc_msgSend(v54, sel_textProviderWithText_shortText_, v52, v53);

  if (*(void *)(v33 + v24[10] + 8))
  {
    swift_bridgeObjectRetain();
    unint64_t v56 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    id v57 = objc_msgSend(v54, sel_textProviderWithText_, v56);
  }
  else
  {
    uint64_t v58 = v83;
    sub_2379266D8(v33 + v24[8], v83, &qword_268937360);
    unint64_t v59 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v82;
    if (v82((char *)v58, 1, v31) == 1)
    {
      uint64_t v60 = v58;
    }
    else
    {
      uint64_t v61 = *(void (**)(char *, uint64_t, uint64_t))(v85 + 32);
      uint64_t v62 = v33;
      uint64_t v63 = (uint64_t)v79;
      v61(v79, v58, v31);
      uint64_t v64 = v62 + v24[9];
      uint64_t v60 = v78;
      sub_2379266D8(v64, v78, &qword_268937360);
      if (v59(v60, 1, v31) != 1)
      {
        uint64_t v70 = (uint64_t)v77;
        v61(v77, v60, v31);
        sub_237938A78(v63, v70, 0xD000000000000029, 0x8000000237970020);
        uint64_t v71 = (void *)sub_23796EA68();
        swift_bridgeObjectRelease();
        id v72 = objc_msgSend(v54, sel_textProviderWithText_, v71);

        id v65 = v72;
        sub_237938A78(v63, v70, 0xD000000000000019, 0x800000023796FB00);
        uint64_t v73 = (void *)sub_23796EA68();
        swift_bridgeObjectRelease();
        objc_msgSend(v65, sel_setAccessibilityLabel_, v73);

        objc_msgSend(v65, sel_setItalicized_, sub_237938D74() & 1);
        uint64_t v74 = *(void (**)(uint64_t, uint64_t))(v85 + 8);
        v74(v70, v31);
        v74(v63, v31);
        goto LABEL_17;
      }
      (*(void (**)(uint64_t, uint64_t))(v85 + 8))(v63, v31);
    }
    sub_23792673C(v60, &qword_268937360);
    unint64_t v56 = (void *)sub_23796EA68();
    id v57 = objc_msgSend(v54, sel_textProviderWithText_, v56);
  }
  id v65 = v57;

LABEL_17:
  id v66 = objc_allocWithZone(MEMORY[0x263EFD0F8]);
  v67 = v88;
  id v68 = objc_msgSend(v66, sel_initWithHeaderTextProvider_body1TextProvider_body2TextProvider_, v88, v55, v65);

  return v68;
}

id sub_237937EDC(uint64_t a1)
{
  uint64_t v3 = sub_2379265BC(&qword_268937570);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v24 - v7;
  uint64_t v9 = type metadata accessor for WeatherTemplateModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(**(void **)(v1 + 16) + 152))(a1 + *(int *)(v9 + 24), 1, 2);
  uint64_t v10 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(self, sel_textProviderWithText_, v10);

  uint64_t v12 = a1 + *(int *)(v9 + 28);
  sub_2379266D8(v12, (uint64_t)v8, &qword_268937570);
  uint64_t v13 = sub_23796E5E8();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  if (v15(v8, 1, v13) == 1)
  {
    sub_23792673C((uint64_t)v8, &qword_268937570);
  }
  else
  {
    sub_23796E5A8();
    uint64_t v17 = v16;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v13);
    if (v17) {
      goto LABEL_5;
    }
  }
  swift_bridgeObjectRelease();
LABEL_5:
  uint64_t v18 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v19 = objc_msgSend(self, sel_symbolImageProviderWithSystemName_, v18);

  sub_2379266D8(v12, (uint64_t)v6, &qword_268937570);
  LODWORD(v18) = v15(v6, 1, v13);
  id v20 = v19;
  if (v18 == 1)
  {
    sub_23792673C((uint64_t)v6, &qword_268937570);
    uint64_t v21 = 0;
  }
  else
  {
    sub_23796E5D8();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v6, v13);
    uint64_t v21 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v20, sel_setAccessibilityLabel_, v21);

  id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD148]), sel_initWithTextProvider_imageProvider_, v11, v20);
  return v22;
}

id sub_237938210(uint64_t a1)
{
  uint64_t v2 = sub_2379265BC(&qword_268937360);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v50 = (char *)v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v48 - v5;
  uint64_t v7 = sub_2379265BC(&qword_268937368);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v52 = (char *)v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2379265BC(&qword_268937570);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_23796E5E8();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for WeatherTemplateModel();
  sub_2379266D8(a1 + *(int *)(v17 + 28), (uint64_t)v12, &qword_268937570);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    uint64_t v18 = &qword_268937570;
    uint64_t v19 = (uint64_t)v12;
LABEL_5:
    sub_23792673C(v19, v18);
    if (qword_2689370E0 != -1) {
      swift_once();
    }
    id v20 = (id)qword_268937660;
    uint64_t v21 = (void *)sub_23796EA68();
    id v22 = (void *)sub_23796EA68();
    id v23 = objc_msgSend(v20, sel_localizedStringForKey_value_table_, v21, 0, v22);

    uint64_t v24 = sub_23796EA98();
    uint64_t v26 = v25;

    goto LABEL_11;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
  sub_2379266D8(a1 + *(int *)(v17 + 24), (uint64_t)v6, &qword_268937360);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    uint64_t v18 = &qword_268937360;
    uint64_t v19 = (uint64_t)v6;
    goto LABEL_5;
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v52, v6, v7);
  uint64_t v49 = v8;
  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v27 = (id)qword_268937660;
  char v28 = (void *)sub_23796EA68();
  uint64_t v29 = (void *)sub_23796EA68();
  id v30 = objc_msgSend(v27, sel_localizedStringForKey_value_table_, v28, 0, v29);

  uint64_t v31 = sub_23796EA98();
  v48[0] = v32;
  v48[1] = v31;

  sub_2379265BC((uint64_t *)&unk_268937390);
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_237971400;
  uint64_t v34 = sub_23796E5C8();
  uint64_t v36 = v35;
  *(void *)(v33 + 56) = MEMORY[0x263F8D310];
  unint64_t v37 = sub_23792918C();
  *(void *)(v33 + 64) = v37;
  *(void *)(v33 + 32) = v34;
  *(void *)(v33 + 40) = v36;
  uint64_t v38 = v49;
  uint64_t v39 = (uint64_t)v50;
  (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v50, v52, v7);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v38 + 56))(v39, 0, 1, v7);
  uint64_t v40 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(**(void **)(v51 + 16) + 152))(v39, 1, 2);
  uint64_t v42 = v41;
  sub_23792673C(v39, &qword_268937360);
  *(void *)(v33 + 96) = MEMORY[0x263F8D310];
  *(void *)(v33 + 104) = v37;
  *(void *)(v33 + 72) = v40;
  *(void *)(v33 + 80) = v42;
  uint64_t v24 = sub_23796EAA8();
  uint64_t v26 = v43;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v52, v7);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
LABEL_11:
  uint64_t v53 = v24;
  uint64_t v54 = v26;
  sub_237929138();
  sub_23796EC58();
  swift_bridgeObjectRelease();
  id v44 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v45 = objc_msgSend(self, sel_textProviderWithText_, v44);

  id v46 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD138]), sel_initWithTextProvider_, v45);
  return v46;
}

id sub_237938898(uint64_t a1)
{
  return sub_2379388B0(a1, (Class *)0x263EFCFD0);
}

id sub_2379388A4(uint64_t a1)
{
  return sub_2379388B0(a1, (Class *)0x263EFCFF8);
}

id sub_2379388B0(uint64_t a1, Class *a2)
{
  uint64_t v5 = type metadata accessor for WeatherTemplateModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(**(void **)(v2 + 16) + 152))(a1 + *(int *)(v5 + 24), 1, 1);
  uint64_t v6 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(self, sel_textProviderWithText_, v6);

  id v8 = objc_msgSend(objc_allocWithZone(*a2), sel_initWithTextProvider_, v7);
  uint64_t v9 = self;
  id v10 = v8;
  id v11 = objc_msgSend(v9, sel_systemCyanColor);
  objc_msgSend(v10, sel_setTintColor_, v11);

  return v10;
}

uint64_t sub_2379389D0()
{
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for WeatherTemplateFormatter()
{
  return self;
}

uint64_t sub_237938A2C()
{
  return sub_237939304(&qword_268937558, 255, (void (*)(uint64_t))type metadata accessor for WeatherTemplateModel);
}

uint64_t sub_237938A78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v31 = a3;
  uint64_t v32 = a4;
  uint64_t v30 = a2;
  uint64_t v5 = sub_2379265BC(&qword_268937360);
  MEMORY[0x270FA5388](v5 - 8);
  id v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)sub_23796E968();
  uint64_t v9 = sub_2379265BC(&qword_268937368);
  uint64_t v10 = *(void *)(v9 - 8);
  id v11 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v11(v7, a1, v9);
  uint64_t v12 = *(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56);
  v12(v7, 0, 1, v9);
  uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)v8 + 152);
  swift_retain();
  uint64_t v14 = v13(v7, 1, 1);
  uint64_t v33 = v15;
  uint64_t v34 = v14;
  sub_23792673C((uint64_t)v7, &qword_268937360);
  v11(v7, v30, v9);
  v12(v7, 0, 1, v9);
  uint64_t v16 = v13(v7, 1, 1);
  uint64_t v18 = v17;
  sub_23792673C((uint64_t)v7, &qword_268937360);
  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v19 = (id)qword_268937660;
  id v20 = (void *)sub_23796EA68();
  uint64_t v21 = (void *)sub_23796EA68();
  id v22 = objc_msgSend(v19, sel_localizedStringForKey_value_table_, v20, 0, v21);

  sub_23796EA98();
  sub_2379265BC((uint64_t *)&unk_268937390);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_237971400;
  uint64_t v24 = MEMORY[0x263F8D310];
  *(void *)(v23 + 56) = MEMORY[0x263F8D310];
  unint64_t v25 = sub_23792918C();
  uint64_t v26 = v33;
  *(void *)(v23 + 32) = v34;
  *(void *)(v23 + 40) = v26;
  *(void *)(v23 + 96) = v24;
  *(void *)(v23 + 104) = v25;
  *(void *)(v23 + 64) = v25;
  *(void *)(v23 + 72) = v16;
  *(void *)(v23 + 80) = v18;
  uint64_t v27 = sub_23796EAA8();
  swift_release();
  swift_bridgeObjectRelease();
  return v27;
}

uint64_t sub_237938D74()
{
  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_268937660;
  uint64_t v1 = (void *)sub_23796EA68();
  uint64_t v2 = (void *)sub_23796EA68();
  id v3 = objc_msgSend(v0, sel_localizedStringForKey_value_table_, v1, 0, v2);

  uint64_t v4 = sub_23796EA98();
  uint64_t v6 = v5;

  BOOL v7 = v4 == 1702195828 && v6 == 0xE400000000000000;
  if (v7 || (sub_23796EDB8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    char v8 = 1;
  }
  else if (v4 == 0x65736C6166 && v6 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    char v8 = 0;
  }
  else
  {
    char v10 = sub_23796EDB8();
    swift_bridgeObjectRelease();
    char v8 = v10 ^ 1;
  }
  return v8 & 1;
}

id sub_237938F18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WeatherTemplateModel();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_237939228(a2, (uint64_t)v6);
  sub_2379560CC((uint64_t)v6, a1 == 8, (float *)&v25);
  swift_bridgeObjectRetain();
  BOOL v7 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  char v8 = self;
  id v9 = objc_msgSend(v8, sel_textProviderWithText_, v7);

  swift_bridgeObjectRetain();
  char v10 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(v8, sel_textProviderWithText_, v10);

  objc_msgSend(v11, sel_setTintColor_, v27);
  swift_bridgeObjectRetain();
  uint64_t v12 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v8, sel_textProviderWithText_, v12);

  objc_msgSend(v13, sel_setTintColor_, v26);
  int v14 = v25;
  sub_237926638(0, (unint64_t *)&qword_268937340);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v15 = (void *)sub_23796EB08();
  swift_bridgeObjectRelease();
  sub_237926638(0, &qword_268937560);
  uint64_t v16 = (void *)sub_23796EB08();
  swift_bridgeObjectRelease();
  uint64_t v17 = self;
  LODWORD(v18) = v14;
  id v19 = objc_msgSend(v17, sel_gaugeProviderWithStyle_gaugeColors_gaugeColorLocations_fillFraction_, 0, v15, v16, v18);

  if (a1 == 12)
  {
    uint64_t v21 = (objc_class *)MEMORY[0x263EFD0B8];
LABEL_7:
    id v20 = objc_msgSend(objc_allocWithZone(v21), sel_initWithGaugeProvider_leadingTextProvider_trailingTextProvider_centerTextProvider_, v19, v11, v13, v9);
    goto LABEL_8;
  }
  if (a1 == 10)
  {
    uint64_t v21 = (objc_class *)MEMORY[0x263EFD040];
    goto LABEL_7;
  }
  if (a1 != 8)
  {

    sub_23793928C((uint64_t)&v25);
    return 0;
  }
  id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD078]), sel_initWithGaugeProvider_leadingTextProvider_trailingTextProvider_outerTextProvider_, v19, v11, v13, v9);
LABEL_8:
  id v22 = v20;

  sub_23793928C((uint64_t)&v25);
  return v22;
}

uint64_t sub_237939228(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WeatherTemplateModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23793928C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = *(void **)(a1 + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_237939304(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_23793934C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for WeatherTemplateModel();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2379393A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v19 = sub_23796E2D8();
  uint64_t v2 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_23796E358();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v20 = sub_23796E2A8();
  uint64_t v6 = *(void *)(v20 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v20);
  id v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23792D380(v7);
  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v10 = (id)qword_268937660;
  id v11 = (void *)sub_23796EA68();
  uint64_t v12 = (void *)sub_23796EA68();
  id v13 = objc_msgSend(v10, sel_localizedStringForKey_value_table_, v11, 0, v12);

  sub_23796EA98();
  sub_23796E348();
  sub_23796E2C8();
  sub_23796E2B8();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v19);
  uint64_t v14 = type metadata accessor for WindTemplateModel();
  sub_23796E8A8();
  uint64_t v15 = a1 + *(int *)(v14 + 28);
  id v16 = objc_msgSend(self, sel_milesPerHour);
  sub_23793A480();
  sub_23796E1B8();
  uint64_t v17 = sub_2379265BC(&qword_268937230);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v15, 0, 1, v17);
  uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(a1, v9, v20);
  *(unsigned char *)(a1 + *(int *)(v14 + 24)) = 2;
  return result;
}

uint64_t sub_237939720()
{
  uint64_t v1 = sub_23796E318();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2379265BC((uint64_t *)&unk_268937840);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v8 = (id)qword_268937660;
  id v9 = (void *)sub_23796EA68();
  id v10 = (void *)sub_23796EA68();
  id v11 = objc_msgSend(v8, sel_localizedStringForKey_value_table_, v9, 0, v10);

  uint64_t v12 = sub_23796EA98();
  uint64_t v14 = v13;

  if (v12 == 1702195828 && v14 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    char v15 = 1;
  }
  else
  {
    char v15 = sub_23796EDB8();
    swift_bridgeObjectRelease();
  }
  uint64_t v16 = type metadata accessor for WindTemplateModel();
  sub_2379266D8(v0 + *(int *)(v16 + 28), (uint64_t)v7, (uint64_t *)&unk_268937840);
  uint64_t v17 = sub_2379265BC(&qword_268937230);
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v7, 1, v17) == 1)
  {
    sub_23792673C((uint64_t)v7, (uint64_t *)&unk_268937840);
    uint64_t v19 = 0;
    unint64_t v20 = 0xE000000000000000;
    if (v15) {
      return v19;
    }
    goto LABEL_11;
  }
  sub_23796E308();
  sub_23796E198();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v7, v17);
  uint64_t v19 = v24;
  unint64_t v20 = v25;
  long long v28 = v23;
  sub_237926600((uint64_t)&v28);
  long long v27 = v26;
  sub_237926600((uint64_t)&v27);
  if ((v15 & 1) == 0)
  {
LABEL_11:
    v22[0] = v19;
    v22[1] = v20;
    sub_237929138();
    uint64_t v19 = sub_23796EC58();
    swift_bridgeObjectRelease();
  }
  return v19;
}

uint64_t sub_237939A90()
{
  uint64_t v1 = sub_23796E318();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2379265BC((uint64_t *)&unk_268937840);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = 40;
  v12[1] = 0xE100000000000000;
  uint64_t v8 = type metadata accessor for WindTemplateModel();
  sub_2379266D8(v0 + *(int *)(v8 + 28), (uint64_t)v7, (uint64_t *)&unk_268937840);
  uint64_t v9 = sub_2379265BC(&qword_268937230);
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9) == 1)
  {
    sub_23792673C((uint64_t)v7, (uint64_t *)&unk_268937840);
  }
  else
  {
    sub_23796E308();
    sub_23796E188();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
  }
  sub_23796EAD8();
  swift_bridgeObjectRelease();
  sub_23796EAD8();
  return v12[0];
}

uint64_t sub_237939CB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v51 = a2;
  uint64_t v3 = sub_2379265BC((uint64_t *)&unk_268937840);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2379265BC(&qword_268937240);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v49 = (uint64_t)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  id v11 = (char *)&v43 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v43 - v12;
  uint64_t v14 = sub_23796E2A8();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_2379265BC(&qword_268937478);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v21 = (char *)&v43 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  long long v23 = (char *)&v43 - v22;
  uint64_t v46 = type metadata accessor for TemplateData();
  sub_2379266D8(a1 + *(int *)(v46 + 20), (uint64_t)v23, &qword_268937478);
  uint64_t v47 = v15;
  uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16);
  uint64_t v50 = a1;
  id v44 = v24;
  v24((uint64_t)v17, a1, v14);
  sub_2379266D8((uint64_t)v23, (uint64_t)v21, &qword_268937478);
  uint64_t v25 = sub_23796E508();
  uint64_t v26 = *(void *)(v25 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v21, 1, v25) == 1)
  {
    sub_23792673C((uint64_t)v21, &qword_268937478);
    memset(v55, 0, sizeof(v55));
    uint64_t v56 = 0;
  }
  else
  {
    sub_23796E498();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v21, v25);
  }
  sub_2379266D8((uint64_t)v55, (uint64_t)v52, &qword_2689374C0);
  uint64_t v27 = v53;
  uint64_t v48 = v14;
  id v45 = v17;
  if (v53)
  {
    uint64_t v28 = v54;
    sub_23792E528(v52, v53);
    (*(void (**)(uint64_t, uint64_t))(v28 + 112))(v27, v28);
    uint64_t v29 = sub_23796E7F8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v13, 0, 1, v29);
    sub_23792E56C((uint64_t)v52);
  }
  else
  {
    sub_23792673C((uint64_t)v52, &qword_2689374C0);
    uint64_t v29 = sub_23796E7F8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v13, 1, 1, v29);
  }
  sub_2379266D8((uint64_t)v13, (uint64_t)v11, &qword_268937240);
  sub_23796E7F8();
  uint64_t v30 = *(void *)(v29 - 8);
  uint64_t v31 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48);
  if (v31(v11, 1, v29) == 1)
  {
    sub_23792673C((uint64_t)v11, &qword_268937240);
    uint64_t v32 = sub_2379265BC(&qword_268937230);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v5, 1, 1, v32);
  }
  else
  {
    sub_23796E7E8();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v11, v29);
    uint64_t v33 = sub_2379265BC(&qword_268937230);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v5, 0, 1, v33);
  }
  uint64_t v34 = v49;
  sub_2379266D8((uint64_t)v13, v49, &qword_268937240);
  if (v31((char *)v34, 1, v29) == 1)
  {
    sub_23792673C((uint64_t)v13, &qword_268937240);
    sub_23792673C((uint64_t)v55, &qword_2689374C0);
    uint64_t v35 = v48;
    (*(void (**)(char *, uint64_t))(v47 + 8))(v45, v48);
    sub_23792673C((uint64_t)v23, &qword_268937478);
    sub_23792673C(v34, &qword_268937240);
    char v36 = 16;
  }
  else
  {
    char v36 = sub_23796E7D8();
    sub_23792673C((uint64_t)v13, &qword_268937240);
    sub_23792673C((uint64_t)v55, &qword_2689374C0);
    uint64_t v35 = v48;
    (*(void (**)(char *, uint64_t))(v47 + 8))(v45, v48);
    sub_23792673C((uint64_t)v23, &qword_268937478);
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v34, v29);
  }
  uint64_t v37 = v50;
  uint64_t v38 = v51;
  uint64_t v39 = v46;
  v44(v51, v50, v35);
  uint64_t v40 = v37 + *(int *)(v39 + 24);
  uint64_t v41 = (int *)type metadata accessor for WindTemplateModel();
  sub_23793345C(v40, v38 + v41[5]);
  uint64_t result = sub_23793A418((uint64_t)v5, v38 + v41[7]);
  *(unsigned char *)(v38 + v41[6]) = v36;
  return result;
}

unint64_t sub_23793A34C(uint64_t a1)
{
  unint64_t result = sub_23793A374();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23793A374()
{
  unint64_t result = qword_268937578;
  if (!qword_268937578)
  {
    type metadata accessor for WindTemplateModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268937578);
  }
  return result;
}

uint64_t type metadata accessor for WindTemplateModel()
{
  uint64_t result = qword_268937580;
  if (!qword_268937580) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_23793A418(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2379265BC((uint64_t *)&unk_268937840);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_23793A480()
{
  unint64_t result = qword_268937258;
  if (!qword_268937258)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268937258);
  }
  return result;
}

void *sub_23793A4C0(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v22 = *a2;
    *a1 = *a2;
    a1 = (void *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_23796E2A8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (void *)((char *)a1 + v8);
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = *(void *)((char *)a2 + v8 + 8);
    *uint64_t v9 = *(void *)((char *)a2 + v8);
    v9[1] = v11;
    uint64_t v12 = *(void *)((char *)a2 + v8 + 24);
    v9[2] = *(void *)((char *)a2 + v8 + 16);
    v9[3] = v12;
    uint64_t v13 = (int *)sub_23796E8C8();
    uint64_t v14 = v13[6];
    uint64_t v25 = &v10[v14];
    uint64_t v26 = (char *)v9 + v14;
    uint64_t v15 = sub_23796E358();
    uint64_t v24 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v24(v26, v25, v15);
    *((unsigned char *)v9 + v13[7]) = v10[v13[7]];
    *(_OWORD *)((char *)v9 + v13[8]) = *(_OWORD *)&v10[v13[8]];
    uint64_t v16 = a3[7];
    *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
    uint64_t v17 = (char *)a1 + v16;
    uint64_t v18 = (char *)a2 + v16;
    uint64_t v19 = sub_2379265BC(&qword_268937230);
    uint64_t v20 = *(void *)(v19 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
    {
      uint64_t v21 = sub_2379265BC((uint64_t *)&unk_268937840);
      memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v17, v18, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
    }
  }
  return a1;
}

uint64_t sub_23793A728(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = v5 + *(int *)(sub_23796E8C8() + 24);
  uint64_t v7 = sub_23796E358();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = a1 + *(int *)(a2 + 28);
  uint64_t v9 = sub_2379265BC(&qword_268937230);
  uint64_t v12 = *(void *)(v9 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v8, 1, v9);
  if (!result)
  {
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(v12 + 8);
    return v11(v8, v9);
  }
  return result;
}

uint64_t sub_23793A898(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a2 + v7 + 8);
  *uint64_t v8 = *(void *)(a2 + v7);
  v8[1] = v10;
  uint64_t v11 = *(void *)(a2 + v7 + 24);
  v8[2] = *(void *)(a2 + v7 + 16);
  v8[3] = v11;
  uint64_t v12 = (int *)sub_23796E8C8();
  uint64_t v13 = v12[6];
  uint64_t v23 = v9 + v13;
  uint64_t v24 = (char *)v8 + v13;
  uint64_t v14 = sub_23796E358();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v15(v24, v23, v14);
  *((unsigned char *)v8 + v12[7]) = *(unsigned char *)(v9 + v12[7]);
  *(_OWORD *)((char *)v8 + v12[8]) = *(_OWORD *)(v9 + v12[8]);
  uint64_t v16 = a3[7];
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (const void *)(a2 + v16);
  uint64_t v19 = sub_2379265BC(&qword_268937230);
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
  {
    uint64_t v21 = sub_2379265BC((uint64_t *)&unk_268937840);
    memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v20 + 16))(v17, v18, v19);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  }
  return a1;
}

uint64_t sub_23793AAB0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  *uint64_t v8 = *(void *)(a2 + v7);
  v8[1] = *(void *)(a2 + v7 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[2] = *(void *)(v9 + 16);
  v8[3] = *(void *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = (int *)sub_23796E8C8();
  uint64_t v11 = v10[6];
  uint64_t v12 = (char *)v8 + v11;
  uint64_t v13 = v9 + v11;
  uint64_t v14 = sub_23796E358();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  *((unsigned char *)v8 + v10[7]) = *(unsigned char *)(v9 + v10[7]);
  uint64_t v15 = v10[8];
  uint64_t v16 = (void *)((char *)v8 + v15);
  uint64_t v17 = (void *)(v9 + v15);
  void *v16 = *v17;
  v16[1] = v17[1];
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  uint64_t v18 = a3[7];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (void *)(a2 + v18);
  uint64_t v21 = sub_2379265BC(&qword_268937230);
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v22 + 48);
  LODWORD(v12) = v23(v19, 1, v21);
  int v24 = v23(v20, 1, v21);
  if (!v12)
  {
    if (!v24)
    {
      (*(void (**)(void *, void *, uint64_t))(v22 + 24))(v19, v20, v21);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v22 + 8))(v19, v21);
    goto LABEL_6;
  }
  if (v24)
  {
LABEL_6:
    uint64_t v25 = sub_2379265BC((uint64_t *)&unk_268937840);
    memcpy(v19, v20, *(void *)(*(void *)(v25 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v22 + 16))(v19, v20, v21);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  return a1;
}

uint64_t sub_23793AD3C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (_OWORD *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  long long v10 = *(_OWORD *)(a2 + v7 + 16);
  *uint64_t v8 = *(_OWORD *)(a2 + v7);
  v8[1] = v10;
  uint64_t v11 = (int *)sub_23796E8C8();
  uint64_t v12 = v11[6];
  uint64_t v13 = (char *)v8 + v12;
  uint64_t v14 = v9 + v12;
  uint64_t v15 = sub_23796E358();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  *((unsigned char *)v8 + v11[7]) = *(unsigned char *)(v9 + v11[7]);
  *(_OWORD *)((char *)v8 + v11[8]) = *(_OWORD *)(v9 + v11[8]);
  uint64_t v16 = a3[7];
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (const void *)(a2 + v16);
  uint64_t v19 = sub_2379265BC(&qword_268937230);
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
  {
    uint64_t v21 = sub_2379265BC((uint64_t *)&unk_268937840);
    memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v20 + 32))(v17, v18, v19);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  }
  return a1;
}

uint64_t sub_23793AF20(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a2 + v7 + 8);
  *uint64_t v8 = *(void *)(a2 + v7);
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(v9 + 24);
  v8[2] = *(void *)(v9 + 16);
  v8[3] = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = (int *)sub_23796E8C8();
  uint64_t v13 = v12[6];
  uint64_t v14 = (char *)v8 + v13;
  uint64_t v15 = v9 + v13;
  uint64_t v16 = sub_23796E358();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 40))(v14, v15, v16);
  *((unsigned char *)v8 + v12[7]) = *(unsigned char *)(v9 + v12[7]);
  *(_OWORD *)((char *)v8 + v12[8]) = *(_OWORD *)(v9 + v12[8]);
  uint64_t v17 = a3[7];
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)(a2 + v17);
  uint64_t v20 = sub_2379265BC(&qword_268937230);
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v21 + 48);
  LODWORD(v14) = v22(v18, 1, v20);
  int v23 = v22(v19, 1, v20);
  if (!v14)
  {
    if (!v23)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 40))(v18, v19, v20);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v21 + 8))(v18, v20);
    goto LABEL_6;
  }
  if (v23)
  {
LABEL_6:
    uint64_t v24 = sub_2379265BC((uint64_t *)&unk_268937840);
    memcpy(v18, v19, *(void *)(*(void *)(v24 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v21 + 32))(v18, v19, v20);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
  return a1;
}

uint64_t sub_23793B178(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23793B18C);
}

uint64_t sub_23793B18C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23796E2A8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_23796E8C8();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + a3[5];
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  if (a2 == 239)
  {
    if (*(unsigned __int8 *)(a1 + a3[6]) <= 0x10u) {
      int v14 = 16;
    }
    else {
      int v14 = *(unsigned __int8 *)(a1 + a3[6]);
    }
    unsigned int v15 = v14 - 16;
    if (*(unsigned __int8 *)(a1 + a3[6]) >= 0x10u) {
      return v15;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v16 = sub_2379265BC((uint64_t *)&unk_268937840);
    uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48);
    uint64_t v18 = v16;
    uint64_t v19 = a1 + a3[7];
    return v17(v19, a2, v18);
  }
}

uint64_t sub_23793B314(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23793B328);
}

uint64_t sub_23793B328(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_23796E2A8();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t result = sub_23796E8C8();
  uint64_t v14 = *(void *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v12 = a1 + a4[5];
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  if (a3 == 239)
  {
    *(unsigned char *)(a1 + a4[6]) = a2 + 16;
  }
  else
  {
    uint64_t v15 = sub_2379265BC((uint64_t *)&unk_268937840);
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a4[7];
    return v16(v18, a2, a2, v17);
  }
  return result;
}

void sub_23793B4A8()
{
  sub_23796E2A8();
  if (v0 <= 0x3F)
  {
    sub_23796E8C8();
    if (v1 <= 0x3F)
    {
      sub_23793B5B4();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_23793B5B4()
{
  if (!qword_268937590)
  {
    sub_23792D044(&qword_268937230);
    unint64_t v0 = sub_23796EC28();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268937590);
    }
  }
}

id sub_23793B614(uint64_t a1, uint64_t a2)
{
  switch(a1)
  {
    case 0:
      uint64_t v6 = *(void *)(v2 + 16);
      uint64_t v7 = type metadata accessor for UVTemplateModel();
      (*(void (**)(void, void, uint64_t))(*(void *)v6 + 88))(*(void *)(a2 + *(int *)(v7 + 20)), *(unsigned __int8 *)(a2 + *(int *)(v7 + 20) + 8), 2);
      uint64_t v8 = (void *)sub_23796EA68();
      swift_bridgeObjectRelease();
      id v9 = objc_msgSend(self, sel_textProviderWithText_, v8);

      id v10 = sub_237928EC8(a2);
      uint64_t v11 = (objc_class *)MEMORY[0x263EFD128];
      goto LABEL_10;
    case 1:
      id v5 = sub_237928028(a2);
      goto LABEL_17;
    case 2:
    case 6:
      id v5 = sub_237928374(a2);
      goto LABEL_17;
    case 3:
      id v5 = sub_237928468(a2);
      goto LABEL_17;
    case 4:
      uint64_t v12 = *(void *)(v2 + 16);
      uint64_t v13 = type metadata accessor for UVTemplateModel();
      (*(void (**)(void, void, uint64_t))(*(void *)v12 + 88))(*(void *)(a2 + *(int *)(v13 + 20)), *(unsigned __int8 *)(a2 + *(int *)(v13 + 20) + 8), 2);
      uint64_t v14 = (void *)sub_23796EA68();
      swift_bridgeObjectRelease();
      id v9 = objc_msgSend(self, sel_textProviderWithText_, v14);

      id v10 = sub_237928EC8(a2);
      uint64_t v11 = (objc_class *)MEMORY[0x263EFCFD8];
      goto LABEL_10;
    case 7:
      uint64_t v18 = *(void *)(v2 + 16);
      uint64_t v19 = type metadata accessor for UVTemplateModel();
      (*(void (**)(void, void, uint64_t))(*(void *)v18 + 88))(*(void *)(a2 + *(int *)(v19 + 20)), *(unsigned __int8 *)(a2 + *(int *)(v19 + 20) + 8), 2);
      uint64_t v20 = (void *)sub_23796EA68();
      swift_bridgeObjectRelease();
      id v9 = objc_msgSend(self, sel_textProviderWithText_, v20);

      id v10 = sub_237928EC8(a2);
      uint64_t v11 = (objc_class *)MEMORY[0x263EFD000];
      goto LABEL_10;
    case 8:
      id v22 = sub_237928B60(a2);
      uint64_t v24 = v23;
      uint64_t v26 = v25;
      id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD078]), sel_initWithGaugeProvider_leadingTextProvider_trailingTextProvider_outerTextProvider_, v22, v25, 0, v23);

      goto LABEL_18;
    case 9:
      id v27 = sub_2379287BC(a2);
      if (!v27) {
        goto LABEL_22;
      }
      uint64_t v28 = v27;
      self;
      uint64_t v29 = swift_dynamicCastObjCClass();
      if (v29)
      {
        id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD018]), sel_initWithCircularTemplate_, v29);

LABEL_18:
        if ((sub_23793C494(a1, (uint64_t)&unk_26EA95918) & 1) == 0 && v21)
        {
          uint64_t v30 = self;
          id v31 = v21;
          id v32 = objc_msgSend(v30, sel_clearColor);
          objc_msgSend(v31, sel_setTintColor_, v32);
        }
      }
      else
      {

LABEL_22:
        sub_23793C494(a1, (uint64_t)&unk_26EA95918);
        return 0;
      }
      return v21;
    case 10:
      id v5 = sub_2379287BC(a2);
      goto LABEL_17;
    case 11:
      goto LABEL_22;
    case 12:
      id v5 = sub_2379287D0(a2);
LABEL_17:
      id v21 = v5;
      goto LABEL_18;
    default:
      if (*MEMORY[0x263EFCF20] != a1) {
        goto LABEL_22;
      }
      uint64_t v15 = *(void *)(v2 + 16);
      uint64_t v16 = type metadata accessor for UVTemplateModel();
      (*(void (**)(void, void, uint64_t))(*(void *)v15 + 88))(*(void *)(a2 + *(int *)(v16 + 20)), *(unsigned __int8 *)(a2 + *(int *)(v16 + 20) + 8), 2);
      uint64_t v17 = (void *)sub_23796EA68();
      swift_bridgeObjectRelease();
      id v9 = objc_msgSend(self, sel_textProviderWithText_, v17);

      id v10 = sub_237928EC8(a2);
      uint64_t v11 = (objc_class *)MEMORY[0x263EFCFB0];
LABEL_10:
      id v21 = objc_msgSend(objc_allocWithZone(v11), sel_initWithLine1ImageProvider_line2TextProvider_, v10, v9);

      goto LABEL_18;
  }
}

id sub_23793BABC(uint64_t a1, uint64_t a2)
{
  switch(a1)
  {
    case 0:
      id v5 = sub_2379373C0(a2);
      goto LABEL_17;
    case 1:
      id v5 = sub_23793751C(a2);
      goto LABEL_17;
    case 2:
    case 6:
      id v5 = sub_237937EDC(a2);
      goto LABEL_17;
    case 3:
      id v5 = sub_237938210(a2);
      goto LABEL_17;
    case 4:
      id v5 = sub_237938898(a2);
      goto LABEL_17;
    case 7:
      id v5 = sub_2379388A4(a2);
      goto LABEL_17;
    case 8:
      uint64_t v10 = 8;
      goto LABEL_16;
    case 9:
      id v11 = sub_237938F18(10, a2);
      if (!v11) {
        goto LABEL_22;
      }
      uint64_t v12 = v11;
      self;
      uint64_t v13 = swift_dynamicCastObjCClass();
      if (v13)
      {
        id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD018]), sel_initWithCircularTemplate_, v13);

LABEL_18:
        if ((sub_23793C494(a1, (uint64_t)&unk_26EA95960) & 1) == 0 && v9)
        {
          uint64_t v14 = self;
          id v15 = v9;
          id v16 = objc_msgSend(v14, sel_clearColor);
          objc_msgSend(v15, sel_setTintColor_, v16);
        }
      }
      else
      {

LABEL_22:
        sub_23793C494(a1, (uint64_t)&unk_26EA95960);
        return 0;
      }
      return v9;
    case 10:
      uint64_t v10 = 10;
      goto LABEL_16;
    case 11:
      goto LABEL_22;
    case 12:
      uint64_t v10 = 12;
LABEL_16:
      id v5 = sub_237938F18(v10, a2);
LABEL_17:
      id v9 = v5;
      goto LABEL_18;
    default:
      if (*MEMORY[0x263EFCF20] != a1) {
        goto LABEL_22;
      }
      uint64_t v6 = type metadata accessor for WeatherTemplateModel();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(**(void **)(v2 + 16) + 152))(a2 + *(int *)(v6 + 24), 1, 1);
      uint64_t v7 = (void *)sub_23796EA68();
      swift_bridgeObjectRelease();
      id v8 = objc_msgSend(self, sel_textProviderWithText_, v7);

      id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFCFD0]), sel_initWithTextProvider_, v8);
      goto LABEL_18;
  }
}

id sub_23793BD50(uint64_t a1, uint64_t a2)
{
  switch(a1)
  {
    case 0:
      id v4 = sub_23793EBA0(a2);
      goto LABEL_14;
    case 1:
    case 3:
    case 11:
      goto LABEL_2;
    case 2:
    case 6:
      id v4 = sub_23793EDE4(a2);
      goto LABEL_14;
    case 4:
      id v4 = sub_23793EDF8(a2);
      goto LABEL_14;
    case 7:
      id v4 = sub_23793F008(a2);
      goto LABEL_14;
    case 8:
      id v5 = sub_23793F4C4(a2, 8uLL);
      id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD060]), sel_initWithImageProvider_, v5);
      uint64_t v7 = sub_23794B274();
      goto LABEL_11;
    case 9:
      id v4 = sub_23793F7D8(a2);
      goto LABEL_14;
    case 10:
      id v5 = sub_23793F4C4(a2, 0xAuLL);
      id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD030]), sel_initWithImageProvider_, v5);
      uint64_t v7 = sub_23794B274();
      goto LABEL_11;
    case 12:
      id v5 = sub_23793F4C4(a2, 0xCuLL);
      id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD0A0]), sel_initWithImageProvider_, v5);
      uint64_t v7 = sub_23794B274();
LABEL_11:
      id v3 = v7;

      goto LABEL_15;
    default:
      if (*MEMORY[0x263EFCF20] == a1)
      {
        id v4 = sub_23793F01C(a2);
LABEL_14:
        id v3 = v4;
LABEL_15:
        if ((sub_23793C494(a1, (uint64_t)&unk_26EA95A38) & 1) == 0 && v3)
        {
          id v8 = self;
          id v9 = v3;
          id v10 = objc_msgSend(v8, sel_clearColor);
          objc_msgSend(v9, sel_setTintColor_, v10);
        }
      }
      else
      {
LABEL_2:
        sub_23793C494(a1, (uint64_t)&unk_26EA95A38);
        return 0;
      }
      return v3;
  }
}

id sub_23793BF88(uint64_t a1, uint64_t a2)
{
  switch(a1)
  {
    case 0:
      id v3 = sub_2379543C8(a2);
      goto LABEL_16;
    case 1:
      id v3 = sub_23795539C(a2);
      goto LABEL_16;
    case 2:
    case 6:
      id v3 = sub_2379543DC();
      goto LABEL_16;
    case 3:
      id v3 = sub_237955670(a2);
      goto LABEL_16;
    case 4:
      id v3 = sub_237954534(a2);
      goto LABEL_16;
    case 7:
      id v3 = sub_237954548(a2);
      goto LABEL_16;
    case 8:
      id v3 = sub_23795455C(a2);
      goto LABEL_16;
    case 9:
      id v4 = sub_2379547AC(a2);
      if (!v4) {
        goto LABEL_21;
      }
      id v5 = v4;
      self;
      uint64_t v6 = swift_dynamicCastObjCClass();
      if (v6)
      {
        id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD018]), sel_initWithCircularTemplate_, v6);

LABEL_17:
        if ((sub_23793C494(a1, (uint64_t)&unk_26EA95A80) & 1) == 0 && v7)
        {
          id v8 = self;
          id v9 = v7;
          id v10 = objc_msgSend(v8, sel_clearColor);
          objc_msgSend(v9, sel_setTintColor_, v10);
        }
      }
      else
      {

LABEL_21:
        sub_23793C494(a1, (uint64_t)&unk_26EA95A80);
        return 0;
      }
      return v7;
    case 10:
      id v3 = sub_2379547AC(a2);
      goto LABEL_16;
    case 11:
      goto LABEL_21;
    case 12:
      id v3 = sub_237954A64(a2);
      goto LABEL_16;
    default:
      if (*MEMORY[0x263EFCF20] != a1) {
        goto LABEL_21;
      }
      id v3 = sub_237954D1C(a2);
LABEL_16:
      id v7 = v3;
      goto LABEL_17;
  }
}

uint64_t sub_23793C180(uint64_t a1, uint64_t a2, void (*a3)(void *, uint64_t, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v20 = a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v11 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v13 = (char *)&v19 - v12;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 104))(a2, AssociatedTypeWitness, AssociatedConformanceWitness);
  id v15 = (void *)(*(uint64_t (**)(uint64_t, char *, uint64_t, uint64_t))(a6 + 32))(a1, v13, a5, a6);
  uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 24))(AssociatedTypeWitness, AssociatedConformanceWitness);
  v20(v15, v16, v17);
  swift_bridgeObjectRelease();

  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, AssociatedTypeWitness);
}

uint64_t sub_23793C350(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  id v9 = (char *)&v12 - v8;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a3 + 168))(a1, a2, a3);
  uint64_t v10 = (*(uint64_t (**)(uint64_t, char *, uint64_t, uint64_t))(a3 + 32))(a1, v9, a2, a3);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, AssociatedTypeWitness);
  return v10;
}

uint64_t sub_23793C494(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  if (*(void *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 5; ; ++i)
  {
    uint64_t v4 = i - 3;
    if (__OFADD__(i - 4, 1)) {
      break;
    }
    BOOL v6 = *(void *)(a2 + 8 * i) == result;
    BOOL v5 = v6;
    BOOL v6 = v6 || v4 == v2;
    if (v6) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_23793C4F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v27 = a1;
  uint64_t v2 = sub_23796E8C8();
  uint64_t v3 = v2 - 8;
  MEMORY[0x270FA5388](v2);
  BOOL v5 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2379265BC(&qword_268937478);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  id v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v25 - v10;
  uint64_t v12 = sub_23796E2A8();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  id v15 = (char *)v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v1, v12);
  uint64_t v16 = sub_23796E508();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
  v25[1] = v17 + 56;
  uint64_t v26 = v18;
  v18(v11, 1, 1, v16);
  uint64_t v19 = type metadata accessor for TemplateData();
  sub_23793345C(v1 + *(int *)(v19 + 24), (uint64_t)v5);
  sub_237935E98((uint64_t)v11, (uint64_t)v9);
  uint64_t v20 = (double *)&v5[*(int *)(v3 + 40)];
  if (*v20 == *MEMORY[0x263F00B58])
  {
    double v21 = v20[1];
    double v22 = *(double *)(MEMORY[0x263F00B58] + 8);
    sub_23793C848((uint64_t)v11);
    if (v21 == v22)
    {
      sub_23793C848((uint64_t)v9);
      v26(v9, 1, 1, v16);
    }
  }
  else
  {
    sub_23793C848((uint64_t)v11);
  }
  uint64_t v23 = v27;
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(v27, v15, v12);
  sub_23793C8A8((uint64_t)v9, v23 + *(int *)(v19 + 20));
  return sub_23793C910((uint64_t)v5, v23 + *(int *)(v19 + 24));
}

uint64_t type metadata accessor for TemplateData()
{
  uint64_t result = qword_268937598;
  if (!qword_268937598) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_23793C848(uint64_t a1)
{
  uint64_t v2 = sub_2379265BC(&qword_268937478);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23793C8A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2379265BC(&qword_268937478);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23793C910(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23796E8C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id sub_23793C974(uint64_t a1, uint64_t a2)
{
  id v3 = 0;
  switch(a1)
  {
    case 8:
      id v4 = sub_237957014(a2);
      goto LABEL_9;
    case 9:
      id v5 = sub_237957294(a2);
      if (v5)
      {
        uint64_t v6 = v5;
        self;
        id v3 = (id)swift_dynamicCastObjCClass();
        if (v3) {
          id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD018]), sel_initWithCircularTemplate_, v3);
        }
      }
      else
      {
        id v3 = 0;
      }
      break;
    case 10:
      id v4 = sub_237957294(a2);
      goto LABEL_9;
    case 12:
      id v4 = sub_2379572AC(a2);
LABEL_9:
      id v3 = v4;
      break;
    default:
      break;
  }
  if (!qword_26EA959B8) {
    goto LABEL_17;
  }
  if (qword_26EA959C8 == a1) {
    return v3;
  }
  if (qword_26EA959B8 == 1)
  {
LABEL_17:
    if (v3)
    {
      id v9 = self;
      id v10 = v3;
      id v11 = objc_msgSend(v9, sel_clearColor);
      objc_msgSend(v10, sel_setTintColor_, v11);
    }
  }
  else
  {
    uint64_t v7 = 5;
    while (1)
    {
      uint64_t v8 = v7 - 3;
      if (__OFADD__(v7 - 4, 1))
      {
        __break(1u);
        JUMPOUT(0x23793CB00);
      }
      if (qword_26EA959A8[v7] == a1) {
        break;
      }
      ++v7;
      if (v8 == qword_26EA959B8) {
        goto LABEL_17;
      }
    }
  }
  return v3;
}

id sub_23793CB14(uint64_t a1, uint64_t a2)
{
  id v3 = 0;
  switch(a1)
  {
    case 0:
      id v3 = sub_2379622E4(a2);
      break;
    case 1:
      id v3 = sub_2379626B4(a2);
      break;
    case 2:
    case 6:
      id v3 = sub_237962D3C(a2);
      break;
    case 3:
      id v3 = sub_237963104(a2);
      break;
    case 4:
      id v3 = sub_2379635CC(a2);
      break;
    case 7:
      id v3 = sub_23796397C(a2);
      break;
    case 8:
      id v3 = sub_237963D8C(a2);
      break;
    case 9:
      id v4 = sub_2379644CC(a2);
      if (!v4) {
        goto LABEL_17;
      }
      id v5 = v4;
      self;
      id v3 = (id)swift_dynamicCastObjCClass();
      if (v3) {
        id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD018]), sel_initWithCircularTemplate_, v3);
      }

      break;
    case 10:
      id v3 = sub_2379644CC(a2);
      break;
    case 11:
      break;
    case 12:
      id v3 = sub_2379644E8(a2);
      break;
    default:
      if (*MEMORY[0x263EFCF20] == a1) {
        id v3 = sub_237964604(a2);
      }
      else {
LABEL_17:
      }
        id v3 = 0;
      break;
  }
  if (!qword_26EA95A00) {
    goto LABEL_25;
  }
  if (qword_26EA95A10 == a1) {
    return v3;
  }
  if (qword_26EA95A00 == 1)
  {
LABEL_25:
    if (v3)
    {
      uint64_t v8 = self;
      id v9 = v3;
      id v10 = objc_msgSend(v8, sel_clearColor);
      objc_msgSend(v9, sel_setTintColor_, v10);
    }
  }
  else
  {
    uint64_t v6 = 5;
    while (1)
    {
      uint64_t v7 = v6 - 3;
      if (__OFADD__(v6 - 4, 1))
      {
        __break(1u);
        JUMPOUT(0x23793CD2CLL);
      }
      if (qword_26EA959F0[v6] == a1) {
        break;
      }
      ++v6;
      if (v7 == qword_26EA95A00) {
        goto LABEL_25;
      }
    }
  }
  return v3;
}

id sub_23793CD60(uint64_t a1, uint64_t a2)
{
  id v3 = 0;
  switch(a1)
  {
    case 0:
      id v3 = sub_23795D838(a2);
      break;
    case 1:
      id v3 = sub_23795DA98(a2);
      break;
    case 2:
    case 6:
      id v3 = sub_23795DEE4(a2);
      break;
    case 3:
      id v3 = sub_23795E144(a2);
      break;
    case 4:
      id v3 = sub_23795E454(a2);
      break;
    case 7:
      id v3 = sub_23795E460(a2);
      break;
    case 8:
      id v4 = sub_23795E46C(a2);
      uint64_t v6 = v5;
      uint64_t v8 = v7;
      id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD078]), sel_initWithGaugeProvider_leadingTextProvider_trailingTextProvider_outerTextProvider_, v7, v5, 0, v4);
      goto LABEL_16;
    case 9:
      id v10 = sub_23795E46C(a2);
      uint64_t v12 = v11;
      uint64_t v14 = v13;
      id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD048]), sel_initWithGaugeProvider_bottomTextProvider_centerTextProvider_, v13, v11, v10);

      self;
      id v3 = (id)swift_dynamicCastObjCClass();
      if (v3) {
        id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD018]), sel_initWithCircularTemplate_, v3);
      }
      goto LABEL_17;
    case 10:
      id v4 = sub_23795E46C(a2);
      uint64_t v6 = v15;
      uint64_t v8 = v16;
      uint64_t v17 = (objc_class *)MEMORY[0x263EFD048];
      goto LABEL_15;
    case 11:
      break;
    case 12:
      id v4 = sub_23795E46C(a2);
      uint64_t v6 = v18;
      uint64_t v8 = v19;
      uint64_t v17 = (objc_class *)MEMORY[0x263EFD0C0];
LABEL_15:
      id v9 = objc_msgSend(objc_allocWithZone(v17), sel_initWithGaugeProvider_bottomTextProvider_centerTextProvider_, v8, v6, v4);
LABEL_16:
      id v3 = v9;

LABEL_17:
      break;
    default:
      if (*MEMORY[0x263EFCF20] == a1) {
        id v3 = sub_23795E720(a2);
      }
      else {
        id v3 = 0;
      }
      break;
  }
  if (!qword_26EA95AD8) {
    goto LABEL_25;
  }
  if (qword_26EA95AE8 == a1) {
    return v3;
  }
  if (qword_26EA95AD8 == 1)
  {
LABEL_25:
    if (v3)
    {
      double v22 = self;
      id v23 = v3;
      id v24 = objc_msgSend(v22, sel_clearColor);
      objc_msgSend(v23, sel_setTintColor_, v24);
    }
  }
  else
  {
    uint64_t v20 = 5;
    while (1)
    {
      uint64_t v21 = v20 - 3;
      if (__OFADD__(v20 - 4, 1))
      {
        __break(1u);
        JUMPOUT(0x23793D030);
      }
      if (qword_26EA95AC8[v20] == a1) {
        break;
      }
      ++v20;
      if (v21 == qword_26EA95AD8) {
        goto LABEL_25;
      }
    }
  }
  return v3;
}

void *sub_23793D064(void *result, void **a2)
{
  uint64_t v2 = result;
  if (result == (void *)11)
  {
    uint64_t result = sub_237957590(a2);
    id v3 = result;
  }
  else
  {
    id v3 = 0;
  }
  if (!qword_26EA95B20) {
    goto LABEL_11;
  }
  if ((void *)qword_26EA95B30 == v2) {
    return v3;
  }
  if (qword_26EA95B20 == 1)
  {
LABEL_11:
    if (v3)
    {
      uint64_t v6 = self;
      id v7 = v3;
      id v8 = objc_msgSend(v6, sel_clearColor);
      objc_msgSend(v7, sel_setTintColor_, v8);
    }
    return v3;
  }
  uint64_t v4 = 5;
  while (1)
  {
    uint64_t v5 = v4 - 3;
    if (__OFADD__(v4 - 4, 1)) {
      break;
    }
    if (*((void **)&unk_26EA95B10 + v4) == v2) {
      return v3;
    }
    ++v4;
    if (v5 == qword_26EA95B20) {
      goto LABEL_11;
    }
  }
  __break(1u);
  return result;
}

id sub_23793D158(uint64_t a1, uint64_t a2)
{
  id v3 = 0;
  switch(a1)
  {
    case 0:
      id v3 = sub_237966F30();
      break;
    case 1:
      id v3 = sub_23796703C(a2);
      break;
    case 2:
    case 6:
      id v3 = sub_237967324(a2);
      break;
    case 3:
      id v3 = sub_237967330(a2);
      break;
    case 4:
      id v3 = sub_237967560(a2);
      break;
    case 7:
      id v3 = sub_23796756C(a2);
      break;
    case 8:
      id v4 = sub_237967578(8, a2);
      uint64_t v6 = v5;
      id v8 = v7;
      id v9 = (objc_class *)MEMORY[0x263EFD088];
      goto LABEL_15;
    case 9:
      id v10 = sub_237967578(10, a2);
      uint64_t v12 = v11;
      uint64_t v14 = v13;
      id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD050]), sel_initWithImageProvider_gaugeProvider_textProvider_, v11, v13, v10);

      self;
      id v3 = (id)swift_dynamicCastObjCClass();
      if (v3) {
        id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD018]), sel_initWithCircularTemplate_, v3);
      }
      goto LABEL_16;
    case 10:
      id v4 = sub_237967578(10, a2);
      uint64_t v6 = v15;
      id v8 = v16;
      id v9 = (objc_class *)MEMORY[0x263EFD050];
      goto LABEL_15;
    case 11:
      break;
    case 12:
      id v4 = sub_237967578(12, a2);
      uint64_t v6 = v17;
      id v8 = v18;
      id v9 = (objc_class *)MEMORY[0x263EFD0C8];
LABEL_15:
      id v3 = objc_msgSend(objc_allocWithZone(v9), sel_initWithImageProvider_gaugeProvider_textProvider_, v6, v8, v4);

LABEL_16:
      break;
    default:
      if (*MEMORY[0x263EFCF20] == a1) {
        id v3 = sub_237967934(a2);
      }
      else {
        id v3 = 0;
      }
      break;
  }
  if (!qword_26EA95B68) {
    goto LABEL_24;
  }
  if (qword_26EA95B78 == a1) {
    return v3;
  }
  if (qword_26EA95B68 == 1)
  {
LABEL_24:
    if (v3)
    {
      uint64_t v21 = self;
      id v22 = v3;
      id v23 = objc_msgSend(v21, sel_clearColor);
      objc_msgSend(v22, sel_setTintColor_, v23);
    }
  }
  else
  {
    uint64_t v19 = 5;
    while (1)
    {
      uint64_t v20 = v19 - 3;
      if (__OFADD__(v19 - 4, 1))
      {
        __break(1u);
        JUMPOUT(0x23793D408);
      }
      if (qword_26EA95B58[v19] == a1) {
        break;
      }
      ++v19;
      if (v20 == qword_26EA95B68) {
        goto LABEL_24;
      }
    }
  }
  return v3;
}

void *sub_23793D43C(void *result, void **a2)
{
  uint64_t v2 = result;
  if (result == (void *)11)
  {
    uint64_t result = sub_23795812C(a2);
    id v3 = result;
  }
  else
  {
    id v3 = 0;
  }
  if (!qword_26EA95BB0) {
    goto LABEL_11;
  }
  if ((void *)qword_26EA95BC0 == v2) {
    return v3;
  }
  if (qword_26EA95BB0 == 1)
  {
LABEL_11:
    if (v3)
    {
      uint64_t v6 = self;
      id v7 = v3;
      id v8 = objc_msgSend(v6, sel_clearColor);
      objc_msgSend(v7, sel_setTintColor_, v8);
    }
    return v3;
  }
  uint64_t v4 = 5;
  while (1)
  {
    uint64_t v5 = v4 - 3;
    if (__OFADD__(v4 - 4, 1)) {
      break;
    }
    if (*((void **)&unk_26EA95BA0 + v4) == v2) {
      return v3;
    }
    ++v4;
    if (v5 == qword_26EA95BB0) {
      goto LABEL_11;
    }
  }
  __break(1u);
  return result;
}

void *sub_23793D530(void *result, void **a2)
{
  uint64_t v2 = result;
  if (result == (void *)11)
  {
    uint64_t result = sub_237929E44(a2);
    id v3 = result;
  }
  else
  {
    id v3 = 0;
  }
  if (!qword_26EA95BF8) {
    goto LABEL_11;
  }
  if ((void *)qword_26EA95C08 == v2) {
    return v3;
  }
  if (qword_26EA95BF8 == 1)
  {
LABEL_11:
    if (v3)
    {
      uint64_t v6 = self;
      id v7 = v3;
      id v8 = objc_msgSend(v6, sel_clearColor);
      objc_msgSend(v7, sel_setTintColor_, v8);
    }
    return v3;
  }
  uint64_t v4 = 5;
  while (1)
  {
    uint64_t v5 = v4 - 3;
    if (__OFADD__(v4 - 4, 1)) {
      break;
    }
    if (*((void **)&unk_26EA95BE8 + v4) == v2) {
      return v3;
    }
    ++v4;
    if (v5 == qword_26EA95BF8) {
      goto LABEL_11;
    }
  }
  __break(1u);
  return result;
}

void *sub_23793D624(void *result, id *a2)
{
  uint64_t v2 = result;
  if (result == (void *)11)
  {
    uint64_t result = sub_237949E48(a2);
    id v3 = result;
  }
  else
  {
    id v3 = 0;
  }
  if (!qword_26EA95C40) {
    goto LABEL_11;
  }
  if ((void *)qword_26EA95C50 == v2) {
    return v3;
  }
  if (qword_26EA95C40 == 1)
  {
LABEL_11:
    if (v3)
    {
      uint64_t v6 = self;
      id v7 = v3;
      id v8 = objc_msgSend(v6, sel_clearColor);
      objc_msgSend(v7, sel_setTintColor_, v8);
    }
    return v3;
  }
  uint64_t v4 = 5;
  while (1)
  {
    uint64_t v5 = v4 - 3;
    if (__OFADD__(v4 - 4, 1)) {
      break;
    }
    if (*((void **)&unk_26EA95C30 + v4) == v2) {
      return v3;
    }
    ++v4;
    if (v5 == qword_26EA95C40) {
      goto LABEL_11;
    }
  }
  __break(1u);
  return result;
}

uint64_t *sub_23793D718(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_23796E2A8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    id v9 = (char *)a1 + v8;
    id v10 = (char *)a2 + v8;
    uint64_t v11 = sub_23796E508();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      uint64_t v13 = sub_2379265BC(&qword_268937478);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v15 = *(int *)(a3 + 24);
    uint64_t v16 = (uint64_t *)((char *)a1 + v15);
    uint64_t v17 = (uint64_t *)((char *)a2 + v15);
    uint64_t v18 = *(uint64_t *)((char *)a2 + v15);
    uint64_t v19 = v17[1];
    void *v16 = v18;
    v16[1] = v19;
    uint64_t v20 = v17[3];
    v16[2] = v17[2];
    v16[3] = v20;
    uint64_t v21 = (int *)sub_23796E8C8();
    uint64_t v22 = v21[6];
    uint64_t v27 = (char *)v16 + v22;
    id v23 = (char *)v17 + v22;
    uint64_t v24 = sub_23796E358();
    uint64_t v25 = *(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v25(v27, v23, v24);
    *((unsigned char *)v16 + v21[7]) = *((unsigned char *)v17 + v21[7]);
    *(_OWORD *)((char *)v16 + v21[8]) = *(_OWORD *)((char *)v17 + v21[8]);
  }
  return a1;
}

uint64_t sub_23793D970(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_23796E508();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  uint64_t v8 = a1 + *(int *)(a2 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = v8 + *(int *)(sub_23796E8C8() + 24);
  uint64_t v10 = sub_23796E358();
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);

  return v11(v9, v10);
}

uint64_t sub_23793DAC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_23796E508();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_2379265BC(&qword_268937478);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  uint64_t v16 = *(void *)(a2 + v13);
  uint64_t v17 = v15[1];
  *uint64_t v14 = v16;
  v14[1] = v17;
  uint64_t v18 = v15[3];
  v14[2] = v15[2];
  v14[3] = v18;
  uint64_t v19 = (int *)sub_23796E8C8();
  uint64_t v20 = v19[6];
  uint64_t v21 = (char *)v14 + v20;
  uint64_t v22 = (char *)v15 + v20;
  uint64_t v23 = sub_23796E358();
  uint64_t v24 = *(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v24(v21, v22, v23);
  *((unsigned char *)v14 + v19[7]) = *((unsigned char *)v15 + v19[7]);
  *(_OWORD *)((char *)v14 + v19[8]) = *(_OWORD *)((char *)v15 + v19[8]);
  return a1;
}

uint64_t sub_23793DCCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_23796E508();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = sub_2379265BC(&qword_268937478);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  uint64_t v16 = *(int *)(a3 + 24);
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = a2 + v16;
  *uint64_t v17 = *(void *)(a2 + v16);
  v17[1] = *(void *)(a2 + v16 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v17[2] = *(void *)(v18 + 16);
  v17[3] = *(void *)(v18 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v19 = (int *)sub_23796E8C8();
  uint64_t v20 = v19[6];
  uint64_t v21 = (char *)v17 + v20;
  uint64_t v22 = v18 + v20;
  uint64_t v23 = sub_23796E358();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 24))(v21, v22, v23);
  *((unsigned char *)v17 + v19[7]) = *(unsigned char *)(v18 + v19[7]);
  uint64_t v24 = v19[8];
  uint64_t v25 = (void *)((char *)v17 + v24);
  uint64_t v26 = (void *)(v18 + v24);
  void *v25 = *v26;
  v25[1] = v26[1];
  return a1;
}

uint64_t sub_23793DF50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_23796E508();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_2379265BC(&qword_268937478);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v13 = *(int *)(a3 + 24);
  int v14 = (_OWORD *)(a1 + v13);
  uint64_t v15 = a2 + v13;
  long long v16 = *(_OWORD *)(a2 + v13 + 16);
  *int v14 = *(_OWORD *)(a2 + v13);
  v14[1] = v16;
  uint64_t v17 = (int *)sub_23796E8C8();
  uint64_t v18 = v17[6];
  uint64_t v19 = (char *)v14 + v18;
  uint64_t v20 = v15 + v18;
  uint64_t v21 = sub_23796E358();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 32))(v19, v20, v21);
  *((unsigned char *)v14 + v17[7]) = *(unsigned char *)(v15 + v17[7]);
  *(_OWORD *)((char *)v14 + v17[8]) = *(_OWORD *)(v15 + v17[8]);
  return a1;
}

uint64_t sub_23793E128(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_23796E508();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = sub_2379265BC(&qword_268937478);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  uint64_t v16 = *(int *)(a3 + 24);
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = a2 + v16;
  uint64_t v19 = *(void *)(a2 + v16 + 8);
  *uint64_t v17 = *(void *)(a2 + v16);
  v17[1] = v19;
  swift_bridgeObjectRelease();
  uint64_t v20 = *(void *)(v18 + 24);
  v17[2] = *(void *)(v18 + 16);
  v17[3] = v20;
  swift_bridgeObjectRelease();
  uint64_t v21 = (int *)sub_23796E8C8();
  uint64_t v22 = v21[6];
  uint64_t v23 = (char *)v17 + v22;
  uint64_t v24 = v18 + v22;
  uint64_t v25 = sub_23796E358();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 40))(v23, v24, v25);
  *((unsigned char *)v17 + v21[7]) = *(unsigned char *)(v18 + v21[7]);
  *(_OWORD *)((char *)v17 + v21[8]) = *(_OWORD *)(v18 + v21[8]);
  return a1;
}

uint64_t sub_23793E37C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23793E390);
}

uint64_t sub_23793E390(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23796E2A8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_2379265BC(&qword_268937478);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  uint64_t v14 = sub_23796E8C8();
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + *(int *)(a3 + 24);

  return v15(v17, a2, v16);
}

uint64_t sub_23793E4E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23793E4F4);
}

uint64_t sub_23793E4F4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_23796E2A8();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = sub_2379265BC(&qword_268937478);
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  uint64_t v16 = sub_23796E8C8();
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + *(int *)(a4 + 24);

  return v17(v19, a2, a2, v18);
}

void sub_23793E650()
{
  sub_23796E2A8();
  if (v0 <= 0x3F)
  {
    sub_23793E754();
    if (v1 <= 0x3F)
    {
      sub_23796E8C8();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_23793E754()
{
  if (!qword_2689375A8)
  {
    sub_23796E508();
    unint64_t v0 = sub_23796EC28();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2689375A8);
    }
  }
}

uint64_t sub_23793E7AC()
{
  type metadata accessor for ConditionTemplateFormatter();
  swift_allocObject();
  unint64_t v0 = sub_23793E824();
  uint64_t result = sub_237940B18(&qword_2689375B8, v1, (void (*)(uint64_t))type metadata accessor for ConditionTemplateFormatter);
  *(void *)&xmmword_268939450 = v0;
  *((void *)&xmmword_268939450 + 1) = result;
  return result;
}

void *sub_23793E824()
{
  sub_23796E988();
  uint64_t v1 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(self, sel_textProviderWithText_, v1);

  *(void *)(v0 + 16) = v2;
  sub_2379265BC(&qword_2689375C0);
  uint64_t v3 = sub_23796E5E8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 72);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_237971800;
  uint64_t v8 = *(void (**)(unint64_t, void, uint64_t))(v4 + 104);
  v8(v7 + v6, *MEMORY[0x263F1F4F0], v3);
  v8(v7 + v6 + v5, *MEMORY[0x263F1F4C0], v3);
  v8(v7 + v6 + 2 * v5, *MEMORY[0x263F1F440], v3);
  v8(v7 + v6 + 3 * v5, *MEMORY[0x263F1F4A0], v3);
  uint64_t v9 = sub_2379407F8(v7);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  v16[3] = v9;
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_237971810;
  v8(v10 + v6, *MEMORY[0x263F1F498], v3);
  v8(v10 + v6 + v5, *MEMORY[0x263F1F420], v3);
  v8(v10 + v6 + 2 * v5, *MEMORY[0x263F1F488], v3);
  uint64_t v11 = sub_2379407F8(v10);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  v16[4] = v11;
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_237971810;
  unint64_t v13 = v12 + v6;
  v8(v13, *MEMORY[0x263F1F450], v3);
  v8(v13 + v5, *MEMORY[0x263F1F430], v3);
  v8(v13 + 2 * v5, *MEMORY[0x263F1F4B0], v3);
  uint64_t v14 = sub_2379407F8(v12);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  uint64_t result = v16;
  v16[5] = v14;
  return result;
}

id sub_23793EBA0(uint64_t a1)
{
  uint64_t v3 = sub_2379265BC(&qword_268937570);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_23796E5E8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for ConditionTemplateModel();
  sub_2379266D8(a1 + *(int *)(v10 + 24), (uint64_t)v5, &qword_268937570);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_23792673C((uint64_t)v5, &qword_268937570);
    uint64_t v11 = *(void **)(v1 + 16);
    uint64_t v12 = self;
    id v13 = v11;
    id v14 = objc_msgSend(v12, sel_systemCyanColor);
    objc_msgSend(v13, sel_setTintColor_, v14);

    id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD120]), sel_initWithTextProvider_, v13);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
    id v16 = sub_23793F030((uint64_t)v9, *(unsigned char *)(a1 + *(int *)(v10 + 28)));
    id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD118]), sel_initWithImageProvider_, v16);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return v15;
}

id sub_23793EDE4(uint64_t a1)
{
  return sub_23793EE0C(a1, (Class *)0x263EFD160, (Class *)0x263EFD148);
}

id sub_23793EDF8(uint64_t a1)
{
  return sub_23793EE0C(a1, (Class *)0x263EFCFC0, (Class *)0x263EFCFD0);
}

id sub_23793EE0C(uint64_t a1, Class *a2, Class *a3)
{
  uint64_t v7 = sub_2379265BC(&qword_268937570);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_23796E5E8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  id v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for ConditionTemplateModel();
  sub_2379266D8(a1 + *(int *)(v14 + 24), (uint64_t)v9, &qword_268937570);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_23792673C((uint64_t)v9, &qword_268937570);
    return objc_msgSend(objc_allocWithZone(*a3), sel_initWithTextProvider_, *(void *)(v3 + 16));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v9, v10);
    id v16 = sub_23793F030((uint64_t)v13, *(unsigned char *)(a1 + *(int *)(v14 + 28)));
    id v15 = objc_msgSend(objc_allocWithZone(*a2), sel_initWithImageProvider_, v16);

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  return v15;
}

id sub_23793F008(uint64_t a1)
{
  return sub_23793EE0C(a1, (Class *)0x263EFCFF0, (Class *)0x263EFCFF8);
}

id sub_23793F01C(uint64_t a1)
{
  return sub_23793EE0C(a1, (Class *)0x263EFCFA0, (Class *)0x263EFCFA8);
}

id sub_23793F030(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  sub_23796E5A8();
  uint64_t v6 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(self, sel_symbolImageProviderWithSystemName_, v6);

  if (sub_23793F1E8(a1, v3[3]))
  {
    id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.376470588, 0.788235294, 0.97254902, 1.0);
  }
  else
  {
    if (sub_23793F1E8(a1, v3[4]))
    {
      uint64_t v9 = (objc_class *)MEMORY[0x263F825C8];
    }
    else
    {
      char v10 = sub_23793F1E8(a1, v3[5]);
      uint64_t v9 = (objc_class *)MEMORY[0x263F825C8];
      if ((v10 & 1) == 0 || (a2 & 1) == 0)
      {
        id v8 = objc_msgSend(self, sel_whiteColor);
        goto LABEL_8;
      }
    }
    id v8 = objc_msgSend(objc_allocWithZone(v9), sel_initWithRed_green_blue_alpha_, 0.992156863, 0.839215686, 0.270588235, 1.0);
  }
LABEL_8:
  uint64_t v11 = v8;
  objc_msgSend(v7, sel_setTintColor_, v8);
  id v12 = v7;
  sub_23796E5D8();
  id v13 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  objc_msgSend(v12, sel_setAccessibilityLabel_, v13);

  return v12;
}

uint64_t sub_23793F1E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_23796E5E8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a2 + 16)
    && (sub_237940B18(&qword_2689375D0, 255, MEMORY[0x263F1F528]),
        uint64_t v7 = sub_23796EA28(),
        uint64_t v8 = -1 << *(unsigned char *)(a2 + 32),
        unint64_t v9 = v7 & ~v8,
        uint64_t v10 = a2 + 56,
        ((*(void *)(a2 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0))
  {
    uint64_t v17 = ~v8;
    uint64_t v18 = a2;
    uint64_t v11 = v4 + 16;
    id v12 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
    uint64_t v13 = *(void *)(v11 + 56);
    uint64_t v14 = (void (**)(char *, uint64_t))(v11 - 8);
    do
    {
      v12(v6, *(void *)(v18 + 48) + v13 * v9, v3);
      sub_237940B18(&qword_2689375D8, 255, MEMORY[0x263F1F528]);
      char v15 = sub_23796EA58();
      (*v14)(v6, v3);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v17;
    }
    while (((*(void *)(v10 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  else
  {
    char v15 = 0;
  }
  return v15 & 1;
}

uint64_t sub_23793F404()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ConditionTemplateFormatter()
{
  return self;
}

uint64_t sub_23793F478()
{
  return sub_237940B18(&qword_2689375B0, 255, (void (*)(uint64_t))type metadata accessor for ConditionTemplateModel);
}

id sub_23793F4C4(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_2379265BC(&qword_268937570);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  unint64_t v9 = (char *)v29 - v8;
  uint64_t v10 = a1 + *(int *)(type metadata accessor for ConditionTemplateModel() + 24);
  sub_2379266D8(v10, (uint64_t)v9, &qword_268937570);
  uint64_t v11 = sub_23796E5E8();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  if (v13(v9, 1, v11) == 1)
  {
    sub_23792673C((uint64_t)v9, &qword_268937570);
LABEL_6:
    uint64_t v23 = sub_2379649CC(a2);
    if (v24) {
      uint64_t v25 = v23;
    }
    else {
      uint64_t v25 = 0;
    }
    unint64_t v26 = 0xE000000000000000;
    if (v24) {
      unint64_t v26 = v24;
    }
    v29[0] = v25;
    v29[1] = v26;
    sub_23796EAD8();
    uint64_t v27 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    id v22 = (id)NWCLocalizedImageNamed();

    id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD1A8]), sel_initWithFullColorImage_monochromeFilterType_, v22, 1);
    goto LABEL_14;
  }
  sub_23796E5A8();
  uint64_t v15 = v14;
  id v16 = v9;
  uint64_t v17 = *(void (**)(char *, uint64_t))(v12 + 8);
  v17(v16, v11);
  if (!v15) {
    goto LABEL_6;
  }
  uint64_t v18 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v19 = objc_msgSend(self, sel_symbolImageProviderWithSystemName_, v18);

  sub_2379266D8(v10, (uint64_t)v7, &qword_268937570);
  unsigned int v20 = v13(v7, 1, v11);
  id v21 = v19;
  if (v20 == 1)
  {
    sub_23792673C((uint64_t)v7, &qword_268937570);
    id v22 = 0;
  }
  else
  {
    sub_23796E5D8();
    v17(v7, v11);
    id v22 = (id)sub_23796EA68();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v21, sel_setAccessibilityLabel_, v22);

LABEL_14:
  return v21;
}

id sub_23793F7D8(uint64_t a1)
{
  uint64_t v2 = sub_2379265BC(&qword_268937360);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v138 = (char *)&v122 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v122 - v6;
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v139 = (char *)&v122 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v122 - v10;
  uint64_t v12 = sub_2379265BC(&qword_268937368);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v140 = (char *)&v122 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v141 = (char *)&v122 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v142 = (char *)&v122 - v18;
  uint64_t v19 = sub_2379265BC(&qword_268937570);
  MEMORY[0x270FA5388](v19 - 8);
  id v21 = (char *)&v122 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v22 = *(void **)sub_23796E968();
  uint64_t v23 = (int *)type metadata accessor for ConditionTemplateModel();
  sub_2379266D8(a1 + v23[6], (uint64_t)v21, &qword_268937570);
  uint64_t v24 = sub_23796E5E8();
  uint64_t v25 = *(void *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v21, 1, v24) == 1)
  {
    swift_retain();
    sub_23792673C((uint64_t)v21, &qword_268937570);
LABEL_9:
    if (qword_2689370E0 != -1) {
      swift_once();
    }
    id v38 = (id)qword_268937660;
    uint64_t v39 = (void *)sub_23796EA68();
    uint64_t v40 = (void *)sub_23796EA68();
    id v41 = objc_msgSend(v38, sel_localizedStringForKey_value_table_, v39, 0, v40);

    sub_23796EA98();
    uint64_t v42 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    id v43 = objc_msgSend(self, sel_textProviderWithText_, v42);

    goto LABEL_12;
  }
  uint64_t v137 = v7;
  uint64_t v143 = a1;
  swift_retain();
  a1 = v143;
  id v135 = (id)sub_23796E5C8();
  unint64_t v26 = v22;
  uint64_t v28 = v27;
  (*(void (**)(char *, uint64_t))(v25 + 8))(v21, v24);
  sub_2379266D8(a1 + v23[8], (uint64_t)v11, &qword_268937360);
  uint64_t v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  if (v29(v11, 1, v12) == 1)
  {
    swift_bridgeObjectRelease();
    sub_23792673C((uint64_t)v11, &qword_268937360);
    goto LABEL_9;
  }
  id v134 = v28;
  uint64_t v136 = v26;
  uint64_t v30 = v142;
  id v31 = v11;
  id v32 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
  v32(v142, v31, v12);
  uint64_t v33 = v139;
  sub_2379266D8(a1 + v23[9], (uint64_t)v139, &qword_268937360);
  if (v29(v33, 1, v12) == 1)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v30, v12);
    swift_bridgeObjectRelease();
    sub_23792673C((uint64_t)v33, &qword_268937360);
    goto LABEL_9;
  }
  uint64_t v34 = v141;
  v32(v141, v33, v12);
  uint64_t v35 = a1 + v23[10];
  uint64_t v36 = (uint64_t)v137;
  sub_2379266D8(v35, (uint64_t)v137, &qword_268937360);
  if (v29((char *)v36, 1, v12) == 1)
  {
    swift_bridgeObjectRelease();
    uint64_t v37 = *(void (**)(char *, uint64_t))(v13 + 8);
    v37(v34, v12);
    v37(v142, v12);
    sub_23792673C(v36, &qword_268937360);
    a1 = v143;
    goto LABEL_9;
  }
  v32(v140, (char *)v36, v12);
  uint64_t v49 = v13;
  uint64_t v50 = v13 + 16;
  uint64_t v51 = *(char **)(v13 + 16);
  uint64_t v52 = (uint64_t)v138;
  uint64_t v128 = v50;
  uint64_t v139 = v51;
  ((void (*)(char *, char *, uint64_t))v51)(v138, v142, v12);
  uint64_t v124 = v49;
  uint64_t v53 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v49 + 56);
  uint64_t v137 = (char *)(v49 + 56);
  uint64_t v133 = v53;
  v53(v52, 0, 1, v12);
  uint64_t v54 = (uint64_t (**)(uint64_t))(*v136 + 136);
  uint64_t v131 = *v54;
  v127 = v54;
  uint64_t v55 = v131(v52);
  uint64_t v129 = v12;
  uint64_t v56 = v55;
  uint64_t v58 = v57;
  sub_23792673C(v52, &qword_268937360);
  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v59 = (id)qword_268937660;
  uint64_t v60 = (void *)sub_23796EA68();
  unint64_t v126 = 0x800000023796F8F0;
  uint64_t v61 = (void *)sub_23796EA68();
  id v62 = objc_msgSend(v59, sel_localizedStringForKey_value_table_, v60, 0, v61);

  sub_23796EA98();
  uint64_t v125 = sub_2379265BC((uint64_t *)&unk_268937390);
  uint64_t v63 = swift_allocObject();
  long long v132 = xmmword_237971400;
  *(_OWORD *)(v63 + 16) = xmmword_237971400;
  uint64_t v64 = MEMORY[0x263F8D310];
  *(void *)(v63 + 56) = MEMORY[0x263F8D310];
  unint64_t v65 = sub_23792918C();
  unint64_t v130 = v65;
  *(void *)(v63 + 32) = v56;
  *(void *)(v63 + 40) = v58;
  *(void *)(v63 + 96) = v64;
  *(void *)(v63 + 104) = v65;
  id v66 = v135;
  *(void *)(v63 + 64) = v65;
  *(void *)(v63 + 72) = v66;
  *(void *)(v63 + 80) = v134;
  swift_bridgeObjectRetain();
  sub_23796EAA8();
  swift_bridgeObjectRelease();
  v67 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v68 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v134 = self;
  id v135 = objc_msgSend(v134, sel_textProviderWithText_shortText_, v67, v68);

  id v69 = (id)qword_268937660;
  uint64_t v70 = (void *)sub_23796EA68();
  uint64_t v71 = (void *)sub_23796EA68();
  id v72 = objc_msgSend(v69, sel_localizedStringForKey_value_table_, v70, 0, v71);

  uint64_t v123 = sub_23796EA98();
  uint64_t v122 = v73;

  uint64_t v74 = swift_allocObject();
  *(_OWORD *)(v74 + 16) = v132;
  uint64_t v75 = v129;
  ((void (*)(uint64_t, char *, uint64_t))v139)(v52, v140, v129);
  uint64_t v76 = v133;
  v133(v52, 0, 1, v75);
  uint64_t v77 = v76;
  uint64_t v78 = v131;
  uint64_t v79 = v131(v52);
  uint64_t v81 = v80;
  sub_23792673C(v52, &qword_268937360);
  unint64_t v82 = v130;
  *(void *)(v74 + 56) = MEMORY[0x263F8D310];
  *(void *)(v74 + 64) = v82;
  *(void *)(v74 + 32) = v79;
  *(void *)(v74 + 40) = v81;
  ((void (*)(uint64_t, char *, uint64_t))v139)(v52, v141, v75);
  v77(v52, 0, 1, v75);
  uint64_t v83 = v78(v52);
  uint64_t v85 = v84;
  sub_23792673C(v52, &qword_268937360);
  *(void *)(v74 + 96) = MEMORY[0x263F8D310];
  *(void *)(v74 + 104) = v82;
  *(void *)(v74 + 72) = v83;
  *(void *)(v74 + 80) = v85;
  sub_23796EAA8();
  swift_bridgeObjectRelease();
  uint64_t v86 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v87 = objc_msgSend(v134, sel_textProviderWithText_, v86);

  uint64_t v88 = (void *)qword_268937660;
  id v134 = v87;
  id v89 = v88;
  char v90 = (void *)sub_23796EA68();
  uint64_t v91 = (void *)sub_23796EA68();
  id v92 = objc_msgSend(v89, sel_localizedStringForKey_value_table_, v90, 0, v91);

  uint64_t v123 = sub_23796EA98();
  uint64_t v122 = v93;

  uint64_t v94 = swift_allocObject();
  *(_OWORD *)(v94 + 16) = v132;
  id v95 = (void (*)(uint64_t, char *, uint64_t))v139;
  ((void (*)(uint64_t, char *, uint64_t))v139)(v52, v140, v75);
  v133(v52, 0, 1, v75);
  uint64_t v96 = v131(v52);
  uint64_t v98 = v97;
  sub_23792673C(v52, &qword_268937360);
  unint64_t v99 = v130;
  *(void *)(v94 + 56) = MEMORY[0x263F8D310];
  *(void *)(v94 + 64) = v99;
  *(void *)(v94 + 32) = v96;
  *(void *)(v94 + 40) = v98;
  v95(v52, v141, v75);
  v133(v52, 0, 1, v75);
  uint64_t v100 = v131(v52);
  uint64_t v102 = v101;
  sub_23792673C(v52, &qword_268937360);
  unint64_t v103 = v130;
  *(void *)(v94 + 96) = MEMORY[0x263F8D310];
  *(void *)(v94 + 104) = v103;
  *(void *)(v94 + 72) = v100;
  *(void *)(v94 + 80) = v102;
  sub_23796EAA8();
  swift_bridgeObjectRelease();
  uint64_t v104 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v105 = v134;
  objc_msgSend(v134, sel_setAccessibilityLabel_, v104);

  uint64_t v106 = v105;
  unint64_t v107 = sub_2379407B8();
  id v108 = (id)qword_268937660;
  uint64_t v109 = (void *)sub_23796EA68();
  uint64_t v110 = (void *)sub_23796EA68();
  id v111 = objc_msgSend(v108, sel_localizedStringForKey_value_table_, v109, 0, v110);

  sub_23796EA98();
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = v132;
  *(void *)(inited + 56) = v107;
  uint64_t v113 = sub_237940B18((unint64_t *)&unk_268937820, 255, (void (*)(uint64_t))sub_2379407B8);
  uint64_t v114 = v135;
  *(void *)(inited + 32) = v135;
  *(void *)(inited + 96) = v107;
  *(void *)(inited + 104) = v113;
  *(void *)(inited + 64) = v113;
  *(void *)(inited + 72) = v106;
  id v115 = v106;
  id v116 = v114;
  uint64_t v117 = sub_23796EDF8();
  swift_setDeallocating();
  sub_2379265BC(&qword_2689373C0);
  swift_arrayDestroy();
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  uint64_t v119 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v43 = objc_msgSend(ObjCClassFromMetadata, sel_textProviderWithFormat_arguments_, v119, v117);

  uint64_t v120 = *(void (**)(char *, uint64_t))(v124 + 8);
  uint64_t v121 = v129;
  v120(v140, v129);
  v120(v141, v121);
  v120(v142, v121);
  a1 = v143;
LABEL_12:
  id v44 = sub_23793F4C4(a1, 0xAuLL);
  id v45 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD030]), sel_initWithImageProvider_, v44);
  uint64_t v46 = sub_23794B274();

  self;
  id v47 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD018]), sel_initWithCircularTemplate_textProvider_, swift_dynamicCastObjCClassUnconditional(), v43);
  swift_release();

  return v47;
}

unint64_t sub_2379407B8()
{
  unint64_t result = qword_2689373A0;
  if (!qword_2689373A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2689373A0);
  }
  return result;
}

uint64_t sub_2379407F8(uint64_t a1)
{
  uint64_t v2 = sub_23796E5E8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    sub_2379265BC(&qword_2689375C8);
    uint64_t v9 = sub_23796EC98();
    uint64_t v10 = 0;
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    id v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_237940B18(&qword_2689375D0, 255, MEMORY[0x263F1F528]);
      uint64_t v16 = sub_23796EA28();
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
          sub_237940B18(&qword_2689375D8, 255, MEMORY[0x263F1F528]);
          char v23 = sub_23796EA58();
          uint64_t v24 = *v15;
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
        uint64_t result = (*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
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
        return v9;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t sub_237940B18(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_237940B60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v81 = a2;
  uint64_t v3 = sub_23796E5E8();
  uint64_t v69 = *(void *)(v3 - 8);
  uint64_t v70 = v3;
  MEMORY[0x270FA5388](v3);
  id v68 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_23796E8C8();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v80 = (uint64_t)&v67 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_23796E658();
  unint64_t v73 = *(void *)(v67 - 8);
  MEMORY[0x270FA5388](v67);
  uint64_t v71 = (char *)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_23796E448();
  uint64_t v84 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v67 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2379265BC(&qword_268937508);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v78 = (uint64_t)&v67 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v67 - v15;
  MEMORY[0x270FA5388](v14);
  unint64_t v18 = (char *)&v67 - v17;
  uint64_t v19 = sub_2379265BC(&qword_268937478);
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  uint64_t v22 = (char *)&v67 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v67 - v23;
  uint64_t v25 = sub_23796E2A8();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v85 = (char *)&v67 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  uint64_t v30 = (char *)&v67 - v29;
  uint64_t v76 = v26;
  id v31 = *(void (**)(char *, char *, uint64_t))(v26 + 16);
  uint64_t v83 = v32;
  uint64_t v75 = v31;
  ((void (*)(char *, uint64_t))v31)((char *)&v67 - v29, a1);
  uint64_t v74 = type metadata accessor for TemplateData();
  uint64_t v33 = *(int *)(v74 + 20);
  uint64_t v79 = a1;
  sub_2379266D8(a1 + v33, (uint64_t)v24, &qword_268937478);
  uint64_t v77 = v24;
  sub_2379266D8((uint64_t)v24, (uint64_t)v22, &qword_268937478);
  uint64_t v34 = sub_23796E508();
  uint64_t v35 = *(void *)(v34 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v22, 1, v34) == 1)
  {
    sub_23792673C((uint64_t)v22, &qword_268937478);
    uint64_t v36 = v84;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v84 + 56))(v18, 1, 1, v8);
  }
  else
  {
    sub_23796E478();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v22, v34);
    uint64_t v36 = v84;
  }
  unint64_t v82 = 0xD000000000000013;
  sub_2379266D8((uint64_t)v18, (uint64_t)v16, &qword_268937508);
  uint64_t v37 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v36 + 48);
  int v72 = v37(v16, 1, v8);
  if (v72 == 1)
  {
    sub_23792673C((uint64_t)v16, &qword_268937508);
    unint64_t v73 = 0x80000002379701A0;
    uint64_t v38 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v10, v16, v8);
    sub_23796E3F8();
    uint64_t v38 = v39;
    uint64_t v40 = v71;
    sub_23796E3E8();
    id v41 = v40;
    uint64_t v42 = v67;
    int v43 = (*(uint64_t (**)(char *, uint64_t))(v73 + 88))(v41, v67);
    if (v43 == *MEMORY[0x263F1F588])
    {
      (*(void (**)(char *, uint64_t))(v36 + 8))(v10, v8);
      id v44 = "CHANCE_OF_HAIL_TEXT";
    }
    else
    {
      int v45 = v43;
      if (v43 == *MEMORY[0x263F1F5B0])
      {
        (*(void (**)(char *, uint64_t))(v84 + 8))(v10, v8);
        unint64_t v82 = 0xD000000000000014;
        id v44 = "CHANCE_OF_SLEET_TEXT";
      }
      else
      {
        int v46 = *MEMORY[0x263F1F5A0];
        (*(void (**)(char *, uint64_t))(v84 + 8))(v10, v8);
        if (v45 == v46)
        {
          id v44 = "CHANCE_OF_SNOW_TEXT";
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v73 + 8))(v71, v42);
          id v44 = "CHANCE_OF_RAIN_TEXT";
        }
      }
    }
    unint64_t v73 = (unint64_t)(v44 - 32) | 0x8000000000000000;
  }
  id v47 = *(uint64_t (**)(char *, void, void, uint64_t))(**(void **)sub_23796E9A8() + 152);
  swift_retain();
  uint64_t v48 = v47(v18, 0, 0, 1);
  uint64_t v50 = v49;
  swift_release();
  uint64_t v51 = v83;
  v75(v85, v30, v83);
  uint64_t v52 = v80;
  sub_23793345C(v79 + *(int *)(v74 + 24), v80);
  uint64_t v53 = v78;
  sub_2379266D8((uint64_t)v18, v78, &qword_268937508);
  if (v37((char *)v53, 1, v8) == 1)
  {
    sub_23792673C((uint64_t)v18, &qword_268937508);
    sub_23792673C((uint64_t)v77, &qword_268937478);
    uint64_t v54 = v76;
    (*(void (**)(char *, uint64_t))(v76 + 8))(v30, v51);
    sub_23792673C(v53, &qword_268937508);
    char v55 = 0;
  }
  else
  {
    uint64_t v56 = v68;
    sub_23796E438();
    uint64_t v57 = (*(uint64_t (**)(uint64_t, uint64_t))(v84 + 8))(v53, v8);
    char v58 = MEMORY[0x237E256B0](v57);
    uint64_t v51 = v83;
    char v55 = v58;
    (*(void (**)(char *, uint64_t))(v69 + 8))(v56, v70);
    sub_23792673C((uint64_t)v18, &qword_268937508);
    sub_23792673C((uint64_t)v77, &qword_268937478);
    uint64_t v54 = v76;
    (*(void (**)(char *, uint64_t))(v76 + 8))(v30, v51);
  }
  BOOL v59 = v72 == 1;
  uint64_t v60 = v81;
  (*(void (**)(uint64_t, char *, uint64_t))(v54 + 32))(v81, v85, v51);
  uint64_t v61 = (int *)type metadata accessor for ChanceRainTemplateModel();
  uint64_t result = sub_23793C910(v52, v60 + v61[5]);
  uint64_t v63 = v60 + v61[6];
  *(void *)uint64_t v63 = v38;
  *(unsigned char *)(v63 + 8) = v59;
  uint64_t v64 = (uint64_t *)(v60 + v61[7]);
  uint64_t *v64 = v48;
  v64[1] = v50;
  *(unsigned char *)(v60 + v61[8]) = v55 & 1;
  unint64_t v65 = (unint64_t *)(v60 + v61[9]);
  unint64_t v66 = v73;
  *unint64_t v65 = v82;
  v65[1] = v66;
  return result;
}

uint64_t sub_237941420@<X0>(uint64_t a1@<X8>)
{
  uint64_t v26 = sub_23796E2D8();
  uint64_t v2 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_23796E358();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v25 = sub_23796E2A8();
  uint64_t v6 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(uint64_t (**)(uint64_t, void, uint64_t))(**(void **)sub_23796E9A8() + 136);
  swift_retain();
  uint64_t v10 = v9(0x3FE3333333333333, 0, 1);
  uint64_t v23 = v11;
  uint64_t v24 = v10;
  uint64_t v12 = swift_release();
  sub_23792D380(v12);
  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v13 = (id)qword_268937660;
  uint64_t v14 = (void *)sub_23796EA68();
  uint64_t v15 = (void *)sub_23796EA68();
  id v16 = objc_msgSend(v13, sel_localizedStringForKey_value_table_, v14, 0, v15);

  sub_23796EA98();
  sub_23796E348();
  sub_23796E2C8();
  sub_23796E2B8();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v26);
  uint64_t v17 = (int *)type metadata accessor for ChanceRainTemplateModel();
  sub_23796E8A8();
  uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(a1, v8, v25);
  uint64_t v19 = a1 + v17[6];
  *(void *)uint64_t v19 = 0x3FE3333333333333;
  *(unsigned char *)(v19 + 8) = 0;
  uint64_t v20 = (uint64_t *)(a1 + v17[7]);
  uint64_t v21 = v23;
  *uint64_t v20 = v24;
  v20[1] = v21;
  *(unsigned char *)(a1 + v17[8]) = 1;
  uint64_t v22 = (void *)(a1 + v17[9]);
  *uint64_t v22 = 0xD000000000000013;
  v22[1] = 0x80000002379701A0;
  return result;
}

uint64_t sub_2379417B4(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 28));
  swift_bridgeObjectRetain();
  return v2;
}

unint64_t sub_2379417F0(uint64_t a1)
{
  unint64_t result = sub_237941818();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_237941818()
{
  unint64_t result = qword_2689375E0;
  if (!qword_2689375E0)
  {
    type metadata accessor for ChanceRainTemplateModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689375E0);
  }
  return result;
}

uint64_t type metadata accessor for ChanceRainTemplateModel()
{
  uint64_t result = qword_2689375E8;
  if (!qword_2689375E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *sub_2379418BC(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v27 = *a2;
    *a1 = *a2;
    a1 = (void *)(v27 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_23796E2A8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (void *)((char *)a1 + v8);
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = *(void *)((char *)a2 + v8 + 8);
    *uint64_t v9 = *(void *)((char *)a2 + v8);
    v9[1] = v11;
    uint64_t v12 = *(void *)((char *)a2 + v8 + 24);
    v9[2] = *(void *)((char *)a2 + v8 + 16);
    v9[3] = v12;
    id v13 = (int *)sub_23796E8C8();
    uint64_t v14 = v13[6];
    uint64_t v30 = &v10[v14];
    id v31 = (char *)v9 + v14;
    uint64_t v15 = sub_23796E358();
    uint64_t v29 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v29(v31, v30, v15);
    *((unsigned char *)v9 + v13[7]) = v10[v13[7]];
    *(_OWORD *)((char *)v9 + v13[8]) = *(_OWORD *)&v10[v13[8]];
    uint64_t v16 = a3[6];
    uint64_t v17 = a3[7];
    unint64_t v18 = (char *)a1 + v16;
    uint64_t v19 = (char *)a2 + v16;
    *(void *)unint64_t v18 = *(void *)v19;
    v18[8] = v19[8];
    uint64_t v20 = (void *)((char *)a1 + v17);
    uint64_t v21 = (void *)((char *)a2 + v17);
    uint64_t v22 = v21[1];
    *uint64_t v20 = *v21;
    v20[1] = v22;
    uint64_t v23 = a3[9];
    *((unsigned char *)a1 + a3[8]) = *((unsigned char *)a2 + a3[8]);
    uint64_t v24 = (void *)((char *)a1 + v23);
    uint64_t v25 = (void *)((char *)a2 + v23);
    uint64_t v26 = v25[1];
    *uint64_t v24 = *v25;
    v24[1] = v26;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_237941A94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = v5 + *(int *)(sub_23796E8C8() + 24);
  uint64_t v7 = sub_23796E358();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_237941B84(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a2 + v7 + 8);
  *uint64_t v8 = *(void *)(a2 + v7);
  v8[1] = v10;
  uint64_t v11 = *(void *)(a2 + v7 + 24);
  v8[2] = *(void *)(a2 + v7 + 16);
  v8[3] = v11;
  uint64_t v12 = (int *)sub_23796E8C8();
  uint64_t v13 = v12[6];
  uint64_t v28 = v9 + v13;
  uint64_t v29 = (char *)v8 + v13;
  uint64_t v14 = sub_23796E358();
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v27(v29, v28, v14);
  *((unsigned char *)v8 + v12[7]) = *(unsigned char *)(v9 + v12[7]);
  *(_OWORD *)((char *)v8 + v12[8]) = *(_OWORD *)(v9 + v12[8]);
  uint64_t v15 = a3[6];
  uint64_t v16 = a3[7];
  uint64_t v17 = a1 + v15;
  uint64_t v18 = a2 + v15;
  *(void *)uint64_t v17 = *(void *)v18;
  *(unsigned char *)(v17 + 8) = *(unsigned char *)(v18 + 8);
  uint64_t v19 = (void *)(a1 + v16);
  uint64_t v20 = (void *)(a2 + v16);
  uint64_t v21 = v20[1];
  *uint64_t v19 = *v20;
  v19[1] = v21;
  uint64_t v22 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (void *)(a2 + v22);
  uint64_t v25 = v24[1];
  *uint64_t v23 = *v24;
  v23[1] = v25;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_237941D0C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  *uint64_t v8 = *(void *)(a2 + v7);
  v8[1] = *(void *)(a2 + v7 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[2] = *(void *)(v9 + 16);
  v8[3] = *(void *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = (int *)sub_23796E8C8();
  uint64_t v11 = v10[6];
  uint64_t v12 = (char *)v8 + v11;
  uint64_t v13 = v9 + v11;
  uint64_t v14 = sub_23796E358();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  *((unsigned char *)v8 + v10[7]) = *(unsigned char *)(v9 + v10[7]);
  uint64_t v15 = v10[8];
  uint64_t v16 = (void *)((char *)v8 + v15);
  uint64_t v17 = (void *)(v9 + v15);
  void *v16 = *v17;
  v16[1] = v17[1];
  uint64_t v18 = a3[6];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  char v21 = *(unsigned char *)(v20 + 8);
  *(void *)uint64_t v19 = *(void *)v20;
  *(unsigned char *)(v19 + 8) = v21;
  uint64_t v22 = a3[7];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (void *)(a2 + v22);
  *uint64_t v23 = *v24;
  v23[1] = v24[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v25 = a3[9];
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = (void *)(a2 + v25);
  *uint64_t v26 = *v27;
  v26[1] = v27[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_237941ED4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (_OWORD *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  long long v10 = *(_OWORD *)(a2 + v7 + 16);
  *uint64_t v8 = *(_OWORD *)(a2 + v7);
  v8[1] = v10;
  uint64_t v11 = (int *)sub_23796E8C8();
  uint64_t v12 = v11[6];
  uint64_t v13 = (char *)v8 + v12;
  uint64_t v14 = v9 + v12;
  uint64_t v15 = sub_23796E358();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  *((unsigned char *)v8 + v11[7]) = *(unsigned char *)(v9 + v11[7]);
  *(_OWORD *)((char *)v8 + v11[8]) = *(_OWORD *)(v9 + v11[8]);
  uint64_t v16 = a3[6];
  uint64_t v17 = a3[7];
  uint64_t v18 = a1 + v16;
  uint64_t v19 = a2 + v16;
  *(void *)uint64_t v18 = *(void *)v19;
  *(unsigned char *)(v18 + 8) = *(unsigned char *)(v19 + 8);
  *(_OWORD *)(a1 + v17) = *(_OWORD *)(a2 + v17);
  uint64_t v20 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(_OWORD *)(a1 + v20) = *(_OWORD *)(a2 + v20);
  return a1;
}

uint64_t sub_23794200C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a2 + v7 + 8);
  *uint64_t v8 = *(void *)(a2 + v7);
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(v9 + 24);
  v8[2] = *(void *)(v9 + 16);
  v8[3] = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = (int *)sub_23796E8C8();
  uint64_t v13 = v12[6];
  uint64_t v14 = (char *)v8 + v13;
  uint64_t v15 = v9 + v13;
  uint64_t v16 = sub_23796E358();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 40))(v14, v15, v16);
  *((unsigned char *)v8 + v12[7]) = *(unsigned char *)(v9 + v12[7]);
  *(_OWORD *)((char *)v8 + v12[8]) = *(_OWORD *)(v9 + v12[8]);
  uint64_t v17 = a3[6];
  uint64_t v18 = a3[7];
  uint64_t v19 = a1 + v17;
  uint64_t v20 = a2 + v17;
  *(void *)uint64_t v19 = *(void *)v20;
  *(unsigned char *)(v19 + 8) = *(unsigned char *)(v20 + 8);
  char v21 = (void *)(a1 + v18);
  uint64_t v22 = (uint64_t *)(a2 + v18);
  uint64_t v24 = *v22;
  uint64_t v23 = v22[1];
  *char v21 = v24;
  v21[1] = v23;
  swift_bridgeObjectRelease();
  uint64_t v25 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = (uint64_t *)(a2 + v25);
  uint64_t v29 = *v27;
  uint64_t v28 = v27[1];
  *uint64_t v26 = v29;
  v26[1] = v28;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23794217C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_237942190);
}

uint64_t sub_237942190(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23796E2A8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_23796E8C8();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 28) + 8);
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t sub_2379422A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2379422BC);
}

uint64_t sub_2379422BC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_23796E2A8();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_23796E8C8();
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 28) + 8) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t sub_2379423D0()
{
  uint64_t result = sub_23796E2A8();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_23796E8C8();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_2379424B8()
{
  uint64_t v1 = sub_2379265BC(&qword_268937570);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[0] = 0;
  v8[1] = 0xE000000000000000;
  uint64_t v4 = type metadata accessor for ConditionTemplateModel();
  sub_2379266D8(v0 + *(int *)(v4 + 24), (uint64_t)v3, &qword_268937570);
  uint64_t v5 = sub_23796E5E8();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v3, 1, v5) == 1)
  {
    sub_23792673C((uint64_t)v3, &qword_268937570);
  }
  else
  {
    sub_23796E5C8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v3, v5);
  }
  sub_23796EAD8();
  swift_bridgeObjectRelease();
  return v8[0];
}

uint64_t sub_237942628()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2379265BC(&qword_268937360);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for ConditionTemplateModel();
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2379265BC(&qword_268937570);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2379266D8(v1 + *(int *)(v5 + 24), (uint64_t)v10, &qword_268937570);
  uint64_t v11 = sub_23796E5E8();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_23792673C((uint64_t)v10, &qword_268937570);
    sub_237943944(v1, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for ConditionTemplateModel);
LABEL_5:
    sub_23792B26C((uint64_t)v7);
    return 1;
  }
  sub_23796E5A8();
  uint64_t v14 = v13;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
  swift_bridgeObjectRelease();
  sub_237943944(v1, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for ConditionTemplateModel);
  if (!v14) {
    goto LABEL_5;
  }
  sub_2379266D8((uint64_t)&v7[*(int *)(v5 + 36)], (uint64_t)v4, &qword_268937360);
  sub_23792B26C((uint64_t)v7);
  uint64_t v15 = sub_2379265BC(&qword_268937368);
  BOOL v16 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48))(v4, 1, v15) == 1;
  sub_23792673C((uint64_t)v4, &qword_268937360);
  return v16;
}

uint64_t sub_2379428CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v89 = a2;
  uint64_t v3 = sub_2379265BC(&qword_268937360);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v88 = (char *)&v82 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v97 = (uint64_t)&v82 - v7;
  MEMORY[0x270FA5388](v6);
  id v87 = (char *)&v82 - v8;
  uint64_t v9 = sub_2379265BC(&qword_268937570);
  MEMORY[0x270FA5388](v9 - 8);
  id v92 = (char *)&v82 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = sub_23796E8C8();
  MEMORY[0x270FA5388](v83);
  uint64_t v91 = (uint64_t)&v82 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2379265BC(&qword_268937600);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v86 = (uint64_t)&v82 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v90 = (uint64_t)&v82 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v96 = (uint64_t)&v82 - v17;
  uint64_t v18 = sub_2379265BC(&qword_268937478);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  char v21 = (char *)&v82 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  uint64_t v24 = (char *)&v82 - v23;
  MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v82 - v25;
  uint64_t v27 = sub_23796E2A8();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  uint64_t v98 = (char *)&v82 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v29);
  uint64_t v32 = (char *)&v82 - v31;
  uint64_t v85 = v28;
  uint64_t v33 = *(void (**)(char *, uint64_t))(v28 + 16);
  uint64_t v94 = v34;
  v33((char *)&v82 - v31, a1);
  uint64_t v35 = type metadata accessor for TemplateData();
  uint64_t v36 = *(int *)(v35 + 20);
  uint64_t v84 = a1;
  sub_2379266D8(a1 + v36, (uint64_t)v26, &qword_268937478);
  id v95 = v26;
  sub_2379266D8((uint64_t)v26, (uint64_t)v24, &qword_268937478);
  uint64_t v37 = sub_23796E508();
  uint64_t v38 = *(void *)(v37 - 8);
  uint64_t v39 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v38 + 48);
  int v40 = v39(v24, 1, v37);
  uint64_t v93 = v32;
  if (v40 == 1)
  {
    sub_23792673C((uint64_t)v24, &qword_268937478);
    memset(v102, 0, sizeof(v102));
    uint64_t v103 = 0;
  }
  else
  {
    sub_23796E498();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v24, v37);
  }
  sub_2379266D8((uint64_t)v95, (uint64_t)v21, &qword_268937478);
  if (v39(v21, 1, v37) == 1)
  {
    sub_23792673C((uint64_t)v21, &qword_268937478);
    uint64_t v41 = sub_23796E3A8();
    uint64_t v42 = v96;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v96, 1, 1, v41);
  }
  else
  {
    uint64_t v46 = v96;
    sub_23796E458();
    id v47 = v21;
    uint64_t v42 = v46;
    (*(void (**)(char *, uint64_t))(v38 + 8))(v47, v37);
  }
  int v43 = v88;
  uint64_t v44 = (uint64_t)v87;
  uint64_t v45 = v94;
  uint64_t v48 = v84;
  uint64_t v49 = v84 + *(int *)(v35 + 24);
  LODWORD(v88) = sub_23796EBF8();
  ((void (*)(char *, uint64_t, uint64_t))v33)(v98, v48, v45);
  uint64_t v50 = v91;
  sub_237943944(v49, v91, MEMORY[0x263F580A0]);
  sub_2379266D8((uint64_t)v102, (uint64_t)v99, &qword_2689374C0);
  uint64_t v51 = v100;
  if (v100)
  {
    uint64_t v52 = v101;
    sub_23792E528(v99, v100);
    uint64_t v53 = (uint64_t)v92;
    (*(void (**)(uint64_t, uint64_t))(v52 + 40))(v51, v52);
    uint64_t v54 = sub_23796E5E8();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v54 - 8) + 56))(v53, 0, 1, v54);
    sub_23792E56C((uint64_t)v99);
  }
  else
  {
    sub_23792673C((uint64_t)v99, &qword_2689374C0);
    uint64_t v55 = sub_23796E5E8();
    uint64_t v53 = (uint64_t)v92;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56))(v92, 1, 1, v55);
  }
  sub_2379266D8((uint64_t)v102, (uint64_t)v99, &qword_2689374C0);
  uint64_t v56 = v100;
  if (v100)
  {
    uint64_t v57 = v101;
    sub_23792E528(v99, v100);
    (*(void (**)(uint64_t, uint64_t))(v57 + 88))(v56, v57);
    uint64_t v58 = sub_2379265BC(&qword_268937368);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v58 - 8) + 56))(v44, 0, 1, v58);
    sub_23792E56C((uint64_t)v99);
  }
  else
  {
    sub_23792673C((uint64_t)v99, &qword_2689374C0);
    uint64_t v59 = sub_2379265BC(&qword_268937368);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v59 - 8) + 56))(v44, 1, 1, v59);
  }
  uint64_t v60 = v90;
  sub_2379266D8(v42, v90, &qword_268937600);
  uint64_t v61 = sub_23796E3A8();
  uint64_t v62 = *(void *)(v61 - 8);
  uint64_t v63 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v62 + 48);
  uint64_t v64 = (uint64_t)v43;
  if (v63(v60, 1, v61) == 1)
  {
    sub_23792673C(v60, &qword_268937600);
    uint64_t v65 = sub_2379265BC(&qword_268937368);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v65 - 8) + 56))(v97, 1, 1, v65);
  }
  else
  {
    uint64_t v66 = v97;
    sub_23796E368();
    (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v60, v61);
    uint64_t v67 = sub_2379265BC(&qword_268937368);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v67 - 8) + 56))(v66, 0, 1, v67);
  }
  uint64_t v68 = v86;
  uint64_t v69 = v96;
  sub_2379266D8(v96, v86, &qword_268937600);
  if (v63(v68, 1, v61) == 1)
  {
    sub_23792673C(v69, &qword_268937600);
    sub_23792673C((uint64_t)v102, &qword_2689374C0);
    sub_23792673C((uint64_t)v95, &qword_268937478);
    uint64_t v70 = v85;
    uint64_t v71 = v94;
    (*(void (**)(char *, uint64_t))(v85 + 8))(v93, v94);
    sub_23792673C(v68, &qword_268937600);
    uint64_t v72 = sub_2379265BC(&qword_268937368);
    uint64_t v73 = v64;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v72 - 8) + 56))(v64, 1, 1, v72);
  }
  else
  {
    sub_23796E378();
    uint64_t v74 = v69;
    uint64_t v73 = v64;
    sub_23792673C(v74, &qword_268937600);
    sub_23792673C((uint64_t)v102, &qword_2689374C0);
    sub_23792673C((uint64_t)v95, &qword_268937478);
    uint64_t v75 = v85;
    uint64_t v71 = v94;
    (*(void (**)(char *, uint64_t))(v85 + 8))(v93, v94);
    uint64_t v76 = v61;
    uint64_t v70 = v75;
    (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v68, v76);
    uint64_t v77 = sub_2379265BC(&qword_268937368);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v77 - 8) + 56))(v64, 0, 1, v77);
  }
  uint64_t v78 = v89;
  char v79 = (char)v88;
  (*(void (**)(uint64_t, char *, uint64_t))(v70 + 32))(v89, v98, v71);
  uint64_t v80 = (int *)type metadata accessor for ConditionTemplateModel();
  sub_23793C910(v50, v78 + v80[5]);
  sub_237933DD4(v53, v78 + v80[6], &qword_268937570);
  *(unsigned char *)(v78 + v80[7]) = v79 & 1;
  sub_237933DD4(v44, v78 + v80[8], &qword_268937360);
  sub_237933DD4(v97, v78 + v80[9], &qword_268937360);
  return sub_237933DD4(v73, v78 + v80[10], &qword_268937360);
}

uint64_t sub_2379433C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_23796E2D8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_23796E358();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = sub_23796E2A8();
  uint64_t v30 = *(void *)(v7 - 8);
  uint64_t v31 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23792D380(v8);
  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v11 = (id)qword_268937660;
  uint64_t v12 = (void *)sub_23796EA68();
  uint64_t v13 = (void *)sub_23796EA68();
  id v14 = objc_msgSend(v11, sel_localizedStringForKey_value_table_, v12, 0, v13);

  sub_23796EA98();
  sub_23796E348();
  sub_23796E2C8();
  sub_23796E2B8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v15 = (int *)type metadata accessor for ConditionTemplateModel();
  sub_23796E8A8();
  uint64_t v16 = a1 + v15[6];
  uint64_t v17 = *MEMORY[0x263F1F450];
  uint64_t v18 = sub_23796E5E8();
  uint64_t v19 = *(void *)(v18 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 104))(v16, v17, v18);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  uint64_t v20 = a1 + v15[8];
  char v21 = self;
  id v22 = objc_msgSend(v21, sel_fahrenheit);
  sub_2379439AC();
  sub_23796E1B8();
  uint64_t v23 = sub_2379265BC(&qword_268937368);
  uint64_t v24 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56);
  v24(v20, 0, 1, v23);
  uint64_t v25 = a1 + v15[9];
  id v26 = objc_msgSend(v21, sel_fahrenheit);
  sub_23796E1B8();
  v24(v25, 0, 1, v23);
  uint64_t v27 = a1 + v15[10];
  id v28 = objc_msgSend(v21, sel_fahrenheit);
  sub_23796E1B8();
  v24(v27, 0, 1, v23);
  uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v30 + 32))(a1, v10, v31);
  *(unsigned char *)(a1 + v15[7]) = 1;
  return result;
}

unint64_t sub_237943878(uint64_t a1)
{
  unint64_t result = sub_2379438A0();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2379438A0()
{
  unint64_t result = qword_2689375F8;
  if (!qword_2689375F8)
  {
    type metadata accessor for ConditionTemplateModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689375F8);
  }
  return result;
}

uint64_t type metadata accessor for ConditionTemplateModel()
{
  uint64_t result = qword_268937610;
  if (!qword_268937610) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_237943944(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_2379439AC()
{
  unint64_t result = qword_268937608;
  if (!qword_268937608)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268937608);
  }
  return result;
}

void *sub_2379439EC(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v24 = *a2;
    *a1 = *a2;
    uint64_t v17 = (void *)(v24 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_23796E2A8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (void *)((char *)a1 + v8);
    int v43 = a2;
    uint64_t v10 = (void *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    uint64_t v12 = v10[3];
    v9[2] = v10[2];
    v9[3] = v12;
    uint64_t v13 = (int *)sub_23796E8C8();
    uint64_t v14 = v13[6];
    uint64_t v41 = (char *)v10 + v14;
    uint64_t v42 = (char *)v9 + v14;
    uint64_t v15 = sub_23796E358();
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v16(v42, v41, v15);
    uint64_t v17 = a1;
    *((unsigned char *)v9 + v13[7]) = *((unsigned char *)v10 + v13[7]);
    *(_OWORD *)((char *)v9 + v13[8]) = *(_OWORD *)((char *)v10 + v13[8]);
    uint64_t v18 = a3[6];
    uint64_t v19 = (char *)a1 + v18;
    uint64_t v20 = (char *)v43 + v18;
    uint64_t v21 = sub_23796E5E8();
    uint64_t v22 = *(void *)(v21 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
    {
      uint64_t v23 = sub_2379265BC(&qword_268937570);
      memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v19, v20, v21);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
    }
    uint64_t v25 = a3[8];
    *((unsigned char *)v17 + a3[7]) = *((unsigned char *)v43 + a3[7]);
    id v26 = (char *)v17 + v25;
    uint64_t v27 = (char *)v43 + v25;
    uint64_t v28 = sub_2379265BC(&qword_268937368);
    uint64_t v29 = *(void *)(v28 - 8);
    uint64_t v30 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48);
    if (v30(v27, 1, v28))
    {
      uint64_t v31 = sub_2379265BC(&qword_268937360);
      memcpy(v26, v27, *(void *)(*(void *)(v31 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v26, v27, v28);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
    }
    uint64_t v32 = a3[9];
    uint64_t v33 = (char *)v17 + v32;
    uint64_t v34 = (char *)v43 + v32;
    if (v30((char *)v43 + v32, 1, v28))
    {
      uint64_t v35 = sub_2379265BC(&qword_268937360);
      memcpy(v33, v34, *(void *)(*(void *)(v35 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v33, v34, v28);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v33, 0, 1, v28);
    }
    uint64_t v36 = a3[10];
    uint64_t v37 = (char *)v17 + v36;
    uint64_t v38 = (char *)v43 + v36;
    if (v30((char *)v43 + v36, 1, v28))
    {
      uint64_t v39 = sub_2379265BC(&qword_268937360);
      memcpy(v37, v38, *(void *)(*(void *)(v39 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v37, v38, v28);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v37, 0, 1, v28);
    }
  }
  return v17;
}

uint64_t sub_237943E70(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + a2[5];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = v5 + *(int *)(sub_23796E8C8() + 24);
  uint64_t v7 = sub_23796E358();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = a1 + a2[6];
  uint64_t v9 = sub_23796E5E8();
  uint64_t v10 = *(void *)(v9 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  }
  uint64_t v11 = a1 + a2[8];
  uint64_t v12 = sub_2379265BC(&qword_268937368);
  uint64_t v18 = *(void *)(v12 - 8);
  uint64_t v13 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v18 + 48);
  if (!v13(v11, 1, v12)) {
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v11, v12);
  }
  uint64_t v14 = a1 + a2[9];
  if (!v13(v14, 1, v12)) {
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v14, v12);
  }
  uint64_t v15 = a1 + a2[10];
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v13)(v15, 1, v12);
  if (!result)
  {
    uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t))(v18 + 8);
    return v17(v15, v12);
  }
  return result;
}

uint64_t sub_2379440FC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a2 + v7 + 8);
  *uint64_t v8 = *(void *)(a2 + v7);
  v8[1] = v10;
  uint64_t v11 = *(void *)(a2 + v7 + 24);
  void v8[2] = *(void *)(a2 + v7 + 16);
  v8[3] = v11;
  uint64_t v12 = (int *)sub_23796E8C8();
  uint64_t v13 = v12[6];
  uint64_t v39 = v9 + v13;
  int v40 = (char *)v8 + v13;
  uint64_t v14 = sub_23796E358();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v15(v40, v39, v14);
  uint64_t v16 = a1;
  *((unsigned char *)v8 + v12[7]) = *(unsigned char *)(v9 + v12[7]);
  *(_OWORD *)((char *)v8 + v12[8]) = *(_OWORD *)(v9 + v12[8]);
  uint64_t v17 = a3[6];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (const void *)(a2 + v17);
  uint64_t v20 = sub_23796E5E8();
  uint64_t v21 = *(void *)(v20 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
  {
    uint64_t v22 = sub_2379265BC(&qword_268937570);
    memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v21 + 16))(v18, v19, v20);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
  }
  uint64_t v23 = a3[8];
  *(unsigned char *)(v16 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  uint64_t v24 = (void *)(v16 + v23);
  uint64_t v25 = (const void *)(a2 + v23);
  uint64_t v26 = sub_2379265BC(&qword_268937368);
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v27 + 48);
  if (v28(v25, 1, v26))
  {
    uint64_t v29 = sub_2379265BC(&qword_268937360);
    memcpy(v24, v25, *(void *)(*(void *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v27 + 16))(v24, v25, v26);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
  }
  uint64_t v30 = a3[9];
  uint64_t v31 = (void *)(v16 + v30);
  uint64_t v32 = (const void *)(a2 + v30);
  if (v28((const void *)(a2 + v30), 1, v26))
  {
    uint64_t v33 = sub_2379265BC(&qword_268937360);
    memcpy(v31, v32, *(void *)(*(void *)(v33 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v27 + 16))(v31, v32, v26);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v27 + 56))(v31, 0, 1, v26);
  }
  uint64_t v34 = a3[10];
  uint64_t v35 = (void *)(v16 + v34);
  uint64_t v36 = (const void *)(a2 + v34);
  if (v28((const void *)(a2 + v34), 1, v26))
  {
    uint64_t v37 = sub_2379265BC(&qword_268937360);
    memcpy(v35, v36, *(void *)(*(void *)(v37 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v27 + 16))(v35, v36, v26);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v27 + 56))(v35, 0, 1, v26);
  }
  return v16;
}

uint64_t sub_23794452C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  *uint64_t v8 = *(void *)(a2 + v7);
  v8[1] = *(void *)(a2 + v7 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  void v8[2] = *(void *)(v9 + 16);
  v8[3] = *(void *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = (int *)sub_23796E8C8();
  uint64_t v11 = v10[6];
  uint64_t v12 = (char *)v8 + v11;
  uint64_t v13 = v9 + v11;
  uint64_t v14 = sub_23796E358();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  *((unsigned char *)v8 + v10[7]) = *(unsigned char *)(v9 + v10[7]);
  uint64_t v15 = v10[8];
  uint64_t v16 = (void *)((char *)v8 + v15);
  uint64_t v17 = (void *)(v9 + v15);
  void *v16 = *v17;
  v16[1] = v17[1];
  uint64_t v18 = a3[6];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (void *)(a2 + v18);
  uint64_t v21 = sub_23796E5E8();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v22 + 48);
  LODWORD(v8) = v23(v19, 1, v21);
  int v24 = v23(v20, 1, v21);
  if (v8)
  {
    if (!v24)
    {
      (*(void (**)(void *, void *, uint64_t))(v22 + 16))(v19, v20, v21);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v24)
  {
    (*(void (**)(void *, uint64_t))(v22 + 8))(v19, v21);
LABEL_6:
    uint64_t v25 = sub_2379265BC(&qword_268937570);
    memcpy(v19, v20, *(void *)(*(void *)(v25 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v22 + 24))(v19, v20, v21);
LABEL_7:
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  uint64_t v26 = a3[8];
  uint64_t v27 = (void *)(a1 + v26);
  uint64_t v28 = (void *)(a2 + v26);
  uint64_t v29 = sub_2379265BC(&qword_268937368);
  uint64_t v30 = *(void *)(v29 - 8);
  uint64_t v31 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v30 + 48);
  int v32 = v31(v27, 1, v29);
  int v33 = v31(v28, 1, v29);
  if (v32)
  {
    if (!v33)
    {
      (*(void (**)(void *, void *, uint64_t))(v30 + 16))(v27, v28, v29);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v33)
  {
    (*(void (**)(void *, uint64_t))(v30 + 8))(v27, v29);
LABEL_12:
    uint64_t v34 = sub_2379265BC(&qword_268937360);
    memcpy(v27, v28, *(void *)(*(void *)(v34 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v30 + 24))(v27, v28, v29);
LABEL_13:
  uint64_t v35 = a3[9];
  uint64_t v36 = (void *)(a1 + v35);
  uint64_t v37 = (void *)(a2 + v35);
  int v38 = v31((void *)(a1 + v35), 1, v29);
  int v39 = v31(v37, 1, v29);
  if (v38)
  {
    if (!v39)
    {
      (*(void (**)(void *, void *, uint64_t))(v30 + 16))(v36, v37, v29);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v30 + 56))(v36, 0, 1, v29);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v39)
  {
    (*(void (**)(void *, uint64_t))(v30 + 8))(v36, v29);
LABEL_18:
    uint64_t v40 = sub_2379265BC(&qword_268937360);
    memcpy(v36, v37, *(void *)(*(void *)(v40 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v30 + 24))(v36, v37, v29);
LABEL_19:
  uint64_t v41 = a3[10];
  uint64_t v42 = (void *)(a1 + v41);
  int v43 = (void *)(a2 + v41);
  int v44 = v31((void *)(a1 + v41), 1, v29);
  int v45 = v31(v43, 1, v29);
  if (!v44)
  {
    if (!v45)
    {
      (*(void (**)(void *, void *, uint64_t))(v30 + 24))(v42, v43, v29);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v30 + 8))(v42, v29);
    goto LABEL_24;
  }
  if (v45)
  {
LABEL_24:
    uint64_t v46 = sub_2379265BC(&qword_268937360);
    memcpy(v42, v43, *(void *)(*(void *)(v46 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v30 + 16))(v42, v43, v29);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v30 + 56))(v42, 0, 1, v29);
  return a1;
}

uint64_t sub_237944AEC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (_OWORD *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  long long v10 = *(_OWORD *)(a2 + v7 + 16);
  *uint64_t v8 = *(_OWORD *)(a2 + v7);
  v8[1] = v10;
  uint64_t v11 = (int *)sub_23796E8C8();
  uint64_t v12 = v11[6];
  uint64_t v13 = (char *)v8 + v12;
  uint64_t v14 = v9 + v12;
  uint64_t v15 = sub_23796E358();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  *((unsigned char *)v8 + v11[7]) = *(unsigned char *)(v9 + v11[7]);
  *(_OWORD *)((char *)v8 + v11[8]) = *(_OWORD *)(v9 + v11[8]);
  uint64_t v16 = a3[6];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (const void *)(a2 + v16);
  uint64_t v19 = sub_23796E5E8();
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
  {
    uint64_t v21 = sub_2379265BC(&qword_268937570);
    memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v20 + 32))(v17, v18, v19);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  }
  uint64_t v22 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  uint64_t v23 = (void *)(a1 + v22);
  int v24 = (const void *)(a2 + v22);
  uint64_t v25 = sub_2379265BC(&qword_268937368);
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v26 + 48);
  if (v27(v24, 1, v25))
  {
    uint64_t v28 = sub_2379265BC(&qword_268937360);
    memcpy(v23, v24, *(void *)(*(void *)(v28 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v26 + 32))(v23, v24, v25);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
  }
  uint64_t v29 = a3[9];
  uint64_t v30 = (void *)(a1 + v29);
  uint64_t v31 = (const void *)(a2 + v29);
  if (v27((const void *)(a2 + v29), 1, v25))
  {
    uint64_t v32 = sub_2379265BC(&qword_268937360);
    memcpy(v30, v31, *(void *)(*(void *)(v32 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v26 + 32))(v30, v31, v25);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v26 + 56))(v30, 0, 1, v25);
  }
  uint64_t v33 = a3[10];
  uint64_t v34 = (void *)(a1 + v33);
  uint64_t v35 = (const void *)(a2 + v33);
  if (v27(v35, 1, v25))
  {
    uint64_t v36 = sub_2379265BC(&qword_268937360);
    memcpy(v34, v35, *(void *)(*(void *)(v36 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v26 + 32))(v34, v35, v25);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v26 + 56))(v34, 0, 1, v25);
  }
  return a1;
}

uint64_t sub_237944EE8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a2 + v7 + 8);
  *uint64_t v8 = *(void *)(a2 + v7);
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(v9 + 24);
  void v8[2] = *(void *)(v9 + 16);
  v8[3] = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = (int *)sub_23796E8C8();
  uint64_t v13 = v12[6];
  uint64_t v14 = (char *)v8 + v13;
  uint64_t v15 = v9 + v13;
  uint64_t v16 = sub_23796E358();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 40))(v14, v15, v16);
  *((unsigned char *)v8 + v12[7]) = *(unsigned char *)(v9 + v12[7]);
  *(_OWORD *)((char *)v8 + v12[8]) = *(_OWORD *)(v9 + v12[8]);
  uint64_t v17 = a3[6];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)(a2 + v17);
  uint64_t v20 = sub_23796E5E8();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v21 + 48);
  LODWORD(v8) = v22(v18, 1, v20);
  int v23 = v22(v19, 1, v20);
  if (v8)
  {
    if (!v23)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 32))(v18, v19, v20);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v23)
  {
    (*(void (**)(void *, uint64_t))(v21 + 8))(v18, v20);
LABEL_6:
    uint64_t v24 = sub_2379265BC(&qword_268937570);
    memcpy(v18, v19, *(void *)(*(void *)(v24 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v21 + 40))(v18, v19, v20);
LABEL_7:
  uint64_t v25 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = (void *)(a2 + v25);
  uint64_t v28 = sub_2379265BC(&qword_268937368);
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v29 + 48);
  int v31 = v30(v26, 1, v28);
  int v32 = v30(v27, 1, v28);
  if (v31)
  {
    if (!v32)
    {
      (*(void (**)(void *, void *, uint64_t))(v29 + 32))(v26, v27, v28);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v32)
  {
    (*(void (**)(void *, uint64_t))(v29 + 8))(v26, v28);
LABEL_12:
    uint64_t v33 = sub_2379265BC(&qword_268937360);
    memcpy(v26, v27, *(void *)(*(void *)(v33 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v29 + 40))(v26, v27, v28);
LABEL_13:
  uint64_t v34 = a3[9];
  uint64_t v35 = (void *)(a1 + v34);
  uint64_t v36 = (void *)(a2 + v34);
  int v37 = v30((void *)(a1 + v34), 1, v28);
  int v38 = v30(v36, 1, v28);
  if (v37)
  {
    if (!v38)
    {
      (*(void (**)(void *, void *, uint64_t))(v29 + 32))(v35, v36, v28);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v29 + 56))(v35, 0, 1, v28);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v38)
  {
    (*(void (**)(void *, uint64_t))(v29 + 8))(v35, v28);
LABEL_18:
    uint64_t v39 = sub_2379265BC(&qword_268937360);
    memcpy(v35, v36, *(void *)(*(void *)(v39 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v29 + 40))(v35, v36, v28);
LABEL_19:
  uint64_t v40 = a3[10];
  uint64_t v41 = (void *)(a1 + v40);
  uint64_t v42 = (void *)(a2 + v40);
  int v43 = v30((void *)(a1 + v40), 1, v28);
  int v44 = v30(v42, 1, v28);
  if (!v43)
  {
    if (!v44)
    {
      (*(void (**)(void *, void *, uint64_t))(v29 + 40))(v41, v42, v28);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v29 + 8))(v41, v28);
    goto LABEL_24;
  }
  if (v44)
  {
LABEL_24:
    uint64_t v45 = sub_2379265BC(&qword_268937360);
    memcpy(v41, v42, *(void *)(*(void *)(v45 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v29 + 32))(v41, v42, v28);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v29 + 56))(v41, 0, 1, v28);
  return a1;
}

uint64_t sub_237945474(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_237945488);
}

uint64_t sub_237945488(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23796E2A8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_8:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_23796E8C8();
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[5];
LABEL_7:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_8;
  }
  uint64_t v14 = sub_2379265BC(&qword_268937570);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[6];
    goto LABEL_7;
  }
  if (a2 == 254)
  {
    unsigned int v16 = *(unsigned __int8 *)(a1 + a3[7]);
    if (v16 >= 2) {
      return ((v16 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v17 = sub_2379265BC(&qword_268937360);
    uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 48);
    uint64_t v19 = v17;
    uint64_t v20 = a1 + a3[8];
    return v18(v20, a2, v19);
  }
}

uint64_t sub_237945668(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23794567C);
}

uint64_t sub_23794567C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_23796E2A8();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_8:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = sub_23796E8C8();
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v14 = *(void *)(v13 - 8);
    uint64_t v15 = a4[5];
LABEL_7:
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_8;
  }
  uint64_t result = sub_2379265BC(&qword_268937570);
  if (*(_DWORD *)(*(void *)(result - 8) + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v14 = *(void *)(result - 8);
    uint64_t v15 = a4[6];
    goto LABEL_7;
  }
  if (a3 == 254)
  {
    *(unsigned char *)(a1 + a4[7]) = a2 + 1;
  }
  else
  {
    uint64_t v17 = sub_2379265BC(&qword_268937360);
    uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
    uint64_t v19 = v17;
    uint64_t v20 = a1 + a4[8];
    return v18(v20, a2, a2, v19);
  }
  return result;
}

void sub_23794584C()
{
  sub_23796E2A8();
  if (v0 <= 0x3F)
  {
    sub_23796E8C8();
    if (v1 <= 0x3F)
    {
      sub_237945998();
      if (v2 <= 0x3F)
      {
        sub_2379459F0();
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_237945998()
{
  if (!qword_268937620)
  {
    sub_23796E5E8();
    unint64_t v0 = sub_23796EC28();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268937620);
    }
  }
}

void sub_2379459F0()
{
  if (!qword_268937628)
  {
    sub_23792D044(&qword_268937368);
    unint64_t v0 = sub_23796EC28();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268937628);
    }
  }
}

uint64_t sub_237945A4C@<X0>(char *a1@<X8>)
{
  uint64_t v72 = a1;
  uint64_t v1 = sub_23796E2D8();
  uint64_t v70 = *(void *)(v1 - 8);
  uint64_t v71 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v68 = (char *)&v58 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_23796E358();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v69 = (char *)&v58 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for ConditionTemplateModel();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v67 = (uint64_t)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_23796E2A8();
  uint64_t v75 = *(void *)(v65 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v65);
  uint64_t v66 = (char *)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v74 = (char *)&v58 - v9;
  sub_2379265BC(&qword_268937638);
  uint64_t v10 = sub_2379265BC(&qword_268937640);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  uint64_t v13 = v10 - 8;
  uint64_t v61 = v10 - 8;
  unint64_t v14 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v63 = 4 * v12;
  uint64_t v15 = swift_allocObject();
  uint64_t v64 = v15;
  *(_OWORD *)(v15 + 16) = xmmword_2379710C0;
  unint64_t v16 = v15 + v14;
  unint64_t v17 = v16 + *(int *)(v13 + 56);
  uint64_t v18 = self;
  id v19 = objc_msgSend(v18, sel_fahrenheit);
  sub_237926638(0, (unint64_t *)&qword_268937608);
  sub_23796E1B8();
  uint64_t v20 = *MEMORY[0x263F1F450];
  uint64_t v21 = sub_23796E5E8();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v73 = *(void (**)(unint64_t, uint64_t, uint64_t))(v22 + 104);
  uint64_t v23 = v22 + 104;
  v73(v17, v20, v21);
  uint64_t v58 = v23;
  uint64_t v59 = v12;
  unint64_t v24 = v16;
  uint64_t v25 = v61;
  unint64_t v26 = v16 + v12 + *(int *)(v61 + 56);
  id v27 = objc_msgSend(v18, sel_fahrenheit);
  sub_23796E1B8();
  unint64_t v28 = v26;
  unsigned int v62 = v20;
  uint64_t v60 = v21;
  uint64_t v29 = v73;
  v73(v28, v20, v21);
  v12 *= 2;
  unint64_t v30 = v24 + v12 + *(int *)(v25 + 56);
  id v31 = objc_msgSend(v18, sel_fahrenheit);
  sub_23796E1B8();
  v29(v30, v20, v21);
  unint64_t v32 = v24;
  unint64_t v33 = v24 + v12 + v59 + *(int *)(v25 + 56);
  uint64_t v34 = v18;
  id v35 = objc_msgSend(v18, sel_fahrenheit);
  sub_23796E1B8();
  uint64_t v36 = v60;
  int v37 = v73;
  v73(v33, *MEMORY[0x263F1F4B0], v60);
  uint64_t v38 = v32 + v63 + *(int *)(v25 + 56);
  id v39 = objc_msgSend(v34, sel_fahrenheit);
  sub_23796E1B8();
  v37(v38, v62, v36);
  uint64_t v40 = v65;
  uint64_t v80 = 0;
  uint64_t v81 = MEMORY[0x263F8EE78];
  uint64_t v41 = *(void *)sub_23796E968();
  uint64_t v42 = swift_retain();
  int v43 = v74;
  sub_23792D380(v42);
  int v44 = v66;
  sub_23796E1F8();
  uint64_t v76 = v41;
  uint64_t v77 = v64;
  uint64_t v78 = &v80;
  char v79 = &v81;
  sub_23796E258();
  uint64_t v45 = *(void (**)(char *, uint64_t))(v75 + 8);
  v45(v44, v40);
  v45(v43, v40);
  swift_bridgeObjectRelease();
  id v46 = objc_allocWithZone(MEMORY[0x263F58060]);
  sub_237926638(0, (unint64_t *)&qword_268937260);
  swift_bridgeObjectRetain();
  id v47 = (void *)sub_23796EB08();
  swift_bridgeObjectRelease();
  uint64_t v73 = (void (*)(unint64_t, uint64_t, uint64_t))objc_msgSend(v46, sel_initWithEntries_, v47);

  uint64_t v48 = v67;
  uint64_t v49 = sub_2379433C8(v67);
  sub_23792D380(v49);
  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v50 = (id)qword_268937660;
  uint64_t v51 = (void *)sub_23796EA68();
  uint64_t v52 = (void *)sub_23796EA68();
  id v53 = objc_msgSend(v50, sel_localizedStringForKey_value_table_, v51, 0, v52);

  sub_23796EA98();
  sub_23796E348();
  uint64_t v54 = v68;
  sub_23796E2C8();
  sub_23796E2B8();
  (*(void (**)(char *, uint64_t))(v70 + 8))(v54, v71);
  uint64_t v55 = type metadata accessor for ConditionRectangularTemplateModel();
  uint64_t v56 = v72;
  sub_23796E8A8();
  swift_release();
  *(void *)uint64_t v56 = v73;
  sub_237946ED8(v48, (uint64_t)&v56[*(int *)(v55 + 20)]);
  (*(void (**)(char *, char *, uint64_t))(v75 + 32))(&v56[*(int *)(v55 + 24)], v74, v40);
  return swift_bridgeObjectRelease();
}

uint64_t sub_237946214(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, unint64_t *a5)
{
  uint64_t v10 = sub_2379265BC(&qword_268937268);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_2379265BC(&qword_268937640);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  unint64_t v16 = (char *)v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_2379265BC(&qword_268937360);
  MEMORY[0x270FA5388](v17 - 8);
  id v19 = (char *)v41 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v20 = *a4;
  if ((*a4 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  unint64_t v21 = *(void *)(a3 + 16);
  if (v20 >= v21)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v41[1] = a1;
  int v44 = v12;
  uint64_t v45 = a5;
  unint64_t v47 = v21;
  uint64_t v12 = (char *)(a3 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80)));
  uint64_t v22 = v13;
  uint64_t v13 = *(void *)(v14 + 72);
  sub_2379266D8((uint64_t)&v12[v13 * v20], (uint64_t)v16, &qword_268937640);
  uint64_t v42 = v22;
  id v46 = &v16[*(int *)(v22 + 48)];
  uint64_t v23 = sub_2379265BC(&qword_268937368);
  a5 = a4;
  a4 = *(unint64_t **)(v23 - 8);
  ((void (*)(char *, char *, uint64_t))a4[4])(v19, v16, v23);
  ((void (*)(char *, void, uint64_t, uint64_t))a4[7])(v19, 0, 1, v23);
  uint64_t v24 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)a2 + 152))(v19, 1, 1);
  uint64_t v43 = v25;
  sub_23792673C((uint64_t)v19, &qword_268937360);
  uint64_t v26 = sub_23796E5E8();
  id v27 = *(void (**)(char *, uint64_t))(*(void *)(v26 - 8) + 8);
  v27(v46, v26);
  unint64_t v28 = *a5;
  if (*a5 >= v47)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  unint64_t v47 = v24;
  sub_2379266D8((uint64_t)&v12[v28 * v13], (uint64_t)v16, &qword_268937640);
  uint64_t v29 = &v16[*(int *)(v42 + 48)];
  uint64_t v13 = sub_23796E5A8();
  uint64_t v12 = v30;
  v27(v29, v26);
  ((void (*)(char *, uint64_t))a4[1])(v16, v23);
  a4 = a5;
  if (!*a5)
  {
    uint64_t v34 = 0;
    uint64_t v36 = 0;
    a5 = v45;
    goto LABEL_8;
  }
  a5 = v45;
  if (qword_2689370E8 != -1) {
    goto LABEL_16;
  }
  while (1)
  {
    id v31 = (id)qword_268937668;
    unint64_t v32 = (void *)sub_23796E228();
    id v33 = objc_msgSend(v31, sel_stringFromDate_, v32);

    uint64_t v34 = sub_23796EA98();
    uint64_t v36 = v35;

LABEL_8:
    uint64_t v37 = (uint64_t)v44;
    sub_23796E348();
    uint64_t v38 = sub_23796E358();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v37, 0, 1, v38);
    id v39 = objc_allocWithZone(MEMORY[0x263F58068]);
    uint64_t v12 = (char *)sub_237933770(v47, v43, v13, (uint64_t)v12, v34, v36, 1, v37);
    MEMORY[0x237E25BF0]();
    if (*(void *)((*a5 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*a5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
LABEL_14:
    }
      sub_23796EB38();
    sub_23796EB58();
    uint64_t result = sub_23796EB28();
    if (!__OFADD__(*a4, 1)) {
      break;
    }
    __break(1u);
LABEL_16:
    swift_once();
  }
  ++*a4;
  return result;
}

uint64_t sub_2379466E8(uint64_t a1)
{
  uint64_t result = sub_23794938C(&qword_268937630, (void (*)(uint64_t))type metadata accessor for ConditionRectangularTemplateModel);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata accessor for ConditionRectangularTemplateModel()
{
  uint64_t result = qword_268937648;
  if (!qword_268937648) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_23794678C(uint64_t a1, uint64_t a2, int a3)
{
  int v64 = a3;
  uint64_t v68 = a1;
  uint64_t v4 = sub_2379265BC(&qword_268937360);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  unsigned int v62 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v60 = (char *)&v51 - v7;
  uint64_t v63 = sub_2379265BC(&qword_268937368);
  uint64_t v8 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  uint64_t v61 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_23796E448();
  uint64_t v10 = *(void *)(v66 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v66);
  uint64_t v56 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v54 = (char *)&v51 - v13;
  uint64_t v14 = sub_2379265BC(&qword_268937238);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  uint64_t v53 = (uint64_t)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v51 - v17;
  uint64_t v19 = sub_2379265BC(&qword_268937570);
  MEMORY[0x270FA5388](v19 - 8);
  unint64_t v21 = (char *)&v51 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_23796E5E8();
  uint64_t v67 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v65 = (char *)&v51 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = a2;
  sub_2379266D8(a2, (uint64_t)v18, &qword_268937238);
  uint64_t v24 = sub_23796E548();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v51 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v25 + 48);
  int v26 = v51(v18, 1, v24);
  uint64_t v58 = v8;
  if (v26 == 1)
  {
    sub_23792673C((uint64_t)v18, &qword_268937238);
    uint64_t v27 = 1;
  }
  else
  {
    sub_23796E538();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v18, v24);
    uint64_t v27 = 0;
  }
  uint64_t v28 = v67;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v67 + 56))(v21, v27, 1, v22);
  uint64_t v29 = v54;
  uint64_t v30 = v66;
  uint64_t v52 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v52(v54, v68, v66);
  int v31 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48))(v21, 1, v22);
  uint64_t v59 = v22;
  uint64_t v57 = v10;
  if (v31 == 1)
  {
    sub_23796E438();
    unint64_t v32 = *(void (**)(char *, uint64_t))(v10 + 8);
    v32(v29, v30);
    sub_23792673C((uint64_t)v21, &qword_268937570);
  }
  else
  {
    id v33 = *(void (**)(char *, uint64_t))(v10 + 8);
    v33(v29, v30);
    uint64_t v34 = v22;
    unint64_t v32 = v33;
    (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v65, v21, v34);
  }
  uint64_t v35 = v58;
  uint64_t v36 = v53;
  sub_2379266D8(v55, v53, &qword_268937238);
  int v37 = v51((char *)v36, 1, v24);
  uint64_t v38 = v63;
  uint64_t v39 = (uint64_t)v60;
  if (v37 == 1)
  {
    sub_23792673C(v36, &qword_268937238);
    uint64_t v40 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v35 + 56);
    v40(v39, 1, 1, v38);
  }
  else
  {
    sub_23796E518();
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v36, v24);
    uint64_t v40 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v35 + 56);
    v40(v39, 0, 1, v38);
  }
  uint64_t v41 = v61;
  uint64_t v42 = v56;
  uint64_t v43 = v66;
  v52(v56, v68, v66);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v35 + 48))(v39, 1, v38) == 1)
  {
    sub_23796E3D8();
    v32(v42, v43);
    sub_23792673C(v39, &qword_268937360);
  }
  else
  {
    v32(v42, v43);
    (*(void (**)(char *, uint64_t, uint64_t))(v35 + 32))(v41, v39, v38);
  }
  uint64_t v44 = v59;
  uint64_t v45 = *(void *)sub_23796E968();
  uint64_t v46 = (uint64_t)v62;
  (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v62, v41, v38);
  v40(v46, 0, 1, v38);
  unint64_t v47 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v45 + 152);
  swift_retain();
  uint64_t v48 = v47(v46, 1, 1);
  sub_23792673C(v46, &qword_268937360);
  uint64_t v49 = v65;
  sub_23796E5A8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v41, v38);
  (*(void (**)(char *, uint64_t))(v67 + 8))(v49, v44);
  return v48;
}

uint64_t sub_237946ECC(uint64_t a1)
{
  return sub_237946214(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(unint64_t **)(v1 + 32), *(unint64_t **)(v1 + 40));
}

uint64_t sub_237946ED8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ConditionTemplateModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void **sub_237946F3C(void **a1, void **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    int v31 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v5 = a3[5];
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v56 = (char *)a2 + v5;
    uint64_t v8 = sub_23796E2A8();
    uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
    uint64_t v10 = v4;
    uint64_t v58 = v6;
    uint64_t v61 = v9;
    uint64_t v62 = v8;
    v9(v6, v7, v8);
    uint64_t v57 = (int *)type metadata accessor for ConditionTemplateModel();
    uint64_t v11 = v57[5];
    uint64_t v12 = &v6[v11];
    uint64_t v13 = &v7[v11];
    uint64_t v14 = *(void *)&v7[v11 + 8];
    *(void *)uint64_t v12 = *(void *)&v7[v11];
    *((void *)v12 + 1) = v14;
    uint64_t v15 = *(void *)&v7[v11 + 16];
    uint64_t v16 = *((void *)v13 + 3);
    *((void *)v12 + 2) = v15;
    *((void *)v12 + 3) = v16;
    uint64_t v17 = (int *)sub_23796E8C8();
    uint64_t v18 = v17[6];
    uint64_t v19 = &v12[v18];
    uint64_t v20 = &v13[v18];
    uint64_t v21 = sub_23796E358();
    uint64_t v22 = *(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v59 = v21;
    uint64_t v23 = v21;
    uint64_t v24 = v22;
    v22(v19, v20, v23);
    v12[v17[7]] = v13[v17[7]];
    *(_OWORD *)&v12[v17[8]] = *(_OWORD *)&v13[v17[8]];
    uint64_t v25 = v57[6];
    int v26 = &v58[v25];
    uint64_t v27 = &v56[v25];
    uint64_t v28 = sub_23796E5E8();
    uint64_t v29 = *(void *)(v28 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28))
    {
      uint64_t v30 = sub_2379265BC(&qword_268937570);
      memcpy(v26, v27, *(void *)(*(void *)(v30 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v26, v27, v28);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
    }
    v58[v57[7]] = v56[v57[7]];
    uint64_t v32 = v57[8];
    id v33 = &v58[v32];
    uint64_t v34 = &v56[v32];
    uint64_t v35 = sub_2379265BC(&qword_268937368);
    uint64_t v36 = *(void *)(v35 - 8);
    int v37 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48);
    if (v37(v34, 1, v35))
    {
      uint64_t v38 = sub_2379265BC(&qword_268937360);
      memcpy(v33, v34, *(void *)(*(void *)(v38 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v33, v34, v35);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
    }
    uint64_t v39 = v57[9];
    uint64_t v40 = &v58[v39];
    uint64_t v41 = &v56[v39];
    if (v37(&v56[v39], 1, v35))
    {
      uint64_t v42 = sub_2379265BC(&qword_268937360);
      memcpy(v40, v41, *(void *)(*(void *)(v42 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v40, v41, v35);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v40, 0, 1, v35);
    }
    uint64_t v43 = v57[10];
    uint64_t v44 = &v58[v43];
    uint64_t v45 = &v56[v43];
    if (v37(&v56[v43], 1, v35))
    {
      uint64_t v46 = sub_2379265BC(&qword_268937360);
      memcpy(v44, v45, *(void *)(*(void *)(v46 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v44, v45, v35);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v44, 0, 1, v35);
    }
    int v31 = a1;
    v61((char *)a1 + a3[6], (char *)a2 + a3[6], v62);
    uint64_t v47 = a3[7];
    uint64_t v48 = (void **)((char *)a1 + v47);
    uint64_t v49 = (char *)a2 + v47;
    uint64_t v50 = *(uint64_t *)((char *)a2 + v47 + 8);
    *uint64_t v48 = *(void **)((char *)a2 + v47);
    v48[1] = v50;
    uint64_t v51 = *(uint64_t *)((char *)a2 + v47 + 24);
    void v48[2] = *(void **)((char *)a2 + v47 + 16);
    v48[3] = v51;
    uint64_t v52 = v17[6];
    uint64_t v53 = (char *)v48 + v52;
    uint64_t v54 = &v49[v52];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v24(v53, v54, v59);
    *((unsigned char *)v48 + v17[7]) = v49[v17[7]];
    *(_OWORD *)((char *)v48 + v17[8]) = *(_OWORD *)&v49[v17[8]];
  }
  return v31;
}

uint64_t sub_237947480(id *a1, uint64_t a2)
{
  uint64_t v25 = a2;
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_23796E2A8();
  uint64_t v24 = *(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);
  v24(v4, v5);
  uint64_t v6 = (int *)type metadata accessor for ConditionTemplateModel();
  uint64_t v7 = &v4[v6[5]];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v23 = sub_23796E8C8();
  uint64_t v8 = &v7[*(int *)(v23 + 24)];
  uint64_t v9 = sub_23796E358();
  uint64_t v22 = *(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8);
  v22(v8, v9);
  uint64_t v10 = &v4[v6[6]];
  uint64_t v11 = sub_23796E5E8();
  uint64_t v12 = *(void *)(v11 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11)) {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
  }
  uint64_t v13 = &v4[v6[8]];
  uint64_t v14 = sub_2379265BC(&qword_268937368);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
  if (!v16(v13, 1, v14)) {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v13, v14);
  }
  uint64_t v17 = &v4[v6[9]];
  if (!v16(v17, 1, v14)) {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
  uint64_t v18 = &v4[v6[10]];
  if (!v16(v18, 1, v14)) {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
  }
  v24((char *)a1 + *(int *)(v25 + 24), v5);
  uint64_t v19 = (char *)a1 + *(int *)(v25 + 28);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v20 = &v19[*(int *)(v23 + 24)];

  return ((uint64_t (*)(char *, uint64_t))v22)(v20, v9);
}

void **sub_23794778C(void **a1, void **a2, int *a3)
{
  int v3 = *a2;
  *a1 = *a2;
  uint64_t v4 = a3[5];
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v51 = (char *)a1 + v4;
  uint64_t v52 = (char *)a2 + v4;
  uint64_t v7 = sub_23796E2A8();
  uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
  id v9 = v3;
  uint64_t v54 = v8;
  uint64_t v55 = v7;
  v8(v5, v6, v7);
  uint64_t v10 = (int *)type metadata accessor for ConditionTemplateModel();
  uint64_t v11 = v10[5];
  uint64_t v12 = &v5[v11];
  uint64_t v13 = &v6[v11];
  uint64_t v14 = *(void *)&v6[v11 + 8];
  *(void *)uint64_t v12 = *(void *)&v6[v11];
  *((void *)v12 + 1) = v14;
  uint64_t v15 = *(void *)&v6[v11 + 24];
  *((void *)v12 + 2) = *(void *)&v6[v11 + 16];
  *((void *)v12 + 3) = v15;
  uint64_t v16 = (int *)sub_23796E8C8();
  uint64_t v17 = v16[6];
  uint64_t v18 = &v12[v17];
  uint64_t v53 = &v13[v17];
  uint64_t v19 = sub_23796E358();
  uint64_t v20 = *(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v20(v18, v53, v19);
  v12[v16[7]] = v13[v16[7]];
  *(_OWORD *)&v12[v16[8]] = *(_OWORD *)&v13[v16[8]];
  uint64_t v21 = v10[6];
  uint64_t v22 = &v51[v21];
  uint64_t v23 = &v52[v21];
  uint64_t v24 = sub_23796E5E8();
  uint64_t v25 = *(void *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
  {
    uint64_t v26 = sub_2379265BC(&qword_268937570);
    memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v22, v23, v24);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
  }
  v51[v10[7]] = v52[v10[7]];
  uint64_t v27 = v10[8];
  uint64_t v28 = &v51[v27];
  uint64_t v29 = &v52[v27];
  uint64_t v30 = sub_2379265BC(&qword_268937368);
  uint64_t v31 = *(void *)(v30 - 8);
  uint64_t v32 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48);
  if (v32(v29, 1, v30))
  {
    uint64_t v33 = sub_2379265BC(&qword_268937360);
    memcpy(v28, v29, *(void *)(*(void *)(v33 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v28, v29, v30);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v28, 0, 1, v30);
  }
  uint64_t v34 = v10[9];
  uint64_t v35 = &v51[v34];
  uint64_t v36 = &v52[v34];
  if (v32(&v52[v34], 1, v30))
  {
    uint64_t v37 = sub_2379265BC(&qword_268937360);
    memcpy(v35, v36, *(void *)(*(void *)(v37 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v35, v36, v30);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v35, 0, 1, v30);
  }
  uint64_t v38 = v10[10];
  uint64_t v39 = &v51[v38];
  uint64_t v40 = &v52[v38];
  if (v32(&v52[v38], 1, v30))
  {
    uint64_t v41 = sub_2379265BC(&qword_268937360);
    memcpy(v39, v40, *(void *)(*(void *)(v41 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v39, v40, v30);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v39, 0, 1, v30);
  }
  v54((char *)a1 + a3[6], (char *)a2 + a3[6], v55);
  uint64_t v42 = a3[7];
  uint64_t v43 = (void **)((char *)a1 + v42);
  uint64_t v44 = (char *)a2 + v42;
  uint64_t v45 = *(uint64_t *)((char *)a2 + v42 + 8);
  void *v43 = *(void **)((char *)a2 + v42);
  v43[1] = v45;
  uint64_t v46 = *(uint64_t *)((char *)a2 + v42 + 24);
  v43[2] = *(void **)((char *)a2 + v42 + 16);
  v43[3] = v46;
  uint64_t v47 = v16[6];
  uint64_t v48 = (char *)v43 + v47;
  uint64_t v49 = &v44[v47];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v20(v48, v49, v19);
  *((unsigned char *)v43 + v16[7]) = v44[v16[7]];
  *(_OWORD *)((char *)v43 + v16[8]) = *(_OWORD *)&v44[v16[8]];
  return a1;
}

void **sub_237947C8C(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a1;
  *a1 = *a2;
  id v8 = v6;

  uint64_t v67 = a3;
  uint64_t v68 = a2;
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v69 = a1;
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_23796E2A8();
  uint64_t v65 = *(void (**)(char *, char *))(*(void *)(v12 - 8) + 24);
  uint64_t v66 = v12;
  v65(v10, v11);
  uint64_t v13 = (int *)type metadata accessor for ConditionTemplateModel();
  uint64_t v14 = v13[5];
  uint64_t v15 = &v10[v14];
  uint64_t v16 = &v11[v14];
  *(void *)uint64_t v15 = *(void *)&v11[v14];
  *((void *)v15 + 1) = *(void *)&v11[v14 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v15 + 2) = *((void *)v16 + 2);
  *((void *)v15 + 3) = *((void *)v16 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = (int *)sub_23796E8C8();
  uint64_t v18 = v17[6];
  uint64_t v19 = &v15[v18];
  uint64_t v20 = &v16[v18];
  uint64_t v21 = sub_23796E358();
  uint64_t v62 = *(void (**)(char *, char *))(*(void *)(v21 - 8) + 24);
  uint64_t v63 = v21;
  v62(v19, v20);
  v15[v17[7]] = v16[v17[7]];
  int v64 = v17;
  uint64_t v22 = v17[8];
  uint64_t v23 = &v15[v22];
  uint64_t v24 = &v16[v22];
  *(void *)uint64_t v23 = *(void *)v24;
  *((void *)v23 + 1) = *((void *)v24 + 1);
  uint64_t v25 = v13[6];
  uint64_t v26 = &v10[v25];
  uint64_t v27 = &v11[v25];
  uint64_t v28 = sub_23796E5E8();
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v29 + 48);
  int v31 = v30(v26, 1, v28);
  int v32 = v30(v27, 1, v28);
  if (v31)
  {
    if (!v32)
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v26, v27, v28);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v32)
  {
    (*(void (**)(char *, uint64_t))(v29 + 8))(v26, v28);
LABEL_6:
    uint64_t v33 = sub_2379265BC(&qword_268937570);
    memcpy(v26, v27, *(void *)(*(void *)(v33 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v29 + 24))(v26, v27, v28);
LABEL_7:
  v10[v13[7]] = v11[v13[7]];
  uint64_t v34 = v13[8];
  uint64_t v35 = &v10[v34];
  uint64_t v36 = &v11[v34];
  uint64_t v37 = sub_2379265BC(&qword_268937368);
  uint64_t v38 = *(void *)(v37 - 8);
  uint64_t v39 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v38 + 48);
  int v40 = v39(v35, 1, v37);
  int v41 = v39(v36, 1, v37);
  if (v40)
  {
    if (!v41)
    {
      (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v35, v36, v37);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v38 + 56))(v35, 0, 1, v37);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v41)
  {
    (*(void (**)(char *, uint64_t))(v38 + 8))(v35, v37);
LABEL_12:
    uint64_t v42 = sub_2379265BC(&qword_268937360);
    memcpy(v35, v36, *(void *)(*(void *)(v42 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v38 + 24))(v35, v36, v37);
LABEL_13:
  uint64_t v43 = v13[9];
  uint64_t v44 = &v10[v43];
  uint64_t v45 = &v11[v43];
  int v46 = v39(&v10[v43], 1, v37);
  int v47 = v39(v45, 1, v37);
  if (v46)
  {
    if (!v47)
    {
      (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v44, v45, v37);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v38 + 56))(v44, 0, 1, v37);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v47)
  {
    (*(void (**)(char *, uint64_t))(v38 + 8))(v44, v37);
LABEL_18:
    uint64_t v48 = sub_2379265BC(&qword_268937360);
    memcpy(v44, v45, *(void *)(*(void *)(v48 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v38 + 24))(v44, v45, v37);
LABEL_19:
  uint64_t v49 = v13[10];
  uint64_t v50 = &v10[v49];
  uint64_t v51 = &v11[v49];
  int v52 = v39(&v10[v49], 1, v37);
  int v53 = v39(v51, 1, v37);
  if (!v52)
  {
    if (!v53)
    {
      (*(void (**)(char *, char *, uint64_t))(v38 + 24))(v50, v51, v37);
      goto LABEL_25;
    }
    (*(void (**)(char *, uint64_t))(v38 + 8))(v50, v37);
    goto LABEL_24;
  }
  if (v53)
  {
LABEL_24:
    uint64_t v54 = sub_2379265BC(&qword_268937360);
    memcpy(v50, v51, *(void *)(*(void *)(v54 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v50, v51, v37);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v38 + 56))(v50, 0, 1, v37);
LABEL_25:
  ((void (*)(char *, char *, uint64_t))v65)((char *)v69 + *(int *)(v67 + 24), (char *)v68 + *(int *)(v67 + 24), v66);
  uint64_t v55 = *(int *)(v67 + 28);
  uint64_t v56 = (void **)((char *)v69 + v55);
  uint64_t v57 = (char *)v68 + v55;
  *uint64_t v56 = *(void **)((char *)v68 + v55);
  v56[1] = *(void **)((char *)v68 + v55 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v56[2] = *((void *)v57 + 2);
  v56[3] = *((void *)v57 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  ((void (*)(char *, char *, uint64_t))v62)((char *)v56 + v64[6], &v57[v64[6]], v63);
  *((unsigned char *)v56 + v64[7]) = v57[v64[7]];
  uint64_t v58 = v64[8];
  uint64_t v59 = (void *)((char *)v56 + v58);
  uint64_t v60 = &v57[v58];
  void *v59 = *(void *)v60;
  v59[1] = *((void *)v60 + 1);
  return v69;
}

void *sub_237948358(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v3 = a3[5];
  uint64_t v4 = (char *)a1 + v3;
  uint64_t v5 = (char *)a2 + v3;
  uint64_t v6 = sub_23796E2A8();
  uint64_t v45 = *(void (**)(char *, char *))(*(void *)(v6 - 8) + 32);
  uint64_t v46 = v6;
  v45(v4, v5);
  uint64_t v7 = (int *)type metadata accessor for ConditionTemplateModel();
  uint64_t v8 = v7[5];
  uint64_t v9 = &v4[v8];
  uint64_t v10 = &v5[v8];
  long long v11 = *(_OWORD *)&v5[v8 + 16];
  *(_OWORD *)uint64_t v9 = *(_OWORD *)&v5[v8];
  *((_OWORD *)v9 + 1) = v11;
  uint64_t v12 = (int *)sub_23796E8C8();
  uint64_t v13 = v12[6];
  uint64_t v14 = &v9[v13];
  uint64_t v15 = &v10[v13];
  uint64_t v16 = sub_23796E358();
  uint64_t v43 = *(void (**)(char *, char *))(*(void *)(v16 - 8) + 32);
  uint64_t v44 = v16;
  v43(v14, v15);
  v9[v12[7]] = v10[v12[7]];
  *(_OWORD *)&v9[v12[8]] = *(_OWORD *)&v10[v12[8]];
  uint64_t v17 = v7[6];
  uint64_t v18 = &v4[v17];
  uint64_t v19 = &v5[v17];
  uint64_t v20 = sub_23796E5E8();
  uint64_t v21 = *(void *)(v20 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
  {
    uint64_t v22 = sub_2379265BC(&qword_268937570);
    memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v18, v19, v20);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
  }
  v4[v7[7]] = v5[v7[7]];
  uint64_t v23 = v7[8];
  uint64_t v24 = &v4[v23];
  uint64_t v25 = &v5[v23];
  uint64_t v26 = sub_2379265BC(&qword_268937368);
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48);
  if (v28(v25, 1, v26))
  {
    uint64_t v29 = sub_2379265BC(&qword_268937360);
    memcpy(v24, v25, *(void *)(*(void *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v24, v25, v26);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
  }
  uint64_t v30 = v7[9];
  int v31 = &v4[v30];
  int v32 = &v5[v30];
  if (v28(&v5[v30], 1, v26))
  {
    uint64_t v33 = sub_2379265BC(&qword_268937360);
    memcpy(v31, v32, *(void *)(*(void *)(v33 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v31, v32, v26);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v31, 0, 1, v26);
  }
  uint64_t v34 = v7[10];
  uint64_t v35 = &v4[v34];
  uint64_t v36 = &v5[v34];
  if (v28(&v5[v34], 1, v26))
  {
    uint64_t v37 = sub_2379265BC(&qword_268937360);
    memcpy(v35, v36, *(void *)(*(void *)(v37 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v35, v36, v26);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v35, 0, 1, v26);
  }
  ((void (*)(char *, char *, uint64_t))v45)((char *)a1 + a3[6], (char *)a2 + a3[6], v46);
  uint64_t v38 = a3[7];
  uint64_t v39 = (_OWORD *)((char *)a1 + v38);
  int v40 = (char *)a2 + v38;
  long long v41 = *(_OWORD *)((char *)a2 + v38 + 16);
  _OWORD *v39 = *(_OWORD *)((char *)a2 + v38);
  v39[1] = v41;
  ((void (*)(char *, char *, uint64_t))v43)((char *)a1 + v38 + v12[6], (char *)a2 + v38 + v12[6], v44);
  *((unsigned char *)v39 + v12[7]) = v40[v12[7]];
  *(_OWORD *)((char *)v39 + v12[8]) = *(_OWORD *)&v40[v12[8]];
  return a1;
}

void **sub_237948800(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v63 = a3;
  int v64 = a2;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v65 = a1;
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_23796E2A8();
  uint64_t v61 = *(void (**)(char *, char *))(*(void *)(v10 - 8) + 40);
  uint64_t v62 = v10;
  v61(v8, v9);
  long long v11 = (int *)type metadata accessor for ConditionTemplateModel();
  uint64_t v12 = v11[5];
  uint64_t v13 = &v8[v12];
  uint64_t v14 = &v9[v12];
  uint64_t v15 = *(void *)&v9[v12 + 8];
  *(void *)uint64_t v13 = *(void *)&v9[v12];
  *((void *)v13 + 1) = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = *((void *)v14 + 3);
  *((void *)v13 + 2) = *((void *)v14 + 2);
  *((void *)v13 + 3) = v16;
  swift_bridgeObjectRelease();
  uint64_t v17 = (int *)sub_23796E8C8();
  uint64_t v18 = v17[6];
  uint64_t v19 = &v13[v18];
  uint64_t v20 = &v14[v18];
  uint64_t v21 = sub_23796E358();
  uint64_t v58 = *(void (**)(char *, char *))(*(void *)(v21 - 8) + 40);
  uint64_t v59 = v21;
  v58(v19, v20);
  v13[v17[7]] = v14[v17[7]];
  uint64_t v60 = v17;
  *(_OWORD *)&v13[v17[8]] = *(_OWORD *)&v14[v17[8]];
  uint64_t v22 = v11[6];
  uint64_t v23 = &v8[v22];
  uint64_t v24 = &v9[v22];
  uint64_t v25 = sub_23796E5E8();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v26 + 48);
  int v28 = v27(v23, 1, v25);
  int v29 = v27(v24, 1, v25);
  if (v28)
  {
    if (!v29)
    {
      (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v23, v24, v25);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v29)
  {
    (*(void (**)(char *, uint64_t))(v26 + 8))(v23, v25);
LABEL_6:
    uint64_t v30 = sub_2379265BC(&qword_268937570);
    memcpy(v23, v24, *(void *)(*(void *)(v30 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v26 + 40))(v23, v24, v25);
LABEL_7:
  v8[v11[7]] = v9[v11[7]];
  uint64_t v31 = v11[8];
  int v32 = &v8[v31];
  uint64_t v33 = &v9[v31];
  uint64_t v34 = sub_2379265BC(&qword_268937368);
  uint64_t v35 = *(void *)(v34 - 8);
  uint64_t v36 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v35 + 48);
  int v37 = v36(v32, 1, v34);
  int v38 = v36(v33, 1, v34);
  if (v37)
  {
    if (!v38)
    {
      (*(void (**)(char *, char *, uint64_t))(v35 + 32))(v32, v33, v34);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v38)
  {
    (*(void (**)(char *, uint64_t))(v35 + 8))(v32, v34);
LABEL_12:
    uint64_t v39 = sub_2379265BC(&qword_268937360);
    memcpy(v32, v33, *(void *)(*(void *)(v39 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v35 + 40))(v32, v33, v34);
LABEL_13:
  uint64_t v40 = v11[9];
  long long v41 = &v8[v40];
  uint64_t v42 = &v9[v40];
  int v43 = v36(&v8[v40], 1, v34);
  int v44 = v36(v42, 1, v34);
  if (v43)
  {
    if (!v44)
    {
      (*(void (**)(char *, char *, uint64_t))(v35 + 32))(v41, v42, v34);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v41, 0, 1, v34);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v44)
  {
    (*(void (**)(char *, uint64_t))(v35 + 8))(v41, v34);
LABEL_18:
    uint64_t v45 = sub_2379265BC(&qword_268937360);
    memcpy(v41, v42, *(void *)(*(void *)(v45 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v35 + 40))(v41, v42, v34);
LABEL_19:
  uint64_t v46 = v11[10];
  int v47 = &v8[v46];
  uint64_t v48 = &v9[v46];
  int v49 = v36(&v8[v46], 1, v34);
  int v50 = v36(v48, 1, v34);
  if (!v49)
  {
    if (!v50)
    {
      (*(void (**)(char *, char *, uint64_t))(v35 + 40))(v47, v48, v34);
      goto LABEL_25;
    }
    (*(void (**)(char *, uint64_t))(v35 + 8))(v47, v34);
    goto LABEL_24;
  }
  if (v50)
  {
LABEL_24:
    uint64_t v51 = sub_2379265BC(&qword_268937360);
    memcpy(v47, v48, *(void *)(*(void *)(v51 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(char *, char *, uint64_t))(v35 + 32))(v47, v48, v34);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v47, 0, 1, v34);
LABEL_25:
  ((void (*)(char *, char *, uint64_t))v61)((char *)v65 + *(int *)(v63 + 24), (char *)v64 + *(int *)(v63 + 24), v62);
  uint64_t v52 = *(int *)(v63 + 28);
  int v53 = (void **)((char *)v65 + v52);
  uint64_t v54 = (char *)v64 + v52;
  uint64_t v55 = *(uint64_t *)((char *)v64 + v52 + 8);
  *int v53 = *(void **)((char *)v64 + v52);
  v53[1] = v55;
  swift_bridgeObjectRelease();
  uint64_t v56 = *((void *)v54 + 3);
  v53[2] = *((void *)v54 + 2);
  v53[3] = v56;
  swift_bridgeObjectRelease();
  ((void (*)(char *, char *, uint64_t))v58)((char *)v53 + v60[6], &v54[v60[6]], v59);
  *((unsigned char *)v53 + v60[7]) = v54[v60[7]];
  *(_OWORD *)((char *)v53 + v60[8]) = *(_OWORD *)&v54[v60[8]];
  return v65;
}

uint64_t sub_237948E68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_237948E7C);
}

uint64_t sub_237948E7C(char *a1, uint64_t a2, int *a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *(void *)a1;
    if (*(void *)a1 >= 0xFFFFFFFFuLL) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  uint64_t v8 = type metadata accessor for ConditionTemplateModel();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a2)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a3[5];
LABEL_9:
    uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
    return v13(&a1[v11], a2, v9);
  }
  uint64_t v12 = sub_23796E2A8();
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a3[6];
    goto LABEL_9;
  }
  uint64_t v14 = sub_23796E8C8();
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = &a1[a3[7]];

  return v15(v17, a2, v16);
}

uint64_t sub_237948FF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_237949008);
}

char *sub_237949008(char *result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)uint64_t result = (a2 - 1);
    return result;
  }
  uint64_t v8 = type metadata accessor for ConditionTemplateModel();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[5];
LABEL_7:
    uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return (char *)v13(&v5[v11], a2, a2, v9);
  }
  uint64_t v12 = sub_23796E2A8();
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[6];
    goto LABEL_7;
  }
  uint64_t v14 = sub_23796E8C8();
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  uint64_t v16 = v14;
  uint64_t v17 = &v5[a4[7]];

  return (char *)v15(v17, a2, a2, v16);
}

uint64_t sub_237949180()
{
  uint64_t result = type metadata accessor for ConditionTemplateModel();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_23796E2A8();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_23796E8C8();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_237949294()
{
  return sub_23794938C(&qword_2689375B0, (void (*)(uint64_t))type metadata accessor for ConditionTemplateModel);
}

uint64_t sub_2379492DC(uint64_t a1)
{
  uint64_t result = sub_23794938C((unint64_t *)&unk_268937350, (void (*)(uint64_t))type metadata accessor for ConditionRectangularTemplateModel);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_237949334(uint64_t a1)
{
  uint64_t result = sub_23794938C(&qword_268937658, (void (*)(uint64_t))type metadata accessor for ConditionRectangularTemplateModel);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23794938C(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_2379493D4()
{
  type metadata accessor for NWCBundle();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_268937660 = (uint64_t)result;
  return result;
}

uint64_t type metadata accessor for NWCBundle()
{
  return self;
}

id CLKTextProvider.init(nwcFormat:_:)()
{
  uint64_t v0 = sub_23796EDF8();
  swift_bridgeObjectRelease();
  uint64_t ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  unint64_t v2 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(ObjCClassFromMetadata, sel_textProviderWithFormat_arguments_, v2, v0);

  return v3;
}

void sub_2379494EC()
{
  id v1 = objc_msgSend(v0, sel_hourlyEntryModels);
  sub_237933904();
  unint64_t v2 = sub_23796EB18();

  if (!(v2 >> 62))
  {
    if (*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_23796ED48();
  swift_bridgeObjectRelease();
  if (!v8) {
    goto LABEL_13;
  }
LABEL_3:
  if ((v2 & 0xC000000000000001) != 0)
  {
    id v3 = (id)MEMORY[0x237E25DC0](0, v2);
  }
  else
  {
    if (!*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v3 = *(id *)(v2 + 32);
  }
  uint64_t v4 = v3;
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v4, sel_topString);
  if (v5)
  {
    uint64_t v6 = v5;
  }
  else
  {
    id v7 = objc_msgSend(v4, sel_middleString);
    if (v7) {
  }
    }
}

void sub_23794962C()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  id v1 = (void *)sub_23796EA68();
  objc_msgSend(v0, sel_setDateFormat_, v1);

  qword_268937668 = (uint64_t)v0;
}

unint64_t sub_2379496E4()
{
  return 0xD000000000000015;
}

uint64_t sub_237949740()
{
  return sub_23796E9D8();
}

char *sub_237949778(void *a1, uint64_t a2, void *a3)
{
  uint64_t v7 = OBJC_IVAR____TtC20WeatherComplications12UVDataSource_rectangularFormatter;
  uint64_t v8 = qword_268937120;
  uint64_t v9 = v3;
  if (v8 != -1) {
    swift_once();
  }
  *(_OWORD *)&v3[v7] = xmmword_2689394B0;
  swift_unknownObjectRetain();

  v14.receiver = v9;
  v14.super_class = (Class)type metadata accessor for UVDataSource();
  id v10 = objc_msgSendSuper2(&v14, sel_initWithComplication_family_forDevice_, a1, a2, a3);
  uint64_t v11 = qword_2689370B0;
  uint64_t v12 = (char *)v10;
  if (v11 != -1) {
    swift_once();
  }
  *(_OWORD *)&v12[OBJC_IVAR____TtC20WeatherComplications14BaseDataSource_templateFormatter] = xmmword_268939420;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
  return v12;
}

uint64_t sub_237949914()
{
  objc_msgSend(v0, sel_family);
  return swift_unknownObjectRetain();
}

uint64_t sub_237949A38()
{
  return swift_unknownObjectRelease();
}

id sub_237949A48()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UVDataSource();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_237949A90()
{
  return type metadata accessor for UVDataSource();
}

uint64_t type metadata accessor for UVDataSource()
{
  uint64_t result = qword_268937678;
  if (!qword_268937678) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_237949AE4()
{
  return swift_updateClassMetadata2();
}

void sub_237949B28(uint64_t a1)
{
  uint64_t v2 = sub_23796E9E8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23796E9D8();
  uint64_t v6 = sub_23796E9C8();
  os_log_type_t v7 = sub_23796EBE8();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_237922000, v6, v7, "Migrating to widget.", v8, 2u);
    MEMORY[0x237E264A0](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v9 = objc_allocWithZone(MEMORY[0x263EFD238]);
  id v10 = (void *)sub_23796EA68();
  uint64_t v11 = (void *)sub_23796EA68();
  uint64_t v12 = (void *)sub_23796EA68();
  id v13 = objc_msgSend(v9, sel_initWithExtensionBundleIdentifier_containerBundleIdentifier_kind_intent_, v10, v11, v12, 0);

  (*(void (**)(uint64_t, id))(a1 + 16))(a1, v13);
}

uint64_t sub_237949D48()
{
  type metadata accessor for ChanceRainRectangularTemplateFormatter();
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = *(void *)sub_23796E9A8();
  uint64_t v2 = sub_23794A884(&qword_2689376A8, v1, (void (*)(uint64_t))type metadata accessor for ChanceRainRectangularTemplateFormatter);
  qword_268939460 = v0;
  *(void *)algn_268939468 = v2;

  return swift_retain();
}

uint64_t type metadata accessor for ChanceRainRectangularTemplateFormatter()
{
  return self;
}

uint64_t sub_237949DFC()
{
  return sub_23794A884((unint64_t *)&unk_268937688, 255, (void (*)(uint64_t))type metadata accessor for ChanceRainRectangularTemplateModel);
}

void *sub_237949E48(id *a1)
{
  uint64_t v2 = type metadata accessor for ChanceRainTemplateModel();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)v70 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for ChanceRainRectangularTemplateModel();
  sub_23794A7C4((uint64_t)a1 + *(int *)(v5 + 20), (uint64_t)v4);
  id v6 = *a1;
  sub_2379494EC();
  char v8 = v7;

  uint64_t v72 = v4;
  if (v8)
  {
    if (qword_2689370E0 != -1) {
      swift_once();
    }
    id v9 = (id)qword_268937660;
    id v10 = (void *)sub_23796EA68();
    uint64_t v11 = (void *)sub_23796EA68();
    id v12 = objc_msgSend(v9, sel_localizedStringForKey_value_table_, v10, 0, v11);

    uint64_t v13 = sub_23796EA98();
    uint64_t v15 = v14;

    uint64_t v73 = v13;
    uint64_t v74 = v15;
    sub_237929138();
    sub_23796EC58();
    swift_bridgeObjectRelease();
    id v16 = (id)qword_268937660;
    uint64_t v17 = (void *)sub_23796EA68();
    uint64_t v18 = (void *)sub_23796EA68();
    id v19 = objc_msgSend(v16, sel_localizedStringForKey_value_table_, v17, 0, v18);

    uint64_t v20 = sub_23796EA98();
    uint64_t v22 = v21;

    uint64_t v73 = v20;
    uint64_t v74 = v22;
    sub_23796EC58();
    swift_bridgeObjectRelease();
    uint64_t v23 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    uint64_t v24 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    id v25 = objc_msgSend(self, sel_textProviderWithText_shortText_, v23, v24);

    uint64_t v26 = self;
    id v27 = v25;
    id v28 = objc_msgSend(v26, sel_grayColor);
    objc_msgSend(v27, sel_setTintColor_, v28);
    id v29 = v27;
  }
  else
  {
    uint64_t v30 = (char *)a1 + *(int *)(v5 + 28);
    if (v30[*(int *)(sub_23796E8C8() + 28)] == 1)
    {
      uint64_t v31 = (void *)sub_23796EA68();
      id v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.376470588, 0.788235294, 0.97254902, 1.0);
      id v33 = (id)NWCGlyphPrefixedTextProvider();
    }
    else
    {
      swift_bridgeObjectRetain();
      id v32 = (id)sub_23796EA68();
      swift_bridgeObjectRelease();
      id v33 = objc_msgSend(self, sel_textProviderWithText_, v32);
    }
    id v71 = v33;

    uint64_t v34 = self;
    id v35 = objc_msgSend(v34, sel_systemCyanColor);
    objc_msgSend(v33, sel_setTintColor_, v35);

    uint64_t v36 = &v4[*(int *)(v2 + 36)];
    uint64_t v37 = *(void *)v36;
    uint64_t v38 = *((void *)v36 + 1);
    uint64_t v39 = (void *)sub_23796EA68();
    uint64_t v40 = (void *)sub_23796EA68();
    id v41 = (id)NWKUILocalizedString();

    sub_23796EA98();
    uint64_t v73 = v37;
    uint64_t v74 = v38;
    swift_bridgeObjectRetain();
    sub_23796EAD8();
    uint64_t v42 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    int v43 = (void *)sub_23796EA68();
    id v44 = (id)NWKUILocalizedString();

    sub_23796EA98();
    if (qword_2689370E0 != -1) {
      swift_once();
    }
    id v45 = (id)qword_268937660;
    uint64_t v46 = (void *)sub_23796EA68();
    int v47 = (void *)sub_23796EA68();
    id v48 = objc_msgSend(v45, sel_localizedStringForKey_value_table_, v46, 0, v47);

    v70[1] = sub_23796EA98();
    int v49 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    int v50 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    id v51 = objc_msgSend(self, sel_textProviderWithText_shortText_, v49, v50);

    id v52 = v51;
    id v53 = objc_msgSend(v34, sel_whiteColor);
    objc_msgSend(v52, sel_setTintColor_, v53);

    uint64_t v54 = sub_237926638(0, (unint64_t *)&qword_2689373A0);
    sub_2379265BC((uint64_t *)&unk_268937390);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_237971400;
    *(void *)(inited + 56) = sub_237926638(0, (unint64_t *)&unk_268937810);
    *(void *)(inited + 64) = sub_23792B2C8((unint64_t *)&unk_2689373B0, (unint64_t *)&unk_268937810);
    uint64_t v56 = v71;
    *(void *)(inited + 32) = v71;
    *(void *)(inited + 96) = v54;
    *(void *)(inited + 104) = sub_23792B2C8((unint64_t *)&unk_268937820, (unint64_t *)&qword_2689373A0);
    *(void *)(inited + 72) = v52;
    id v27 = v52;
    id v57 = v56;
    uint64_t v58 = sub_23796EDF8();
    swift_setDeallocating();
    sub_2379265BC(&qword_2689373C0);
    swift_arrayDestroy();
    uint64_t ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    id v28 = (id)sub_23796EA68();
    swift_bridgeObjectRelease();
    id v29 = objc_msgSend(ObjCClassFromMetadata, sel_textProviderWithFormat_arguments_, v28, v58);
  }
  sub_237926638(0, (unint64_t *)&unk_268937698);
  uint64_t v60 = swift_getObjCClassFromMetadata();
  id v61 = objc_msgSend(self, sel_fullColorImageProviderWithImageViewClass_, v60);
  sub_2379265BC((uint64_t *)&unk_268937380);
  uint64_t v62 = swift_initStackObject();
  *(_OWORD *)(v62 + 16) = xmmword_2379713F0;
  *(void *)(v62 + 32) = sub_23796EA98();
  *(void *)(v62 + 40) = v63;
  *(void *)(v62 + 48) = v6;
  id v64 = v6;
  unint64_t v65 = sub_2379294C4(v62);
  sub_2379296EC(v65);
  swift_bridgeObjectRelease();
  sub_2379265BC((uint64_t *)&unk_2689377F0);
  uint64_t v66 = (void *)sub_23796EA08();
  swift_bridgeObjectRelease();
  objc_msgSend(v61, sel_setMetadata_, v66);

  id v67 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD0E0]), sel_initWithTextProvider_imageProvider_, v29, v61);
  uint64_t v68 = sub_23794B3A8();

  sub_23794A828((uint64_t)v72);
  return v68;
}

uint64_t sub_23794A7C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ChanceRainTemplateModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23794A828(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ChanceRainTemplateModel();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23794A884(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

unint64_t sub_23794A8CC(uint64_t a1, uint64_t a2)
{
  sub_23796EDD8();
  sub_23796EAB8();
  uint64_t v4 = sub_23796EDE8();

  return sub_23794A9D8(a1, a2, v4);
}

unint64_t sub_23794A944(uint64_t a1)
{
  sub_23796EA98();
  sub_23796EDD8();
  sub_23796EAB8();
  uint64_t v2 = sub_23796EDE8();
  swift_bridgeObjectRelease();

  return sub_23794AABC(a1, v2);
}

unint64_t sub_23794A9D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_23796EDB8() & 1) == 0)
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
      while (!v14 && (sub_23796EDB8() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_23794AABC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_23796EA98();
    uint64_t v8 = v7;
    if (v6 == sub_23796EA98() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_23796EDB8();
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
          uint64_t v13 = sub_23796EA98();
          uint64_t v15 = v14;
          if (v13 == sub_23796EA98() && v15 == v16) {
            break;
          }
          char v18 = sub_23796EDB8();
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

uint64_t sub_23794AC34(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_2379265BC(&qword_2689376B8);
  char v36 = a2;
  uint64_t v6 = sub_23796ED68();
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
    uint64_t v22 = (void *)(v5 + 64);
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
    id v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
    }
    sub_23796EDD8();
    sub_23796EAB8();
    uint64_t result = sub_23796EDE8();
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
    char v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *char v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void *sub_23794AF4C()
{
  uint64_t v1 = v0;
  sub_2379265BC(&qword_2689376B8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_23796ED58();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = *v17;
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

uint64_t sub_23794B104(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  uint64_t v10 = (void *)*a5;
  unint64_t v12 = sub_23794A8CC(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_23794AF4C();
LABEL_7:
    uint64_t v18 = (void *)*a5;
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
  sub_23794AC34(v15, a4 & 1);
  unint64_t v21 = sub_23794A8CC(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_23796EDC8();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*a5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v23 = a2;
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

void *sub_23794B274()
{
  uint64_t v1 = sub_23796EA98();
  uint64_t v3 = v2;
  uint64_t v4 = sub_23796EB68();
  id v5 = objc_msgSend(v0, sel_metadata);
  sub_2379265BC(&qword_2689376B0);
  uint64_t v6 = sub_23796EA18();

  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = v6;
  sub_23794B104(v4, v1, v3, isUniquelyReferenced_nonNull_native, &v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = (void *)sub_23796EA08();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setMetadata_, v8);

  return v0;
}

void *sub_23794B3A8()
{
  uint64_t v1 = sub_23796EA98();
  uint64_t v3 = v2;
  uint64_t v4 = sub_23796EB88();
  id v5 = objc_msgSend(v0, sel_metadata);
  sub_2379265BC(&qword_2689376B0);
  uint64_t v6 = sub_23796EA18();

  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = v6;
  sub_23794B104(v4, v1, v3, isUniquelyReferenced_nonNull_native, &v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = (void *)sub_23796EA08();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setMetadata_, v8);

  return v0;
}

uint64_t sub_23794B51C()
{
  return 0x52454854414557;
}

uint64_t sub_23794B668()
{
  return sub_23796E9D8();
}

id sub_23794B774()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WeatherDataSource();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23794B7AC()
{
  return type metadata accessor for WeatherDataSource();
}

uint64_t type metadata accessor for WeatherDataSource()
{
  uint64_t result = qword_2689376C0;
  if (!qword_2689376C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_23794B800()
{
  return swift_updateClassMetadata2();
}

void sub_23794B838(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_23796E9E8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23796E9D8();
  unint64_t v7 = sub_23796E9C8();
  os_log_type_t v8 = sub_23796EBE8();
  if (os_log_type_enabled(v7, v8))
  {
    int64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int64_t v9 = 0;
    _os_log_impl(&dword_237922000, v7, v8, "Migrating to widget.", v9, 2u);
    MEMORY[0x237E264A0](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  id v10 = objc_allocWithZone(MEMORY[0x263EFD238]);
  char v11 = (void *)sub_23796EA68();
  unint64_t v12 = (void *)sub_23796EA68();
  uint64_t v13 = (void *)sub_23796EA68();
  id v14 = objc_msgSend(v10, sel_initWithExtensionBundleIdentifier_containerBundleIdentifier_kind_intent_, v11, v12, v13, 0);

  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v14);
}

uint64_t sub_23794BADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_23794EBAC(a2, a3, a4, a5, a6);
}

uint64_t sub_23794BAF4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_23796E6D8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_23796E508();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2379265BC(&qword_268937478);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_2379265BC(&qword_268937470);
  MEMORY[0x270FA5388](v14 - 8);
  char v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_237935E98((uint64_t)v1 + OBJC_IVAR____TtC20WeatherComplications14BaseDataSource_forecast, (uint64_t)v13);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v13, 1, v7))
  {
    sub_23792673C((uint64_t)v13, &qword_268937478);
    uint64_t v17 = sub_23796E2A8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 1, 1, v17);
LABEL_4:
    sub_23792673C((uint64_t)v16, &qword_268937470);
    return sub_23796E298();
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v10, v13, v7);
  uint64_t v18 = sub_23792673C((uint64_t)v13, &qword_268937478);
  (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v1) + 0x130))(v18);
  sub_237967AA8((uint64_t)v6, v16);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v19 = sub_23796E2A8();
  uint64_t v20 = *(void *)(v19 - 8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v16, 0, 1, v19);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v16, 1, v19) == 1) {
    goto LABEL_4;
  }
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v20 + 32))(a1, v16, v19);
}

uint64_t sub_23794BEBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v38 = a4;
  uint64_t v39 = a1;
  uint64_t v36 = a3;
  uint64_t v40 = a2;
  uint64_t v5 = sub_23796E8C8();
  uint64_t v6 = v5 - 8;
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2379265BC(&qword_268937478);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v35 - v13;
  uint64_t v35 = sub_23796E2A8();
  uint64_t v15 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for TemplateData();
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  unint64_t v21 = (char *)&v35 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  unint64_t v23 = (char *)&v35 - v22;
  sub_23796E298();
  sub_237935E98((uint64_t)v4 + OBJC_IVAR____TtC20WeatherComplications14BaseDataSource_forecast, (uint64_t)v14);
  uint64_t v37 = v4;
  sub_23793345C((uint64_t)v4 + OBJC_IVAR____TtC20WeatherComplications14BaseDataSource_location, (uint64_t)v8);
  sub_237935E98((uint64_t)v14, (uint64_t)v12);
  uint64_t v24 = (double *)&v8[*(int *)(v6 + 40)];
  if (*v24 == *MEMORY[0x263F00B58])
  {
    double v25 = v24[1];
    double v26 = *(double *)(MEMORY[0x263F00B58] + 8);
    sub_23792673C((uint64_t)v14, &qword_268937478);
    if (v25 == v26)
    {
      sub_23792673C((uint64_t)v12, &qword_268937478);
      uint64_t v27 = sub_23796E508();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v12, 1, 1, v27);
    }
  }
  else
  {
    sub_23792673C((uint64_t)v14, &qword_268937478);
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v21, v17, v35);
  sub_23793C8A8((uint64_t)v12, (uint64_t)&v21[*(int *)(v18 + 20)]);
  sub_237950434((uint64_t)v8, (uint64_t)&v21[*(int *)(v18 + 24)], MEMORY[0x263F580A0]);
  sub_237950434((uint64_t)v21, (uint64_t)v23, (uint64_t (*)(void))type metadata accessor for TemplateData);
  uint64_t v28 = (void *)swift_allocObject();
  uint64_t v29 = v36;
  uint64_t v30 = v37;
  v28[2] = v37;
  v28[3] = v29;
  v28[4] = v38;
  uint64_t ObjectType = swift_getObjectType();
  id v32 = v30;
  swift_retain();
  id v33 = objc_msgSend(v32, sel_family);
  (*(void (**)(id, char *, uint64_t (*)(void *, uint64_t, unint64_t), void *, uint64_t))(v40 + 40))(v33, v23, sub_237950588, v28, ObjectType);
  sub_23795049C((uint64_t)v23, (uint64_t (*)(void))type metadata accessor for TemplateData);
  return swift_release();
}

uint64_t sub_23794C2A4(uint64_t a1)
{
  uint64_t v3 = sub_23796E2A8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v19 - v8;
  sub_23796E298();
  (*(void (**)(char *))((*MEMORY[0x263F8EED0] & *v1) + 0x120))(v9);
  uint64_t v11 = v10;
  uint64_t v12 = *(void (**)(char *, uint64_t))(v4 + 8);
  v12(v9, v3);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v14 = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(a1, ObjectType, v11);
  objc_msgSend(v14, sel_finalize);
  uint64_t result = sub_23796E1F8();
  if (v14)
  {
    id v16 = v14;
    uint64_t v17 = (void *)sub_23796E228();
    id v18 = objc_msgSend(self, sel_entryWithDate_complicationTemplate_, v17, v16);

    v12(v7, v3);
    swift_unknownObjectRelease();

    return (uint64_t)v18;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23794C4AC()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_23794C62C()
{
  (*(void (**)(void))(v0 + 256))();
  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v1 = (id)qword_268937660;
  objc_super v2 = (void *)sub_23796EA68();
  uint64_t v3 = (void *)sub_23796EA68();
  id v4 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, 0, v3);

  uint64_t v5 = sub_23796EA98();
  swift_bridgeObjectRelease();

  return v5;
}

uint64_t sub_23794C73C()
{
  return MEMORY[0x263F8EE78];
}

uint64_t sub_23794C74C()
{
  uint64_t v0 = sub_23796E9E8();
  sub_23794E4F0(v0, qword_2689376D8);
  sub_23794E4B8(v0, (uint64_t)qword_2689376D8);
  return sub_23796E9D8();
}

uint64_t sub_23794C7CC@<X0>(uint64_t a1@<X8>)
{
  if (qword_2689370F8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_23796E9E8();
  uint64_t v3 = sub_23794E4B8(v2, (uint64_t)qword_2689376D8);
  id v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

id sub_23794C874()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  objc_msgSend(v0, sel_setDateStyle_, 1);
  id result = objc_msgSend(v0, sel_setTimeStyle_, 1);
  qword_268939470 = (uint64_t)v0;
  return result;
}

void *sub_23794C8D8(void *a1, uint64_t a2, void *a3)
{
  uint64_t v45 = sub_23796E9E8();
  uint64_t v7 = *(void *)(v45 - 8);
  MEMORY[0x270FA5388](v45);
  uint64_t v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v3[OBJC_IVAR____TtC20WeatherComplications14BaseDataSource_switcherTemplate] = 0;
  uint64_t v10 = &v3[OBJC_IVAR____TtC20WeatherComplications14BaseDataSource_forecast];
  uint64_t v11 = sub_23796E508();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  uint64_t v12 = (uint64_t)&v3[OBJC_IVAR____TtC20WeatherComplications14BaseDataSource_location];
  uint64_t v13 = v3;
  uint64_t v14 = sub_23796E8B8();
  sub_23793345C(v14, v12);
  v13[OBJC_IVAR____TtC20WeatherComplications14BaseDataSource_isActive] = 0;
  uint64_t v15 = OBJC_IVAR____TtC20WeatherComplications14BaseDataSource_templateFormatter;
  if (qword_268937108 != -1) {
    swift_once();
  }
  *(_OWORD *)&v13[v15] = xmmword_268939490;
  swift_unknownObjectRetain();
  sub_23796E1E8();
  sub_23796E1E8();
  id v16 = &v13[OBJC_IVAR____TtC20WeatherComplications14BaseDataSource_lastCurrentDescription];
  *(void *)id v16 = 0x657320726576656ELL;
  *((void *)v16 + 1) = 0xE900000000000074;
  sub_23796E9D8();

  uint64_t v17 = (objc_class *)type metadata accessor for BaseDataSource();
  v48.receiver = v13;
  v48.super_class = v17;
  uint64_t v18 = a2;
  uint64_t v19 = objc_msgSendSuper2(&v48, sel_initWithComplication_family_forDevice_, a1, a2, a3);
  uint64_t v20 = *(void (**)(void))((*MEMORY[0x263F8EED0] & *v19) + 0x190);
  unint64_t v21 = v19;
  v20();
  uint64_t v22 = v21;
  unint64_t v23 = sub_23796E9C8();
  int v24 = sub_23796EBE8();
  if (!os_log_type_enabled(v23, (os_log_type_t)v24))
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v45);
    return v22;
  }
  int v37 = v24;
  id v41 = a1;
  id v42 = a3;
  int v43 = v9;
  uint64_t v44 = v7;
  uint64_t v25 = swift_slowAlloc();
  double v26 = (void *)swift_slowAlloc();
  uint64_t v39 = swift_slowAlloc();
  uint64_t v46 = (uint64_t)v22;
  uint64_t v47 = v39;
  *(_DWORD *)uint64_t v25 = 138412546;
  uint64_t v27 = v22;
  uint64_t v40 = &v47;
  sub_23796EC38();
  uint64_t v38 = v26;
  *double v26 = v19;

  *(_WORD *)(v25 + 12) = 2082;
  if (*MEMORY[0x263EFCF20] == v18)
  {
    unint64_t v28 = 0xD000000000000023;
    unint64_t v29 = 0x8000000237970880;
LABEL_9:
    int64_t v34 = v38;
    uint64_t v33 = v39;
    os_log_type_t v35 = v37;
    uint64_t v46 = sub_23794E554(v28, v29, &v47);
    sub_23796EC38();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237922000, v23, v35, "%@ initialized for %{public}s", (uint8_t *)v25, 0x16u);
    sub_2379265BC(&qword_268937758);
    swift_arrayDestroy();
    MEMORY[0x237E264A0](v34, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x237E264A0](v33, -1, -1);
    MEMORY[0x237E264A0](v25, -1, -1);

    (*(void (**)(char *, uint64_t))(v44 + 8))(v43, v45);
    return v22;
  }
  id result = (id)CLKStringForComplicationFamily();
  if (result)
  {
    uint64_t v31 = result;
    unint64_t v28 = sub_23796EA98();
    unint64_t v29 = v32;

    goto LABEL_9;
  }
  __break(1u);
  return result;
}

uint64_t sub_23794D010(void *a1, uint64_t a2, unint64_t a3, void *a4, void (*a5)(id), uint64_t a6)
{
  uint64_t v59 = a5;
  uint64_t v11 = sub_23796E9E8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_23796E2A8();
  uint64_t result = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v46 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v54 = v12;
    uint64_t v55 = v11;
    uint64_t v56 = v17;
    uint64_t v57 = result;
    uint64_t v58 = a2;
    id v20 = a1;
    objc_msgSend(v20, sel_finalize);
    sub_23796E298();
    id v21 = v20;
    uint64_t v22 = (void *)sub_23796E228();
    id v52 = objc_msgSend(self, sel_entryWithDate_complicationTemplate_, v22, v21);
    id v53 = v21;

    if (qword_268937100 != -1) {
      swift_once();
    }
    unint64_t v23 = (void *)qword_268939470;
    int v24 = (void *)sub_23796E228();
    id v25 = objc_msgSend(v23, sel_stringFromDate_, v24);

    uint64_t v26 = sub_23796EA98();
    unint64_t v28 = v27;

    (*(void (**)(void))((*MEMORY[0x263F8EED0] & *a4) + 0x190))();
    unint64_t v29 = a4;
    swift_bridgeObjectRetain_n();
    uint64_t v30 = v29;
    swift_bridgeObjectRetain();
    uint64_t v31 = sub_23796E9C8();
    os_log_type_t v32 = sub_23796EBE8();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = swift_slowAlloc();
      os_log_t v47 = v31;
      uint64_t v34 = v33;
      uint64_t v46 = (void *)swift_slowAlloc();
      uint64_t v49 = swift_slowAlloc();
      uint64_t v61 = v49;
      *(_DWORD *)uint64_t v34 = 136447235;
      uint64_t v51 = a6;
      swift_bridgeObjectRetain();
      uint64_t v60 = sub_23794E554(v26, v28, &v61);
      sub_23796EC38();
      swift_bridgeObjectRelease_n();
      objc_super v48 = v14;
      *(_WORD *)(v34 + 12) = 2082;
      if (v30[OBJC_IVAR____TtC20WeatherComplications14BaseDataSource_isActive]) {
        uint64_t v35 = 0x657669746361;
      }
      else {
        uint64_t v35 = 0x4954434120544F4ELL;
      }
      if (v30[OBJC_IVAR____TtC20WeatherComplications14BaseDataSource_isActive]) {
        unint64_t v36 = 0xE600000000000000;
      }
      else {
        unint64_t v36 = 0xEA00000000004556;
      }
      uint64_t v60 = sub_23794E554(v35, v36, &v61);
      sub_23796EC38();

      swift_bridgeObjectRelease();
      *(_WORD *)(v34 + 22) = 2081;
      uint64_t v60 = sub_23794E554(0, 0xE000000000000000, &v61);
      sub_23796EC38();

      *(_WORD *)(v34 + 32) = 2082;
      swift_bridgeObjectRetain();
      int v50 = v19;
      os_log_type_t v37 = v32;
      uint64_t v38 = v58;
      uint64_t v60 = sub_23794E554(v58, a3, &v61);
      sub_23796EC38();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v34 + 42) = 2114;
      uint64_t v60 = (uint64_t)v30;
      uint64_t v39 = v30;
      sub_23796EC38();
      uint64_t v40 = v46;
      *uint64_t v46 = a4;

      os_log_t v41 = v47;
      os_log_type_t v42 = v37;
      uint64_t v19 = v50;
      _os_log_impl(&dword_237922000, v47, v42, "getCurrentTimelineEntry (date: %{public}s, active: %{public}s, location: %{private}s, description: %{public}s,\nself: %{public}@", (uint8_t *)v34, 0x34u);
      sub_2379265BC(&qword_268937758);
      swift_arrayDestroy();
      MEMORY[0x237E264A0](v40, -1, -1);
      uint64_t v43 = v49;
      swift_arrayDestroy();
      MEMORY[0x237E264A0](v43, -1, -1);
      MEMORY[0x237E264A0](v34, -1, -1);

      (*(void (**)(char *, uint64_t))(v54 + 8))(v48, v55);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v54 + 8))(v14, v55);
      uint64_t v38 = v58;
    }
    uint64_t v44 = (uint64_t *)&v30[OBJC_IVAR____TtC20WeatherComplications14BaseDataSource_lastCurrentDescription];
    uint64_t *v44 = v38;
    v44[1] = a3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v45 = v52;
    v59(v52);

    return (*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v19, v57);
  }
  return result;
}

void sub_23794D654(void *a1, int a2, void *aBlock, void (*a4)(void))
{
  uint64_t v6 = _Block_copy(aBlock);
  _Block_copy(v6);
  id v7 = a1;
  a4();
  _Block_release(v6);
  _Block_release(v6);
}

uint64_t sub_23794D6D0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v51 = a2;
  id v52 = a4;
  uint64_t v50 = a3;
  uint64_t v54 = sub_23796E8C8() - 8;
  MEMORY[0x270FA5388](v54);
  uint64_t v49 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2379265BC(&qword_268937478);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  os_log_t v47 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v46 = (char *)&v45 - v9;
  uint64_t v56 = type metadata accessor for TemplateData();
  uint64_t v10 = MEMORY[0x270FA5388](v56);
  uint64_t v57 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v58 = (uint64_t)&v45 - v12;
  uint64_t v13 = sub_23796E2A8();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v45 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v45 - v17;
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v19((char *)&v45 - v17, a1, v13);
  unint64_t v20 = (*(unsigned __int8 *)(v14 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  unint64_t v21 = (v15 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v22 = (v21 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v23 = swift_allocObject();
  unint64_t v24 = v23 + v20;
  uint64_t v25 = v50;
  uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
  uint64_t v53 = v14 + 32;
  objc_super v48 = v26;
  v26((char *)v24, v18, v13);
  *(void *)(v23 + v21) = v51;
  unint64_t v27 = v52;
  *(void *)(v23 + v22) = v25;
  unint64_t v28 = v45;
  uint64_t v55 = a1;
  uint64_t v29 = a1;
  uint64_t v30 = (uint64_t)v46;
  v19(v45, v29, v13);
  uint64_t v31 = (uint64_t)v47;
  uint64_t v32 = (uint64_t)v49;
  sub_237935E98((uint64_t)v27 + OBJC_IVAR____TtC20WeatherComplications14BaseDataSource_forecast, v30);
  sub_23793345C((uint64_t)v27 + OBJC_IVAR____TtC20WeatherComplications14BaseDataSource_location, v32);
  sub_237935E98(v30, v31);
  uint64_t v33 = (double *)(v32 + *(int *)(v54 + 40));
  if (*v33 == *MEMORY[0x263F00B58])
  {
    double v34 = v33[1];
    double v35 = *(double *)(MEMORY[0x263F00B58] + 8);
    swift_retain();
    swift_retain();
    sub_23792673C(v30, &qword_268937478);
    if (v34 == v35)
    {
      sub_23792673C(v31, &qword_268937478);
      uint64_t v36 = sub_23796E508();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v31, 1, 1, v36);
    }
  }
  else
  {
    swift_retain();
    swift_retain();
    sub_23792673C(v30, &qword_268937478);
  }
  os_log_type_t v37 = v57;
  v48(v57, v28, v13);
  uint64_t v38 = v56;
  sub_23793C8A8(v31, (uint64_t)&v37[*(int *)(v56 + 20)]);
  sub_237950434(v32, (uint64_t)&v37[*(int *)(v38 + 24)], MEMORY[0x263F580A0]);
  uint64_t v39 = (uint64_t)v37;
  uint64_t v40 = v58;
  sub_237950434(v39, v58, (uint64_t (*)(void))type metadata accessor for TemplateData);
  (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v27) + 0x120))(v55);
  uint64_t v42 = v41;
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(id, uint64_t, void (*)(void *, uint64_t, uint64_t), uint64_t, uint64_t, uint64_t))(v42 + 40))(objc_msgSend(v27, sel_family), v40, sub_237950374, v23, ObjectType, v42);
  swift_unknownObjectRelease();
  sub_23795049C(v40, (uint64_t (*)(void))type metadata accessor for TemplateData);
  return swift_release();
}

void sub_23794DBFC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a1)
  {
    uint64_t v7 = (void **)(a5 + 16);
    id v8 = a1;
    objc_msgSend(v8, sel_finalize);
    id v9 = v8;
    uint64_t v10 = (void *)sub_23796E228();
    id v11 = objc_msgSend(self, sel_entryWithDate_complicationTemplate_, v10, v9);

    if (qword_268937100 != -1) {
      swift_once();
    }
    uint64_t v12 = (void *)qword_268939470;
    uint64_t v13 = (void *)sub_23796E228();
    id v14 = objc_msgSend(v12, sel_stringFromDate_, v13);

    sub_23796EA98();
    sub_23796EAD8();
    swift_bridgeObjectRelease();
    sub_23796EAD8();
    sub_23796EAD8();
    sub_23796EAD8();
    swift_beginAccess();
    uint64_t v15 = *v7;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v7 = v15;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v15 = sub_237933944(0, v15[2] + 1, 1, v15);
      *uint64_t v7 = v15;
    }
    unint64_t v18 = v15[2];
    unint64_t v17 = v15[3];
    if (v18 >= v17 >> 1)
    {
      uint64_t v15 = sub_237933944((void *)(v17 > 1), v18 + 1, 1, v15);
      *uint64_t v7 = v15;
    }
    v15[2] = v18 + 1;
    uint64_t v19 = &v15[2 * v18];
    v19[4] = 40;
    v19[5] = 0xE100000000000000;
    swift_endAccess();
    swift_beginAccess();
    id v20 = v11;
    MEMORY[0x237E25BF0]();
    if (*(void *)((*(void *)(a6 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(a6 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                       + 0x18) >> 1)
      sub_23796EB38();
    sub_23796EB58();
    sub_23796EB28();
    swift_endAccess();
  }
}

id sub_23794E174()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BaseDataSource();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23794E300()
{
  return type metadata accessor for BaseDataSource();
}

uint64_t type metadata accessor for BaseDataSource()
{
  uint64_t result = qword_268937720;
  if (!qword_268937720) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_23794E354()
{
  sub_23793E754();
  if (v0 <= 0x3F)
  {
    sub_23796E8C8();
    if (v1 <= 0x3F)
    {
      sub_23796E2A8();
      if (v2 <= 0x3F)
      {
        sub_23796E9E8();
        if (v3 <= 0x3F) {
          swift_updateClassMetadata2();
        }
      }
    }
  }
}

uint64_t sub_23794E4B8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_23794E4F0(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_23794E554(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_23794E628(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_23795025C((uint64_t)v12, *a3);
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
      sub_23795025C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_23792E56C((uint64_t)v12);
  return v7;
}

uint64_t sub_23794E628(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23796EC48();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_23794E7E4(a5, a6);
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
  uint64_t v8 = sub_23796ECD8();
  if (!v8)
  {
    sub_23796ED38();
    __break(1u);
LABEL_17:
    uint64_t result = sub_23796ED88();
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

uint64_t sub_23794E7E4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_23794E87C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_23794EA5C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_23794EA5C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23794E87C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_23794E9F4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_23796ECB8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_23796ED38();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_23796EAE8();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_23796ED88();
    __break(1u);
LABEL_14:
    uint64_t result = sub_23796ED38();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_23794E9F4(uint64_t a1, uint64_t a2)
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
  sub_2379265BC(&qword_268937750);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23794EA5C(char a1, int64_t a2, char a3, char *a4)
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
    sub_2379265BC(&qword_268937750);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
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
  uint64_t result = sub_23796ED88();
  __break(1u);
  return result;
}

uint64_t sub_23794EBAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v23[2] = a1;
  v23[3] = a5;
  v23[1] = a4;
  v23[0] = sub_23796E6D8();
  uint64_t v7 = *(void *)(v23[0] - 8);
  MEMORY[0x270FA5388](v23[0]);
  int64_t v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2379265BC(&qword_268937478);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_2379265BC(&qword_268937470);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_23796E2A8();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)v23 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_237935E98(a3, (uint64_t)v12);
  uint64_t v20 = sub_23796E508();
  uint64_t v21 = *(void *)(v20 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v12, 1, v20) == 1)
  {
    sub_23792673C((uint64_t)v12, &qword_268937478);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, 1, 1, v16);
  }
  else
  {
    (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v5) + 0x130))();
    sub_237967AA8((uint64_t)v9, v15);
    (*(void (**)(char *, void))(v7 + 8))(v9, v23[0]);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v12, v20);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v15, 0, 1, v16);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v19, v15, v16);
      goto LABEL_6;
    }
  }
  sub_23792673C((uint64_t)v15, &qword_268937470);
  sub_23796E298();
LABEL_6:
  sub_23796E258();
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, v16);
}

uint64_t sub_23794EF54()
{
  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_268937660;
  unint64_t v1 = (void *)sub_23796EA68();
  uint64_t v2 = (void *)sub_23796EA68();
  id v3 = objc_msgSend(v0, sel_localizedStringForKey_value_table_, v1, 0, v2);

  uint64_t v4 = sub_23796EA98();
  return v4;
}

void sub_23794F044(void *a1, void (**a2)(void, void))
{
  uint64_t v4 = sub_23796E2A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  _Block_copy(a2);
  sub_23796E298();
  uint64_t v9 = (*(uint64_t (**)(char *))((*MEMORY[0x263F8EED0] & *a1) + 0x120))(v7);
  uint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (byte_2689376D0 == 1)
  {
    uint64_t v12 = (void *)sub_23794C2A4((uint64_t)objc_msgSend(a1, sel_family));
    ((void (**)(void, void *))a2)[2](a2, v12);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_23794BEBC(v9, v11, (uint64_t)sub_237950534, v8);
    swift_release();
    swift_unknownObjectRelease();
  }
}

uint64_t sub_23794F21C(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_23796E9E8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_23796E8C8();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_23796E2A8();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v36 - v16;
  if (byte_2689376D0 == 1)
  {
    uint64_t v18 = (void *)sub_23794C2A4((uint64_t)objc_msgSend(a1, sel_family));
    id v19 = objc_msgSend(v18, sel_date);

    sub_23796E288();
    uint64_t v15 = v17;
  }
  else
  {
    uint64_t v39 = v5;
    uint64_t v40 = v4;
    uint64_t v41 = v12;
    sub_23794BAF4((uint64_t)v15);
    if (qword_268937100 != -1) {
      swift_once();
    }
    uint64_t v20 = (void *)qword_268939470;
    uint64_t v21 = (void *)sub_23796E228();
    id v22 = objc_msgSend(v20, sel_stringFromDate_, v21);

    uint64_t v38 = sub_23796EA98();
    unint64_t v24 = v23;

    sub_23793345C((uint64_t)a1 + OBJC_IVAR____TtC20WeatherComplications14BaseDataSource_location, (uint64_t)v10);
    uint64_t v25 = sub_23796E898();
    unint64_t v27 = v26;
    uint64_t v28 = sub_23795049C((uint64_t)v10, MEMORY[0x263F580A0]);
    (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *a1) + 0x190))(v28);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_23796E9C8();
    os_log_type_t v30 = sub_23796EBD8();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      uint64_t v36 = v25;
      uint64_t v33 = v32;
      uint64_t v43 = v32;
      *(_DWORD *)uint64_t v31 = 136315394;
      uint64_t v37 = a2;
      swift_bridgeObjectRetain();
      uint64_t v42 = sub_23794E554(v38, v24, &v43);
      uint64_t v38 = v11;
      sub_23796EC38();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v31 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v42 = sub_23794E554(v36, v27, &v43);
      a2 = v37;
      uint64_t v11 = v38;
      sub_23796EC38();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_237922000, v29, v30, "Timeline end date: %s for location: %s", (uint8_t *)v31, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x237E264A0](v33, -1, -1);
      MEMORY[0x237E264A0](v31, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v39 + 8))(v7, v40);
    uint64_t v12 = v41;
  }
  double v34 = (void *)sub_23796E228();
  (*(void (**)(uint64_t, void *))(a2 + 16))(a2, v34);

  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v15, v11);
}

void sub_23794F718(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v85 = sub_23796E9E8();
  uint64_t v6 = *(void *)(v85 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v85);
  uint64_t v9 = (char *)&v74 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v74 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v74 - v13;
  uint64_t v15 = sub_2379265BC(&qword_268937478);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v74 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_23796E8C8();
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)&v74 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (byte_2689376D0 == 1)
  {
    sub_2379265BC(&qword_268937748);
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_237971BD0;
    *(void *)(v21 + 32) = sub_23794C2A4((uint64_t)objc_msgSend(a2, sel_family));
    v86[0] = v21;
    sub_23796EB28();
    sub_2379501D8();
    uint64_t v85 = sub_23796EB08();
    (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, v85);
    swift_bridgeObjectRelease();
    id v22 = (void *)v85;
  }
  else
  {
    uint64_t v78 = v9;
    uint64_t v75 = v12;
    uint64_t v84 = v6;
    uint64_t v81 = a3;
    uint64_t v23 = swift_allocObject();
    uint64_t v24 = MEMORY[0x263F8EE78];
    *(void *)(v23 + 16) = MEMORY[0x263F8EE78];
    uint64_t v25 = (void *)(v23 + 16);
    uint64_t v26 = swift_allocObject();
    *(void *)(v26 + 16) = v24;
    uint64_t v77 = (uint64_t *)(v26 + 16);
    unint64_t v27 = (void *)swift_allocObject();
    v27[2] = v26;
    v27[3] = v23;
    v27[4] = a2;
    uint64_t v82 = v26;
    swift_retain();
    swift_retain();
    uint64_t v28 = a2;
    id v29 = objc_msgSend(v28, sel_family);
    sub_23793345C((uint64_t)v28 + OBJC_IVAR____TtC20WeatherComplications14BaseDataSource_location, (uint64_t)v20);
    sub_237935E98((uint64_t)v28 + OBJC_IVAR____TtC20WeatherComplications14BaseDataSource_forecast, (uint64_t)v17);
    os_log_type_t v30 = (void *)MEMORY[0x263F8EED0];
    uint64_t v31 = *(void (**)(id, uint64_t, char *, char *, uint64_t (*)(uint64_t), void *))((*MEMORY[0x263F8EED0] & *v28) + 0x1B0);
    uint64_t v80 = v27;
    v31(v29, a1, v20, v17, sub_2379501CC, v27);
    sub_23792673C((uint64_t)v17, &qword_268937478);
    uint64_t v32 = sub_23795049C((uint64_t)v20, MEMORY[0x263F580A0]);
    uint64_t v33 = *v30 & *v28;
    double v34 = *(void (**)(uint64_t))(v33 + 0x190);
    uint64_t v76 = (uint8_t *)(v33 + 400);
    v34(v32);
    swift_retain();
    double v35 = sub_23796E9C8();
    os_log_type_t v36 = sub_23796EBE8();
    BOOL v37 = os_log_type_enabled(v35, v36);
    uint64_t v83 = v23;
    uint64_t v79 = v23 + 16;
    if (v37)
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v38 = 134349056;
      swift_beginAccess();
      if (*v25 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v39 = sub_23796ED48();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v39 = *(void *)((*v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      v86[0] = v39;
      sub_23796EC38();
      swift_release();
      _os_log_impl(&dword_237922000, v35, v36, "getTimelineEntries added %{public}ld entries.", v38, 0xCu);
      MEMORY[0x237E264A0](v38, -1, -1);
    }
    else
    {

      swift_release();
    }
    uint64_t v40 = v85;
    uint64_t v42 = v84 + 8;
    uint64_t v41 = *(uint64_t **)(v84 + 8);
    ((void (*)(char *, uint64_t))v41)(v14, v85);
    uint64_t v43 = v77;
    uint64_t v44 = swift_beginAccess();
    uint64_t v45 = *v43;
    unint64_t v46 = *(void *)(*v43 + 16);
    uint64_t v47 = (uint64_t)v78;
    if (v46 < 0xD)
    {
      v34(v44);
      uint64_t v63 = v82;
      swift_retain_n();
      id v64 = sub_23796E9C8();
      os_log_type_t v65 = sub_23796EBC8();
      if (os_log_type_enabled(v64, v65))
      {
        uint64_t v66 = (uint8_t *)swift_slowAlloc();
        uint64_t v67 = swift_slowAlloc();
        uint64_t v77 = v41;
        uint64_t v68 = v67;
        v86[0] = v67;
        uint64_t v84 = v42;
        *(_DWORD *)uint64_t v66 = 136446210;
        uint64_t v87 = *(void *)(v63 + 16);
        uint64_t v76 = v66 + 4;
        swift_bridgeObjectRetain();
        sub_2379265BC(&qword_2689374F0);
        sub_237950218((unint64_t *)&qword_2689374F8, &qword_2689374F0);
        uint64_t v69 = sub_23796EA48();
        unint64_t v71 = v70;
        swift_bridgeObjectRelease();
        uint64_t v87 = sub_23794E554(v69, v71, v86);
        sub_23796EC38();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_237922000, v64, v65, "getTimeLineEntries: [%{public}s]", v66, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x237E264A0](v68, -1, -1);
        MEMORY[0x237E264A0](v66, -1, -1);

        ((void (*)(uint64_t, uint64_t))v77)(v47, v85);
      }
      else
      {

        swift_release_n();
        ((void (*)(uint64_t, uint64_t))v41)(v47, v40);
      }
      uint64_t v72 = v81;
    }
    else
    {
      uint64_t v84 = v42;
      uint64_t v48 = v45 + 32 + 16 * v46;
      uint64_t v49 = *(void *)(v48 - 16);
      uint64_t v77 = v41;
      uint64_t v78 = (char *)v49;
      unint64_t v50 = *(void *)(v48 - 8);
      swift_bridgeObjectRetain();
      uint64_t v51 = swift_bridgeObjectRetain();
      id v52 = v75;
      v34(v51);
      swift_unknownObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t v53 = sub_23796E9C8();
      os_log_type_t v54 = sub_23796EBC8();
      if (os_log_type_enabled(v53, v54))
      {
        uint64_t v55 = 12;
        if (v46 < v46 - 12) {
          uint64_t v55 = 0;
        }
        uint64_t v56 = (2 * v55) | 1;
        uint64_t v57 = swift_slowAlloc();
        uint64_t v58 = swift_slowAlloc();
        v86[3] = v56;
        uint64_t v87 = v58;
        *(_DWORD *)uint64_t v57 = 136446466;
        v86[0] = v45;
        v86[1] = v45 + 32;
        v86[2] = 0;
        sub_2379265BC(&qword_268937738);
        sub_237950218(&qword_268937740, &qword_268937738);
        uint64_t v59 = sub_23796EA48();
        v86[0] = sub_23794E554(v59, v60, &v87);
        sub_23796EC38();
        swift_unknownObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v57 + 12) = 2082;
        swift_bridgeObjectRetain();
        v86[0] = sub_23794E554((uint64_t)v78, v50, &v87);
        sub_23796EC38();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_237922000, v53, v54, "getTimeLineEntries: [%{public}s, …, %{public}s]", (uint8_t *)v57, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x237E264A0](v58, -1, -1);
        MEMORY[0x237E264A0](v57, -1, -1);
        swift_unknownObjectRelease();

        uint64_t v61 = v52;
        uint64_t v62 = v85;
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_unknownObjectRelease_n();
        uint64_t v61 = v52;
        uint64_t v62 = v40;
      }
      ((void (*)(char *, uint64_t))v77)(v61, v62);
      uint64_t v72 = v81;
    }
    swift_beginAccess();
    sub_2379501D8();
    swift_bridgeObjectRetain();
    uint64_t v73 = (void *)sub_23796EB08();
    (*(void (**)(uint64_t, void *))(v72 + 16))(v72, v73);
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_23795014C()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_237950184()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2379501CC(uint64_t a1)
{
  return sub_23794D6D0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32));
}

unint64_t sub_2379501D8()
{
  unint64_t result = qword_268937730;
  if (!qword_268937730)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268937730);
  }
  return result;
}

uint64_t sub_237950218(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_23792D044(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23795025C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2379502B8()
{
  uint64_t v1 = sub_23796E2A8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, v6 + 8, v5);
}

void sub_237950374(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(sub_23796E2A8() - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v9 = (*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v10 = *(void *)(v3 + v9);
  uint64_t v11 = *(void *)(v3 + ((v9 + 15) & 0xFFFFFFFFFFFFFFF8));

  sub_23794DBFC(a1, a2, a3, v3 + v8, v10, v11);
}

uint64_t sub_237950434(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_23795049C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2379504FC()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_237950534()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_237950548()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_237950588(void *a1, uint64_t a2, unint64_t a3)
{
  return sub_23794D010(a1, a2, a3, *(void **)(v3 + 16), *(void (**)(id))(v3 + 24), *(void *)(v3 + 32));
}

uint64_t sub_237950598()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)sub_23796E968();
  uint64_t v3 = (int *)type metadata accessor for WeatherTemplateModel();
  uint64_t v4 = v0 + v3[6];
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v2 + 152);
  swift_retain();
  uint64_t v6 = v5(v4, 1, 2);
  v5(v1 + v3[8], 1, 2);
  v5(v1 + v3[9], 1, 2);
  sub_23796EAD8();
  sub_23796EAD8();
  swift_bridgeObjectRelease();
  sub_23796EAD8();
  sub_23796EAD8();
  swift_release();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_2379506F4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for WeatherTemplateModel();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2379265BC(&qword_268937360);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  unint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v16 - v9;
  sub_2379266D8(v1 + *(int *)(v2 + 24), (uint64_t)&v16 - v9, &qword_268937360);
  uint64_t v11 = sub_2379265BC(&qword_268937368);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
  int v13 = v12(v10, 1, v11);
  sub_23792673C((uint64_t)v10, &qword_268937360);
  sub_2379520DC(v1, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for WeatherTemplateModel);
  if (v13 == 1)
  {
    sub_23793934C((uint64_t)v4);
    return 1;
  }
  else
  {
    sub_2379266D8((uint64_t)&v4[*(int *)(v2 + 32)], (uint64_t)v8, &qword_268937360);
    sub_23793934C((uint64_t)v4);
    BOOL v14 = v12(v8, 1, v11) == 1;
    sub_23792673C((uint64_t)v8, &qword_268937360);
  }
  return v14;
}

uint64_t sub_2379508E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v135 = a2;
  uint64_t v3 = sub_2379265BC(&qword_268937570);
  MEMORY[0x270FA5388](v3 - 8);
  id v134 = (char *)v116 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v123 = sub_23796E8C8();
  MEMORY[0x270FA5388](v123);
  uint64_t v133 = (char *)v116 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2379265BC(&qword_268937360);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v140 = (uint64_t)v116 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v131 = (char *)v116 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  long long v132 = (char *)v116 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v129 = (char *)v116 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v139 = (uint64_t)v116 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v124 = (void (**)(uint64_t, uint64_t))((char *)v116 - v18);
  MEMORY[0x270FA5388](v17);
  uint64_t v138 = (uint64_t)v116 - v19;
  uint64_t v120 = sub_23796E768();
  uint64_t v118 = *(void *)(v120 - 8);
  MEMORY[0x270FA5388](v120);
  uint64_t v117 = (char *)v116 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_2379265BC(&qword_268937768);
  MEMORY[0x270FA5388](v21 - 8);
  uint64_t v23 = (char *)v116 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v125 = sub_23796E648();
  uint64_t v121 = *(void (***)(char *, uint64_t, uint64_t, uint64_t))(v125 - 8);
  MEMORY[0x270FA5388](v125);
  uint64_t v119 = (char *)v116 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_23796E508();
  uint64_t v26 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v28 = (char *)v116 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_2379265BC(&qword_268937600);
  uint64_t v30 = MEMORY[0x270FA5388](v29 - 8);
  uint64_t v128 = (uint64_t)v116 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  uint64_t v122 = (uint64_t)v116 - v33;
  MEMORY[0x270FA5388](v32);
  uint64_t v143 = (uint64_t)v116 - v34;
  uint64_t v35 = sub_2379265BC(&qword_268937238);
  MEMORY[0x270FA5388](v35 - 8);
  BOOL v37 = (char *)v116 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_2379265BC(&qword_268937478);
  MEMORY[0x270FA5388](v38 - 8);
  uint64_t v40 = (char *)v116 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_23796E2A8();
  uint64_t v42 = MEMORY[0x270FA5388](v41);
  uint64_t v137 = (char *)v116 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v42);
  uint64_t v130 = v44;
  uint64_t v45 = *(void (**)(void))(v44 + 16);
  uint64_t v141 = (char *)v116 - v46;
  uint64_t v136 = v47;
  uint64_t v127 = v44 + 16;
  unint64_t v126 = v45;
  v45();
  uint64_t v48 = type metadata accessor for TemplateData();
  uint64_t v49 = a1;
  uint64_t v50 = (uint64_t)v40;
  sub_2379266D8(a1 + *(int *)(v48 + 20), (uint64_t)v40, &qword_268937478);
  uint64_t v51 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v26 + 48);
  int v52 = v51(v40, 1, v25);
  uint64_t v142 = v40;
  if (v52)
  {
    uint64_t v53 = sub_23796E548();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v37, 1, 1, v53);
LABEL_4:
    sub_23792673C((uint64_t)v37, &qword_268937238);
    sub_23792673C(v50, &qword_268937478);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 56))(v50, 1, 1, v25);
    goto LABEL_5;
  }
  sub_23796E4A8();
  uint64_t v50 = (uint64_t)v142;
  uint64_t v54 = sub_23796E548();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v54 - 8) + 48))(v37, 1, v54) == 1) {
    goto LABEL_4;
  }
  sub_23792673C((uint64_t)v37, &qword_268937238);
LABEL_5:
  if (v51((char *)v50, 1, v25))
  {
    uint64_t v55 = sub_23796E3A8();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56))(v143, 1, 1, v55);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v28, v50, v25);
    sub_23796E458();
    uint64_t v50 = (uint64_t)v142;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v25);
  }
  if (v51((char *)v50, 1, v25))
  {
    uint64_t v148 = 0;
    memset(v147, 0, sizeof(v147));
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v28, v50, v25);
    sub_23796E498();
    uint64_t v50 = (uint64_t)v142;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v25);
  }
  uint64_t v56 = v125;
  uint64_t v123 = v49 + *(int *)(v48 + 24);
  LODWORD(v125) = sub_23796EBF8();
  int v57 = v51((char *)v50, 1, v25);
  uint64_t v58 = v121;
  if (v57)
  {
    v121[7](v23, 1, 1, v56);
    uint64_t v59 = (uint64_t)v124;
LABEL_14:
    sub_23792673C((uint64_t)v23, &qword_268937768);
    uint64_t v61 = 0;
    uint64_t v120 = 0;
    goto LABEL_15;
  }
  sub_23796E4B8();
  int v60 = ((uint64_t (*)(char *, uint64_t, uint64_t))v58[6])(v23, 1, v56);
  uint64_t v59 = (uint64_t)v124;
  if (v60 == 1) {
    goto LABEL_14;
  }
  unint64_t v99 = v119;
  ((void (*)(char *, char *, uint64_t))v58[4])(v119, v23, v56);
  if (sub_23796E5F8())
  {
    if (qword_2689370E0 != -1) {
      swift_once();
    }
    id v100 = (id)qword_268937660;
    uint64_t v101 = (void *)sub_23796EA68();
    uint64_t v102 = (void *)sub_23796EA68();
    id v103 = objc_msgSend(v100, sel_localizedStringForKey_value_table_, v101, 0, v102);

    v116[1] = sub_23796EA98();
    sub_2379265BC((uint64_t *)&unk_268937390);
    uint64_t v104 = swift_allocObject();
    *(_OWORD *)(v104 + 16) = xmmword_237971400;
    v144[0] = sub_23796E628();
    sub_23792E5BC();
    uint64_t v105 = sub_23796EC68();
    uint64_t v107 = v106;
    uint64_t v108 = MEMORY[0x263F8D310];
    *(void *)(v104 + 56) = MEMORY[0x263F8D310];
    unint64_t v109 = sub_23792918C();
    *(void *)(v104 + 64) = v109;
    *(void *)(v104 + 32) = v105;
    *(void *)(v104 + 40) = v107;
    uint64_t v110 = v117;
    sub_23796E618();
    uint64_t v111 = sub_23796E728();
    uint64_t v113 = v112;
    (*(void (**)(char *, uint64_t))(v118 + 8))(v110, v120);
    *(void *)(v104 + 96) = v108;
    *(void *)(v104 + 104) = v109;
    unint64_t v99 = v119;
    *(void *)(v104 + 72) = v111;
    *(void *)(v104 + 80) = v113;
    uint64_t v114 = sub_23796EAA8();
    uint64_t v120 = v115;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v114 = 0;
    uint64_t v120 = 0;
  }
  ((void (*)(char *, uint64_t))v58[1])(v99, v56);
  uint64_t v61 = v114;
LABEL_15:
  uint64_t v62 = *(void *)sub_23796E968();
  sub_2379266D8((uint64_t)v147, (uint64_t)v144, &qword_2689374C0);
  uint64_t v63 = v145;
  if (v145)
  {
    uint64_t v64 = v146;
    sub_23792E528(v144, v145);
    os_log_type_t v65 = *(void (**)(uint64_t, uint64_t))(v64 + 88);
    swift_retain();
    v65(v63, v64);
    uint64_t v66 = sub_2379265BC(&qword_268937368);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v66 - 8) + 56))(v59, 0, 1, v66);
    sub_23792E56C((uint64_t)v144);
  }
  else
  {
    swift_retain();
    sub_23792673C((uint64_t)v144, &qword_2689374C0);
    uint64_t v67 = sub_2379265BC(&qword_268937368);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v67 - 8) + 56))(v59, 1, 1, v67);
  }
  uint64_t v68 = *(void (**)(uint64_t))(*(void *)v62 + 176);
  v68(v59);
  sub_23792673C(v59, &qword_268937360);
  uint64_t v69 = v122;
  sub_2379266D8(v143, v122, &qword_268937600);
  uint64_t v70 = sub_23796E3A8();
  unint64_t v71 = *(char **)(v70 - 8);
  uint64_t v72 = (void (**)(char *, uint64_t, uint64_t, uint64_t))*((void *)v71 + 6);
  int v73 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v72)(v69, 1, v70);
  uint64_t v124 = (void (**)(uint64_t, uint64_t))v71;
  if (v73 == 1)
  {
    sub_23792673C(v69, &qword_268937600);
    uint64_t v74 = sub_2379265BC(&qword_268937368);
    uint64_t v75 = (uint64_t)v129;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v74 - 8) + 56))(v129, 1, 1, v74);
  }
  else
  {
    uint64_t v75 = (uint64_t)v129;
    uint64_t v121 = v72;
    sub_23796E378();
    uint64_t v72 = v121;
    (*((void (**)(uint64_t, uint64_t))v71 + 1))(v69, v70);
    uint64_t v76 = sub_2379265BC(&qword_268937368);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v76 - 8) + 56))(v75, 0, 1, v76);
  }
  v68(v75);
  sub_23792673C(v75, &qword_268937360);
  uint64_t v77 = v128;
  sub_2379266D8(v143, v128, &qword_268937600);
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v72)(v77, 1, v70) == 1)
  {
    sub_23792673C(v77, &qword_268937600);
    uint64_t v78 = sub_2379265BC(&qword_268937368);
    uint64_t v79 = (uint64_t)v131;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v78 - 8) + 56))(v131, 1, 1, v78);
  }
  else
  {
    uint64_t v80 = v131;
    sub_23796E368();
    uint64_t v81 = v70;
    uint64_t v79 = (uint64_t)v80;
    v124[1](v77, v81);
    uint64_t v82 = sub_2379265BC(&qword_268937368);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v82 - 8) + 56))(v80, 0, 1, v82);
  }
  uint64_t v84 = (uint64_t)v133;
  uint64_t v83 = (uint64_t)v134;
  uint64_t v85 = (uint64_t)v132;
  uint64_t v86 = v141;
  v68(v79);
  sub_23792673C(v79, &qword_268937360);
  uint64_t v87 = v136;
  ((void (*)(char *, char *, uint64_t))v126)(v137, v86, v136);
  sub_2379520DC(v123, v84, MEMORY[0x263F580A0]);
  uint64_t v88 = v138;
  sub_2379266D8(v138, v140, &qword_268937360);
  sub_2379266D8((uint64_t)v147, (uint64_t)v144, &qword_2689374C0);
  uint64_t v89 = v145;
  if (v145)
  {
    uint64_t v90 = v146;
    sub_23792E528(v144, v145);
    (*(void (**)(uint64_t, uint64_t))(v90 + 40))(v89, v90);
    uint64_t v87 = v136;
    swift_release();
    sub_23792673C(v88, &qword_268937360);
    sub_23792673C((uint64_t)v147, &qword_2689374C0);
    sub_23792673C(v143, &qword_268937600);
    uint64_t v91 = v130;
    (*(void (**)(char *, uint64_t))(v130 + 8))(v86, v87);
    uint64_t v92 = sub_23796E5E8();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v92 - 8) + 56))(v83, 0, 1, v92);
    sub_23792E56C((uint64_t)v144);
  }
  else
  {
    swift_release();
    sub_23792673C(v88, &qword_268937360);
    sub_23792673C((uint64_t)v147, &qword_2689374C0);
    sub_23792673C(v143, &qword_268937600);
    uint64_t v91 = v130;
    (*(void (**)(char *, uint64_t))(v130 + 8))(v86, v87);
    sub_23792673C((uint64_t)v144, &qword_2689374C0);
    uint64_t v93 = sub_23796E5E8();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v93 - 8) + 56))(v83, 1, 1, v93);
  }
  uint64_t v94 = v135;
  (*(void (**)(uint64_t, char *, uint64_t))(v91 + 32))(v135, v137, v87);
  id v95 = (int *)type metadata accessor for WeatherTemplateModel();
  sub_23793C910(v84, v94 + v95[5]);
  sub_237933DD4(v140, v94 + v95[6], &qword_268937360);
  sub_237933DD4(v83, v94 + v95[7], &qword_268937570);
  sub_237933DD4(v139, v94 + v95[8], &qword_268937360);
  sub_237933DD4(v85, v94 + v95[9], &qword_268937360);
  uint64_t v96 = (uint64_t *)(v94 + v95[10]);
  uint64_t v97 = v120;
  *uint64_t v96 = v61;
  v96[1] = v97;
  *(unsigned char *)(v94 + v95[11]) = v125 & 1;
  return sub_23792673C((uint64_t)v142, &qword_268937478);
}

uint64_t sub_237951B48@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_23796E2D8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_23796E358();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = sub_23796E2A8();
  uint64_t v33 = *(void *)(v7 - 8);
  uint64_t v34 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v32 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23792D380(v8);
  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v10 = (id)qword_268937660;
  uint64_t v11 = (void *)sub_23796EA68();
  uint64_t v12 = (void *)sub_23796EA68();
  id v13 = objc_msgSend(v10, sel_localizedStringForKey_value_table_, v11, 0, v12);

  sub_23796EA98();
  sub_23796E348();
  sub_23796E2C8();
  sub_23796E2B8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v14 = (int *)type metadata accessor for WeatherTemplateModel();
  sub_23796E8A8();
  uint64_t v15 = a1 + v14[6];
  id v31 = self;
  id v16 = objc_msgSend(v31, sel_fahrenheit);
  sub_2379439AC();
  sub_23796E1B8();
  uint64_t v17 = sub_2379265BC(&qword_268937368);
  uint64_t v18 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
  v18(v15, 0, 1, v17);
  uint64_t v19 = a1 + v14[7];
  uint64_t v20 = *MEMORY[0x263F1F450];
  uint64_t v21 = sub_23796E5E8();
  uint64_t v22 = a1;
  uint64_t v23 = *(void *)(v21 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 104))(v19, v20, v21);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v23 + 56))(v19, 0, 1, v21);
  uint64_t v24 = v22 + v14[8];
  id v25 = v31;
  id v26 = objc_msgSend(v31, sel_fahrenheit);
  sub_23796E1B8();
  v18(v24, 0, 1, v17);
  uint64_t v27 = v22 + v14[9];
  id v28 = objc_msgSend(v25, sel_fahrenheit);
  sub_23796E1B8();
  v18(v27, 0, 1, v17);
  uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v33 + 32))(v22, v32, v34);
  uint64_t v30 = (void *)(v22 + v14[10]);
  *uint64_t v30 = 0;
  v30[1] = 0;
  *(unsigned char *)(v22 + v14[11]) = 1;
  return result;
}

unint64_t sub_237952010(uint64_t a1)
{
  unint64_t result = sub_237952038();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_237952038()
{
  unint64_t result = qword_268937760;
  if (!qword_268937760)
  {
    type metadata accessor for WeatherTemplateModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268937760);
  }
  return result;
}

uint64_t type metadata accessor for WeatherTemplateModel()
{
  uint64_t result = qword_268937770;
  if (!qword_268937770) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2379520DC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void *sub_237952144(void *a1, char *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v25 = *(void *)a2;
    *a1 = *(void *)a2;
    uint64_t v18 = (void *)(v25 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_23796E2A8();
    (*(void (**)(void *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (void *)((char *)a1 + v8);
    uint64_t v49 = a2;
    id v10 = &a2[v8];
    uint64_t v11 = *((void *)v10 + 1);
    *uint64_t v9 = *(void *)v10;
    v9[1] = v11;
    uint64_t v12 = *((void *)v10 + 3);
    v9[2] = *((void *)v10 + 2);
    v9[3] = v12;
    id v13 = (int *)sub_23796E8C8();
    uint64_t v14 = v13[6];
    uint64_t v46 = &v10[v14];
    uint64_t v47 = (char *)v9 + v14;
    uint64_t v15 = sub_23796E358();
    id v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v16(v47, v46, v15);
    uint64_t v17 = a3;
    uint64_t v18 = a1;
    *((unsigned char *)v9 + v13[7]) = v10[v13[7]];
    *(_OWORD *)((char *)v9 + v13[8]) = *(_OWORD *)&v10[v13[8]];
    uint64_t v19 = a3[6];
    uint64_t v20 = (char *)a1 + v19;
    uint64_t v21 = &v49[v19];
    uint64_t v22 = sub_2379265BC(&qword_268937368);
    uint64_t v23 = *(void *)(v22 - 8);
    uint64_t v48 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48);
    if (v48(v21, 1, v22))
    {
      uint64_t v24 = sub_2379265BC(&qword_268937360);
      memcpy(v20, v21, *(void *)(*(void *)(v24 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v20, v21, v22);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
    }
    uint64_t v26 = v17[7];
    uint64_t v27 = (char *)a1 + v26;
    id v28 = &v49[v26];
    uint64_t v29 = sub_23796E5E8();
    uint64_t v30 = *(void *)(v29 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
    {
      uint64_t v31 = sub_2379265BC(&qword_268937570);
      memcpy(v27, v28, *(void *)(*(void *)(v31 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v27, v28, v29);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
    }
    uint64_t v32 = v17[8];
    uint64_t v33 = (char *)v18 + v32;
    uint64_t v34 = &v49[v32];
    if (v48(&v49[v32], 1, v22))
    {
      uint64_t v35 = sub_2379265BC(&qword_268937360);
      memcpy(v33, v34, *(void *)(*(void *)(v35 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v33, v34, v22);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v33, 0, 1, v22);
    }
    uint64_t v36 = v17[9];
    BOOL v37 = (char *)v18 + v36;
    uint64_t v38 = &v49[v36];
    if (v48(&v49[v36], 1, v22))
    {
      uint64_t v39 = sub_2379265BC(&qword_268937360);
      memcpy(v37, v38, *(void *)(*(void *)(v39 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v37, v38, v22);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v37, 0, 1, v22);
    }
    uint64_t v40 = v17[10];
    uint64_t v41 = v17[11];
    uint64_t v42 = (void *)((char *)v18 + v40);
    uint64_t v43 = &v49[v40];
    uint64_t v44 = *((void *)v43 + 1);
    void *v42 = *(void *)v43;
    v42[1] = v44;
    *((unsigned char *)v18 + v41) = v49[v41];
    swift_bridgeObjectRetain();
  }
  return v18;
}

uint64_t sub_2379525FC(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + a2[5];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = v5 + *(int *)(sub_23796E8C8() + 24);
  uint64_t v7 = sub_23796E358();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = a1 + a2[6];
  uint64_t v9 = sub_2379265BC(&qword_268937368);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  if (!v11(v8, 1, v9)) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  }
  uint64_t v12 = a1 + a2[7];
  uint64_t v13 = sub_23796E5E8();
  uint64_t v14 = *(void *)(v13 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13)) {
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
  }
  uint64_t v15 = a1 + a2[8];
  if (!v11(v15, 1, v9)) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v15, v9);
  }
  uint64_t v16 = a1 + a2[9];
  if (!v11(v16, 1, v9)) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v16, v9);
  }

  return swift_bridgeObjectRelease();
}

uint64_t sub_237952884(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a2 + v7 + 8);
  *uint64_t v8 = *(void *)(a2 + v7);
  v8[1] = v10;
  uint64_t v11 = *(void *)(a2 + v7 + 24);
  void v8[2] = *(void *)(a2 + v7 + 16);
  v8[3] = v11;
  uint64_t v12 = (int *)sub_23796E8C8();
  uint64_t v13 = v12[6];
  uint64_t v46 = (char *)v8 + v13;
  uint64_t v44 = v9 + v13;
  uint64_t v14 = sub_23796E358();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v15(v46, v44, v14);
  uint64_t v16 = a2;
  uint64_t v17 = a1;
  *((unsigned char *)v8 + v12[7]) = *(unsigned char *)(v9 + v12[7]);
  *(_OWORD *)((char *)v8 + v12[8]) = *(_OWORD *)(v9 + v12[8]);
  uint64_t v18 = a3[6];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (const void *)(a2 + v18);
  uint64_t v21 = sub_2379265BC(&qword_268937368);
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v47 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v22 + 48);
  if (v47(v20, 1, v21))
  {
    uint64_t v23 = sub_2379265BC(&qword_268937360);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v22 + 16))(v19, v20, v21);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  uint64_t v24 = a3[7];
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (const void *)(v16 + v24);
  uint64_t v27 = sub_23796E5E8();
  uint64_t v28 = *(void *)(v27 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
  {
    uint64_t v29 = sub_2379265BC(&qword_268937570);
    memcpy(v25, v26, *(void *)(*(void *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v28 + 16))(v25, v26, v27);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
  }
  uint64_t v30 = a3[8];
  uint64_t v31 = (void *)(v17 + v30);
  uint64_t v32 = (const void *)(v16 + v30);
  if (v47((const void *)(v16 + v30), 1, v21))
  {
    uint64_t v33 = sub_2379265BC(&qword_268937360);
    memcpy(v31, v32, *(void *)(*(void *)(v33 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v22 + 16))(v31, v32, v21);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v22 + 56))(v31, 0, 1, v21);
  }
  uint64_t v34 = a3[9];
  uint64_t v35 = (void *)(v17 + v34);
  uint64_t v36 = (const void *)(v16 + v34);
  if (v47((const void *)(v16 + v34), 1, v21))
  {
    uint64_t v37 = sub_2379265BC(&qword_268937360);
    memcpy(v35, v36, *(void *)(*(void *)(v37 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v22 + 16))(v35, v36, v21);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v22 + 56))(v35, 0, 1, v21);
  }
  uint64_t v38 = a3[10];
  uint64_t v39 = a3[11];
  uint64_t v40 = (void *)(v17 + v38);
  uint64_t v41 = (void *)(v16 + v38);
  uint64_t v42 = v41[1];
  *uint64_t v40 = *v41;
  v40[1] = v42;
  *(unsigned char *)(v17 + v39) = *(unsigned char *)(v16 + v39);
  swift_bridgeObjectRetain();
  return v17;
}

uint64_t sub_237952CF0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  *uint64_t v8 = *(void *)(a2 + v7);
  v8[1] = *(void *)(a2 + v7 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  void v8[2] = *(void *)(v9 + 16);
  v8[3] = *(void *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = (int *)sub_23796E8C8();
  uint64_t v11 = v10[6];
  uint64_t v12 = (char *)v8 + v11;
  uint64_t v13 = v9 + v11;
  uint64_t v14 = sub_23796E358();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  *((unsigned char *)v8 + v10[7]) = *(unsigned char *)(v9 + v10[7]);
  uint64_t v15 = v10[8];
  uint64_t v16 = (void *)((char *)v8 + v15);
  uint64_t v17 = (void *)(v9 + v15);
  void *v16 = *v17;
  v16[1] = v17[1];
  uint64_t v18 = a3[6];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (void *)(a2 + v18);
  uint64_t v21 = sub_2379265BC(&qword_268937368);
  uint64_t v52 = *(void *)(v21 - 8);
  uint64_t v22 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v52 + 48);
  LODWORD(v9) = v22(v19, 1, v21);
  int v23 = v22(v20, 1, v21);
  if (v9)
  {
    if (!v23)
    {
      (*(void (**)(void *, void *, uint64_t))(v52 + 16))(v19, v20, v21);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v52 + 56))(v19, 0, 1, v21);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v23)
  {
    (*(void (**)(void *, uint64_t))(v52 + 8))(v19, v21);
LABEL_6:
    uint64_t v24 = sub_2379265BC(&qword_268937360);
    memcpy(v19, v20, *(void *)(*(void *)(v24 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v52 + 24))(v19, v20, v21);
LABEL_7:
  uint64_t v50 = a3;
  uint64_t v51 = a2;
  uint64_t v25 = a3[7];
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = (void *)(a2 + v25);
  uint64_t v28 = sub_23796E5E8();
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v29 + 48);
  int v31 = v30(v26, 1, v28);
  int v32 = v30(v27, 1, v28);
  if (v31)
  {
    if (!v32)
    {
      (*(void (**)(void *, void *, uint64_t))(v29 + 16))(v26, v27, v28);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v32)
  {
    (*(void (**)(void *, uint64_t))(v29 + 8))(v26, v28);
LABEL_12:
    uint64_t v33 = sub_2379265BC(&qword_268937570);
    memcpy(v26, v27, *(void *)(*(void *)(v33 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v29 + 24))(v26, v27, v28);
LABEL_13:
  uint64_t v34 = v50[8];
  uint64_t v35 = (void *)(a1 + v34);
  uint64_t v36 = (void *)(v51 + v34);
  int v37 = v22((void *)(a1 + v34), 1, v21);
  int v38 = v22(v36, 1, v21);
  if (v37)
  {
    if (!v38)
    {
      (*(void (**)(void *, void *, uint64_t))(v52 + 16))(v35, v36, v21);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v52 + 56))(v35, 0, 1, v21);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v38)
  {
    (*(void (**)(void *, uint64_t))(v52 + 8))(v35, v21);
LABEL_18:
    uint64_t v39 = sub_2379265BC(&qword_268937360);
    memcpy(v35, v36, *(void *)(*(void *)(v39 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v52 + 24))(v35, v36, v21);
LABEL_19:
  uint64_t v40 = v50[9];
  uint64_t v41 = (void *)(a1 + v40);
  uint64_t v42 = (void *)(v51 + v40);
  int v43 = v22((void *)(a1 + v40), 1, v21);
  int v44 = v22(v42, 1, v21);
  if (!v43)
  {
    if (!v44)
    {
      (*(void (**)(void *, void *, uint64_t))(v52 + 24))(v41, v42, v21);
      goto LABEL_25;
    }
    (*(void (**)(void *, uint64_t))(v52 + 8))(v41, v21);
    goto LABEL_24;
  }
  if (v44)
  {
LABEL_24:
    uint64_t v45 = sub_2379265BC(&qword_268937360);
    memcpy(v41, v42, *(void *)(*(void *)(v45 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(void *, void *, uint64_t))(v52 + 16))(v41, v42, v21);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v52 + 56))(v41, 0, 1, v21);
LABEL_25:
  uint64_t v46 = v50[10];
  uint64_t v47 = (void *)(a1 + v46);
  uint64_t v48 = (void *)(v51 + v46);
  void *v47 = *v48;
  v47[1] = v48[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + v50[11]) = *(unsigned char *)(v51 + v50[11]);
  return a1;
}

uint64_t sub_237953324(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (_OWORD *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  long long v10 = *(_OWORD *)(a2 + v7 + 16);
  *uint64_t v8 = *(_OWORD *)(a2 + v7);
  v8[1] = v10;
  uint64_t v11 = (int *)sub_23796E8C8();
  uint64_t v12 = v11[6];
  uint64_t v13 = (char *)v8 + v12;
  uint64_t v14 = v9 + v12;
  uint64_t v15 = sub_23796E358();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  *((unsigned char *)v8 + v11[7]) = *(unsigned char *)(v9 + v11[7]);
  *(_OWORD *)((char *)v8 + v11[8]) = *(_OWORD *)(v9 + v11[8]);
  uint64_t v16 = a3[6];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (const void *)(a2 + v16);
  uint64_t v19 = sub_2379265BC(&qword_268937368);
  uint64_t v20 = *(void *)(v19 - 8);
  int v38 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v20 + 48);
  if (v38(v18, 1, v19))
  {
    uint64_t v21 = sub_2379265BC(&qword_268937360);
    memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v20 + 32))(v17, v18, v19);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  }
  uint64_t v22 = a3[7];
  int v23 = (void *)(a1 + v22);
  uint64_t v24 = (const void *)(a2 + v22);
  uint64_t v25 = sub_23796E5E8();
  uint64_t v26 = *(void *)(v25 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25))
  {
    uint64_t v27 = sub_2379265BC(&qword_268937570);
    memcpy(v23, v24, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v26 + 32))(v23, v24, v25);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
  }
  uint64_t v28 = a3[8];
  uint64_t v29 = (void *)(a1 + v28);
  uint64_t v30 = (const void *)(a2 + v28);
  if (v38((const void *)(a2 + v28), 1, v19))
  {
    uint64_t v31 = sub_2379265BC(&qword_268937360);
    memcpy(v29, v30, *(void *)(*(void *)(v31 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v20 + 32))(v29, v30, v19);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v29, 0, 1, v19);
  }
  uint64_t v32 = a3[9];
  uint64_t v33 = (void *)(a1 + v32);
  uint64_t v34 = (const void *)(a2 + v32);
  if (v38((const void *)(a2 + v32), 1, v19))
  {
    uint64_t v35 = sub_2379265BC(&qword_268937360);
    memcpy(v33, v34, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v20 + 32))(v33, v34, v19);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v33, 0, 1, v19);
  }
  uint64_t v36 = a3[11];
  *(_OWORD *)(a1 + a3[10]) = *(_OWORD *)(a2 + a3[10]);
  *(unsigned char *)(a1 + v36) = *(unsigned char *)(a2 + v36);
  return a1;
}

uint64_t sub_237953750(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a2 + v7 + 8);
  *uint64_t v8 = *(void *)(a2 + v7);
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(v9 + 24);
  void v8[2] = *(void *)(v9 + 16);
  v8[3] = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = (int *)sub_23796E8C8();
  uint64_t v13 = v12[6];
  uint64_t v14 = (char *)v8 + v13;
  uint64_t v15 = v9 + v13;
  uint64_t v16 = sub_23796E358();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 40))(v14, v15, v16);
  *((unsigned char *)v8 + v12[7]) = *(unsigned char *)(v9 + v12[7]);
  *(_OWORD *)((char *)v8 + v12[8]) = *(_OWORD *)(v9 + v12[8]);
  uint64_t v17 = a3[6];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)(a2 + v17);
  uint64_t v20 = sub_2379265BC(&qword_268937368);
  uint64_t v53 = *(void *)(v20 - 8);
  uint64_t v21 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v53 + 48);
  LODWORD(v9) = v21(v18, 1, v20);
  int v22 = v21(v19, 1, v20);
  if (v9)
  {
    if (!v22)
    {
      (*(void (**)(void *, void *, uint64_t))(v53 + 32))(v18, v19, v20);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v53 + 56))(v18, 0, 1, v20);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v22)
  {
    (*(void (**)(void *, uint64_t))(v53 + 8))(v18, v20);
LABEL_6:
    uint64_t v23 = sub_2379265BC(&qword_268937360);
    memcpy(v18, v19, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v53 + 40))(v18, v19, v20);
LABEL_7:
  uint64_t v51 = a3;
  uint64_t v52 = a2;
  uint64_t v24 = a3[7];
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (void *)(a2 + v24);
  uint64_t v27 = sub_23796E5E8();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v28 + 48);
  int v30 = v29(v25, 1, v27);
  int v31 = v29(v26, 1, v27);
  if (v30)
  {
    if (!v31)
    {
      (*(void (**)(void *, void *, uint64_t))(v28 + 32))(v25, v26, v27);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v31)
  {
    (*(void (**)(void *, uint64_t))(v28 + 8))(v25, v27);
LABEL_12:
    uint64_t v32 = sub_2379265BC(&qword_268937570);
    memcpy(v25, v26, *(void *)(*(void *)(v32 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v28 + 40))(v25, v26, v27);
LABEL_13:
  uint64_t v33 = v51[8];
  uint64_t v34 = (void *)(a1 + v33);
  uint64_t v35 = (void *)(v52 + v33);
  int v36 = v21((void *)(a1 + v33), 1, v20);
  int v37 = v21(v35, 1, v20);
  if (v36)
  {
    if (!v37)
    {
      (*(void (**)(void *, void *, uint64_t))(v53 + 32))(v34, v35, v20);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v53 + 56))(v34, 0, 1, v20);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v37)
  {
    (*(void (**)(void *, uint64_t))(v53 + 8))(v34, v20);
LABEL_18:
    uint64_t v38 = sub_2379265BC(&qword_268937360);
    memcpy(v34, v35, *(void *)(*(void *)(v38 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v53 + 40))(v34, v35, v20);
LABEL_19:
  uint64_t v39 = v51[9];
  uint64_t v40 = (void *)(a1 + v39);
  uint64_t v41 = (void *)(v52 + v39);
  int v42 = v21((void *)(a1 + v39), 1, v20);
  int v43 = v21(v41, 1, v20);
  if (!v42)
  {
    if (!v43)
    {
      (*(void (**)(void *, void *, uint64_t))(v53 + 40))(v40, v41, v20);
      goto LABEL_25;
    }
    (*(void (**)(void *, uint64_t))(v53 + 8))(v40, v20);
    goto LABEL_24;
  }
  if (v43)
  {
LABEL_24:
    uint64_t v44 = sub_2379265BC(&qword_268937360);
    memcpy(v40, v41, *(void *)(*(void *)(v44 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(void *, void *, uint64_t))(v53 + 32))(v40, v41, v20);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v53 + 56))(v40, 0, 1, v20);
LABEL_25:
  uint64_t v45 = v51[10];
  uint64_t v46 = (void *)(a1 + v45);
  uint64_t v47 = (uint64_t *)(v52 + v45);
  uint64_t v49 = *v47;
  uint64_t v48 = v47[1];
  *uint64_t v46 = v49;
  v46[1] = v48;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + v51[11]) = *(unsigned char *)(v52 + v51[11]);
  return a1;
}

uint64_t sub_237953D44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_237953D58);
}

uint64_t sub_237953D58(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23796E2A8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_10:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_23796E8C8();
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[5];
LABEL_9:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_10;
  }
  uint64_t v14 = sub_2379265BC(&qword_268937360);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[6];
    goto LABEL_9;
  }
  uint64_t v15 = sub_2379265BC(&qword_268937570);
  if (*(_DWORD *)(*(void *)(v15 - 8) + 84) == a2)
  {
    uint64_t v8 = v15;
    uint64_t v12 = *(void *)(v15 - 8);
    uint64_t v13 = a3[7];
    goto LABEL_9;
  }
  unint64_t v17 = *(void *)(a1 + a3[10] + 8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  int v18 = v17 - 1;
  if (v18 < 0) {
    int v18 = -1;
  }
  return (v18 + 1);
}

uint64_t sub_237953F1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_237953F30);
}

uint64_t sub_237953F30(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_23796E2A8();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t v13 = sub_23796E8C8();
    if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
    {
      uint64_t v10 = v13;
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v15 = a4[5];
    }
    else
    {
      uint64_t v16 = sub_2379265BC(&qword_268937360);
      if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a3)
      {
        uint64_t v10 = v16;
        uint64_t v14 = *(void *)(v16 - 8);
        uint64_t v15 = a4[6];
      }
      else
      {
        uint64_t result = sub_2379265BC(&qword_268937570);
        if (*(_DWORD *)(*(void *)(result - 8) + 84) != a3)
        {
          *(void *)(a1 + a4[10] + 8) = a2;
          return result;
        }
        uint64_t v10 = result;
        uint64_t v14 = *(void *)(result - 8);
        uint64_t v15 = a4[7];
      }
    }
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

void sub_2379540E4()
{
  sub_23796E2A8();
  if (v0 <= 0x3F)
  {
    sub_23796E8C8();
    if (v1 <= 0x3F)
    {
      sub_2379459F0();
      if (v2 <= 0x3F)
      {
        sub_237945998();
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

uint64_t sub_23795423C()
{
  type metadata accessor for ChanceRainTemplateFormatter();
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = *(void *)sub_23796E9A8();
  strcpy((char *)(v0 + 24), "umbrella.fill");
  *(_WORD *)(v0 + 38) = -4864;
  uint64_t v2 = sub_237956078(&qword_2689377B0, v1, (void (*)(uint64_t))type metadata accessor for ChanceRainTemplateFormatter);
  *(void *)&xmmword_268939490 = v0;
  *((void *)&xmmword_268939490 + 1) = v2;

  return swift_retain();
}

void sub_2379542F0()
{
  id v0 = objc_msgSend(self, sel_currentDevice);
  if (v0)
  {
    uint64_t v1 = v0;
    id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD188]), sel_initWithDevice_identitySizeClass_, v0, 2);
    objc_msgSend(v2, sel_scaledValue_, 2.5);
    double v4 = v3;
    objc_msgSend(v2, sel_scaledValue_, 3.5);
    double v6 = v5;
    CLKComplicationGraphicExtraLargeCircularScalingFactor();
    double v8 = v7;

    qword_268937780 = *(void *)&v4;
    qword_268937788 = *(void *)&v6;
    *(double *)&qword_268937790 = v4 * v8;
    *(double *)&qword_268937798 = v6 * v8;
  }
  else
  {
    __break(1u);
  }
}

id sub_2379543C8(uint64_t a1)
{
  return sub_237954D30(a1, (Class *)0x263EFD128, (Class *)0x263EFD118);
}

id sub_2379543DC()
{
  swift_bridgeObjectRetain();
  id v0 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v1 = objc_msgSend(self, sel_symbolImageProviderWithSystemName_, v0);

  id v2 = self;
  id v3 = v1;
  id v4 = objc_msgSend(v2, sel_systemCyanColor);
  objc_msgSend(v3, sel_setTintColor_, v4);

  type metadata accessor for ChanceRainTemplateModel();
  swift_bridgeObjectRetain();
  double v5 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(self, sel_textProviderWithText_, v5);

  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD148]), sel_initWithTextProvider_imageProvider_, v6, v3);
  return v7;
}

id sub_237954534(uint64_t a1)
{
  return sub_237954D30(a1, (Class *)0x263EFCFD8, (Class *)0x263EFCFC0);
}

id sub_237954548(uint64_t a1)
{
  return sub_237954D30(a1, (Class *)0x263EFD000, (Class *)0x263EFCFF0);
}

id sub_23795455C(uint64_t a1)
{
  swift_bridgeObjectRetain();
  id v3 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(self, sel_symbolImageProviderWithSystemName_, v3);

  double v5 = self;
  id v6 = objc_msgSend(v5, sel_systemCyanColor);
  objc_msgSend(v4, sel_setTintColor_, v6);

  id v7 = objc_msgSend(v5, sel_whiteColor);
  objc_msgSend(v4, sel_setTintColor_, v7);

  uint64_t v8 = type metadata accessor for ChanceRainTemplateModel();
  swift_bridgeObjectRetain();
  uint64_t v9 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(self, sel_textProviderWithText_, v9);

  float v11 = (*(double (**)(void, void, void, uint64_t))(**(void **)(v1 + 16) + 184))(*(void *)(a1 + *(int *)(v8 + 24)), *(unsigned __int8 *)(a1 + *(int *)(v8 + 24) + 8), *(unsigned __int8 *)(a1 + *(int *)(v8 + 32)), 1);
  id v12 = objc_msgSend(v5, sel_systemCyanColor);
  float v13 = 0.0;
  if (v11 > 0.0) {
    float v13 = v11;
  }
  float v14 = fminf(v13, 1.0);
  uint64_t v15 = self;
  *(float *)&double v16 = v14;
  id v17 = objc_msgSend(v15, sel_gaugeProviderWithStyle_gaugeColor_fillFraction_, 1, v12, v16);

  id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD070]), sel_initWithGaugeProvider_leadingTextProvider_trailingTextProvider_imageProvider_, v17, v10, 0, v4);
  return v18;
}

id sub_2379547AC(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for ChanceRainTemplateModel();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = 10;
  swift_bridgeObjectRetain();
  double v5 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  v21[4] = sub_2379560C0;
  v21[5] = v4;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 1107296256;
  v21[2] = sub_237955288;
  v21[3] = &unk_26EA96380;
  id v6 = _Block_copy(v21);
  id v7 = objc_msgSend(self, sel_textProviderWithText_overrideBlock_, v5, v6);

  _Block_release(v6);
  swift_release();
  float v8 = (*(double (**)(void, void, void, uint64_t))(**(void **)(v1 + 16) + 184))(*(void *)(a1 + *(int *)(v3 + 24)), *(unsigned __int8 *)(a1 + *(int *)(v3 + 24) + 8), *(unsigned __int8 *)(a1 + *(int *)(v3 + 32)), 1);
  uint64_t v9 = self;
  id v10 = objc_msgSend(v9, sel_systemCyanColor);
  float v11 = 0.0;
  if (v8 > 0.0) {
    float v11 = v8;
  }
  float v12 = fminf(v11, 1.0);
  float v13 = self;
  *(float *)&double v14 = v12;
  id v15 = objc_msgSend(v13, sel_gaugeProviderWithStyle_gaugeColor_fillFraction_, 1, v10, v14);

  swift_bridgeObjectRetain();
  double v16 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v17 = objc_msgSend(self, sel_symbolImageProviderWithSystemName_, v16);

  id v18 = objc_msgSend(v9, sel_systemCyanColor);
  objc_msgSend(v17, sel_setTintColor_, v18);

  id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD038]), sel_initWithGaugeProvider_bottomImageProvider_centerTextProvider_, v15, v17, v7);
  return v19;
}

id sub_237954A64(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for ChanceRainTemplateModel();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = 12;
  swift_bridgeObjectRetain();
  double v5 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  v21[4] = sub_237956048;
  v21[5] = v4;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 1107296256;
  v21[2] = sub_237955288;
  v21[3] = &unk_26EA96330;
  id v6 = _Block_copy(v21);
  id v7 = objc_msgSend(self, sel_textProviderWithText_overrideBlock_, v5, v6);

  _Block_release(v6);
  swift_release();
  float v8 = (*(double (**)(void, void, void, uint64_t))(**(void **)(v1 + 16) + 184))(*(void *)(a1 + *(int *)(v3 + 24)), *(unsigned __int8 *)(a1 + *(int *)(v3 + 24) + 8), *(unsigned __int8 *)(a1 + *(int *)(v3 + 32)), 1);
  uint64_t v9 = self;
  id v10 = objc_msgSend(v9, sel_systemCyanColor);
  float v11 = 0.0;
  if (v8 > 0.0) {
    float v11 = v8;
  }
  float v12 = fminf(v11, 1.0);
  float v13 = self;
  *(float *)&double v14 = v12;
  id v15 = objc_msgSend(v13, sel_gaugeProviderWithStyle_gaugeColor_fillFraction_, 1, v10, v14);

  swift_bridgeObjectRetain();
  double v16 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v17 = objc_msgSend(self, sel_symbolImageProviderWithSystemName_, v16);

  id v18 = objc_msgSend(v9, sel_systemCyanColor);
  objc_msgSend(v17, sel_setTintColor_, v18);

  id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD0B0]), sel_initWithGaugeProvider_bottomImageProvider_centerTextProvider_, v15, v17, v7);
  return v19;
}

id sub_237954D1C(uint64_t a1)
{
  return sub_237954D30(a1, (Class *)0x263EFCFB0, (Class *)0x263EFCFA0);
}

id sub_237954D30(uint64_t a1, Class *a2, Class *a3)
{
  swift_bridgeObjectRetain();
  id v6 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(self, sel_symbolImageProviderWithSystemName_, v6);

  float v8 = self;
  id v9 = v7;
  id v10 = objc_msgSend(v8, sel_systemCyanColor);
  objc_msgSend(v9, sel_setTintColor_, v10);

  if (*(unsigned char *)(a1 + *(int *)(type metadata accessor for ChanceRainTemplateModel() + 24) + 8))
  {
    id v11 = objc_msgSend(objc_allocWithZone(*a3), sel_initWithImageProvider_, v9);
  }
  else
  {
    swift_bridgeObjectRetain();
    float v12 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    id v13 = objc_msgSend(self, sel_textProviderWithText_, v12);

    id v11 = objc_msgSend(objc_allocWithZone(*a2), sel_initWithLine1ImageProvider_line2TextProvider_, v9, v13);
  }

  return v11;
}

id sub_237954EC4(int a1, int a2, uint64_t a3, id a4, uint64_t a5)
{
  if (a3) {
    return 0;
  }
  id v8 = objc_msgSend(a4, sel_font);
  objc_msgSend(v8, sel_pointSize);
  double v10 = v9;

  uint64_t v11 = sub_23796EAC8();
  if (a5 == 12)
  {
    if (v11 > 4)
    {
      uint64_t v12 = qword_268937110;
      id v13 = &qword_268937798;
LABEL_12:
      if (v12 != -1) {
        swift_once();
      }
      double v10 = v10 - *(double *)v13;
      goto LABEL_15;
    }
    if (sub_23796EAC8() >= 4)
    {
      uint64_t v12 = qword_268937110;
      id v13 = &qword_268937790;
      goto LABEL_12;
    }
  }
  else
  {
    if (v11 > 4)
    {
      uint64_t v12 = qword_268937110;
      id v13 = &qword_268937788;
      goto LABEL_12;
    }
    if (sub_23796EAC8() >= 4)
    {
      uint64_t v12 = qword_268937110;
      id v13 = &qword_268937780;
      goto LABEL_12;
    }
  }
LABEL_15:
  id v14 = objc_msgSend(a4, sel_font);
  id v15 = objc_msgSend(v14, sel_fontDescriptor);

  id v16 = objc_msgSend(self, sel_fontWithDescriptor_size_, v15, v10);
  sub_2379265BC(&qword_2689377A8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2379713F0;
  id v18 = (void *)*MEMORY[0x263F814F0];
  *(void *)(inited + 32) = *MEMORY[0x263F814F0];
  *(void *)(inited + 40) = v16;
  id v19 = v18;
  id v20 = v16;
  unint64_t v21 = sub_2379295E0(inited);
  swift_bridgeObjectRetain();
  sub_237929A20(v21);
  swift_bridgeObjectRelease();
  id v22 = objc_allocWithZone(MEMORY[0x263F089B8]);
  uint64_t v23 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_237956078(&qword_2689372B8, 255, type metadata accessor for Key);
  uint64_t v24 = (void *)sub_23796EA08();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v22, sel_initWithString_attributes_, v23, v24);

  id v25 = objc_allocWithZone(NSString);
  swift_bridgeObjectRetain();
  uint64_t v26 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v27 = objc_msgSend(v25, sel_initWithString_, v26);

  uint64_t v28 = (void *)sub_23796EA68();
  id v29 = objc_msgSend(v27, sel_rangeOfString_, v28);
  uint64_t v31 = v30;

  if (v29 != (id)sub_23796E178())
  {
    id v32 = objc_msgSend(v20, sel__fontScaledByScaleFactor_, 0.75);
    if (v32)
    {
      id v33 = v32;
      objc_msgSend(v5, sel_addAttribute_value_range_, v19, v33, v29, v31);
    }
  }

  return v5;
}

id sub_237955288(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, id))(a1 + 32);
  uint64_t v7 = sub_23796EA98();
  uint64_t v9 = v8;
  swift_retain();
  id v10 = a4;
  uint64_t v11 = (void *)v6(v7, v9, a3, v10);
  swift_release();
  swift_bridgeObjectRelease();

  return v11;
}

uint64_t type metadata accessor for ChanceRainTemplateFormatter()
{
  return self;
}

uint64_t sub_23795534C()
{
  return sub_237956078(&qword_2689377A0, 255, (void (*)(uint64_t))type metadata accessor for ChanceRainTemplateModel);
}

id sub_23795539C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ChanceRainTemplateModel();
  uint64_t v3 = v2 - 8;
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23794A7C4(a1, (uint64_t)v5);
  id v6 = sub_237955BDC(&v5[*(int *)(v3 + 28)], v5[*(int *)(v3 + 32) + 8]);
  id v7 = objc_msgSend(self, sel_systemCyanColor);
  objc_msgSend(v6, sel_setTintColor_, v7);

  sub_23794A828((uint64_t)v5);
  swift_bridgeObjectRetain();
  uint64_t v8 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  uint64_t v9 = self;
  id v10 = objc_msgSend(v9, sel_textProviderWithText_, v8);

  uint64_t v11 = (void *)sub_23796EA68();
  uint64_t v12 = (void *)sub_23796EA68();
  id v13 = (id)NWKUILocalizedString();

  sub_23796EA98();
  id v14 = (void *)sub_23796EA68();
  id v15 = (void *)sub_23796EA68();
  id v16 = (id)NWKUILocalizedString();

  sub_23796EA98();
  id v17 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v18 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v19 = objc_msgSend(v9, sel_textProviderWithText_shortText_, v17, v18);

  id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD0F8]), sel_initWithHeaderTextProvider_body1TextProvider_body2TextProvider_, v6, v10, v19);
  return v20;
}

id sub_237955670(uint64_t a1)
{
  if (*(unsigned char *)(a1 + *(int *)(type metadata accessor for ChanceRainTemplateModel() + 24) + 8))
  {
    if (qword_2689370E0 != -1) {
      swift_once();
    }
    id v1 = (id)qword_268937660;
    uint64_t v2 = (void *)sub_23796EA68();
    uint64_t v3 = (void *)sub_23796EA68();
    id v4 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, 0, v3);

    sub_23796EA98();
    id v5 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    id v6 = objc_msgSend(self, sel_textProviderWithText_, v5);

    id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD138]), sel_initWithTextProvider_, v6);
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    uint64_t v9 = self;
    id v10 = objc_msgSend(v9, sel_textProviderWithText_, v8);

    uint64_t v11 = (void *)sub_23796EA68();
    uint64_t v12 = (void *)sub_23796EA68();
    id v13 = (id)NWKUILocalizedString();

    sub_23796EA98();
    swift_bridgeObjectRetain();
    sub_23796EAD8();
    id v14 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    id v15 = (void *)sub_23796EA68();
    id v16 = (id)NWKUILocalizedString();

    sub_23796EA98();
    if (qword_2689370E0 != -1) {
      swift_once();
    }
    id v17 = (id)qword_268937660;
    id v18 = (void *)sub_23796EA68();
    id v19 = (void *)sub_23796EA68();
    id v20 = objc_msgSend(v17, sel_localizedStringForKey_value_table_, v18, 0, v19);

    sub_23796EA98();
    unint64_t v21 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    uint64_t v22 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    id v23 = objc_msgSend(v9, sel_textProviderWithText_shortText_, v21, v22);

    unint64_t v24 = sub_2379407B8();
    sub_2379265BC((uint64_t *)&unk_268937390);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_237971400;
    *(void *)(inited + 56) = v24;
    uint64_t v26 = sub_237956078((unint64_t *)&unk_268937820, 255, (void (*)(uint64_t))sub_2379407B8);
    *(void *)(inited + 32) = v10;
    *(void *)(inited + 96) = v24;
    *(void *)(inited + 104) = v26;
    *(void *)(inited + 64) = v26;
    *(void *)(inited + 72) = v23;
    id v27 = v10;
    id v28 = v23;
    uint64_t v29 = sub_23796EDF8();
    swift_setDeallocating();
    sub_2379265BC(&qword_2689373C0);
    swift_arrayDestroy();
    uint64_t ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    uint64_t v31 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    id v32 = objc_msgSend(ObjCClassFromMetadata, sel_textProviderWithFormat_arguments_, v31, v29);

    id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD138]), sel_initWithTextProvider_, v32);
  }
  return v7;
}

id sub_237955BDC(void *a1, char a2)
{
  if (a2)
  {
    if (qword_2689370E0 != -1) {
      swift_once();
    }
    id v3 = (id)qword_268937660;
    id v4 = (void *)sub_23796EA68();
    id v5 = (void *)sub_23796EA68();
    id v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, 0, v5);

    sub_23796EA98();
    if ((*((unsigned char *)a1 + *(int *)(sub_23796E8C8() + 28)) & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v8 = (id)sub_23796EA68();
      swift_bridgeObjectRelease();
      id v15 = objc_msgSend(self, sel_textProviderWithText_, v8);
      swift_bridgeObjectRelease();
      goto LABEL_19;
    }
    id v7 = (void *)sub_23796EA68();
    id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.376470588, 0.788235294, 0.97254902, 1.0);
    uint64_t v9 = (void *)NWCGlyphPrefixedTextProvider();
    goto LABEL_14;
  }
  BOOL v10 = *a1 == 0x65772D6C61636F6CLL && a1[1] == 0xED00007265687461;
  if (v10 || (sub_23796EDB8() & 1) != 0)
  {
    if (qword_2689370E0 != -1) {
      swift_once();
    }
    id v11 = (id)qword_268937660;
    uint64_t v12 = (void *)sub_23796EA68();
    id v13 = (void *)sub_23796EA68();
    id v14 = objc_msgSend(v11, sel_localizedStringForKey_value_table_, v12, 0, v13);

    sub_23796EA98();
    id v7 = (void *)sub_23796EA68();
    id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.376470588, 0.788235294, 0.97254902, 1.0);
    uint64_t v9 = (void *)NWCGlyphPrefixedTextProvider();
LABEL_14:
    id v15 = v9;
    swift_bridgeObjectRelease();

    goto LABEL_19;
  }
  if (*((unsigned char *)a1 + *(int *)(sub_23796E8C8() + 28)) == 1)
  {
    id v16 = (void *)sub_23796EA68();
    id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.376470588, 0.788235294, 0.97254902, 1.0);
    id v15 = (id)NWCGlyphPrefixedTextProvider();
  }
  else
  {
    swift_bridgeObjectRetain();
    id v8 = (id)sub_23796EA68();
    swift_bridgeObjectRelease();
    id v15 = objc_msgSend(self, sel_textProviderWithText_, v8);
  }
LABEL_19:

  return v15;
}

uint64_t sub_237956038()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_237956048(int a1, int a2, uint64_t a3, void *a4)
{
  return sub_237954EC4(a1, a2, a3, a4, *(void *)(v4 + 16));
}

uint64_t sub_237956050(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_237956060()
{
  return swift_release();
}

uint64_t sub_237956068()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_237956078(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_2379560CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, float *a3@<X8>)
{
  uint64_t v107 = a3;
  uint64_t v5 = sub_2379265BC(&qword_268937368);
  id v6 = *(void **)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  unint64_t v99 = (char *)&v96 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v102 = (char *)&v96 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  id v100 = (char *)&v96 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  id v15 = (char *)&v96 - v14;
  MEMORY[0x270FA5388](v13);
  id v103 = (char *)&v96 - v16;
  uint64_t v17 = sub_2379265BC(&qword_268937360);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  uint64_t v108 = (char *)&v96 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v96 - v21;
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  id v25 = (char *)&v96 - v24;
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  uint64_t v111 = (uint64_t)&v96 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v30 = (char *)&v96 - v29;
  MEMORY[0x270FA5388](v28);
  id v32 = (char *)&v96 - v31;
  uint64_t v33 = type metadata accessor for WeatherTemplateModel();
  sub_23792B1A4(a1 + *(int *)(v33 + 32), (uint64_t)v32);
  uint64_t v109 = v33;
  uint64_t v110 = a1;
  sub_23792B1A4(a1 + *(int *)(v33 + 36), (uint64_t)v30);
  uint64_t v101 = v6;
  uint64_t v34 = (unsigned int (*)(char *, uint64_t, uint64_t))v6[6];
  if (v34(v32, 1, v5))
  {
    if (v34(v30, 1, v5)) {
      goto LABEL_9;
    }
    double v35 = 1.0;
LABEL_7:
    sub_23796E1C8();
    if (v35 >= v37) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  sub_23796E1C8();
  double v35 = v36;
  if (!v34(v30, 1, v5)) {
    goto LABEL_7;
  }
  if (v35 < 0.0)
  {
LABEL_8:
    uint64_t v38 = v111;
    sub_23792B1A4((uint64_t)v32, v111);
    sub_237956B14((uint64_t)v30, (uint64_t)v32);
    sub_237956B7C(v38, (uint64_t)v30);
  }
LABEL_9:
  sub_23792B1A4((uint64_t)v32, (uint64_t)v25);
  unsigned int v39 = v34(v25, 1, v5);
  uint64_t v106 = v30;
  uint64_t v112 = v32;
  if (v39 != 1)
  {
    uint64_t v97 = v15;
    LODWORD(v98) = a2;
    uint64_t v40 = v101;
    uint64_t v41 = (void (*)(char *, char *, uint64_t))v101[4];
    int v42 = v103;
    v41(v103, v25, v5);
    sub_23792B1A4((uint64_t)v30, (uint64_t)v22);
    if (v34(v22, 1, v5) == 1)
    {
      ((void (*)(char *, uint64_t))v40[1])(v42, v5);
LABEL_15:
      id v32 = v112;
      a2 = v98;
      goto LABEL_16;
    }
    int v43 = v97;
    v41(v97, v22, v5);
    uint64_t v22 = v108;
    sub_23792B1A4(v110 + *(int *)(v109 + 24), (uint64_t)v108);
    if (v34(v22, 1, v5) == 1)
    {
      uint64_t v44 = (void (*)(char *, uint64_t))v101[1];
      v44(v43, v5);
      v44(v103, v5);
      goto LABEL_15;
    }
    unint64_t v71 = v100;
    v41(v100, v22, v5);
    uint64_t v72 = v103;
    id v105 = (id)sub_23796E8D8();
    id v104 = (id)sub_23796E8D8();
    sub_2379439AC();
    char v73 = sub_23796E1A8();
    uint64_t v75 = v101;
    uint64_t v74 = v102;
    uint64_t v76 = (void (*)(char *, char *, uint64_t))v101[2];
    v76(v102, v72, v5);
    uint64_t v77 = v99;
    v76(v99, v71, v5);
    if (v73)
    {
      char v78 = sub_23796E1A8();
      uint64_t v79 = (void (*)(char *, uint64_t))v75[1];
      v79(v77, v5);
      v79(v74, v5);
      float v53 = 0.5;
      id v32 = v112;
      a2 = v98;
      uint64_t v80 = v97;
      if (v78)
      {
LABEL_37:
        uint64_t v91 = sub_23796E8E8();
        uint64_t v92 = *(void *)(v91 + 16);
        uint64_t v108 = (char *)v93;
        if (v92)
        {
          uint64_t v98 = v90;
          unint64_t v99 = (char *)v79;
          unint64_t v114 = MEMORY[0x263F8EE78];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_23796ED08();
          uint64_t v94 = 0;
          do
          {
            uint64_t v95 = v94 + 1;
            objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, *(double *)(v91 + 8 * v94 + 32));
            sub_23796ECE8();
            sub_23796ED18();
            sub_23796ED28();
            sub_23796ECF8();
            uint64_t v94 = v95;
          }
          while (v92 != v95);
          uint64_t v102 = (char *)v114;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          id v32 = v112;
          uint64_t v80 = v97;
          uint64_t v79 = (void (*)(char *, uint64_t))v99;
        }
        else
        {
          uint64_t v102 = (char *)MEMORY[0x263F8EE78];
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v79(v100, v5);
        v79(v80, v5);
        v79(v103, v5);
        goto LABEL_26;
      }
    }
    else
    {
      uint64_t v79 = (void (*)(char *, uint64_t))v75[1];
      v79(v77, v5);
      v79(v74, v5);
      id v32 = v112;
      a2 = v98;
      uint64_t v80 = v97;
    }
    sub_23796E1C8();
    double v82 = v81;
    sub_23796E1C8();
    double v84 = v83;
    sub_23796E1C8();
    double v86 = (v85 - v82) / (v84 - v82);
    float v53 = 1.0;
    if (v86 < 1.0)
    {
      float v87 = v86;
      BOOL v88 = v87 > 0.0;
      float v89 = fminf(v87, 1.0);
      if (!v88) {
        float v89 = 0.0;
      }
      if (v86 >= 0.0) {
        float v53 = v89;
      }
      else {
        float v53 = 0.0;
      }
    }
    goto LABEL_37;
  }
  uint64_t v22 = v25;
LABEL_16:
  sub_23792B20C((uint64_t)v22);
  uint64_t v45 = sub_23796E998();
  uint64_t v46 = *(void *)v45;
  uint64_t v47 = *(void *)(*(void *)v45 + 16);
  uint64_t v113 = MEMORY[0x263F8EE78];
  unint64_t v114 = MEMORY[0x263F8EE78];
  if (v47)
  {
    double v48 = 1.0 / (double)v47;
    swift_bridgeObjectRetain();
    double v49 = 0.0;
    uint64_t v50 = 40;
    do
    {
      id v51 = *(id *)(v46 + v50);
      MEMORY[0x237E25BF0]();
      if (*(void *)((v113 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v113 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_23796EB38();
      }
      sub_23796EB58();
      sub_23796EB28();
      objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v49);
      MEMORY[0x237E25BF0]();
      if (*(void *)((v114 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v114 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_23796EB38();
      }
      sub_23796EB58();
      sub_23796EB28();

      double v49 = v48 + v49;
      v50 += 16;
      --v47;
    }
    while (v47);
    swift_bridgeObjectRelease();
    uint64_t v102 = (char *)v114;
    id v32 = v112;
    uint64_t v108 = (char *)v113;
  }
  else
  {
    uint64_t v108 = (char *)MEMORY[0x263F8EE78];
    uint64_t v102 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v52 = self;
  id v105 = objc_msgSend(v52, sel_whiteColor);
  id v104 = objc_msgSend(v52, sel_whiteColor);
  float v53 = *MEMORY[0x263EFCF60];
LABEL_26:
  uint64_t v54 = *(void *)sub_23796E968();
  uint64_t v55 = v111;
  sub_23792B1A4((uint64_t)v32, v111);
  uint64_t v56 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v54 + 152);
  swift_retain();
  id v103 = (char *)v56(v55, 0, 0);
  uint64_t v58 = v57;
  sub_23792B20C(v55);
  uint64_t v59 = (uint64_t)v106;
  sub_23792B1A4((uint64_t)v106, v55);
  uint64_t v60 = v56(v55, 0, 0);
  uint64_t v62 = v61;
  sub_23792B20C(v55);
  uint64_t v63 = v110;
  uint64_t v64 = v56(v110 + *(int *)(v109 + 24), a2, 1);
  uint64_t v66 = v65;
  swift_release();
  sub_23793934C(v63);
  sub_23792B20C(v59);
  uint64_t result = sub_23792B20C((uint64_t)v112);
  uint64_t v68 = v107;
  *uint64_t v107 = v53;
  *((void *)v68 + 1) = v64;
  *((void *)v68 + 2) = v66;
  *((void *)v68 + 3) = v103;
  *((void *)v68 + 4) = v58;
  *((void *)v68 + 5) = v105;
  *((void *)v68 + 6) = v60;
  id v69 = v104;
  *((void *)v68 + 7) = v62;
  *((void *)v68 + 8) = v69;
  uint64_t v70 = v102;
  *((void *)v68 + 9) = v108;
  *((void *)v68 + 10) = v70;
  return result;
}

uint64_t sub_237956B14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2379265BC(&qword_268937360);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_237956B7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2379265BC(&qword_268937360);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_237956BE4()
{
  type metadata accessor for NHPTemplateFormatter();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_237957468((unint64_t *)&unk_2689377C0, v1, (void (*)(uint64_t))type metadata accessor for NHPTemplateFormatter);
  qword_2689394A0 = v0;
  *(void *)algn_2689394A8 = result;
  return result;
}

uint64_t type metadata accessor for NHPTemplateFormatter()
{
  return self;
}

uint64_t sub_237956C78()
{
  return sub_237957468(&qword_2689377B8, 255, (void (*)(uint64_t))type metadata accessor for NHPTemplateModel);
}

id sub_237956CC4(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v1 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    uint64_t v2 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    id v3 = objc_msgSend(self, sel_textProviderWithText_shortText_, v1, v2);
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    id v3 = objc_msgSend(self, sel_textProviderWithText_, v2);
  }

  objc_msgSend(v3, sel_setUseLowercaseSmallCaps_, 1);
  sub_2379290F8();
  id v4 = v3;
  swift_retain();
  uint64_t v5 = (void *)sub_23796EC18();
  objc_msgSend(v4, sel_setTintColor_, v5);

  return v4;
}

id sub_237956E24(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  id v4 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(self, sel_symbolImageProviderWithSystemName_, v4);

  if (a2 != 12 && a2 != 10) {
    goto LABEL_8;
  }
  id v6 = self;
  id v7 = objc_msgSend(v6, sel_currentDevice);
  if (!v7)
  {

    return 0;
  }
  uint64_t v8 = v7;
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD188]), sel_initWithDevice_identitySizeClass_, v7, 2);
  objc_msgSend(v8, sel_screenScale);
  objc_msgSend(v9, sel_scaledValue_, 24.0 / v10);
  double v12 = v11;
  if (a2 != 12)
  {
LABEL_7:
    id v17 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v12);
    objc_msgSend(v5, sel_setOverridePointSize_, v17);

LABEL_8:
    if (*(void *)(a1 + 56))
    {
      sub_2379290F8();
      swift_retain_n();
      uint64_t v18 = (void *)sub_23796EC18();
      objc_msgSend(v5, sel_setTintColor_, v18);
      swift_release();
    }
    return v5;
  }
  id result = objc_msgSend(v6, sel_currentDevice);
  if (result)
  {
    uint64_t v14 = result;
    NWCExtraLargeScalingFactor();
    double v16 = v15;

    double v12 = v12 * v16;
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

id sub_237957014(uint64_t a1)
{
  uint64_t v2 = sub_23796E958();
  MEMORY[0x270FA5388](v2 - 8);
  id v4 = &v13[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = type metadata accessor for NHPTemplateModel();
  sub_23795716C(a1 + *(int *)(v5 + 24), (uint64_t)v4);
  sub_23796E928();
  id v6 = sub_237956CC4((uint64_t)v13);
  id v7 = sub_237956E24((uint64_t)v13, 8);
  if (v7)
  {
    uint64_t v8 = v7;
    if (v6)
    {
      id v9 = objc_allocWithZone(MEMORY[0x263EFD098]);
      id v10 = v8;
      id v11 = v6;
      id v6 = objc_msgSend(v9, sel_initWithTextProvider_imageProvider_, v11, v10);
      sub_23795722C((uint64_t)v13);

      sub_2379571D0((uint64_t)v4);
    }
    else
    {
      sub_2379571D0((uint64_t)v4);

      sub_23795722C((uint64_t)v13);
    }
  }
  else
  {
    sub_2379571D0((uint64_t)v4);

    sub_23795722C((uint64_t)v13);
    return 0;
  }
  return v6;
}

uint64_t sub_23795716C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23796E958();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2379571D0(uint64_t a1)
{
  uint64_t v2 = sub_23796E958();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23795722C(uint64_t a1)
{
  return a1;
}

id sub_237957294(uint64_t a1)
{
  return sub_2379572C4(a1, 10, (Class *)0x263EFD058, (Class *)0x263EFD030);
}

id sub_2379572AC(uint64_t a1)
{
  return sub_2379572C4(a1, 12, (Class *)0x263EFD0D0, (Class *)0x263EFD0A0);
}

id sub_2379572C4(uint64_t a1, uint64_t a2, Class *a3, Class *a4)
{
  uint64_t v8 = sub_23796E958();
  MEMORY[0x270FA5388](v8 - 8);
  id v10 = &v23[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = type metadata accessor for NHPTemplateModel();
  sub_23795716C(a1 + *(int *)(v11 + 24), (uint64_t)v10);
  sub_23796E928();
  id v12 = sub_237956CC4((uint64_t)v23);
  id v13 = sub_237956E24((uint64_t)v23, a2);
  if (v13)
  {
    uint64_t v14 = v13;
    if (v12)
    {
      id v15 = objc_allocWithZone(*a3);
      id v16 = v14;
      id v17 = v12;
      id v18 = objc_msgSend(v15, sel_initWithLine1ImageProvider_line2TextProvider_, v16, v17);
      sub_23795722C((uint64_t)v23);
    }
    else
    {
      id v19 = objc_allocWithZone(*a4);
      id v20 = v14;
      id v21 = objc_msgSend(v19, sel_initWithImageProvider_, v20);
      id v18 = sub_23794B274();
      sub_23795722C((uint64_t)v23);
    }
    sub_2379571D0((uint64_t)v10);
  }
  else
  {
    sub_2379571D0((uint64_t)v10);

    sub_23795722C((uint64_t)v23);
    return 0;
  }
  return v18;
}

uint64_t sub_237957468(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_2379574B0()
{
  type metadata accessor for UVRectangularTemplateFormatter();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_237958004((unint64_t *)&unk_268937830, v1, (void (*)(uint64_t))type metadata accessor for UVRectangularTemplateFormatter);
  *(void *)&xmmword_2689394B0 = v0;
  *((void *)&xmmword_2689394B0 + 1) = result;
  return result;
}

uint64_t type metadata accessor for UVRectangularTemplateFormatter()
{
  return self;
}

uint64_t sub_237957544()
{
  return sub_237958004((unint64_t *)&unk_2689377D0, 255, (void (*)(uint64_t))type metadata accessor for UVRectangularTemplateModel);
}

void *sub_237957590(void **a1)
{
  uint64_t v2 = (int *)type metadata accessor for UVTemplateModel();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v80 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_237926638(0, (unint64_t *)&unk_2689377E0);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v6 = objc_msgSend(self, sel_fullColorImageProviderWithImageViewClass_, ObjCClassFromMetadata);
  sub_2379265BC((uint64_t *)&unk_268937380);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2379713F0;
  *(void *)(inited + 32) = sub_23796EA98();
  *(void *)(inited + 40) = v8;
  uint64_t v9 = *a1;
  *(void *)(inited + 48) = *a1;
  id v10 = v9;
  unint64_t v11 = sub_2379294C4(inited);
  sub_2379296EC(v11);
  swift_bridgeObjectRelease();
  sub_2379265BC((uint64_t *)&unk_2689377F0);
  id v12 = (void *)sub_23796EA08();
  swift_bridgeObjectRelease();
  id v86 = v6;
  objc_msgSend(v6, sel_setMetadata_, v12);

  uint64_t v13 = type metadata accessor for UVRectangularTemplateModel();
  sub_2379291E0((uint64_t)a1 + *(int *)(v13 + 20), (uint64_t)v4);
  uint64_t v14 = &v4[v2[6]];
  uint64_t v15 = *((void *)v14 + 1);
  float v87 = v4;
  if (v15 && (id v16 = *(void **)&v4[v2[8]]) != 0)
  {
    uint64_t v81 = *(void *)v14;
    uint64_t v17 = qword_2689370E0;
    uint64_t v83 = v15;
    swift_bridgeObjectRetain();
    id v85 = v16;
    if (v17 != -1) {
      swift_once();
    }
    id v18 = (id)qword_268937660;
    id v19 = (void *)sub_23796EA68();
    double v84 = "DEMO_LOCATION_DISPLAY_NAME";
    id v20 = (void *)sub_23796EA68();
    id v21 = objc_msgSend(v18, sel_localizedStringForKey_value_table_, v19, 0, v20);

    uint64_t v22 = sub_23796EA98();
    uint64_t v24 = v23;

    id v25 = (id)qword_268937660;
    uint64_t v26 = (void *)sub_23796EA68();
    uint64_t v27 = (void *)sub_23796EA68();
    id v28 = objc_msgSend(v25, sel_localizedStringForKey_value_table_, v26, 0, v27);

    sub_23796EA98();
    uint64_t v82 = sub_2379265BC((uint64_t *)&unk_268937390);
    uint64_t v29 = swift_allocObject();
    long long v80 = xmmword_237971400;
    *(_OWORD *)(v29 + 16) = xmmword_237971400;
    uint64_t v30 = MEMORY[0x263F8D310];
    *(void *)(v29 + 56) = MEMORY[0x263F8D310];
    unint64_t v31 = sub_23792918C();
    *(void *)(v29 + 64) = v31;
    *(void *)(v29 + 32) = v22;
    *(void *)(v29 + 40) = v24;
    id v32 = &v87[v2[5]];
    if (v32[8]) {
      uint64_t v33 = 0;
    }
    else {
      uint64_t v33 = *(void *)v32;
    }
    uint64_t v88 = v33;
    sub_23792E5BC();
    uint64_t v34 = sub_23796EC68();
    *(void *)(v29 + 96) = v30;
    *(void *)(v29 + 104) = v31;
    *(void *)(v29 + 72) = v34;
    *(void *)(v29 + 80) = v35;
    sub_23796EAA8();
    swift_bridgeObjectRelease();
    double v36 = (char *)a1 + *(int *)(v13 + 28);
    if (v36[*(int *)(sub_23796E8C8() + 28)] == 1)
    {
      double v37 = (void *)sub_23796EA68();
      id v38 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.376470588, 0.788235294, 0.97254902, 1.0);
      id v39 = (id)NWCGlyphPrefixedTextProvider();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain();
      id v38 = (id)sub_23796EA68();
      swift_bridgeObjectRelease();
      id v39 = objc_msgSend(self, sel_textProviderWithText_, v38);
      swift_bridgeObjectRelease();
    }

    objc_msgSend(v39, sel_setTintColor_, v85);
    uint64_t v88 = v81;
    uint64_t v89 = v83;
    sub_237929138();
    sub_23796EC58();
    swift_bridgeObjectRelease();
    uint64_t v61 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    id v62 = objc_msgSend(self, sel_textProviderWithText_, v61);

    uint64_t v63 = self;
    id v64 = v62;
    id v65 = objc_msgSend(v63, sel_whiteColor);
    objc_msgSend(v64, sel_setTintColor_, v65);

    uint64_t v66 = sub_237926638(0, (unint64_t *)&qword_2689373A0);
    id v67 = (id)qword_268937660;
    uint64_t v68 = (void *)sub_23796EA68();
    id v69 = (void *)sub_23796EA68();
    id v70 = objc_msgSend(v67, sel_localizedStringForKey_value_table_, v68, 0, v69);

    sub_23796EA98();
    uint64_t v71 = swift_initStackObject();
    *(_OWORD *)(v71 + 16) = v80;
    *(void *)(v71 + 56) = sub_237926638(0, (unint64_t *)&unk_268937810);
    *(void *)(v71 + 64) = sub_23792B2C8((unint64_t *)&unk_2689373B0, (unint64_t *)&unk_268937810);
    *(void *)(v71 + 32) = v39;
    *(void *)(v71 + 96) = v66;
    *(void *)(v71 + 104) = sub_23792B2C8((unint64_t *)&unk_268937820, (unint64_t *)&qword_2689373A0);
    *(void *)(v71 + 72) = v64;
    id v58 = v64;
    id v72 = v39;
    uint64_t v73 = sub_23796EDF8();
    swift_setDeallocating();
    sub_2379265BC(&qword_2689373C0);
    swift_arrayDestroy();
    uint64_t v74 = (void *)swift_getObjCClassFromMetadata();
    id v59 = (id)sub_23796EA68();
    swift_bridgeObjectRelease();
    id v60 = objc_msgSend(v74, sel_textProviderWithFormat_arguments_, v59, v73);
  }
  else
  {
    if (qword_2689370E0 != -1) {
      swift_once();
    }
    id v40 = (id)qword_268937660;
    uint64_t v41 = (void *)sub_23796EA68();
    int v42 = (void *)sub_23796EA68();
    id v43 = objc_msgSend(v40, sel_localizedStringForKey_value_table_, v41, 0, v42);

    uint64_t v44 = sub_23796EA98();
    uint64_t v46 = v45;

    uint64_t v88 = v44;
    uint64_t v89 = v46;
    sub_237929138();
    sub_23796EC58();
    swift_bridgeObjectRelease();
    id v47 = (id)qword_268937660;
    double v48 = (void *)sub_23796EA68();
    double v49 = (void *)sub_23796EA68();
    id v50 = objc_msgSend(v47, sel_localizedStringForKey_value_table_, v48, 0, v49);

    uint64_t v51 = sub_23796EA98();
    uint64_t v53 = v52;

    uint64_t v88 = v51;
    uint64_t v89 = v53;
    sub_23796EC58();
    swift_bridgeObjectRelease();
    uint64_t v54 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    uint64_t v55 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    id v56 = objc_msgSend(self, sel_textProviderWithText_shortText_, v54, v55);

    uint64_t v57 = self;
    id v58 = v56;
    id v59 = objc_msgSend(v57, sel_grayColor);
    objc_msgSend(v58, sel_setTintColor_, v59);
    id v60 = v58;
  }

  id v75 = objc_allocWithZone(MEMORY[0x263EFD0E0]);
  uint64_t v76 = v86;
  id v77 = objc_msgSend(v75, sel_initWithTextProvider_imageProvider_, v60, v86);
  char v78 = sub_23794B3A8();

  sub_237929244((uint64_t)v87);
  return v78;
}

uint64_t sub_237958004(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_23795804C()
{
  type metadata accessor for WindRectangularTemplateFormatter();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_237958EC8(&qword_268937858, v1, (void (*)(uint64_t))type metadata accessor for WindRectangularTemplateFormatter);
  *(void *)&xmmword_2689394C0 = v0;
  *((void *)&xmmword_2689394C0 + 1) = result;
  return result;
}

uint64_t type metadata accessor for WindRectangularTemplateFormatter()
{
  return self;
}

uint64_t sub_2379580E0()
{
  return sub_237958EC8(&qword_268937290, 255, (void (*)(uint64_t))type metadata accessor for WindRectangularTemplateModel);
}

void *sub_23795812C(void **a1)
{
  uint64_t v2 = sub_23796E318();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v106 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2379265BC((uint64_t *)&unk_268937840);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v106 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for WindRectangularTemplateModel();
  id v10 = (char *)a1 + *(int *)(v9 + 20);
  uint64_t v11 = type metadata accessor for WindTemplateModel();
  int v12 = v10[*(int *)(v11 + 24)];
  uint64_t v110 = a1;
  if (v12 == 16) {
    goto LABEL_4;
  }
  uint64_t v109 = sub_23796E7C8();
  uint64_t v14 = v13;
  sub_237958E00((uint64_t)&v10[*(int *)(v11 + 28)], (uint64_t)v8);
  uint64_t v15 = sub_2379265BC(&qword_268937230);
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v8, 1, v15) == 1)
  {
    sub_237958E68((uint64_t)v8);
    swift_bridgeObjectRelease();
LABEL_4:
    if (qword_2689370E0 != -1) {
      swift_once();
    }
    id v17 = (id)qword_268937660;
    id v18 = (void *)sub_23796EA68();
    id v19 = (void *)sub_23796EA68();
    id v20 = objc_msgSend(v17, sel_localizedStringForKey_value_table_, v18, 0, v19);

    uint64_t v21 = sub_23796EA98();
    uint64_t v23 = v22;

    uint64_t v113 = v21;
    uint64_t v114 = v23;
    sub_237929138();
    sub_23796EC58();
    swift_bridgeObjectRelease();
    id v24 = (id)qword_268937660;
    id v25 = (void *)sub_23796EA68();
    uint64_t v26 = (void *)sub_23796EA68();
    id v27 = objc_msgSend(v24, sel_localizedStringForKey_value_table_, v25, 0, v26);

    uint64_t v28 = sub_23796EA98();
    uint64_t v30 = v29;

    uint64_t v113 = v28;
    uint64_t v114 = v30;
    sub_23796EC58();
    swift_bridgeObjectRelease();
    unint64_t v31 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    id v32 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    id v33 = objc_msgSend(self, sel_textProviderWithText_shortText_, v31, v32);

    uint64_t v34 = self;
    id v35 = v33;
    id v36 = objc_msgSend(v34, sel_grayColor);
    objc_msgSend(v35, sel_setTintColor_, v36);
    id v37 = v35;
    goto LABEL_13;
  }
  v106[4] = v14;
  sub_23796E308();
  sub_23796E198();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v8, v15);
  v106[2] = v113;
  v106[3] = v114;
  long long v118 = v115;
  sub_237926600((uint64_t)&v118);
  long long v117 = v116;
  sub_237926600((uint64_t)&v117);
  v106[5] = sub_237939720();
  uint64_t v107 = v38;
  id v39 = (char *)v110 + *(int *)(v9 + 28);
  char v40 = v39[*(int *)(sub_23796E8C8() + 28)];
  uint64_t v41 = (void *)sub_23796EA68();
  if (v40)
  {
    id v42 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.376470588, 0.788235294, 0.97254902, 1.0);
    id v43 = (id)NWCGlyphPrefixedTextProvider();

    uint64_t v41 = v42;
  }
  else
  {
    id v43 = objc_msgSend(self, sel_textProviderWithText_, v41);
  }
  id v108 = v43;

  uint64_t v44 = self;
  id v45 = objc_msgSend(v44, sel_systemCyanColor);
  objc_msgSend(v43, sel_setTintColor_, v45);

  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v46 = (id)qword_268937660;
  id v47 = (void *)sub_23796EA68();
  double v48 = (void *)sub_23796EA68();
  id v49 = objc_msgSend(v46, sel_localizedStringForKey_value_table_, v47, 0, v48);

  sub_23796EA98();
  v106[1] = sub_2379265BC((uint64_t *)&unk_268937390);
  uint64_t v50 = swift_allocObject();
  *(_OWORD *)(v50 + 16) = xmmword_2379713F0;
  id v51 = (id)qword_268937660;
  uint64_t v52 = (void *)sub_23796EA68();
  uint64_t v53 = (void *)sub_23796EA68();
  id v54 = objc_msgSend(v51, sel_localizedStringForKey_value_table_, v52, 0, v53);

  uint64_t v55 = sub_23796EA98();
  uint64_t v57 = v56;

  uint64_t v111 = v55;
  uint64_t v112 = v57;
  sub_237929138();
  uint64_t v58 = MEMORY[0x263F8D310];
  uint64_t v59 = sub_23796EC58();
  uint64_t v61 = v60;
  swift_bridgeObjectRelease();
  *(void *)(v50 + 56) = v58;
  *(void *)(v50 + 64) = sub_23792918C();
  *(void *)(v50 + 32) = v59;
  *(void *)(v50 + 40) = v61;
  sub_23796EAA8();
  swift_bridgeObjectRelease();
  id v62 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  uint64_t v63 = (void *)sub_23796EA68();
  id v64 = self;
  id v65 = objc_msgSend(v64, sel_textProviderWithText_shortText_, v62, v63);

  id v66 = v65;
  id v67 = objc_msgSend(v44, sel_systemCyanColor);
  v106[0] = v66;
  objc_msgSend(v66, sel_setTintColor_, v67);

  uint64_t v68 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v69 = objc_msgSend(v64, sel_textProviderWithText_, v68);

  id v70 = v69;
  uint64_t v109 = (uint64_t)v70;
  id v71 = objc_msgSend(v44, sel_systemCyanColor);
  objc_msgSend(v70, sel_setTintColor_, v71);

  id v72 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v73 = objc_msgSend(v64, sel_textProviderWithText_, v72);

  id v74 = v73;
  id v75 = objc_msgSend(v44, sel_whiteColor);
  objc_msgSend(v74, sel_setTintColor_, v75);

  uint64_t v76 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v77 = objc_msgSend(v64, sel_textProviderWithText_, v76);

  id v78 = v77;
  id v79 = objc_msgSend(v44, sel_whiteColor);
  objc_msgSend(v78, sel_setTintColor_, v79);

  long long v80 = (void *)sub_23796EA68();
  uint64_t v81 = (void *)sub_23796EA68();
  id v82 = (id)NWCLocalizedString();

  uint64_t v107 = sub_23796EA98();
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2379710C0;
  *(void *)(inited + 56) = sub_237926638(0, (unint64_t *)&unk_268937810);
  *(void *)(inited + 64) = sub_23792B2C8((unint64_t *)&unk_2689373B0, (unint64_t *)&unk_268937810);
  double v84 = v108;
  *(void *)(inited + 32) = v108;
  uint64_t v85 = sub_237926638(0, (unint64_t *)&qword_2689373A0);
  *(void *)(inited + 96) = v85;
  uint64_t v86 = sub_23792B2C8((unint64_t *)&unk_268937820, (unint64_t *)&qword_2689373A0);
  float v87 = (void *)v106[0];
  *(void *)(inited + 72) = v106[0];
  *(void *)(inited + 136) = v85;
  *(void *)(inited + 144) = v86;
  uint64_t v88 = (void *)v109;
  *(void *)(inited + 104) = v86;
  *(void *)(inited + 112) = v88;
  *(void *)(inited + 176) = v85;
  *(void *)(inited + 184) = v86;
  *(void *)(inited + 152) = v74;
  *(void *)(inited + 216) = v85;
  *(void *)(inited + 224) = v86;
  *(void *)(inited + 192) = v78;
  id v35 = v87;
  id v89 = v88;
  id v90 = v74;
  id v91 = v78;
  id v92 = v84;
  uint64_t v93 = sub_23796EDF8();
  swift_setDeallocating();
  sub_2379265BC(&qword_2689373C0);
  swift_arrayDestroy();
  uint64_t v94 = self;
  id v36 = (id)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v37 = objc_msgSend(v94, sel_textProviderWithFormat_arguments_, v36, v93);

LABEL_13:
  sub_237926638(0, &qword_268937850);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v96 = objc_msgSend(self, sel_fullColorImageProviderWithImageViewClass_, ObjCClassFromMetadata);
  uint64_t v97 = *v110;
  sub_2379265BC((uint64_t *)&unk_268937380);
  uint64_t v98 = swift_initStackObject();
  *(_OWORD *)(v98 + 16) = xmmword_2379713F0;
  *(void *)(v98 + 32) = sub_23796EA98();
  *(void *)(v98 + 40) = v99;
  *(void *)(v98 + 48) = v97;
  id v100 = v97;
  unint64_t v101 = sub_2379294C4(v98);
  sub_2379296EC(v101);
  swift_bridgeObjectRelease();
  sub_2379265BC((uint64_t *)&unk_2689377F0);
  uint64_t v102 = (void *)sub_23796EA08();
  swift_bridgeObjectRelease();
  objc_msgSend(v96, sel_setMetadata_, v102);

  id v103 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD0E0]), sel_initWithTextProvider_imageProvider_, v37, v96);
  id v104 = sub_23794B3A8();

  return v104;
}

uint64_t sub_237958E00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2379265BC((uint64_t *)&unk_268937840);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_237958E68(uint64_t a1)
{
  uint64_t v2 = sub_2379265BC((uint64_t *)&unk_268937840);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_237958EC8(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

unint64_t sub_237958F50()
{
  return 0xD00000000000001CLL;
}

char *sub_237958FAC(void *a1, uint64_t a2, void *a3)
{
  uint64_t v7 = OBJC_IVAR____TtC20WeatherComplications19ConditionDataSource_rectangularFormatter;
  uint64_t v8 = qword_2689370B8;
  uint64_t v9 = v3;
  if (v8 != -1) {
    swift_once();
  }
  *(_OWORD *)&v3[v7] = xmmword_268939430;
  swift_unknownObjectRetain();

  v14.receiver = v9;
  v14.super_class = (Class)type metadata accessor for ConditionDataSource();
  id v10 = objc_msgSendSuper2(&v14, sel_initWithComplication_family_forDevice_, a1, a2, a3);
  uint64_t v11 = qword_2689370D8;
  int v12 = (char *)v10;
  if (v11 != -1) {
    swift_once();
  }
  *(_OWORD *)&v12[OBJC_IVAR____TtC20WeatherComplications14BaseDataSource_templateFormatter] = xmmword_268939450;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
  return v12;
}

double sub_237959148()
{
  sub_2379265BC(&qword_268937878);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_237971E00;
  *(_OWORD *)(v0 + 32) = xmmword_237971E10;
  *(_OWORD *)(v0 + 48) = xmmword_237971E20;
  *(_OWORD *)(v0 + 64) = xmmword_237971E30;
  *(void *)&double result = 9;
  *(_OWORD *)(v0 + 80) = xmmword_237971E40;
  *(_OWORD *)(v0 + 96) = xmmword_237971E50;
  *(void *)(v0 + 112) = *MEMORY[0x263EFCF20];
  return result;
}

uint64_t sub_2379591C0()
{
  return sub_23796E9D8();
}

uint64_t sub_2379591F8()
{
  objc_msgSend(v0, sel_family);
  return swift_unknownObjectRetain();
}

uint64_t sub_23795931C()
{
  return swift_unknownObjectRelease();
}

id sub_23795932C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConditionDataSource();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_237959374()
{
  return type metadata accessor for ConditionDataSource();
}

uint64_t type metadata accessor for ConditionDataSource()
{
  uint64_t result = qword_268937868;
  if (!qword_268937868) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2379593C8()
{
  return swift_updateClassMetadata2();
}

void sub_23795940C(uint64_t a1)
{
  uint64_t v2 = sub_23796E9E8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23796E9D8();
  uint64_t v6 = sub_23796E9C8();
  os_log_type_t v7 = sub_23796EBE8();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_237922000, v6, v7, "Migrating to widget.", v8, 2u);
    MEMORY[0x237E264A0](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v9 = objc_allocWithZone(MEMORY[0x263EFD238]);
  id v10 = (void *)sub_23796EA68();
  uint64_t v11 = (void *)sub_23796EA68();
  int v12 = (void *)sub_23796EA68();
  id v13 = objc_msgSend(v9, sel_initWithExtensionBundleIdentifier_containerBundleIdentifier_kind_intent_, v10, v11, v12, 0);

  (*(void (**)(uint64_t, id))(a1 + 16))(a1, v13);
}

unint64_t sub_237959670()
{
  return 0xD000000000000023;
}

char *sub_2379596CC(void *a1, uint64_t a2, void *a3)
{
  uint64_t v7 = OBJC_IVAR____TtC20WeatherComplications13AQIDataSource_nonNumericalFormatter;
  uint64_t v8 = qword_268937150;
  id v9 = v3;
  if (v8 != -1) {
    swift_once();
  }
  *(_OWORD *)&v3[v7] = xmmword_268939510;
  swift_unknownObjectRetain();

  v14.receiver = v9;
  v14.super_class = (Class)type metadata accessor for AQIDataSource();
  id v10 = objc_msgSendSuper2(&v14, sel_initWithComplication_family_forDevice_, a1, a2, a3);
  uint64_t v11 = qword_268937130;
  int v12 = (char *)v10;
  if (v11 != -1) {
    swift_once();
  }
  *(_OWORD *)&v12[OBJC_IVAR____TtC20WeatherComplications14BaseDataSource_templateFormatter] = xmmword_2689394D0;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
  return v12;
}

uint64_t sub_237959868()
{
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_2379713F0;
  sub_23796E678();
  sub_23792CF90();
  sub_2379265BC(&qword_268937490);
  sub_23792CFE8();
  return sub_23796EC88();
}

uint64_t sub_23795996C()
{
  return sub_23796E9D8();
}

uint64_t sub_2379599A4(uint64_t a1)
{
  return swift_unknownObjectRetain();
}

uint64_t sub_2379599F0(uint64_t a1)
{
  uint64_t v25 = a1;
  uint64_t v2 = sub_23796E718();
  uint64_t v26 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_23796E2A8();
  uint64_t v24 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2379265BC(&qword_268937478);
  MEMORY[0x270FA5388](v8 - 8);
  id v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2379265BC(&qword_268937768);
  MEMORY[0x270FA5388](v11 - 8);
  id v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_23796E648();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  id v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_237935E98(v1 + OBJC_IVAR____TtC20WeatherComplications14BaseDataSource_forecast, (uint64_t)v10);
  uint64_t v18 = sub_23796E508();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 48))(v10, 1, v18))
  {
    sub_23792673C((uint64_t)v10, &qword_268937478);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
LABEL_4:
    sub_23792673C((uint64_t)v13, &qword_268937768);
    goto LABEL_5;
  }
  uint64_t v23 = v2;
  uint64_t v19 = v26;
  sub_23796E4B8();
  sub_23792673C((uint64_t)v10, &qword_268937478);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1) {
    goto LABEL_4;
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v13, v14);
  sub_23796E8F8();
  char v22 = sub_23796E238();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v5);
  if (v22)
  {
    sub_23796E638();
    char v20 = sub_23796E6F8();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v4, v23);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    return v20 & 1;
  }
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
LABEL_5:
  char v20 = 1;
  return v20 & 1;
}

uint64_t sub_237959EBC()
{
  return swift_unknownObjectRelease();
}

id sub_237959ECC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AQIDataSource();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_237959F14()
{
  return type metadata accessor for AQIDataSource();
}

uint64_t type metadata accessor for AQIDataSource()
{
  uint64_t result = qword_268937888;
  if (!qword_268937888) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_237959F68()
{
  return swift_updateClassMetadata2();
}

void sub_237959FAC(uint64_t a1)
{
  uint64_t v2 = sub_23796E9E8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23796E9D8();
  uint64_t v6 = sub_23796E9C8();
  os_log_type_t v7 = sub_23796EBE8();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_237922000, v6, v7, "Migrating to widget.", v8, 2u);
    MEMORY[0x237E264A0](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v9 = objc_allocWithZone(MEMORY[0x263EFD238]);
  id v10 = (void *)sub_23796EA68();
  uint64_t v11 = (void *)sub_23796EA68();
  uint64_t v12 = (void *)sub_23796EA68();
  id v13 = objc_msgSend(v9, sel_initWithExtensionBundleIdentifier_containerBundleIdentifier_kind_intent_, v10, v11, v12, 0);

  (*(void (**)(uint64_t, id))(a1 + 16))(a1, v13);
}

id sub_23795A1CC()
{
  uint64_t v2 = type metadata accessor for AQINonNumericalTemplateModel();
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(v0 + *(int *)(v3 + 32));
  BOOL v7 = __OFSUB__(v6, 1);
  uint64_t v8 = v6 - 1;
  if (v7)
  {
    __break(1u);
  }
  else
  {
    uint64_t v1 = v8 & ~(v8 >> 63);
    sub_23795AF5C(v0, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for AQINonNumericalTemplateModel);
    unint64_t v9 = *(void *)&v5[*(int *)(v2 + 36)];
    if (!(v9 >> 62))
    {
      uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_23796ED48();
  swift_bridgeObjectRelease();
LABEL_4:
  id result = (id)sub_23795AFC4((uint64_t)v5);
  if (v1 >= v10)
  {
    id v14 = objc_msgSend(self, sel_whiteColor);
    return v14;
  }
  else
  {
    uint64_t v12 = *(void *)(v0 + *(int *)(v2 + 36));
    if ((v12 & 0xC000000000000001) != 0)
    {
      return (id)MEMORY[0x237E25DC0](v1);
    }
    else if ((unint64_t)v1 >= *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
    }
    else
    {
      id v13 = *(void **)(v12 + 8 * v1 + 32);
      return v13;
    }
  }
  return result;
}

unint64_t sub_23795A374()
{
  return 0xD000000000000015;
}

uint64_t sub_23795A470@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v76 = a2;
  uint64_t v3 = sub_23796E8C8();
  MEMORY[0x270FA5388](v3 - 8);
  id v72 = (char *)&v62 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_23796E2A8();
  uint64_t v70 = *(void *)(v5 - 8);
  uint64_t v71 = v5;
  MEMORY[0x270FA5388](v5);
  id v69 = (char *)&v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_23796E718();
  uint64_t v77 = *(void *)(v7 - 8);
  unint64_t v78 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v68 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_23796E768();
  uint64_t v74 = *(void *)(v9 - 8);
  uint64_t v75 = v9;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  id v73 = (char *)&v62 - v13;
  uint64_t v14 = sub_2379265BC(&qword_268937478);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_2379265BC(&qword_268937768);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)&v62 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_23796E648();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v62 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = type metadata accessor for TemplateData();
  uint64_t v25 = a1;
  sub_237935E98(a1 + *(int *)(v24 + 20), (uint64_t)v16);
  uint64_t v26 = sub_23796E508();
  uint64_t v27 = *(void *)(v26 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v16, 1, v26) == 1)
  {
    sub_23792673C((uint64_t)v16, &qword_268937478);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56))(v19, 1, 1, v20);
LABEL_4:
    sub_23792673C((uint64_t)v19, &qword_268937768);
    return sub_23795AB60(v76);
  }
  uint64_t v65 = v24;
  uint64_t v66 = v25;
  id v67 = v23;
  sub_23796E4B8();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v16, v26);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20) == 1) {
    goto LABEL_4;
  }
  uint64_t v63 = v21;
  uint64_t v64 = v20;
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v67, v19, v20);
  uint64_t v29 = v73;
  sub_23796E618();
  uint64_t v30 = v68;
  sub_23796E638();
  uint64_t v31 = sub_23796E6E8();
  (*(void (**)(char *, unint64_t))(v77 + 8))(v30, v78);
  uint64_t v32 = *(void *)(v31 + 16);
  uint64_t v33 = v76;
  if (v32)
  {
    unint64_t v79 = MEMORY[0x263F8EE78];
    sub_23796ED08();
    unint64_t v34 = sub_2379290F8();
    uint64_t v35 = v75;
    uint64_t v77 = *(void *)(v74 + 16);
    unint64_t v78 = v34;
    uint64_t v36 = *(unsigned __int8 *)(v74 + 80);
    uint64_t v68 = (char *)v31;
    uint64_t v37 = v31 + ((v36 + 32) & ~v36);
    uint64_t v38 = *(void *)(v74 + 72);
    id v39 = (void (**)(char *, uint64_t))(v74 + 8);
    do
    {
      ((void (*)(char *, uint64_t, uint64_t))v77)(v12, v37, v35);
      sub_23796E738();
      sub_23796EC08();
      (*v39)(v12, v35);
      sub_23796ECE8();
      sub_23796ED18();
      sub_23796ED28();
      sub_23796ECF8();
      v37 += v38;
      --v32;
    }
    while (v32);
    unint64_t v78 = v79;
    swift_bridgeObjectRelease();
    uint64_t v33 = v76;
    uint64_t v40 = (uint64_t)v72;
    uint64_t v29 = v73;
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v78 = MEMORY[0x263F8EE78];
    uint64_t v40 = (uint64_t)v72;
  }
  id v42 = v69;
  uint64_t v41 = v70;
  uint64_t v43 = v66;
  uint64_t v44 = v71;
  (*(void (**)(char *, uint64_t, uint64_t))(v70 + 16))(v69, v66, v71);
  sub_23795AF5C(v43 + *(int *)(v65 + 24), v40, MEMORY[0x263F580A0]);
  uint64_t v45 = sub_23796E748();
  if (v46) {
    uint64_t v47 = v45;
  }
  else {
    uint64_t v47 = 0;
  }
  unint64_t v48 = 0xE000000000000000;
  if (v46) {
    unint64_t v48 = v46;
  }
  uint64_t v76 = v48;
  uint64_t v77 = v47;
  uint64_t v49 = sub_23796E728();
  id v72 = v50;
  id v73 = (char *)v49;
  uint64_t v51 = sub_23796E758();
  uint64_t v52 = v67;
  uint64_t v53 = sub_23796E608();
  uint64_t v55 = v54;
  (*(void (**)(char *, uint64_t))(v74 + 8))(v29, v75);
  (*(void (**)(char *, uint64_t))(v63 + 8))(v52, v64);
  (*(void (**)(uint64_t, char *, uint64_t))(v41 + 32))(v33, v42, v44);
  uint64_t v56 = (int *)type metadata accessor for AQINonNumericalTemplateModel();
  uint64_t result = sub_23793C910(v40, v33 + v56[5]);
  uint64_t v57 = (uint64_t *)(v33 + v56[6]);
  uint64_t v58 = v76;
  *uint64_t v57 = v77;
  v57[1] = v58;
  uint64_t v59 = (void *)(v33 + v56[7]);
  uint64_t v60 = v72;
  void *v59 = v73;
  v59[1] = v60;
  *(void *)(v33 + v56[8]) = v51;
  *(void *)(v33 + v56[9]) = v78;
  uint64_t v61 = (uint64_t *)(v33 + v56[10]);
  *uint64_t v61 = v53;
  v61[1] = v55;
  *(unsigned char *)(v33 + v56[11]) = 0;
  return result;
}

uint64_t sub_23795AB60@<X0>(uint64_t a1@<X8>)
{
  uint64_t v20 = sub_23796E2D8();
  uint64_t v2 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_23796E358();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v19 = sub_23796E2A8();
  uint64_t v6 = *(void *)(v19 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v19);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23792D380(v7);
  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v10 = (id)qword_268937660;
  uint64_t v11 = (void *)sub_23796EA68();
  uint64_t v12 = (void *)sub_23796EA68();
  id v13 = objc_msgSend(v10, sel_localizedStringForKey_value_table_, v11, 0, v12);

  sub_23796EA98();
  sub_23796E348();
  sub_23796E2C8();
  sub_23796E2B8();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v20);
  uint64_t v14 = (int *)type metadata accessor for AQINonNumericalTemplateModel();
  sub_23796E8A8();
  uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(a1, v9, v19);
  uint64_t v16 = (void *)(a1 + v14[6]);
  void *v16 = 0;
  v16[1] = 0xE000000000000000;
  uint64_t v17 = (void *)(a1 + v14[7]);
  *uint64_t v17 = 0;
  v17[1] = 0xE000000000000000;
  *(void *)(a1 + v14[8]) = 0;
  *(void *)(a1 + v14[9]) = MEMORY[0x263F8EE78];
  uint64_t v18 = (void *)(a1 + v14[10]);
  *uint64_t v18 = 0;
  v18[1] = 0xE000000000000000;
  *(unsigned char *)(a1 + v14[11]) = 0;
  return result;
}

unint64_t sub_23795AE90(uint64_t a1)
{
  unint64_t result = sub_23795AEB8();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23795AEB8()
{
  unint64_t result = qword_268937898;
  if (!qword_268937898)
  {
    type metadata accessor for AQINonNumericalTemplateModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268937898);
  }
  return result;
}

uint64_t type metadata accessor for AQINonNumericalTemplateModel()
{
  uint64_t result = qword_2689378A0;
  if (!qword_2689378A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_23795AF5C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23795AFC4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AQINonNumericalTemplateModel();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_23795B020(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v30 = *a2;
    *a1 = *a2;
    a1 = (void *)(v30 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_23796E2A8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (void *)((char *)a1 + v8);
    id v10 = (char *)a2 + v8;
    uint64_t v11 = *(void *)((char *)a2 + v8 + 8);
    *uint64_t v9 = *(void *)((char *)a2 + v8);
    v9[1] = v11;
    uint64_t v12 = *(void *)((char *)a2 + v8 + 24);
    v9[2] = *(void *)((char *)a2 + v8 + 16);
    v9[3] = v12;
    id v13 = (int *)sub_23796E8C8();
    uint64_t v14 = v13[6];
    uint64_t v33 = &v10[v14];
    unint64_t v34 = (char *)v9 + v14;
    uint64_t v15 = sub_23796E358();
    uint64_t v32 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v32(v34, v33, v15);
    *((unsigned char *)v9 + v13[7]) = v10[v13[7]];
    *(_OWORD *)((char *)v9 + v13[8]) = *(_OWORD *)&v10[v13[8]];
    uint64_t v16 = a3[6];
    uint64_t v17 = a3[7];
    uint64_t v18 = (void *)((char *)a1 + v16);
    uint64_t v19 = (void *)((char *)a2 + v16);
    uint64_t v20 = v19[1];
    *uint64_t v18 = *v19;
    v18[1] = v20;
    uint64_t v21 = (void *)((char *)a1 + v17);
    uint64_t v22 = (void *)((char *)a2 + v17);
    uint64_t v23 = v22[1];
    *uint64_t v21 = *v22;
    v21[1] = v23;
    uint64_t v24 = a3[9];
    *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
    *(void *)((char *)a1 + v24) = *(void *)((char *)a2 + v24);
    uint64_t v25 = a3[10];
    uint64_t v26 = a3[11];
    uint64_t v27 = (void *)((char *)a1 + v25);
    uint64_t v28 = (void *)((char *)a2 + v25);
    uint64_t v29 = v28[1];
    *uint64_t v27 = *v28;
    v27[1] = v29;
    *((unsigned char *)a1 + v26) = *((unsigned char *)a2 + v26);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_23795B214(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = v5 + *(int *)(sub_23796E8C8() + 24);
  uint64_t v7 = sub_23796E358();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_23795B320(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a2 + v7 + 8);
  *uint64_t v8 = *(void *)(a2 + v7);
  v8[1] = v10;
  uint64_t v11 = *(void *)(a2 + v7 + 24);
  void v8[2] = *(void *)(a2 + v7 + 16);
  v8[3] = v11;
  uint64_t v12 = (int *)sub_23796E8C8();
  uint64_t v13 = v12[6];
  uint64_t v31 = v9 + v13;
  uint64_t v32 = (char *)v8 + v13;
  uint64_t v14 = sub_23796E358();
  uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v30(v32, v31, v14);
  *((unsigned char *)v8 + v12[7]) = *(unsigned char *)(v9 + v12[7]);
  *(_OWORD *)((char *)v8 + v12[8]) = *(_OWORD *)(v9 + v12[8]);
  uint64_t v15 = a3[6];
  uint64_t v16 = a3[7];
  uint64_t v17 = (void *)(a1 + v15);
  uint64_t v18 = (void *)(a2 + v15);
  uint64_t v19 = v18[1];
  *uint64_t v17 = *v18;
  v17[1] = v19;
  uint64_t v20 = (void *)(a1 + v16);
  uint64_t v21 = (void *)(a2 + v16);
  uint64_t v22 = v21[1];
  *uint64_t v20 = *v21;
  v20[1] = v22;
  uint64_t v23 = a3[9];
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(void *)(a1 + v23) = *(void *)(a2 + v23);
  uint64_t v24 = a3[10];
  uint64_t v25 = a3[11];
  uint64_t v26 = (void *)(a1 + v24);
  uint64_t v27 = (void *)(a2 + v24);
  uint64_t v28 = v27[1];
  *uint64_t v26 = *v27;
  v26[1] = v28;
  *(unsigned char *)(a1 + v25) = *(unsigned char *)(a2 + v25);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23795B4C4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  *uint64_t v8 = *(void *)(a2 + v7);
  v8[1] = *(void *)(a2 + v7 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  void v8[2] = *(void *)(v9 + 16);
  v8[3] = *(void *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = (int *)sub_23796E8C8();
  uint64_t v11 = v10[6];
  uint64_t v12 = (char *)v8 + v11;
  uint64_t v13 = v9 + v11;
  uint64_t v14 = sub_23796E358();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  *((unsigned char *)v8 + v10[7]) = *(unsigned char *)(v9 + v10[7]);
  uint64_t v15 = v10[8];
  uint64_t v16 = (void *)((char *)v8 + v15);
  uint64_t v17 = (void *)(v9 + v15);
  void *v16 = *v17;
  v16[1] = v17[1];
  uint64_t v18 = a3[6];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (void *)(a2 + v18);
  *uint64_t v19 = *v20;
  v19[1] = v20[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v21 = a3[7];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (void *)(a2 + v21);
  *uint64_t v22 = *v23;
  v22[1] = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v24 = a3[10];
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (void *)(a2 + v24);
  void *v25 = *v26;
  v25[1] = v26[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  return a1;
}

uint64_t sub_23795B6C4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (_OWORD *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  long long v10 = *(_OWORD *)(a2 + v7 + 16);
  *uint64_t v8 = *(_OWORD *)(a2 + v7);
  v8[1] = v10;
  uint64_t v11 = (int *)sub_23796E8C8();
  uint64_t v12 = v11[6];
  uint64_t v13 = (char *)v8 + v12;
  uint64_t v14 = v9 + v12;
  uint64_t v15 = sub_23796E358();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  *((unsigned char *)v8 + v11[7]) = *(unsigned char *)(v9 + v11[7]);
  *(_OWORD *)((char *)v8 + v11[8]) = *(_OWORD *)(v9 + v11[8]);
  uint64_t v16 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  *(_OWORD *)(a1 + v16) = *(_OWORD *)(a2 + v16);
  uint64_t v17 = a3[9];
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(void *)(a1 + v17) = *(void *)(a2 + v17);
  uint64_t v18 = a3[11];
  *(_OWORD *)(a1 + a3[10]) = *(_OWORD *)(a2 + a3[10]);
  *(unsigned char *)(a1 + v18) = *(unsigned char *)(a2 + v18);
  return a1;
}

uint64_t sub_23795B800(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a2 + v7 + 8);
  *uint64_t v8 = *(void *)(a2 + v7);
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(v9 + 24);
  void v8[2] = *(void *)(v9 + 16);
  v8[3] = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = (int *)sub_23796E8C8();
  uint64_t v13 = v12[6];
  uint64_t v14 = (char *)v8 + v13;
  uint64_t v15 = v9 + v13;
  uint64_t v16 = sub_23796E358();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 40))(v14, v15, v16);
  *((unsigned char *)v8 + v12[7]) = *(unsigned char *)(v9 + v12[7]);
  *(_OWORD *)((char *)v8 + v12[8]) = *(_OWORD *)(v9 + v12[8]);
  uint64_t v17 = a3[6];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (uint64_t *)(a2 + v17);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  *uint64_t v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[7];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (uint64_t *)(a2 + v22);
  uint64_t v26 = *v24;
  uint64_t v25 = v24[1];
  *uint64_t v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease();
  uint64_t v27 = a3[9];
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(void *)(a1 + v27) = *(void *)(a2 + v27);
  swift_bridgeObjectRelease();
  uint64_t v28 = a3[10];
  uint64_t v29 = (void *)(a1 + v28);
  uint64_t v30 = (uint64_t *)(a2 + v28);
  uint64_t v32 = *v30;
  uint64_t v31 = v30[1];
  void *v29 = v32;
  v29[1] = v31;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  return a1;
}

uint64_t sub_23795B994(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23795B9A8);
}

uint64_t sub_23795B9A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23796E2A8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_23796E8C8();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t sub_23795BAC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23795BAD4);
}

uint64_t sub_23795BAD4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_23796E2A8();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_23796E8C8();
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t sub_23795BBE8()
{
  uint64_t result = sub_23796E2A8();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_23796E8C8();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unint64_t sub_23795BCE4()
{
  sub_23796ECA8();
  swift_bridgeObjectRelease();
  if ((*(unsigned char *)(v0 + *(int *)(type metadata accessor for AQINumericalTemplateModel() + 24) + 8) & 1) == 0)
  {
    sub_23792E5BC();
    sub_23796EC68();
  }
  sub_23796EAD8();
  swift_bridgeObjectRelease();
  sub_23796EAD8();
  swift_bridgeObjectRetain();
  sub_23796EAD8();
  swift_bridgeObjectRelease();
  return 0xD000000000000011;
}

id sub_23795BE24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_23796E768();
  uint64_t v64 = *(void *)(v4 - 8);
  uint64_t v65 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v63 = (char *)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_23796E8C8();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v66 = (uint64_t)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_23796E2A8();
  uint64_t v67 = *(void *)(v8 - 8);
  uint64_t v68 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v62 = (char *)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2379265BC(&qword_268937478);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_2379265BC(&qword_268937768);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_23796E648();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v59 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for TemplateData();
  uint64_t v21 = a1;
  sub_237935E98(a1 + *(int *)(v20 + 20), (uint64_t)v12);
  uint64_t v22 = sub_23796E508();
  uint64_t v23 = *(void *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v12, 1, v22) == 1)
  {
    sub_23792673C((uint64_t)v12, &qword_268937478);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, 1, 1, v16);
  }
  else
  {
    sub_23796E4B8();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v12, v22);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v19, v15, v16);
      uint64_t v37 = v67;
      uint64_t v36 = v68;
      uint64_t v38 = v62;
      (*(void (**)(char *, uint64_t, uint64_t))(v67 + 16))(v62, v21, v68);
      uint64_t v39 = v21 + *(int *)(v20 + 24);
      uint64_t v40 = v66;
      sub_23793345C(v39, v66);
      uint64_t v61 = sub_23796E628();
      uint64_t v41 = v63;
      sub_23796E618();
      uint64_t v42 = sub_23796E728();
      uint64_t v59 = v43;
      uint64_t v60 = v42;
      (*(void (**)(char *, uint64_t))(v64 + 8))(v41, v65);
      float v44 = sub_237961C24((uint64_t)v19);
      uint64_t v64 = v46;
      uint64_t v65 = v45;
      float v47 = v44;
      uint64_t v63 = v48;
      uint64_t v49 = sub_23796E608();
      uint64_t v51 = v50;
      (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
      (*(void (**)(uint64_t, char *, uint64_t))(v37 + 32))(a2, v38, v36);
      uint64_t v52 = (int *)type metadata accessor for AQINumericalTemplateModel();
      id result = (id)sub_23793C910(v40, a2 + v52[5]);
      uint64_t v53 = a2 + v52[6];
      *(void *)uint64_t v53 = v61;
      *(unsigned char *)(v53 + 8) = 0;
      uint64_t v54 = (uint64_t *)(a2 + v52[7]);
      uint64_t v55 = v59;
      uint64_t *v54 = v60;
      v54[1] = v55;
      uint64_t v56 = a2 + v52[8];
      uint64_t v57 = v64;
      *(void *)uint64_t v56 = v65;
      *(void *)(v56 + 8) = v57;
      *(float *)(v56 + 16) = v47;
      *(void *)(v56 + 24) = v63;
      uint64_t v58 = (uint64_t *)(a2 + v52[9]);
      *uint64_t v58 = v49;
      v58[1] = v51;
      return result;
    }
  }
  sub_23792673C((uint64_t)v15, &qword_268937768);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v67 + 16))(a2, v21, v68);
  uint64_t v24 = v21 + *(int *)(v20 + 24);
  uint64_t v25 = (int *)type metadata accessor for AQINumericalTemplateModel();
  sub_23793345C(v24, a2 + v25[5]);
  if (qword_268937138 != -1) {
    swift_once();
  }
  uint64_t v26 = qword_2689394E0;
  uint64_t v27 = *(void *)algn_2689394E8;
  int v28 = dword_2689394F0;
  uint64_t v29 = qword_2689394F8;
  uint64_t v68 = qword_2689394F8;
  uint64_t v30 = a2 + v25[6];
  *(void *)uint64_t v30 = 0;
  *(unsigned char *)(v30 + 8) = 1;
  uint64_t v31 = (void *)(a2 + v25[7]);
  *uint64_t v31 = 0;
  v31[1] = 0;
  uint64_t v32 = a2 + v25[8];
  *(void *)uint64_t v32 = v26;
  *(void *)(v32 + 8) = v27;
  *(_DWORD *)(v32 + 16) = v28;
  *(void *)(v32 + 24) = v29;
  uint64_t v33 = (void *)(a2 + v25[9]);
  void *v33 = 0;
  v33[1] = 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v34 = (void *)v68;

  return v34;
}

double sub_23795C430@<D0>(uint64_t a1@<X8>)
{
  uint64_t v41 = sub_23796E2D8();
  uint64_t v40 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  uint64_t v3 = (char *)&v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_23796E358();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v38 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_23796E2A8();
  uint64_t v37 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  uint64_t v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2379265BC(&qword_2689378B8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_237971F60;
  *(void *)(inited + 32) = 0x31374544343023;
  *(void *)(inited + 40) = 0xE700000000000000;
  *(void *)(inited + 48) = 0;
  *(void *)(inited + 56) = 0x31374544343023;
  *(void *)(inited + 64) = 0xE700000000000000;
  *(void *)(inited + 72) = 0x4039000000000000;
  *(void *)(inited + 80) = 0x30323645464623;
  *(void *)(inited + 88) = 0xE700000000000000;
  *(void *)(inited + 96) = 0x4052C00000000000;
  *(void *)(inited + 104) = 0x30303539464623;
  *(void *)(inited + 112) = 0xE700000000000000;
  *(void *)(inited + 120) = 0x405F400000000000;
  *(void *)(inited + 128) = 0x46343131414623;
  *(void *)(inited + 136) = 0xE700000000000000;
  *(void *)(inited + 144) = 0x4065E00000000000;
  *(void *)(inited + 152) = 0x46463030414123;
  *(void *)(inited + 160) = 0xE700000000000000;
  *(void *)(inited + 168) = 0x406F400000000000;
  *(void *)(inited + 176) = 0x42323731303823;
  *(void *)(inited + 184) = 0xE700000000000000;
  *(void *)(inited + 192) = 0x4075E00000000000;
  *(void *)(inited + 200) = 0x42323731303823;
  *(void *)(inited + 208) = 0xE700000000000000;
  *(void *)(inited + 216) = 0x407F400000000000;
  sub_2379290F8();
  uint64_t v9 = 0;
  uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  do
  {
    swift_bridgeObjectRetain();
    sub_23796EC08();
    uint64_t v11 = sub_23796E878();
    uint64_t v13 = v12;
    uint64_t v14 = v11;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v10 = sub_237933A54(0, v10[2] + 1, 1, v10);
    }
    unint64_t v16 = v10[2];
    unint64_t v15 = v10[3];
    if (v16 >= v15 >> 1) {
      uint64_t v10 = sub_237933A54((void *)(v15 > 1), v16 + 1, 1, v10);
    }
    v10[2] = v16 + 1;
    uint64_t v17 = &v10[2 * v16];
    v17[4] = v13;
    v17[5] = v14;
    v9 += 24;
  }
  while (v9 != 192);
  swift_bridgeObjectRelease();
  v18.n128_u64[0] = 0x4045000000000000;
  float v19 = sub_237961A54((uint64_t)v10, v18);
  uint64_t v36 = v20;
  uint64_t v22 = v21;
  float v23 = v19;
  uint64_t v25 = v24;
  uint64_t v26 = swift_bridgeObjectRelease();
  sub_23792D380(v26);
  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v27 = (id)qword_268937660;
  int v28 = (void *)sub_23796EA68();
  uint64_t v29 = (void *)sub_23796EA68();
  id v30 = objc_msgSend(v27, sel_localizedStringForKey_value_table_, v28, 0, v29);

  sub_23796EA98();
  sub_23796E348();
  sub_23796E2C8();
  sub_23796E2B8();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v3, v41);
  uint64_t v31 = (int *)type metadata accessor for AQINumericalTemplateModel();
  sub_23796E8A8();
  (*(void (**)(uint64_t, char *, uint64_t))(v37 + 32))(a1, v7, v39);
  uint64_t v32 = a1 + v31[6];
  *(void *)uint64_t v32 = 42;
  *(unsigned char *)(v32 + 8) = 0;
  *(_OWORD *)(a1 + v31[7]) = xmmword_237971F70;
  uint64_t v33 = a1 + v31[8];
  *(void *)uint64_t v33 = v36;
  *(void *)(v33 + 8) = v22;
  *(float *)(v33 + 16) = v23;
  *(void *)(v33 + 24) = v25;
  double result = 2533054.62;
  *(_OWORD *)(a1 + v31[9]) = xmmword_237971F80;
  return result;
}

unint64_t sub_23795C990(uint64_t a1)
{
  unint64_t result = sub_23795C9B8();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23795C9B8()
{
  unint64_t result = qword_2689378B0;
  if (!qword_2689378B0)
  {
    type metadata accessor for AQINumericalTemplateModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689378B0);
  }
  return result;
}

uint64_t type metadata accessor for AQINumericalTemplateModel()
{
  uint64_t result = qword_2689378C0;
  if (!qword_2689378C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t *sub_23795CA5C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v33 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v33 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_23796E2A8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = *(uint64_t *)((char *)a2 + v8 + 8);
    *uint64_t v9 = *(uint64_t *)((char *)a2 + v8);
    v9[1] = v11;
    uint64_t v12 = *(uint64_t *)((char *)a2 + v8 + 24);
    v9[2] = *(uint64_t *)((char *)a2 + v8 + 16);
    v9[3] = v12;
    uint64_t v13 = (int *)sub_23796E8C8();
    uint64_t v14 = v13[6];
    uint64_t v36 = &v10[v14];
    uint64_t v37 = (char *)v9 + v14;
    uint64_t v15 = sub_23796E358();
    uint64_t v35 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v35(v37, v36, v15);
    *((unsigned char *)v9 + v13[7]) = v10[v13[7]];
    *(_OWORD *)((char *)v9 + v13[8]) = *(_OWORD *)&v10[v13[8]];
    uint64_t v16 = a3[6];
    uint64_t v17 = a3[7];
    __n128 v18 = (char *)a1 + v16;
    float v19 = (char *)a2 + v16;
    *(void *)__n128 v18 = *(void *)v19;
    v18[8] = v19[8];
    uint64_t v20 = (uint64_t *)((char *)a1 + v17);
    uint64_t v21 = (uint64_t *)((char *)a2 + v17);
    uint64_t v22 = v21[1];
    *uint64_t v20 = *v21;
    v20[1] = v22;
    uint64_t v23 = a3[8];
    uint64_t v24 = a3[9];
    uint64_t v25 = (char *)a1 + v23;
    uint64_t v26 = (char *)a2 + v23;
    uint64_t v27 = *((void *)v26 + 1);
    *(void *)uint64_t v25 = *(void *)v26;
    *((void *)v25 + 1) = v27;
    *((_DWORD *)v25 + 4) = *((_DWORD *)v26 + 4);
    int v28 = (void *)*((void *)v26 + 3);
    *((void *)v25 + 3) = v28;
    uint64_t v29 = (uint64_t *)((char *)a1 + v24);
    id v30 = (uint64_t *)((char *)a2 + v24);
    uint64_t v31 = v30[1];
    void *v29 = *v30;
    v29[1] = v31;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v32 = v28;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_23795CC60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = v5 + *(int *)(sub_23796E8C8() + 24);
  uint64_t v7 = sub_23796E358();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  uint64_t v8 = a1 + *(int *)(a2 + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_23795CD70(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a2 + v7 + 8);
  *uint64_t v8 = *(void *)(a2 + v7);
  v8[1] = v10;
  uint64_t v11 = *(void *)(a2 + v7 + 24);
  void v8[2] = *(void *)(a2 + v7 + 16);
  v8[3] = v11;
  uint64_t v12 = (int *)sub_23796E8C8();
  uint64_t v13 = v12[6];
  uint64_t v34 = v9 + v13;
  uint64_t v35 = (char *)v8 + v13;
  uint64_t v14 = sub_23796E358();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v15(v35, v34, v14);
  *((unsigned char *)v8 + v12[7]) = *(unsigned char *)(v9 + v12[7]);
  *(_OWORD *)((char *)v8 + v12[8]) = *(_OWORD *)(v9 + v12[8]);
  uint64_t v16 = a3[6];
  uint64_t v17 = a3[7];
  uint64_t v18 = a1 + v16;
  uint64_t v19 = a2 + v16;
  *(void *)uint64_t v18 = *(void *)v19;
  *(unsigned char *)(v18 + 8) = *(unsigned char *)(v19 + 8);
  uint64_t v20 = (void *)(a1 + v17);
  uint64_t v21 = (void *)(a2 + v17);
  uint64_t v22 = v21[1];
  *uint64_t v20 = *v21;
  v20[1] = v22;
  uint64_t v23 = a3[8];
  uint64_t v24 = a3[9];
  uint64_t v25 = a1 + v23;
  uint64_t v26 = a2 + v23;
  uint64_t v27 = *(void *)(v26 + 8);
  *(void *)uint64_t v25 = *(void *)v26;
  *(void *)(v25 + 8) = v27;
  *(_DWORD *)(v25 + 16) = *(_DWORD *)(v26 + 16);
  int v28 = *(void **)(v26 + 24);
  *(void *)(v25 + 24) = v28;
  uint64_t v29 = (void *)(a1 + v24);
  id v30 = (void *)(a2 + v24);
  uint64_t v31 = v30[1];
  void *v29 = *v30;
  v29[1] = v31;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v32 = v28;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23795CF24(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  *uint64_t v8 = *(void *)(a2 + v7);
  v8[1] = *(void *)(a2 + v7 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  void v8[2] = *(void *)(v9 + 16);
  v8[3] = *(void *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = (int *)sub_23796E8C8();
  uint64_t v11 = v10[6];
  uint64_t v12 = (char *)v8 + v11;
  uint64_t v13 = v9 + v11;
  uint64_t v14 = sub_23796E358();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  *((unsigned char *)v8 + v10[7]) = *(unsigned char *)(v9 + v10[7]);
  uint64_t v15 = v10[8];
  uint64_t v16 = (void *)((char *)v8 + v15);
  uint64_t v17 = (void *)(v9 + v15);
  void *v16 = *v17;
  v16[1] = v17[1];
  uint64_t v18 = a3[6];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  char v21 = *(unsigned char *)(v20 + 8);
  *(void *)uint64_t v19 = *(void *)v20;
  *(unsigned char *)(v19 + 8) = v21;
  uint64_t v22 = a3[7];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (void *)(a2 + v22);
  *uint64_t v23 = *v24;
  v23[1] = v24[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v25 = a3[8];
  uint64_t v26 = a1 + v25;
  uint64_t v27 = a2 + v25;
  *(void *)(a1 + v25) = *(void *)(a2 + v25);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v26 + 8) = *(void *)(v27 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(v26 + 16) = *(_DWORD *)(v27 + 16);
  int v28 = *(void **)(v27 + 24);
  uint64_t v29 = *(void **)(v26 + 24);
  *(void *)(v26 + 24) = v28;
  id v30 = v28;

  uint64_t v31 = a3[9];
  id v32 = (void *)(a1 + v31);
  uint64_t v33 = (void *)(a2 + v31);
  void *v32 = *v33;
  v32[1] = v33[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23795D138(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (_OWORD *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  long long v10 = *(_OWORD *)(a2 + v7 + 16);
  *uint64_t v8 = *(_OWORD *)(a2 + v7);
  v8[1] = v10;
  uint64_t v11 = (int *)sub_23796E8C8();
  uint64_t v12 = v11[6];
  uint64_t v13 = (char *)v8 + v12;
  uint64_t v14 = v9 + v12;
  uint64_t v15 = sub_23796E358();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  *((unsigned char *)v8 + v11[7]) = *(unsigned char *)(v9 + v11[7]);
  *(_OWORD *)((char *)v8 + v11[8]) = *(_OWORD *)(v9 + v11[8]);
  uint64_t v16 = a3[6];
  uint64_t v17 = a3[7];
  uint64_t v18 = a1 + v16;
  uint64_t v19 = a2 + v16;
  *(void *)uint64_t v18 = *(void *)v19;
  *(unsigned char *)(v18 + 8) = *(unsigned char *)(v19 + 8);
  *(_OWORD *)(a1 + v17) = *(_OWORD *)(a2 + v17);
  uint64_t v20 = a3[8];
  uint64_t v21 = a3[9];
  uint64_t v22 = (_OWORD *)(a1 + v20);
  uint64_t v23 = (_OWORD *)(a2 + v20);
  long long v24 = v23[1];
  *uint64_t v22 = *v23;
  v22[1] = v24;
  *(_OWORD *)(a1 + v21) = *(_OWORD *)(a2 + v21);
  return a1;
}

uint64_t sub_23795D278(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23796E2A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a2 + v7 + 8);
  *uint64_t v8 = *(void *)(a2 + v7);
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(v9 + 24);
  void v8[2] = *(void *)(v9 + 16);
  v8[3] = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = (int *)sub_23796E8C8();
  uint64_t v13 = v12[6];
  uint64_t v14 = (char *)v8 + v13;
  uint64_t v15 = v9 + v13;
  uint64_t v16 = sub_23796E358();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 40))(v14, v15, v16);
  *((unsigned char *)v8 + v12[7]) = *(unsigned char *)(v9 + v12[7]);
  *(_OWORD *)((char *)v8 + v12[8]) = *(_OWORD *)(v9 + v12[8]);
  uint64_t v17 = a3[6];
  uint64_t v18 = a3[7];
  uint64_t v19 = a1 + v17;
  uint64_t v20 = a2 + v17;
  *(void *)uint64_t v19 = *(void *)v20;
  *(unsigned char *)(v19 + 8) = *(unsigned char *)(v20 + 8);
  uint64_t v21 = (void *)(a1 + v18);
  uint64_t v22 = (uint64_t *)(a2 + v18);
  uint64_t v24 = *v22;
  uint64_t v23 = v22[1];
  *uint64_t v21 = v24;
  v21[1] = v23;
  swift_bridgeObjectRelease();
  uint64_t v25 = a3[8];
  uint64_t v26 = a1 + v25;
  uint64_t v27 = a2 + v25;
  *(void *)(a1 + v25) = *(void *)(a2 + v25);
  swift_bridgeObjectRelease();
  *(void *)(v26 + 8) = *(void *)(v27 + 8);
  swift_bridgeObjectRelease();
  *(_DWORD *)(v26 + 16) = *(_DWORD *)(v27 + 16);
  int v28 = *(void **)(v26 + 24);
  *(void *)(v26 + 24) = *(void *)(v27 + 24);

  uint64_t v29 = a3[9];
  id v30 = (void *)(a1 + v29);
  uint64_t v31 = (uint64_t *)(a2 + v29);
  uint64_t v33 = *v31;
  uint64_t v32 = v31[1];
  *id v30 = v33;
  v30[1] = v32;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23795D424(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23795D438);
}

uint64_t sub_23795D438(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23796E2A8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_23796E8C8();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 32));
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t sub_23795D54C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23795D560);
}

uint64_t sub_23795D560(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_23796E2A8();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_23796E8C8();
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 32)) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t sub_23795D670()
{
  uint64_t result = sub_23796E2A8();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_23796E8C8();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_23795D758()
{
  type metadata accessor for AQINumericalTemplateFormatter();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_23795E91C(&qword_2689378D8, v1, (void (*)(uint64_t))type metadata accessor for AQINumericalTemplateFormatter);
  *(void *)&xmmword_2689394D0 = v0;
  *((void *)&xmmword_2689394D0 + 1) = result;
  return result;
}

uint64_t type metadata accessor for AQINumericalTemplateFormatter()
{
  return self;
}

uint64_t sub_23795D7EC()
{
  return sub_23795E91C(&qword_2689378D0, 255, (void (*)(uint64_t))type metadata accessor for AQINumericalTemplateModel);
}

id sub_23795D838(uint64_t a1)
{
  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v2 = (id)qword_268937660;
  uint64_t v3 = (void *)sub_23796EA68();
  uint64_t v4 = (void *)sub_23796EA68();
  id v5 = objc_msgSend(v2, sel_localizedStringForKey_value_table_, v3, 0, v4);

  sub_23796EA98();
  uint64_t v6 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  uint64_t v7 = self;
  id v8 = objc_msgSend(v7, sel_textProviderWithText_, v6);

  uint64_t v9 = type metadata accessor for AQINumericalTemplateModel();
  if (*(unsigned char *)(a1 + *(int *)(v9 + 24) + 8) == 1)
  {
    uint64_t v10 = self;
    id v11 = v8;
    id v12 = objc_msgSend(v10, sel_systemCyanColor);
    objc_msgSend(v11, sel_setTintColor_, v12);

    sub_23796E988();
  }
  else
  {
    objc_msgSend(v8, sel_setTintColor_, *(void *)(a1 + *(int *)(v9 + 32) + 24));
    sub_23792E5BC();
    sub_23796EC68();
  }
  uint64_t v13 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v7, sel_textProviderWithText_, v13);

  id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD130]), sel_initWithLine1TextProvider_line2TextProvider_, v8, v14);
  return v15;
}

id sub_23795DA98(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AQINumericalTemplateModel();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23795DE24(a1, (uint64_t)v4);
  id v5 = (void *)sub_237955398(&v4[*(int *)(v2 + 20)], v4[*(int *)(v2 + 24) + 8]);
  id v6 = objc_msgSend(self, sel_systemCyanColor);
  objc_msgSend(v5, sel_setTintColor_, v6);

  sub_23795DE88((uint64_t)v4);
  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v7 = (id)qword_268937660;
  id v8 = (void *)sub_23796EA68();
  uint64_t v9 = (void *)sub_23796EA68();
  id v10 = objc_msgSend(v7, sel_localizedStringForKey_value_table_, v8, 0, v9);

  sub_23796EA98();
  sub_2379265BC((uint64_t *)&unk_268937390);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2379713F0;
  uint64_t v12 = a1 + *(int *)(v2 + 24);
  if (*(unsigned char *)(v12 + 8))
  {
    uint64_t v13 = sub_23796E988();
  }
  else
  {
    uint64_t v25 = *(void *)v12;
    sub_23792E5BC();
    uint64_t v13 = sub_23796EC68();
  }
  uint64_t v15 = v13;
  uint64_t v16 = v14;
  sub_237926638(0, (unint64_t *)&qword_2689373A0);
  *(void *)(inited + 56) = MEMORY[0x263F8D310];
  *(void *)(inited + 64) = sub_23792918C();
  *(void *)(inited + 32) = v15;
  *(void *)(inited + 40) = v16;
  uint64_t v17 = sub_23796EDF8();
  swift_setDeallocating();
  sub_2379265BC(&qword_2689373C0);
  swift_arrayDestroy();
  uint64_t ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  uint64_t v19 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v20 = objc_msgSend(ObjCClassFromMetadata, sel_textProviderWithFormat_arguments_, v19, v17);

  swift_bridgeObjectRetain();
  uint64_t v21 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v22 = objc_msgSend(self, sel_textProviderWithText_, v21);

  id v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD0F8]), sel_initWithHeaderTextProvider_body1TextProvider_body2TextProvider_, v5, v20, v22);
  return v23;
}

uint64_t sub_23795DE24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AQINumericalTemplateModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23795DE88(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AQINumericalTemplateModel();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_23795DEE4(uint64_t a1)
{
  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v2 = (id)qword_268937660;
  uint64_t v3 = (void *)sub_23796EA68();
  uint64_t v4 = (void *)sub_23796EA68();
  id v5 = objc_msgSend(v2, sel_localizedStringForKey_value_table_, v3, 0, v4);

  sub_23796EA98();
  sub_2379265BC((uint64_t *)&unk_268937390);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2379713F0;
  if (*(unsigned char *)(a1 + *(int *)(type metadata accessor for AQINumericalTemplateModel() + 24) + 8))
  {
    uint64_t v7 = sub_23796E988();
  }
  else
  {
    sub_23792E5BC();
    uint64_t v7 = sub_23796EC68();
  }
  uint64_t v9 = v7;
  uint64_t v10 = v8;
  sub_237926638(0, (unint64_t *)&qword_2689373A0);
  *(void *)(inited + 56) = MEMORY[0x263F8D310];
  *(void *)(inited + 64) = sub_23792918C();
  *(void *)(inited + 32) = v9;
  *(void *)(inited + 40) = v10;
  uint64_t v11 = sub_23796EDF8();
  swift_setDeallocating();
  sub_2379265BC(&qword_2689373C0);
  swift_arrayDestroy();
  uint64_t ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  uint64_t v13 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(ObjCClassFromMetadata, sel_textProviderWithFormat_arguments_, v13, v11);

  id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD148]), sel_initWithTextProvider_, v14);
  return v15;
}

id sub_23795E144(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AQINumericalTemplateModel();
  if ((*(unsigned char *)(a1 + *(int *)(v2 + 24) + 8) & 1) != 0
    || (uint64_t v3 = (uint64_t *)(a1 + *(int *)(v2 + 28)), (v4 = v3[1]) == 0))
  {
    if (qword_2689370E0 != -1) {
      swift_once();
    }
    id v17 = (id)qword_268937660;
    uint64_t v18 = (void *)sub_23796EA68();
    uint64_t v19 = (void *)sub_23796EA68();
    id v20 = objc_msgSend(v17, sel_localizedStringForKey_value_table_, v18, 0, v19);

    sub_23796EA98();
  }
  else
  {
    uint64_t v5 = *v3;
    uint64_t v6 = qword_2689370E0;
    swift_bridgeObjectRetain();
    if (v6 != -1) {
      swift_once();
    }
    id v7 = (id)qword_268937660;
    uint64_t v8 = (void *)sub_23796EA68();
    uint64_t v9 = (void *)sub_23796EA68();
    id v10 = objc_msgSend(v7, sel_localizedStringForKey_value_table_, v8, 0, v9);

    sub_23796EA98();
    sub_2379265BC((uint64_t *)&unk_268937390);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_237971400;
    sub_23792E5BC();
    uint64_t v12 = sub_23796EC68();
    uint64_t v14 = v13;
    uint64_t v15 = MEMORY[0x263F8D310];
    *(void *)(v11 + 56) = MEMORY[0x263F8D310];
    unint64_t v16 = sub_23792918C();
    *(void *)(v11 + 32) = v12;
    *(void *)(v11 + 40) = v14;
    *(void *)(v11 + 96) = v15;
    *(void *)(v11 + 104) = v16;
    *(void *)(v11 + 64) = v16;
    *(void *)(v11 + 72) = v5;
    *(void *)(v11 + 80) = v4;
    sub_23796EAA8();
    swift_bridgeObjectRelease();
  }
  uint64_t v21 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v22 = objc_msgSend(self, sel_textProviderWithText_, v21);

  id v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD138]), sel_initWithTextProvider_, v22);
  return v23;
}

id sub_23795E454(uint64_t a1)
{
  return sub_23795E72C(a1, (Class *)0x263EFCFE0);
}

id sub_23795E460(uint64_t a1)
{
  return sub_23795E72C(a1, (Class *)0x263EFD008);
}

id sub_23795E46C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AQINumericalTemplateModel();
  uint64_t v3 = a1 + *(int *)(v2 + 32);
  int v4 = *(_DWORD *)(v3 + 16);
  sub_237926638(0, (unint64_t *)&qword_268937340);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)sub_23796EB08();
  swift_bridgeObjectRelease();
  sub_237926638(0, &qword_268937560);
  uint64_t v6 = (void *)sub_23796EB08();
  swift_bridgeObjectRelease();
  id v7 = self;
  LODWORD(v8) = v4;
  objc_msgSend(v7, sel_gaugeProviderWithStyle_gaugeColors_gaugeColorLocations_fillFraction_, 0, v5, v6, v8);

  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v9 = (id)qword_268937660;
  id v10 = (void *)sub_23796EA68();
  uint64_t v11 = (void *)sub_23796EA68();
  id v12 = objc_msgSend(v9, sel_localizedStringForKey_value_table_, v10, 0, v11);

  sub_23796EA98();
  uint64_t v13 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  uint64_t v14 = self;
  id v15 = objc_msgSend(v14, sel_textProviderWithText_, v13);

  objc_msgSend(v15, sel_setTintColor_, *(void *)(v3 + 24));
  if (*(unsigned char *)(a1 + *(int *)(v2 + 24) + 8))
  {
    sub_23796E988();
  }
  else
  {
    sub_23792E5BC();
    sub_23796EC68();
  }
  unint64_t v16 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v17 = objc_msgSend(v14, sel_textProviderWithText_, v16);

  return v17;
}

id sub_23795E720(uint64_t a1)
{
  return sub_23795E72C(a1, (Class *)0x263EFCFB8);
}

id sub_23795E72C(uint64_t a1, Class *a2)
{
  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v4 = (id)qword_268937660;
  uint64_t v5 = (void *)sub_23796EA68();
  uint64_t v6 = (void *)sub_23796EA68();
  id v7 = objc_msgSend(v4, sel_localizedStringForKey_value_table_, v5, 0, v6);

  sub_23796EA98();
  double v8 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v9 = self;
  id v10 = objc_msgSend(v9, sel_textProviderWithText_, v8);

  if (*(unsigned char *)(a1 + *(int *)(type metadata accessor for AQINumericalTemplateModel() + 24) + 8))
  {
    sub_23796E988();
  }
  else
  {
    sub_23792E5BC();
    sub_23796EC68();
  }
  uint64_t v11 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v9, sel_textProviderWithText_, v11);

  id v13 = objc_msgSend(objc_allocWithZone(*a2), sel_initWithLine1TextProvider_line2TextProvider_, v10, v12);
  return v13;
}

uint64_t sub_23795E91C(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_23795E964@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v52 = a2;
  uint64_t v42 = sub_23796E948();
  MEMORY[0x270FA5388](v42);
  uint64_t v43 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2379265BC(&qword_268937478);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v47 = (uint64_t)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_23796E508();
  uint64_t v45 = *(void *)(v6 - 8);
  uint64_t v46 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v41 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_23796E958();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v51 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_23796E358();
  uint64_t v44 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  id v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_23796E8C8();
  uint64_t v14 = v13 - 8;
  MEMORY[0x270FA5388](v13);
  unint64_t v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_23796E2A8();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v39 = (char *)&v39 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  id v22 = (char *)&v39 - v21;
  uint64_t v48 = v18;
  id v23 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  v23((char *)&v39 - v21, a1, v17);
  uint64_t v24 = type metadata accessor for TemplateData();
  sub_23793345C(a1 + *(int *)(v24 + 24), (uint64_t)v16);
  uint64_t v25 = *(int *)(v14 + 32);
  uint64_t v49 = v16;
  uint64_t v50 = v12;
  uint64_t v26 = &v16[v25];
  uint64_t v27 = v44;
  uint64_t v28 = v45;
  uint64_t v29 = *(void (**)(char *, char *, uint64_t))(v44 + 16);
  uint64_t v40 = v10;
  v29(v12, v26, v10);
  uint64_t v30 = a1 + *(int *)(v24 + 20);
  uint64_t v31 = v46;
  uint64_t v32 = v47;
  sub_237935E98(v30, v47);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v28 + 48))(v32, 1, v31) == 1)
  {
    sub_23793C848(v32);
    v23(v39, (uint64_t)v22, v17);
    swift_storeEnumTagMultiPayload();
    uint64_t v33 = (uint64_t)v51;
    sub_23796E938();
  }
  else
  {
    uint64_t v34 = v41;
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 32))(v41, v32, v31);
    uint64_t v35 = v50;
    uint64_t v33 = (uint64_t)v51;
    sub_23796E9B8();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v34, v31);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v35, v40);
  }
  uint64_t v36 = type metadata accessor for NHPTemplateModel();
  uint64_t v37 = v52;
  sub_23795F558((uint64_t)v49, v52 + *(int *)(v36 + 20), MEMORY[0x263F580A0]);
  (*(void (**)(uint64_t, char *, uint64_t))(v48 + 32))(v37, v22, v17);
  return sub_23795F558(v33, v37 + *(int *)(v36 + 24), MEMORY[0x263F580B0]);
}

uint64_t sub_23795EE4C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v47 = a1;
  uint64_t v38 = sub_23796E948();
  MEMORY[0x270FA5388](v38);
  uint64_t v46 = (char *)&v34 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_23796E2D8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_23796E358();
  uint64_t v44 = *(void *)(v6 - 8);
  uint64_t v45 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_23796E8C8();
  uint64_t v9 = MEMORY[0x270FA5388](v40);
  uint64_t v41 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v49 = (uint64_t)&v34 - v11;
  uint64_t v12 = sub_23796E2A8();
  uint64_t v42 = *(void *)(v12 - 8);
  uint64_t v43 = v12;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v48 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v39 = (char *)&v34 - v16;
  sub_23792D380(v15);
  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v17 = (id)qword_268937660;
  unint64_t v37 = 0x800000023796F8D0;
  uint64_t v18 = (void *)sub_23796EA68();
  unint64_t v36 = 0xD000000000000024;
  uint64_t v19 = (void *)sub_23796EA68();
  id v20 = objc_msgSend(v17, sel_localizedStringForKey_value_table_, v18, 0, v19);

  sub_23796EA98();
  sub_23796E348();
  sub_23796E2C8();
  sub_23796E2B8();
  uint64_t v35 = *(void (**)(char *, uint64_t))(v3 + 8);
  v35(v5, v2);
  uint64_t v21 = sub_23796E8A8();
  sub_23792D380(v21);
  uint64_t v22 = *MEMORY[0x263F1F4A0];
  uint64_t v23 = sub_23796E5E8();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = v46;
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 104))(v46, v22, v23);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v25, 0, 1, v23);
  swift_storeEnumTagMultiPayload();
  id v26 = (id)qword_268937660;
  uint64_t v27 = (void *)sub_23796EA68();
  uint64_t v28 = (void *)sub_23796EA68();
  id v29 = objc_msgSend(v26, sel_localizedStringForKey_value_table_, v27, 0, v28);

  sub_23796EA98();
  sub_23796E348();
  sub_23796E2C8();
  sub_23796E2B8();
  v35(v5, v2);
  uint64_t v30 = (uint64_t)v41;
  sub_23796E8A8();
  (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(v8, v30 + *(int *)(v40 + 24), v45);
  sub_2379609EC(v30, MEMORY[0x263F580A0]);
  uint64_t v31 = type metadata accessor for NHPTemplateModel();
  uint64_t v32 = v47;
  sub_23796E938();
  (*(void (**)(uint64_t, char *, uint64_t))(v42 + 32))(v32, v39, v43);
  return sub_23795F558(v49, v32 + *(int *)(v31 + 20), MEMORY[0x263F580A0]);
}

uint64_t sub_23795F460()
{
  return sub_23796E918();
}

unint64_t sub_23795F48C(uint64_t a1)
{
  unint64_t result = sub_23795F4B4();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23795F4B4()
{
  unint64_t result = qword_2689378E0;
  if (!qword_2689378E0)
  {
    type metadata accessor for NHPTemplateModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689378E0);
  }
  return result;
}

uint64_t type metadata accessor for NHPTemplateModel()
{
  uint64_t result = qword_2689378F8;
  if (!qword_2689378F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_23795F558(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t *sub_23795F5C0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) == 0)
  {
    uint64_t v47 = sub_23796E2A8();
    uint64_t v46 = *(void (**)(void, void, void))(*(void *)(v47 - 8) + 16);
    v46(a1, a2, v47);
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v49 = a1;
    uint64_t v8 = (uint64_t *)((char *)a1 + v7);
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = *(uint64_t *)((char *)a2 + v7 + 8);
    *uint64_t v8 = *(uint64_t *)((char *)a2 + v7);
    v8[1] = v10;
    uint64_t v11 = *(uint64_t *)((char *)a2 + v7 + 24);
    void v8[2] = *(uint64_t *)((char *)a2 + v7 + 16);
    v8[3] = v11;
    uint64_t v12 = (int *)sub_23796E8C8();
    uint64_t v13 = v12[6];
    uint64_t v43 = &v9[v13];
    uint64_t v44 = (char *)v8 + v13;
    uint64_t v14 = sub_23796E358();
    uint64_t v15 = *(void (**)(void, void, void))(*(void *)(v14 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v16 = v44;
    uint64_t v45 = v14;
    v15(v16, v43, v14);
    *((unsigned char *)v8 + v12[7]) = v9[v12[7]];
    *(_OWORD *)((char *)v8 + v12[8]) = *(_OWORD *)&v9[v12[8]];
    id v17 = v49;
    uint64_t v18 = *(int *)(a3 + 24);
    uint64_t v19 = (char *)v49 + v18;
    id v20 = (char *)a2 + v18;
    v46((char *)v49 + v18, v20, v47);
    uint64_t v21 = (int *)sub_23796E958();
    *(void *)&v19[v21[5]] = *(void *)&v20[v21[5]];
    v19[v21[6]] = v20[v21[6]];
    *(void *)&v19[v21[7]] = *(void *)&v20[v21[7]];
    uint64_t v22 = v21[8];
    uint64_t v23 = &v19[v22];
    uint64_t v24 = &v20[v22];
    uint64_t v25 = sub_23796E948();
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v31 = sub_23796E5E8();
      uint64_t v32 = *(void *)(v31 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v24, 1, v31))
      {
        uint64_t v33 = sub_2379265BC(&qword_268937570);
        memcpy(v23, v24, *(void *)(*(void *)(v33 - 8) + 64));
        uint64_t v34 = *(void (**)(void, void, void))(v32 + 16);
      }
      else
      {
        uint64_t v34 = *(void (**)(void, void, void))(v32 + 16);
        v34(v23, v24, v31);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v23, 0, 1, v31);
      }
      uint64_t v41 = sub_2379265BC(&qword_2689378F0);
      v34(&v23[*(int *)(v41 + 48)], &v24[*(int *)(v41 + 48)], v31);
    }
    else
    {
      if (EnumCaseMultiPayload != 1)
      {
        if (EnumCaseMultiPayload)
        {
          memcpy(v23, v24, *(void *)(*(void *)(v25 - 8) + 64));
        }
        else
        {
          uint64_t v27 = sub_23796E5E8();
          uint64_t v28 = *(void *)(v27 - 8);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v24, 1, v27))
          {
            uint64_t v29 = sub_2379265BC(&qword_268937570);
            memcpy(v23, v24, *(void *)(*(void *)(v29 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v23, v24, v27);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v23, 0, 1, v27);
          }
          swift_storeEnumTagMultiPayload();
        }
        goto LABEL_19;
      }
      uint64_t v35 = sub_23796E5E8();
      uint64_t v36 = *(void *)(v35 - 8);
      unint64_t v37 = *(void (**)(void, void, void))(v36 + 16);
      v37(v23, v24, v35);
      uint64_t v38 = *(int *)(sub_2379265BC(&qword_2689378E8) + 48);
      __dst = &v23[v38];
      uint64_t v39 = &v24[v38];
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v39, 1, v35))
      {
        uint64_t v40 = sub_2379265BC(&qword_268937570);
        memcpy(__dst, v39, *(void *)(*(void *)(v40 - 8) + 64));
      }
      else
      {
        v37(__dst, v39, v35);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(__dst, 0, 1, v35);
      }
    }
    swift_storeEnumTagMultiPayload();
    id v17 = v49;
LABEL_19:
    v15(&v19[v21[9]], &v20[v21[9]], v45);
    return v17;
  }
  uint64_t v30 = *a2;
  *a1 = *a2;
  id v17 = (uint64_t *)(v30 + ((v5 + 16) & ~(unint64_t)v5));
  swift_retain();
  return v17;
}

uint64_t sub_23795FB70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23796E2A8();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = v6 + *(int *)(sub_23796E8C8() + 24);
  uint64_t v8 = sub_23796E358();
  id v26 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  v26(v7, v8);
  uint64_t v9 = a1 + *(int *)(a2 + 24);
  v5(v9, v4);
  uint64_t v10 = sub_23796E958();
  uint64_t v11 = v9 + *(int *)(v10 + 32);
  sub_23796E948();
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      uint64_t v15 = sub_23796E5E8();
      uint64_t v16 = *(void *)(v15 - 8);
      int v17 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v11, 1, v15);
      uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
      if (!v17) {
        v18(v11, v15);
      }
      uint64_t v19 = sub_2379265BC(&qword_2689378F0);
      v18(v11 + *(int *)(v19 + 48), v15);
      break;
    case 1:
      uint64_t v20 = sub_23796E5E8();
      uint64_t v21 = *(void *)(v20 - 8);
      uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
      v22(v11, v20);
      uint64_t v23 = v11 + *(int *)(sub_2379265BC(&qword_2689378E8) + 48);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v21 + 48))(v23, 1, v20)) {
        v22(v23, v20);
      }
      break;
    case 0:
      uint64_t v13 = sub_23796E5E8();
      uint64_t v14 = *(void *)(v13 - 8);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v11, 1, v13)) {
        (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v11, v13);
      }
      break;
  }
  uint64_t v24 = v9 + *(int *)(v10 + 36);

  return ((uint64_t (*)(uint64_t, uint64_t))v26)(v24, v8);
}

uint64_t sub_23795FEC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23796E2A8();
  uint64_t v50 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v50(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a2 + v7 + 8);
  *uint64_t v8 = *(void *)(a2 + v7);
  v8[1] = v10;
  uint64_t v11 = *(void *)(a2 + v7 + 24);
  void v8[2] = *(void *)(a2 + v7 + 16);
  v8[3] = v11;
  uint64_t v12 = (int *)sub_23796E8C8();
  uint64_t v13 = v12[6];
  uint64_t v43 = v9 + v13;
  uint64_t v45 = (char *)v8 + v13;
  uint64_t v14 = sub_23796E358();
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v17 = v43;
  uint64_t v16 = v45;
  uint64_t v44 = v15;
  uint64_t v46 = v14;
  v15((uint64_t)v16, v17, v14);
  *((unsigned char *)v8 + v12[7]) = *(unsigned char *)(v9 + v12[7]);
  *(_OWORD *)((char *)v8 + v12[8]) = *(_OWORD *)(v9 + v12[8]);
  uint64_t v18 = *(int *)(a3 + 24);
  uint64_t v48 = a1;
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  v50(a1 + v18, a2 + v18, v6);
  uint64_t v21 = (int *)sub_23796E958();
  *(void *)(v19 + v21[5]) = *(void *)(v20 + v21[5]);
  *(unsigned char *)(v19 + v21[6]) = *(unsigned char *)(v20 + v21[6]);
  *(void *)(v19 + v21[7]) = *(void *)(v20 + v21[7]);
  uint64_t v22 = v21[8];
  uint64_t v23 = (char *)(v19 + v22);
  uint64_t v24 = (char *)(v20 + v22);
  uint64_t v25 = sub_23796E948();
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      uint64_t v30 = sub_23796E5E8();
      uint64_t v31 = *(void *)(v30 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v24, 1, v30))
      {
        uint64_t v32 = sub_2379265BC(&qword_268937570);
        memcpy(v23, v24, *(void *)(*(void *)(v32 - 8) + 64));
        uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
      }
      else
      {
        uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
        v33(v23, v24, v30);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v23, 0, 1, v30);
      }
      uint64_t v41 = sub_2379265BC(&qword_2689378F0);
      v33(&v23[*(int *)(v41 + 48)], &v24[*(int *)(v41 + 48)], v30);
      swift_storeEnumTagMultiPayload();
      break;
    case 1:
      uint64_t v34 = sub_23796E5E8();
      uint64_t v35 = *(void *)(v34 - 8);
      uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v35 + 16);
      v36(v23, v24, v34);
      uint64_t v37 = *(int *)(sub_2379265BC(&qword_2689378E8) + 48);
      __dst = &v23[v37];
      uint64_t v38 = &v24[v37];
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v38, 1, v34))
      {
        uint64_t v39 = sub_2379265BC(&qword_268937570);
        memcpy(__dst, v38, *(void *)(*(void *)(v39 - 8) + 64));
      }
      else
      {
        v36(__dst, v38, v34);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(__dst, 0, 1, v34);
      }
      uint64_t v40 = v48;
      goto LABEL_18;
    case 0:
      uint64_t v27 = sub_23796E5E8();
      uint64_t v28 = *(void *)(v27 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v24, 1, v27))
      {
        uint64_t v29 = sub_2379265BC(&qword_268937570);
        memcpy(v23, v24, *(void *)(*(void *)(v29 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v23, v24, v27);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v23, 0, 1, v27);
      }
      uint64_t v40 = v48;
LABEL_18:
      swift_storeEnumTagMultiPayload();
      goto LABEL_19;
    default:
      memcpy(v23, v24, *(void *)(*(void *)(v25 - 8) + 64));
      break;
  }
  uint64_t v40 = v48;
LABEL_19:
  v44(v19 + v21[9], v20 + v21[9], v46);
  return v40;
}

uint64_t sub_237960428(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23796E2A8();
  uint64_t v45 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v45(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  *uint64_t v8 = *(void *)(a2 + v7);
  v8[1] = *(void *)(a2 + v7 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  void v8[2] = *(void *)(v9 + 16);
  v8[3] = *(void *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = (int *)sub_23796E8C8();
  uint64_t v11 = v10[6];
  uint64_t v12 = (char *)v8 + v11;
  uint64_t v13 = v9 + v11;
  uint64_t v14 = sub_23796E358();
  uint64_t v47 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24);
  v47(v12, v13, v14);
  *((unsigned char *)v8 + v10[7]) = *(unsigned char *)(v9 + v10[7]);
  uint64_t v15 = v10[8];
  uint64_t v16 = (void *)((char *)v8 + v15);
  uint64_t v17 = (void *)(v9 + v15);
  void *v16 = *v17;
  v16[1] = v17[1];
  uint64_t v18 = *(int *)(a3 + 24);
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  v45(a1 + v18, a2 + v18, v6);
  uint64_t v21 = (int *)sub_23796E958();
  uint64_t v22 = v21;
  *(void *)(v19 + v21[5]) = *(void *)(v20 + v21[5]);
  *(unsigned char *)(v19 + v21[6]) = *(unsigned char *)(v20 + v21[6]);
  *(void *)(v19 + v21[7]) = *(void *)(v20 + v21[7]);
  if (a1 != a2)
  {
    uint64_t v23 = v21[8];
    uint64_t v24 = (char *)(v19 + v23);
    uint64_t v25 = (char *)(v20 + v23);
    sub_2379609EC(v19 + v23, MEMORY[0x263F580A8]);
    uint64_t v26 = sub_23796E948();
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    switch(EnumCaseMultiPayload)
    {
      case 2:
        uint64_t v46 = a1;
        uint64_t v31 = sub_23796E5E8();
        uint64_t v32 = *(void *)(v31 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v25, 1, v31))
        {
          uint64_t v33 = sub_2379265BC(&qword_268937570);
          memcpy(v24, v25, *(void *)(*(void *)(v33 - 8) + 64));
          __dst = *(void (**)(char *, char *, uint64_t))(v32 + 16);
        }
        else
        {
          __dst = *(void (**)(char *, char *, uint64_t))(v32 + 16);
          __dst(v24, v25, v31);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v24, 0, 1, v31);
        }
        uint64_t v39 = sub_2379265BC(&qword_2689378F0);
        __dst(&v24[*(int *)(v39 + 48)], &v25[*(int *)(v39 + 48)], v31);
        swift_storeEnumTagMultiPayload();
        a1 = v46;
        break;
      case 1:
        uint64_t v34 = sub_23796E5E8();
        uint64_t v35 = *(void *)(v34 - 8);
        uint64_t v41 = *(void (**)(char *, char *, uint64_t))(v35 + 16);
        v41(v24, v25, v34);
        uint64_t v36 = *(int *)(sub_2379265BC(&qword_2689378E8) + 48);
        __dsta = &v24[v36];
        uint64_t v37 = &v25[v36];
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v37, 1, v34))
        {
          uint64_t v38 = sub_2379265BC(&qword_268937570);
          memcpy(__dsta, v37, *(void *)(*(void *)(v38 - 8) + 64));
        }
        else
        {
          v41(__dsta, v37, v34);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(__dsta, 0, 1, v34);
        }
        goto LABEL_16;
      case 0:
        uint64_t v28 = sub_23796E5E8();
        uint64_t v29 = *(void *)(v28 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v25, 1, v28))
        {
          uint64_t v30 = sub_2379265BC(&qword_268937570);
          memcpy(v24, v25, *(void *)(*(void *)(v30 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v24, v25, v28);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v24, 0, 1, v28);
        }
LABEL_16:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
        break;
    }
  }
  v47((char *)(v19 + v22[9]), v20 + v22[9], v14);
  return a1;
}

uint64_t sub_2379609EC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_237960A4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23796E2A8();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (_OWORD *)(a1 + v8);
  uint64_t v10 = a2 + v8;
  long long v11 = *(_OWORD *)(a2 + v8 + 16);
  *uint64_t v9 = *(_OWORD *)(a2 + v8);
  v9[1] = v11;
  uint64_t v12 = (int *)sub_23796E8C8();
  uint64_t v13 = v12[6];
  uint64_t v14 = (char *)v9 + v13;
  uint64_t v15 = v10 + v13;
  uint64_t v16 = sub_23796E358();
  uint64_t v42 = *(void (**)(char *, uint64_t))(*(void *)(v16 - 8) + 32);
  uint64_t v43 = v16;
  v42(v14, v15);
  *((unsigned char *)v9 + v12[7]) = *(unsigned char *)(v10 + v12[7]);
  *(_OWORD *)((char *)v9 + v12[8]) = *(_OWORD *)(v10 + v12[8]);
  uint64_t v17 = *(int *)(a3 + 24);
  uint64_t v45 = a1;
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  v7(v18, v19, v6);
  uint64_t v20 = (int *)sub_23796E958();
  *(void *)(v18 + v20[5]) = *(void *)(v19 + v20[5]);
  *(unsigned char *)(v18 + v20[6]) = *(unsigned char *)(v19 + v20[6]);
  *(void *)(v18 + v20[7]) = *(void *)(v19 + v20[7]);
  uint64_t v21 = v20[8];
  uint64_t v22 = (char *)(v18 + v21);
  uint64_t v23 = (char *)(v19 + v21);
  uint64_t v24 = sub_23796E948();
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      uint64_t v29 = sub_23796E5E8();
      uint64_t v30 = *(void *)(v29 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v23, 1, v29))
      {
        uint64_t v31 = sub_2379265BC(&qword_268937570);
        memcpy(v22, v23, *(void *)(*(void *)(v31 - 8) + 64));
        uint64_t v40 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
      }
      else
      {
        uint64_t v40 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
        v40(v22, v23, v29);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v22, 0, 1, v29);
      }
      uint64_t v38 = sub_2379265BC(&qword_2689378F0);
      v40(&v22[*(int *)(v38 + 48)], &v23[*(int *)(v38 + 48)], v29);
      goto LABEL_16;
    case 1:
      uint64_t v32 = sub_23796E5E8();
      uint64_t v33 = *(void *)(v32 - 8);
      uint64_t v41 = *(void (**)(char *, char *, uint64_t))(v33 + 32);
      v41(v22, v23, v32);
      uint64_t v34 = *(int *)(sub_2379265BC(&qword_2689378E8) + 48);
      uint64_t v35 = &v22[v34];
      uint64_t v36 = &v23[v34];
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v36, 1, v32))
      {
        uint64_t v37 = sub_2379265BC(&qword_268937570);
        memcpy(v35, v36, *(void *)(*(void *)(v37 - 8) + 64));
      }
      else
      {
        v41(v35, v36, v32);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v35, 0, 1, v32);
      }
      goto LABEL_16;
    case 0:
      uint64_t v26 = sub_23796E5E8();
      uint64_t v27 = *(void *)(v26 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v23, 1, v26))
      {
        uint64_t v28 = sub_2379265BC(&qword_268937570);
        memcpy(v22, v23, *(void *)(*(void *)(v28 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v22, v23, v26);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v22, 0, 1, v26);
      }
LABEL_16:
      swift_storeEnumTagMultiPayload();
      goto LABEL_17;
  }
  memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
LABEL_17:
  ((void (*)(uint64_t, uint64_t, uint64_t))v42)(v18 + v20[9], v19 + v20[9], v43);
  return v45;
}

uint64_t sub_237960F8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23796E2A8();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = a2 + v8;
  uint64_t v11 = *(void *)(a2 + v8 + 8);
  *uint64_t v9 = *(void *)(a2 + v8);
  v9[1] = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(v10 + 24);
  v9[2] = *(void *)(v10 + 16);
  v9[3] = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = (int *)sub_23796E8C8();
  uint64_t v14 = v13[6];
  uint64_t v15 = (char *)v9 + v14;
  uint64_t v16 = v10 + v14;
  uint64_t v17 = sub_23796E358();
  uint64_t v49 = *(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 40);
  uint64_t v50 = v17;
  v49(v15, v16);
  *((unsigned char *)v9 + v13[7]) = *(unsigned char *)(v10 + v13[7]);
  uint64_t v18 = v13[8];
  long long v19 = *(_OWORD *)(v10 + v18);
  uint64_t v20 = a1;
  *(_OWORD *)((char *)v9 + v18) = v19;
  uint64_t v21 = *(int *)(a3 + 24);
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  v7(v22, a2 + v21, v6);
  uint64_t v24 = (int *)sub_23796E958();
  uint64_t v25 = v24;
  *(void *)(v22 + v24[5]) = *(void *)(v23 + v24[5]);
  *(unsigned char *)(v22 + v24[6]) = *(unsigned char *)(v23 + v24[6]);
  *(void *)(v22 + v24[7]) = *(void *)(v23 + v24[7]);
  if (v20 != a2)
  {
    uint64_t v26 = v24[8];
    uint64_t v27 = (char *)(v22 + v26);
    uint64_t v28 = (char *)(v23 + v26);
    sub_2379609EC(v22 + v26, MEMORY[0x263F580A8]);
    uint64_t v29 = sub_23796E948();
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    switch(EnumCaseMultiPayload)
    {
      case 2:
        uint64_t v34 = sub_23796E5E8();
        uint64_t v35 = *(void *)(v34 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v28, 1, v34))
        {
          uint64_t v36 = sub_2379265BC(&qword_268937570);
          memcpy(v27, v28, *(void *)(*(void *)(v36 - 8) + 64));
          uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v35 + 32);
        }
        else
        {
          uint64_t v48 = *(void (**)(char *, char *, uint64_t))(v35 + 32);
          v48(v27, v28, v34);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v27, 0, 1, v34);
          uint64_t v37 = v48;
        }
        uint64_t v44 = sub_2379265BC(&qword_2689378F0);
        v37(&v27[*(int *)(v44 + 48)], &v28[*(int *)(v44 + 48)], v34);
        goto LABEL_17;
      case 1:
        uint64_t v38 = sub_23796E5E8();
        uint64_t v39 = *(void *)(v38 - 8);
        uint64_t v47 = *(void (**)(char *, char *, uint64_t))(v39 + 32);
        v47(v27, v28, v38);
        uint64_t v40 = *(int *)(sub_2379265BC(&qword_2689378E8) + 48);
        uint64_t v41 = &v27[v40];
        uint64_t v42 = &v28[v40];
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48))(v42, 1, v38))
        {
          uint64_t v43 = sub_2379265BC(&qword_268937570);
          memcpy(v41, v42, *(void *)(*(void *)(v43 - 8) + 64));
        }
        else
        {
          v47(v41, v42, v38);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v39 + 56))(v41, 0, 1, v38);
        }
        goto LABEL_17;
      case 0:
        uint64_t v31 = sub_23796E5E8();
        uint64_t v32 = *(void *)(v31 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v28, 1, v31))
        {
          uint64_t v33 = sub_2379265BC(&qword_268937570);
          memcpy(v27, v28, *(void *)(*(void *)(v33 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v27, v28, v31);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v27, 0, 1, v31);
        }
LABEL_17:
        swift_storeEnumTagMultiPayload();
        goto LABEL_18;
    }
    memcpy(v27, v28, *(void *)(*(void *)(v29 - 8) + 64));
  }
LABEL_18:
  ((void (*)(uint64_t, uint64_t, uint64_t))v49)(v22 + v25[9], v23 + v25[9], v50);
  return v20;
}

uint64_t sub_237961504(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_237961518);
}

uint64_t sub_237961518(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23796E2A8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_23796E8C8();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  uint64_t v14 = sub_23796E958();
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + *(int *)(a3 + 24);

  return v15(v17, a2, v16);
}

uint64_t sub_237961664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_237961678);
}

uint64_t sub_237961678(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_23796E2A8();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = sub_23796E8C8();
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  uint64_t v16 = sub_23796E958();
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + *(int *)(a4 + 24);

  return v17(v19, a2, a2, v18);
}

uint64_t sub_2379617D0()
{
  uint64_t result = sub_23796E2A8();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_23796E8C8();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_23796E958();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

void sub_2379618D4()
{
  float v0 = sub_237961900();
  qword_2689394E0 = v1;
  *(void *)algn_2689394E8 = v2;
  dword_2689394F0 = LODWORD(v0);
  qword_2689394F8 = v3;
}

float sub_237961900()
{
  sub_2379265BC(&qword_268937748);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_237972100;
  uint64_t v1 = self;
  *(void *)(v0 + 32) = objc_msgSend(v1, sel_grayColor);
  *(void *)(v0 + 40) = objc_msgSend(v1, sel_grayColor);
  sub_23796EB28();
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_237972100;
  *(void *)(v2 + 32) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, 0.0);
  *(void *)(v2 + 40) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, 1.0);
  sub_23796EB28();
  float v3 = *MEMORY[0x263EFCF60];
  id v4 = objc_msgSend(v1, sel_whiteColor);
  return v3;
}

float sub_237961A54(uint64_t a1, __n128 a2)
{
  double v2 = a2.n128_f64[0];
  uint64_t v15 = MEMORY[0x263F8EE78];
  uint64_t v16 = MEMORY[0x263F8EE78];
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    uint64_t v5 = a1 + 16 * v4;
    double v7 = *(double *)(v5 + 16);
    uint64_t v6 = (double *)(v5 + 16);
    double v8 = v7;
    swift_bridgeObjectRetain();
    uint64_t v9 = (id *)(a1 + 40);
    do
    {
      double v10 = *((double *)v9 - 1);
      id v11 = *v9;
      MEMORY[0x237E25BF0]();
      if (*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_23796EB38();
      }
      sub_23796EB58();
      sub_23796EB28();
      objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v10 / v8);
      MEMORY[0x237E25BF0]();
      if (*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_23796EB38();
      }
      sub_23796EB58();
      sub_23796EB28();

      v9 += 2;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
    MEMORY[0x237E25980](a1, v2);
    double v12 = *v6;
  }
  else
  {
    MEMORY[0x237E25980](a1, a2);
    double v12 = 1.0;
  }
  float v13 = v2 / v12;
  if (v13 <= 0.0) {
    float v13 = 0.0;
  }
  return fminf(v13, 1.0);
}

float sub_237961C24(uint64_t a1)
{
  uint64_t v2 = sub_23796E7B8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_23796E788();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_23796E718();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  float v13 = (char *)v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34[1] = a1;
  sub_23796E638();
  sub_23796E708();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  uint64_t v14 = sub_23796E778();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v15 = *(void *)(v14 + 16);
  if (v15)
  {
    unint64_t v16 = sub_2379290F8();
    uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v17 = v3 + 16;
    uint64_t v36 = v18;
    unint64_t v37 = v16;
    uint64_t v19 = *(unsigned __int8 *)(v17 + 64);
    v34[0] = v14;
    uint64_t v20 = v14 + ((v19 + 32) & ~v19);
    uint64_t v35 = *(void *)(v17 + 56);
    uint64_t v21 = (void *)MEMORY[0x263F8EE78];
    uint64_t v38 = v17;
    do
    {
      v36(v5, v20, v2);
      sub_23796E798();
      uint64_t v22 = (void *)sub_23796EC08();
      sub_23796E7A8();
      uint64_t v23 = sub_23796E878();
      uint64_t v25 = v24;
      uint64_t v26 = v23;
      id v27 = v22;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v21 = sub_237933A54(0, v21[2] + 1, 1, v21);
      }
      unint64_t v29 = v21[2];
      unint64_t v28 = v21[3];
      if (v29 >= v28 >> 1) {
        uint64_t v21 = sub_237933A54((void *)(v28 > 1), v29 + 1, 1, v21);
      }
      v21[2] = v29 + 1;
      uint64_t v30 = &v21[2 * v29];
      v30[4] = v25;
      v30[5] = v26;

      (*(void (**)(char *, uint64_t))(v17 - 8))(v5, v2);
      v20 += v35;
      --v15;
    }
    while (v15);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v21 = (void *)MEMORY[0x263F8EE78];
  }
  v31.n128_f64[0] = (double)sub_23796E628();
  float v32 = sub_237961A54((uint64_t)v21, v31);
  swift_bridgeObjectRelease();
  return v32;
}

uint64_t initializeBufferWithCopyOfBuffer for AQIGaugeModel(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for AQIGaugeModel(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 24);
}

uint64_t initializeWithCopy for AQIGaugeModel(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v4 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v5 = v4;
  return a1;
}

uint64_t assignWithCopy for AQIGaugeModel(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v4 = *(void **)(a2 + 24);
  id v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v4;
  id v6 = v4;

  return a1;
}

__n128 initializeWithTake for AQIGaugeModel(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for AQIGaugeModel(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v4 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  return a1;
}

uint64_t getEnumTagSinglePayload for AQIGaugeModel(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AQIGaugeModel(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AQIGaugeModel()
{
  return &type metadata for AQIGaugeModel;
}

uint64_t sub_237962204()
{
  type metadata accessor for WindTemplateFormatter();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_237964984(&qword_268937948, v1, (void (*)(uint64_t))type metadata accessor for WindTemplateFormatter);
  *(void *)&xmmword_268939500 = v0;
  *((void *)&xmmword_268939500 + 1) = result;
  return result;
}

uint64_t type metadata accessor for WindTemplateFormatter()
{
  return self;
}

uint64_t sub_237962298()
{
  return sub_237964984(&qword_268937910, 255, (void (*)(uint64_t))type metadata accessor for WindTemplateModel);
}

id sub_2379622E4(uint64_t a1)
{
  uint64_t v2 = sub_23796E318();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2379265BC((uint64_t *)&unk_268937840);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for WindTemplateModel();
  if (*(unsigned char *)(a1 + *(int *)(v9 + 24)) != 16)
  {
    sub_23796E7C8();
    sub_237958E00(a1 + *(int *)(v9 + 28), (uint64_t)v8);
    uint64_t v10 = sub_2379265BC(&qword_268937230);
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1)
    {
      sub_23796E308();
      sub_23796E198();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
      long long v30 = v27;
      sub_237926600((uint64_t)&v30);
      long long v29 = v28;
      sub_237926600((uint64_t)&v29);
      uint64_t v18 = (void *)sub_23796EA68();
      swift_bridgeObjectRelease();
      uint64_t v19 = self;
      id v20 = objc_msgSend(v19, sel_textProviderWithText_, v18);

      uint64_t v21 = self;
      id v15 = v20;
      id v22 = objc_msgSend(v21, sel_systemCyanColor);
      objc_msgSend(v15, sel_setTintColor_, v22);

      uint64_t v23 = (void *)sub_23796EA68();
      swift_bridgeObjectRelease();
      id v24 = objc_msgSend(v19, sel_textProviderWithText_, v23);

      id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD130]), sel_initWithLine1TextProvider_line2TextProvider_, v15, v24);
      goto LABEL_6;
    }
    sub_237958E68((uint64_t)v8);
    swift_bridgeObjectRelease();
  }
  sub_23796E988();
  uint64_t v12 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(self, sel_textProviderWithText_, v12);

  uint64_t v14 = self;
  id v15 = v13;
  id v16 = objc_msgSend(v14, sel_systemCyanColor);
  objc_msgSend(v15, sel_setTintColor_, v16);

  id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD120]), sel_initWithTextProvider_, v15);
LABEL_6:

  return v17;
}

id sub_2379626B4(uint64_t a1)
{
  uint64_t v2 = sub_23796E318();
  uint64_t v43 = *(void *)(v2 - 8);
  uint64_t v44 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v42 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2379265BC((uint64_t *)&unk_268937840);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v40 - v8;
  uint64_t v10 = sub_23796E8C8();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = (int *)type metadata accessor for WindTemplateModel();
  MEMORY[0x270FA5388](v13);
  id v15 = (char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = a1;
  sub_237962C74(a1, (uint64_t)v15, (uint64_t (*)(void))type metadata accessor for WindTemplateModel);
  sub_237962C74((uint64_t)&v15[v13[5]], (uint64_t)v12, MEMORY[0x263F580A0]);
  sub_237958E00((uint64_t)&v15[v13[7]], (uint64_t)v9);
  uint64_t v16 = sub_2379265BC(&qword_268937230);
  uint64_t v41 = *(void *)(v16 - 8);
  uint64_t v45 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48);
  BOOL v17 = v45(v9, 1, v16) == 1;
  sub_237958E68((uint64_t)v9);
  uint64_t v18 = (void *)sub_237955398(v12, v17);
  sub_237962CDC((uint64_t)v12, MEMORY[0x263F580A0]);
  id v19 = objc_msgSend(self, sel_systemCyanColor);
  uint64_t v47 = v18;
  objc_msgSend(v18, sel_setTintColor_, v19);

  sub_237962CDC((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for WindTemplateModel);
  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v20 = (id)qword_268937660;
  uint64_t v21 = (void *)sub_23796EA68();
  id v22 = (void *)sub_23796EA68();
  id v23 = objc_msgSend(v20, sel_localizedStringForKey_value_table_, v21, 0, v22);

  sub_23796EA98();
  sub_2379265BC((uint64_t *)&unk_268937390);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_2379713F0;
  uint64_t v25 = v46;
  if (*(unsigned char *)(v46 + v13[6]) == 16) {
    uint64_t v26 = sub_23796E988();
  }
  else {
    uint64_t v26 = sub_23796E7C8();
  }
  uint64_t v28 = v26;
  uint64_t v29 = v27;
  *(void *)(v24 + 56) = MEMORY[0x263F8D310];
  *(void *)(v24 + 64) = sub_23792918C();
  *(void *)(v24 + 32) = v28;
  *(void *)(v24 + 40) = v29;
  sub_23796EAA8();
  swift_bridgeObjectRelease();
  long long v30 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  __n128 v31 = self;
  id v32 = objc_msgSend(v31, sel_textProviderWithText_, v30);

  sub_237958E00(v25 + v13[7], (uint64_t)v7);
  if (v45(v7, 1, v16) == 1)
  {
    sub_237958E68((uint64_t)v7);
    sub_23796E988();
  }
  else
  {
    uint64_t v33 = v42;
    sub_23796E308();
    sub_23796E188();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v33, v44);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v7, v16);
  }
  uint64_t v34 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v35 = objc_msgSend(v31, sel_textProviderWithText_, v34);

  id v36 = objc_allocWithZone(MEMORY[0x263EFD0F8]);
  unint64_t v37 = v47;
  id v38 = objc_msgSend(v36, sel_initWithHeaderTextProvider_body1TextProvider_body2TextProvider_, v47, v32, v35);

  return v38;
}

uint64_t sub_237962C74(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_237962CDC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id sub_237962D3C(uint64_t a1)
{
  uint64_t v2 = sub_23796E318();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2379265BC((uint64_t *)&unk_268937840);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for WindTemplateModel();
  if (*(unsigned char *)(a1 + *(int *)(v9 + 24)) == 16) {
    goto LABEL_4;
  }
  uint64_t v10 = sub_23796E7C8();
  uint64_t v12 = v11;
  sub_237958E00(a1 + *(int *)(v9 + 28), (uint64_t)v8);
  uint64_t v13 = sub_2379265BC(&qword_268937230);
  uint64_t v14 = *(void *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v8, 1, v13) == 1)
  {
    sub_237958E68((uint64_t)v8);
    swift_bridgeObjectRelease();
LABEL_4:
    sub_23796E988();
    goto LABEL_8;
  }
  sub_23796E308();
  sub_23796E198();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v13);
  long long v28 = v26[1];
  sub_237926600((uint64_t)&v28);
  long long v27 = v26[2];
  sub_237926600((uint64_t)&v27);
  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v15 = (id)qword_268937660;
  uint64_t v16 = (void *)sub_23796EA68();
  BOOL v17 = (void *)sub_23796EA68();
  id v18 = objc_msgSend(v15, sel_localizedStringForKey_value_table_, v16, 0, v17);

  sub_23796EA98();
  sub_2379265BC((uint64_t *)&unk_268937390);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_237971400;
  uint64_t v20 = MEMORY[0x263F8D310];
  *(void *)(v19 + 56) = MEMORY[0x263F8D310];
  unint64_t v21 = sub_23792918C();
  *(void *)(v19 + 64) = v21;
  *(void *)(v19 + 32) = v10;
  *(void *)(v19 + 40) = v12;
  *(void *)(v19 + 96) = v20;
  *(void *)(v19 + 104) = v21;
  *(_OWORD *)(v19 + 72) = v26[0];
  sub_23796EAA8();
  swift_bridgeObjectRelease();
LABEL_8:
  id v22 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v23 = objc_msgSend(self, sel_textProviderWithText_, v22);

  id v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD148]), sel_initWithTextProvider_, v23);
  return v24;
}

id sub_237963104(uint64_t a1)
{
  uint64_t v2 = sub_23796E318();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2379265BC((uint64_t *)&unk_268937840);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for WindTemplateModel();
  if (*(unsigned char *)(a1 + *(int *)(v9 + 24)) == 16) {
    goto LABEL_4;
  }
  uint64_t v10 = sub_23796E7C8();
  uint64_t v12 = v11;
  sub_237958E00(a1 + *(int *)(v9 + 28), (uint64_t)v8);
  uint64_t v13 = sub_2379265BC(&qword_268937230);
  uint64_t v14 = *(void *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v8, 1, v13) == 1)
  {
    sub_237958E68((uint64_t)v8);
    swift_bridgeObjectRelease();
LABEL_4:
    if (qword_2689370E0 != -1) {
      swift_once();
    }
    id v15 = (id)qword_268937660;
    uint64_t v16 = (void *)sub_23796EA68();
    BOOL v17 = (void *)sub_23796EA68();
    id v18 = objc_msgSend(v15, sel_localizedStringForKey_value_table_, v16, 0, v17);

    uint64_t v19 = sub_23796EA98();
    uint64_t v21 = v20;

    goto LABEL_10;
  }
  sub_23796E308();
  sub_23796E198();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v13);
  long long v41 = v38;
  sub_237926600((uint64_t)&v41);
  long long v40 = v39;
  sub_237926600((uint64_t)&v40);
  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v22 = (id)qword_268937660;
  id v23 = (void *)sub_23796EA68();
  id v24 = (void *)sub_23796EA68();
  id v25 = objc_msgSend(v22, sel_localizedStringForKey_value_table_, v23, 0, v24);

  sub_23796EA98();
  sub_2379265BC((uint64_t *)&unk_268937390);
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_237971810;
  uint64_t v27 = MEMORY[0x263F8D310];
  *(void *)(v26 + 56) = MEMORY[0x263F8D310];
  unint64_t v28 = sub_23792918C();
  *(void *)(v26 + 64) = v28;
  *(void *)(v26 + 32) = v10;
  *(void *)(v26 + 40) = v12;
  *(void *)(v26 + 96) = v27;
  *(void *)(v26 + 104) = v28;
  *(_OWORD *)(v26 + 72) = v37;
  uint64_t v29 = sub_237939720();
  *(void *)(v26 + 136) = v27;
  *(void *)(v26 + 144) = v28;
  *(void *)(v26 + 112) = v29;
  *(void *)(v26 + 120) = v30;
  uint64_t v19 = sub_23796EAA8();
  uint64_t v21 = v31;
  swift_bridgeObjectRelease();
LABEL_10:
  v36[0] = v19;
  v36[1] = v21;
  sub_237929138();
  sub_23796EC58();
  swift_bridgeObjectRelease();
  id v32 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v33 = objc_msgSend(self, sel_textProviderWithText_, v32);

  id v34 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD138]), sel_initWithTextProvider_, v33);
  return v34;
}

id sub_2379635CC(uint64_t a1)
{
  uint64_t v2 = sub_23796E318();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2379265BC((uint64_t *)&unk_268937840);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for WindTemplateModel();
  if (*(unsigned char *)(a1 + *(int *)(v9 + 24)) != 16)
  {
    sub_23796E7C8();
    sub_237958E00(a1 + *(int *)(v9 + 28), (uint64_t)v8);
    uint64_t v10 = sub_2379265BC(&qword_268937230);
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1)
    {
      sub_23796E308();
      sub_23796E198();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
      long long v31 = v28;
      sub_237926600((uint64_t)&v31);
      long long v30 = v29;
      sub_237926600((uint64_t)&v30);
      id v18 = (void *)sub_23796EA68();
      swift_bridgeObjectRelease();
      uint64_t v19 = self;
      id v20 = objc_msgSend(v19, sel_textProviderWithText_, v18);

      uint64_t v21 = (void *)sub_23796EA68();
      swift_bridgeObjectRelease();
      id v22 = objc_msgSend(v19, sel_textProviderWithText_, v21);

      id v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFCFE0]), sel_initWithLine1TextProvider_line2TextProvider_, v20, v22);
      id v24 = self;
      id v16 = v23;
      id v17 = objc_msgSend(v24, sel_systemCyanColor);
      goto LABEL_6;
    }
    sub_237958E68((uint64_t)v8);
    swift_bridgeObjectRelease();
  }
  sub_23796E988();
  uint64_t v12 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(self, sel_textProviderWithText_, v12);

  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFCFD0]), sel_initWithTextProvider_, v13);
  id v15 = self;
  id v16 = v14;
  id v17 = objc_msgSend(v15, sel_systemCyanColor);
LABEL_6:
  id v25 = v17;
  objc_msgSend(v16, sel_setTintColor_, v25);

  return v16;
}

id sub_23796397C(uint64_t a1)
{
  uint64_t v2 = sub_23796E318();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2379265BC((uint64_t *)&unk_268937840);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for WindTemplateModel();
  if (*(unsigned char *)(a1 + *(int *)(v9 + 24)) != 16)
  {
    sub_23796E7C8();
    sub_237958E00(a1 + *(int *)(v9 + 28), (uint64_t)v8);
    uint64_t v10 = sub_2379265BC(&qword_268937230);
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1)
    {
      sub_23796E308();
      sub_23796E198();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
      long long v32 = v29;
      sub_237926600((uint64_t)&v32);
      long long v31 = v30;
      sub_237926600((uint64_t)&v31);
      id v18 = (void *)sub_23796EA68();
      swift_bridgeObjectRelease();
      uint64_t v19 = self;
      id v20 = objc_msgSend(v19, sel_textProviderWithText_, v18);

      uint64_t v21 = self;
      id v15 = v20;
      id v22 = objc_msgSend(v21, sel_whiteColor);
      objc_msgSend(v15, sel_setTintColor_, v22);

      id v23 = (void *)sub_23796EA68();
      swift_bridgeObjectRelease();
      id v24 = objc_msgSend(v19, sel_textProviderWithText_, v23);

      id v25 = v24;
      id v26 = objc_msgSend(v21, sel_whiteColor);
      objc_msgSend(v25, sel_setTintColor_, v26);

      id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD008]), sel_initWithLine1TextProvider_line2TextProvider_, v15, v25);
      goto LABEL_6;
    }
    sub_237958E68((uint64_t)v8);
    swift_bridgeObjectRelease();
  }
  sub_23796E988();
  uint64_t v12 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(self, sel_textProviderWithText_, v12);

  id v14 = self;
  id v15 = v13;
  id v16 = objc_msgSend(v14, sel_whiteColor);
  objc_msgSend(v15, sel_setTintColor_, v16);

  id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFCFF8]), sel_initWithTextProvider_, v15);
LABEL_6:

  return v17;
}

id sub_237963D8C(uint64_t a1)
{
  uint64_t v2 = sub_23796E318();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2379265BC((uint64_t *)&unk_268937840);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for WindTemplateModel();
  sub_237958E00(a1 + *(int *)(v9 + 28), (uint64_t)v8);
  uint64_t v10 = sub_2379265BC(&qword_268937230);
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) == 1)
  {
    sub_237958E68((uint64_t)v8);
    if (qword_2689370E0 != -1) {
      swift_once();
    }
    id v12 = (id)qword_268937660;
    id v13 = (void *)sub_23796EA68();
    id v14 = (void *)sub_23796EA68();
    id v15 = objc_msgSend(v12, sel_localizedStringForKey_value_table_, v13, 0, v14);

    sub_23796EA98();
    sub_2379265BC((uint64_t *)&unk_268937390);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_2379713F0;
    uint64_t v17 = sub_237939720();
    uint64_t v19 = v18;
    *(void *)(v16 + 56) = MEMORY[0x263F8D310];
    *(void *)(v16 + 64) = sub_23792918C();
    *(void *)(v16 + 32) = v17;
    *(void *)(v16 + 40) = v19;
    sub_23796EAA8();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_23796E308();
    sub_23796E188();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
  }
  id v20 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  uint64_t v21 = self;
  id v22 = objc_msgSend(v21, sel_textProviderWithText_, v20);

  id v23 = self;
  id v24 = v22;
  id v25 = objc_msgSend(v23, sel_systemCyanColor);
  objc_msgSend(v24, sel_setTintColor_, v25);

  if (*(unsigned char *)(a1 + *(int *)(v9 + 24)) == 16) {
    sub_23796E988();
  }
  else {
    sub_23796E7C8();
  }
  id v26 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v27 = objc_msgSend(v21, sel_textProviderWithText_, v26);

  id v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD090]), sel_initWithInnerTextProvider_outerTextProvider_, v24, v27);
  return v28;
}

uint64_t sub_2379641BC(uint64_t a1)
{
  uint64_t v2 = sub_23796E318();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2379265BC((uint64_t *)&unk_268937840);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_237939720();
  uint64_t v10 = v9;
  uint64_t v11 = type metadata accessor for WindTemplateModel();
  if (*(unsigned char *)(a1 + *(int *)(v11 + 24)) == 16) {
    uint64_t v12 = sub_23796E988();
  }
  else {
    uint64_t v12 = sub_23796E7C8();
  }
  uint64_t v14 = v12;
  uint64_t v15 = v13;
  sub_237958E00(a1 + *(int *)(v11 + 28), (uint64_t)v8);
  uint64_t v16 = sub_2379265BC(&qword_268937230);
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v8, 1, v16) == 1)
  {
    sub_237958E68((uint64_t)v8);
    uint64_t v18 = sub_23796E988();
    uint64_t v20 = v19;
  }
  else
  {
    sub_23796E308();
    sub_23796E198();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v8, v16);
    uint64_t v18 = v30;
    uint64_t v20 = v31;
    long long v35 = v32;
    sub_237926600((uint64_t)&v35);
    long long v34 = v33;
    sub_237926600((uint64_t)&v34);
  }
  sub_2379265BC(&qword_268937928);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_237971810;
  *(void *)(inited + 32) = sub_23796EA98();
  *(void *)(inited + 40) = v22;
  *(void *)(inited + 48) = v14;
  *(void *)(inited + 56) = v15;
  *(void *)(inited + 64) = sub_23796EA98();
  *(void *)(inited + 72) = v23;
  *(void *)(inited + 80) = v18;
  *(void *)(inited + 88) = v20;
  *(void *)(inited + 96) = sub_23796EA98();
  *(void *)(inited + 104) = v24;
  *(void *)(inited + 112) = v27;
  *(void *)(inited + 120) = v10;
  unint64_t v29 = sub_2379293A0(inited);
  sub_2379265BC(&qword_268937930);
  sub_2379265BC(&qword_268937938);
  if (swift_dynamicCast()) {
    return v28;
  }
  else {
    return 0;
  }
}

void *sub_2379644CC(uint64_t a1)
{
  return sub_237964504(a1, (unint64_t *)&unk_268937918, 0x263F58070, (Class *)0x263EFD030);
}

void *sub_2379644E8(uint64_t a1)
{
  return sub_237964504(a1, &qword_268937940, 0x263F58078, (Class *)0x263EFD0A0);
}

void *sub_237964504(uint64_t a1, unint64_t *a2, uint64_t a3, Class *a4)
{
  sub_237926638(0, a2);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v7 = objc_msgSend(self, sel_fullColorImageProviderWithImageViewClass_, ObjCClassFromMetadata);
  if (sub_2379641BC(a1))
  {
    sub_2379265BC((uint64_t *)&unk_2689377F0);
    uint64_t v8 = (void *)sub_23796EA08();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  objc_msgSend(v7, sel_setMetadata_, v8);

  id v9 = objc_msgSend(objc_allocWithZone(*a4), sel_initWithImageProvider_, v7);
  uint64_t v10 = sub_23794B274();

  return v10;
}

id sub_237964604(uint64_t a1)
{
  uint64_t v2 = sub_23796E318();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2379265BC((uint64_t *)&unk_268937840);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for WindTemplateModel();
  if (*(unsigned char *)(a1 + *(int *)(v9 + 24)) != 16)
  {
    sub_23796E7C8();
    sub_237958E00(a1 + *(int *)(v9 + 28), (uint64_t)v8);
    uint64_t v10 = sub_2379265BC(&qword_268937230);
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1)
    {
      sub_23796E308();
      sub_23796E198();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
      long long v27 = v24;
      sub_237926600((uint64_t)&v27);
      long long v26 = v25;
      sub_237926600((uint64_t)&v26);
      uint64_t v19 = (void *)sub_23796EA68();
      swift_bridgeObjectRelease();
      uint64_t v20 = self;
      id v16 = objc_msgSend(v20, sel_textProviderWithText_, v19);

      uint64_t v21 = (void *)sub_23796EA68();
      swift_bridgeObjectRelease();
      id v17 = objc_msgSend(v20, sel_textProviderWithText_, v21);

      id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFCFB8]), sel_initWithLine1TextProvider_line2TextProvider_, v16, v17);
      goto LABEL_6;
    }
    sub_237958E68((uint64_t)v8);
    swift_bridgeObjectRelease();
  }
  sub_23796E988();
  uint64_t v12 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(self, sel_textProviderWithText_, v12);

  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFCFA8]), sel_initWithTextProvider_, v13);
  uint64_t v15 = self;
  id v16 = v14;
  id v17 = objc_msgSend(v15, sel_systemCyanColor);
  objc_msgSend(v16, sel_setTintColor_, v17);
  id v18 = v16;
LABEL_6:

  return v18;
}

uint64_t sub_237964984(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_2379649CC(unint64_t a1)
{
  if (a1 > 0xC) {
    return 0;
  }
  else {
    return *(void *)&aModulars[8 * a1];
  }
}

double sub_237964A00()
{
  sub_2379265BC(&qword_268937878);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_237972170;
  *(_OWORD *)(v0 + 32) = xmmword_237972180;
  *(_OWORD *)(v0 + 48) = xmmword_237972190;
  *(_OWORD *)(v0 + 64) = xmmword_2379721A0;
  *(_OWORD *)(v0 + 80) = xmmword_237971E30;
  *(_OWORD *)(v0 + 96) = xmmword_237971E40;
  *(void *)&double result = 11;
  *(_OWORD *)(v0 + 112) = xmmword_237971E50;
  *(void *)(v0 + 128) = *MEMORY[0x263EFCF20];
  return result;
}

double sub_237964A84()
{
  sub_2379265BC(&qword_268937878);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2379721B0;
  *(_OWORD *)(v0 + 32) = xmmword_237972180;
  *(_OWORD *)(v0 + 48) = xmmword_237972190;
  *(_OWORD *)(v0 + 64) = xmmword_2379721A0;
  *(void *)&double result = 7;
  *(_OWORD *)(v0 + 80) = xmmword_237971E30;
  *(_OWORD *)(v0 + 96) = xmmword_237971E40;
  uint64_t v2 = *MEMORY[0x263EFCF20];
  *(void *)(v0 + 112) = 12;
  *(void *)(v0 + 120) = v2;
  return result;
}

uint64_t sub_237964B00()
{
  off_268937950 = *(_UNKNOWN **)sub_23796E9A8();

  return swift_retain();
}

uint64_t sub_237964B34@<X0>(char *a1@<X8>)
{
  uint64_t v74 = a1;
  uint64_t v1 = sub_23796E2D8();
  uint64_t v72 = *(void *)(v1 - 8);
  uint64_t v73 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v71 = (char *)&v65 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_23796E358();
  uint64_t v79 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v70 = (char *)&v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for ChanceRainTemplateModel();
  MEMORY[0x270FA5388](v5 - 8);
  id v69 = (char *)&v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2379265BC(&qword_268937268);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v75 = (char *)&v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v77 = (char *)&v65 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v76 = (char *)&v65 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  unint64_t v78 = (char *)&v65 - v15;
  MEMORY[0x270FA5388](v14);
  id v17 = (char *)&v65 - v16;
  uint64_t v18 = sub_23796E2A8();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v65 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  long long v24 = (char *)&v65 - v23;
  if (qword_268937148 != -1) {
    swift_once();
  }
  uint64_t v80 = (*(uint64_t (**)(void, void, void))(*(void *)off_268937950 + 136))(0, 0, 0);
  uint64_t v81 = v25;
  uint64_t v26 = MEMORY[0x263F8EE78];
  uint64_t v85 = MEMORY[0x263F8EE78];
  sub_23792D380(v80);
  uint64_t v27 = sub_23796E1F8();
  MEMORY[0x270FA5388](v27);
  *(&v65 - 2) = (uint64_t)&v85;
  sub_23796E258();
  uint64_t v67 = v19;
  uint64_t v28 = *(void (**)(char *, uint64_t))(v19 + 8);
  v28(v22, v18);
  uint64_t v66 = v24;
  uint64_t v68 = v18;
  v28(v24, v18);
  uint64_t v84 = v26;
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)off_268937950 + 136))(0x3FE3333333333333, 0, 1);
  sub_23796E348();
  uint64_t v29 = v79;
  uint64_t v30 = *(void (**)(char *, void, uint64_t, uint64_t))(v79 + 56);
  uint64_t v82 = v79 + 56;
  uint64_t v31 = v30;
  v30(v17, 0, 1, v3);
  long long v32 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  long long v33 = (void *)sub_23796EA68();
  long long v34 = (char *)(v29 + 48);
  uint64_t v83 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48);
  long long v35 = 0;
  if (v83(v17, 1, v3) != 1)
  {
    long long v35 = (void *)sub_23796E338();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v17, v3);
  }
  id v36 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F58068]), sel_initWithTopString_middleString_bottomString_isDay_timeZone_, v32, v33, 0, 1, v35);

  MEMORY[0x237E25BF0]();
  if (*(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_23796EB38();
  }
  sub_23796EB58();
  sub_23796EB28();
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)off_268937950 + 136))(0x3FD3333333333333, 0, 1);
  long long v37 = v78;
  if (*(void *)(v85 + 16) < 2uLL)
  {
    __break(1u);
LABEL_31:
    sub_23796EB38();
    goto LABEL_12;
  }
  uint64_t v18 = *(void *)(v85 + 56);
  swift_bridgeObjectRetain();
  sub_23796E348();
  v31(v37, 0, 1, v3);
  long long v38 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v36 = (id)sub_23796EA68();
  long long v39 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  if (v83(v37, 1, v3) == 1)
  {
    long long v40 = 0;
  }
  else
  {
    long long v40 = (void *)sub_23796E338();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v37, v3);
  }
  objc_msgSend(objc_allocWithZone(MEMORY[0x263F58068]), sel_initWithTopString_middleString_bottomString_isDay_timeZone_, v38, v36, v39, 1, v40);

  MEMORY[0x237E25BF0]();
  if (*(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    goto LABEL_31;
  }
LABEL_12:
  sub_23796EB58();
  sub_23796EB28();
  if (*(void *)(v85 + 16) < 3uLL)
  {
    __break(1u);
LABEL_33:
    sub_23796EB38();
    goto LABEL_17;
  }
  uint64_t v18 = v29;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  long long v41 = v76;
  sub_23796E348();
  v31(v41, 0, 1, v3);
  uint64_t v42 = (void *)sub_23796EA68();
  uint64_t v43 = v41;
  swift_bridgeObjectRelease();
  uint64_t v44 = (void *)sub_23796EA68();
  id v36 = (id)sub_23796EA68();
  swift_bridgeObjectRelease();
  if (v83(v43, 1, v3) == 1)
  {
    uint64_t v45 = 0;
  }
  else
  {
    uint64_t v45 = (void *)sub_23796E338();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v43, v3);
  }
  long long v34 = v77;
  objc_msgSend(objc_allocWithZone(MEMORY[0x263F58068]), sel_initWithTopString_middleString_bottomString_isDay_timeZone_, v42, v44, v36, 1, v45);

  MEMORY[0x237E25BF0]();
  if (*(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    goto LABEL_33;
  }
LABEL_17:
  sub_23796EB58();
  sub_23796EB28();
  if (*(void *)(v85 + 16) < 4uLL)
  {
    __break(1u);
LABEL_35:
    sub_23796EB38();
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23796E348();
  v31(v34, 0, 1, v3);
  uint64_t v46 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  uint64_t v47 = (void *)sub_23796EA68();
  uint64_t v48 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  if (v83(v34, 1, v3) == 1)
  {
    uint64_t v49 = 0;
  }
  else
  {
    uint64_t v49 = (void *)sub_23796E338();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v34, v3);
  }
  id v36 = v75;
  objc_msgSend(objc_allocWithZone(MEMORY[0x263F58068]), sel_initWithTopString_middleString_bottomString_isDay_timeZone_, v46, v47, v48, 1, v49);

  MEMORY[0x237E25BF0]();
  if (*(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    goto LABEL_35;
  }
LABEL_22:
  sub_23796EB58();
  sub_23796EB28();
  if (*(void *)(v85 + 16) < 5uLL)
  {
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_23796E348();
    v31((char *)v36, 0, 1, v3);
    uint64_t v50 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    uint64_t v51 = (void *)sub_23796EA68();
    uint64_t v52 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
    if (v83((char *)v36, 1, v3) == 1)
    {
      uint64_t v53 = 0;
    }
    else
    {
      uint64_t v53 = (void *)sub_23796E338();
      (*(void (**)(id, uint64_t))(v18 + 8))(v36, v3);
    }
    uint64_t v3 = (uint64_t)v69;
    uint64_t v18 = (uint64_t)v66;
    objc_msgSend(objc_allocWithZone(MEMORY[0x263F58068]), sel_initWithTopString_middleString_bottomString_isDay_timeZone_, v50, v51, v52, 1, v53);

    MEMORY[0x237E25BF0]();
    if (*(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_27;
    }
  }
  sub_23796EB38();
LABEL_27:
  sub_23796EB58();
  sub_23796EB28();
  id v54 = objc_allocWithZone(MEMORY[0x263F58060]);
  sub_237933904();
  uint64_t v55 = (void *)sub_23796EB08();
  swift_bridgeObjectRelease();
  id v56 = objc_msgSend(v54, sel_initWithEntries_, v55);

  sub_237941420(v3);
  sub_23796E298();
  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v57 = (id)qword_268937660;
  uint64_t v58 = (void *)sub_23796EA68();
  uint64_t v59 = (void *)sub_23796EA68();
  id v60 = objc_msgSend(v57, sel_localizedStringForKey_value_table_, v58, 0, v59);

  sub_23796EA98();
  sub_23796E348();
  uint64_t v61 = v71;
  sub_23796E2C8();
  sub_23796E2B8();
  (*(void (**)(char *, uint64_t))(v72 + 8))(v61, v73);
  uint64_t v62 = type metadata accessor for ChanceRainRectangularTemplateModel();
  uint64_t v63 = v74;
  sub_23796E8A8();
  *(void *)uint64_t v63 = v56;
  sub_237965AE0(v3, (uint64_t)&v63[*(int *)(v62 + 20)]);
  (*(void (**)(char *, uint64_t, uint64_t))(v67 + 32))(&v63[*(int *)(v62 + 24)], v18, v68);
  return swift_bridgeObjectRelease();
}

uint64_t sub_237965904(uint64_t a1, uint64_t *a2)
{
  if (qword_2689370E8 != -1) {
    swift_once();
  }
  id v3 = (id)qword_268937668;
  uint64_t v4 = (void *)sub_23796E228();
  id v5 = objc_msgSend(v3, sel_stringFromDate_, v4);

  uint64_t v6 = sub_23796EA98();
  uint64_t v8 = v7;

  uint64_t v9 = (void *)*a2;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *a2 = (uint64_t)v9;
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_237933944(0, v9[2] + 1, 1, v9);
    uint64_t v9 = (void *)result;
    *a2 = result;
  }
  unint64_t v12 = v9[2];
  unint64_t v11 = v9[3];
  if (v12 >= v11 >> 1)
  {
    uint64_t result = (uint64_t)sub_237933944((void *)(v11 > 1), v12 + 1, 1, v9);
    uint64_t v9 = (void *)result;
    *a2 = result;
  }
  v9[2] = v12 + 1;
  uint64_t v13 = &v9[2 * v12];
  v13[4] = v6;
  v13[5] = v8;
  return result;
}

uint64_t sub_237965A34(uint64_t a1)
{
  uint64_t result = sub_237966E08(&qword_268937958, (void (*)(uint64_t))type metadata accessor for ChanceRainRectangularTemplateModel);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata accessor for ChanceRainRectangularTemplateModel()
{
  uint64_t result = qword_268937960;
  if (!qword_268937960) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_237965AD8(uint64_t a1)
{
  return sub_237965904(a1, *(uint64_t **)(v1 + 16));
}

uint64_t sub_237965AE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ChanceRainTemplateModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void **sub_237965B44(void **a1, void **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v20 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v6 = a3[5];
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v49 = sub_23796E2A8();
    uint64_t v48 = *(void (**)(char *, char *, uint64_t))(*(void *)(v49 - 8) + 16);
    uint64_t v9 = v4;
    v48(v7, v8, v49);
    uint64_t v10 = (int *)type metadata accessor for ChanceRainTemplateModel();
    uint64_t v11 = v10[5];
    unint64_t v12 = &v7[v11];
    uint64_t v13 = &v8[v11];
    uint64_t v47 = a1;
    uint64_t v14 = *(void *)&v8[v11 + 8];
    *(void *)unint64_t v12 = *(void *)&v8[v11];
    *((void *)v12 + 1) = v14;
    uint64_t v15 = *(void *)&v8[v11 + 24];
    *((void *)v12 + 2) = *(void *)&v8[v11 + 16];
    *((void *)v12 + 3) = v15;
    uint64_t v16 = sub_23796E8C8();
    uint64_t v17 = *(int *)(v16 + 24);
    uint64_t v45 = &v12[v17];
    uint64_t v46 = (int *)v16;
    uint64_t v44 = &v13[v17];
    uint64_t v18 = sub_23796E358();
    uint64_t v19 = *(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16);
    uint64_t v20 = v47;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v19(v45, v44, v18);
    v12[v46[7]] = v13[v46[7]];
    *(_OWORD *)&v12[v46[8]] = *(_OWORD *)&v13[v46[8]];
    uint64_t v21 = v10[6];
    uint64_t v22 = &v7[v21];
    uint64_t v23 = &v8[v21];
    v22[8] = v23[8];
    *(void *)uint64_t v22 = *(void *)v23;
    uint64_t v24 = v10[7];
    uint64_t v25 = &v7[v24];
    uint64_t v26 = &v8[v24];
    uint64_t v27 = *((void *)v26 + 1);
    *(void *)uint64_t v25 = *(void *)v26;
    *((void *)v25 + 1) = v27;
    v7[v10[8]] = v8[v10[8]];
    uint64_t v28 = v10[9];
    uint64_t v29 = &v7[v28];
    uint64_t v30 = &v8[v28];
    uint64_t v31 = *((void *)v30 + 1);
    *(void *)uint64_t v29 = *(void *)v30;
    *((void *)v29 + 1) = v31;
    uint64_t v32 = a3[6];
    long long v33 = (char *)v47 + v32;
    long long v34 = (char *)a2 + v32;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v48(v33, v34, v49);
    uint64_t v35 = a3[7];
    id v36 = (void **)((char *)v47 + v35);
    long long v37 = (char *)a2 + v35;
    uint64_t v38 = *(uint64_t *)((char *)a2 + v35 + 8);
    *id v36 = *(void **)((char *)a2 + v35);
    v36[1] = v38;
    uint64_t v39 = *(uint64_t *)((char *)a2 + v35 + 24);
    void v36[2] = *(void **)((char *)a2 + v35 + 16);
    v36[3] = v39;
    uint64_t v40 = v46[6];
    long long v41 = (char *)v36 + v40;
    uint64_t v42 = &v37[v40];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v19(v41, v42, v18);
    *((unsigned char *)v36 + v46[7]) = v37[v46[7]];
    *(_OWORD *)((char *)v36 + v46[8]) = *(_OWORD *)&v37[v46[8]];
  }
  return v20;
}

uint64_t sub_237965DEC(id *a1, int *a2)
{
  uint64_t v4 = (char *)a1 + a2[5];
  uint64_t v5 = sub_23796E2A8();
  uint64_t v6 = *(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  uint64_t v7 = &v4[*(int *)(type metadata accessor for ChanceRainTemplateModel() + 20)];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_23796E8C8();
  uint64_t v9 = &v7[*(int *)(v8 + 24)];
  uint64_t v10 = sub_23796E358();
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v14)((void *)(v10 - 8), v9, v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6((char *)a1 + a2[6], v5);
  uint64_t v11 = (char *)a1 + a2[7];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v12 = &v11[*(int *)(v8 + 24)];

  return v14(v12, v10);
}

void **sub_237965F78(void **a1, void **a2, int *a3)
{
  int v3 = *a2;
  *a1 = *a2;
  uint64_t v4 = a3[5];
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v45 = sub_23796E2A8();
  uint64_t v44 = *(void (**)(char *, char *, uint64_t))(*(void *)(v45 - 8) + 16);
  id v7 = v3;
  v44(v5, v6, v45);
  uint64_t v8 = (int *)type metadata accessor for ChanceRainTemplateModel();
  uint64_t v9 = v8[5];
  uint64_t v10 = &v5[v9];
  uint64_t v11 = &v6[v9];
  uint64_t v12 = *(void *)&v6[v9 + 8];
  *(void *)uint64_t v10 = *(void *)&v6[v9];
  *((void *)v10 + 1) = v12;
  uint64_t v13 = *(void *)&v6[v9 + 24];
  *((void *)v10 + 2) = *(void *)&v6[v9 + 16];
  *((void *)v10 + 3) = v13;
  uint64_t v14 = sub_23796E8C8();
  uint64_t v15 = *(int *)(v14 + 24);
  long long v41 = &v10[v15];
  uint64_t v42 = (int *)v14;
  uint64_t v40 = &v11[v15];
  uint64_t v16 = sub_23796E358();
  uint64_t v43 = *(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v43(v41, v40, v16);
  v10[v42[7]] = v11[v42[7]];
  *(_OWORD *)&v10[v42[8]] = *(_OWORD *)&v11[v42[8]];
  uint64_t v17 = v8[6];
  uint64_t v18 = &v5[v17];
  uint64_t v19 = &v6[v17];
  v18[8] = v19[8];
  *(void *)uint64_t v18 = *(void *)v19;
  uint64_t v20 = v8[7];
  uint64_t v21 = &v5[v20];
  uint64_t v22 = &v6[v20];
  uint64_t v23 = *((void *)v22 + 1);
  *(void *)uint64_t v21 = *(void *)v22;
  *((void *)v21 + 1) = v23;
  v5[v8[8]] = v6[v8[8]];
  uint64_t v24 = v8[9];
  uint64_t v25 = &v5[v24];
  uint64_t v26 = &v6[v24];
  uint64_t v27 = *((void *)v26 + 1);
  *(void *)uint64_t v25 = *(void *)v26;
  *((void *)v25 + 1) = v27;
  uint64_t v28 = a3[6];
  uint64_t v29 = (char *)a1 + v28;
  uint64_t v30 = (char *)a2 + v28;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v44(v29, v30, v45);
  uint64_t v31 = a3[7];
  uint64_t v32 = (void **)((char *)a1 + v31);
  long long v33 = (char *)a2 + v31;
  uint64_t v34 = *(uint64_t *)((char *)a2 + v31 + 8);
  void *v32 = *(void **)((char *)a2 + v31);
  v32[1] = v34;
  uint64_t v35 = *(uint64_t *)((char *)a2 + v31 + 24);
  _OWORD v32[2] = *(void **)((char *)a2 + v31 + 16);
  v32[3] = v35;
  uint64_t v36 = v42[6];
  long long v37 = (char *)v32 + v36;
  uint64_t v38 = &v33[v36];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v43(v37, v38, v16);
  *((unsigned char *)v32 + v42[7]) = v33[v42[7]];
  *(_OWORD *)((char *)v32 + v42[8]) = *(_OWORD *)&v33[v42[8]];
  return a1;
}

void **sub_2379661D0(void **a1, void **a2, int *a3)
{
  uint64_t v4 = *a2;
  uint64_t v6 = *a1;
  *a1 = *a2;
  id v8 = v4;

  uint64_t v9 = a3[5];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v46 = sub_23796E2A8();
  uint64_t v45 = *(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 24);
  v45(v10, v11, v46);
  uint64_t v12 = (int *)type metadata accessor for ChanceRainTemplateModel();
  uint64_t v13 = v12[5];
  uint64_t v14 = &v10[v13];
  uint64_t v15 = &v11[v13];
  *(void *)uint64_t v14 = *(void *)&v11[v13];
  *((void *)v14 + 1) = *(void *)&v11[v13 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v14 + 2) = *((void *)v15 + 2);
  *((void *)v14 + 3) = *((void *)v15 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = (int *)sub_23796E8C8();
  uint64_t v17 = v16[6];
  uint64_t v18 = &v14[v17];
  uint64_t v19 = &v15[v17];
  uint64_t v20 = sub_23796E358();
  uint64_t v21 = *(void (**)(char *, char *))(*(void *)(v20 - 8) + 24);
  uint64_t v22 = v18;
  uint64_t v23 = v20;
  v21(v22, v19);
  v14[v16[7]] = v15[v16[7]];
  uint64_t v24 = v16[8];
  uint64_t v25 = &v14[v24];
  uint64_t v26 = &v15[v24];
  *(void *)uint64_t v25 = *(void *)v26;
  *((void *)v25 + 1) = *((void *)v26 + 1);
  uint64_t v27 = v12[6];
  uint64_t v28 = &v10[v27];
  uint64_t v29 = &v11[v27];
  char v30 = v29[8];
  *(void *)uint64_t v28 = *(void *)v29;
  v28[8] = v30;
  uint64_t v31 = v12[7];
  uint64_t v32 = &v10[v31];
  long long v33 = &v11[v31];
  *(void *)uint64_t v32 = *(void *)v33;
  *((void *)v32 + 1) = *((void *)v33 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10[v12[8]] = v11[v12[8]];
  uint64_t v34 = v12[9];
  uint64_t v35 = &v10[v34];
  uint64_t v36 = &v11[v34];
  *(void *)uint64_t v35 = *(void *)v36;
  *((void *)v35 + 1) = *((void *)v36 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v45((char *)a1 + a3[6], (char *)a2 + a3[6], v46);
  uint64_t v37 = a3[7];
  uint64_t v38 = (void **)((char *)a1 + v37);
  uint64_t v39 = (char *)a2 + v37;
  *uint64_t v38 = *(void **)((char *)a2 + v37);
  v38[1] = *(void **)((char *)a2 + v37 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v38[2] = *((void *)v39 + 2);
  v38[3] = *((void *)v39 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  ((void (*)(char *, char *, uint64_t))v21)((char *)v38 + v16[6], &v39[v16[6]], v23);
  *((unsigned char *)v38 + v16[7]) = v39[v16[7]];
  uint64_t v40 = v16[8];
  long long v41 = (void *)((char *)v38 + v40);
  uint64_t v42 = &v39[v40];
  void *v41 = *(void *)v42;
  v41[1] = *((void *)v42 + 1);
  return a1;
}

char *sub_2379664A8(char *a1, char *a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = a3[5];
  uint64_t v4 = &a1[v3];
  uint64_t v5 = &a2[v3];
  uint64_t v29 = sub_23796E2A8();
  uint64_t v28 = *(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 32);
  v28(v4, v5, v29);
  uint64_t v6 = (int *)type metadata accessor for ChanceRainTemplateModel();
  uint64_t v7 = v6[5];
  id v8 = &v4[v7];
  uint64_t v9 = &v5[v7];
  long long v10 = *(_OWORD *)&v5[v7 + 16];
  *(_OWORD *)id v8 = *(_OWORD *)&v5[v7];
  *((_OWORD *)v8 + 1) = v10;
  uint64_t v11 = (int *)sub_23796E8C8();
  uint64_t v12 = v11[6];
  uint64_t v13 = &v8[v12];
  uint64_t v14 = &v9[v12];
  uint64_t v15 = sub_23796E358();
  uint64_t v16 = *(void (**)(char *, char *))(*(void *)(v15 - 8) + 32);
  uint64_t v17 = v13;
  uint64_t v18 = v15;
  v16(v17, v14);
  v8[v11[7]] = v9[v11[7]];
  *(_OWORD *)&v8[v11[8]] = *(_OWORD *)&v9[v11[8]];
  uint64_t v19 = v6[6];
  uint64_t v20 = &v4[v19];
  uint64_t v21 = &v5[v19];
  v20[8] = v21[8];
  *(void *)uint64_t v20 = *(void *)v21;
  *(_OWORD *)&v4[v6[7]] = *(_OWORD *)&v5[v6[7]];
  v4[v6[8]] = v5[v6[8]];
  *(_OWORD *)&v4[v6[9]] = *(_OWORD *)&v5[v6[9]];
  v28(&a1[a3[6]], &a2[a3[6]], v29);
  uint64_t v22 = a3[7];
  uint64_t v23 = &a1[v22];
  uint64_t v24 = &a2[v22];
  long long v25 = *(_OWORD *)&a2[v22 + 16];
  *(_OWORD *)uint64_t v23 = *(_OWORD *)&a2[v22];
  *((_OWORD *)v23 + 1) = v25;
  ((void (*)(char *, char *, uint64_t))v16)(&a1[v22 + v11[6]], &a2[v22 + v11[6]], v18);
  v23[v11[7]] = v24[v11[7]];
  *(_OWORD *)&v23[v11[8]] = *(_OWORD *)&v24[v11[8]];
  return a1;
}

void **sub_237966690(void **a1, void **a2, int *a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = a3[5];
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v45 = sub_23796E2A8();
  uint64_t v44 = *(void (**)(char *, char *, uint64_t))(*(void *)(v45 - 8) + 40);
  v44(v8, v9, v45);
  long long v10 = (int *)type metadata accessor for ChanceRainTemplateModel();
  uint64_t v11 = v10[5];
  uint64_t v12 = &v8[v11];
  uint64_t v13 = &v9[v11];
  uint64_t v14 = *(void *)&v9[v11 + 8];
  *(void *)uint64_t v12 = *(void *)&v9[v11];
  *((void *)v12 + 1) = v14;
  swift_bridgeObjectRelease();
  uint64_t v15 = *((void *)v13 + 3);
  *((void *)v12 + 2) = *((void *)v13 + 2);
  *((void *)v12 + 3) = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = (int *)sub_23796E8C8();
  uint64_t v17 = v16[6];
  uint64_t v18 = &v12[v17];
  uint64_t v19 = &v13[v17];
  uint64_t v20 = sub_23796E358();
  uint64_t v21 = *(void (**)(char *, char *))(*(void *)(v20 - 8) + 40);
  uint64_t v22 = v18;
  uint64_t v23 = v20;
  v21(v22, v19);
  v12[v16[7]] = v13[v16[7]];
  *(_OWORD *)&v12[v16[8]] = *(_OWORD *)&v13[v16[8]];
  uint64_t v24 = v10[6];
  long long v25 = &v8[v24];
  uint64_t v26 = &v9[v24];
  *(void *)long long v25 = *(void *)v26;
  v25[8] = v26[8];
  uint64_t v27 = v10[7];
  uint64_t v28 = &v8[v27];
  uint64_t v29 = &v9[v27];
  uint64_t v31 = *(void *)v29;
  uint64_t v30 = *((void *)v29 + 1);
  *(void *)uint64_t v28 = v31;
  *((void *)v28 + 1) = v30;
  swift_bridgeObjectRelease();
  v8[v10[8]] = v9[v10[8]];
  uint64_t v32 = v10[9];
  long long v33 = &v8[v32];
  uint64_t v34 = &v9[v32];
  uint64_t v36 = *(void *)v34;
  uint64_t v35 = *((void *)v34 + 1);
  *(void *)long long v33 = v36;
  *((void *)v33 + 1) = v35;
  swift_bridgeObjectRelease();
  v44((char *)a1 + a3[6], (char *)a2 + a3[6], v45);
  uint64_t v37 = a3[7];
  uint64_t v38 = (void **)((char *)a1 + v37);
  uint64_t v39 = (char *)a2 + v37;
  uint64_t v40 = *(uint64_t *)((char *)a2 + v37 + 8);
  *uint64_t v38 = *(void **)((char *)a2 + v37);
  v38[1] = v40;
  swift_bridgeObjectRelease();
  uint64_t v41 = *((void *)v39 + 3);
  v38[2] = *((void *)v39 + 2);
  v38[3] = v41;
  swift_bridgeObjectRelease();
  ((void (*)(char *, char *, uint64_t))v21)((char *)v38 + v16[6], &v39[v16[6]], v23);
  *((unsigned char *)v38 + v16[7]) = v39[v16[7]];
  *(_OWORD *)((char *)v38 + v16[8]) = *(_OWORD *)&v39[v16[8]];
  return a1;
}

uint64_t sub_2379668E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2379668F8);
}

uint64_t sub_2379668F8(char *a1, uint64_t a2, int *a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *(void *)a1;
    if (*(void *)a1 >= 0xFFFFFFFFuLL) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  uint64_t v8 = type metadata accessor for ChanceRainTemplateModel();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a2)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a3[5];
LABEL_9:
    uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
    return v13(&a1[v11], a2, v9);
  }
  uint64_t v12 = sub_23796E2A8();
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a3[6];
    goto LABEL_9;
  }
  uint64_t v14 = sub_23796E8C8();
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = &a1[a3[7]];

  return v15(v17, a2, v16);
}

uint64_t sub_237966A70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_237966A84);
}

char *sub_237966A84(char *result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)uint64_t result = (a2 - 1);
    return result;
  }
  uint64_t v8 = type metadata accessor for ChanceRainTemplateModel();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[5];
LABEL_7:
    uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return (char *)v13(&v5[v11], a2, a2, v9);
  }
  uint64_t v12 = sub_23796E2A8();
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[6];
    goto LABEL_7;
  }
  uint64_t v14 = sub_23796E8C8();
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  uint64_t v16 = v14;
  uint64_t v17 = &v5[a4[7]];

  return (char *)v15(v17, a2, a2, v16);
}

uint64_t sub_237966BFC()
{
  uint64_t result = type metadata accessor for ChanceRainTemplateModel();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_23796E2A8();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_23796E8C8();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_237966D10()
{
  return sub_237966E08(&qword_2689377A0, (void (*)(uint64_t))type metadata accessor for ChanceRainTemplateModel);
}

uint64_t sub_237966D58(uint64_t a1)
{
  uint64_t result = sub_237966E08((unint64_t *)&unk_268937688, (void (*)(uint64_t))type metadata accessor for ChanceRainRectangularTemplateModel);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_237966DB0(uint64_t a1)
{
  uint64_t result = sub_237966E08(&qword_268937970, (void (*)(uint64_t))type metadata accessor for ChanceRainRectangularTemplateModel);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_237966E08(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_237966E50()
{
  type metadata accessor for AQINonNumericalTemplateFormatter();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_237967A60(&qword_268937980, v1, (void (*)(uint64_t))type metadata accessor for AQINonNumericalTemplateFormatter);
  *(void *)&xmmword_268939510 = v0;
  *((void *)&xmmword_268939510 + 1) = result;
  return result;
}

uint64_t type metadata accessor for AQINonNumericalTemplateFormatter()
{
  return self;
}

uint64_t sub_237966EE4()
{
  return sub_237967A60(&qword_268937978, 255, (void (*)(uint64_t))type metadata accessor for AQINonNumericalTemplateModel);
}

id sub_237966F30()
{
  id v0 = sub_23795A1CC();
  type metadata accessor for AQINonNumericalTemplateModel();
  swift_bridgeObjectRetain();
  uint64_t v1 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(self, sel_symbolImageProviderWithSystemName_, v1);

  unint64_t v3 = self;
  id v4 = v2;
  id v5 = objc_msgSend(v3, sel_whiteColor);
  objc_msgSend(v4, sel_setTintColor_, v5);

  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD118]), sel_initWithImageProvider_, v4);
  return v6;
}

id sub_23796703C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AQINonNumericalTemplateModel();
  MEMORY[0x270FA5388](v2);
  id v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2379672C0(a1, (uint64_t)v4);
  id v5 = (void *)sub_237955398(&v4[*(int *)(v2 + 20)], v4[*(int *)(v2 + 44)]);
  id v6 = objc_msgSend(self, sel_systemCyanColor);
  objc_msgSend(v5, sel_setTintColor_, v6);

  sub_23795AFC4((uint64_t)v4);
  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v7 = (id)qword_268937660;
  uint64_t v8 = (void *)sub_23796EA68();
  uint64_t v9 = (void *)sub_23796EA68();
  id v10 = objc_msgSend(v7, sel_localizedStringForKey_value_table_, v8, 0, v9);

  sub_23796EA98();
  uint64_t v11 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  uint64_t v12 = self;
  id v13 = objc_msgSend(v12, sel_textProviderWithText_, v11);

  swift_bridgeObjectRetain();
  uint64_t v14 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(v12, sel_textProviderWithText_, v14);

  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD0F8]), sel_initWithHeaderTextProvider_body1TextProvider_body2TextProvider_, v5, v13, v15);
  return v16;
}

uint64_t sub_2379672C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AQINonNumericalTemplateModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id sub_237967324(uint64_t a1)
{
  return sub_237967940(a1, (Class *)0x263EFD160);
}

id sub_237967330(uint64_t a1)
{
  sub_237926638(0, (unint64_t *)&qword_2689373A0);
  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v2 = (id)qword_268937660;
  uint64_t v3 = (void *)sub_23796EA68();
  uint64_t v4 = (void *)sub_23796EA68();
  id v5 = objc_msgSend(v2, sel_localizedStringForKey_value_table_, v3, 0, v4);

  sub_23796EA98();
  sub_2379265BC((uint64_t *)&unk_268937390);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2379713F0;
  id v7 = (uint64_t *)(a1 + *(int *)(type metadata accessor for AQINonNumericalTemplateModel() + 28));
  uint64_t v9 = *v7;
  uint64_t v8 = v7[1];
  *(void *)(inited + 56) = MEMORY[0x263F8D310];
  *(void *)(inited + 64) = sub_23792918C();
  *(void *)(inited + 32) = v9;
  *(void *)(inited + 40) = v8;
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_23796EDF8();
  swift_setDeallocating();
  sub_2379265BC(&qword_2689373C0);
  swift_arrayDestroy();
  uint64_t ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  uint64_t v12 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(ObjCClassFromMetadata, sel_textProviderWithFormat_arguments_, v12, v10);

  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD138]), sel_initWithTextProvider_, v13);
  return v14;
}

id sub_237967560(uint64_t a1)
{
  return sub_237967940(a1, (Class *)0x263EFCFC0);
}

id sub_23796756C(uint64_t a1)
{
  return sub_237967940(a1, (Class *)0x263EFCFF0);
}

id sub_237967578(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *MEMORY[0x263EFCF40];
  uint64_t v5 = type metadata accessor for AQINonNumericalTemplateModel();
  unint64_t v6 = *(void *)(a2 + *(int *)(v5 + 36));
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_23796ED48();
  }
  else
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  if (v7 <= 1) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v7;
  }
  float v9 = (float)*(uint64_t *)(a2 + *(int *)(v5 + 32)) / (float)v8;
  if (v9 <= 0.0) {
    float v9 = 0.0;
  }
  float v10 = fminf(v9, 1.0);
  sub_237926638(0, (unint64_t *)&qword_268937340);
  uint64_t v11 = (void *)sub_23796EB08();
  swift_bridgeObjectRelease();
  uint64_t v12 = self;
  *(float *)&double v13 = v10;
  objc_msgSend(v12, sel_gaugeProviderWithStyle_gaugeColors_gaugeColorLocations_fillFraction_, v4, v11, 0, v13);

  if (qword_2689370E0 != -1) {
    swift_once();
  }
  id v14 = (id)qword_268937660;
  id v15 = (void *)sub_23796EA68();
  id v16 = (void *)sub_23796EA68();
  id v17 = objc_msgSend(v14, sel_localizedStringForKey_value_table_, v15, 0, v16);

  sub_23796EA98();
  uint64_t v18 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v19 = objc_msgSend(self, sel_textProviderWithText_, v18);

  id v20 = v19;
  id v21 = sub_23795A1CC();
  objc_msgSend(v20, sel_setTintColor_, v21);

  swift_bridgeObjectRetain();
  uint64_t v22 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v23 = objc_msgSend(self, sel_symbolImageProviderWithSystemName_, v22);

  id v24 = sub_23795A1CC();
  objc_msgSend(v23, sel_setTintColor_, v24);

  id v25 = objc_msgSend(self, sel_currentDevice);
  if (v25)
  {
    uint64_t v26 = v25;
    id v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD188]), sel_initWithDevice_identitySizeClass_, v25, 2);
    objc_msgSend(v26, sel_screenScale);
    objc_msgSend(v27, sel_scaledValue_, 26.0 / v28);
    double v30 = v29;
    if (a1 == 12)
    {
      CLKComplicationGraphicExtraLargeCircularScalingFactor();
      double v30 = v30 * v31;
    }
    id v32 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v30);
    objc_msgSend(v23, sel_setOverridePointSize_, v32);
  }
  return v20;
}

id sub_237967934(uint64_t a1)
{
  return sub_237967940(a1, (Class *)0x263EFCFA0);
}

id sub_237967940(uint64_t a1, Class *a2)
{
  uint64_t v3 = self;
  id v4 = objc_msgSend(v3, sel_whiteColor);
  type metadata accessor for AQINonNumericalTemplateModel();
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)sub_23796EA68();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(self, sel_symbolImageProviderWithSystemName_, v5);

  id v7 = v6;
  id v8 = objc_msgSend(v3, sel_whiteColor);
  objc_msgSend(v7, sel_setTintColor_, v8);

  id v9 = objc_msgSend(objc_allocWithZone(*a2), sel_initWithImageProvider_, v7);
  return v9;
}

uint64_t sub_237967A60(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_237967AA8@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v289 = a1;
  v276 = a2;
  uint64_t v2 = 0;
  uint64_t v3 = sub_2379265BC(&qword_268937988);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v219 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v236 = sub_23796E598();
  uint64_t v299 = *(void *)(v236 - 8);
  MEMORY[0x270FA5388](v236);
  id v7 = (char *)&v219 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2379265BC(&qword_268937990);
  MEMORY[0x270FA5388](v8 - 8);
  v242 = (char *)&v219 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v243 = sub_23796E568();
  uint64_t v10 = *(void *)(v243 - 8);
  MEMORY[0x270FA5388](v243);
  v238 = (char *)&v219 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2379265BC(&qword_2689374A0);
  MEMORY[0x270FA5388](v12 - 8);
  v256 = (char *)&v219 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v258 = sub_2379265BC(&qword_2689374A8);
  uint64_t v14 = *(void *)(v258 - 8);
  MEMORY[0x270FA5388](v258);
  v255 = (char *)&v219 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_2379265BC(&qword_268937768);
  MEMORY[0x270FA5388](v16 - 8);
  v267 = (char *)&v219 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v268 = sub_23796E648();
  uint64_t v18 = *(void *)(v268 - 8);
  MEMORY[0x270FA5388](v268);
  v266 = (char *)&v219 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_2379265BC(&qword_268937998);
  MEMORY[0x270FA5388](v20 - 8);
  v274 = (char *)&v219 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_2379265BC(&qword_268937600);
  MEMORY[0x270FA5388](v22 - 8);
  v265 = (char *)&v219 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_2379265BC(&qword_2689379A0);
  MEMORY[0x270FA5388](v24 - 8);
  v284 = (char *)&v219 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_2379265BC(&qword_268937508);
  MEMORY[0x270FA5388](v26 - 8);
  v273 = (char *)&v219 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v286 = sub_2379265BC(&qword_268937520);
  uint64_t v285 = *(void *)(v286 - 8);
  uint64_t v28 = MEMORY[0x270FA5388](v286);
  v260 = (char *)&v219 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  v259 = (char *)&v219 - v31;
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  uint64_t v237 = (uint64_t)&v219 - v33;
  uint64_t v34 = MEMORY[0x270FA5388](v32);
  uint64_t v254 = (uint64_t)&v219 - v35;
  uint64_t v36 = MEMORY[0x270FA5388](v34);
  uint64_t v264 = (uint64_t)&v219 - v37;
  uint64_t v38 = MEMORY[0x270FA5388](v36);
  uint64_t v253 = (uint64_t)&v219 - v39;
  uint64_t v40 = MEMORY[0x270FA5388](v38);
  uint64_t v263 = (uint64_t)&v219 - v41;
  MEMORY[0x270FA5388](v40);
  uint64_t v282 = (uint64_t)&v219 - v42;
  uint64_t v43 = sub_2379265BC(&qword_268937238);
  MEMORY[0x270FA5388](v43 - 8);
  v288 = (char *)&v219 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_2379265BC(&qword_268937470);
  uint64_t v46 = MEMORY[0x270FA5388](v45 - 8);
  v272 = (char *)&v219 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = MEMORY[0x270FA5388](v46);
  v281 = (char *)&v219 - v49;
  MEMORY[0x270FA5388](v48);
  v287 = (char *)&v219 - v50;
  uint64_t v298 = sub_23796E2A8();
  uint64_t v51 = *(void *)(v298 - 8);
  uint64_t v52 = MEMORY[0x270FA5388](v298);
  v235 = (char *)&v219 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = MEMORY[0x270FA5388](v52);
  v241 = (char *)&v219 - v55;
  uint64_t v56 = MEMORY[0x270FA5388](v54);
  v262 = (char *)&v219 - v57;
  uint64_t v58 = MEMORY[0x270FA5388](v56);
  v252 = (char *)&v219 - v59;
  uint64_t v60 = MEMORY[0x270FA5388](v58);
  v251 = (char *)&v219 - v61;
  uint64_t v62 = MEMORY[0x270FA5388](v60);
  v250 = (char *)&v219 - v63;
  uint64_t v64 = MEMORY[0x270FA5388](v62);
  v261 = (char *)&v219 - v65;
  MEMORY[0x270FA5388](v64);
  v280 = (char *)&v219 - v66;
  uint64_t v67 = sub_23796E6D8();
  uint64_t v68 = *(void *)(v67 - 8);
  uint64_t v69 = MEMORY[0x270FA5388](v67);
  v234 = (char *)&v219 - ((v70 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = MEMORY[0x270FA5388](v69);
  v240 = (char *)&v219 - v72;
  uint64_t v73 = MEMORY[0x270FA5388](v71);
  v249 = (char *)&v219 - v74;
  uint64_t v75 = MEMORY[0x270FA5388](v73);
  v239 = (char *)&v219 - v76;
  uint64_t v77 = MEMORY[0x270FA5388](v75);
  v248 = (char *)&v219 - v78;
  uint64_t v79 = MEMORY[0x270FA5388](v77);
  v271 = (char *)&v219 - v80;
  uint64_t v81 = MEMORY[0x270FA5388](v79);
  v296 = (char *)&v219 - v82;
  uint64_t v83 = MEMORY[0x270FA5388](v81);
  v292 = (char *)&v219 - v84;
  MEMORY[0x270FA5388](v83);
  v294 = (char *)&v219 - v85;
  uint64_t v86 = *(void *)sub_23796E668();
  uint64_t v87 = *(void *)(v86 + 16);
  uint64_t v270 = v51;
  uint64_t v269 = v68;
  if (v87)
  {
    v224 = v7;
    uint64_t v257 = 0;
    v247 = v5;
    uint64_t v88 = *(void (**)(void, void, void))(v68 + 16);
    uint64_t v89 = v86 + ((*(unsigned __int8 *)(v68 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v68 + 80));
    v300 = (char *)(v68 + 8);
    uint64_t v225 = v10 + 16;
    v230 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    v226 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    v223 = (void (**)(char *, uint64_t, uint64_t))(v10 + 32);
    v222 = (void (**)(char *, uint64_t))(v299 + 8);
    v279 = (void (**)(void))(v68 + 32);
    v277 = (void (**)(char *, char *, uint64_t))(v51 + 32);
    uint64_t v227 = v10;
    v221 = (void (**)(char *, uint64_t))(v10 + 8);
    v233 = (unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
    v229 = (void (**)(char *, char *, uint64_t))(v14 + 32);
    v228 = (void (**)(char *, uint64_t))(v14 + 8);
    id v90 = v88;
    v245 = (unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
    v232 = (void (**)(char *, uint64_t, uint64_t))(v18 + 32);
    v275 = (void (**)(uint64_t, char *, uint64_t))(v51 + 16);
    v278 = (void (**)(char *, uint64_t))(v51 + 8);
    v231 = (void (**)(char *, uint64_t))(v18 + 8);
    v293 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v51 + 56);
    v283 = (unsigned int (**)(char *, uint64_t, uint64_t))(v51 + 48);
    uint64_t v299 = *(void *)(v68 + 72);
    uint64_t v246 = v86;
    swift_bridgeObjectRetain();
    v291 = (void *)MEMORY[0x263F8EE78];
    id v91 = v292;
    id v92 = v294;
    uint64_t v297 = v68 + 16;
    v295 = v90;
    while (1)
    {
      v90(v92, v89, v67);
      sub_23796A140((unint64_t *)&qword_268937488);
      if (sub_23796EC78()) {
        break;
      }
      (*(void (**)(char *, uint64_t))v300)(v92, v67);
LABEL_4:
      v89 += v299;
      if (!--v87)
      {
        swift_bridgeObjectRelease();
        uint64_t v5 = v247;
        uint64_t v2 = v257;
        v202 = v291;
        uint64_t v203 = v285;
        goto LABEL_89;
      }
    }
    v90(v91, v92, v67);
    uint64_t v93 = v296;
    sub_23796E6C8();
    sub_23796A140(&qword_2689379A8);
    char v94 = sub_23796EA58();
    uint64_t v95 = *(void (**)(char *, uint64_t))v300;
    (*(void (**)(char *, uint64_t))v300)(v93, v67);
    if (v94)
    {
      v95(v91, v67);
      id v96 = v288;
      sub_23796E4A8();
      uint64_t v97 = (uint64_t)v96;
      uint64_t v98 = sub_23796E548();
      uint64_t v99 = *(void *)(v98 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v99 + 48))(v97, 1, v98) == 1)
      {
        sub_23792673C(v97, &qword_268937238);
        id v100 = v287;
        (*v293)(v287, 1, 1, v298);
      }
      else
      {
        id v105 = v287;
        sub_23796E8F8();
        (*(void (**)(uint64_t, uint64_t))(v99 + 8))(v97, v98);
        uint64_t v106 = v298;
        (*v293)(v105, 0, 1, v298);
        uint64_t v107 = v106;
        id v100 = v105;
        id v91 = v292;
        if ((*v283)(v105, 1, v107) != 1)
        {
          long long v117 = v280;
          uint64_t v118 = v298;
          (*v277)(v280, v105, v298);
          sub_23796E6C8();
          uint64_t v119 = v282 + *(int *)(v286 + 48);
          (*v279)();
          (*v275)(v119, v117, v118);
          unint64_t v120 = (unint64_t)v291;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v120 = sub_237933B64(0, *(void *)(v120 + 16) + 1, 1, v120);
          }
          unint64_t v122 = *(void *)(v120 + 16);
          unint64_t v121 = *(void *)(v120 + 24);
          v291 = (void *)v120;
          id v92 = v294;
          id v91 = v292;
          if (v122 >= v121 >> 1) {
            v291 = (void *)sub_237933B64(v121 > 1, v122 + 1, 1, (unint64_t)v291);
          }
          unint64_t v123 = (unint64_t)v291;
          v291[2] = v122 + 1;
          sub_23796A184(v282, v123+ ((*(unsigned __int8 *)(v285 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v285 + 80))+ *(void *)(v285 + 72) * v122);
          uint64_t v124 = *v278;
          uint64_t v125 = (void (***)(char *, uint64_t, uint64_t, uint64_t))&v303;
          goto LABEL_25;
        }
      }
      id v92 = v294;
      v95(v294, v67);
      uint64_t v108 = (uint64_t)v100;
      uint64_t v109 = &qword_268937470;
      goto LABEL_14;
    }
    sub_23796E6A8();
    char v101 = sub_23796EA58();
    v95(v93, v67);
    if (v101)
    {
      v290 = v95;
      v95(v91, v67);
      uint64_t v102 = (uint64_t)v284;
      sub_23796E4D8();
      uint64_t v103 = sub_2379265BC(&qword_2689379C8);
      uint64_t v104 = *(void *)(v103 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v104 + 48))(v102, 1, v103) == 1)
      {
        sub_23792673C(v102, &qword_2689379A0);
        uint64_t v95 = v290;
      }
      else
      {
        sub_237950218(&qword_2689379D0, &qword_2689379C8);
        if (sub_23796EB98())
        {
          uint64_t v114 = sub_23796E448();
          uint64_t v115 = (uint64_t)v273;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v114 - 8) + 56))(v273, 1, 1, v114);
          long long v116 = (char *)v102;
        }
        else
        {
          sub_23796EBA8();
          sub_237950218(&qword_2689379D8, &qword_2689379C8);
          sub_23796EA38();
          uint64_t v135 = (void (*)(void **, void))sub_23796EBB8();
          v244 = v136;
          uint64_t v114 = sub_23796E448();
          uint64_t v137 = *(void *)(v114 - 8);
          uint64_t v115 = (uint64_t)v273;
          (*(void (**)(char *, void (*)(void **, void), uint64_t))(v137 + 16))(v273, v244, v114);
          v135(&v301, 0);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v137 + 56))(v115, 0, 1, v114);
          long long v116 = v284;
        }
        (*(void (**)(char *, uint64_t))(v104 + 8))(v116, v103);
        sub_23796E448();
        uint64_t v138 = *(void *)(v114 - 8);
        uint64_t v139 = v115;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v138 + 48))(v115, 1, v114) != 1)
        {
          uint64_t v145 = v281;
          sub_23796E408();
          (*(void (**)(uint64_t, uint64_t))(v138 + 8))(v139, v114);
          uint64_t v146 = v298;
          (*v293)(v145, 0, 1, v298);
          uint64_t v147 = v146;
          uint64_t v148 = (uint64_t)v145;
          unsigned int v149 = (*v283)(v145, 1, v147);
          uint64_t v95 = v290;
          id v92 = v294;
          id v91 = v292;
          if (v149 != 1)
          {
            uint64_t v150 = *v277;
            uint64_t v151 = v298;
            (*v277)(v261, (char *)v148, v298);
            sub_23796E6A8();
            long long v152 = v250;
            sub_23796E278();
            uint64_t v153 = (char *)(v263 + *(int *)(v286 + 48));
            (*v279)();
            v150(v153, v152, v151);
            unint64_t v154 = (unint64_t)v291;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              unint64_t v154 = sub_237933B64(0, *(void *)(v154 + 16) + 1, 1, v154);
            }
            unint64_t v156 = *(void *)(v154 + 16);
            unint64_t v155 = *(void *)(v154 + 24);
            v291 = (void *)v154;
            id v91 = v292;
            id v92 = v294;
            uint64_t v95 = v290;
            if (v156 >= v155 >> 1) {
              v291 = (void *)sub_237933B64(v155 > 1, v156 + 1, 1, (unint64_t)v291);
            }
            unint64_t v157 = (unint64_t)v291;
            v291[2] = v156 + 1;
            sub_23796A184(v263, v157+ ((*(unsigned __int8 *)(v285 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v285 + 80))+ *(void *)(v285 + 72) * v156);
            uint64_t v124 = *v278;
            uint64_t v125 = &v293;
LABEL_25:
            unint64_t v126 = (char *)*(v125 - 32);
            uint64_t v127 = v298;
LABEL_73:
            v124(v126, v127);
            v95(v92, v67);
LABEL_74:
            id v90 = v295;
            goto LABEL_4;
          }
          goto LABEL_54;
        }
        sub_23792673C(v115, &qword_268937508);
        uint64_t v95 = v290;
        id v92 = v294;
        id v91 = v292;
      }
      uint64_t v140 = *v293;
      uint64_t v141 = &v304;
    }
    else
    {
      sub_23796E688();
      char v110 = sub_23796EA58();
      v95(v93, v67);
      if ((v110 & 1) == 0)
      {
        sub_23796E678();
        char v128 = sub_23796EA58();
        v95(v93, v67);
        if (v128)
        {
          v95(v91, v67);
          uint64_t v129 = v267;
          sub_23796E4B8();
          uint64_t v130 = (uint64_t)v129;
          uint64_t v131 = v129;
          uint64_t v132 = v268;
          if ((*v245)(v131, 1, v268) == 1)
          {
            v95(v92, v67);
            uint64_t v108 = v130;
            uint64_t v109 = &qword_268937768;
LABEL_14:
            sub_23792673C(v108, v109);
            goto LABEL_74;
          }
          (*v232)(v266, v130, v132);
          uint64_t v158 = v262;
          sub_23796E8F8();
          sub_23796E678();
          uint64_t v159 = v264 + *(int *)(v286 + 48);
          (*v279)();
          (*v275)(v159, v158, v298);
          unint64_t v160 = (unint64_t)v291;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v160 = sub_237933B64(0, *(void *)(v160 + 16) + 1, 1, v160);
          }
          unint64_t v162 = *(void *)(v160 + 16);
          unint64_t v161 = *(void *)(v160 + 24);
          v291 = (void *)v160;
          id v91 = v292;
          id v92 = v294;
          if (v162 >= v161 >> 1) {
            v291 = (void *)sub_237933B64(v161 > 1, v162 + 1, 1, (unint64_t)v291);
          }
          unint64_t v163 = (unint64_t)v291;
          v291[2] = v162 + 1;
          sub_23796A184(v264, v163+ ((*(unsigned __int8 *)(v285 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v285 + 80))+ *(void *)(v285 + 72) * v162);
          (*v278)(v262, v298);
          uint64_t v124 = *v231;
          unint64_t v126 = v266;
          v164 = &v299;
        }
        else
        {
          sub_23796E6B8();
          char v142 = sub_23796EA58();
          v95(v93, v67);
          if (v142)
          {
            v95(v91, v67);
            uint64_t v143 = v256;
            sub_23796E4E8();
            uint64_t v144 = v258;
            if ((*v233)(v143, 1, v258) == 1)
            {
              v95(v92, v67);
              uint64_t v108 = (uint64_t)v143;
              uint64_t v109 = &qword_2689374A0;
              goto LABEL_14;
            }
            (*v229)(v255, v143, v144);
            sub_23796E6B8();
            v189 = v241;
            sub_23796E8F8();
            v190 = (char *)(v254 + *(int *)(v286 + 48));
            (*v279)();
            (*v277)(v190, v189, v298);
            unint64_t v191 = (unint64_t)v291;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              unint64_t v191 = sub_237933B64(0, *(void *)(v191 + 16) + 1, 1, v191);
            }
            unint64_t v193 = *(void *)(v191 + 16);
            unint64_t v192 = *(void *)(v191 + 24);
            v291 = (void *)v191;
            id v92 = v294;
            id v91 = v292;
            if (v193 >= v192 >> 1) {
              v291 = (void *)sub_237933B64(v192 > 1, v193 + 1, 1, (unint64_t)v291);
            }
            unint64_t v194 = (unint64_t)v291;
            v291[2] = v193 + 1;
            sub_23796A184(v254, v194+ ((*(unsigned __int8 *)(v285 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v285 + 80))+ *(void *)(v285 + 72) * v193);
            uint64_t v124 = *v228;
            unint64_t v126 = v255;
            v164 = (uint64_t *)&v290;
          }
          else
          {
            sub_23796E698();
            char v169 = sub_23796EA58();
            v95(v93, v67);
            if ((v169 & 1) == 0)
            {
              v95(v91, v67);
              v95(v92, v67);
              goto LABEL_74;
            }
            v170 = (void *)sub_23796E4F8();
            if (!v170)
            {
              v95(v91, v67);
LABEL_77:
              uint64_t v173 = (uint64_t)v242;
              (*v230)(v242, 1, 1, v243);
LABEL_81:
              id v90 = v295;
              v95(v92, v67);
              sub_23792673C(v173, &qword_268937990);
              goto LABEL_4;
            }
            v301 = v170;
            swift_bridgeObjectRetain();
            uint64_t v171 = v257;
            sub_23796A1EC(&v301);
            uint64_t v257 = v171;
            if (v171) {
              goto LABEL_96;
            }
            swift_bridgeObjectRelease();
            v172 = v301;
            v95(v91, v67);
            if (!v172) {
              goto LABEL_77;
            }
            if (v172[2])
            {
              uint64_t v173 = (uint64_t)v242;
              uint64_t v174 = v243;
              (*(void (**)(char *, unint64_t, uint64_t))(v227 + 16))(v242, (unint64_t)v172+ ((*(unsigned __int8 *)(v227 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v227 + 80)), v243);
              uint64_t v175 = 0;
            }
            else
            {
              uint64_t v175 = 1;
              uint64_t v173 = (uint64_t)v242;
              uint64_t v174 = v243;
            }
            (*v230)((char *)v173, v175, 1, v174);
            swift_bridgeObjectRelease();
            if ((*v226)(v173, 1, v174) == 1)
            {
              id v92 = v294;
              goto LABEL_81;
            }
            (*v223)(v238, v173, v174);
            sub_23796E698();
            v195 = v224;
            sub_23796E558();
            v196 = v235;
            sub_23796E578();
            (*v222)(v195, v236);
            v197 = (char *)(v237 + *(int *)(v286 + 48));
            (*v279)();
            (*v277)(v197, v196, v298);
            unint64_t v198 = (unint64_t)v291;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              unint64_t v198 = sub_237933B64(0, *(void *)(v198 + 16) + 1, 1, v198);
            }
            unint64_t v200 = *(void *)(v198 + 16);
            unint64_t v199 = *(void *)(v198 + 24);
            v291 = (void *)v198;
            id v92 = v294;
            id v91 = v292;
            if (v200 >= v199 >> 1) {
              v291 = (void *)sub_237933B64(v199 > 1, v200 + 1, 1, (unint64_t)v291);
            }
            unint64_t v201 = (unint64_t)v291;
            v291[2] = v200 + 1;
            sub_23796A184(v237, v201+ ((*(unsigned __int8 *)(v285 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v285 + 80))+ *(void *)(v285 + 72) * v200);
            uint64_t v124 = *v221;
            unint64_t v126 = v238;
            v164 = (uint64_t *)&v275;
          }
        }
        uint64_t v127 = *(v164 - 32);
        goto LABEL_73;
      }
      v95(v91, v67);
      uint64_t v111 = (uint64_t)v274;
      sub_23796E4C8();
      uint64_t v112 = sub_2379265BC(&qword_2689379B0);
      uint64_t v113 = *(void *)(v112 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v113 + 48))(v111, 1, v112) == 1)
      {
        sub_23792673C(v111, &qword_268937998);
        id v91 = v292;
      }
      else
      {
        v290 = v95;
        sub_237950218(&qword_2689379B8, &qword_2689379B0);
        if (sub_23796EB98())
        {
          uint64_t v133 = sub_23796E3A8();
          uint64_t v134 = (uint64_t)v265;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v133 - 8) + 56))(v265, 1, 1, v133);
        }
        else
        {
          sub_23796EBA8();
          sub_237950218(&qword_2689379C0, &qword_2689379B0);
          sub_23796EA38();
          v244 = (void (*)(void **, void))sub_23796EBB8();
          uint64_t v220 = v165;
          uint64_t v133 = sub_23796E3A8();
          uint64_t v166 = v111;
          uint64_t v167 = *(void *)(v133 - 8);
          uint64_t v134 = (uint64_t)v265;
          (*(void (**)(char *, uint64_t, uint64_t))(v167 + 16))(v265, v220, v133);
          v244(&v301, 0);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v167 + 56))(v134, 0, 1, v133);
          uint64_t v111 = v166;
        }
        id v91 = v292;
        (*(void (**)(uint64_t, uint64_t))(v113 + 8))(v111, v112);
        sub_23796E3A8();
        uint64_t v168 = *(void *)(v133 - 8);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v168 + 48))(v134, 1, v133) != 1)
        {
          v176 = v272;
          sub_23796E388();
          (*(void (**)(uint64_t, uint64_t))(v168 + 8))(v134, v133);
          uint64_t v177 = v298;
          (*v293)(v176, 0, 1, v298);
          uint64_t v178 = v177;
          uint64_t v148 = (uint64_t)v176;
          unsigned int v179 = (*v283)(v176, 1, v178);
          uint64_t v95 = v290;
          id v92 = v294;
          if (v179 != 1)
          {
            uint64_t v180 = v298;
            (*v277)(v251, (char *)v148, v298);
            v181 = v252;
            sub_23796E218();
            sub_23796E688();
            uint64_t v182 = v253 + *(int *)(v286 + 48);
            (*v279)();
            (*v275)(v182, v181, v180);
            unint64_t v183 = (unint64_t)v291;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              unint64_t v183 = sub_237933B64(0, *(void *)(v183 + 16) + 1, 1, v183);
            }
            unint64_t v185 = *(void *)(v183 + 16);
            unint64_t v184 = *(void *)(v183 + 24);
            v291 = (void *)v183;
            id v91 = v292;
            id v92 = v294;
            if (v185 >= v184 >> 1) {
              v291 = (void *)sub_237933B64(v184 > 1, v185 + 1, 1, (unint64_t)v291);
            }
            unint64_t v186 = (unint64_t)v291;
            v291[2] = v185 + 1;
            sub_23796A184(v253, v186+ ((*(unsigned __int8 *)(v285 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v285 + 80))+ *(void *)(v285 + 72) * v185);
            v187 = *v278;
            uint64_t v188 = v298;
            (*v278)(v252, v298);
            v187(v251, v188);
            v290(v92, v67);
            goto LABEL_74;
          }
          goto LABEL_54;
        }
        sub_23792673C(v134, &qword_268937600);
        uint64_t v95 = v290;
        id v92 = v294;
      }
      uint64_t v140 = *v293;
      uint64_t v141 = (uint64_t *)&v302;
    }
    uint64_t v148 = *(v141 - 32);
    v140((char *)v148, 1, 1, v298);
LABEL_54:
    v95(v92, v67);
    sub_23792673C(v148, &qword_268937470);
    id v90 = v295;
    goto LABEL_4;
  }
  v202 = (void *)MEMORY[0x263F8EE78];
  uint64_t v203 = v285;
LABEL_89:
  v301 = v202;
  swift_bridgeObjectRetain_n();
  sub_23796A02C(&v301);
  uint64_t v204 = v286;
  uint64_t v205 = v270;
  uint64_t v206 = v269;
  if (v2)
  {
LABEL_96:
    uint64_t result = swift_release();
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    if (v301[2])
    {
      sub_23796A0D8((uint64_t)v301 + ((*(unsigned __int8 *)(v203 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v203 + 80)), (uint64_t)v5);
      uint64_t v207 = 0;
    }
    else
    {
      uint64_t v207 = 1;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v203 + 56))(v5, v207, 1, v204);
    swift_release();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v203 + 48))(v5, 1, v204) == 1)
    {
      sub_23792673C((uint64_t)v5, &qword_268937988);
      return sub_23796E298();
    }
    else
    {
      uint64_t v209 = *(int *)(v204 + 48);
      v210 = v259;
      v211 = &v259[v209];
      v300 = &v259[v209];
      v212 = &v5[v209];
      v213 = *(void (**)(char *, char *, uint64_t))(v206 + 32);
      v213(v259, v5, v67);
      v214 = *(void (**)(char *, char *, uint64_t))(v205 + 32);
      uint64_t v215 = v298;
      v214(v211, v212, v298);
      uint64_t v216 = *(int *)(v204 + 48);
      v217 = v260;
      v218 = &v260[v216];
      v213(v260, v210, v67);
      v214(v218, v300, v215);
      v214(v276, v218, v215);
      return (*(uint64_t (**)(char *, uint64_t))(v206 + 8))(v217, v67);
    }
  }
  return result;
}

uint64_t sub_23796A02C(void **a1)
{
  uint64_t v2 = *(void *)(sub_2379265BC(&qword_268937520) - 8);
  uint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = (void *)sub_23796D920(v3);
  }
  uint64_t v4 = v3[2];
  v6[0] = (char *)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  uint64_t result = sub_23796A294(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_23796A0D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2379265BC(&qword_268937520);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23796A140(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_23796E6D8();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23796A184(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2379265BC(&qword_268937520);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23796A1EC(void **a1)
{
  uint64_t v2 = *(void *)(sub_23796E568() - 8);
  uint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = (void *)sub_23796D934(v3);
  }
  uint64_t v4 = v3[2];
  v6[0] = (char *)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  uint64_t result = sub_23796ACB0(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_23796A294(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v134 = sub_2379265BC(&qword_268937520);
  uint64_t v127 = *(void *)(v134 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v134);
  uint64_t v124 = (uint64_t)&v120 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v135 = (uint64_t)&v120 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v132 = (uint64_t)&v120 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v131 = (uint64_t)&v120 - v10;
  uint64_t v11 = a1[1];
  uint64_t result = sub_23796EDA8();
  if (result >= v11)
  {
    if (v11 < 0) {
      goto LABEL_140;
    }
    if (v11) {
      return sub_23796BC10(0, v11, 1, a1);
    }
    return result;
  }
  if (v11 >= 0) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v11 + 1;
  }
  if (v11 < -1) {
    goto LABEL_148;
  }
  uint64_t v133 = a1;
  uint64_t v122 = result;
  if (v11 < 2)
  {
    uint64_t v17 = (char *)MEMORY[0x263F8EE78];
    unint64_t v126 = MEMORY[0x263F8EE78]
         + ((*(unsigned __int8 *)(v127 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v127 + 80));
    uint64_t v121 = MEMORY[0x263F8EE78];
    if (v11 != 1)
    {
      unint64_t v19 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_106:
      if (v19 >= 2)
      {
        uint64_t v112 = *v133;
        do
        {
          unint64_t v113 = v19 - 2;
          if (v19 < 2) {
            goto LABEL_135;
          }
          if (!v112) {
            goto LABEL_147;
          }
          uint64_t v114 = v17;
          uint64_t v115 = v17 + 32;
          uint64_t v116 = *(void *)&v17[16 * v113 + 32];
          uint64_t v117 = *(void *)&v17[16 * v19 + 24];
          sub_23796C380(v112 + *(void *)(v127 + 72) * v116, v112 + *(void *)(v127 + 72) * *(void *)&v115[16 * v19 - 16], v112 + *(void *)(v127 + 72) * v117, v126);
          if (v2) {
            break;
          }
          if (v117 < v116) {
            goto LABEL_136;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v114 = sub_23796D484((uint64_t)v114);
          }
          if (v113 >= *((void *)v114 + 2)) {
            goto LABEL_137;
          }
          uint64_t v118 = &v114[16 * v113 + 32];
          *(void *)uint64_t v118 = v116;
          *((void *)v118 + 1) = v117;
          unint64_t v119 = *((void *)v114 + 2);
          if (v19 > v119) {
            goto LABEL_138;
          }
          uint64_t v17 = v114;
          memmove(&v114[16 * v19 + 16], &v114[16 * v19 + 32], 16 * (v119 - v19));
          *((void *)v114 + 2) = v119 - 1;
          unint64_t v19 = v119 - 1;
        }
        while (v119 > 2);
      }
LABEL_117:
      swift_bridgeObjectRelease();
      *(void *)(v121 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v14 = v13 >> 1;
    uint64_t v15 = sub_23796EB48();
    *(void *)(v15 + 16) = v14;
    uint64_t v16 = *(unsigned __int8 *)(v127 + 80);
    uint64_t v121 = v15;
    unint64_t v126 = v15 + ((v16 + 32) & ~v16);
  }
  uint64_t v18 = 0;
  uint64_t v17 = (char *)MEMORY[0x263F8EE78];
  while (1)
  {
    uint64_t v20 = v18;
    uint64_t v21 = v18 + 1;
    uint64_t v125 = v18;
    if (v18 + 1 >= v11)
    {
      ++v18;
      goto LABEL_24;
    }
    uint64_t v22 = *v133;
    uint64_t v23 = *(void *)(v127 + 72);
    uint64_t v24 = v131;
    sub_23796A0D8(*v133 + v23 * v21, v131);
    uint64_t v25 = v22 + v23 * v18;
    uint64_t v26 = v132;
    sub_23796A0D8(v25, v132);
    LODWORD(v130) = sub_23796E238();
    sub_23792673C(v26, &qword_268937520);
    sub_23792673C(v24, &qword_268937520);
    uint64_t v18 = v20 + 2;
    uint64_t v129 = v22;
    uint64_t v136 = v23;
    if (v20 + 2 >= v11) {
      goto LABEL_21;
    }
    uint64_t v128 = v2;
    uint64_t v27 = v17;
    uint64_t v28 = v23 * v21;
    uint64_t v29 = v20 + 2;
    uint64_t v30 = v23 * v29;
    do
    {
      uint64_t v31 = v11;
      uint64_t v32 = v131;
      sub_23796A0D8(v22 + v30, v131);
      uint64_t v33 = v132;
      sub_23796A0D8(v22 + v28, v132);
      int v34 = sub_23796E238();
      sub_23792673C(v33, &qword_268937520);
      sub_23792673C(v32, &qword_268937520);
      if ((v130 ^ v34))
      {
        uint64_t v17 = v27;
        uint64_t v18 = v29;
        uint64_t v2 = v128;
        uint64_t v20 = v125;
        uint64_t v11 = v31;
        if (v130) {
          goto LABEL_42;
        }
        goto LABEL_24;
      }
      v22 += v136;
      ++v29;
      uint64_t v11 = v31;
    }
    while (v31 != v29);
    uint64_t v17 = v27;
    uint64_t v18 = v31;
    uint64_t v2 = v128;
    uint64_t v20 = v125;
LABEL_21:
    if ((v130 & 1) == 0) {
      goto LABEL_24;
    }
LABEL_42:
    uint64_t v52 = v136;
    if (v18 < v20) {
      goto LABEL_141;
    }
    if (v20 < v18) {
      break;
    }
LABEL_24:
    uint64_t v35 = v133;
    if (v18 < v11) {
      goto LABEL_25;
    }
LABEL_57:
    if (v18 < v20) {
      goto LABEL_134;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v17 = sub_23796D104(0, *((void *)v17 + 2) + 1, 1, v17);
    }
    unint64_t v61 = *((void *)v17 + 2);
    unint64_t v60 = *((void *)v17 + 3);
    unint64_t v19 = v61 + 1;
    if (v61 >= v60 >> 1) {
      uint64_t v17 = sub_23796D104((char *)(v60 > 1), v61 + 1, 1, v17);
    }
    uint64_t v128 = v2;
    *((void *)v17 + 2) = v19;
    uint64_t v62 = v17 + 32;
    uint64_t v63 = &v17[16 * v61 + 32];
    *(void *)uint64_t v63 = v20;
    *((void *)v63 + 1) = v18;
    if (v61)
    {
      while (1)
      {
        unint64_t v64 = v19 - 1;
        if (v19 >= 4)
        {
          uint64_t v69 = &v62[16 * v19];
          uint64_t v70 = *((void *)v69 - 8);
          uint64_t v71 = *((void *)v69 - 7);
          BOOL v75 = __OFSUB__(v71, v70);
          uint64_t v72 = v71 - v70;
          if (v75) {
            goto LABEL_123;
          }
          uint64_t v74 = *((void *)v69 - 6);
          uint64_t v73 = *((void *)v69 - 5);
          BOOL v75 = __OFSUB__(v73, v74);
          uint64_t v67 = v73 - v74;
          char v68 = v75;
          if (v75) {
            goto LABEL_124;
          }
          unint64_t v76 = v19 - 2;
          uint64_t v77 = &v62[16 * v19 - 32];
          uint64_t v79 = *(void *)v77;
          uint64_t v78 = *((void *)v77 + 1);
          BOOL v75 = __OFSUB__(v78, v79);
          uint64_t v80 = v78 - v79;
          if (v75) {
            goto LABEL_126;
          }
          BOOL v75 = __OFADD__(v67, v80);
          uint64_t v81 = v67 + v80;
          if (v75) {
            goto LABEL_129;
          }
          if (v81 >= v72)
          {
            uint64_t v99 = &v62[16 * v64];
            uint64_t v101 = *(void *)v99;
            uint64_t v100 = *((void *)v99 + 1);
            BOOL v75 = __OFSUB__(v100, v101);
            uint64_t v102 = v100 - v101;
            if (v75) {
              goto LABEL_133;
            }
            BOOL v92 = v67 < v102;
            goto LABEL_94;
          }
        }
        else
        {
          if (v19 != 3)
          {
            uint64_t v93 = *((void *)v17 + 4);
            uint64_t v94 = *((void *)v17 + 5);
            BOOL v75 = __OFSUB__(v94, v93);
            uint64_t v86 = v94 - v93;
            char v87 = v75;
            goto LABEL_88;
          }
          uint64_t v66 = *((void *)v17 + 4);
          uint64_t v65 = *((void *)v17 + 5);
          BOOL v75 = __OFSUB__(v65, v66);
          uint64_t v67 = v65 - v66;
          char v68 = v75;
        }
        if (v68) {
          goto LABEL_125;
        }
        unint64_t v76 = v19 - 2;
        uint64_t v82 = &v62[16 * v19 - 32];
        uint64_t v84 = *(void *)v82;
        uint64_t v83 = *((void *)v82 + 1);
        BOOL v85 = __OFSUB__(v83, v84);
        uint64_t v86 = v83 - v84;
        char v87 = v85;
        if (v85) {
          goto LABEL_128;
        }
        uint64_t v88 = &v62[16 * v64];
        uint64_t v90 = *(void *)v88;
        uint64_t v89 = *((void *)v88 + 1);
        BOOL v75 = __OFSUB__(v89, v90);
        uint64_t v91 = v89 - v90;
        if (v75) {
          goto LABEL_131;
        }
        if (__OFADD__(v86, v91)) {
          goto LABEL_132;
        }
        if (v86 + v91 >= v67)
        {
          BOOL v92 = v67 < v91;
LABEL_94:
          if (v92) {
            unint64_t v64 = v76;
          }
          goto LABEL_96;
        }
LABEL_88:
        if (v87) {
          goto LABEL_127;
        }
        uint64_t v95 = &v62[16 * v64];
        uint64_t v97 = *(void *)v95;
        uint64_t v96 = *((void *)v95 + 1);
        BOOL v75 = __OFSUB__(v96, v97);
        uint64_t v98 = v96 - v97;
        if (v75) {
          goto LABEL_130;
        }
        if (v98 < v86) {
          goto LABEL_14;
        }
LABEL_96:
        uint64_t v103 = v18;
        unint64_t v104 = v64 - 1;
        if (v64 - 1 >= v19)
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
LABEL_142:
          __break(1u);
          goto LABEL_143;
        }
        if (!*v133) {
          goto LABEL_145;
        }
        id v105 = v17;
        uint64_t v106 = &v62[16 * v104];
        uint64_t v107 = *(void *)v106;
        uint64_t v108 = &v62[16 * v64];
        uint64_t v109 = *((void *)v108 + 1);
        uint64_t v110 = v128;
        sub_23796C380(*v133 + *(void *)(v127 + 72) * *(void *)v106, *v133 + *(void *)(v127 + 72) * *(void *)v108, *v133 + *(void *)(v127 + 72) * v109, v126);
        uint64_t v128 = v110;
        if (v110) {
          goto LABEL_117;
        }
        if (v109 < v107) {
          goto LABEL_120;
        }
        if (v64 > *((void *)v105 + 2)) {
          goto LABEL_121;
        }
        *(void *)uint64_t v106 = v107;
        *(void *)&v62[16 * v104 + 8] = v109;
        unint64_t v111 = *((void *)v105 + 2);
        if (v64 >= v111) {
          goto LABEL_122;
        }
        uint64_t v17 = v105;
        unint64_t v19 = v111 - 1;
        memmove(&v62[16 * v64], v108 + 16, 16 * (v111 - 1 - v64));
        *((void *)v105 + 2) = v111 - 1;
        BOOL v92 = v111 > 2;
        uint64_t v18 = v103;
        if (!v92) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v19 = 1;
LABEL_14:
    uint64_t v11 = v133[1];
    uint64_t v2 = v128;
    if (v18 >= v11) {
      goto LABEL_106;
    }
  }
  uint64_t v130 = v11;
  uint64_t v128 = v2;
  unint64_t v120 = v17;
  uint64_t v53 = 0;
  uint64_t v54 = v136 * (v18 - 1);
  uint64_t v55 = v18 * v136;
  uint64_t v56 = v20;
  uint64_t v57 = v20 * v136;
  uint64_t v35 = v133;
  do
  {
    if (v56 != v18 + v53 - 1)
    {
      uint64_t v58 = v129;
      if (!v129) {
        goto LABEL_146;
      }
      unint64_t v59 = v129 + v57;
      sub_23796A184(v129 + v57, v124);
      if (v57 < v54 || v59 >= v58 + v55)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (v57 != v54)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      sub_23796A184(v124, v58 + v54);
      uint64_t v35 = v133;
      uint64_t v52 = v136;
    }
    ++v56;
    --v53;
    v54 -= v52;
    v55 -= v52;
    v57 += v52;
  }
  while (v56 < v18 + v53);
  uint64_t v17 = v120;
  uint64_t v2 = v128;
  uint64_t v20 = v125;
  uint64_t v11 = v130;
  if (v18 >= v130) {
    goto LABEL_57;
  }
LABEL_25:
  if (__OFSUB__(v18, v20)) {
    goto LABEL_139;
  }
  if (v18 - v20 >= v122) {
    goto LABEL_57;
  }
  if (__OFADD__(v20, v122)) {
    goto LABEL_142;
  }
  if (v20 + v122 >= v11) {
    uint64_t v36 = v11;
  }
  else {
    uint64_t v36 = v20 + v122;
  }
  if (v36 >= v20)
  {
    if (v18 != v36)
    {
      unint64_t v120 = v17;
      uint64_t v128 = v2;
      uint64_t v37 = *(void *)(v127 + 72);
      uint64_t v38 = v37 * (v18 - 1);
      uint64_t v129 = v37;
      uint64_t v39 = v18 * v37;
      uint64_t v123 = v36;
      do
      {
        uint64_t v41 = 0;
        uint64_t v130 = v18;
        while (1)
        {
          uint64_t v136 = v20;
          uint64_t v42 = *v35;
          uint64_t v43 = v39;
          uint64_t v44 = v39 + v41 + *v35;
          uint64_t v45 = v131;
          uint64_t v46 = v35;
          sub_23796A0D8(v44, v131);
          uint64_t v47 = v38;
          uint64_t v48 = v38 + v41 + v42;
          uint64_t v49 = v132;
          sub_23796A0D8(v48, v132);
          LOBYTE(v42) = sub_23796E238();
          sub_23792673C(v49, &qword_268937520);
          sub_23792673C(v45, &qword_268937520);
          if ((v42 & 1) == 0) {
            break;
          }
          uint64_t v50 = *v46;
          if (!*v46) {
            goto LABEL_144;
          }
          uint64_t v39 = v43;
          uint64_t v38 = v47;
          uint64_t v51 = v50 + v47 + v41;
          sub_23796A184(v50 + v43 + v41, v135);
          swift_arrayInitWithTakeFrontToBack();
          sub_23796A184(v135, v51);
          uint64_t v40 = v130;
          v41 -= v129;
          uint64_t v20 = v136 + 1;
          uint64_t v35 = v133;
          if (v130 == v136 + 1) {
            goto LABEL_35;
          }
        }
        uint64_t v40 = v130;
        uint64_t v38 = v47;
        uint64_t v39 = v43;
        uint64_t v35 = v46;
LABEL_35:
        uint64_t v18 = v40 + 1;
        v38 += v129;
        v39 += v129;
        uint64_t v20 = v125;
      }
      while (v18 != v123);
      uint64_t v18 = v123;
      uint64_t v2 = v128;
      uint64_t v17 = v120;
    }
    goto LABEL_57;
  }
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
  uint64_t result = sub_23796ED38();
  __break(1u);
  return result;
}

uint64_t sub_23796ACB0(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v184 = sub_23796E2A8();
  uint64_t v4 = *(void *)(v184 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v184);
  unint64_t v183 = (char *)&v159 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v182 = (char *)&v159 - v7;
  uint64_t v181 = sub_23796E598();
  uint64_t v8 = *(void *)(v181 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v181);
  uint64_t v180 = (char *)&v159 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  unsigned int v179 = (char *)&v159 - v11;
  uint64_t v12 = sub_23796E568();
  uint64_t v13 = *(void **)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v167 = (char *)&v159 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v188 = (char *)&v159 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  unint64_t v185 = (char *)&v159 - v19;
  MEMORY[0x270FA5388](v18);
  unint64_t v194 = (char *)&v159 - v20;
  uint64_t v21 = a1[1];
  uint64_t result = sub_23796EDA8();
  if (result >= v21)
  {
    if (v21 < 0) {
      goto LABEL_140;
    }
    if (v21) {
      return sub_23796BE84(0, v21, 1, a1);
    }
    return result;
  }
  if (v21 >= 0) {
    uint64_t v23 = v21;
  }
  else {
    uint64_t v23 = v21 + 1;
  }
  if (v21 < -1) {
    goto LABEL_148;
  }
  uint64_t v161 = result;
  if (v21 < 2)
  {
    uint64_t v28 = (char *)MEMORY[0x263F8EE78];
    unint64_t v169 = MEMORY[0x263F8EE78]
         + ((*((unsigned __int8 *)v13 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v13 + 80));
    uint64_t v160 = MEMORY[0x263F8EE78];
    if (v21 != 1)
    {
      unint64_t v31 = *(void *)(MEMORY[0x263F8EE78] + 16);
      if (v31 < 2)
      {
LABEL_117:
        swift_bridgeObjectRelease();
        *(void *)(v160 + 16) = 0;
        return swift_bridgeObjectRelease();
      }
LABEL_104:
      uint64_t v151 = *a1;
      while (1)
      {
        unint64_t v152 = v31 - 2;
        if (v31 < 2) {
          goto LABEL_135;
        }
        if (!v151) {
          goto LABEL_147;
        }
        uint64_t v153 = v28;
        unint64_t v154 = v28 + 32;
        uint64_t v155 = *(void *)&v28[16 * v152 + 32];
        uint64_t v156 = *(void *)&v28[16 * v31 + 24];
        sub_23796C85C(v151 + v13[9] * v155, v151 + v13[9] * *(void *)&v154[16 * v31 - 16], v151 + v13[9] * v156, v169);
        if (v2) {
          goto LABEL_117;
        }
        if (v156 < v155) {
          goto LABEL_136;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v153 = sub_23796D484((uint64_t)v153);
        }
        if (v152 >= *((void *)v153 + 2)) {
          goto LABEL_137;
        }
        unint64_t v157 = &v153[16 * v152 + 32];
        *(void *)unint64_t v157 = v155;
        *((void *)v157 + 1) = v156;
        unint64_t v158 = *((void *)v153 + 2);
        if (v31 > v158) {
          goto LABEL_138;
        }
        uint64_t v28 = v153;
        memmove(&v153[16 * v31 + 16], &v153[16 * v31 + 32], 16 * (v158 - v31));
        *((void *)v153 + 2) = v158 - 1;
        unint64_t v31 = v158 - 1;
        if (v158 <= 2) {
          goto LABEL_117;
        }
      }
    }
  }
  else
  {
    uint64_t v24 = a1;
    uint64_t v25 = v23 >> 1;
    uint64_t v26 = sub_23796EB48();
    *(void *)(v26 + 16) = v25;
    a1 = v24;
    unint64_t v27 = (*((unsigned __int8 *)v13 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v13 + 80);
    uint64_t v160 = v26;
    unint64_t v169 = v26 + v27;
  }
  uint64_t v29 = v13;
  uint64_t v30 = 0;
  uint64_t v177 = (void (**)(char *, uint64_t))(v8 + 8);
  uint64_t v178 = v29 + 2;
  uint64_t v175 = (void (**)(char *, uint64_t))(v29 + 1);
  v176 = (void (**)(char *, uint64_t))(v4 + 8);
  unint64_t v192 = (void (**)(char *, char *, uint64_t))(v29 + 4);
  uint64_t v28 = (char *)MEMORY[0x263F8EE78];
  v170 = v29;
  uint64_t v186 = v12;
  unint64_t v193 = a1;
  while (1)
  {
    unint64_t v162 = v28;
    uint64_t v32 = v30++;
    if (v30 >= v21)
    {
      a1 = v193;
      uint64_t v28 = v162;
    }
    else
    {
      uint64_t v163 = *v193;
      uint64_t v33 = v163;
      unint64_t v191 = (char *)v170[9];
      int v34 = v191;
      uint64_t v187 = v30;
      uint64_t v35 = (void (*)(void))v170[2];
      v35();
      uint64_t v174 = v35;
      ((void (*)(char *, uint64_t, uint64_t))v35)(v185, v33 + (void)v34 * v32, v12);
      uint64_t v168 = (char *)v32;
      uint64_t v36 = v179;
      sub_23796E558();
      uint64_t v190 = v21;
      uint64_t v37 = v182;
      sub_23796E578();
      uint64_t v38 = (char *)*v177;
      uint64_t v39 = v36;
      uint64_t v40 = v181;
      (*v177)(v39, v181);
      uint64_t v41 = v180;
      sub_23796E558();
      uint64_t v42 = v183;
      sub_23796E578();
      uint64_t v43 = v40;
      uint64_t v32 = (uint64_t)v168;
      uint64_t v173 = (void (*)(char *, uint64_t))v38;
      ((void (*)(char *, uint64_t))v38)(v41, v43);
      LODWORD(v189) = sub_23796E238();
      uint64_t v44 = (char *)*v176;
      uint64_t v45 = v184;
      (*v176)(v42, v184);
      uint64_t v46 = v37;
      uint64_t v21 = v190;
      v172 = v44;
      ((void (*)(char *, uint64_t))v44)(v46, v45);
      uint64_t v47 = (void (*)(char *, uint64_t))v170[1];
      v47(v185, v12);
      uint64_t v171 = v47;
      v47(v194, v12);
      uint64_t v30 = v32 + 2;
      if (v32 + 2 < v21)
      {
        uint64_t v166 = v2;
        uint64_t v165 = (void)v191 * v187;
        uint64_t v48 = v163;
        uint64_t v164 = (void)v191 * v30;
        while (1)
        {
          uint64_t v187 = v30;
          uint64_t v49 = v174;
          v174();
          uint64_t v50 = v185;
          ((void (*)(char *, uint64_t, uint64_t))v49)(v185, v48 + v165, v12);
          uint64_t v51 = v179;
          sub_23796E558();
          uint64_t v52 = v182;
          sub_23796E578();
          uint64_t v53 = v181;
          uint64_t v54 = v173;
          v173(v51, v181);
          uint64_t v55 = v180;
          sub_23796E558();
          uint64_t v56 = v183;
          sub_23796E578();
          uint64_t v57 = v55;
          uint64_t v12 = v186;
          v54(v57, v53);
          int v58 = sub_23796E238();
          unint64_t v59 = v56;
          uint64_t v60 = v184;
          unint64_t v61 = (void (*)(char *, uint64_t))v172;
          ((void (*)(char *, uint64_t))v172)(v59, v184);
          v61(v52, v60);
          uint64_t v62 = v171;
          v171(v50, v12);
          v62(v194, v12);
          if ((v189 ^ v58)) {
            break;
          }
          uint64_t v30 = v187 + 1;
          v48 += (uint64_t)v191;
          if (v190 == v187 + 1)
          {
            uint64_t v21 = v190;
            uint64_t v30 = v190;
            uint64_t v2 = v166;
            uint64_t v32 = (uint64_t)v168;
            goto LABEL_23;
          }
        }
        uint64_t v2 = v166;
        uint64_t v30 = v187;
        uint64_t v32 = (uint64_t)v168;
        uint64_t v21 = v190;
      }
LABEL_23:
      a1 = v193;
      uint64_t v28 = v162;
      if (v189)
      {
        if (v30 < v32) {
          goto LABEL_141;
        }
        if (v32 < v30)
        {
          uint64_t v63 = 0;
          uint64_t v64 = v32;
          uint64_t v65 = v191;
          uint64_t v66 = (void)v191 * (v30 - 1);
          uint64_t v67 = v30 * (void)v191;
          uint64_t v68 = v64;
          uint64_t v69 = v64 * (void)v191;
          do
          {
            if (v68 != v30 + v63 - 1)
            {
              if (!v163) {
                goto LABEL_146;
              }
              uint64_t v166 = v2;
              unint64_t v71 = v163 + v69;
              uint64_t v72 = (char *)(v163 + v66);
              uint64_t v73 = v163;
              v189 = *v192;
              v189(v167, (char *)(v163 + v69), v186);
              if (v69 < v66 || v71 >= v73 + v67)
              {
                uint64_t v70 = v186;
                swift_arrayInitWithTakeFrontToBack();
              }
              else
              {
                uint64_t v70 = v186;
                if (v69 != v66) {
                  swift_arrayInitWithTakeBackToFront();
                }
              }
              v189(v72, v167, v70);
              uint64_t v2 = v166;
              uint64_t v65 = v191;
            }
            ++v68;
            --v63;
            v66 -= (uint64_t)v65;
            v67 -= (uint64_t)v65;
            v69 += (uint64_t)v65;
          }
          while (v68 < v30 + v63);
          a1 = v193;
          uint64_t v28 = v162;
          uint64_t v12 = v186;
          uint64_t v32 = (uint64_t)v168;
          uint64_t v21 = v190;
        }
      }
    }
    if (v30 >= v21) {
      goto LABEL_55;
    }
    if (__OFSUB__(v30, v32)) {
      goto LABEL_139;
    }
    if (v30 - v32 >= v161) {
      goto LABEL_55;
    }
    if (__OFADD__(v32, v161)) {
      goto LABEL_142;
    }
    uint64_t v74 = v32 + v161 >= v21 ? v21 : v32 + v161;
    if (v74 < v32) {
      break;
    }
    if (v30 != v74)
    {
      uint64_t v168 = (char *)v32;
      uint64_t v166 = v2;
      BOOL v75 = (char *)v170[9];
      uint64_t v171 = (void (*)(char *, uint64_t))v170[2];
      uint64_t v76 = (void)v75 * (v30 - 1);
      v172 = v75;
      uint64_t v77 = v30 * (void)v75;
      uint64_t v165 = v74;
      do
      {
        uint64_t v79 = 0;
        uint64_t v80 = v168;
        uint64_t v187 = v30;
        uint64_t v173 = (void (*)(char *, uint64_t))v77;
        uint64_t v174 = (void (*)(void))v76;
        while (1)
        {
          unint64_t v191 = v80;
          uint64_t v81 = *a1;
          uint64_t v190 = v77 + v79;
          uint64_t v82 = (void (*)(char *, uint64_t, uint64_t))v171;
          ((void (*)(void))v171)();
          v189 = (void (*)(char *, char *, uint64_t))(v76 + v79);
          uint64_t v83 = v185;
          v82(v185, v76 + v79 + v81, v12);
          uint64_t v84 = v179;
          sub_23796E558();
          BOOL v85 = v182;
          sub_23796E578();
          uint64_t v86 = *v177;
          uint64_t v87 = v181;
          (*v177)(v84, v181);
          uint64_t v88 = v180;
          sub_23796E558();
          uint64_t v89 = v183;
          sub_23796E578();
          uint64_t v90 = v88;
          uint64_t v12 = v186;
          v86(v90, v87);
          char v91 = sub_23796E238();
          BOOL v92 = *v176;
          uint64_t v93 = v89;
          uint64_t v94 = v184;
          (*v176)(v93, v184);
          v92(v85, v94);
          uint64_t v95 = *v175;
          (*v175)(v83, v12);
          v95(v194, v12);
          if ((v91 & 1) == 0) {
            break;
          }
          uint64_t v96 = *v193;
          if (!*v193) {
            goto LABEL_144;
          }
          uint64_t v77 = (uint64_t)v173;
          uint64_t v76 = (uint64_t)v174;
          uint64_t v97 = (char *)v174 + v96 + v79;
          uint64_t v98 = *v192;
          (*v192)(v188, (char *)v173 + v96 + v79, v12);
          uint64_t v78 = (char *)v187;
          swift_arrayInitWithTakeFrontToBack();
          v98(v97, v188, v12);
          v79 -= (uint64_t)v172;
          uint64_t v80 = v191 + 1;
          a1 = v193;
          if (v78 == v191 + 1) {
            goto LABEL_48;
          }
        }
        uint64_t v78 = (char *)v187;
        a1 = v193;
        uint64_t v77 = (uint64_t)v173;
        uint64_t v76 = (uint64_t)v174;
LABEL_48:
        uint64_t v30 = (uint64_t)(v78 + 1);
        v76 += (uint64_t)v172;
        v77 += (uint64_t)v172;
      }
      while (v30 != v165);
      uint64_t v30 = v165;
      uint64_t v2 = v166;
      uint64_t v28 = v162;
      uint64_t v32 = (uint64_t)v168;
    }
LABEL_55:
    if (v30 < v32) {
      goto LABEL_134;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v28 = sub_23796D104(0, *((void *)v28 + 2) + 1, 1, v28);
    }
    unint64_t v100 = *((void *)v28 + 2);
    unint64_t v99 = *((void *)v28 + 3);
    unint64_t v31 = v100 + 1;
    if (v100 >= v99 >> 1) {
      uint64_t v28 = sub_23796D104((char *)(v99 > 1), v100 + 1, 1, v28);
    }
    *((void *)v28 + 2) = v31;
    unint64_t v191 = v28 + 32;
    uint64_t v101 = &v28[16 * v100 + 32];
    *(void *)uint64_t v101 = v32;
    *((void *)v101 + 1) = v30;
    if (v100)
    {
      uint64_t v102 = v191;
      while (1)
      {
        unint64_t v103 = v31 - 1;
        if (v31 >= 4)
        {
          uint64_t v108 = &v102[16 * v31];
          uint64_t v109 = *((void *)v108 - 8);
          uint64_t v110 = *((void *)v108 - 7);
          BOOL v114 = __OFSUB__(v110, v109);
          uint64_t v111 = v110 - v109;
          if (v114) {
            goto LABEL_123;
          }
          uint64_t v113 = *((void *)v108 - 6);
          uint64_t v112 = *((void *)v108 - 5);
          BOOL v114 = __OFSUB__(v112, v113);
          uint64_t v106 = v112 - v113;
          char v107 = v114;
          if (v114) {
            goto LABEL_124;
          }
          unint64_t v115 = v31 - 2;
          uint64_t v116 = &v102[16 * v31 - 32];
          uint64_t v118 = *(void *)v116;
          uint64_t v117 = *((void *)v116 + 1);
          BOOL v114 = __OFSUB__(v117, v118);
          uint64_t v119 = v117 - v118;
          if (v114) {
            goto LABEL_126;
          }
          BOOL v114 = __OFADD__(v106, v119);
          uint64_t v120 = v106 + v119;
          if (v114) {
            goto LABEL_129;
          }
          if (v120 >= v111)
          {
            uint64_t v138 = &v102[16 * v103];
            uint64_t v140 = *(void *)v138;
            uint64_t v139 = *((void *)v138 + 1);
            BOOL v114 = __OFSUB__(v139, v140);
            uint64_t v141 = v139 - v140;
            if (v114) {
              goto LABEL_133;
            }
            BOOL v131 = v106 < v141;
            goto LABEL_93;
          }
        }
        else
        {
          if (v31 != 3)
          {
            uint64_t v132 = *((void *)v28 + 4);
            uint64_t v133 = *((void *)v28 + 5);
            BOOL v114 = __OFSUB__(v133, v132);
            uint64_t v125 = v133 - v132;
            char v126 = v114;
            goto LABEL_87;
          }
          uint64_t v105 = *((void *)v28 + 4);
          uint64_t v104 = *((void *)v28 + 5);
          BOOL v114 = __OFSUB__(v104, v105);
          uint64_t v106 = v104 - v105;
          char v107 = v114;
        }
        if (v107) {
          goto LABEL_125;
        }
        unint64_t v115 = v31 - 2;
        uint64_t v121 = &v102[16 * v31 - 32];
        uint64_t v123 = *(void *)v121;
        uint64_t v122 = *((void *)v121 + 1);
        BOOL v124 = __OFSUB__(v122, v123);
        uint64_t v125 = v122 - v123;
        char v126 = v124;
        if (v124) {
          goto LABEL_128;
        }
        uint64_t v127 = &v102[16 * v103];
        uint64_t v129 = *(void *)v127;
        uint64_t v128 = *((void *)v127 + 1);
        BOOL v114 = __OFSUB__(v128, v129);
        uint64_t v130 = v128 - v129;
        if (v114) {
          goto LABEL_131;
        }
        if (__OFADD__(v125, v130)) {
          goto LABEL_132;
        }
        if (v125 + v130 >= v106)
        {
          BOOL v131 = v106 < v130;
LABEL_93:
          if (v131) {
            unint64_t v103 = v115;
          }
          goto LABEL_95;
        }
LABEL_87:
        if (v126) {
          goto LABEL_127;
        }
        uint64_t v134 = &v102[16 * v103];
        uint64_t v136 = *(void *)v134;
        uint64_t v135 = *((void *)v134 + 1);
        BOOL v114 = __OFSUB__(v135, v136);
        uint64_t v137 = v135 - v136;
        if (v114) {
          goto LABEL_130;
        }
        if (v137 < v125) {
          goto LABEL_14;
        }
LABEL_95:
        unint64_t v142 = v103 - 1;
        if (v103 - 1 >= v31)
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
LABEL_142:
          __break(1u);
          goto LABEL_143;
        }
        uint64_t v143 = *a1;
        if (!*a1) {
          goto LABEL_145;
        }
        uint64_t v144 = v28;
        uint64_t v145 = &v102[16 * v142];
        uint64_t v146 = v102;
        uint64_t v147 = *(void *)v145;
        uint64_t v148 = &v146[16 * v103];
        uint64_t v149 = *((void *)v148 + 1);
        sub_23796C85C(v143 + v170[9] * *(void *)v145, v143 + v170[9] * *(void *)v148, v143 + v170[9] * v149, v169);
        if (v2) {
          goto LABEL_117;
        }
        if (v149 < v147) {
          goto LABEL_120;
        }
        if (v103 > *((void *)v144 + 2)) {
          goto LABEL_121;
        }
        *(void *)uint64_t v145 = v147;
        uint64_t v102 = v191;
        *(void *)&v191[16 * v142 + 8] = v149;
        unint64_t v150 = *((void *)v144 + 2);
        if (v103 >= v150) {
          goto LABEL_122;
        }
        uint64_t v28 = v144;
        unint64_t v31 = v150 - 1;
        memmove(v148, v148 + 16, 16 * (v150 - 1 - v103));
        *((void *)v144 + 2) = v150 - 1;
        a1 = v193;
        if (v150 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v31 = 1;
LABEL_14:
    uint64_t v21 = a1[1];
    uint64_t v12 = v186;
    if (v30 >= v21)
    {
      uint64_t v13 = v170;
      if (v31 < 2) {
        goto LABEL_117;
      }
      goto LABEL_104;
    }
  }
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
  uint64_t result = sub_23796ED38();
  __break(1u);
  return result;
}

uint64_t sub_23796BC10(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v25 = a1;
  uint64_t v28 = sub_2379265BC(&qword_268937520);
  uint64_t v7 = MEMORY[0x270FA5388](v28);
  uint64_t v29 = (uint64_t)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v23 - v10;
  uint64_t result = MEMORY[0x270FA5388](v9);
  uint64_t v15 = (char *)&v23 - v14;
  uint64_t v27 = a3;
  uint64_t v24 = a2;
  if (a3 != a2)
  {
    uint64_t v16 = *(void *)(v13 + 72);
    uint64_t v31 = v16 * (v27 - 1);
    uint64_t v26 = v16;
    uint64_t v30 = v16 * v27;
LABEL_5:
    uint64_t v17 = 0;
    uint64_t v18 = v25;
    while (1)
    {
      uint64_t v19 = *a4;
      sub_23796A0D8(v30 + v17 + *a4, (uint64_t)v15);
      sub_23796A0D8(v31 + v17 + v19, (uint64_t)v11);
      LOBYTE(v19) = sub_23796E238();
      sub_23792673C((uint64_t)v11, &qword_268937520);
      uint64_t result = sub_23792673C((uint64_t)v15, &qword_268937520);
      if ((v19 & 1) == 0)
      {
LABEL_4:
        v31 += v26;
        v30 += v26;
        if (++v27 == v24) {
          return result;
        }
        goto LABEL_5;
      }
      uint64_t v20 = *a4;
      if (!*a4) {
        break;
      }
      uint64_t v21 = a4;
      uint64_t v22 = v20 + v31 + v17;
      sub_23796A184(v20 + v30 + v17, v29);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = sub_23796A184(v29, v22);
      v17 -= v26;
      ++v18;
      a4 = v21;
      if (v27 == v18) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_23796BE84(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v54 = a1;
  uint64_t v68 = sub_23796E2A8();
  uint64_t v7 = *(void *)(v68 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v68);
  uint64_t v67 = &v52[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v66 = &v52[-v10];
  uint64_t v65 = sub_23796E598();
  uint64_t v11 = *(void *)(v65 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v65);
  uint64_t v64 = &v52[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v12);
  uint64_t v63 = &v52[-v14];
  uint64_t v15 = sub_23796E568();
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v74 = &v52[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v62 = &v52[-v19];
  uint64_t result = MEMORY[0x270FA5388](v18);
  uint64_t v78 = &v52[-v22];
  uint64_t v72 = a3;
  uint64_t v53 = a2;
  if (a3 != a2)
  {
    uint64_t v24 = *(void (**)(void))(v21 + 16);
    uint64_t v23 = v21 + 16;
    uint64_t v25 = *(void *)(v23 + 56);
    uint64_t v57 = v11 + 8;
    int v58 = v24;
    uint64_t v56 = (void (**)(unsigned char *, uint64_t))(v7 + 8);
    uint64_t v55 = (void (**)(unsigned char *, uint64_t))(v23 - 8);
    uint64_t v59 = v23;
    uint64_t v60 = v15;
    uint64_t v73 = (void (**)(unsigned char *, uint64_t, uint64_t))(v23 + 16);
    uint64_t v26 = v25 * (v72 - 1);
    uint64_t v69 = v25;
    uint64_t v27 = v25 * v72;
    unint64_t v61 = a4;
    uint64_t v28 = (void (**)(unsigned char *, uint64_t))(v11 + 8);
LABEL_5:
    uint64_t v29 = 0;
    uint64_t v77 = v54;
    uint64_t v70 = v27;
    uint64_t v71 = v26;
    while (1)
    {
      uint64_t v30 = *a4;
      uint64_t v76 = v27 + v29;
      uint64_t v31 = v58;
      v58();
      uint64_t v75 = v26 + v29;
      uint64_t v32 = v26 + v29 + v30;
      uint64_t v33 = v62;
      ((void (*)(unsigned char *, uint64_t, uint64_t))v31)(v62, v32, v15);
      int v34 = v63;
      sub_23796E558();
      uint64_t v35 = v66;
      sub_23796E578();
      uint64_t v36 = *v28;
      uint64_t v37 = v34;
      uint64_t v38 = v65;
      (*v28)(v37, v65);
      uint64_t v39 = v64;
      sub_23796E558();
      uint64_t v40 = v67;
      sub_23796E578();
      uint64_t v41 = v38;
      uint64_t v15 = v60;
      v36(v39, v41);
      char v42 = sub_23796E238();
      uint64_t v43 = *v56;
      uint64_t v44 = v40;
      uint64_t v45 = v68;
      (*v56)(v44, v68);
      uint64_t v46 = v45;
      a4 = v61;
      v43(v35, v46);
      uint64_t v47 = (uint64_t (*)(unsigned char *, uint64_t))*v55;
      uint64_t v48 = v33;
      uint64_t v26 = v71;
      (*v55)(v48, v15);
      uint64_t result = v47(v78, v15);
      uint64_t v27 = v70;
      if ((v42 & 1) == 0)
      {
LABEL_4:
        v26 += v69;
        v27 += v69;
        if (++v72 == v53) {
          return result;
        }
        goto LABEL_5;
      }
      uint64_t v49 = *a4;
      if (!*a4) {
        break;
      }
      uint64_t v50 = v49 + v26 + v29;
      uint64_t v51 = (uint64_t (*)(uint64_t, unsigned char *, uint64_t))*v73;
      (*v73)(v74, v49 + v70 + v29, v15);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = v51(v50, v74, v15);
      v29 -= v69;
      if (v72 == ++v77) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_23796C380(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v42 = sub_2379265BC(&qword_268937520);
  uint64_t v8 = MEMORY[0x270FA5388](v42);
  uint64_t v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v41 = (uint64_t)&v38 - v11;
  uint64_t v13 = *(void *)(v12 + 72);
  if (!v13)
  {
    __break(1u);
LABEL_63:
    __break(1u);
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  if (a2 - a1 == 0x8000000000000000 && v13 == -1) {
    goto LABEL_63;
  }
  int64_t v14 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v13 == -1) {
    goto LABEL_64;
  }
  uint64_t v15 = (uint64_t)(a2 - a1) / v13;
  unint64_t v45 = a1;
  unint64_t v44 = a4;
  uint64_t v16 = v14 / v13;
  if (v15 >= v14 / v13)
  {
    if ((v16 & 0x8000000000000000) == 0)
    {
      uint64_t v18 = v16 * v13;
      if (a4 < a2 || a2 + v18 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      unint64_t v26 = a4 + v18;
      unint64_t v43 = a4 + v18;
      unint64_t v45 = a2;
      unint64_t v40 = a1;
      if (v18 >= 1 && a1 < a2)
      {
        uint64_t v28 = -v13;
        unint64_t v39 = a4;
        do
        {
          unint64_t v29 = a3 + v28;
          unint64_t v30 = a3;
          uint64_t v31 = v41;
          sub_23796A0D8(v26 + v28, v41);
          unint64_t v32 = a2 + v28;
          sub_23796A0D8(a2 + v28, (uint64_t)v10);
          char v33 = sub_23796E238();
          sub_23792673C((uint64_t)v10, &qword_268937520);
          sub_23792673C(v31, &qword_268937520);
          if (v33)
          {
            if (v30 < a2 || v29 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
              unint64_t v35 = v39;
            }
            else
            {
              BOOL v34 = v30 == a2;
              unint64_t v35 = v39;
              if (!v34) {
                swift_arrayInitWithTakeBackToFront();
              }
            }
            v45 += v28;
          }
          else
          {
            unint64_t v36 = v43;
            v43 += v28;
            if (v30 < v36 || v29 >= v36)
            {
              swift_arrayInitWithTakeFrontToBack();
              unint64_t v32 = a2;
            }
            else
            {
              if (v30 != v36) {
                swift_arrayInitWithTakeBackToFront();
              }
              unint64_t v32 = a2;
            }
            unint64_t v35 = v39;
          }
          unint64_t v26 = v43;
          if (v43 <= v35) {
            break;
          }
          a2 = v32;
          a3 = v29;
        }
        while (v32 > v40);
      }
      goto LABEL_61;
    }
  }
  else if ((v15 & 0x8000000000000000) == 0)
  {
    uint64_t v17 = v15 * v13;
    if (a4 < a1 || a1 + v17 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v19 = a4 + v17;
    unint64_t v43 = a4 + v17;
    if (v17 >= 1 && a2 < a3)
    {
      uint64_t v21 = v41;
      do
      {
        sub_23796A0D8(a2, v21);
        sub_23796A0D8(a4, (uint64_t)v10);
        char v22 = sub_23796E238();
        sub_23792673C((uint64_t)v10, &qword_268937520);
        sub_23792673C(v21, &qword_268937520);
        unint64_t v23 = v45;
        if (v22)
        {
          unint64_t v24 = a2 + v13;
          if (v45 < a2 || v45 >= v24)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v45 == a2)
          {
            unint64_t v23 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        else
        {
          unint64_t v25 = v44 + v13;
          if (v45 < v44 || v45 >= v25)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v45 != v44)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v44 = v25;
          unint64_t v24 = a2;
        }
        unint64_t v45 = v23 + v13;
        a4 = v44;
        if (v44 >= v19) {
          break;
        }
        a2 = v24;
      }
      while (v24 < a3);
    }
LABEL_61:
    sub_23796D200(&v45, &v44, (uint64_t *)&v43);
    return 1;
  }
LABEL_65:
  uint64_t result = sub_23796ED88();
  __break(1u);
  return result;
}

uint64_t sub_23796C85C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v89 = sub_23796E2A8();
  uint64_t v8 = *(void *)(v89 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v89);
  uint64_t v88 = &v72[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v9);
  uint64_t v87 = &v72[-v11];
  uint64_t v86 = sub_23796E598();
  uint64_t v12 = *(void *)(v86 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v86);
  BOOL v85 = &v72[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v13);
  uint64_t v84 = &v72[-v15];
  uint64_t v91 = sub_23796E568();
  uint64_t v16 = *(void *)(v91 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v91);
  uint64_t v83 = &v72[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v17);
  uint64_t v93 = &v72[-v19];
  uint64_t v21 = *(void *)(v20 + 72);
  if (!v21)
  {
    __break(1u);
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  if (a2 - a1 == 0x8000000000000000 && v21 == -1) {
    goto LABEL_62;
  }
  int64_t v22 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v21 == -1) {
    goto LABEL_63;
  }
  uint64_t v23 = (uint64_t)(a2 - a1) / v21;
  unint64_t v96 = a1;
  unint64_t v95 = a4;
  uint64_t v24 = v22 / v21;
  if (v23 >= v22 / v21)
  {
    if ((v24 & 0x8000000000000000) == 0)
    {
      uint64_t v26 = v24 * v21;
      if (a4 < a2 || a2 + v26 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      unint64_t v94 = a4 + v26;
      unint64_t v96 = a2;
      if (v26 >= 1 && a1 < a2)
      {
        uint64_t v50 = *(void (**)(void))(v16 + 16);
        uint64_t v78 = (void (**)(unsigned char *, uint64_t))(v12 + 8);
        uint64_t v79 = v50;
        uint64_t v82 = v16 + 16;
        uint64_t v76 = (void (**)(unsigned char *, uint64_t))(v16 + 8);
        uint64_t v77 = (void (**)(unsigned char *, uint64_t))(v8 + 8);
        uint64_t v51 = -v21;
        unint64_t v74 = a4;
        unint64_t v73 = a1;
        uint64_t v75 = -v21;
        uint64_t v52 = v91;
        do
        {
          unint64_t v92 = a2;
          unint64_t v90 = a3;
          unint64_t v81 = a3 + v51;
          uint64_t v53 = v79;
          v79();
          uint64_t v54 = v83;
          uint64_t v80 = a2 + v51;
          ((void (*)(unsigned char *))v53)(v83);
          uint64_t v55 = v84;
          sub_23796E558();
          uint64_t v56 = v87;
          sub_23796E578();
          uint64_t v57 = *v78;
          int v58 = v55;
          uint64_t v59 = v86;
          (*v78)(v58, v86);
          uint64_t v60 = v85;
          sub_23796E558();
          unint64_t v61 = v88;
          sub_23796E578();
          v57(v60, v59);
          char v62 = sub_23796E238();
          uint64_t v63 = *v77;
          uint64_t v64 = v61;
          uint64_t v65 = v89;
          (*v77)(v64, v89);
          v63(v56, v65);
          uint64_t v66 = *v76;
          (*v76)(v54, v52);
          v66(v93, v52);
          if (v62)
          {
            uint64_t v51 = v75;
            a3 = v81;
            if (v90 < v92 || v81 >= v92)
            {
              unint64_t v69 = v80;
              swift_arrayInitWithTakeFrontToBack();
              unint64_t v67 = v74;
              unint64_t v68 = v73;
            }
            else
            {
              unint64_t v67 = v74;
              unint64_t v68 = v73;
              unint64_t v69 = v80;
              if (v90 != v92) {
                swift_arrayInitWithTakeBackToFront();
              }
            }
            v96 += v51;
          }
          else
          {
            unint64_t v69 = v92;
            unint64_t v70 = v94;
            v94 += v75;
            uint64_t v51 = v75;
            a3 = v81;
            if (v90 < v70 || v81 >= v70)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v90 != v70)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            unint64_t v67 = v74;
            unint64_t v68 = v73;
          }
          if (v94 <= v67) {
            break;
          }
          a2 = v69;
        }
        while (v69 > v68);
      }
      goto LABEL_60;
    }
  }
  else if ((v23 & 0x8000000000000000) == 0)
  {
    uint64_t v25 = v23 * v21;
    if (a4 < a1 || a1 + v25 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v81 = a4 + v25;
    unint64_t v94 = a4 + v25;
    if (v25 >= 1 && a2 < a3)
    {
      uint64_t v28 = *(void (**)(void))(v16 + 16);
      uint64_t v78 = (void (**)(unsigned char *, uint64_t))(v12 + 8);
      uint64_t v79 = v28;
      uint64_t v82 = v16 + 16;
      uint64_t v76 = (void (**)(unsigned char *, uint64_t))(v16 + 8);
      uint64_t v77 = (void (**)(unsigned char *, uint64_t))(v8 + 8);
      unint64_t v90 = a3;
      uint64_t v80 = v21;
      unint64_t v29 = v83;
      uint64_t v30 = v86;
      do
      {
        unint64_t v92 = a2;
        uint64_t v31 = v91;
        unint64_t v32 = v79;
        v79();
        ((void (*)(unsigned char *, unint64_t, uint64_t))v32)(v29, a4, v31);
        char v33 = v84;
        sub_23796E558();
        BOOL v34 = v87;
        sub_23796E578();
        unint64_t v35 = *v78;
        (*v78)(v33, v30);
        unint64_t v36 = v85;
        sub_23796E558();
        uint64_t v37 = v88;
        sub_23796E578();
        v35(v36, v30);
        LOBYTE(v35) = sub_23796E238();
        uint64_t v38 = *v77;
        unint64_t v39 = v37;
        uint64_t v40 = v89;
        (*v77)(v39, v89);
        v38(v34, v40);
        uint64_t v41 = *v76;
        (*v76)(v29, v31);
        v41(v93, v31);
        unint64_t v42 = v96;
        if (v35)
        {
          uint64_t v43 = v80;
          unint64_t v44 = v92 + v80;
          if (v96 < v92 || v96 >= v44)
          {
            swift_arrayInitWithTakeFrontToBack();
            unint64_t v45 = v90;
          }
          else
          {
            unint64_t v45 = v90;
            if (v96 == v92) {
              unint64_t v42 = v92;
            }
            else {
              swift_arrayInitWithTakeBackToFront();
            }
          }
        }
        else
        {
          unint64_t v46 = v92;
          uint64_t v43 = v80;
          unint64_t v47 = v95 + v80;
          if (v96 < v95 || v96 >= v47)
          {
            swift_arrayInitWithTakeFrontToBack();
            unint64_t v45 = v90;
            unint64_t v48 = v46;
          }
          else
          {
            unint64_t v45 = v90;
            unint64_t v48 = v92;
            if (v96 != v95) {
              swift_arrayInitWithTakeBackToFront();
            }
          }
          unint64_t v95 = v47;
          unint64_t v44 = v48;
        }
        unint64_t v96 = v42 + v43;
        a4 = v95;
        if (v95 >= v81) {
          break;
        }
        a2 = v44;
      }
      while (v44 < v45);
    }
LABEL_60:
    sub_23796D344(&v96, &v95, (uint64_t *)&v94);
    return 1;
  }
LABEL_64:
  uint64_t result = sub_23796ED88();
  __break(1u);
  return result;
}

char *sub_23796D104(char *result, int64_t a2, char a3, char *a4)
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
    sub_2379265BC(&qword_2689379E0);
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
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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

uint64_t sub_23796D200(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = sub_2379265BC(&qword_268937520);
  uint64_t v7 = *(void *)(*(void *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1) {
    goto LABEL_18;
  }
  if (v8 / v7 < 0)
  {
LABEL_19:
    uint64_t result = sub_23796ED88();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v3 != v4)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

uint64_t sub_23796D344(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = sub_23796E568();
  uint64_t v7 = *(void *)(*(void *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1) {
    goto LABEL_18;
  }
  if (v8 / v7 < 0)
  {
LABEL_19:
    uint64_t result = sub_23796ED88();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v3 != v4)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_23796D484(uint64_t a1)
{
  return sub_23796D104(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_23796D498(char a1, int64_t a2, char a3, void *a4)
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
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  sub_2379265BC(&qword_268937518);
  uint64_t v10 = *(void *)(sub_2379265BC(&qword_268937520) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
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
  uint64_t v16 = *(void *)(sub_2379265BC(&qword_268937520) - 8);
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
  uint64_t result = sub_23796ED88();
  __break(1u);
  return result;
}

uint64_t sub_23796D6E0(char a1, int64_t a2, char a3, void *a4)
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
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  sub_2379265BC(&qword_2689379E8);
  uint64_t v10 = *(void *)(sub_23796E568() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
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
  uint64_t v16 = *(void *)(sub_23796E568() - 8);
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
  uint64_t result = sub_23796ED88();
  __break(1u);
  return result;
}

uint64_t sub_23796D920(void *a1)
{
  return sub_23796D498(0, a1[2], 0, a1);
}

uint64_t sub_23796D934(void *a1)
{
  return sub_23796D6E0(0, a1[2], 0, a1);
}

id sub_23796D9E4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Container();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for Container()
{
  return self;
}

uint64_t sub_23796DA3C()
{
  sub_2379265BC(&qword_2689379F8);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_237972380;
  *(void *)(v0 + 32) = type metadata accessor for AQIDataSource();
  *(void *)(v0 + 40) = type metadata accessor for ChanceRainDataSource(0);
  *(void *)(v0 + 48) = type metadata accessor for UVDataSource();
  *(void *)(v0 + 56) = type metadata accessor for WindDataSource();
  *(void *)(v0 + 64) = type metadata accessor for WeatherDataSource();
  *(void *)(v0 + 72) = type metadata accessor for ConditionDataSource();
  return v0;
}

unint64_t sub_23796DB0C()
{
  return 0xD000000000000016;
}

char *sub_23796DB68(void *a1, uint64_t a2, void *a3)
{
  uint64_t v7 = OBJC_IVAR____TtC20WeatherComplications14WindDataSource_rectangularFormatter;
  uint64_t v8 = qword_268937128;
  uint64_t v9 = v3;
  if (v8 != -1) {
    swift_once();
  }
  *(_OWORD *)&v3[v7] = xmmword_2689394C0;
  swift_unknownObjectRetain();

  v14.receiver = v9;
  v14.super_class = (Class)type metadata accessor for WindDataSource();
  id v10 = objc_msgSendSuper2(&v14, sel_initWithComplication_family_forDevice_, a1, a2, a3);
  uint64_t v11 = qword_268937140;
  unint64_t v12 = (char *)v10;
  if (v11 != -1) {
    swift_once();
  }
  *(_OWORD *)&v12[OBJC_IVAR____TtC20WeatherComplications14BaseDataSource_templateFormatter] = xmmword_268939500;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
  return v12;
}

uint64_t sub_23796DD08()
{
  return sub_23796E9D8();
}

uint64_t sub_23796DD40()
{
  objc_msgSend(v0, sel_family);
  return swift_unknownObjectRetain();
}

uint64_t sub_23796DE64()
{
  return swift_unknownObjectRelease();
}

id sub_23796DE74()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WindDataSource();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23796DEBC()
{
  return type metadata accessor for WindDataSource();
}

uint64_t type metadata accessor for WindDataSource()
{
  uint64_t result = qword_268937A08;
  if (!qword_268937A08) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_23796DF10()
{
  return swift_updateClassMetadata2();
}

void sub_23796DF54(uint64_t a1)
{
  uint64_t v2 = sub_23796E9E8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23796E9D8();
  unint64_t v6 = sub_23796E9C8();
  os_log_type_t v7 = sub_23796EBE8();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_237922000, v6, v7, "Migrating to widget.", v8, 2u);
    MEMORY[0x237E264A0](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v9 = objc_allocWithZone(MEMORY[0x263EFD238]);
  id v10 = (void *)sub_23796EA68();
  uint64_t v11 = (void *)sub_23796EA68();
  unint64_t v12 = (void *)sub_23796EA68();
  id v13 = objc_msgSend(v9, sel_initWithExtensionBundleIdentifier_containerBundleIdentifier_kind_intent_, v10, v11, v12, 0);

  (*(void (**)(uint64_t, id))(a1 + 16))(a1, v13);
}

uint64_t sub_23796E178()
{
  return MEMORY[0x270EEDAC8]();
}

uint64_t sub_23796E188()
{
  return MEMORY[0x270F4DB08]();
}

uint64_t sub_23796E198()
{
  return MEMORY[0x270F4DB10]();
}

uint64_t sub_23796E1A8()
{
  return MEMORY[0x270EEDF80]();
}

uint64_t sub_23796E1B8()
{
  return MEMORY[0x270EEDFA8]();
}

uint64_t sub_23796E1C8()
{
  return MEMORY[0x270EEDFC0]();
}

uint64_t sub_23796E1D8()
{
  return MEMORY[0x270EF06F8]();
}

uint64_t sub_23796E1E8()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_23796E1F8()
{
  return MEMORY[0x270EF07A0]();
}

uint64_t sub_23796E208()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_23796E218()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_23796E228()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_23796E238()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_23796E248()
{
  return MEMORY[0x270F4DB18]();
}

uint64_t sub_23796E258()
{
  return MEMORY[0x270F4DB20]();
}

uint64_t sub_23796E268()
{
  return MEMORY[0x270F4DB28]();
}

uint64_t sub_23796E278()
{
  return MEMORY[0x270F4DB30]();
}

uint64_t sub_23796E288()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_23796E298()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_23796E2A8()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_23796E2B8()
{
  return MEMORY[0x270EF0C70]();
}

uint64_t sub_23796E2C8()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_23796E2D8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_23796E2E8()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t sub_23796E2F8()
{
  return MEMORY[0x270EF0EE0]();
}

uint64_t sub_23796E308()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_23796E318()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_23796E328()
{
  return MEMORY[0x270EF15A8]();
}

uint64_t sub_23796E338()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_23796E348()
{
  return MEMORY[0x270EF1600]();
}

uint64_t sub_23796E358()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_23796E368()
{
  return MEMORY[0x270F06B18]();
}

uint64_t sub_23796E378()
{
  return MEMORY[0x270F06B38]();
}

uint64_t sub_23796E388()
{
  return MEMORY[0x270F06B70]();
}

uint64_t sub_23796E398()
{
  return MEMORY[0x270F06B80]();
}

uint64_t sub_23796E3A8()
{
  return MEMORY[0x270F06B90]();
}

uint64_t sub_23796E3B8()
{
  return MEMORY[0x270F4DB38]();
}

uint64_t sub_23796E3C8()
{
  return MEMORY[0x270F06BA0]();
}

uint64_t sub_23796E3D8()
{
  return MEMORY[0x270F06BB0]();
}

uint64_t sub_23796E3E8()
{
  return MEMORY[0x270F06BC8]();
}

uint64_t sub_23796E3F8()
{
  return MEMORY[0x270F06BF8]();
}

uint64_t sub_23796E408()
{
  return MEMORY[0x270F06C10]();
}

uint64_t sub_23796E418()
{
  return MEMORY[0x270F06C18]();
}

uint64_t sub_23796E428()
{
  return MEMORY[0x270F06C20]();
}

uint64_t sub_23796E438()
{
  return MEMORY[0x270F06C40]();
}

uint64_t sub_23796E448()
{
  return MEMORY[0x270F06C48]();
}

uint64_t sub_23796E458()
{
  return MEMORY[0x270F4DB40]();
}

uint64_t sub_23796E468()
{
  return MEMORY[0x270F4DB48]();
}

uint64_t sub_23796E478()
{
  return MEMORY[0x270F4DB50]();
}

uint64_t sub_23796E488()
{
  return MEMORY[0x270F4DB58]();
}

uint64_t sub_23796E498()
{
  return MEMORY[0x270F4DB60]();
}

uint64_t sub_23796E4A8()
{
  return MEMORY[0x270F06C58]();
}

uint64_t sub_23796E4B8()
{
  return MEMORY[0x270F06C60]();
}

uint64_t sub_23796E4C8()
{
  return MEMORY[0x270F06C68]();
}

uint64_t sub_23796E4D8()
{
  return MEMORY[0x270F06C70]();
}

uint64_t sub_23796E4E8()
{
  return MEMORY[0x270F06C78]();
}

uint64_t sub_23796E4F8()
{
  return MEMORY[0x270F06C80]();
}

uint64_t sub_23796E508()
{
  return MEMORY[0x270F06C88]();
}

uint64_t sub_23796E518()
{
  return MEMORY[0x270F06CC0]();
}

uint64_t sub_23796E528()
{
  return MEMORY[0x270F06D40]();
}

uint64_t sub_23796E538()
{
  return MEMORY[0x270F06D70]();
}

uint64_t sub_23796E548()
{
  return MEMORY[0x270F06D78]();
}

uint64_t sub_23796E558()
{
  return MEMORY[0x270F06E50]();
}

uint64_t sub_23796E568()
{
  return MEMORY[0x270F06E60]();
}

uint64_t sub_23796E578()
{
  return MEMORY[0x270F06EC0]();
}

uint64_t sub_23796E588()
{
  return MEMORY[0x270F06EC8]();
}

uint64_t sub_23796E598()
{
  return MEMORY[0x270F06ED8]();
}

uint64_t sub_23796E5A8()
{
  return MEMORY[0x270F4DB68]();
}

uint64_t sub_23796E5B8()
{
  return MEMORY[0x270F4DB70]();
}

uint64_t sub_23796E5C8()
{
  return MEMORY[0x270F06EE0]();
}

uint64_t sub_23796E5D8()
{
  return MEMORY[0x270F06EF0]();
}

uint64_t sub_23796E5E8()
{
  return MEMORY[0x270F06EF8]();
}

uint64_t sub_23796E5F8()
{
  return MEMORY[0x270F06F48]();
}

uint64_t sub_23796E608()
{
  return MEMORY[0x270F06F50]();
}

uint64_t sub_23796E618()
{
  return MEMORY[0x270F06F60]();
}

uint64_t sub_23796E628()
{
  return MEMORY[0x270F06F68]();
}

uint64_t sub_23796E638()
{
  return MEMORY[0x270F06F70]();
}

uint64_t sub_23796E648()
{
  return MEMORY[0x270F06F80]();
}

uint64_t sub_23796E658()
{
  return MEMORY[0x270F06FE0]();
}

uint64_t sub_23796E668()
{
  return MEMORY[0x270F4DB78]();
}

uint64_t sub_23796E678()
{
  return MEMORY[0x270F07000]();
}

uint64_t sub_23796E688()
{
  return MEMORY[0x270F07008]();
}

uint64_t sub_23796E698()
{
  return MEMORY[0x270F07010]();
}

uint64_t sub_23796E6A8()
{
  return MEMORY[0x270F07018]();
}

uint64_t sub_23796E6B8()
{
  return MEMORY[0x270F07020]();
}

uint64_t sub_23796E6C8()
{
  return MEMORY[0x270F07028]();
}

uint64_t sub_23796E6D8()
{
  return MEMORY[0x270F07030]();
}

uint64_t sub_23796E6E8()
{
  return MEMORY[0x270F07058]();
}

uint64_t sub_23796E6F8()
{
  return MEMORY[0x270F07068]();
}

uint64_t sub_23796E708()
{
  return MEMORY[0x270F07078]();
}

uint64_t sub_23796E718()
{
  return MEMORY[0x270F07080]();
}

uint64_t sub_23796E728()
{
  return MEMORY[0x270F07100]();
}

uint64_t sub_23796E738()
{
  return MEMORY[0x270F07108]();
}

uint64_t sub_23796E748()
{
  return MEMORY[0x270F07110]();
}

uint64_t sub_23796E758()
{
  return MEMORY[0x270F07120]();
}

uint64_t sub_23796E768()
{
  return MEMORY[0x270F07130]();
}

uint64_t sub_23796E778()
{
  return MEMORY[0x270F07138]();
}

uint64_t sub_23796E788()
{
  return MEMORY[0x270F07140]();
}

uint64_t sub_23796E798()
{
  return MEMORY[0x270F07178]();
}

uint64_t sub_23796E7A8()
{
  return MEMORY[0x270F07180]();
}

uint64_t sub_23796E7B8()
{
  return MEMORY[0x270F07188]();
}

uint64_t sub_23796E7C8()
{
  return MEMORY[0x270F071D8]();
}

uint64_t sub_23796E7D8()
{
  return MEMORY[0x270F071E8]();
}

uint64_t sub_23796E7E8()
{
  return MEMORY[0x270F071F8]();
}

uint64_t sub_23796E7F8()
{
  return MEMORY[0x270F07208]();
}

uint64_t sub_23796E808()
{
  return MEMORY[0x270F4DB80]();
}

uint64_t sub_23796E818()
{
  return MEMORY[0x270F4DB88]();
}

uint64_t sub_23796E828()
{
  return MEMORY[0x270F07218]();
}

uint64_t sub_23796E838()
{
  return MEMORY[0x270F07238]();
}

uint64_t sub_23796E848()
{
  return MEMORY[0x270F07240]();
}

uint64_t sub_23796E858()
{
  return MEMORY[0x270F07248]();
}

uint64_t sub_23796E868()
{
  return MEMORY[0x270F07260]();
}

uint64_t sub_23796E878()
{
  return MEMORY[0x270F4DB90]();
}

uint64_t sub_23796E888()
{
  return MEMORY[0x270F4DB98]();
}

uint64_t sub_23796E898()
{
  return MEMORY[0x270F4DBA0]();
}

uint64_t sub_23796E8A8()
{
  return MEMORY[0x270F4DBA8]();
}

uint64_t sub_23796E8B8()
{
  return MEMORY[0x270F4DBB0]();
}

uint64_t sub_23796E8C8()
{
  return MEMORY[0x270F4DBB8]();
}

uint64_t sub_23796E8D8()
{
  return MEMORY[0x270F4DBC0]();
}

uint64_t sub_23796E8E8()
{
  return MEMORY[0x270F4DBC8]();
}

uint64_t sub_23796E8F8()
{
  return MEMORY[0x270F4DBD0]();
}

uint64_t sub_23796E908()
{
  return MEMORY[0x270F4DBD8]();
}

uint64_t sub_23796E918()
{
  return MEMORY[0x270F4DBE0]();
}

uint64_t sub_23796E928()
{
  return MEMORY[0x270F4DBE8]();
}

uint64_t sub_23796E938()
{
  return MEMORY[0x270F4DBF0]();
}

uint64_t sub_23796E948()
{
  return MEMORY[0x270F4DBF8]();
}

uint64_t sub_23796E958()
{
  return MEMORY[0x270F4DC00]();
}

uint64_t sub_23796E968()
{
  return MEMORY[0x270F4DC08]();
}

uint64_t sub_23796E978()
{
  return MEMORY[0x270F4DC10]();
}

uint64_t sub_23796E988()
{
  return MEMORY[0x270F4DC18]();
}

uint64_t sub_23796E998()
{
  return MEMORY[0x270F4DC20]();
}

uint64_t sub_23796E9A8()
{
  return MEMORY[0x270F4DC28]();
}

uint64_t sub_23796E9B8()
{
  return MEMORY[0x270F4DC30]();
}

uint64_t sub_23796E9C8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_23796E9D8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_23796E9E8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_23796E9F8()
{
  return MEMORY[0x270F076E8]();
}

uint64_t sub_23796EA08()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_23796EA18()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_23796EA28()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_23796EA38()
{
  return MEMORY[0x270F9D3F8]();
}

uint64_t sub_23796EA48()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_23796EA58()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_23796EA68()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_23796EA78()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_23796EA88()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_23796EA98()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_23796EAA8()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_23796EAB8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_23796EAC8()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_23796EAD8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_23796EAE8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_23796EAF8()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_23796EB08()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_23796EB18()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_23796EB28()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_23796EB38()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_23796EB48()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_23796EB58()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_23796EB68()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_23796EB78()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_23796EB88()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_23796EB98()
{
  return MEMORY[0x270F9E0C8]();
}

uint64_t sub_23796EBA8()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_23796EBB8()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_23796EBC8()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_23796EBD8()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_23796EBE8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_23796EBF8()
{
  return MEMORY[0x270F4DC38]();
}

uint64_t sub_23796EC08()
{
  return MEMORY[0x270F4DC40]();
}

uint64_t sub_23796EC18()
{
  return MEMORY[0x270F05438]();
}

uint64_t sub_23796EC28()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_23796EC38()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_23796EC48()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_23796EC58()
{
  return MEMORY[0x270EF2470]();
}

uint64_t sub_23796EC68()
{
  return MEMORY[0x270F9E658]();
}

uint64_t sub_23796EC78()
{
  return MEMORY[0x270F9E730]();
}

uint64_t sub_23796EC88()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_23796EC98()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_23796ECA8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_23796ECB8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_23796ECC8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_23796ECD8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_23796ECE8()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_23796ECF8()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_23796ED08()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_23796ED18()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_23796ED28()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_23796ED38()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_23796ED48()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_23796ED58()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_23796ED68()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_23796ED78()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_23796ED88()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_23796EDA8()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_23796EDB8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_23796EDC8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_23796EDD8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_23796EDE8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_23796EDF8()
{
  return MEMORY[0x270FA0130]();
}

uint64_t CLKComplicationGraphicExtraLargeCircularScalingFactor()
{
  return MEMORY[0x270EE3168]();
}

uint64_t CLKStringForComplicationFamily()
{
  return MEMORY[0x270EE3258]();
}

uint64_t NWCExtraLargeScalingFactor()
{
  return MEMORY[0x270F4DAE8]();
}

uint64_t NWCGlyphPrefixedTextProvider()
{
  return MEMORY[0x270F4DAF0]();
}

uint64_t NWCLocalizedImageNamed()
{
  return MEMORY[0x270F4DAF8]();
}

uint64_t NWCLocalizedString()
{
  return MEMORY[0x270F4DB00]();
}

uint64_t NWKUILocalizedString()
{
  return MEMORY[0x270F4DC48]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x270FA0290]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}