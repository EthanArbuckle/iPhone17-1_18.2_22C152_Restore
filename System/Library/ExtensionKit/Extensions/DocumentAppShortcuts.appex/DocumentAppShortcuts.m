uint64_t sub_100005408()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t vars8;

  v0 = sub_1000074F0();
  sub_100005584(v0, qword_10000C0D8);
  v1 = sub_10000554C(v0, (uint64_t)qword_10000C0D8);
  v2 = enum case for ShortcutTileColor.blue(_:);
  v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);

  return v3(v1, v2, v0);
}

uint64_t sub_100005494@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C000 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000074F0();
  uint64_t v3 = sub_10000554C(v2, (uint64_t)qword_10000C0D8);
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

ValueMetadata *type metadata accessor for AppShortcuts()
{
  return &type metadata for AppShortcuts;
}

uint64_t sub_10000554C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100005584(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000055E8()
{
  sub_100007520();
  ((void (*)(void))__chkstk_darwin)();
  v68 = (char *)&v56 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v1 = sub_100007370();
  uint64_t v2 = *(void *)(v1 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v4 = (char *)&v56 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006134(&qword_10000C020);
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  v65 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  v62 = (char *)&v56 - v8;
  uint64_t v9 = __chkstk_darwin(v7);
  v61 = (char *)&v56 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  v60 = (char *)&v56 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  v59 = (char *)&v56 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  v70 = (char *)&v56 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  v58 = (char *)&v56 - v18;
  __chkstk_darwin(v17);
  uint64_t v19 = sub_1000073C0();
  uint64_t v66 = *(void *)(v19 - 8);
  uint64_t v67 = v19;
  __chkstk_darwin(v19);
  v64 = (char *)&v56 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006134(&qword_10000C028);
  uint64_t v21 = *(void *)(sub_100006134(&qword_10000C030) - 8);
  uint64_t v22 = *(void *)(v21 + 72);
  unint64_t v23 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  uint64_t v24 = swift_allocObject();
  uint64_t v63 = v24;
  *(_OWORD *)(v24 + 16) = xmmword_100007710;
  unint64_t v25 = v24 + v23;
  unint64_t v26 = sub_100006178();
  sub_100007300();
  unint64_t v78 = v25;
  sub_100007300();
  uint64_t v76 = v22;
  unint64_t v57 = v25 + 2 * v22;
  sub_100007330();
  v79._countAndFlagsBits = 0x746977206E616353;
  v79._object = (void *)0xEA00000000002068;
  sub_100007320(v79);
  unsigned int v71 = enum case for AppShortcutPhraseToken.applicationName(_:);
  uint64_t v27 = v2;
  v28 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 104);
  uint64_t v72 = v2 + 104;
  v74 = v28;
  uint64_t v29 = v1;
  ((void (*)(char *))v28)(v4);
  sub_100007310();
  v30 = *(void (**)(char *, uint64_t))(v27 + 8);
  uint64_t v77 = v27 + 8;
  v75 = v30;
  v30(v4, v1);
  v80._countAndFlagsBits = 0;
  v80._object = (void *)0xE000000000000000;
  sub_100007320(v80);
  sub_100007340();
  unint64_t v31 = v78;
  unint64_t v57 = v78 + 3 * v22;
  sub_100007330();
  v81._object = (void *)0x8000000100007C50;
  v81._countAndFlagsBits = 0xD000000000000013;
  sub_100007320(v81);
  uint64_t v32 = v71;
  uint64_t v33 = v29;
  uint64_t v73 = v29;
  uint64_t v34 = v29;
  v35 = v74;
  v74(v4, v71, v34);
  sub_100007310();
  uint64_t v36 = v33;
  v37 = v75;
  v75(v4, v36);
  v82._countAndFlagsBits = 0;
  v82._object = (void *)0xE000000000000000;
  sub_100007320(v82);
  sub_100007340();
  v58 = (char *)(4 * v76);
  unint64_t v57 = v31 + 4 * v76;
  sub_100007330();
  v83._object = (void *)0x8000000100007C70;
  v83._countAndFlagsBits = 0xD000000000000013;
  sub_100007320(v83);
  uint64_t v38 = v73;
  v35(v4, v32, v73);
  sub_100007310();
  v37(v4, v38);
  v84._countAndFlagsBits = 1886413088;
  v84._object = (void *)0xE400000000000000;
  sub_100007320(v84);
  sub_100007340();
  uint64_t v39 = v76;
  unint64_t v40 = v78;
  unint64_t v69 = v26;
  sub_100007300();
  sub_100007300();
  v70 = (char *)(8 * v39);
  unint64_t v57 = v40 + 7 * v39;
  sub_100007330();
  v85._countAndFlagsBits = 0xD000000000000011;
  v58 = (char *)0xD000000000000011;
  v85._object = (void *)0x8000000100007CB0;
  sub_100007320(v85);
  uint64_t v41 = v73;
  v42 = v74;
  v74(v4, v32, v73);
  sub_100007310();
  v43 = v75;
  v75(v4, v41);
  v86._countAndFlagsBits = 0;
  v86._object = (void *)0xE000000000000000;
  sub_100007320(v86);
  sub_100007340();
  v59 = &v70[v78];
  sub_100007330();
  v87._object = (void *)0x8000000100007CD0;
  v87._countAndFlagsBits = (uint64_t)v58;
  sub_100007320(v87);
  uint64_t v44 = v32;
  uint64_t v45 = v73;
  v42(v4, v44, v73);
  sub_100007310();
  v43(v4, v45);
  v88._countAndFlagsBits = 0;
  v88._object = (void *)0xE000000000000000;
  sub_100007320(v88);
  sub_100007340();
  uint64_t v46 = v76;
  v70 += v78 + v76;
  sub_100007330();
  v89._countAndFlagsBits = 0x206E616353;
  v89._object = (void *)0xE500000000000000;
  sub_100007320(v89);
  uint64_t v47 = v73;
  v48 = v74;
  v74(v4, v71, v73);
  sub_100007310();
  v75(v4, v47);
  v90._countAndFlagsBits = 0;
  v90._object = (void *)0xE000000000000000;
  sub_100007320(v90);
  sub_100007340();
  v70 = (char *)(v78 + 10 * v46);
  sub_100007330();
  v91._countAndFlagsBits = 0xD000000000000014;
  v91._object = (void *)0x8000000100007CF0;
  sub_100007320(v91);
  uint64_t v49 = v71;
  v48(v4, v71, v47);
  sub_100007310();
  v50 = v75;
  v75(v4, v47);
  v92._countAndFlagsBits = 0;
  v92._object = (void *)0xE000000000000000;
  sub_100007320(v92);
  sub_100007340();
  v78 += 11 * v76;
  sub_100007330();
  v93._countAndFlagsBits = 0x636F44206E616353;
  v93._object = (void *)0xEE00206874697720;
  sub_100007320(v93);
  v74(v4, v49, v47);
  sub_100007310();
  v50(v4, v47);
  v94._countAndFlagsBits = 0;
  v94._object = (void *)0xE000000000000000;
  sub_100007320(v94);
  sub_100007340();
  sub_100007500();
  v51 = v64;
  sub_1000073B0();
  uint64_t v52 = sub_100007360();
  (*(void (**)(char *, uint64_t))(v66 + 8))(v51, v67);
  sub_100006134(&qword_10000C040);
  uint64_t v53 = swift_allocObject();
  *(_OWORD *)(v53 + 16) = xmmword_100007720;
  *(void *)(v53 + 32) = v52;
  uint64_t v54 = sub_100007350();
  swift_bridgeObjectRelease();
  return v54;
}

uint64_t sub_100006134(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100006178()
{
  unint64_t result = qword_10000C038;
  if (!qword_10000C038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C038);
  }
  return result;
}

unint64_t sub_1000061D0()
{
  unint64_t result = qword_10000C058;
  if (!qword_10000C058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C058);
  }
  return result;
}

unint64_t sub_100006228()
{
  unint64_t result = qword_10000C060;
  if (!qword_10000C060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C060);
  }
  return result;
}

uint64_t sub_10000627C()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_1000062B0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100006300()
{
  uint64_t v0 = sub_100007510();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100007570();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_1000075C0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_100007520();
  sub_100005584(v6, qword_10000C0F0);
  sub_10000554C(v6, (uint64_t)qword_10000C0F0);
  sub_1000075B0();
  sub_100007560();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_100007530();
}

uint64_t sub_1000064E0()
{
  uint64_t v0 = sub_100006134(&qword_10000C0B0);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v8 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100007550();
  sub_100005584(v3, qword_10000C108);
  uint64_t v4 = sub_10000554C(v3, (uint64_t)qword_10000C108);
  v8[0] = sub_1000075A0();
  v8[1] = v5;
  v9._countAndFlagsBits = 0x6E6163733F2F2F3ALL;
  v9._object = (void *)0xED0000657572743DLL;
  sub_1000075D0(v9);
  sub_100007540();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v2, 1, v3);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(v4, v2, v3);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000663C@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C008 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100007520();
  uint64_t v3 = sub_10000554C(v2, (uint64_t)qword_10000C0F0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_1000066E4()
{
  return 1;
}

uint64_t sub_1000066F8(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = sub_100007550();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  uint64_t v3 = sub_1000073F0();
  v1[6] = v3;
  v1[7] = *(void *)(v3 - 8);
  v1[8] = swift_task_alloc();
  return _swift_task_switch(sub_100006814, 0, 0);
}

uint64_t sub_100006814()
{
  if (qword_10000C010 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  uint64_t v4 = v0[5];
  uint64_t v3 = v0[6];
  uint64_t v5 = v0[3];
  uint64_t v6 = v0[4];
  uint64_t v7 = sub_10000554C(v5, (uint64_t)qword_10000C108);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v7, v5);
  sub_100007400();
  sub_100006FC0();
  sub_1000073E0();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_100006944()
{
  uint64_t v0 = *(void *)aScandocument;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_10000697C()
{
  uint64_t v0 = sub_100006134(&qword_10000C098);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006178();
  sub_1000074A0();
  uint64_t v4 = sub_100007460();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  sub_1000074A0();
  uint64_t v6 = sub_100007460();
  v5(v3, v0);
  sub_1000074A0();
  uint64_t v7 = sub_100007460();
  v5(v3, v0);
  sub_1000074A0();
  uint64_t v8 = sub_100007460();
  v5(v3, v0);
  sub_100006134(&qword_10000C0A0);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100007790;
  *(void *)(v9 + 32) = v4;
  *(void *)(v9 + 40) = v6;
  *(void *)(v9 + 48) = v7;
  *(void *)(v9 + 56) = v8;
  uint64_t v10 = sub_100007450();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_100006BF0()
{
  uint64_t v0 = sub_100007480();
  sub_100006134(&qword_10000C088);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_100007720;
  *(void *)(v1 + 32) = v0;
  uint64_t v2 = sub_100007470();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_100006C70()
{
  uint64_t v0 = sub_1000074D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006178();
  sub_1000074E0();
  uint64_t v4 = sub_1000074C0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100006134(&qword_10000C090);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100007720;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_1000074B0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100006DC0()
{
  uint64_t v0 = sub_100007440();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006178();
  sub_100007430();
  uint64_t v4 = sub_100007420();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100006134(&qword_10000C080);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100007720;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100007410();
  swift_bridgeObjectRelease();
  return v6;
}

ValueMetadata *type metadata accessor for FilesShortcutAssistantIntentsProvider()
{
  return &type metadata for FilesShortcutAssistantIntentsProvider;
}

ValueMetadata *type metadata accessor for ScanDocumentIntent()
{
  return &type metadata for ScanDocumentIntent;
}

unint64_t sub_100006F1C()
{
  unint64_t result = qword_10000C070;
  if (!qword_10000C070)
  {
    sub_100006F78(&qword_10000C078);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C070);
  }
  return result;
}

uint64_t sub_100006F78(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100006FC0()
{
  unint64_t result = qword_10000C0A8;
  if (!qword_10000C0A8)
  {
    sub_1000073F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A8);
  }
  return result;
}

uint64_t sub_100007018(uint64_t a1)
{
  unint64_t v2 = sub_100007224();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

unint64_t sub_100007064()
{
  sub_100006134(&qword_10000C0C8);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100007720;
  uint64_t v1 = sub_100007590();
  unint64_t result = sub_100007298();
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = result;
  qword_10000C120 = v0;
  return result;
}

uint64_t sub_1000070C4()
{
  if (qword_10000C018 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10000717C()
{
  unint64_t result = qword_10000C0B8;
  if (!qword_10000C0B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0B8);
  }
  return result;
}

uint64_t sub_1000071D4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100007224()
{
  unint64_t result = qword_10000C0C0;
  if (!qword_10000C0C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0C0);
  }
  return result;
}

ValueMetadata *type metadata accessor for DocumentAppShortcutsExtensionPackage()
{
  return &type metadata for DocumentAppShortcutsExtensionPackage;
}

ValueMetadata *type metadata accessor for DocumentAppShortcutsExtension()
{
  return &type metadata for DocumentAppShortcutsExtension;
}

unint64_t sub_100007298()
{
  unint64_t result = qword_10000C0D0;
  if (!qword_10000C0D0)
  {
    sub_100007590();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D0);
  }
  return result;
}

uint64_t sub_1000072F0()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_100007300()
{
  return AppShortcutPhrase.init(stringLiteral:)();
}

uint64_t sub_100007310()
{
  return AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)();
}

void sub_100007320(Swift::String a1)
{
}

uint64_t sub_100007330()
{
  return AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100007340()
{
  return AppShortcutPhrase.init(stringInterpolation:)();
}

uint64_t sub_100007350()
{
  return static AppShortcutsBuilder.buildBlock(_:)();
}

uint64_t sub_100007360()
{
  return static AppShortcutsBuilder.buildExpression(_:)();
}

uint64_t sub_100007370()
{
  return type metadata accessor for AppShortcutPhraseToken();
}

uint64_t sub_100007380()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100007390()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_1000073A0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_1000073B0()
{
  return AppShortcut.init<A>(intent:phrases:shortTitle:systemImageName:)();
}

uint64_t sub_1000073C0()
{
  return type metadata accessor for AppShortcut();
}

uint64_t sub_1000073E0()
{
  return static IntentResult.result<A>(opensIntent:)();
}

uint64_t sub_1000073F0()
{
  return type metadata accessor for OpenURLIntent();
}

uint64_t sub_100007400()
{
  return OpenURLIntent.init(_:)();
}

uint64_t sub_100007410()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildBlock(_:)();
}

uint64_t sub_100007420()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildExpression(_:)();
}

uint64_t sub_100007430()
{
  return _AssistantIntent.NegativeAssistantIntentPhrases.init<A>(for:phrases:)();
}

uint64_t sub_100007440()
{
  return type metadata accessor for _AssistantIntent.NegativeAssistantIntentPhrases();
}

uint64_t sub_100007450()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_100007460()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_100007470()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t sub_100007480()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t sub_100007490()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock()();
}

uint64_t sub_1000074A0()
{
  return _AssistantIntent.Phrase.init(stringLiteral:)();
}

uint64_t sub_1000074B0()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t sub_1000074C0()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t sub_1000074D0()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_1000074E0()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_1000074F0()
{
  return type metadata accessor for ShortcutTileColor();
}

uint64_t sub_100007500()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100007510()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_100007520()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100007530()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_100007540()
{
  return URL.init(string:)();
}

uint64_t sub_100007550()
{
  return type metadata accessor for URL();
}

uint64_t sub_100007560()
{
  return static Locale.current.getter();
}

uint64_t sub_100007570()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100007580()
{
  return static AppExtension.main()();
}

uint64_t sub_100007590()
{
  return type metadata accessor for DocumentManagerExecutablesIntentsPackage();
}

uint64_t sub_1000075A0()
{
  return static DeepLinkLocation.filesAppURLScheme.getter();
}

uint64_t sub_1000075B0()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_1000075C0()
{
  return type metadata accessor for String.LocalizationValue();
}

void sub_1000075D0(Swift::String a1)
{
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

uint64_t swift_once()
{
  return _swift_once();
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