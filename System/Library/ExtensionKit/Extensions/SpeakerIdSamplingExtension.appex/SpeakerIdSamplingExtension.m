uint64_t sub_10000245C(char a1)
{
  Swift::String v2;
  void *v3;
  Swift::String v5;
  Swift::String v6;
  Swift::String v7;

  sub_1000067D0(73);
  v5._countAndFlagsBits = 0xD00000000000002FLL;
  v5._object = (void *)0x80000001000073F0;
  sub_100006750(v5);
  if (a1) {
    v2._countAndFlagsBits = 1702195828;
  }
  else {
    v2._countAndFlagsBits = 0x65736C6166;
  }
  if (a1) {
    v3 = (void *)0xE400000000000000;
  }
  else {
    v3 = (void *)0xE500000000000000;
  }
  v2._object = v3;
  sub_100006750(v2);
  swift_bridgeObjectRelease();
  v6._object = (void *)0x8000000100007420;
  v6._countAndFlagsBits = 0xD000000000000015;
  sub_100006750(v6);
  sub_100006770();
  v7._countAndFlagsBits = 41;
  v7._object = (void *)0xE100000000000000;
  sub_100006750(v7);
  return 0;
}

uint64_t sub_10000255C(char a1)
{
  if (a1) {
    return 0xD000000000000011;
  }
  else {
    return 0x726150776F6C6C61;
  }
}

BOOL sub_1000025A0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_1000025B8()
{
  Swift::UInt v1 = *v0;
  sub_1000068D0();
  sub_1000068E0(v1);
  return sub_1000068F0();
}

void sub_100002600()
{
  sub_1000068E0(*v0);
}

Swift::Int sub_10000262C()
{
  Swift::UInt v1 = *v0;
  sub_1000068D0();
  sub_1000068E0(v1);
  return sub_1000068F0();
}

uint64_t sub_100002670()
{
  return sub_10000255C(*v0);
}

uint64_t sub_100002678@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100004BE0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000026A0()
{
  return 0;
}

void sub_1000026AC(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_1000026B8(uint64_t a1)
{
  unint64_t v2 = sub_100005D04();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000026F4(uint64_t a1)
{
  unint64_t v2 = sub_100005D04();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100002730(void *a1)
{
  uint64_t v3 = sub_100005344(&qword_10000C0F0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005CC0(a1, a1[3]);
  sub_100005D04();
  sub_100006910();
  char v10 = 0;
  sub_100006840();
  if (!v1)
  {
    char v9 = 1;
    sub_100006850();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

void sub_100002898(void *a1@<X0>, uint64_t a2@<X8>)
{
  double v5 = sub_100004CD8(a1);
  if (!v2)
  {
    *(unsigned char *)a2 = v4 & 1;
    *(double *)(a2 + 8) = v5;
  }
}

uint64_t sub_1000028CC(void *a1)
{
  return sub_100002730(a1);
}

uint64_t sub_1000028EC()
{
  return sub_10000245C(*v0);
}

unint64_t SpeakerIdSamplingExtensionError.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000018;
      break;
    case 2:
      unint64_t result = 0x2064696C61766E49;
      break;
    case 3:
      unint64_t result = 0x74754F64656D6974;
      break;
    case 4:
      unint64_t result = 0x7463657078656E75;
      break;
    case 5:
      unint64_t result = 0xD000000000000017;
      break;
    case 6:
      unint64_t result = 0xD000000000000012;
      break;
    case 7:
      unint64_t result = 0xD000000000000014;
      break;
    case 8:
      unint64_t result = 0xD000000000000010;
      break;
    case 9:
    case 11:
    case 14:
      unint64_t result = 0xD000000000000011;
      break;
    case 10:
      unint64_t result = 0x6B72616D6B6F6F62;
      break;
    case 12:
      unint64_t result = 0x4E656C69466C7173;
      break;
    case 13:
      unint64_t result = 0xD000000000000017;
      break;
    case 15:
      unint64_t result = 0x72576664556C7173;
      break;
    case 16:
      unint64_t result = 0x78456664556C7173;
      break;
    case 17:
      unint64_t result = 0xD000000000000014;
      break;
    case 18:
      unint64_t result = 0xD000000000000012;
      break;
    case 19:
      unint64_t result = 0xD000000000000013;
      break;
    case 20:
      unint64_t result = 0xD000000000000012;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100002B6C(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = SpeakerIdSamplingExtensionError.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == SpeakerIdSamplingExtensionError.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_100006870();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int sub_100002BF8()
{
  char v1 = *v0;
  sub_1000068D0();
  SpeakerIdSamplingExtensionError.rawValue.getter(v1);
  sub_100006740();
  swift_bridgeObjectRelease();
  return sub_1000068F0();
}

uint64_t sub_100002C5C()
{
  SpeakerIdSamplingExtensionError.rawValue.getter(*v0);
  sub_100006740();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100002CB0()
{
  char v1 = *v0;
  sub_1000068D0();
  SpeakerIdSamplingExtensionError.rawValue.getter(v1);
  sub_100006740();
  swift_bridgeObjectRelease();
  return sub_1000068F0();
}

uint64_t sub_100002D10@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s26SpeakerIdSamplingExtension0abcD5ErrorO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

unint64_t sub_100002D40@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = SpeakerIdSamplingExtensionError.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100002D7C(uint64_t a1)
{
  v2[19] = a1;
  v2[20] = v1;
  uint64_t v3 = sub_100006640();
  v2[21] = v3;
  v2[22] = *(void *)(v3 - 8);
  v2[23] = swift_task_alloc();
  v2[24] = type metadata accessor for SpeakerIdSamplingExtension();
  v2[25] = swift_task_alloc();
  sub_100005344(&qword_10000C100);
  v2[26] = swift_task_alloc();
  uint64_t v4 = sub_100005344(&qword_10000C028);
  v2[27] = v4;
  v2[28] = *(void *)(v4 - 8);
  v2[29] = swift_task_alloc();
  v2[30] = swift_task_alloc();
  uint64_t v5 = sub_100006730();
  v2[31] = v5;
  v2[32] = *(void *)(v5 - 8);
  v2[33] = swift_task_alloc();
  v2[34] = swift_task_alloc();
  v2[35] = swift_task_alloc();
  v2[36] = swift_task_alloc();
  v2[37] = swift_task_alloc();
  return _swift_task_switch(sub_100002F9C, 0, 0);
}

uint64_t sub_100002F9C()
{
  uint64_t v1 = (void *)v0[19];
  uint64_t v2 = v0[37];
  uint64_t v3 = v0[31];
  uint64_t v4 = v0[32];
  uint64_t v5 = v0[20];
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v0[38] = v6;
  v0[39] = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v6(v2, v5, v3);
  id v7 = v1;
  char v8 = sub_100006710();
  os_log_type_t v9 = sub_100006780();
  if (os_log_type_enabled(v8, v9))
  {
    char v10 = (void *)v0[19];
    v11 = (uint8_t *)swift_slowAlloc();
    v26 = (void *)swift_slowAlloc();
    *(_DWORD *)v11 = 138412290;
    v0[18] = v10;
    id v12 = v10;
    sub_1000067B0();
    void *v26 = v10;

    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Context: %@", v11, 0xCu);
    sub_100005344(&qword_10000C110);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    v13 = (void *)v0[19];
  }
  uint64_t v14 = v0[37];
  uint64_t v15 = v0[31];
  uint64_t v16 = v0[32];
  v17 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
  v0[40] = v17;
  v0[41] = (v16 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v17(v14, v15);
  v18 = (void *)swift_task_alloc();
  v0[42] = v18;
  uint64_t v19 = sub_100005C7C(&qword_10000C0E0);
  unint64_t v20 = sub_100005A80();
  unint64_t v21 = sub_100005AD4();
  void *v18 = v0;
  v18[1] = sub_100003204;
  uint64_t v22 = v0[26];
  uint64_t v23 = v0[24];
  uint64_t v24 = v0[19];
  return MLHostExtension.loadConfig<A>(context:)(v22, v24, v23, &type metadata for SpeakerIdSamplingExtensionConfig, v19, v20, v21);
}

uint64_t sub_100003204()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100003300, 0, 0);
}

uint64_t sub_100003300()
{
  uint64_t v37 = v0;
  uint64_t v1 = *(void *)(v0 + 216);
  uint64_t v2 = *(void *)(v0 + 224);
  uint64_t v3 = *(void *)(v0 + 208);
  sub_100005D58(*(void *)(v0 + 160), *(void *)(v0 + 200));
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1);
  uint64_t v5 = *(void *)(v0 + 240);
  uint64_t v6 = *(void *)(v0 + 216);
  uint64_t v7 = *(void *)(v0 + 224);
  uint64_t v9 = *(void *)(v0 + 200);
  uint64_t v8 = *(void *)(v0 + 208);
  if (v4 == 1)
  {
    (*(void (**)(void, uint64_t, void))(v7 + 16))(*(void *)(v0 + 240), v9 + *(int *)(*(void *)(v0 + 192) + 20), *(void *)(v0 + 216));
    sub_100005DBC(v9);
    sub_100005E6C(v8, &qword_10000C100);
  }
  else
  {
    sub_100005DBC(*(void *)(v0 + 200));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v5, v8, v6);
  }
  uint64_t v10 = *(void *)(v0 + 240);
  uint64_t v12 = *(void *)(v0 + 224);
  uint64_t v11 = *(void *)(v0 + 232);
  uint64_t v13 = *(void *)(v0 + 216);
  (*(void (**)(void, void, void))(v0 + 304))(*(void *)(v0 + 288), *(void *)(v0 + 160), *(void *)(v0 + 248));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v11, v10, v13);
  uint64_t v14 = sub_100006710();
  os_log_type_t v15 = sub_100006780();
  BOOL v16 = os_log_type_enabled(v14, v15);
  v17 = *(void (**)(uint64_t, uint64_t))(v0 + 320);
  uint64_t v18 = *(void *)(v0 + 288);
  uint64_t v35 = *(void *)(v0 + 248);
  uint64_t v20 = *(void *)(v0 + 224);
  uint64_t v19 = *(void *)(v0 + 232);
  uint64_t v21 = *(void *)(v0 + 216);
  if (v16)
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    *(_DWORD *)uint64_t v22 = 136315138;
    sub_100005EC8();
    uint64_t v23 = sub_100006860();
    *(void *)(v0 + 136) = sub_100004588(v23, v24, &v36);
    sub_1000067B0();
    swift_bridgeObjectRelease();
    v25 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
    v25(v19, v21);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Configuration: %s", v22, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v17(v18, v35);
  }
  else
  {
    v25 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
    v25(*(void *)(v0 + 232), *(void *)(v0 + 216));

    v17(v18, v35);
  }
  *(void *)(v0 + 344) = v25;
  (*(void (**)(void, void, void))(v0 + 304))(*(void *)(v0 + 280), *(void *)(v0 + 160), *(void *)(v0 + 248));
  sub_100006630();
  uint64_t v26 = sub_100006670();
  *(void *)(v0 + 352) = v26;
  uint64_t v27 = *(void *)(v26 - 8);
  *(void *)(v0 + 360) = v27;
  *(void *)(v0 + 368) = *(void *)(v27 + 64);
  *(void *)(v0 + 376) = swift_task_alloc();
  uint64_t v28 = swift_task_alloc();
  *(void *)(v0 + 384) = v28;
  sub_100006660();
  swift_allocObject();
  uint64_t v29 = sub_100006650();
  *(void *)(v0 + 392) = v29;
  sub_1000066F0();
  unint64_t v30 = *(void *)(v0 + 104);
  v31 = (void *)swift_task_alloc();
  *(void *)(v0 + 400) = v31;
  void *v31 = v0;
  v31[1] = sub_100003708;
  uint64_t v32 = *(void *)(v0 + 152);
  v33.n128_u64[0] = v30;
  return SpeakerIdSamplingWorker.doWork(executor:context:durationThreshold:)(v28, v29, v32, v33);
}

uint64_t sub_100003708()
{
  *(void *)(*(void *)v1 + 408) = v0;
  swift_task_dealloc();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_100003D04;
  }
  else {
    uint64_t v2 = sub_100003838;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100003838()
{
  uint64_t v1 = *(void *)(v0 + 376);
  uint64_t v2 = *(void *)(v0 + 360);
  uint64_t v3 = *(void *)(v0 + 352);
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 32))(v1, *(void *)(v0 + 384), v3);
  swift_task_dealloc();
  uint64_t v4 = (void *)swift_task_alloc();
  (*(void (**)(void *, uint64_t, uint64_t))(v2 + 16))(v4, v1, v3);
  int v5 = (*(uint64_t (**)(void *, uint64_t))(v2 + 88))(v4, v3);
  if (&enum case for LighthouseRuntimeProcessorResult.error(_:)
    && v5 == enum case for LighthouseRuntimeProcessorResult.error(_:))
  {
    (*(void (**)(void *, void))(*(void *)(v0 + 360) + 96))(v4, *(void *)(v0 + 352));
    uint64_t v6 = *v4;
    if (*v4)
    {
      *(void *)(v0 + 112) = v6;
      swift_errorRetain();
      sub_100005344(&qword_10000C118);
      sub_100005344(&qword_10000C120);
      if (swift_dynamicCast())
      {
        uint64_t v7 = *(void *)(v0 + 80);
        sub_100005E6C(v0 + 56, &qword_10000C128);
        if (v7)
        {
          uint64_t v8 = *(void *)(v0 + 360);
          uint64_t v32 = *(void *)(v0 + 240);
          v34 = *(void (**)(uint64_t, uint64_t))(v0 + 344);
          uint64_t v30 = *(void *)(v0 + 376);
          uint64_t v31 = *(void *)(v0 + 216);
          uint64_t v9 = *(void *)(v0 + 176);
          uint64_t v28 = *(void *)(v0 + 352);
          uint64_t v29 = *(void *)(v0 + 184);
          uint64_t v10 = *(void *)(v0 + 168);
          *(void *)(v0 + 120) = v6;
          swift_errorRetain();
          swift_dynamicCast();
          id v11 = objc_allocWithZone((Class)sub_1000066B0());
          uint64_t v36 = sub_100006690();
          swift_errorRelease();
          (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v30, v28);
          (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v29, v10);
          v34(v32, v31);
          swift_task_dealloc();
          goto LABEL_22;
        }
      }
      else
      {
        *(void *)(v0 + 88) = 0;
        *(_OWORD *)(v0 + 56) = 0u;
        *(_OWORD *)(v0 + 72) = 0u;
        sub_100005E6C(v0 + 56, &qword_10000C128);
      }
    }
    uint64_t v12 = (void *)(v0 + 248);
    (*(void (**)(void, void, void))(v0 + 304))(*(void *)(v0 + 272), *(void *)(v0 + 160), *(void *)(v0 + 248));
    os_log_type_t v15 = sub_100006710();
    os_log_type_t v16 = sub_1000067A0();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "task failed with unset error", v17, 2u);
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
    }
    uint64_t v13 = (void (**)(void *, void))(v0 + 320);
    uint64_t v14 = *(void **)(v0 + 272);
  }
  else
  {
    if (&enum case for LighthouseRuntimeProcessorResult.success(_:)
      && v5 == enum case for LighthouseRuntimeProcessorResult.success(_:)
      || &enum case for LighthouseRuntimeProcessorResult.cancelled(_:)
      && v5 == enum case for LighthouseRuntimeProcessorResult.cancelled(_:)
      || &enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:)
      && v5 == enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:))
    {
      goto LABEL_21;
    }
    uint64_t v12 = (void *)(v0 + 352);
    uint64_t v13 = (void (**)(void *, void))(*(void *)(v0 + 360) + 8);
    uint64_t v14 = v4;
  }
  (*v13)(v14, *v12);
LABEL_21:
  uint64_t v18 = *(void *)(v0 + 376);
  uint64_t v19 = *(void *)(v0 + 352);
  uint64_t v20 = *(void *)(v0 + 360);
  uint64_t v33 = *(void *)(v0 + 240);
  uint64_t v35 = *(void (**)(uint64_t, uint64_t))(v0 + 344);
  uint64_t v21 = *(void *)(v0 + 216);
  uint64_t v22 = *(void *)(v0 + 176);
  uint64_t v23 = *(void *)(v0 + 184);
  uint64_t v24 = *(void *)(v0 + 168);
  swift_task_dealloc();
  id v25 = objc_allocWithZone((Class)sub_1000066B0());
  uint64_t v36 = sub_1000066A0();
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v18, v19);
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v23, v24);
  v35(v33, v21);
LABEL_22:
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
  uint64_t v26 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v26(v36);
}

uint64_t sub_100003D04()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t, uint64_t))v0[38];
  uint64_t v2 = v0[33];
  uint64_t v3 = v0[31];
  uint64_t v4 = v0[20];
  swift_task_dealloc();
  v1(v2, v4, v3);
  swift_errorRetain();
  swift_errorRetain();
  int v5 = sub_100006710();
  os_log_type_t v6 = sub_1000067A0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    swift_errorRetain();
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    v0[16] = v9;
    sub_1000067B0();
    *uint64_t v8 = v9;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "unexpected error throws: %@", v7, 0xCu);
    sub_100005344(&qword_10000C110);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v10 = v5;
  id v11 = (void (*)(uint64_t, uint64_t))v0[40];
  uint64_t v12 = v0[33];
  uint64_t v13 = v0[31];
  uint64_t v21 = v0[30];
  uint64_t v22 = (void (*)(uint64_t, uint64_t))v0[43];
  uint64_t v20 = v0[27];
  uint64_t v14 = v0[22];
  uint64_t v15 = v0[23];
  uint64_t v16 = v0[21];

  v11(v12, v13);
  sub_100005E18();
  id v17 = objc_allocWithZone((Class)sub_1000066B0());
  uint64_t v23 = sub_100006690();
  swift_errorRelease();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v15, v16);
  v22(v21, v20);
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
  uint64_t v18 = (uint64_t (*)(uint64_t))v0[1];
  return v18(v23);
}

uint64_t sub_100003FF8()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_10000C140 + dword_10000C140);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000065DC;
  return v3();
}

uint64_t sub_100004098(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10000412C;
  return sub_100002D7C(a1);
}

uint64_t sub_10000412C(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_100004228(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *uint64_t v15 = v7;
  v15[1] = sub_10000430C;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_10000430C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100004400(uint64_t a1)
{
  uint64_t v2 = sub_100005C7C(&qword_10000C0E0);

  return MLHostExtension.configuration.getter(a1, v2);
}

uint64_t sub_100004468()
{
  return sub_1000066E0();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t sub_100004588(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000465C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100005FBC((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100005FBC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100005F6C((uint64_t)v12);
  return v7;
}

uint64_t sub_10000465C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1000067C0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100004818(a5, a6);
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
  uint64_t v8 = sub_1000067F0();
  if (!v8)
  {
    sub_100006800();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100006810();
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

uint64_t sub_100004818(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000048B0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100004A90(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100004A90(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000048B0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100004A28(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1000067E0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100006800();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100006760();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100006810();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100006800();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100004A28(uint64_t a1, uint64_t a2)
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
  sub_100005344(&qword_10000C138);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100004A90(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005344(&qword_10000C138);
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
  uint64_t result = sub_100006810();
  __break(1u);
  return result;
}

uint64_t sub_100004BE0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x726150776F6C6C61 && a2 == 0xEC0000006C616974;
  if (v3 || (sub_100006870() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000100007440)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_100006870();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

double sub_100004CD8(void *a1)
{
  uint64_t v4 = sub_100005344(&qword_10000C0E8);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  int64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005CC0(a1, a1[3]);
  sub_100005D04();
  sub_100006900();
  if (!v1)
  {
    char v12 = 0;
    sub_100006820();
    char v11 = 1;
    sub_100006830();
    double v2 = v8;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_100005F6C((uint64_t)a1);
  return v2;
}

uint64_t _s26SpeakerIdSamplingExtension0abcD5ErrorO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_100006880();
  swift_bridgeObjectRelease();
  if (v0 >= 0x15) {
    return 21;
  }
  else {
    return v0;
  }
}

uint64_t type metadata accessor for SpeakerIdSamplingExtension()
{
  uint64_t result = qword_10000C3E0;
  if (!qword_10000C3E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_100004F24()
{
  unint64_t result = qword_10000C008;
  if (!qword_10000C008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C008);
  }
  return result;
}

unint64_t sub_100004F7C()
{
  unint64_t result = qword_10000C010;
  if (!qword_10000C010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C010);
  }
  return result;
}

unint64_t sub_100004FD4()
{
  unint64_t result = qword_10000C018;
  if (!qword_10000C018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C018);
  }
  return result;
}

unint64_t sub_10000502C()
{
  unint64_t result = qword_10000C020;
  if (!qword_10000C020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C020);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for SpeakerIdSamplingExtensionError(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SpeakerIdSamplingExtensionError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEC) {
    goto LABEL_17;
  }
  if (a2 + 20 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 20) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 20;
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
      return (*a1 | (v4 << 8)) - 20;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 20;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x15;
  int v8 = v6 - 21;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SpeakerIdSamplingExtensionError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 20 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 20) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEB)
  {
    unsigned int v6 = ((a2 - 236) >> 8) + 1;
    *unint64_t result = a2 + 20;
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
        JUMPOUT(0x1000051ECLL);
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
          *unint64_t result = a2 + 20;
        break;
    }
  }
  return result;
}

uint64_t sub_100005214(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100005220(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SpeakerIdSamplingExtensionError()
{
  return &type metadata for SpeakerIdSamplingExtensionError;
}

uint64_t *sub_100005238(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_100006730();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    int64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_100005344(&qword_10000C028);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t sub_100005344(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005388(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006730();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_100005344(&qword_10000C028);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t sub_100005434(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006730();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100005344(&qword_10000C028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t sub_1000054F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006730();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100005344(&qword_10000C028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_1000055AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006730();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100005344(&qword_10000C028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_100005668(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006730();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100005344(&qword_10000C028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_100005724(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100005738);
}

uint64_t sub_100005738(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006730();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_100005344(&qword_10000C028);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_100005834(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100005848);
}

uint64_t sub_100005848(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_100006730();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_100005344(&qword_10000C028);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

void sub_100005950()
{
  sub_100006730();
  if (v0 <= 0x3F)
  {
    sub_100005A18();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_100005A18()
{
  if (!qword_10000C088)
  {
    sub_100005A80();
    sub_100005AD4();
    unint64_t v0 = sub_100006700();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10000C088);
    }
  }
}

unint64_t sub_100005A80()
{
  unint64_t result = qword_10000C090;
  if (!qword_10000C090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C090);
  }
  return result;
}

unint64_t sub_100005AD4()
{
  unint64_t result = qword_10000C098;
  if (!qword_10000C098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C098);
  }
  return result;
}

__n128 initializeBufferWithCopyOfBuffer for SpeakerIdSamplingExtensionConfig(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SpeakerIdSamplingExtensionConfig(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[16]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SpeakerIdSamplingExtensionConfig(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SpeakerIdSamplingExtensionConfig()
{
  return &type metadata for SpeakerIdSamplingExtensionConfig;
}

uint64_t sub_100005BD8()
{
  return sub_100005C7C(&qword_10000C000);
}

uint64_t sub_100005C0C()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100005C7C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for SpeakerIdSamplingExtension();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void *sub_100005CC0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100005D04()
{
  unint64_t result = qword_10000C670[0];
  if (!qword_10000C670[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10000C670);
  }
  return result;
}

uint64_t sub_100005D58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SpeakerIdSamplingExtension();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100005DBC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SpeakerIdSamplingExtension();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100005E18()
{
  unint64_t result = qword_10000C108;
  if (!qword_10000C108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C108);
  }
  return result;
}

uint64_t sub_100005E6C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005344(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_100005EC8()
{
  unint64_t result = qword_10000C130;
  if (!qword_10000C130)
  {
    sub_100005F24(&qword_10000C028);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C130);
  }
  return result;
}

uint64_t sub_100005F24(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005F6C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100005FBC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000601C()
{
  v1[2] = v0;
  uint64_t v2 = sub_100006730();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  v1[6] = swift_task_alloc();
  v1[7] = swift_task_alloc();
  return _swift_task_switch(sub_1000060F8, 0, 0);
}

uint64_t sub_1000060F8()
{
  if (!sub_1000065E0())
  {
    uint64_t v1 = v0 + 7;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v0[4] + 16))(v0[7], v0[2], v0[3]);
    uint64_t v2 = sub_100006710();
    os_log_type_t v3 = sub_100006790();
    if (!os_log_type_enabled(v2, v3)) {
      goto LABEL_12;
    }
    uint64_t v4 = "Siri on device metrics disabled. Not continuing.";
LABEL_11:
    uint64_t v5 = *v1;
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, v4, v6, 2u);
    swift_slowDealloc();
LABEL_13:
    uint64_t v7 = v0[3];
    uint64_t v8 = v0[4];

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v5, v7);
    goto LABEL_14;
  }
  sub_100006610();
  if ((sub_100006600() & 1) == 0)
  {
    uint64_t v1 = v0 + 6;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v0[4] + 16))(v0[6], v0[2], v0[3]);
    uint64_t v2 = sub_100006710();
    os_log_type_t v3 = sub_100006790();
    if (!os_log_type_enabled(v2, v3)) {
      goto LABEL_12;
    }
    uint64_t v4 = "Neither assistant nor dictation enabled. Not allowed to process.";
    goto LABEL_11;
  }
  if ((sub_1000065F0() & 1) == 0)
  {
    uint64_t v1 = v0 + 5;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v0[4] + 16))(v0[5], v0[2], v0[3]);
    uint64_t v2 = sub_100006710();
    os_log_type_t v3 = sub_100006790();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = "Siri Data Sharing status is not Opted-In. Not allowed to process.";
      goto LABEL_11;
    }
LABEL_12:
    uint64_t v5 = *v1;
    goto LABEL_13;
  }
LABEL_14:
  id v9 = objc_allocWithZone((Class)sub_1000066B0());
  uint64_t v10 = sub_1000066A0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(uint64_t))v0[1];
  return v11(v10);
}

uint64_t getEnumTagSinglePayload for SpeakerIdSamplingExtensionConfig.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SpeakerIdSamplingExtensionConfig.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100006490);
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

unsigned char *sub_1000064B8(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SpeakerIdSamplingExtensionConfig.CodingKeys()
{
  return &type metadata for SpeakerIdSamplingExtensionConfig.CodingKeys;
}

unint64_t sub_1000064D8()
{
  unint64_t result = qword_10000C780[0];
  if (!qword_10000C780[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10000C780);
  }
  return result;
}

unint64_t sub_100006530()
{
  unint64_t result = qword_10000C890;
  if (!qword_10000C890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C890);
  }
  return result;
}

unint64_t sub_100006588()
{
  unint64_t result = qword_10000C898[0];
  if (!qword_10000C898[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10000C898);
  }
  return result;
}

BOOL sub_1000065E0()
{
  return isOnDeviceSiriMetricsEnabled()();
}

uint64_t sub_1000065F0()
{
  return static ExtensionsUtils.isSiriDataSharingOptIn()();
}

uint64_t sub_100006600()
{
  return static ExtensionsUtils.isAssistantOrDictationEnabled()();
}

uint64_t sub_100006610()
{
  return type metadata accessor for ExtensionsUtils();
}

uint64_t sub_100006630()
{
  return SpeakerIdSamplingWorker.init(logger:)();
}

uint64_t sub_100006640()
{
  return type metadata accessor for SpeakerIdSamplingWorker();
}

uint64_t sub_100006650()
{
  return SpeakerIdSamplingTaskExecutor.init()();
}

uint64_t sub_100006660()
{
  return type metadata accessor for SpeakerIdSamplingTaskExecutor();
}

uint64_t sub_100006670()
{
  return type metadata accessor for LighthouseRuntimeProcessorResult();
}

uint64_t sub_100006680()
{
  return static AppExtension.main()();
}

uint64_t sub_100006690()
{
  return MLHostResult.init(error:policy:)();
}

uint64_t sub_1000066A0()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t sub_1000066B0()
{
  return type metadata accessor for MLHostResult();
}

uint64_t sub_1000066E0()
{
  return MLHostParameters.init(taskParameters:)();
}

uint64_t sub_1000066F0()
{
  return MLHostParameters.taskParameters.getter();
}

uint64_t sub_100006700()
{
  return type metadata accessor for MLHostParameters();
}

uint64_t sub_100006710()
{
  return Logger.logObject.getter();
}

uint64_t sub_100006720()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100006730()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100006740()
{
  return String.hash(into:)();
}

void sub_100006750(Swift::String a1)
{
}

Swift::Int sub_100006760()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100006770()
{
  return Double.write<A>(to:)();
}

uint64_t sub_100006780()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100006790()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_1000067A0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000067B0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000067C0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

void sub_1000067D0(Swift::Int a1)
{
}

uint64_t sub_1000067E0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000067F0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100006800()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100006810()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100006820()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100006830()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100006840()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100006850()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100006860()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100006870()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100006880()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t sub_100006890()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_1000068A0()
{
  return Error._code.getter();
}

uint64_t sub_1000068B0()
{
  return Error._domain.getter();
}

uint64_t sub_1000068C0()
{
  return Error._userInfo.getter();
}

uint64_t sub_1000068D0()
{
  return Hasher.init(_seed:)();
}

void sub_1000068E0(Swift::UInt a1)
{
}

Swift::Int sub_1000068F0()
{
  return Hasher._finalize()();
}

uint64_t sub_100006900()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_100006910()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
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

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}