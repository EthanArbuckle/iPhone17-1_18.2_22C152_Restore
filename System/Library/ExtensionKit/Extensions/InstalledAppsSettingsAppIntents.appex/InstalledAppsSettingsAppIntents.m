uint64_t sub_100003684(uint64_t a1)
{
  unint64_t v2;
  uint64_t vars8;

  v2 = sub_1000037D8();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100003730()
{
  unint64_t result = qword_100010070;
  if (!qword_100010070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010070);
  }
  return result;
}

uint64_t sub_100003788()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000037D8()
{
  unint64_t result = qword_100010078;
  if (!qword_100010078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010078);
  }
  return result;
}

ValueMetadata *type metadata accessor for InstalledAppsSettingsAppIntentsExtension()
{
  return &type metadata for InstalledAppsSettingsAppIntentsExtension;
}

unint64_t sub_100003840()
{
  unint64_t result = qword_100010088;
  if (!qword_100010088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010088);
  }
  return result;
}

unint64_t sub_100003898()
{
  unint64_t result = qword_100010090;
  if (!qword_100010090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010090);
  }
  return result;
}

uint64_t sub_1000038EC()
{
  uint64_t v0 = sub_100009D10();
  sub_10000665C(v0, qword_100010E30);
  sub_100006624(v0, (uint64_t)qword_100010E30);
  return sub_100009CF0();
}

double sub_100003950@<D0>(uint64_t a1@<X8>)
{
  sub_100009B80();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_100003994()
{
  return sub_100009B90();
}

void (*sub_1000039D4(void *a1))(void *a1)
{
  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100009B70();
  return sub_100003A30;
}

void sub_100003A30(void *a1)
{
  v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_100003A80()
{
  unint64_t result = qword_100010098;
  if (!qword_100010098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010098);
  }
  return result;
}

uint64_t sub_100003AD4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100009968();
  unint64_t v5 = sub_1000066C0();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_100003B40()
{
  unint64_t result = qword_1000100A0;
  if (!qword_1000100A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100A0);
  }
  return result;
}

unint64_t sub_100003B98()
{
  unint64_t result = qword_1000100A8;
  if (!qword_1000100A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100A8);
  }
  return result;
}

unint64_t sub_100003BF0()
{
  unint64_t result = qword_1000100B0;
  if (!qword_1000100B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100B0);
  }
  return result;
}

uint64_t sub_100003C44()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100003C94@<X0>(uint64_t a1@<X8>)
{
  return sub_1000061B4(&qword_100010040, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100010E30, a1);
}

uint64_t sub_100003CCC()
{
  return 0;
}

uint64_t sub_100003CD8()
{
  return 1;
}

uint64_t sub_100003CE8(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100009968();
  unint64_t v6 = sub_1000099BC();
  unint64_t v7 = sub_1000066C0();
  *unint64_t v4 = v2;
  v4[1] = sub_100003DB4;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_100003DB4()
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

uint64_t sub_100003EBC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100007D48();
  *a1 = result;
  return result;
}

uint64_t sub_100003EE4(uint64_t a1)
{
  unint64_t v2 = sub_100003A80();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100003F24()
{
  unint64_t result = qword_1000100C0;
  if (!qword_1000100C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100C0);
  }
  return result;
}

unint64_t sub_100003F7C()
{
  unint64_t result = qword_1000100C8;
  if (!qword_1000100C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100C8);
  }
  return result;
}

unint64_t sub_100003FD4()
{
  unint64_t result = qword_1000100D0[0];
  if (!qword_1000100D0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000100D0);
  }
  return result;
}

uint64_t sub_100004028()
{
  sub_1000065E0(&qword_1000101E0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10000A590;
  *(void *)(inited + 40) = 0x800000010000AEB0;
  *(void *)(inited + 48) = 0xD000000000000010;
  *(void *)(inited + 56) = 0x800000010000AE30;
  *(void *)(inited + 64) = 0xD000000000000012;
  *(void *)(inited + 72) = 0x800000010000AED0;
  strcpy((char *)(inited + 80), "com.apple.Home");
  *(unsigned char *)(inited + 95) = -18;
  *(void *)(inited + 96) = 0xD000000000000015;
  *(void *)(inited + 104) = 0x800000010000B2F0;
  *(void *)(inited + 112) = 0xD000000000000010;
  *(void *)(inited + 120) = 0x800000010000B310;
  *(void *)(inited + 32) = 0xD000000000000012;
  v1 = (void *)sub_100008030(inited);
  swift_setDeallocating();
  uint64_t result = swift_arrayDestroy();
  off_100010080 = v1;
  return result;
}

uint64_t sub_100004148@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>)
{
  v30._uint64_t countAndFlagsBits = a3;
  v30._object = a4;
  uint64_t v32 = a5;
  uint64_t v33 = a2;
  uint64_t v6 = sub_100009DA0();
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  __chkstk_darwin(v7);
  uint64_t v8 = sub_1000065E0(&qword_100010178);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  v29 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v12 = (char *)&v29 - v11;
  uint64_t v13 = sub_1000065E0(&qword_100010180);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  v31 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v17 = (char *)&v29 - v16;
  uint64_t v18 = sub_100009D10();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v21 = __chkstk_darwin(v20);
  __chkstk_darwin(v21);
  if (a1 == 1953460082 && v33 == 0xE400000000000000 || (sub_10000A000() & 1) != 0)
  {
    sub_100009CF0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v17, 1, 1, v18);
    sub_100009BB0();
    uint64_t v22 = sub_100009BD0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v12, 0, 1, v22);
    sub_1000065E0(&qword_100010188);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_10000A5A0;
    sub_100009CF0();
    sub_100009CF0();
    sub_100009CF0();
  }
  else
  {
    sub_100009D90();
    v34._uint64_t countAndFlagsBits = 0;
    v34._object = (void *)0xE000000000000000;
    sub_100009D80(v34);
    uint64_t countAndFlagsBits = v30._countAndFlagsBits;
    object = v30._object;
    sub_100009D70(v30);
    v35._uint64_t countAndFlagsBits = 0;
    v35._object = (void *)0xE000000000000000;
    sub_100009D80(v35);
    sub_100009D00();
    v25 = v31;
    sub_100009CF0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v25, 0, 1, v18);
    swift_bridgeObjectRetain();
    v26 = v29;
    sub_100009BC0();
    uint64_t v27 = sub_100009BD0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v26, 0, 1, v27);
    sub_100009D90();
    v36._uint64_t countAndFlagsBits = 10256610;
    v36._object = (void *)0xA300000000000000;
    sub_100009D80(v36);
    v37._uint64_t countAndFlagsBits = countAndFlagsBits;
    v37._object = object;
    sub_100009D70(v37);
    v38._object = (void *)0x800000010000AF00;
    v38._uint64_t countAndFlagsBits = 0x100000000000005CLL;
    sub_100009D80(v38);
    v39._uint64_t countAndFlagsBits = countAndFlagsBits;
    v39._object = object;
    sub_100009D70(v39);
    v40._uint64_t countAndFlagsBits = 46;
    v40._object = (void *)0xE100000000000000;
    sub_100009D80(v40);
    sub_100009D00();
  }
  return sub_100009BE0();
}

uint64_t sub_10000468C()
{
  uint64_t v0 = sub_1000065E0(&qword_100010180);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100009D10();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_100009CC0();
  sub_10000665C(v5, qword_100010E48);
  sub_100006624(v5, (uint64_t)qword_100010E48);
  sub_100009CF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_100009CB0();
}

uint64_t sub_1000047FC(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100009D60();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = &v48[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v6);
  uint64_t v10 = &v48[-v9];
  id v11 = [a1 bundleIdentifier];
  if (!v11) {
    goto LABEL_21;
  }
  v12 = v11;
  uint64_t v13 = sub_100009DC0();
  unint64_t v15 = v14;

  swift_bridgeObjectRetain();
  if (sub_100009A9C() != 32)
  {
    if (qword_100010058 != -1) {
      swift_once();
    }
    sub_100006624(v4, (uint64_t)qword_100010E60);
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_100009D40();
    os_log_type_t v17 = sub_100009E70();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 141558275;
      uint64_t v51 = 1752392040;
      uint64_t v52 = v21;
      sub_100009EB0();
      *(_WORD *)(v18 + 12) = 2081;
      swift_bridgeObjectRetain();
      uint64_t v51 = sub_100006838(v13, v15, &v52);
      sub_100009EB0();
      swift_bridgeObjectRelease_n();
      uint64_t v20 = "Ignoring '%{private,mask.hash}s' (system application).";
      goto LABEL_19;
    }
LABEL_20:

    swift_bridgeObjectRelease_n();
    goto LABEL_21;
  }
  if (qword_100010048 != -1) {
    swift_once();
  }
  if (sub_100005338(v13, v15, (uint64_t)off_100010080))
  {
    if (qword_100010058 != -1) {
      swift_once();
    }
    sub_100006624(v4, (uint64_t)qword_100010E60);
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_100009D40();
    os_log_type_t v17 = sub_100009E70();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 141558275;
      uint64_t v51 = 1752392040;
      uint64_t v52 = v19;
      sub_100009EB0();
      *(_WORD *)(v18 + 12) = 2081;
      swift_bridgeObjectRetain();
      uint64_t v51 = sub_100006838(v13, v15, &v52);
      sub_100009EB0();
      swift_bridgeObjectRelease_n();
      uint64_t v20 = "Ignoring '%{private,mask.hash}s' (not allowed).";
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v16, v17, v20, (uint8_t *)v18, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

LABEL_21:
      char v24 = 0;
      return v24 & 1;
    }
    goto LABEL_20;
  }
  id v22 = [a1 appClipMetadata];

  if (v22)
  {
    if (qword_100010058 != -1) {
      swift_once();
    }
    sub_100006624(v4, (uint64_t)qword_100010E60);
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_100009D40();
    os_log_type_t v17 = sub_100009E70();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 141558275;
      uint64_t v51 = 1752392040;
      uint64_t v52 = v23;
      sub_100009EB0();
      *(_WORD *)(v18 + 12) = 2081;
      swift_bridgeObjectRetain();
      uint64_t v51 = sub_100006838(v13, v15, &v52);
      sub_100009EB0();
      swift_bridgeObjectRelease_n();
      uint64_t v20 = "Ignoring '%{private,mask.hash}s' (App Clip).";
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  char v24 = sub_100005338(v13, v15, a2);
  if ([a1 developerType] == 1)
  {
    if (qword_100010058 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_100006624(v4, (uint64_t)qword_100010E60);
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v10, v26, v4);
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_100009D40();
    os_log_type_t v28 = sub_100009E70();
    int v29 = v28;
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v30 = swift_slowAlloc();
      int v49 = v29;
      uint64_t v31 = v30;
      uint64_t v32 = swift_slowAlloc();
      uint64_t v50 = v32;
      *(_DWORD *)uint64_t v31 = 141558531;
      uint64_t v51 = 1752392040;
      uint64_t v52 = v32;
      sub_100009EB0();
      *(_WORD *)(v31 + 12) = 2081;
      swift_bridgeObjectRetain();
      uint64_t v51 = sub_100006838(v13, v15, &v52);
      sub_100009EB0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v31 + 22) = 2080;
      if (v24) {
        uint64_t v33 = 29545;
      }
      else {
        uint64_t v33 = 0x746F6E207369;
      }
      if (v24) {
        unint64_t v34 = 0xE200000000000000;
      }
      else {
        unint64_t v34 = 0xE600000000000000;
      }
      uint64_t v51 = sub_100006838(v33, v34, &v52);
      sub_100009EB0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v27, (os_log_type_t)v49, "Application '%{private,mask.hash}s' %s Launchable (#1).", (uint8_t *)v31, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v10, v4);
  }
  else if ([a1 isWebAppPlaceholder])
  {
    if (qword_100010058 != -1) {
      swift_once();
    }
    sub_100006624(v4, (uint64_t)qword_100010E60);
    swift_bridgeObjectRetain();
    Swift::String v35 = sub_100009D40();
    os_log_type_t v36 = sub_100009E70();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      *(_DWORD *)uint64_t v37 = 141558275;
      uint64_t v51 = 1752392040;
      uint64_t v52 = v38;
      sub_100009EB0();
      *(_WORD *)(v37 + 12) = 2081;
      swift_bridgeObjectRetain();
      uint64_t v51 = sub_100006838(v13, v15, &v52);
      sub_100009EB0();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "Application '%{private,mask.hash}s' is web app.", (uint8_t *)v37, 0x16u);
      char v24 = 1;
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      char v24 = 1;
    }
  }
  else
  {
    if (qword_100010058 != -1) {
      swift_once();
    }
    uint64_t v39 = sub_100006624(v4, (uint64_t)qword_100010E60);
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v8, v39, v4);
    swift_bridgeObjectRetain();
    Swift::String v40 = sub_100009D40();
    os_log_type_t v41 = sub_100009E70();
    int v42 = v41;
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v43 = swift_slowAlloc();
      int v49 = v42;
      uint64_t v44 = v43;
      uint64_t v45 = swift_slowAlloc();
      uint64_t v50 = v45;
      *(_DWORD *)uint64_t v44 = 141558531;
      uint64_t v51 = 1752392040;
      uint64_t v52 = v45;
      sub_100009EB0();
      *(_WORD *)(v44 + 12) = 2081;
      swift_bridgeObjectRetain();
      uint64_t v51 = sub_100006838(v13, v15, &v52);
      sub_100009EB0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v44 + 22) = 2080;
      if (v24) {
        uint64_t v46 = 29545;
      }
      else {
        uint64_t v46 = 0x746F6E207369;
      }
      if (v24) {
        unint64_t v47 = 0xE200000000000000;
      }
      else {
        unint64_t v47 = 0xE600000000000000;
      }
      uint64_t v51 = sub_100006838(v46, v47, &v52);
      sub_100009EB0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v40, (os_log_type_t)v49, "Application '%{private,mask.hash}s' %s Launchable (#2).", (uint8_t *)v44, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v8, v4);
  }
  return v24 & 1;
}

uint64_t sub_100005338(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_10000A030();
    sub_100009DD0();
    Swift::Int v6 = sub_10000A040();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      id v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_10000A000() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          uint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_10000A000() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_100005470(uint64_t a1, void *a2)
{
  uint64_t v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  LOBYTE(v3) = v3();
  swift_release();

  return v3 & 1;
}

uint64_t sub_1000054C8(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_1000101F0 + dword_1000101F0);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100005570;
  return v5(a1);
}

uint64_t sub_100005570(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_100005670(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_1000101A8 + dword_1000101A8);
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  void *v2 = v1;
  v2[1] = sub_100009A10;
  return v4();
}

unint64_t sub_100005718()
{
  unint64_t result = qword_1000100E8;
  if (!qword_1000100E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100E8);
  }
  return result;
}

uint64_t sub_10000576C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_1000101A8 + dword_1000101A8);
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  void *v2 = v1;
  v2[1] = sub_100005810;
  return v4();
}

uint64_t sub_100005810(uint64_t a1)
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

unint64_t sub_100005928()
{
  unint64_t result = qword_1000100F8;
  if (!qword_1000100F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100F8);
  }
  return result;
}

unint64_t sub_100005980()
{
  unint64_t result = qword_100010100;
  if (!qword_100010100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010100);
  }
  return result;
}

unint64_t sub_1000059D8()
{
  unint64_t result = qword_100010108;
  if (!qword_100010108)
  {
    sub_100005A4C(qword_100010110);
    sub_100005980();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010108);
  }
  return result;
}

uint64_t sub_100005A4C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005A94(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100005718();
  *uint64_t v5 = v2;
  v5[1] = sub_100005B48;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100005B48()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100005C3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100005B48;
  return DynamicOptionsProvider.defaultResult()(a1, a2, a3);
}

unint64_t sub_100005CFC()
{
  unint64_t result = qword_100010128;
  if (!qword_100010128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010128);
  }
  return result;
}

uint64_t sub_100005D50()
{
  uint64_t v0 = sub_1000065E0(&qword_100010198);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000065E0(&qword_1000101A0);
  __chkstk_darwin(v4);
  sub_100003FD4();
  sub_100009C70();
  v7._object = (void *)0x800000010000B020;
  v7._uint64_t countAndFlagsBits = 0xD00000000000002ELL;
  sub_100009C60(v7);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for EntityURLRepresentation.StringInterpolation.Token.id<A>(_:), v0);
  sub_100009C50();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v8._uint64_t countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  sub_100009C60(v8);
  return sub_100009C80();
}

unint64_t sub_100005F10()
{
  unint64_t result = qword_100010130;
  if (!qword_100010130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010130);
  }
  return result;
}

unint64_t sub_100005F68()
{
  unint64_t result = qword_100010138;
  if (!qword_100010138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010138);
  }
  return result;
}

void *sub_100005FBC()
{
  return &protocol witness table for String;
}

uint64_t sub_100005FC8()
{
  sub_1000066C0();
  uint64_t v2 = sub_100009C20();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100006714(v3, v0, v2, v1);
}

unint64_t sub_100006060()
{
  unint64_t result = qword_100010148;
  if (!qword_100010148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010148);
  }
  return result;
}

unint64_t sub_1000060B8()
{
  unint64_t result = qword_100010150;
  if (!qword_100010150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010150);
  }
  return result;
}

unint64_t sub_100006110()
{
  unint64_t result = qword_100010158;
  if (!qword_100010158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010158);
  }
  return result;
}

void *sub_100006164()
{
  return &protocol witness table for String;
}

uint64_t sub_100006170@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_10000617C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000061B4(&qword_100010050, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100010E48, a1);
}

uint64_t sub_1000061B4@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100006624(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

unint64_t sub_10000625C()
{
  unint64_t result = qword_100010160;
  if (!qword_100010160)
  {
    sub_100005A4C(&qword_100010168);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010160);
  }
  return result;
}

uint64_t sub_1000062B8(uint64_t a1)
{
  unint64_t v2 = sub_100003FD4();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100006308()
{
  unint64_t result = qword_100010170;
  if (!qword_100010170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010170);
  }
  return result;
}

uint64_t sub_10000635C@<X0>(uint64_t a1@<X8>)
{
  return sub_100004148(*(void *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16), *(void **)(v1 + 24), a1);
}

uint64_t sub_100006368(uint64_t a1)
{
  unint64_t v2 = sub_100006110();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for InstalledAppsSettingsDeepLinks.AvailableThirdPartyApplicationSettingsDestinationQuery()
{
  return &type metadata for InstalledAppsSettingsDeepLinks.AvailableThirdPartyApplicationSettingsDestinationQuery;
}

uint64_t initializeBufferWithCopyOfBuffer for InstalledAppsSettingsDeepLinks(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for InstalledAppsSettingsDeepLinks()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for InstalledAppsSettingsDeepLinks(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for InstalledAppsSettingsDeepLinks(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for InstalledAppsSettingsDeepLinks(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for InstalledAppsSettingsDeepLinks(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for InstalledAppsSettingsDeepLinks(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InstalledAppsSettingsDeepLinks(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InstalledAppsSettingsDeepLinks()
{
  return &type metadata for InstalledAppsSettingsDeepLinks;
}

ValueMetadata *type metadata accessor for OpenInstalledAppsSettingsDeepLinks()
{
  return &type metadata for OpenInstalledAppsSettingsDeepLinks;
}

uint64_t sub_1000065E0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100006624(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_10000665C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_1000066C0()
{
  unint64_t result = qword_100010190;
  if (!qword_100010190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010190);
  }
  return result;
}

uint64_t sub_100006714(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

char *sub_100006728(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
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
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_1000065E0(&qword_1000101D0);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[32 * v8 + 32]) {
          memmove(v13, a4 + 32, 32 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100008348(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100006838(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000690C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100008F64((uint64_t)v12, *a3);
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
      sub_100008F64((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100008FC0((uint64_t)v12);
  return v7;
}

uint64_t sub_10000690C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100009EC0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100006AC8(a5, a6);
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
  uint64_t v8 = sub_100009F80();
  if (!v8)
  {
    sub_100009FD0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100009FF0();
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

uint64_t sub_100006AC8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100006B60(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100006D40(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100006D40(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100006B60(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100006CD8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100009F60();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100009FD0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100009DE0();
      if (!v2) {
        return _swiftEmptyArrayStorage;
      }
    }
    sub_100009FF0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100009FD0();
    __break(1u);
  }
  else
  {
    return _swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100006CD8(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  sub_1000065E0(&qword_1000101C8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100006D40(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000065E0(&qword_1000101C8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
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
  uint64_t result = sub_100009FF0();
  __break(1u);
  return result;
}

uint64_t sub_100006E90(void *a1, void *a2)
{
  unint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_100009F00();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_100008EC4();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_100009EF0();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_100007110(v7, result + 1);
    os_log_type_t v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_1000072F8();
      uint64_t v23 = v28;
    }
    else
    {
      uint64_t v23 = (void *)v22;
      id v24 = v8;
    }
    sub_100007598((uint64_t)v8, v23);
    *unint64_t v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v11 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v12 = sub_100009E80(v11);
    uint64_t v13 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v14 = v12 & ~v13;
    if ((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      sub_100008EC4();
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = sub_100009E90();

      if (v16)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v20 = *(void **)(*(void *)(*v3 + 48) + 8 * v14);
        *a1 = v20;
        id v21 = v20;
        return 0;
      }
      uint64_t v17 = ~v13;
      while (1)
      {
        unint64_t v14 = (v14 + 1) & v17;
        if (((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0) {
          break;
        }
        id v18 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
        char v19 = sub_100009E90();

        if (v19) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v3;
    *unint64_t v3 = 0x8000000000000000;
    id v8 = a2;
    sub_10000761C((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    *unint64_t v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

Swift::Int sub_100007110(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_1000065E0(&qword_1000101D8);
    uint64_t v2 = sub_100009F40();
    uint64_t v14 = v2;
    sub_100009EE0();
    if (sub_100009F10())
    {
      sub_100008EC4();
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_1000072F8();
          uint64_t v2 = v14;
        }
        Swift::Int result = sub_100009E80(*(void *)(v2 + 40));
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_100009F10());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v2;
}

uint64_t sub_1000072F8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000065E0(&qword_1000101D8);
  uint64_t v3 = sub_100009F30();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    os_log_type_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = sub_100009E80(*(void *)(v4 + 40));
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v25 = v22 == v24;
          if (v22 == v24) {
            unint64_t v22 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

unint64_t sub_100007598(uint64_t a1, void *a2)
{
  sub_100009E80(a2[5]);
  unint64_t result = sub_100009ED0();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

void sub_10000761C(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_1000072F8();
  }
  else
  {
    if (v7 > v6)
    {
      sub_100007794();
      goto LABEL_14;
    }
    sub_100007940();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = sub_100009E80(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_100008EC4();
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_100009E90();

    if (v12)
    {
LABEL_13:
      sub_10000A020();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_100009E90();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

id sub_100007794()
{
  uint64_t v1 = v0;
  sub_1000065E0(&qword_1000101D8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100009F20();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_100007940()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000065E0(&qword_1000101D8);
  uint64_t v3 = sub_100009F30();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  os_log_type_t v28 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    Swift::Int v19 = *(void *)(v4 + 40);
    id v20 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_100009E80(v19);
    uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v13 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v20;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v28;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_100007BBC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100007BDC(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100007BDC(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000065E0(&qword_1000101E0);
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
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
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
  uint64_t result = sub_100009FF0();
  __break(1u);
  return result;
}

uint64_t sub_100007D48()
{
  uint64_t v17 = sub_100009C90();
  uint64_t v0 = *(void *)(v17 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000065E0(&qword_1000101F8);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  int64_t v7 = (char *)&v16 - v6;
  uint64_t v8 = sub_1000065E0(&qword_100010180);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100009D10();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_1000065E0(&qword_100010200);
  sub_100009CF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
  uint64_t v13 = sub_100009B60();
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v7, 1, 1, v13);
  v14(v5, 1, 1, v13);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17);
  sub_100003FD4();
  return sub_100009BA0();
}

Swift::Int sub_100008030(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_1000065E0(&qword_1000101E8);
    uint64_t v3 = sub_100009F50();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_10000A030();
      swift_bridgeObjectRetain();
      sub_100009DD0();
      Swift::Int result = sub_10000A040();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        uint64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (Swift::Int result = sub_10000A000(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          long long v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            Swift::Int result = sub_10000A000();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      uint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *uint64_t v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

uint64_t sub_1000081D4(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_100009FE0();
    swift_bridgeObjectRelease();
  }
  sub_100008EC4();
  sub_100008F04(&qword_1000101C0, (void (*)(uint64_t))sub_100008EC4);
  uint64_t result = sub_100009E40();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_100009FE0();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return v10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4) {
      return v10;
    }
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        uint64_t v6 = (void *)sub_100009F70();
        sub_100006E90(&v9, v6);
      }
    }
    else
    {
      uint64_t v7 = (void **)(a1 + 32);
      do
      {
        uint64_t v8 = *v7++;
        sub_100006E90(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100008348(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_100009FF0();
  __break(1u);
  return result;
}

uint64_t sub_10000843C()
{
  uint64_t v1 = sub_100009D60();
  v0[28] = v1;
  v0[29] = *(void *)(v1 - 8);
  v0[30] = swift_task_alloc();
  uint64_t v2 = sub_100009D20();
  v0[31] = v2;
  v0[32] = *(void *)(v2 - 8);
  v0[33] = swift_task_alloc();
  return _swift_task_switch(sub_100008554, 0, 0);
}

void sub_100008554()
{
  v72 = v0;
  uint64_t v1 = SBSCopyDisplayIdentifiers();
  if (!v1)
  {
LABEL_63:
    __break(1u);
    return;
  }
  uint64_t v2 = (void *)v1;
  sub_100009E30();

  id v3 = [self enumeratorWithOptions:192];
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = &_swiftEmptySetSingleton;
  v0[6] = sub_100008EA4;
  v0[7] = v4;
  v0[2] = _NSConcreteStackBlock;
  v0[3] = 1107296256;
  v0[4] = sub_100005470;
  v0[5] = &unk_10000CE00;
  unint64_t v5 = _Block_copy(v0 + 2);
  swift_release();
  [v3 setFilter:v5];
  _Block_release(v5);
  unint64_t v6 = _swiftEmptyArrayStorage;
  uint64_t v71 = (uint64_t)_swiftEmptyArrayStorage;
  id v7 = v3;
  sub_100009E60();
  v59 = v7;

  sub_100008F04(&qword_1000101B0, (void (*)(uint64_t))&type metadata accessor for NSFastEnumerationIterator);
  sub_100009EA0();
  v70 = v0;
  if (v0[16])
  {
    uint64_t v8 = v0 + 21;
    id v9 = v0 + 26;
    do
    {
      sub_100008F54(v0 + 13, v8);
      sub_100008F64((uint64_t)v8, (uint64_t)(v0 + 17));
      sub_100008EC4();
      if ((swift_dynamicCast() & 1) == 0) {
        *id v9 = 0;
      }
      sub_100008FC0((uint64_t)v8);
      if (*v9)
      {
        sub_100009DF0();
        if (*(void *)((v71 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v71 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_100009E10();
        }
        sub_100009E20();
        sub_100009E00();
      }
      sub_100009EA0();
    }
    while (v0[16]);
    unint64_t v6 = (void *)v71;
  }
  (*(void (**)(void, void))(v0[32] + 8))(v0[33], v0[31]);
  uint64_t v10 = sub_1000081D4((unint64_t)v6);
  swift_bridgeObjectRelease();
  if ((v10 & 0xC000000000000001) != 0)
  {
    sub_100009EE0();
    sub_100008EC4();
    sub_100008F04(&qword_1000101C0, (void (*)(uint64_t))sub_100008EC4);
    sub_100009E50();
    uint64_t v10 = v0[8];
    uint64_t v63 = v0[9];
    uint64_t v11 = v0[10];
    uint64_t v12 = v0[11];
    unint64_t v13 = v0[12];
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v14 = -1 << *(unsigned char *)(v10 + 32);
    uint64_t v63 = v10 + 56;
    uint64_t v11 = ~v14;
    uint64_t v15 = -v14;
    if (v15 < 64) {
      uint64_t v16 = ~(-1 << v15);
    }
    else {
      uint64_t v16 = -1;
    }
    unint64_t v13 = v16 & *(void *)(v10 + 56);
  }
  v60 = v0 + 27;
  v61 = (id *)(v0 + 25);
  uint64_t v17 = v0[29];
  int64_t v62 = (unint64_t)(v11 + 64) >> 6;
  v67 = (void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
  v65 = (void (**)(uint64_t, uint64_t))(v17 + 8);
  uint64_t v18 = (char *)_swiftEmptyArrayStorage;
  uint64_t v66 = v10;
  if (v10 < 0) {
    goto LABEL_21;
  }
LABEL_19:
  if (v13)
  {
    uint64_t v19 = (v13 - 1) & v13;
    unint64_t v20 = __clz(__rbit64(v13)) | (v12 << 6);
    uint64_t v21 = v12;
    goto LABEL_38;
  }
  int64_t v24 = v12 + 1;
  if (__OFADD__(v12, 1))
  {
    __break(1u);
    goto LABEL_61;
  }
  if (v24 < v62)
  {
    unint64_t v25 = *(void *)(v63 + 8 * v24);
    uint64_t v21 = v12 + 1;
    if (v25) {
      goto LABEL_37;
    }
    uint64_t v21 = v12 + 2;
    if (v12 + 2 >= v62) {
      goto LABEL_54;
    }
    unint64_t v25 = *(void *)(v63 + 8 * v21);
    if (v25) {
      goto LABEL_37;
    }
    uint64_t v21 = v12 + 3;
    if (v12 + 3 >= v62) {
      goto LABEL_54;
    }
    unint64_t v25 = *(void *)(v63 + 8 * v21);
    if (v25) {
      goto LABEL_37;
    }
    uint64_t v21 = v12 + 4;
    if (v12 + 4 >= v62) {
      goto LABEL_54;
    }
    unint64_t v25 = *(void *)(v63 + 8 * v21);
    if (v25)
    {
LABEL_37:
      uint64_t v19 = (v25 - 1) & v25;
      unint64_t v20 = __clz(__rbit64(v25)) + (v21 << 6);
LABEL_38:
      id v23 = *(id *)(*(void *)(v10 + 48) + 8 * v20);
      if (v23)
      {
        while (1)
        {
          unint64_t v68 = v19;
          uint64_t v69 = v21;
          if (qword_100010058 != -1) {
            swift_once();
          }
          uint64_t v27 = v0[30];
          uint64_t v28 = v0[28];
          uint64_t v29 = sub_100006624(v28, (uint64_t)qword_100010E60);
          (*v67)(v27, v29, v28);
          id v30 = v23;
          uint64_t v31 = sub_100009D40();
          os_log_type_t v32 = sub_100009E70();
          if (os_log_type_enabled(v31, v32))
          {
            uint64_t v33 = swift_slowAlloc();
            uint64_t v71 = swift_slowAlloc();
            *(_DWORD *)uint64_t v33 = 141558275;
            *(void *)(v33 + 4) = 1752392040;
            *(_WORD *)(v33 + 12) = 2081;
            id v34 = [v30 bundleIdentifier];
            if (!v34)
            {

              __break(1u);
              goto LABEL_63;
            }
            Swift::String v35 = v34;
            uint64_t v36 = v0[30];
            uint64_t v64 = v70[28];
            uint64_t v37 = sub_100009DC0();
            unint64_t v39 = v38;

            *(void *)(v33 + 14) = sub_100006838(v37, v39, &v71);
            swift_bridgeObjectRelease();

            _os_log_impl((void *)&_mh_execute_header, v31, v32, "Creating Entity for '%{private,mask.hash}s'.", (uint8_t *)v33, 0x16u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            uint64_t v40 = v36;
            uint64_t v0 = v70;
            (*v65)(v40, v64);
          }
          else
          {
            uint64_t v41 = v0[30];
            uint64_t v42 = v0[28];

            (*v65)(v41, v42);
          }
          id v43 = [v30 bundleIdentifier];
          if (v43)
          {
            uint64_t v44 = v43;
            uint64_t v45 = sub_100009DC0();
            unint64_t v47 = v46;
          }
          else
          {
            uint64_t v45 = 0;
            unint64_t v47 = 0xE000000000000000;
          }
          id v48 = [v30 localizedName];
          uint64_t v49 = sub_100009DC0();
          uint64_t v51 = v50;

          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v18 = sub_100006728(0, *((void *)v18 + 2) + 1, 1, v18);
          }
          unint64_t v53 = *((void *)v18 + 2);
          unint64_t v52 = *((void *)v18 + 3);
          if (v53 >= v52 >> 1) {
            uint64_t v18 = sub_100006728((char *)(v52 > 1), v53 + 1, 1, v18);
          }
          *((void *)v18 + 2) = v53 + 1;
          v54 = &v18[32 * v53];
          *((void *)v54 + 4) = v45;
          *((void *)v54 + 5) = v47;
          *((void *)v54 + 6) = v49;
          *((void *)v54 + 7) = v51;

          uint64_t v12 = v69;
          unint64_t v13 = v68;
          uint64_t v10 = v66;
          if ((v66 & 0x8000000000000000) == 0) {
            goto LABEL_19;
          }
LABEL_21:
          uint64_t v22 = sub_100009F10();
          if (v22)
          {
            uint64_t *v60 = v22;
            sub_100008EC4();
            swift_unknownObjectRetain();
            swift_dynamicCast();
            id v23 = *v61;
            swift_unknownObjectRelease();
            uint64_t v21 = v12;
            uint64_t v19 = v13;
            if (v23) {
              continue;
            }
          }
          goto LABEL_54;
        }
      }
      goto LABEL_54;
    }
    uint64_t v26 = v12 + 5;
    while (v62 != v26)
    {
      unint64_t v25 = *(void *)(v63 + 8 * v26++);
      if (v25)
      {
        uint64_t v21 = v26 - 1;
        goto LABEL_37;
      }
    }
  }
LABEL_54:
  sub_100008F4C();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_61:
  }
    uint64_t v18 = sub_100006728(0, *((void *)v18 + 2) + 1, 1, v18);
  unint64_t v56 = *((void *)v18 + 2);
  unint64_t v55 = *((void *)v18 + 3);
  if (v56 >= v55 >> 1) {
    uint64_t v18 = sub_100006728((char *)(v55 > 1), v56 + 1, 1, v18);
  }
  *((void *)v18 + 2) = v56 + 1;
  v57 = &v18[32 * v56];
  *((void *)v57 + 4) = 1953460082;
  *((void *)v57 + 5) = 0xE400000000000000;
  *((void *)v57 + 6) = 0;
  *((void *)v57 + 7) = 0xE000000000000000;

  swift_task_dealloc();
  swift_task_dealloc();
  v58 = (void (*)(char *))v0[1];
  v58(v18);
}

uint64_t sub_100008E6C()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100008EA4(void *a1)
{
  return sub_1000047FC(a1, *(void *)(v1 + 16));
}

uint64_t sub_100008EAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100008EBC()
{
  return swift_release();
}

unint64_t sub_100008EC4()
{
  unint64_t result = qword_1000101B8;
  if (!qword_1000101B8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000101B8);
  }
  return result;
}

uint64_t sub_100008F04(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100008F4C()
{
  return swift_release();
}

_OWORD *sub_100008F54(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100008F64(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100008FC0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void *sub_100009014(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62) {
    goto LABEL_22;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      unint64_t v4 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v5 = (id)sub_100009F70();
LABEL_9:
        unint64_t v6 = v5;
        unint64_t v7 = v4 + 1;
        if (__OFADD__(v4, 1)) {
          goto LABEL_21;
        }
        id v8 = [v5 bundleIdentifier];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = sub_100009DC0();
          uint64_t v12 = v11;

          id v13 = [v6 appClipMetadata];
          if (v13)
          {

            swift_bridgeObjectRelease();
            goto LABEL_5;
          }
          if ([v6 developerType] != 1
            && [v6 isWebAppPlaceholder])
          {
            swift_bridgeObjectRelease();
LABEL_17:
            sub_100009F90();
            sub_100009FB0();
            sub_100009FC0();
            sub_100009FA0();
            goto LABEL_5;
          }
          char v14 = sub_100005338(v10, v12, a2);
          swift_bridgeObjectRelease();
          if (v14) {
            goto LABEL_17;
          }
        }

LABEL_5:
        ++v4;
        if (v7 == v3) {
          return &_swiftEmptyArrayStorage;
        }
      }
      if (v4 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_21:
      __break(1u);
LABEL_22:
      uint64_t v3 = sub_100009FE0();
      if (!v3) {
        return &_swiftEmptyArrayStorage;
      }
    }
    id v5 = *(id *)(a1 + 8 * v4 + 32);
    goto LABEL_9;
  }
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_100009214(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return _swift_task_switch(sub_1000092A4, 0, 0);
}

uint64_t sub_1000092A4()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = *(void *)(v1 + 16);
  if (!v2)
  {
    uint64_t v22 = _swiftEmptyArrayStorage[2];
    if (v22) {
      goto LABEL_29;
    }
    goto LABEL_37;
  }
  uint64_t v3 = v1 + 32;
  swift_bridgeObjectRetain();
  for (uint64_t i = 0; i != v2; ++i)
  {
    id v5 = (uint64_t *)(v3 + 16 * i);
    uint64_t v7 = *v5;
    uint64_t v6 = v5[1];
    swift_bridgeObjectRetain_n();
    if (sub_100009A9C() != 32)
    {
LABEL_3:
      swift_bridgeObjectRelease();
      continue;
    }
    if (qword_100010048 != -1) {
      swift_once();
    }
    id v8 = off_100010080;
    if (*((void *)off_100010080 + 2))
    {
      sub_10000A030();
      sub_100009DD0();
      Swift::Int v9 = sub_10000A040();
      uint64_t v10 = -1 << v8[32];
      unint64_t v11 = v9 & ~v10;
      uint64_t v12 = v8 + 56;
      if ((*(void *)&v8[((v11 >> 3) & 0xFFFFFFFFFFFFFF8) + 56] >> v11))
      {
        uint64_t v13 = *((void *)v8 + 6);
        char v14 = (void *)(v13 + 16 * v11);
        BOOL v15 = *v14 == v7 && v14[1] == v6;
        if (v15 || (sub_10000A000() & 1) != 0) {
          goto LABEL_3;
        }
        uint64_t v16 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v16;
          if (((*(void *)&v12[(v11 >> 3) & 0xFFFFFFFFFFFFFF8] >> v11) & 1) == 0) {
            break;
          }
          uint64_t v17 = (void *)(v13 + 16 * v11);
          BOOL v18 = *v17 == v7 && v17[1] == v6;
          if (v18 || (sub_10000A000() & 1) != 0) {
            goto LABEL_3;
          }
        }
      }
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      sub_100007BBC(0, _swiftEmptyArrayStorage[2] + 1, 1);
    }
    unint64_t v20 = _swiftEmptyArrayStorage[2];
    unint64_t v19 = _swiftEmptyArrayStorage[3];
    if (v20 >= v19 >> 1) {
      sub_100007BBC(v19 > 1, v20 + 1, 1);
    }
    _swiftEmptyArrayStorage[2] = v20 + 1;
    uint64_t v21 = (char *)&_swiftEmptyArrayStorage[2 * v20];
    *((void *)v21 + 4) = v7;
    *((void *)v21 + 5) = v6;
  }
  uint64_t v0 = (void *)v56;
  swift_bridgeObjectRelease();
  uint64_t v22 = _swiftEmptyArrayStorage[2];
  if (!v22)
  {
LABEL_37:
    swift_release();
    os_log_type_t v32 = (char *)_swiftEmptyArrayStorage;
LABEL_64:
    unint64_t v55 = (uint64_t (*)(char *))v0[1];
    return v55(v32);
  }
LABEL_29:
  uint64_t result = SBSCopyDisplayIdentifiers();
  if (result)
  {
    int64_t v24 = (void *)result;
    unint64_t v25 = (void **)(v0 + 2);
    sub_100009E30();

    swift_retain();
    uint64_t v26 = (char *)&_swiftEmptyArrayStorage[5];
    while (1)
    {
      id v27 = objc_allocWithZone((Class)LSApplicationRecord);
      swift_bridgeObjectRetain_n();
      NSString v28 = sub_100009DB0();
      swift_bridgeObjectRelease();
      char *v25 = 0;
      id v29 = [v27 initWithBundleIdentifier:v28 allowPlaceholder:0 error:v25];

      id v30 = *v25;
      if (!v29) {
        break;
      }
      id v31 = v30;
      swift_bridgeObjectRelease();
      sub_100009DF0();
      if (*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_100009E10();
      }
      v26 += 16;
      sub_100009E20();
      sub_100009E00();
      if (!--v22)
      {
        swift_release();
        swift_release();
        unint64_t v35 = (unint64_t)sub_100009014((unint64_t)_swiftEmptyArrayStorage, (uint64_t)&_swiftEmptySetSingleton);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v35 >> 62)
        {
          uint64_t v36 = sub_100009FE0();
          if (!v36) {
            goto LABEL_58;
          }
LABEL_43:
          if (v36 < 1) {
            __break(1u);
          }
          uint64_t v37 = 0;
          unint64_t v57 = v35 & 0xC000000000000001;
          os_log_type_t v32 = (char *)_swiftEmptyArrayStorage;
          v58 = (id *)v35;
          do
          {
            if (v57) {
              id v38 = (id)sub_100009F70();
            }
            else {
              id v38 = *(id *)(v35 + 8 * v37 + 32);
            }
            unint64_t v39 = v38;
            id v40 = [v38 bundleIdentifier];
            if (v40)
            {
              uint64_t v41 = v40;
              uint64_t v42 = sub_100009DC0();
              unint64_t v44 = v43;
            }
            else
            {
              uint64_t v42 = 0;
              unint64_t v44 = 0xE000000000000000;
            }
            id v45 = [v39 localizedName];
            uint64_t v46 = sub_100009DC0();
            uint64_t v48 = v47;

            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              os_log_type_t v32 = sub_100006728(0, *((void *)v32 + 2) + 1, 1, v32);
            }
            unint64_t v50 = *((void *)v32 + 2);
            unint64_t v49 = *((void *)v32 + 3);
            if (v50 >= v49 >> 1) {
              os_log_type_t v32 = sub_100006728((char *)(v49 > 1), v50 + 1, 1, v32);
            }
            ++v37;
            *((void *)v32 + 2) = v50 + 1;
            uint64_t v51 = &v32[32 * v50];
            *((void *)v51 + 4) = v42;
            *((void *)v51 + 5) = v44;
            *((void *)v51 + 6) = v46;
            *((void *)v51 + 7) = v48;

            unint64_t v35 = (unint64_t)v58;
          }
          while (v36 != v37);
        }
        else
        {
          uint64_t v36 = *(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (v36) {
            goto LABEL_43;
          }
LABEL_58:
          os_log_type_t v32 = (char *)_swiftEmptyArrayStorage;
        }
        swift_bridgeObjectRelease();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          os_log_type_t v32 = sub_100006728(0, *((void *)v32 + 2) + 1, 1, v32);
        }
        uint64_t v0 = (void *)v56;
        unint64_t v53 = *((void *)v32 + 2);
        unint64_t v52 = *((void *)v32 + 3);
        if (v53 >= v52 >> 1) {
          os_log_type_t v32 = sub_100006728((char *)(v52 > 1), v53 + 1, 1, v32);
        }
        *((void *)v32 + 2) = v53 + 1;
        v54 = &v32[32 * v53];
        *((void *)v54 + 4) = 1953460082;
        *((void *)v54 + 5) = 0xE400000000000000;
        *((void *)v54 + 6) = 0;
        *((void *)v54 + 7) = 0xE000000000000000;
        goto LABEL_64;
      }
    }
    id v33 = v30;
    sub_100009CE0();

    swift_willThrow();
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    id v34 = *(uint64_t (**)(void))(v56 + 8);
    return v34();
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_100009968()
{
  unint64_t result = qword_100010208;
  if (!qword_100010208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010208);
  }
  return result;
}

unint64_t sub_1000099BC()
{
  unint64_t result = qword_100010210;
  if (!qword_100010210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010210);
  }
  return result;
}

uint64_t sub_100009A14()
{
  uint64_t v0 = sub_100009D60();
  sub_10000665C(v0, qword_100010E60);
  sub_100006624(v0, (uint64_t)qword_100010E60);
  swift_bridgeObjectRetain();
  return sub_100009D50();
}

uint64_t sub_100009A9C()
{
  unint64_t v0 = sub_10000A010();
  swift_bridgeObjectRelease();
  if (v0 >= 0x20) {
    return 32;
  }
  else {
    return v0;
  }
}

uint64_t sub_100009B00()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100009B10()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100009B20()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100009B60()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100009B70()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100009B80()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100009B90()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100009BA0()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_100009BB0()
{
  return DisplayRepresentation.Image.init(utTypeIdentifier:)();
}

uint64_t sub_100009BC0()
{
  return DisplayRepresentation.Image.init(appBundleIdentifier:)();
}

uint64_t sub_100009BD0()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100009BE0()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_100009BF0()
{
  return static EnumerableEntityQuery.findIntentDescription.getter();
}

uint64_t sub_100009C10()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_100009C20()
{
  return URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_100009C50()
{
  return EntityURLRepresentation.StringInterpolation.appendInterpolation(_:)();
}

void sub_100009C60(Swift::String a1)
{
}

uint64_t sub_100009C70()
{
  return EntityURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100009C80()
{
  return EntityURLRepresentation.init(stringInterpolation:)();
}

uint64_t sub_100009C90()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100009CA0()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100009CB0()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100009CC0()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100009CE0()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100009CF0()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100009D00()
{
  return LocalizedStringResource.init(stringInterpolation:)();
}

uint64_t sub_100009D10()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100009D20()
{
  return type metadata accessor for NSFastEnumerationIterator();
}

uint64_t sub_100009D30()
{
  return static AppExtension.main()();
}

uint64_t sub_100009D40()
{
  return Logger.logObject.getter();
}

uint64_t sub_100009D50()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100009D60()
{
  return type metadata accessor for Logger();
}

void sub_100009D70(Swift::String a1)
{
}

void sub_100009D80(Swift::String a1)
{
}

uint64_t sub_100009D90()
{
  return String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100009DA0()
{
  return type metadata accessor for String.LocalizationValue.StringInterpolation();
}

NSString sub_100009DB0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100009DC0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100009DD0()
{
  return String.hash(into:)();
}

Swift::Int sub_100009DE0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100009DF0()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100009E00()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100009E10()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100009E20()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100009E30()
{
  return static Set._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100009E40()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_100009E50()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t sub_100009E60()
{
  return NSEnumerator.makeIterator()();
}

uint64_t sub_100009E70()
{
  return static os_log_type_t.info.getter();
}

Swift::Int sub_100009E80(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_100009E90()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100009EA0()
{
  return dispatch thunk of IteratorProtocol.next()();
}

uint64_t sub_100009EB0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100009EC0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100009ED0()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_100009EE0()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_100009EF0()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_100009F00()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_100009F10()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_100009F20()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_100009F30()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_100009F40()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_100009F50()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t sub_100009F60()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100009F70()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100009F80()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100009F90()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100009FA0()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100009FB0()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100009FC0()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100009FD0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100009FE0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100009FF0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10000A000()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10000A010()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t sub_10000A020()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10000A030()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_10000A040()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t SBSCopyDisplayIdentifiers()
{
  return _SBSCopyDisplayIdentifiers();
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

void bzero(void *a1, size_t a2)
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
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

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}