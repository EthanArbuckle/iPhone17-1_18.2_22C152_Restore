unint64_t sub_100004034()
{
  unint64_t result;

  result = qword_100010040;
  if (!qword_100010040)
  {
    result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010040);
  }
  return result;
}

unint64_t sub_10000408C()
{
  unint64_t result = qword_100010048;
  if (!qword_100010048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010048);
  }
  return result;
}

uint64_t sub_1000040E0()
{
  uint64_t v0 = sub_100009310();
  sub_100008D94(v0, qword_1000101E8);
  sub_100008D5C(v0, (uint64_t)qword_1000101E8);
  return sub_100009300();
}

uint64_t sub_100004144@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1000091C0();
  *a1 = v3;
  return result;
}

uint64_t sub_100004180()
{
  return sub_1000091D0();
}

void (*sub_1000041B8(void *a1))(void *a1)
{
  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1000091B0();
  return sub_100004214;
}

void sub_100004214(void *a1)
{
  v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_100004264()
{
  unint64_t result = qword_100010050;
  if (!qword_100010050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010050);
  }
  return result;
}

uint64_t sub_1000042B8(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100008E64();
  unint64_t v5 = sub_100008DF8();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_100004324()
{
  unint64_t result = qword_100010058;
  if (!qword_100010058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010058);
  }
  return result;
}

unint64_t sub_10000437C()
{
  unint64_t result = qword_100010060;
  if (!qword_100010060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010060);
  }
  return result;
}

unint64_t sub_1000043D4()
{
  unint64_t result = qword_100010068;
  if (!qword_100010068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010068);
  }
  return result;
}

uint64_t sub_100004428()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100004478@<X0>(uint64_t a1@<X8>)
{
  return sub_1000076C8(&qword_100010010, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_1000101E8, a1);
}

uint64_t sub_1000044B0()
{
  return 0;
}

uint64_t sub_1000044BC()
{
  return 1;
}

uint64_t sub_1000044CC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100008E64();
  unint64_t v6 = sub_100008EB8();
  unint64_t v7 = sub_100008DF8();
  *unint64_t v4 = v2;
  v4[1] = sub_100004598;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_100004598()
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

uint64_t sub_1000046A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000840C();
  *a1 = result;
  return result;
}

uint64_t sub_1000046C8(uint64_t a1)
{
  unint64_t v2 = sub_100004264();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100004708()
{
  unint64_t result = qword_100010078;
  if (!qword_100010078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010078);
  }
  return result;
}

unint64_t sub_100004760()
{
  unint64_t result = qword_100010080;
  if (!qword_100010080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010080);
  }
  return result;
}

unint64_t sub_1000047B8()
{
  unint64_t result = qword_100010088[0];
  if (!qword_100010088[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100010088);
  }
  return result;
}

uint64_t sub_10000480C()
{
  uint64_t v0 = sub_100008D18(&qword_100010160);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100009310();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_1000092E0();
  sub_100008D94(v5, qword_100010200);
  sub_100008D5C(v5, (uint64_t)qword_100010200);
  sub_100009300();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_1000092D0();
}

uint64_t sub_100004978@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100008D18(&qword_100010158);
  __chkstk_darwin(v4 - 8);
  unint64_t v6 = (char *)v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100008D18(&qword_100010160);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100009310();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  v14 = (char *)v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v12);
  v17 = (char *)v49 - v16;
  uint64_t v18 = __chkstk_darwin(v15);
  v20 = (char *)v49 - v19;
  uint64_t v21 = __chkstk_darwin(v18);
  v23 = (char *)v49 - v22;
  __chkstk_darwin(v21);
  switch(a1)
  {
    case 1:
    case 10:
    case 13:
    case 15:
    case 16:
      sub_100009300();
      sub_100009300();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
      sub_1000091F0();
      uint64_t v27 = sub_100009200();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v6, 0, 1, v27);
      goto LABEL_12;
    case 2:
    case 17:
      sub_100009300();
      sub_100009300();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
      sub_1000091F0();
      uint64_t v37 = sub_100009200();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v6, 0, 1, v37);
      sub_100008D18(&qword_100010168);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000095C0;
      sub_100009300();
      sub_100009300();
      sub_100009300();
      goto LABEL_15;
    case 3:
      v28 = (char *)v49 - v24;
      id v29 = (id)MobileGestalt_get_current_device();
      if (!v29)
      {
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
        JUMPOUT(0x1000067C0);
      }
      v30 = v29;
      MobileGestalt_get_wapiCapability();

      uint64_t v52 = a2;
      sub_100009300();
      v53 = v28;
      sub_100009300();
      sub_100009300();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
      sub_1000091F0();
      uint64_t v38 = sub_100009200();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v6, 0, 1, v38);
      sub_100008D18(&qword_100010168);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000095D0;
      sub_100009300();
      sub_100009300();
      sub_100009300();
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v23, v20, v10);
      sub_100009210();
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v20, v10);
      break;
    case 4:
      v53 = (char *)v49 - v24;
      id v31 = (id)MobileGestalt_get_current_device();
      if (!v31) {
        goto LABEL_19;
      }
      v32 = v31;
      MobileGestalt_get_wapiCapability();

      sub_100009300();
      id v40 = (id)MobileGestalt_get_current_device();
      if (!v40) {
        goto LABEL_20;
      }
      v41 = v40;
      MobileGestalt_get_wapiCapability();

      v50 = v23;
      uint64_t v52 = a2;
      sub_100009300();
      sub_100009300();
      sub_100009300();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
      sub_1000091F0();
      uint64_t v42 = sub_100009200();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v6, 0, 1, v42);
      sub_100008D18(&qword_100010168);
      uint64_t v43 = *(void *)(v11 + 72);
      unint64_t v44 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
      uint64_t v51 = 4 * v43;
      uint64_t v45 = swift_allocObject();
      *(_OWORD *)(v45 + 16) = xmmword_1000095F0;
      unint64_t v46 = v45 + v44;
      sub_100009300();
      v49[0] = v9;
      v49[1] = v6;
      v47 = *(void (**)(unint64_t, char *, uint64_t))(v11 + 16);
      v47(v46 + v43, v17, v10);
      sub_100009300();
      sub_100009300();
      sub_100009300();
      v47((unint64_t)v50, v14, v10);
      sub_100009210();
      v48 = *(void (**)(char *, uint64_t))(v11 + 8);
      v48(v14, v10);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v48)(v17, v10);
      break;
    case 5:
    case 7:
    case 8:
    case 11:
      sub_100009300();
      sub_100009300();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
      sub_1000091F0();
      uint64_t v34 = sub_100009200();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v6, 0, 1, v34);
      sub_100008D18(&qword_100010168);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000095E0;
      sub_100009300();
      goto LABEL_12;
    case 6:
      sub_100009300();
      sub_100009300();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
      sub_1000091F0();
      uint64_t v33 = sub_100009200();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v6, 0, 1, v33);
      sub_100008D18(&qword_100010168);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000095D0;
      sub_100009300();
      sub_100009300();
      sub_100009300();
      sub_100009300();
      goto LABEL_15;
    case 9:
      v53 = (char *)v49 - v24;
      sub_100009300();
      sub_100009300();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
      sub_1000091F0();
      uint64_t v35 = sub_100009200();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v6, 0, 1, v35);
      sub_100008D18(&qword_100010168);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000095F0;
      sub_100009300();
      sub_100009300();
      sub_100009300();
      sub_100009300();
      sub_100009300();
      goto LABEL_12;
    case 12:
      sub_100009300();
      sub_100009300();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
      sub_1000091F0();
      uint64_t v36 = sub_100009200();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v6, 0, 1, v36);
      sub_100008D18(&qword_100010168);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000095E0;
      sub_100009300();
      sub_100009300();
      goto LABEL_15;
    case 14:
      v53 = (char *)v49 - v24;
      sub_100009300();
      sub_100009300();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
      sub_1000091F0();
      uint64_t v26 = sub_100009200();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v6, 0, 1, v26);
      sub_100008D18(&qword_100010168);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000095D0;
      sub_100009300();
      sub_100009300();
      sub_100009300();
LABEL_12:
      sub_100009300();
      goto LABEL_15;
    default:
      v53 = (char *)v49 - v24;
      sub_100009300();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
      sub_1000091F0();
      uint64_t v25 = sub_100009200();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v6, 0, 1, v25);
      sub_100008D18(&qword_100010168);
      uint64_t v51 = swift_allocObject();
      *(_OWORD *)(v51 + 16) = xmmword_100009600;
      sub_100009300();
      sub_100009300();
      sub_100009300();
      sub_100009300();
      sub_100009300();
      sub_100009300();
      sub_100009300();
      sub_100009300();
      sub_100009300();
      sub_100009300();
      sub_100009300();
      sub_100009300();
      sub_100009300();
      sub_100009300();
      sub_100009300();
      sub_100009300();
      sub_100009300();
      sub_100009300();
      sub_100009300();
      sub_100009300();
LABEL_15:
      uint64_t result = sub_100009210();
      break;
  }
  return result;
}

uint64_t sub_10000680C(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_1000101B0 + dword_1000101B0);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1000068B4;
  return v5(a1);
}

uint64_t sub_1000068B4(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_1000069B4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_1000101A8 + dword_1000101A8);
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  void *v2 = v1;
  v2[1] = sub_100008F0C;
  return v4();
}

unint64_t sub_100006A5C()
{
  unint64_t result = qword_1000100A0;
  if (!qword_1000100A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100A0);
  }
  return result;
}

uint64_t sub_100006AB0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100010198 + dword_100010198);
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  void *v2 = v1;
  v2[1] = sub_100006B54;
  return v4();
}

uint64_t sub_100006B54(uint64_t a1)
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

unint64_t sub_100006C6C()
{
  unint64_t result = qword_1000100B0;
  if (!qword_1000100B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100B0);
  }
  return result;
}

unint64_t sub_100006CC4()
{
  unint64_t result = qword_1000100B8;
  if (!qword_1000100B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100B8);
  }
  return result;
}

unint64_t sub_100006D1C()
{
  unint64_t result = qword_1000100C0;
  if (!qword_1000100C0)
  {
    sub_100006D90(qword_1000100C8);
    sub_100006CC4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100C0);
  }
  return result;
}

uint64_t sub_100006D90(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100006DD8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100006A5C();
  *uint64_t v5 = v2;
  v5[1] = sub_100006E8C;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100006E8C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100006F80(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100010188 + dword_100010188);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  void *v2 = v1;
  v2[1] = sub_100007024;
  return v4();
}

uint64_t sub_100007024(char a1)
{
  uint64_t v3 = *(unsigned char **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  *uint64_t v3 = a1;
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

unint64_t sub_100007140()
{
  unint64_t result = qword_1000100E0;
  if (!qword_1000100E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100E0);
  }
  return result;
}

uint64_t sub_100007194()
{
  uint64_t v0 = sub_100008D18(&qword_100010178);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100008D18(&qword_100010180);
  __chkstk_darwin(v4);
  sub_1000047B8();
  sub_100009290();
  v7._object = (void *)0x800000010000B140;
  v7._countAndFlagsBits = 0xD000000000000033;
  sub_100009280(v7);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for EntityURLRepresentation.StringInterpolation.Token.id<A>(_:), v0);
  sub_100009270();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  sub_100009280(v8);
  return sub_1000092A0();
}

uint64_t sub_100007350()
{
  uint64_t v0 = qword_100010020;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_10000738C()
{
  unint64_t result = qword_1000100E8;
  if (!qword_1000100E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100E8);
  }
  return result;
}

unint64_t sub_1000073E4()
{
  unint64_t result = qword_1000100F0;
  if (!qword_1000100F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100F0);
  }
  return result;
}

unint64_t sub_10000743C()
{
  unint64_t result = qword_1000100F8;
  if (!qword_1000100F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100F8);
  }
  return result;
}

uint64_t sub_100007490()
{
  sub_100008DF8();
  uint64_t v2 = sub_100009240();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100008E4C(v3, v0, v2, v1);
}

unint64_t sub_100007528()
{
  unint64_t result = qword_100010108;
  if (!qword_100010108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010108);
  }
  return result;
}

unint64_t sub_100007580()
{
  unint64_t result = qword_100010110;
  if (!qword_100010110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010110);
  }
  return result;
}

unint64_t sub_1000075D8()
{
  unint64_t result = qword_100010118;
  if (!qword_100010118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010118);
  }
  return result;
}

unint64_t sub_100007630()
{
  unint64_t result = qword_100010120;
  if (!qword_100010120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010120);
  }
  return result;
}

void sub_100007684(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100007690@<X0>(uint64_t a1@<X8>)
{
  return sub_1000076C8(&qword_100010018, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100010200, a1);
}

uint64_t sub_1000076C8@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100008D5C(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_10000776C()
{
  return sub_100007F64(&qword_100010128, &qword_100010130);
}

uint64_t sub_1000077A8(uint64_t a1)
{
  unint64_t v2 = sub_1000047B8();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000077F8()
{
  unint64_t result = qword_100010138;
  if (!qword_100010138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010138);
  }
  return result;
}

uint64_t sub_10000784C@<X0>(uint64_t a1@<X8>)
{
  return sub_100004978(*v1, a1);
}

uint64_t sub_100007854(uint64_t a1)
{
  unint64_t v2 = sub_1000075D8();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_1000078A0(char a1)
{
  unint64_t result = 0x746F6F7223;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x70756F7247414955;
      break;
    case 2:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 3:
      unint64_t result = 4410446;
      break;
    case 4:
      unint64_t result = 5194574;
      break;
    case 5:
      unint64_t result = 0x41505F49544C554DLL;
      break;
    case 6:
      unint64_t result = 5452876;
      break;
    case 7:
      unint64_t result = 0x45504F4C45564544;
      break;
    case 8:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 9:
      unint64_t result = 0xD000000000000013;
      break;
    case 10:
      unint64_t result = 0xD000000000000017;
      break;
    case 11:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 12:
      unint64_t result = 0xD000000000000015;
      break;
    case 13:
    case 17:
      unint64_t result = 0xD000000000000016;
      break;
    case 14:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 15:
      unint64_t result = 0xD000000000000023;
      break;
    case 16:
      unint64_t result = 0xD00000000000001CLL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_100007AB8(char a1)
{
  unint64_t result = 0x746F6F7223;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x70756F7247414955;
      break;
    case 2:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 3:
      unint64_t result = 4410446;
      break;
    case 4:
      unint64_t result = 5194574;
      break;
    case 5:
      unint64_t result = 0x41505F49544C554DLL;
      break;
    case 6:
      unint64_t result = 5452876;
      break;
    case 7:
      unint64_t result = 0x45504F4C45564544;
      break;
    case 8:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 9:
      unint64_t result = 0xD000000000000013;
      break;
    case 10:
      unint64_t result = 0xD000000000000017;
      break;
    case 11:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 12:
      unint64_t result = 0xD000000000000015;
      break;
    case 13:
    case 17:
      unint64_t result = 0xD000000000000016;
      break;
    case 14:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 15:
      unint64_t result = 0xD000000000000023;
      break;
    case 16:
      unint64_t result = 0xD00000000000001CLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100007CD0(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_100007AB8(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_100007AB8(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_100009350();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

unint64_t sub_100007D60()
{
  unint64_t result = qword_100010140;
  if (!qword_100010140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010140);
  }
  return result;
}

Swift::Int sub_100007DB4()
{
  char v1 = *v0;
  sub_100009370();
  sub_100007AB8(v1);
  sub_100009330();
  swift_bridgeObjectRelease();
  return sub_100009380();
}

uint64_t sub_100007E18()
{
  sub_100007AB8(*v0);
  sub_100009330();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100007E6C()
{
  char v1 = *v0;
  sub_100009370();
  sub_100007AB8(v1);
  sub_100009330();
  swift_bridgeObjectRelease();
  return sub_100009380();
}

uint64_t sub_100007ECC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100008CC4();
  *a1 = result;
  return result;
}

unint64_t sub_100007EFC@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_100007AB8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100007F28()
{
  return sub_100007F64(&qword_100010148, &qword_100010150);
}

uint64_t sub_100007F64(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100006D90(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_100007FA8(void *a1@<X8>)
{
  *a1 = &off_10000C788;
}

unint64_t sub_100007FB8()
{
  return sub_1000078A0(*v0);
}

uint64_t sub_100007FC0@<X0>(unsigned char *a1@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = sub_100008CC4();
  *a1 = result;
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for DeveloperSettingsDestination(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_100008020(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100008028(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DeveloperSettingsDestination()
{
  return &type metadata for DeveloperSettingsDestination;
}

ValueMetadata *type metadata accessor for DeveloperSettingsDeepLink.AvailableLinksQuery()
{
  return &type metadata for DeveloperSettingsDeepLink.AvailableLinksQuery;
}

uint64_t _s24DeveloperSettingsIntents28DeveloperSettingsDestinationOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEF) {
    goto LABEL_17;
  }
  if (a2 + 17 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 17) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 17;
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
      return (*a1 | (v4 << 8)) - 17;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 17;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x12;
  int v8 = v6 - 18;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s24DeveloperSettingsIntents28DeveloperSettingsDestinationOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 17 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 17) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEE)
  {
    unsigned int v6 = ((a2 - 239) >> 8) + 1;
    *uint64_t result = a2 + 17;
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
        JUMPOUT(0x1000081ACLL);
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
          *uint64_t result = a2 + 17;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DeveloperSettingsDeepLink()
{
  return &type metadata for DeveloperSettingsDeepLink;
}

ValueMetadata *type metadata accessor for OpenDeveloperSettingsDeepLink()
{
  return &type metadata for OpenDeveloperSettingsDeepLink;
}

char *sub_1000081F4(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_100008234(a1, a2, a3, *v3);
  *int v3 = result;
  return result;
}

char *sub_100008214(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_100008320(a1, a2, a3, *v3);
  *int v3 = result;
  return result;
}

char *sub_100008234(char *result, int64_t a2, char a3, char *a4)
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
    sub_100008D18(&qword_1000101A0);
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

char *sub_100008320(char *result, int64_t a2, char a3, char *a4)
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
    sub_100008D18(&qword_100010190);
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

uint64_t sub_10000840C()
{
  uint64_t v16 = sub_1000092B0();
  uint64_t v0 = *(void *)(v16 - 8);
  ((void (*)(void))__chkstk_darwin)();
  int v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008D18(&qword_1000101B8);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  char v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  int64_t v7 = (char *)&v16 - v6;
  uint64_t v8 = sub_100008D18(&qword_100010160);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100009310();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_100008D18(&qword_1000101C0);
  sub_100009300();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
  char v17 = 18;
  uint64_t v13 = sub_1000091A0();
  v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v7, 1, 1, v13);
  v14(v5, 1, 1, v13);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v16);
  sub_1000047B8();
  return sub_1000091E0();
}

uint64_t sub_1000086F4()
{
  return _swift_task_switch(sub_100008710, 0, 0);
}

uint64_t sub_100008710()
{
  sub_1000081F4(0, 18, 0);
  uint64_t v1 = 0;
  int v2 = &_swiftEmptyArrayStorage;
  uint64_t v3 = *((void *)&_swiftEmptyArrayStorage + 2);
  do
  {
    char v4 = *((unsigned char *)&off_10000C788 + v1 + 32);
    uint64_t v8 = v2;
    unint64_t v5 = v2[3];
    if (v3 + v1 >= v5 >> 1)
    {
      sub_1000081F4((char *)(v5 > 1), v3 + v1 + 1, 1);
      int v2 = v8;
    }
    v2[2] = v3 + v1 + 1;
    *((unsigned char *)v2 + v3 + v1++ + 32) = v4;
  }
  while (v1 != 18);
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_10000881C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10000883C, 0, 0);
}

uint64_t sub_10000883C()
{
  uint64_t v1 = swift_bridgeObjectRetain();
  sub_100008988(v1);
  uint64_t v3 = v2;
  swift_bridgeObjectRelease();
  int64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    sub_1000081F4(0, v4, 0);
    uint64_t v5 = 0;
    uint64_t v6 = *((void *)&_swiftEmptyArrayStorage + 2);
    do
    {
      char v7 = *(unsigned char *)(v3 + v5 + 32);
      unint64_t v8 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v6 + v5 >= v8 >> 1) {
        sub_1000081F4((char *)(v8 > 1), v6 + v5 + 1, 1);
      }
      *((void *)&_swiftEmptyArrayStorage + 2) = v6 + v5 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage + v6 + v5++ + 32) = v7;
    }
    while (v4 != v5);
  }
  swift_bridgeObjectRelease();
  uint64_t v9 = *(uint64_t (**)(void *))(v0 + 8);
  return v9(&_swiftEmptyArrayStorage);
}

void sub_100008988(uint64_t a1)
{
  unint64_t v1 = 0;
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = a1 + 32;
  uint64_t v11 = &_swiftEmptyArrayStorage;
LABEL_2:
  if (v1 <= v2) {
    unint64_t v4 = v2;
  }
  else {
    unint64_t v4 = v1;
  }
  while (v2 != v1)
  {
    if (v4 == v1)
    {
      __break(1u);
      return;
    }
    char v5 = *(unsigned char *)(v3 + v1++);
    id v6 = [self currentDevice];
    unsigned int v7 = objc_msgSend(v6, "sf_isDeveloperModeEnabled");

    if (v7)
    {
      unint64_t v8 = v11;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100008214(0, v11[2] + 1, 1);
        unint64_t v8 = v11;
      }
      unint64_t v10 = v8[2];
      unint64_t v9 = v8[3];
      if (v10 >= v9 >> 1)
      {
        sub_100008214((char *)(v9 > 1), v10 + 1, 1);
        unint64_t v8 = v11;
      }
      v8[2] = v10 + 1;
      uint64_t v11 = v8;
      *((unsigned char *)v8 + v10 + 32) = v5;
      goto LABEL_2;
    }
  }
}

uint64_t sub_100008AC0()
{
  return _swift_task_switch(sub_100008ADC, 0, 0);
}

uint64_t sub_100008ADC()
{
  sub_100008988((uint64_t)&off_10000C788);
  uint64_t v2 = v1;
  int64_t v3 = *(void *)(v1 + 16);
  if (v3)
  {
    sub_1000081F4(0, v3, 0);
    uint64_t v4 = 0;
    uint64_t v5 = *((void *)&_swiftEmptyArrayStorage + 2);
    do
    {
      char v6 = *(unsigned char *)(v2 + v4 + 32);
      unint64_t v7 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v5 + v4 >= v7 >> 1) {
        sub_1000081F4((char *)(v7 > 1), v5 + v4 + 1, 1);
      }
      *((void *)&_swiftEmptyArrayStorage + 2) = v5 + v4 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage + v5 + v4++ + 32) = v6;
    }
    while (v3 != v4);
  }
  swift_bridgeObjectRelease();
  unint64_t v8 = *(uint64_t (**)(void *))(v0 + 8);
  return v8(&_swiftEmptyArrayStorage);
}

uint64_t sub_100008C1C()
{
  return _swift_task_switch(sub_100008C38, 0, 0);
}

uint64_t sub_100008C38()
{
  sub_100008988((uint64_t)&off_10000C788);
  if (*(void *)(v1 + 16)) {
    uint64_t v2 = *(unsigned __int8 *)(v1 + 32);
  }
  else {
    uint64_t v2 = 18;
  }
  swift_bridgeObjectRelease();
  int64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_100008CC4()
{
  unint64_t v0 = sub_100009360();
  swift_bridgeObjectRelease();
  if (v0 >= 0x12) {
    return 18;
  }
  else {
    return v0;
  }
}

uint64_t sub_100008D18(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100008D5C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100008D94(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_100008DF8()
{
  unint64_t result = qword_100010170;
  if (!qword_100010170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010170);
  }
  return result;
}

uint64_t sub_100008E4C(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

unint64_t sub_100008E64()
{
  unint64_t result = qword_1000101C8;
  if (!qword_1000101C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101C8);
  }
  return result;
}

unint64_t sub_100008EB8()
{
  unint64_t result = qword_1000101D0;
  if (!qword_1000101D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101D0);
  }
  return result;
}

uint64_t sub_100008F10(uint64_t a1)
{
  unint64_t v2 = sub_1000090BC();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

void __swiftcall DELETE_ME_AFTER_123714910.init()()
{
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100009014()
{
  unint64_t result = qword_1000101D8;
  if (!qword_1000101D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101D8);
  }
  return result;
}

uint64_t sub_10000906C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000090BC()
{
  unint64_t result = qword_1000101E0;
  if (!qword_1000101E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101E0);
  }
  return result;
}

ValueMetadata *type metadata accessor for DELETE_ME_AFTER_123714910()
{
  return &type metadata for DELETE_ME_AFTER_123714910;
}

ValueMetadata *type metadata accessor for DeveloperSettingsIntentsExtension()
{
  return &type metadata for DeveloperSettingsIntentsExtension;
}

uint64_t sub_100009140()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100009150()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100009160()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_1000091A0()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_1000091B0()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_1000091C0()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_1000091D0()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_1000091E0()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_1000091F0()
{
  return DisplayRepresentation.Image.init(utTypeIdentifier:)();
}

uint64_t sub_100009200()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100009210()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_100009220()
{
  return static EnumerableEntityQuery.findIntentDescription.getter();
}

uint64_t sub_100009230()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_100009240()
{
  return URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_100009270()
{
  return EntityURLRepresentation.StringInterpolation.appendInterpolation(_:)();
}

void sub_100009280(Swift::String a1)
{
}

uint64_t sub_100009290()
{
  return EntityURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_1000092A0()
{
  return EntityURLRepresentation.init(stringInterpolation:)();
}

uint64_t sub_1000092B0()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_1000092C0()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_1000092D0()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_1000092E0()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100009300()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100009310()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100009320()
{
  return static AppExtension.main()();
}

uint64_t sub_100009330()
{
  return String.hash(into:)();
}

uint64_t sub_100009340()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100009350()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100009360()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t sub_100009370()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100009380()
{
  return Hasher._finalize()();
}

uint64_t MobileGestalt_get_current_device()
{
  return _MobileGestalt_get_current_device();
}

uint64_t MobileGestalt_get_wapiCapability()
{
  return _MobileGestalt_get_wapiCapability();
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