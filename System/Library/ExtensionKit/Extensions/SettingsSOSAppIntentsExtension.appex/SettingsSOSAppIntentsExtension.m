unint64_t sub_100004BA8(char a1)
{
  unint64_t result;

  result = 47;
  switch(a1)
  {
    case 1:
      result = 0xD000000000000016;
      break;
    case 2:
      result = 0xD000000000000017;
      break;
    case 3:
    case 4:
      result = 0xD000000000000013;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_100004C4C(char a1)
{
  unint64_t result = 47;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000016;
      break;
    case 2:
      unint64_t result = 0xD000000000000017;
      break;
    case 3:
    case 4:
      unint64_t result = 0xD000000000000013;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100004CF0(char a1, char a2)
{
  unint64_t v3 = 0xE100000000000000;
  unint64_t v4 = 47;
  switch(a1)
  {
    case 1:
      unint64_t v4 = 0xD000000000000016;
      v5 = "#CALL_WITH_SIDE_BUTTON";
      goto LABEL_4;
    case 2:
      unint64_t v4 = 0xD000000000000017;
      v5 = "#CALL_WITH_FIVE_PRESSES";
LABEL_4:
      unint64_t v3 = (unint64_t)(v5 - 32) | 0x8000000000000000;
      break;
    case 3:
      v6 = "#ALARM_SOUND_SWITCH";
      goto LABEL_7;
    case 4:
      v6 = "#EMERGENCY_CONTACTS";
LABEL_7:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      unint64_t v4 = 0xD000000000000013;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xE100000000000000;
  unint64_t v8 = 47;
  switch(a2)
  {
    case 1:
      unint64_t v8 = 0xD000000000000016;
      v9 = "#CALL_WITH_SIDE_BUTTON";
      goto LABEL_11;
    case 2:
      unint64_t v8 = 0xD000000000000017;
      v9 = "#CALL_WITH_FIVE_PRESSES";
LABEL_11:
      unint64_t v7 = (unint64_t)(v9 - 32) | 0x8000000000000000;
      goto LABEL_12;
    case 3:
      v10 = "#ALARM_SOUND_SWITCH";
      goto LABEL_16;
    case 4:
      v10 = "#EMERGENCY_CONTACTS";
LABEL_16:
      unint64_t v7 = (unint64_t)(v10 - 32) | 0x8000000000000000;
      if (v4 == 0xD000000000000013) {
        goto LABEL_17;
      }
      goto LABEL_19;
    default:
LABEL_12:
      if (v4 != v8) {
        goto LABEL_19;
      }
LABEL_17:
      if (v3 == v7) {
        char v11 = 1;
      }
      else {
LABEL_19:
      }
        char v11 = sub_10000A250();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v11 & 1;
  }
}

uint64_t sub_100004E84(char *a1, char *a2)
{
  return sub_100004CF0(*a1, *a2);
}

unint64_t sub_100004E94()
{
  unint64_t result = qword_100010050;
  if (!qword_100010050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010050);
  }
  return result;
}

Swift::Int sub_100004EE8()
{
  return sub_100004EF0();
}

Swift::Int sub_100004EF0()
{
  return sub_10000A270();
}

uint64_t sub_100004FDC()
{
  return sub_100004FE4();
}

uint64_t sub_100004FE4()
{
  sub_10000A230();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000050BC()
{
  return sub_1000050C4();
}

Swift::Int sub_1000050C4()
{
  return sub_10000A270();
}

uint64_t sub_1000051AC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100008370(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_1000051DC@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_100004C4C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100005208()
{
  return sub_100007510(&qword_100010058, &qword_100010060);
}

uint64_t sub_100005244(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_10000528C(void *a1@<X8>)
{
  *a1 = &off_10000C988;
}

unint64_t sub_10000529C()
{
  return sub_100004BA8(*v0);
}

uint64_t sub_1000052A4@<X0>(uint64_t a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = sub_100008370(a1, a2);
  *a3 = result;
  return result;
}

unint64_t sub_1000052F0()
{
  unint64_t result = qword_100010068;
  if (!qword_100010068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010068);
  }
  return result;
}

unint64_t sub_100005348()
{
  unint64_t result = qword_100010070;
  if (!qword_100010070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010070);
  }
  return result;
}

unint64_t sub_1000053A0()
{
  unint64_t result = qword_100010078[0];
  if (!qword_100010078[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100010078);
  }
  return result;
}

uint64_t sub_1000053F4()
{
  sub_100008F44(&qword_100010170);
  __chkstk_darwin();
  v1 = (char *)v9 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9[0] = sub_10000A1B0();
  uint64_t v2 = *(void *)(v9[0] - 8);
  __chkstk_darwin();
  unint64_t v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000A1F0();
  __chkstk_darwin();
  sub_10000A220();
  __chkstk_darwin();
  uint64_t v5 = sub_10000A1C0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v7 = sub_10000A180();
  sub_1000090BC(v7, qword_100010230);
  sub_100009084(v7, (uint64_t)qword_100010230);
  sub_10000A210();
  sub_10000A1E0();
  (*(void (**)(char *, void, void))(v2 + 104))(v4, enum case for LocalizedStringResource.BundleDescription.main(_:), v9[0]);
  sub_10000A1D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v1, 1, 1, v5);
  return sub_10000A170();
}

uint64_t sub_1000056D0(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_1000101E0 + dword_1000101E0);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100005778;
  return v5(a1);
}

uint64_t sub_100005778(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_100005878(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_1000101D8 + dword_1000101D8);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100009138;
  return v4();
}

unint64_t sub_100005920()
{
  unint64_t result = qword_100010090;
  if (!qword_100010090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010090);
  }
  return result;
}

uint64_t sub_100005974(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_1000101C8 + dword_1000101C8);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100005A18;
  return v4();
}

uint64_t sub_100005A18(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (!v1) {
    **(void **)(v4 + 16) = a1;
  }
  uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
  return v6();
}

unint64_t sub_100005B30()
{
  unint64_t result = qword_1000100A0;
  if (!qword_1000100A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100A0);
  }
  return result;
}

unint64_t sub_100005B88()
{
  unint64_t result = qword_1000100A8;
  if (!qword_1000100A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100A8);
  }
  return result;
}

unint64_t sub_100005BE0()
{
  unint64_t result = qword_1000100B0;
  if (!qword_1000100B0)
  {
    sub_100005244(qword_1000100B8);
    sub_100005B88();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100B0);
  }
  return result;
}

uint64_t sub_100005C54(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100005920();
  void *v5 = v2;
  v5[1] = sub_100005D08;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100005D08()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100005DFC(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_1000101B8 + dword_1000101B8);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100005EA0;
  return v4();
}

uint64_t sub_100005EA0(char a1)
{
  uint64_t v3 = *(unsigned char **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  *uint64_t v3 = a1;
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

unint64_t sub_100005FBC()
{
  unint64_t result = qword_1000100D0;
  if (!qword_1000100D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100D0);
  }
  return result;
}

uint64_t sub_100006010@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v51 = a2;
  sub_100008F44(&qword_100010198);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v4 = (char *)v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008F44(&qword_100010170);
  ((void (*)(void))__chkstk_darwin)();
  v52 = (char *)v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000A1B0();
  uint64_t v7 = *(void *)(v6 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v9 = (char *)v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000A1F0();
  ((void (*)(void))__chkstk_darwin)();
  sub_10000A220();
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v10 = sub_10000A1C0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = ((uint64_t (*)(void))__chkstk_darwin)();
  v50 = (char *)v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  switch(a1)
  {
    case 1:
      v49 = (char *)v43 - v14;
      sub_10000A1A0();
      sub_10000A210();
      sub_10000A1E0();
      unsigned int v48 = enum case for LocalizedStringResource.BundleDescription.main(_:);
      v47 = *(void (**)(char *))(v7 + 104);
      v47(v9);
      unint64_t v46 = 0x800000010000AD30;
      v34 = v52;
      sub_10000A1D0();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v34, 0, 1, v10);
      sub_10000A090();
      uint64_t v35 = sub_10000A0A0();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v4, 0, 1, v35);
      sub_100008F44(&qword_1000101A0);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_10000A420;
      sub_10000A210();
      sub_10000A1E0();
      ((void (*)(char *, void, uint64_t))v47)(v9, v48, v6);
      sub_10000A1D0();
      goto LABEL_6;
    case 2:
      sub_10000A1A0();
      sub_10000A210();
      sub_10000A1E0();
      (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for LocalizedStringResource.BundleDescription.main(_:), v6);
      v36 = v52;
      sub_10000A1D0();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v36, 0, 1, v10);
      sub_10000A090();
      uint64_t v37 = sub_10000A0A0();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v4, 0, 1, v37);
      sub_10000A1A0();
      break;
    case 3:
      v49 = (char *)v43 - v14;
      sub_10000A1A0();
      sub_10000A210();
      sub_10000A1E0();
      unsigned int v48 = enum case for LocalizedStringResource.BundleDescription.main(_:);
      v47 = *(void (**)(char *))(v7 + 104);
      v47(v9);
      v38 = v52;
      sub_10000A1D0();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v38, 0, 1, v10);
      sub_10000A090();
      uint64_t v39 = sub_10000A0A0();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v4, 0, 1, v39);
      sub_100008F44(&qword_1000101A0);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_10000A420;
      sub_10000A210();
      sub_10000A1E0();
      ((void (*)(char *, void, uint64_t))v47)(v9, v48, v6);
      sub_10000A1D0();
LABEL_6:
      sub_10000A1A0();
      break;
    case 4:
      v49 = (char *)v43 - v14;
      sub_10000A1A0();
      sub_10000A210();
      sub_10000A1E0();
      (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for LocalizedStringResource.BundleDescription.main(_:), v6);
      v40 = v52;
      sub_10000A1D0();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v40, 0, 1, v10);
      sub_10000A090();
      uint64_t v41 = sub_10000A0A0();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v4, 0, 1, v41);
      sub_10000A1A0();
      break;
    default:
      v49 = (char *)v43 - v14;
      sub_10000A210();
      sub_10000A1E0();
      unsigned int v48 = enum case for LocalizedStringResource.BundleDescription.main(_:);
      v47 = *(void (**)(char *))(v7 + 104);
      v47(v9);
      uint64_t v45 = v7 + 104;
      unint64_t v46 = 0x800000010000AD30;
      sub_10000A1D0();
      v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
      uint64_t v15 = v11 + 56;
      v16(v52, 1, 1, v10);
      v43[3] = v4;
      sub_10000A090();
      uint64_t v17 = sub_10000A0A0();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v4, 0, 1, v17);
      sub_100008F44(&qword_1000101A0);
      unint64_t v18 = (*(unsigned __int8 *)(v15 + 24) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 24);
      uint64_t v19 = 8 * *(void *)(v15 + 16);
      uint64_t v20 = *(void *)(v15 + 16);
      v43[4] = v19;
      uint64_t v21 = swift_allocObject();
      v43[5] = v21;
      *(_OWORD *)(v21 + 16) = xmmword_10000A430;
      unint64_t v22 = v21 + v18;
      sub_10000A210();
      sub_10000A1E0();
      uint64_t v23 = v48;
      uint64_t v24 = v6;
      uint64_t v25 = v6;
      v26 = (void (*)(char *, uint64_t, uint64_t))v47;
      ((void (*)(char *, void, uint64_t))v47)(v9, v48, v24);
      sub_10000A1D0();
      v43[6] = v20;
      sub_10000A210();
      sub_10000A1E0();
      v26(v9, v23, v25);
      sub_10000A1D0();
      v43[1] = v22 + 2 * v20;
      sub_10000A210();
      sub_10000A1E0();
      v26(v9, v23, v25);
      v27 = v26;
      sub_10000A1D0();
      v43[2] = v22;
      sub_10000A210();
      sub_10000A1E0();
      uint64_t v28 = v48;
      uint64_t v44 = v25;
      v27(v9, v48, v25);
      sub_10000A1D0();
      sub_10000A210();
      sub_10000A1E0();
      v29 = v47;
      ((void (*)(char *, uint64_t, uint64_t))v47)(v9, v28, v25);
      sub_10000A1D0();
      sub_10000A210();
      sub_10000A1E0();
      uint64_t v30 = v48;
      uint64_t v31 = v44;
      ((void (*)(char *, void, uint64_t))v29)(v9, v48, v44);
      sub_10000A1D0();
      sub_10000A210();
      sub_10000A1E0();
      uint64_t v32 = v30;
      v33 = v47;
      ((void (*)(char *, uint64_t, uint64_t))v47)(v9, v32, v31);
      sub_10000A1D0();
      sub_10000A210();
      sub_10000A1E0();
      ((void (*)(char *, void, uint64_t))v33)(v9, v48, v44);
      sub_10000A1D0();
      sub_10000A1A0();
      break;
  }
  return sub_10000A0B0();
}

uint64_t sub_100006F48()
{
  uint64_t v0 = sub_100008F44(&qword_1000101A8);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008F44(&qword_1000101B0);
  __chkstk_darwin();
  sub_1000053A0();
  sub_10000A130();
  v6._object = (void *)0x800000010000B180;
  v6._countAndFlagsBits = 0xD00000000000002CLL;
  sub_10000A120(v6);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for EntityURLRepresentation.StringInterpolation.Token.id<A>(_:), v0);
  sub_10000A110();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v7._countAndFlagsBits = 0;
  v7._object = (void *)0xE000000000000000;
  sub_10000A120(v7);
  return sub_10000A140();
}

uint64_t sub_100007104()
{
  uint64_t v0 = qword_100010020;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100007140()
{
  unint64_t result = qword_1000100D8;
  if (!qword_1000100D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100D8);
  }
  return result;
}

unint64_t sub_100007198()
{
  unint64_t result = qword_1000100E0;
  if (!qword_1000100E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100E0);
  }
  return result;
}

unint64_t sub_1000071F0()
{
  unint64_t result = qword_1000100E8;
  if (!qword_1000100E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100E8);
  }
  return result;
}

unint64_t sub_100007248()
{
  unint64_t result = qword_1000100F0;
  if (!qword_1000100F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100F0);
  }
  return result;
}

uint64_t sub_10000729C()
{
  sub_100009030();
  uint64_t v2 = sub_10000A0E0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100009120(v3, v0, v2, v1);
}

unint64_t sub_100007334()
{
  unint64_t result = qword_100010100;
  if (!qword_100010100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010100);
  }
  return result;
}

unint64_t sub_10000738C()
{
  unint64_t result = qword_100010108;
  if (!qword_100010108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010108);
  }
  return result;
}

unint64_t sub_1000073E4()
{
  unint64_t result = qword_100010110;
  if (!qword_100010110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010110);
  }
  return result;
}

unint64_t sub_10000743C()
{
  unint64_t result = qword_100010118;
  if (!qword_100010118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010118);
  }
  return result;
}

void sub_100007490(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_10000749C@<X0>(uint64_t a1@<X8>)
{
  return sub_100007C74(&qword_100010030, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100010230, a1);
}

uint64_t sub_1000074D4()
{
  return sub_100007510(&qword_100010120, &qword_100010128);
}

uint64_t sub_100007510(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005244(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100007554(uint64_t a1)
{
  unint64_t v2 = sub_1000053A0();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000075A4()
{
  unint64_t result = qword_100010130;
  if (!qword_100010130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010130);
  }
  return result;
}

uint64_t sub_1000075F8@<X0>(uint64_t a1@<X8>)
{
  return sub_100006010(*v1, a1);
}

uint64_t sub_100007600(uint64_t a1)
{
  unint64_t v2 = sub_1000073E4();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100007650()
{
  unint64_t result = qword_100010138;
  if (!qword_100010138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010138);
  }
  return result;
}

uint64_t sub_1000076A4()
{
  uint64_t v0 = sub_10000A1B0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000A1F0();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_10000A220();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_10000A1C0();
  sub_1000090BC(v6, qword_100010248);
  sub_100009084(v6, (uint64_t)qword_100010248);
  sub_10000A210();
  sub_10000A1E0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_10000A1D0();
}

uint64_t sub_100007894()
{
  sub_100009F00();
  return v1;
}

uint64_t sub_1000078C8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100009F00();
  *a1 = v3;
  return result;
}

uint64_t sub_100007904()
{
  return sub_100009F10();
}

void (*sub_10000793C(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100009EF0();
  return sub_100007998;
}

void sub_100007998(void *a1)
{
  unsigned __int8 v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_1000079E8()
{
  unint64_t result = qword_100010140;
  if (!qword_100010140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010140);
  }
  return result;
}

uint64_t sub_100007A3C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100008F88();
  unint64_t v5 = sub_100009030();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_100007AA8()
{
  uint64_t v0 = qword_100010040;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100007AE8()
{
  unint64_t result = qword_100010148;
  if (!qword_100010148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010148);
  }
  return result;
}

unint64_t sub_100007B40()
{
  unint64_t result = qword_100010150;
  if (!qword_100010150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010150);
  }
  return result;
}

unint64_t sub_100007B98()
{
  unint64_t result = qword_100010158;
  if (!qword_100010158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010158);
  }
  return result;
}

uint64_t sub_100007BEC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100007C3C@<X0>(uint64_t a1@<X8>)
{
  return sub_100007C74(&qword_100010038, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100010248, a1);
}

uint64_t sub_100007C74@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100009084(v7, a3);
  v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100007D18()
{
  return 0;
}

uint64_t sub_100007D24()
{
  return 1;
}

uint64_t sub_100007D34(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100008F88();
  unint64_t v6 = sub_100008FDC();
  unint64_t v7 = sub_100009030();
  *unint64_t v4 = v2;
  v4[1] = sub_100007E00;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_100007E00()
{
  uint64_t v2 = *v1;
  uint64_t result = swift_task_dealloc();
  if (v0)
  {
    unint64_t v4 = *(uint64_t (**)(void))(v2 + 8);
    return v4();
  }
  return result;
}

uint64_t sub_100007F08@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100008AE4();
  *a1 = result;
  return result;
}

uint64_t sub_100007F30(uint64_t a1)
{
  unint64_t v2 = sub_1000079E8();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenSettingsSOSDeepLinks()
{
  return &type metadata for OpenSettingsSOSDeepLinks;
}

unsigned char *initializeBufferWithCopyOfBuffer for SOSSettingDestination(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for SOSSettingsDeepLink()
{
  return &type metadata for SOSSettingsDeepLink;
}

ValueMetadata *type metadata accessor for SOSSettingsDeepLink.AvailableSOSDestinationQuery()
{
  return &type metadata for SOSSettingsDeepLink.AvailableSOSDestinationQuery;
}

uint64_t _s30SettingsSOSAppIntentsExtension21SOSSettingDestinationOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s30SettingsSOSAppIntentsExtension21SOSSettingDestinationOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x100008110);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_100008138(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100008140(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SOSSettingDestination()
{
  return &type metadata for SOSSettingDestination;
}

char *sub_100008158(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_100008198(a1, a2, a3, *v3);
  *int v3 = result;
  return result;
}

char *sub_100008178(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_100008284(a1, a2, a3, *v3);
  *int v3 = result;
  return result;
}

char *sub_100008198(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100008F44(&qword_1000101D0);
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
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_release();
  return v10;
}

char *sub_100008284(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100008F44(&qword_1000101C0);
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
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_release();
  return v10;
}

uint64_t sub_100008370(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_10000C8F0;
  v6._object = a2;
  unint64_t v4 = sub_10000A240(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 5) {
    return 5;
  }
  else {
    return v4;
  }
}

uint64_t sub_1000083BC()
{
  return _swift_task_switch(sub_1000083D8, 0, 0);
}

uint64_t sub_1000083D8()
{
  sub_100008518((uint64_t)&off_10000C9B0);
  uint64_t v2 = v1;
  int64_t v3 = *(void *)(v1 + 16);
  if (v3)
  {
    sub_100008158(0, v3, 0);
    uint64_t v4 = 0;
    uint64_t v5 = *((void *)&_swiftEmptyArrayStorage + 2);
    do
    {
      char v6 = *(unsigned char *)(v2 + v4 + 32);
      unint64_t v7 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v5 + v4 >= v7 >> 1) {
        sub_100008158((char *)(v7 > 1), v5 + v4 + 1, 1);
      }
      *((void *)&_swiftEmptyArrayStorage + 2) = v5 + v4 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage + v5 + v4++ + 32) = v6;
    }
    while (v3 != v4);
  }
  swift_bridgeObjectRelease();
  int64_t v8 = *(uint64_t (**)(void *))(v0 + 8);
  return v8(&_swiftEmptyArrayStorage);
}

void sub_100008518(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    unint64_t v2 = 0;
    uint64_t v3 = a1 + 32;
    uint64_t v4 = &_swiftEmptyArrayStorage;
    uint64_t v16 = a1 + 32;
    unint64_t v17 = *(void *)(a1 + 16);
    do
    {
      unint64_t v18 = v4;
      uint64_t v5 = 0;
      if (v2 <= v1) {
        unint64_t v6 = v1;
      }
      else {
        unint64_t v6 = v2;
      }
      unint64_t v7 = v2 - v6;
      while (1)
      {
        if (!(v7 + v5))
        {
          __break(1u);
          return;
        }
        int v8 = *(unsigned __int8 *)(v3 + v2);
        id v9 = [self currentDevice];
        id v10 = [v9 userInterfaceIdiom];

        if (v8 == 3) {
          break;
        }
        if (!v10) {
          goto LABEL_14;
        }
LABEL_8:
        ++v5;
        ++v3;
        if (v2 == --v1) {
          return;
        }
      }
      if (v10) {
        goto LABEL_8;
      }
      size_t v11 = self;
      if (([v11 isCallWithVolumeLockHoldEnabled] & 1) == 0
        && ![v11 isCallWithSideButtonPressesEnabled])
      {
        goto LABEL_8;
      }
LABEL_14:
      uint64_t v4 = v18;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100008178(0, v18[2] + 1, 1);
        uint64_t v4 = v18;
      }
      uint64_t v3 = v16;
      unint64_t v13 = v4[2];
      unint64_t v12 = v4[3];
      if (v13 >= v12 >> 1)
      {
        sub_100008178((char *)(v12 > 1), v13 + 1, 1);
        uint64_t v4 = v18;
      }
      unint64_t v14 = v2 + 1;
      v2 += 1 + v5;
      v4[2] = v13 + 1;
      *((unsigned char *)v4 + v13 + 32) = v8;
      BOOL v15 = v14 == v1;
      unint64_t v1 = v17;
    }
    while (!v15);
  }
}

uint64_t sub_1000086D4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_1000086F4, 0, 0);
}

uint64_t sub_1000086F4()
{
  uint64_t v1 = swift_bridgeObjectRetain();
  sub_100008518(v1);
  uint64_t v3 = v2;
  swift_bridgeObjectRelease();
  int64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    sub_100008158(0, v4, 0);
    uint64_t v5 = 0;
    uint64_t v6 = *((void *)&_swiftEmptyArrayStorage + 2);
    do
    {
      char v7 = *(unsigned char *)(v3 + v5 + 32);
      unint64_t v8 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v6 + v5 >= v8 >> 1) {
        sub_100008158((char *)(v8 > 1), v6 + v5 + 1, 1);
      }
      *((void *)&_swiftEmptyArrayStorage + 2) = v6 + v5 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage + v6 + v5++ + 32) = v7;
    }
    while (v4 != v5);
  }
  swift_bridgeObjectRelease();
  id v9 = *(uint64_t (**)(void *))(v0 + 8);
  return v9(&_swiftEmptyArrayStorage);
}

uint64_t sub_100008840()
{
  return _swift_task_switch(sub_10000885C, 0, 0);
}

uint64_t sub_10000885C()
{
  sub_100008518((uint64_t)&off_10000C9D8);
  if (*(void *)(v1 + 16)) {
    uint64_t v2 = *(unsigned __int8 *)(v1 + 32);
  }
  else {
    uint64_t v2 = 5;
  }
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_1000088E8()
{
  return _swift_task_switch(sub_100008904, 0, 0);
}

uint64_t sub_100008904()
{
  sub_100008158(0, 5, 0);
  unint64_t v2 = *((void *)&_swiftEmptyArrayStorage + 2);
  unint64_t v1 = *((void *)&_swiftEmptyArrayStorage + 3);
  int64_t v3 = v1 >> 1;
  unint64_t v4 = v2 + 1;
  if (v1 >> 1 <= v2)
  {
    sub_100008158((char *)(v1 > 1), v2 + 1, 1);
    unint64_t v1 = *((void *)&_swiftEmptyArrayStorage + 3);
    int64_t v3 = v1 >> 1;
  }
  *((void *)&_swiftEmptyArrayStorage + 2) = v4;
  *((unsigned char *)&_swiftEmptyArrayStorage + v2 + 32) = 0;
  unint64_t v5 = v2 + 2;
  if (v3 < (uint64_t)(v2 + 2))
  {
    sub_100008158((char *)(v1 > 1), v2 + 2, 1);
    unint64_t v1 = *((void *)&_swiftEmptyArrayStorage + 3);
    int64_t v3 = v1 >> 1;
  }
  *((void *)&_swiftEmptyArrayStorage + 2) = v5;
  *((unsigned char *)&_swiftEmptyArrayStorage + v4 + 32) = 1;
  unint64_t v6 = v2 + 3;
  if (v3 < (uint64_t)(v2 + 3)) {
    sub_100008158((char *)(v1 > 1), v2 + 3, 1);
  }
  *((void *)&_swiftEmptyArrayStorage + 2) = v6;
  *((unsigned char *)&_swiftEmptyArrayStorage + v5 + 32) = 2;
  unint64_t v7 = *((void *)&_swiftEmptyArrayStorage + 3);
  int64_t v8 = v7 >> 1;
  unint64_t v9 = v2 + 4;
  if ((uint64_t)(v7 >> 1) < (uint64_t)(v2 + 4))
  {
    sub_100008158((char *)(v7 > 1), v2 + 4, 1);
    unint64_t v7 = *((void *)&_swiftEmptyArrayStorage + 3);
    int64_t v8 = v7 >> 1;
  }
  *((void *)&_swiftEmptyArrayStorage + 2) = v9;
  *((unsigned char *)&_swiftEmptyArrayStorage + v6 + 32) = 3;
  if (v8 < (uint64_t)(v2 + 5)) {
    sub_100008158((char *)(v7 > 1), v2 + 5, 1);
  }
  *((void *)&_swiftEmptyArrayStorage + 2) = v2 + 5;
  *((unsigned char *)&_swiftEmptyArrayStorage + v9 + 32) = 4;
  id v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_100008AE4()
{
  uint64_t v0 = sub_10000A150();
  uint64_t v24 = *(void *)(v0 - 8);
  uint64_t v25 = v0;
  __chkstk_darwin(v0);
  uint64_t v23 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100008F44(&qword_100010168);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  unint64_t v22 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  unint64_t v6 = (char *)&v21 - v5;
  uint64_t v7 = sub_100008F44(&qword_100010170);
  __chkstk_darwin(v7 - 8);
  unint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10000A1B0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  unint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10000A1F0();
  __chkstk_darwin(v14 - 8);
  uint64_t v15 = sub_10000A220();
  __chkstk_darwin(v15 - 8);
  uint64_t v16 = sub_10000A1C0();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v21 = sub_100008F44(&qword_100010178);
  sub_10000A210();
  sub_10000A1E0();
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for LocalizedStringResource.BundleDescription.main(_:), v10);
  sub_10000A1D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v9, 1, 1, v16);
  char v26 = 5;
  uint64_t v18 = sub_100009EE0();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v6, 1, 1, v18);
  v19(v22, 1, 1, v18);
  (*(void (**)(char *, void, uint64_t))(v24 + 104))(v23, enum case for InputConnectionBehavior.default(_:), v25);
  sub_1000053A0();
  return sub_100009F20();
}

uint64_t sub_100008F44(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100008F88()
{
  unint64_t result = qword_100010180;
  if (!qword_100010180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010180);
  }
  return result;
}

unint64_t sub_100008FDC()
{
  unint64_t result = qword_100010188;
  if (!qword_100010188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010188);
  }
  return result;
}

unint64_t sub_100009030()
{
  unint64_t result = qword_100010190;
  if (!qword_100010190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010190);
  }
  return result;
}

uint64_t sub_100009084(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_1000090BC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100009120(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_10000913C()
{
  uint64_t v0 = sub_100008F44(&qword_100010208);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000079E8();
  sub_10000A000();
  uint64_t v4 = sub_100009F90();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  sub_10000A000();
  uint64_t v6 = sub_100009F90();
  v5(v3, v0);
  sub_10000A000();
  uint64_t v7 = sub_100009F90();
  v5(v3, v0);
  sub_10000A000();
  uint64_t v8 = sub_100009F90();
  v5(v3, v0);
  sub_100008F44(&qword_100010218);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_10000AB60;
  *(void *)(v9 + 32) = v4;
  *(void *)(v9 + 40) = v6;
  *(void *)(v9 + 48) = v7;
  *(void *)(v9 + 56) = v8;
  uint64_t v10 = sub_100009F80();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_100009398()
{
  return sub_100009620();
}

uint64_t sub_1000093B0()
{
  return sub_100009884();
}

uint64_t sub_1000093D4()
{
  uint64_t v0 = sub_100008F44(&qword_100010208);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100008F44(&qword_100010210);
  __chkstk_darwin(v4);
  sub_1000079E8();
  sub_10000A030();
  v10._countAndFlagsBits = 0x206E65704FLL;
  v10._object = (void *)0xE500000000000000;
  sub_10000A020(v10);
  swift_getKeyPath();
  sub_100005B88();
  sub_100009F70();
  swift_release();
  sub_10000A010();
  swift_release();
  v11._countAndFlagsBits = 0;
  v11._object = (void *)0xE000000000000000;
  sub_10000A020(v11);
  sub_10000A040();
  uint64_t v5 = sub_100009F90();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100008F44(&qword_100010218);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10000A420;
  *(void *)(v6 + 32) = v5;
  uint64_t v7 = sub_100009F80();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_100009608()
{
  return sub_100009620();
}

uint64_t sub_100009620()
{
  uint64_t v0 = sub_100009FF0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100005B88();
  sub_100009F70();
  swift_release();
  sub_1000079E8();
  sub_100009FE0();
  uint64_t v4 = sub_100009FD0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100008F44(&qword_100010200);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10000A420;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100009FC0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_10000977C()
{
  uint64_t v0 = sub_100009FB0();
  uint64_t v1 = sub_100009FB0();
  uint64_t v2 = sub_100009FB0();
  uint64_t v3 = sub_100009FB0();
  sub_100008F44(&qword_1000101F0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10000AB60;
  *(void *)(v4 + 32) = v0;
  *(void *)(v4 + 40) = v1;
  *(void *)(v4 + 48) = v2;
  *(void *)(v4 + 56) = v3;
  uint64_t v5 = sub_100009FA0();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100009868()
{
  return sub_100009884();
}

uint64_t sub_100009884()
{
  uint64_t v0 = sub_100009FB0();
  sub_100008F44(&qword_1000101F0);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_10000A420;
  *(void *)(v1 + 32) = v0;
  uint64_t v2 = sub_100009FA0();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_1000098F0()
{
  uint64_t v0 = sub_100009F60();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000079E8();
  sub_100009F50();
  uint64_t v4 = sub_100009F40();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100008F44(&qword_1000101E8);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10000A420;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100009F30();
  swift_bridgeObjectRelease();
  return v6;
}

ValueMetadata *type metadata accessor for SettingsSOSAssistantIntents()
{
  return &type metadata for SettingsSOSAssistantIntents;
}

uint64_t sub_100009A38()
{
  uint64_t v0 = sub_10000A070();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100008AE4();
  sub_1000079E8();
  sub_10000A080();
  uint64_t v4 = sub_10000A060();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  uint64_t v11 = sub_100008AE4();
  sub_10000A080();
  uint64_t v6 = sub_10000A060();
  v5(v3, v0);
  sub_100008F44(&qword_1000101F8);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_10000AB70;
  *(void *)(v7 + 32) = v4;
  *(void *)(v7 + 40) = v6;
  uint64_t v8 = sub_10000A050();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_100009C18@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100009F00();
  *a1 = v3;
  return result;
}

uint64_t sub_100009C54()
{
  return sub_100009F10();
}

uint64_t sub_100009C8C(uint64_t a1)
{
  unint64_t v2 = sub_100009DDC();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100009D34()
{
  unint64_t result = qword_100010220;
  if (!qword_100010220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010220);
  }
  return result;
}

uint64_t sub_100009D8C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100009DDC()
{
  unint64_t result = qword_100010228;
  if (!qword_100010228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010228);
  }
  return result;
}

ValueMetadata *type metadata accessor for SettingsSOSAppIntentsExtension()
{
  return &type metadata for SettingsSOSAppIntentsExtension;
}

uint64_t sub_100009E40()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_100009E50()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100009E60()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_100009E80()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100009E90()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100009EA0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100009EE0()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100009EF0()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100009F00()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100009F10()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100009F20()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_100009F30()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildBlock(_:)();
}

uint64_t sub_100009F40()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildExpression(_:)();
}

uint64_t sub_100009F50()
{
  return _AssistantIntent.NegativeAssistantIntentPhrases.init<A>(for:phrases:)();
}

uint64_t sub_100009F60()
{
  return type metadata accessor for _AssistantIntent.NegativeAssistantIntentPhrases();
}

uint64_t sub_100009F70()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t sub_100009F80()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_100009F90()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_100009FA0()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t sub_100009FB0()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t sub_100009FC0()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t sub_100009FD0()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t sub_100009FE0()
{
  return _AssistantIntent.Value.init<A>(for:builder:)();
}

uint64_t sub_100009FF0()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t sub_10000A000()
{
  return _AssistantIntent.Phrase.init(stringLiteral:)();
}

uint64_t sub_10000A010()
{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

void sub_10000A020(Swift::String a1)
{
}

uint64_t sub_10000A030()
{
  return _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_10000A040()
{
  return _AssistantIntent.Phrase.init(stringInterpolation:)();
}

uint64_t sub_10000A050()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t sub_10000A060()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t sub_10000A070()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_10000A080()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_10000A090()
{
  return DisplayRepresentation.Image.init(utTypeIdentifier:)();
}

uint64_t sub_10000A0A0()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_10000A0B0()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_10000A0C0()
{
  return static EnumerableEntityQuery.findIntentDescription.getter();
}

uint64_t sub_10000A0D0()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_10000A0E0()
{
  return URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_10000A110()
{
  return EntityURLRepresentation.StringInterpolation.appendInterpolation(_:)();
}

void sub_10000A120(Swift::String a1)
{
}

uint64_t sub_10000A130()
{
  return EntityURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_10000A140()
{
  return EntityURLRepresentation.init(stringInterpolation:)();
}

uint64_t sub_10000A150()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_10000A160()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_10000A170()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_10000A180()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_10000A1A0()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_10000A1B0()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_10000A1C0()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_10000A1D0()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_10000A1E0()
{
  return static Locale.current.getter();
}

uint64_t sub_10000A1F0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_10000A200()
{
  return static AppExtension.main()();
}

uint64_t sub_10000A210()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_10000A220()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t sub_10000A230()
{
  return String.hash(into:)();
}

Swift::Int sub_10000A240(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_10000A250()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10000A260()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_10000A270()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}