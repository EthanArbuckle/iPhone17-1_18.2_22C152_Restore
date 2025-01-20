unint64_t sub_97444(char a1)
{
  unint64_t result;

  result = 0x697461636F766E69;
  switch(a1)
  {
    case 1:
      result = 0x7261646E656C6163;
      break;
    case 2:
      result = 0x7461447472617473;
      break;
    case 3:
      result = 0x746E756F63;
      break;
    case 4:
      result = 0x756F436C61746F74;
      break;
    case 5:
      result = 0xD000000000000018;
      break;
    case 6:
      result = 0xD000000000000016;
      break;
    case 7:
      result = 0xD000000000000017;
      break;
    case 8:
      result = 0xD000000000000012;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_9758C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_7424(&qword_EC668);
  sub_7870();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  sub_7A0C();
  uint64_t v11 = v10 - v9;
  sub_7468(a1, a1[3]);
  sub_97F38();
  sub_B3900();
  sub_B17F0();
  sub_980DC(&qword_E74D8, (void (*)(uint64_t))&type metadata accessor for Date);
  sub_B3790();
  if (!v2)
  {
    v13 = (int *)type metadata accessor for DBCalendarState();
    sub_7424(&qword_EC650);
    sub_98048(&qword_EC670, &qword_EC678);
    sub_B3790();
    sub_98330(2);
    sub_983C8(*(void *)(v3 + v13[7]), 3);
    sub_9835C(*(void *)(v3 + v13[8]), *(unsigned __int8 *)(v3 + v13[8] + 8), 4);
    sub_983C8(*(void *)(v3 + v13[9]), 5);
    sub_B3790();
    sub_98330(7);
    sub_9835C(*(void *)(v3 + v13[12]), *(unsigned __int8 *)(v3 + v13[12] + 8), 8);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v11, v5);
}

uint64_t sub_97878@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v42 = a2;
  uint64_t v3 = sub_7424(&qword_E7D38);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v40 - v7;
  uint64_t v9 = sub_B17F0();
  sub_7870();
  uint64_t v47 = v10;
  __chkstk_darwin(v11);
  sub_7A0C();
  uint64_t v14 = v13 - v12;
  sub_7424(&qword_EC640);
  sub_7870();
  uint64_t v43 = v16;
  uint64_t v44 = v15;
  __chkstk_darwin(v15);
  sub_7A0C();
  uint64_t v19 = v18 - v17;
  uint64_t v48 = type metadata accessor for DBCalendarState();
  sub_79FC();
  __chkstk_darwin(v20);
  sub_17768();
  uint64_t v22 = v21;
  uint64_t v23 = a1[3];
  v49 = a1;
  sub_7468(a1, v23);
  sub_97F38();
  uint64_t v45 = v19;
  v24 = v50;
  sub_B38F0();
  uint64_t v46 = v9;
  if (v24) {
    return sub_74F8((uint64_t)v49);
  }
  v50 = v8;
  v41 = v6;
  LOBYTE(v52) = 0;
  uint64_t v25 = sub_980DC(&qword_E74B8, (void (*)(uint64_t))&type metadata accessor for Date);
  sub_B3710();
  v40[2] = v25;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 32))(v22, v14, v9);
  sub_7424(&qword_EC650);
  char v51 = 1;
  uint64_t v26 = sub_98048(&qword_EC658, &qword_EC660);
  sub_B3710();
  v27 = (int *)v48;
  v40[1] = v26;
  *(void *)(v22 + *(int *)(v48 + 20)) = v52;
  LOBYTE(v52) = 2;
  uint64_t v28 = (uint64_t)v50;
  sub_B36C0();
  uint64_t v29 = (uint64_t)v49;
  sub_97F84(v28, v22 + v27[6]);
  *(void *)(v22 + v27[7]) = sub_98380(3);
  uint64_t v30 = sub_983A4(4);
  uint64_t v31 = v22 + v27[8];
  *(void *)uint64_t v31 = v30;
  *(unsigned char *)(v31 + 8) = v32 & 1;
  *(void *)(v22 + v27[9]) = sub_98380(5);
  char v51 = 6;
  sub_B3710();
  *(void *)(v22 + v27[10]) = v52;
  LOBYTE(v52) = 7;
  uint64_t v33 = (uint64_t)v41;
  sub_B36C0();
  sub_97F84(v33, v22 + v27[11]);
  uint64_t v34 = sub_983A4(8);
  LOBYTE(v33) = v35;
  uint64_t v36 = sub_98318();
  v37(v36);
  uint64_t v38 = v22 + v27[12];
  *(void *)uint64_t v38 = v34;
  *(unsigned char *)(v38 + 8) = v33 & 1;
  sub_34CE8(v22, v42);
  sub_74F8(v29);
  return sub_97FEC(v22);
}

unint64_t sub_97E34()
{
  return sub_97444(*v0);
}

uint64_t sub_97E3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_97070(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_97E64@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_9743C();
  *a1 = result;
  return result;
}

uint64_t sub_97E8C(uint64_t a1)
{
  unint64_t v2 = sub_97F38();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_97EC8(uint64_t a1)
{
  unint64_t v2 = sub_97F38();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_97F04@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_97878(a1, a2);
}

uint64_t sub_97F1C(void *a1)
{
  return sub_9758C(a1);
}

unint64_t sub_97F38()
{
  unint64_t result = qword_EC648;
  if (!qword_EC648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_EC648);
  }
  return result;
}

uint64_t sub_97F84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_7424(&qword_E7D38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_97FEC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DBCalendarState();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_98048(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_20D6C(&qword_EC650);
    sub_980DC(a2, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_980DC(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *storeEnumTagSinglePayload for DBCalendarState.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *uint64_t result = a2 + 8;
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
        JUMPOUT(0x981F0);
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
          *uint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DBCalendarState.CodingKeys()
{
  return &type metadata for DBCalendarState.CodingKeys;
}

unint64_t sub_9822C()
{
  unint64_t result = qword_EC680;
  if (!qword_EC680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_EC680);
  }
  return result;
}

unint64_t sub_9827C()
{
  unint64_t result = qword_EC688;
  if (!qword_EC688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_EC688);
  }
  return result;
}

unint64_t sub_982CC()
{
  unint64_t result = qword_EC690;
  if (!qword_EC690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_EC690);
  }
  return result;
}

uint64_t sub_98318()
{
  return *(void *)(v0 - 136);
}

uint64_t sub_98330@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 72) = a1;
  return sub_B3740();
}

uint64_t sub_9835C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W8>)
{
  *(unsigned char *)(v4 - 72) = a3;
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)(a1, a2, v4 - 72, v3);
}

uint64_t sub_98380@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v2 - 72) = a1;
  return KeyedDecodingContainer.decode(_:forKey:)(v2 - 72, v1);
}

uint64_t sub_983A4@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v2 - 72) = a1;
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v2 - 72, v1);
}

uint64_t sub_983C8@<X0>(uint64_t a1@<X0>, char a2@<W8>)
{
  *(unsigned char *)(v3 - 72) = a2;
  return KeyedEncodingContainer.encode(_:forKey:)(a1, v3 - 72, v2);
}

uint64_t sub_98400()
{
  return v0;
}

unint64_t sub_98428()
{
  return 0xD00000000000001FLL;
}

uint64_t sub_98444()
{
  return 0x5563696666617254;
}

BOOL sub_98468(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_DC0D0;
  v6._object = a2;
  Swift::Int v4 = sub_B3680(v3, v6);
  swift_bridgeObjectRelease();
  return v4 != 0;
}

BOOL sub_984BC@<W0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  BOOL result = sub_98468(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

void sub_984F4(uint64_t a1@<X8>)
{
  *(_WORD *)(a1 + 14) = -4864;
}

unint64_t sub_9851C()
{
  return 0xD00000000000001FLL;
}

unsigned char *storeEnumTagSinglePayload for MapsDialogs(unsigned char *result, int a2, int a3)
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
        *BOOL result = a2;
        return result;
      case 2:
        *(_WORD *)BOOL result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)BOOL result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *BOOL result = 0;
      break;
    case 2:
      *(_WORD *)BOOL result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x985D8);
    case 4:
      *(_DWORD *)BOOL result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for MapsDialogs()
{
  return &type metadata for MapsDialogs;
}

unint64_t sub_98614()
{
  unint64_t result = qword_EC698;
  if (!qword_EC698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_EC698);
  }
  return result;
}

uint64_t sub_98660()
{
  uint64_t v3 = sub_9AB30();
  if (sub_C844(v1, 1, v3) == 1)
  {
    sub_1DC94(v1);
  }
  else
  {
    sub_B3150();
    sub_1DECC();
    uint64_t v4 = sub_9AB1C();
    v5(v4);
  }
  if (*(void *)(v0 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_B3110();
    swift_unknownObjectRelease();
  }
  uint64_t v6 = sub_9AAF8();
  *(void *)(v6 + 16) = v2;
  *(void *)(v6 + 24) = v0;
  return swift_task_create();
}

uint64_t sub_987A0()
{
  uint64_t v3 = sub_9AB30();
  if (sub_C844(v1, 1, v3) == 1)
  {
    sub_1DC94(v1);
  }
  else
  {
    sub_B3150();
    sub_1DECC();
    uint64_t v4 = sub_9AB1C();
    v5(v4);
  }
  if (*(void *)(v0 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_B3110();
    swift_unknownObjectRelease();
  }
  uint64_t v6 = sub_9AAF8();
  *(void *)(v6 + 16) = v2;
  *(void *)(v6 + 24) = v0;
  sub_B1FD0();
  return swift_task_create();
}

uint64_t sub_988E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_B3160();
  if (sub_C844(a1, 1, v6) == 1)
  {
    sub_1DC94(a1);
  }
  else
  {
    sub_B3150();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_B3110();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  sub_7424(&qword_E7D08);
  return swift_task_create();
}

uint64_t sub_98A54(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_98A7C()
{
  return sub_B1C80();
}

uint64_t sub_98B0C()
{
  sub_7FDC();
  v1[109] = v0;
  v1[108] = v2;
  sub_7424(&qword_E76F0);
  v1[110] = swift_task_alloc();
  sub_AC10();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_98B9C()
{
  uint64_t v1 = v0[109];
  v0[111] = OBJC_IVAR____TtC23DailyBriefingFlowPlugin11InitialFlow_logger;
  unint64_t v2 = sub_9AAD8(19);
  sub_8C308(v2, v3, v4, v5, v6, v7);
  sub_7468((void *)(v1 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin11InitialFlow_siriKitEventSender), *(void *)(v1 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin11InitialFlow_siriKitEventSender + 24));
  sub_A1178(131, 4, 0, 0);
  sub_A1D18();
  swift_release();
  uint64_t v8 = OBJC_IVAR____TtC23DailyBriefingFlowPlugin11InitialFlow_aceService;
  v0[112] = OBJC_IVAR____TtC23DailyBriefingFlowPlugin11InitialFlow_aceService;
  sub_7468((void *)(v1 + v8), *(void *)(v1 + v8 + 24));
  v0[113] = sub_B2110();
  v0[114] = v9;
  if (qword_E6BA0 != -1) {
    swift_once();
  }
  v0[115] = qword_F4E70;
  swift_retain();
  uint64_t v10 = (void *)swift_task_alloc();
  v0[116] = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_98D60;
  return sub_D6EC();
}

uint64_t sub_98D60()
{
  sub_7FDC();
  sub_7FC4();
  uint64_t v1 = *v0;
  sub_AB94();
  *unint64_t v2 = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  sub_AC10();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_98E50()
{
  sub_AC48();
  if (qword_E6C00 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[110];
  sub_2497C(v0[113], v0[114]);
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_B3160();
  v0[117] = v2;
  sub_AA40(v1, 1, 1, v2);
  uint64_t v3 = sub_9AAF8();
  *(void *)(v3 + 16) = 0;
  *(void *)(v3 + 24) = 0;
  sub_98660();
  swift_release();
  if (qword_E6C38 != -1) {
    swift_once();
  }
  sub_3599C();
  if (qword_E6E20 != -1) {
    swift_once();
  }
  sub_95210();
  sub_B2260();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[118] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_99010;
  return sub_40A5C();
}

uint64_t sub_99010()
{
  sub_7FDC();
  sub_7FC4();
  *(void *)(v1 + 952) = v0;
  uint64_t v2 = v1 + 776;
  *(void *)(v1 + 960) = v3;
  *(unsigned char *)(v1 + 968) = v4;
  swift_task_dealloc();
  sub_74F8(v2);
  sub_AC10();
  return _swift_task_switch(v5, v6, v7);
}

uint64_t sub_990F8()
{
  uint64_t v61 = v0;
  uint64_t v52 = v0 + 336;
  uint64_t v1 = *(void *)(v0 + 872);
  sub_99ADC(*(void *)(v0 + 952), *(void *)(v0 + 960), *(unsigned char *)(v0 + 968));
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin11InitialFlow_flowSpecs);
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = v0 + 656;
    uint64_t v5 = *(void *)(v0 + 872);
    swift_retain();
    swift_bridgeObjectRetain();
    sub_B3550();
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)(v5 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin11InitialFlow_templatingService);
    uint64_t v54 = v5 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin11InitialFlow_deviceState;
    v55 = *(void **)(v5 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin11InitialFlow_queue);
    uint64_t v8 = v0 + 696;
    uint64_t v56 = v3;
    uint64_t v57 = v2;
    uint64_t v53 = v7;
    do
    {
      uint64_t v9 = *(void *)(v2 + 8 * v6 + 32);
      sub_9A60C(*(void *)(v0 + 872) + *(void *)(v0 + 896), v8);
      sub_9A60C(v54, v4);
      uint64_t v10 = qword_E6BA8;
      id v58 = v55;
      swift_retain();
      uint64_t v11 = v8;
      if (v10 != -1) {
        swift_once();
      }
      ++v6;
      uint64_t v12 = *(void *)(v0 + 960);
      uint64_t v13 = *(void *)(v0 + 952);
      uint64_t v14 = qword_F4E78;
      uint64_t v15 = *(unsigned __int8 *)(v0 + 968);
      uint64_t v16 = type metadata accessor for OfflineStateProvider();
      uint64_t v17 = swift_allocObject();
      v60[3] = v16;
      v60[4] = &off_DEAE0;
      v60[0] = v17;
      uint64_t v18 = *(void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *))(v9 + 256);
      swift_retain();
      uint64_t v19 = v15;
      uint64_t v8 = v11;
      uint64_t v20 = v11;
      uint64_t v4 = v0 + 656;
      v18(v58, v13, v12, v19, v20, v0 + 656, v14, v53, v60);
      sub_B3530();
      sub_B3560();
      sub_B3570();
      sub_B3540();
      uint64_t v2 = v57;
    }
    while (v56 != v6);
    swift_release();
    swift_bridgeObjectRelease();
  }
  uint64_t v21 = *(void *)(v0 + 936);
  uint64_t v22 = *(void *)(v0 + 880);
  uint64_t v23 = *(void *)(v0 + 872);
  uint64_t v24 = v23 + *(void *)(v0 + 896);
  type metadata accessor for DBExecutor(0);
  swift_allocObject();
  unint64_t v25 = swift_bridgeObjectRetain();
  uint64_t v26 = sub_1BB34(v25);
  sub_AA40(v22, 1, 1, v21);
  v27 = (void *)swift_allocObject();
  v27[2] = 0;
  v27[3] = 0;
  v27[4] = v26;
  uint64_t v59 = v26;
  swift_retain();
  sub_98660();
  swift_release();
  sub_9A60C(v24, v0 + 360);
  uint64_t v28 = v23 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin11InitialFlow_deviceState;
  sub_9A60C(v23 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin11InitialFlow_deviceState, v0 + 400);
  uint64_t v29 = qword_F4F40;
  *(void *)(v0 + 464) = type metadata accessor for AppDetecter();
  *(void *)(v0 + 472) = &off_DD2C8;
  *(void *)(v0 + 440) = v29;
  sub_B1ED0();
  swift_allocObject();
  swift_retain();
  uint64_t v50 = sub_B1EC0();
  if (qword_E6BA8 != -1) {
    swift_once();
  }
  char v30 = *(unsigned char *)(v0 + 968);
  uint64_t v31 = *(void *)(v0 + 960);
  uint64_t v32 = *(void *)(v0 + 952);
  uint64_t v33 = *(void *)(v0 + 872);
  uint64_t v34 = qword_F4E78;
  sub_9A60C(v28, v0 + 736);
  uint64_t v35 = *(void *)(v33 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin11InitialFlow_templatingService);
  uint64_t v51 = v28;
  uint64_t v36 = type metadata accessor for TemplatingProvider();
  swift_allocObject();
  uint64_t v37 = sub_68088((long long *)(v0 + 736), v35);
  *(void *)(v0 + 520) = v36;
  *(void *)(v0 + 528) = &off_DDFE8;
  *(void *)(v0 + 496) = v37;
  uint64_t v38 = qword_F5048;
  *(void *)(v0 + 560) = type metadata accessor for AMSSearchService();
  *(void *)(v0 + 568) = &off_DD738;
  *(void *)(v0 + 536) = v38;
  uint64_t v39 = qword_F55E8;
  *(void *)(v0 + 600) = type metadata accessor for DailyBriefingOutputPublisher();
  *(void *)(v0 + 608) = &off_DEDD0;
  *(void *)(v0 + 576) = v39;
  sub_9A60C(v33 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin11InitialFlow_offlineStateProvider, v0 + 616);
  *(void *)(v0 + 336) = v32;
  *(void *)(v0 + 344) = v31;
  *(unsigned char *)(v0 + 352) = v30;
  *(void *)(v0 + 480) = v50;
  *(void *)(v0 + 488) = v34;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  unint64_t v40 = sub_9AAD8(25);
  sub_8C308(v40, v41, v42, v43, v44, v45);
  sub_1F7B4(v52, v0 + 16);
  sub_9A60C(v51, v0 + 816);
  swift_allocObject();
  uint64_t v46 = sub_68088((long long *)(v0 + 816), v35);
  swift_retain();
  swift_retain();
  *(void *)(v0 + 856) = sub_9A7D0((const void *)(v0 + 16), (uint64_t)_swiftEmptyArrayStorage, v59, v46);
  uint64_t v47 = sub_9AAF8();
  *(void *)(v47 + 16) = sub_9A904;
  *(void *)(v47 + 24) = v33;
  type metadata accessor for GreetingFlow();
  sub_9A9E0(&qword_EBC38, (void (*)(uint64_t))type metadata accessor for GreetingFlow);
  swift_retain();
  sub_B1F70();
  swift_release();
  swift_release();
  swift_release();
  sub_1FA58(v52);
  swift_task_dealloc();
  sub_ABD0();
  return v48();
}

uint64_t sub_99744()
{
  return _swift_task_switch(sub_99760, 0, 0);
}

uint64_t sub_99760()
{
  sub_7FDC();
  if (qword_E6CD8 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_F51C8;
  *(void *)(v0 + 16) = qword_F51C8;
  swift_retain();
  return _swift_task_switch(sub_99804, v1, 0);
}

uint64_t sub_99804()
{
  sub_7FDC();
  sub_868AC();
  swift_release();
  sub_ABD0();
  return v0();
}

uint64_t sub_99864(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return _swift_task_switch(sub_99884, 0, 0);
}

uint64_t sub_99884()
{
  sub_7FDC();
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC23DailyBriefingFlowPlugin10DBExecutor_callbackState);
  *(void *)(v0 + 24) = v1;
  swift_retain();
  return _swift_task_switch(sub_99904, v1, 0);
}

uint64_t sub_99904()
{
  sub_7FDC();
  sub_1B88C();
  swift_release();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_999A0;
  return sub_1BEF8();
}

uint64_t sub_999A0()
{
  sub_7FDC();
  sub_7FC4();
  uint64_t v1 = *v0;
  sub_AB94();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_ABD0();
  return v3();
}

uint64_t sub_99A60(uint64_t a1)
{
  sub_7468((void *)(a1 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin11InitialFlow_siriKitEventSender), *(void *)(a1 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin11InitialFlow_siriKitEventSender + 24));
  sub_A1178(131, 4, 0, 0);
  sub_A1D18();

  return swift_release();
}

uint64_t sub_99ADC(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  int v5 = a3;
  uint64_t v6 = sub_7424(&qword_E76F0);
  uint64_t result = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v5 == 1)
  {
    id v10 = [objc_allocWithZone((Class)CLLocation) initWithLatitude:*(double *)&a1 longitude:*(double *)&a2];
    MapsSuggestionsSetMostRecentLocation();

    uint64_t v11 = sub_B3160();
    sub_AA40((uint64_t)v9, 1, 1, v11);
    uint64_t v12 = sub_9AAF8();
    *(void *)(v12 + 16) = 0;
    *(void *)(v12 + 24) = 0;
    sub_988E4((uint64_t)v9, (uint64_t)&unk_EC7C8, v12);
    return swift_release();
  }
  return result;
}

uint64_t sub_99BEC(uint64_t a1)
{
  *(void *)(v1 + 80) = a1;
  return _swift_task_switch(sub_99C0C, 0, 0);
}

uint64_t sub_99C0C()
{
  sub_AC48();
  if (qword_E6CD8 != -1) {
    swift_once();
  }
  *(void *)(v0 + 88) = qword_F51C8;
  swift_retain();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_99CF4;
  return sub_864FC(v0 + 16);
}

uint64_t sub_99CF4()
{
  sub_7FDC();
  sub_7FC4();
  uint64_t v1 = *v0;
  sub_AB94();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_release();
  sub_AC10();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_99DD8()
{
  sub_7FDC();
  sub_12DD0(v0 + 16, *(void *)(v0 + 80));
  sub_ABD0();
  return v1();
}

uint64_t sub_99E34()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin11InitialFlow_logger;
  sub_B2D30();
  sub_1DECC();
  (*(void (**)(uint64_t))(v2 + 8))(v1);

  sub_74F8(v0 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin11InitialFlow_aceService);
  sub_74F8(v0 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin11InitialFlow_deviceState);
  swift_bridgeObjectRelease();
  sub_74F8(v0 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin11InitialFlow_siriKitEventSender);
  swift_release();
  sub_74F8(v0 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin11InitialFlow_offlineStateProvider);
  return v0;
}

uint64_t sub_99F04()
{
  sub_99E34();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_99F5C()
{
  return type metadata accessor for InitialFlow();
}

uint64_t type metadata accessor for InitialFlow()
{
  uint64_t result = qword_EC6C8;
  if (!qword_EC6C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_99FAC()
{
  uint64_t result = sub_B2D30();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_9A07C()
{
  return sub_98A7C();
}

uint64_t sub_9A0A0()
{
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *unint64_t v1 = v0;
  v1[1] = sub_A7BC;
  return sub_98B0C();
}

uint64_t sub_9A13C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for InitialFlow();

  return Flow<>.exitValue.getter(v3, a2);
}

uint64_t sub_9A178()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_9A1B0()
{
  sub_AC48();
  sub_9AB10();
  uint64_t v0 = swift_task_alloc();
  unint64_t v1 = (void *)sub_1DEA8(v0);
  *unint64_t v1 = v2;
  v1[1] = sub_AB58;
  uint64_t v3 = sub_52828();
  return sub_99BEC(v3);
}

uint64_t sub_9A240(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_9AAD4;
  return v6(a1);
}

uint64_t sub_9A31C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_77FB4;
  return v6(a1);
}

uint64_t sub_9A3F8()
{
  sub_AC48();
  sub_9AB10();
  uint64_t v0 = swift_task_alloc();
  unint64_t v1 = (void *)sub_1DEA8(v0);
  *unint64_t v1 = v2;
  v1[1] = sub_AB58;
  uint64_t v3 = sub_52828();
  return v4(v3);
}

uint64_t sub_9A494()
{
  sub_AC48();
  sub_9AB10();
  uint64_t v0 = swift_task_alloc();
  unint64_t v1 = (void *)sub_1DEA8(v0);
  *unint64_t v1 = v2;
  v1[1] = sub_AB58;
  sub_52828();
  return sub_99744();
}

uint64_t sub_9A524()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_9A564()
{
  sub_AC48();
  uint64_t v2 = v1;
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v5 = v0[4];
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = (void *)sub_1DEA8(v6);
  *uint64_t v7 = v8;
  v7[1] = sub_AB58;
  return sub_99864(v2, v3, v4, v5);
}

uint64_t sub_9A60C(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  sub_1DECC();
  (*v3)(a2);
  return a2;
}

uint64_t sub_9A66C(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v15 = type metadata accessor for TemplatingProvider();
  uint64_t v16 = &off_DDFE8;
  *(void *)&long long v14 = a4;
  uint64_t v10 = OBJC_IVAR____TtC23DailyBriefingFlowPlugin12GreetingFlow_logger;
  if (qword_E6D78 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_B2D30();
  uint64_t v12 = sub_B378(v11, (uint64_t)qword_F53C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(a5 + v10, v12, v11);
  *(unsigned char *)(a5 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin12GreetingFlow_name) = 0;
  *(unsigned char *)(a5 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin12GreetingFlow_state) = 0;
  memcpy((void *)(a5 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin12GreetingFlow_flowParams), a1, 0x140uLL);
  *(void *)(a5 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin12GreetingFlow_allFlowSpecs) = a2;
  *(void *)(a5 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin12GreetingFlow_executor) = a3;
  sub_B3B0(&v14, a5 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin12GreetingFlow_templatingProvider);
  return a5;
}

uint64_t sub_9A7D0(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v17 = type metadata accessor for TemplatingProvider();
  uint64_t v18 = &off_DDFE8;
  v16[0] = a4;
  type metadata accessor for GreetingFlow();
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = sub_A918((uint64_t)v16, v17);
  __chkstk_darwin(v9);
  uint64_t v11 = (void *)((char *)&v16[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v12 + 16))(v11);
  uint64_t v13 = sub_9A66C(a1, a2, a3, *v11, v8);
  sub_74F8((uint64_t)v16);
  return v13;
}

uint64_t sub_9A904()
{
  return sub_99A60(v0);
}

uint64_t sub_9A90C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_9A944()
{
  sub_AC48();
  sub_9AB10();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_1DEA8(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_AB58;
  uint64_t v3 = sub_52828();
  return v4(v3);
}

uint64_t sub_9A9E0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_9AA28()
{
  sub_AC48();
  sub_9AB10();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_1DEA8(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_A7BC;
  uint64_t v3 = sub_52828();
  return v4(v3);
}

unint64_t sub_9AAD8(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000;
}

uint64_t sub_9AAF8()
{
  return swift_allocObject();
}

uint64_t sub_9AB1C()
{
  return v0;
}

uint64_t sub_9AB30()
{
  return sub_B3160();
}

uint64_t RREntity.init<A>(_:appBundleId:)@<X0>(uint64_t a1@<X3>, uint64_t a2@<X4>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_7424(&qword_EC820);
  __chkstk_darwin(v6 - 8);
  sub_7A0C();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = sub_7424(&qword_E8B68);
  __chkstk_darwin(v10 - 8);
  sub_7A0C();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = *(void *)(a2 + 8);
  if (!sub_9AE40(a1, v14)) {
    goto LABEL_5;
  }
  (*(void (**)(uint64_t, uint64_t))(v14 + 16))(a1, v14);
  if (!v15)
  {
    swift_release();
LABEL_5:
    swift_bridgeObjectRelease();
    if (qword_E6D58 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_B2D30();
    sub_B378(v17, (uint64_t)qword_F5360);
    sub_8C2F0(0xD000000000000019, 0x80000000000B84D0, 0xD000000000000036, 0x80000000000B8460, 0xD000000000000014, 0x80000000000B84F0);
    swift_unknownObjectRelease();
    goto LABEL_10;
  }
  uint64_t v16 = sub_B2D50();
  sub_AA40(v9, 1, 1, v16);
  sub_B2D60();
  uint64_t v18 = sub_B2D90();
  sub_AA40(v13, 0, 1, v18);
  sub_B2D90();
  if (!sub_C844(v13, 1, v18))
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32))(a3, v13, v18);
    uint64_t v21 = a3;
    uint64_t v22 = 0;
    uint64_t v20 = v18;
    return sub_AA40(v21, v22, 1, v20);
  }
  sub_9B178(v13);
LABEL_10:
  uint64_t v20 = sub_B2D90();
  uint64_t v21 = a3;
  uint64_t v22 = 1;
  return sub_AA40(v21, v22, 1, v20);
}

uint64_t sub_9AE40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_B2D30();
  sub_7870();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_7A0C();
  uint64_t v10 = v9 - v8;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v12 = sub_B3380();
  sub_7870();
  uint64_t v14 = v13;
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)v35 - v16;
  (*(void (**)(uint64_t, uint64_t))(a2 + 24))(a1, a2);
  if (sub_C844((uint64_t)v17, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v12);
LABEL_6:
    if (qword_E6D58 != -1) {
      swift_once();
    }
    sub_B378(v4, (uint64_t)qword_F5360);
    sub_57430();
    sub_8C2F0(v21, v22, v23, v24, v25, v26);
    return 0;
  }
  sub_B2500();
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_6;
  }
  unint64_t v18 = v36;
  uint64_t v19 = sub_B2590();
  if (!v19)
  {
    if (qword_E6D58 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_B378(v4, (uint64_t)qword_F5360);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v10, v28, v4);
    unint64_t v36 = 0;
    unint64_t v37 = 0xE000000000000000;
    sub_B34C0(28);
    swift_bridgeObjectRelease();
    unint64_t v36 = 0xD00000000000001ALL;
    unint64_t v37 = 0x80000000000B8550;
    v35[1] = v18;
    swift_retain();
    v38._countAndFlagsBits = sub_B2FA0();
    sub_B3020(v38);
    swift_bridgeObjectRelease();
    sub_57430();
    sub_8C2F0(v29, v30, v31, v32, v33, v34);
    swift_release();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v10, v4);
    return 0;
  }
  uint64_t v20 = v19;
  swift_release();
  return v20;
}

uint64_t sub_9B178(uint64_t a1)
{
  uint64_t v2 = sub_7424(&qword_E8B68);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_9B1D8()
{
  sub_B2B30();
  sub_5BCC();
  sub_B2B20();
  sub_B17A0();
  sub_B2B10();
  swift_release();
  uint64_t v0 = sub_B2B00();
  swift_release();
  return v0;
}

uint64_t sub_9B250()
{
  sub_B2B80();
  sub_5BCC();
  sub_B2B70();
  sub_B2B60();
  swift_release();
  uint64_t v0 = sub_B2B50();
  swift_release();
  return v0;
}

void sub_9B2C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  sub_920F0();
  a19 = v23;
  a20 = v24;
  unint64_t v26 = v25;
  uint64_t v27 = sub_B2C40();
  uint64_t v28 = sub_13294(v27);
  __chkstk_darwin(v28);
  sub_9C0C4();
  uint64_t v29 = sub_7424(&qword_E7D38);
  uint64_t v30 = sub_13294(v29);
  __chkstk_darwin(v30);
  sub_9C0A8();
  __chkstk_darwin(v31);
  uint64_t v33 = (char *)&a9 - v32;
  uint64_t v34 = sub_B17F0();
  sub_7870();
  uint64_t v36 = v35;
  __chkstk_darwin(v37);
  sub_57488();
  uint64_t v38 = 0;
  if ((sub_589D4() & 1) == 0)
  {
    id v39 = [v26 temporalEventTrigger];
    if (v39)
    {
      unint64_t v40 = v39;
      id v41 = [v39 dateComponentsRange];

      id v42 = [v41 startDate];
      if (v42)
      {
        sub_B17C0();

        uint64_t v43 = 0;
      }
      else
      {
        uint64_t v43 = 1;
      }
      sub_AA40(v22, v43, 1, v34);
      sub_97F84(v22, (uint64_t)v33);
      if (sub_C844((uint64_t)v33, 1, v34) != 1)
      {
        (*(void (**)(uint64_t, char *, uint64_t))(v36 + 32))(v21, v33, v34);
        sub_B2B40();
        uint64_t v38 = sub_9B1D8();
        (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v21, v34);
        goto LABEL_10;
      }
    }
    else
    {
      sub_AA40((uint64_t)v33, 1, 1, v34);
    }
    sub_531B0((uint64_t)v33, &qword_E7D38);
    uint64_t v38 = 0;
  }
LABEL_10:
  id v44 = [v26 title];
  id v45 = [v44 spokenPhrase];

  sub_B2F50();
  sub_131D4();
  LOBYTE(v44) = sub_589D4();

  type metadata accessor for DBReminder();
  sub_5BCC();
  sub_B3EC(v20, v38, v44 & 1);
  sub_92108();
}

void sub_9B574()
{
  sub_920F0();
  uint64_t v1 = (unsigned char *)v0;
  char v2 = *(unsigned char *)v0;
  unint64_t v4 = *(void *)(v0 + 8);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v5 = *(void *)(v0 + 24);
  unint64_t v6 = *(void *)(v0 + 32);
  uint64_t v7 = *(void *)(v0 + 40);
  uint64_t v8 = *(void *)(v0 + 48);
  type metadata accessor for WeatherAirQuality();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v9 = sub_A8710(v1);
  swift_allocObject();
  sub_A9110(v2, v3, v5, v4, v6, v7, v8, v9 & 1);
  sub_9C014((uint64_t)v1);
  sub_92108();
}

void sub_9B624()
{
  sub_920F0();
  char v2 = v1;
  uint64_t v4 = v3;
  uint64_t v31 = sub_B17F0();
  sub_7870();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_18E00();
  uint64_t v30 = v8;
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v28 - v10;
  uint64_t v12 = sub_7424(&qword_E7878);
  uint64_t v13 = sub_13294(v12);
  __chkstk_darwin(v13);
  sub_7A0C();
  uint64_t v16 = v15 - v14;
  uint64_t v17 = sub_B2C40();
  uint64_t v18 = sub_13294(v17);
  __chkstk_darwin(v18);
  sub_57488();
  uint64_t v19 = (int *)type metadata accessor for CurrentWeatherForecast();
  sub_19008(*(unsigned char *)(v4 + v19[7]));
  sub_131D4();
  sub_B2AC0();
  uint64_t v20 = sub_7424((uint64_t *)&unk_E7880);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16))(v16, v4, v20);
  sub_AA40(v16, 0, 1, v20);
  uint64_t v21 = sub_9BD38(v16, v2);
  sub_531B0(v16, &qword_E7878);
  if (v21)
  {
    uint64_t v22 = v4 + v19[5];
    uint64_t v29 = sub_9BD38(v22, v2);
    uint64_t v23 = v4 + v19[6];
    uint64_t v28 = sub_9BD38(v23, v2);
    uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    uint64_t v25 = v31;
    v24(v11, v4 + v19[8], v31);
    BOOL v26 = sub_C3D4(v4, v22, (uint64_t)v11);
    LOBYTE(v23) = sub_C5D8(v4, v23, (uint64_t)v11);
    v24(v30, (uint64_t)v11, v25);
    char v27 = sub_7256C() == 1;
    sub_9C04C(v4);
    type metadata accessor for WeatherCurrent();
    sub_5BCC();
    sub_605C(v0, v21, v29, v28, (uint64_t)v11, v26, v23 & 1, v27);
    sub_92108();
  }
  else
  {
    __break(1u);
  }
}

void sub_9B8C0()
{
  sub_920F0();
  unint64_t v1 = v0;
  uint64_t v2 = sub_B17F0();
  sub_7870();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_7A0C();
  uint64_t v8 = v7 - v6;
  uint64_t v52 = sub_B2C40();
  sub_7870();
  uint64_t v10 = v9;
  __chkstk_darwin(v11);
  sub_18E00();
  v49 = v12;
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v44 - v15;
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v19 = (char *)&v44 - v18;
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v44 - v20;
  sub_131D4();
  sub_131D4();
  sub_B2B40();
  sub_B17E0();
  uint64_t v53 = sub_9B1D8();
  uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v22(v8, v2);
  sub_B17E0();
  uint64_t v54 = sub_9B1D8();
  uint64_t v51 = v22;
  v22(v8, v2);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_B3620();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v23 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
  }
  if (v23 < 1)
  {
    uint64_t v30 = v53;
LABEL_16:
    swift_bridgeObjectRelease();
    uint64_t v41 = v54;
    goto LABEL_19;
  }
  uint64_t v55 = v4;
  sub_21550(0, (v1 & 0xC000000000000001) == 0, v1);
  unint64_t v50 = v1 & 0xC000000000000001;
  uint64_t v48 = v19;
  if ((v1 & 0xC000000000000001) != 0) {
    uint64_t v24 = sub_B34F0();
  }
  else {
    uint64_t v24 = swift_retain();
  }
  char v25 = *(unsigned char *)(v24 + 16);
  swift_release();
  sub_19008(v25);
  sub_131D4();
  BOOL v26 = *(void (**)(char *, uint64_t))(v10 + 8);
  uint64_t v27 = v10;
  uint64_t v28 = v52;
  uint64_t v46 = v26;
  v26(v21, v52);
  id v45 = *(void (**)(char *, char *, uint64_t))(v27 + 32);
  v45(v21, v16, v28);
  if (v50)
  {
    uint64_t v29 = sub_B34F0();
  }
  else
  {
    uint64_t v29 = *(void *)(v1 + 32);
    swift_retain();
  }
  uint64_t v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(v55 + 16);
  v55 += 16;
  uint64_t v47 = v31;
  v31(v8, v29 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin21WeatherConditionEvent_startTime, v2);
  swift_release();
  uint64_t v30 = sub_9B1D8();
  swift_release();
  uint64_t v32 = sub_9C0DC();
  v33(v32);
  if ((unint64_t)v23 < 2)
  {
    uint64_t v19 = v48;
    goto LABEL_16;
  }
  uint64_t v53 = v30;
  unint64_t v34 = v50;
  sub_21550(1uLL, v50 == 0, v1);
  if (v34) {
    uint64_t v35 = sub_B34F0();
  }
  else {
    uint64_t v35 = swift_retain();
  }
  char v36 = *(unsigned char *)(v35 + 16);
  swift_release();
  sub_19008(v36);
  uint64_t v37 = v49;
  sub_131D4();
  uint64_t v38 = v48;
  uint64_t v39 = v52;
  v46(v48, v52);
  uint64_t v19 = v38;
  v45(v38, v37, v39);
  if (v50)
  {
    uint64_t v40 = sub_B34F0();
  }
  else
  {
    uint64_t v40 = *(void *)(v1 + 40);
    swift_retain();
  }
  uint64_t v30 = v53;
  swift_bridgeObjectRelease();
  v47(v8, v40 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin21WeatherConditionEvent_startTime, v2);
  swift_release();
  uint64_t v41 = sub_9B1D8();
  swift_release();
  uint64_t v42 = sub_9C0DC();
  v43(v42);
LABEL_19:
  type metadata accessor for WeatherExpected();
  sub_5BCC();
  sub_1A404((uint64_t)v21, (uint64_t)v19, v30, v41);
  sub_92108();
}

uint64_t sub_9BD38(uint64_t a1, char a2)
{
  uint64_t v6 = sub_7424(&qword_EC828);
  uint64_t v7 = sub_13294(v6);
  __chkstk_darwin(v7);
  sub_9C0C4();
  uint64_t v8 = sub_7424(&qword_E7878);
  uint64_t v9 = sub_13294(v8);
  __chkstk_darwin(v9);
  sub_7A0C();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = sub_7424((uint64_t *)&unk_E7880);
  sub_7870();
  uint64_t v15 = v14;
  __chkstk_darwin(v16);
  sub_9C0A8();
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v25 - v18;
  sub_C7DC(a1, v12);
  if (sub_C844(v12, 1, v13) == 1)
  {
    sub_531B0(v12, &qword_E7878);
    return 0;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 32))(v19, v12, v13);
    id v21 = objc_msgSend(self, *(SEL *)off_DF038[a2]);
    sub_B14B0();

    sub_B14A0();
    uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v22(v3, v13);
    sub_B2AB0();
    sub_5BCC();
    sub_B2AA0();
    sub_B2AF0();
    swift_release();
    sub_131D4();
    uint64_t v23 = sub_B2C40();
    sub_AA40(v2, 0, 1, v23);
    sub_B2AE0();
    swift_release();
    sub_531B0(v2, &qword_EC828);
    uint64_t v20 = sub_B2AD0();
    swift_release();
    v22((uint64_t)v19, v13);
  }
  return v20;
}

uint64_t sub_9C014(uint64_t a1)
{
  return a1;
}

uint64_t sub_9C04C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CurrentWeatherForecast();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_9C0DC()
{
  return v0;
}

uint64_t sub_9C0F0(uint64_t a1)
{
  return 1000000000000000 * a1;
}

uint64_t sub_9C124()
{
  return sub_B1C80();
}

uint64_t sub_9C1B4()
{
  sub_7FDC();
  v1[5] = v2;
  v1[6] = v0;
  uint64_t v3 = sub_7424(&qword_E76E0);
  sub_13294(v3);
  v1[7] = sub_131EC();
  sub_AC10();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_9C234()
{
  uint64_t v1 = v0[6];
  v0[8] = OBJC_IVAR____TtC23DailyBriefingFlowPlugin12WarningsFlow_logger;
  sub_7A1C();
  sub_A164C(v2, v3);
  uint64_t v4 = OBJC_IVAR____TtC23DailyBriefingFlowPlugin12WarningsFlow_siriKitEventSender;
  v0[9] = OBJC_IVAR____TtC23DailyBriefingFlowPlugin12WarningsFlow_siriKitEventSender;
  uint64_t v5 = (void *)(v1 + v4);
  sub_7468((void *)(v1 + v4), *(void *)(v1 + v4 + 24));
  sub_A1600();
  sub_A1D18();
  swift_release();
  uint64_t v6 = OBJC_IVAR____TtC23DailyBriefingFlowPlugin12WarningsFlow_flowParams;
  v0[10] = OBJC_IVAR____TtC23DailyBriefingFlowPlugin12WarningsFlow_flowParams;
  sub_7468((void *)(v1 + v6 + 280), *(void *)(v1 + v6 + 304));
  if (sub_8EAE8())
  {
    sub_A164C(0xD000000000000027, 0x80000000000BC160);
    sub_7468(v5, v5[3]);
    sub_A1600();
    sub_A1D18();
    swift_release();
    swift_task_alloc();
    sub_A18E0();
    v0[11] = v7;
    *uint64_t v7 = v8;
    v7[1] = sub_9C438;
    sub_A1970();
    return sub_9F1D8();
  }
  else
  {
    uint64_t v10 = (void *)swift_task_alloc();
    v0[12] = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_9C518;
    sub_A1804();
    return sub_9DED8();
  }
}

uint64_t sub_9C438()
{
  sub_7FDC();
  sub_34FFC();
  uint64_t v1 = *v0;
  sub_AB94();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_9C518()
{
  sub_7FDC();
  sub_7FC4();
  sub_2B6A4();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(unsigned char *)(v1 + 272) = v3;
  swift_task_dealloc();
  sub_AC10();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_9C5E8()
{
  sub_AC48();
  if (*(unsigned char *)(v1 + 272) == 1)
  {
    sub_A1944();
    sub_A1938();
    sub_7A1C();
    sub_A1624(v2, v3, 0xD00000000000002ALL, 0x80000000000BBE40);
    sub_7468(v0, v0[3]);
    sub_A1600();
    sub_A1D18();
    swift_release();
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v1 + 104) = v4;
    *uint64_t v4 = v1;
    v4[1] = sub_9C750;
    sub_A1804();
    return sub_9FBE8();
  }
  else
  {
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v1 + 152) = v6;
    *uint64_t v6 = v1;
    v6[1] = sub_9CD18;
    sub_A1804();
    return sub_9E504();
  }
}

uint64_t sub_9C750()
{
  sub_7FDC();
  sub_7FC4();
  sub_2B6A4();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 112) = v3;
  swift_task_dealloc();
  sub_AC10();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_9C820()
{
  sub_7FDC();
  sub_A1778();
  *(void *)(v1 + 120) = v0;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 128) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_9C8C4;
  sub_A192C();
  return sub_3411C(v3, v4, v5);
}

uint64_t sub_9C8C4()
{
  sub_7FDC();
  sub_7FC4();
  uint64_t v1 = *v0;
  sub_AB94();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_AC10();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_9C98C()
{
  sub_46E44();
  uint64_t v1 = *(void **)(v0 + 112);
  sub_A16A4();
  uint64_t v2 = sub_B2090();
  sub_A16E8(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_9CA48;
  sub_A16D0();
  sub_40484();
  return sub_938F4(v5, v6, v7, v8);
}

uint64_t sub_9CA48(uint64_t a1, char a2)
{
  sub_34FFC();
  uint64_t v7 = v6;
  sub_AB94();
  *uint64_t v8 = v7;
  uint64_t v9 = *(void **)(v2 + 112);
  uint64_t v10 = *(void *)(v2 + 56);
  uint64_t v11 = *v3;
  *uint64_t v8 = *v3;
  swift_task_dealloc();

  sub_A9CC(a1, a2 & 1);
  sub_A1530(v10, &qword_E76E0);
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v7 + 144) = v12;
  *uint64_t v12 = v11;
  v12[1] = sub_9CBE8;
  sub_FCFC();
  return sub_A40F8(v13, v14);
}

uint64_t sub_9CBE8()
{
  sub_7FDC();
  sub_7FC4();
  uint64_t v1 = *v0;
  sub_AB94();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_AC10();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_9CCB0()
{
  sub_7FDC();
  uint64_t v1 = *(void **)(v0 + 112);
  sub_B1FB0();

  swift_task_dealloc();
  sub_ABD0();
  return v2();
}

uint64_t sub_9CD18()
{
  sub_7FDC();
  sub_7FC4();
  sub_2B6A4();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(unsigned char *)(v1 + 273) = v3;
  swift_task_dealloc();
  sub_AC10();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_9CDE8()
{
  sub_AC48();
  if (*(unsigned char *)(v1 + 273) == 1)
  {
    sub_A1944();
    sub_7A1C();
    sub_ABC4();
    sub_A1624(0xD000000000000025, v2, v3, v4);
    sub_7468(v0, v0[3]);
    sub_A1600();
    sub_A1D18();
    swift_release();
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v1 + 160) = v5;
    *uint64_t v5 = v1;
    v5[1] = sub_9CF50;
    sub_A1804();
    return sub_A00D4();
  }
  else
  {
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v1 + 200) = v7;
    *uint64_t v7 = v1;
    v7[1] = sub_9D524;
    sub_A1804();
    return sub_9ECBC();
  }
}

uint64_t sub_9CF50()
{
  sub_7FDC();
  sub_7FC4();
  sub_2B6A4();
  *unint64_t v2 = v1;
  *unint64_t v2 = *v0;
  *(void *)(v1 + 168) = v3;
  swift_task_dealloc();
  sub_AC10();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_9D020()
{
  sub_7FDC();
  sub_A1778();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_9D0C0;
  sub_A192C();
  return sub_3411C(v2, v3, v4);
}

uint64_t sub_9D0C0()
{
  sub_7FDC();
  sub_7FC4();
  uint64_t v1 = *v0;
  sub_AB94();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_AC10();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_9D188()
{
  sub_46E44();
  uint64_t v1 = *(void **)(v0 + 168);
  sub_A16A4();
  uint64_t v2 = sub_B2090();
  sub_A16E8(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 184) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_9D244;
  sub_A16D0();
  sub_40484();
  return sub_938F4(v5, v6, v7, v8);
}

uint64_t sub_9D244(uint64_t a1, char a2)
{
  uint64_t v5 = *v2;
  uint64_t v6 = *v2;
  sub_AB94();
  *uint64_t v7 = v6;
  uint64_t v8 = *(void **)(v5 + 168);
  uint64_t v9 = *(void *)(v5 + 56);
  uint64_t v10 = *v2;
  *uint64_t v7 = *v2;
  swift_task_dealloc();

  sub_A9CC(a1, a2 & 1);
  sub_A1530(v9, &qword_E76E0);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v6 + 192) = v11;
  *uint64_t v11 = v10;
  v11[1] = sub_9D3FC;
  return sub_9F1D8();
}

uint64_t sub_9D3FC()
{
  sub_7FDC();
  sub_7FC4();
  uint64_t v1 = *v0;
  sub_AB94();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_AC10();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_9D4C4()
{
  sub_7FDC();

  swift_task_dealloc();
  sub_ABD0();
  return v1();
}

uint64_t sub_9D524()
{
  sub_7FDC();
  sub_7FC4();
  sub_2B6A4();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(unsigned char *)(v1 + 274) = v3;
  swift_task_dealloc();
  sub_AC10();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_9D5F4()
{
  sub_AC48();
  sub_A1938();
  if (*(unsigned char *)(v0 + 274) == 1)
  {
    uint64_t v1 = (void *)(*(void *)(v0 + 48) + *(void *)(v0 + 72));
    sub_7A1C();
    sub_A1624(v2, v3, 0xD00000000000002ALL, 0x80000000000BBE40);
    sub_7468(v1, v1[3]);
    sub_A1600();
    sub_A1D18();
    swift_release();
    type metadata accessor for ModeInfoProvider();
    *(void *)(v0 + 208) = swift_initStackObject();
    *(void *)(v0 + 216) = sub_6A0DC();
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 224) = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_9D810;
    sub_A1804();
    return sub_A03D8();
  }
  else
  {
    uint64_t v6 = (void *)(*(void *)(v0 + 48) + *(void *)(v0 + 72));
    sub_7A1C();
    sub_8C308(v7, v8, 0xD00000000000002ALL, 0x80000000000BBE40, 0x2865747563657865, 0xE900000000000029);
    sub_7468(v6, v6[3]);
    sub_A1600();
    sub_A1D18();
    swift_release();
    swift_task_alloc();
    sub_A18E0();
    *(void *)(v0 + 264) = v9;
    *uint64_t v9 = v10;
    v9[1] = sub_9DDF8;
    sub_A1970();
    return sub_9F1D8();
  }
}

uint64_t sub_9D810()
{
  sub_7FDC();
  sub_7FC4();
  sub_2B6A4();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 232) = v3;
  swift_task_dealloc();
  sub_AC10();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_9D8E0()
{
  sub_7FDC();
  sub_A1778();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 240) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_9D980;
  sub_A192C();
  return sub_3411C(v2, v3, v4);
}

uint64_t sub_9D980()
{
  sub_7FDC();
  sub_7FC4();
  uint64_t v1 = *v0;
  sub_AB94();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_AC10();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_9DA48()
{
  sub_46E44();
  uint64_t v1 = *(void **)(v0 + 232);
  sub_A16A4();
  uint64_t v2 = sub_B2090();
  sub_A16E8(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 248) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_9DB04;
  sub_A16D0();
  sub_40484();
  return sub_938F4(v5, v6, v7, v8);
}

uint64_t sub_9DB04()
{
  sub_AC48();
  char v2 = v1;
  uint64_t v4 = v3;
  sub_7FC4();
  char v6 = *(void **)(v5 + 232);
  uint64_t v7 = *(void *)(v5 + 56);
  uint64_t v8 = *v0;
  sub_AB94();
  *uint64_t v9 = v8;
  swift_task_dealloc();

  sub_A9CC(v4, v2 & 1);
  sub_A1530(v7, &qword_E76E0);
  sub_AC10();
  return _swift_task_switch(v10, v11, v12);
}

uint64_t sub_9DC24()
{
  sub_7FDC();
  sub_6A2EC();
  swift_task_alloc();
  sub_A18E0();
  *(void *)(v0 + 256) = v1;
  *char v1 = v2;
  v1[1] = sub_9DCC4;
  return sub_9F1D8();
}

uint64_t sub_9DCC4()
{
  sub_7FDC();
  sub_7FC4();
  uint64_t v1 = *v0;
  sub_AB94();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_AC10();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_9DD8C()
{
  sub_7FDC();

  swift_release();
  swift_task_dealloc();
  sub_ABD0();
  return v1();
}

uint64_t sub_9DDF8()
{
  sub_7FDC();
  sub_34FFC();
  uint64_t v1 = *v0;
  sub_AB94();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_9DED8()
{
  *(void *)(v1 + 16) = v0;
  return sub_FCA0((uint64_t)sub_9DEF0);
}

uint64_t sub_9DEF0()
{
  sub_46E44();
  if (sub_A1734(*(void *)(v1 + 16)))
  {
    sub_7A1C();
    sub_ABC4();
    sub_52848();
    sub_8C320(v3, v4, v5, v6, 0xD000000000000018, v7);
    sub_A1820();
    sub_40484();
    __asm { BRAA            X2, X16 }
  }
  uint64_t v10 = sub_7468(v2 + 13, v2[16]);
  *(unsigned char *)(v1 + 64) = sub_B06BC(*v10, v0) & 1;
  *(void *)(v1 + 24) = v2[19];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v1 + 32) = v11;
  *uint64_t v11 = v1;
  v11[1] = sub_9E054;
  sub_A192C();
  sub_40484();
  return sub_3398C(v12, v13, v14);
}

uint64_t sub_9E054()
{
  sub_AC48();
  sub_34FFC();
  uint64_t v2 = v1;
  sub_AB94();
  *uint64_t v3 = v2;
  uint64_t v4 = *v0;
  sub_2B6A4();
  *uint64_t v5 = v4;
  *(unsigned char *)(v2 + 65) = v6;
  swift_task_dealloc();
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 40) = v7;
  *unint64_t v7 = v4;
  v7[1] = sub_9E170;
  return sub_F26C(1);
}

uint64_t sub_9E170()
{
  sub_7FDC();
  sub_7FC4();
  sub_2B6A4();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 48) = v3;
  *(void *)(v1 + 56) = v4;
  swift_task_dealloc();
  sub_AC10();
  return _swift_task_switch(v5, v6, v7);
}

#error "9E4D4: call analysis failed (funcsize=149)"

uint64_t sub_9E504()
{
  *(void *)(v1 + 16) = v0;
  return sub_FCA0((uint64_t)sub_9E51C);
}

void sub_9E51C()
{
  sub_46E44();
  uint64_t v2 = v0[2];
  v0[3] = OBJC_IVAR____TtC23DailyBriefingFlowPlugin12WarningsFlow_flowParams;
  if (sub_A1734(v2))
  {
    sub_7A1C();
    sub_ABC4();
    sub_52848();
    sub_8C320(0xD00000000000001ALL, v3, v4, v5, v6, v7);
    sub_A1820();
    sub_40484();
    __asm { BRAA            X2, X16 }
  }
  v0[4] = v1[19];
  sub_7468(v1 + 13, v1[16]);
  uint64_t v10 = (void *)sub_35128();
  v0[5] = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_9E670;
  sub_40484();
  __asm { BR              X3 }
}

uint64_t sub_9E670()
{
  sub_AC48();
  sub_34FFC();
  uint64_t v3 = v2;
  sub_AB94();
  *uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v0 + 16);
  uint64_t v6 = *v1;
  sub_2B6A4();
  *unint64_t v7 = v6;
  *(unsigned char *)(v3 + 64) = v8;
  swift_task_dealloc();
  uint64_t v9 = v5 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin12WarningsFlow_now;
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v3 + 48) = v10;
  *uint64_t v10 = v6;
  v10[1] = sub_9E7B0;
  uint64_t v11 = *(void *)(v0 + 32);
  return sub_3398C(7, v11, v9);
}

uint64_t sub_9E7B0()
{
  sub_7FDC();
  sub_7FC4();
  sub_2B6A4();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(unsigned char *)(v1 + 65) = v3;
  swift_task_dealloc();
  sub_AC10();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_9E880()
{
  sub_7FDC();
  uint64_t v1 = v0[2] + v0[3];
  uint64_t v2 = *sub_7468((void *)(v1 + 200), *(void *)(v1 + 224));
  char v3 = (void *)sub_35128();
  v0[7] = v3;
  *char v3 = v0;
  v3[1] = sub_9E930;
  uint64_t v4 = v0[4];
  return v6(v4, v2);
}

uint64_t sub_9E930()
{
  sub_7FDC();
  sub_7FC4();
  sub_2B6A4();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(unsigned char *)(v1 + 66) = v3;
  swift_task_dealloc();
  sub_AC10();
  return _swift_task_switch(v4, v5, v6);
}

#error "9EC8C: call analysis failed (funcsize=151)"

uint64_t sub_9ECBC()
{
  *(void *)(v1 + 16) = v0;
  return sub_FCA0((uint64_t)sub_9ECD4);
}

uint64_t sub_9ECD4()
{
  sub_7FDC();
  uint64_t v1 = v0[2];
  uint64_t v2 = (void *)(v1 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin12WarningsFlow_flowParams);
  if (!*(unsigned char *)(v1 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin12WarningsFlow_flowParams + 16)
    || *(unsigned char *)(v1 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin12WarningsFlow_flowParams + 16) == 2
    && (!v2[1] ? (BOOL v3 = *v2 == 1) : (BOOL v3 = 0), v3))
  {
    v0[3] = v2[19];
    uint64_t v12 = (void *)swift_task_alloc();
    v0[4] = v12;
    *uint64_t v12 = v0;
    v12[1] = sub_9EE0C;
    return sub_7CB0();
  }
  else
  {
    sub_7A1C();
    sub_ABC4();
    sub_52848();
    sub_8C308(v4, v5, v6, v7, 0xD000000000000016, v8);
    uint64_t v9 = sub_A1820();
    return v10(v9);
  }
}

uint64_t sub_9EE0C()
{
  sub_AC48();
  sub_34FFC();
  uint64_t v3 = v2;
  sub_AB94();
  *uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v0 + 16);
  uint64_t v6 = *v1;
  sub_2B6A4();
  *uint64_t v7 = v6;
  *(unsigned char *)(v3 + 48) = v8;
  swift_task_dealloc();
  uint64_t v9 = v5 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin12WarningsFlow_now;
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v3 + 40) = v10;
  *uint64_t v10 = v6;
  v10[1] = sub_9EF4C;
  uint64_t v11 = *(void *)(v0 + 24);
  return sub_3398C(5, v11, v9);
}

uint64_t sub_9EF4C()
{
  sub_7FDC();
  sub_7FC4();
  sub_2B6A4();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(unsigned char *)(v1 + 49) = v3;
  swift_task_dealloc();
  sub_AC10();
  return _swift_task_switch(v4, v5, v6);
}

#error "9F1A8: call analysis failed (funcsize=103)"

uint64_t sub_9F1D8()
{
  sub_7FDC();
  *(unsigned char *)(v1 + 378) = v2;
  *(unsigned char *)(v1 + 377) = v3;
  *(void *)(v1 + 400) = v4;
  *(void *)(v1 + 408) = v0;
  uint64_t v5 = sub_B35B0();
  *(void *)(v1 + 416) = v5;
  sub_FC60(v5);
  *(void *)(v1 + 424) = v6;
  *(void *)(v1 + 432) = sub_131EC();
  uint64_t v7 = sub_B35A0();
  *(void *)(v1 + 440) = v7;
  sub_FC60(v7);
  *(void *)(v1 + 448) = v8;
  *(void *)(v1 + 456) = swift_task_alloc();
  *(void *)(v1 + 464) = swift_task_alloc();
  uint64_t v9 = sub_B17F0();
  sub_13294(v9);
  *(void *)(v1 + 472) = sub_131EC();
  uint64_t v10 = sub_B1FD0();
  *(void *)(v1 + 480) = v10;
  sub_FC60(v10);
  *(void *)(v1 + 488) = v11;
  *(void *)(v1 + 496) = sub_131EC();
  sub_AC10();
  return _swift_task_switch(v12, v13, v14);
}

uint64_t sub_9F304()
{
  uint64_t v1 = *(void *)(v0 + 408) + OBJC_IVAR____TtC23DailyBriefingFlowPlugin12WarningsFlow_flowParams;
  sub_7468((void *)(v1 + 64), *(void *)(v1 + 88));
  if (sub_B1DC0())
  {
    sub_A1938();
    sub_7A1C();
    sub_ABC4();
    sub_A18EC(v2, v3, v4, v5, (uint64_t)"startNewsFlow(wasCanDisablePodcastWarningShown:shouldDelayForSilentMode:)");
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v0 + 504) = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_9F6F4;
    sub_FCFC();
    return sub_A40F8(v7, v8);
  }
  else
  {
    uint64_t v11 = *(void *)(v0 + 472);
    int v35 = *(unsigned __int8 *)(v0 + 378);
    char v12 = *(unsigned char *)(v0 + 377);
    uint64_t v13 = *(void *)(*(void *)(v0 + 408) + OBJC_IVAR____TtC23DailyBriefingFlowPlugin12WarningsFlow_specExecutionStatus);
    sub_1F7B4(v1, v0 + 16);
    swift_bridgeObjectRetain();
    sub_B17E0();
    type metadata accessor for DBSiriKitEventSender();
    uint64_t inited = swift_initStaticObject();
    type metadata accessor for NewsFlow();
    uint64_t v15 = swift_allocObject();
    *(void *)(v0 + 384) = sub_A1270(v13, v0 + 16, v11, v12, inited, v15);
    sub_A15B8(&qword_EC9B0, (void (*)(uint64_t))type metadata accessor for NewsFlow);
    sub_B1F90();
    swift_release();
    if (v35 != 1)
    {
      uint64_t v31 = sub_A17A8();
      v32(v31);
      sub_A1684();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      sub_ABD0();
      sub_FCFC();
      __asm { BRAA            X1, X16 }
    }
    uint64_t v16 = *(void *)(v0 + 456);
    uint64_t v17 = *(void *)(v0 + 440);
    uint64_t v18 = *(void *)(v0 + 448);
    *(void *)(v0 + 512) = OBJC_IVAR____TtC23DailyBriefingFlowPlugin12WarningsFlow_logger;
    sub_A1938();
    sub_7A1C();
    sub_ABC4();
    sub_A18EC(v19, v20, v21, v22, (uint64_t)"startNewsFlow(wasCanDisablePodcastWarningShown:shouldDelayForSilentMode:)");
    sub_B3580();
    sub_B3590();
    uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    *(void *)(v0 + 520) = v23;
    *(void *)(v0 + 528) = (v18 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v23(v16, v17);
    *(void *)(v0 + 360) = 0;
    *(void *)(v0 + 368) = 0;
    *(unsigned char *)(v0 + 376) = 1;
    sub_B3850();
    uint64_t v24 = (void *)swift_task_alloc();
    *(void *)(v0 + 536) = v24;
    sub_A15B8(&qword_EC580, (void (*)(uint64_t))&type metadata accessor for ContinuousClock);
    void *v24 = v0;
    v24[1] = sub_9F840;
    sub_FCFC();
    return static Task<>.sleep<A>(until:tolerance:clock:)(v25, v26, v27, v28, v29);
  }
}

uint64_t sub_9F6F4()
{
  sub_7FDC();
  sub_7FC4();
  uint64_t v1 = *v0;
  sub_AB94();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_AC10();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_9F7BC()
{
  sub_AC48();
  sub_B1FB0();
  sub_A1684();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_ABD0();
  return v0();
}

uint64_t sub_9F840()
{
  sub_7FC4();
  sub_2B6A4();
  *uint64_t v3 = v2;
  uint64_t v5 = (void (*)(uint64_t, uint64_t))v4[65];
  uint64_t v6 = v4[58];
  uint64_t v7 = v4[55];
  uint64_t v8 = v4[54];
  uint64_t v9 = v4[53];
  uint64_t v10 = v4[52];
  uint64_t v11 = *v1;
  sub_AB94();
  *char v12 = v11;
  *(void *)(v13 + 544) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  v5(v6, v7);
  sub_AC10();
  return _swift_task_switch(v14, v15, v16);
}

uint64_t sub_9F9E8()
{
  sub_AC48();
  uint64_t v0 = sub_A17A8();
  v1(v0);
  sub_A1684();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_ABD0();
  return v2();
}

uint64_t sub_9FA6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  sub_46EA0();
  sub_47218();
  uint64_t v17 = v16[61];
  uint64_t v41 = v16[60];
  uint64_t v42 = v16[62];
  uint64_t v40 = v16[50];
  sub_1DDDC();
  sub_B34C0(58);
  v18._countAndFlagsBits = 0xD000000000000038;
  sub_35054(v18, (uint64_t)"startNewsFlow delay for silent mode failed with error - ");
  swift_getErrorValue();
  v43._countAndFlagsBits = sub_B3860();
  sub_B3020(v43);
  swift_bridgeObjectRelease();
  sub_A1840();
  sub_8C2F0(v19, v20, v21, v22, v23, v24);
  swift_bridgeObjectRelease();
  sub_A1840();
  sub_8C308(v25, v26, v27, v28, v29, v30);
  swift_errorRelease();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 32))(v40, v42, v41);
  sub_A1684();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_ABD0();
  sub_1DE50();
  return v32(v31, v32, v33, v34, v35, v36, v37, v38, v40, v41, v42, a12, a13, a14, a15, a16);
}

uint64_t sub_9FBE8()
{
  sub_7FDC();
  v1[2] = v0;
  uint64_t v2 = sub_B1F00();
  v1[3] = v2;
  sub_FC60(v2);
  v1[4] = v3;
  v1[5] = sub_131EC();
  uint64_t v4 = sub_B20F0();
  v1[6] = v4;
  sub_FC60(v4);
  v1[7] = v5;
  v1[8] = sub_131EC();
  uint64_t v6 = sub_B20D0();
  v1[9] = v6;
  sub_FC60(v6);
  v1[10] = v7;
  v1[11] = swift_task_alloc();
  v1[12] = swift_task_alloc();
  v1[13] = swift_task_alloc();
  sub_AC10();
  return _swift_task_switch(v8, v9, v10);
}

uint64_t sub_9FCF8()
{
  sub_7FDC();
  uint64_t v1 = v0[2];
  uint64_t v2 = OBJC_IVAR____TtC23DailyBriefingFlowPlugin12WarningsFlow_flowParams;
  v0[14] = OBJC_IVAR____TtC23DailyBriefingFlowPlugin12WarningsFlow_flowParams;
  v0[15] = sub_A18B0(v1 + v2);
  uint64_t v3 = (void *)swift_task_alloc();
  v0[16] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_9FDA0;
  return sub_65AF8();
}

uint64_t sub_9FDA0()
{
  sub_7FDC();
  sub_7FC4();
  sub_2B6A4();
  *uint64_t v2 = v1;
  uint64_t v3 = *v0;
  sub_AB94();
  *uint64_t v4 = v3;
  *(void *)(v6 + 136) = v5;
  swift_task_dealloc();
  swift_release();
  sub_AC10();
  return _swift_task_switch(v7, v8, v9);
}

void sub_9FE88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  sub_46EA0();
  sub_47218();
  uint64_t v17 = v16[17];
  unint64_t v18 = *(void *)(v17 + 16);
  if (!v18)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v19 = v16[10];
  unint64_t v20 = *(void (**)(void, uint64_t, void))(v19 + 16);
  uint64_t v21 = v17 + ((*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80));
  v20(v16[13], v21, v16[9]);
  if (v18 == 1)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v22 = *(void *)(v16[10] + 72);
  v20(v16[12], v21 + v22, v16[9]);
  if (v18 < 3)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v20(v16[11], v21 + 2 * v22, v16[9]);
  swift_bridgeObjectRelease();
  uint64_t v23 = sub_B20C0();
  if (!*(void *)(v23 + 16))
  {
LABEL_11:
    __break(1u);
    return;
  }
  uint64_t v43 = v16[11];
  uint64_t v24 = v16[10];
  uint64_t v41 = v16[13];
  uint64_t v42 = v16[9];
  uint64_t v26 = v16[7];
  uint64_t v25 = v16[8];
  uint64_t v27 = v16[5];
  uint64_t v28 = v16[6];
  uint64_t v29 = v16[4];
  uint64_t v39 = v16[3];
  uint64_t v40 = (void *)(v16[2] + v16[14] + 64);
  (*(void (**)(uint64_t, unint64_t, uint64_t))(v26 + 16))(v25, v23 + ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80)), v28);
  swift_bridgeObjectRelease();
  sub_B20E0();
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v28);
  sub_B1EF0();
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v27, v39);
  sub_7E8CC(v40);
  swift_bridgeObjectRelease();
  sub_A1958();
  swift_bridgeObjectRelease();
  unint64_t v30 = *(void (**)(void))(v24 + 8);
  sub_A1810();
  v30();
  sub_A1810();
  v30();
  sub_A1810();
  v30();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_FCEC();
  sub_1DE50();
  v33(v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, a14, a15, a16);
}

uint64_t sub_A00D4()
{
  sub_7FDC();
  v1[2] = v0;
  uint64_t v2 = sub_B20D0();
  v1[3] = v2;
  sub_FC60(v2);
  v1[4] = v3;
  v1[5] = sub_131EC();
  sub_AC10();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_A0160()
{
  sub_AC48();
  uint64_t v1 = v0[2];
  uint64_t v2 = OBJC_IVAR____TtC23DailyBriefingFlowPlugin12WarningsFlow_flowParams;
  v0[6] = OBJC_IVAR____TtC23DailyBriefingFlowPlugin12WarningsFlow_flowParams;
  v0[7] = sub_A18B0(v1 + v2);
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = sub_A0BE8(v3);
  swift_bridgeObjectRelease();
  unint64_t v5 = v4[2];
  swift_release();
  swift_task_alloc();
  sub_A18E0();
  v0[8] = v6;
  *uint64_t v6 = v7;
  v6[1] = sub_A0254;
  uint64_t v8 = v0[5];
  return sub_662A8(v8, v5 != 0);
}

uint64_t sub_A0254()
{
  sub_7FDC();
  sub_7FC4();
  uint64_t v1 = *v0;
  sub_AB94();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_release();
  sub_AC10();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_A0338()
{
  sub_AC48();
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  sub_A1958();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  uint64_t v4 = sub_FCEC();
  return v5(v4);
}

uint64_t sub_A03D8()
{
  sub_7FDC();
  v1[7] = v0;
  uint64_t v2 = sub_7424(&qword_EA2C0);
  sub_13294(v2);
  v1[8] = sub_131EC();
  uint64_t v3 = sub_B20D0();
  v1[9] = v3;
  sub_FC60(v3);
  v1[10] = v4;
  v1[11] = sub_131EC();
  uint64_t v5 = type metadata accessor for LocationWarningTemplatingResult(0);
  v1[12] = v5;
  sub_13294(v5);
  v1[13] = sub_131EC();
  sub_AC10();
  return _swift_task_switch(v6, v7, v8);
}

uint64_t sub_A04AC()
{
  sub_7FDC();
  uint64_t v1 = v0[7];
  uint64_t v2 = OBJC_IVAR____TtC23DailyBriefingFlowPlugin12WarningsFlow_flowParams;
  v0[14] = OBJC_IVAR____TtC23DailyBriefingFlowPlugin12WarningsFlow_flowParams;
  v0[15] = sub_A18B0(v1 + v2);
  sub_B2260();
  swift_task_alloc();
  sub_A18E0();
  v0[16] = v3;
  *uint64_t v3 = v4;
  v3[1] = sub_A0568;
  return sub_65D10();
}

uint64_t sub_A0568()
{
  sub_7FDC();
  sub_7FC4();
  sub_2B6A4();
  *uint64_t v2 = v1;
  uint64_t v3 = v1 + 16;
  uint64_t v4 = *v0;
  sub_AB94();
  *uint64_t v5 = v4;
  swift_task_dealloc();
  swift_release();
  sub_74F8(v3);
  sub_AC10();
  return _swift_task_switch(v6, v7, v8);
}

uint64_t sub_A0654()
{
  sub_46E44();
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[9];
  sub_A0B08(v0[13] + *(int *)(v0[12] + 20), v1);
  if (sub_C844(v1, 1, v2) == 1)
  {
    sub_A1530(v0[8], &qword_EA2C0);
    sub_A1958();
  }
  else
  {
    uint64_t v4 = v0[10];
    uint64_t v3 = v0[11];
    uint64_t v5 = v0[9];
    uint64_t v6 = v0[7] + v0[14];
    (*(void (**)(uint64_t, void, uint64_t))(v4 + 32))(v3, v0[8], v5);
    sub_7DEE0(v3, (void *)(v6 + 64));
    sub_A1958();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  sub_A0B70(v0[13]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = sub_FCEC();
  return v8(v7);
}

uint64_t sub_A07B4()
{
  sub_B2D30();
  sub_FC8C();
  uint64_t v1 = sub_2B82C();
  v2(v1);
  swift_bridgeObjectRelease();
  sub_1FA58(v0 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin12WarningsFlow_flowParams);
  sub_74F8(v0 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin12WarningsFlow_name);
  sub_B17F0();
  sub_FC8C();
  uint64_t v3 = sub_2B82C();
  v4(v3);
  sub_74F8(v0 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin12WarningsFlow_siriKitEventSender);
  return v0;
}

uint64_t sub_A0874()
{
  sub_A07B4();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_A08CC()
{
  return type metadata accessor for WarningsFlow();
}

uint64_t type metadata accessor for WarningsFlow()
{
  uint64_t result = qword_EC858;
  if (!qword_EC858) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_A091C()
{
  uint64_t result = sub_B2D30();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_B17F0();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

uint64_t sub_A0A0C()
{
  return sub_9C124();
}

uint64_t sub_A0A30()
{
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *unint64_t v1 = v0;
  v1[1] = sub_A7BC;
  return sub_9C1B4();
}

uint64_t sub_A0ACC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for WarningsFlow();

  return Flow<>.exitValue.getter(v3, a2);
}

uint64_t sub_A0B08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_7424(&qword_EA2C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_A0B70(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LocationWarningTemplatingResult(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_A0BCC(uint64_t result, uint64_t a2, void *a3)
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

unint64_t *sub_A0BE8(uint64_t isStackAllocationSafe)
{
  uint64_t v2 = (unint64_t *)isStackAllocationSafe;
  if ((*(unsigned char *)(isStackAllocationSafe + 32) & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    uint64_t v3 = sub_A17C4();
    if (v1) {
      swift_willThrow();
    }
    else {
      return v3;
    }
  }
  else
  {
    swift_slowAlloc();
    uint64_t v2 = sub_A17C4();
    swift_slowDealloc();
  }
  return v2;
}

unint64_t *sub_A0D0C(unint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = 0;
  int64_t v5 = 0;
  uint64_t v6 = a3 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(a3 + 64);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      unint64_t v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v12 = v11 | (v5 << 6);
      goto LABEL_20;
    }
    int64_t v13 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v13 >= v10) {
      return (unint64_t *)sub_A0E54(result, a2, v4, a3);
    }
    unint64_t v14 = *(void *)(v6 + 8 * v13);
    ++v5;
    if (!v14)
    {
      int64_t v5 = v13 + 1;
      if (v13 + 1 >= v10) {
        return (unint64_t *)sub_A0E54(result, a2, v4, a3);
      }
      unint64_t v14 = *(void *)(v6 + 8 * v5);
      if (!v14)
      {
        int64_t v5 = v13 + 2;
        if (v13 + 2 >= v10) {
          return (unint64_t *)sub_A0E54(result, a2, v4, a3);
        }
        unint64_t v14 = *(void *)(v6 + 8 * v5);
        if (!v14) {
          break;
        }
      }
    }
LABEL_19:
    unint64_t v9 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v5 << 6);
LABEL_20:
    if (!*(unsigned char *)(*(void *)(a3 + 56) + v12))
    {
      *(unint64_t *)((char *)result + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      if (__OFADD__(v4++, 1))
      {
        __break(1u);
        return (unint64_t *)sub_A0E54(result, a2, v4, a3);
      }
    }
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v10) {
    return (unint64_t *)sub_A0E54(result, a2, v4, a3);
  }
  unint64_t v14 = *(void *)(v6 + 8 * v15);
  if (v14)
  {
    int64_t v5 = v15;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v5 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v5 >= v10) {
      return (unint64_t *)sub_A0E54(result, a2, v4, a3);
    }
    unint64_t v14 = *(void *)(v6 + 8 * v5);
    ++v15;
    if (v14) {
      goto LABEL_19;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

void *sub_A0E54(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return &_swiftEmptyDictionarySingleton;
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) != a3)
  {
    sub_7424(&qword_EC9A8);
    uint64_t v8 = sub_B3650();
    uint64_t v9 = v8;
    uint64_t v31 = a1;
    uint64_t v32 = a2;
    if (a2 < 1) {
      unint64_t v10 = 0;
    }
    else {
      unint64_t v10 = *a1;
    }
    uint64_t v11 = 0;
    uint64_t v12 = v8 + 64;
    while (1)
    {
      if (v10)
      {
        unint64_t v13 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v14 = v13 | (v11 << 6);
      }
      else
      {
        uint64_t v15 = v11 + 1;
        if (__OFADD__(v11, 1)) {
          goto LABEL_40;
        }
        if (v15 >= v32) {
          return (void *)v9;
        }
        unint64_t v16 = v31[v15];
        ++v11;
        if (!v16)
        {
          uint64_t v11 = v15 + 1;
          if (v15 + 1 >= v32) {
            return (void *)v9;
          }
          unint64_t v16 = v31[v11];
          if (!v16)
          {
            uint64_t v11 = v15 + 2;
            if (v15 + 2 >= v32) {
              return (void *)v9;
            }
            unint64_t v16 = v31[v11];
            if (!v16)
            {
              uint64_t v17 = v15 + 3;
              if (v17 >= v32) {
                return (void *)v9;
              }
              unint64_t v16 = v31[v17];
              if (!v16)
              {
                while (1)
                {
                  uint64_t v11 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_41;
                  }
                  if (v11 >= v32) {
                    return (void *)v9;
                  }
                  unint64_t v16 = v31[v11];
                  ++v17;
                  if (v16) {
                    goto LABEL_24;
                  }
                }
              }
              uint64_t v11 = v17;
            }
          }
        }
LABEL_24:
        unint64_t v10 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
      }
      char v18 = *(unsigned char *)(*(void *)(v4 + 48) + v14);
      char v19 = *(unsigned char *)(*(void *)(v4 + 56) + v14);
      sub_B38B0();
      sub_B2FF0();
      swift_bridgeObjectRelease();
      Swift::Int v20 = sub_B38E0();
      uint64_t v21 = -1 << *(unsigned char *)(v9 + 32);
      unint64_t v22 = v20 & ~v21;
      unint64_t v23 = v22 >> 6;
      if (((-1 << v22) & ~*(void *)(v12 + 8 * (v22 >> 6))) != 0)
      {
        unint64_t v24 = __clz(__rbit64((-1 << v22) & ~*(void *)(v12 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
        goto LABEL_34;
      }
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          JUMPOUT(0xA1164);
        }
        BOOL v27 = v23 == v26;
        if (v23 == v26) {
          unint64_t v23 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v12 + 8 * v23);
      }
      while (v28 == -1);
      unint64_t v24 = __clz(__rbit64(~v28)) + (v23 << 6);
LABEL_34:
      *(void *)(v12 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
      *(unsigned char *)(*(void *)(v9 + 48) + v24) = v18;
      *(unsigned char *)(*(void *)(v9 + 56) + v24) = v19;
      ++*(void *)(v9 + 16);
      if (__OFSUB__(v5--, 1)) {
        goto LABEL_39;
      }
      if (!v5) {
        return (void *)v9;
      }
    }
  }
  swift_retain();
  return (void *)v4;
}

uint64_t sub_A1178(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  sub_B1D90();
  uint64_t v12 = &type metadata for CommonSpecs;
  unint64_t v13 = &off_DE228;
  v11[0] = a2;
  sub_A8B4((uint64_t)v11, (uint64_t)v10);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a3;
  *(void *)(v7 + 24) = a4;
  sub_B3B0(v10, v7 + 32);
  uint64_t v8 = sub_B1D80();
  sub_74F8((uint64_t)v11);
  return v8;
}

uint64_t sub_A1270(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v26 = type metadata accessor for DBSiriKitEventSender();
  BOOL v27 = &off_DF120;
  uint64_t v28 = sub_A15B8(&qword_E8500, (void (*)(uint64_t))type metadata accessor for DBSiriKitEventSender);
  *(void *)&long long v25 = a5;
  uint64_t v12 = a6 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin8NewsFlow_logger;
  if (qword_E6D70 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_B2D30();
  uint64_t v14 = sub_B378(v13, (uint64_t)qword_F53A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v12, v14, v13);
  uint64_t v15 = a6 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin8NewsFlow_name;
  *(void *)(v15 + 24) = &type metadata for SupportedFeatures;
  *(void *)(v15 + 32) = &off_DE210;
  *(unsigned char *)uint64_t v15 = 4;
  *(unsigned char *)(a6 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin8NewsFlow_state) = 3;
  *(void *)(a6 + 16) = a1;
  sub_1F7B4(a2, a6 + 24);
  uint64_t v16 = a6 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin8NewsFlow_now;
  uint64_t v17 = sub_B17F0();
  uint64_t v18 = *(void *)(v17 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v16, a3, v17);
  if (a4)
  {
    sub_1F7B4(a2, (uint64_t)v23);
LABEL_7:
    char v21 = 0;
    goto LABEL_8;
  }
  uint64_t v19 = swift_bridgeObjectRetain();
  unint64_t v20 = sub_A0BE8(v19)[2];
  swift_bridgeObjectRelease();
  swift_release();
  sub_1F7B4(a2, (uint64_t)v23);
  if (!v20) {
    goto LABEL_7;
  }
  sub_7468(v24, v24[3]);
  char v21 = sub_B1E70();
LABEL_8:
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(a3, v17);
  sub_1FA58(a2);
  sub_1FA58((uint64_t)v23);
  *(unsigned char *)(a6 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin8NewsFlow_shouldDialog) = v21 & 1;
  sub_1FAAC(&v25, (_OWORD *)(a6 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin8NewsFlow_siriKitEventSender));
  return a6;
}

uint64_t sub_A1530(uint64_t a1, uint64_t *a2)
{
  sub_7424(a2);
  sub_FC8C();
  uint64_t v3 = sub_2B82C();
  v4(v3);
  return a1;
}

uint64_t sub_A1578()
{
  swift_bridgeObjectRelease();
  sub_74F8(v0 + 32);

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_A15B8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_A1600()
{
  return sub_A1178(131, 1, 0, 0);
}

void sub_A1624(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_8C320(a1, a2, a3, a4, 0x2865747563657865, 0xE900000000000029);
}

void sub_A164C(uint64_t a1, unint64_t a2)
{
  sub_8C308(a1, a2, 0xD00000000000002ALL, v2, 0x2865747563657865, 0xE900000000000029);
}

uint64_t sub_A1684()
{
  return swift_task_dealloc();
}

void *sub_A16A4()
{
  return sub_7468((void *)(*(void *)(v0 + 48) + *(void *)(v0 + 80) + 240), *(void *)(*(void *)(v0 + 48) + *(void *)(v0 + 80) + 264));
}

uint64_t sub_A16D0()
{
  return v0;
}

uint64_t sub_A16E8(uint64_t a1)
{
  return sub_AA40(v1, 1, 1, a1);
}

uint64_t sub_A1734@<X0>(uint64_t a1@<X8>)
{
  sub_7468((void *)(a1 + v1 + 64), *(void *)(a1 + v1 + 88));
  return sub_B1DC0();
}

void sub_A178C()
{
  v3._countAndFlagsBits = v0;
  v3._object = v1;
  sub_B3020(v3);
}

uint64_t sub_A17A8()
{
  return *(void *)(v0 + 400);
}

unint64_t *sub_A17C4()
{
  sub_A0BCC(0, v1, v2);
  return sub_A0D0C(v2, v1, v0);
}

uint64_t sub_A1820()
{
  return 0;
}

uint64_t sub_A1830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, unsigned int a12)
{
  return a12;
}

void sub_A1858()
{
  v1._countAndFlagsBits = 46;
  v1._object = (void *)0xE100000000000000;
  sub_B3020(v1);
}

void sub_A1874()
{
  v1._countAndFlagsBits = 0x203E2D2D20;
  v1._object = (void *)0xE500000000000000;
  sub_B3020(v1);
}

void sub_A1898(Swift::String a1)
{
  a1._object = v1;
  sub_B3020(a1);
}

uint64_t sub_A18B0@<X0>(uint64_t a1@<X8>)
{
  sub_7468((void *)(a1 + 160), *(void *)(a1 + 184));
  return sub_67F70();
}

void sub_A18EC(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  sub_8C320(a1, a2, 0xD00000000000002ALL, a3, a4, (a5 - 32) | 0x8000000000000000);
}

void sub_A190C(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  sub_8C308(a1, v5, a2, a3, a4, (a5 - 32) | 0x8000000000000000);
}

uint64_t sub_A1958()
{
  return sub_B1EB0();
}

uint64_t sub_A1970()
{
  return *(void *)(v0 + 40);
}

unsigned char *storeEnumTagSinglePayload for WarningsDialogs(unsigned char *result, unsigned int a2, unsigned int a3)
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
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0xA1A50);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WarningsDialogs()
{
  return &type metadata for WarningsDialogs;
}

unint64_t sub_A1A88(char a1)
{
  v2._countAndFlagsBits = 0xD000000000000010;
  int v3 = (void *)0x80000000000B47B0;
  switch(a1)
  {
    case 1:
      v2._countAndFlagsBits = 0xD000000000000019;
      unsigned int v4 = "LocationDisabledForDevice";
      goto LABEL_5;
    case 2:
      int v3 = (void *)0x80000000000B47F0;
      v2._countAndFlagsBits = 0xD000000000000016;
      break;
    case 3:
      v2._countAndFlagsBits = 0xD00000000000001CLL;
      unsigned int v4 = "PodcastsCanBeDisabledWarning";
LABEL_5:
      int v3 = (void *)((unint64_t)(v4 - 32) | 0x8000000000000000);
      break;
    default:
      break;
  }
  v2._object = v3;
  sub_B3020(v2);
  swift_bridgeObjectRelease();
  return 0xD000000000000016;
}

unint64_t sub_A1B6C(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000019;
      break;
    case 2:
      unint64_t result = 0xD000000000000016;
      break;
    case 3:
      unint64_t result = 0xD00000000000001CLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_A1BF4(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_DC108;
  v6._object = a2;
  unint64_t v4 = sub_B3680(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 4) {
    return 4;
  }
  else {
    return v4;
  }
}

uint64_t sub_A1C40(unsigned __int8 *a1, char *a2)
{
  return sub_5D000(*a1, *a2);
}

Swift::Int sub_A1C4C()
{
  return sub_7F448(*v0);
}

uint64_t sub_A1C54(uint64_t a1)
{
  return sub_7F980(a1, *v1);
}

Swift::Int sub_A1C5C(uint64_t a1)
{
  return sub_807C4(a1, *v1);
}

uint64_t sub_A1C64@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_A1BF4(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_A1C94@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_A1B6C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_A1CC4()
{
  unint64_t result = qword_EC9B8;
  if (!qword_EC9B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_EC9B8);
  }
  return result;
}

unint64_t sub_A1D10()
{
  return sub_A1A88(*v0);
}

uint64_t sub_A1D18()
{
  sub_B1D20();
  sub_7468(v1, v1[3]);
  sub_B1D30();
  return sub_74F8((uint64_t)v1);
}

uint64_t sub_A1D7C(int a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 24) = a3;
  *(void *)(v4 + 32) = v3;
  *(void *)(v4 + 16) = a2;
  *(_DWORD *)(v4 + 80) = a1;
  return _swift_task_switch(sub_A1DA4, 0, 0);
}

uint64_t sub_A1DA4()
{
  sub_7424(&qword_EA2A0);
  uint64_t v1 = swift_allocObject();
  v0[5] = v1;
  *(_OWORD *)(v1 + 16) = xmmword_C0800;
  *(_DWORD *)(v1 + 32) = 50462976;
  if (qword_E6BA8 != -1) {
    swift_once();
  }
  v0[6] = qword_F4E78;
  swift_retain();
  Swift::String v2 = (void *)swift_task_alloc();
  v0[7] = v2;
  *Swift::String v2 = v0;
  v2[1] = sub_A1EB0;
  return sub_F26C(1);
}

uint64_t sub_A1EB0()
{
  sub_7FC4();
  *(void *)(v2 + 64) = v0;
  *(void *)(v2 + 72) = v1;
  swift_task_dealloc();
  return _swift_task_switch(sub_A1F8C, 0, 0);
}

uint64_t sub_A1F8C()
{
  char v1 = sub_7A28(*(void *)(v0 + 64), *(void *)(v0 + 72));
  swift_release();
  char v2 = sub_7E78(v1);
  uint64_t v3 = *(void *)(v0 + 40);
  if (v2)
  {
    sub_5EFC0();
    uint64_t v3 = v4;
    *(void *)(v4 + 16) = 5;
    *(unsigned char *)(v4 + 36) = 4;
  }
  uint64_t v6 = *(void *)(v0 + 16);
  uint64_t v5 = *(void *)(v0 + 24);
  uint64_t v7 = *(unsigned int *)(v0 + 80);
  sub_B1D90();
  swift_bridgeObjectRetain();
  sub_23E74(v7, v6, v5, v3);
  sub_A1D18();
  swift_release();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_A2098()
{
  sub_B1D90();
  sub_A24AC();
  sub_B1D80();
  sub_A1D18();

  return swift_release();
}

uint64_t sub_A2110(char a1)
{
  sub_7424(&qword_EA2A0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_C0800;
  *(_DWORD *)(v2 + 32) = 50462976;
  if (a1)
  {
    sub_5EFC0();
    uint64_t v2 = v3;
    *(void *)(v3 + 16) = 5;
    *(unsigned char *)(v3 + 36) = 4;
  }
  sub_B1D90();
  sub_A24AC();
  sub_23E74(2, 0, 0xE000000000000000, v2);
  sub_A1D18();

  return swift_release();
}

uint64_t sub_A21D8()
{
  sub_B1D90();
  sub_B1D80();
  sub_A1D18();

  return swift_release();
}

uint64_t type metadata accessor for DBSiriKitEventSender()
{
  return self;
}

uint64_t sub_A2290()
{
  return sub_A1D18();
}

uint64_t sub_A22A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_2C25C;
  return SiriKitEventSending.sendAsync(_:)(a1, a2, a3);
}

uint64_t sub_A2358(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_A2370(a1, a2, a3, a4, a5, a6, a7, 4);
}

uint64_t sub_A2360(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_A2370(a1, a2, a3, a4, a5, a6, a7, 131);
}

uint64_t sub_A2368(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_A2370(a1, a2, a3, a4, a5, a6, a7, 132);
}

uint64_t sub_A2370(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15 = *(void *)(a6 - 8);
  __chkstk_darwin(a1);
  uint64_t v17 = &v20[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v18 = sub_B1D90();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v15 + 16))(v17, a1, a6);
  swift_bridgeObjectRetain();
  v20[12] = 0;
  sub_24124(a8, (uint64_t)v17, a3, a4, a2, v18, a6, a7);
  sub_A1D18();
  return swift_release();
}

unint64_t sub_A24C0(unint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2 + 1;
  if (__OFADD__(a2, 1))
  {
    __break(1u);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  unint64_t v4 = *(void *)(a3 + 16);
  if (v4 < result || (uint64_t)v4 < v3) {
    goto LABEL_11;
  }
  if ((v3 & 0x8000000000000000) == 0) {
    return swift_bridgeObjectRetain();
  }
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_A253C(unint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2 + 1;
  if (__OFADD__(a2, 1))
  {
    __break(1u);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  unint64_t v4 = *(void *)(a3 + 16);
  if (v4 < result || (uint64_t)v4 < v3) {
    goto LABEL_11;
  }
  if ((v3 & 0x8000000000000000) == 0)
  {
    type metadata accessor for CurrentWeatherForecast();
    return swift_bridgeObjectRetain();
  }
LABEL_12:
  __break(1u);
  return result;
}

void *sub_A25F0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_A2608(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, unint64_t))sub_2D6F8);
}

void *sub_A2608(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, unint64_t))
{
  if ((a4 & 1) == 0) {
    goto LABEL_2;
  }
  sub_B3800();
  swift_unknownObjectRetain_n();
  uint64_t v11 = (void *)swift_dynamicCastClass();
  if (!v11)
  {
    swift_unknownObjectRelease();
    uint64_t v11 = _swiftEmptyArrayStorage;
  }
  uint64_t v12 = v11[2];
  swift_release();
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v12 != (a4 >> 1) - a3)
  {
LABEL_11:
    swift_unknownObjectRelease();
LABEL_2:
    uint64_t v10 = (void *)a5(a1, a2, a3, a4);
    goto LABEL_9;
  }
  uint64_t v10 = (void *)swift_dynamicCastClass();
  if (!v10)
  {
    swift_unknownObjectRelease();
    uint64_t v10 = _swiftEmptyArrayStorage;
  }
LABEL_9:
  swift_unknownObjectRelease();
  return v10;
}

void sub_A2700()
{
  sub_920F0();
  uint64_t v1 = sub_B1950();
  sub_7870();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_C914();
  uint64_t v5 = sub_B1650();
  sub_7870();
  __chkstk_darwin(v6);
  sub_A3BFC();
  sub_B1920();
  sub_7424(&qword_EAD78);
  uint64_t v7 = sub_B1930();
  sub_7870();
  uint64_t v9 = v8;
  unint64_t v10 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_BEC70;
  (*(void (**)(unint64_t, void, uint64_t))(v9 + 104))(v11 + v10, enum case for Calendar.Component.hour(_:), v7);
  sub_6AD94(v11);
  sub_B18B0();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  sub_B15D0();
  uint64_t v12 = sub_A3C58();
  v13(v12, v5);
  sub_92108();
}

void sub_A28B8()
{
  sub_920F0();
  uint64_t v1 = v0;
  uint64_t v24 = sub_B1950();
  sub_7870();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_7A0C();
  uint64_t v7 = v6 - v5;
  uint64_t v23 = sub_B1650();
  sub_7870();
  __chkstk_darwin(v8);
  sub_A3BFC();
  uint64_t v22 = sub_B17F0();
  sub_7870();
  uint64_t v10 = v9;
  __chkstk_darwin(v11);
  sub_7A0C();
  uint64_t v14 = v13 - v12;
  sub_57878(v1, v13 - v12);
  sub_B1920();
  sub_7424(&qword_EAD78);
  uint64_t v15 = sub_B1930();
  sub_7870();
  uint64_t v17 = v16;
  unint64_t v18 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_BEC70;
  (*(void (**)(unint64_t, void, uint64_t))(v17 + 104))(v19 + v18, enum case for Calendar.Component.hour(_:), v15);
  sub_6AD94(v19);
  sub_B18B0();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v7, v24);
  sub_B15D0();
  uint64_t v20 = sub_A3C58();
  v21(v20, v23);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v14, v22);
  sub_92108();
}

void sub_A2AF0()
{
  sub_920F0();
  char v2 = v1;
  uint64_t v4 = v3;
  sub_B17F0();
  sub_7870();
  uint64_t v37 = v6;
  uint64_t v38 = v5;
  __chkstk_darwin(v5);
  sub_7A0C();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = sub_B2D30();
  sub_7870();
  uint64_t v12 = v11;
  __chkstk_darwin(v13);
  sub_C914();
  if (!*(void *)(v4 + 16))
  {
    swift_bridgeObjectRetain();
LABEL_13:
    sub_92108();
    return;
  }
  uint64_t v36 = v9;
  if (qword_E6C98 != -1) {
    swift_once();
  }
  uint64_t v35 = sub_B378(v10, (uint64_t)qword_F50E8);
  uint64_t v34 = *(void (**)(uint64_t))(v12 + 16);
  v34(v0);
  sub_B34C0(28);
  swift_bridgeObjectRelease();
  v39._countAndFlagsBits = sub_B37C0();
  sub_B3020(v39);
  swift_bridgeObjectRelease();
  v40._countAndFlagsBits = 0x497472617473202CLL;
  v40._object = (void *)0xEE00203A7865646ELL;
  sub_B3020(v40);
  v41._countAndFlagsBits = sub_B37C0();
  sub_B3020(v41);
  swift_bridgeObjectRelease();
  sub_A3C14(0x7865646E49646E65, v14, 0xD00000000000004ALL, 0x80000000000BC220);
  swift_bridgeObjectRelease();
  uint64_t v33 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
  v33(v0, v10);
  uint64_t v15 = type metadata accessor for CurrentWeatherForecast();
  (*(void (**)(uint64_t, unint64_t, uint64_t))(v37 + 16))(v9, v4+ *(int *)(v15 + 32)+ ((*(unsigned __int8 *)(*(void *)(v15 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v15 - 8) + 80)), v38);
  type metadata accessor for WeatherFilteredConditionsProvider();
  if (v2)
  {
    uint64_t v16 = sub_A3BDC();
    int64_t v19 = sub_74860(v16, v17, v18);
    sub_A3BDC();
    sub_A28B8();
  }
  else
  {
    sub_A3BDC();
    sub_A2700();
    int64_t v19 = v21;
    uint64_t v22 = sub_A3BDC();
    int64_t v20 = sub_74694(v22, v23, v24);
  }
  if (v20 >= v19)
  {
    sub_A253C(v19, v20, v4);
    uint64_t v26 = v25;
    uint64_t v28 = v27;
    unint64_t v30 = v29;
    uint64_t v31 = swift_unknownObjectRetain();
    if (sub_A2608(v31, v26, v28, v30, (uint64_t (*)(uint64_t, uint64_t, uint64_t, unint64_t))sub_2DA98)[2])
    {
      ((void (*)(uint64_t, uint64_t, uint64_t))v34)(v0, v35, v10);
      sub_B34C0(50);
      swift_bridgeObjectRelease();
      v42._countAndFlagsBits = sub_B37C0();
      sub_B3020(v42);
      swift_bridgeObjectRelease();
      sub_A3C14(0xD000000000000030, v32, 0xD00000000000004ALL, 0x80000000000BC220);
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      v33(v0, v10);
    }
    else
    {
      swift_unknownObjectRelease();
    }
    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v36, v38);
    goto LABEL_13;
  }
  __break(1u);
}

void *sub_A2F48()
{
  sub_A3324();
  char v1 = (void *)v0;
  if (v0 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_B3620();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (v0 & 0xFFFFFFFFFFFFFF8));
  }
  switch(v2)
  {
    case 2:
      swift_bridgeObjectRelease();
      if (qword_E6C98 != -1) {
        swift_once();
      }
      uint64_t v5 = sub_B2D30();
      sub_B378(v5, (uint64_t)qword_F50E8);
      sub_A3BEC();
      sub_A3BBC(v6 | 3, 0x80000000000BC1F0, v6 + 42, 0x80000000000BC220, (uint64_t)"processWeatherConditions(_:_:_:)");
      type metadata accessor for WeatherConditionEvent();
      uint64_t v7 = sub_2C788((uint64_t)v1);
      break;
    case 1:
      swift_bridgeObjectRelease();
      if (qword_E6C98 != -1) {
        swift_once();
      }
      uint64_t v8 = sub_B2D30();
      sub_B378(v8, (uint64_t)qword_F50E8);
      sub_A3BEC();
      sub_A3BBC(v9 | 1, 0x80000000000BC2A0, v9 + 42, 0x80000000000BC220, (uint64_t)"processWeatherConditions(_:_:_:)");
      return v1;
    case 0:
      swift_bridgeObjectRelease();
      if (qword_E6C98 != -1) {
        swift_once();
      }
      uint64_t v3 = sub_B2D30();
      sub_B378(v3, (uint64_t)qword_F50E8);
      sub_A3BEC();
      sub_A3BBC(v4 - 4, 0x80000000000BC2D0, v4 + 42, 0x80000000000BC220, (uint64_t)"processWeatherConditions(_:_:_:)");
      return _swiftEmptyArrayStorage;
    default:
      type metadata accessor for WeatherConditionEvent();
      uint64_t v10 = sub_2C61C((unint64_t)v1);
      if (!v10)
      {
        swift_bridgeObjectRelease();
        return _swiftEmptyArrayStorage;
      }
      uint64_t v11 = v10;
      swift_retain();
      sub_B3080();
      if (*(void *)((char *)&dword_10 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
        sub_A3C38();
      }
      sub_B30F0();
      sub_B30C0();
      uint64_t v12 = sub_2C634((unint64_t)v1);
      swift_bridgeObjectRelease();
      if (!v12)
      {
        char v1 = _swiftEmptyArrayStorage;
        swift_release();
        return v1;
      }
      char v13 = *(unsigned char *)(v12 + 16);
      unint64_t v14 = sub_19008(*(unsigned char *)(v11 + 16));
      uint64_t v16 = v15;
      if (v14 == sub_19008(v13) && v16 == v17)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v19 = sub_B37E0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v19 & 1) == 0)
        {
          swift_retain();
          sub_B3080();
          if (*(void *)((char *)&dword_10 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
            sub_A3C38();
          }
          sub_B30F0();
          sub_B30C0();
        }
      }
      uint64_t v7 = sub_2C788((uint64_t)_swiftEmptyArrayStorage);
      swift_release();
      swift_release();
      break;
  }
  swift_bridgeObjectRelease();
  return (void *)v7;
}

void sub_A3324()
{
  sub_920F0();
  unsigned __int8 v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v59 = sub_B17F0();
  sub_7870();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  sub_17768();
  uint64_t v58 = v9;
  uint64_t v10 = type metadata accessor for CurrentWeatherForecast();
  sub_7870();
  uint64_t v12 = v11;
  __chkstk_darwin(v13);
  sub_17768();
  uint64_t v60 = v14;
  type metadata accessor for WeatherConditionEvent();
  sub_8C120();
  uint64_t v15 = sub_B2EA0();
  uint64_t v16 = *(void *)(v5 + 16);
  if (v16)
  {
    uint64_t v17 = v5 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
    uint64_t v57 = (void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = *(void *)(v12 + 72);
    swift_bridgeObjectRetain();
    uint64_t v61 = v1;
    uint64_t v19 = v60;
    while (1)
    {
      sub_61170(v17, v19);
      uint64_t v63 = *(unsigned __int8 *)(v19 + *(int *)(v10 + 28));
      if ((v3 & 1) == 0) {
        break;
      }
      unint64_t v20 = 0xE900000000000065;
      unint64_t v21 = 0x6E61636972727568;
      switch(v61)
      {
        case 1:
          unint64_t v20 = 0xE700000000000000;
          unint64_t v21 = 0x6F64616E726F74;
          break;
        case 2:
          unint64_t v21 = 0x6C616369706F7274;
          unint64_t v20 = 0xED00006D726F7453;
          break;
        case 3:
          unint64_t v20 = 0xE800000000000000;
          unint64_t v21 = 0x6472617A7A696C62;
          break;
        case 4:
          unint64_t v20 = 0xE400000000000000;
          unint64_t v21 = 1818845544;
          break;
        case 5:
          unint64_t v21 = 0x737265646E756874;
          uint64_t v22 = 1836216180;
          goto LABEL_28;
        case 6:
          unint64_t v20 = 0xE500000000000000;
          unint64_t v21 = 0x7465656C73;
          break;
        case 7:
          unint64_t v20 = 0xE500000000000000;
          uint64_t v23 = 2003791475;
          goto LABEL_22;
        case 8:
          unint64_t v21 = 0x53676E69776F6C62;
          uint64_t v24 = 7827310;
          goto LABEL_25;
        case 9:
          unint64_t v20 = 0xE500000000000000;
          uint64_t v23 = 1852399986;
          goto LABEL_22;
        case 10:
          unint64_t v20 = 0xE500000000000000;
          uint64_t v23 = 1802464627;
          goto LABEL_22;
        case 11:
          unint64_t v20 = 0xE400000000000000;
          unint64_t v21 = 1953723748;
          break;
        case 12:
          unint64_t v20 = 0xE500000000000000;
          uint64_t v23 = 1684957559;
          goto LABEL_22;
        case 13:
          unint64_t v20 = 0xE500000000000000;
          uint64_t v23 = 1734831974;
LABEL_22:
          unint64_t v21 = v23 & 0xFFFF0000FFFFFFFFLL | 0x7900000000;
          break;
        case 14:
          unint64_t v20 = 0xE400000000000000;
          unint64_t v21 = 1702519144;
          break;
        case 15:
          unint64_t v20 = 0xE600000000000000;
          unint64_t v21 = 0x7964756F6C63;
          break;
        case 16:
          unint64_t v21 = 0x6C43796C74726170;
          uint64_t v22 = 2036626799;
          goto LABEL_28;
        case 17:
          unint64_t v20 = 0xE500000000000000;
          unint64_t v21 = 0x7261656C63;
          break;
        case 18:
          unint64_t v20 = 0xE400000000000000;
          unint64_t v21 = 1684828003;
          break;
        case 19:
          unint64_t v20 = 0xE300000000000000;
          unint64_t v21 = 7630696;
          break;
        case 20:
          unint64_t v21 = 0x6F6C43646578696DLL;
          uint64_t v24 = 7955573;
LABEL_25:
          unint64_t v20 = v24 & 0xFFFFFFFFFFFFLL | 0xEB00000000000000;
          break;
        case 21:
          unint64_t v21 = 0x656C43646578696DLL;
          unint64_t v20 = 0xEA00000000007261;
          break;
        case 22:
          unint64_t v21 = 0x6C69617641746F6ELL;
          uint64_t v22 = 1701601889;
LABEL_28:
          unint64_t v20 = v22 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
          break;
        default:
          break;
      }
      unint64_t v25 = 0x6E61636972727568;
      unint64_t v26 = 0xE900000000000065;
      switch(*(unsigned char *)(v19 + *(int *)(v10 + 28)))
      {
        case 1:
          unint64_t v26 = 0xE700000000000000;
          unint64_t v25 = 0x6F64616E726F74;
          break;
        case 2:
          unint64_t v25 = 0x6C616369706F7274;
          unint64_t v26 = 0xED00006D726F7453;
          break;
        case 3:
          unint64_t v26 = 0xE800000000000000;
          unint64_t v25 = 0x6472617A7A696C62;
          break;
        case 4:
          unint64_t v26 = 0xE400000000000000;
          unint64_t v25 = 1818845544;
          break;
        case 5:
          unint64_t v25 = 0x737265646E756874;
          uint64_t v27 = 1836216180;
          goto LABEL_54;
        case 6:
          unint64_t v26 = 0xE500000000000000;
          unint64_t v25 = 0x7465656C73;
          break;
        case 7:
          unint64_t v26 = 0xE500000000000000;
          uint64_t v28 = 2003791475;
          goto LABEL_48;
        case 8:
          unint64_t v25 = 0x53676E69776F6C62;
          uint64_t v29 = 7827310;
          goto LABEL_51;
        case 9:
          unint64_t v26 = 0xE500000000000000;
          uint64_t v28 = 1852399986;
          goto LABEL_48;
        case 0xA:
          unint64_t v26 = 0xE500000000000000;
          uint64_t v28 = 1802464627;
          goto LABEL_48;
        case 0xB:
          unint64_t v26 = 0xE400000000000000;
          unint64_t v25 = 1953723748;
          break;
        case 0xC:
          unint64_t v26 = 0xE500000000000000;
          uint64_t v28 = 1684957559;
          goto LABEL_48;
        case 0xD:
          unint64_t v26 = 0xE500000000000000;
          uint64_t v28 = 1734831974;
LABEL_48:
          unint64_t v25 = v28 & 0xFFFF0000FFFFFFFFLL | 0x7900000000;
          break;
        case 0xE:
          unint64_t v26 = 0xE400000000000000;
          unint64_t v25 = 1702519144;
          break;
        case 0xF:
          unint64_t v26 = 0xE600000000000000;
          unint64_t v25 = 0x7964756F6C63;
          break;
        case 0x10:
          unint64_t v25 = 0x6C43796C74726170;
          uint64_t v27 = 2036626799;
          goto LABEL_54;
        case 0x11:
          unint64_t v26 = 0xE500000000000000;
          unint64_t v25 = 0x7261656C63;
          break;
        case 0x12:
          unint64_t v26 = 0xE400000000000000;
          unint64_t v25 = 1684828003;
          break;
        case 0x13:
          unint64_t v26 = 0xE300000000000000;
          unint64_t v25 = 7630696;
          break;
        case 0x14:
          unint64_t v25 = 0x6F6C43646578696DLL;
          uint64_t v29 = 7955573;
LABEL_51:
          unint64_t v26 = v29 & 0xFFFFFFFFFFFFLL | 0xEB00000000000000;
          break;
        case 0x15:
          unint64_t v25 = 0x656C43646578696DLL;
          unint64_t v26 = 0xEA00000000007261;
          break;
        case 0x16:
          unint64_t v25 = 0x6C69617641746F6ELL;
          uint64_t v27 = 1701601889;
LABEL_54:
          unint64_t v26 = v27 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
          break;
        default:
          break;
      }
      if (v21 == v25 && v20 == v26)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v31 = sub_B37E0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v31 & 1) == 0) {
          break;
        }
      }
      sub_9C04C(v19);
LABEL_76:
      v17 += v18;
      if (!--v16)
      {
        swift_bridgeObjectRelease();
        goto LABEL_78;
      }
    }
    if (*(void *)(v15 + 16) && (uint64_t v32 = sub_AF4B0(v63), (v33 & 1) != 0))
    {
      uint64_t v34 = *(void *)(*(void *)(v15 + 56) + 8 * v32);
      swift_retain();
      sub_9C04C(v19);
      uint64_t v35 = *(void *)(v34 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin21WeatherConditionEvent_count);
      BOOL v36 = __OFADD__(v35, 1);
      uint64_t v37 = v35 + 1;
      if (v36) {
        goto LABEL_81;
      }
      *(void *)(v34 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin21WeatherConditionEvent_count) = v37;
      swift_release();
    }
    else
    {
      uint64_t v62 = v16;
      uint64_t v38 = v18;
      uint64_t v39 = v3;
      uint64_t v40 = v19;
      uint64_t v41 = v10;
      (*v57)(v58, v40 + *(int *)(v10 + 32), v59);
      swift_allocObject();
      uint64_t v42 = sub_2C3CC(v63, v58, 1);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v64 = (void *)v15;
      uint64_t v44 = sub_AF4B0(v63);
      uint64_t v46 = *(void *)(v15 + 16);
      BOOL v47 = (v45 & 1) == 0;
      Swift::Int v48 = v46 + v47;
      if (__OFADD__(v46, v47))
      {
        __break(1u);
LABEL_80:
        __break(1u);
LABEL_81:
        __break(1u);
LABEL_82:
        sub_B3840();
        __break(1u);
        JUMPOUT(0xA3B04);
      }
      unint64_t v49 = v44;
      char v50 = v45;
      sub_7424(&qword_ECAA8);
      BOOL v51 = sub_B35D0(isUniquelyReferenced_nonNull_native, v48);
      uint64_t v10 = v41;
      uint64_t v19 = v60;
      if (v51)
      {
        uint64_t v52 = sub_AF4B0(v63);
        if ((v50 & 1) != (v53 & 1)) {
          goto LABEL_82;
        }
        unint64_t v49 = v52;
      }
      uint64_t v15 = (uint64_t)v64;
      if (v50)
      {
        uint64_t v54 = v64[7];
        swift_release();
        *(void *)(v54 + 8 * v49) = v42;
      }
      else
      {
        v64[(v49 >> 6) + 8] |= 1 << v49;
        *(unsigned char *)(v64[6] + v49) = v63;
        *(void *)(v64[7] + 8 * v49) = v42;
        uint64_t v55 = v64[2];
        BOOL v36 = __OFADD__(v55, 1);
        uint64_t v56 = v55 + 1;
        if (v36) {
          goto LABEL_80;
        }
        v64[2] = v56;
      }
      swift_bridgeObjectRelease();
      sub_9C04C(v60);
      uint64_t v3 = v39;
      uint64_t v18 = v38;
      uint64_t v16 = v62;
    }
    goto LABEL_76;
  }
LABEL_78:
  swift_bridgeObjectRetain();
  sub_2DBDC();
  swift_bridgeObjectRelease_n();
  sub_92108();
}

void sub_A3BBC(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  sub_8C308(a1, a2, a3, a4, 0xD000000000000020, (a5 - 32) | 0x8000000000000000);
}

uint64_t sub_A3BDC()
{
  return v0;
}

void sub_A3C14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_8C308(a1, v4, a3, a4, 0xD00000000000001DLL, v5 | 0x8000000000000000);
}

uint64_t sub_A3C38()
{
  return sub_B30D0();
}

uint64_t sub_A3C58()
{
  return v0;
}

unint64_t sub_A3C6C(char a1)
{
  v2._countAndFlagsBits = sub_A3CC8(a1);
  sub_B3020(v2);
  swift_bridgeObjectRelease();
  return 0xD000000000000014;
}

uint64_t sub_A3CC8(char a1)
{
  uint64_t result = 0x6564756C636E6F43;
  switch(a1)
  {
    case 1:
      uint64_t result = 19279;
      break;
    case 2:
      uint64_t result = 0x7055746867756143;
      break;
    case 3:
      uint64_t result = 0x69616D6F44646441;
      break;
    case 4:
      uint64_t result = 0x6F4465766F6D6552;
      break;
    case 5:
      uint64_t result = 0xD000000000000015;
      break;
    case 6:
      uint64_t result = 0xD00000000000001BLL;
      break;
    case 7:
      uint64_t result = 7562585;
      break;
    case 8:
      uint64_t result = 28494;
      break;
    case 9:
      uint64_t result = 0xD000000000000012;
      break;
    case 10:
      uint64_t result = 0xD000000000000017;
      break;
    case 11:
      uint64_t result = 0x656E696C66664FLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_A3E38(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_DC188;
  v6._object = a2;
  unint64_t v4 = sub_B3680(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 0xC) {
    return 12;
  }
  else {
    return v4;
  }
}

uint64_t sub_A3E84(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_5D468(*a1, *a2);
}

Swift::Int sub_A3E90()
{
  return sub_7F460(*v0);
}

uint64_t sub_A3E98(uint64_t a1)
{
  return sub_7FCE8(a1, *v1);
}

Swift::Int sub_A3EA0(uint64_t a1)
{
  return sub_80718(a1, *v1);
}

uint64_t sub_A3EA8@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_A3E38(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_A3ED8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_A3CC8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_A3F04()
{
  return sub_A3C6C(*v0);
}

uint64_t getEnumTagSinglePayload for CommonDialogs(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF5)
  {
    if (a2 + 11 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 11) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 12;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xC;
  int v5 = v6 - 12;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for CommonDialogs(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF4)
  {
    unsigned int v6 = ((a2 - 245) >> 8) + 1;
    *uint64_t result = a2 + 11;
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
        JUMPOUT(0xA4060);
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
          *uint64_t result = a2 + 11;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CommonDialogs()
{
  return &type metadata for CommonDialogs;
}

unint64_t sub_A409C()
{
  unint64_t result = qword_ECAB0;
  if (!qword_ECAB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_ECAB0);
  }
  return result;
}

ValueMetadata *type metadata accessor for TimedOutError()
{
  return &type metadata for TimedOutError;
}

uint64_t sub_A40F8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return _swift_task_switch(sub_A4118, 0, 0);
}

uint64_t sub_A4118()
{
  sub_7FDC();
  if (qword_E6D58 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_B2D30();
  sub_B378(v1, (uint64_t)qword_F5360);
  sub_8C320(0xD000000000000010, 0x80000000000BC370, 0xD00000000000002ELL, 0x80000000000BC390, 0xD000000000000019, 0x80000000000BC3C0);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_A423C;
  return sub_7CB0();
}

uint64_t sub_A423C()
{
  sub_7FDC();
  char v2 = v1;
  sub_7FC4();
  uint64_t v4 = v3;
  uint64_t v5 = *v0;
  swift_task_dealloc();
  if (v2)
  {
    unsigned int v6 = (void *)swift_task_alloc();
    *(void *)(v4 + 40) = v6;
    *unsigned int v6 = v5;
    v6[1] = sub_A4388;
    return sub_7AF8(3, 0);
  }
  else
  {
    return _swift_task_switch(sub_A445C, 0, 0);
  }
}

uint64_t sub_A4388()
{
  sub_7FDC();
  sub_7FC4();
  swift_task_dealloc();
  return _swift_task_switch(sub_A445C, 0, 0);
}

uint64_t sub_A445C()
{
  sub_7FDC();
  sub_7468(*(void **)(v0 + 24), *(void *)(*(void *)(v0 + 24) + 24));
  sub_A2098();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_A44C4(unsigned __int8 a1)
{
  sub_21ECC(a1);
  uint64_t v1 = sub_B2160();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_A4594()
{
  uint64_t v0 = sub_B2D30();
  sub_18970(v0, qword_ECAC0);
  uint64_t v1 = sub_B378(v0, (uint64_t)qword_ECAC0);
  if (qword_E6D60 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_B378(v0, (uint64_t)qword_F5378);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_A465C()
{
  sub_7FDC();
  *(unsigned char *)(v0 + 88) = v1;
  *(void *)(v0 + 24) = v2;
  *(void *)(v0 + 32) = v3;
  *(void *)(v0 + 16) = v4;
  *(void *)(v0 + 40) = sub_7424(&qword_E9AA0);
  *(void *)(v0 + 48) = swift_task_alloc();
  sub_AC10();
  return _swift_task_switch(v5, v6, v7);
}

uint64_t sub_A46F4()
{
  sub_AC48();
  char v1 = *(unsigned char *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v4 = swift_allocObject();
  *(void *)(v0 + 56) = v4;
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = v2;
  *(unsigned char *)(v4 + 32) = v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v5;
  v5[2] = 0x4018000000000000;
  v5[3] = &unk_ECAE8;
  v5[4] = v4;
  v5[5] = 0xD00000000000001ELL;
  v5[6] = 0x80000000000BC3E0;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_A4834;
  uint64_t v7 = *(void *)(v0 + 48);
  return withThrowingTaskGroup<A, B>(of:returning:isolation:body:)(v7);
}

uint64_t sub_A4834()
{
  sub_7FDC();
  sub_7FC4();
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_AB94();
  *uint64_t v5 = v4;
  *(void *)(v3 + 80) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_release();
    swift_task_dealloc();
  }
  sub_AC10();
  return _swift_task_switch(v6, v7, v8);
}

uint64_t sub_A4924()
{
  sub_7FDC();
  sub_2B53C(*(void *)(v0 + 48), *(void *)(v0 + 16), &qword_E9AA0);
  swift_task_dealloc();
  sub_ABD0();
  return v1();
}

uint64_t sub_A4990()
{
  sub_AC48();
  swift_task_dealloc();
  swift_release();
  if (qword_E6E28 != -1) {
    swift_once();
  }
  char v1 = *(uint64_t **)(v0 + 16);
  uint64_t v2 = sub_B2D30();
  sub_B378(v2, (uint64_t)qword_ECAC0);
  sub_7A1C();
  sub_ABC4();
  sub_52848();
  sub_8C308(0xD000000000000015, v3, v4, v5, v6, v7);
  sub_A4E7C();
  uint64_t v8 = swift_allocError();
  *uint64_t v9 = 8;
  swift_errorRelease();
  *char v1 = v8;
  swift_storeEnumTagMultiPayload();
  swift_task_dealloc();
  sub_ABD0();
  return v10();
}

uint64_t sub_A4AD8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(unsigned char *)(v4 + 48) = a4;
  *(void *)(v4 + 24) = a2;
  *(void *)(v4 + 32) = a3;
  *(void *)(v4 + 16) = a1;
  return _swift_task_switch(sub_A4B00, 0, 0);
}

uint64_t sub_A4B00()
{
  sub_7FDC();
  if (qword_E6E28 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_B2D30();
  sub_B378(v1, (uint64_t)qword_ECAC0);
  sub_7A1C();
  sub_ABC4();
  sub_52848();
  sub_8C308(0xD00000000000001ELL, v2, v3, v4, 0xD00000000000001ELL, v5);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_A4C24;
  uint64_t v7 = *(void *)(v0 + 24);
  uint64_t v8 = *(void *)(v0 + 32);
  uint64_t v9 = *(void *)(v0 + 16);
  char v10 = *(unsigned char *)(v0 + 48);
  return sub_A4EC8(v9, v7, v8, v10);
}

uint64_t sub_A4C24()
{
  sub_7FDC();
  sub_7FC4();
  uint64_t v1 = *v0;
  sub_AB94();
  *unint64_t v2 = v1;
  swift_task_dealloc();
  sub_ABD0();
  return v3();
}

uint64_t sub_A4CE4()
{
  return _swift_deallocObject(v0, 33, 7);
}

uint64_t sub_A4CF4()
{
  sub_AC48();
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v5 = *(void *)(v0 + 24);
  char v6 = *(unsigned char *)(v0 + 32);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_A7BC;
  return sub_A4AD8(v3, v4, v5, v6);
}

uint64_t sub_A4DA4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_A7BC;
  return sub_42670();
}

unint64_t sub_A4E7C()
{
  unint64_t result = qword_ECAF8;
  if (!qword_ECAF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_ECAF8);
  }
  return result;
}

uint64_t sub_A4EC8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(unsigned char *)(v4 + 80) = a4;
  *(void *)(v4 + 24) = a2;
  *(void *)(v4 + 32) = a3;
  *(void *)(v4 + 16) = a1;
  sub_7424(&qword_ECB08);
  *(void *)(v4 + 40) = swift_task_alloc();
  *(void *)(v4 + 48) = type metadata accessor for AggregateCommonForecast();
  *(void *)(v4 + 56) = swift_task_alloc();
  return _swift_task_switch(sub_A4F94, 0, 0);
}

uint64_t sub_A4F94()
{
  if (*(unsigned __int8 *)(v0 + 80) >= 2u)
  {
    if (qword_E6E28 != -1) {
      swift_once();
    }
    uint64_t v11 = *(uint64_t **)(v0 + 16);
    uint64_t v12 = sub_B2D30();
    sub_B378(v12, (uint64_t)qword_ECAC0);
    sub_7A1C();
    sub_ABC4();
    sub_A86F0(v13, v14, v15, v16, (uint64_t)"_getWeather(requestOriginInfo:)");
    sub_2A760();
    uint64_t v17 = swift_allocError();
    *uint64_t v18 = 1;
    *uint64_t v11 = v17;
    sub_7424(&qword_E9AA0);
    swift_storeEnumTagMultiPayload();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_ABD0();
    return v19();
  }
  else
  {
    double v2 = *(double *)(v0 + 24);
    double v1 = *(double *)(v0 + 32);
    if (qword_E6E28 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_B2D30();
    *(void *)(v0 + 64) = sub_B378(v3, (uint64_t)qword_ECAC0);
    sub_7A1C();
    sub_ABC4();
    sub_A86F0(v4, v5, v6, v7, (uint64_t)"_getWeather(requestOriginInfo:)");
    uint64_t v8 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_A51D4;
    uint64_t v9 = *(void *)(v0 + 40);
    return sub_A5454(v9, v2, v1);
  }
}

uint64_t sub_A51D4()
{
  sub_7FDC();
  sub_7FC4();
  uint64_t v1 = *v0;
  sub_AB94();
  *double v2 = v1;
  swift_task_dealloc();
  sub_AC10();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_A529C()
{
  sub_AC48();
  uint64_t v1 = v0[5];
  int v2 = sub_C844(v1, 1, v0[6]);
  uint64_t v3 = (uint64_t *)v0[2];
  if (v2 == 1)
  {
    sub_17644(v1, &qword_ECB08);
    sub_7A1C();
    sub_ABC4();
    sub_52848();
    sub_8C308(0xD000000000000018, v4, v5, v6, v7, v8);
    sub_A4E7C();
    uint64_t v9 = swift_allocError();
    *char v10 = 0;
    *uint64_t v3 = v9;
  }
  else
  {
    uint64_t v11 = v0[7];
    sub_A7468(v1, v11, (void (*)(void))type metadata accessor for AggregateCommonForecast);
    sub_A5F60(v11, (uint64_t)v3);
    sub_A6BFC(v11);
  }
  sub_7424(&qword_E9AA0);
  swift_storeEnumTagMultiPayload();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_ABD0();
  return v12();
}

uint64_t type metadata accessor for AggregateCommonForecast()
{
  uint64_t result = qword_ECB98;
  if (!qword_ECB98) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_A5454(uint64_t a1, double a2, double a3)
{
  *(double *)(v3 + 56) = a2;
  *(double *)(v3 + 64) = a3;
  *(void *)(v3 + 48) = a1;
  uint64_t v4 = sub_B2D30();
  *(void *)(v3 + 72) = v4;
  *(void *)(v3 + 80) = *(void *)(v4 - 8);
  *(void *)(v3 + 88) = swift_task_alloc();
  uint64_t v5 = sub_7424(&qword_ECB20);
  *(void *)(v3 + 96) = v5;
  *(void *)(v3 + 104) = *(void *)(v5 - 8);
  *(void *)(v3 + 112) = swift_task_alloc();
  uint64_t v6 = sub_7424(&qword_ECB28);
  *(void *)(v3 + 120) = v6;
  *(void *)(v3 + 128) = *(void *)(v6 - 8);
  *(void *)(v3 + 136) = swift_task_alloc();
  uint64_t v7 = sub_7424(&qword_ECB30);
  *(void *)(v3 + 144) = v7;
  *(void *)(v3 + 152) = *(void *)(v7 - 8);
  *(void *)(v3 + 160) = swift_task_alloc();
  uint64_t v8 = sub_7424(&qword_ECB38);
  *(void *)(v3 + 168) = v8;
  *(void *)(v3 + 176) = *(void *)(v8 - 8);
  *(void *)(v3 + 184) = swift_task_alloc();
  *(void *)(v3 + 192) = sub_7424(&qword_ECB18);
  *(void *)(v3 + 200) = swift_task_alloc();
  uint64_t v9 = sub_7424(&qword_EA6A8);
  *(void *)(v3 + 208) = v9;
  *(void *)(v3 + 216) = *(void *)(v9 - 8);
  *(void *)(v3 + 224) = swift_task_alloc();
  uint64_t v10 = sub_7424(&qword_EA690);
  *(void *)(v3 + 232) = v10;
  *(void *)(v3 + 240) = *(void *)(v10 - 8);
  *(void *)(v3 + 248) = swift_task_alloc();
  uint64_t v11 = sub_B1A40();
  *(void *)(v3 + 256) = v11;
  *(void *)(v3 + 264) = *(void *)(v11 - 8);
  *(void *)(v3 + 272) = swift_task_alloc();
  return _swift_task_switch(sub_A57E8, 0, 0);
}

uint64_t sub_A57E8()
{
  double v2 = v0[7];
  double v1 = v0[8];
  sub_B1AB0();
  *((void *)v0 + 35) = sub_B1AA0();
  id v3 = [objc_allocWithZone((Class)CLLocation) initWithLatitude:v2 longitude:v1];
  *((void *)v0 + 36) = v3;
  sub_B1A80();
  sub_B1A70();
  sub_B1A60();
  sub_B1A50();
  uint64_t v4 = (void *)swift_task_alloc();
  *((void *)v0 + 37) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_A596C;
  uint64_t v5 = *((void *)v0 + 34);
  uint64_t v6 = *((void *)v0 + 31);
  uint64_t v7 = *((void *)v0 + 28);
  uint64_t v8 = *((void *)v0 + 25);
  uint64_t v9 = *((void *)v0 + 23);
  uint64_t v10 = *((void *)v0 + 20);
  uint64_t v11 = *((void *)v0 + 17);
  return WeatherService.weather<A, B, C, D>(for:including:_:_:_:)(v5, v6, v7, v8, v3, v9, v10, v11);
}

uint64_t sub_A596C()
{
  sub_7FC4();
  uint64_t v29 = *(void *)(v2 + 184);
  sub_1306C();
  uint64_t v4 = *(void *)(v3 + 176);
  uint64_t v28 = *(void *)(v5 + 168);
  sub_1306C();
  uint64_t v27 = *(void *)(v6 + 160);
  sub_1306C();
  uint64_t v8 = *(void *)(v7 + 152);
  uint64_t v26 = *(void *)(v9 + 144);
  sub_1306C();
  uint64_t v25 = *(void *)(v10 + 136);
  sub_1306C();
  uint64_t v12 = *(void *)(v11 + 128);
  uint64_t v14 = v13[15];
  uint64_t v15 = v13[14];
  uint64_t v16 = v13[13];
  uint64_t v17 = v13[12];
  uint64_t v18 = *v1;
  sub_AB94();
  *uint64_t v19 = v18;
  *(void *)(v20 + 304) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v25, v14);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v27, v26);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v29, v28);
  sub_AC10();
  return _swift_task_switch(v21, v22, v23);
}

uint64_t sub_A5BBC()
{
  uint64_t v2 = *(void *)(v0 + 264);
  uint64_t v1 = *(void *)(v0 + 272);
  uint64_t v4 = *(void *)(v0 + 248);
  uint64_t v3 = *(void *)(v0 + 256);
  uint64_t v5 = *(void *)(v0 + 232);
  uint64_t v6 = *(void *)(v0 + 240);
  uint64_t v7 = *(void *)(v0 + 216);
  uint64_t v12 = *(void *)(v0 + 208);
  uint64_t v13 = *(void *)(v0 + 224);
  uint64_t v14 = *(void *)(v0 + 200);
  uint64_t v8 = *(void *)(v0 + 48);

  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v8, v1, v3);
  uint64_t v9 = (int *)type metadata accessor for AggregateCommonForecast();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v8 + v9[5], v4, v5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v8 + v9[6], v13, v12);
  sub_2B53C(v14, v8 + v9[7], &qword_ECB18);
  sub_AA40(v8, 0, 1, (uint64_t)v9);
  sub_A8678();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_ABD0();
  return v10();
}

uint64_t sub_A5D38()
{
  if (qword_E6E28 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[36];
  uint64_t v3 = v0[10];
  uint64_t v2 = v0[11];
  uint64_t v4 = v0[9];
  uint64_t v13 = v0[6];
  uint64_t v5 = sub_B378(v4, (uint64_t)qword_ECAC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  sub_B34C0(40);
  swift_bridgeObjectRelease();
  swift_getErrorValue();
  v15._countAndFlagsBits = sub_B3860();
  sub_B3020(v15);
  swift_bridgeObjectRelease();
  sub_ABC4();
  sub_52848();
  sub_8C2F0(v6, 0x80000000000BC5E0, v7, v8, 0xD000000000000017, v9);

  swift_release();
  swift_bridgeObjectRelease();
  swift_errorRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  uint64_t v10 = type metadata accessor for AggregateCommonForecast();
  sub_AA40(v13, 1, 1, v10);
  sub_A8678();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_ABD0();
  return v11();
}

uint64_t sub_A5F60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v110 = a2;
  uint64_t v114 = sub_7424((uint64_t *)&unk_E7880);
  sub_7870();
  uint64_t v121 = v3;
  __chkstk_darwin(v4);
  sub_7A0C();
  uint64_t v7 = v6 - v5;
  uint64_t v108 = sub_B17F0();
  sub_7870();
  uint64_t v107 = v8;
  __chkstk_darwin(v9);
  sub_17768();
  uint64_t v128 = v10;
  uint64_t v106 = type metadata accessor for WeatherState();
  sub_79FC();
  __chkstk_darwin(v11);
  sub_17768();
  uint64_t v109 = v12;
  uint64_t v13 = sub_B2D30();
  sub_7870();
  unint64_t v130 = v14;
  uint64_t v16 = __chkstk_darwin(v15);
  v118 = (char *)&v105 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v129 = (char *)&v105 - v18;
  uint64_t v19 = sub_7424(&qword_ECB18);
  __chkstk_darwin(v19 - 8);
  sub_7A0C();
  uint64_t v22 = v21 - v20;
  uint64_t v23 = sub_B1B20();
  sub_7870();
  uint64_t v25 = v24;
  __chkstk_darwin(v26);
  sub_7A0C();
  uint64_t v29 = v28 - v27;
  uint64_t v30 = type metadata accessor for CurrentWeatherForecast();
  sub_79FC();
  __chkstk_darwin(v31);
  sub_7A0C();
  uint64_t v34 = v33 - v32;
  uint64_t v35 = (int *)type metadata accessor for AggregateCommonForecast();
  sub_64858(a1, a1 + v35[6], v34);
  uint64_t v116 = v30;
  uint64_t v36 = *(int *)(v30 + 28);
  uint64_t v127 = v34;
  uint64_t v117 = v36;
  int v115 = *(unsigned __int8 *)(v34 + v36);
  unsigned __int8 v135 = 0;
  uint64_t v37 = v35[7];
  uint64_t v119 = a1;
  sub_A73BC(a1 + v37, v22);
  if (sub_C844(v22, 1, v23) == 1)
  {
    sub_17644(v22, &qword_ECB18);
    unint64_t v126 = 0;
    uint64_t v125 = 0;
    uint64_t v38 = 0;
    uint64_t v124 = 0;
    uint64_t v123 = 0;
    uint64_t v122 = 0;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 32))(v29, v22, v23);
    sub_5C35C((uint64_t)v136);
    unsigned __int8 v39 = v136[0];
    unint64_t v126 = v137;
    uint64_t v38 = v139;
    uint64_t v125 = v138;
    uint64_t v124 = v140;
    uint64_t v123 = v141;
    uint64_t v122 = v142;
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v29, v23);
    sub_AC10();
    sub_A7424(v40, v41, v42, 0);
    unsigned __int8 v135 = v39;
  }
  if (qword_E6E28 != -1) {
    swift_once();
  }
  uint64_t v43 = sub_B378(v13, (uint64_t)qword_ECAC0);
  uint64_t v44 = *(void (**)(char *, uint64_t, uint64_t))(v130 + 16);
  uint64_t v112 = v43;
  uint64_t v120 = v13;
  unint64_t v113 = v130 + 16;
  v111 = v44;
  ((void (*)(char *))v44)(v129);
  uint64_t v143 = 0;
  unint64_t v144 = 0xE000000000000000;
  sub_B34C0(25);
  swift_bridgeObjectRelease();
  sub_A86E0(0xD000000000000016);
  uint64_t v131 = v38;
  if (v38)
  {
    uint64_t v45 = v135;
    LOBYTE(v143) = v135 & 1;
    uint64_t v46 = v126;
    uint64_t v47 = v125;
    unint64_t v144 = v126;
    uint64_t v145 = v125;
    uint64_t v105 = v7;
    uint64_t v146 = v131;
    uint64_t v147 = v124;
    uint64_t v148 = v123;
    uint64_t v149 = v122;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v48 = sub_5C07C();
    char v50 = v49;
    uint64_t v51 = v47;
    uint64_t v38 = v131;
    uint64_t v7 = v105;
    sub_A7424(v45, v46, v51, v131);
  }
  else
  {
    char v50 = (void *)0xE300000000000000;
    uint64_t v48 = 4999502;
  }
  v150._countAndFlagsBits = v48;
  v150._object = v50;
  sub_B3020(v150);
  swift_bridgeObjectRelease();
  v151._countAndFlagsBits = 44;
  v151._object = (void *)0xE100000000000000;
  sub_B3020(v151);
  uint64_t v52 = v133;
  unint64_t v53 = v134;
  v133 = 0;
  unint64_t v134 = 0xE000000000000000;
  sub_B34C0(26);
  swift_bridgeObjectRelease();
  sub_A86E0(0xD000000000000018);
  if (v38 && (v135 & 1) != 0)
  {
    uint64_t v54 = (void *)0xE400000000000000;
    v55._countAndFlagsBits = 1702195828;
  }
  else
  {
    uint64_t v54 = (void *)0xE500000000000000;
    v55._countAndFlagsBits = 0x65736C6166;
  }
  v55._object = v54;
  sub_B3020(v55);
  swift_bridgeObjectRelease();
  uint64_t v56 = (uint64_t)v133;
  uint64_t v57 = (void *)v134;
  v133 = v52;
  unint64_t v134 = v53;
  swift_bridgeObjectRetain();
  v152._countAndFlagsBits = v56;
  v152._object = v57;
  sub_B3020(v152);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_A864C();
  uint64_t v58 = v129;
  sub_8C320(v59, v60, v61, v62, v63, v64);
  swift_bridgeObjectRelease();
  v65 = *(void (**)(char *, uint64_t))(v130 + 8);
  uint64_t v66 = v120;
  v65(v58, v120);
  uint64_t v67 = sub_64FE4(v119 + v35[5]);
  v68 = v118;
  v111(v118, v112, v66);
  v133 = 0;
  unint64_t v134 = 0xE000000000000000;
  sub_B34C0(47);
  swift_bridgeObjectRelease();
  sub_A86E0(0xD00000000000002DLL);
  uint64_t v132 = *(void *)(v67 + 16);
  v153._countAndFlagsBits = sub_B37C0();
  sub_B3020(v153);
  swift_bridgeObjectRelease();
  sub_A864C();
  sub_8C308(v69, v70, v71, v72, v73, v74);
  swift_bridgeObjectRelease();
  v65(v68, v66);
  uint64_t v75 = v127;
  unint64_t v76 = sub_A6C58(v127 + *(int *)(v116 + 32), v67, v115);
  swift_bridgeObjectRelease();
  sub_B17E0();
  id v77 = [self fahrenheit];
  uint64_t v78 = v114;
  sub_B14B0();

  sub_B14A0();
  uint64_t v80 = v79;
  (*(void (**)(uint64_t, uint64_t))(v121 + 8))(v7, v78);
  unint64_t v81 = sub_19008(*(unsigned char *)(v75 + v117));
  unint64_t v83 = v82;
  if (v76 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v84 = sub_B3620();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v84 = *(void *)((char *)&dword_10 + (v76 & 0xFFFFFFFFFFFFFF8));
  }
  v85 = _swiftEmptyArrayStorage;
  if (v84)
  {
    v133 = _swiftEmptyArrayStorage;
    sub_859F4(0, v84 & ~(v84 >> 63), 0);
    if (v84 < 0)
    {
      __break(1u);
      JUMPOUT(0xA6BA0);
    }
    unint64_t v130 = v81;
    uint64_t v86 = 0;
    v85 = v133;
    do
    {
      if ((v76 & 0xC000000000000001) != 0) {
        uint64_t v87 = sub_B34F0();
      }
      else {
        uint64_t v87 = swift_retain();
      }
      unint64_t v88 = 0xE900000000000065;
      unint64_t v89 = 0x6E61636972727568;
      switch(*(unsigned char *)(v87 + 16))
      {
        case 1:
          unint64_t v88 = 0xE700000000000000;
          unint64_t v89 = 0x6F64616E726F74;
          break;
        case 2:
          unint64_t v88 = 0xED00006D726F7453;
          unint64_t v89 = 0x6C616369706F7274;
          break;
        case 3:
          unint64_t v88 = 0xE800000000000000;
          unint64_t v89 = 0x6472617A7A696C62;
          break;
        case 4:
          unint64_t v88 = 0xE400000000000000;
          unint64_t v89 = 1818845544;
          break;
        case 5:
          unint64_t v88 = 0xEC0000006D726F74;
          unint64_t v89 = 0x737265646E756874;
          break;
        case 6:
          unint64_t v88 = 0xE500000000000000;
          unint64_t v89 = 0x7465656C73;
          break;
        case 7:
          unint64_t v88 = 0xE500000000000000;
          uint64_t v90 = 2003791475;
          goto LABEL_35;
        case 8:
          unint64_t v88 = 0xEB00000000776F6ELL;
          unint64_t v89 = 0x53676E69776F6C62;
          break;
        case 9:
          unint64_t v88 = 0xE500000000000000;
          uint64_t v90 = 1852399986;
          goto LABEL_35;
        case 0xA:
          unint64_t v88 = 0xE500000000000000;
          uint64_t v90 = 1802464627;
          goto LABEL_35;
        case 0xB:
          unint64_t v88 = 0xE400000000000000;
          unint64_t v89 = 1953723748;
          break;
        case 0xC:
          unint64_t v88 = 0xE500000000000000;
          uint64_t v90 = 1684957559;
          goto LABEL_35;
        case 0xD:
          unint64_t v88 = 0xE500000000000000;
          uint64_t v90 = 1734831974;
LABEL_35:
          unint64_t v89 = v90 & 0xFFFF0000FFFFFFFFLL | 0x7900000000;
          break;
        case 0xE:
          unint64_t v88 = 0xE400000000000000;
          unint64_t v89 = 1702519144;
          break;
        case 0xF:
          unint64_t v88 = 0xE600000000000000;
          unint64_t v89 = 0x7964756F6C63;
          break;
        case 0x10:
          unint64_t v88 = 0xEC0000007964756FLL;
          unint64_t v89 = 0x6C43796C74726170;
          break;
        case 0x11:
          unint64_t v88 = 0xE500000000000000;
          unint64_t v89 = 0x7261656C63;
          break;
        case 0x12:
          unint64_t v88 = 0xE400000000000000;
          unint64_t v89 = 1684828003;
          break;
        case 0x13:
          unint64_t v88 = 0xE300000000000000;
          unint64_t v89 = 7630696;
          break;
        case 0x14:
          unint64_t v88 = 0xEB00000000796475;
          unint64_t v89 = 0x6F6C43646578696DLL;
          break;
        case 0x15:
          unint64_t v88 = 0xEA00000000007261;
          unint64_t v89 = 0x656C43646578696DLL;
          break;
        case 0x16:
          unint64_t v88 = 0xEC000000656C6261;
          unint64_t v89 = 0x6C69617641746F6ELL;
          break;
        default:
          break;
      }
      swift_release();
      v133 = v85;
      unint64_t v92 = v85[2];
      unint64_t v91 = v85[3];
      if (v92 >= v91 >> 1)
      {
        sub_859F4((char *)(v91 > 1), v92 + 1, 1);
        v85 = v133;
      }
      ++v86;
      v85[2] = v92 + 1;
      v93 = &v85[2 * v92];
      v93[4] = v89;
      v93[5] = v88;
    }
    while (v84 != v86);
    unint64_t v81 = v130;
  }
  uint64_t v94 = v109;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v107 + 32))(v109, v128, v108);
  uint64_t v95 = v106;
  *(void *)(v94 + *(int *)(v106 + 20)) = v80;
  v96 = (unint64_t *)(v94 + *(int *)(v95 + 24));
  unint64_t *v96 = v81;
  v96[1] = v83;
  *(void *)(v94 + *(int *)(v95 + 28)) = v85;
  uint64_t v97 = v110;
  sub_A7468(v127, v110, (void (*)(void))type metadata accessor for CurrentWeatherForecast);
  unsigned __int8 v98 = v135;
  v99 = (int *)type metadata accessor for WeatherPreprocessingResult(0);
  *(void *)(v97 + v99[5]) = v76;
  uint64_t v100 = v97 + v99[6];
  *(unsigned char *)uint64_t v100 = v98;
  *(unsigned char *)(v100 + 7) = 0;
  *(_WORD *)(v100 + 5) = 0;
  *(_DWORD *)(v100 + 1) = 0;
  uint64_t v101 = v125;
  *(void *)(v100 + 8) = v126;
  *(void *)(v100 + 16) = v101;
  uint64_t v102 = v124;
  *(void *)(v100 + 24) = v131;
  *(void *)(v100 + 32) = v102;
  uint64_t v103 = v122;
  *(void *)(v100 + 40) = v123;
  *(void *)(v100 + 48) = v103;
  return sub_A7468(v94, v97 + v99[7], (void (*)(void))type metadata accessor for WeatherState);
}

uint64_t sub_A6BFC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AggregateCommonForecast();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_A6C58(uint64_t a1, uint64_t a2, int a3)
{
  int v36 = a3;
  uint64_t v35 = a2;
  uint64_t v4 = sub_B17F0();
  uint64_t v30 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v29 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_B2D30();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v34 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v31 = (char *)&v26 - v11;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v26 - v12;
  if (qword_E6E28 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_B378(v6, (uint64_t)qword_ECAC0);
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v37 = v14;
  uint64_t v38 = v15;
  v15(v13, v14, v6);
  uint64_t v40 = 0;
  unint64_t v41 = 0xE000000000000000;
  sub_B34C0(24);
  swift_bridgeObjectRelease();
  uint64_t v40 = 0xD000000000000016;
  unint64_t v41 = 0x80000000000BC580;
  sub_A858C((unint64_t *)&qword_E8E40, (void (*)(uint64_t))&type metadata accessor for Date);
  v42._countAndFlagsBits = sub_B37C0();
  uint64_t v26 = a1;
  sub_B3020(v42);
  swift_bridgeObjectRelease();
  unint64_t v33 = (unint64_t)"WeatherKit timed out.";
  uint64_t v27 = 0x80000000000BC420;
  uint64_t v28 = 0xD00000000000002CLL;
  unint64_t v32 = (unint64_t)"observationStartTime: ";
  sub_8C308(v40, v41, 0xD00000000000002CLL, 0x80000000000BC420, 0xD000000000000019, 0x80000000000BC5A0);
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v7 + 8);
  v16(v13, v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v30 + 16))(v29, a1, v4);
  int v17 = sub_7256C();
  uint64_t v18 = v31;
  v38(v31, v37, v6);
  uint64_t v40 = 0;
  unint64_t v41 = 0xE000000000000000;
  sub_B34C0(17);
  swift_bridgeObjectRelease();
  uint64_t v40 = 0x57746867694E7369;
  unint64_t v41 = 0xEF203A776F646E69;
  if (v17 == 1) {
    v19._countAndFlagsBits = 1702195828;
  }
  else {
    v19._countAndFlagsBits = 0x65736C6166;
  }
  if (v17 == 1) {
    uint64_t v20 = (void *)0xE400000000000000;
  }
  else {
    uint64_t v20 = (void *)0xE500000000000000;
  }
  v19._object = v20;
  sub_B3020(v19);
  swift_bridgeObjectRelease();
  sub_8C308(v40, v41, v28, v27, 0xD000000000000019, 0x80000000000BC5A0);
  uint64_t v21 = v16;
  swift_bridgeObjectRelease();
  v16(v18, v6);
  type metadata accessor for WeatherFilteredConditionsProvider();
  sub_A2AF0();
  unint64_t v22 = (unint64_t)sub_A2F48();
  swift_bridgeObjectRelease();
  uint64_t v23 = v34;
  v38(v34, v37, v6);
  uint64_t v40 = 0;
  unint64_t v41 = 0xE000000000000000;
  sub_B34C0(34);
  swift_bridgeObjectRelease();
  uint64_t v40 = 0xD00000000000001FLL;
  unint64_t v41 = 0x80000000000BC5C0;
  if (v22 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_B3620();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v24 = *(void *)((char *)&dword_10 + (v22 & 0xFFFFFFFFFFFFFF8));
  }
  uint64_t v39 = v24;
  v43._countAndFlagsBits = sub_B37C0();
  sub_B3020(v43);
  swift_bridgeObjectRelease();
  v44._countAndFlagsBits = 46;
  v44._object = (void *)0xE100000000000000;
  sub_B3020(v44);
  sub_8C308(v40, v41, 0xD00000000000002CLL, v33 | 0x8000000000000000, 0xD000000000000019, v32 | 0x8000000000000000);
  swift_bridgeObjectRelease();
  v21(v23, v6);
  return v22;
}

uint64_t (*sub_A71AC())()
{
  uint64_t v1 = sub_A86C0();
  uint64_t v2 = sub_A86AC((uint64_t)v1);
  *(void *)(v0 + 32) = sub_A72DC(v2, v3);
  return sub_A71F8;
}

uint64_t (*sub_A71FC())()
{
  uint64_t v1 = sub_A86C0();
  uint64_t v2 = sub_A86AC((uint64_t)v1);
  *(void *)(v0 + 32) = sub_A7348(v2, v3);
  return sub_A71F8;
}

uint64_t (*sub_A7248())()
{
  uint64_t v1 = sub_A86C0();
  uint64_t v2 = sub_A86AC((uint64_t)v1);
  *(void *)(v0 + 32) = sub_A74BC(v2, v3);
  return sub_A71F8;
}

void sub_A7294(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_A72DC(uint64_t a1, uint64_t a2))(id *)
{
  unint64_t v6 = sub_A8630(a1, a2);
  sub_21550(v6, v7, v8);
  if (v5) {
    id v9 = (id)sub_B34F0();
  }
  else {
    id v9 = *(id *)(v3 + 8 * v4 + 32);
  }
  *uint64_t v2 = v9;
  return sub_A862C;
}

uint64_t (*sub_A7348(uint64_t a1, uint64_t a2))()
{
  unint64_t v4 = sub_A8630(a1, a2);
  sub_21550(v4, v5, v6);
  if (v3) {
    uint64_t v7 = sub_B34F0();
  }
  else {
    uint64_t v7 = swift_retain();
  }
  *uint64_t v2 = v7;
  return sub_A73B4;
}

uint64_t sub_A73B4()
{
  return swift_release();
}

uint64_t sub_A73BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_7424(&qword_ECB18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_A7424(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_A7468(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_79FC();
  uint64_t v4 = sub_2B8A4();
  v5(v4);
  return a2;
}

void (*sub_A74BC(uint64_t a1, uint64_t a2))(id *a1)
{
  unint64_t v6 = sub_A8630(a1, a2);
  sub_21550(v6, v7, v8);
  if (v5) {
    id v9 = (id)sub_B34F0();
  }
  else {
    id v9 = *(id *)(v3 + 8 * v4 + 32);
  }
  *uint64_t v2 = v9;
  return sub_A7528;
}

void sub_A7528(id *a1)
{
}

ValueMetadata *type metadata accessor for WeatherService()
{
  return &type metadata for WeatherService;
}

uint64_t *sub_A7540(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_B1A40();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    id v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_7424(&qword_EA690);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = a3[6];
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = sub_7424(&qword_EA6A8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    uint64_t v16 = a3[7];
    int v17 = (char *)a1 + v16;
    uint64_t v18 = (char *)a2 + v16;
    uint64_t v19 = sub_B1B20();
    if (sub_C844((uint64_t)v18, 1, v19))
    {
      uint64_t v20 = sub_7424(&qword_ECB18);
      memcpy(v17, v18, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
      sub_AA40((uint64_t)v17, 0, 1, v19);
    }
  }
  return a1;
}

uint64_t sub_A7744(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_B1A40();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + a2[5];
  uint64_t v6 = sub_7424(&qword_EA690);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + a2[6];
  uint64_t v8 = sub_7424(&qword_EA6A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = a1 + a2[7];
  uint64_t v10 = sub_B1B20();
  uint64_t result = sub_C844(v9, 1, v10);
  if (!result)
  {
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);
    return v12(v9, v10);
  }
  return result;
}

uint64_t sub_A78A4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_B1A40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_7424(&qword_EA690);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_7424(&qword_EA6A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  int v17 = (const void *)(a2 + v15);
  uint64_t v18 = sub_B1B20();
  if (sub_C844((uint64_t)v17, 1, v18))
  {
    uint64_t v19 = sub_7424(&qword_ECB18);
    memcpy(v16, v17, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
    sub_AA40((uint64_t)v16, 0, 1, v18);
  }
  return a1;
}

uint64_t sub_A7A58(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_B1A40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_7424(&qword_EA690);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_7424(&qword_EA6A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  int v17 = (const void *)(a2 + v15);
  uint64_t v18 = sub_B1B20();
  LODWORD(v13) = sub_C844((uint64_t)v16, 1, v18);
  int v19 = sub_C844((uint64_t)v17, 1, v18);
  if (!v13)
  {
    uint64_t v20 = *(void *)(v18 - 8);
    if (!v19)
    {
      (*(void (**)(void *, const void *, uint64_t))(v20 + 24))(v16, v17, v18);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v20 + 8))(v16, v18);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    uint64_t v21 = sub_7424(&qword_ECB18);
    memcpy(v16, v17, *(void *)(*(void *)(v21 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
  sub_AA40((uint64_t)v16, 0, 1, v18);
  return a1;
}

uint64_t sub_A7C8C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_B1A40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_7424(&qword_EA690);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_7424(&qword_EA6A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  int v17 = (const void *)(a2 + v15);
  uint64_t v18 = sub_B1B20();
  if (sub_C844((uint64_t)v17, 1, v18))
  {
    uint64_t v19 = sub_7424(&qword_ECB18);
    memcpy(v16, v17, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
    sub_AA40((uint64_t)v16, 0, 1, v18);
  }
  return a1;
}

uint64_t sub_A7E40(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_B1A40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_7424(&qword_EA690);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_7424(&qword_EA6A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  int v17 = (const void *)(a2 + v15);
  uint64_t v18 = sub_B1B20();
  LODWORD(v13) = sub_C844((uint64_t)v16, 1, v18);
  int v19 = sub_C844((uint64_t)v17, 1, v18);
  if (!v13)
  {
    uint64_t v20 = *(void *)(v18 - 8);
    if (!v19)
    {
      (*(void (**)(void *, const void *, uint64_t))(v20 + 40))(v16, v17, v18);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v20 + 8))(v16, v18);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    uint64_t v21 = sub_7424(&qword_ECB18);
    memcpy(v16, v17, *(void *)(*(void *)(v21 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
  sub_AA40((uint64_t)v16, 0, 1, v18);
  return a1;
}

uint64_t sub_A8074(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_A8088);
}

uint64_t sub_A8088(uint64_t a1, uint64_t a2, int *a3)
{
  sub_B1A40();
  sub_176F8();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    sub_7424(&qword_EA690);
    sub_176F8();
    if (*(_DWORD *)(v11 + 84) == a2)
    {
      uint64_t v8 = v10;
      uint64_t v12 = a3[5];
    }
    else
    {
      sub_7424(&qword_EA6A8);
      sub_176F8();
      if (*(_DWORD *)(v14 + 84) == a2)
      {
        uint64_t v8 = v13;
        uint64_t v12 = a3[6];
      }
      else
      {
        uint64_t v8 = sub_7424(&qword_ECB18);
        uint64_t v12 = a3[7];
      }
    }
    uint64_t v9 = a1 + v12;
  }

  return sub_C844(v9, a2, v8);
}

uint64_t sub_A8158(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_A816C);
}

uint64_t sub_A816C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  sub_B1A40();
  sub_176F8();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    sub_7424(&qword_EA690);
    sub_176F8();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = a4[5];
    }
    else
    {
      sub_7424(&qword_EA6A8);
      sub_176F8();
      if (*(_DWORD *)(v16 + 84) == a3)
      {
        uint64_t v10 = v15;
        uint64_t v14 = a4[6];
      }
      else
      {
        uint64_t v10 = sub_7424(&qword_ECB18);
        uint64_t v14 = a4[7];
      }
    }
    uint64_t v11 = a1 + v14;
  }

  return sub_AA40(v11, a2, a2, v10);
}

void sub_A8244()
{
  sub_B1A40();
  if (v0 <= 0x3F)
  {
    sub_A8384();
    if (v1 <= 0x3F)
    {
      sub_A8488();
      if (v2 <= 0x3F)
      {
        sub_A85D4();
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_A8384()
{
  if (!qword_ECBA8)
  {
    sub_B1A00();
    sub_A858C(&qword_ECBB0, (void (*)(uint64_t))&type metadata accessor for HourWeather);
    sub_A858C(&qword_ECBB8, (void (*)(uint64_t))&type metadata accessor for HourWeather);
    sub_A858C(&qword_ECBC0, (void (*)(uint64_t))&type metadata accessor for HourWeather);
    unint64_t v0 = sub_B1B90();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_ECBA8);
    }
  }
}

void sub_A8488()
{
  if (!qword_ECBC8)
  {
    sub_B19C0();
    sub_A858C(&qword_ECBD0, (void (*)(uint64_t))&type metadata accessor for DayWeather);
    sub_A858C(&qword_ECBD8, (void (*)(uint64_t))&type metadata accessor for DayWeather);
    sub_A858C(&qword_ECBE0, (void (*)(uint64_t))&type metadata accessor for DayWeather);
    unint64_t v0 = sub_B1B90();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_ECBC8);
    }
  }
}

uint64_t sub_A858C(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_A85D4()
{
  if (!qword_ECBE8)
  {
    sub_B1B20();
    unint64_t v0 = sub_B3380();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_ECBE8);
    }
  }
}

uint64_t sub_A8630(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_A8678()
{
  return swift_task_dealloc();
}

uint64_t sub_A86AC(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

void *sub_A86C0()
{
  return malloc(0x28uLL);
}

void sub_A86E0(uint64_t a1@<X8>)
{
  *(void *)(v2 - 240) = a1;
  *(void *)(v2 - 232) = (v1 - 32) | 0x8000000000000000;
}

void sub_A86F0(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  sub_8C308(a1, a2, a3, a4, 0xD00000000000001FLL, (a5 - 32) | 0x8000000000000000);
}

uint64_t sub_A8710(unsigned char *a1)
{
  uint64_t v4 = sub_B1950();
  sub_7870();
  uint64_t v76 = v5;
  __chkstk_darwin(v6);
  sub_7A0C();
  uint64_t v9 = v8 - v7;
  sub_B1650();
  sub_7870();
  uint64_t v74 = v11;
  uint64_t v75 = v10;
  __chkstk_darwin(v10);
  sub_7A0C();
  uint64_t v77 = v13 - v12;
  uint64_t v14 = sub_7424(&qword_E7D38);
  uint64_t v15 = sub_13294(v14);
  __chkstk_darwin(v15);
  sub_57488();
  uint64_t v16 = sub_B17F0();
  sub_7870();
  uint64_t v78 = v17;
  uint64_t v19 = __chkstk_darwin(v18);
  __chkstk_darwin(v19);
  uint64_t v79 = (char *)&v69 - v20;
  uint64_t v21 = sub_B2D30();
  sub_7870();
  uint64_t v23 = v22;
  __chkstk_darwin(v24);
  sub_18DB0();
  if (qword_E6D58 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_B378(v21, (uint64_t)qword_F5360);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v1, v25, v21);
  sub_667C8((uint64_t)(a1 + 40), (uint64_t)v83, &qword_EA3B8);
  sub_667C8((uint64_t)v83, (uint64_t)v84, &qword_EA3B8);
  if (!v85 || (*a1 & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v29 = v4;
  unint64_t v30 = 0xD00000000000001CLL;
  id v31 = objc_allocWithZone((Class)NSUserDefaults);
  id v32 = sub_AA38C(0xD00000000000001BLL, 0x80000000000BC690);
  *(void *)&long long v73 = v32;
  if (!v32)
  {
    long long v81 = 0u;
    long long v82 = 0u;
LABEL_18:
    uint64_t v57 = (uint64_t *)&unk_E7990;
    uint64_t v58 = &v81;
LABEL_19:
    sub_12FE4((uint64_t)v58, v57);
    goto LABEL_20;
  }
  uint64_t v71 = v9;
  uint64_t v72 = v16;
  id v33 = v32;
  uint64_t v69 = "shouldIncludeAttribution(_:)";
  NSString v34 = sub_B2F20();
  id v35 = [v33 objectForKey:v34];
  id v70 = v33;

  if (v35)
  {
    sub_B3430();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v80, 0, sizeof(v80));
  }
  unint64_t v30 = v29;
  sub_667C8((uint64_t)v80, (uint64_t)&v81, (uint64_t *)&unk_E7990);
  if (!*((void *)&v82 + 1)) {
    goto LABEL_18;
  }
  sub_7424(&qword_E7718);
  if (swift_dynamicCast())
  {
    sub_ABD24(0x6D617473656D6974, 0xE900000000000070, *(uint64_t *)&v80[0], &v81);
    swift_bridgeObjectRelease();
    if (*((void *)&v82 + 1))
    {
      uint64_t v36 = v72;
      int v37 = swift_dynamicCast();
      sub_AA40(v2, v37 ^ 1u, 1, v36);
      if (sub_C844(v2, 1, v36) != 1)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v78 + 32))(v79, v2, v36);
        sub_B1920();
        sub_7424(&qword_EAD78);
        uint64_t v38 = sub_B1930();
        sub_7870();
        uint64_t v40 = v39;
        unint64_t v41 = (*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
        uint64_t v42 = swift_allocObject();
        long long v73 = xmmword_BEC70;
        *(_OWORD *)(v42 + 16) = xmmword_BEC70;
        unint64_t v43 = v42 + v41;
        uint64_t v44 = v72;
        (*(void (**)(unint64_t, void, uint64_t))(v40 + 104))(v43, enum case for Calendar.Component.day(_:), v38);
        sub_6AD94(v42);
        sub_B17E0();
        sub_B18B0();
        swift_bridgeObjectRelease();
        uint64_t v78 = *(void *)(v78 + 8);
        sub_131C8();
        v45();
        sub_131C8();
        v46();
        uint64_t v47 = sub_B15B0();
        if ((v48 & 1) != 0 || (uint64_t v49 = v47, v47 < 15))
        {
          sub_AA6B8(0xD00000000000002BLL, 0x80000000000BC750, 0xD00000000000002FLL, 0x80000000000BC6E0, (uint64_t)"shouldIncludeAttribution(_:)");

          sub_131C8();
          v68();
          ((void (*)(char *, uint64_t))v78)(v79, v44);
LABEL_5:
          uint64_t v26 = sub_AA63C();
          v27(v26);
          return 0;
        }
        sub_7424(&qword_ECD70);
        sub_7424(&qword_ECD78);
        uint64_t v50 = sub_AA690();
        *(_OWORD *)(v50 + 16) = v73;
        uint64_t v51 = (void *)(v50 + v30);
        uint64_t v52 = v44;
        *uint64_t v51 = 0x6D617473656D6974;
        v51[1] = 0xE900000000000070;
        id v53 = v70;
        sub_B17E0();
        sub_B2EA0();
        Class isa = sub_B2E60().super.isa;
        swift_bridgeObjectRelease();
        NSString v55 = sub_B2F20();
        [v53 setValue:isa forKey:v55];

        *(void *)&long long v81 = 0;
        *((void *)&v81 + 1) = 0xE000000000000000;
        sub_B34C0(36);
        swift_bridgeObjectRelease();
        *(void *)&long long v81 = 0xD000000000000022;
        *((void *)&v81 + 1) = 0x80000000000BC780;
        *(void *)&v80[0] = v49;
        v86._countAndFlagsBits = sub_B37C0();
        sub_B3020(v86);
        swift_bridgeObjectRelease();
        sub_8C308(v81, *((unint64_t *)&v81 + 1), 0xD00000000000002FLL, 0x80000000000BC6E0, 0xD00000000000001CLL, 0x80000000000BC710);

        swift_bridgeObjectRelease();
        sub_131C8();
        v56();
        ((void (*)(char *, uint64_t))v78)(v79, v52);
        goto LABEL_22;
      }
    }
    else
    {
      sub_12FE4((uint64_t)&v81, (uint64_t *)&unk_E7990);
      sub_AA40(v2, 1, 1, v72);
    }
    uint64_t v57 = &qword_E7D38;
    uint64_t v58 = (long long *)v2;
    goto LABEL_19;
  }
LABEL_20:
  sub_AA6B8(0xD000000000000027, 0x80000000000BC6B0, 0xD00000000000002FLL, 0x80000000000BC6E0, (uint64_t)"shouldIncludeAttribution(_:)");
  sub_7424(&qword_ECD70);
  sub_7424(&qword_ECD78);
  uint64_t v59 = sub_AA690();
  *(_OWORD *)(v59 + 16) = xmmword_BEC70;
  unint64_t v60 = (void *)(v59 + v30);
  *unint64_t v60 = 0x6D617473656D6974;
  v60[1] = 0xE900000000000070;
  sub_B17E0();
  sub_B2EA0();
  if (!(void)v73)
  {
    uint64_t v66 = sub_AA63C();
    v67(v66);
    swift_bridgeObjectRelease();
    return 1;
  }
  id v61 = (id)v73;
  Class v62 = sub_B2E60().super.isa;
  swift_bridgeObjectRelease();
  NSString v63 = sub_B2F20();
  [v61 setValue:v62 forKey:v63];

LABEL_22:
  uint64_t v64 = sub_AA63C();
  v65(v64);
  return 1;
}

unint64_t sub_A90F4()
{
  return 0xD000000000000012;
}

uint64_t sub_A9110(char a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t v14 = sub_7424(&qword_EC828);
  uint64_t v15 = sub_13294(v14);
  __chkstk_darwin(v15);
  sub_18DB0();
  uint64_t v16 = sub_B2C40();
  sub_7870();
  uint64_t v18 = v17;
  __chkstk_darwin(v19);
  sub_57488();
  *(void *)(v8 + 16) = 0;
  *(unsigned char *)(v8 + 24) = a1;
  sub_B2C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 32))(v8 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin17WeatherAirQuality_airQualityCategoryScale, v10, v16);
  *(double *)(v8 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin17WeatherAirQuality_airQualityCategoryIndex) = (double)a4;
  *(double *)(v8 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin17WeatherAirQuality_airQualityIndex) = (double)a5;
  if (a7)
  {
    sub_B2C20();
    uint64_t v20 = 0;
  }
  else
  {
    uint64_t v20 = 1;
  }
  sub_AA40(v9, v20, 1, v16);
  sub_667C8(v9, v8 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin17WeatherAirQuality_provider, &qword_EC828);
  *(unsigned char *)(v8 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin17WeatherAirQuality_shouldIncludeAttribution) = a8 & 1;
  return v8;
}

void sub_A92B8(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v8 = sub_7424(&qword_EC828);
  uint64_t v9 = sub_13294(v8);
  __chkstk_darwin(v9);
  sub_18DB0();
  if (a1 == 0xD000000000000015 && (sub_AA654(), v17) || (sub_AA5FC() & 1) != 0)
  {
    char v10 = *(unsigned char *)(v3 + 24);
LABEL_5:
    *(void *)(a3 + 24) = &type metadata for Bool;
    *(unsigned char *)a3 = v10;
    return;
  }
  if (a1 != 0xD000000000000017 || (sub_AA654(), !v17))
  {
    if ((sub_AA5FC() & 1) == 0)
    {
      if (a1 == 0xD000000000000017 && (sub_AA654(), v17) || (sub_AA5FC() & 1) != 0)
      {
        uint64_t v15 = OBJC_IVAR____TtC23DailyBriefingFlowPlugin17WeatherAirQuality_airQualityCategoryIndex;
      }
      else
      {
        BOOL v17 = a1 == 0x696C617551726961 && a2 == 0xEF7865646E497974;
        if (!v17 && (sub_AA5FC() & 1) == 0)
        {
          BOOL v18 = a1 == 0x72656469766F7270 && a2 == 0xE800000000000000;
          if (v18 || (sub_AA5FC() & 1) != 0)
          {
            sub_AA324(v3 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin17WeatherAirQuality_provider, v4);
            uint64_t v19 = sub_B2C40();
            if (sub_C844(v4, 1, v19) != 1)
            {
              *(void *)(a3 + 24) = v19;
              uint64_t v20 = sub_7590((uint64_t *)a3);
              (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(v20, v4, v19);
              return;
            }
            sub_12FE4(v4, &qword_EC828);
          }
          else if (a1 == 0xD000000000000018 && (sub_AA654(), v17) || (sub_AA5FC() & 1) != 0)
          {
            char v10 = *(unsigned char *)(v3 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin17WeatherAirQuality_shouldIncludeAttribution);
            goto LABEL_5;
          }
          *(_OWORD *)a3 = 0u;
          *(_OWORD *)(a3 + 16) = 0u;
          return;
        }
        uint64_t v15 = OBJC_IVAR____TtC23DailyBriefingFlowPlugin17WeatherAirQuality_airQualityIndex;
      }
      uint64_t v16 = *(void *)(v3 + v15);
      *(void *)(a3 + 24) = &type metadata for Double;
      *(void *)a3 = v16;
      return;
    }
  }
  uint64_t v11 = v3 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin17WeatherAirQuality_airQualityCategoryScale;
  uint64_t v12 = sub_B2C40();
  *(void *)(a3 + 24) = v12;
  uint64_t v13 = sub_7590((uint64_t *)a3);
  uint64_t v14 = *(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);

  v14(v13, v11, v12);
}

uint64_t sub_A95D4(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_DC2C8;
  v6._object = a2;
  unint64_t v4 = sub_B3680(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 6) {
    return 6;
  }
  else {
    return v4;
  }
}

unint64_t sub_A9624(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
    case 2:
      unint64_t result = sub_AA67C();
      break;
    case 3:
      unint64_t result = sub_AA618();
      break;
    case 4:
      unint64_t result = sub_AA664();
      break;
    case 5:
      unint64_t result = 0xD000000000000018;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_A96B8(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
    case 2:
      unint64_t result = sub_AA67C();
      break;
    case 3:
      unint64_t result = sub_AA618();
      break;
    case 4:
      unint64_t result = sub_AA664();
      break;
    case 5:
      unint64_t result = 0xD000000000000018;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_A974C(unsigned __int8 *a1, char *a2)
{
  return sub_5CA58(*a1, *a2);
}

Swift::Int sub_A9758()
{
  return sub_7F478(*v0);
}

uint64_t sub_A9760()
{
  return sub_7F6CC();
}

Swift::Int sub_A9768(uint64_t a1)
{
  return sub_8083C(a1, *v1);
}

uint64_t sub_A9770@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_A95D4(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_A97A0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_A9624(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_A97CC()
{
  return sub_A96B8(*v0);
}

uint64_t sub_A97D4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_A9620();
  *a1 = result;
  return result;
}

void sub_A97FC(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_A9808(uint64_t a1)
{
  unint64_t v2 = sub_AA290();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_A9844(uint64_t a1)
{
  unint64_t v2 = sub_AA290();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_A9880()
{
  sub_B2C40();
  sub_79FC();
  sub_131C8();
  v1();
  sub_12FE4(v0 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin17WeatherAirQuality_provider, &qword_EC828);
  return v0;
}

uint64_t sub_A98F8()
{
  sub_A9880();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_A9950()
{
  return type metadata accessor for WeatherAirQuality();
}

uint64_t type metadata accessor for WeatherAirQuality()
{
  uint64_t result = qword_ECC48;
  if (!qword_ECC48) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_A99A0()
{
  sub_B2C40();
  if (v0 <= 0x3F)
  {
    sub_A9D04();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t sub_A9A8C(void *a1)
{
  uint64_t v4 = sub_7424(&qword_ECD68);
  sub_7870();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_588B0();
  sub_7468(a1, a1[3]);
  sub_AA290();
  sub_B3900();
  sub_B3760();
  if (!v1)
  {
    sub_B2C40();
    sub_AA2DC(&qword_E74C8, (void (*)(uint64_t))&type metadata accessor for SpeakableString);
    sub_AA6DC();
    sub_B3790();
    sub_B3770();
    sub_B3770();
    sub_AA6DC();
    sub_B3740();
    sub_B3760();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

uint64_t sub_A9CB4(void *a1)
{
  uint64_t v2 = swift_allocObject();
  sub_A9D5C(a1);
  return v2;
}

void sub_A9D04()
{
  if (!qword_ECC58)
  {
    sub_B2C40();
    unint64_t v0 = sub_B3380();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_ECC58);
    }
  }
}

uint64_t sub_A9D5C(void *a1)
{
  uint64_t v4 = sub_7424(&qword_EC828);
  uint64_t v5 = sub_13294(v4);
  __chkstk_darwin(v5);
  sub_588B0();
  uint64_t v6 = sub_B2C40();
  sub_7870();
  uint64_t v20 = v7;
  __chkstk_darwin(v8);
  sub_7A0C();
  uint64_t v11 = v10 - v9;
  sub_7424(&qword_ECD58);
  sub_7870();
  __chkstk_darwin(v12);
  sub_7A0C();
  *(void *)(v1 + 16) = 0;
  uint64_t v21 = a1;
  sub_7468(a1, a1[3]);
  sub_AA290();
  sub_B38F0();
  if (v22)
  {

    type metadata accessor for WeatherAirQuality();
    swift_deallocPartialClassInstance();
    uint64_t v19 = (uint64_t)a1;
  }
  else
  {
    *(unsigned char *)(v1 + 24) = sub_B36E0() & 1;
    sub_AA2DC(&qword_E74A8, (void (*)(uint64_t))&type metadata accessor for SpeakableString);
    sub_B3710();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 32))(v1 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin17WeatherAirQuality_airQualityCategoryScale, v11, v6);
    sub_B36F0();
    *(void *)(v1 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin17WeatherAirQuality_airQualityCategoryIndex) = v14;
    sub_B36F0();
    *(void *)(v1 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin17WeatherAirQuality_airQualityIndex) = v15;
    sub_B36C0();
    sub_667C8(v2, v1 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin17WeatherAirQuality_provider, &qword_EC828);
    char v16 = sub_B36E0();
    uint64_t v17 = sub_AA5E4();
    v18(v17);
    *(unsigned char *)(v1 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin17WeatherAirQuality_shouldIncludeAttribution) = v16 & 1;
    uint64_t v19 = (uint64_t)v21;
  }
  sub_74F8(v19);
  return v1;
}

unint64_t sub_AA16C()
{
  return 0xD000000000000012;
}

void sub_AA18C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
}

uint64_t sub_AA1B0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_A9CB4(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_AA1DC(void *a1)
{
  return sub_A9A8C(a1);
}

uint64_t sub_AA200()
{
  return sub_AA2DC(&qword_ECD48, (void (*)(uint64_t))type metadata accessor for WeatherAirQuality);
}

uint64_t sub_AA248()
{
  return sub_AA2DC(&qword_ECD50, (void (*)(uint64_t))type metadata accessor for WeatherAirQuality);
}

unint64_t sub_AA290()
{
  unint64_t result = qword_ECD60;
  if (!qword_ECD60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_ECD60);
  }
  return result;
}

uint64_t sub_AA2DC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_AA324(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_7424(&qword_EC828);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id sub_AA38C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSString v3 = sub_B2F20();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }
  id v4 = [v2 initWithSuiteName:v3];

  return v4;
}

unsigned char *storeEnumTagSinglePayload for WeatherAirQuality.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0xAA4BCLL);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WeatherAirQuality.CodingKeys()
{
  return &type metadata for WeatherAirQuality.CodingKeys;
}

unint64_t sub_AA4F8()
{
  unint64_t result = qword_ECD80;
  if (!qword_ECD80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_ECD80);
  }
  return result;
}

unint64_t sub_AA548()
{
  unint64_t result = qword_ECD88;
  if (!qword_ECD88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_ECD88);
  }
  return result;
}

unint64_t sub_AA598()
{
  unint64_t result = qword_ECD90;
  if (!qword_ECD90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_ECD90);
  }
  return result;
}

uint64_t sub_AA5E4()
{
  return v0;
}

uint64_t sub_AA5FC()
{
  return sub_B37E0();
}

uint64_t sub_AA618()
{
  return 0x696C617551726961;
}

uint64_t sub_AA63C()
{
  return v0;
}

uint64_t sub_AA664()
{
  return 0x72656469766F7270;
}

unint64_t sub_AA67C()
{
  return 0xD000000000000017;
}

uint64_t sub_AA690()
{
  return swift_allocObject();
}

void sub_AA6B8(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  sub_8C308(a1, a2, a3, a4, 0xD00000000000001CLL, (a5 - 32) | 0x8000000000000000);
}

void sub_AA6F4()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin16MeCardDataSource__meCard);
  *(void *)(v0 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin16MeCardDataSource__meCard) = 0;
}

uint64_t sub_AA744()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin16MeCardDataSource_logger;
  uint64_t v2 = sub_B2D30();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return v0;
}

uint64_t sub_AA7C8()
{
  sub_AA744();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_AA820()
{
  return type metadata accessor for MeCardDataSource();
}

uint64_t type metadata accessor for MeCardDataSource()
{
  uint64_t result = qword_ECDD0;
  if (!qword_ECDD0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_AA870()
{
  uint64_t result = sub_B2D30();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for WeatherError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *uint64_t result = a2 + 8;
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
        JUMPOUT(0xAA9D8);
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
          *uint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WeatherError()
{
  return &type metadata for WeatherError;
}

uint64_t sub_AAA10(char a1)
{
  strcpy((char *)v2, "WeatherError.");
  v3._countAndFlagsBits = sub_AAA74(a1);
  sub_B3020(v3);
  swift_bridgeObjectRelease();
  return v2[0];
}

unint64_t sub_AAA74(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
    case 8:
      unint64_t result = 0xD000000000000012;
      break;
    case 2:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 3:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 4:
      unint64_t result = 0xD000000000000010;
      break;
    case 5:
      unint64_t result = 0xD000000000000017;
      break;
    case 6:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 7:
      unint64_t result = 0x5264696C61766E69;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_AAB80(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_DC378;
  v6._object = a2;
  unint64_t v4 = sub_B3680(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 9) {
    return 9;
  }
  else {
    return v4;
  }
}

Swift::Int sub_AABCC()
{
  return sub_7F490(*v0);
}

uint64_t sub_AABD4(uint64_t a1)
{
  return sub_7FD80(a1, *v1);
}

Swift::Int sub_AABDC(uint64_t a1)
{
  return sub_80668(a1, *v1);
}

uint64_t sub_AABE4@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_AAB80(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_AAC14@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_AAA74(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_AAC40()
{
  return sub_AAA10(*v0);
}

uint64_t sub_AAC48(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_5D544(*a1, *a2);
}

unint64_t sub_AAC5C()
{
  unint64_t result = qword_ECEB0;
  if (!qword_ECEB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_ECEB0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for PodcastsDialogs(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0xAAD74);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PodcastsDialogs()
{
  return &type metadata for PodcastsDialogs;
}

unint64_t sub_AADAC(char a1)
{
  v2._countAndFlagsBits = 0xD000000000000017;
  int v3 = (void *)0x80000000000B4AA0;
  switch(a1)
  {
    case 1:
      int v3 = (void *)0x80000000000B4AC0;
      v2._countAndFlagsBits = 0xD000000000000014;
      break;
    case 2:
      int v3 = (void *)0xEF656D614E707041;
      v2._countAndFlagsBits = 0x7374736163646F50;
      break;
    case 3:
      int v3 = (void *)0xEF74706D6F725073;
      v2._countAndFlagsBits = 0x77654E656C617453;
      break;
    default:
      break;
  }
  v2._object = v3;
  sub_B3020(v2);
  swift_bridgeObjectRelease();
  return 0xD000000000000016;
}

unint64_t sub_AAEB4(char a1)
{
  unint64_t result = 0xD000000000000017;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000014;
      break;
    case 2:
      unint64_t result = 0x7374736163646F50;
      break;
    case 3:
      unint64_t result = 0x77654E656C617453;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_AAF6C(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_DC470;
  v6._object = a2;
  unint64_t v4 = sub_B3680(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 4) {
    return 4;
  }
  else {
    return v4;
  }
}

uint64_t sub_AAFB8(char *a1, char *a2)
{
  return sub_5D140(*a1, *a2);
}

Swift::Int sub_AAFC4()
{
  return sub_7F4F8(*v0);
}

uint64_t sub_AAFCC(uint64_t a1)
{
  return sub_7FA38(a1, *v1);
}

Swift::Int sub_AAFD4(uint64_t a1)
{
  return sub_807AC(a1, *v1);
}

uint64_t sub_AAFDC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_AAF6C(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_AB00C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_AAEB4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_AB03C()
{
  unint64_t result = qword_ECEB8;
  if (!qword_ECEB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_ECEB8);
  }
  return result;
}

unint64_t sub_AB088()
{
  return sub_AADAC(*v0);
}

uint64_t sub_AB090(char a1)
{
  uint64_t v3 = sub_B2D30();
  v1[9] = v3;
  v1[10] = *(void *)(v3 - 8);
  v1[11] = swift_task_alloc();
  uint64_t v4 = sub_B2F90();
  v1[12] = v4;
  v1[13] = *(void *)(v4 - 8);
  v1[14] = swift_task_alloc();
  uint64_t v5 = (void *)swift_task_alloc();
  v1[15] = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_AB1DC;
  return sub_F26C(a1);
}

uint64_t sub_AB1DC()
{
  sub_7FDC();
  sub_7FC4();
  sub_2B6A4();
  *Swift::String v2 = v1;
  v1[5] = v0;
  v1[6] = v3;
  v1[7] = v4;
  uint64_t v5 = *v0;
  sub_AB94();
  *Swift::String v6 = v5;
  *(void *)(v8 + 128) = v7;
  swift_task_dealloc();
  sub_AC10();
  return _swift_task_switch(v9, v10, v11);
}

uint64_t sub_AB2AC()
{
  sub_7D7FC();
  uint64_t v2 = v0[16];
  if (!v2) {
    goto LABEL_8;
  }
  unint64_t v3 = v0[6];
  sub_B2F80();
  sub_B1230();
  sub_B133C();
  uint64_t v4 = sub_B11F8();
  v5(v4);
  if (v3 >> 60 == 15)
  {
LABEL_7:
    uint64_t v2 = 0;
LABEL_8:
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    goto LABEL_9;
  }
  sub_B1460();
  swift_allocObject();
  sub_B1450();
  sub_B0F64();
  sub_B12A8();
  if (v0 != (void *)-16)
  {
    swift_release();
    sub_70728(v1, v3);
    if (qword_E6D58 != -1) {
      swift_once();
    }
    sub_B378(v0[9], (uint64_t)qword_F5360);
    uint64_t v6 = sub_B1210();
    v7(v6);
    sub_B137C();
    swift_bridgeObjectRelease();
    sub_B1264();
    sub_7424(&qword_ED070);
    v19._countAndFlagsBits = sub_B2FA0();
    sub_B3020(v19);
    swift_bridgeObjectRelease();
    sub_B12D0();
    sub_ABC4();
    sub_350E8(v8, v9, v10, v11, (uint64_t)"getPreviousState(decodingType:key:)");
    swift_bridgeObjectRelease();
    swift_errorRelease();
    uint64_t v12 = sub_B12EC();
    v13(v12);
    goto LABEL_7;
  }
  sub_B12FC();
  uint64_t v15 = 0x100000CFEEDFACFLL;
  uint64_t v14 = 0x880000002;
  uint64_t v2 = 0x21400000004ELL;
LABEL_9:
  swift_task_dealloc();
  swift_task_dealloc();
  char v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v0[1];
  return v16(v15, v14, v2);
}

uint64_t sub_AB4C4()
{
  sub_7FDC();
  char v2 = v1;
  v0[6] = v3;
  uint64_t v4 = sub_B2D30();
  v0[7] = v4;
  sub_FC60(v4);
  v0[8] = v5;
  v0[9] = sub_131EC();
  uint64_t v6 = sub_B2F90();
  v0[10] = v6;
  sub_FC60(v6);
  v0[11] = v7;
  v0[12] = sub_131EC();
  v0[13] = type metadata accessor for DBCalendarState();
  uint64_t v8 = (void *)swift_task_alloc();
  v0[14] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_AB5C4;
  return sub_F26C(v2);
}

uint64_t sub_AB5C4()
{
  sub_7FDC();
  sub_7FC4();
  sub_2B6A4();
  *char v2 = v1;
  sub_B1408(v3, v4);
  uint64_t v5 = *v0;
  sub_AB94();
  *uint64_t v6 = v5;
  *(void *)(v8 + 120) = v7;
  swift_task_dealloc();
  sub_AC10();
  return _swift_task_switch(v9, v10, v11);
}

uint64_t sub_AB688(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  sub_7D610();
  sub_7D7FC();
  if (v14[15] && (unint64_t v15 = v14[3], sub_B2F80(), sub_B1230(), sub_B133C(), v16 = sub_B11F8(), v17(v16), v15 >> 60 != 15))
  {
    sub_B1460();
    swift_allocObject();
    sub_B1450();
    sub_B0FFC(&qword_ED098, (void (*)(uint64_t))type metadata accessor for DBCalendarState);
    sub_B1440();
    uint64_t v21 = v14[13];
    uint64_t v22 = v14[6];
    sub_B12FC();
    uint64_t v19 = v22;
    uint64_t v20 = 0;
    uint64_t v18 = v21;
  }
  else
  {
    uint64_t v18 = v14[13];
    uint64_t v19 = v14[6];
    uint64_t v20 = 1;
  }
  sub_AA40(v19, v20, 1, v18);
  swift_task_dealloc();
  swift_task_dealloc();
  sub_ABD0();
  sub_1FBE8();
  return v24(v23, v24, v25, v26, v27, v28, v29, v30, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_AB948()
{
  sub_7FDC();
  char v2 = v1;
  uint64_t v3 = sub_B2D30();
  v0[9] = v3;
  sub_FC60(v3);
  v0[10] = v4;
  v0[11] = sub_131EC();
  uint64_t v5 = sub_B2F90();
  v0[12] = v5;
  sub_FC60(v5);
  v0[13] = v6;
  v0[14] = sub_131EC();
  uint64_t v7 = (void *)swift_task_alloc();
  v0[15] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_ABA38;
  return sub_F26C(v2);
}

uint64_t sub_ABA38()
{
  sub_7FDC();
  sub_7FC4();
  sub_2B6A4();
  *char v2 = v1;
  sub_B1408(v3, v4);
  uint64_t v5 = *v0;
  sub_AB94();
  *uint64_t v6 = v5;
  *(void *)(v8 + 128) = v7;
  swift_task_dealloc();
  sub_AC10();
  return _swift_task_switch(v9, v10, v11);
}

uint64_t sub_ABAFC()
{
  sub_7D7FC();
  uint64_t v2 = v0[16];
  if (!v2)
  {
    int v14 = 0;
    goto LABEL_9;
  }
  unint64_t v3 = v0[3];
  sub_B2F80();
  sub_B1230();
  sub_B133C();
  uint64_t v4 = sub_B11F8();
  v5(v4);
  if (v3 >> 60 == 15)
  {
LABEL_7:
    int v14 = 0;
    uint64_t v2 = 0;
LABEL_9:
    uint64_t v15 = 0;
    int v16 = 1;
    goto LABEL_10;
  }
  sub_B1460();
  swift_allocObject();
  sub_B1450();
  sub_B0FB0();
  sub_B12A8();
  if (v0 != (void *)-40)
  {
    swift_release();
    sub_70728(v1, v3);
    if (qword_E6D58 != -1) {
      swift_once();
    }
    sub_B378(v0[9], (uint64_t)qword_F5360);
    uint64_t v6 = sub_B1210();
    v7(v6);
    sub_B137C();
    swift_bridgeObjectRelease();
    sub_B1264();
    sub_7424(&qword_ED088);
    v20._countAndFlagsBits = sub_B2FA0();
    sub_B3020(v20);
    swift_bridgeObjectRelease();
    sub_B12D0();
    sub_ABC4();
    sub_350E8(v8, v9, v10, v11, (uint64_t)"getPreviousState(decodingType:key:)");
    swift_bridgeObjectRelease();
    swift_errorRelease();
    uint64_t v12 = sub_B12EC();
    v13(v12);
    goto LABEL_7;
  }
  sub_B12FC();
  int v16 = 0;
  uint64_t v15 = 0x100000CFEEDFACFLL;
  uint64_t v2 = 0x880000002;
  int v14 = 78;
LABEL_10:
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(uint64_t, uint64_t, void))v0[1];
  return v17(v15, v2, v14 | (v16 << 8));
}

double sub_ABD24@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_AF3C8(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 32 * v6;
    sub_B218(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

double sub_ABD88@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_AF46C(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a2 + 56) + 32 * v5;
    sub_B218(v7, (uint64_t)a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_ABDEC(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16)
    && (uint64_t v3 = sub_AF4DC(a1, (void (*)(uint64_t))sub_2218C, (uint64_t (*)(uint64_t, Swift::Int))sub_AF948), (v4 & 1) != 0))
  {
    return *(unsigned __int8 *)(*(void *)(a2 + 56) + v3);
  }
  else
  {
    return 8;
  }
}

uint64_t sub_ABE54(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16)
    && (uint64_t v3 = sub_AF4DC(a1, (void (*)(uint64_t))sub_69B68, (uint64_t (*)(uint64_t, Swift::Int))sub_AF65C), (v4 & 1) != 0))
  {
    return *(unsigned __int8 *)(*(void *)(a2 + 56) + v3);
  }
  else
  {
    return 4;
  }
}

void sub_ABEBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_B38B0();
    sub_B2FF0();
    Swift::Int v6 = sub_B38E0();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    Swift::Int v8 = v6 & ~v7;
    sub_B1250();
    if (v9)
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      if ((*v11 != a1 || v11[1] != a2) && (sub_B37E0() & 1) == 0)
      {
        uint64_t v13 = ~v7;
        uint64_t v14 = (v8 + 1) & v13;
        sub_B1250();
        if (v15)
        {
          do
          {
            int v16 = (void *)(v10 + 16 * v14);
            if (*v16 == a1 && v16[1] == a2) {
              break;
            }
            if (sub_B37E0()) {
              break;
            }
            uint64_t v14 = (v14 + 1) & v13;
            sub_B1250();
          }
          while ((v18 & 1) != 0);
        }
      }
    }
  }
}

void sub_ABFD0(Swift::UInt32 a1, uint64_t a2)
{
  if (*(void *)(a2 + 16))
  {
    sub_B38B0();
    sub_B38D0(a1);
    unint64_t v4 = sub_B38E0() & ~(-1 << *(unsigned char *)(a2 + 32));
    if (((*(void *)(a2 + 56 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0
      && *(_DWORD *)(*(void *)(a2 + 48) + 4 * v4) != a1)
    {
      sub_B1280();
      if (v7)
      {
        do
        {
          if (*(_DWORD *)(v5 + 4 * v6) == a1) {
            break;
          }
          sub_B1280();
        }
        while ((v8 & 1) != 0);
      }
    }
  }
}

uint64_t sub_AC098()
{
  sub_7FDC();
  v1[2] = v2;
  v1[3] = v0;
  uint64_t v3 = sub_B2250();
  void v1[4] = v3;
  sub_FC60(v3);
  v1[5] = v4;
  v1[6] = sub_13118();
  v1[7] = swift_task_alloc();
  v1[8] = swift_task_alloc();
  sub_AC10();
  return _swift_task_switch(v5, v6, v7);
}

uint64_t sub_AC13C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  sub_7D610();
  sub_7D7FC();
  uint64_t v15 = v14[3];
  uint64_t v16 = OBJC_IVAR____TtC23DailyBriefingFlowPlugin8NewsFlow_state;
  v49._countAndFlagsBits = sub_AC53C(*(unsigned char *)(v15 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin8NewsFlow_state));
  sub_B3020(v49);
  swift_bridgeObjectRelease();
  sub_ABC4();
  sub_8C308(v17, 0xE700000000000000, 0xD000000000000026, v18, 0x28636E7973416E6FLL, 0xEF293A7475706E69);
  swift_bridgeObjectRelease();
  if (*(unsigned char *)(v15 + v16) == 4)
  {
    uint64_t v20 = v14[7];
    uint64_t v19 = v14[8];
    uint64_t v21 = v14[4];
    uint64_t v22 = v14[5];
    sub_B2210();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v20, v19, v21);
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v22 + 88))(v20, v21) == enum case for Parse.empty(_:))
    {
      (*(void (**)(void, void))(v14[5] + 8))(v14[8], v14[4]);
      *(unsigned char *)(v15 + v16) = 2;
    }
    else
    {
      uint64_t v34 = v14[5];
      uint64_t v33 = v14[6];
      uint64_t v35 = v14[4];
      sub_B2210();
      char v36 = sub_19364(v33);
      int v37 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
      v37(v33, v35);
      uint64_t v38 = sub_B12EC();
      ((void (*)(uint64_t))v37)(v38);
      uint64_t v39 = v14[7];
      uint64_t v40 = v14[4];
      if (v36 != 3) {
        *(unsigned char *)(v15 + v16) = v36 != 0;
      }
      v37(v39, v40);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_1FBE8();
    return v43(v41, v42, v43, v44, v45, v46, v47, v48, a9, 0x203A6574617473, 0xE700000000000000, a12, a13, a14);
  }
  else
  {
    sub_7468((void *)(v14[3] + 128), *(void *)(v14[3] + 152));
    uint64_t v23 = (void *)sub_35128();
    v14[9] = v23;
    *uint64_t v23 = v14;
    v23[1] = sub_AC3F0;
    sub_B1358();
    sub_1FBE8();
    return v27(v24, v25, v26, v27, v28, v29, v30, v31, a9, 0x203A6574617473, 0xE700000000000000, a12, a13, a14);
  }
}

uint64_t sub_AC3F0()
{
  sub_AC48();
  uint64_t v2 = v1;
  uint64_t v3 = *v0;
  sub_AB94();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

uint64_t sub_AC53C(char a1)
{
  if (a1 == 4) {
    return 0x676E697469617761;
  }
  if (a1 == 3) {
    return 0x6572676F72506E69;
  }
  sub_B34C0(17);
  v2._countAndFlagsBits = 0x6465766965636572;
  v2._object = (void *)0xEE00287475706E49;
  sub_B3020(v2);
  sub_B35C0();
  v3._countAndFlagsBits = 41;
  v3._object = (void *)0xE100000000000000;
  sub_B3020(v3);
  return 0;
}

uint64_t sub_AC63C()
{
  return sub_B1C80();
}

uint64_t sub_AC6CC()
{
  sub_7FDC();
  v1[5] = v2;
  v1[6] = v0;
  sub_7424(&qword_E76E0);
  v1[7] = sub_131EC();
  uint64_t v3 = sub_B2090();
  v1[8] = v3;
  sub_FC60(v3);
  v1[9] = v4;
  v1[10] = sub_131EC();
  sub_AC10();
  return _swift_task_switch(v5, v6, v7);
}

uint64_t sub_AC780(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  sub_7D610();
  sub_7D7FC();
  uint64_t v15 = v14[6];
  v14[11] = OBJC_IVAR____TtC23DailyBriefingFlowPlugin8NewsFlow_logger;
  sub_B34C0(34);
  swift_bridgeObjectRelease();
  uint64_t v16 = OBJC_IVAR____TtC23DailyBriefingFlowPlugin8NewsFlow_state;
  v14[12] = OBJC_IVAR____TtC23DailyBriefingFlowPlugin8NewsFlow_state;
  v80._countAndFlagsBits = sub_AC53C(*(unsigned char *)(v15 + v16));
  sub_B3020(v80);
  swift_bridgeObjectRelease();
  sub_B12D0();
  sub_B1198(0xD00000000000001FLL, 0x80000000000B5E10, v17, 0x80000000000BC8A0);
  swift_bridgeObjectRelease();
  switch(*(unsigned char *)(v15 + v16))
  {
    case 1:
      uint64_t v23 = v14[6];
      sub_B1198(0xD000000000000034, 0x80000000000BC9B0, v18, 0x80000000000BC8A0);
      sub_B1428((void *)(v23 + 184), *(void *)(v23 + 208));
      v14[25] = sub_67E90();
      uint64_t v24 = (void *)swift_task_alloc();
      v14[26] = v24;
      void *v24 = v14;
      v24[1] = sub_AD924;
      sub_1FBE8();
      uint64_t result = sub_3D064();
      break;
    case 2:
      swift_task_alloc();
      sub_A18E0();
      v14[28] = v26;
      *uint64_t v26 = v27;
      uint64_t v28 = sub_ADAAC;
      goto LABEL_11;
    case 3:
      uint64_t v29 = v14[6];
      uint64_t v30 = OBJC_IVAR____TtC23DailyBriefingFlowPlugin8NewsFlow_siriKitEventSender;
      v14[13] = OBJC_IVAR____TtC23DailyBriefingFlowPlugin8NewsFlow_siriKitEventSender;
      uint64_t v31 = (void *)(v29 + v30);
      id v32 = sub_7468((void *)(v29 + v30), *(void *)(v29 + v30 + 24));
      uint64_t v33 = OBJC_IVAR____TtC23DailyBriefingFlowPlugin8NewsFlow_name;
      v14[14] = OBJC_IVAR____TtC23DailyBriefingFlowPlugin8NewsFlow_name;
      uint64_t v34 = (void *)(v29 + v33);
      uint64_t v35 = *v32;
      uint64_t v36 = *(void *)(v29 + v33 + 24);
      uint64_t v37 = *(void *)(v29 + v33 + 32);
      uint64_t v38 = sub_7468((void *)(v29 + v33), v36);
      sub_A2360((uint64_t)v38, 0x11u, 0, 0, v35, v36, v37);
      sub_B1428((void *)(v29 + 304), *(void *)(v29 + 328));
      if (sub_8EAE8())
      {
        sub_B1198(0xD000000000000024, 0x80000000000BCA40, v39, 0x80000000000BC8A0);
        sub_B1428(v31, v31[3]);
        uint64_t v40 = v34[3];
        uint64_t v41 = v34[4];
        sub_7468(v34, v40);
        sub_ABC4();
        sub_A2360(v42, 0x3Au, v43, v44, v35, v40, v41);
        swift_task_alloc();
        sub_A18E0();
        v14[15] = v26;
        *uint64_t v26 = v45;
        uint64_t v28 = sub_ACCC4;
LABEL_11:
        v26[1] = v28;
        sub_B1370();
        sub_1FBE8();
        uint64_t result = sub_AEBFC(v46);
      }
      else
      {
        id v70 = (void *)v14[6];
        v14[16] = v70[22];
        sub_7468(v70 + 16, v70[19]);
        uint64_t v71 = (void *)sub_35128();
        v14[17] = v71;
        *uint64_t v71 = v14;
        v71[1] = sub_ACDB4;
        sub_B1358();
        sub_1FBE8();
        uint64_t result = v75(v72, v73, v74, v75, v76, v77, v78, v79, a9, 0xD00000000000001FLL, 0x80000000000B5E10, a12, a13, a14);
      }
      break;
    case 4:
      uint64_t v48 = v14[6];
      Swift::String v49 = sub_7468((void *)(v48 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin8NewsFlow_siriKitEventSender), *(void *)(v48 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin8NewsFlow_siriKitEventSender + 24));
      uint64_t v50 = (void *)(v48 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin8NewsFlow_name);
      uint64_t v51 = *v49;
      uint64_t v52 = v50[3];
      uint64_t v53 = v50[4];
      uint64_t v54 = sub_7468(v50, v52);
      sub_A2358((uint64_t)v54, 0x15u, 0xD000000000000039, 0x80000000000BC900, v51, v52, v53);
      if (qword_E6D58 != -1) {
        swift_once();
      }
      uint64_t v55 = sub_B2D30();
      sub_B378(v55, (uint64_t)qword_F5360);
      sub_ABC4();
      sub_52848();
      uint64_t v56 = sub_5283C();
      sub_8C2F0(v56, v57, v58, v59, v60, v61);
      swift_beginAccess();
      sub_5283C();
      sub_1FBE8();
      uint64_t result = v68(v62, v63, v64, v65, v66, v67, v68, v69, a9, 0xD00000000000001FLL, 0x80000000000B5E10, a12, a13, a14);
      break;
    default:
      swift_task_alloc();
      sub_A18E0();
      v14[24] = v19;
      *uint64_t v19 = v20;
      v19[1] = sub_AD834;
      sub_B1370();
      sub_1FBE8();
      uint64_t result = sub_ADB9C();
      break;
  }
  return result;
}

uint64_t sub_ACCC4()
{
  sub_7FDC();
  sub_34FFC();
  uint64_t v1 = *v0;
  sub_AB94();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_B129C();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_47080();
  return v3();
}

uint64_t sub_ACDB4()
{
  sub_7FDC();
  sub_7FC4();
  sub_2B6A4();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(unsigned char *)(v1 + 232) = v3;
  swift_task_dealloc();
  sub_AC10();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_ACE84()
{
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v2 = *(void *)(v0 + 112);
  if (*(unsigned char *)(v0 + 232) == 1)
  {
    uint64_t v3 = *(void *)(v0 + 48);
    uint64_t v4 = (void *)(v3 + v2);
    uint64_t v5 = *sub_7468((void *)(v3 + v1), *(void *)(v3 + v1 + 24));
    uint64_t v6 = v4[3];
    uint64_t v7 = v4[4];
    uint64_t v8 = sub_7468(v4, v6);
    sub_A2360((uint64_t)v8, 1u, 0, 0, v5, v6, v7);
    sub_B1428((void *)(v3 + 224), *(void *)(v3 + 248));
    uint64_t v9 = (void *)sub_35128();
    *(void *)(v0 + 144) = v9;
    *uint64_t v9 = v0;
    v9[1] = sub_AD090;
    uint64_t v10 = *(void *)(v0 + 128);
    return v28(v10, v4);
  }
  else
  {
    uint64_t v12 = *(void *)(v0 + 48);
    uint64_t v13 = (void *)(v12 + v2);
    uint64_t v14 = (void *)(v12 + v1);
    uint64_t v15 = v12 + *(void *)(v0 + 88);
    sub_7A1C();
    sub_ABC4();
    unint64_t v16 = sub_9AAD8(33);
    sub_8C2F0(v16, v17, v18, v19, v20, v21);
    sub_B1428(v14, v14[3]);
    uint64_t v22 = v13[3];
    uint64_t v23 = v13[4];
    uint64_t v24 = sub_7468(v13, v22);
    sub_A2360((uint64_t)v24, 0x3Au, 0x64656C6261736964, 0xEE00657461747320, v15, v22, v23);
    swift_task_alloc();
    sub_A18E0();
    *(void *)(v0 + 184) = v25;
    *uint64_t v25 = v26;
    v25[1] = sub_AD744;
    uint64_t v27 = sub_B1370();
    return sub_AEBFC(v27);
  }
}

uint64_t sub_AD090()
{
  sub_7FDC();
  sub_7FC4();
  sub_2B6A4();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(unsigned char *)(v1 + 233) = v3;
  swift_task_dealloc();
  sub_AC10();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_AD160()
{
  sub_7FDC();
  if (*(unsigned char *)(v0 + 233) == 1)
  {
    sub_7A1C();
    sub_ABC4();
    unint64_t v1 = sub_9AAD8(29);
    sub_8C320(v1, v2, v3, v4, v5, v6);
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 152) = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_AD298;
    return sub_AE5DC();
  }
  else
  {
    swift_task_alloc();
    sub_A18E0();
    *(void *)(v0 + 176) = v9;
    *uint64_t v9 = v10;
    v9[1] = sub_AD654;
    sub_B1370();
    return sub_ADB9C();
  }
}

uint64_t sub_AD298()
{
  sub_7FDC();
  sub_7FC4();
  sub_2B6A4();
  *unint64_t v2 = v1;
  *unint64_t v2 = *v0;
  *(void *)(v1 + 160) = v3;
  swift_task_dealloc();
  sub_AC10();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_AD368()
{
  uint64_t v1 = (void *)v0[20];
  uint64_t v2 = v0[14];
  uint64_t v3 = v0[12];
  uint64_t v5 = v0[9];
  uint64_t v4 = v0[10];
  uint64_t v7 = v0[7];
  uint64_t v6 = v0[8];
  uint64_t v8 = v0[6];
  sub_17910();
  *(unsigned char *)(v8 + v3) = 4;
  sub_7468((void *)(v8 + 264), *(void *)(v8 + 288));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v7, v4, v6);
  sub_AA40(v7, 0, 1, v6);
  id v9 = v1;
  uint64_t v10 = (void *)swift_task_alloc();
  v0[21] = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_AD498;
  uint64_t v11 = v0[7];
  return sub_938F4((uint64_t)v1, 0, v8 + v2, v11);
}

uint64_t sub_AD498()
{
  sub_AC48();
  char v2 = v1;
  uint64_t v4 = v3;
  sub_7FC4();
  uint64_t v6 = *(void **)(v5 + 160);
  uint64_t v7 = *(void *)(v5 + 56);
  uint64_t v8 = *v0;
  sub_AB94();
  *id v9 = v8;
  swift_task_dealloc();

  sub_A9CC(v4, v2 & 1);
  sub_A1530(v7, &qword_E76E0);
  sub_AC10();
  return _swift_task_switch(v10, v11, v12);
}

uint64_t sub_AD5B8()
{
  sub_AC48();
  char v1 = *(void **)(v0 + 160);
  sub_B1F30();

  sub_B141C();
  v2();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_ABD0();
  return v3();
}

uint64_t sub_AD654()
{
  sub_7FDC();
  sub_34FFC();
  uint64_t v1 = *v0;
  sub_AB94();
  *char v2 = v1;
  swift_task_dealloc();
  sub_B129C();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_47080();
  return v3();
}

uint64_t sub_AD744()
{
  sub_7FDC();
  sub_34FFC();
  uint64_t v1 = *v0;
  sub_AB94();
  *char v2 = v1;
  swift_task_dealloc();
  sub_B129C();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_47080();
  return v3();
}

uint64_t sub_AD834()
{
  sub_7FDC();
  sub_34FFC();
  uint64_t v1 = *v0;
  sub_AB94();
  *char v2 = v1;
  swift_task_dealloc();
  sub_B129C();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_47080();
  return v3();
}

uint64_t sub_AD924()
{
  sub_7FDC();
  sub_7FC4();
  sub_2B6A4();
  *char v2 = v1;
  uint64_t v3 = *v0;
  sub_AB94();
  *uint64_t v4 = v3;
  *(void *)(v6 + 216) = v5;
  swift_task_dealloc();
  swift_release();
  sub_AC10();
  return _swift_task_switch(v7, v8, v9);
}

uint64_t sub_ADA0C()
{
  sub_AC48();
  sub_B1428((void *)(*(void *)(v0 + 48) + OBJC_IVAR____TtC23DailyBriefingFlowPlugin8NewsFlow_siriKitEventSender), *(void *)(*(void *)(v0 + 48) + OBJC_IVAR____TtC23DailyBriefingFlowPlugin8NewsFlow_siriKitEventSender + 24));
  sub_A21D8();
  sub_B1FA0();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_ABD0();
  return v1();
}

uint64_t sub_ADAAC()
{
  sub_7FDC();
  sub_34FFC();
  uint64_t v1 = *v0;
  sub_AB94();
  *char v2 = v1;
  swift_task_dealloc();
  sub_B129C();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_47080();
  return v3();
}

uint64_t sub_ADB9C()
{
  sub_7FDC();
  v1[2] = v2;
  v1[3] = v0;
  sub_7424(&qword_E76E0);
  void v1[4] = sub_131EC();
  sub_AC10();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_ADC20()
{
  sub_AC48();
  uint64_t v1 = (void *)v0[3];
  if (*((unsigned char *)v1 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin8NewsFlow_shouldDialog) == 1)
  {
    sub_7A1C();
    sub_B11CC();
    sub_8C320(v2, v3, v4, v5, v6, v7);
    uint64_t v8 = (void *)swift_task_alloc();
    v0[5] = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_ADD98;
    return sub_AE320();
  }
  else
  {
    sub_7A1C();
    sub_B11CC();
    sub_8C308(v10, v11, v12, v13, v14, v15);
    id v16 = sub_B13B0();
    sub_B13E8((uint64_t)v16);

    swift_task_alloc();
    sub_A18E0();
    v0[9] = v17;
    *unint64_t v17 = v18;
    v17[1] = sub_AE24C;
    uint64_t v19 = v0[2];
    return sub_AEBFC(v19);
  }
}

uint64_t sub_ADD98()
{
  sub_7FDC();
  sub_7FC4();
  sub_2B6A4();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 48) = v3;
  swift_task_dealloc();
  sub_AC10();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_ADE68()
{
  uint64_t v1 = (void *)v0[6];
  uint64_t v3 = v0[3];
  uint64_t v2 = v0[4];
  sub_7468((void *)(v3 + 264), *(void *)(v3 + 288));
  uint64_t v4 = v3 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin8NewsFlow_name;
  uint64_t v5 = sub_B2090();
  sub_AA40(v2, 1, 1, v5);
  id v6 = v1;
  unint64_t v7 = (void *)swift_task_alloc();
  v0[7] = v7;
  *unint64_t v7 = v0;
  v7[1] = sub_ADF60;
  uint64_t v8 = v0[4];
  return sub_938F4((uint64_t)v1, 0, v4, v8);
}

uint64_t sub_ADF60()
{
  sub_AC48();
  char v2 = v1;
  uint64_t v4 = v3;
  sub_7FC4();
  id v6 = *(void **)(v5 + 48);
  uint64_t v7 = *(void *)(v5 + 32);
  uint64_t v8 = *v0;
  sub_AB94();
  *uint64_t v9 = v8;
  swift_task_dealloc();

  sub_A9CC(v4, v2 & 1);
  sub_A1530(v7, &qword_E76E0);
  sub_AC10();
  return _swift_task_switch(v10, v11, v12);
}

uint64_t sub_AE080()
{
  sub_AC48();
  char v1 = (void *)v0[3];
  id v2 = sub_B13B0();
  sub_B13E8((uint64_t)v2);

  swift_task_alloc();
  sub_A18E0();
  v0[8] = v3;
  *uint64_t v3 = v4;
  v3[1] = sub_AE124;
  uint64_t v5 = v0[2];
  return sub_AEBFC(v5);
}

uint64_t sub_AE124()
{
  sub_7FDC();
  sub_7FC4();
  uint64_t v1 = *v0;
  sub_AB94();
  *id v2 = v1;
  swift_task_dealloc();
  sub_AC10();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_AE1EC()
{
  sub_7FDC();

  swift_task_dealloc();
  sub_ABD0();
  return v1();
}

uint64_t sub_AE24C()
{
  sub_7FDC();
  sub_34FFC();
  uint64_t v1 = *v0;
  sub_AB94();
  *id v2 = v1;
  swift_task_dealloc();
  sub_B129C();
  swift_task_dealloc();
  sub_47080();
  return v3();
}

uint64_t sub_AE320()
{
  sub_7FDC();
  v1[2] = v0;
  uint64_t v2 = sub_B20D0();
  v1[3] = v2;
  sub_FC60(v2);
  void v1[4] = v3;
  v1[5] = sub_131EC();
  sub_AC10();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_AE3AC()
{
  sub_7FDC();
  sub_7468((void *)(v0[2] + 184), *(void *)(v0[2] + 208));
  v0[6] = sub_68018();
  swift_task_alloc();
  sub_A18E0();
  v0[7] = v1;
  *uint64_t v1 = v2;
  v1[1] = sub_AE458;
  uint64_t v3 = v0[5];
  return sub_61278(v3);
}

uint64_t sub_AE458()
{
  sub_7FDC();
  sub_7FC4();
  uint64_t v1 = *v0;
  sub_AB94();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_release();
  sub_AC10();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_AE53C()
{
  sub_AC48();
  uint64_t v1 = sub_B1EB0();
  sub_5283C();
  sub_B141C();
  v2();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v1);
}

uint64_t sub_AE5DC()
{
  sub_7FDC();
  v1[2] = v0;
  uint64_t v2 = sub_B1F00();
  v1[3] = v2;
  sub_FC60(v2);
  void v1[4] = v3;
  v1[5] = sub_13118();
  v1[6] = swift_task_alloc();
  uint64_t v4 = sub_B20F0();
  v1[7] = v4;
  sub_FC60(v4);
  v1[8] = v5;
  v1[9] = sub_13118();
  v1[10] = swift_task_alloc();
  uint64_t v6 = sub_B20D0();
  v1[11] = v6;
  sub_FC60(v6);
  v1[12] = v7;
  v1[13] = sub_13118();
  v1[14] = swift_task_alloc();
  v1[15] = swift_task_alloc();
  sub_AC10();
  return _swift_task_switch(v8, v9, v10);
}

uint64_t sub_AE6F8()
{
  sub_7FDC();
  sub_7468((void *)(v0[2] + 184), *(void *)(v0[2] + 208));
  v0[16] = sub_68018();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[17] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_AE7A0;
  return sub_6147C();
}

uint64_t sub_AE7A0()
{
  sub_7FDC();
  sub_7FC4();
  sub_2B6A4();
  *uint64_t v2 = v1;
  uint64_t v3 = *v0;
  sub_AB94();
  *uint64_t v4 = v3;
  *(void *)(v6 + 144) = v5;
  swift_task_dealloc();
  swift_release();
  sub_AC10();
  return _swift_task_switch(v7, v8, v9);
}

void sub_AE888()
{
  uint64_t v1 = v0[18];
  unint64_t v2 = *(void *)(v1 + 16);
  if (!v2)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v3 = v0[12];
  uint64_t v4 = *(void (**)(void, uint64_t, void))(v3 + 16);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  v4(v0[15], v5, v0[11]);
  if (v2 == 1)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v6 = *(void *)(v0[12] + 72);
  v4(v0[14], v5 + v6, v0[11]);
  if (v2 < 3)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v7 = v5 + 2 * v6;
  uint64_t v8 = v0[2];
  v4(v0[13], v7, v0[11]);
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_B20C0();
  if (!*(void *)(v9 + 16))
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v45 = v8;
  uint64_t v10 = v0[8];
  uint64_t v11 = v0[6];
  uint64_t v12 = v0[3];
  uint64_t v13 = v0[4];
  unint64_t v43 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v44 = *(void (**)(void, unint64_t, void))(v10 + 16);
  v44(v0[10], v9 + v43, v0[7]);
  swift_bridgeObjectRelease();
  sub_B20E0();
  sub_5283C();
  sub_B141C();
  v14();
  uint64_t v15 = sub_B1EF0();
  uint64_t v42 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
  v42(v11, v12);
  uint64_t v16 = sub_B20C0();
  if (!*(void *)(v16 + 16))
  {
LABEL_16:
    __break(1u);
    return;
  }
  uint64_t v41 = v15;
  uint64_t v17 = v0[5];
  uint64_t v18 = v0[2];
  uint64_t v19 = v0[3];
  v44(v0[9], v16 + v43, v0[7]);
  swift_bridgeObjectRelease();
  sub_B20E0();
  sub_B141C();
  v20();
  sub_B1EF0();
  v42(v17, v19);
  sub_7468((void *)(v45 + 88), *(void *)(v18 + 112));
  uint64_t v21 = sub_B1E20();
  if (v21)
  {
    uint64_t v29 = sub_B139C(v21, v22, v23, v24, v25, v26, v27, v28, v41);
    sub_7E0FC(v29, v30, v31, v32, 4, 5);
  }
  else
  {
    uint64_t v33 = sub_B139C(v21, v22, v23, v24, v25, v26, v27, v28, v41);
    sub_7E2F8(v33, v34, v35, v36, (void *)(v45 + 88));
  }
  uint64_t v37 = v0[12];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v38 = sub_B1EA0();
  swift_bridgeObjectRelease();
  uint64_t v39 = *(void (**)(void))(v37 + 8);
  sub_B132C();
  v39();
  sub_B132C();
  v39();
  sub_B132C();
  v39();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v40 = (void (*)(uint64_t))v0[1];
  v40(v38);
}

uint64_t sub_AEBFC(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  sub_AC10();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_AEC20()
{
  sub_7FDC();
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v1 + 176);
  uint64_t v3 = v1 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin8NewsFlow_siriKitEventSender;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_AECC4;
  return sub_A40F8(v2, v3);
}

uint64_t sub_AECC4()
{
  sub_7FDC();
  sub_7FC4();
  uint64_t v1 = *v0;
  sub_AB94();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_AC10();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_AED8C()
{
  sub_7FDC();
  sub_B1FB0();
  sub_ABD0();
  return v0();
}

uint64_t sub_AEDE4()
{
  swift_bridgeObjectRelease();
  sub_1FA58(v0 + 24);
  sub_B2D30();
  sub_FC8C();
  uint64_t v1 = sub_2B82C();
  v2(v1);
  sub_B17F0();
  sub_FC8C();
  uint64_t v3 = sub_2B82C();
  v4(v3);
  sub_74F8(v0 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin8NewsFlow_name);
  sub_74F8(v0 + OBJC_IVAR____TtC23DailyBriefingFlowPlugin8NewsFlow_siriKitEventSender);
  return v0;
}

uint64_t sub_AEE94()
{
  sub_AEDE4();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_AEEEC()
{
  return type metadata accessor for NewsFlow();
}

uint64_t type metadata accessor for NewsFlow()
{
  uint64_t result = qword_ECEF8;
  if (!qword_ECEF8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_AEF3C()
{
  uint64_t result = sub_B2D30();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_B17F0();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for NewsFlow.State(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFC)
  {
    unsigned int v2 = a2 + 4;
    if (a2 + 4 >= 0xFFFF00) {
      unsigned int v3 = 4;
    }
    else {
      unsigned int v3 = 2;
    }
    if (v2 >> 8 < 0xFF) {
      unsigned int v3 = 1;
    }
    if (v2 >= 0x100) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    switch(v4)
    {
      case 1:
        int v5 = a1[1];
        if (!a1[1]) {
          break;
        }
        return (*a1 | (v5 << 8)) - 4;
      case 2:
        int v5 = *(unsigned __int16 *)(a1 + 1);
        if (*(_WORD *)(a1 + 1)) {
          return (*a1 | (v5 << 8)) - 4;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0xAF0F0);
      case 4:
        int v5 = *(_DWORD *)(a1 + 1);
        if (!v5) {
          break;
        }
        return (*a1 | (v5 << 8)) - 4;
      default:
        break;
    }
  }
  unsigned int v7 = *a1;
  if (v7 >= 3) {
    unsigned int v8 = v7 - 2;
  }
  else {
    unsigned int v8 = 0;
  }
  if (v8 >= 3) {
    return v8 - 2;
  }
  else {
    return 0;
  }
}

unsigned char *storeEnumTagSinglePayload for NewsFlow.State(unsigned char *result, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3 + 4;
  if (a3 + 4 >= 0xFFFF00) {
    int v4 = 4;
  }
  else {
    int v4 = 2;
  }
  if (v3 >> 8 < 0xFF) {
    int v4 = 1;
  }
  if (v3 >= 0x100) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 0;
  }
  if (a3 >= 0xFC) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v7 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
    switch(v6)
    {
      case 1:
        result[1] = v7;
        break;
      case 2:
        *(_WORD *)(result + 1) = v7;
        break;
      case 3:
LABEL_25:
        __break(1u);
        JUMPOUT(0xAF1D8);
      case 4:
        *(_DWORD *)(result + 1) = v7;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v6)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_19;
      case 3:
        goto LABEL_25;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      default:
LABEL_19:
        if (a2) {
LABEL_20:
        }
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_AF200(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  if (v1 >= 3) {
    return v1 - 2;
  }
  else {
    return 0;
  }
}

unsigned char *sub_AF214(unsigned char *result, int a2)
{
  if (a2) {
    *uint64_t result = a2 + 2;
  }
  return result;
}

ValueMetadata *type metadata accessor for NewsFlow.State()
{
  return &type metadata for NewsFlow.State;
}

uint64_t sub_AF234()
{
  unsigned int v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *unsigned int v1 = v0;
  v1[1] = sub_A630;
  return sub_AC098();
}

uint64_t sub_AF2CC()
{
  return sub_AC63C();
}

uint64_t sub_AF2F0()
{
  unsigned int v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *unsigned int v1 = v0;
  v1[1] = sub_A7BC;
  return sub_AC6CC();
}

uint64_t sub_AF38C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for NewsFlow();

  return Flow<>.exitValue.getter(v3, a2);
}

unint64_t sub_AF3C8(uint64_t a1, uint64_t a2)
{
  sub_B38B0();
  sub_B2FF0();
  Swift::Int v4 = sub_B38E0();

  return sub_AF578(a1, a2, v4);
}

uint64_t sub_AF440(uint64_t a1)
{
  return sub_AF4DC(a1, (void (*)(uint64_t))sub_69B68, (uint64_t (*)(uint64_t, Swift::Int))sub_AF65C);
}

unint64_t sub_AF46C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_B3460(*(void *)(v2 + 40));

  return sub_AF880(a1, v4);
}

uint64_t sub_AF4B0(uint64_t a1)
{
  return sub_AF4DC(a1, (void (*)(uint64_t))sub_19008, (uint64_t (*)(uint64_t, Swift::Int))sub_AFB6C);
}

uint64_t sub_AF4DC(uint64_t a1, void (*a2)(uint64_t), uint64_t (*a3)(uint64_t, Swift::Int))
{
  sub_B38B0();
  a2(a1);
  sub_B2FF0();
  swift_bridgeObjectRelease();
  Swift::Int v5 = sub_B38E0();

  return a3(a1, v5);
}

unint64_t sub_AF578(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_B37E0() & 1) == 0)
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
      while (!v14 && (sub_B37E0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_AF65C(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0xE800000000000000;
      uint64_t v8 = 0x7261646E656C6163;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          uint64_t v8 = 0x7265646E696D6572;
          unint64_t v7 = 0xE900000000000073;
          break;
        case 2:
          unint64_t v7 = 0xE700000000000000;
          uint64_t v8 = 0x72656874616577;
          break;
        case 3:
          unint64_t v7 = 0xE400000000000000;
          uint64_t v8 = 1936744813;
          break;
        case 4:
          unint64_t v7 = 0xE700000000000000;
          uint64_t v8 = 0x74736163646F70;
          break;
        default:
          break;
      }
      unint64_t v9 = 0xE800000000000000;
      uint64_t v10 = 0x7261646E656C6163;
      switch(v6)
      {
        case 1:
          uint64_t v10 = 0x7265646E696D6572;
          unint64_t v9 = 0xE900000000000073;
          break;
        case 2:
          unint64_t v9 = 0xE700000000000000;
          uint64_t v10 = 0x72656874616577;
          break;
        case 3:
          unint64_t v9 = 0xE400000000000000;
          uint64_t v10 = 1936744813;
          break;
        case 4:
          unint64_t v9 = 0xE700000000000000;
          uint64_t v10 = 0x74736163646F70;
          break;
        default:
          break;
      }
      if (v8 == v10 && v7 == v9) {
        break;
      }
      char v12 = sub_B37E0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v5;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
    swift_bridgeObjectRelease_n();
  }
  return v4;
}

unint64_t sub_AF880(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_8C070(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_B3470();
      sub_8C0CC((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_AF948(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0xE800000000000000;
      uint64_t v8 = 0x7261646E656C6163;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          unint64_t v7 = 0xE400000000000000;
          uint64_t v8 = 1937204590;
          break;
        case 2:
          uint64_t v8 = 0x7265646E696D6572;
          unint64_t v7 = 0xE900000000000073;
          break;
        case 3:
          unint64_t v7 = 0xE700000000000000;
          uint64_t v8 = 0x63696666617274;
          break;
        case 4:
          unint64_t v7 = 0xE700000000000000;
          uint64_t v8 = 0x72656874616577;
          break;
        default:
          break;
      }
      unint64_t v9 = 0xE800000000000000;
      uint64_t v10 = 0x7261646E656C6163;
      switch(v6)
      {
        case 1:
          unint64_t v9 = 0xE400000000000000;
          uint64_t v10 = 1937204590;
          break;
        case 2:
          uint64_t v10 = 0x7265646E696D6572;
          unint64_t v9 = 0xE900000000000073;
          break;
        case 3:
          unint64_t v9 = 0xE700000000000000;
          uint64_t v10 = 0x63696666617274;
          break;
        case 4:
          unint64_t v9 = 0xE700000000000000;
          uint64_t v10 = 0x72656874616577;
          break;
        default:
          break;
      }
      if (v8 == v10 && v7 == v9) {
        break;
      }
      char v12 = sub_B37E0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v5;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
    swift_bridgeObjectRelease_n();
  }
  return v4;
}

unint64_t sub_AFB6C(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0xE900000000000065;
      unint64_t v8 = 0x6E61636972727568;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          unint64_t v7 = 0xE700000000000000;
          unint64_t v8 = 0x6F64616E726F74;
          break;
        case 2:
          unint64_t v8 = 0x6C616369706F7274;
          unint64_t v7 = 0xED00006D726F7453;
          break;
        case 3:
          unint64_t v7 = 0xE800000000000000;
          unint64_t v8 = 0x6472617A7A696C62;
          break;
        case 4:
          unint64_t v7 = 0xE400000000000000;
          unint64_t v8 = 1818845544;
          break;
        case 5:
          unint64_t v8 = 0x737265646E756874;
          uint64_t v9 = 1836216180;
          goto LABEL_28;
        case 6:
          unint64_t v7 = 0xE500000000000000;
          unint64_t v8 = 0x7465656C73;
          break;
        case 7:
          unint64_t v7 = 0xE500000000000000;
          uint64_t v10 = 2003791475;
          goto LABEL_17;
        case 8:
          unint64_t v8 = 0x53676E69776F6C62;
          uint64_t v11 = 7827310;
          goto LABEL_25;
        case 9:
          unint64_t v7 = 0xE500000000000000;
          uint64_t v10 = 1852399986;
          goto LABEL_17;
        case 0xA:
          unint64_t v7 = 0xE500000000000000;
          uint64_t v10 = 1802464627;
          goto LABEL_17;
        case 0xB:
          unint64_t v7 = 0xE400000000000000;
          unint64_t v8 = 1953723748;
          break;
        case 0xC:
          unint64_t v7 = 0xE500000000000000;
          uint64_t v10 = 1684957559;
          goto LABEL_17;
        case 0xD:
          unint64_t v7 = 0xE500000000000000;
          uint64_t v10 = 1734831974;
LABEL_17:
          unint64_t v8 = v10 & 0xFFFF0000FFFFFFFFLL | 0x7900000000;
          break;
        case 0xE:
          unint64_t v7 = 0xE400000000000000;
          unint64_t v8 = 1702519144;
          break;
        case 0xF:
          unint64_t v7 = 0xE600000000000000;
          unint64_t v8 = 0x7964756F6C63;
          break;
        case 0x10:
          unint64_t v8 = 0x6C43796C74726170;
          uint64_t v9 = 2036626799;
          goto LABEL_28;
        case 0x11:
          unint64_t v7 = 0xE500000000000000;
          unint64_t v8 = 0x7261656C63;
          break;
        case 0x12:
          unint64_t v7 = 0xE400000000000000;
          unint64_t v8 = 1684828003;
          break;
        case 0x13:
          unint64_t v7 = 0xE300000000000000;
          unint64_t v8 = 7630696;
          break;
        case 0x14:
          unint64_t v8 = 0x6F6C43646578696DLL;
          uint64_t v11 = 7955573;
LABEL_25:
          unint64_t v7 = v11 & 0xFFFFFFFFFFFFLL | 0xEB00000000000000;
          break;
        case 0x15:
          unint64_t v8 = 0x656C43646578696DLL;
          unint64_t v7 = 0xEA00000000007261;
          break;
        case 0x16:
          unint64_t v8 = 0x6C69617641746F6ELL;
          uint64_t v9 = 1701601889;
LABEL_28:
          unint64_t v7 = v9 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
          break;
        default:
          break;
      }
      unint64_t v12 = 0x6E61636972727568;
      unint64_t v13 = 0xE900000000000065;
      switch(v6)
      {
        case 1:
          unint64_t v13 = 0xE700000000000000;
          unint64_t v12 = 0x6F64616E726F74;
          break;
        case 2:
          unint64_t v12 = 0x6C616369706F7274;
          unint64_t v13 = 0xED00006D726F7453;
          break;
        case 3:
          unint64_t v13 = 0xE800000000000000;
          unint64_t v12 = 0x6472617A7A696C62;
          break;
        case 4:
          unint64_t v13 = 0xE400000000000000;
          unint64_t v12 = 1818845544;
          break;
        case 5:
          unint64_t v12 = 0x737265646E756874;
          uint64_t v14 = 1836216180;
          goto LABEL_54;
        case 6:
          unint64_t v13 = 0xE500000000000000;
          unint64_t v12 = 0x7465656C73;
          break;
        case 7:
          unint64_t v13 = 0xE500000000000000;
          uint64_t v15 = 2003791475;
          goto LABEL_43;
        case 8:
          unint64_t v12 = 0x53676E69776F6C62;
          uint64_t v16 = 7827310;
          goto LABEL_51;
        case 9:
          unint64_t v13 = 0xE500000000000000;
          uint64_t v15 = 1852399986;
          goto LABEL_43;
        case 10:
          unint64_t v13 = 0xE500000000000000;
          uint64_t v15 = 1802464627;
          goto LABEL_43;
        case 11:
          unint64_t v13 = 0xE400000000000000;
          unint64_t v12 = 1953723748;
          break;
        case 12:
          unint64_t v13 = 0xE500000000000000;
          uint64_t v15 = 1684957559;
          goto LABEL_43;
        case 13:
          unint64_t v13 = 0xE500000000000000;
          uint64_t v15 = 1734831974;
LABEL_43:
          unint64_t v12 = v15 & 0xFFFF0000FFFFFFFFLL | 0x7900000000;
          break;
        case 14:
          unint64_t v13 = 0xE400000000000000;
          unint64_t v12 = 1702519144;
          break;
        case 15:
          unint64_t v13 = 0xE600000000000000;
          unint64_t v12 = 0x7964756F6C63;
          break;
        case 16:
          unint64_t v12 = 0x6C43796C74726170;
          uint64_t v14 = 2036626799;
          goto LABEL_54;
        case 17:
          unint64_t v13 = 0xE500000000000000;
          unint64_t v12 = 0x7261656C63;
          break;
        case 18:
          unint64_t v13 = 0xE400000000000000;
          unint64_t v12 = 1684828003;
          break;
        case 19:
          unint64_t v13 = 0xE300000000000000;
          unint64_t v12 = 7630696;
          break;
        case 20:
          unint64_t v12 = 0x6F6C43646578696DLL;
          uint64_t v16 = 7955573;
LABEL_51:
          unint64_t v13 = v16 & 0xFFFFFFFFFFFFLL | 0xEB00000000000000;
          break;
        case 21:
          unint64_t v12 = 0x656C43646578696DLL;
          unint64_t v13 = 0xEA00000000007261;
          break;
        case 22:
          unint64_t v12 = 0x6C69617641746F6ELL;
          uint64_t v14 = 1701601889;
LABEL_54:
          unint64_t v13 = v14 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
          break;
        default:
          break;
      }
      if (v8 == v12 && v7 == v13) {
        break;
      }
      char v18 = sub_B37E0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v18 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v5;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
    swift_bridgeObjectRelease_n();
  }
  return v4;
}

uint64_t sub_B0138(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_7424(&qword_E7D38);
  __chkstk_darwin(v6 - 8);
  unint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_B2D30();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  unint64_t v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = type metadata accessor for AMSSearchService();
  uint64_t v40 = &off_DD738;
  v38[0] = a3;
  sub_7468(v38, v39);
  swift_retain();
  unint64_t v13 = sub_3532C(a1, a2);
  if (!v13) {
    goto LABEL_23;
  }
  uint64_t v14 = v13;
  if (!(v13 >> 62))
  {
    if (*(void *)((char *)&dword_10 + (v13 & 0xFFFFFFFFFFFFFF8))) {
      goto LABEL_4;
    }
LABEL_22:
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  if (!sub_B3620()) {
    goto LABEL_22;
  }
LABEL_4:
  sub_21550(0, (v14 & 0xC000000000000001) == 0, v14);
  if ((v14 & 0xC000000000000001) != 0) {
    id v15 = (id)sub_B34F0();
  }
  else {
    id v15 = *(id *)(v14 + 32);
  }
  uint64_t v16 = v15;
  swift_bridgeObjectRelease();
  id v17 = [v16 itemDictionary];
  uint64_t v18 = sub_B2E80();

  uint64_t v33 = 0x44657361656C6572;
  unint64_t v34 = 0xEF656D6954657461;
  sub_B3480();
  sub_ABD88((uint64_t)v35, v18, &v36);
  swift_bridgeObjectRelease();
  sub_8C0CC((uint64_t)v35);
  if (!v37)
  {

    uint64_t v25 = (uint64_t *)&unk_E7990;
    uint64_t v26 = (char *)&v36;
LABEL_19:
    sub_A1530((uint64_t)v26, v25);
    goto LABEL_23;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

LABEL_23:
    uint64_t v31 = 0;
    goto LABEL_24;
  }
  uint64_t v20 = v33;
  uint64_t v19 = (void *)v34;
  id v21 = [v16 itemDictionary];
  uint64_t v22 = sub_B2E80();

  uint64_t v33 = 0x614E747369747261;
  unint64_t v34 = 0xEA0000000000656DLL;
  sub_B3480();
  sub_ABD88((uint64_t)v35, v22, &v36);
  swift_bridgeObjectRelease();
  sub_8C0CC((uint64_t)v35);
  if (v37)
  {
    if (swift_dynamicCast())
    {
      uint64_t v24 = v33;
      uint64_t v23 = (void *)v34;
      goto LABEL_15;
    }
  }
  else
  {
    sub_A1530((uint64_t)&v36, (uint64_t *)&unk_E7990);
  }
  uint64_t v24 = 0;
  uint64_t v23 = (void *)0xE000000000000000;
LABEL_15:
  if (qword_E6D70 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_B378(v9, (uint64_t)qword_F53A8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v27, v9);
  v35[0] = 0;
  v35[1] = 0xE000000000000000;
  sub_B34C0(39);
  swift_bridgeObjectRelease();
  strcpy((char *)v35, "Found Podcast ");
  HIBYTE(v35[1]) = -18;
  v41._countAndFlagsBits = v24;
  v41._object = v23;
  sub_B3020(v41);
  swift_bridgeObjectRelease();
  v42._object = (void *)0x80000000000BCAF0;
  v42._countAndFlagsBits = 0xD000000000000015;
  sub_B3020(v42);
  v43._countAndFlagsBits = v20;
  v43._object = v19;
  sub_B3020(v43);
  sub_8C308(v35[0], v35[1], 0xD00000000000002ALL, 0x80000000000B5650, 0xD000000000000026, 0x80000000000BCB10);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_574F8((uint64_t)v8);
  swift_bridgeObjectRelease();
  uint64_t v28 = sub_B17F0();
  if (sub_C844((uint64_t)v8, 1, v28) == 1)
  {

    uint64_t v25 = &qword_E7D38;
    uint64_t v26 = v8;
    goto LABEL_19;
  }
  sub_B17A0();
  uint64_t v30 = v29;

  (*(void (**)(char *, uint64_t))(*(void *)(v28 - 8) + 8))(v8, v28);
  uint64_t v31 = v30;
LABEL_24:
  sub_74F8((uint64_t)v38);
  return v31;
}

uint64_t sub_B06BC(uint64_t a1, void *a2)
{
  v10[3] = type metadata accessor for AppDetecter();
  v10[4] = &off_DD2C8;
  v10[0] = a1;
  sub_7468(a2, a2[3]);
  swift_retain();
  LOBYTE(a2) = sub_B1E50();
  sub_A8B4((uint64_t)v10, (uint64_t)v9);
  if (a2)
  {
    char v4 = 1;
  }
  else
  {
    sub_B1428(v9, v9[3]);
    uint64_t v5 = sub_24430();
    sub_7A1C();
    sub_ABEBC(0xD000000000000012, v6, (uint64_t)v5);
    char v4 = v7;
    swift_bridgeObjectRelease();
  }
  sub_74F8((uint64_t)v9);
  sub_74F8((uint64_t)v10);
  return v4 & 1;
}

uint64_t sub_B07A0()
{
  sub_7FDC();
  uint64_t v2 = v1;
  v0[17] = v3;
  v0[18] = v4;
  v0[5] = type metadata accessor for AppDetecter();
  v0[6] = &off_DD2C8;
  v0[2] = v2;
  swift_retain();
  sub_AC10();
  return _swift_task_switch(v5, v6, v7);
}

uint64_t sub_B0824()
{
  sub_AC48();
  sub_7468(*(void **)(v0 + 144), *(void *)(*(void *)(v0 + 144) + 24));
  sub_5283C();
  if (sub_B1DC0())
  {
    sub_74F8(v0 + 16);
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1(0);
  }
  else
  {
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 152) = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_B091C;
    return sub_F26C(1);
  }
}

uint64_t sub_B091C()
{
  sub_7FDC();
  sub_7FC4();
  sub_2B6A4();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 160) = v3;
  *(void *)(v1 + 168) = v4;
  swift_task_dealloc();
  sub_AC10();
  return _swift_task_switch(v5, v6, v7);
}

uint64_t sub_B09EC()
{
  uint64_t v1 = v0[18];
  char v2 = sub_7A28(v0[20], v0[21]);
  char v3 = sub_7E78(v2);
  sub_A8B4((uint64_t)(v0 + 2), (uint64_t)(v0 + 7));
  sub_A8B4(v1, (uint64_t)(v0 + 12));
  if (v3)
  {
    uint64_t v4 = sub_7468(v0 + 7, v0[10]);
    char v5 = sub_B06BC(*v4, v0 + 12);
  }
  else
  {
    char v5 = 0;
  }
  sub_74F8((uint64_t)(v0 + 12));
  sub_74F8((uint64_t)(v0 + 7));
  sub_74F8((uint64_t)(v0 + 2));
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6(v5 & 1);
}

uint64_t sub_B0AD0()
{
  sub_AC48();
  uint64_t v2 = v1;
  uint64_t v3 = sub_B2D30();
  v0[11] = v3;
  sub_FC60(v3);
  v0[12] = v4;
  v0[13] = sub_131EC();
  uint64_t v5 = type metadata accessor for AMSSearchService();
  v0[14] = v5;
  v0[5] = v5;
  v0[6] = &off_DD738;
  v0[2] = v2;
  uint64_t v8 = (uint64_t (*)(char))((char *)&dword_ED060 + dword_ED060);
  swift_retain();
  uint64_t v6 = (void *)swift_task_alloc();
  v0[15] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_B0BD8;
  return v8(2);
}

uint64_t sub_B0BD8()
{
  sub_7FDC();
  sub_7FC4();
  sub_2B6A4();
  *uint64_t v2 = v1;
  v1[7] = v0;
  v1[8] = v3;
  v1[9] = v4;
  v1[10] = v5;
  uint64_t v6 = *v0;
  sub_AB94();
  *uint64_t v7 = v6;
  *(void *)(v9 + 128) = v8;
  swift_task_dealloc();
  sub_AC10();
  return _swift_task_switch(v10, v11, v12);
}

uint64_t sub_B0CA8()
{
  sub_7D7FC();
  if (!*(void *)(v0 + 128)) {
    goto LABEL_12;
  }
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 112);
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_17844(v1);
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_7468((void *)(v0 + 16), v2);
  double v7 = COERCE_DOUBLE(sub_B0138(v3, v5, *v6));
  LOBYTE(v2) = v8;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v2)
  {
LABEL_12:
    if (qword_E6BB0 != -1) {
      swift_once();
    }
    sub_B378(*(void *)(v0 + 88), (uint64_t)qword_F4E80);
    sub_7A1C();
    sub_ABC4();
    sub_52848();
    sub_8C320(v22, v23, v24, v25, 0xD000000000000011, v26);
    BOOL v11 = 0;
  }
  else
  {
    double v9 = *(double *)(v0 + 80);
    double v10 = v7;
    BOOL v11 = v9 > v7;
    if (qword_E6BB0 != -1) {
      swift_once();
    }
    uint64_t v13 = *(void *)(v0 + 96);
    uint64_t v12 = *(void *)(v0 + 104);
    uint64_t v14 = *(void *)(v0 + 88);
    uint64_t v15 = sub_B378(v14, (uint64_t)qword_F4E80);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v12, v15, v14);
    if (v9 <= v10) {
      v16._countAndFlagsBits = 0x65736C6166;
    }
    else {
      v16._countAndFlagsBits = 1702195828;
    }
    if (v9 <= v10) {
      id v17 = (void *)0xE500000000000000;
    }
    else {
      id v17 = (void *)0xE400000000000000;
    }
    v16._object = v17;
    sub_B3020(v16);
    swift_bridgeObjectRelease();
    sub_ABC4();
    sub_52848();
    sub_8C308(v18, 0xED0000203A656C61, v19, v20, 0xD000000000000011, v21);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  sub_74F8(v0 + 16);
  swift_task_dealloc();
  uint64_t v27 = *(uint64_t (**)(BOOL))(v0 + 8);
  return v27(v11);
}

unint64_t sub_B0F64()
{
  unint64_t result = qword_ED068;
  if (!qword_ED068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_ED068);
  }
  return result;
}

unint64_t sub_B0FB0()
{
  unint64_t result = qword_ED080;
  if (!qword_ED080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_ED080);
  }
  return result;
}

uint64_t sub_B0FFC(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *storeEnumTagSinglePayload for NewsFlow.NewsInput(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0xB1110);
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

ValueMetadata *type metadata accessor for NewsFlow.NewsInput()
{
  return &type metadata for NewsFlow.NewsInput;
}

unint64_t sub_B114C()
{
  unint64_t result = qword_ED0A8;
  if (!qword_ED0A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_ED0A8);
  }
  return result;
}

void sub_B1198(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_8C308(a1, a2, 0xD000000000000026, a4, 0x2865747563657865, 0xE900000000000029);
}

uint64_t sub_B11F8()
{
  return v0;
}

uint64_t sub_B1210()
{
  return v0;
}

uint64_t sub_B1230()
{
  return String.data(using:allowLossyConversion:)(v2, 0, v0, v1);
}

void sub_B1264()
{
  *(void *)(v0 + 64) = v1;
}

uint64_t sub_B12A8()
{
  return sub_B1440();
}

void sub_B12D0()
{
  v1._countAndFlagsBits = 46;
  v1._object = (void *)0xE100000000000000;
  sub_B3020(v1);
}

uint64_t sub_B12EC()
{
  return v0;
}

uint64_t sub_B12FC()
{
  sub_70728(v1, v0);
  return swift_release();
}

uint64_t sub_B133C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_B1358()
{
  return v0;
}

uint64_t sub_B1370()
{
  return *(void *)(v0 + 40);
}

void sub_B137C()
{
  sub_B34C0(28);
}

uint64_t sub_B139C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return a9;
}

id sub_B13B0()
{
  sub_7468((void *)(v0 + 48), *(void *)(v0 + 72));
  return sub_18088();
}

uint64_t sub_B13E8(uint64_t a1)
{
  return AceServiceInvokerAsync.submitAndForget(_:)(a1, v2, v1);
}

uint64_t sub_B1408(uint64_t result, uint64_t a2)
{
  void v2[2] = v3;
  v2[3] = result;
  v2[4] = a2;
  return result;
}

void *sub_B1428(void *a1, uint64_t a2)
{
  return sub_7468(a1, a2);
}

uint64_t sub_B1440()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_B1450()
{
  return JSONDecoder.init()();
}

uint64_t sub_B1460()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_B1470()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t sub_B1480()
{
  return JSONEncoder.init()();
}

uint64_t sub_B1490()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t sub_B14A0()
{
  return Measurement.value.getter();
}

uint64_t sub_B14B0()
{
  return Measurement<>.converted(to:)();
}

uint64_t sub_B14C0()
{
  return type metadata accessor for Measurement();
}

uint64_t sub_B14D0()
{
  return static CharacterSet.whitespaces.getter();
}

uint64_t sub_B14E0()
{
  return static CharacterSet.alphanumerics.getter();
}

uint64_t sub_B14F0()
{
  return CharacterSet.inverted.getter();
}

uint64_t sub_B1500()
{
  return type metadata accessor for CharacterSet();
}

uint64_t sub_B1510()
{
  return type metadata accessor for Notification();
}

uint64_t sub_B1520()
{
  return URLQueryItem.init(name:value:)();
}

uint64_t sub_B1530()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t sub_B1540()
{
  return URLComponents.queryItems.setter();
}

uint64_t sub_B1550()
{
  return URLComponents.url.getter();
}

uint64_t sub_B1560()
{
  return URLComponents.host.setter();
}

uint64_t sub_B1570()
{
  return URLComponents.scheme.setter();
}

uint64_t sub_B1580()
{
  return URLComponents.init()();
}

uint64_t sub_B1590()
{
  return type metadata accessor for URLComponents();
}

uint64_t sub_B15A0()
{
  return static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_B15B0()
{
  return DateComponents.day.getter();
}

uint64_t sub_B15D0()
{
  return DateComponents.hour.getter();
}

uint64_t sub_B15E0()
{
  return DateComponents.year.getter();
}

uint64_t sub_B15F0()
{
  return DateComponents.month.getter();
}

uint64_t sub_B1600()
{
  return DateComponents.minute.getter();
}

uint64_t sub_B1610()
{
  return DateComponents.second.getter();
}

uint64_t sub_B1620()
{
  return DateComponents.second.setter();
}

uint64_t sub_B1640()
{
  return DateComponents.timeZone.getter();
}

uint64_t sub_B1650()
{
  return type metadata accessor for DateComponents();
}

uint64_t sub_B1660()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t sub_B1670()
{
  return LocalizedError.failureReason.getter();
}

uint64_t sub_B1680()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t sub_B1690()
{
  return _convertNSErrorToError(_:)();
}

void sub_B16A0(NSURL *retstr@<X8>)
{
}

uint64_t sub_B16B0()
{
  return static URL.== infix(_:_:)();
}

uint64_t sub_B16C0()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_B16D0()
{
  return URL.host.getter();
}

uint64_t sub_B16E0()
{
  return URL.path.getter();
}

uint64_t sub_B16F0()
{
  return URL.scheme.getter();
}

uint64_t sub_B1700()
{
  return type metadata accessor for URL();
}

NSData sub_B1710()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_B1720()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_B1730()
{
  return Date.addingTimeInterval(_:)();
}

NSDate sub_B1740()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_B1750()
{
  return static Date.> infix(_:_:)();
}

uint64_t sub_B1760()
{
  return static Date.< infix(_:_:)();
}

uint64_t sub_B1770()
{
  return Date.init(timeIntervalSinceNow:)();
}

uint64_t sub_B1780()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t sub_B1790()
{
  return Date.init(timeIntervalSince1970:)();
}

uint64_t sub_B17A0()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t sub_B17B0()
{
  return static Date.== infix(_:_:)();
}

uint64_t sub_B17C0()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_B17D0()
{
  return Date.compare(_:)();
}

uint64_t sub_B17E0()
{
  return Date.init()();
}

uint64_t sub_B17F0()
{
  return type metadata accessor for Date();
}

uint64_t sub_B1800()
{
  return UUID.uuidString.getter();
}

uint64_t sub_B1810()
{
  return UUID.init()();
}

uint64_t sub_B1820()
{
  return type metadata accessor for UUID();
}

uint64_t sub_B1830()
{
  return Locale.init(identifier:)();
}

uint64_t sub_B1840()
{
  return Locale.identifier.getter();
}

uint64_t sub_B1850()
{
  return Locale.usesMetricSystem.getter();
}

NSLocale sub_B1860()
{
  return Locale._bridgeToObjectiveC()();
}

uint64_t sub_B1870()
{
  return static Locale.current.getter();
}

uint64_t sub_B1880()
{
  return type metadata accessor for Locale();
}

uint64_t sub_B1890()
{
  return Calendar.startOfDay(for:)();
}

uint64_t sub_B18A0()
{
  return Calendar.isDateInToday(_:)();
}

uint64_t sub_B18B0()
{
  return Calendar.dateComponents(_:from:to:)();
}

uint64_t sub_B18C0()
{
  return Calendar.dateComponents(_:from:)();
}

uint64_t sub_B18D0()
{
  return Calendar.isDateInYesterday(_:)();
}

NSCalendar sub_B18E0()
{
  return Calendar._bridgeToObjectiveC()();
}

uint64_t sub_B1900()
{
  return Calendar.isDate(_:inSameDayAs:)();
}

uint64_t sub_B1910()
{
  return Calendar.compare(_:to:toGranularity:)();
}

uint64_t sub_B1920()
{
  return static Calendar.current.getter();
}

uint64_t sub_B1930()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_B1940()
{
  return Calendar.component(_:from:)();
}

uint64_t sub_B1950()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_B1960()
{
  return TimeZone.abbreviation(for:)();
}

uint64_t sub_B1970()
{
  return TimeZone.init(secondsFromGMT:)();
}

NSTimeZone sub_B1980()
{
  return TimeZone._bridgeToObjectiveC()();
}

uint64_t sub_B1990()
{
  return type metadata accessor for TimeZone();
}

uint64_t sub_B19A0()
{
  return DayWeather.lowTemperature.getter();
}

uint64_t sub_B19B0()
{
  return DayWeather.highTemperature.getter();
}

uint64_t sub_B19C0()
{
  return type metadata accessor for DayWeather();
}

uint64_t sub_B19D0()
{
  return HourWeather.temperature.getter();
}

uint64_t sub_B19E0()
{
  return HourWeather.date.getter();
}

uint64_t sub_B19F0()
{
  return HourWeather.condition.getter();
}

uint64_t sub_B1A00()
{
  return type metadata accessor for HourWeather();
}

uint64_t sub_B1A10()
{
  return CurrentWeather.temperature.getter();
}

uint64_t sub_B1A20()
{
  return CurrentWeather.date.getter();
}

uint64_t sub_B1A30()
{
  return CurrentWeather.condition.getter();
}

uint64_t sub_B1A40()
{
  return type metadata accessor for CurrentWeather();
}

uint64_t sub_B1A50()
{
  return static WeatherQuery.airQuality.getter();
}

uint64_t sub_B1A60()
{
  return static WeatherQuery.daily.getter();
}

uint64_t sub_B1A70()
{
  return static WeatherQuery.hourly.getter();
}

uint64_t sub_B1A80()
{
  return static WeatherQuery.current.getter();
}

uint64_t sub_B1AA0()
{
  return WeatherService.__allocating_init()();
}

uint64_t sub_B1AB0()
{
  return type metadata accessor for WeatherService();
}

uint64_t sub_B1AC0()
{
  return type metadata accessor for WeatherCondition();
}

uint64_t sub_B1AD0()
{
  return AirQuality.isSignificant.getter();
}

uint64_t sub_B1AE0()
{
  return AirQuality.providerAttribution.getter();
}

uint64_t sub_B1AF0()
{
  return AirQuality.currentScaleCategory.getter();
}

uint64_t sub_B1B00()
{
  return AirQuality.index.getter();
}

uint64_t sub_B1B10()
{
  return AirQuality.scale.getter();
}

uint64_t sub_B1B20()
{
  return type metadata accessor for AirQuality();
}

uint64_t sub_B1B30()
{
  return AirQualityScale.displayName.getter();
}

uint64_t sub_B1B40()
{
  return type metadata accessor for AirQualityScale();
}

uint64_t sub_B1B50()
{
  return ProviderAttribution.name.getter();
}

uint64_t sub_B1B60()
{
  return type metadata accessor for ProviderAttribution();
}

uint64_t sub_B1B70()
{
  return AirQualityScaleCategory.number.getter();
}

uint64_t sub_B1B80()
{
  return type metadata accessor for AirQualityScaleCategory();
}

uint64_t sub_B1B90()
{
  return type metadata accessor for Forecast();
}

uint64_t sub_B1BA0()
{
  return Forecast.subscript.getter();
}

uint64_t sub_B1BB0()
{
  return static CommonGuardFlowUtils.makeGuardFlow(withGuards:)();
}

uint64_t sub_B1BC0()
{
  return PostPersonalDomainActivityNotificationFlow.init(notificationBodyProvider:)();
}

uint64_t sub_B1BD0()
{
  return type metadata accessor for PostPersonalDomainActivityNotificationFlow();
}

uint64_t sub_B1BE0()
{
  return AnyFlow.description.getter();
}

uint64_t sub_B1BF0()
{
  return type metadata accessor for GuardFlow();
}

uint64_t sub_B1C00()
{
  return static CommonFlowGuard.ensuringUnlockedApps(_:using:)();
}

uint64_t sub_B1C10()
{
  return static CommonFlowGuard.disallowInSharingMode.getter();
}

uint64_t sub_B1C20()
{
  return static CommonFlowGuard.ensuringDeviceIsAuthenticated.getter();
}

uint64_t sub_B1C30()
{
  return type metadata accessor for CommonFlowGuard();
}

uint64_t sub_B1C40()
{
  return PatternFlowProvider.init(outputPublisher:responseGenerator:)();
}

uint64_t sub_B1C50()
{
  return type metadata accessor for PatternFlowProvider();
}

uint64_t sub_B1C70()
{
  return Flow.eraseToAnyFlow()();
}

uint64_t sub_B1C80()
{
  return Flow.deferToExecuteAsync(_:)();
}

uint64_t sub_B1C90()
{
  return Flow.flexibleExecutionSupport.getter();
}

uint64_t sub_B1CD0()
{
  return static FlowSearchResult.flow(_:)();
}

uint64_t sub_B1CE0()
{
  return type metadata accessor for FlowUnhandledReason();
}

uint64_t sub_B1CF0()
{
  return FlowPlugin.findFlowFor(parse:)();
}

uint64_t sub_B1D00()
{
  return FlowPlugin.makeFlowFrame(parse:)();
}

void sub_B1D10()
{
}

uint64_t sub_B1D20()
{
  return static SiriKitEventSender.current.getter();
}

uint64_t sub_B1D30()
{
  return dispatch thunk of SiriKitEventSending.send(_:)();
}

uint64_t sub_B1D50()
{
  return dispatch thunk of SiriKitEvent.SiriKitEventBuilder.domainContext.setter();
}

uint64_t sub_B1D60()
{
  return dispatch thunk of SiriKitEvent.SiriKitEventBuilder.statusReasonDescription.setter();
}

uint64_t sub_B1D70()
{
  return dispatch thunk of SiriKitEvent.SiriKitEventBuilder.attribute.setter();
}

uint64_t sub_B1D80()
{
  return SiriKitEvent.__allocating_init(stateType:taskType:statusReason:_:)();
}

uint64_t sub_B1D90()
{
  return type metadata accessor for SiriKitEvent();
}

uint64_t sub_B1DA0()
{
  return static AceService.currentAsync.getter();
}

uint64_t sub_B1DB0()
{
  return dispatch thunk of DeviceState.isSidekick.getter();
}

uint64_t sub_B1DC0()
{
  return dispatch thunk of DeviceState.isXRDevice.getter();
}

uint64_t sub_B1DD0()
{
  return dispatch thunk of DeviceState.siriLocale.getter();
}

uint64_t sub_B1DE0()
{
  return dispatch thunk of DeviceState.isTextToSpeechEnabled.getter();
}

uint64_t sub_B1DF0()
{
  return dispatch thunk of DeviceState.isMac.getter();
}

uint64_t sub_B1E00()
{
  return dispatch thunk of DeviceState.isPad.getter();
}

uint64_t sub_B1E10()
{
  return dispatch thunk of DeviceState.isPhone.getter();
}

uint64_t sub_B1E20()
{
  return dispatch thunk of DeviceState.isWatch.getter();
}

uint64_t sub_B1E30()
{
  return dispatch thunk of DeviceState.isAppleTV.getter();
}

uint64_t sub_B1E40()
{
  return dispatch thunk of DeviceState.isCarPlay.getter();
}

uint64_t sub_B1E50()
{
  return dispatch thunk of DeviceState.isHomePod.getter();
}

uint64_t sub_B1E60()
{
  return DeviceState.asInvocationContext.getter();
}

uint64_t sub_B1E70()
{
  return DeviceState.isVox.getter();
}

uint64_t sub_B1E90()
{
  return type metadata accessor for DialogPhase();
}

uint64_t sub_B1EA0()
{
  return dispatch thunk of ViewFactory.makeConfirmedView(templateResult:snippets:listenAfterSpeaking:canUseServerTTS:)();
}

uint64_t sub_B1EB0()
{
  return dispatch thunk of ViewFactory.makeCompletionView(templateResult:snippets:listenAfterSpeaking:canUseServerTTS:)();
}

uint64_t sub_B1EC0()
{
  return ViewFactory.init(ttsEnabled:)();
}

uint64_t sub_B1ED0()
{
  return type metadata accessor for ViewFactory();
}

uint64_t sub_B1EE0()
{
  return static CasinoFactory.makeSendCommandsFromMachineUtterance(machineUtterance:)();
}

uint64_t sub_B1EF0()
{
  return TemplatingText.text.getter();
}

uint64_t sub_B1F00()
{
  return type metadata accessor for TemplatingText();
}

uint64_t sub_B1F10()
{
  return static AceOutputHelper.makeErrorOutput(templateResult:deviceState:ttsEnabled:snippetAceViews:listenAfterSpeaking:canUseServerTTS:nlContextUpdate:additionalCommands:flowActivity:)();
}

uint64_t sub_B1F20()
{
  return ExecuteResponse.next.getter();
}

uint64_t sub_B1F30()
{
  return static ExecuteResponse.ongoing(requireInput:)();
}

uint64_t sub_B1F40()
{
  return static ExecuteResponse.ongoing<A>(next:childCompletion:)();
}

uint64_t sub_B1F50()
{
  return static ExecuteResponse.ongoing(next:childCompletion:)();
}

uint64_t sub_B1F60()
{
  return static ExecuteResponse.ongoing(next:)();
}

uint64_t sub_B1F70()
{
  return static ExecuteResponse.complete<A>(next:childCompletion:)();
}

uint64_t sub_B1F80()
{
  return static ExecuteResponse.complete(next:childCompletion:)();
}

uint64_t sub_B1F90()
{
  return static ExecuteResponse.complete<A>(next:)();
}

uint64_t sub_B1FA0()
{
  return static ExecuteResponse.complete(next:)();
}

uint64_t sub_B1FB0()
{
  return static ExecuteResponse.complete()();
}

uint64_t sub_B1FC0()
{
  return static ExecuteResponse.unhandled(reason:)();
}

uint64_t sub_B1FD0()
{
  return type metadata accessor for ExecuteResponse();
}

uint64_t sub_B1FE0()
{
  return NLContextUpdate.rrEntities.setter();
}

uint64_t sub_B1FF0()
{
  return NLContextUpdate.currentDomainName.setter();
}

uint64_t sub_B2000()
{
  return NLContextUpdate.nluSystemDialogActs.setter();
}

uint64_t sub_B2010()
{
  return NLContextUpdate.weightedPromptStrict.setter();
}

uint64_t sub_B2020()
{
  return NLContextUpdate.applicationContextObjects.setter();
}

uint64_t sub_B2030()
{
  return NLContextUpdate.weightedPromptAbortValues.setter();
}

uint64_t sub_B2040()
{
  return NLContextUpdate.weightedPromptTargetDomain.setter();
}

uint64_t sub_B2050()
{
  return NLContextUpdate.weightedPromptResponseOptions.setter();
}

uint64_t sub_B2060()
{
  return NLContextUpdate.weightedPromptResponseTargets.setter();
}

uint64_t sub_B2070()
{
  return NLContextUpdate.nlInput.setter();
}

uint64_t sub_B2080()
{
  return NLContextUpdate.init()();
}

uint64_t sub_B2090()
{
  return type metadata accessor for NLContextUpdate();
}

uint64_t sub_B20A0()
{
  return ResponseFactory.init()();
}

uint64_t sub_B20B0()
{
  return type metadata accessor for ResponseFactory();
}

uint64_t sub_B20C0()
{
  return TemplatingResult.sections.getter();
}

uint64_t sub_B20D0()
{
  return type metadata accessor for TemplatingResult();
}

uint64_t sub_B20E0()
{
  return TemplatingSection.content.getter();
}

uint64_t sub_B20F0()
{
  return type metadata accessor for TemplatingSection();
}

uint64_t sub_B2110()
{
  return dispatch thunk of AceServiceInvokerAsync.currentStartRequestId()();
}

uint64_t sub_B2150()
{
  return static OutputPublisherFactory.makeOutputPublisherAsync()();
}

uint64_t sub_B2160()
{
  return dispatch thunk of MachineUtteranceBuilder.addMapping(node:value:)();
}

uint64_t sub_B2170()
{
  return dispatch thunk of MachineUtteranceBuilder.build()();
}

uint64_t sub_B2180()
{
  return MachineUtteranceBuilder.init()();
}

uint64_t sub_B2190()
{
  return type metadata accessor for MachineUtteranceBuilder();
}

uint64_t sub_B21B0()
{
  return OutputGenerationManifest.nlContextUpdate.setter();
}

uint64_t sub_B21C0()
{
  return type metadata accessor for OutputGenerationManifest();
}

uint64_t sub_B21D0()
{
  return ProtectedAppCheckStrategy.protectedAppCheck(_:appsToIncludeInLockedAppDialog:)();
}

uint64_t sub_B21E0()
{
  return ProtectedAppCheckStrategy.protectedAppCheck(_:needsAppNameForAppID:)();
}

uint64_t sub_B21F0()
{
  return ProtectedAppCheckStrategy.protectedAppCheck(_:appsToBeUnlocked:)();
}

uint64_t sub_B2200()
{
  return ProtectedAppCheckStrategy.protectedAppCheckShouldProduceOutputForHiddenApps(_:)();
}

uint64_t sub_B2210()
{
  return Input.parse.getter();
}

uint64_t sub_B2220()
{
  return Parse.DirectInvocation.identifier.getter();
}

uint64_t sub_B2230()
{
  return Parse.DirectInvocation.userData.getter();
}

uint64_t sub_B2240()
{
  return type metadata accessor for Parse.DirectInvocation();
}

uint64_t sub_B2250()
{
  return type metadata accessor for Parse();
}

uint64_t sub_B2260()
{
  return static Device.current.getter();
}

uint64_t sub_B2270()
{
  return USOParse.userParse.getter();
}

uint64_t sub_B2280()
{
  return type metadata accessor for USOParse();
}

uint64_t sub_B2290()
{
  return AceOutput.init(commands:flowActivity:nlContextUpdate:)();
}

uint64_t sub_B22A0()
{
  return type metadata accessor for AceOutput();
}

uint64_t sub_B22B0()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_B22C0()
{
  return type metadata accessor for Siri_Nlu_External_UsoGraph();
}

uint64_t sub_B22D0()
{
  return type metadata accessor for Siri_Nlu_External_UserParse();
}

uint64_t sub_B22E0()
{
  return Siri_Nlu_External_SystemOffered.offeredAct.setter();
}

uint64_t sub_B22F0()
{
  return Siri_Nlu_External_SystemOffered.init()();
}

uint64_t sub_B2300()
{
  return type metadata accessor for Siri_Nlu_External_SystemOffered();
}

uint64_t sub_B2310()
{
  return Siri_Nlu_External_UserDialogAct.wantedToProceed.setter();
}

uint64_t sub_B2320()
{
  return Siri_Nlu_External_UserDialogAct.init()();
}

uint64_t sub_B2330()
{
  return type metadata accessor for Siri_Nlu_External_UserDialogAct();
}

uint64_t sub_B2340()
{
  return Siri_Nlu_External_SystemDialogAct.offered.setter();
}

uint64_t sub_B2350()
{
  return Siri_Nlu_External_SystemDialogAct.init()();
}

uint64_t sub_B2360()
{
  return type metadata accessor for Siri_Nlu_External_SystemDialogAct();
}

uint64_t sub_B2370()
{
  return Siri_Nlu_External_UserWantedToProceed.reference.setter();
}

uint64_t sub_B2380()
{
  return Siri_Nlu_External_UserWantedToProceed.init()();
}

uint64_t sub_B2390()
{
  return type metadata accessor for Siri_Nlu_External_UserWantedToProceed();
}

uint64_t sub_B23A0()
{
  return static ConversionUtils.toLegacyPreferredUserDialogAct(from:)();
}

uint64_t sub_B23B0()
{
  return static UsoGraphProtoWriter.toSwiftProtobuf(graph:vocabManager:)();
}

uint64_t sub_B23C0()
{
  return NonTerminalOntologyNode.init(name:multicardinal:childNodes:)();
}

uint64_t sub_B23D0()
{
  return type metadata accessor for NonTerminalOntologyNode();
}

uint64_t sub_B23E0()
{
  return type metadata accessor for UsoEntity_commonNotebook_NotebookItemType.DefinedValues();
}

uint64_t sub_B23F0()
{
  return dispatch thunk of UsoEntityBuilder_commonNotebook_NotebookItemType.setDefinedValue(value:)();
}

uint64_t sub_B2400()
{
  return UsoEntityBuilder_commonNotebook_NotebookItemType.init()();
}

uint64_t sub_B2410()
{
  return type metadata accessor for UsoEntityBuilder_commonNotebook_NotebookItemType();
}

uint64_t sub_B2420()
{
  return DomainOntologyNode.init(name:childNodes:isInEventTree:)();
}

uint64_t sub_B2430()
{
  return type metadata accessor for DomainOntologyNode();
}

uint64_t sub_B2440()
{
  return TerminalOntologyNode.init(name:multicardinal:)();
}

uint64_t sub_B2450()
{
  return ListOperators.rawValue.getter();
}

uint64_t sub_B2460()
{
  return type metadata accessor for ListOperators();
}

uint64_t sub_B2470()
{
  return UsoIdentifier.value.getter();
}

uint64_t sub_B2480()
{
  return UsoIdentifier.namespace.getter();
}

uint64_t sub_B2490()
{
  return type metadata accessor for UsoIdentifier();
}

uint64_t sub_B24D0()
{
  return static UsoGraphBuilder.buildGraphWithOptions(taskBuilders:options:)();
}

uint64_t sub_B24E0()
{
  return dispatch thunk of CodeGenListEntry.entryAsExpression.getter();
}

uint64_t sub_B24F0()
{
  return dispatch thunk of CodeGenListEntry.entry.getter();
}

uint64_t sub_B2500()
{
  return type metadata accessor for UsoEntityBuilder();
}

uint64_t sub_B2510()
{
  return dispatch thunk of CodeGenExpression.operatorAsString.getter();
}

uint64_t sub_B2520()
{
  return dispatch thunk of CodeGenExpression.operand.getter();
}

uint64_t sub_B2530()
{
  return dispatch thunk of CodeGenGlobalArgs.usoAssociatedApp.getter();
}

uint64_t sub_B2540()
{
  return dispatch thunk of CodeGenGlobalArgs.getUsoIdentifiersFor(attributeName:)();
}

uint64_t sub_B2550()
{
  return type metadata accessor for UsoBuilderOptions();
}

uint64_t sub_B2560()
{
  return static UsoConversionUtils.convertUserDialogActToTasks(userDialogAct:)();
}

uint64_t sub_B2570()
{
  return IntentNodeTraversable.value<A>(forNode:)();
}

uint64_t sub_B2580()
{
  return static UsoTask_CodegenConverter.convert(task:)();
}

uint64_t sub_B2590()
{
  return static UsoBuilderConversionUtils.convertEntityBuilderToEntity(entityBuilder:)();
}

uint64_t sub_B25A0()
{
  return dispatch thunk of UsoEntityBuilder_common_Date.setDayOfMonth(value:)();
}

uint64_t sub_B25B0()
{
  return dispatch thunk of UsoEntityBuilder_common_Date.setMonthOfYear(value:)();
}

uint64_t sub_B25C0()
{
  return dispatch thunk of UsoEntityBuilder_common_Date.setYear(value:)();
}

uint64_t sub_B25D0()
{
  return UsoEntityBuilder_common_Date.init()();
}

uint64_t sub_B25E0()
{
  return type metadata accessor for UsoEntityBuilder_common_Date();
}

uint64_t sub_B25F0()
{
  return dispatch thunk of UsoEntityBuilder_common_Time.setTimeZone(value:)();
}

uint64_t sub_B2600()
{
  return dispatch thunk of UsoEntityBuilder_common_Time.setHour(value:)();
}

uint64_t sub_B2610()
{
  return dispatch thunk of UsoEntityBuilder_common_Time.setMinute(value:)();
}

uint64_t sub_B2620()
{
  return dispatch thunk of UsoEntityBuilder_common_Time.setSecond(value:)();
}

uint64_t sub_B2630()
{
  return UsoEntityBuilder_common_Time.init()();
}

uint64_t sub_B2640()
{
  return type metadata accessor for UsoEntityBuilder_common_Time();
}

uint64_t sub_B2650()
{
  return dispatch thunk of UsoEntity_common_DailyBriefing.items.getter();
}

uint64_t sub_B2660()
{
  return dispatch thunk of UsoEntityBuilder_common_Integer.setIntegerValue(value:)();
}

uint64_t sub_B2670()
{
  return UsoEntityBuilder_common_Integer.init()();
}

uint64_t sub_B2680()
{
  return type metadata accessor for UsoEntityBuilder_common_Integer();
}

uint64_t sub_B26A0()
{
  return dispatch thunk of UsoEntityBuilder_common_DateTime.setDate(value:)();
}

uint64_t sub_B26B0()
{
  return dispatch thunk of UsoEntityBuilder_common_DateTime.setTime(value:)();
}

uint64_t sub_B26C0()
{
  return UsoEntityBuilder_common_DateTime.init()();
}

uint64_t sub_B26D0()
{
  return type metadata accessor for UsoEntityBuilder_common_DateTime();
}

uint64_t sub_B26E0()
{
  return dispatch thunk of UsoEntityBuilder_common_TimeZone.setName(value:)();
}

uint64_t sub_B26F0()
{
  return UsoEntityBuilder_common_TimeZone.init()();
}

uint64_t sub_B2700()
{
  return type metadata accessor for UsoEntityBuilder_common_TimeZone();
}

uint64_t sub_B2710()
{
  return dispatch thunk of Uso_VerbTemplate_ReferenceTarget.target.getter();
}

uint64_t sub_B2720()
{
  return dispatch thunk of UsoEntityBuilder_common_MonthOfYear.setIntegerValue(value:)();
}

uint64_t sub_B2730()
{
  return UsoEntityBuilder_common_MonthOfYear.init()();
}

uint64_t sub_B2740()
{
  return type metadata accessor for UsoEntityBuilder_common_MonthOfYear();
}

uint64_t sub_B2750()
{
  return type metadata accessor for UsoTask_update_common_DailyBriefing();
}

uint64_t sub_B2760()
{
  return dispatch thunk of UsoEntityBuilder_common_EventTrigger.setDateTimeTrigger(value:)();
}

uint64_t sub_B2770()
{
  return UsoEntityBuilder_common_EventTrigger.init()();
}

uint64_t sub_B2780()
{
  return type metadata accessor for UsoEntityBuilder_common_EventTrigger();
}

uint64_t sub_B2790()
{
  return dispatch thunk of UsoEntityBuilder_common_NotebookItem.setItemType(value:)();
}

uint64_t sub_B27A0()
{
  return dispatch thunk of UsoEntityBuilder_common_NotebookItem.setTrigger(value:)();
}

uint64_t sub_B27B0()
{
  return dispatch thunk of UsoEntityBuilder_common_NotebookItem.setDateTimeCreated(value:)();
}

uint64_t sub_B27C0()
{
  return dispatch thunk of UsoEntityBuilder_common_NotebookItem.setDateTimeModified(value:)();
}

uint64_t sub_B27D0()
{
  return dispatch thunk of UsoEntityBuilder_common_NotebookItem.setName(value:)();
}

uint64_t sub_B27E0()
{
  return UsoEntityBuilder_common_NotebookItem.init()();
}

uint64_t sub_B27F0()
{
  return type metadata accessor for UsoEntityBuilder_common_NotebookItem();
}

uint64_t sub_B2800()
{
  return dispatch thunk of UsoEntityBuilder_common_CalendarEvent.setDateTimeRange(value:)();
}

uint64_t sub_B2810()
{
  return dispatch thunk of UsoEntityBuilder_common_CalendarEvent.setName(value:)();
}

uint64_t sub_B2820()
{
  return UsoEntityBuilder_common_CalendarEvent.init()();
}

uint64_t sub_B2830()
{
  return type metadata accessor for UsoEntityBuilder_common_CalendarEvent();
}

uint64_t sub_B2840()
{
  return dispatch thunk of UsoEntityBuilder_common_DateTimeRange.setStart(value:)();
}

uint64_t sub_B2850()
{
  return UsoEntityBuilder_common_DateTimeRange.init()();
}

uint64_t sub_B2860()
{
  return type metadata accessor for UsoEntityBuilder_common_DateTimeRange();
}

uint64_t sub_B2870()
{
  return dispatch thunk of UsoEntityBuilder_common_PostalAddress.setPostalCode(value:)();
}

uint64_t sub_B2880()
{
  return dispatch thunk of UsoEntityBuilder_common_PostalAddress.setCountry(value:)();
}

uint64_t sub_B2890()
{
  return dispatch thunk of UsoEntityBuilder_common_PostalAddress.setProvince(value:)();
}

uint64_t sub_B28A0()
{
  return dispatch thunk of UsoEntityBuilder_common_PostalAddress.setCity(value:)();
}

uint64_t sub_B28B0()
{
  return dispatch thunk of UsoEntityBuilder_common_PostalAddress.setLabel(value:)();
}

uint64_t sub_B28C0()
{
  return dispatch thunk of UsoEntityBuilder_common_PostalAddress.setStreet(value:)();
}

uint64_t sub_B28D0()
{
  return UsoEntityBuilder_common_PostalAddress.init()();
}

uint64_t sub_B28E0()
{
  return type metadata accessor for UsoEntityBuilder_common_PostalAddress();
}

uint64_t sub_B2900()
{
  return UsoEntityBuilder_common_GeographicArea.init()();
}

uint64_t sub_B2920()
{
  return UsoTaskBuilder_summarise_common_DailyBriefing.init()();
}

uint64_t sub_B2930()
{
  return type metadata accessor for UsoTaskBuilder_summarise_common_DailyBriefing();
}

uint64_t sub_B2940()
{
  return UsoTask.verbString.getter();
}

uint64_t sub_B2950()
{
  return UsoTask.baseEntityAsString.getter();
}

uint64_t sub_B2960()
{
  return type metadata accessor for NLIntent();
}

uint64_t sub_B2970()
{
  return dispatch thunk of static CKKnowledgeStore.synchedKnowledgeStore(withName:)();
}

uint64_t sub_B2980()
{
  return type metadata accessor for CKKnowledgeStore();
}

uint64_t sub_B2990()
{
  return type metadata accessor for CKGenericCondition();
}

uint64_t sub_B29A0()
{
  return CKGenericCondition.init(_:value:negated:)();
}

uint64_t sub_B29B0()
{
  return type metadata accessor for DateTimeResolutionContext.Hemisphere();
}

uint64_t sub_B29C0()
{
  return DefinedDateTimeRangeStore.isDateInDefinedDateTimeRange(_:dateTimeRange:calendar:locale:hemisphere:overrides:)();
}

uint64_t sub_B29D0()
{
  return DefinedDateTimeRangeStore.init()();
}

uint64_t sub_B29E0()
{
  return type metadata accessor for DefinedDateTimeRangeStore();
}

uint64_t sub_B29F0()
{
  return type metadata accessor for DateTime.DateTimeRange.DefinedDateTimeRange();
}

uint64_t sub_B2A00()
{
  return type metadata accessor for DateTime();
}

uint64_t sub_B2A10()
{
  return SiriEnvironment.networkAvailability.getter();
}

uint64_t sub_B2A20()
{
  return static SiriEnvironment.default.getter();
}

uint64_t sub_B2A30()
{
  return type metadata accessor for SiriEnvironment();
}

uint64_t sub_B2A50()
{
  return type metadata accessor for TimeoutError();
}

uint64_t sub_B2A60()
{
  return NetworkAvailability.Status.description.getter();
}

uint64_t sub_B2A70()
{
  return static NetworkAvailability.Status.== infix(_:_:)();
}

uint64_t sub_B2A80()
{
  return type metadata accessor for NetworkAvailability.Status();
}

uint64_t sub_B2A90()
{
  return dispatch thunk of NetworkAvailability.status.getter();
}

uint64_t sub_B2AA0()
{
  return DialogTemperature.Builder.init()();
}

uint64_t sub_B2AB0()
{
  return type metadata accessor for DialogTemperature.Builder();
}

uint64_t sub_B2AC0()
{
  return type metadata accessor for DialogTemperature();
}

uint64_t sub_B2AD0()
{
  return dispatch thunk of DialogConvertibleMeasurement.Builder.build()();
}

uint64_t sub_B2AE0()
{
  return dispatch thunk of DialogConvertibleMeasurement.Builder.withUnits(_:)();
}

uint64_t sub_B2AF0()
{
  return dispatch thunk of DialogConvertibleMeasurement.Builder.withValue(_:)();
}

uint64_t sub_B2B00()
{
  return dispatch thunk of DialogCalendar.Builder.build()();
}

uint64_t sub_B2B10()
{
  return dispatch thunk of DialogCalendar.Builder.withSecs(_:)();
}

uint64_t sub_B2B20()
{
  return DialogCalendar.Builder.init()();
}

uint64_t sub_B2B30()
{
  return type metadata accessor for DialogCalendar.Builder();
}

uint64_t sub_B2B40()
{
  return type metadata accessor for DialogCalendar();
}

uint64_t sub_B2B50()
{
  return dispatch thunk of DialogDuration.Builder.build()();
}

uint64_t sub_B2B60()
{
  return dispatch thunk of DialogDuration.Builder.withSecs(_:)();
}

uint64_t sub_B2B70()
{
  return DialogDuration.Builder.init()();
}

uint64_t sub_B2B80()
{
  return type metadata accessor for DialogDuration.Builder();
}

uint64_t sub_B2B90()
{
  return type metadata accessor for DialogDuration();
}

uint64_t sub_B2BA0()
{
  return dispatch thunk of CATGlobals.toDictionary.getter();
}

uint64_t sub_B2BB0()
{
  return CATGlobals.__allocating_init()();
}

uint64_t sub_B2BC0()
{
  return type metadata accessor for CATGlobals();
}

uint64_t sub_B2BD0()
{
  return CATWrapper.init(templateDir:options:globals:)();
}

uint64_t sub_B2BE0()
{
  return CATWrapper.__allocating_init(options:globals:)();
}

uint64_t sub_B2BF0()
{
  return CATWrapper.deinit();
}

uint64_t sub_B2C10()
{
  return type metadata accessor for CATResponse();
}

uint64_t sub_B2C20()
{
  return SpeakableString.init(print:speak:)();
}

uint64_t sub_B2C30()
{
  return SpeakableString.print.getter();
}

uint64_t sub_B2C40()
{
  return type metadata accessor for SpeakableString();
}

uint64_t sub_B2C50()
{
  return CATWrapperSimple.init(templateDir:options:globals:)();
}

uint64_t sub_B2C60()
{
  return CATWrapperSimple.init(useResponseMode:options:)();
}

uint64_t sub_B2C70()
{
  return CATWrapperSimple.deinit();
}

uint64_t sub_B2C80()
{
  return dispatch thunk of CATType.toDictionary.getter();
}

uint64_t sub_B2C90()
{
  return CATType.toDictionary.getter();
}

uint64_t sub_B2CA0()
{
  return static CATOption.defaultMode.getter();
}

uint64_t sub_B2CB0()
{
  return type metadata accessor for CATOption();
}

uint64_t sub_B2CC0()
{
  return os_signpost(_:dso:log:name:signpostID:_:_:)();
}

uint64_t sub_B2CD0()
{
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t sub_B2CE0()
{
  return OSSignpostID.init(log:)();
}

uint64_t sub_B2CF0()
{
  return static OSSignpostID.exclusive.getter();
}

uint64_t sub_B2D00()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t sub_B2D10()
{
  return Logger.logObject.getter();
}

uint64_t sub_B2D20()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_B2D30()
{
  return type metadata accessor for Logger();
}

uint64_t sub_B2D40()
{
  return GroupIdentifier.init(id:seq:)();
}

uint64_t sub_B2D50()
{
  return type metadata accessor for GroupIdentifier();
}

uint64_t sub_B2D60()
{
  return RREntity.init<A>(id:appBundleId:usoEntity:intentEntity:group:)();
}

uint64_t sub_B2D70()
{
  return RREntity.init(id:appBundleId:usoEntity:dataType:data:group:)();
}

uint64_t sub_B2D80()
{
  return RREntity.group.setter();
}

uint64_t sub_B2D90()
{
  return type metadata accessor for RREntity();
}

uint64_t sub_B2DA0()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t sub_B2DB0()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_B2DC0()
{
  return static DispatchQoS.background.getter();
}

uint64_t sub_B2DD0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_B2DE0()
{
  return static DispatchQoS.userInitiated.getter();
}

uint64_t sub_B2DF0()
{
  return static DispatchQoS.default.getter();
}

uint64_t sub_B2E00()
{
  return static DispatchQoS.utility.getter();
}

uint64_t sub_B2E10()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_B2E20()
{
  return static DispatchTime.now()();
}

uint64_t sub_B2E30()
{
  return DispatchTime.distance(to:)();
}

uint64_t sub_B2E40()
{
  return DispatchTime.rawValue.getter();
}

uint64_t sub_B2E50()
{
  return type metadata accessor for DispatchTime();
}

NSDictionary sub_B2E60()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_B2E70()
{
  return static Dictionary._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_B2E80()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_B2E90()
{
  return Dictionary.description.getter();
}

uint64_t sub_B2EA0()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_B2EB0()
{
  return Dictionary.Keys.description.getter();
}

uint64_t sub_B2EC0()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_B2ED0()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_B2EE0()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t sub_B2EF0()
{
  return dispatch thunk of static Comparable.>= infix(_:_:)();
}

uint64_t sub_B2F00()
{
  return dispatch thunk of static Comparable.<= infix(_:_:)();
}

uint64_t sub_B2F10()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_B2F20()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_B2F30()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_B2F40()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_B2F50()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_B2F70()
{
  return String.init(data:encoding:)();
}

uint64_t sub_B2F80()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_B2F90()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_B2FA0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_B2FB0()
{
  return String.lowercased()()._countAndFlagsBits;
}

uint64_t sub_B2FC0()
{
  return String.uppercased()()._countAndFlagsBits;
}

uint64_t sub_B2FD0()
{
  return static String._fromSubstring(_:)();
}

uint64_t sub_B2FE0()
{
  return String.removeSubrange(_:)();
}

uint64_t sub_B2FF0()
{
  return String.hash(into:)();
}

uint64_t sub_B3000()
{
  return String.index(_:offsetBy:limitedBy:)();
}

uint64_t sub_B3010()
{
  return String.append<A>(contentsOf:)();
}

void sub_B3020(Swift::String a1)
{
}

Swift::Int sub_B3030()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_B3040()
{
  return String.init<A>(_:)();
}

uint64_t sub_B3050()
{
  return String.subscript.getter();
}

uint64_t sub_B3060()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_B3070()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_B3080()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_B3090()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_B30A0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_B30B0()
{
  return Array.description.getter();
}

uint64_t sub_B30C0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_B30D0()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_B30E0()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_B30F0()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_B3100()
{
  return static Bool._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_B3110()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_B3120()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t sub_B3130()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_B3150()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_B3160()
{
  return type metadata accessor for TaskPriority();
}

void sub_B3180()
{
}

uint64_t sub_B31A0()
{
  return static Task<>.checkCancellation()();
}

void sub_B31E0()
{
}

uint64_t sub_B31F0()
{
  return Double.write<A>(to:)();
}

NSSet sub_B3200()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_B3210()
{
  return Set.description.getter();
}

uint64_t sub_B3220()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_B3230()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t sub_B3240()
{
  return dispatch thunk of Collection.count.getter();
}

uint64_t sub_B3250()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t sub_B3260()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t sub_B3270()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t sub_B3280()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_B3290()
{
  return static OS_dispatch_queue.Attributes.concurrent.getter();
}

uint64_t sub_B32A0()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_B32B0()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_B32C0()
{
  return OS_dispatch_queue.sync<A>(execute:)();
}

uint64_t sub_B32D0()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_B32E0()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_B32F0()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t sub_B3300()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t sub_B3310()
{
  return static os_signpost_type_t.event.getter();
}

uint64_t sub_B3320()
{
  return NSNotificationCenter.Notifications.makeAsyncIterator()();
}

uint64_t sub_B3330()
{
  return type metadata accessor for NSNotificationCenter.Notifications.Iterator();
}

uint64_t sub_B3340()
{
  return NSNotificationCenter.notifications(named:object:)();
}

NSNumber sub_B3350(Swift::Int integerLiteral)
{
  return NSNumber.init(integerLiteral:)(integerLiteral);
}

uint64_t sub_B3360()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_B3370()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_B3380()
{
  return type metadata accessor for Optional();
}

uint64_t sub_B3390()
{
  return Substring.uppercased()()._countAndFlagsBits;
}

uint64_t sub_B33A0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_B33B0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_B33C0()
{
  return StringProtocol.components(separatedBy:)();
}

uint64_t sub_B33D0()
{
  return StringProtocol.trimmingCharacters(in:)();
}

uint64_t sub_B33E0()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t sub_B33F0()
{
  return StringProtocol.removingPercentEncoding.getter();
}

uint64_t sub_B3410()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t sub_B3420()
{
  return StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)();
}

uint64_t sub_B3430()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_B3440()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_B3450()
{
  return _HashTable.occupiedBucket(after:)();
}

Swift::Int sub_B3460(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_B3470()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_B3480()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_B3490()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_B34A0()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

void sub_B34C0(Swift::Int a1)
{
}

uint64_t sub_B34D0()
{
  return _StringGuts.copyUTF8(into:)();
}

void sub_B34E0(Swift::Int a1)
{
}

uint64_t sub_B34F0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_B3500()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_B3510()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_B3530()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_B3540()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_B3550()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_B3560()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_B3570()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_B3580()
{
  return static ContinuousClock.Instant.now.getter();
}

uint64_t sub_B3590()
{
  return ContinuousClock.Instant.advanced(by:)();
}

uint64_t sub_B35A0()
{
  return type metadata accessor for ContinuousClock.Instant();
}

uint64_t sub_B35B0()
{
  return type metadata accessor for ContinuousClock();
}

uint64_t sub_B35C0()
{
  return _print_unlocked<A, B>(_:_:)();
}

BOOL sub_B35D0(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

void sub_B35E0()
{
}

uint64_t sub_B35F0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_B3600()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_B3610()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_B3620()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_B3630()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t sub_B3640()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_B3650()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_B3660()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_B3680(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_B36A0()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_B36C0()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_B36D0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_B36E0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_B36F0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_B3710()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_B3720()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_B3740()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_B3750()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_B3760()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_B3770()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_B3790()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

Swift::Int sub_B37B0(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_B37C0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_B37E0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_B37F0()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t sub_B3800()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t sub_B3810()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t sub_B3830()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_B3840()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_B3850()
{
  return static Clock<>.continuous.getter();
}

uint64_t sub_B3860()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_B3870()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_B3880()
{
  return Error._code.getter();
}

uint64_t sub_B3890()
{
  return Error._domain.getter();
}

uint64_t sub_B38A0()
{
  return Error._userInfo.getter();
}

uint64_t sub_B38B0()
{
  return Hasher.init(_seed:)();
}

void sub_B38C0(Swift::UInt a1)
{
}

void sub_B38D0(Swift::UInt32 a1)
{
}

Swift::Int sub_B38E0()
{
  return Hasher._finalize()();
}

uint64_t sub_B38F0()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_B3900()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t GEOGetUserTransportTypePreference()
{
  return _GEOGetUserTransportTypePreference();
}

uint64_t GEOTransportTypeFromGEOTransportTypePreference()
{
  return _GEOTransportTypeFromGEOTransportTypePreference();
}

uint64_t INIntentResponseCreate()
{
  return _INIntentResponseCreate();
}

uint64_t MapsSuggestionsMostRecentLocation()
{
  return _MapsSuggestionsMostRecentLocation();
}

uint64_t MapsSuggestionsSetMostRecentLocation()
{
  return _MapsSuggestionsSetMostRecentLocation();
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_asyncLet_begin()
{
  return _swift_asyncLet_begin();
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

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
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

uint64_t swift_isClassType()
{
  return _swift_isClassType();
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

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
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

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
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

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

uint64_t swift_willThrowTypedImpl()
{
  return _swift_willThrowTypedImpl();
}