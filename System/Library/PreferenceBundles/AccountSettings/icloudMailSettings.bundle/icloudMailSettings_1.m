uint64_t sub_AA3F0()
{
  return sub_AA6A0(sub_A85D0);
}

uint64_t sub_AA408@<X0>(uint64_t a1@<X8>)
{
  return sub_A8828(a1);
}

unint64_t sub_AA410()
{
  unint64_t result = qword_138938;
  if (!qword_138938)
  {
    sub_62A4(&qword_138930);
    sub_105AC(&qword_131628, &qword_131630);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_138938);
  }
  return result;
}

uint64_t sub_AA4C0()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_AA4D4(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for MailForwadingView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_A871C(a1, v4);
}

uint64_t sub_AA548()
{
  uint64_t v1 = type metadata accessor for MailForwadingView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  sub_6E40();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 20);
  sub_6898(&qword_1314A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_E47F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_AA688()
{
  return sub_AA6A0((uint64_t (*)(uint64_t))sub_A7EAC);
}

uint64_t sub_AA6A0(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for MailForwadingView() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

uint64_t sub_AA714()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_AA724()
{
  return sub_A6B6C();
}

uint64_t sub_AA734@<X0>(uint64_t a1@<X8>)
{
  return sub_A6D08(a1);
}

uint64_t sub_AA73C()
{
  return sub_A7578();
}

uint64_t sub_AA754()
{
  return sub_105AC(&qword_1389A8, &qword_1389B0);
}

id sub_AA790()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MSRuleDeleteAPI();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MSRuleDeleteAPI()
{
  uint64_t result = qword_1389E0;
  if (!qword_1389E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_AA814()
{
  return type metadata accessor for MSRuleDeleteAPI();
}

uint64_t sub_AA81C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_338A0(a4, (uint64_t)v24);
  uint64_t v9 = sub_33904((uint64_t)v24, v25);
  __chkstk_darwin(v9);
  v11 = (void *)((char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v12 + 16))(v11);
  uint64_t v13 = *v11;
  uint64_t v14 = type metadata accessor for MSRepositoryDefault();
  v23[3] = v14;
  v23[4] = &off_124FE8;
  v23[0] = v13;
  _s9ViewModelCMa_8();
  uint64_t v15 = swift_allocObject();
  uint64_t v16 = sub_33904((uint64_t)v23, v14);
  __chkstk_darwin(v16);
  v18 = (void *)((char *)v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v19 + 16))(v18);
  uint64_t v20 = *v18;
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_AD4C4(a1, a2, a3, v20, a5, v15);
  swift_release();
  sub_6A34((uint64_t)v23);
  sub_6A34((uint64_t)v24);
  return v21;
}

uint64_t sub_AAA28@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v52 = a1;
  uint64_t v3 = sub_6898(&qword_138B88);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_6898(&qword_138B90);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_6898(&qword_138B98);
  __chkstk_darwin(v45);
  uint64_t v12 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_6898(&qword_138BA0);
  uint64_t v49 = *(void *)(v48 - 8);
  __chkstk_darwin(v48);
  v46 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_6898(&qword_138BA8);
  uint64_t v51 = *(void *)(v50 - 8);
  __chkstk_darwin(v50);
  v47 = (char *)&v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = v2;
  sub_6898(&qword_138BB0);
  sub_105AC(&qword_138BB8, &qword_138BB0);
  sub_E4EA0();
  sub_105AC(&qword_138BC0, &qword_138B88);
  sub_E4FA0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v12, v10, v7);
  uint64_t v15 = v45;
  uint64_t v16 = (uint64_t (**)())&v12[*(int *)(v45 + 36)];
  *uint64_t v16 = sub_AC894;
  v16[1] = 0;
  v16[2] = 0;
  v16[3] = 0;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  type metadata accessor for MAPreferencesViewProvider();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v18 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v54._countAndFlagsBits = 2777980912;
  v54._object = (void *)0xA400000000000000;
  v64._countAndFlagsBits = 0x5F53455341494C41;
  v64._object = (void *)0xED0000454C544954;
  sub_E5690(v64);
  v65._countAndFlagsBits = 2777980912;
  v65._object = (void *)0xA400000000000000;
  sub_E5690(v65);
  v42._countAndFlagsBits = 0xE000000000000000;
  v66._countAndFlagsBits = 0x5F53455341494C41;
  v66._object = (void *)0xED0000454C544954;
  v67.value._countAndFlagsBits = 0;
  v67.value._object = 0;
  v19.super.isa = v18;
  uint64_t v20 = sub_E3FE0(v66, v67, v19, v54, v42);
  v22 = v21;

  swift_bridgeObjectRelease();
  v54._countAndFlagsBits = v20;
  v54._object = v22;
  unint64_t v23 = sub_AE10C();
  unint64_t v24 = sub_E3F8();
  uint64_t v25 = v46;
  sub_E5050();
  swift_bridgeObjectRelease();
  sub_102B4((uint64_t)v12, &qword_138B98);
  _s9ViewModelCMa_8();
  sub_AE240(&qword_138BD0, (void (*)(uint64_t))_s9ViewModelCMa_8);
  sub_E4780();
  swift_getKeyPath();
  sub_E48D0();
  swift_release();
  swift_release();
  long long v60 = v62;
  uint64_t v61 = v63;
  sub_AE1F0((uint64_t *)v2, (uint64_t)&v54);
  uint64_t v26 = swift_allocObject();
  long long v27 = v57;
  *(_OWORD *)(v26 + 48) = v56;
  *(_OWORD *)(v26 + 64) = v27;
  long long v28 = v59;
  *(_OWORD *)(v26 + 80) = v58;
  *(_OWORD *)(v26 + 96) = v28;
  long long v29 = v55;
  *(Swift::String *)(v26 + 16) = v54;
  *(_OWORD *)(v26 + 32) = v29;
  v43 = (void *)_s9ViewModelCMa_0();
  uint64_t v44 = type metadata accessor for MSAddressDetailView();
  v54._countAndFlagsBits = v15;
  v54._object = &type metadata for String;
  *(void *)&long long v55 = v23;
  *((void *)&v55 + 1) = v24;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v31 = sub_AE240(&qword_138BD8, (void (*)(uint64_t))_s9ViewModelCMa_0);
  uint64_t v32 = sub_AE240(&qword_138BE0, (void (*)(uint64_t))type metadata accessor for MSAddressDetailView);
  v33 = v47;
  uint64_t v34 = v48;
  sub_E5100();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v49 + 8))(v25, v34);
  uint64_t v35 = *(void *)(v2 + 32);
  LOBYTE(v62) = *(unsigned char *)(v2 + 24);
  *((void *)&v62 + 1) = v35;
  sub_6898(&qword_1315F0);
  sub_E5240();
  sub_AE1F0((uint64_t *)v2, (uint64_t)&v54);
  uint64_t v36 = swift_allocObject();
  long long v37 = v57;
  *(_OWORD *)(v36 + 48) = v56;
  *(_OWORD *)(v36 + 64) = v37;
  long long v38 = v59;
  *(_OWORD *)(v36 + 80) = v58;
  *(_OWORD *)(v36 + 96) = v38;
  long long v39 = v55;
  *(Swift::String *)(v36 + 16) = v54;
  *(_OWORD *)(v36 + 32) = v39;
  type metadata accessor for MSAddAliasView();
  v54._countAndFlagsBits = v34;
  v54._object = v43;
  *(void *)&long long v55 = v44;
  *((void *)&v55 + 1) = OpaqueTypeConformance2;
  *(void *)&long long v56 = v31;
  *((void *)&v56 + 1) = v32;
  swift_getOpaqueTypeConformance2();
  sub_AE240(&qword_138BE8, (void (*)(uint64_t))type metadata accessor for MSAddAliasView);
  uint64_t v40 = v50;
  sub_E50F0();
  swift_release();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v33, v40);
}

uint64_t sub_AB310@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v45 = a2;
  uint64_t v44 = sub_6898(&qword_138BF0);
  uint64_t v42 = *(void *)(v44 - 8);
  uint64_t v3 = __chkstk_darwin(v44);
  v43 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v39 - v5;
  uint64_t v46 = sub_6898(&qword_138BF8);
  uint64_t v41 = *(void *)(v46 - 8);
  uint64_t v7 = v41;
  uint64_t v8 = __chkstk_darwin(v46);
  uint64_t v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v39 - v11;
  uint64_t v48 = a1;
  sub_6898(&qword_138C00);
  sub_105AC(&qword_138C08, &qword_138C00);
  uint64_t v40 = v12;
  sub_E53A0();
  uint64_t v47 = a1;
  type metadata accessor for MAPreferencesViewProvider();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v14 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v49._countAndFlagsBits = 2777980912;
  v49._object = (void *)0xA400000000000000;
  v57._countAndFlagsBits = 0x53455341494C41;
  v57._object = (void *)0xE700000000000000;
  sub_E5690(v57);
  v58._countAndFlagsBits = 2777980912;
  v58._object = (void *)0xA400000000000000;
  sub_E5690(v58);
  v38._countAndFlagsBits = 0xE000000000000000;
  v59._countAndFlagsBits = 0x53455341494C41;
  v59._object = (void *)0xE700000000000000;
  v60.value._countAndFlagsBits = 0;
  v60.value._object = 0;
  v15.super.isa = v14;
  uint64_t v16 = sub_E3FE0(v59, v60, v15, v49, v38);
  v18 = v17;

  swift_bridgeObjectRelease();
  v49._countAndFlagsBits = v16;
  v49._object = v18;
  sub_E3F8();
  uint64_t v53 = sub_E4F60();
  uint64_t v54 = v19;
  char v55 = v20 & 1;
  uint64_t v56 = v21;
  _s9ViewModelCMa_8();
  sub_AE240(&qword_138BD0, (void (*)(uint64_t))_s9ViewModelCMa_8);
  sub_E4770();
  swift_bridgeObjectRetain();
  swift_release();
  sub_E4BC0();
  v49._countAndFlagsBits = sub_E4F50();
  v49._object = v22;
  char v50 = v23 & 1;
  uint64_t v51 = v24;
  __int16 v52 = 256;
  sub_6898(&qword_138C10);
  sub_6898(&qword_1316A8);
  sub_105AC(&qword_138C18, &qword_138C10);
  sub_47DE8();
  long long v39 = v6;
  sub_E5390();
  uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  uint64_t v26 = v12;
  uint64_t v27 = v46;
  v25(v10, v26, v46);
  uint64_t v28 = v42;
  long long v29 = *(void (**)(char *, char *, uint64_t))(v42 + 16);
  uint64_t v31 = v43;
  uint64_t v30 = v44;
  v29(v43, v6, v44);
  uint64_t v32 = v45;
  v25(v45, v10, v27);
  uint64_t v33 = sub_6898(&qword_138C20);
  v29(&v32[*(int *)(v33 + 48)], v31, v30);
  uint64_t v34 = *(void (**)(char *, uint64_t))(v28 + 8);
  v34(v39, v30);
  uint64_t v35 = *(void (**)(char *, uint64_t))(v41 + 8);
  uint64_t v36 = v46;
  v35(v40, v46);
  v34(v31, v30);
  return ((uint64_t (*)(char *, uint64_t))v35)(v10, v36);
}

uint64_t sub_AB870@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_6898(&qword_138C50);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v34 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v33 = (char *)&v30 - v8;
  _s9ViewModelCMa_8();
  sub_AE240(&qword_138BD0, (void (*)(uint64_t))_s9ViewModelCMa_8);
  sub_E4770();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_E45B0();
  swift_release();
  swift_release();
  swift_release();
  object = v36._object;
  uint64_t countAndFlagsBits = v36._countAndFlagsBits;
  type metadata accessor for MAPreferencesViewProvider();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v10 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v36._uint64_t countAndFlagsBits = 2777980912;
  v36._object = (void *)0xA400000000000000;
  v42._uint64_t countAndFlagsBits = 0xD00000000000001BLL;
  v42._object = (void *)0x80000000000F6CA0;
  sub_E5690(v42);
  v43._uint64_t countAndFlagsBits = 2777980912;
  v43._object = (void *)0xA400000000000000;
  sub_E5690(v43);
  v29._uint64_t countAndFlagsBits = 0xE000000000000000;
  v44._uint64_t countAndFlagsBits = 0xD00000000000001BLL;
  v44._object = (void *)0x80000000000F6CA0;
  v45.value._uint64_t countAndFlagsBits = 0;
  v45.value._object = 0;
  v11.super.isa = v10;
  uint64_t v30 = sub_E3FE0(v44, v45, v11, v36, v29);
  uint64_t v13 = v12;

  swift_bridgeObjectRelease();
  sub_AE1F0(a1, (uint64_t)&v36);
  uint64_t v14 = swift_allocObject();
  long long v15 = v39;
  *(_OWORD *)(v14 + 48) = v38;
  *(_OWORD *)(v14 + 64) = v15;
  long long v16 = v41;
  *(_OWORD *)(v14 + 80) = v40;
  *(_OWORD *)(v14 + 96) = v16;
  long long v17 = v37;
  *(Swift::String *)(v14 + 16) = v36;
  *(_OWORD *)(v14 + 32) = v17;
  sub_E4770();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_E45B0();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v35 = v36._countAndFlagsBits;
  sub_AE1F0(a1, (uint64_t)&v36);
  uint64_t v18 = swift_allocObject();
  long long v19 = v39;
  *(_OWORD *)(v18 + 48) = v38;
  *(_OWORD *)(v18 + 64) = v19;
  long long v20 = v41;
  *(_OWORD *)(v18 + 80) = v40;
  *(_OWORD *)(v18 + 96) = v20;
  long long v21 = v37;
  *(Swift::String *)(v18 + 16) = v36;
  *(_OWORD *)(v18 + 32) = v21;
  sub_6898(&qword_138B80);
  sub_105AC(&qword_138C58, &qword_138B80);
  sub_AE2AC();
  sub_AE474();
  v22 = v33;
  sub_E5350();
  char v23 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  uint64_t v24 = v34;
  v23(v34, v22, v4);
  uint64_t v25 = (uint64_t)object;
  *a2 = countAndFlagsBits;
  a2[1] = v25;
  a2[2] = v30;
  a2[3] = v13;
  a2[4] = (uint64_t)sub_AE404;
  a2[5] = v14;
  uint64_t v26 = sub_6898(&qword_138C68);
  v23((char *)a2 + *(int *)(v26 + 48), v24, v4);
  uint64_t v27 = *(void (**)(char *, uint64_t))(v5 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v27(v22, v4);
  v27(v24, v4);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_ABD28()
{
  _s9ViewModelCMa_8();
  sub_AE240(&qword_138BD0, (void (*)(uint64_t))_s9ViewModelCMa_8);
  sub_E4770();
  sub_DDB10();

  return swift_release();
}

uint64_t sub_ABDC8@<X0>(long long *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  Swift::String v5 = (Swift::String)a1[1];
  long long v23 = *a1;
  Swift::String v24 = v5;
  long long v6 = a1[3];
  long long v25 = a1[2];
  long long v26 = v6;
  uint64_t v27 = *((void *)a1 + 8);
  swift_bridgeObjectRetain();
  v28._uint64_t countAndFlagsBits = 64;
  v28._object = (void *)0xE100000000000000;
  sub_E5690(v28);
  swift_bridgeObjectRetain();
  sub_E5690(v24);
  swift_bridgeObjectRelease();
  long long v7 = v23;
  type metadata accessor for MAPreferencesViewProvider();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v9 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  *(void *)&v22[0] = 2777980912;
  *((void *)&v22[0] + 1) = 0xA400000000000000;
  v29._uint64_t countAndFlagsBits = 0xD000000000000014;
  v29._object = (void *)0x80000000000F6CC0;
  sub_E5690(v29);
  v30._uint64_t countAndFlagsBits = 2777980912;
  v30._object = (void *)0xA400000000000000;
  sub_E5690(v30);
  v33._uint64_t countAndFlagsBits = 2777980912;
  v21._uint64_t countAndFlagsBits = 0xE000000000000000;
  v31._uint64_t countAndFlagsBits = 0xD000000000000014;
  v31._object = (void *)0x80000000000F6CC0;
  v32.value._uint64_t countAndFlagsBits = 0;
  v32.value._object = 0;
  v10.super.isa = v9;
  v33._object = (void *)0xA400000000000000;
  uint64_t v11 = sub_E3FE0(v31, v32, v10, v33, v21);
  uint64_t v13 = v12;

  swift_bridgeObjectRelease();
  sub_AE1F0(a2, (uint64_t)v22);
  uint64_t v14 = swift_allocObject();
  long long v15 = v22[3];
  *(_OWORD *)(v14 + 48) = v22[2];
  *(_OWORD *)(v14 + 64) = v15;
  long long v16 = v22[5];
  *(_OWORD *)(v14 + 80) = v22[4];
  *(_OWORD *)(v14 + 96) = v16;
  long long v17 = v22[1];
  *(_OWORD *)(v14 + 16) = v22[0];
  *(_OWORD *)(v14 + 32) = v17;
  long long v18 = v26;
  *(_OWORD *)(v14 + 144) = v25;
  *(_OWORD *)(v14 + 160) = v18;
  *(void *)(v14 + 176) = v27;
  Swift::String v19 = v24;
  *(_OWORD *)(v14 + 112) = v23;
  *(Swift::String *)(v14 + 128) = v19;
  *(_OWORD *)a3 = v7;
  *(void *)(a3 + 16) = v11;
  *(void *)(a3 + 24) = v13;
  *(void *)(a3 + 32) = sub_AE53C;
  *(void *)(a3 + 40) = v14;
  return sub_150C4((uint64_t)&v23);
}

uint64_t sub_ABFB0(uint64_t a1, uint64_t a2)
{
  _s9ViewModelCMa_8();
  sub_AE240(&qword_138BD0, (void (*)(uint64_t))_s9ViewModelCMa_8);
  sub_E4770();
  sub_DDFC0(a2);

  return swift_release();
}

uint64_t sub_AC060@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  uint64_t v51 = a2;
  uint64_t v3 = sub_6898(&qword_131570);
  uint64_t v49 = *(void *)(v3 - 8);
  uint64_t v50 = v3;
  __chkstk_darwin(v3);
  uint64_t v46 = (char *)v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_6898(&qword_131640);
  uint64_t v6 = v5 - 8;
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v48 = (uint64_t)v45 - v10;
  uint64_t v11 = sub_6898(&qword_138C28);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v47 = (char *)v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  long long v16 = (char *)v45 - v15;
  v45[2] = _s9ViewModelCMa_8();
  v45[1] = sub_AE240(&qword_138BD0, (void (*)(uint64_t))_s9ViewModelCMa_8);
  sub_E4770();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_E45B0();
  swift_release();
  swift_release();
  swift_release();
  uint64_t countAndFlagsBits = v54._countAndFlagsBits;
  sub_AE1F0(a1, (uint64_t)&v54);
  uint64_t v17 = swift_allocObject();
  long long v18 = v57;
  *(_OWORD *)(v17 + 48) = v56;
  *(_OWORD *)(v17 + 64) = v18;
  long long v19 = v59;
  *(_OWORD *)(v17 + 80) = v58;
  *(_OWORD *)(v17 + 96) = v19;
  long long v20 = v55;
  *(Swift::String *)(v17 + 16) = v54;
  *(_OWORD *)(v17 + 32) = v20;
  sub_6898(&qword_138B78);
  sub_105AC(&qword_138C30, &qword_138B78);
  sub_AE2AC();
  sub_AE300();
  sub_E5350();
  type metadata accessor for MAPreferencesViewProvider();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v22 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v54._uint64_t countAndFlagsBits = 2777980912;
  v54._object = (void *)0xA400000000000000;
  v60._uint64_t countAndFlagsBits = 0x41494C415F444441;
  v60._object = (void *)0xE900000000000053;
  sub_E5690(v60);
  v61._uint64_t countAndFlagsBits = 2777980912;
  v61._object = (void *)0xA400000000000000;
  sub_E5690(v61);
  v44._uint64_t countAndFlagsBits = 0xE000000000000000;
  v62._uint64_t countAndFlagsBits = 0x41494C415F444441;
  v62._object = (void *)0xE900000000000053;
  v63.value._uint64_t countAndFlagsBits = 0;
  v63.value._object = 0;
  v23.super.isa = v22;
  uint64_t v24 = sub_E3FE0(v62, v63, v23, v54, v44);
  uint64_t v26 = v25;

  swift_bridgeObjectRelease();
  uint64_t countAndFlagsBits = v24;
  uint64_t v53 = v26;
  sub_AE1F0(a1, (uint64_t)&v54);
  uint64_t v27 = swift_allocObject();
  long long v28 = v57;
  *(_OWORD *)(v27 + 48) = v56;
  *(_OWORD *)(v27 + 64) = v28;
  long long v29 = v59;
  *(_OWORD *)(v27 + 80) = v58;
  *(_OWORD *)(v27 + 96) = v29;
  long long v30 = v55;
  *(Swift::String *)(v27 + 16) = v54;
  *(_OWORD *)(v27 + 32) = v30;
  sub_E3F8();
  Swift::String v31 = v46;
  sub_E5290();
  LOBYTE(v22) = *(unsigned char *)(sub_E4770()
                         + OBJC_IVAR____TtCV18icloudMailSettings15MSAddressesView9ViewModel_isAddAliasDisabled);
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v33 = swift_allocObject();
  *(unsigned char *)(v33 + 16) = (_BYTE)v22;
  uint64_t v35 = v49;
  uint64_t v34 = v50;
  (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v9, v31, v50);
  Swift::String v36 = (uint64_t *)&v9[*(int *)(v6 + 44)];
  *Swift::String v36 = KeyPath;
  v36[1] = (uint64_t)sub_EF04;
  v36[2] = v33;
  (*(void (**)(char *, uint64_t))(v35 + 8))(v31, v34);
  uint64_t v37 = v48;
  sub_10250((uint64_t)v9, v48, &qword_131640);
  long long v38 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  long long v39 = v47;
  v38(v47, v16, v11);
  sub_105F0(v37, (uint64_t)v9, &qword_131640);
  long long v40 = v51;
  v38(v51, v39, v11);
  uint64_t v41 = sub_6898(&qword_138C48);
  sub_105F0((uint64_t)v9, (uint64_t)&v40[*(int *)(v41 + 48)], &qword_131640);
  sub_102B4(v37, &qword_131640);
  Swift::String v42 = *(void (**)(char *, uint64_t))(v12 + 8);
  v42(v16, v11);
  sub_102B4((uint64_t)v9, &qword_131640);
  return ((uint64_t (*)(char *, uint64_t))v42)(v39, v11);
}

uint64_t sub_AC6B0@<X0>(long long *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  long long v5 = a1[1];
  long long v17 = *a1;
  long long v18 = v5;
  v19[0] = a1[2];
  *(_OWORD *)((char *)v19 + 9) = *(long long *)((char *)a1 + 41);
  uint64_t v6 = sub_C6E68();
  uint64_t v8 = v7;
  sub_AE1F0(a2, (uint64_t)v16);
  uint64_t v9 = (_OWORD *)swift_allocObject();
  long long v10 = v16[3];
  v9[3] = v16[2];
  v9[4] = v10;
  long long v11 = v16[5];
  v9[5] = v16[4];
  v9[6] = v11;
  long long v12 = v16[1];
  v9[1] = v16[0];
  v9[2] = v12;
  *(_OWORD *)((char *)v9 + 153) = *(_OWORD *)((char *)v19 + 9);
  long long v13 = v19[0];
  long long v14 = v17;
  v9[8] = v18;
  v9[9] = v13;
  v9[7] = v14;
  *a3 = v6;
  a3[1] = v8;
  a3[2] = 0;
  a3[3] = 0;
  a3[4] = (uint64_t)sub_AE3EC;
  a3[5] = (uint64_t)v9;
  return sub_5CF84((uint64_t)&v17);
}

uint64_t sub_AC78C(uint64_t a1, uint64_t a2)
{
  _s9ViewModelCMa_8();
  sub_AE240(&qword_138BD0, (void (*)(uint64_t))_s9ViewModelCMa_8);
  sub_E4770();
  sub_DE39C(a2);

  return swift_release();
}

uint64_t sub_AC83C()
{
  return sub_E5230();
}

uint64_t sub_AC894()
{
  uint64_t v0 = sub_E4320();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_131238 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_67B4(v0, (uint64_t)qword_148D58);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  long long v5 = sub_E4300();
  os_log_type_t v6 = sub_E5870();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&def_66DD4, v5, v6, "[Addresses] page viewed", v7, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  uint64_t v8 = (void (*)(void))sub_7DB5C(1);
  v8();
  return swift_release();
}

uint64_t sub_ACA3C@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_E45B0();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_ACABC()
{
  return sub_E45C0();
}

uint64_t sub_ACB38@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *(void *)(a2 + 40);
  uint64_t v6 = *(void *)(a2 + 48);
  swift_retain();
  swift_retain();

  return sub_76F0(v4, v5, v6, a3);
}

uint64_t sub_ACB98@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_338A0(a1 + 56, (uint64_t)v7);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  swift_retain();
  return sub_4CBE0((uint64_t)v7, v5, v4, a2);
}

uint64_t sub_ACBF8()
{
  return sub_E4850();
}

uint64_t sub_ACC9C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = sub_E4C10();
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  uint64_t v4 = sub_6898(&qword_138CA0);
  return sub_ACCEC(a1, a2 + *(int *)(v4 + 44));
}

uint64_t sub_ACCEC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v61 = a2;
  uint64_t v3 = sub_6898(&qword_131828);
  uint64_t v4 = v3 - 8;
  __chkstk_darwin(v3);
  long long v59 = (void *)((char *)v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v62 = sub_E4F10();
  uint64_t v6 = *(void *)(v62 - 8);
  __chkstk_darwin(v62);
  uint64_t v8 = (char *)v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_6898(&qword_136708);
  uint64_t v10 = v9 - 8;
  uint64_t v11 = __chkstk_darwin(v9);
  long long v13 = (char *)v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v63 = (uint64_t)v55 - v14;
  Swift::String v60 = a1;
  uint64_t v15 = *a1;
  uint64_t v16 = a1[1];
  uint64_t v64 = v15;
  uint64_t v65 = v16;
  unint64_t v17 = sub_E3F8();
  swift_bridgeObjectRetain();
  v55[1] = v17;
  uint64_t v57 = sub_E4F60();
  uint64_t v58 = v18;
  uint64_t v20 = v19;
  char v22 = v21 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v23 = swift_getKeyPath();
  uint64_t v24 = v62;
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for Text.TruncationMode.tail(_:), v62);
  uint64_t v25 = swift_getKeyPath();
  uint64_t v26 = *(int *)(v4 + 36);
  uint64_t v27 = v59;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))((char *)v59 + v26, v8, v24);
  *uint64_t v27 = v25;
  sub_105F0((uint64_t)v27, (uint64_t)&v13[*(int *)(v10 + 44)], &qword_131828);
  uint64_t v28 = v57;
  uint64_t v29 = v58;
  *(void *)long long v13 = v57;
  *((void *)v13 + 1) = v20;
  v13[16] = v22;
  uint64_t v30 = KeyPath;
  *((void *)v13 + 3) = v29;
  *((void *)v13 + 4) = v30;
  *((void *)v13 + 5) = 0x3FE999999999999ALL;
  *((void *)v13 + 6) = v23;
  *((void *)v13 + 7) = 1;
  v13[64] = 0;
  sub_FA04(v28, v20, v22);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_102B4((uint64_t)v27, &qword_131828);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v62);
  sub_EF0C(v28, v20, v22);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_10250((uint64_t)v13, v63, &qword_136708);
  uint64_t v31 = v60[3];
  if (v31)
  {
    uint64_t v64 = v60[2];
    uint64_t v65 = v31;
    swift_bridgeObjectRetain();
    uint64_t v32 = sub_E4F60();
    uint64_t v34 = v33;
    char v36 = v35 & 1;
    sub_E51B0();
    uint64_t v37 = sub_E4F20();
    uint64_t v39 = v38;
    char v41 = v40;
    swift_release();
    char v42 = v41 & 1;
    sub_EF0C(v32, v34, v36);
    swift_bridgeObjectRelease();
    sub_E4E90();
    uint64_t v43 = sub_E4F40();
    uint64_t v45 = v44;
    char v47 = v46;
    uint64_t v49 = v48;
    swift_release();
    uint64_t v50 = v47 & 1;
    sub_EF0C(v37, v39, v42);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v43 = 0;
    uint64_t v45 = 0;
    uint64_t v50 = 0;
    uint64_t v49 = 0;
  }
  uint64_t v51 = v63;
  sub_105F0(v63, (uint64_t)v13, &qword_136708);
  uint64_t v52 = v61;
  sub_105F0((uint64_t)v13, v61, &qword_136708);
  uint64_t v53 = (uint64_t *)(v52 + *(int *)(sub_6898(&qword_138CA8) + 48));
  *uint64_t v53 = v43;
  v53[1] = v45;
  v53[2] = v50;
  v53[3] = v49;
  sub_AE968(v43, v45, v50, v49);
  sub_102B4(v51, &qword_136708);
  sub_AE9AC(v43, v45, v50, v49);
  return sub_102B4((uint64_t)v13, &qword_136708);
}

uint64_t sub_AD188@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_6898(&qword_138C70);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  long long v7 = v1[1];
  long long v14 = *v1;
  long long v15 = v7;
  long long v16 = v1[2];
  long long v17 = v14;
  sub_10250((uint64_t)&v15, (uint64_t)v18, &qword_1331D8);
  uint64_t v8 = (_OWORD *)swift_allocObject();
  long long v9 = v15;
  v8[1] = v14;
  v8[2] = v9;
  v8[3] = v16;
  long long v13 = &v14;
  sub_5F47C((uint64_t)&v17);
  sub_5F47C((uint64_t)v18);
  swift_retain();
  sub_6898(&qword_138C78);
  sub_105AC(&qword_138C80, &qword_138C78);
  sub_E5270();
  int v10 = sub_E4CE0();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v4 + 16))(a1, v6, v3);
  *(_DWORD *)(a1 + *(int *)(sub_6898(&qword_138C88) + 36)) = v10;
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

void *sub_AD384(uint64_t a1, uint64_t a2)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = _swiftEmptyArrayStorage;
  if (v2)
  {
    long long v14 = _swiftEmptyArrayStorage;
    sub_1225C(0, v2, 0);
    uint64_t v3 = _swiftEmptyArrayStorage;
    long long v13 = *(_OWORD *)(a2 + 32);
    uint64_t v6 = (void **)(a1 + 40);
    do
    {
      uint64_t v7 = (uint64_t)*(v6 - 1);
      uint64_t v8 = *v6;
      long long v12 = v13;
      swift_bridgeObjectRetain();
      sub_5F47C((uint64_t)&v13);
      v15._uint64_t countAndFlagsBits = 64;
      v15._object = (void *)0xE100000000000000;
      sub_E5690(v15);
      swift_bridgeObjectRetain();
      v16._uint64_t countAndFlagsBits = v7;
      v16._object = v8;
      sub_E5690(v16);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      long long v14 = v3;
      unint64_t v10 = v3[2];
      unint64_t v9 = v3[3];
      if (v10 >= v9 >> 1)
      {
        sub_1225C(v9 > 1, v10 + 1, 1);
        uint64_t v3 = v14;
      }
      v6 += 3;
      v3[2] = v10 + 1;
      *(_OWORD *)&v3[2 * v10 + 4] = v12;
      --v2;
    }
    while (v2);
  }
  return v3;
}

uint64_t sub_AD4C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = sub_6898(&qword_138B68);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  Swift::String v15 = (char *)v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67[3] = type metadata accessor for MSRepositoryDefault();
  v67[4] = &off_124FE8;
  v67[0] = a4;
  uint64_t v16 = a6 + OBJC_IVAR____TtCV18icloudMailSettings15MSAddressesView9ViewModel__selectedAddressToEdit;
  uint64_t v77 = 0;
  sub_6898(&qword_138B70);
  sub_E4570();
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(v16, v15, v12);
  long long v17 = (void *)(a6 + OBJC_IVAR____TtCV18icloudMailSettings15MSAddressesView9ViewModel_footer);
  *long long v17 = 0;
  v17[1] = 0xE000000000000000;
  *(void *)(a6 + OBJC_IVAR____TtCV18icloudMailSettings15MSAddressesView9ViewModel_cancellables) = &_swiftEmptySetSingleton;
  *(void *)(a6 + OBJC_IVAR____TtCV18icloudMailSettings15MSAddressesView9ViewModel_account) = a1;
  uint64_t v18 = (void *)(a6 + OBJC_IVAR____TtCV18icloudMailSettings15MSAddressesView9ViewModel_defaultEmail);
  void *v18 = a2;
  v18[1] = a3;
  sub_338A0((uint64_t)v67, a6 + OBJC_IVAR____TtCV18icloudMailSettings15MSAddressesView9ViewModel_repository);
  uint64_t v55 = a6;
  *(void *)(a6 + OBJC_IVAR____TtCV18icloudMailSettings15MSAddressesView9ViewModel_maxAliasCountAllowed) = a5;
  swift_retain();
  sub_E4530();
  uint64_t v19 = v78;
  uint64_t v53 = a5;
  uint64_t v54 = a1;
  if (v78)
  {
    uint64_t v52 = v83;
    uint64_t v20 = v77;
    char v21 = v84;
    swift_bridgeObjectRetain();
    sub_5A6D0(v20, v19);
  }
  else
  {
    char v21 = _swiftEmptyArrayStorage;
  }
  swift_beginAccess();
  v68 = v21;
  sub_6898(&qword_138B78);
  sub_E4570();
  swift_endAccess();
  sub_E4530();
  uint64_t v22 = v69;
  if (v69)
  {
    uint64_t v23 = (uint64_t)v68;
    uint64_t v24 = v73;
    v49[1] = v75;
    v49[2] = v70;
    uint64_t v25 = (uint64_t)v76;
    uint64_t v77 = (uint64_t)v68;
    uint64_t v78 = v69;
    uint64_t v79 = v70;
    uint64_t v80 = v71;
    uint64_t v81 = v72;
    uint64_t v82 = v73;
    uint64_t v83 = v74;
    v84 = v75;
    v85 = v76;
    sub_ADAF8((uint64_t)v68, v69);
    uint64_t v26 = swift_bridgeObjectRetain();
    uint64_t v27 = sub_AD384(v26, (uint64_t)&v77);
    uint64_t v50 = v25;
    uint64_t v51 = v23;
    uint64_t v52 = v24;
    sub_5A6D0(v23, v22);
    swift_bridgeObjectRelease();
    if (v27[2])
    {
      uint64_t v29 = v27[4];
      unint64_t v28 = v27[5];
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v29 = 0;
      unint64_t v28 = 0xE000000000000000;
    }
    swift_bridgeObjectRelease();
    sub_5A6D0(v51, v22);
    uint64_t v30 = v29;
  }
  else
  {
    uint64_t v30 = 0;
    unint64_t v28 = 0xE000000000000000;
  }
  swift_beginAccess();
  uint64_t v58 = v30;
  uint64_t v59 = v28;
  sub_E4570();
  swift_endAccess();
  sub_E4530();
  uint64_t v31 = v59;
  if (v59)
  {
    uint64_t v51 = v64;
    uint64_t v52 = (uint64_t)v65;
    uint64_t v32 = v58;
    v68 = (void *)v58;
    uint64_t v69 = v59;
    uint64_t v70 = v60;
    uint64_t v71 = v61;
    uint64_t v72 = v62;
    uint64_t v73 = v63;
    uint64_t v74 = v64;
    v75 = v65;
    v76 = v66;
    uint64_t v50 = sub_C6F68();
    unint64_t v34 = v33;
    sub_5A6D0(v32, v31);
    if (v34) {
      uint64_t v31 = v50;
    }
    else {
      uint64_t v31 = 0;
    }
    if (v34) {
      unint64_t v35 = v34;
    }
    else {
      unint64_t v35 = 0xE000000000000000;
    }
  }
  else
  {
    unint64_t v35 = 0xE000000000000000;
  }
  swift_beginAccess();
  long long v56 = (void *)v31;
  unint64_t v57 = v35;
  sub_E4570();
  swift_endAccess();
  sub_E4530();
  uint64_t v36 = v59;
  if (!v59 || (v52 = v64, uint64_t v37 = v66, v38 = v58, swift_bridgeObjectRetain(), sub_5A6D0(v38, v36), !v37))
  {
    swift_bridgeObjectRelease();
    uint64_t v37 = _swiftEmptyArrayStorage;
  }
  swift_beginAccess();
  long long v56 = v37;
  sub_6898(&qword_138B80);
  sub_E4570();
  swift_endAccess();
  sub_E4530();
  uint64_t v39 = v59;
  if (v59)
  {
    uint64_t v40 = v58;
    char v41 = v65;
    swift_bridgeObjectRetain();
    sub_5A6D0(v40, v39);
  }
  else
  {
    char v41 = _swiftEmptyArrayStorage;
  }
  uint64_t v42 = v53;
  uint64_t v43 = v41[2];
  swift_bridgeObjectRelease();
  uint64_t v44 = v55;
  *(unsigned char *)(v55 + OBJC_IVAR____TtCV18icloudMailSettings15MSAddressesView9ViewModel_isAddAliasDisabled) = v43 >= v42;
  uint64_t v45 = sub_DE864();
  char v46 = (uint64_t *)(v44 + OBJC_IVAR____TtCV18icloudMailSettings15MSAddressesView9ViewModel_footer);
  uint64_t *v46 = v45;
  v46[1] = v47;
  swift_bridgeObjectRelease();
  sub_DEDFC();
  sub_6A34((uint64_t)v67);
  return v44;
}

uint64_t sub_ADAF8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for MSAddressesView(uint64_t a1)
{
  sub_6E40();
  swift_release();
  swift_release();

  return sub_6A34(a1 + 56);
}

uint64_t initializeWithCopy for MSAddressesView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_6D60();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
  uint64_t v7 = a2[6];
  *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
  *(void *)(a1 + 48) = v7;
  long long v8 = *((_OWORD *)a2 + 5);
  *(_OWORD *)(a1 + 80) = v8;
  uint64_t v9 = v8;
  unint64_t v10 = **(void (***)(uint64_t, uint64_t, uint64_t))(v8 - 8);
  swift_retain();
  swift_retain();
  v10(a1 + 56, (uint64_t)(a2 + 7), v9);
  return a1;
}

uint64_t assignWithCopy for MSAddressesView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_6D60();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  sub_6E40();
  *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
  *(void *)(a1 + 32) = a2[4];
  swift_retain();
  swift_release();
  uint64_t v7 = a2[6];
  *(void *)(a1 + 40) = a2[5];
  *(void *)(a1 + 48) = v7;
  swift_retain();
  swift_release();
  sub_ADD5C((uint64_t *)(a1 + 56), a2 + 7);
  return a1;
}

uint64_t *sub_ADD5C(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

__n128 initializeWithTake for MSAddressesView(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t assignWithTake for MSAddressesView(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v4;
  sub_6E40();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  sub_6A34(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  return a1;
}

uint64_t getEnumTagSinglePayload for MSAddressesView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 96)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MSAddressesView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 96) = 1;
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
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MSAddressesView()
{
  return &type metadata for MSAddressesView;
}

uint64_t sub_AE0E8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_AE104@<X0>(char *a1@<X8>)
{
  return sub_AB310(*(void *)(v1 + 16), a1);
}

unint64_t sub_AE10C()
{
  unint64_t result = qword_138BC8;
  if (!qword_138BC8)
  {
    sub_62A4(&qword_138B98);
    sub_62A4(&qword_138B88);
    sub_105AC(&qword_138BC0, &qword_138B88);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_138BC8);
  }
  return result;
}

uint64_t sub_AE1F0(uint64_t *a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_AE22C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_ACB38(a1, v2 + 16, a2);
}

uint64_t sub_AE238@<X0>(uint64_t *a1@<X8>)
{
  return sub_ACB98(v1 + 16, a1);
}

uint64_t sub_AE240(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_AE288@<X0>(uint64_t *a1@<X8>)
{
  return sub_AB870(*(uint64_t **)(v1 + 16), a1);
}

uint64_t sub_AE290@<X0>(char *a1@<X8>)
{
  return sub_AC060(*(uint64_t **)(v1 + 16), a1);
}

uint64_t sub_AE2A4@<X0>(long long *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_AC6B0(a1, (uint64_t *)(v2 + 16), a2);
}

unint64_t sub_AE2AC()
{
  unint64_t result = qword_138C38;
  if (!qword_138C38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_138C38);
  }
  return result;
}

unint64_t sub_AE300()
{
  unint64_t result = qword_138C40;
  if (!qword_138C40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_138C40);
  }
  return result;
}

uint64_t sub_AE358()
{
  return sub_AC83C();
}

uint64_t sub_AE368()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_AE378()
{
  sub_6E40();
  swift_release();
  swift_release();
  sub_6A34(v0 + 72);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 169, 7);
}

uint64_t sub_AE3EC()
{
  return sub_AC78C(v0 + 16, v0 + 112);
}

uint64_t sub_AE404()
{
  return sub_ABD28();
}

uint64_t sub_AE418()
{
  sub_6E40();
  swift_release();
  swift_release();
  sub_6A34(v0 + 72);

  return _swift_deallocObject(v0, 112, 7);
}

uint64_t sub_AE46C@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_ABDC8(a1, (uint64_t *)(v2 + 16), a2);
}

unint64_t sub_AE474()
{
  unint64_t result = qword_138C60;
  if (!qword_138C60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_138C60);
  }
  return result;
}

uint64_t sub_AE4C8()
{
  sub_6E40();
  swift_release();
  swift_release();
  sub_6A34(v0 + 72);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 184, 7);
}

uint64_t sub_AE53C()
{
  return sub_ABFB0(v0 + 16, v0 + 112);
}

uint64_t destroy for MSAddressesView.NavigationLinkWSubtitle()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for MSAddressesView.NavigationLinkWSubtitle(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for MSAddressesView.NavigationLinkWSubtitle(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[5];
  a1[4] = a2[4];
  a1[5] = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for MSAddressesView.NavigationLinkWSubtitle(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = v5;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for MSAddressesView.NavigationLinkWSubtitle()
{
  return &type metadata for MSAddressesView.NavigationLinkWSubtitle;
}

uint64_t sub_AE6EC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_AE8B4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_AE8D0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_AE918()
{
  return (*(uint64_t (**)(void))(v0 + 48))();
}

uint64_t sub_AE940()
{
  return sub_ACBF8();
}

uint64_t sub_AE948@<X0>(uint64_t a1@<X8>)
{
  return sub_ACC9C(*(void **)(v1 + 16), a1);
}

uint64_t sub_AE968(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_FA04(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_AE9AC(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_EF0C(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_AE9F4()
{
  unint64_t result = qword_138CB0;
  if (!qword_138CB0)
  {
    sub_62A4(&qword_138C88);
    sub_105AC(&qword_138CB8, &qword_138C70);
    sub_105AC(&qword_136508, &qword_136510);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_138CB0);
  }
  return result;
}

void *assignWithCopy for MSMailImportView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

void *assignWithTake for MSMailImportView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for MSMailImportView()
{
  return &type metadata for MSMailImportView;
}

uint64_t sub_AEB40()
{
  return swift_getOpaqueTypeConformance2();
}

__n128 sub_AEB5C@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_E5890();
    uint64_t v23 = (void *)sub_E4DF0();
    sub_E42F0();
  }
  sub_E4980();
  uint64_t v24 = sub_6898(&qword_131630);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(a9, v13, v24);
  uint64_t v25 = (_OWORD *)(a9 + *(int *)(sub_6898(&qword_131720) + 36));
  v25[4] = v31;
  v25[5] = v32;
  v25[6] = v33;
  *uint64_t v25 = v27;
  v25[1] = v28;
  __n128 result = v30;
  v25[2] = v29;
  v25[3] = v30;
  return result;
}

uint64_t sub_AED48@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  uint64_t v20 = a19;
  char v21 = a18;
  uint64_t v22 = a17;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_E5890();
    long long v31 = (void *)sub_E4DF0();
    sub_E42F0();

    char v21 = a18;
    uint64_t v20 = a19;
    uint64_t v22 = a17;
  }
  sub_E4980();
  *(void *)a9 = a16;
  *(void *)(a9 + 8) = v22;
  *(unsigned char *)(a9 + 16) = v21 & 1;
  *(void *)(a9 + 24) = v20;
  *(_OWORD *)(a9 + 96) = v37;
  *(_OWORD *)(a9 + 112) = v38;
  *(_OWORD *)(a9 + 128) = v39;
  *(_OWORD *)(a9 + 32) = v33;
  *(_OWORD *)(a9 + 48) = v34;
  *(_OWORD *)(a9 + 64) = v35;
  *(_OWORD *)(a9 + 80) = v36;
  sub_FA04(a16, v22, v21 & 1);

  return swift_bridgeObjectRetain();
}

__n128 sub_AEF3C@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_E5890();
    uint64_t v23 = (void *)sub_E4DF0();
    sub_E42F0();
  }
  sub_E4980();
  sub_105F0(v13, a9, &qword_136720);
  uint64_t v24 = (_OWORD *)(a9 + *(int *)(sub_6898(&qword_136728) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *uint64_t v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

uint64_t sub_AF0FC@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v18 = a2;
  long long v3 = a1[1];
  long long v23 = *a1;
  long long v24 = v3;
  v25[0] = a1[2];
  *(_OWORD *)((char *)v25 + 9) = *(long long *)((char *)a1 + 41);
  sub_6898(qword_135320);
  sub_E52F0();
  if (*((void *)&v26 + 1)) {
    swift_bridgeObjectRelease();
  }
  LOBYTE(v23) = *((void *)&v26 + 1) != 0;
  sub_E5330();
  int v17 = v30;
  long long v4 = a1[1];
  long long v23 = *a1;
  long long v24 = v4;
  v25[0] = a1[2];
  *(_OWORD *)((char *)v25 + 9) = *(long long *)((char *)a1 + 41);
  uint64_t v5 = sub_E52F0();
  v16[2] = v16;
  long long v23 = v26;
  long long v24 = v27;
  *(void *)&v25[0] = v28;
  BYTE8(v25[0]) = v29;
  __chkstk_darwin(v5);
  v16[1] = sub_6898(&qword_131578);
  sub_6898(&qword_131570);
  uint64_t v6 = sub_62A4(&qword_131580);
  uint64_t v7 = sub_62A4(&qword_131588);
  uint64_t v8 = sub_62A4(&qword_131590);
  uint64_t v9 = sub_62A4(&qword_131598);
  unint64_t v10 = sub_E358();
  unint64_t v11 = sub_E3F8();
  uint64_t v19 = v9;
  uint64_t v20 = &type metadata for String;
  unint64_t v21 = v10;
  unint64_t v22 = v11;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v19 = v8;
  uint64_t v20 = (void *)OpaqueTypeConformance2;
  uint64_t v13 = swift_getOpaqueTypeConformance2();
  uint64_t v14 = sub_105AC(&qword_1315C0, &qword_131588);
  uint64_t v19 = v6;
  uint64_t v20 = (void *)v7;
  unint64_t v21 = v13;
  unint64_t v22 = v14;
  swift_getOpaqueTypeConformance2();
  sub_E44C();
  sub_105AC((unint64_t *)&qword_1315D0, &qword_131570);
  sub_E50E0();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_AF414()
{
  sub_6898(qword_135320);
  sub_E52F0();
  if (v2) {
    swift_bridgeObjectRelease();
  }
  sub_E5330();
  uint64_t v0 = sub_E52F0();
  __chkstk_darwin(v0);
  sub_6898(&qword_1336B0);
  sub_6898(&qword_131570);
  sub_62A4(&qword_1336B8);
  sub_62A4(&qword_1336C0);
  sub_35464();
  sub_E3F8();
  swift_getOpaqueTypeConformance2();
  swift_getOpaqueTypeConformance2();
  sub_E44C();
  sub_105AC((unint64_t *)&qword_1315D0, &qword_131570);
  sub_E50E0();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_AF6A0@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v18 = a2;
  long long v3 = a1[1];
  long long v23 = *a1;
  long long v24 = v3;
  v25[0] = a1[2];
  *(_OWORD *)((char *)v25 + 9) = *(long long *)((char *)a1 + 41);
  sub_6898(qword_135320);
  sub_E52F0();
  if (*((void *)&v26 + 1)) {
    swift_bridgeObjectRelease();
  }
  LOBYTE(v23) = *((void *)&v26 + 1) != 0;
  sub_E5330();
  int v17 = v30;
  long long v4 = a1[1];
  long long v23 = *a1;
  long long v24 = v4;
  v25[0] = a1[2];
  *(_OWORD *)((char *)v25 + 9) = *(long long *)((char *)a1 + 41);
  uint64_t v5 = sub_E52F0();
  v16[2] = v16;
  long long v23 = v26;
  long long v24 = v27;
  *(void *)&v25[0] = v28;
  BYTE8(v25[0]) = v29;
  __chkstk_darwin(v5);
  v16[1] = sub_6898(&qword_134840);
  sub_6898(&qword_131570);
  uint64_t v6 = sub_62A4(&qword_134848);
  uint64_t v7 = sub_62A4(&qword_134850);
  uint64_t v8 = sub_62A4(&qword_134858);
  uint64_t v9 = sub_62A4(&qword_134860);
  unint64_t v10 = sub_502B8();
  unint64_t v11 = sub_E3F8();
  uint64_t v19 = v9;
  uint64_t v20 = &type metadata for String;
  unint64_t v21 = v10;
  unint64_t v22 = v11;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v19 = v8;
  uint64_t v20 = (void *)OpaqueTypeConformance2;
  uint64_t v13 = swift_getOpaqueTypeConformance2();
  uint64_t v14 = sub_105AC(&qword_134880, &qword_134850);
  uint64_t v19 = v6;
  uint64_t v20 = (void *)v7;
  unint64_t v21 = v13;
  unint64_t v22 = v14;
  swift_getOpaqueTypeConformance2();
  sub_E44C();
  sub_105AC((unint64_t *)&qword_1315D0, &qword_131570);
  sub_E50E0();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_AF9B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_B0060(a1, a2, a3, &qword_1379D8, (void (*)(void))sub_97774);
}

uint64_t sub_AF9EC@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v18 = a2;
  long long v3 = a1[1];
  long long v23 = *a1;
  long long v24 = v3;
  v25[0] = a1[2];
  *(_OWORD *)((char *)v25 + 9) = *(long long *)((char *)a1 + 41);
  sub_6898(qword_135320);
  sub_E52F0();
  if (*((void *)&v26 + 1)) {
    swift_bridgeObjectRelease();
  }
  LOBYTE(v23) = *((void *)&v26 + 1) != 0;
  sub_E5330();
  int v17 = v30;
  long long v4 = a1[1];
  long long v23 = *a1;
  long long v24 = v4;
  v25[0] = a1[2];
  *(_OWORD *)((char *)v25 + 9) = *(long long *)((char *)a1 + 41);
  uint64_t v5 = sub_E52F0();
  v16[2] = v16;
  long long v23 = v26;
  long long v24 = v27;
  *(void *)&v25[0] = v28;
  BYTE8(v25[0]) = v29;
  __chkstk_darwin(v5);
  v16[1] = sub_6898(&qword_138888);
  sub_6898(&qword_131570);
  uint64_t v6 = sub_62A4(&qword_138890);
  uint64_t v7 = sub_62A4(&qword_138898);
  uint64_t v8 = sub_62A4(&qword_1388A0);
  uint64_t v9 = sub_62A4(&qword_1388A8);
  unint64_t v10 = sub_AA07C();
  unint64_t v11 = sub_E3F8();
  uint64_t v19 = v9;
  uint64_t v20 = &type metadata for String;
  unint64_t v21 = v10;
  unint64_t v22 = v11;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v19 = v8;
  uint64_t v20 = (void *)OpaqueTypeConformance2;
  uint64_t v13 = swift_getOpaqueTypeConformance2();
  uint64_t v14 = sub_105AC(&qword_1388C8, &qword_138898);
  uint64_t v19 = v6;
  uint64_t v20 = (void *)v7;
  unint64_t v21 = v13;
  unint64_t v22 = v14;
  swift_getOpaqueTypeConformance2();
  sub_E44C();
  sub_105AC((unint64_t *)&qword_1315D0, &qword_131570);
  sub_E50E0();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_AFD04@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v17 = a2;
  long long v3 = a1[1];
  long long v22 = *a1;
  long long v23 = v3;
  v24[0] = a1[2];
  *(_OWORD *)((char *)v24 + 9) = *(long long *)((char *)a1 + 41);
  sub_6898(qword_135320);
  sub_E52F0();
  if (*((void *)&v25 + 1)) {
    swift_bridgeObjectRelease();
  }
  LOBYTE(v22) = *((void *)&v25 + 1) != 0;
  sub_E5330();
  int v16 = v29;
  long long v4 = a1[1];
  long long v22 = *a1;
  long long v23 = v4;
  v24[0] = a1[2];
  *(_OWORD *)((char *)v24 + 9) = *(long long *)((char *)a1 + 41);
  uint64_t v5 = sub_E52F0();
  uint64_t v15 = (uint64_t)&v15;
  long long v22 = v25;
  long long v23 = v26;
  *(void *)&v24[0] = v27;
  BYTE8(v24[0]) = v28;
  __chkstk_darwin(v5);
  sub_6898(&qword_138D50);
  sub_6898(&qword_131570);
  uint64_t v6 = sub_62A4(&qword_138D48);
  uint64_t v7 = type metadata accessor for MSStartMailImportView(255);
  uint64_t v8 = sub_62A4(&qword_138D40);
  uint64_t v9 = sub_62A4(&qword_138D38);
  uint64_t v10 = sub_105AC(&qword_138D88, &qword_138D38);
  uint64_t v18 = v9;
  uint64_t v19 = v10;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v8;
  uint64_t v19 = OpaqueTypeConformance2;
  uint64_t v12 = swift_getOpaqueTypeConformance2();
  uint64_t v13 = sub_B554C(&qword_138CF8, (void (*)(uint64_t))type metadata accessor for MSStartMailImportView);
  uint64_t v18 = v6;
  uint64_t v19 = v7;
  uint64_t v20 = v12;
  uint64_t v21 = v13;
  swift_getOpaqueTypeConformance2();
  sub_E44C();
  sub_105AC((unint64_t *)&qword_1315D0, &qword_131570);
  sub_E50E0();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_B002C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_B0060(a1, a2, a3, &qword_138E48, (void (*)(void))sub_B5B1C);
}

uint64_t sub_B0060(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, void (*a5)(void))
{
  sub_6898(qword_135320);
  sub_E52F0();
  if (v9) {
    swift_bridgeObjectRelease();
  }
  sub_E5330();
  uint64_t v7 = sub_E52F0();
  __chkstk_darwin(v7);
  sub_6898(a4);
  sub_6898(&qword_131570);
  a5();
  sub_E44C();
  sub_105AC((unint64_t *)&qword_1315D0, &qword_131570);
  sub_E50E0();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_B024C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_B0060(a1, a2, a3, &qword_138E78, (void (*)(void))sub_B5CE0);
}

uint64_t sub_B0280@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v36 = a3;
  uint64_t v5 = sub_6898(&qword_138CC0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_6898(&qword_138CC8);
  uint64_t v33 = v9;
  __chkstk_darwin(v9);
  unint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_6898(&qword_138CD0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v34 = v12;
  uint64_t v35 = v13;
  __chkstk_darwin(v12);
  long long v37 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a1;
  *(void *)(v15 + 24) = a2;
  uint64_t v38 = a1;
  uint64_t v39 = a2;
  swift_retain();
  sub_6898(&qword_138CD8);
  sub_105AC(&qword_138CE0, &qword_138CD8);
  sub_E5270();
  int v16 = sub_E4CE0();
  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  long long v31 = v11;
  v17(v11, v8, v5);
  *(_DWORD *)&v11[*(int *)(v9 + 36)] = v16;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v32 = _s9ViewModelCMa_2();
  sub_B554C(&qword_136660, (void (*)(uint64_t))_s9ViewModelCMa_2);
  sub_E48C0();
  swift_getKeyPath();
  sub_E48D0();
  swift_release();
  swift_release();
  uint64_t v18 = swift_allocObject();
  uint64_t v28 = a1;
  *(void *)(v18 + 16) = a1;
  *(void *)(v18 + 24) = a2;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a1;
  *(void *)(v19 + 24) = a2;
  uint64_t v29 = type metadata accessor for MSStartMailImportView(0);
  unint64_t v30 = sub_B3FC0();
  uint64_t v20 = sub_B554C(&qword_138CF8, (void (*)(uint64_t))type metadata accessor for MSStartMailImportView);
  swift_retain_n();
  uint64_t v21 = v33;
  uint64_t v22 = (uint64_t)v31;
  sub_E50F0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_102B4(v22, &qword_138CC8);
  uint64_t v23 = v28;
  sub_E48C0();
  swift_getKeyPath();
  sub_E48D0();
  swift_release();
  swift_release();
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = v23;
  *(void *)(v24 + 24) = a2;
  swift_retain();
  uint64_t v40 = v21;
  uint64_t v41 = v29;
  unint64_t v42 = v30;
  uint64_t v43 = v20;
  swift_getOpaqueTypeConformance2();
  sub_B4140();
  uint64_t v25 = v34;
  long long v26 = v37;
  sub_E50F0();
  swift_release();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v26, v25);
}

uint64_t sub_B0804()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_E45B0();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  if ((v2 & 1) == 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_E45B0();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v1 = *(void *)(v2 + 16);
    swift_bridgeObjectRelease();
    if (!v1)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_E45B0();
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
    }
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    return sub_E45C0();
  }
  return result;
}

uint64_t sub_B09AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _s9ViewModelCMa_2();
  sub_B554C(&qword_136660, (void (*)(uint64_t))_s9ViewModelCMa_2);
  sub_E48C0();
  swift_getKeyPath();
  sub_E48D0();
  swift_release();
  swift_release();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  *(void *)a3 = v9;
  *(void *)(a3 + 8) = v10;
  *(unsigned char *)(a3 + 16) = v11;
  *(void *)(a3 + 24) = sub_B4274;
  *(void *)(a3 + 32) = v6;
  *(void *)(a3 + 40) = sub_B427C;
  *(void *)(a3 + 48) = v7;
  return swift_retain_n();
}

uint64_t sub_B0AF8@<X0>(unsigned char *a1@<X8>)
{
  return sub_EB4C(a1);
}

uint64_t sub_B0B0C()
{
  return sub_EBDC();
}

uint64_t sub_B0B20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v60 = a3;
  uint64_t v5 = sub_6898(&qword_138D38);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_6898(&qword_138D40);
  uint64_t v9 = *(void *)(v61 - 8);
  __chkstk_darwin(v61);
  char v11 = (char *)v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_6898(&qword_138D48);
  uint64_t v52 = *(void *)(v50 - 8);
  __chkstk_darwin(v50);
  char v46 = (char *)v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_6898(&qword_138D50);
  uint64_t v53 = *(void *)(v54 - 8);
  __chkstk_darwin(v54);
  uint64_t v49 = (char *)v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_6898(&qword_138D58);
  uint64_t v59 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  uint64_t v51 = (uint64_t)v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_6898(&qword_138D60);
  uint64_t v56 = *(void *)(v58 - 8);
  __chkstk_darwin(v58);
  uint64_t v55 = (char *)v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = a1;
  uint64_t v63 = a2;
  sub_6898(&qword_138D68);
  sub_105AC(&qword_138D70, &qword_138D68);
  sub_E4EA0();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a1;
  *(void *)(v16 + 24) = a2;
  uint64_t v17 = sub_105AC(&qword_138D88, &qword_138D38);
  swift_retain();
  sub_E4FF0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v69._uint64_t countAndFlagsBits = v5;
  v69._object = (void *)v17;
  uint64_t OpaqueTypeConformance2 = (void *)swift_getOpaqueTypeConformance2();
  uint64_t v19 = v61;
  sub_E4FA0();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v19);
  v45[1] = _s9ViewModelCMa_2();
  sub_B554C(&qword_136660, (void (*)(uint64_t))_s9ViewModelCMa_2);
  sub_E48C0();
  swift_getKeyPath();
  sub_E48D0();
  swift_release();
  swift_release();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a1;
  *(void *)(v20 + 24) = a2;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = a1;
  *(void *)(v21 + 24) = a2;
  uint64_t v47 = (void *)type metadata accessor for MSStartMailImportView(0);
  swift_retain_n();
  v66._uint64_t countAndFlagsBits = v61;
  v66._object = OpaqueTypeConformance2;
  uint64_t v48 = swift_getOpaqueTypeConformance2();
  uint64_t v61 = sub_B554C(&qword_138CF8, (void (*)(uint64_t))type metadata accessor for MSStartMailImportView);
  uint64_t v22 = v49;
  uint64_t v23 = v50;
  uint64_t v24 = v46;
  sub_E50F0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v52 + 8))(v24, v23);
  sub_E48C0();
  swift_getKeyPath();
  sub_E48D0();
  swift_release();
  swift_release();
  Swift::String v69 = v66;
  long long v70 = v67;
  *(_OWORD *)uint64_t v71 = v68[0];
  *(_OWORD *)&v71[9] = *(_OWORD *)((char *)v68 + 9);
  uint64_t v25 = v51;
  sub_AFD04((long long *)&v69._countAndFlagsBits, v51);
  uint64_t countAndFlagsBits = v69._countAndFlagsBits;
  sub_E5F4((uint64_t)&countAndFlagsBits);
  swift_release();
  sub_10250((uint64_t)&v70, (uint64_t)v73, &qword_1312F8);
  sub_E620((uint64_t)v73);
  uint64_t v26 = v54;
  (*(void (**)(char *, uint64_t))(v53 + 8))(v22, v54);
  type metadata accessor for MAPreferencesViewProvider();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v28 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v66._uint64_t countAndFlagsBits = 2777980912;
  v66._object = (void *)0xA400000000000000;
  v74._uint64_t countAndFlagsBits = 0x4D5F54524F504D49;
  v74._object = (void *)0xEF53454741535345;
  sub_E5690(v74);
  v75._uint64_t countAndFlagsBits = 2777980912;
  v75._object = (void *)0xA400000000000000;
  sub_E5690(v75);
  v44._uint64_t countAndFlagsBits = 0xE000000000000000;
  v76._uint64_t countAndFlagsBits = 0x4D5F54524F504D49;
  v76._object = (void *)0xEF53454741535345;
  v77.value._uint64_t countAndFlagsBits = 0;
  v77.value._object = 0;
  v29.super.isa = v28;
  uint64_t v30 = sub_E3FE0(v76, v77, v29, v66, v44);
  uint64_t v32 = v31;

  swift_bridgeObjectRelease();
  uint64_t v64 = v30;
  uint64_t v65 = v32;
  uint64_t v33 = sub_62A4(&qword_131570);
  v66._uint64_t countAndFlagsBits = v23;
  v66._object = v47;
  *(void *)&long long v67 = v48;
  *((void *)&v67 + 1) = v61;
  uint64_t v34 = swift_getOpaqueTypeConformance2();
  unint64_t v35 = sub_E44C();
  uint64_t v36 = sub_105AC((unint64_t *)&qword_1315D0, &qword_131570);
  v66._uint64_t countAndFlagsBits = v26;
  v66._object = &type metadata for MSError;
  *(void *)&long long v67 = v33;
  *((void *)&v67 + 1) = v34;
  *(void *)&v68[0] = v35;
  *((void *)&v68[0] + 1) = v36;
  swift_getOpaqueTypeConformance2();
  sub_E3F8();
  long long v37 = v55;
  uint64_t v38 = v57;
  sub_E5050();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v25, v38);
  uint64_t v39 = v56;
  uint64_t v40 = v60;
  uint64_t v41 = v58;
  (*(void (**)(uint64_t, char *, uint64_t))(v56 + 16))(v60, v37, v58);
  unint64_t v42 = (uint64_t (**)())(v40 + *(int *)(sub_6898(&qword_138D90) + 36));
  *unint64_t v42 = sub_B3D58;
  v42[1] = 0;
  v42[2] = 0;
  v42[3] = 0;
  return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v37, v41);
}

uint64_t sub_B15D4@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_E4BA0();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v2 = sub_6898(&qword_138D08);
  return sub_B1634(a1 + *(int *)(v2 + 44));
}

uint64_t sub_B1634@<X0>(uint64_t a1@<X8>)
{
  uint64_t v66 = a1;
  uint64_t v65 = sub_6898(&qword_138D10);
  __chkstk_darwin(v65);
  uint64_t v2 = (char *)&v60 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_6898(&qword_131630);
  uint64_t v63 = *(void (***)(char *, uint64_t *, uint64_t))(v3 - 8);
  uint64_t v64 = v3;
  __chkstk_darwin(v3);
  uint64_t v62 = (uint64_t *)((char *)&v60 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_6898(&qword_138D18);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  long long v67 = (char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (void (**)(char *, uint64_t *, uint64_t))((char *)&v60 - v8);
  type metadata accessor for MAPreferencesViewProvider();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  char v11 = self;
  uint64_t v12 = (objc_class *)[v11 bundleForClass:ObjCClassFromMetadata];
  v71._uint64_t countAndFlagsBits = 2777980912;
  v71._object = (void *)0xA400000000000000;
  v72._uint64_t countAndFlagsBits = 0x4D5F54524F504D49;
  v72._object = (void *)0xEF53454741535345;
  sub_E5690(v72);
  v73._uint64_t countAndFlagsBits = 2777980912;
  v73._object = (void *)0xA400000000000000;
  sub_E5690(v73);
  v58._uint64_t countAndFlagsBits = 0xE000000000000000;
  v74._uint64_t countAndFlagsBits = 0x4D5F54524F504D49;
  v74._object = (void *)0xEF53454741535345;
  v78.value._uint64_t countAndFlagsBits = 0;
  v78.value._object = 0;
  v13.super.isa = v12;
  uint64_t v14 = sub_E3FE0(v74, v78, v13, v71, v58);
  uint64_t v16 = v15;

  swift_bridgeObjectRelease();
  v71._uint64_t countAndFlagsBits = v14;
  v71._object = v16;
  sub_E3F8();
  uint64_t v17 = sub_E4F60();
  uint64_t v69 = v18;
  int v68 = v19;
  uint64_t v21 = v20;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_E45B0();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v70 = v17;
  if (LOBYTE(v71._countAndFlagsBits) == 1)
  {
    uint64_t v22 = v62;
    sub_E4790();
    uint64_t v24 = v63;
    uint64_t v23 = v64;
    v63[2](v2, v22, v64);
    swift_storeEnumTagMultiPayload();
    sub_6898(&qword_138D20);
    sub_105AC(&qword_131628, &qword_131630);
    sub_B4294();
    sub_E4C50();
    ((void (*)(uint64_t *, uint64_t))v24[1])(v22, v23);
    uint64_t v25 = v66;
    uint64_t v26 = (uint64_t)v67;
    uint64_t v27 = (uint64_t)v9;
  }
  else
  {
    uint64_t v60 = v11;
    uint64_t v62 = (uint64_t *)v2;
    uint64_t v63 = v9;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_E45B0();
    swift_release();
    swift_release();
    swift_release();
    uint64_t countAndFlagsBits = v71._countAndFlagsBits;
    uint64_t v29 = *(void *)(v71._countAndFlagsBits + 16);
    uint64_t v61 = v21;
    if (v29)
    {
      swift_bridgeObjectRetain();
      uint64_t v30 = 64;
      while (2)
      {
        switch(*(unsigned char *)(countAndFlagsBits + v30))
        {
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
            char v31 = sub_E5C20();
            swift_bridgeObjectRelease();
            if (v31) {
              goto LABEL_11;
            }
            v30 += 64;
            if (--v29) {
              continue;
            }
            swift_bridgeObjectRelease_n();
            goto LABEL_10;
          default:
            swift_bridgeObjectRelease();
LABEL_11:
            uint64_t v36 = ObjCClassFromMetadata;
            long long v37 = v60;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v38 = (objc_class *)[v37 bundleForClass:v36];
            v71._uint64_t countAndFlagsBits = 2777980912;
            v71._object = (void *)0xA400000000000000;
            v75._uint64_t countAndFlagsBits = 0xD000000000000017;
            v75._object = (void *)0x80000000000F4010;
            sub_E5690(v75);
            v76._uint64_t countAndFlagsBits = 2777980912;
            v76._object = (void *)0xA400000000000000;
            sub_E5690(v76);
            v59._uint64_t countAndFlagsBits = 0xE000000000000000;
            v77._uint64_t countAndFlagsBits = 0xD000000000000017;
            v77._object = (void *)0x80000000000F4010;
            v79.value._uint64_t countAndFlagsBits = 0;
            v79.value._object = 0;
            v39.super.isa = v38;
            uint64_t v40 = sub_E3FE0(v77, v79, v39, v71, v59);
            unint64_t v42 = v41;

            swift_bridgeObjectRelease();
            v71._uint64_t countAndFlagsBits = v40;
            v71._object = v42;
            uint64_t v43 = sub_E4F60();
            uint64_t v45 = v44;
            char v47 = v46 & 1;
            sub_E51B0();
            uint64_t v32 = sub_E4F20();
            uint64_t v33 = v48;
            char v50 = v49;
            uint64_t v35 = v51;
            swift_release();
            uint64_t v34 = v50 & 1;
            sub_EF0C(v43, v45, v47);
            swift_bridgeObjectRelease();
            break;
        }
        break;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
LABEL_10:
      uint64_t v32 = 0;
      uint64_t v33 = 0;
      uint64_t v34 = 0;
      uint64_t v35 = 0;
    }
    uint64_t v25 = v66;
    uint64_t v26 = (uint64_t)v67;
    uint64_t v27 = (uint64_t)v63;
    uint64_t v52 = v62;
    *uint64_t v62 = v32;
    v52[1] = v33;
    v52[2] = v34;
    v52[3] = v35;
    swift_storeEnumTagMultiPayload();
    sub_6898(&qword_138D20);
    sub_105AC(&qword_131628, &qword_131630);
    sub_B4294();
    sub_E4C50();
    uint64_t v21 = v61;
  }
  uint64_t v53 = v69;
  char v54 = v68 & 1;
  sub_105F0(v27, v26, &qword_138D18);
  uint64_t v55 = v70;
  *(void *)uint64_t v25 = v70;
  *(void *)(v25 + 8) = v53;
  *(unsigned char *)(v25 + 16) = v54;
  *(void *)(v25 + 24) = v21;
  *(void *)(v25 + 32) = 0;
  *(unsigned char *)(v25 + 40) = 1;
  uint64_t v56 = sub_6898(&qword_138D30);
  sub_105F0(v26, v25 + *(int *)(v56 + 64), &qword_138D18);
  sub_FA04(v55, v53, v54);
  swift_bridgeObjectRetain();
  sub_102B4(v27, &qword_138D18);
  sub_102B4(v26, &qword_138D18);
  sub_EF0C(v55, v53, v54);
  return swift_bridgeObjectRelease();
}

uint64_t sub_B1E44@<X0>(unsigned char *a1@<X8>)
{
  return sub_EB4C(a1);
}

uint64_t sub_B1E58()
{
  return sub_EBDC();
}

uint64_t sub_B1E6C@<X0>(unsigned char *a1@<X8>)
{
  return sub_EB4C(a1);
}

uint64_t sub_B1E80()
{
  return sub_EBDC();
}

uint64_t sub_B1E94()
{
  return sub_E45C0();
}

uint64_t sub_B1F40@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v64 = a3;
  uint64_t v5 = sub_6898(&qword_138D98);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v61 = v5;
  uint64_t v62 = v6;
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v65 = (char *)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v58 - v9;
  uint64_t v11 = sub_6898(&qword_138DA0);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v14 = (char *)&v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v58 - v15;
  uint64_t v17 = sub_6898(&qword_138DA8);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v63 = (uint64_t)&v58 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v58 - v20;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_E45B0();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v22 = *(void *)(v66._countAndFlagsBits + 16);
  uint64_t v23 = swift_bridgeObjectRelease();
  uint64_t v60 = (char *)a1;
  if (v22)
  {
    Swift::String v59 = (char *)&v58;
    __chkstk_darwin(v23);
    v57._object = a2;
    type metadata accessor for MAPreferencesViewProvider();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    uint64_t v25 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
    v66._uint64_t countAndFlagsBits = 2777980912;
    v66._object = (void *)0xA400000000000000;
    v74._uint64_t countAndFlagsBits = 0x4D5F54524F504D49;
    v74._object = (void *)0xEB000000004C4941;
    sub_E5690(v74);
    v75._uint64_t countAndFlagsBits = 2777980912;
    v75._object = (void *)0xA400000000000000;
    sub_E5690(v75);
    v57._uint64_t countAndFlagsBits = 0xE000000000000000;
    v76._uint64_t countAndFlagsBits = 0x4D5F54524F504D49;
    v76._object = (void *)0xEB000000004C4941;
    v77.value._uint64_t countAndFlagsBits = 0;
    v77.value._object = 0;
    v26.super.isa = v25;
    uint64_t v27 = sub_E3FE0(v76, v77, v26, v66, v57);
    uint64_t v28 = v21;
    uint64_t v29 = v16;
    char v31 = v30;

    swift_bridgeObjectRelease();
    v66._uint64_t countAndFlagsBits = v27;
    v66._object = v31;
    uint64_t v16 = v29;
    uint64_t v21 = v28;
    sub_E3F8();
    uint64_t v70 = sub_E4F60();
    uint64_t v71 = v32;
    char v72 = v33 & 1;
    uint64_t v73 = v34;
    sub_46B0C();
    sub_E4BC0();
    v66._uint64_t countAndFlagsBits = sub_E4F50();
    v66._object = v35;
    char v67 = v36 & 1;
    uint64_t v68 = v37;
    __int16 v69 = 256;
    sub_6898(&qword_138DB0);
    sub_6898(&qword_1316A8);
    sub_B530C();
    sub_47DE8();
    sub_E5390();
    uint64_t v38 = sub_6898(&qword_138DE0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v28, 0, 1, v38);
  }
  else
  {
    uint64_t v39 = sub_6898(&qword_138DE0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v21, 1, 1, v39);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_E45B0();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v40 = *(void *)(v66._countAndFlagsBits + 16);
  uint64_t v41 = swift_bridgeObjectRelease();
  if (v40)
  {
    __chkstk_darwin(v41);
    sub_6898(&qword_138DE8);
    sub_105AC(&qword_138DF0, &qword_138DE8);
    sub_E53A0();
    uint64_t v42 = sub_6898(&qword_138DF8);
    uint64_t v43 = (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v16, 0, 1, v42);
  }
  else
  {
    uint64_t v44 = sub_6898(&qword_138DF8);
    uint64_t v43 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v16, 1, 1, v44);
  }
  __chkstk_darwin(v43);
  sub_6898(&qword_131570);
  sub_105AC((unint64_t *)&qword_1315D0, &qword_131570);
  sub_E53A0();
  uint64_t v45 = v63;
  sub_105F0((uint64_t)v21, v63, &qword_138DA8);
  sub_105F0((uint64_t)v16, (uint64_t)v14, &qword_138DA0);
  Swift::String v59 = v16;
  uint64_t v60 = v21;
  uint64_t v46 = v61;
  uint64_t v47 = v62;
  uint64_t v48 = *(void (**)(char *, char *, uint64_t))(v62 + 16);
  char v49 = v65;
  v48(v65, v10, v61);
  char v50 = v10;
  uint64_t v51 = (uint64_t)v14;
  uint64_t v52 = v46;
  uint64_t v53 = v64;
  sub_105F0(v45, v64, &qword_138DA8);
  uint64_t v54 = sub_6898(&qword_138E00);
  sub_105F0(v51, v53 + *(int *)(v54 + 48), &qword_138DA0);
  v48((char *)(v53 + *(int *)(v54 + 64)), v49, v52);
  uint64_t v55 = *(void (**)(char *, uint64_t))(v47 + 8);
  v55(v50, v52);
  sub_102B4((uint64_t)v59, &qword_138DA0);
  sub_102B4((uint64_t)v60, &qword_138DA8);
  v55(v49, v52);
  sub_102B4(v51, &qword_138DA0);
  return sub_102B4(v45, &qword_138DA8);
}

uint64_t sub_B2718@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v23 = a1;
  uint64_t v27 = a3;
  uint64_t v28 = sub_6898(&qword_138DC8);
  uint64_t v24 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_6898(&qword_138E10);
  __chkstk_darwin(v26);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_6898(&qword_131630);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_6898(&qword_131720);
  uint64_t v12 = __chkstk_darwin(v25);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v22 - v15;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_E45B0();
  swift_release();
  swift_release();
  swift_release();
  if (v29 == 1)
  {
    sub_E4790();
    sub_E53F0();
    __n128 v17 = sub_AEB5C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v14, 0.0, 1, 0.0, 1);
    (*(void (**)(char *, uint64_t, __n128))(v9 + 8))(v11, v8, v17);
    sub_10250((uint64_t)v14, (uint64_t)v16, &qword_131720);
    sub_105F0((uint64_t)v16, (uint64_t)v7, &qword_131720);
    swift_storeEnumTagMultiPayload();
    sub_F358();
    sub_B5388();
    sub_E4C50();
    return sub_102B4((uint64_t)v16, &qword_131720);
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_E45B0();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v23;
    *(void *)(v19 + 24) = a2;
    swift_retain();
    sub_6898(&qword_1324D8);
    sub_6898(&qword_138DD8);
    sub_105AC(&qword_132578, &qword_1324D8);
    sub_105AC(&qword_138DD0, &qword_138DD8);
    sub_175E4();
    sub_E5350();
    uint64_t v20 = v24;
    uint64_t v21 = v28;
    (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v7, v5, v28);
    swift_storeEnumTagMultiPayload();
    sub_F358();
    sub_B5388();
    sub_E4C50();
    return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v5, v21);
  }
}

uint64_t sub_B2C0C(long long *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for MSMailImportDetailView();
  __chkstk_darwin(v6);
  uint64_t v8 = (uint64_t *)&v21[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  long long v9 = a1[1];
  long long v26 = *a1;
  long long v27 = v9;
  v28[0] = a1[2];
  *(_OWORD *)((char *)v28 + 9) = *(long long *)((char *)a1 + 41);
  uint64_t v22 = &v26;
  sub_338A0(a3 + 16, (uint64_t)v25);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  long long v11 = v27;
  *(_OWORD *)(v10 + 32) = v26;
  *(_OWORD *)(v10 + 48) = v11;
  *(_OWORD *)(v10 + 64) = v28[0];
  *(_OWORD *)(v10 + 73) = *(_OWORD *)((char *)v28 + 9);
  *uint64_t v8 = swift_getKeyPath();
  sub_6898(&qword_1314A8);
  swift_storeEnumTagMultiPayload();
  uint64_t v12 = (char *)v8 + v6[6];
  char v24 = 0;
  sub_47248((uint64_t)&v26);
  sub_47248((uint64_t)&v26);
  swift_retain();
  sub_E5210();
  uint64_t v13 = *((void *)&v23[0] + 1);
  *uint64_t v12 = v23[0];
  *((void *)v12 + 1) = v13;
  uint64_t v14 = (char *)v8 + v6[7];
  char v24 = 0;
  sub_E5210();
  uint64_t v15 = *((void *)&v23[0] + 1);
  *uint64_t v14 = v23[0];
  *((void *)v14 + 1) = v15;
  sub_338A0((uint64_t)v25, (uint64_t)v23);
  uint64_t v16 = (_OWORD *)swift_allocObject();
  long long v17 = v27;
  v16[1] = v26;
  v16[2] = v17;
  void v16[3] = v28[0];
  *(_OWORD *)((char *)v16 + 57) = *(_OWORD *)((char *)v28 + 9);
  sub_47280(v23, (uint64_t)(v16 + 5));
  sub_6A34((uint64_t)v25);
  uint64_t v18 = (char *)v8 + v6[5];
  *(void *)uint64_t v18 = sub_B5540;
  *((void *)v18 + 1) = v16;
  unsigned char v18[16] = 0;
  uint64_t v19 = (uint64_t (**)())((char *)v8 + v6[8]);
  *uint64_t v19 = sub_B54EC;
  v19[1] = (uint64_t (*)())v10;
  sub_6898(&qword_138E18);
  sub_105AC(&qword_138E20, &qword_138E18);
  sub_B554C(&qword_138E28, (void (*)(uint64_t))type metadata accessor for MSMailImportDetailView);
  return sub_E4850();
}

uint64_t sub_B2ED8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  uint64_t v4 = a3[1];
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v5 = (void (*)(unsigned char *, void))sub_E45A0();
  uint64_t v7 = v6;
  uint64_t v8 = sub_B5688(v6, v3, v4);
  uint64_t result = swift_bridgeObjectRelease();
  int64_t v10 = *(void *)(*(void *)v7 + 16);
  if (v10 < v8)
  {
    __break(1u);
  }
  else
  {
    sub_B591C(v8, v10);
    v5(v11, 0);
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_B2FD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = sub_E4BA0();
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  uint64_t v4 = sub_6898(&qword_138E38);
  return sub_B3024(a1, a2 + *(int *)(v4 + 44));
}

uint64_t sub_B3024@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v70 = a2;
  uint64_t v3 = sub_6898(&qword_131828) - 8;
  __chkstk_darwin(v3);
  Swift::String v66 = (uint64_t *)((char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_E4F10();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_6898(&qword_1318F8) - 8;
  __chkstk_darwin(v65);
  int64_t v10 = (char *)&v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_6898(&qword_1318E8) - 8;
  uint64_t v11 = __chkstk_darwin(v68);
  uint64_t v64 = (char *)&v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v71 = (uint64_t)&v61 - v13;
  uint64_t v67 = a1;
  uint64_t v14 = *(void *)(a1 + 16);
  unint64_t v15 = *(void *)(a1 + 24);
  uint64_t v72 = v14;
  unint64_t v73 = v15;
  unint64_t v16 = sub_E3F8();
  swift_bridgeObjectRetain();
  unint64_t v69 = v16;
  uint64_t v17 = sub_E4F60();
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  LOBYTE(v15) = v22 & 1;
  uint64_t v62 = v8;
  uint64_t v63 = v6;
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for Text.TruncationMode.tail(_:), v5);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v24 = *(int *)(v3 + 36);
  uint64_t v25 = v66;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))((char *)v66 + v24, v8, v5);
  *uint64_t v25 = KeyPath;
  sub_105F0((uint64_t)v25, (uint64_t)&v10[*(int *)(v65 + 44)], &qword_131828);
  *(void *)int64_t v10 = v17;
  *((void *)v10 + 1) = v19;
  v10[16] = v15;
  *((void *)v10 + 3) = v21;
  swift_bridgeObjectRetain();
  sub_FA04(v17, v19, v15);
  uint64_t v26 = (uint64_t)v64;
  sub_102B4((uint64_t)v25, &qword_131828);
  (*(void (**)(char *, uint64_t))(v63 + 8))(v62, v5);
  sub_EF0C(v17, v19, v15);
  swift_bridgeObjectRelease();
  uint64_t v27 = swift_getKeyPath();
  sub_105F0((uint64_t)v10, v26, &qword_1318F8);
  uint64_t v28 = v26 + *(int *)(v68 + 44);
  *(void *)uint64_t v28 = v27;
  *(void *)(v28 + 8) = 1;
  *(unsigned char *)(v28 + 16) = 0;
  sub_102B4((uint64_t)v10, &qword_1318F8);
  sub_10250(v26, v71, &qword_1318E8);
  if (*(unsigned char *)(v67 + 32) == 1)
  {
    type metadata accessor for MAPreferencesViewProvider();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    uint64_t v30 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
    uint64_t v72 = 2777980912;
    unint64_t v73 = 0xA400000000000000;
    char v31 = "IMPORT_STATUS_COMPLETED";
  }
  else
  {
    if (*(unsigned char *)(v67 + 32))
    {
      type metadata accessor for MAPreferencesViewProvider();
      uint64_t v37 = swift_getObjCClassFromMetadata();
      uint64_t v30 = (objc_class *)[self bundleForClass:v37];
      uint64_t v72 = 2777980912;
      unint64_t v73 = 0xA400000000000000;
      v76._uint64_t countAndFlagsBits = 0xD000000000000014;
      v76._object = (void *)0x80000000000F3FD0;
      sub_E5690(v76);
      v77._uint64_t countAndFlagsBits = 2777980912;
      v77._object = (void *)0xA400000000000000;
      sub_E5690(v77);
      v34._uint64_t countAndFlagsBits = v72;
      uint64_t v35 = (void *)v73;
      v60._uint64_t countAndFlagsBits = 0xE000000000000000;
      v36._uint64_t countAndFlagsBits = 0xD000000000000014;
      v36._object = (void *)0x80000000000F3FD0;
      goto LABEL_7;
    }
    type metadata accessor for MAPreferencesViewProvider();
    uint64_t v29 = swift_getObjCClassFromMetadata();
    uint64_t v30 = (objc_class *)[self bundleForClass:v29];
    uint64_t v72 = 2777980912;
    unint64_t v73 = 0xA400000000000000;
    char v31 = "IMPORT_STATUS_IMPORTING";
  }
  char v33 = (void *)((unint64_t)(v31 - 32) | 0x8000000000000000);
  v74._uint64_t countAndFlagsBits = 0xD000000000000017;
  v74._object = v33;
  sub_E5690(v74);
  v75._uint64_t countAndFlagsBits = 2777980912;
  v75._object = (void *)0xA400000000000000;
  sub_E5690(v75);
  v34._uint64_t countAndFlagsBits = v72;
  uint64_t v35 = (void *)v73;
  v60._uint64_t countAndFlagsBits = 0xE000000000000000;
  v36._uint64_t countAndFlagsBits = 0xD000000000000017;
  v36._object = v33;
LABEL_7:
  v78.value._uint64_t countAndFlagsBits = 0;
  v78.value._object = 0;
  v38.super.isa = v30;
  v34._object = v35;
  uint64_t v39 = sub_E3FE0(v36, v78, v38, v34, v60);
  unint64_t v41 = v40;

  swift_bridgeObjectRelease();
  uint64_t v72 = v39;
  unint64_t v73 = v41;
  uint64_t v42 = sub_E4F60();
  uint64_t v44 = v43;
  char v46 = v45 & 1;
  sub_E51B0();
  uint64_t v47 = sub_E4F20();
  uint64_t v49 = v48;
  char v51 = v50;
  uint64_t v53 = v52;
  swift_release();
  sub_EF0C(v42, v44, v46);
  swift_bridgeObjectRelease();
  uint64_t v54 = v71;
  sub_105F0(v71, v26, &qword_1318E8);
  uint64_t v55 = v70;
  sub_105F0(v26, v70, &qword_1318E8);
  uint64_t v56 = sub_6898(&qword_138E40);
  uint64_t v57 = v55 + *(int *)(v56 + 48);
  *(void *)uint64_t v57 = 0;
  *(unsigned char *)(v57 + 8) = 1;
  uint64_t v58 = v55 + *(int *)(v56 + 64);
  *(void *)uint64_t v58 = v47;
  *(void *)(v58 + 8) = v49;
  *(unsigned char *)(v58 + 16) = v51 & 1;
  *(void *)(v58 + 24) = v53;
  sub_FA04(v47, v49, v51 & 1);
  swift_bridgeObjectRetain();
  sub_102B4(v54, &qword_1318E8);
  sub_EF0C(v47, v49, v51 & 1);
  swift_bridgeObjectRelease();
  return sub_102B4(v26, &qword_1318E8);
}

uint64_t sub_B366C()
{
  return sub_E4850();
}

uint64_t sub_B373C@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for MAPreferencesViewProvider();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v3 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v10._uint64_t countAndFlagsBits = 0x485F54524F504D49;
  v10._object = (void *)0xEE0059524F545349;
  sub_E5690(v10);
  v11._uint64_t countAndFlagsBits = 2777980912;
  v11._object = (void *)0xA400000000000000;
  sub_E5690(v11);
  v14._uint64_t countAndFlagsBits = 2777980912;
  v9._uint64_t countAndFlagsBits = 0xE000000000000000;
  v12._uint64_t countAndFlagsBits = 0x485F54524F504D49;
  v12._object = (void *)0xEE0059524F545349;
  v13.value._uint64_t countAndFlagsBits = 0;
  v13.value._object = 0;
  v4.super.isa = v3;
  v14._object = (void *)0xA400000000000000;
  sub_E3FE0(v12, v13, v4, v14, v9);

  swift_bridgeObjectRelease();
  sub_E3F8();
  uint64_t result = sub_E4F60();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = v7 & 1;
  *(void *)(a1 + 24) = v8;
  return result;
}

uint64_t sub_B387C(uint64_t a1, uint64_t a2)
{
  type metadata accessor for MAPreferencesViewProvider();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v5 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v10._uint64_t countAndFlagsBits = 0xD000000000000017;
  v10._object = (void *)0x80000000000F6CE0;
  sub_E5690(v10);
  v11._uint64_t countAndFlagsBits = 2777980912;
  v11._object = (void *)0xA400000000000000;
  sub_E5690(v11);
  v14._uint64_t countAndFlagsBits = 2777980912;
  v9._uint64_t countAndFlagsBits = 0xE000000000000000;
  v12._uint64_t countAndFlagsBits = 0xD000000000000017;
  v12._object = (void *)0x80000000000F6CE0;
  v13.value._uint64_t countAndFlagsBits = 0;
  v13.value._object = 0;
  v6.super.isa = v5;
  v14._object = (void *)0xA400000000000000;
  sub_E3FE0(v12, v13, v6, v14, v9);

  swift_bridgeObjectRelease();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  sub_E3F8();
  swift_retain();
  return sub_E5290();
}

uint64_t sub_B39E8()
{
  return sub_E45C0();
}

uint64_t sub_B3A5C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a2;
  sub_E57E0();
  *(void *)(v2 + 24) = sub_E57D0();
  uint64_t v4 = sub_E57C0();
  return _swift_task_switch(sub_B3AF4, v4, v3);
}

uint64_t sub_B3AF4()
{
  swift_release();
  swift_retain();
  sub_1A524(1);
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_B3B6C@<X0>(unsigned char *a1@<X8>)
{
  return sub_EB4C(a1);
}

uint64_t sub_B3B80()
{
  return sub_EBDC();
}

uint64_t sub_B3B94@<X0>(uint64_t a1@<X1>, uint64_t a2@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v6 = sub_6898(&qword_133550);
  uint64_t v7 = __chkstk_darwin(v6);
  Swift::String v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  Swift::String v11 = (char *)v17 - v10;
  sub_338A0(a1 + 16, (uint64_t)v18);
  *a3 = swift_getKeyPath();
  sub_6898(&qword_1314A8);
  swift_storeEnumTagMultiPayload();
  uint64_t v12 = type metadata accessor for MSStartMailImportView(0);
  uint64_t v13 = sub_E4090();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  sub_105F0((uint64_t)v11, (uint64_t)v9, &qword_133550);
  sub_E5210();
  sub_102B4((uint64_t)v11, &qword_133550);
  sub_338A0((uint64_t)v18, (uint64_t)v17);
  uint64_t v14 = swift_allocObject();
  sub_47280(v17, v14 + 16);
  uint64_t result = sub_6A34((uint64_t)v18);
  unint64_t v16 = (char *)a3 + *(int *)(v12 + 24);
  *(void *)unint64_t v16 = a2;
  *((void *)v16 + 1) = v14;
  v16[16] = 0;
  return result;
}

uint64_t sub_B3D58()
{
  uint64_t v0 = sub_E4320();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_131238 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_67B4(v0, (uint64_t)qword_148D58);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  uint64_t v5 = sub_E4300();
  os_log_type_t v6 = sub_E5870();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&def_66DD4, v5, v6, "[Mail Import List] page viewed", v7, 2u);
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_B3EE4@<X0>(uint64_t a1@<X8>)
{
  return sub_B0280(*v1, v1[1], a1);
}

uint64_t sub_B3EEC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_B3F24()
{
  return sub_B0804();
}

uint64_t sub_B3F2C@<X0>(uint64_t a1@<X8>)
{
  return sub_B09AC(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_B3F34@<X0>(unsigned char *a1@<X8>)
{
  return sub_EB4C(a1);
}

uint64_t sub_B3F5C()
{
  return sub_EBDC();
}

uint64_t sub_B3F88@<X0>(uint64_t *a1@<X8>)
{
  return sub_B3B94(*(void *)(v1 + 24), (uint64_t)sub_B426C, a1);
}

unint64_t sub_B3FC0()
{
  unint64_t result = qword_138CE8;
  if (!qword_138CE8)
  {
    sub_62A4(&qword_138CC8);
    sub_105AC(&qword_138CF0, &qword_138CC0);
    sub_105AC(&qword_136508, &qword_136510);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_138CE8);
  }
  return result;
}

uint64_t sub_B4084@<X0>(unsigned char *a1@<X8>)
{
  return sub_EB4C(a1);
}

uint64_t sub_B40AC()
{
  return sub_EBDC();
}

uint64_t sub_B40D4@<X0>(uint64_t (**a1)()@<X8>)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  *a1 = sub_B4194;
  a1[1] = (uint64_t (*)())v5;

  return swift_retain();
}

unint64_t sub_B4140()
{
  unint64_t result = qword_138D00;
  if (!qword_138D00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_138D00);
  }
  return result;
}

uint64_t sub_B4194()
{
  return sub_B1E94();
}

uint64_t sub_B419C@<X0>(unsigned char *a1@<X8>)
{
  return sub_EB4C(a1);
}

uint64_t sub_B41C4()
{
  return sub_EBDC();
}

uint64_t sub_B41EC()
{
  return sub_E4AF0();
}

uint64_t sub_B4210()
{
  return sub_E4AF0();
}

uint64_t sub_B4234()
{
  sub_6A34(v0 + 16);

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_B426C()
{
  return sub_2F114(v0 + 16);
}

uint64_t sub_B4274@<X0>(uint64_t a1@<X8>)
{
  return sub_B0B20(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_B427C@<X0>(uint64_t a1@<X8>)
{
  return sub_B15D4(a1);
}

unint64_t sub_B4294()
{
  unint64_t result = qword_138D28;
  if (!qword_138D28)
  {
    sub_62A4(&qword_138D20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_138D28);
  }
  return result;
}

uint64_t sub_B4300@<X0>(uint64_t a1@<X8>)
{
  return sub_B1F40(*(void *)(v1 + 16), *(void **)(v1 + 24), a1);
}

uint64_t sub_B4308()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_84CC8;
  return sub_B3A5C(v2, v3);
}

uint64_t sub_B43A0@<X0>(unsigned char *a1@<X8>)
{
  return sub_EB4C(a1);
}

uint64_t sub_B43C8()
{
  return sub_EBDC();
}

uint64_t sub_B43F0()
{
  swift_retain();
  sub_1A524(0);

  return swift_release();
}

uint64_t sub_B4434@<X0>(uint64_t *a1@<X8>)
{
  return sub_B3B94(*(void *)(v1 + 24), (uint64_t)sub_B5ED4, a1);
}

uint64_t sub_B4474@<X0>(uint64_t a1@<X8>)
{
  return sub_B2718(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

void *sub_B447C(void *result, int64_t a2, char a3, void *a4)
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
      sub_6898(&qword_132510);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
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
    sub_B4DCC(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_B458C(void *result, int64_t a2, char a3, void *a4)
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
      sub_6898(&qword_138E30);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 + 31;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 6);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[8 * v8 + 4]) {
          memmove(v13, a4 + 4, v8 << 6);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_B5594(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_B469C(char a1, int64_t a2, char a3, unint64_t a4)
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
    uint64_t v13 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_6898(&qword_138E70);
  uint64_t v10 = *(void *)(sub_E3F30() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_E5A80();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_E3F30() - 8);
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
    sub_B4EB8(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

void *sub_B4904(void *result, int64_t a2, char a3, void *a4)
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
      sub_6898(&qword_131CB0);
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
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
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
    sub_B5010(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_B4A14(void *result, int64_t a2, char a3, void *a4)
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
      sub_6898(&qword_132758);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[6 * v8 + 4]) {
          memmove(v12, a4 + 4, 48 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_B5104(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_B4B3C(void *result, int64_t a2, char a3, void *a4)
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
      sub_6898(&qword_138E68);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 56);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[7 * v8 + 4]) {
          memmove(v12, a4 + 4, 56 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_B5214(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_B4C68@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_E4B40();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_B4C9C()
{
  return sub_E4B50();
}

uint64_t sub_B4CCC()
{
  return sub_E4A10();
}

uint64_t sub_B4CF0(uint64_t a1)
{
  uint64_t v2 = sub_E4F10();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_E4A20();
}

void *sub_B4DB8(void *a1)
{
  return sub_B458C(0, a1[2], 0, a1);
}

char *sub_B4DCC(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_E5AE0();
  __break(1u);
  return result;
}

uint64_t sub_B4EB8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_E3F30() - 8);
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
  uint64_t result = sub_E5AE0();
  __break(1u);
  return result;
}

uint64_t sub_B5010(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_E5AE0();
  __break(1u);
  return result;
}

uint64_t sub_B5104(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 48 * a1 + 32;
    unint64_t v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      sub_6898(&qword_134D38);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_E5AE0();
  __break(1u);
  return result;
}

uint64_t sub_B5214(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 56 * a1 + 32;
    unint64_t v6 = a3 + 56 * v4;
    if (v5 >= v6 || v5 + 56 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_E5AE0();
  __break(1u);
  return result;
}

unint64_t sub_B530C()
{
  unint64_t result = qword_138DB8;
  if (!qword_138DB8)
  {
    sub_62A4(&qword_138DB0);
    sub_F358();
    sub_B5388();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_138DB8);
  }
  return result;
}

unint64_t sub_B5388()
{
  unint64_t result = qword_138DC0;
  if (!qword_138DC0)
  {
    sub_62A4(&qword_138DC8);
    sub_105AC(&qword_138DD0, &qword_138DD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_138DC0);
  }
  return result;
}

uint64_t sub_B5428()
{
  return sub_B366C();
}

uint64_t sub_B5430()
{
  return sub_B387C(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_B5438()
{
  return sub_B39E8();
}

unint64_t sub_B5440()
{
  unint64_t result = qword_138E08;
  if (!qword_138E08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_138E08);
  }
  return result;
}

uint64_t sub_B5494(long long *a1)
{
  return sub_B2C0C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_B549C@<X0>(uint64_t a1@<X8>)
{
  return sub_B2FD4(*(void *)(v1 + 16), a1);
}

uint64_t sub_B54A4()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 89, 7);
}

uint64_t sub_B54EC()
{
  return sub_B2ED8(v0[2], v0[3], v0 + 4);
}

uint64_t sub_B54F8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_6A34(v0 + 80);

  return _swift_deallocObject(v0, 120, 7);
}

uint64_t sub_B5540()
{
  return sub_43490((_OWORD *)(v0 + 16), v0 + 80);
}

uint64_t sub_B554C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_B5594(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + (a1 << 6) + 32;
    unint64_t v6 = a3 + (v4 << 6);
    if (v5 >= v6 || v5 + (v4 << 6) <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_E5AE0();
  __break(1u);
  return result;
}

uint64_t sub_B5688(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void *)(*(void *)a1 + 16);
  if (!v4) {
    return 0;
  }
  uint64_t v7 = 0;
  unint64_t v8 = 0;
  while (1)
  {
    uint64_t result = v3[v7 + 4];
    if (result == a2 && v3[v7 + 5] == a3) {
      break;
    }
    uint64_t result = sub_E5C20();
    if (result) {
      break;
    }
    ++v8;
    v7 += 8;
    if (v4 == v8) {
      return v4;
    }
  }
  unint64_t v11 = v8 + 1;
  if (__OFADD__(v8, 1)) {
    goto LABEL_33;
  }
  if (v11 == v4) {
    return v8;
  }
  for (uint64_t i = v7 * 8 + 152; ; i += 64)
  {
    unint64_t v14 = v3[2];
    if (v11 >= v14) {
      break;
    }
    BOOL v15 = (char *)v3 + i;
    uint64_t result = *(void *)((char *)v3 + i - 56);
    if (result != a2 || *(void *)((char *)v3 + i - 48) != a3)
    {
      uint64_t result = sub_E5C20();
      if ((result & 1) == 0)
      {
        if (v11 != v8)
        {
          if (v8 >= v14) {
            goto LABEL_31;
          }
          uint64_t v17 = (uint64_t)&v3[8 * v8 + 4];
          uint64_t v30 = *(void *)v17;
          uint64_t v18 = *(void *)(v17 + 24);
          uint64_t v28 = *(void *)(v17 + 16);
          char v27 = *(unsigned char *)(v17 + 32);
          uint64_t v25 = *(void *)(v17 + 48);
          uint64_t v26 = *(void *)(v17 + 40);
          char v24 = *(unsigned char *)(v17 + 56);
          uint64_t v19 = *((void *)v15 - 7);
          uint64_t v20 = *((void *)v15 - 6);
          uint64_t v21 = *(void *)((char *)v3 + i - 32);
          uint64_t v35 = *(void *)((char *)v3 + i - 40);
          uint64_t v36 = v19;
          char v34 = *((unsigned char *)v3 + i - 24);
          uint64_t v32 = *(void *)((char *)v3 + i - 8);
          uint64_t v33 = *(void *)((char *)v3 + i - 16);
          char v31 = *((unsigned char *)v3 + i);
          uint64_t v29 = *(void *)(v17 + 8);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v3 = sub_B4DB8(v3);
          }
          char v22 = &v3[8 * v8];
          v22[4] = v36;
          v22[5] = v20;
          _OWORD v22[6] = v35;
          v22[7] = v21;
          *((unsigned char *)v22 + 64) = v34;
          v22[9] = v33;
          v22[10] = v32;
          *((unsigned char *)v22 + 88) = v31;
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
          if (v11 >= v3[2]) {
            goto LABEL_32;
          }
          uint64_t v23 = (char *)v3 + i;
          *((void *)v23 - 7) = v30;
          *((void *)v23 - 6) = v29;
          *((void *)v23 - 5) = v28;
          *((void *)v23 - 4) = v18;
          *(v23 - 24) = v27;
          *((void *)v23 - 2) = v26;
          *((void *)v23 - 1) = v25;
          *uint64_t v23 = v24;
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
          *(void *)a1 = v3;
        }
        if (__OFADD__(v8++, 1)) {
          goto LABEL_30;
        }
      }
    }
    if (++v11 == v3[2]) {
      return v8;
    }
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_B591C(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v4 = *(void **)v2;
  int64_t v5 = *(void *)(*(void *)v2 + 16);
  if (v5 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t v4 = sub_B458C(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  uint64_t v12 = a1 << 6;
  uint64_t v13 = (char *)&v4[8 * a1 + 4];
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_20;
  }
  uint64_t v15 = v4[2];
  BOOL v16 = __OFSUB__(v15, a2);
  uint64_t v17 = v15 - a2;
  if (v16) {
    goto LABEL_26;
  }
  if ((v17 & 0x8000000000000000) == 0)
  {
    uint64_t v18 = (char *)&v4[8 * a2 + 4];
    size_t v19 = v17 << 6;
    if (v12 != a2 << 6 || v13 >= &v18[v19]) {
      uint64_t result = (uint64_t)memmove(v13, v18, v19);
    }
    uint64_t v20 = v4[2];
    BOOL v16 = __OFADD__(v20, v8);
    uint64_t v21 = v20 - v7;
    if (!v16)
    {
      v4[2] = v21;
LABEL_20:
      *(void *)uint64_t v2 = v4;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  uint64_t result = sub_E5AE0();
  __break(1u);
  return result;
}

uint64_t sub_B5A90()
{
  return sub_E4A10();
}

uint64_t sub_B5AB8@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_E4B40();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_B5AEC()
{
  return sub_E4B50();
}

unint64_t sub_B5B1C()
{
  unint64_t result = qword_138E50;
  if (!qword_138E50)
  {
    sub_62A4(&qword_138E48);
    sub_62A4(&qword_138E58);
    sub_105AC(&qword_138E60, &qword_138E58);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_138E50);
  }
  return result;
}

uint64_t sub_B5BF8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_B5CE0()
{
  unint64_t result = qword_138E80;
  if (!qword_138E80)
  {
    sub_62A4(&qword_138E78);
    sub_B5D68();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_138E80);
  }
  return result;
}

unint64_t sub_B5D68()
{
  unint64_t result = qword_138E88;
  if (!qword_138E88)
  {
    sub_62A4(&qword_138E90);
    sub_B5DDC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_138E88);
  }
  return result;
}

unint64_t sub_B5DDC()
{
  unint64_t result = qword_138E98;
  if (!qword_138E98)
  {
    sub_62A4(&qword_138EA0);
    sub_105AC(&qword_138EA8, &qword_138EB0);
    sub_105AC(&qword_137D28, &qword_137D30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_138E98);
  }
  return result;
}

uint64_t sub_B5ED8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_B5F20(uint64_t a1, uint64_t a2)
{
  char v3 = v2;
  uint64_t v6 = *v2;
  uint64_t v34 = sub_E4320();
  uint64_t v7 = *(void *)(v34 - 8);
  __chkstk_darwin(v34);
  int64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_E45B0();
  swift_release();
  swift_release();
  uint64_t v36 = a1;
  uint64_t v37 = a2;
  uint64_t v35 = v6;
  if ((v39 & 0xF9) != 0)
  {
    uint64_t v33 = 0;
    unint64_t v10 = 0xE000000000000000;
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_E45B0();
    swift_release();
    swift_release();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_E45B0();
    swift_release();
    swift_release();
    unint64_t v10 = *((void *)&v39 + 1);
    uint64_t v33 = v39;
  }
  unint64_t v32 = v10;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_E45B0();
  swift_release();
  swift_release();
  unint64_t v11 = 0xE400000000000000;
  uint64_t v12 = 1297044038;
  switch((char)v39)
  {
    case 1:
      unint64_t v11 = 0xE200000000000000;
      uint64_t v12 = 20308;
      break;
    case 2:
      unint64_t v11 = 0xE200000000000000;
      uint64_t v12 = 17219;
      break;
    case 3:
      uint64_t v12 = 1346585938;
      break;
    case 4:
      uint64_t v12 = 1245861203;
      break;
    case 5:
      uint64_t v12 = 1414744396;
      break;
    default:
      break;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_E45B0();
  swift_release();
  swift_release();
  long long v13 = v39;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_E45B0();
  swift_release();
  swift_release();
  uint64_t v14 = *(void *)&aMove_3[8 * (char)v39];
  swift_getKeyPath();
  swift_getKeyPath();
  sub_E45B0();
  swift_release();
  swift_release();
  long long v15 = v39;
  uint64_t v16 = *(void *)((char *)v3 + qword_138EB8);
  *(void *)&long long v39 = v12;
  *((void *)&v39 + 1) = v11;
  long long v40 = v13;
  *(void *)&long long v41 = v14;
  *((void *)&v41 + 1) = 0xE400000000000000;
  *(void *)&long long v42 = v33;
  *((void *)&v42 + 1) = v32;
  *(_OWORD *)uint64_t v43 = v15;
  *(void *)&v43[16] = v16;
  v43[24] = 0;
  if (qword_131238 != -1) {
    swift_once();
  }
  uint64_t v17 = v34;
  uint64_t v18 = sub_67B4(v34, (uint64_t)qword_148D58);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v18, v17);
  size_t v19 = sub_E4300();
  os_log_type_t v20 = sub_E5870();
  BOOL v21 = os_log_type_enabled(v19, v20);
  uint64_t v22 = v37;
  uint64_t v23 = v35;
  if (v21)
  {
    char v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v24 = 0;
    _os_log_impl(&def_66DD4, v19, v20, "[Add Rule] create rule started", v24, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v17);
  sub_67EC((void *)((char *)v3 + OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel_repository), *(void *)((char *)v3 + OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel_repository + 24));
  uint64_t v38 = sub_8D38C(&v39);
  uint64_t v25 = swift_allocObject();
  swift_weakInit();
  uint64_t v26 = swift_allocObject();
  uint64_t v27 = *(void *)(v23 + 1240);
  long long v28 = v42;
  *(_OWORD *)(v26 + 56) = v41;
  *(_OWORD *)(v26 + 72) = v28;
  *(_OWORD *)(v26 + 88) = *(_OWORD *)v43;
  *(_OWORD *)(v26 + 97) = *(_OWORD *)&v43[9];
  long long v29 = v40;
  *(_OWORD *)(v26 + 24) = v39;
  *(void *)(v26 + 16) = v27;
  *(_OWORD *)(v26 + 40) = v29;
  *(void *)(v26 + 120) = v25;
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = v36;
  *(void *)(v30 + 24) = v22;
  swift_retain();
  sub_6898(&qword_1387B8);
  sub_A5830();
  sub_E4610();
  swift_release();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_E44F0();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_B6574(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_E4320();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  unint64_t v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = __chkstk_darwin(v8);
  long long v13 = (char *)&v36 - v12;
  uint64_t v14 = *(uint8_t **)(a1 + 8);
  if (v14)
  {
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v43 = *(void *)a1;
    uint64_t v44 = v15;
    int v16 = *(unsigned __int8 *)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 16);
    uint64_t v41 = *(void *)(a1 + 24);
    uint64_t v42 = v17;
    swift_bridgeObjectRetain();
    sub_8DBBC(a2);
    uint64_t v18 = sub_3ACB4();
    sub_B6FB4(a2);
    if (v18)
    {
      LODWORD(v40) = v16;
      uint64_t v38 = sub_E5530();
      unint64_t v20 = v19;
      swift_bridgeObjectRelease();
      if (qword_131238 != -1) {
        swift_once();
      }
      uint64_t v21 = sub_67B4(v6, (uint64_t)qword_148D58);
      (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v13, v21, v6);
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_E4300();
      os_log_type_t v23 = sub_E5880();
      if (os_log_type_enabled(v22, v23))
      {
        long long v39 = v10;
        uint64_t v24 = swift_slowAlloc();
        uint64_t v37 = v14;
        uint64_t v25 = (uint8_t *)v24;
        uint64_t v26 = swift_slowAlloc();
        uint64_t v36 = a3;
        uint64_t v45 = v26;
        *(_DWORD *)uint64_t v25 = 136642819;
        swift_bridgeObjectRetain();
        v51[0] = sub_57A98(v38, v20, &v45);
        unint64_t v10 = v39;
        sub_E5900();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&def_66DD4, v22, v23, "[Add Rule] params: %{sensitive}s", v25, 0xCu);
        swift_arrayDestroy();
        a3 = v36;
        swift_slowDealloc();
        uint64_t v14 = v37;
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
      LOBYTE(v16) = v40;
    }
    uint64_t v27 = v6;
    uint64_t v40 = a3 + 16;
    if (qword_131238 != -1) {
      swift_once();
    }
    uint64_t v28 = v41 & 1;
    uint64_t v29 = sub_67B4(v27, (uint64_t)qword_148D58);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v29, v27);
    swift_bridgeObjectRetain_n();
    uint64_t v30 = sub_E4300();
    os_log_type_t v31 = sub_E5880();
    BOOL v32 = os_log_type_enabled(v30, v31);
    LODWORD(v41) = v16 & 1;
    uint64_t v38 = v28;
    if (v32)
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      v51[0] = swift_slowAlloc();
      long long v39 = v10;
      *(_DWORD *)uint64_t v33 = 136315138;
      uint64_t v37 = v33 + 4;
      uint64_t v45 = v43;
      char v46 = v14;
      uint64_t v47 = v42;
      LOBYTE(v48) = v28 != 0;
      uint64_t v49 = v44;
      BOOL v50 = (v16 & 1) != 0;
      sub_69E0();
      uint64_t v34 = sub_E5C60();
      uint64_t v45 = sub_57A98(v34, v35, v51);
      sub_E5900();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&def_66DD4, v30, v31, "[Add Rule] create rule failed: %s", v33, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v7 + 8))(v39, v27);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v27);
    }
    swift_beginAccess();
    if (swift_weakLoadStrong())
    {
      swift_getKeyPath();
      swift_getKeyPath();
      uint64_t v45 = v43;
      char v46 = v14;
      uint64_t v47 = v42;
      uint64_t v48 = v38;
      uint64_t v49 = v44;
      BOOL v50 = v41;
      return sub_E45C0();
    }
    else
    {
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_B6B48(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = sub_E4320();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_131238 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_67B4(v3, (uint64_t)qword_148D58);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  uint64_t v8 = sub_E4300();
  os_log_type_t v9 = sub_E5870();
  if (os_log_type_enabled(v8, v9))
  {
    unint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v10 = 0;
    _os_log_impl(&def_66DD4, v8, v9, "[Add Rule] create rule successful", v10, 2u);
    swift_slowDealloc();
  }

  uint64_t v11 = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return a2(v11);
}

uint64_t sub_B6CF4()
{
  uint64_t v0 = sub_9CDB0();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t _s12AddViewModelCMa()
{
  return sub_7D6B8();
}

uint64_t sub_B6D80()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_B6DB8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 128, 7);
}

uint64_t sub_B6E18(uint64_t a1)
{
  return sub_B6574(a1, v1 + 24, *(void *)(v1 + 120));
}

uint64_t sub_B6E28()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_B6E60(uint64_t a1)
{
  return sub_B6B48(a1, *(uint64_t (**)(uint64_t))(v1 + 16));
}

double sub_B6E68@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_E45B0();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = v6;
  return result;
}

uint64_t sub_B6EF8()
{
  return sub_E45C0();
}

uint64_t sub_B6FB4(uint64_t a1)
{
  return a1;
}

uint64_t destroy for TextFieldLimitModifier()
{
  swift_release();
  swift_release();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for TextFieldLimitModifier(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for TextFieldLimitModifier(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  return a1;
}

__n128 initializeWithTake for TextFieldLimitModifier(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for TextFieldLimitModifier(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for TextFieldLimitModifier(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for TextFieldLimitModifier(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for TextFieldLimitModifier()
{
  return &type metadata for TextFieldLimitModifier;
}

uint64_t sub_B7258()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_B7274()
{
  uint64_t v1 = *v0;
  long long v6 = *((_OWORD *)v0 + 1);
  uint64_t v5 = v1;
  sub_6898(&qword_1329F8);
  sub_E5320();
  sub_E52F0();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v2 = swift_allocObject();
  long long v3 = *((_OWORD *)v0 + 1);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)v0;
  *(_OWORD *)(v2 + 32) = v3;
  *(void *)(v2 + 48) = v0[4];
  sub_5F450((uint64_t)&v5);
  swift_retain();
  sub_5F47C((uint64_t)&v6);
  sub_6898(&qword_138F40);
  sub_B74D4();
  sub_E5150();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_B73E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_E5650();
  if (*(void *)(a3 + 32) < result)
  {
    swift_bridgeObjectRetain();
    sub_6898(&qword_1329F8);
    return sub_E5300();
  }
  return result;
}

uint64_t sub_B7464()
{
  return sub_E47C0();
}

uint64_t sub_B7484()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_B74CC(uint64_t a1, uint64_t a2)
{
  return sub_B73E4(a1, a2, v2 + 16);
}

unint64_t sub_B74D4()
{
  unint64_t result = qword_138F48;
  if (!qword_138F48)
  {
    sub_62A4(&qword_138F40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_138F48);
  }
  return result;
}

uint64_t sub_B7530()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *sub_B75A0(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_6898(&qword_1314A8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_E47F0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    unint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = *(void *)v11;
    uint64_t v13 = *((void *)v11 + 1);
    char v14 = v11[16];
    sub_6D60();
    *(void *)unint64_t v10 = v12;
    *((void *)v10 + 1) = v13;
    v10[16] = v14;
    uint64_t v15 = a3[6];
    uint64_t v16 = a3[7];
    uint64_t v17 = (char *)a1 + v15;
    uint64_t v18 = (char *)a2 + v15;
    *uint64_t v17 = *v18;
    *((void *)v17 + 1) = *((void *)v18 + 1);
    unint64_t v19 = (char *)a1 + v16;
    unint64_t v20 = (char *)a2 + v16;
    uint64_t v21 = sub_E53E0();
    uint64_t v22 = *(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16);
    swift_retain();
    v22(v19, v20, v21);
    uint64_t v23 = sub_6898(&qword_138F50);
    *(void *)&v19[*(int *)(v23 + 28)] = *(void *)&v20[*(int *)(v23 + 28)];
    uint64_t v24 = a3[8];
    uint64_t v25 = (uint64_t *)((char *)a1 + v24);
    uint64_t v26 = (uint64_t *)((char *)a2 + v24);
    uint64_t v27 = v26[1];
    *uint64_t v25 = *v26;
    v25[1] = v27;
    swift_retain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_B7798(uint64_t a1, uint64_t a2)
{
  sub_6898(&qword_1314A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_E47F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  sub_6E40();
  swift_release();
  uint64_t v5 = a1 + *(int *)(a2 + 28);
  uint64_t v6 = sub_E53E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  sub_6898(&qword_138F50);
  swift_release();

  return swift_bridgeObjectRelease();
}

void *sub_B78C0(void *a1, void *a2, int *a3)
{
  sub_6898(&qword_1314A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_E47F0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(void *)v9;
  uint64_t v11 = *((void *)v9 + 1);
  char v12 = v9[16];
  sub_6D60();
  *(void *)uint64_t v8 = v10;
  *((void *)v8 + 1) = v11;
  v8[16] = v12;
  uint64_t v13 = a3[6];
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)a1 + v13;
  uint64_t v16 = (char *)a2 + v13;
  *uint64_t v15 = *v16;
  *((void *)v15 + 1) = *((void *)v16 + 1);
  uint64_t v17 = (char *)a1 + v14;
  uint64_t v18 = (char *)a2 + v14;
  uint64_t v19 = sub_E53E0();
  unint64_t v20 = *(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16);
  swift_retain();
  v20(v17, v18, v19);
  uint64_t v21 = sub_6898(&qword_138F50);
  *(void *)&v17[*(int *)(v21 + 28)] = *(void *)&v18[*(int *)(v21 + 28)];
  uint64_t v22 = a3[8];
  uint64_t v23 = (void *)((char *)a1 + v22);
  uint64_t v24 = (void *)((char *)a2 + v22);
  uint64_t v25 = v24[1];
  *uint64_t v23 = *v24;
  v23[1] = v25;
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_B7A68(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_102B4((uint64_t)a1, &qword_1314A8);
    sub_6898(&qword_1314A8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_E47F0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(void *)v9;
  uint64_t v11 = *((void *)v9 + 1);
  char v12 = v9[16];
  sub_6D60();
  *(void *)uint64_t v8 = v10;
  *((void *)v8 + 1) = v11;
  v8[16] = v12;
  sub_6E40();
  uint64_t v13 = a3[6];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  *uint64_t v14 = *v15;
  *((void *)v14 + 1) = *((void *)v15 + 1);
  swift_retain();
  swift_release();
  uint64_t v16 = a3[7];
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  uint64_t v19 = sub_E53E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 24))(v17, v18, v19);
  uint64_t v20 = sub_6898(&qword_138F50);
  *(void *)&v17[*(int *)(v20 + 28)] = *(void *)&v18[*(int *)(v20 + 28)];
  swift_retain();
  swift_release();
  uint64_t v21 = a3[8];
  uint64_t v22 = (void *)((char *)a1 + v21);
  uint64_t v23 = (void *)((char *)a2 + v21);
  void *v22 = *v23;
  v22[1] = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_B7C50(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_6898(&qword_1314A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_E47F0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = a3[6];
  uint64_t v10 = &a1[v8];
  uint64_t v11 = &a2[v8];
  *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
  long long v12 = *(_OWORD *)&a2[v9];
  v10[16] = v11[16];
  *(_OWORD *)&a1[v9] = v12;
  uint64_t v13 = a3[7];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = sub_E53E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
  uint64_t v17 = sub_6898(&qword_138F50);
  *(void *)&v14[*(int *)(v17 + 28)] = *(void *)&v15[*(int *)(v17 + 28)];
  *(_OWORD *)&a1[a3[8]] = *(_OWORD *)&a2[a3[8]];
  return a1;
}

char *sub_B7DB0(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_102B4((uint64_t)a1, &qword_1314A8);
    uint64_t v6 = sub_6898(&qword_1314A8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_E47F0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  char v11 = v10[16];
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  v9[16] = v11;
  sub_6E40();
  uint64_t v12 = a3[6];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  *uint64_t v13 = *v14;
  *((void *)v13 + 1) = *((void *)v14 + 1);
  swift_release();
  uint64_t v15 = a3[7];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  uint64_t v18 = sub_E53E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 40))(v16, v17, v18);
  uint64_t v19 = sub_6898(&qword_138F50);
  *(void *)&v16[*(int *)(v19 + 28)] = *(void *)&v17[*(int *)(v19 + 28)];
  swift_release();
  uint64_t v20 = a3[8];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  uint64_t v24 = *(void *)v22;
  uint64_t v23 = *((void *)v22 + 1);
  *(void *)uint64_t v21 = v24;
  *((void *)v21 + 1) = v23;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_B7F68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_B7F7C);
}

uint64_t sub_B7F7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_6898(&qword_1314B0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_6898(&qword_138F50);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 28);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 32) + 8);
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t sub_B809C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_B80B0);
}

uint64_t sub_B80B0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_6898(&qword_1314B0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_6898(&qword_138F50);
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 32) + 8) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 28);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for MSRulesView()
{
  uint64_t result = qword_138FB0;
  if (!qword_138FB0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_B8218()
{
  sub_B835C(319, (unint64_t *)&qword_131520, (uint64_t (*)(uint64_t))&type metadata accessor for DismissAction, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
  if (v0 <= 0x3F)
  {
    sub_B835C(319, (unint64_t *)&unk_138FC0, (uint64_t (*)(uint64_t))&type metadata accessor for EditMode, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_B835C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_B83C0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_B83DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v35 = a5;
  uint64_t v36 = a6;
  uint64_t v34 = a4;
  uint64_t v11 = sub_E53E0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v33 - v16;
  *a7 = swift_getKeyPath();
  sub_6898(&qword_1314A8);
  swift_storeEnumTagMultiPayload();
  uint64_t v18 = (int *)type metadata accessor for MSRulesView();
  uint64_t v19 = (char *)a7 + v18[6];
  char v38 = 0;
  sub_E5210();
  object = v37[0]._object;
  *uint64_t v19 = v37[0]._countAndFlagsBits;
  *((void *)v19 + 1) = object;
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v17, enum case for EditMode.inactive(_:), v11);
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
  sub_E5210();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
  uint64_t v21 = (uint64_t *)((char *)a7 + v18[8]);
  type metadata accessor for MAPreferencesViewProvider();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v23 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v37[0]._uint64_t countAndFlagsBits = 2777980912;
  v37[0]._object = (void *)0xA400000000000000;
  v39._uint64_t countAndFlagsBits = 0x49542E53454C5552;
  v39._object = (void *)0xEB00000000454C54;
  sub_E5690(v39);
  v40._uint64_t countAndFlagsBits = 2777980912;
  v40._object = (void *)0xA400000000000000;
  sub_E5690(v40);
  v32._uint64_t countAndFlagsBits = 0xE000000000000000;
  v41._uint64_t countAndFlagsBits = 0x49542E53454C5552;
  v41._object = (void *)0xEB00000000454C54;
  v42.value._uint64_t countAndFlagsBits = 0;
  v42.value._object = 0;
  v24.super.isa = v23;
  uint64_t v25 = sub_E3FE0(v41, v42, v24, v37[0], v32);
  uint64_t v27 = v26;

  swift_bridgeObjectRelease();
  *uint64_t v21 = v25;
  v21[1] = v27;
  sub_338A0(a1, (uint64_t)v37);
  uint64_t v28 = (void *)swift_allocObject();
  sub_47280((long long *)&v37[0]._countAndFlagsBits, (uint64_t)(v28 + 2));
  v28[7] = a2;
  v28[8] = a3;
  uint64_t v29 = v35;
  v28[9] = v34;
  v28[10] = v29;
  v28[11] = v36;
  uint64_t result = sub_6A34(a1);
  os_log_type_t v31 = (char *)a7 + v18[5];
  *(void *)os_log_type_t v31 = sub_BEC54;
  *((void *)v31 + 1) = v28;
  v31[16] = 0;
  return result;
}

uint64_t sub_B8700@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_9D8C4(*(unsigned char *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48));
  *a2 = result & 1;
  return result;
}

uint64_t sub_B873C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_338A0(a1, (uint64_t)v26);
  uint64_t v11 = sub_33904((uint64_t)v26, v27);
  __chkstk_darwin(v11);
  uint64_t v13 = (void *)((char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v14 + 16))(v13);
  uint64_t v15 = *v13;
  uint64_t v16 = type metadata accessor for MSRepositoryDefault();
  v25[3] = v16;
  v25[4] = &off_124FE8;
  v25[0] = v15;
  _s9ViewModelCMa_5();
  uint64_t v17 = swift_allocObject();
  uint64_t v18 = sub_33904((uint64_t)v25, v16);
  __chkstk_darwin(v18);
  uint64_t v20 = (void *)((char *)v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v21 + 16))(v20);
  uint64_t v22 = *v20;
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v23 = sub_C0B90(v22, a2, a3, a4, a5, a6, v17);
  swift_release();
  swift_release();
  swift_release();
  sub_6A34((uint64_t)v25);
  sub_6A34((uint64_t)v26);
  return v23;
}

uint64_t sub_B8964@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v129 = a1;
  uint64_t v143 = sub_6898(&qword_139000);
  *((void *)&v119 + 1) = *(void *)(v143 - 8);
  __chkstk_darwin(v143);
  v128 = (char *)&v104 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for MSRulesView();
  uint64_t v131 = *(void *)(v4 - 8);
  uint64_t v132 = v4 - 8;
  uint64_t v130 = *(void *)(v131 + 64);
  __chkstk_darwin(v4 - 8);
  uint64_t v141 = (uint64_t)&v104 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v139 = sub_E53E0();
  uint64_t v145 = *(void *)(v139 - 8);
  uint64_t v6 = __chkstk_darwin(v139);
  v123 = (char *)&v104 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v137 = (char *)&v104 - v8;
  uint64_t v9 = sub_E4B80();
  *((void *)&v120 + 1) = *(void *)(v9 - 8);
  v121 = (void (*)(void, void))v9;
  __chkstk_darwin(v9);
  *(void *)&long long v120 = (char *)&v104 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_6898(&qword_139008);
  __chkstk_darwin(v11 - 8);
  uint64_t v117 = (uint64_t)&v104 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_6898(&qword_138E58);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v104 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = sub_6898(&qword_139010);
  uint64_t v17 = *(void *)(v108 - 8);
  __chkstk_darwin(v108);
  uint64_t v19 = (char *)&v104 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = sub_6898(&qword_138E48);
  __chkstk_darwin(v104);
  uint64_t v21 = (char *)&v104 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_6898(&qword_139018);
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v134 = v22;
  uint64_t v135 = v23;
  __chkstk_darwin(v22);
  v105 = (char *)&v104 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = sub_6898(&qword_139020);
  uint64_t v112 = *(void *)(v114 - 8);
  __chkstk_darwin(v114);
  v133 = (char *)&v104 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = sub_6898(&qword_139028);
  __chkstk_darwin(v110);
  v109 = (char *)&v104 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_6898(&qword_139030);
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v115 = v27;
  uint64_t v116 = v28;
  __chkstk_darwin(v27);
  v111 = (char *)&v104 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_6898(&qword_139038);
  uint64_t v31 = *(void *)(v30 - 8);
  uint64_t v118 = v30;
  *(void *)&long long v119 = v31;
  __chkstk_darwin(v30);
  v113 = (char *)&v104 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v138 = sub_6898(&qword_139040);
  uint64_t v122 = *(void *)(v138 - 8);
  __chkstk_darwin(v138);
  v136 = (char *)&v104 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_6898(&qword_139048);
  uint64_t v35 = *(void *)(v34 - 8);
  uint64_t v124 = v34;
  uint64_t v125 = v35;
  __chkstk_darwin(v34);
  v140 = (char *)&v104 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_6898(&qword_139050);
  uint64_t v38 = *(void *)(v37 - 8);
  uint64_t v126 = v37;
  uint64_t v127 = v38;
  __chkstk_darwin(v37);
  v142 = (char *)&v104 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v147 = v1;
  sub_6898(&qword_139058);
  sub_C1220();
  sub_E4EA0();
  sub_105AC(&qword_138E60, &qword_138E58);
  sub_E4FA0();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  uint64_t v40 = v108;
  (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v21, v19, v108);
  uint64_t v41 = v104;
  Swift::String_optional v42 = (uint64_t (**)())&v21[*(int *)(v104 + 36)];
  *Swift::String_optional v42 = sub_BA7F8;
  v42[1] = 0;
  v42[2] = 0;
  v42[3] = 0;
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v40);
  uint64_t v43 = v132;
  uint64_t v108 = v2 + *(int *)(v132 + 28);
  uint64_t v107 = _s9ViewModelCMa_5();
  uint64_t v106 = sub_C2118(&qword_139078, (void (*)(uint64_t))_s9ViewModelCMa_5);
  sub_E4780();
  swift_getKeyPath();
  sub_E48D0();
  swift_release();
  swift_release();
  long long v162 = v158;
  long long v163 = v159;
  v164[0] = v160[0];
  *(_OWORD *)((char *)v164 + 9) = *(_OWORD *)((char *)v160 + 9);
  uint64_t v44 = v105;
  sub_B002C((uint64_t)&v162, 19279, 0xE200000000000000);
  uint64_t v165 = v162;
  sub_E5F4((uint64_t)&v165);
  swift_release();
  sub_10250((uint64_t)&v163, (uint64_t)v166, &qword_1312F8);
  sub_E620((uint64_t)v166);
  sub_102B4((uint64_t)v21, &qword_138E48);
  uint64_t v146 = v2;
  sub_6898(&qword_139080);
  uint64_t v45 = sub_62A4(&qword_131570);
  unint64_t v46 = sub_B5B1C();
  unint64_t v47 = sub_E44C();
  uint64_t v48 = sub_105AC((unint64_t *)&qword_1315D0, &qword_131570);
  *(void *)&long long v158 = v41;
  *((void *)&v158 + 1) = &type metadata for MSError;
  *(void *)&long long v159 = v45;
  *((void *)&v159 + 1) = v46;
  *(void *)&v160[0] = v47;
  *((void *)&v160[0] + 1) = v48;
  swift_getOpaqueTypeConformance2();
  sub_C12D0();
  uint64_t v49 = v134;
  sub_E5130();
  (*(void (**)(char *, uint64_t))(v135 + 8))(v44, v49);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v51 = v43;
  uint64_t v52 = *(int *)(v43 + 36);
  uint64_t v144 = v2;
  uint64_t v135 = v2 + v52;
  uint64_t v134 = sub_6898(&qword_138F50);
  uint64_t v53 = v117;
  sub_E5240();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*((void *)&v119 + 1) + 56))(v53, 0, 1, v143);
  uint64_t v54 = (uint64_t)v109;
  uint64_t v55 = v110;
  uint64_t v56 = (uint64_t *)&v109[*(int *)(v110 + 36)];
  uint64_t v57 = sub_6898(&qword_139098);
  sub_105F0(v53, (uint64_t)v56 + *(int *)(v57 + 28), &qword_139008);
  *uint64_t v56 = KeyPath;
  uint64_t v58 = v112;
  Swift::String v59 = v133;
  uint64_t v60 = v114;
  (*(void (**)(uint64_t, char *, uint64_t))(v112 + 16))(v54, v133, v114);
  sub_102B4(v53, &qword_139008);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v59, v60);
  uint64_t v61 = (uint64_t *)(v2 + *(int *)(v51 + 40));
  uint64_t v63 = *v61;
  uint64_t v62 = v61[1];
  *(void *)&long long v158 = v63;
  *((void *)&v158 + 1) = v62;
  unint64_t v64 = sub_C13C8();
  unint64_t v65 = sub_E3F8();
  Swift::String v66 = v111;
  sub_E5050();
  sub_102B4(v54, &qword_139028);
  long long v67 = v120;
  uint64_t v68 = v121;
  (*(void (**)(void, void, void (*)(void, void)))(*((void *)&v120 + 1) + 104))(v120, enum case for NavigationBarItem.TitleDisplayMode.inline(_:), v121);
  *(void *)&long long v158 = v55;
  *((void *)&v158 + 1) = &type metadata for String;
  *(void *)&long long v159 = v64;
  *((void *)&v159 + 1) = v65;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v70 = v113;
  uint64_t v71 = v115;
  sub_E50D0();
  (*(void (**)(void, void))(*((void *)&v67 + 1) + 8))(v67, v68);
  uint64_t v72 = v71;
  (*(void (**)(char *, uint64_t))(v116 + 8))(v66, v71);
  unint64_t v73 = v137;
  sub_E5220();
  uint64_t v74 = v145;
  Swift::String v75 = v123;
  uint64_t v76 = v139;
  (*(void (**)(char *, void, uint64_t))(v145 + 104))(v123, enum case for EditMode.active(_:), v139);
  sub_E53D0();
  Swift::String v77 = *(void (**)(void, void))(v74 + 8);
  uint64_t v145 = v74 + 8;
  v121 = v77;
  v77(v75, v76);
  v77(v73, v76);
  *(void *)&long long v158 = v72;
  *((void *)&v158 + 1) = OpaqueTypeConformance2;
  uint64_t v78 = swift_getOpaqueTypeConformance2();
  uint64_t v79 = v118;
  sub_E50C0();
  (*(void (**)(char *, uint64_t))(v119 + 8))(v70, v79);
  sub_E4780();
  swift_getKeyPath();
  sub_E48D0();
  swift_release();
  swift_release();
  long long v150 = v158;
  long long v151 = v159;
  long long v152 = v160[0];
  long long v153 = v160[1];
  long long v154 = v160[2];
  long long v155 = v160[3];
  long long v156 = v160[4];
  uint64_t v157 = v161;
  uint64_t v80 = v141;
  sub_C1560(v144, v141);
  uint64_t v81 = *(unsigned __int8 *)(v131 + 80);
  uint64_t v82 = ((v81 + 16) & ~v81) + v130;
  uint64_t v83 = (v81 + 16) & ~v81;
  v133 = (char *)v83;
  uint64_t v130 = v81 | 7;
  uint64_t v131 = v82;
  uint64_t v84 = swift_allocObject();
  sub_C15C8(v80, v84 + v83);
  *(void *)&long long v119 = sub_6898(&qword_1390B0);
  uint64_t v148 = v79;
  uint64_t v149 = v78;
  *((void *)&v119 + 1) = swift_getOpaqueTypeConformance2();
  *(void *)&long long v120 = sub_C16AC();
  v123 = (char *)&unk_F2B10;
  *((void *)&v120 + 1) = sub_105AC(&qword_1390C0, &qword_1390B0);
  sub_E5100();
  swift_release();
  uint64_t v117 = *((void *)&v151 + 1);
  uint64_t v118 = v151;
  uint64_t v115 = v153;
  uint64_t v116 = v152;
  uint64_t v114 = *((void *)&v153 + 1);
  swift_release();
  swift_release();
  sub_C1700(v118, v117);
  uint64_t v85 = v138;
  (*(void (**)(char *, uint64_t))(v122 + 8))(v136, v138);
  uint64_t v86 = v144;
  v87 = (char *)(v144 + *(int *)(v132 + 32));
  char v88 = *v87;
  uint64_t v89 = *((void *)v87 + 1);
  LOBYTE(v150) = v88;
  *((void *)&v150 + 1) = v89;
  sub_6898(&qword_1315F0);
  sub_E5240();
  uint64_t v90 = v141;
  sub_C1560(v86, v141);
  uint64_t v91 = swift_allocObject();
  sub_C15C8(v90, (uint64_t)&v133[v91]);
  uint64_t v92 = sub_6898(&qword_1390C8);
  *(void *)&long long v158 = v85;
  *((void *)&v158 + 1) = &type metadata for MailRule;
  long long v159 = v119;
  v160[0] = v120;
  *(void *)&long long v103 = swift_getOpaqueTypeConformance2();
  *((void *)&v103 + 1) = sub_105AC(&qword_1390D0, &qword_1390C8);
  uint64_t v93 = v124;
  v94 = v140;
  sub_E50F0();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v125 + 8))(v94, v93);
  uint64_t v95 = (uint64_t)v128;
  sub_E5240();
  v96 = v137;
  sub_E52F0();
  sub_102B4(v95, &qword_139000);
  sub_C1560(v144, v90);
  uint64_t v97 = swift_allocObject();
  sub_C15C8(v90, (uint64_t)&v133[v97]);
  *(void *)&long long v158 = v93;
  *((void *)&v158 + 1) = v92;
  long long v159 = v103;
  swift_getOpaqueTypeConformance2();
  sub_C2118(&qword_1390D8, (void (*)(uint64_t))&type metadata accessor for EditMode);
  v98 = v96;
  uint64_t v99 = v126;
  uint64_t v100 = v139;
  v101 = v142;
  sub_E5150();
  swift_release();
  v121(v98, v100);
  return (*(uint64_t (**)(char *, uint64_t))(v127 + 8))(v101, v99);
}

uint64_t sub_B9C50@<X0>(uint64_t a1@<X8>)
{
  uint64_t v29 = a1;
  uint64_t v30 = sub_6898(&qword_139070);
  __chkstk_darwin(v30);
  uint64_t v22 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_6898(&qword_136468);
  uint64_t v24 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v23 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_6898(&qword_139170);
  __chkstk_darwin(v27);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_6898(&qword_136478);
  __chkstk_darwin(v25);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_6898(&qword_136480);
  __chkstk_darwin(v28);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_6898(&qword_136488);
  uint64_t v21 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MSRulesView();
  _s9ViewModelCMa_5();
  sub_C2118(&qword_139078, (void (*)(uint64_t))_s9ViewModelCMa_5);
  sub_E4770();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_E45B0();
  swift_release();
  swift_release();
  uint64_t v12 = swift_release();
  unint64_t v13 = v32;
  if (v32)
  {
    if (v32 == 1)
    {
      uint64_t v14 = v22;
      sub_BA3E0(v22);
      sub_105F0((uint64_t)v14, (uint64_t)v4, &qword_139070);
      swift_storeEnumTagMultiPayload();
      sub_75D28();
      sub_105AC(&qword_139068, &qword_139070);
      sub_E4C50();
      return sub_102B4((uint64_t)v14, &qword_139070);
    }
    else
    {
      uint64_t v17 = v31;
      __chkstk_darwin(v12);
      *(&v21 - 2) = v17;
      *(&v21 - 1) = v13;
      uint64_t v18 = v23;
      sub_E53A0();
      sub_F01C(v17, v13);
      uint64_t v19 = v24;
      uint64_t v20 = v26;
      (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v6, v18, v26);
      swift_storeEnumTagMultiPayload();
      sub_75DA4();
      sub_75E24();
      sub_E4C50();
      sub_105F0((uint64_t)v8, (uint64_t)v4, &qword_136480);
      swift_storeEnumTagMultiPayload();
      sub_75D28();
      sub_105AC(&qword_139068, &qword_139070);
      sub_E4C50();
      sub_102B4((uint64_t)v8, &qword_136480);
      return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v18, v20);
    }
  }
  else
  {
    sub_6898(&qword_131720);
    sub_F358();
    sub_E53A0();
    uint64_t v16 = v21;
    (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v6, v11, v9);
    swift_storeEnumTagMultiPayload();
    sub_75DA4();
    sub_75E24();
    sub_E4C50();
    sub_105F0((uint64_t)v8, (uint64_t)v4, &qword_136480);
    swift_storeEnumTagMultiPayload();
    sub_75D28();
    sub_105AC(&qword_139068, &qword_139070);
    sub_E4C50();
    sub_102B4((uint64_t)v8, &qword_136480);
    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v11, v9);
  }
}

uint64_t sub_BA2CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_6898(&qword_131630);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_E4790();
  sub_E53F0();
  __n128 v6 = sub_AEB5C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, a1, 0.0, 1, 0.0, 1);
  return (*(uint64_t (**)(char *, uint64_t, __n128))(v3 + 8))(v5, v2, v6);
}

uint64_t sub_BA3E0@<X0>(char *a1@<X8>)
{
  uint64_t v41 = a1;
  uint64_t v39 = sub_6898(&qword_139178);
  uint64_t v2 = *(void *)(v39 - 8);
  uint64_t v3 = __chkstk_darwin(v39);
  uint64_t v40 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  __n128 v6 = (char *)&v34 - v5;
  uint64_t v7 = sub_6898(&qword_139180);
  uint64_t v38 = *(void *)(v7 - 8);
  uint64_t v8 = v38;
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  unint64_t v13 = (char *)&v34 - v12;
  uint64_t v43 = v1;
  sub_6898(&qword_139188);
  sub_C1C38();
  uint64_t v37 = v13;
  sub_E53A0();
  uint64_t v42 = v1;
  type metadata accessor for MAPreferencesViewProvider();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v15 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v44._uint64_t countAndFlagsBits = 2777980912;
  v44._object = (void *)0xA400000000000000;
  v48._uint64_t countAndFlagsBits = 0xD000000000000011;
  v48._object = (void *)0x80000000000F6EC0;
  sub_E5690(v48);
  v49._uint64_t countAndFlagsBits = 2777980912;
  v49._object = (void *)0xA400000000000000;
  sub_E5690(v49);
  v33._uint64_t countAndFlagsBits = 0xE000000000000000;
  v50._uint64_t countAndFlagsBits = 0xD000000000000011;
  v50._object = (void *)0x80000000000F6EC0;
  v51.value._uint64_t countAndFlagsBits = 0;
  v51.value._object = 0;
  v16.super.isa = v15;
  uint64_t v17 = sub_E3FE0(v50, v51, v16, v44, v33);
  uint64_t v19 = v18;

  swift_bridgeObjectRelease();
  v44._uint64_t countAndFlagsBits = v17;
  v44._object = v19;
  sub_E3F8();
  v44._uint64_t countAndFlagsBits = sub_E4F60();
  v44._object = v20;
  char v45 = v21 & 1;
  uint64_t v46 = v22;
  __int16 v47 = 256;
  sub_6898(&qword_131640);
  sub_6898(&qword_1316A8);
  sub_ED00();
  sub_47DE8();
  uint64_t v35 = v6;
  sub_E53B0();
  uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  uint64_t v36 = v11;
  v23(v11, v13, v7);
  uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  uint64_t v25 = v40;
  uint64_t v26 = v6;
  uint64_t v27 = v39;
  v24(v40, v26, v39);
  uint64_t v28 = v41;
  v23(v41, v11, v7);
  uint64_t v29 = sub_6898(&qword_139220);
  v24(&v28[*(int *)(v29 + 48)], v25, v27);
  uint64_t v30 = *(void (**)(char *, uint64_t))(v2 + 8);
  v30(v35, v27);
  uint64_t v31 = *(void (**)(char *, uint64_t))(v38 + 8);
  v31(v37, v7);
  v30(v25, v27);
  return ((uint64_t (*)(char *, uint64_t))v31)(v36, v7);
}

uint64_t sub_BA7F8()
{
  uint64_t v0 = sub_E4320();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_131238 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_67B4(v0, (uint64_t)qword_148D58);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  uint64_t v5 = sub_E4300();
  os_log_type_t v6 = sub_E5870();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&def_66DD4, v5, v6, "[Rules List] page viewed", v7, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  uint64_t v8 = (void (*)(void))sub_7DB5C(3);
  v8();
  return swift_release();
}

double sub_BA9A0@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_E45B0();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = v6;
  return result;
}

uint64_t sub_BAA30()
{
  return sub_E45C0();
}

uint64_t sub_BAADC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_E46E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_E46D0();
  type metadata accessor for MSRulesView();
  _s9ViewModelCMa_5();
  sub_C2118(&qword_139078, (void (*)(uint64_t))_s9ViewModelCMa_5);
  sub_E4770();
  BOOL v6 = sub_3FC0C();
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v8 = swift_allocObject();
  *(unsigned char *)(v8 + 16) = v6;
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(a1, v5, v2);
  uint64_t v9 = (uint64_t *)(a1 + *(int *)(sub_6898(&qword_139080) + 36));
  *uint64_t v9 = KeyPath;
  v9[1] = (uint64_t)sub_C1C10;
  v9[2] = v8;
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_BACB4(uint64_t a1)
{
  uint64_t v2 = sub_6898(&qword_139008);
  __chkstk_darwin(v2 - 8);
  sub_105F0(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_139008);
  return sub_E4B10();
}

double sub_BAD48@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_E45B0();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = v5;
  *(_OWORD *)(a1 + 48) = v6;
  *(_OWORD *)(a1 + 64) = v7;
  *(_OWORD *)(a1 + 80) = v8;
  *(void *)(a1 + 96) = v9;
  return result;
}

uint64_t sub_BADE0(uint64_t *a1)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_4306C(v3, v2);
  swift_retain();
  return sub_E45C0();
}

uint64_t sub_BAEDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v21 = a2;
  uint64_t v23 = a3;
  uint64_t v4 = type metadata accessor for MSRulesView();
  uint64_t v22 = *(void *)(v4 - 8);
  uint64_t v5 = *(void *)(v22 + 64);
  __chkstk_darwin(v4 - 8);
  long long v6 = *(_OWORD *)(a1 + 80);
  v26[4] = *(_OWORD *)(a1 + 64);
  v26[5] = v6;
  uint64_t v27 = *(void *)(a1 + 96);
  long long v7 = *(_OWORD *)(a1 + 48);
  v26[2] = *(_OWORD *)(a1 + 32);
  v26[3] = v7;
  long long v8 = *(_OWORD *)(a1 + 16);
  v26[0] = *(_OWORD *)a1;
  v26[1] = v8;
  sub_8DAEC((uint64_t)v26);
  _s9ViewModelCMa_5();
  sub_C2118(&qword_139078, (void (*)(uint64_t))_s9ViewModelCMa_5);
  uint64_t v9 = *(void *)(sub_E4770() + OBJC_IVAR____TtCV18icloudMailSettings11MSRulesView9ViewModel_folderList);
  swift_retain();
  swift_release();
  uint64_t v10 = *(void *)(sub_E4770() + OBJC_IVAR____TtCV18icloudMailSettings11MSRulesView9ViewModel_sharedPreference);
  swift_retain();
  swift_release();
  uint64_t v11 = sub_E4770();
  sub_338A0(v11 + OBJC_IVAR____TtCV18icloudMailSettings11MSRulesView9ViewModel_repository, (uint64_t)v24);
  swift_release();
  sub_C1560(v21, (uint64_t)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v12 = (*(unsigned __int8 *)(v22 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  uint64_t v13 = swift_allocObject();
  sub_C15C8((uint64_t)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v12);
  sub_6898(&qword_139168);
  uint64_t v14 = (char *)swift_allocObject();
  uint64_t v15 = sub_33904((uint64_t)v24, v25);
  __chkstk_darwin(v15);
  uint64_t v17 = (uint64_t *)((char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v18 + 16))(v17);
  uint64_t v19 = sub_C04DC((uint64_t)v26, v9, v10, *v17, sub_C19B0, v13, v14);
  sub_6A34((uint64_t)v24);
  return sub_BB2F8((uint64_t)v19, (void (*)(void, uint64_t, void))sub_12384, &qword_1390B0, &off_1205A8, (uint64_t)sub_10314, v23);
}

uint64_t sub_BB244()
{
  type metadata accessor for MSRulesView();
  _s9ViewModelCMa_5();
  sub_C2118(&qword_139078, (void (*)(uint64_t))_s9ViewModelCMa_5);
  sub_E4770();
  sub_3B580();

  return swift_release();
}

uint64_t sub_BB2F8@<X0>(uint64_t a1@<X0>, void (*a2)(void, uint64_t, void)@<X1>, uint64_t *a3@<X2>, void *a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v113 = a5;
  uint64_t v130 = a4;
  v111 = a3;
  uint64_t v129 = a2;
  uint64_t v112 = a1;
  uint64_t v7 = sub_6898(&qword_1390E0);
  uint64_t v115 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v110 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_6898(&qword_1390E8);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v110 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a6 = swift_getKeyPath();
  sub_6898(&qword_1314A8);
  uint64_t v124 = a6;
  swift_storeEnumTagMultiPayload();
  type metadata accessor for MAPreferencesViewProvider();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v119 = self;
  uint64_t v120 = ObjCClassFromMetadata;
  uint64_t v15 = (objc_class *)[v119 bundleForClass:ObjCClassFromMetadata];
  v131._uint64_t countAndFlagsBits = 2777980912;
  v131._object = (void *)0xA400000000000000;
  v133._uint64_t countAndFlagsBits = 0xD000000000000018;
  v133._object = (void *)0x80000000000F6DF0;
  sub_E5690(v133);
  v134._uint64_t countAndFlagsBits = 2777980912;
  v134._object = (void *)0xA400000000000000;
  sub_E5690(v134);
  v106._uint64_t countAndFlagsBits = 0xE000000000000000;
  uint64_t v127 = (void (*)(char *, char *, uint64_t))0x80000000000F6DF0;
  uint64_t v128 = 0xD000000000000018;
  v135._uint64_t countAndFlagsBits = 0xD000000000000018;
  v135._object = (void *)0x80000000000F6DF0;
  v145.value._uint64_t countAndFlagsBits = 0;
  v145.value._object = 0;
  v16.super.isa = v15;
  uint64_t v17 = sub_E3FE0(v135, v145, v16, v131, v106);
  uint64_t v19 = v18;

  swift_bridgeObjectRelease();
  v131._uint64_t countAndFlagsBits = v17;
  v131._object = v19;
  uint64_t v20 = sub_6898(&qword_1390F0);
  sub_E42C0();
  unint64_t v21 = sub_C1938();
  uint64_t v22 = sub_105AC(&qword_139100, &qword_1390E8);
  unint64_t v118 = v21;
  uint64_t v117 = v22;
  uint64_t v23 = sub_E5540();
  uint64_t v24 = *(void (**)(char *, uint64_t))(v11 + 8);
  v121 = v13;
  uint64_t v25 = v13;
  uint64_t v26 = v115;
  uint64_t v122 = v11 + 8;
  uint64_t v123 = v10;
  uint64_t v27 = v10;
  uint64_t v28 = v129;
  uint64_t v116 = v24;
  v24(v25, v27);
  swift_bridgeObjectRelease();
  uint64_t v29 = *(void *)(v23 + 16);
  uint64_t v114 = v20;
  if (v29)
  {
    uint64_t v132 = _swiftEmptyArrayStorage;
    v28(0, v29, 0);
    uint64_t v126 = *(void (**)(char *, unint64_t, uint64_t))(v26 + 16);
    unint64_t v30 = (*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
    v110[1] = v23;
    unint64_t v31 = v23 + v30;
    uint64_t v125 = *(void *)(v26 + 72);
    unint64_t v32 = (void (**)(char *, uint64_t))(v26 + 8);
    do
    {
      v126(v9, v31, v7);
      sub_E42D0();
      swift_bridgeObjectRelease();
      uint64_t v33 = sub_E5630();
      uint64_t v35 = v34;
      swift_bridgeObjectRelease();
      char v36 = sub_BE8C8(v128, (unint64_t)v127, v33, v35, v130);
      swift_bridgeObjectRelease();
      (*v32)(v9, v7);
      uint64_t v37 = v132;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        v129(0, v37[2] + 1, 1);
        uint64_t v37 = v132;
      }
      unint64_t v39 = v37[2];
      unint64_t v38 = v37[3];
      if (v39 >= v38 >> 1)
      {
        v129(v38 > 1, v39 + 1, 1);
        uint64_t v37 = v132;
      }
      Swift::String v37[2] = v39 + 1;
      *((unsigned char *)v37 + v39 + 32) = v36;
      v31 += v125;
      --v29;
    }
    while (v29);
    swift_bridgeObjectRelease();
    uint64_t v28 = v129;
    uint64_t v26 = v115;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v37 = _swiftEmptyArrayStorage;
  }
  uint64_t v125 = sub_6898(v111);
  *(uint64_t *)((char *)v124 + *(int *)(v125 + 28)) = (uint64_t)v37;
  uint64_t v40 = (objc_class *)[v119 bundleForClass:v120];
  v131._uint64_t countAndFlagsBits = 2777980912;
  v131._object = (void *)0xA400000000000000;
  v136._uint64_t countAndFlagsBits = 0xD00000000000002ELL;
  v136._object = (void *)0x80000000000F6E10;
  sub_E5690(v136);
  v137._uint64_t countAndFlagsBits = 2777980912;
  v137._object = (void *)0xA400000000000000;
  sub_E5690(v137);
  v107._uint64_t countAndFlagsBits = 0xE000000000000000;
  v138._uint64_t countAndFlagsBits = 0xD00000000000002ELL;
  uint64_t v128 = 0x80000000000F6E10;
  v138._object = (void *)0x80000000000F6E10;
  v146.value._uint64_t countAndFlagsBits = 0;
  v146.value._object = 0;
  v41.super.isa = v40;
  uint64_t v42 = sub_E3FE0(v138, v146, v41, v131, v107);
  Swift::String v44 = v43;

  swift_bridgeObjectRelease();
  v131._uint64_t countAndFlagsBits = v42;
  v131._object = v44;
  char v45 = v121;
  sub_E42C0();
  uint64_t v46 = v123;
  __int16 v47 = (uint64_t *)sub_E5540();
  v116(v45, v46);
  swift_bridgeObjectRelease();
  uint64_t v48 = v47[2];
  if (v48)
  {
    uint64_t v132 = _swiftEmptyArrayStorage;
    v28(0, v48, 0);
    uint64_t v127 = *(void (**)(char *, char *, uint64_t))(v26 + 16);
    unint64_t v49 = (*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
    v111 = v47;
    Swift::String v50 = (char *)v47 + v49;
    uint64_t v126 = *(void (**)(char *, unint64_t, uint64_t))(v26 + 72);
    Swift::String_optional v51 = (void (**)(char *, uint64_t))(v26 + 8);
    do
    {
      v127(v9, v50, v7);
      sub_E42D0();
      swift_bridgeObjectRelease();
      uint64_t v52 = sub_E5630();
      uint64_t v54 = v53;
      swift_bridgeObjectRelease();
      char v55 = sub_BE8C8(0xD00000000000002ELL, v128, v52, v54, v130);
      swift_bridgeObjectRelease();
      (*v51)(v9, v7);
      uint64_t v56 = v132;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        v129(0, v56[2] + 1, 1);
        uint64_t v56 = v132;
      }
      unint64_t v58 = v56[2];
      unint64_t v57 = v56[3];
      if (v58 >= v57 >> 1)
      {
        v129(v57 > 1, v58 + 1, 1);
        uint64_t v56 = v132;
      }
      v56[2] = v58 + 1;
      *((unsigned char *)v56 + v58 + 32) = v55;
      Swift::String v50 = (char *)v126 + (void)v50;
      --v48;
    }
    while (v48);
    swift_bridgeObjectRelease();
    uint64_t v28 = v129;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v56 = _swiftEmptyArrayStorage;
  }
  *(uint64_t *)((char *)v124 + *(int *)(v125 + 32)) = (uint64_t)v56;
  Swift::String v59 = (objc_class *)[v119 bundleForClass:v120];
  v131._uint64_t countAndFlagsBits = 2777980912;
  v131._object = (void *)0xA400000000000000;
  v139._uint64_t countAndFlagsBits = 0xD00000000000002BLL;
  v139._object = (void *)0x80000000000F6E40;
  sub_E5690(v139);
  v140._uint64_t countAndFlagsBits = 2777980912;
  v140._object = (void *)0xA400000000000000;
  sub_E5690(v140);
  v108._uint64_t countAndFlagsBits = 0xE000000000000000;
  v141._uint64_t countAndFlagsBits = 0xD00000000000002BLL;
  uint64_t v128 = 0x80000000000F6E40;
  v141._object = (void *)0x80000000000F6E40;
  v147.value._uint64_t countAndFlagsBits = 0;
  v147.value._object = 0;
  v60.super.isa = v59;
  uint64_t v61 = sub_E3FE0(v141, v147, v60, v131, v108);
  uint64_t v63 = v62;

  swift_bridgeObjectRelease();
  v131._uint64_t countAndFlagsBits = v61;
  v131._object = v63;
  unint64_t v64 = v121;
  sub_E42C0();
  uint64_t v65 = v123;
  Swift::String v66 = (uint64_t *)sub_E5540();
  v116(v64, v65);
  swift_bridgeObjectRelease();
  uint64_t v67 = v66[2];
  if (v67)
  {
    uint64_t v132 = _swiftEmptyArrayStorage;
    v28(0, v67, 0);
    uint64_t v127 = *(void (**)(char *, char *, uint64_t))(v115 + 16);
    unint64_t v68 = (*(unsigned __int8 *)(v115 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v115 + 80);
    v111 = v66;
    unint64_t v69 = (char *)v66 + v68;
    uint64_t v126 = *(void (**)(char *, unint64_t, uint64_t))(v115 + 72);
    uint64_t v70 = (void (**)(char *, uint64_t))(v115 + 8);
    do
    {
      v127(v9, v69, v7);
      sub_E42D0();
      swift_bridgeObjectRelease();
      uint64_t v71 = sub_E5630();
      unint64_t v73 = v72;
      swift_bridgeObjectRelease();
      char v74 = sub_BE8C8(0xD00000000000002BLL, v128, v71, v73, v130);
      swift_bridgeObjectRelease();
      (*v70)(v9, v7);
      Swift::String v75 = v132;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        v129(0, v75[2] + 1, 1);
        Swift::String v75 = v132;
      }
      unint64_t v77 = v75[2];
      unint64_t v76 = v75[3];
      if (v77 >= v76 >> 1)
      {
        v129(v76 > 1, v77 + 1, 1);
        Swift::String v75 = v132;
      }
      v75[2] = v77 + 1;
      *((unsigned char *)v75 + v77 + 32) = v74;
      unint64_t v69 = (char *)v126 + (void)v69;
      --v67;
    }
    while (v67);
    swift_bridgeObjectRelease();
    uint64_t v78 = v129;
  }
  else
  {
    uint64_t v78 = v28;
    swift_bridgeObjectRelease();
    Swift::String v75 = _swiftEmptyArrayStorage;
  }
  *(uint64_t *)((char *)v124 + *(int *)(v125 + 36)) = (uint64_t)v75;
  uint64_t v79 = (objc_class *)[v119 bundleForClass:v120];
  v131._uint64_t countAndFlagsBits = 2777980912;
  v131._object = (void *)0xA400000000000000;
  v142._uint64_t countAndFlagsBits = 0xD00000000000002BLL;
  v142._object = (void *)0x80000000000F6E70;
  sub_E5690(v142);
  v143._uint64_t countAndFlagsBits = 2777980912;
  v143._object = (void *)0xA400000000000000;
  sub_E5690(v143);
  v109._uint64_t countAndFlagsBits = 0xE000000000000000;
  v144._uint64_t countAndFlagsBits = 0xD00000000000002BLL;
  uint64_t v128 = 0x80000000000F6E70;
  v144._object = (void *)0x80000000000F6E70;
  v148.value._uint64_t countAndFlagsBits = 0;
  v148.value._object = 0;
  v80.super.isa = v79;
  uint64_t v81 = sub_E3FE0(v144, v148, v80, v131, v109);
  uint64_t v83 = v82;

  swift_bridgeObjectRelease();
  v131._uint64_t countAndFlagsBits = v81;
  v131._object = v83;
  uint64_t v84 = v121;
  sub_E42C0();
  uint64_t v85 = v123;
  uint64_t v86 = sub_E5540();
  v116(v84, v85);
  swift_bridgeObjectRelease();
  uint64_t v87 = *(void *)(v86 + 16);
  if (v87)
  {
    uint64_t v132 = _swiftEmptyArrayStorage;
    v78(0, v87, 0);
    uint64_t v88 = v115 + 16;
    uint64_t v89 = *(void (**)(char *, char *, uint64_t))(v115 + 16);
    uint64_t v90 = *(unsigned __int8 *)(v115 + 80);
    uint64_t v123 = v86;
    uint64_t v91 = v86 + ((v90 + 32) & ~v90);
    uint64_t v126 = *(void (**)(char *, unint64_t, uint64_t))(v115 + 72);
    uint64_t v127 = v89;
    uint64_t v92 = (void (**)(char *, uint64_t))(v115 + 8);
    do
    {
      uint64_t v93 = v88;
      v127(v9, (char *)v91, v7);
      sub_E42D0();
      swift_bridgeObjectRelease();
      uint64_t v94 = sub_E5630();
      v96 = v95;
      swift_bridgeObjectRelease();
      char v97 = sub_BE8C8(0xD00000000000002BLL, v128, v94, v96, v130);
      swift_bridgeObjectRelease();
      (*v92)(v9, v7);
      v98 = v132;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        v129(0, v98[2] + 1, 1);
        v98 = v132;
      }
      unint64_t v100 = v98[2];
      unint64_t v99 = v98[3];
      if (v100 >= v99 >> 1)
      {
        v129(v99 > 1, v100 + 1, 1);
        v98 = v132;
      }
      v98[2] = v100 + 1;
      *((unsigned char *)v98 + v100 + 32) = v97;
      v91 += (uint64_t)v126;
      --v87;
      uint64_t v88 = v93;
    }
    while (v87);
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    v98 = _swiftEmptyArrayStorage;
  }
  v102 = v124;
  long long v103 = (int *)v125;
  *(uint64_t *)((char *)v124 + *(int *)(v125 + 40)) = (uint64_t)v98;
  uint64_t v104 = (uint64_t)v102 + v103[11];
  uint64_t v105 = v112;
  *(void *)uint64_t v104 = v113;
  *(void *)(v104 + 8) = v105;
  *(unsigned char *)(v104 + 16) = 0;
  return result;
}

uint64_t sub_BC100@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v16 = a1;
  uint64_t v18 = a2;
  uint64_t v2 = type metadata accessor for MSRulesView();
  uint64_t v17 = *(void *)(v2 - 8);
  uint64_t v3 = *(void *)(v17 + 64);
  __chkstk_darwin(v2 - 8);
  _s9ViewModelCMa_5();
  sub_C2118(&qword_139078, (void (*)(uint64_t))_s9ViewModelCMa_5);
  uint64_t v4 = sub_E4770();
  sub_338A0(v4 + OBJC_IVAR____TtCV18icloudMailSettings11MSRulesView9ViewModel_repository, (uint64_t)v19);
  swift_release();
  uint64_t v5 = *(void *)(sub_E4770() + OBJC_IVAR____TtCV18icloudMailSettings11MSRulesView9ViewModel_folderList);
  swift_retain();
  swift_release();
  uint64_t v6 = *(void *)(sub_E4770() + OBJC_IVAR____TtCV18icloudMailSettings11MSRulesView9ViewModel_sharedPreference);
  swift_retain();
  swift_release();
  sub_E4770();
  uint64_t v7 = sub_3FD4C();
  swift_release();
  sub_C1560(v16, (uint64_t)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v8 = (*(unsigned __int8 *)(v17 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  uint64_t v9 = swift_allocObject();
  sub_C15C8((uint64_t)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v9 + v8);
  uint64_t v10 = sub_33904((uint64_t)v19, v20);
  __chkstk_darwin(v10);
  uint64_t v12 = (uint64_t *)((char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v13 + 16))(v12);
  uint64_t v14 = sub_C09A8(*v12, v5, v6, v7, sub_C1920, v9);
  sub_6A34((uint64_t)v19);
  return sub_BB2F8((uint64_t)v14, (void (*)(void, uint64_t, void))sub_123AC, &qword_1390C8, &off_120700, (uint64_t)sub_10314, v18);
}

uint64_t sub_BC448()
{
  type metadata accessor for MSRulesView();
  _s9ViewModelCMa_5();
  sub_C2118(&qword_139078, (void (*)(uint64_t))_s9ViewModelCMa_5);
  uint64_t v0 = sub_E4770();
  (*(void (**)(void))(v0 + OBJC_IVAR____TtCV18icloudMailSettings11MSRulesView9ViewModel_onUpdate))();
  sub_3B580();

  return swift_release();
}

uint64_t sub_BC518()
{
  uint64_t v0 = sub_E53E0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = &v6[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *, void, uint64_t))(v1 + 104))(v3, enum case for EditMode.inactive(_:), v0);
  char v4 = sub_E53D0();
  (*(void (**)(unsigned char *, uint64_t))(v1 + 8))(v3, v0);
  type metadata accessor for MSRulesView();
  _s9ViewModelCMa_5();
  sub_C2118(&qword_139078, (void (*)(uint64_t))_s9ViewModelCMa_5);
  sub_E4770();
  swift_getKeyPath();
  swift_getKeyPath();
  if (v4)
  {
    v6[13] = 1;
    sub_E45C0();
    sub_E4770();
    swift_getKeyPath();
    swift_getKeyPath();
    v6[12] = 1;
    sub_E45C0();
    sub_E4770();
    sub_3B948();
    return swift_release();
  }
  else
  {
    v6[15] = 0;
    sub_E45C0();
    sub_E4770();
    swift_getKeyPath();
    swift_getKeyPath();
    v6[14] = 0;
    return sub_E45C0();
  }
}

uint64_t sub_BC7B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v42 = a2;
  uint64_t v3 = type metadata accessor for MSRulesView();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(v3);
  uint64_t v38 = sub_6898(&qword_1391D0);
  uint64_t v36 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  unint64_t v31 = (char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_6898(&qword_1391C0) - 8;
  __chkstk_darwin(v35);
  unint64_t v32 = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_6898(&qword_1391B0) - 8;
  __chkstk_darwin(v39);
  uint64_t v37 = (uint64_t)v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_6898(&qword_1391A0) - 8;
  __chkstk_darwin(v41);
  uint64_t v40 = (uint64_t)v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = a1;
  uint64_t v34 = _s9ViewModelCMa_5();
  uint64_t v33 = sub_C2118(&qword_139078, (void (*)(uint64_t))_s9ViewModelCMa_5);
  sub_E4770();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_E45B0();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v10 = (char *)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_C1560(a1, (uint64_t)v10);
  uint64_t v11 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v12 = (v11 + 16) & ~v11;
  v29[1] = v11 | 7;
  uint64_t v13 = swift_allocObject();
  sub_C15C8((uint64_t)v10, v13 + v12);
  sub_6898(&qword_134000);
  sub_105AC(&qword_139228, &qword_134000);
  sub_C1F2C();
  sub_C2118(&qword_139230, (void (*)(uint64_t))_s11MailRuleRowCMa);
  uint64_t v14 = v31;
  sub_E5350();
  uint64_t v15 = v30;
  sub_C1560(v30, (uint64_t)v10);
  uint64_t v16 = swift_allocObject();
  sub_C15C8((uint64_t)v10, v16 + v12);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = sub_C2164;
  *(void *)(v17 + 24) = v16;
  uint64_t v18 = v36;
  uint64_t v19 = (uint64_t)v32;
  uint64_t v20 = v38;
  (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v32, v14, v38);
  unint64_t v21 = (void *)(v19 + *(int *)(v35 + 44));
  *unint64_t v21 = sub_C221C;
  v21[1] = v17;
  (*(void (**)(char *, uint64_t))(v18 + 8))(v14, v20);
  sub_C1560(v15, (uint64_t)v10);
  uint64_t v22 = swift_allocObject();
  sub_C15C8((uint64_t)v10, v22 + v12);
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = sub_C23EC;
  *(void *)(v23 + 24) = v22;
  uint64_t v24 = v37;
  sub_105F0(v19, v37, &qword_1391C0);
  uint64_t v25 = (uint64_t (**)())(v24 + *(int *)(v39 + 44));
  *uint64_t v25 = sub_C245C;
  v25[1] = (uint64_t (*)())v23;
  sub_102B4(v19, &qword_1391C0);
  sub_E4770();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_E45B0();
  swift_release();
  swift_release();
  swift_release();
  LOBYTE(v22) = v43;
  uint64_t v26 = v40;
  sub_105F0(v24, v40, &qword_1391B0);
  *(unsigned char *)(v26 + *(int *)(v41 + 44)) = v22;
  sub_102B4(v24, &qword_1391B0);
  sub_E4770();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_E45B0();
  swift_release();
  swift_release();
  swift_release();
  LOBYTE(v22) = v43;
  uint64_t v27 = v42;
  sub_105F0(v26, v42, &qword_1391A0);
  *(unsigned char *)(v27 + *(int *)(sub_6898(&qword_139188) + 36)) = v22;
  return sub_102B4(v26, &qword_1391A0);
}

uint64_t sub_BCE70@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v46 = a2;
  char v45 = a3;
  uint64_t v4 = type metadata accessor for MSRulesView();
  uint64_t v42 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v43 = v5;
  uint64_t v44 = (uint64_t)v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_E53E0();
  uint64_t v6 = *(void *)(v37 - 8);
  uint64_t v7 = __chkstk_darwin(v37);
  uint64_t v36 = (char *)v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v35 = (char *)v34 - v9;
  uint64_t v10 = *a1;
  _s9ViewModelCMa_5();
  sub_C2118(&qword_139078, (void (*)(uint64_t))_s9ViewModelCMa_5);
  sub_E4770();
  uint64_t v11 = *(void *)(v10 + 104);
  uint64_t v40 = *(void *)(v10 + 96);
  uint64_t v41 = v11;
  swift_bridgeObjectRetain();
  swift_release();
  sub_E4770();
  long long v12 = *(_OWORD *)(v10 + 16);
  long long v13 = *(_OWORD *)(v10 + 32);
  long long v14 = *(_OWORD *)(v10 + 48);
  long long v15 = *(_OWORD *)(v10 + 64);
  long long v16 = *(_OWORD *)(v10 + 96);
  v53[4] = *(_OWORD *)(v10 + 80);
  v53[5] = v16;
  uint64_t v54 = *(void *)(v10 + 112);
  v53[2] = v14;
  v53[3] = v15;
  v53[0] = v12;
  v53[1] = v13;
  sub_8DAEC((uint64_t)v53);
  uint64_t v39 = sub_3D300(v53);
  uint64_t v38 = v17;
  sub_A589C((uint64_t)v53);
  swift_release();
  sub_6898(&qword_138F50);
  uint64_t v18 = v35;
  sub_E5220();
  uint64_t v19 = v36;
  uint64_t v20 = v37;
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v36, enum case for EditMode.active(_:), v37);
  int v21 = sub_E53D0();
  uint64_t v22 = *(void (**)(char *, uint64_t))(v6 + 8);
  v22(v19, v20);
  v22(v18, v20);
  sub_E4770();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_E45B0();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v23 = v48;
  if (v48)
  {
    LODWORD(v37) = v21;
    uint64_t v24 = v47;
    uint64_t v36 = v49;
    uint64_t v35 = v50;
    v34[2] = v51;
    v34[1] = v52;
    swift_bridgeObjectRetain();
    sub_C1700(v24, v23);
    if (v24 == *(void *)(v10 + 16) && v23 == *(void *)(v10 + 24)) {
      char v25 = 1;
    }
    else {
      char v25 = sub_E5C20();
    }
    swift_bridgeObjectRelease();
    LOBYTE(v21) = v37;
  }
  else
  {
    char v25 = 0;
  }
  uint64_t v26 = v44;
  sub_C1560(v46, v44);
  unint64_t v27 = (*(unsigned __int8 *)(v42 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80);
  unint64_t v28 = (v43 + v27 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v29 = swift_allocObject();
  sub_C15C8(v26, v29 + v27);
  *(void *)(v29 + v28) = v10;
  uint64_t v30 = v45;
  uint64_t v31 = v41;
  *char v45 = v40;
  v30[1] = v31;
  uint64_t v32 = v38;
  v30[2] = v39;
  v30[3] = v32;
  *((unsigned char *)v30 + 32) = v21 & 1;
  *((unsigned char *)v30 + 33) = v25 & 1;
  v30[5] = sub_C2648;
  v30[6] = v29;
  return swift_retain();
}

uint64_t sub_BD3D8()
{
  return sub_E45C0();
}

uint64_t sub_BD544(char *a1, uint64_t a2)
{
  type metadata accessor for MSRulesView();
  _s9ViewModelCMa_5();
  sub_C2118(&qword_139078, (void (*)(uint64_t))_s9ViewModelCMa_5);
  sub_E4770();
  sub_3DBA0(a1, a2);

  return swift_release();
}

uint64_t sub_BD614(uint64_t a1)
{
  uint64_t v2 = sub_E53E0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v12 - v7;
  type metadata accessor for MSRulesView();
  sub_6898(&qword_138F50);
  sub_E5220();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v6, enum case for EditMode.active(_:), v2);
  char v9 = sub_E53D0();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v3 + 8);
  v10(v6, v2);
  v10(v8, v2);
  _s9ViewModelCMa_5();
  sub_C2118(&qword_139078, (void (*)(uint64_t))_s9ViewModelCMa_5);
  sub_E4770();
  if (v9) {
    sub_3F834(a1);
  }
  else {
    sub_3E670(a1);
  }
  return swift_release();
}

uint64_t sub_BD808@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v44 = a1;
  uint64_t v53 = a2;
  uint64_t v48 = sub_E53E0();
  uint64_t v2 = *(void *)(v48 - 8);
  uint64_t v3 = __chkstk_darwin(v48);
  uint64_t v47 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v46 = (char *)&v42 - v5;
  uint64_t v45 = sub_6898(&qword_139000);
  __chkstk_darwin(v45);
  uint64_t v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for MSRulesView();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v42 = v8;
  uint64_t v43 = v9;
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = __chkstk_darwin(v8);
  __chkstk_darwin(v11);
  long long v13 = (char *)&v42 - v12;
  uint64_t v14 = sub_6898(&qword_131570);
  uint64_t v51 = *(void *)(v14 - 8);
  uint64_t v52 = v14;
  __chkstk_darwin(v14);
  long long v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_6898(&qword_131640);
  __chkstk_darwin(v49);
  Swift::String v50 = (char *)&v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MAPreferencesViewProvider();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v19 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v54._uint64_t countAndFlagsBits = 2777980912;
  v54._object = (void *)0xA400000000000000;
  v55._uint64_t countAndFlagsBits = 0xD000000000000013;
  v55._object = (void *)0x80000000000F6EA0;
  sub_E5690(v55);
  v56._uint64_t countAndFlagsBits = 2777980912;
  v56._object = (void *)0xA400000000000000;
  sub_E5690(v56);
  v41._uint64_t countAndFlagsBits = 0xE000000000000000;
  v57._uint64_t countAndFlagsBits = 0xD000000000000013;
  v57._object = (void *)0x80000000000F6EA0;
  v58.value._uint64_t countAndFlagsBits = 0;
  v58.value._object = 0;
  v20.super.isa = v19;
  uint64_t v21 = sub_E3FE0(v57, v58, v20, v54, v41);
  uint64_t v23 = v22;

  swift_bridgeObjectRelease();
  v54._uint64_t countAndFlagsBits = v21;
  v54._object = v23;
  uint64_t v24 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = v44;
  sub_C1560(v44, (uint64_t)v13);
  unint64_t v26 = (*(unsigned __int8 *)(v43 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80);
  uint64_t v27 = swift_allocObject();
  sub_C15C8((uint64_t)v13, v27 + v26);
  sub_E3F8();
  sub_E5290();
  sub_6898(&qword_138F50);
  sub_E5240();
  unint64_t v28 = v46;
  sub_E52F0();
  sub_102B4((uint64_t)v7, &qword_139000);
  uint64_t v29 = v47;
  uint64_t v30 = v48;
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v47, enum case for EditMode.active(_:), v48);
  uint64_t v31 = v29;
  LOBYTE(v29) = sub_E53D0();
  uint64_t v32 = *(void (**)(char *, uint64_t))(v2 + 8);
  v32(v31, v30);
  v32(v28, v30);
  sub_C1560(v25, (uint64_t)v24);
  if (v29)
  {
    char v33 = 1;
  }
  else
  {
    _s9ViewModelCMa_5();
    sub_C2118(&qword_139078, (void (*)(uint64_t))_s9ViewModelCMa_5);
    sub_E4770();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_E45B0();
    swift_release();
    swift_release();
    swift_release();
    char v33 = LOBYTE(v54._countAndFlagsBits) ^ 1;
  }
  sub_C2020((uint64_t)v24);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v35 = swift_allocObject();
  *(unsigned char *)(v35 + 16) = v33 & 1;
  uint64_t v37 = (uint64_t)v50;
  uint64_t v36 = v51;
  uint64_t v38 = v52;
  (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v50, v16, v52);
  uint64_t v39 = (uint64_t *)(v37 + *(int *)(v49 + 36));
  *uint64_t v39 = KeyPath;
  v39[1] = (uint64_t)sub_C2F60;
  v39[2] = v35;
  (*(void (**)(char *, uint64_t))(v36 + 8))(v16, v38);
  return sub_10250(v37, v53, &qword_131640);
}

uint64_t sub_BDE20()
{
  return sub_E5230();
}

uint64_t sub_BDE8C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_6898(&qword_139238);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v21[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_6898(&qword_139240);
  uint64_t v9 = v8 - 8;
  __chkstk_darwin(v8);
  uint64_t v11 = &v21[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = swift_allocObject();
  long long v13 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v12 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v12 + 32) = v13;
  *(_OWORD *)(v12 + 48) = *(_OWORD *)(v2 + 32);
  *(void *)(v12 + 64) = *(void *)(v2 + 48);
  uint64_t v22 = v2;
  sub_C2C20(v2);
  sub_6898(&qword_139248);
  sub_105AC(&qword_139250, &qword_139248);
  sub_E5270();
  uint64_t v14 = sub_E51A0();
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 16))(v11, v7, v4);
  long long v16 = (uint64_t *)&v11[*(int *)(v9 + 44)];
  *long long v16 = KeyPath;
  v16[1] = v14;
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  LOBYTE(v5) = *(unsigned char *)(v2 + 32);
  uint64_t v17 = swift_getKeyPath();
  uint64_t v18 = swift_allocObject();
  *(unsigned char *)(v18 + 16) = v5;
  sub_105F0((uint64_t)v11, a1, &qword_139240);
  uint64_t v19 = (uint64_t *)(a1 + *(int *)(sub_6898(&qword_139258) + 36));
  *uint64_t v19 = v17;
  v19[1] = (uint64_t)sub_C2F60;
  _OWORD v19[2] = v18;
  return sub_102B4((uint64_t)v11, &qword_139240);
}

uint64_t sub_BE130@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = sub_E4BA0();
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  uint64_t v4 = sub_6898(&qword_139260);
  return sub_BE180(a1, a2 + *(int *)(v4 + 44));
}

uint64_t sub_BE180@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_6898(&qword_139268);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_6898(&qword_131630);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_6898(&qword_139270);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v45 = (uint64_t)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v35 - v14;
  uint64_t v36 = sub_E4C10();
  sub_BE688((void *)a1, (uint64_t)v46);
  uint64_t v16 = v46[1];
  char v17 = *(unsigned char *)(a1 + 33);
  uint64_t v43 = v46[4];
  uint64_t v44 = v48;
  uint64_t v42 = v46[5];
  int v41 = v47;
  uint64_t v39 = v46[3];
  uint64_t v40 = v46[0];
  uint64_t v38 = v46[2];
  if (v17)
  {
    sub_E4790();
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v6, v10, v7);
    swift_storeEnumTagMultiPayload();
    sub_6898(&qword_139278);
    sub_105AC(&qword_131628, &qword_131630);
    sub_C2C84();
    uint64_t v23 = v45;
    sub_E4C50();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    uint64_t v24 = sub_6898(&qword_1392A0);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v23, 0, 1, v24);
    sub_10250(v23, (uint64_t)v15, &qword_139270);
    uint64_t v18 = v36;
  }
  else
  {
    uint64_t v35 = v7;
    uint64_t v18 = v36;
    if (*(unsigned char *)(a1 + 32))
    {
      uint64_t v25 = sub_6898(&qword_1392A0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v15, 1, 1, v25);
    }
    else
    {
      uint64_t v19 = sub_E51C0();
      uint64_t v20 = sub_E51B0();
      uint64_t KeyPath = swift_getKeyPath();
      *(void *)uint64_t v6 = v19;
      v6[8] = 1;
      *((void *)v6 + 2) = KeyPath;
      *((void *)v6 + 3) = v20;
      swift_storeEnumTagMultiPayload();
      sub_6898(&qword_139278);
      sub_105AC(&qword_131628, &qword_131630);
      sub_C2C84();
      sub_E4C50();
      uint64_t v22 = sub_6898(&qword_1392A0);
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v15, 0, 1, v22);
    }
  }
  uint64_t v37 = v15;
  uint64_t v26 = v45;
  sub_105F0((uint64_t)v15, v45, &qword_139270);
  *(void *)a2 = v18;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  uint64_t v27 = v39;
  uint64_t v28 = v40;
  *(void *)(a2 + 24) = v40;
  *(void *)(a2 + 32) = v16;
  char v29 = v38;
  *(void *)(a2 + 40) = v38;
  *(void *)(a2 + 48) = v27;
  uint64_t v31 = v42;
  uint64_t v30 = v43;
  *(void *)(a2 + 56) = v43;
  *(void *)(a2 + 64) = v31;
  char v32 = v41;
  *(unsigned char *)(a2 + 72) = v41;
  *(void *)(a2 + 80) = v44;
  *(void *)(a2 + 88) = 0;
  *(unsigned char *)(a2 + 96) = 1;
  uint64_t v33 = sub_6898(&qword_1392A8);
  sub_105F0(v26, a2 + *(int *)(v33 + 64), &qword_139270);
  sub_AE968(v28, v16, v29, v27);
  sub_FA04(v30, v31, v32);
  swift_bridgeObjectRetain();
  sub_102B4((uint64_t)v37, &qword_139270);
  sub_102B4(v26, &qword_139270);
  sub_AE9AC(v28, v16, v29, v27);
  sub_EF0C(v30, v31, v32);
  return swift_bridgeObjectRelease();
}

uint64_t sub_BE688@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v3 = a1[1];
  if (!v3) {
    goto LABEL_6;
  }
  uint64_t v4 = HIBYTE(v3) & 0xF;
  if ((v3 & 0x2000000000000000) == 0) {
    uint64_t v4 = *a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v4)
  {
    sub_E3F8();
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_E4F60();
    uint64_t v29 = v6;
    uint64_t v30 = v5;
    uint64_t v27 = v7 & 1;
    uint64_t v28 = v8;
  }
  else
  {
LABEL_6:
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = 0;
  }
  sub_E3F8();
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_E4F60();
  uint64_t v11 = v10;
  char v13 = v12 & 1;
  sub_E51B0();
  uint64_t v14 = sub_E4F20();
  uint64_t v16 = v15;
  char v18 = v17;
  swift_release();
  sub_EF0C(v9, v11, v13);
  swift_bridgeObjectRelease();
  sub_E4E90();
  uint64_t v19 = sub_E4F40();
  uint64_t v21 = v20;
  char v23 = v22;
  uint64_t v25 = v24;
  swift_release();
  sub_EF0C(v14, v16, v18 & 1);
  swift_bridgeObjectRelease();
  *(void *)a2 = v30;
  *(void *)(a2 + 8) = v29;
  *(void *)(a2 + 16) = v27;
  *(void *)(a2 + 24) = v28;
  *(void *)(a2 + 32) = v19;
  *(void *)(a2 + 40) = v21;
  *(unsigned char *)(a2 + 48) = v23 & 1;
  *(void *)(a2 + 56) = v25;
  sub_AE968(v30, v29, v27, v28);
  sub_FA04(v19, v21, v23 & 1);
  swift_bridgeObjectRetain();
  sub_EF0C(v19, v21, v23 & 1);
  swift_bridgeObjectRelease();
  return sub_AE9AC(v30, v29, v27, v28);
}

uint64_t sub_BE884@<X0>(uint64_t a1@<X8>)
{
  return sub_BDE8C(a1);
}

uint64_t sub_BE8C8(uint64_t a1, unint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v10 = sub_E4320();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  char v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  v14._rawValue = a5;
  uint64_t result = sub_BEBB8(a3, a4, v14);
  if (result == 13)
  {
    if (qword_131238 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_67B4(v10, (uint64_t)qword_148D58);
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v16, v10);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    char v17 = sub_E4300();
    os_log_type_t v18 = sub_E5880();
    int v19 = v18;
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v20 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t v24 = v22;
      *(_DWORD *)uint64_t v20 = 136315394;
      HIDWORD(v21) = v19;
      swift_bridgeObjectRetain();
      uint64_t v23 = sub_57A98(a1, a2, &v24);
      sub_E5900();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v20 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v23 = sub_57A98(a3, (unint64_t)a4, &v24);
      sub_E5900();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&def_66DD4, v17, BYTE4(v21), "Rule Layout %s unknown %s enum", (uint8_t *)v20, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    return 12;
  }
  return result;
}

uint64_t sub_BEBB8(uint64_t a1, void *a2, Swift::OpaquePointer a3)
{
  v7._uint64_t countAndFlagsBits = a1;
  v7._object = a2;
  unint64_t v5 = sub_E5AF0(a3, v7);
  swift_bridgeObjectRelease();
  if (v5 >= 0xD) {
    return 13;
  }
  else {
    return v5;
  }
}

uint64_t sub_BEC04()
{
  sub_6A34(v0 + 16);
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 96, 7);
}

uint64_t sub_BEC54()
{
  return sub_B873C((uint64_t)(v0 + 2), v0[7], v0[8], v0[9], v0[10], v0[11]);
}

uint64_t sub_BEC68@<X0>(unsigned char *a1@<X8>)
{
  return sub_EB4C(a1);
}

uint64_t sub_BEC7C()
{
  return sub_EBDC();
}

uint64_t sub_BEC90@<X0>(unsigned char *a1@<X8>)
{
  return sub_EB4C(a1);
}

uint64_t sub_BECA4()
{
  return sub_EBDC();
}

uint64_t sub_BECB8@<X0>(void *a1@<X8>)
{
  return sub_AB2C(a1);
}

uint64_t sub_BECCC()
{
  return sub_ABBC();
}

uint64_t sub_BECE0@<X0>(unsigned char *a1@<X8>)
{
  return sub_EB4C(a1);
}

uint64_t sub_BECF4()
{
  return sub_EBDC();
}

uint64_t sub_BED08@<X0>(unsigned char *a1@<X8>)
{
  return sub_EB4C(a1);
}

uint64_t sub_BED1C()
{
  return sub_EBDC();
}

uint64_t sub_BED30@<X0>(void *a1@<X8>)
{
  return sub_AB2C(a1);
}

uint64_t sub_BED44()
{
  return sub_ABBC();
}

uint64_t sub_BED58@<X0>(void *a1@<X8>)
{
  return sub_AB2C(a1);
}

uint64_t sub_BED6C()
{
  return sub_ABBC();
}

uint64_t sub_BED80@<X0>(void *a1@<X8>)
{
  return sub_AB2C(a1);
}

uint64_t sub_BED94()
{
  return sub_ABBC();
}

uint64_t sub_BEDA8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_E4B20();
  *a1 = result & 1;
  return result;
}

uint64_t sub_BEDD8()
{
  return sub_E4B30();
}

unsigned char *sub_BEE00(unsigned char *result, char a2)
{
  *result &= a2 ^ 1;
  return result;
}

char *sub_BEE14(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, char *a6)
{
  uint64_t v150 = a5;
  uint64_t v123 = a4;
  uint64_t v145 = a3;
  uint64_t v149 = a2;
  uint64_t v135 = *(void *)a6;
  uint64_t v140 = sub_6898(&qword_139110);
  uint64_t v141 = *(void *)(v140 - 8);
  __chkstk_darwin(v140);
  Swift::String v139 = (char *)&v104 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v138 = sub_6898(&qword_139118);
  uint64_t v137 = *(void *)(v138 - 8);
  uint64_t v9 = __chkstk_darwin(v138);
  Swift::String v136 = (char *)&v104 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v132 = (char *)&v104 - v11;
  uint64_t v133 = sub_6898(&qword_139120);
  uint64_t v134 = *(void *)(v133 - 8);
  __chkstk_darwin(v133);
  Swift::String v131 = (char *)&v104 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v129 = sub_6898(&qword_131D28);
  uint64_t v128 = *(void *)(v129 - 8);
  uint64_t v13 = __chkstk_darwin(v129);
  uint64_t v127 = (char *)&v104 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v126 = (char *)&v104 - v15;
  uint64_t v146 = sub_6898(&qword_1331E8);
  uint64_t v130 = *(void *)(v146 - 8);
  uint64_t v16 = __chkstk_darwin(v146);
  id v119 = (char *)&v104 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v116 = (char *)&v104 - v19;
  __chkstk_darwin(v18);
  Swift::String v144 = (char *)&v104 - v20;
  uint64_t v120 = sub_6898(&qword_139128);
  __chkstk_darwin(v120);
  uint64_t v115 = (char *)&v104 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v121 = sub_6898(&qword_139130);
  uint64_t v122 = *(void *)(v121 - 8);
  __chkstk_darwin(v121);
  uint64_t v117 = (char *)&v104 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = sub_6898(&qword_139138);
  uint64_t v125 = *(void *)(v124 - 8);
  __chkstk_darwin(v124);
  unint64_t v118 = (char *)&v104 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v147 = sub_6898(&qword_134908);
  uint64_t v114 = *(void *)(v147 - 8);
  __chkstk_darwin(v147);
  uint64_t v113 = (char *)&v104 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v148 = sub_6898(&qword_131488);
  uint64_t v112 = *(void *)(v148 - 8);
  __chkstk_darwin(v148);
  v111 = (char *)&v104 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v143 = sub_6898(&qword_1342D8);
  uint64_t v109 = *(void *)(v143 - 8);
  __chkstk_darwin(v143);
  Swift::String v108 = (char *)&v104 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v142 = sub_6898(&qword_131480);
  uint64_t v107 = *(void *)(v142 - 8);
  __chkstk_darwin(v142);
  Swift::String v106 = (char *)&v104 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = sub_6898(&qword_1383A0);
  uint64_t v104 = *(void *)(v105 - 8);
  __chkstk_darwin(v105);
  uint64_t v29 = (char *)&v104 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_6898(&qword_138398);
  uint64_t v110 = v30;
  uint64_t v31 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  uint64_t v33 = (char *)&v104 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_6898(&qword_131D08);
  uint64_t v151 = v34;
  uint64_t v35 = *(void *)(v34 - 8);
  __chkstk_darwin(v34);
  uint64_t v37 = (char *)&v104 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  v154[3] = type metadata accessor for MSRepositoryDefault();
  v154[4] = &off_124FE8;
  v154[0] = a1;
  uint64_t v38 = &a6[OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel__ruleName];
  v152._uint64_t countAndFlagsBits = 0;
  v152._object = (void *)0xE000000000000000;
  sub_E4570();
  uint64_t v39 = *(void (**)(char *, char *, uint64_t))(v35 + 32);
  v39(v38, v37, v34);
  uint64_t v40 = &a6[OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel__selectedAction];
  int v41 = a6;
  LOBYTE(v152._countAndFlagsBits) = 0;
  sub_E4570();
  (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v40, v33, v30);
  uint64_t v42 = &a6[OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel__selectedCondition];
  LOBYTE(v152._countAndFlagsBits) = 0;
  sub_E4570();
  (*(void (**)(char *, char *, uint64_t))(v104 + 32))(v42, v29, v105);
  uint64_t v43 = &a6[OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel__conditionValue];
  v152._uint64_t countAndFlagsBits = 0;
  v152._object = (void *)0xE000000000000000;
  sub_E4570();
  uint64_t v44 = v151;
  v39(v43, v37, v151);
  uint64_t v45 = &v41[OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel__actionEmailValue];
  v152._uint64_t countAndFlagsBits = 0;
  v152._object = (void *)0xE000000000000000;
  sub_E4570();
  v39(v45, v37, v44);
  uint64_t v46 = &v41[OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel__actionFolderValue];
  v152._uint64_t countAndFlagsBits = 0;
  v152._object = (void *)0xE000000000000000;
  sub_E4570();
  v39(v46, v37, v44);
  unsigned __int8 v47 = &v41[OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel__conditionGreyText];
  type metadata accessor for MAPreferencesViewProvider();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v49 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v152._uint64_t countAndFlagsBits = 2777980912;
  v152._object = (void *)0xA400000000000000;
  v155._uint64_t countAndFlagsBits = 0x6F697469646E6F43;
  v155._object = (void *)0xE90000000000006ELL;
  sub_E5690(v155);
  v156._uint64_t countAndFlagsBits = 2777980912;
  v156._object = (void *)0xA400000000000000;
  sub_E5690(v156);
  v103._uint64_t countAndFlagsBits = 0xE000000000000000;
  v157._uint64_t countAndFlagsBits = 0x6F697469646E6F43;
  v157._object = (void *)0xE90000000000006ELL;
  v158.value._uint64_t countAndFlagsBits = 0;
  v158.value._object = 0;
  v50.super.isa = v49;
  uint64_t v51 = sub_E3FE0(v157, v158, v50, v152, v103);
  uint64_t v53 = v52;

  swift_bridgeObjectRelease();
  v152._uint64_t countAndFlagsBits = v51;
  v152._object = v53;
  sub_E4570();
  v39(v47, v37, v44);
  Swift::String v54 = &v41[OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel__enableActionFolderMenu];
  LOBYTE(v152._countAndFlagsBits) = 1;
  Swift::String v55 = v106;
  sub_E4570();
  Swift::String v56 = *(void (**)(char *, char *, uint64_t))(v107 + 32);
  uint64_t v57 = v142;
  v56(v54, v55, v142);
  Swift::String_optional v58 = &v41[OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel__enableActionEmailInput];
  LOBYTE(v152._countAndFlagsBits) = 0;
  sub_E4570();
  Swift::String v59 = v58;
  NSBundle v60 = v55;
  uint64_t v61 = v55;
  uint64_t v62 = v57;
  v56(v59, v60, v57);
  uint64_t v63 = &v41[OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel__loadingState];
  Swift::String v152 = (Swift::String)0;
  unint64_t v64 = v108;
  sub_E4570();
  uint64_t v65 = *(void (**)(char *, char *, uint64_t))(v109 + 32);
  v65(v63, v64, v143);
  Swift::String v66 = &v41[OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel__isUpdating];
  LOBYTE(v152._countAndFlagsBits) = 0;
  sub_E4570();
  v56(v66, v61, v62);
  uint64_t v67 = &v41[OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel__isDoneDisabled];
  LOBYTE(v152._countAndFlagsBits) = 0;
  sub_E4570();
  v56(v67, v61, v62);
  unint64_t v68 = &v41[OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel__state];
  Swift::String v152 = (Swift::String)0;
  sub_E4570();
  uint64_t v69 = v143;
  v65(v68, v64, v143);
  uint64_t v70 = &v41[OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel__folderState];
  Swift::String v152 = (Swift::String)0;
  sub_E4570();
  v65(v70, v64, v69);
  *(void *)&v41[OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel_maxTitleLength] = 30;
  *(void *)&v41[OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel_maxBodyLength] = 90;
  *(void *)&v41[OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel_maxTargetLength] = 90;
  uint64_t v71 = &v41[OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel_trashFolderName];
  *(void *)uint64_t v71 = 0xD000000000000010;
  *((void *)v71 + 1) = 0x80000000000F3820;
  uint64_t v72 = &v41[OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel_sentFolderName];
  strcpy(&v41[OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel_sentFolderName], "Sent Messages");
  *((_WORD *)v72 + 7) = -4864;
  unint64_t v73 = &v41[OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel__error];
  Swift::String v152 = (Swift::String)0;
  memset(v153, 0, 25);
  sub_6898(&qword_1312F8);
  char v74 = v111;
  sub_E4570();
  (*(void (**)(char *, char *, uint64_t))(v112 + 32))(v73, v74, v148);
  Swift::String v75 = &v41[OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel__inlineErrorMessage];
  Swift::String v152 = (Swift::String)0;
  uint64_t v143 = sub_6898(&qword_1331D8);
  unint64_t v76 = v113;
  sub_E4570();
  (*(void (**)(char *, char *, uint64_t))(v114 + 32))(v75, v76, v147);
  *(void *)&v41[OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel_cancellables] = &_swiftEmptySetSingleton;
  *(void *)&v41[OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel_folderListPublisher] = 0;
  sub_338A0((uint64_t)v154, (uint64_t)&v41[OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel_repository]);
  unint64_t v77 = &v41[OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel_onDone];
  uint64_t v78 = v149;
  uint64_t v79 = v150;
  *(void *)unint64_t v77 = v123;
  *((void *)v77 + 1) = v79;
  NSBundle v80 = &v41[OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel_title];
  *(void *)NSBundle v80 = 0x5445445F454C5552;
  *((void *)v80 + 1) = 0xEB000000004C4941;
  *(void *)&v41[OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel_folderList] = v78;
  *(void *)&v41[OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel_sharedPreference] = v145;
  swift_beginAccess();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_E4580();
  swift_endAccess();
  swift_beginAccess();
  sub_E4580();
  swift_endAccess();
  swift_beginAccess();
  sub_E4580();
  swift_endAccess();
  swift_beginAccess();
  sub_E4580();
  swift_endAccess();
  uint64_t v123 = &protocol conformance descriptor for Published<A>.Publisher;
  sub_105AC(&qword_139140, &qword_139128);
  sub_105AC(&qword_137918, &qword_1331E8);
  uint64_t v81 = v117;
  sub_E44E0();
  sub_105AC(&qword_139148, &qword_139130);
  uint64_t v82 = v118;
  uint64_t v83 = v121;
  sub_E4600();
  (*(void (**)(char *, uint64_t))(v122 + 8))(v81, v83);
  swift_beginAccess();
  uint64_t v84 = v126;
  sub_E4580();
  swift_endAccess();
  sub_105AC(&qword_139150, &qword_139138);
  uint64_t v85 = v124;
  sub_E4660();
  (*(void (**)(char *, uint64_t))(v125 + 8))(v82, v85);
  uint64_t v86 = v128;
  uint64_t v87 = v129;
  (*(void (**)(char *, char *, uint64_t))(v128 + 16))(v127, v84, v129);
  swift_beginAccess();
  sub_E4590();
  swift_endAccess();
  (*(void (**)(char *, uint64_t))(v86 + 8))(v84, v87);
  swift_beginAccess();
  uint64_t v88 = v144;
  sub_E4580();
  swift_endAccess();
  *(void *)(swift_allocObject() + 16) = v135;
  uint64_t v89 = v131;
  uint64_t v90 = v146;
  sub_E4600();
  swift_release();
  (*(void (**)(char *, uint64_t))(v130 + 8))(v88, v90);
  swift_beginAccess();
  uint64_t v91 = v132;
  sub_E4580();
  swift_endAccess();
  sub_105AC(&qword_139158, &qword_139120);
  uint64_t v92 = v133;
  sub_E4660();
  (*(void (**)(char *, uint64_t))(v134 + 8))(v89, v92);
  uint64_t v93 = v137;
  uint64_t v94 = v138;
  (*(void (**)(char *, char *, uint64_t))(v137 + 16))(v136, v91, v138);
  swift_beginAccess();
  sub_E4590();
  swift_endAccess();
  (*(void (**)(char *, uint64_t))(v93 + 8))(v91, v94);
  swift_beginAccess();
  uint64_t v95 = v139;
  sub_E4580();
  swift_endAccess();
  sub_105AC(&qword_139160, &qword_139110);
  swift_retain();
  uint64_t v96 = v140;
  sub_E4650();
  swift_release();
  (*(void (**)(char *, uint64_t))(v141 + 8))(v95, v96);
  swift_beginAccess();
  sub_E44F0();
  swift_endAccess();
  swift_release();
  sub_E4530();
  if (v152._object == (char *)&def_66DD4 + 1)
  {
    swift_release();
    swift_release();
    swift_release();
LABEL_15:
    sub_6A34((uint64_t)v154);
    return v41;
  }
  long long v97 = *(_OWORD *)v153;
  uint64_t v98 = *(void *)&v153[24];
  if (*(void *)&v153[24])
  {
    uint64_t v99 = HIBYTE(*(void *)&v153[24]) & 0xFLL;
    if ((*(void *)&v153[24] & 0x2000000000000000) == 0) {
      uint64_t v99 = *(void *)&v153[16] & 0xFFFFFFFFFFFFLL;
    }
    if (v99)
    {
      unint64_t v100 = &v41[OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel_sentFolderName];
      *(void *)unint64_t v100 = *(void *)&v153[16];
      *((void *)v100 + 1) = v98;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
  }
  swift_release();
  swift_release();
  swift_release();
  if (!*((void *)&v97 + 1))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((*((void *)&v97 + 1) & 0x2000000000000000) != 0) {
    uint64_t v101 = HIBYTE(*((void *)&v97 + 1)) & 0xFLL;
  }
  else {
    uint64_t v101 = v97 & 0xFFFFFFFFFFFFLL;
  }
  sub_6A34((uint64_t)v154);
  if (v101) {
    *(_OWORD *)&v41[OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel_trashFolderName] = v97;
  }
  swift_bridgeObjectRelease();
  return v41;
}

char *sub_C04DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, char *a7)
{
  v41[3] = type metadata accessor for MSRepositoryDefault();
  v41[4] = &off_124FE8;
  v41[0] = a4;
  uint64_t v14 = &a7[qword_148E80];
  long long v15 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)uint64_t v14 = *(_OWORD *)a1;
  *((_OWORD *)v14 + 1) = v15;
  *((void *)v14 + 12) = *(void *)(a1 + 96);
  long long v16 = *(_OWORD *)(a1 + 80);
  *((_OWORD *)v14 + 4) = *(_OWORD *)(a1 + 64);
  *((_OWORD *)v14 + 5) = v16;
  long long v17 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v14 + 2) = *(_OWORD *)(a1 + 32);
  *((_OWORD *)v14 + 3) = v17;
  sub_338A0((uint64_t)v41, (uint64_t)&v39);
  uint64_t v18 = sub_33904((uint64_t)&v39, v40);
  __chkstk_darwin(v18);
  uint64_t v20 = (uint64_t *)((char *)&v38 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v21 + 16))(v20);
  uint64_t v22 = *v20;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_8DAEC(a1);
  uint64_t v23 = sub_BEE14(v22, a2, a3, a5, a6, a7);
  sub_6A34((uint64_t)&v39);
  if (*(void *)(a1 + 88))
  {
    uint64_t v24 = *(void *)(a1 + 80);
    unint64_t v25 = *(void *)(a1 + 88);
  }
  else
  {
    uint64_t v24 = 0;
    unint64_t v25 = 0xE000000000000000;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  *(void *)&long long v39 = v24;
  *((void *)&v39 + 1) = v25;
  swift_retain_n();
  swift_bridgeObjectRetain();
  sub_E45C0();
  uint64_t v26 = *(void *)(a1 + 16);
  uint64_t v27 = *(void **)(a1 + 24);
  swift_retain();
  swift_bridgeObjectRetain();
  char v28 = sub_8F874(v26, v27);
  if (v28 == 6) {
    char v29 = 0;
  }
  else {
    char v29 = v28;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v39) = v29;
  sub_E45C0();
  uint64_t v30 = *(void *)(a1 + 48);
  uint64_t v31 = *(void **)(a1 + 56);
  swift_retain();
  swift_bridgeObjectRetain();
  char v32 = sub_8F868(v30, v31);
  if (v32 == 7) {
    char v33 = 0;
  }
  else {
    char v33 = v32;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v39) = v33;
  sub_E45C0();
  long long v39 = *(_OWORD *)(a1 + 32);
  swift_getKeyPath();
  swift_getKeyPath();
  long long v38 = v39;
  swift_retain();
  sub_5F47C((uint64_t)&v39);
  sub_E45C0();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_E45B0();
  swift_release();
  swift_release();
  swift_release();
  if (v38 <= 6u && ((1 << v38) & 0x55) != 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_E45B0();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v34 = *(void *)(a1 + 72);
    if ((v38 & 0xFB) != 0)
    {
      if (v34)
      {
        uint64_t v35 = *(void *)(a1 + 64);
        unint64_t v36 = *(void *)(a1 + 72);
      }
      else
      {
        uint64_t v35 = 0;
        unint64_t v36 = 0xE000000000000000;
      }
    }
    else if (v34)
    {
      uint64_t v35 = *(void *)(a1 + 64);
      unint64_t v36 = *(void *)(a1 + 72);
    }
    else
    {
      uint64_t v35 = 0;
      unint64_t v36 = 0xE000000000000000;
    }
    swift_retain();
    swift_bridgeObjectRetain();
    sub_A589C(a1);
    swift_getKeyPath();
    swift_getKeyPath();
    *(void *)&long long v38 = v35;
    *((void *)&v38 + 1) = v36;
    sub_E45C0();
  }
  else
  {
    sub_A589C(a1);
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_6A34((uint64_t)v41);
  return v23;
}

char *sub_C09A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  v23[3] = type metadata accessor for MSRepositoryDefault();
  v23[4] = &off_124FE8;
  v23[0] = a1;
  sub_6898(&qword_139108);
  uint64_t v12 = (char *)swift_allocObject();
  *(void *)&v12[qword_138EB8] = a4;
  sub_338A0((uint64_t)v23, (uint64_t)v21);
  uint64_t v13 = sub_33904((uint64_t)v21, v22);
  __chkstk_darwin(v13);
  long long v15 = (uint64_t *)&v21[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(uint64_t *))(v16 + 16))(v15);
  uint64_t v17 = *v15;
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v18 = sub_BEE14(v17, a2, a3, a5, a6, v12);
  sub_6A34((uint64_t)v21);
  swift_retain();
  swift_release();
  swift_release();
  swift_release();
  sub_6A34((uint64_t)v23);
  uint64_t v19 = &v18[OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel_title];
  *(void *)uint64_t v19 = 0xD000000000000013;
  *((void *)v19 + 1) = 0x80000000000F6EA0;
  swift_release();
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t sub_C0B90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v48 = a6;
  uint64_t v47 = a5;
  uint64_t v50 = a4;
  uint64_t v49 = a3;
  uint64_t v46 = a2;
  uint64_t v45 = sub_6898(&qword_131488);
  uint64_t v44 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  uint64_t v43 = (char *)v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_6898(&qword_131480);
  uint64_t v41 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  uint64_t v11 = (char *)v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_6898(&qword_1342E8);
  uint64_t v51 = *(void *)(v40 - 8);
  __chkstk_darwin(v40);
  uint64_t v13 = (char *)v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_6898(&qword_1342E0);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_6898(&qword_1342D8);
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)v39 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58[3] = type metadata accessor for MSRepositoryDefault();
  v58[4] = &off_124FE8;
  v58[0] = a1;
  uint64_t v22 = a7 + OBJC_IVAR____TtCV18icloudMailSettings11MSRulesView9ViewModel__state;
  long long v52 = 0uLL;
  sub_E4570();
  (*(void (**)(uint64_t, char *, uint64_t))(v19 + 32))(v22, v21, v18);
  uint64_t v23 = a7 + OBJC_IVAR____TtCV18icloudMailSettings11MSRulesView9ViewModel__rules;
  *(void *)&long long v52 = _swiftEmptyArrayStorage;
  sub_6898(&qword_134000);
  sub_E4570();
  (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(v23, v17, v14);
  uint64_t v24 = a7 + OBJC_IVAR____TtCV18icloudMailSettings11MSRulesView9ViewModel__selectedRuleToEdit;
  uint64_t v57 = 0;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v54 = 0u;
  long long v52 = 0u;
  memset(v53, 0, sizeof(v53));
  v39[1] = sub_6898((uint64_t *)&unk_134010);
  sub_E4570();
  unint64_t v25 = *(void (**)(uint64_t, char *, uint64_t))(v51 + 32);
  v51 += 32;
  uint64_t v26 = v40;
  v25(v24, v13, v40);
  uint64_t v27 = a7 + OBJC_IVAR____TtCV18icloudMailSettings11MSRulesView9ViewModel__deleteDisabled;
  LOBYTE(v52) = 0;
  sub_E4570();
  char v28 = *(void (**)(uint64_t, char *, uint64_t))(v41 + 32);
  uint64_t v29 = v42;
  v28(v27, v11, v42);
  uint64_t v30 = a7 + OBJC_IVAR____TtCV18icloudMailSettings11MSRulesView9ViewModel__moveDisabled;
  LOBYTE(v52) = 0;
  sub_E4570();
  v28(v30, v11, v29);
  uint64_t v31 = a7 + OBJC_IVAR____TtCV18icloudMailSettings11MSRulesView9ViewModel__enableAddRule;
  LOBYTE(v52) = 1;
  sub_E4570();
  v28(v31, v11, v29);
  uint64_t v32 = a7 + OBJC_IVAR____TtCV18icloudMailSettings11MSRulesView9ViewModel__selectedRuleToDelete;
  uint64_t v57 = 0;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v54 = 0u;
  long long v52 = 0u;
  memset(v53, 0, sizeof(v53));
  sub_E4570();
  v25(v32, v13, v26);
  uint64_t v33 = a7 + OBJC_IVAR____TtCV18icloudMailSettings11MSRulesView9ViewModel__error;
  long long v52 = 0u;
  memset(v53, 0, 25);
  sub_6898(&qword_1312F8);
  uint64_t v34 = v43;
  sub_E4570();
  (*(void (**)(uint64_t, char *, uint64_t))(v44 + 32))(v33, v34, v45);
  uint64_t v35 = (void *)(a7 + OBJC_IVAR____TtCV18icloudMailSettings11MSRulesView9ViewModel_rowSize);
  *uint64_t v35 = 0;
  v35[1] = 0;
  *(void *)(a7 + OBJC_IVAR____TtCV18icloudMailSettings11MSRulesView9ViewModel_mailRuleResponse) = 0;
  *(void *)(a7 + OBJC_IVAR____TtCV18icloudMailSettings11MSRulesView9ViewModel_cancellables) = &_swiftEmptySetSingleton;
  *(void *)(a7 + OBJC_IVAR____TtCV18icloudMailSettings11MSRulesView9ViewModel_batchRequest) = 0;
  *(unsigned char *)(a7 + OBJC_IVAR____TtCV18icloudMailSettings11MSRulesView9ViewModel_reSequeceFlag) = 0;
  *(void *)(a7 + OBJC_IVAR____TtCV18icloudMailSettings11MSRulesView9ViewModel_refreshPublisher) = 0;
  sub_338A0((uint64_t)v58, a7 + OBJC_IVAR____TtCV18icloudMailSettings11MSRulesView9ViewModel_repository);
  *(void *)(a7 + OBJC_IVAR____TtCV18icloudMailSettings11MSRulesView9ViewModel_maxRuleCountAllowed) = v46;
  unint64_t v36 = (void *)(a7 + OBJC_IVAR____TtCV18icloudMailSettings11MSRulesView9ViewModel_onUpdate);
  uint64_t v37 = v48;
  *unint64_t v36 = v47;
  v36[1] = v37;
  *(void *)(a7 + OBJC_IVAR____TtCV18icloudMailSettings11MSRulesView9ViewModel_sharedPreference) = v49;
  *(void *)(a7 + OBJC_IVAR____TtCV18icloudMailSettings11MSRulesView9ViewModel_folderList) = v50;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_3B580();
  sub_6A34((uint64_t)v58);
  return a7;
}

uint64_t sub_C1218@<X0>(uint64_t a1@<X8>)
{
  return sub_B9C50(a1);
}

unint64_t sub_C1220()
{
  unint64_t result = qword_139060;
  if (!qword_139060)
  {
    sub_62A4(&qword_139058);
    sub_75D28();
    sub_105AC(&qword_139068, &qword_139070);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139060);
  }
  return result;
}

uint64_t sub_C12C8@<X0>(uint64_t a1@<X8>)
{
  return sub_BAADC(a1);
}

unint64_t sub_C12D0()
{
  unint64_t result = qword_139088;
  if (!qword_139088)
  {
    sub_62A4(&qword_139080);
    sub_C2118(&qword_139090, (void (*)(uint64_t))&type metadata accessor for EditButton);
    sub_105AC(&qword_131648, &qword_131650);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139088);
  }
  return result;
}

uint64_t sub_C13A0()
{
  return sub_E4B00();
}

unint64_t sub_C13C8()
{
  unint64_t result = qword_1390A0;
  if (!qword_1390A0)
  {
    sub_62A4(&qword_139028);
    sub_62A4(&qword_139018);
    sub_62A4(&qword_139080);
    sub_62A4(&qword_138E48);
    sub_62A4(&qword_131570);
    sub_B5B1C();
    sub_E44C();
    sub_105AC((unint64_t *)&qword_1315D0, &qword_131570);
    swift_getOpaqueTypeConformance2();
    sub_C12D0();
    swift_getOpaqueTypeConformance2();
    sub_105AC(&qword_1390A8, &qword_139098);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1390A0);
  }
  return result;
}

uint64_t sub_C1560(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MSRulesView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_C15C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MSRulesView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_C162C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for MSRulesView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_BAEDC(a1, v6, a2);
}

unint64_t sub_C16AC()
{
  unint64_t result = qword_1390B8;
  if (!qword_1390B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1390B8);
  }
  return result;
}

uint64_t sub_C1700(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_C1788@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for MSRulesView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_BC100(v4, a1);
}

uint64_t sub_C17FC()
{
  type metadata accessor for MSRulesView();

  return sub_BC518();
}

uint64_t sub_C187C@<X0>(unsigned char *a1@<X8>)
{
  return sub_EB4C(a1);
}

uint64_t sub_C18A4()
{
  return sub_EBDC();
}

uint64_t sub_C18CC@<X0>(unsigned char *a1@<X8>)
{
  return sub_EB4C(a1);
}

uint64_t sub_C18F4()
{
  return sub_EBDC();
}

uint64_t sub_C1920()
{
  return sub_C1FA4((uint64_t (*)(uint64_t))sub_BC448);
}

unint64_t sub_C1938()
{
  unint64_t result = qword_1390F8;
  if (!qword_1390F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1390F8);
  }
  return result;
}

uint64_t sub_C198C()
{
  return _swift_deallocObject(v0, 24, 7);
}

void *sub_C199C@<X0>(void *result@<X0>, uint64_t *a2@<X8>)
{
  return sub_9C810(result, a2);
}

uint64_t sub_C19A4(uint64_t result)
{
  return sub_9CA3C(result);
}

uint64_t sub_C19B0()
{
  return sub_C1FA4((uint64_t (*)(uint64_t))sub_BB244);
}

uint64_t sub_C19C8@<X0>(void *a1@<X8>)
{
  return sub_AB2C(a1);
}

uint64_t sub_C19F0()
{
  return sub_ABBC();
}

uint64_t sub_C1A18@<X0>(unsigned char *a1@<X8>)
{
  return sub_EB4C(a1);
}

uint64_t sub_C1A40()
{
  return sub_EBDC();
}

uint64_t sub_C1A68@<X0>(unsigned char *a1@<X8>)
{
  return sub_EB4C(a1);
}

uint64_t sub_C1A90()
{
  return sub_EBDC();
}

uint64_t sub_C1AB8@<X0>(void *a1@<X8>)
{
  return sub_AB2C(a1);
}

uint64_t sub_C1AE0()
{
  return sub_ABBC();
}

uint64_t sub_C1B08@<X0>(void *a1@<X8>)
{
  return sub_AB2C(a1);
}

uint64_t sub_C1B30()
{
  return sub_ABBC();
}

uint64_t sub_C1B58@<X0>(void *a1@<X8>)
{
  return sub_AB2C(a1);
}

uint64_t sub_C1B80()
{
  return sub_ABBC();
}

uint64_t sub_C1BA8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_E4B20();
  *a1 = result & 1;
  return result;
}

uint64_t sub_C1BD8()
{
  return sub_E4B30();
}

uint64_t sub_C1C00()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_C1C10(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_C1C30@<X0>(uint64_t a1@<X8>)
{
  return sub_BC7B0(*(void *)(v1 + 16), a1);
}

unint64_t sub_C1C38()
{
  unint64_t result = qword_139190;
  if (!qword_139190)
  {
    sub_62A4(&qword_139188);
    sub_C1CD8();
    sub_105AC(&qword_139210, &qword_139218);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139190);
  }
  return result;
}

unint64_t sub_C1CD8()
{
  unint64_t result = qword_139198;
  if (!qword_139198)
  {
    sub_62A4(&qword_1391A0);
    sub_C1D78();
    sub_105AC(&qword_139200, &qword_139208);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139198);
  }
  return result;
}

unint64_t sub_C1D78()
{
  unint64_t result = qword_1391A8;
  if (!qword_1391A8)
  {
    sub_62A4(&qword_1391B0);
    sub_C1E18();
    sub_105AC(&qword_1391F0, &qword_1391F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1391A8);
  }
  return result;
}

unint64_t sub_C1E18()
{
  unint64_t result = qword_1391B8;
  if (!qword_1391B8)
  {
    sub_62A4(&qword_1391C0);
    sub_C1EB8();
    sub_105AC(&qword_1391E0, &qword_1391E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1391B8);
  }
  return result;
}

unint64_t sub_C1EB8()
{
  unint64_t result = qword_1391C8;
  if (!qword_1391C8)
  {
    sub_62A4(&qword_1391D0);
    sub_C1F2C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1391C8);
  }
  return result;
}

unint64_t sub_C1F2C()
{
  unint64_t result = qword_1391D8;
  if (!qword_1391D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1391D8);
  }
  return result;
}

uint64_t sub_C1F80@<X0>(uint64_t a1@<X8>)
{
  return sub_BD808(*(void *)(v1 + 16), a1);
}

uint64_t sub_C1F8C()
{
  return sub_C1FA4((uint64_t (*)(uint64_t))sub_BDE20);
}

uint64_t sub_C1FA4(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for MSRulesView() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

uint64_t sub_C2020(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MSRulesView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_C207C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_C2098@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for MSRulesView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_BCE70(a1, v6, a2);
}

uint64_t sub_C2118(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_C2164(char *a1, uint64_t a2)
{
  type metadata accessor for MSRulesView();

  return sub_BD544(a1, a2);
}

uint64_t sub_C21E4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_C221C(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(uint64_t, void))(v2 + 16))(a1, *a2);
}

uint64_t sub_C224C()
{
  uint64_t v1 = type metadata accessor for MSRulesView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = v0 + v3;
  sub_6898(&qword_1314A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_E47F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v3 + v4;
  sub_6E40();
  swift_release();
  uint64_t v8 = v5 + *(int *)(v1 + 28);
  uint64_t v9 = sub_E53E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  sub_6898(&qword_138F50);
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v7, v2 | 7);
}

uint64_t sub_C23EC(uint64_t a1)
{
  type metadata accessor for MSRulesView();

  return sub_BD614(a1);
}

uint64_t sub_C245C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_C248C()
{
  uint64_t v1 = type metadata accessor for MSRulesView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  sub_6898(&qword_1314A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_E47F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  unint64_t v6 = (v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_6E40();
  swift_release();
  uint64_t v7 = v0 + v3 + *(int *)(v1 + 28);
  uint64_t v8 = sub_E53E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  sub_6898(&qword_138F50);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, v6 + 8, v2 | 7);
}

uint64_t sub_C2648()
{
  type metadata accessor for MSRulesView();

  return sub_BD3D8();
}

uint64_t destroy for MSRulesView.NavigationLinkWSubtitle()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for MSRulesView.NavigationLinkWSubtitle(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for MSRulesView.NavigationLinkWSubtitle(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for MSRulesView.NavigationLinkWSubtitle(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for MSRulesView.NavigationLinkWSubtitle(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MSRulesView.NavigationLinkWSubtitle(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MSRulesView.NavigationLinkWSubtitle()
{
  return &type metadata for MSRulesView.NavigationLinkWSubtitle;
}

uint64_t sub_C291C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_C2B84()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_C2BA0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_C2BE8()
{
  if ((*(unsigned char *)(v0 + 49) & 1) == 0) {
    return (*(uint64_t (**)(void))(v0 + 56))();
  }
  return result;
}

uint64_t sub_C2C18@<X0>(uint64_t a1@<X8>)
{
  return sub_BE130(*(void *)(v1 + 16), a1);
}

uint64_t sub_C2C20(uint64_t a1)
{
  return a1;
}

uint64_t sub_C2C74()
{
  return _swift_deallocObject(v0, 17, 7);
}

unint64_t sub_C2C84()
{
  unint64_t result = qword_139280;
  if (!qword_139280)
  {
    sub_62A4(&qword_139278);
    sub_C2D24();
    sub_105AC(&qword_137D28, &qword_137D30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139280);
  }
  return result;
}

unint64_t sub_C2D24()
{
  unint64_t result = qword_139288;
  if (!qword_139288)
  {
    sub_62A4(&qword_139290);
    sub_C2DA0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139288);
  }
  return result;
}

unint64_t sub_C2DA0()
{
  unint64_t result = qword_139298;
  if (!qword_139298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139298);
  }
  return result;
}

unint64_t sub_C2DF8()
{
  unint64_t result = qword_1392B0;
  if (!qword_1392B0)
  {
    sub_62A4(&qword_139258);
    sub_C2E98();
    sub_105AC(&qword_131648, &qword_131650);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1392B0);
  }
  return result;
}

unint64_t sub_C2E98()
{
  unint64_t result = qword_1392B8;
  if (!qword_1392B8)
  {
    sub_62A4(&qword_139240);
    sub_105AC(&qword_1392C0, &qword_139238);
    sub_105AC(&qword_137D28, &qword_137D30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1392B8);
  }
  return result;
}

uint64_t sub_C2F64@<X0>(unsigned char *a1@<X8>)
{
  return sub_EB4C(a1);
}

uint64_t sub_C2F78()
{
  return sub_EBDC();
}

uint64_t sub_C2F8C@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_E45B0();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_C300C()
{
  return sub_E45C0();
}

uint64_t sub_C3090@<X0>(unsigned char *a1@<X8>)
{
  return sub_EB4C(a1);
}

uint64_t sub_C30A4()
{
  return sub_EBDC();
}

double sub_C30B8@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_E45B0();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = v6;
  return result;
}

uint64_t sub_C3148()
{
  return sub_E45C0();
}

uint64_t sub_C31F4()
{
  return sub_10BEC();
}

uint64_t sub_C3208()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_E45B0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_C327C()
{
  return sub_10BEC();
}

uint64_t sub_C3290()
{
  return sub_10BEC();
}

double sub_C32A4@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_E45B0();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = v6;
  return result;
}

uint64_t sub_C3330()
{
  return sub_10BEC();
}

uint64_t sub_C3344(uint64_t (*a1)(void), uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v32 = a1;
  uint64_t v33 = a2;
  uint64_t v4 = sub_E4320();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_E45B0();
  swift_release();
  swift_release();
  int v8 = v35[0];
  swift_getKeyPath();
  swift_getKeyPath();
  sub_E45B0();
  swift_release();
  swift_release();
  long long v9 = *(_OWORD *)v35;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_E45B0();
  swift_release();
  swift_release();
  int v10 = v35[0];
  v35[0] = v8;
  *(_OWORD *)&v35[8] = v9;
  v35[24] = v10;
  long long v36 = 0uLL;
  *(void *)uint64_t v37 = 1;
  memset(&v37[8], 0, 32);
  uint64_t v11 = (void *)(v3 + OBJC_IVAR____TtCV18icloudMailSettings17MailForwadingView9ViewModel_preferences);
  unint64_t v12 = *(void *)(v3 + OBJC_IVAR____TtCV18icloudMailSettings17MailForwadingView9ViewModel_preferences + 16);
  if (v12 == 1 || *v11 == 2 || v8 == ((*v11 & 1) == 0)) {
    goto LABEL_2;
  }
  unint64_t v25 = v11[1];
  uint64_t v26 = v11[3];
  int v31 = v26;
  if (v12) {
    unint64_t v27 = v25;
  }
  else {
    unint64_t v27 = 0;
  }
  if (v12) {
    unint64_t v28 = v12;
  }
  else {
    unint64_t v28 = 0xE000000000000000;
  }
  if (__PAIR128__(v28, v27) != v9)
  {
    char v29 = sub_E5C20();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if ((v29 & 1) == 0 || v31 == 2 || v10 == ((v26 & 1) == 0)) {
      goto LABEL_2;
    }
LABEL_22:
    swift_bridgeObjectRelease();
    sub_2245C(0, 0, 1);
    return v32(0);
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v31 != 2 && ((v10 ^ ((v26 & 1) == 0)) & 1) != 0) {
    goto LABEL_22;
  }
LABEL_2:
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v34) = 1;
  swift_retain();
  sub_E45C0();
  if (qword_131238 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_67B4(v4, (uint64_t)qword_148D58);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v13, v4);
  uint64_t v14 = sub_E4300();
  os_log_type_t v15 = sub_E5870();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&def_66DD4, v14, v15, "[Mail Forwarding] update started", v16, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_67EC((void *)(v3 + OBJC_IVAR____TtCV18icloudMailSettings17MailForwadingView9ViewModel_repository), *(void *)(v3 + OBJC_IVAR____TtCV18icloudMailSettings17MailForwadingView9ViewModel_repository + 24));
  uint64_t v34 = sub_8D29C((uint64_t)v35);
  uint64_t v17 = swift_allocObject();
  swift_weakInit();
  uint64_t v18 = swift_allocObject();
  long long v19 = *(_OWORD *)v37;
  *(_OWORD *)(v18 + 48) = v36;
  *(_OWORD *)(v18 + 64) = v19;
  *(_OWORD *)(v18 + 80) = *(_OWORD *)&v37[16];
  uint64_t v20 = *(void *)&v37[32];
  long long v21 = *(_OWORD *)&v35[16];
  *(_OWORD *)(v18 + 16) = *(_OWORD *)v35;
  *(_OWORD *)(v18 + 32) = v21;
  *(void *)(v18 + 96) = v20;
  *(void *)(v18 + 104) = v17;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v32;
  *(void *)(v22 + 24) = v33;
  swift_retain();
  sub_6898(&qword_1322D8);
  sub_15060();
  uint64_t v23 = sub_E4610();
  swift_release();
  swift_release();
  swift_release();
  *(void *)(v3 + OBJC_IVAR____TtCV18icloudMailSettings17MailForwadingView9ViewModel_cancellable) = v23;
  return swift_release();
}

uint64_t sub_C3880(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_E4320();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v48 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v40 - v10;
  uint64_t v13 = *(void *)a1;
  uint64_t v12 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v47 = *(void *)(a1 + 24);
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = a3 + 16;
  int v46 = *(unsigned __int8 *)(a1 + 40);
  if (v12)
  {
    uint64_t v44 = v15;
    uint64_t v45 = v14;
    swift_bridgeObjectRetain();
    sub_8DC80(a2);
    uint64_t v17 = sub_3AEDC();
    sub_C4668(a2);
    uint64_t v18 = &unk_131000;
    if (v17)
    {
      uint64_t v42 = sub_E5530();
      unint64_t v20 = v19;
      swift_bridgeObjectRelease();
      if (qword_131238 != -1) {
        swift_once();
      }
      uint64_t v21 = sub_67B4(v6, (uint64_t)qword_148D58);
      (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v11, v21, v6);
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_E4300();
      uint64_t v23 = v7;
      os_log_type_t v24 = sub_E5880();
      if (os_log_type_enabled(v22, v24))
      {
        uint64_t v25 = swift_slowAlloc();
        uint64_t v41 = (uint8_t *)v13;
        uint64_t v26 = (uint8_t *)v25;
        uint64_t v50 = swift_slowAlloc();
        uint64_t v43 = v23;
        *(_DWORD *)uint64_t v26 = 136642819;
        uint64_t v40 = v26 + 4;
        swift_bridgeObjectRetain();
        v56[0] = sub_57A98(v42, v20, &v50);
        sub_E5900();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&def_66DD4, v22, v24, "[Mail Forwarding] params: %{sensitive}s", v26, 0xCu);
        swift_arrayDestroy();
        uint64_t v18 = (void *)&unk_131000;
        swift_slowDealloc();
        uint64_t v13 = (uint64_t)v41;
        swift_slowDealloc();

        uint64_t v7 = v43;
        (*(void (**)(char *, uint64_t))(v43 + 8))(v11, v6);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v23 + 8))(v11, v6);
        uint64_t v7 = v23;
      }
    }
    if (v18[71] != -1) {
      swift_once();
    }
    uint64_t v27 = sub_67B4(v6, (uint64_t)qword_148D58);
    unint64_t v28 = v48;
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v48, v27, v6);
    swift_bridgeObjectRetain();
    char v29 = sub_E4300();
    os_log_type_t v30 = sub_E5880();
    if (os_log_type_enabled(v29, v30))
    {
      int v31 = (uint8_t *)swift_slowAlloc();
      v56[0] = swift_slowAlloc();
      uint64_t v42 = v16;
      uint64_t v43 = v7;
      *(_DWORD *)int v31 = 136315138;
      uint64_t v41 = v31 + 4;
      uint64_t v50 = v13;
      uint64_t v51 = v12;
      uint64_t v32 = v44;
      uint64_t v52 = v45;
      LOBYTE(v53) = v47 & 1;
      uint64_t v54 = v44;
      char v55 = v46 & 1;
      sub_69E0();
      uint64_t v33 = sub_E5C60();
      uint64_t v50 = sub_57A98(v33, v34, v56);
      sub_E5900();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&def_66DD4, v29, v30, "[Mail Forwarding] update failed: %s", v31, 0xCu);
      swift_arrayDestroy();
      uint64_t v15 = v32;
      uint64_t v14 = v45;
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v43 + 8))(v48, v6);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v28, v6);
      uint64_t v15 = v44;
      uint64_t v14 = v45;
    }
  }
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    if (v12) {
      uint64_t v35 = v13;
    }
    else {
      uint64_t v35 = 0;
    }
    if (v12) {
      uint64_t v36 = v14;
    }
    else {
      uint64_t v36 = 0;
    }
    if (v12) {
      uint64_t v37 = v47 & 1;
    }
    else {
      uint64_t v37 = 0;
    }
    if (v12)
    {
      char v38 = v46 & 1;
    }
    else
    {
      uint64_t v15 = 0;
      char v38 = 0;
    }
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v50 = v35;
    uint64_t v51 = v12;
    uint64_t v52 = v36;
    uint64_t v53 = v37;
    uint64_t v54 = v15;
    char v55 = v38;
    swift_bridgeObjectRetain();
    sub_E45C0();
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    char v49 = 0;
    return sub_E45C0();
  }
  return result;
}

uint64_t sub_C3EB8(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = sub_E4320();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_131238 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_67B4(v3, (uint64_t)qword_148D58);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  uint64_t v8 = sub_E4300();
  os_log_type_t v9 = sub_E5870();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&def_66DD4, v8, v9, "[Mail Forwarding] update successful", v10, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return a2(1);
}

uint64_t sub_C4064()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCV18icloudMailSettings17MailForwadingView9ViewModel__enabled;
  uint64_t v2 = sub_6898(&qword_131480);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  uint64_t v4 = v0 + OBJC_IVAR____TtCV18icloudMailSettings17MailForwadingView9ViewModel__forwardTo;
  uint64_t v5 = sub_6898(&qword_131D08);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  v3(v0 + OBJC_IVAR____TtCV18icloudMailSettings17MailForwadingView9ViewModel__deleteAfter, v2);
  v3(v0 + OBJC_IVAR____TtCV18icloudMailSettings17MailForwadingView9ViewModel__isDoneDisabled, v2);
  uint64_t v6 = v0 + OBJC_IVAR____TtCV18icloudMailSettings17MailForwadingView9ViewModel__error;
  uint64_t v7 = sub_6898(&qword_131488);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  v3(v0 + OBJC_IVAR____TtCV18icloudMailSettings17MailForwadingView9ViewModel__isUpdating, v2);
  sub_6A34(v0 + OBJC_IVAR____TtCV18icloudMailSettings17MailForwadingView9ViewModel_repository);
  swift_release();
  sub_223D0(*(void *)(v0 + OBJC_IVAR____TtCV18icloudMailSettings17MailForwadingView9ViewModel_preferences), *(void *)(v0 + OBJC_IVAR____TtCV18icloudMailSettings17MailForwadingView9ViewModel_preferences + 8), *(void *)(v0 + OBJC_IVAR____TtCV18icloudMailSettings17MailForwadingView9ViewModel_preferences + 16), *(void *)(v0 + OBJC_IVAR____TtCV18icloudMailSettings17MailForwadingView9ViewModel_preferences + 24), *(void *)(v0 + OBJC_IVAR____TtCV18icloudMailSettings17MailForwadingView9ViewModel_preferences + 32), *(void *)(v0 + OBJC_IVAR____TtCV18icloudMailSettings17MailForwadingView9ViewModel_preferences + 40), *(void *)(v0 + OBJC_IVAR____TtCV18icloudMailSettings17MailForwadingView9ViewModel_preferences + 48));
  uint64_t v8 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v9 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v8, v9);
}

uint64_t sub_C4258()
{
  return _s9ViewModelCMa_7();
}

uint64_t _s9ViewModelCMa_7()
{
  uint64_t result = qword_139338;
  if (!qword_139338) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_C42AC()
{
  sub_11AC0(319, (unint64_t *)&qword_1312E8);
  if (v0 <= 0x3F)
  {
    sub_11AC0(319, (unint64_t *)&qword_1319E8);
    if (v1 <= 0x3F)
    {
      sub_2C380();
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

uint64_t sub_C43F4@<X0>(uint64_t *a1@<X8>)
{
  _s9ViewModelCMa_7();
  uint64_t result = sub_E4510();
  *a1 = result;
  return result;
}

uint64_t sub_C4434@<X0>(unsigned char *a1@<X8>)
{
  return sub_EB4C(a1);
}

uint64_t sub_C445C()
{
  return sub_EBDC();
}

uint64_t sub_C448C@<X0>(unsigned char *a1@<X8>)
{
  return sub_EB4C(a1);
}

uint64_t sub_C44B4()
{
  return sub_EBDC();
}

uint64_t sub_C44DC@<X0>(unsigned char *a1@<X8>)
{
  return sub_EB4C(a1);
}

uint64_t sub_C44F0()
{
  return sub_EBDC();
}

uint64_t sub_C4504@<X0>(unsigned char *a1@<X8>)
{
  return sub_EB4C(a1);
}

uint64_t sub_C4518@<X0>(unsigned char *a1@<X8>)
{
  return sub_EB4C(a1);
}

uint64_t sub_C4540()
{
  return sub_EBDC();
}

uint64_t sub_C4554()
{
  return sub_EBDC();
}

uint64_t sub_C457C()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_C45B4()
{
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 64) != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_release();

  return _swift_deallocObject(v0, 112, 7);
}

uint64_t sub_C4614(uint64_t a1)
{
  return sub_C3880(a1, (void *)(v1 + 16), *(void *)(v1 + 104));
}

uint64_t sub_C4620()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_C4658(uint64_t a1)
{
  return sub_C3EB8(a1, *(uint64_t (**)(uint64_t))(v1 + 16));
}

void *sub_C4668(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  swift_bridgeObjectRelease();
  sub_2245C(v2, v3, v4);
  return a1;
}

uint64_t sub_C46DC@<X0>(unsigned char *a1@<X8>)
{
  return sub_EB4C(a1);
}

uint64_t sub_C4704()
{
  return sub_EBDC();
}

uint64_t destroy for ServerPreference(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t result = *(void *)(a1 + 48);
  if (result != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for ServerPreference(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  if (v5 == 1)
  {
    long long v6 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v6;
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    *(void *)(a1 + 80) = *(void *)(a2 + 80);
  }
  else
  {
    *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(void *)(a1 + 48) = v5;
    uint64_t v7 = *(void *)(a2 + 64);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    *(void *)(a1 + 64) = v7;
    uint64_t v8 = *(void *)(a2 + 72);
    uint64_t v9 = *(void *)(a2 + 80);
    *(void *)(a1 + 72) = v8;
    *(void *)(a1 + 80) = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t assignWithCopy for ServerPreference(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v4 = (_OWORD *)(a1 + 32);
  uint64_t v5 = (long long *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 48);
  if (*(void *)(a1 + 48) == 1)
  {
    if (v6 == 1)
    {
      long long v7 = *v5;
      long long v8 = *(_OWORD *)(a2 + 48);
      long long v9 = *(_OWORD *)(a2 + 64);
      *(void *)(a1 + 80) = *(void *)(a2 + 80);
      *(_OWORD *)(a1 + 48) = v8;
      *(_OWORD *)(a1 + 64) = v9;
      *uint64_t v4 = v7;
    }
    else
    {
      *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      *(void *)(a1 + 72) = *(void *)(a2 + 72);
      *(void *)(a1 + 80) = *(void *)(a2 + 80);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v6 == 1)
  {
    sub_8B51C(a1 + 32);
    long long v11 = *(_OWORD *)(a2 + 48);
    long long v10 = *(_OWORD *)(a2 + 64);
    long long v12 = *v5;
    *(void *)(a1 + 80) = *(void *)(a2 + 80);
    *(_OWORD *)(a1 + 48) = v11;
    *(_OWORD *)(a1 + 64) = v10;
    *uint64_t v4 = v12;
  }
  else
  {
    *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    *(void *)(a1 + 80) = *(void *)(a2 + 80);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  return a1;
}

__n128 initializeWithTake for ServerPreference(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for ServerPreference(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  if (*(void *)(a1 + 48) != 1)
  {
    uint64_t v5 = *(void *)(a2 + 48);
    if (v5 != 1)
    {
      *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      *(void *)(a1 + 48) = v5;
      swift_bridgeObjectRelease();
      uint64_t v7 = *(void *)(a2 + 64);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(void *)(a1 + 64) = v7;
      swift_bridgeObjectRelease();
      uint64_t v8 = *(void *)(a2 + 80);
      *(void *)(a1 + 72) = *(void *)(a2 + 72);
      *(void *)(a1 + 80) = v8;
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_8B51C(a1 + 32);
  }
  long long v6 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v6;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  return a1;
}

uint64_t getEnumTagSinglePayload for ServerPreference(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 88)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ServerPreference(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 88) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 88) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ServerPreference()
{
  return &type metadata for ServerPreference;
}

uint64_t destroy for Alias()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Alias(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Alias(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

uint64_t assignWithTake for Alias(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

ValueMetadata *type metadata accessor for Alias()
{
  return &type metadata for Alias;
}

uint64_t destroy for Account()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for Account(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for Account(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for CustomDomain(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for Account(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for Account()
{
  return &type metadata for Account;
}

uint64_t destroy for SharedPreference()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for SharedPreference(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SharedPreference(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for SharedPreference(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SharedPreference(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SharedPreference(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SharedPreference()
{
  return &type metadata for SharedPreference;
}

uint64_t destroy for AutoReply()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AutoReply(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AutoReply(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for AutoReply(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AutoReply(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 56)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AutoReply(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AutoReply()
{
  return &type metadata for AutoReply;
}

ValueMetadata *type metadata accessor for ImportListItem()
{
  return &type metadata for ImportListItem;
}

uint64_t destroy for CustomDomain()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CustomDomain(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CustomDomain(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for CustomDomain(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s18icloudMailSettings12CustomDomainVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_C56E4(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
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
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CustomDomain()
{
  return &type metadata for CustomDomain;
}

char *sub_C5744(char *a1, char *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *(void *)a2;
    *(void *)uint64_t v4 = *(void *)a2;
    uint64_t v4 = (char *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = *((void *)a2 + 1);
    *(void *)a1 = *(void *)a2;
    *((void *)a1 + 1) = v7;
    uint64_t v8 = a3[5];
    long long v9 = &a1[v8];
    long long v10 = &a2[v8];
    uint64_t v11 = sub_E4090();
    long long v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    uint64_t v14 = &v4[v13];
    uint64_t v15 = &a2[v13];
    v12(&v4[v13], &a2[v13], v11);
    uint64_t v16 = type metadata accessor for ImportProviderImage(0);
    v12(&v14[*(int *)(v16 + 20)], &v15[*(int *)(v16 + 20)], v11);
    uint64_t v17 = a3[7];
    uint64_t v18 = &v4[v17];
    unint64_t v19 = &a2[v17];
    uint64_t v20 = *((void *)v19 + 1);
    *(void *)uint64_t v18 = *(void *)v19;
    *((void *)v18 + 1) = v20;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t type metadata accessor for ImportProviderImage(uint64_t a1)
{
  return sub_2DAC0(a1, qword_139630);
}

uint64_t sub_C58BC(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_E4090();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  v6(v7, v5);
  uint64_t v8 = type metadata accessor for ImportProviderImage(0);
  v6(v7 + *(int *)(v8 + 20), v5);

  return swift_bridgeObjectRelease();
}

char *sub_C5994(char *a1, char *a2, int *a3)
{
  uint64_t v6 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = &a1[v7];
  long long v9 = &a2[v7];
  uint64_t v10 = sub_E4090();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  v11(&a1[v12], &a2[v12], v10);
  uint64_t v15 = type metadata accessor for ImportProviderImage(0);
  v11(&v13[*(int *)(v15 + 20)], &v14[*(int *)(v15 + 20)], v10);
  uint64_t v16 = a3[7];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  uint64_t v19 = *((void *)v18 + 1);
  *(void *)uint64_t v17 = *(void *)v18;
  *((void *)v17 + 1) = v19;
  swift_bridgeObjectRetain();
  return a1;
}

char *sub_C5A9C(char *a1, char *a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_E4090();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  uint64_t v11 = a3[6];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  v10(&a1[v11], &a2[v11], v9);
  uint64_t v14 = type metadata accessor for ImportProviderImage(0);
  v10(&v12[*(int *)(v14 + 20)], &v13[*(int *)(v14 + 20)], v9);
  uint64_t v15 = a3[7];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  *(void *)uint64_t v16 = *(void *)v17;
  *((void *)v16 + 1) = *((void *)v17 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_C5BC0(char *a1, char *a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_E4090();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v11 = a3[6];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  v10(&a1[v11], &a2[v11], v9);
  uint64_t v14 = type metadata accessor for ImportProviderImage(0);
  v10(&v12[*(int *)(v14 + 20)], &v13[*(int *)(v14 + 20)], v9);
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  return a1;
}

char *sub_C5CAC(char *a1, char *a2, int *a3)
{
  uint64_t v6 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = sub_E4090();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  v11(&a1[v12], &a2[v12], v10);
  uint64_t v15 = type metadata accessor for ImportProviderImage(0);
  v11(&v13[*(int *)(v15 + 20)], &v14[*(int *)(v15 + 20)], v10);
  uint64_t v16 = a3[7];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = (uint64_t *)&a2[v16];
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  *(void *)uint64_t v17 = v20;
  *((void *)v17 + 1) = v19;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_C5DB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_C5DC4);
}

uint64_t sub_C5DC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_E4090();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 20);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = type metadata accessor for ImportProviderImage(0);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 24);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_C5EF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_C5F04);
}

uint64_t sub_C5F04(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_E4090();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 20);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = type metadata accessor for ImportProviderImage(0);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 24);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t type metadata accessor for ImportProvider(uint64_t a1)
{
  return sub_2DAC0(a1, qword_139598);
}

uint64_t sub_C6050()
{
  uint64_t result = sub_E4090();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for ImportProviderImage(319);
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_C612C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_E4090();
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
  }
  return a1;
}

uint64_t sub_C6214(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_E4090();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v7)((void *)(v4 - 8), a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);

  return v7(v5, v4);
}

uint64_t sub_C62B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_E4090();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_C634C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_E4090();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_C63E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_E4090();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_C647C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_E4090();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_C6514(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_C6528);
}

uint64_t sub_C6528(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_E4090();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_C6594(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_C65A8);
}

uint64_t sub_C65A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_E4090();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_C6618()
{
  uint64_t result = sub_E4090();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_C66A4()
{
  uint64_t v80 = *(void *)(v0 + 48);
  uint64_t v1 = *(void *)(v80 + 16);
  if (v1)
  {
    unint64_t v2 = (unsigned char *)(swift_bridgeObjectRetain() + 48);
    uint64_t v3 = _swiftEmptyArrayStorage;
    do
    {
      if (*v2 == 1)
      {
        uint64_t v8 = *((void *)v2 - 2);
        uint64_t v7 = *((void *)v2 - 1);
        swift_bridgeObjectRetain();
        *(void *)&long long v79 = v3;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1227C(0, v3[2] + 1, 1);
          uint64_t v3 = (void *)v79;
        }
        unint64_t v5 = v3[2];
        unint64_t v4 = v3[3];
        if (v5 >= v4 >> 1)
        {
          sub_1227C(v4 > 1, v5 + 1, 1);
          uint64_t v3 = (void *)v79;
        }
        v3[2] = v5 + 1;
        uint64_t v6 = &v3[3 * v5];
        v6[4] = v8;
        v6[5] = v7;
        *((unsigned char *)v6 + 48) = 1;
      }
      v2 += 24;
      --v1;
    }
    while (v1);
    sub_5EC1C((uint64_t)&v80);
    uint64_t v9 = v3[2];
    if (v9) {
      goto LABEL_11;
    }
LABEL_19:
    uint64_t v11 = _swiftEmptyArrayStorage;
    goto LABEL_20;
  }
  uint64_t v3 = _swiftEmptyArrayStorage;
  uint64_t v9 = _swiftEmptyArrayStorage[2];
  if (!v9) {
    goto LABEL_19;
  }
LABEL_11:
  long long v79 = *(_OWORD *)(v64 + 32);
  swift_retain();
  uint64_t v10 = (void **)(v3 + 5);
  uint64_t v11 = _swiftEmptyArrayStorage;
  do
  {
    uint64_t v13 = (uint64_t)*(v10 - 1);
    uint64_t v12 = *v10;
    long long v75 = v79;
    swift_bridgeObjectRetain();
    sub_5F47C((uint64_t)&v79);
    v81._uint64_t countAndFlagsBits = 64;
    v81._object = (void *)0xE100000000000000;
    sub_E5690(v81);
    swift_bridgeObjectRetain();
    v82._uint64_t countAndFlagsBits = v13;
    v82._object = v12;
    sub_E5690(v82);
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v11 = sub_B4904(0, v11[2] + 1, 1, v11);
    }
    unint64_t v15 = v11[2];
    unint64_t v14 = v11[3];
    if (v15 >= v14 >> 1) {
      uint64_t v11 = sub_B4904((void *)(v14 > 1), v15 + 1, 1, v11);
    }
    v10 += 3;
    v11[2] = v15 + 1;
    *(_OWORD *)&v11[2 * v15 + 4] = v75;
    swift_bridgeObjectRelease();
    --v9;
  }
  while (v9);
  swift_release();
LABEL_20:
  swift_release();
  uint64_t v78 = *(void *)(v64 + 56);
  uint64_t v16 = *(void *)(v78 + 16);
  if (v16)
  {
    uint64_t v17 = swift_bridgeObjectRetain() + 48;
    uint64_t v18 = _swiftEmptyArrayStorage;
    do
    {
      if (*(unsigned char *)(v17 + 40) == 1)
      {
        uint64_t v23 = *(void *)(v17 - 16);
        uint64_t v22 = *(void *)(v17 - 8);
        uint64_t v24 = *(void *)v17;
        uint64_t v69 = *(void *)(v17 + 8);
        uint64_t v25 = *(void *)(v17 + 32);
        long long v72 = *(_OWORD *)(v17 + 16);
        uint64_t v26 = v18;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v18 = v26;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_122DC(0, v26[2] + 1, 1);
          uint64_t v18 = v26;
        }
        unint64_t v20 = v18[2];
        unint64_t v19 = v18[3];
        if (v20 >= v19 >> 1)
        {
          sub_122DC(v19 > 1, v20 + 1, 1);
          uint64_t v18 = v26;
        }
        v18[2] = v20 + 1;
        uint64_t v21 = &v18[8 * v20];
        v21[4] = v23;
        v21[5] = v22;
        v21[6] = v24;
        v21[7] = v69;
        *((_OWORD *)v21 + 4) = v72;
        v21[10] = v25;
        *((unsigned char *)v21 + 88) = 1;
      }
      v17 += 64;
      --v16;
    }
    while (v16);
    unint64_t v28 = v18;
    sub_5EC1C((uint64_t)&v78);
    char v29 = v28;
  }
  else
  {
    char v29 = _swiftEmptyArrayStorage;
  }
  uint64_t v66 = v29[2];
  if (v66)
  {
    uint64_t v65 = v29 + 4;
    swift_retain();
    uint64_t v30 = 0;
    while (1)
    {
      uint64_t v70 = v30;
      int v31 = &v65[8 * v30];
      uint64_t v32 = v31[1];
      uint64_t v73 = *v31;
      uint64_t v33 = *(void *)(v31[2] + 16);
      if (v33) {
        break;
      }
      uint64_t v40 = _swiftEmptyArrayStorage[2];
      if (v40) {
        goto LABEL_46;
      }
LABEL_33:
      swift_release();
      uint64_t v30 = v70 + 1;
      if (v70 + 1 == v66)
      {
        swift_release_n();
        goto LABEL_55;
      }
    }
    unint64_t v34 = (unsigned char *)(swift_bridgeObjectRetain() + 48);
    do
    {
      if (*v34 == 1)
      {
        uint64_t v38 = *((void *)v34 - 2);
        uint64_t v39 = *((void *)v34 - 1);
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_1227C(0, _swiftEmptyArrayStorage[2] + 1, 1);
        }
        unint64_t v36 = _swiftEmptyArrayStorage[2];
        unint64_t v35 = _swiftEmptyArrayStorage[3];
        if (v36 >= v35 >> 1) {
          sub_1227C(v35 > 1, v36 + 1, 1);
        }
        _swiftEmptyArrayStorage[2] = v36 + 1;
        uint64_t v37 = &_swiftEmptyArrayStorage[3 * v36];
        v37[4] = v38;
        v37[5] = v39;
        *((unsigned char *)v37 + 48) = 1;
      }
      v34 += 24;
      --v33;
    }
    while (v33);
    swift_bridgeObjectRelease();
    uint64_t v40 = _swiftEmptyArrayStorage[2];
    if (!v40) {
      goto LABEL_33;
    }
LABEL_46:
    swift_retain();
    uint64_t v41 = (void **)&_swiftEmptyArrayStorage[5];
    do
    {
      uint64_t v43 = (uint64_t)*(v41 - 1);
      uint64_t v42 = *v41;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v83._uint64_t countAndFlagsBits = 64;
      v83._object = (void *)0xE100000000000000;
      sub_E5690(v83);
      swift_bridgeObjectRetain();
      v84._uint64_t countAndFlagsBits = v43;
      v84._object = v42;
      sub_E5690(v84);
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v11 = sub_B4904(0, v11[2] + 1, 1, v11);
      }
      unint64_t v45 = v11[2];
      unint64_t v44 = v11[3];
      if (v45 >= v44 >> 1) {
        uint64_t v11 = sub_B4904((void *)(v44 > 1), v45 + 1, 1, v11);
      }
      v41 += 3;
      v11[2] = v45 + 1;
      int v46 = &v11[2 * v45];
      v46[4] = v73;
      v46[5] = v32;
      swift_bridgeObjectRelease();
      --v40;
    }
    while (v40);
    swift_release();
    goto LABEL_33;
  }
  swift_release();
LABEL_55:
  uint64_t v47 = *(void *)(v64 + 64);
  if (v47)
  {
    uint64_t v48 = *(void *)(v47 + 16);
    if (v48)
    {
      uint64_t v49 = swift_bridgeObjectRetain() + 48;
      do
      {
        if (*(unsigned char *)(v49 + 16) == 1)
        {
          uint64_t v53 = *(void *)(v49 - 8);
          uint64_t v54 = *(void *)(v49 + 8);
          uint64_t v67 = *(void *)v49;
          uint64_t v68 = *(void *)(v49 - 16);
          uint64_t v71 = *(void *)(v49 + 24);
          uint64_t v55 = *(void *)(v49 + 48);
          long long v74 = *(_OWORD *)(v49 + 32);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            sub_122BC(0, _swiftEmptyArrayStorage[2] + 1, 1);
          }
          unint64_t v51 = _swiftEmptyArrayStorage[2];
          unint64_t v50 = _swiftEmptyArrayStorage[3];
          if (v51 >= v50 >> 1) {
            sub_122BC(v50 > 1, v51 + 1, 1);
          }
          _swiftEmptyArrayStorage[2] = v51 + 1;
          uint64_t v52 = &_swiftEmptyArrayStorage[9 * v51];
          v52[4] = v68;
          v52[5] = v53;
          v52[6] = v67;
          v52[7] = v54;
          *((unsigned char *)v52 + 64) = 1;
          v52[9] = v71;
          *((_OWORD *)v52 + 5) = v74;
          v52[12] = v55;
        }
        v49 += 72;
        --v48;
      }
      while (v48);
      swift_bridgeObjectRelease();
      uint64_t v56 = _swiftEmptyArrayStorage[2];
      if (!v56) {
        goto LABEL_75;
      }
    }
    else
    {
      uint64_t v56 = _swiftEmptyArrayStorage[2];
      if (!v56)
      {
LABEL_75:
        swift_release();
        return v11;
      }
    }
    swift_retain();
    uint64_t v57 = (void **)&_swiftEmptyArrayStorage[7];
    do
    {
      uint64_t v58 = (uint64_t)*(v57 - 1);
      Swift::String v59 = *v57;
      uint64_t v76 = (uint64_t)*(v57 - 3);
      uint64_t v77 = (uint64_t)*(v57 - 2);
      swift_bridgeObjectRetain();
      v85._uint64_t countAndFlagsBits = 64;
      v85._object = (void *)0xE100000000000000;
      sub_E5690(v85);
      swift_bridgeObjectRetain();
      v86._uint64_t countAndFlagsBits = v58;
      v86._object = v59;
      sub_E5690(v86);
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v11 = sub_B4904(0, v11[2] + 1, 1, v11);
      }
      unint64_t v61 = v11[2];
      unint64_t v60 = v11[3];
      if (v61 >= v60 >> 1) {
        uint64_t v11 = sub_B4904((void *)(v60 > 1), v61 + 1, 1, v11);
      }
      v57 += 9;
      v11[2] = v61 + 1;
      uint64_t v62 = &v11[2 * v61];
      v62[4] = v76;
      v62[5] = v77;
      --v56;
    }
    while (v56);
    swift_release();
    goto LABEL_75;
  }
  return v11;
}

uint64_t sub_C6E68()
{
  uint64_t v1 = (void *)0xEA00000000006D6FLL;
  uint64_t v2 = 0x632E64756F6C6369;
  uint64_t v3 = v0[2];
  uint64_t v4 = *(void *)(v3 + 16);
  if (!v4) {
    goto LABEL_12;
  }
  if (*(unsigned char *)(v3 + 48))
  {
    uint64_t v5 = v3 + 32;
    uint64_t v6 = (void **)(v3 + 40);
LABEL_11:
    uint64_t v2 = *(void *)v5;
    uint64_t v1 = *v6;
    swift_bridgeObjectRetain();
    goto LABEL_12;
  }
  if (v4 == 1)
  {
LABEL_12:
    uint64_t v10 = *v0;
    swift_bridgeObjectRetain();
    v11._uint64_t countAndFlagsBits = 64;
    v11._object = (void *)0xE100000000000000;
    sub_E5690(v11);
    swift_bridgeObjectRetain();
    v12._uint64_t countAndFlagsBits = v2;
    v12._object = v1;
    sub_E5690(v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v10;
  }
  uint64_t v5 = v3 + 56;
  uint64_t v7 = 1;
  while (1)
  {
    uint64_t v8 = v7 + 1;
    if (__OFADD__(v7, 1)) {
      break;
    }
    if (*(unsigned char *)(v5 + 16))
    {
      uint64_t v6 = (void **)(v5 + 8);
      goto LABEL_11;
    }
    ++v7;
    v5 += 24;
    if (v8 == v4) {
      goto LABEL_12;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_C6F68()
{
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = v1;
    uint64_t v3 = (unsigned char *)(v1 + 48);
    do
    {
      if (*v3 == 1)
      {
        uint64_t v8 = *((void *)v3 - 2);
        uint64_t v7 = *((void *)v3 - 1);
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_1227C(0, _swiftEmptyArrayStorage[2] + 1, 1);
        }
        unint64_t v5 = _swiftEmptyArrayStorage[2];
        unint64_t v4 = _swiftEmptyArrayStorage[3];
        if (v5 >= v4 >> 1) {
          sub_1227C(v4 > 1, v5 + 1, 1);
        }
        _swiftEmptyArrayStorage[2] = v5 + 1;
        uint64_t v6 = &_swiftEmptyArrayStorage[3 * v5];
        v6[4] = v8;
        v6[5] = v7;
        *((unsigned char *)v6 + 48) = 1;
      }
      v3 += 24;
      --v2;
    }
    while (v2);
    uint64_t v1 = v13;
    swift_bridgeObjectRelease();
  }
  sub_691A0(v0);
  uint64_t v9 = sub_AD384((uint64_t)_swiftEmptyArrayStorage, v0);
  sub_8CC24(v0);
  swift_release();
  if (v9[2])
  {
    uint64_t v10 = v9[4];
    swift_bridgeObjectRetain();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_691A0(v0);
    Swift::String v11 = sub_AD384(v1, v0);
    sub_8CC24(v0);
    swift_bridgeObjectRelease();
    if (!v11[2])
    {
      swift_bridgeObjectRelease();
      return 0;
    }
    uint64_t v10 = v11[4];
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_C714C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_6898(&qword_1396F8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_67EC(a1, a1[3]);
  sub_CC424();
  sub_E5D00();
  LOBYTE(v12) = 0;
  sub_E5BC0();
  if (!v2)
  {
    LOBYTE(v12) = 1;
    sub_E5B80();
    LOBYTE(v12) = 2;
    sub_E5BC0();
    uint64_t v12 = *(void *)(v3 + 48);
    char v11 = 3;
    sub_6898(&qword_139698);
    sub_CC520(&qword_1396B8, &qword_139698, (void (*)(void))sub_CC3D0);
    sub_E5BF0();
    uint64_t v12 = *(void *)(v3 + 56);
    char v11 = 4;
    sub_6898(&qword_138B78);
    sub_CC520(&qword_139700, &qword_138B78, (void (*)(void))sub_43340);
    sub_E5BF0();
    sub_10250(v3 + 64, (uint64_t)v13, &qword_1360C0);
    sub_10250((uint64_t)v13, (uint64_t)&v12, &qword_1360C0);
    char v11 = 5;
    sub_6898(&qword_138B80);
    sub_CC520(&qword_139708, &qword_138B80, (void (*)(void))sub_4343C);
    sub_E5BB0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_C7480(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  int v12 = a4;
  uint64_t v6 = sub_6898(&qword_1398C0);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_67EC(a1, a1[3]);
  sub_CE878();
  sub_E5D00();
  char v14 = 0;
  sub_E5BC0();
  if (!v4)
  {
    char v13 = 1;
    sub_E5BD0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

unint64_t sub_C75F4()
{
  unint64_t result = 1682535268;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x656D614E6C6C7566;
      break;
    case 2:
      unint64_t result = 0x64496C69616D65;
      break;
    case 3:
      unint64_t result = 0xD000000000000010;
      break;
    case 4:
      unint64_t result = 0x73657361696C61;
      break;
    case 5:
      unint64_t result = 0x6F446D6F74737563;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_C76C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_CA60C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_C76EC(uint64_t a1)
{
  unint64_t v2 = sub_CC424();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_C7728(uint64_t a1)
{
  unint64_t v2 = sub_CC424();

  return CodingKey.debugDescription.getter(a1, v2);
}

__n128 sub_C7764@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_CA89C(a1, (uint64_t *)v6);
  if (!v2)
  {
    long long v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(void *)(a2 + 64) = v7;
    __n128 result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_C77B8(void *a1)
{
  return sub_C714C(a1);
}

uint64_t sub_C77FC()
{
  if (*v0) {
    return 0x6E6553776F6C6C61;
  }
  else {
    return 0x6E69616D6F64;
  }
}

uint64_t sub_C7840@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_CAE74(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_C7868(uint64_t a1)
{
  unint64_t v2 = sub_CE878();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_C78A4(uint64_t a1)
{
  unint64_t v2 = sub_CE878();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_C78E0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_CAF84(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(unsigned char *)(a2 + 16) = v6 & 1;
  }
  return result;
}

uint64_t sub_C7914(void *a1)
{
  return sub_C7480(a1, *(void *)v1, *(void *)(v1 + 8), *(unsigned __int8 *)(v1 + 16));
}

uint64_t sub_C7934(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 16);
  int v3 = *(unsigned __int8 *)(a2 + 16);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8)) {
    return v2 ^ v3 ^ 1u;
  }
  char v5 = sub_E5C20();
  uint64_t result = 0;
  if (v5) {
    return v2 ^ v3 ^ 1u;
  }
  return result;
}

uint64_t sub_C7994(void *a1)
{
  uint64_t v3 = sub_6898(&qword_139778);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_67EC(a1, a1[3]);
  sub_CD4F4();
  sub_E5D00();
  v8[15] = 0;
  sub_E5BC0();
  if (!v1)
  {
    v8[14] = 1;
    sub_E5BC0();
    v8[13] = 2;
    sub_E5BD0();
    v8[12] = 3;
    sub_E5B80();
    v8[11] = 4;
    sub_E5B80();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_C7B6C()
{
  uint64_t result = 0x64496C69616D65;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6E69616D6F64;
      break;
    case 2:
      uint64_t result = 0x6E6553776F6C6C61;
      break;
    case 3:
      uint64_t result = 0x656D614E6C6C7566;
      break;
    case 4:
      uint64_t result = 0x6C6562616CLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_C7C1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_CB170(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_C7C44(uint64_t a1)
{
  unint64_t v2 = sub_CD4F4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_C7C80(uint64_t a1)
{
  unint64_t v2 = sub_CD4F4();

  return CodingKey.debugDescription.getter(a1, v2);
}

__n128 sub_C7CBC@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_CB3A4(a1, (uint64_t)v6);
  if (!v2)
  {
    long long v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(void *)(a2 + 64) = v7;
    __n128 result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_C7D10(void *a1)
{
  return sub_C7994(a1);
}

uint64_t sub_C7D28(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 48);
  v7[2] = *(_OWORD *)(a1 + 32);
  v7[3] = v2;
  uint64_t v8 = *(void *)(a1 + 64);
  long long v3 = *(_OWORD *)(a1 + 16);
  v7[0] = *(_OWORD *)a1;
  v7[1] = v3;
  long long v4 = *(_OWORD *)(a2 + 48);
  v9[2] = *(_OWORD *)(a2 + 32);
  v9[3] = v4;
  uint64_t v10 = *(void *)(a2 + 64);
  long long v5 = *(_OWORD *)(a2 + 16);
  v9[0] = *(_OWORD *)a2;
  v9[1] = v5;
  return sub_CA234((uint64_t)v7, (uint64_t)v9) & 1;
}

uint64_t sub_C7D84(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_6898(&qword_1396B0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_67EC(a1, a1[3]);
  sub_CC328();
  sub_E5D00();
  char v12 = 0;
  sub_E5BC0();
  if (!v2)
  {
    uint64_t v11 = *(void *)(v3 + 16);
    v10[15] = 1;
    sub_6898(&qword_139698);
    sub_CC520(&qword_1396B8, &qword_139698, (void (*)(void))sub_CC3D0);
    sub_E5BF0();
    v10[14] = 2;
    sub_E5B80();
    v10[13] = 3;
    sub_E5B80();
    v10[12] = 4;
    sub_E5BD0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_C7FB8()
{
  unint64_t result = 0x64496C69616D65;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000010;
      break;
    case 2:
      unint64_t result = 0x656D614E6C6C7566;
      break;
    case 3:
      unint64_t result = 0x6C6562616CLL;
      break;
    case 4:
      unint64_t result = 0x6576697463417369;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_C8064@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_CB724(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_C808C(uint64_t a1)
{
  unint64_t v2 = sub_CC328();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_C80C8(uint64_t a1)
{
  unint64_t v2 = sub_CC328();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_C8104@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_CB934(a1, (uint64_t *)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    a2[2] = v7[0];
    double result = *(double *)((char *)v7 + 9);
    *(_OWORD *)((char *)a2 + 41) = *(_OWORD *)((char *)v7 + 9);
  }
  return result;
}

uint64_t sub_C8150(void *a1)
{
  return sub_C7D84(a1);
}

uint64_t sub_C8168(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  int v5 = *(unsigned __int8 *)(a1 + 48);
  int v6 = *(unsigned __int8 *)(a2 + 48);
  if (*(void *)(a1 + 32) == *(void *)(a2 + 32) && *(void *)(a1 + 40) == *(void *)(a2 + 40))
  {
    if (v5 == v6) {
      goto LABEL_13;
    }
    return 0;
  }
  char v8 = sub_E5C20();
  uint64_t result = 0;
  if ((v8 & 1) != 0 && ((v5 ^ v6) & 1) == 0)
  {
LABEL_13:
    uint64_t v10 = v2 - 1;
    if (v10)
    {
      uint64_t v11 = (unsigned __int8 *)(a2 + 72);
      for (uint64_t i = (unsigned __int8 *)(a1 + 72); ; i += 24)
      {
        int v13 = *i;
        int v14 = *v11;
        if (*((void *)i - 2) == *((void *)v11 - 2) && *((void *)i - 1) == *((void *)v11 - 1))
        {
          if (v13 != v14) {
            return 0;
          }
        }
        else
        {
          char v16 = sub_E5C20();
          uint64_t result = 0;
          if (v16 & 1) == 0 || ((v13 ^ v14)) {
            return result;
          }
        }
        v11 += 24;
        uint64_t result = 1;
        if (!--v10) {
          return result;
        }
      }
    }
    return 1;
  }
  return result;
}

uint64_t sub_C827C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  v5[0] = *a1;
  v5[1] = v2;
  v6[0] = a1[2];
  *(_OWORD *)((char *)v6 + 9) = *(_OWORD *)((char *)a1 + 41);
  long long v3 = a2[1];
  v7[0] = *a2;
  v7[1] = v3;
  v8[0] = a2[2];
  *(_OWORD *)((char *)v8 + 9) = *(_OWORD *)((char *)a2 + 41);
  return sub_CA418((uint64_t)v5, (uint64_t)v7) & 1;
}

uint64_t sub_C82D8(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_6898(&qword_139680);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  char v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_67EC(a1, a1[3]);
  sub_CC280();
  sub_E5D00();
  v11[0] = 0;
  sub_E5B90();
  if (!v2)
  {
    v11[0] = 1;
    sub_E5B80();
    v11[0] = 2;
    sub_E5B90();
    sub_10250(v3 + 32, (uint64_t)v12, &qword_1360D0);
    sub_10250((uint64_t)v12, (uint64_t)v11, &qword_1360D0);
    v10[15] = 3;
    sub_433E8();
    sub_E5BB0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_C84C0()
{
  unint64_t result = 0x4564726177726F66;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000013;
      break;
    case 2:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 3:
      unint64_t result = 0x6E6F697461636176;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_C8564@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_CBD48(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_C858C(uint64_t a1)
{
  unint64_t v2 = sub_CC280();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_C85C8(uint64_t a1)
{
  unint64_t v2 = sub_CC280();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_C8604@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_CBF10(a1, (uint64_t)v7);
  if (!v2)
  {
    long long v5 = v7[3];
    *(_OWORD *)(a2 + 32) = v7[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_OWORD *)(a2 + 64) = v7[4];
    *(void *)(a2 + 80) = v8;
    double result = *(double *)v7;
    long long v6 = v7[1];
    *(_OWORD *)a2 = v7[0];
    *(_OWORD *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_C8660(void *a1)
{
  return sub_C82D8(a1);
}

uint64_t sub_C86AC(void *a1)
{
  uint64_t v3 = sub_6898(&qword_139738);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  long long v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_67EC(a1, a1[3]);
  sub_CCE84();
  sub_E5D00();
  v8[15] = 0;
  sub_E5B90();
  if (!v1)
  {
    v8[14] = 1;
    sub_E5B80();
    v8[13] = 2;
    sub_E5B80();
    v8[12] = 3;
    sub_E5B80();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_C885C()
{
  unint64_t result = 0x7541656C62616E65;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000011;
      break;
    case 2:
      unint64_t result = 0x6E6F697461636176;
      break;
    case 3:
      unint64_t result = 0xD000000000000010;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_C8910@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_CC58C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_C8938(uint64_t a1)
{
  unint64_t v2 = sub_CCE84();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_C8974(uint64_t a1)
{
  unint64_t v2 = sub_CCE84();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_C89B0@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_CC784(a1, (uint64_t)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    double result = *(double *)&v7;
    *(_OWORD *)(a2 + 32) = v7;
    *(void *)(a2 + 48) = v8;
  }
  return result;
}

uint64_t sub_C8A00(void *a1)
{
  return sub_C86AC(a1);
}

uint64_t sub_C8A18(void *a1)
{
  uint64_t v3 = sub_6898(&qword_139720);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  long long v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_67EC(a1, a1[3]);
  sub_CCE30();
  sub_E5D00();
  v8[15] = 0;
  sub_E5B80();
  if (!v1)
  {
    v8[14] = 1;
    sub_E5B80();
    v8[13] = 2;
    sub_E5B80();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_C8BA0()
{
  uint64_t v1 = 0x69614D6873617274;
  if (*v0 != 1) {
    uint64_t v1 = 0x6C69614D746E6573;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0xD000000000000013;
  }
}

uint64_t sub_C8C18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_CCA54(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_C8C40(uint64_t a1)
{
  unint64_t v2 = sub_CCE30();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_C8C7C(uint64_t a1)
{
  unint64_t v2 = sub_CCE30();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_C8CB8@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_CCBF0(a1, (uint64_t *)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    double result = *(double *)&v7;
    a2[2] = v7;
  }
  return result;
}

uint64_t sub_C8CFC(void *a1)
{
  return sub_C8A18(a1);
}

uint64_t sub_C8D14(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_6898(&qword_139758);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_67EC(a1, a1[3]);
  sub_CD3F8();
  sub_E5D00();
  v10[15] = 0;
  sub_E5BC0();
  if (!v2)
  {
    v10[14] = 1;
    sub_E5BC0();
    v10[13] = *(unsigned char *)(v3 + 32);
    v10[12] = 2;
    sub_CD4A0();
    sub_E5BF0();
    v10[11] = 3;
    sub_E5BE0();
    v10[10] = 4;
    sub_E5BA0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_C8F08(char a1)
{
  unint64_t result = 0x44455452415453;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x4554454C504D4F43;
      break;
    case 2:
      unint64_t result = 0x574549564552;
      break;
    case 3:
      unint64_t result = 0xD000000000000014;
      break;
    case 4:
      unint64_t result = 0x4C414E5245544E49;
      break;
    case 5:
      unint64_t result = 0x524F5252455F4353;
      break;
    case 6:
      unint64_t result = 0x524154535F544F4ELL;
      break;
    case 7:
      unint64_t result = 0x444554454C4544;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_C9020()
{
  uint64_t result = 0x6449626F6ALL;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6C69616D65;
      break;
    case 2:
      uint64_t result = 0x737574617473;
      break;
    case 3:
      uint64_t result = 0x6D69547472617473;
      break;
    case 4:
      uint64_t result = 0x656D6954646E65;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_C90C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_CCED8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_C90E8(uint64_t a1)
{
  unint64_t v2 = sub_CD3F8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_C9124(uint64_t a1)
{
  unint64_t v2 = sub_CD3F8();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_C9160@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_CD0EC(a1, (uint64_t)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    a2[2] = v7[0];
    double result = *(double *)((char *)v7 + 9);
    *(_OWORD *)((char *)a2 + 41) = *(_OWORD *)((char *)v7 + 9);
  }
  return result;
}

uint64_t sub_C91AC(void *a1)
{
  return sub_C8D14(a1);
}

uint64_t sub_C91C4(unsigned __int8 *a1, char *a2)
{
  return sub_9E54C(*a1, *a2);
}

Swift::Int sub_C91D0()
{
  return sub_8F158();
}

uint64_t sub_C91DC()
{
  return sub_9EB2C();
}

Swift::Int sub_C91E4()
{
  return sub_8F158();
}

uint64_t sub_C91EC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_CE920(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_C921C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_C8F08(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_C9248()
{
  return sub_E5740();
}

uint64_t sub_C92A8()
{
  return sub_E5700();
}

uint64_t sub_C92F8(void *a1)
{
  uint64_t v3 = sub_6898(&qword_1397A0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_67EC(a1, a1[3]);
  sub_CD548();
  sub_E5D00();
  v8[15] = 0;
  sub_E5BC0();
  if (!v1)
  {
    type metadata accessor for ImportProvider(0);
    v8[14] = 1;
    sub_E4090();
    sub_CD59C(&qword_1397A8, (void (*)(uint64_t))&type metadata accessor for URL);
    sub_E5BF0();
    v8[13] = 2;
    type metadata accessor for ImportProviderImage(0);
    sub_CD59C(&qword_1397B0, (void (*)(uint64_t))type metadata accessor for ImportProviderImage);
    sub_E5BF0();
    v8[12] = 3;
    sub_E5B80();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_C955C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v28 = a2;
  uint64_t v29 = type metadata accessor for ImportProviderImage(0);
  __chkstk_darwin(v29);
  uint64_t v30 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_E4090();
  uint64_t v32 = *(void *)(v4 - 8);
  uint64_t v33 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_6898(&qword_139780);
  uint64_t v31 = *(void *)(v34 - 8);
  __chkstk_darwin(v34);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for ImportProvider(0);
  __chkstk_darwin(v9);
  uint64_t v11 = (uint64_t *)((char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_67EC(a1, a1[3]);
  sub_CD548();
  uint64_t v12 = (uint64_t)v35;
  sub_E5CF0();
  if (v12) {
    return sub_6A34((uint64_t)a1);
  }
  int v13 = v6;
  unint64_t v35 = a1;
  int v14 = v11;
  uint64_t v16 = v32;
  uint64_t v15 = v33;
  char v39 = 0;
  uint64_t v17 = v34;
  *int v14 = sub_E5B40();
  v14[1] = v18;
  char v38 = 1;
  sub_CD59C(&qword_139790, (void (*)(uint64_t))&type metadata accessor for URL);
  sub_E5B70();
  uint64_t v27 = v9;
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))((char *)v14 + *(int *)(v9 + 20), v13, v15);
  char v37 = 2;
  sub_CD59C(&qword_139798, (void (*)(uint64_t))type metadata accessor for ImportProviderImage);
  uint64_t v19 = (uint64_t)v30;
  sub_E5B70();
  uint64_t v20 = v27;
  sub_CD5E4(v19, (uint64_t)v14 + *(int *)(v27 + 24));
  char v36 = 3;
  uint64_t v22 = sub_E5B00();
  uint64_t v24 = v23;
  (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v17);
  uint64_t v25 = (uint64_t *)((char *)v14 + *(int *)(v20 + 28));
  *uint64_t v25 = v22;
  v25[1] = v24;
  sub_CD6FC((uint64_t)v14, v28, type metadata accessor for ImportProvider);
  sub_6A34((uint64_t)v35);
  return sub_CD648((uint64_t)v14, type metadata accessor for ImportProvider);
}

uint64_t sub_C9A60(void *a1)
{
  uint64_t v3 = sub_6898(&qword_1397C8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_67EC(a1, a1[3]);
  sub_CD6A8();
  sub_E5D00();
  v8[15] = 0;
  sub_E4090();
  sub_CD59C(&qword_1397A8, (void (*)(uint64_t))&type metadata accessor for URL);
  sub_E5BF0();
  if (!v1)
  {
    type metadata accessor for ImportProviderImage(0);
    v8[14] = 1;
    sub_E5BF0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_C9C20@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v4 = sub_E4090();
  uint64_t v27 = *(void *)(v4 - 8);
  uint64_t v28 = v4;
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v24 = (char *)&v21 - v8;
  uint64_t v9 = sub_6898(&qword_1397B8);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v25 = v9;
  uint64_t v26 = v10;
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for ImportProviderImage(0);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_67EC(a1, a1[3]);
  sub_CD6A8();
  sub_E5CF0();
  if (v2) {
    return sub_6A34((uint64_t)a1);
  }
  uint64_t v21 = v13;
  uint64_t v22 = v15;
  uint64_t v16 = v27;
  char v30 = 0;
  sub_CD59C(&qword_139790, (void (*)(uint64_t))&type metadata accessor for URL);
  uint64_t v17 = v24;
  uint64_t v18 = v25;
  sub_E5B70();
  uint64_t v24 = *(char **)(v16 + 32);
  ((void (*)(char *, char *, uint64_t))v24)(v22, v17, v28);
  char v29 = 1;
  sub_E5B70();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v12, v18);
  uint64_t v19 = (uint64_t)v22;
  ((void (*)(char *, char *, uint64_t))v24)(&v22[*(int *)(v21 + 20)], v7, v28);
  sub_CD6FC(v19, v23, type metadata accessor for ImportProviderImage);
  sub_6A34((uint64_t)a1);
  return sub_CD648(v19, type metadata accessor for ImportProviderImage);
}

unint64_t sub_C9FCC()
{
  unint64_t result = 0x72656469766F7270;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000010;
      break;
    case 2:
      unint64_t result = 0x6567616D69;
      break;
    case 3:
      unint64_t result = 0x4E79616C70736964;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_CA064@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_CE96C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_CA08C(uint64_t a1)
{
  unint64_t v2 = sub_CD548();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_CA0C8(uint64_t a1)
{
  unint64_t v2 = sub_CD548();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_CA104@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_C955C(a1, a2);
}

uint64_t sub_CA11C(void *a1)
{
  return sub_C92F8(a1);
}

uint64_t sub_CA134()
{
  if (*v0) {
    return 1802658148;
  }
  else {
    return 0x746867696CLL;
  }
}

uint64_t sub_CA164@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_CEB30(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_CA18C(uint64_t a1)
{
  unint64_t v2 = sub_CD6A8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_CA1C8(uint64_t a1)
{
  unint64_t v2 = sub_CD6A8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_CA204@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_C9C20(a1, a2);
}

uint64_t sub_CA21C(void *a1)
{
  return sub_C9A60(a1);
}

uint64_t sub_CA234(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v4 || (char v5 = 0, (sub_E5C20() & 1) != 0))
  {
    BOOL v6 = *(void *)(a1 + 16) == *(void *)(a2 + 16) && *(void *)(a1 + 24) == *(void *)(a2 + 24);
    if (v6 || (char v5 = 0, (sub_E5C20() & 1) != 0))
    {
      if ((*(unsigned __int8 *)(a1 + 32) ^ *(unsigned __int8 *)(a2 + 32)))
      {
        char v5 = 0;
        return v5 & 1;
      }
      if (*(void *)(a1 + 48))
      {
        uint64_t v7 = *(void *)(a1 + 40);
        unint64_t v8 = *(void *)(a1 + 48);
        unint64_t v9 = *(void *)(a2 + 48);
        if (v9) {
          goto LABEL_15;
        }
      }
      else
      {
        uint64_t v7 = 0;
        unint64_t v8 = 0xE000000000000000;
        unint64_t v9 = *(void *)(a2 + 48);
        if (v9)
        {
LABEL_15:
          unint64_t v10 = v9;
          if (v7 != *(void *)(a2 + 40)) {
            goto LABEL_21;
          }
          goto LABEL_19;
        }
      }
      unint64_t v10 = 0xE000000000000000;
      if (v7) {
        goto LABEL_21;
      }
LABEL_19:
      if (v8 == v10)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease_n();
        goto LABEL_22;
      }
LABEL_21:
      char v11 = sub_E5C20();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v5 = 0;
      if ((v11 & 1) == 0) {
        return v5 & 1;
      }
LABEL_22:
      if (*(void *)(a1 + 64))
      {
        uint64_t v12 = *(void *)(a1 + 56);
        unint64_t v13 = *(void *)(a1 + 64);
        unint64_t v14 = *(void *)(a2 + 64);
        if (v14) {
          goto LABEL_24;
        }
      }
      else
      {
        uint64_t v12 = 0;
        unint64_t v13 = 0xE000000000000000;
        unint64_t v14 = *(void *)(a2 + 64);
        if (v14)
        {
LABEL_24:
          uint64_t v15 = *(void *)(a2 + 56);
          unint64_t v16 = v14;
          if (v12 != v15) {
            goto LABEL_30;
          }
LABEL_28:
          if (v13 == v16)
          {
            char v5 = 1;
LABEL_31:
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return v5 & 1;
          }
LABEL_30:
          char v5 = sub_E5C20();
          goto LABEL_31;
        }
      }
      unint64_t v16 = 0xE000000000000000;
      if (v12) {
        goto LABEL_30;
      }
      goto LABEL_28;
    }
  }
  return v5 & 1;
}

uint64_t sub_CA418(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 != *(void *)a2 || *(void *)(a1 + 8) != *(void *)(a2 + 8))
  {
    char v5 = sub_E5C20();
    char v6 = 0;
    if ((v5 & 1) == 0) {
      return v6 & 1;
    }
  }
  if ((sub_C8168(*(void *)(a1 + 16), *(void *)(a2 + 16)) & 1) == 0)
  {
    char v6 = 0;
    return v6 & 1;
  }
  if (*(void *)(a1 + 32))
  {
    uint64_t v7 = *(void *)(a1 + 24);
    unint64_t v8 = *(void *)(a1 + 32);
    unint64_t v9 = *(void *)(a2 + 32);
    if (v9) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0xE000000000000000;
    unint64_t v9 = *(void *)(a2 + 32);
    if (v9)
    {
LABEL_9:
      unint64_t v10 = v9;
      if (v7 != *(void *)(a2 + 24)) {
        goto LABEL_16;
      }
      goto LABEL_14;
    }
  }
  unint64_t v10 = 0xE000000000000000;
  if (v7) {
    goto LABEL_16;
  }
LABEL_14:
  if (v8 == v10)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease_n();
    goto LABEL_17;
  }
LABEL_16:
  char v11 = sub_E5C20();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v6 = 0;
  if ((v11 & 1) == 0) {
    return v6 & 1;
  }
LABEL_17:
  if (*(void *)(a1 + 48))
  {
    uint64_t v12 = *(void *)(a1 + 40);
    unint64_t v13 = *(void *)(a1 + 48);
    unint64_t v14 = *(void *)(a2 + 48);
    if (v14) {
      goto LABEL_19;
    }
LABEL_22:
    unint64_t v15 = 0xE000000000000000;
    if (v12) {
      goto LABEL_25;
    }
LABEL_23:
    if (v13 == v15)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease_n();
LABEL_26:
      char v6 = ((*(unsigned char *)(a1 + 56) & 1) == 0) ^ *(unsigned char *)(a2 + 56);
      return v6 & 1;
    }
    goto LABEL_25;
  }
  uint64_t v12 = 0;
  unint64_t v13 = 0xE000000000000000;
  unint64_t v14 = *(void *)(a2 + 48);
  if (!v14) {
    goto LABEL_22;
  }
LABEL_19:
  unint64_t v15 = v14;
  if (v12 == *(void *)(a2 + 40)) {
    goto LABEL_23;
  }
LABEL_25:
  char v16 = sub_E5C20();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v6 = 0;
  if (v16) {
    goto LABEL_26;
  }
  return v6 & 1;
}

uint64_t sub_CA60C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1682535268 && a2 == 0xE400000000000000;
  if (v2 || (sub_E5C20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656D614E6C6C7566 && a2 == 0xE800000000000000 || (sub_E5C20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x64496C69616D65 && a2 == 0xE700000000000000 || (sub_E5C20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x80000000000F6FB0 || (sub_E5C20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x73657361696C61 && a2 == 0xE700000000000000 || (sub_E5C20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6F446D6F74737563 && a2 == 0xED0000736E69616DLL)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_E5C20();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_CA89C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_6898(&qword_1396C8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_67EC(a1, a1[3]);
  sub_CC424();
  sub_E5CF0();
  if (v2)
  {
    sub_6A34((uint64_t)a1);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    LOBYTE(v33) = 0;
    uint64_t v9 = sub_E5B40();
    uint64_t v11 = v10;
    uint64_t v31 = v9;
    LOBYTE(v33) = 1;
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_E5B00();
    uint64_t v14 = v13;
    uint64_t v29 = v12;
    LOBYTE(v33) = 2;
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_E5B40();
    uint64_t v27 = v14;
    uint64_t v28 = v11;
    uint64_t v16 = v15;
    sub_6898(&qword_139698);
    char v32 = 3;
    sub_CC520(&qword_1396A0, &qword_139698, (void (*)(void))sub_CC37C);
    swift_bridgeObjectRetain();
    sub_E5B70();
    uint64_t v30 = v16;
    uint64_t v17 = v33;
    sub_6898(&qword_138B78);
    char v32 = 4;
    sub_CC520(&qword_1396D8, &qword_138B78, (void (*)(void))sub_CC478);
    swift_bridgeObjectRetain();
    sub_E5B70();
    uint64_t v18 = v33;
    sub_6898(&qword_138B80);
    char v32 = 5;
    sub_CC520(&qword_1396E8, &qword_138B80, (void (*)(void))sub_CC4CC);
    swift_bridgeObjectRetain();
    sub_E5B30();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v19 = v33;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_6A34((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v20 = v30;
    swift_bridgeObjectRelease();
    uint64_t v21 = v27;
    swift_bridgeObjectRelease();
    uint64_t v22 = v17;
    uint64_t v23 = v28;
    uint64_t result = swift_bridgeObjectRelease();
    *a2 = v31;
    a2[1] = v23;
    a2[2] = v29;
    a2[3] = v21;
    a2[4] = v26;
    a2[5] = v20;
    a2[6] = v22;
    a2[7] = v18;
    a2[8] = v19;
  }
  return result;
}

uint64_t sub_CAE74(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E69616D6F64 && a2 == 0xE600000000000000;
  if (v2 || (sub_E5C20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6553776F6C6C61 && a2 == 0xED00006D6F724664)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_E5C20();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_CAF84(void *a1)
{
  uint64_t v3 = sub_6898(&qword_1398B0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = a1[4];
  sub_67EC(a1, a1[3]);
  sub_CE878();
  sub_E5CF0();
  if (v1)
  {
    sub_6A34((uint64_t)a1);
  }
  else
  {
    v9[15] = 0;
    uint64_t v7 = sub_E5B40();
    v9[14] = 1;
    swift_bridgeObjectRetain();
    sub_E5B50();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    sub_6A34((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_CB170(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x64496C69616D65 && a2 == 0xE700000000000000;
  if (v2 || (sub_E5C20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E69616D6F64 && a2 == 0xE600000000000000 || (sub_E5C20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E6553776F6C6C61 && a2 == 0xED00006D6F724664 || (sub_E5C20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656D614E6C6C7566 && a2 == 0xE800000000000000 || (sub_E5C20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6C6562616CLL && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_E5C20();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_CB3A4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_6898(&qword_139768);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_67EC(a1, a1[3]);
  sub_CD4F4();
  sub_E5CF0();
  if (v2)
  {
    sub_6A34((uint64_t)a1);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    char v34 = 0;
    uint64_t v9 = sub_E5B40();
    uint64_t v11 = v10;
    char v33 = 1;
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_E5B40();
    uint64_t v14 = v13;
    uint64_t v27 = v12;
    char v32 = 2;
    swift_bridgeObjectRetain();
    uint64_t v28 = 0;
    uint64_t v29 = v14;
    LODWORD(v25) = sub_E5B50();
    uint64_t v26 = v9;
    char v31 = 3;
    uint64_t v15 = sub_E5B00();
    uint64_t v17 = v16;
    uint64_t v24 = v15;
    char v30 = 4;
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_E5B00();
    uint64_t v20 = v19;
    LODWORD(v28) = v25 & 1;
    uint64_t v21 = *(void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v25 = v18;
    v21(v8, v5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_6A34((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v22 = v29;
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)a2 = v26;
    *(void *)(a2 + 8) = v11;
    *(void *)(a2 + 16) = v27;
    *(void *)(a2 + 24) = v22;
    *(unsigned char *)(a2 + 32) = v28;
    *(void *)(a2 + 40) = v24;
    *(void *)(a2 + 48) = v17;
    *(void *)(a2 + 56) = v25;
    *(void *)(a2 + 64) = v20;
  }
  return result;
}

uint64_t sub_CB724(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x64496C69616D65 && a2 == 0xE700000000000000;
  if (v2 || (sub_E5C20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x80000000000F6FB0 || (sub_E5C20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656D614E6C6C7566 && a2 == 0xE800000000000000 || (sub_E5C20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6C6562616CLL && a2 == 0xE500000000000000 || (sub_E5C20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6576697463417369 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_E5C20();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_CB934@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_6898(&qword_139688);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_67EC(a1, a1[3]);
  sub_CC328();
  sub_E5CF0();
  if (v2)
  {
    sub_6A34((uint64_t)a1);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    char v37 = 0;
    uint64_t v9 = sub_E5B40();
    uint64_t v11 = v10;
    uint64_t v31 = v9;
    sub_6898(&qword_139698);
    char v36 = 1;
    sub_CC520(&qword_1396A0, &qword_139698, (void (*)(void))sub_CC37C);
    swift_bridgeObjectRetain();
    sub_E5B70();
    uint64_t v29 = a2;
    uint64_t v12 = v32;
    char v35 = 2;
    swift_bridgeObjectRetain();
    uint64_t v30 = 0;
    uint64_t v13 = sub_E5B00();
    uint64_t v15 = v14;
    uint64_t v27 = v13;
    uint64_t v28 = v12;
    char v34 = 3;
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_E5B00();
    uint64_t v18 = v17;
    uint64_t v26 = v16;
    char v33 = 4;
    swift_bridgeObjectRetain();
    char v19 = sub_E5B50();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_6A34((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v20 = v28;
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v22 = v29;
    *uint64_t v29 = v31;
    v22[1] = v11;
    uint64_t v23 = v27;
    v22[2] = v20;
    v22[3] = v23;
    uint64_t v24 = v26;
    v22[4] = v15;
    v22[5] = v24;
    _OWORD v22[6] = v18;
    *((unsigned char *)v22 + 56) = v19 & 1;
  }
  return result;
}

uint64_t sub_CBD48(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x4564726177726F66 && a2 == 0xEC0000006C69616DLL;
  if (v2 || (sub_E5C20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x80000000000F6F70 || (sub_E5C20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD00000000000001CLL && a2 == 0x80000000000F6F90 || (sub_E5C20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E6F697461636176 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_E5C20();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_CBF10@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_6898(&qword_139668);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_67EC(a1, a1[3]);
  sub_CC280();
  sub_E5CF0();
  if (v2)
  {
    sub_6A34((uint64_t)a1);
    swift_bridgeObjectRelease();
    return sub_2245C(0, 0, 1);
  }
  else
  {
    LOBYTE(v34) = 0;
    char v9 = sub_E5B10();
    LOBYTE(v34) = 1;
    uint64_t v10 = sub_E5B00();
    uint64_t v12 = v11;
    uint64_t v33 = v10;
    LOBYTE(v34) = 2;
    swift_bridgeObjectRetain();
    int v41 = sub_E5B10();
    char v42 = 3;
    sub_CC2D4();
    sub_E5B30();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v13 = v34;
    uint64_t v14 = v35;
    uint64_t v15 = v36;
    uint64_t v16 = v38;
    uint64_t v31 = v36;
    uint64_t v32 = v39;
    uint64_t v27 = v37;
    uint64_t v28 = v40;
    uint64_t v29 = v35;
    uint64_t v30 = v34;
    sub_22798(v34, v35, v36);
    sub_2245C(0, 0, 1);
    swift_bridgeObjectRetain();
    uint64_t v26 = v16;
    sub_22798(v13, v14, v15);
    sub_2245C(v30, v29, v31);
    swift_bridgeObjectRelease();
    sub_6A34((uint64_t)a1);
    swift_bridgeObjectRelease();
    uint64_t v18 = v29;
    uint64_t v17 = v30;
    uint64_t v19 = v31;
    uint64_t v20 = v26;
    uint64_t v21 = v28;
    uint64_t result = sub_2245C(v30, v29, v31);
    *(unsigned char *)a2 = v9;
    *(void *)(a2 + 8) = v33;
    *(void *)(a2 + 16) = v12;
    *(unsigned char *)(a2 + 24) = v41;
    *(void *)(a2 + 32) = v17;
    *(void *)(a2 + 40) = v18;
    uint64_t v23 = v27;
    *(void *)(a2 + 48) = v19;
    *(void *)(a2 + 56) = v23;
    uint64_t v24 = v32;
    *(void *)(a2 + 64) = v20;
    *(void *)(a2 + 72) = v24;
    *(void *)(a2 + 80) = v21;
  }
  return result;
}

unint64_t sub_CC280()
{
  unint64_t result = qword_139670;
  if (!qword_139670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139670);
  }
  return result;
}

unint64_t sub_CC2D4()
{
  unint64_t result = qword_139678;
  if (!qword_139678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139678);
  }
  return result;
}

unint64_t sub_CC328()
{
  unint64_t result = qword_139690;
  if (!qword_139690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139690);
  }
  return result;
}

unint64_t sub_CC37C()
{
  unint64_t result = qword_1396A8;
  if (!qword_1396A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1396A8);
  }
  return result;
}

unint64_t sub_CC3D0()
{
  unint64_t result = qword_1396C0;
  if (!qword_1396C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1396C0);
  }
  return result;
}

unint64_t sub_CC424()
{
  unint64_t result = qword_1396D0;
  if (!qword_1396D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1396D0);
  }
  return result;
}

unint64_t sub_CC478()
{
  unint64_t result = qword_1396E0;
  if (!qword_1396E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1396E0);
  }
  return result;
}

unint64_t sub_CC4CC()
{
  unint64_t result = qword_1396F0;
  if (!qword_1396F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1396F0);
  }
  return result;
}

uint64_t sub_CC520(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_62A4(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_CC58C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7541656C62616E65 && a2 == 0xEF796C7065526F74;
  if (v2 || (sub_E5C20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000000000F6FF0 || (sub_E5C20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E6F697461636176 && a2 == 0xEF65746144646E45 || (sub_E5C20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x80000000000F7010)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_E5C20();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_CC784@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_6898(&qword_139728);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_67EC(a1, a1[3]);
  sub_CCE84();
  sub_E5CF0();
  if (v2)
  {
    sub_6A34((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    char v29 = 0;
    int v9 = sub_E5B10();
    char v28 = 1;
    uint64_t v10 = sub_E5B00();
    uint64_t v12 = v11;
    uint64_t v24 = v10;
    int v25 = v9;
    char v27 = 2;
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_E5B00();
    uint64_t v15 = v14;
    uint64_t v23 = v13;
    char v26 = 3;
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_E5B00();
    uint64_t v18 = v17;
    uint64_t v19 = *(void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v22 = v16;
    v19(v8, v5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_6A34((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    *(unsigned char *)a2 = v25;
    *(void *)(a2 + 8) = v24;
    *(void *)(a2 + 16) = v12;
    *(void *)(a2 + 24) = v23;
    *(void *)(a2 + 32) = v15;
    *(void *)(a2 + 40) = v22;
    *(void *)(a2 + 48) = v18;
  }
  return result;
}

uint64_t sub_CCA54(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000013 && a2 == 0x80000000000F6FD0 || (sub_E5C20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x69614D6873617274 && a2 == 0xEE004449786F626CLL || (sub_E5C20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C69614D746E6573 && a2 == 0xEF656D614E786F62)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = sub_E5C20();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_CCBF0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_6898(&qword_139710);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_67EC(a1, a1[3]);
  sub_CCE30();
  sub_E5CF0();
  if (v2)
  {
    sub_6A34((uint64_t)a1);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    char v24 = 0;
    uint64_t v9 = sub_E5B00();
    uint64_t v11 = v10;
    uint64_t v21 = v9;
    char v23 = 1;
    uint64_t v12 = sub_E5B00();
    uint64_t v14 = v13;
    uint64_t v20 = v12;
    char v22 = 2;
    uint64_t v15 = sub_E5B00();
    uint64_t v16 = v8;
    uint64_t v18 = v17;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v16, v5);
    uint64_t result = sub_6A34((uint64_t)a1);
    *a2 = v21;
    a2[1] = v11;
    a2[2] = v20;
    a2[3] = v14;
    a2[4] = v15;
    a2[5] = v18;
  }
  return result;
}

unint64_t sub_CCE30()
{
  unint64_t result = qword_139718;
  if (!qword_139718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139718);
  }
  return result;
}

unint64_t sub_CCE84()
{
  unint64_t result = qword_139730;
  if (!qword_139730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139730);
  }
  return result;
}

uint64_t sub_CCED8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6449626F6ALL && a2 == 0xE500000000000000;
  if (v2 || (sub_E5C20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C69616D65 && a2 == 0xE500000000000000 || (sub_E5C20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x737574617473 && a2 == 0xE600000000000000 || (sub_E5C20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6D69547472617473 && a2 == 0xE900000000000065 || (sub_E5C20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x656D6954646E65 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_E5C20();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_CD0EC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_6898(&qword_139740);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_67EC(a1, a1[3]);
  sub_CD3F8();
  sub_E5CF0();
  if (v2) {
    return sub_6A34((uint64_t)a1);
  }
  char v31 = 0;
  uint64_t v9 = sub_E5B40();
  uint64_t v11 = v10;
  uint64_t v25 = v9;
  char v30 = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_E5B40();
  uint64_t v14 = v13;
  uint64_t v23 = v12;
  char v28 = 2;
  sub_CD44C();
  swift_bridgeObjectRetain();
  uint64_t v24 = v14;
  sub_E5B70();
  int v22 = v29;
  char v27 = 3;
  uint64_t v21 = sub_E5B60();
  char v26 = 4;
  uint64_t v15 = sub_E5B20();
  char v17 = v16;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_6A34((uint64_t)a1);
  uint64_t v18 = v24;
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v25;
  *(void *)(a2 + 8) = v11;
  *(void *)(a2 + 16) = v23;
  *(void *)(a2 + 24) = v18;
  *(unsigned char *)(a2 + 32) = v22;
  *(void *)(a2 + 40) = v21;
  *(void *)(a2 + 48) = v15;
  *(unsigned char *)(a2 + 56) = v17 & 1;
  return result;
}

unint64_t sub_CD3F8()
{
  unint64_t result = qword_139748;
  if (!qword_139748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139748);
  }
  return result;
}

unint64_t sub_CD44C()
{
  unint64_t result = qword_139750;
  if (!qword_139750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139750);
  }
  return result;
}

unint64_t sub_CD4A0()
{
  unint64_t result = qword_139760;
  if (!qword_139760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139760);
  }
  return result;
}

unint64_t sub_CD4F4()
{
  unint64_t result = qword_139770;
  if (!qword_139770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139770);
  }
  return result;
}

unint64_t sub_CD548()
{
  unint64_t result = qword_139788;
  if (!qword_139788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139788);
  }
  return result;
}

uint64_t sub_CD59C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_CD5E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ImportProviderImage(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_CD648(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_CD6A8()
{
  unint64_t result = qword_1397C0;
  if (!qword_1397C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1397C0);
  }
  return result;
}

uint64_t sub_CD6FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

ValueMetadata *type metadata accessor for ImportProviderImage.CodingKeys()
{
  return &type metadata for ImportProviderImage.CodingKeys;
}

ValueMetadata *type metadata accessor for ImportProvider.CodingKeys()
{
  return &type metadata for ImportProvider.CodingKeys;
}

ValueMetadata *type metadata accessor for CustomDomain.CodingKeys()
{
  return &type metadata for CustomDomain.CodingKeys;
}

ValueMetadata *type metadata accessor for ImportListItem.CodingKeys()
{
  return &type metadata for ImportListItem.CodingKeys;
}

ValueMetadata *type metadata accessor for AutoReply.CodingKeys()
{
  return &type metadata for AutoReply.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for SharedPreference.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0xCD894);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SharedPreference.CodingKeys()
{
  return &type metadata for SharedPreference.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for Account.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0xCD998);
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

ValueMetadata *type metadata accessor for Account.CodingKeys()
{
  return &type metadata for Account.CodingKeys;
}

unsigned char *_s18icloudMailSettings12CustomDomainV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0xCDA9CLL);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Alias.CodingKeys()
{
  return &type metadata for Alias.CodingKeys;
}

unsigned char *_s18icloudMailSettings14ImportProviderV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0xCDBA0);
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

ValueMetadata *type metadata accessor for ServerPreference.CodingKeys()
{
  return &type metadata for ServerPreference.CodingKeys;
}

uint64_t sub_CDBDC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Domain(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for Domain(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for Domain(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Domain(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
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
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Domain()
{
  return &type metadata for Domain;
}

uint64_t getEnumTagSinglePayload for ImportStatus(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
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
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ImportStatus(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0xCDEA0);
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

ValueMetadata *type metadata accessor for ImportStatus()
{
  return &type metadata for ImportStatus;
}

unint64_t sub_CDEDC()
{
  unint64_t result = qword_1397D0;
  if (!qword_1397D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1397D0);
  }
  return result;
}

unint64_t sub_CDF34()
{
  unint64_t result = qword_1397D8;
  if (!qword_1397D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1397D8);
  }
  return result;
}

unint64_t sub_CDF8C()
{
  unint64_t result = qword_1397E0;
  if (!qword_1397E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1397E0);
  }
  return result;
}

unint64_t sub_CDFE4()
{
  unint64_t result = qword_1397E8;
  if (!qword_1397E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1397E8);
  }
  return result;
}

unint64_t sub_CE03C()
{
  unint64_t result = qword_1397F0;
  if (!qword_1397F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1397F0);
  }
  return result;
}

unint64_t sub_CE094()
{
  unint64_t result = qword_1397F8;
  if (!qword_1397F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1397F8);
  }
  return result;
}

unint64_t sub_CE0EC()
{
  unint64_t result = qword_139800;
  if (!qword_139800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139800);
  }
  return result;
}

unint64_t sub_CE144()
{
  unint64_t result = qword_139808;
  if (!qword_139808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139808);
  }
  return result;
}

unint64_t sub_CE19C()
{
  unint64_t result = qword_139810;
  if (!qword_139810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139810);
  }
  return result;
}

unint64_t sub_CE1F4()
{
  unint64_t result = qword_139818;
  if (!qword_139818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139818);
  }
  return result;
}

unint64_t sub_CE24C()
{
  unint64_t result = qword_139820;
  if (!qword_139820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139820);
  }
  return result;
}

unint64_t sub_CE2A4()
{
  unint64_t result = qword_139828;
  if (!qword_139828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139828);
  }
  return result;
}

unint64_t sub_CE2FC()
{
  unint64_t result = qword_139830;
  if (!qword_139830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139830);
  }
  return result;
}

unint64_t sub_CE354()
{
  unint64_t result = qword_139838;
  if (!qword_139838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139838);
  }
  return result;
}

unint64_t sub_CE3AC()
{
  unint64_t result = qword_139840;
  if (!qword_139840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139840);
  }
  return result;
}

unint64_t sub_CE404()
{
  unint64_t result = qword_139848;
  if (!qword_139848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139848);
  }
  return result;
}

unint64_t sub_CE45C()
{
  unint64_t result = qword_139850;
  if (!qword_139850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139850);
  }
  return result;
}

unint64_t sub_CE4B4()
{
  unint64_t result = qword_139858;
  if (!qword_139858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139858);
  }
  return result;
}

unint64_t sub_CE50C()
{
  unint64_t result = qword_139860;
  if (!qword_139860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139860);
  }
  return result;
}

unint64_t sub_CE564()
{
  unint64_t result = qword_139868;
  if (!qword_139868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139868);
  }
  return result;
}

unint64_t sub_CE5BC()
{
  unint64_t result = qword_139870;
  if (!qword_139870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139870);
  }
  return result;
}

unint64_t sub_CE614()
{
  unint64_t result = qword_139878;
  if (!qword_139878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139878);
  }
  return result;
}

unint64_t sub_CE66C()
{
  unint64_t result = qword_139880;
  if (!qword_139880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139880);
  }
  return result;
}

unint64_t sub_CE6C4()
{
  unint64_t result = qword_139888;
  if (!qword_139888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139888);
  }
  return result;
}

unint64_t sub_CE71C()
{
  unint64_t result = qword_139890;
  if (!qword_139890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139890);
  }
  return result;
}

unint64_t sub_CE774()
{
  unint64_t result = qword_139898;
  if (!qword_139898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139898);
  }
  return result;
}

unint64_t sub_CE7CC()
{
  unint64_t result = qword_1398A0;
  if (!qword_1398A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1398A0);
  }
  return result;
}

unint64_t sub_CE824()
{
  unint64_t result = qword_1398A8;
  if (!qword_1398A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1398A8);
  }
  return result;
}

unint64_t sub_CE878()
{
  unint64_t result = qword_1398B8;
  if (!qword_1398B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1398B8);
  }
  return result;
}

unint64_t sub_CE8CC()
{
  unint64_t result = qword_1398C8;
  if (!qword_1398C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1398C8);
  }
  return result;
}

uint64_t sub_CE920(uint64_t a1, void *a2)
{
  v6._uint64_t countAndFlagsBits = a1;
  v3._rawValue = &off_120858;
  v6._object = a2;
  unint64_t v4 = sub_E5AF0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 8) {
    return 8;
  }
  else {
    return v4;
  }
}

uint64_t sub_CE96C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x72656469766F7270 && a2 == 0xE800000000000000;
  if (v2 || (sub_E5C20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x80000000000F7030 || (sub_E5C20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6567616D69 && a2 == 0xE500000000000000 || (sub_E5C20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x4E79616C70736964 && a2 == 0xEB00000000656D61)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_E5C20();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_CEB30(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x746867696CLL && a2 == 0xE500000000000000;
  if (v2 || (sub_E5C20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1802658148 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_E5C20();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

unsigned char *_s18icloudMailSettings19ImportProviderImageV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0xCECD8);
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

ValueMetadata *type metadata accessor for Domain.CodingKeys()
{
  return &type metadata for Domain.CodingKeys;
}

unint64_t sub_CED14()
{
  unint64_t result = qword_1398D0;
  if (!qword_1398D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1398D0);
  }
  return result;
}

unint64_t sub_CED6C()
{
  unint64_t result = qword_1398D8;
  if (!qword_1398D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1398D8);
  }
  return result;
}

unint64_t sub_CEDC4()
{
  unint64_t result = qword_1398E0;
  if (!qword_1398E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1398E0);
  }
  return result;
}

uint64_t sub_CEE1C()
{
  return sub_10AE4();
}

uint64_t sub_CEE30()
{
  return sub_10AE4();
}

uint64_t sub_CEE44@<X0>(void *a1@<X8>)
{
  return sub_AB2C(a1);
}

uint64_t sub_CEE58()
{
  return sub_ABBC();
}

uint64_t sub_CEE6C()
{
  return sub_10AE4();
}

uint64_t sub_CEE80@<X0>(void *a1@<X8>)
{
  return sub_AB2C(a1);
}

uint64_t sub_CEE94()
{
  return sub_ABBC();
}

uint64_t sub_CEEA8()
{
  return sub_10BEC();
}

uint64_t sub_CEEBC()
{
  return sub_10BEC();
}

uint64_t sub_CEED0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v34 = a1;
  uint64_t v5 = sub_E4320();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v38 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v34 - v9;
  if (qword_131238 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_67B4(v5, (uint64_t)qword_148D58);
  uint64_t v37 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v37(v10, v11, v5);
  uint64_t v12 = sub_E4300();
  os_log_type_t v13 = sub_E5870();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&def_66DD4, v12, v13, "[Add Alias] create started", v14, 2u);
    swift_slowDealloc();
  }

  uint64_t v35 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v36 = v6 + 8;
  v35(v10, v5);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_E45B0();
  swift_release();
  swift_release();
  uint64_t v15 = swift_bridgeObjectRetain();
  uint64_t v16 = sub_161DC(v15);
  unint64_t v18 = v17;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v18)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    *(void *)&long long v40 = v16;
    *((void *)&v40 + 1) = v18;
    *(_OWORD *)int v41 = xmmword_E9F60;
    *(void *)&v41[16] = 0;
    v41[24] = 1;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_E45C0();
    uint64_t v19 = v38;
    v37(v38, v11, v5);
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_E4300();
    os_log_type_t v21 = sub_E5870();
    if (os_log_type_enabled(v20, v21))
    {
      int v22 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v40 = swift_slowAlloc();
      *(_DWORD *)int v22 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v39 = sub_57A98(v16, v18, (uint64_t *)&v40);
      sub_E5900();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&def_66DD4, v20, v21, "%s", v22, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v23 = v38;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v23 = v19;
    }
    return ((uint64_t (*)(char *, uint64_t))v35)(v23, v5);
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(v40) = 1;
    swift_retain();
    sub_E45C0();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_E45B0();
    swift_release();
    swift_release();
    long long v24 = v40;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_E45B0();
    swift_release();
    swift_release();
    long long v25 = v40;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_E45B0();
    swift_release();
    swift_release();
    long long v26 = v40;
    swift_bridgeObjectRelease();
    uint64_t v27 = HIBYTE(*((void *)&v26 + 1)) & 0xFLL;
    if ((*((void *)&v26 + 1) & 0x2000000000000000) == 0) {
      uint64_t v27 = v26 & 0xFFFFFFFFFFFFLL;
    }
    if (v27)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      sub_E45B0();
      swift_release();
      swift_release();
      uint64_t v28 = *((void *)&v40 + 1);
      uint64_t v27 = v40;
    }
    else
    {
      uint64_t v28 = 0;
    }
    long long v40 = v24;
    *(void *)int v41 = &off_11FA40;
    *(_OWORD *)&v41[8] = v25;
    *(void *)&v41[24] = v27;
    *(void *)&v41[32] = v28;
    v41[40] = 1;
    sub_67EC((void *)(v3 + OBJC_IVAR____TtCV18icloudMailSettings14MSAddAliasView9ViewModel_repository), *(void *)(v3 + OBJC_IVAR____TtCV18icloudMailSettings14MSAddAliasView9ViewModel_repository + 24));
    uint64_t v39 = sub_8CEA4(&v40);
    uint64_t v30 = swift_allocObject();
    swift_weakInit();
    uint64_t v31 = swift_allocObject();
    long long v32 = *(_OWORD *)v41;
    *(_OWORD *)(v31 + 16) = v40;
    *(_OWORD *)(v31 + 32) = v32;
    *(_OWORD *)(v31 + 48) = *(_OWORD *)&v41[16];
    *(_OWORD *)(v31 + 57) = *(_OWORD *)&v41[25];
    *(void *)(v31 + 80) = v30;
    uint64_t v33 = swift_allocObject();
    *(void *)(v33 + 16) = v34;
    *(void *)(v33 + 24) = a2;
    swift_retain();
    sub_6898(&qword_1322D8);
    sub_D0BFC((unint64_t *)&qword_1322E0, &qword_1322D8);
    sub_E4610();
    swift_release();
    swift_release();
    swift_release();
    swift_beginAccess();
    sub_E44F0();
    swift_endAccess();
    return swift_release();
  }
}

double sub_CF5E8@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_E45B0();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = v6;
  return result;
}

uint64_t sub_CF674()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_E4320();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = &v21[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v22[0]) = 1;
  swift_retain();
  sub_E45C0();
  if (qword_131238 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_67B4(v2, (uint64_t)qword_148D58);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_E4300();
  os_log_type_t v8 = sub_E5870();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&def_66DD4, v7, v8, "[Add Alias] Fetch validation rules", v9, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v10 = sub_67EC((void *)(v1 + OBJC_IVAR____TtCV18icloudMailSettings14MSAddAliasView9ViewModel_repository), *(void *)(v1 + OBJC_IVAR____TtCV18icloudMailSettings14MSAddAliasView9ViewModel_repository + 24));
  uint64_t v11 = *(void **)(*v10 + 16);
  uint64_t v12 = *(void **)(*v10 + 24);
  os_log_type_t v13 = (objc_class *)type metadata accessor for iCloudMailValidationRulesAPIRequest();
  memset(v22, 0, sizeof(v22));
  uint64_t v23 = 0;
  id v14 = objc_allocWithZone(v13);
  sub_6830((uint64_t)v22, (uint64_t)v21);
  id v15 = v11;
  id v16 = v12;
  id v17 = sub_2EF30(v11, v16, (uint64_t)v21);

  sub_68DC((uint64_t)v22);
  uint64_t v18 = sub_19960();

  *(void *)&v22[0] = v18;
  swift_allocObject();
  swift_weakInit();
  swift_allocObject();
  swift_weakInit();
  sub_6898(&qword_139A38);
  sub_D0BFC(qword_139A40, &qword_139A38);
  sub_E4610();
  swift_release();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_E44F0();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_CF9E0(uint64_t a1)
{
  uint64_t v2 = sub_E4320();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = &v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (*(void *)(a1 + 8))
  {
    if (qword_131238 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_67B4(v2, (uint64_t)qword_148D58);
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
    uint64_t v7 = sub_E4300();
    os_log_type_t v8 = sub_E5880();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&def_66DD4, v7, v8, "[Add Alias] Unable to fetch email validation rules", v9, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v11[7] = 0;
    return sub_E45C0();
  }
  return result;
}

uint64_t sub_CFBE4(uint64_t *a1)
{
  uint64_t v2 = sub_E4320();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *a1;
  if (qword_131238 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_67B4(v2, (uint64_t)qword_148D58);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v7, v2);
  swift_bridgeObjectRetain();
  os_log_type_t v8 = sub_E4300();
  os_log_type_t v9 = sub_E5870();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 134217984;
    v12[1] = *(void *)(v6 + 16);
    sub_E5900();
    swift_bridgeObjectRelease();
    _os_log_impl(&def_66DD4, v8, v9, "[Add Alias] Email validation rules count: %ld", v10, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    *(void *)(result + OBJC_IVAR____TtCV18icloudMailSettings14MSAddAliasView9ViewModel_rules) = v6;
    swift_bridgeObjectRetain();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_CFE2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_E4320();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v39 - v11;
  uint64_t v14 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v15 = *(void *)(a1 + 16);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v46 = *(void *)(a1 + 24);
  uint64_t v47 = v16;
  LODWORD(v44) = *(unsigned __int8 *)(a1 + 40);
  sub_5CF84(a2);
  uint64_t v17 = sub_3A3F4();
  sub_5CFD8(a2);
  uint64_t v45 = v15;
  if (v17)
  {
    uint64_t v41 = sub_E5530();
    unint64_t v19 = v18;
    swift_bridgeObjectRelease();
    if (qword_131238 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_67B4(v6, (uint64_t)qword_148D58);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v12, v20, v6);
    swift_bridgeObjectRetain();
    os_log_type_t v21 = sub_E4300();
    os_log_type_t v22 = sub_E5880();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v40 = v13;
      uint64_t v23 = swift_slowAlloc();
      char v42 = v10;
      long long v24 = (uint8_t *)v23;
      uint64_t v25 = swift_slowAlloc();
      uint64_t v39 = a3;
      uint64_t v49 = v25;
      uint64_t v43 = v14;
      *(_DWORD *)long long v24 = 136642819;
      swift_bridgeObjectRetain();
      v55[0] = sub_57A98(v41, v19, &v49);
      uint64_t v13 = v40;
      uint64_t v14 = v43;
      sub_E5900();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&def_66DD4, v21, v22, "[Add Alias] params: %{sensitive}s", v24, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v10 = v42;
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    uint64_t v15 = v45;
  }
  if (qword_131238 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_67B4(v6, (uint64_t)qword_148D58);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v26, v6);
  uint64_t v27 = v46 & 1;
  LODWORD(v46) = v44 & 1;
  swift_bridgeObjectRetain_n();
  uint64_t v28 = v10;
  unsigned __int8 v29 = sub_E4300();
  os_log_type_t v30 = sub_E5880();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v43 = v14;
    uint64_t v44 = v27;
    char v42 = v28;
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    v55[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v31 = 136315138;
    if (v13)
    {
      uint64_t v49 = v43;
      uint64_t v50 = v13;
      uint64_t v51 = v15;
      LOBYTE(v52) = v44 != 0;
      uint64_t v53 = v47;
      BOOL v54 = v46 != 0;
      sub_69E0();
      uint64_t v32 = sub_E5C60();
      unint64_t v34 = v33;
    }
    else
    {
      uint64_t v32 = 0;
      unint64_t v34 = 0xE000000000000000;
    }
    uint64_t v49 = sub_57A98(v32, v34, v55);
    sub_E5900();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&def_66DD4, v29, v30, "[Add Alias] create failed: %s", v31, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v7 + 8))(v42, v6);
    uint64_t v14 = v43;
    uint64_t v27 = v44;
    uint64_t v15 = v45;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v28, v6);
  }
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  uint64_t v36 = v47;
  BOOL v37 = v46;
  if (Strong)
  {
    if (!v13)
    {
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      uint64_t v27 = 0;
      uint64_t v36 = 0;
      BOOL v37 = 0;
    }
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v49 = v14;
    uint64_t v50 = v13;
    uint64_t v51 = v15;
    uint64_t v52 = v27;
    uint64_t v53 = v36;
    BOOL v54 = v37;
    swift_bridgeObjectRetain();
    sub_E45C0();
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    char v48 = 0;
    return sub_E45C0();
  }
  return result;
}

uint64_t sub_D0464(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = sub_E4320();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_131238 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_67B4(v3, (uint64_t)qword_148D58);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  uint64_t v8 = sub_E4300();
  os_log_type_t v9 = sub_E5870();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&def_66DD4, v8, v9, "[Add Alias] create successful", v10, 2u);
    swift_slowDealloc();
  }

  uint64_t v11 = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return a2(v11);
}

uint64_t sub_D060C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCV18icloudMailSettings14MSAddAliasView9ViewModel__fullName;
  uint64_t v2 = sub_6898(&qword_131D08);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtCV18icloudMailSettings14MSAddAliasView9ViewModel__emailId, v2);
  v3(v0 + OBJC_IVAR____TtCV18icloudMailSettings14MSAddAliasView9ViewModel__label, v2);
  uint64_t v4 = v0 + OBJC_IVAR____TtCV18icloudMailSettings14MSAddAliasView9ViewModel__isAdding;
  uint64_t v5 = sub_6898(&qword_131480);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  uint64_t v7 = v0 + OBJC_IVAR____TtCV18icloudMailSettings14MSAddAliasView9ViewModel__error;
  uint64_t v8 = sub_6898(&qword_131488);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  v6(v0 + OBJC_IVAR____TtCV18icloudMailSettings14MSAddAliasView9ViewModel__isFetchingRules, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = v0 + OBJC_IVAR____TtCV18icloudMailSettings14MSAddAliasView9ViewModel__validationMessage;
  uint64_t v10 = sub_6898(&qword_134908);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  swift_bridgeObjectRelease();
  sub_6A34(v0 + OBJC_IVAR____TtCV18icloudMailSettings14MSAddAliasView9ViewModel_repository);
  return v0;
}

uint64_t sub_D07FC()
{
  sub_D060C();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_D0854()
{
  return _s9ViewModelCMa_6();
}

uint64_t _s9ViewModelCMa_6()
{
  uint64_t result = qword_139960;
  if (!qword_139960) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_D08A8()
{
  sub_11AC0(319, (unint64_t *)&qword_1319E8);
  if (v0 <= 0x3F)
  {
    sub_11AC0(319, (unint64_t *)&qword_1312E8);
    if (v1 <= 0x3F)
    {
      sub_62EC(319, (unint64_t *)&qword_1312F0, &qword_1312F8);
      if (v2 <= 0x3F)
      {
        sub_62EC(319, (unint64_t *)&unk_137E98, &qword_1331D8);
        if (v3 <= 0x3F) {
          swift_updateClassMetadata2();
        }
      }
    }
  }
}

uint64_t sub_D0A68@<X0>(void *a1@<X8>)
{
  return sub_AB2C(a1);
}

uint64_t sub_D0A90()
{
  return sub_ABBC();
}

uint64_t sub_D0AB8@<X0>(void *a1@<X8>)
{
  return sub_AB2C(a1);
}

uint64_t sub_D0AE0()
{
  return sub_ABBC();
}

uint64_t sub_D0B08()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_D0B40()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 88, 7);
}

uint64_t sub_D0B98(uint64_t a1)
{
  return sub_CFE2C(a1, v1 + 16, *(void *)(v1 + 80));
}

uint64_t sub_D0BA4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_D0BDC(uint64_t a1)
{
  return sub_D0464(a1, *(uint64_t (**)(uint64_t))(v1 + 16));
}

uint64_t sub_D0BEC(uint64_t a1)
{
  return sub_CF9E0(a1);
}

uint64_t sub_D0BF4(uint64_t *a1)
{
  return sub_CFBE4(a1);
}

uint64_t sub_D0BFC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_62A4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_D0C4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 32);
}

void sub_D0C54()
{
  sub_767C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t *sub_D0CFC(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_6898(&qword_1314A8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_E47F0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[8];
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
    uint64_t v10 = a3[10];
    *(uint64_t *)((char *)a1 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    *(uint64_t *)((char *)a1 + v10) = *(uint64_t *)((char *)a2 + v10);
    uint64_t v11 = a3[11];
    uint64_t v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = *(void *)v13;
    uint64_t v15 = *((void *)v13 + 1);
    char v16 = v13[16];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_6D60();
    *(void *)uint64_t v12 = v14;
    *((void *)v12 + 1) = v15;
    unsigned char v12[16] = v16;
  }
  return a1;
}

uint64_t sub_D0E8C(uint64_t a1)
{
  sub_6898(&qword_1314A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_E47F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return sub_6E40();
}

void *sub_D0F64(void *a1, void *a2, int *a3)
{
  sub_6898(&qword_1314A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_E47F0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *(void *)((char *)a1 + v7) = *(void *)((char *)a2 + v7);
  uint64_t v8 = a3[10];
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  *(void *)((char *)a1 + v8) = *(void *)((char *)a2 + v8);
  uint64_t v9 = a3[11];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = *(void *)v11;
  uint64_t v13 = *((void *)v11 + 1);
  char v14 = v11[16];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_6D60();
  *(void *)uint64_t v10 = v12;
  *((void *)v10 + 1) = v13;
  unsigned char v10[16] = v14;
  return a1;
}

void *sub_D10A4(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_102B4((uint64_t)a1, &qword_1314A8);
    sub_6898(&qword_1314A8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_E47F0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[11];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(void *)v9;
  uint64_t v11 = *((void *)v9 + 1);
  char v12 = v9[16];
  sub_6D60();
  *(void *)uint64_t v8 = v10;
  *((void *)v8 + 1) = v11;
  unsigned char v8[16] = v12;
  sub_6E40();
  return a1;
}

char *sub_D122C(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_6898(&qword_1314A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_E47F0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[8];
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  *(void *)&a1[v8] = *(void *)&a2[v8];
  uint64_t v9 = a3[10];
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  *(void *)&a1[v9] = *(void *)&a2[v9];
  uint64_t v10 = a3[11];
  uint64_t v11 = &a1[v10];
  char v12 = &a2[v10];
  *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
  v11[16] = v12[16];
  return a1;
}

char *sub_D1338(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_102B4((uint64_t)a1, &qword_1314A8);
    uint64_t v6 = sub_6898(&qword_1314A8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_E47F0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[8]] = *(void *)&a2[a3[8]];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[10]] = *(void *)&a2[a3[10]];
  swift_bridgeObjectRelease();
  uint64_t v8 = a3[11];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  char v11 = v10[16];
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  unsigned char v9[16] = v11;
  sub_6E40();
  return a1;
}

uint64_t sub_D1490(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_D14A4);
}

uint64_t sub_D14A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_6898(&qword_1314B0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 28));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_D1568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_D157C);
}

uint64_t sub_D157C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_6898(&qword_1314B0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for MSRuleBaseView()
{
  return sub_7D6B8();
}

uint64_t sub_D1654(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 8);
}

uint64_t sub_D165C(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF4) {
    goto LABEL_17;
  }
  if (a2 + 12 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 12) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 12;
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
      return (*a1 | (v4 << 8)) - 12;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 12;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xD;
  int v8 = v6 - 13;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *sub_D16EC(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 12 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 12) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF3)
  {
    unsigned int v6 = ((a2 - 244) >> 8) + 1;
    *uint64_t result = a2 + 12;
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
        JUMPOUT(0xD17B8);
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
          *uint64_t result = a2 + 12;
        break;
    }
  }
  return result;
}

uint64_t type metadata accessor for MSRuleBaseView.RuleFormElement()
{
  return sub_7D6B8();
}

uint64_t sub_D17F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_E4C40();
  __chkstk_darwin(v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_E4C50();
}

uint64_t sub_D18F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_E4C40();
  __chkstk_darwin(v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_E4C50();
}

uint64_t sub_D19E8(uint64_t TupleTypeMetadata, unint64_t a2, uint64_t a3)
{
  uint64_t v4 = (uint64_t *)TupleTypeMetadata;
  uint64_t v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    uint64_t v6 = *v5;
  }
  else
  {
    __chkstk_darwin(TupleTypeMetadata);
    uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (a2)
    {
      unint64_t v9 = 0;
      if (a2 < 4) {
        goto LABEL_9;
      }
      if ((unint64_t)(v8 - (char *)v5) < 0x20) {
        goto LABEL_9;
      }
      unint64_t v9 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      unint64_t v10 = (long long *)(v5 + 2);
      char v11 = v8 + 16;
      unint64_t v12 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        long long v13 = *v10;
        *(v11 - 1) = *(v10 - 1);
        _OWORD *v11 = v13;
        v10 += 2;
        v11 += 2;
        v12 -= 4;
      }
      while (v12);
      if (v9 != a2)
      {
LABEL_9:
        unint64_t v14 = a2 - v9;
        uint64_t v15 = v9;
        char v16 = &v8[8 * v9];
        uint64_t v17 = &v5[v15];
        do
        {
          uint64_t v18 = *v17++;
          *(void *)char v16 = v18;
          v16 += 8;
          --v14;
        }
        while (v14);
      }
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
    uint64_t v6 = TupleTypeMetadata;
  }
  __chkstk_darwin(TupleTypeMetadata);
  uint64_t v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    os_log_type_t v21 = (int *)(v6 + 32);
    unint64_t v22 = a2;
    do
    {
      if (a2 == 1) {
        int v23 = 0;
      }
      else {
        int v23 = *v21;
      }
      uint64_t v25 = *v5++;
      uint64_t v24 = v25;
      uint64_t v26 = *v4++;
      (*(void (**)(char *, uint64_t))(*(void *)(v24 - 8) + 16))(&v20[v23], v26);
      v21 += 4;
      --v22;
    }
    while (v22);
  }
  return sub_E5450();
}

uint64_t sub_D1BAC(uint64_t a1)
{
  uint64_t v1 = __chkstk_darwin(a1);
  v2(v1);
  return sub_E53B0();
}

uint64_t sub_D1C7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v71 = a2;
  uint64_t v66 = a1;
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v68 = v2;
  uint64_t v69 = v4;
  uint64_t v70 = *(void *)(v4 + 64);
  __chkstk_darwin(a1);
  uint64_t v67 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_E4890();
  sub_62A4(&qword_139B48);
  uint64_t v65 = *(void *)(a1 + 16);
  uint64_t v6 = type metadata accessor for MSRuleBaseView.RuleFormElement();
  uint64_t v7 = sub_E57B0();
  uint64_t v8 = sub_62A4(&qword_139B50);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v10 = swift_getWitnessTable();
  *(void *)&long long v81 = v7;
  *((void *)&v81 + 1) = v6;
  *(void *)&long long v82 = v8;
  *((void *)&v82 + 1) = WitnessTable;
  *(void *)&v83[0] = v10;
  sub_E5360();
  uint64_t v80 = sub_DC298(&qword_139B58, &qword_139B50, (void (*)(void))sub_DC048, (void (*)(void))sub_DC25C);
  swift_getWitnessTable();
  sub_E52B0();
  sub_62A4(&qword_139C58);
  sub_E4C60();
  sub_E58F0();
  sub_E4C60();
  sub_E4C60();
  uint64_t v11 = sub_E4C60();
  *(void *)&long long v81 = v7;
  *((void *)&v81 + 1) = v6;
  *(void *)&long long v82 = v11;
  *((void *)&v82 + 1) = WitnessTable;
  *(void *)&v83[0] = v10;
  sub_E5360();
  sub_62A4(&qword_138D20);
  sub_E53C0();
  swift_getTupleTypeMetadata2();
  uint64_t v12 = sub_E5440();
  uint64_t v13 = swift_getWitnessTable();
  *(void *)&long long v81 = &type metadata for Never;
  *((void *)&v81 + 1) = v12;
  *(void *)&long long v82 = &protocol witness table for Never;
  *((void *)&v82 + 1) = v13;
  uint64_t v14 = sub_E4EB0();
  uint64_t v15 = swift_getWitnessTable();
  unint64_t v16 = sub_E3F8();
  *(void *)&long long v81 = v14;
  *((void *)&v81 + 1) = &type metadata for String;
  *(void *)&long long v82 = v15;
  *((void *)&v82 + 1) = v16;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  *(void *)&long long v81 = v14;
  *((void *)&v81 + 1) = &type metadata for String;
  *(void *)&long long v82 = v15;
  *((void *)&v82 + 1) = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  *(void *)&long long v81 = OpaqueTypeMetadata2;
  *((void *)&v81 + 1) = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeMetadata2();
  uint64_t v20 = sub_62A4(&qword_131588);
  *(void *)&long long v81 = OpaqueTypeMetadata2;
  *((void *)&v81 + 1) = OpaqueTypeConformance2;
  uint64_t v21 = swift_getOpaqueTypeConformance2();
  uint64_t v22 = sub_105AC(&qword_1315C0, &qword_131588);
  *(void *)&long long v81 = v19;
  *((void *)&v81 + 1) = v20;
  *(void *)&long long v82 = v21;
  *((void *)&v82 + 1) = v22;
  uint64_t v52 = swift_getOpaqueTypeMetadata2();
  *(void *)&long long v81 = v19;
  *((void *)&v81 + 1) = v20;
  *(void *)&long long v82 = v21;
  *((void *)&v82 + 1) = v22;
  swift_getOpaqueTypeConformance2();
  uint64_t v23 = sub_E4940();
  uint64_t v56 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v25 = (char *)&v50 - v24;
  uint64_t v26 = sub_E4920();
  uint64_t v55 = v26;
  uint64_t v64 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v51 = (char *)&v50 - v27;
  uint64_t v28 = sub_62A4(&qword_131570);
  uint64_t v62 = v28;
  uint64_t v50 = swift_getWitnessTable();
  uint64_t v78 = v50;
  long long v79 = &protocol witness table for _AppearanceActionModifier;
  uint64_t v29 = swift_getWitnessTable();
  uint64_t v54 = v29;
  unint64_t v30 = sub_E44C();
  unint64_t v61 = v30;
  uint64_t v60 = sub_105AC((unint64_t *)&qword_1315D0, &qword_131570);
  *(void *)&long long v81 = v26;
  *((void *)&v81 + 1) = &type metadata for MSError;
  *(void *)&long long v82 = v28;
  *((void *)&v82 + 1) = v29;
  *(void *)&v83[0] = v30;
  *((void *)&v83[0] + 1) = v60;
  uint64_t v58 = &opaque type descriptor for <<opaque return type of View.alert<A, B>(isPresented:error:actions:)>>;
  uint64_t v59 = swift_getOpaqueTypeMetadata2();
  uint64_t v63 = *(void *)(v59 - 8);
  uint64_t v31 = __chkstk_darwin(v59);
  uint64_t v53 = (char *)&v50 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v31);
  uint64_t v57 = (char *)&v50 - v33;
  uint64_t v34 = v65;
  uint64_t v35 = v68;
  uint64_t v73 = v65;
  uint64_t v74 = v68;
  sub_E4930();
  uint64_t v36 = v69;
  uint64_t v38 = v66;
  BOOL v37 = v67;
  (*(void (**)(char *, uint64_t, uint64_t))(v69 + 16))(v67, v35, v66);
  unint64_t v39 = (*(unsigned __int8 *)(v36 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
  uint64_t v40 = swift_allocObject();
  *(void *)(v40 + 16) = v34;
  (*(void (**)(unint64_t, char *, uint64_t))(v36 + 32))(v40 + v39, v37, v38);
  uint64_t v41 = v51;
  sub_E5140();
  swift_release();
  (*(void (**)(char *, uint64_t))(v56 + 8))(v25, v23);
  swift_getWitnessTable();
  sub_E4780();
  uint64_t v72 = v34;
  swift_getKeyPath();
  sub_E48D0();
  swift_release();
  swift_release();
  long long v81 = v75;
  long long v82 = v76;
  v83[0] = v77[0];
  *(_OWORD *)((char *)v83 + 9) = *(_OWORD *)((char *)v77 + 9);
  uint64_t v43 = v53;
  uint64_t v42 = v54;
  uint64_t v44 = v55;
  sub_5F0AC();
  uint64_t v84 = v81;
  sub_E5F4((uint64_t)&v84);
  swift_release();
  sub_10250((uint64_t)&v82, (uint64_t)v85, &qword_1312F8);
  sub_E620((uint64_t)v85);
  (*(void (**)(char *, uint64_t))(v64 + 8))(v41, v44);
  *(void *)&long long v75 = v44;
  *((void *)&v75 + 1) = &type metadata for MSError;
  *(void *)&long long v76 = v62;
  *((void *)&v76 + 1) = v42;
  *(void *)&v77[0] = v61;
  *((void *)&v77[0] + 1) = v60;
  uint64_t v45 = swift_getOpaqueTypeConformance2();
  uint64_t v46 = v57;
  uint64_t v47 = v59;
  sub_5F070(v43, v59, v45);
  char v48 = *(void (**)(char *, uint64_t))(v63 + 8);
  v48(v43, v47);
  sub_5F070(v46, v47, v45);
  return ((uint64_t (*)(char *, uint64_t))v48)(v46, v47);
}

uint64_t sub_D25F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v80 = a3;
  uint64_t v5 = sub_E4B80();
  uint64_t v78 = *(void *)(v5 - 8);
  uint64_t v79 = v5;
  __chkstk_darwin(v5);
  uint64_t v77 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_62A4(&qword_139B48);
  uint64_t v7 = (void *)type metadata accessor for MSRuleBaseView.RuleFormElement();
  uint64_t v8 = sub_E57B0();
  uint64_t v9 = sub_62A4(&qword_139B50);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v11 = swift_getWitnessTable();
  v84._uint64_t countAndFlagsBits = v8;
  v84._object = v7;
  Swift::String v85 = (void *)v9;
  unint64_t v86 = WitnessTable;
  uint64_t v87 = v11;
  sub_E5360();
  uint64_t v83 = sub_DC298(&qword_139B58, &qword_139B50, (void (*)(void))sub_DC048, (void (*)(void))sub_DC25C);
  swift_getWitnessTable();
  sub_E52B0();
  sub_62A4(&qword_139C58);
  sub_E4C60();
  sub_E58F0();
  sub_E4C60();
  sub_E4C60();
  uint64_t v12 = sub_E4C60();
  v84._uint64_t countAndFlagsBits = v8;
  v84._object = v7;
  Swift::String v85 = (void *)v12;
  unint64_t v86 = WitnessTable;
  uint64_t v87 = v11;
  sub_E5360();
  sub_62A4(&qword_138D20);
  sub_E53C0();
  swift_getTupleTypeMetadata2();
  uint64_t v13 = (void *)sub_E5440();
  uint64_t v14 = swift_getWitnessTable();
  v84._uint64_t countAndFlagsBits = (uint64_t)&type metadata for Never;
  v84._object = v13;
  Swift::String v85 = &protocol witness table for Never;
  unint64_t v86 = v14;
  uint64_t v15 = sub_E4EB0();
  uint64_t v76 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v59 = (char *)&v59 - v16;
  uint64_t v17 = swift_getWitnessTable();
  unint64_t v18 = sub_E3F8();
  v84._uint64_t countAndFlagsBits = v15;
  v84._object = &type metadata for String;
  Swift::String v85 = (void *)v17;
  unint64_t v86 = v18;
  uint64_t v70 = v17;
  unint64_t v19 = v18;
  unint64_t v69 = v18;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v75 = *(void *)(OpaqueTypeMetadata2 - 8);
  __chkstk_darwin(OpaqueTypeMetadata2);
  uint64_t v72 = (char *)&v59 - v21;
  v84._uint64_t countAndFlagsBits = v15;
  v84._object = &type metadata for String;
  Swift::String v85 = (void *)v17;
  unint64_t v86 = v19;
  uint64_t OpaqueTypeConformance2 = (void *)swift_getOpaqueTypeConformance2();
  v84._uint64_t countAndFlagsBits = OpaqueTypeMetadata2;
  v84._object = OpaqueTypeConformance2;
  uint64_t v63 = OpaqueTypeMetadata2;
  uint64_t v23 = OpaqueTypeConformance2;
  uint64_t v64 = OpaqueTypeConformance2;
  uint64_t v24 = swift_getOpaqueTypeMetadata2();
  uint64_t v74 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  uint64_t v65 = (char *)&v59 - v25;
  uint64_t v26 = (void *)sub_62A4(&qword_131588);
  uint64_t v68 = v26;
  v84._uint64_t countAndFlagsBits = OpaqueTypeMetadata2;
  v84._object = v23;
  uint64_t v27 = swift_getOpaqueTypeConformance2();
  uint64_t v67 = v27;
  uint64_t v66 = sub_105AC(&qword_1315C0, &qword_131588);
  v84._uint64_t countAndFlagsBits = v24;
  v84._object = v26;
  Swift::String v85 = (void *)v27;
  unint64_t v86 = v66;
  uint64_t v71 = &opaque type descriptor for <<opaque return type of View.toolbar<A>(content:)>>;
  uint64_t v28 = swift_getOpaqueTypeMetadata2();
  uint64_t v73 = *(void *)(v28 - 8);
  uint64_t v29 = __chkstk_darwin(v28);
  uint64_t v31 = (char *)&v59 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v29);
  uint64_t v62 = (char *)&v59 - v32;
  uint64_t v60 = a2;
  uint64_t v33 = type metadata accessor for MSRuleBaseView();
  uint64_t v61 = a1;
  sub_D2F8C(v33);
  swift_getWitnessTable();
  uint64_t v34 = *(void *)sub_E4770();
  uint64_t v35 = (*(uint64_t (**)(void))(v34 + 976))();
  BOOL v37 = v36;
  swift_release();
  type metadata accessor for MAPreferencesViewProvider();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  unint64_t v39 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v84._uint64_t countAndFlagsBits = 2777980912;
  v84._object = (void *)0xA400000000000000;
  v88._uint64_t countAndFlagsBits = v35;
  v88._object = v37;
  sub_E5690(v88);
  v89._uint64_t countAndFlagsBits = 2777980912;
  v89._object = (void *)0xA400000000000000;
  sub_E5690(v89);
  v58._uint64_t countAndFlagsBits = 0xE000000000000000;
  v90._uint64_t countAndFlagsBits = v35;
  v90._object = v37;
  v91.value._uint64_t countAndFlagsBits = 0;
  v91.value._object = 0;
  v40.super.isa = v39;
  uint64_t v41 = sub_E3FE0(v90, v91, v40, v84, v58);
  uint64_t v43 = v42;
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v84._uint64_t countAndFlagsBits = v41;
  v84._object = v43;
  uint64_t v44 = v72;
  uint64_t v45 = v59;
  sub_E5050();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v76 + 8))(v45, v15);
  uint64_t v47 = v77;
  uint64_t v46 = v78;
  uint64_t v48 = v79;
  (*(void (**)(char *, void, uint64_t))(v78 + 104))(v77, enum case for NavigationBarItem.TitleDisplayMode.inline(_:), v79);
  uint64_t v49 = v65;
  uint64_t v50 = v63;
  sub_E50D0();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v47, v48);
  (*(void (**)(char *, uint64_t))(v75 + 8))(v44, v50);
  uint64_t v81 = v60;
  uint64_t v82 = v61;
  uint64_t v51 = v68;
  uint64_t v52 = (void *)v67;
  uint64_t v53 = v66;
  sub_E5120();
  (*(void (**)(char *, uint64_t))(v74 + 8))(v49, v24);
  v84._uint64_t countAndFlagsBits = v24;
  v84._object = v51;
  Swift::String v85 = v52;
  unint64_t v86 = v53;
  uint64_t v54 = swift_getOpaqueTypeConformance2();
  uint64_t v55 = v62;
  sub_5F070(v31, v28, v54);
  uint64_t v56 = *(void (**)(char *, uint64_t))(v73 + 8);
  v56(v31, v28);
  sub_5F070(v55, v28, v54);
  return ((uint64_t (*)(char *, uint64_t))v56)(v55, v28);
}

uint64_t sub_D2F8C(uint64_t a1)
{
  sub_62A4(&qword_139B48);
  uint64_t v3 = *(void *)(a1 + 16);
  type metadata accessor for MSRuleBaseView.RuleFormElement();
  sub_E57B0();
  sub_62A4(&qword_139B50);
  swift_getWitnessTable();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_E5360();
  uint64_t v18 = sub_DC298(&qword_139B58, &qword_139B50, (void (*)(void))sub_DC048, (void (*)(void))sub_DC25C);
  swift_getWitnessTable();
  sub_E52B0();
  sub_62A4(&qword_139C58);
  sub_E4C60();
  sub_E58F0();
  sub_E4C60();
  sub_E4C60();
  sub_E4C60();
  uint64_t v23 = WitnessTable;
  sub_E5360();
  sub_62A4(&qword_138D20);
  sub_E53C0();
  swift_getTupleTypeMetadata2();
  unint64_t v19 = &type metadata for Never;
  uint64_t v20 = sub_E5440();
  uint64_t v21 = &protocol witness table for Never;
  uint64_t v22 = swift_getWitnessTable();
  uint64_t v5 = sub_E4EB0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = &v15[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v7);
  uint64_t v11 = &v15[-v10];
  uint64_t v16 = v3;
  uint64_t v17 = v1;
  sub_E4EA0();
  uint64_t v12 = swift_getWitnessTable();
  sub_5F070(v9, v5, v12);
  uint64_t v13 = *(void (**)(unsigned char *, uint64_t))(v6 + 8);
  v13(v9, v5);
  sub_5F070(v11, v5, v12);
  return ((uint64_t (*)(unsigned char *, uint64_t))v13)(v11, v5);
}

uint64_t sub_D3328@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v22 = a3;
  uint64_t v21 = sub_6898(&qword_131600);
  __chkstk_darwin(v21);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_6898(&qword_131608);
  uint64_t v7 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_E4CC0();
  __chkstk_darwin(v10 - 8);
  uint64_t v19 = sub_6898(&qword_131610);
  uint64_t v11 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_E4CA0();
  uint64_t v25 = a2;
  uint64_t v26 = a1;
  sub_6898(&qword_131570);
  sub_105AC((unint64_t *)&qword_1315D0, &qword_131570);
  sub_E4970();
  sub_E4CB0();
  uint64_t v23 = a2;
  uint64_t v24 = a1;
  sub_6898(&qword_131618);
  sub_EC60();
  sub_E4970();
  uint64_t v14 = &v6[*(int *)(v21 + 48)];
  uint64_t v15 = v19;
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v6, v13, v19);
  uint64_t v16 = v14;
  uint64_t v17 = v20;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v16, v9, v20);
  sub_E4C20();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v17);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v15);
}

uint64_t sub_D3658(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MSRuleBaseView();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v11 - v6;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v11 - v6, a1, v4);
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, v7, v4);
  return sub_E5270();
}

uint64_t sub_D37C0()
{
  uint64_t v0 = sub_E47F0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_E7B4((uint64_t)v3);
  sub_E47E0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_D388C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v46 = a3;
  uint64_t v5 = type metadata accessor for MSRuleBaseView();
  uint64_t v36 = *(void *)(v5 - 8);
  v34[1] = *(void *)(v36 + 64);
  __chkstk_darwin(v5);
  uint64_t v35 = (char *)v34 - v6;
  uint64_t v7 = sub_6898(&qword_131570);
  uint64_t v39 = *(void *)(v7 - 8);
  uint64_t v40 = v7;
  __chkstk_darwin(v7);
  uint64_t v38 = (char *)v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_6898(&qword_131640);
  uint64_t v9 = __chkstk_darwin(v45);
  BOOL v37 = (char *)v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v41 = (uint64_t)v34 - v11;
  uint64_t v42 = sub_6898(&qword_131658);
  __chkstk_darwin(v42);
  uint64_t v43 = (uint64_t)v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_6898(&qword_131630);
  uint64_t v13 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  uint64_t v15 = (char *)v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = a1;
  swift_getWitnessTable();
  uint64_t v17 = *(void *)sub_E4770();
  LOBYTE(a1) = (*(uint64_t (**)(void))(v17 + 784))();
  swift_release();
  if (a1)
  {
    sub_E4790();
    uint64_t v18 = v44;
    (*(void (**)(uint64_t, char *, uint64_t))(v13 + 16))(v43, v15, v44);
    swift_storeEnumTagMultiPayload();
    sub_105AC(&qword_131628, &qword_131630);
    sub_ED00();
    sub_E4C50();
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v18);
  }
  else
  {
    uint64_t v21 = v35;
    uint64_t v20 = v36;
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v35, v16, v5);
    unint64_t v22 = (*(unsigned __int8 *)(v20 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = a2;
    (*(void (**)(unint64_t, char *, uint64_t))(v20 + 32))(v23 + v22, v21, v5);
    uint64_t v24 = v38;
    sub_E5270();
    uint64_t v25 = *(void *)sub_E4770();
    char v26 = (*(uint64_t (**)(void))(v25 + 832))();
    swift_release();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v28 = swift_allocObject();
    *(unsigned char *)(v28 + 16) = v26 & 1;
    uint64_t v30 = v39;
    uint64_t v29 = v40;
    uint64_t v31 = (uint64_t)v37;
    (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v37, v24, v40);
    uint64_t v32 = (uint64_t *)(v31 + *(int *)(v45 + 36));
    *uint64_t v32 = KeyPath;
    v32[1] = (uint64_t)sub_EF04;
    v32[2] = v28;
    (*(void (**)(char *, uint64_t))(v30 + 8))(v24, v29);
    uint64_t v33 = v41;
    sub_10250(v31, v41, &qword_131640);
    sub_105F0(v33, v43, &qword_131640);
    swift_storeEnumTagMultiPayload();
    sub_105AC(&qword_131628, &qword_131630);
    sub_ED00();
    sub_E4C50();
    return sub_102B4(v33, &qword_131640);
  }
}

uint64_t sub_D3E94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MSRuleBaseView();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v14 = (char *)&v13 - v6;
  swift_getWitnessTable();
  uint64_t v7 = *(void *)sub_E4770();
  (*(void (**)(uint64_t))(v7 + 792))(1);
  swift_release();
  uint64_t v8 = sub_E4770();
  uint64_t v9 = v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v14, a1, v4);
  unint64_t v10 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v11 + v10, v9, v4);
  (*(void (**)(uint64_t (*)(), uint64_t))(*(void *)v8 + 1224))(sub_DC8BC, v11);
  swift_release();
  return swift_release();
}

uint64_t sub_D40D0()
{
  uint64_t v0 = sub_E47F0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_E7B4((uint64_t)v3);
  sub_E47E0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  type metadata accessor for MSRuleBaseView();
  swift_getWitnessTable();
  uint64_t v4 = *(void (**)(uint64_t))(sub_E4770() + OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel_onDone);
  swift_retain();
  uint64_t v5 = swift_release();
  v4(v5);
  swift_release();
  uint64_t v6 = *(void *)sub_E4770();
  (*(void (**)(void))(v6 + 792))(0);
  return swift_release();
}

uint64_t sub_D42A4()
{
  uint64_t v0 = sub_E4320();
  uint64_t v18 = *(void *)(v0 - 8);
  uint64_t v1 = __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v17 - v4;
  type metadata accessor for MSRuleBaseView();
  swift_getWitnessTable();
  sub_E4770();
  _s12AddViewModelCMa();
  uint64_t v6 = swift_dynamicCastClass();
  swift_release();
  if (v6)
  {
    if (qword_131238 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_67B4(v0, (uint64_t)qword_148D58);
    uint64_t v8 = v18;
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v5, v7, v0);
    uint64_t v9 = sub_E4300();
    os_log_type_t v10 = sub_E5870();
    if (!os_log_type_enabled(v9, v10)) {
      goto LABEL_13;
    }
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&def_66DD4, v9, v10, "[Add Rule] page viewed", v11, 2u);
  }
  else
  {
    sub_E4770();
    _s13EditViewModelCMa();
    uint64_t v12 = swift_dynamicCastClass();
    uint64_t result = swift_release();
    if (!v12) {
      return result;
    }
    if (qword_131238 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_67B4(v0, (uint64_t)qword_148D58);
    uint64_t v8 = v18;
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v3, v14, v0);
    uint64_t v9 = sub_E4300();
    os_log_type_t v15 = sub_E5870();
    if (!os_log_type_enabled(v9, v15))
    {
      uint64_t v5 = v3;
      goto LABEL_13;
    }
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&def_66DD4, v9, v15, "[Edit Rule] page viewed", v16, 2u);
    uint64_t v5 = v3;
  }
  swift_slowDealloc();
LABEL_13:

  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v5, v0);
}

uint64_t sub_D4604(uint64_t a1, uint64_t a2)
{
  sub_10250(a1, (uint64_t)v5, &qword_1312F8);
  uint64_t v3 = *(uint64_t (**)(unsigned char *))(**(void **)a2 + 1080);
  sub_5F47C((uint64_t)v5);
  return v3(v5);
}

uint64_t sub_D468C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v45 = a3;
  uint64_t v5 = type metadata accessor for MSRuleBaseView.RuleFormElement();
  uint64_t v6 = sub_E57B0();
  sub_62A4(&qword_139B50);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v8 = swift_getWitnessTable();
  sub_E5360();
  v49[16] = sub_DC298(&qword_139B58, &qword_139B50, (void (*)(void))sub_DC048, (void (*)(void))sub_DC25C);
  swift_getWitnessTable();
  sub_E52B0();
  v37[0] = sub_62A4(&qword_139C58);
  uint64_t v9 = sub_E4C60();
  Swift::String v37[2] = sub_E58F0();
  v37[1] = v9;
  v37[3] = sub_E4C60();
  sub_E4C60();
  uint64_t v50 = v6;
  uint64_t v51 = (char *)v5;
  uint64_t v38 = sub_E4C60();
  uint64_t v52 = v38;
  uint64_t v53 = WitnessTable;
  uint64_t v54 = v8;
  uint64_t v40 = sub_E5360();
  uint64_t v39 = sub_62A4(&qword_138D20);
  uint64_t v10 = sub_E53C0();
  uint64_t v42 = *(void *)(v10 - 8);
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v13 = (char *)v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v44 = (char *)v37 - v14;
  uint64_t v41 = sub_6898(&qword_139B48);
  uint64_t v15 = __chkstk_darwin(v41);
  uint64_t v43 = (uint64_t)v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)v37 - v17;
  uint64_t v50 = *(void *)(a1 + *(int *)(type metadata accessor for MSRuleBaseView() + 28));
  uint64_t v46 = a2;
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  LOBYTE(WitnessTable) = sub_E56F0();
  uint64_t v19 = swift_bridgeObjectRelease();
  if (WitnessTable)
  {
    __chkstk_darwin(v19);
    v37[-2] = a2;
    v37[-1] = a1;
    sub_DC9B0();
    sub_E53A0();
    uint64_t v20 = sub_6898(&qword_139C60);
    uint64_t v21 = (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v18, 0, 1, v20);
  }
  else
  {
    uint64_t v22 = sub_6898(&qword_139C60);
    uint64_t v21 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v18, 1, 1, v22);
  }
  v37[0] = v37;
  uint64_t v23 = __chkstk_darwin(v21);
  v37[-2] = a2;
  v37[-1] = a1;
  __chkstk_darwin(v23);
  v37[-2] = a2;
  v37[-1] = a1;
  uint64_t v24 = swift_getWitnessTable();
  unint64_t v25 = sub_DC9B0();
  v49[13] = v24;
  v49[14] = v25;
  uint64_t v26 = swift_getWitnessTable();
  v49[12] = v24;
  uint64_t v27 = swift_getWitnessTable();
  v49[10] = v24;
  v49[11] = v27;
  uint64_t v28 = swift_getWitnessTable();
  v49[8] = v26;
  v49[9] = v28;
  v49[6] = swift_getWitnessTable();
  v49[7] = &protocol witness table for EmptyView;
  v49[5] = swift_getWitnessTable();
  uint64_t v29 = swift_getWitnessTable();
  uint64_t v30 = sub_DD168((unint64_t *)&qword_138D28, &qword_138D20);
  sub_D1BAC((uint64_t)sub_DC9A0);
  v49[2] = &protocol witness table for EmptyView;
  void v49[3] = v29;
  v49[4] = v30;
  uint64_t v31 = swift_getWitnessTable();
  uint64_t v32 = v44;
  sub_5F070(v13, v10, v31);
  uint64_t v33 = v42;
  uint64_t v34 = *(void (**)(char *, uint64_t))(v42 + 8);
  v34(v13, v10);
  uint64_t v35 = v43;
  sub_105F0((uint64_t)v18, v43, &qword_139B48);
  uint64_t v50 = v35;
  (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v13, v32, v10);
  uint64_t v51 = v13;
  v49[0] = v41;
  v49[1] = v10;
  uint64_t v47 = sub_DCAD0(&qword_139C70, &qword_139B48, (void (*)(void))sub_DCB48);
  uint64_t v48 = v31;
  sub_D19E8((uint64_t)&v50, 2uLL, (uint64_t)v49);
  v34(v32, v10);
  sub_102B4((uint64_t)v18, &qword_139B48);
  v34(v13, v10);
  return sub_102B4(v35, &qword_139B48);
}

uint64_t sub_D4E3C()
{
  return sub_E5C30() & 1;
}

uint64_t sub_D4EBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v64 = a3;
  uint64_t v5 = sub_6898(&qword_1317D8);
  uint64_t v56 = *(void *)(v5 - 8);
  uint64_t v57 = v5;
  __chkstk_darwin(v5);
  uint64_t v51 = (char *)v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_6898(&qword_1317E8);
  __chkstk_darwin(v55);
  uint64_t v8 = (char *)v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_6898(&qword_1317F0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v58 = v9;
  uint64_t v59 = v10;
  __chkstk_darwin(v9);
  uint64_t v52 = (char *)v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_6898(&qword_1317F8);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v60 = v12;
  v61._uint64_t countAndFlagsBits = v13;
  __chkstk_darwin(v12);
  uint64_t v53 = (char *)v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_6898(&qword_139C80);
  uint64_t v62 = *(void *)(v15 - 8);
  uint64_t v63 = v15;
  __chkstk_darwin(v15);
  uint64_t v54 = (char *)v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MAPreferencesViewProvider();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v18 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v69._uint64_t countAndFlagsBits = 2777980912;
  v69._object = (void *)0xA400000000000000;
  v72._uint64_t countAndFlagsBits = 0x4D414E2E454C5552;
  v72._object = (void *)0xE900000000000045;
  sub_E5690(v72);
  v73._uint64_t countAndFlagsBits = 2777980912;
  v73._object = (void *)0xA400000000000000;
  sub_E5690(v73);
  v48._uint64_t countAndFlagsBits = 0xE000000000000000;
  v74._uint64_t countAndFlagsBits = 0x4D414E2E454C5552;
  v74._object = (void *)0xE900000000000045;
  v75.value._uint64_t countAndFlagsBits = 0;
  v75.value._object = 0;
  v19.super.isa = v18;
  uint64_t v20 = sub_E3FE0(v74, v75, v19, v69, v48);
  uint64_t v22 = v21;

  swift_bridgeObjectRelease();
  uint64_t v23 = a1 + *(int *)(type metadata accessor for MSRuleBaseView() + 44);
  uint64_t v50 = *(void *)(v23 + 8);
  v49[1] = *(unsigned __int8 *)(v23 + 16);
  swift_getWitnessTable();
  sub_E4780();
  uint64_t v66 = a2;
  swift_getKeyPath();
  sub_E48D0();
  swift_release();
  swift_release();
  uint64_t v67 = v20;
  uint64_t v68 = v22;
  sub_E3F8();
  uint64_t v24 = v51;
  sub_E5420();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v26 = v56;
  uint64_t v27 = v24;
  uint64_t v28 = v24;
  uint64_t v29 = v57;
  (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v8, v27, v57);
  uint64_t v30 = v55;
  uint64_t v31 = (uint64_t *)&v8[*(int *)(v55 + 36)];
  v31[1] = 0;
  v31[2] = 0;
  *uint64_t v31 = KeyPath;
  (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v29);
  uint64_t v32 = (void *)sub_F928();
  uint64_t v33 = v52;
  sub_E5060();
  sub_102B4((uint64_t)v8, &qword_1317E8);
  v69._uint64_t countAndFlagsBits = v30;
  v69._object = v32;
  uint64_t OpaqueTypeConformance2 = (void *)swift_getOpaqueTypeConformance2();
  uint64_t v35 = v53;
  uint64_t v36 = v58;
  sub_E5090();
  (*(void (**)(char *, uint64_t))(v59 + 8))(v33, v36);
  v69._uint64_t countAndFlagsBits = v36;
  v69._object = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  BOOL v37 = v54;
  uint64_t v38 = v60;
  sub_E5010();
  (*(void (**)(char *, uint64_t))(v61._countAndFlagsBits + 8))(v35, v38);
  sub_E4780();
  uint64_t v65 = a2;
  swift_getKeyPath();
  sub_E48D0();
  swift_release();
  swift_release();
  Swift::String v61 = v69;
  uint64_t v39 = v70;
  uint64_t v40 = v71;
  sub_E4770();
  swift_release();
  uint64_t v41 = v62;
  uint64_t v42 = v64;
  uint64_t v43 = v37;
  uint64_t v44 = v37;
  uint64_t v45 = v63;
  (*(void (**)(uint64_t, char *, uint64_t))(v62 + 16))(v64, v43, v63);
  uint64_t v46 = (Swift::String *)(v42 + *(int *)(sub_6898(&qword_139C58) + 36));
  Swift::String *v46 = v61;
  v46[1]._uint64_t countAndFlagsBits = v39;
  v46[1]._object = v40;
  v46[2]._uint64_t countAndFlagsBits = 30;
  return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v44, v45);
}

uint64_t sub_D55AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v46 = a3;
  uint64_t v5 = type metadata accessor for MSRuleBaseView();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v44 = *(void *)(v6 + 64);
  __chkstk_darwin(v5);
  uint64_t v43 = (char *)v36 - v7;
  uint64_t v8 = type metadata accessor for MSRuleBaseView.RuleFormElement();
  uint64_t v9 = sub_E57B0();
  uint64_t v10 = sub_62A4(&qword_139B50);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v12 = swift_getWitnessTable();
  uint64_t v59 = v9;
  uint64_t v60 = v8;
  uint64_t v41 = v9;
  uint64_t v61 = v10;
  uint64_t v62 = WitnessTable;
  uint64_t v40 = WitnessTable;
  uint64_t v63 = v12;
  uint64_t v13 = v12;
  uint64_t v39 = v12;
  sub_E5360();
  uint64_t v58 = sub_DC298(&qword_139B58, &qword_139B50, (void (*)(void))sub_DC048, (void (*)(void))sub_DC25C);
  uint64_t v45 = &protocol conformance descriptor for <> ForEach<A, B, C>;
  swift_getWitnessTable();
  sub_E52B0();
  sub_62A4(&qword_139C58);
  v36[2] = sub_E4C60();
  v36[3] = sub_E58F0();
  v36[4] = sub_E4C60();
  v36[5] = sub_E4C60();
  uint64_t v38 = sub_E4C60();
  uint64_t v59 = v9;
  uint64_t v60 = v8;
  uint64_t v61 = v38;
  uint64_t v62 = WitnessTable;
  uint64_t v63 = v13;
  uint64_t v14 = sub_E5360();
  uint64_t v42 = *(void *)(v14 - 8);
  uint64_t v15 = __chkstk_darwin(v14);
  uint64_t v17 = (char *)v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  BOOL v37 = (char *)v36 - v18;
  uint64_t v19 = v5;
  uint64_t v59 = *(void *)(a1 + *(int *)(v5 + 28));
  uint64_t v20 = a2;
  uint64_t v47 = a2;
  v36[1] = swift_getKeyPath();
  uint64_t v21 = v43;
  uint64_t v22 = a1;
  uint64_t v23 = v19;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v43, v22, v19);
  unint64_t v24 = (*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v20;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v25 + v24, v21, v23);
  swift_bridgeObjectRetain();
  uint64_t v26 = swift_getWitnessTable();
  unint64_t v27 = sub_DC9B0();
  uint64_t v56 = v26;
  unint64_t v57 = v27;
  uint64_t v28 = swift_getWitnessTable();
  uint64_t v55 = v26;
  uint64_t v29 = swift_getWitnessTable();
  uint64_t v53 = v26;
  uint64_t v54 = v29;
  uint64_t v30 = swift_getWitnessTable();
  uint64_t v51 = v28;
  uint64_t v52 = v30;
  uint64_t v49 = swift_getWitnessTable();
  uint64_t v50 = &protocol witness table for EmptyView;
  uint64_t v35 = swift_getWitnessTable();
  sub_E5340();
  uint64_t v48 = v35;
  uint64_t v31 = swift_getWitnessTable();
  uint64_t v32 = v37;
  sub_5F070(v17, v14, v31);
  uint64_t v33 = *(void (**)(char *, uint64_t))(v42 + 8);
  v33(v17, v14);
  sub_5F070(v32, v14, v31);
  return ((uint64_t (*)(char *, uint64_t))v33)(v32, v14);
}

uint64_t sub_D5B18@<X0>(unsigned __int8 *a1@<X0>, unsigned __int8 *a2@<X1>, void (*a3)(void, uint64_t)@<X2>, void (*a4)(char *, uint64_t)@<X8>)
{
  v186 = a2;
  v191 = a4;
  v198 = a3;
  uint64_t v5 = (void *)type metadata accessor for MSRuleBaseView.RuleFormElement();
  v247._uint64_t countAndFlagsBits = sub_E57B0();
  v247._object = v5;
  uint64_t v248 = sub_62A4(&qword_139B50);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v250 = swift_getWitnessTable();
  sub_E5360();
  uint64_t v246 = sub_DC298(&qword_139B58, &qword_139B50, (void (*)(void))sub_DC048, (void (*)(void))sub_DC25C);
  v183._uint64_t countAndFlagsBits = swift_getWitnessTable();
  uint64_t v6 = sub_E52B0();
  uint64_t v7 = sub_E58F0();
  uint64_t v163 = *(void *)(v7 - 8);
  uint64_t v8 = __chkstk_darwin(v7);
  v164 = (char *)&v163 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v179 = (char *)&v163 - v10;
  uint64_t v197 = v11;
  uint64_t v12 = sub_E4C60();
  uint64_t v181 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  v180 = (char *)&v163 - v13;
  uint64_t v14 = sub_6898(&qword_1317D8);
  uint64_t v168 = *(void *)(v14 - 8);
  uint64_t v169 = v14;
  __chkstk_darwin(v14);
  uint64_t v165 = (char *)&v163 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v170 = sub_6898(&qword_1317E8);
  __chkstk_darwin(v170);
  uint64_t v17 = (char *)&v163 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v173 = sub_6898(&qword_1317F0);
  uint64_t v171 = *(void *)(v173 - 8);
  __chkstk_darwin(v173);
  v166 = (char *)&v163 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v174 = sub_6898(&qword_1317F8);
  uint64_t v172 = *(void *)(v174 - 8);
  __chkstk_darwin(v174);
  v167 = (char *)&v163 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_6898(&qword_139C80);
  uint64_t v177 = *(void *)(v20 - 8);
  uint64_t v178 = v20;
  __chkstk_darwin(v20);
  v176 = (char *)&v163 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_6898(&qword_139C58);
  uint64_t v23 = __chkstk_darwin(v22);
  v175 = (char *)&v163 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  uint64_t v182 = (uint64_t)&v163 - v25;
  uint64_t v26 = sub_E4C60();
  unint64_t v27 = *(void (***)(uint64_t, uint64_t))(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v185 = (uint64_t)&v163 - v28;
  uint64_t v192 = v29;
  uint64_t v194 = v12;
  uint64_t v30 = sub_E4C60();
  uint64_t v188 = *(void *)(v30 - 8);
  uint64_t v31 = __chkstk_darwin(v30);
  v187 = (char *)&v163 - v32;
  uint64_t v199 = v6;
  uint64_t v190 = *(void *)(v6 - 8);
  uint64_t v33 = __chkstk_darwin(v31);
  uint64_t v35 = (char *)&v163 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v33);
  v189 = (void (**)(uint64_t, uint64_t))((char *)&v163 - v36);
  uint64_t v193 = v37;
  uint64_t v38 = sub_E4C60();
  uint64_t v39 = *(void *)(v38 - 8);
  uint64_t v40 = __chkstk_darwin(v38);
  int v42 = *a1 - 1;
  uint64_t v195 = v39;
  uint64_t v196 = v40;
  v184 = (char *)&v163 - v41;
  switch(v42)
  {
    case 0:
      __chkstk_darwin(v40);
      sub_E4BA0();
      sub_E52A0();
      uint64_t v43 = v199;
      uint64_t v44 = swift_getWitnessTable();
      uint64_t v45 = v189;
      sub_5F070(v35, v43, v44);
      uint64_t v46 = v190 + 8;
      uint64_t v47 = *(void (**)(char *, uint64_t))(v190 + 8);
      v47(v35, v43);
      v198 = (void (*)(void, uint64_t))v47;
      uint64_t v190 = v46;
      sub_5F070(v45, v43, v44);
      unint64_t v48 = sub_DC9B0();
      sub_D17F8((uint64_t)v35, v43);
      v47(v35, v43);
      uint64_t v205 = v44;
      unint64_t v206 = v48;
      v186 = (unsigned __int8 *)&protocol conformance descriptor for <> _ConditionalContent<A, B>;
      uint64_t v49 = v192;
      uint64_t v50 = swift_getWitnessTable();
      uint64_t v204 = v44;
      uint64_t v51 = swift_getWitnessTable();
      uint64_t v202 = v44;
      uint64_t v203 = v51;
      uint64_t v52 = swift_getWitnessTable();
      uint64_t v53 = (uint64_t)v187;
      uint64_t v54 = v185;
      sub_D17F8(v185, v49);
      v27[1](v54, v49);
      uint64_t v200 = v50;
      uint64_t v201 = v52;
      uint64_t v55 = v43;
      uint64_t v56 = v193;
      swift_getWitnessTable();
      unint64_t v57 = v184;
      sub_D17F8(v53, v56);
      (*(void (**)(uint64_t, uint64_t))(v188 + 8))(v53, v56);
      v198(v189, v55);
      uint64_t v58 = v57;
      break;
    case 1:
      v189 = v27;
      v180 = v17;
      uint64_t v181 = v22;
      uint64_t v66 = &v186[*(int *)(type metadata accessor for MSRuleBaseView() + 44)];
      int v67 = v66[16];
      uint64_t v68 = swift_getWitnessTable();
      LODWORD(v183._countAndFlagsBits) = v67;
      uint64_t v190 = v68;
      uint64_t v69 = *(void *)sub_E4770();
      unsigned __int8 v70 = (*(uint64_t (**)(void))(v69 + 400))();
      swift_release();
      int v71 = v70;
      v186 = v66;
      if (v70 >= 4u)
      {
        if (v70 == 4) {
          uint64_t v72 = 0xD00000000000001ELL;
        }
        else {
          uint64_t v72 = 0xD00000000000001DLL;
        }
        if (v71 == 4) {
          Swift::String v73 = (void *)0x80000000000F7120;
        }
        else {
          Swift::String v73 = (void *)0x80000000000F7100;
        }
      }
      else
      {
        uint64_t v72 = 0xD000000000000029;
        Swift::String v73 = (void *)0x80000000000F7140;
      }
      uint64_t v112 = (uint64_t)v180;
      uint64_t v113 = v181;
      type metadata accessor for MAPreferencesViewProvider();
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      uint64_t v115 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
      v247._uint64_t countAndFlagsBits = 2777980912;
      v247._object = (void *)0xA400000000000000;
      v251._uint64_t countAndFlagsBits = v72;
      v251._object = v73;
      sub_E5690(v251);
      v252._uint64_t countAndFlagsBits = 2777980912;
      v252._object = (void *)0xA400000000000000;
      sub_E5690(v252);
      v162._uint64_t countAndFlagsBits = 0xE000000000000000;
      v253._uint64_t countAndFlagsBits = v72;
      v253._object = v73;
      v254.value._uint64_t countAndFlagsBits = 0;
      v254.value._object = 0;
      v116.super.isa = v115;
      uint64_t v117 = sub_E3FE0(v253, v254, v116, v247, v162);
      uint64_t v119 = v118;
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      uint64_t v120 = sub_E4780();
      __chkstk_darwin(v120);
      swift_getKeyPath();
      sub_E48D0();
      swift_release();
      swift_release();
      uint64_t v214 = v117;
      uint64_t v215 = v119;
      sub_E3F8();
      uint64_t v121 = v165;
      sub_E5420();
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v124 = v168;
      uint64_t v123 = v169;
      (*(void (**)(uint64_t, char *, uint64_t))(v168 + 16))(v112, v121, v169);
      uint64_t v125 = v170;
      uint64_t v126 = (uint64_t *)(v112 + *(int *)(v170 + 36));
      v126[1] = 0;
      v126[2] = 0;
      *uint64_t v126 = KeyPath;
      (*(void (**)(char *, uint64_t))(v124 + 8))(v121, v123);
      uint64_t v127 = (void *)sub_F928();
      uint64_t v128 = v166;
      sub_E5060();
      sub_102B4(v112, &qword_1317E8);
      v247._uint64_t countAndFlagsBits = v125;
      v247._object = v127;
      uint64_t OpaqueTypeConformance2 = (void *)swift_getOpaqueTypeConformance2();
      uint64_t v130 = v167;
      uint64_t v131 = v173;
      sub_E5090();
      (*(void (**)(char *, uint64_t))(v171 + 8))(v128, v131);
      v247._uint64_t countAndFlagsBits = v131;
      v247._object = OpaqueTypeConformance2;
      swift_getOpaqueTypeConformance2();
      uint64_t v132 = v176;
      uint64_t v133 = v174;
      sub_E5010();
      (*(void (**)(char *, uint64_t))(v172 + 8))(v130, v133);
      uint64_t v134 = sub_E4780();
      __chkstk_darwin(v134);
      swift_getKeyPath();
      sub_E48D0();
      swift_release();
      swift_release();
      Swift::String v183 = v247;
      uint64_t v135 = v248;
      uint64_t v136 = WitnessTable;
      sub_E4770();
      swift_release();
      uint64_t v138 = v177;
      uint64_t v137 = v178;
      uint64_t v139 = (uint64_t)v175;
      (*(void (**)(char *, char *, uint64_t))(v177 + 16))(v175, v132, v178);
      uint64_t v140 = (Swift::String *)(v139 + *(int *)(v113 + 36));
      Swift::String *v140 = v183;
      v140[1]._uint64_t countAndFlagsBits = v135;
      v140[1]._object = (void *)v136;
      v140[2]._uint64_t countAndFlagsBits = 90;
      (*(void (**)(char *, uint64_t))(v138 + 8))(v132, v137);
      uint64_t v141 = v182;
      sub_10250(v139, v182, &qword_139C58);
      uint64_t v142 = v199;
      uint64_t v143 = swift_getWitnessTable();
      unint64_t v144 = sub_DC9B0();
      uint64_t v145 = v185;
      sub_D18F0(v141, v142, v113);
      uint64_t v212 = v143;
      unint64_t v213 = v144;
      uint64_t v146 = v192;
      uint64_t v147 = swift_getWitnessTable();
      uint64_t v211 = v143;
      uint64_t v148 = swift_getWitnessTable();
      uint64_t v209 = v143;
      uint64_t v210 = v148;
      uint64_t v149 = swift_getWitnessTable();
      uint64_t v150 = (uint64_t)v187;
      sub_D17F8(v145, v146);
      v189[1](v145, v146);
      uint64_t v207 = v147;
      uint64_t v208 = v149;
      uint64_t v151 = v193;
      swift_getWitnessTable();
      Swift::String v152 = v184;
      sub_D17F8(v150, v151);
      uint64_t v153 = v150;
      uint64_t v58 = v152;
      (*(void (**)(uint64_t, uint64_t))(v188 + 8))(v153, v151);
      sub_102B4(v182, &qword_139C58);
      break;
    case 2:
      __chkstk_darwin(v40);
      sub_E4BA0();
      sub_E52A0();
      uint64_t v74 = v199;
      uint64_t v75 = swift_getWitnessTable();
      uint64_t v76 = v189;
      sub_5F070(v35, v74, v75);
      uint64_t v77 = *(void (**)(char *, uint64_t))(v190 + 8);
      v77(v35, v74);
      uint64_t v78 = v77;
      v198 = (void (*)(void, uint64_t))v77;
      sub_5F070(v76, v74, v75);
      uint64_t v222 = v75;
      uint64_t v79 = swift_getWitnessTable();
      uint64_t v80 = (uint64_t)v180;
      sub_D17F8((uint64_t)v35, v74);
      v78(v35, v74);
      unint64_t v81 = sub_DC9B0();
      uint64_t v220 = v75;
      unint64_t v221 = v81;
      uint64_t v82 = v192;
      uint64_t v83 = swift_getWitnessTable();
      uint64_t v218 = v75;
      uint64_t v219 = v79;
      uint64_t v84 = v194;
      uint64_t v85 = swift_getWitnessTable();
      uint64_t v86 = (uint64_t)v187;
      sub_D18F0(v80, v82, v84);
      (*(void (**)(uint64_t, uint64_t))(v181 + 8))(v80, v84);
      uint64_t v216 = v83;
      uint64_t v217 = v85;
      uint64_t v87 = v193;
      swift_getWitnessTable();
      Swift::String v88 = v184;
      sub_D17F8(v86, v87);
      (*(void (**)(uint64_t, uint64_t))(v188 + 8))(v86, v87);
      v198(v189, v74);
      uint64_t v58 = v88;
      break;
    case 3:
      type metadata accessor for MSRuleBaseView();
      swift_getWitnessTable();
      uint64_t v89 = *(void *)sub_E4770();
      char v90 = (*(uint64_t (**)(void))(v89 + 352))();
      uint64_t v91 = swift_release();
      if ((v90 & 0xF9) != 0)
      {
        uint64_t v92 = (uint64_t)v164;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v190 + 56))(v164, 1, 1, v199);
        swift_getWitnessTable();
      }
      else
      {
        __chkstk_darwin(v91);
        sub_E4BA0();
        sub_E52A0();
        uint64_t v93 = v199;
        uint64_t v94 = swift_getWitnessTable();
        uint64_t v95 = v189;
        sub_5F070(v35, v93, v94);
        uint64_t v96 = v190;
        long long v97 = *(void (**)(char *, uint64_t))(v190 + 8);
        v97(v35, v93);
        uint64_t v92 = (uint64_t)v164;
        sub_5F070(v95, v93, v94);
        v97((char *)v95, v93);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v96 + 56))(v92, 0, 1, v93);
      }
      uint64_t v98 = v163;
      uint64_t v99 = v179;
      uint64_t v100 = v197;
      (*(void (**)(char *, uint64_t, uint64_t))(v163 + 16))(v179, v92, v197);
      uint64_t v101 = *(void (**)(uint64_t, uint64_t))(v98 + 8);
      v101(v92, v100);
      v191 = (void (*)(char *, uint64_t))v101;
      v198 = (void (*)(void, uint64_t))((v98 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000);
      uint64_t v102 = swift_getWitnessTable();
      uint64_t v229 = v102;
      uint64_t v103 = swift_getWitnessTable();
      sub_5F070(v99, v100, v103);
      uint64_t v104 = (uint64_t)v180;
      sub_D18F0(v92, v199, v100);
      v101(v92, v100);
      unint64_t v105 = sub_DC9B0();
      uint64_t v227 = v102;
      unint64_t v228 = v105;
      uint64_t v106 = v192;
      uint64_t v107 = swift_getWitnessTable();
      uint64_t v225 = v102;
      uint64_t v226 = v103;
      uint64_t v108 = v194;
      uint64_t v109 = swift_getWitnessTable();
      uint64_t v110 = (uint64_t)v187;
      sub_D18F0(v104, v106, v108);
      (*(void (**)(uint64_t, uint64_t))(v181 + 8))(v104, v108);
      uint64_t v223 = v107;
      uint64_t v224 = v109;
      uint64_t v111 = v193;
      swift_getWitnessTable();
      uint64_t v58 = v184;
      sub_D17F8(v110, v111);
      (*(void (**)(uint64_t, uint64_t))(v188 + 8))(v110, v111);
      v191(v179, v100);
      break;
    default:
      uint64_t v58 = (char *)&v163 - v41;
      uint64_t v59 = swift_getWitnessTable();
      unint64_t v60 = sub_DC9B0();
      uint64_t v244 = v59;
      unint64_t v245 = v60;
      uint64_t v61 = swift_getWitnessTable();
      uint64_t v243 = v59;
      uint64_t v62 = swift_getWitnessTable();
      uint64_t v241 = v59;
      uint64_t v242 = v62;
      uint64_t v63 = swift_getWitnessTable();
      uint64_t v239 = v61;
      uint64_t v240 = v63;
      uint64_t v64 = v193;
      uint64_t v65 = swift_getWitnessTable();
      sub_D18F0(v65, v64, (uint64_t)&type metadata for EmptyView);
      break;
  }
  uint64_t v154 = swift_getWitnessTable();
  unint64_t v155 = sub_DC9B0();
  uint64_t v237 = v154;
  unint64_t v238 = v155;
  uint64_t v156 = swift_getWitnessTable();
  uint64_t v236 = v154;
  uint64_t v157 = swift_getWitnessTable();
  uint64_t v234 = v154;
  uint64_t v235 = v157;
  uint64_t v158 = swift_getWitnessTable();
  uint64_t v232 = v156;
  uint64_t v233 = v158;
  uint64_t v230 = swift_getWitnessTable();
  v231 = &protocol witness table for EmptyView;
  uint64_t v159 = v196;
  uint64_t v160 = swift_getWitnessTable();
  sub_5F070(v58, v159, v160);
  return (*(uint64_t (**)(char *, uint64_t))(v195 + 8))(v58, v159);
}

uint64_t sub_D73BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v32 = a3;
  uint64_t v5 = type metadata accessor for MSRuleBaseView();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v26 = (char *)&KeyPath - v7;
  uint64_t v8 = type metadata accessor for MSRuleBaseView.RuleFormElement();
  uint64_t v9 = sub_E57B0();
  uint64_t v30 = v9;
  uint64_t v10 = sub_62A4(&qword_139B50);
  uint64_t v29 = v10;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v28 = WitnessTable;
  uint64_t v27 = swift_getWitnessTable();
  uint64_t v35 = v9;
  uint64_t v36 = v8;
  uint64_t v37 = v10;
  uint64_t v38 = WitnessTable;
  uint64_t v39 = v27;
  uint64_t v12 = sub_E5360();
  uint64_t v31 = *(void *)(v12 - 8);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v15 = (char *)&KeyPath - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&KeyPath - v16;
  uint64_t v35 = *(void *)(a1 + *(int *)(v5 + 32));
  uint64_t v33 = a2;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v18 = v26;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v26, a1, v5);
  unint64_t v19 = (*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v20 + v19, v18, v5);
  uint64_t v21 = sub_DC298(&qword_139B58, &qword_139B50, (void (*)(void))sub_DC048, (void (*)(void))sub_DC25C);
  swift_bridgeObjectRetain();
  sub_E5340();
  uint64_t v34 = v21;
  uint64_t v22 = swift_getWitnessTable();
  sub_5F070(v15, v12, v22);
  uint64_t v23 = *(void (**)(char *, uint64_t))(v31 + 8);
  v23(v15, v12);
  sub_5F070(v17, v12, v22);
  return ((uint64_t (*)(char *, uint64_t))v23)(v17, v12);
}

uint64_t sub_D773C@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v246 = sub_6898(&qword_139C88);
  __chkstk_darwin(v246);
  uint64_t v247 = (uint64_t)&v210 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v263 = sub_6898(&qword_139C30);
  __chkstk_darwin(v263);
  uint64_t v248 = (char *)&v210 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v212 = type metadata accessor for MSFolderListSelectionView();
  __chkstk_darwin(v212);
  uint64_t v211 = (uint64_t *)((char *)&v210 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v245 = sub_6898(&qword_139C40);
  __chkstk_darwin(v245);
  uint64_t v236 = (char *)&v210 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v219 = sub_6898(&qword_1317D8);
  uint64_t v217 = *(void *)(v219 - 8);
  __chkstk_darwin(v219);
  unint64_t v213 = (char *)&v210 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v221 = sub_6898(&qword_138988);
  uint64_t v220 = *(void *)(v221 - 8);
  __chkstk_darwin(v221);
  uint64_t v214 = (char *)&v210 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v222 = sub_6898(&qword_139C10);
  __chkstk_darwin(v222);
  uint64_t v215 = (char *)&v210 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v225 = sub_6898(&qword_139C08);
  uint64_t v223 = *(void *)(v225 - 8);
  __chkstk_darwin(v225);
  uint64_t v216 = (char *)&v210 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v226 = sub_6898(&qword_139C00);
  uint64_t v224 = *(void *)(v226 - 8);
  __chkstk_darwin(v226);
  uint64_t v218 = (char *)&v210 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v231 = sub_6898(&qword_139C90);
  uint64_t v230 = *(void *)(v231 - 8);
  __chkstk_darwin(v231);
  uint64_t v229 = (char *)&v210 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v238 = sub_6898(&qword_139BF8);
  uint64_t v237 = *(void *)(v238 - 8);
  uint64_t v16 = __chkstk_darwin(v238);
  unint64_t v228 = (char *)&v210 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v227 = (uint64_t)&v210 - v18;
  uint64_t v253 = sub_6898(&qword_139BE8);
  __chkstk_darwin(v253);
  uint64_t v239 = (uint64_t)&v210 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v259 = sub_6898(&qword_139C98);
  __chkstk_darwin(v259);
  uint64_t v261 = (uint64_t)&v210 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v250 = sub_6898(&qword_139CA0);
  __chkstk_darwin(v250);
  uint64_t v251 = (uint64_t)&v210 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v260 = sub_6898(&qword_139BC8);
  __chkstk_darwin(v260);
  Swift::String_optional v254 = (char *)&v210 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v269 = sub_6898(&qword_139BB8);
  __chkstk_darwin(v269);
  v262 = (void (**)(char *, char *, uint64_t))((char *)&v210 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v249 = sub_6898(&qword_139BD0);
  uint64_t v233 = *(void *)(v249 - 8);
  __chkstk_darwin(v249);
  uint64_t v25 = (char *)&v210 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v252 = sub_6898(&qword_139CA8);
  uint64_t v235 = *(void *)(v252 - 8);
  uint64_t v26 = __chkstk_darwin(v252);
  uint64_t v28 = (char *)&v210 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v26);
  uint64_t v234 = (char *)&v210 - v29;
  uint64_t v266 = sub_6898(&qword_139CB0);
  __chkstk_darwin(v266);
  uint64_t v268 = (uint64_t)&v210 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v255 = sub_6898(&qword_139CB8);
  __chkstk_darwin(v255);
  v257 = (Swift::String *)((char *)&v210 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v243 = sub_6898(&qword_139CC0);
  __chkstk_darwin(v243);
  uint64_t v33 = (char *)&v210 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v256 = sub_6898(&qword_139B78);
  __chkstk_darwin(v256);
  uint64_t v244 = (char *)&v210 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v267 = sub_6898(&qword_139B68);
  uint64_t v35 = __chkstk_darwin(v267);
  v258._uint64_t countAndFlagsBits = (uint64_t)&v210 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = a2;
  uint64_t v241 = *(void *)(a2 - 8);
  uint64_t v38 = *(void *)(v241 + 64);
  __chkstk_darwin(v35);
  uint64_t v240 = (char *)&v210 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v242 = sub_6898(&qword_139B80);
  uint64_t v232 = *(void *)(v242 - 8);
  __chkstk_darwin(v242);
  uint64_t v40 = (char *)&v210 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_6898(&qword_139CC8);
  uint64_t v42 = __chkstk_darwin(v41);
  uint64_t v44 = (char *)&v210 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = __chkstk_darwin(v42);
  unint64_t v48 = (char *)&v210 - v47;
  uint64_t v265 = a3;
  switch(a1)
  {
    case 5:
      v262 = v46;
      uint64_t v263 = v45;
      uint64_t v49 = sub_E4BB0();
      uint64_t v260 = v50;
      uint64_t v261 = v49;
      LODWORD(v253) = v51;
      uint64_t v259 = v52;
      uint64_t v210 = v37;
      uint64_t v53 = *(void *)(v37 + 16);
      swift_getWitnessTable();
      Swift::String_optional v254 = v33;
      uint64_t v54 = sub_E4780();
      __chkstk_darwin(v54);
      uint64_t v252 = v53;
      swift_getKeyPath();
      sub_E48D0();
      swift_release();
      swift_release();
      Swift::String v270 = v273;
      LOBYTE(v271._countAndFlagsBits) = v274._countAndFlagsBits;
      sub_6898(&qword_139D00);
      sub_DD114();
      sub_DD168(&qword_139D10, &qword_139D00);
      sub_E52C0();
      uint64_t v55 = *(void *)sub_E4770();
      char v56 = (*(uint64_t (**)(void))(v55 + 400))();
      swift_release();
      LOBYTE(v273._countAndFlagsBits) = v56;
      uint64_t v57 = v241;
      uint64_t v58 = v240;
      uint64_t v59 = v210;
      (*(void (**)(char *, uint64_t, uint64_t))(v241 + 16))(v240, v264, v210);
      unint64_t v60 = (*(unsigned __int8 *)(v57 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80);
      uint64_t v61 = swift_allocObject();
      *(void *)(v61 + 16) = v252;
      (*(void (**)(unint64_t, char *, uint64_t))(v57 + 32))(v61 + v60, v58, v59);
      uint64_t v62 = sub_105AC(&qword_139B88, &qword_139B80);
      unint64_t v63 = sub_8F778();
      uint64_t v64 = v242;
      sub_E5150();
      swift_release();
      (*(void (**)(char *, uint64_t))(v232 + 8))(v40, v64);
      uint64_t v65 = v262;
      uint64_t v66 = v263;
      v262[4](v48, v44, v263);
      v65[2](v254, v48, v66);
      swift_storeEnumTagMultiPayload();
      v273._uint64_t countAndFlagsBits = v64;
      v273._object = &type metadata for RuleCondition;
      v274._uint64_t countAndFlagsBits = v62;
      v274._object = (void *)v63;
      swift_getOpaqueTypeConformance2();
      uint64_t v67 = (uint64_t)v244;
      sub_E4C50();
      sub_105F0(v67, (uint64_t)v257, &qword_139B78);
      swift_storeEnumTagMultiPayload();
      sub_6898(&qword_139B98);
      sub_DC084();
      sub_DC174();
      uint64_t countAndFlagsBits = v258._countAndFlagsBits;
      sub_E4C50();
      sub_102B4(v67, &qword_139B78);
      sub_105F0(countAndFlagsBits, v268, &qword_139B68);
      swift_storeEnumTagMultiPayload();
      sub_DC048();
      sub_DC25C();
      sub_E4C50();
      sub_102B4(countAndFlagsBits, &qword_139B68);
      return ((uint64_t (*)(char *, uint64_t))v65[1])(v48, v66);
    case 6:
      type metadata accessor for MAPreferencesViewProvider();
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      NSBundle v116 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
      v273._uint64_t countAndFlagsBits = 2777980912;
      v273._object = (void *)0xA400000000000000;
      v280._uint64_t countAndFlagsBits = 0xD00000000000001ALL;
      v280._object = (void *)0x80000000000F7220;
      sub_E5690(v280);
      v281._uint64_t countAndFlagsBits = 2777980912;
      v281._object = (void *)0xA400000000000000;
      sub_E5690(v281);
      v209._uint64_t countAndFlagsBits = 0xE000000000000000;
      v282._uint64_t countAndFlagsBits = 0xD00000000000001ALL;
      v282._object = (void *)0x80000000000F7220;
      v293.value._uint64_t countAndFlagsBits = 0;
      v293.value._object = 0;
      v117.super.isa = v116;
      uint64_t v118 = sub_E3FE0(v282, v293, v117, v273, v209);
      uint64_t v120 = v119;

      swift_bridgeObjectRelease();
      v273._uint64_t countAndFlagsBits = v118;
      v273._object = v120;
      sub_E3F8();
      uint64_t v121 = sub_E4F60();
      uint64_t v123 = v122;
      *(void *)uint64_t v33 = v121;
      *((void *)v33 + 1) = v122;
      LOBYTE(v120) = v124 & 1;
      v33[16] = v124 & 1;
      *((void *)v33 + 3) = v125;
      swift_storeEnumTagMultiPayload();
      sub_FA04(v121, v123, (char)v120);
      uint64_t v126 = sub_105AC(&qword_139B88, &qword_139B80);
      unint64_t v127 = sub_8F778();
      swift_bridgeObjectRetain();
      v273._uint64_t countAndFlagsBits = v242;
      v273._object = &type metadata for RuleCondition;
      v274._uint64_t countAndFlagsBits = v126;
      v274._object = (void *)v127;
      swift_getOpaqueTypeConformance2();
      uint64_t v128 = (uint64_t)v244;
      sub_E4C50();
      sub_105F0(v128, (uint64_t)v257, &qword_139B78);
      swift_storeEnumTagMultiPayload();
      sub_6898(&qword_139B98);
      sub_DC084();
      sub_DC174();
      uint64_t v129 = v258._countAndFlagsBits;
      sub_E4C50();
      sub_102B4(v128, &qword_139B78);
      sub_105F0(v129, v268, &qword_139B68);
      swift_storeEnumTagMultiPayload();
      sub_DC048();
      sub_DC25C();
      sub_E4C50();
      sub_102B4(v129, &qword_139B68);
      uint64_t v86 = v121;
      uint64_t v87 = v123;
      char v88 = (char)v120;
      goto LABEL_7;
    case 7:
      type metadata accessor for MAPreferencesViewProvider();
      uint64_t v70 = swift_getObjCClassFromMetadata();
      int v71 = (objc_class *)[self bundleForClass:v70];
      v273._uint64_t countAndFlagsBits = 2777980912;
      v273._object = (void *)0xA400000000000000;
      v277._uint64_t countAndFlagsBits = 0xD000000000000017;
      v277._object = (void *)0x80000000000F7200;
      sub_E5690(v277);
      v278._uint64_t countAndFlagsBits = 2777980912;
      v278._object = (void *)0xA400000000000000;
      sub_E5690(v278);
      v209._uint64_t countAndFlagsBits = 0xE000000000000000;
      v279._uint64_t countAndFlagsBits = 0xD000000000000017;
      v279._object = (void *)0x80000000000F7200;
      v292.value._uint64_t countAndFlagsBits = 0;
      v292.value._object = 0;
      v72.super.isa = v71;
      uint64_t v73 = sub_E3FE0(v279, v292, v72, v273, v209);
      uint64_t v75 = v74;

      swift_bridgeObjectRelease();
      v273._uint64_t countAndFlagsBits = v73;
      v273._object = v75;
      sub_E3F8();
      uint64_t v76 = sub_E4F60();
      uint64_t v78 = v77;
      v270._uint64_t countAndFlagsBits = v76;
      v270._object = (void *)v77;
      LOBYTE(v75) = v79 & 1;
      v271._uint64_t countAndFlagsBits = v79 & 1;
      v271._object = v80;
      __int16 v272 = 0;
      sub_FA04(v76, v77, v79 & 1);
      swift_bridgeObjectRetain();
      sub_6898(&qword_139BA8);
      sub_DC1F0();
      sub_E4C50();
      char v81 = v275;
      char v82 = v276;
      Swift::String v83 = v274;
      uint64_t v84 = v257;
      Swift::String *v257 = v273;
      v84[1] = v83;
      LOBYTE(v84[2]._countAndFlagsBits) = v81;
      BYTE1(v84[2]._countAndFlagsBits) = v82;
      swift_storeEnumTagMultiPayload();
      sub_6898(&qword_139B98);
      sub_DC084();
      sub_DC174();
      uint64_t v85 = v258._countAndFlagsBits;
      sub_E4C50();
      sub_105F0(v85, v268, &qword_139B68);
      swift_storeEnumTagMultiPayload();
      sub_DC048();
      sub_DC25C();
      sub_E4C50();
      sub_102B4(v85, &qword_139B68);
      uint64_t v86 = v76;
      uint64_t v87 = v78;
      char v88 = (char)v75;
LABEL_7:
      sub_EF0C(v86, v87, v88);
      return swift_bridgeObjectRelease();
    case 8:
      swift_getWitnessTable();
      uint64_t v130 = *(void *)sub_E4770();
      char v131 = (*(uint64_t (**)(void))(v130 + 352))();
      swift_release();
      int v132 = v131 & 0xFB;
      type metadata accessor for MAPreferencesViewProvider();
      uint64_t v133 = swift_getObjCClassFromMetadata();
      uint64_t v134 = (objc_class *)[self bundleForClass:v133];
      v273._uint64_t countAndFlagsBits = 2777980912;
      v273._object = (void *)0xA400000000000000;
      if (v132)
      {
        v283._uint64_t countAndFlagsBits = 0xD000000000000024;
        v283._object = (void *)0x80000000000F71A0;
        sub_E5690(v283);
        v284._uint64_t countAndFlagsBits = 2777980912;
        v284._object = (void *)0xA400000000000000;
        sub_E5690(v284);
        v209._uint64_t countAndFlagsBits = 0xE000000000000000;
        v285._uint64_t countAndFlagsBits = 0xD000000000000024;
        v285._object = (void *)0x80000000000F71A0;
        v294.value._uint64_t countAndFlagsBits = 0;
        v294.value._object = 0;
        v135.super.isa = v134;
        uint64_t v136 = sub_E3FE0(v285, v294, v135, v273, v209);
        uint64_t v138 = v137;

        swift_bridgeObjectRelease();
        v273._uint64_t countAndFlagsBits = v136;
        v273._object = v138;
        sub_E3F8();
        v270._uint64_t countAndFlagsBits = sub_E4F60();
        v270._object = v140;
        v271._uint64_t countAndFlagsBits = v139 & 1;
        v271._object = v141;
        LOBYTE(v272) = 1;
      }
      else
      {
        v286._uint64_t countAndFlagsBits = 0xD000000000000025;
        v286._object = (void *)0x80000000000F71D0;
        sub_E5690(v286);
        v287._uint64_t countAndFlagsBits = 2777980912;
        v287._object = (void *)0xA400000000000000;
        sub_E5690(v287);
        v209._uint64_t countAndFlagsBits = 0xE000000000000000;
        v288._uint64_t countAndFlagsBits = 0xD000000000000025;
        v288._object = (void *)0x80000000000F71D0;
        v295.value._uint64_t countAndFlagsBits = 0;
        v295.value._object = 0;
        v157.super.isa = v134;
        uint64_t v158 = sub_E3FE0(v288, v295, v157, v273, v209);
        uint64_t v160 = v159;

        swift_bridgeObjectRelease();
        v273._uint64_t countAndFlagsBits = v158;
        v273._object = v160;
        sub_E3F8();
        v270._uint64_t countAndFlagsBits = sub_E4F60();
        v270._object = v161;
        v271._uint64_t countAndFlagsBits = v162 & 1;
        v271._object = v163;
        LOBYTE(v272) = 0;
      }
      sub_E4C50();
      Swift::String v164 = v273;
      char v165 = v274._countAndFlagsBits;
      Swift::String v270 = v273;
      Swift::String v271 = v274;
      LOBYTE(v272) = v275;
      HIBYTE(v272) = 1;
      sub_763C4(v273._countAndFlagsBits, (uint64_t)v273._object, v274._countAndFlagsBits);
      sub_6898(&qword_139BA8);
      sub_DC1F0();
      sub_E4C50();
      char v166 = v275;
      char v167 = v276;
      Swift::String v168 = v274;
      uint64_t v169 = v257;
      Swift::String *v257 = v273;
      v169[1] = v168;
      LOBYTE(v169[2]._countAndFlagsBits) = v166;
      BYTE1(v169[2]._countAndFlagsBits) = v167;
      swift_storeEnumTagMultiPayload();
      sub_6898(&qword_139B98);
      sub_DC084();
      sub_DC174();
      uint64_t v170 = v258._countAndFlagsBits;
      sub_E4C50();
      sub_105F0(v170, v268, &qword_139B68);
      swift_storeEnumTagMultiPayload();
      sub_DC048();
      sub_DC25C();
      sub_E4C50();
      sub_76400(v164._countAndFlagsBits, (uint64_t)v164._object, v165);
      uint64_t v114 = v170;
      uint64_t v171 = &qword_139B68;
      return sub_102B4(v114, v171);
    case 9:
      v258._uint64_t countAndFlagsBits = sub_E4BB0();
      v257 = v89;
      LODWORD(v255) = v90;
      uint64_t v256 = v91;
      uint64_t v92 = v37;
      uint64_t v210 = v37;
      uint64_t v93 = v264;
      uint64_t v94 = *(void *)(v92 + 16);
      swift_getWitnessTable();
      uint64_t v95 = sub_E4780();
      __chkstk_darwin(v95);
      swift_getKeyPath();
      sub_E48D0();
      swift_release();
      swift_release();
      Swift::String v270 = v273;
      LOBYTE(v271._countAndFlagsBits) = v274._countAndFlagsBits;
      sub_6898(&qword_139CE8);
      sub_DD008();
      sub_DD168(&qword_139CF8, &qword_139CE8);
      sub_E52C0();
      uint64_t v96 = *(void *)sub_E4770();
      char v97 = (*(uint64_t (**)(void))(v96 + 400))();
      swift_release();
      LOBYTE(v273._countAndFlagsBits) = v97;
      uint64_t v98 = v241;
      uint64_t v99 = v240;
      uint64_t v100 = v210;
      (*(void (**)(char *, uint64_t, uint64_t))(v241 + 16))(v240, v93, v210);
      unint64_t v101 = (*(unsigned __int8 *)(v98 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v98 + 80);
      uint64_t v102 = swift_allocObject();
      *(void *)(v102 + 16) = v94;
      (*(void (**)(unint64_t, char *, uint64_t))(v98 + 32))(v102 + v101, v99, v100);
      uint64_t v103 = sub_105AC(&qword_139BD8, &qword_139BD0);
      unint64_t v104 = sub_8F778();
      uint64_t v105 = v249;
      sub_E5150();
      swift_release();
      (*(void (**)(char *, uint64_t))(v233 + 8))(v25, v105);
      uint64_t v106 = v235;
      uint64_t v107 = v234;
      uint64_t v108 = v252;
      (*(void (**)(char *, char *, uint64_t))(v235 + 32))(v234, v28, v252);
      (*(void (**)(uint64_t, char *, uint64_t))(v106 + 16))(v251, v107, v108);
      swift_storeEnumTagMultiPayload();
      v273._uint64_t countAndFlagsBits = v105;
      v273._object = &type metadata for RuleCondition;
      v274._uint64_t countAndFlagsBits = v103;
      v274._object = (void *)v104;
      swift_getOpaqueTypeConformance2();
      sub_DCAD0(&qword_139BE0, &qword_139BE8, (void (*)(void))sub_DC434);
      uint64_t v109 = (uint64_t)v254;
      sub_E4C50();
      sub_105F0(v109, v261, &qword_139BC8);
      swift_storeEnumTagMultiPayload();
      sub_DC320();
      sub_DC6A8();
      uint64_t v110 = (uint64_t)v262;
      sub_E4C50();
      sub_102B4(v109, &qword_139BC8);
      sub_105F0(v110, v268, &qword_139BB8);
      swift_storeEnumTagMultiPayload();
      sub_DC048();
      sub_DC25C();
      sub_E4C50();
      sub_102B4(v110, &qword_139BB8);
      return (*(uint64_t (**)(char *, uint64_t))(v106 + 8))(v107, v108);
    case 10:
      uint64_t WitnessTable = swift_getWitnessTable();
      uint64_t v143 = *(void *)sub_E4770();
      char v144 = (*(uint64_t (**)(void))(v143 + 352))();
      swift_release();
      if ((v144 & 0xFB) != 0)
      {
        uint64_t v264 = WitnessTable;
        uint64_t v145 = *(void *)sub_E4770();
        int v146 = (*(unsigned __int8 (**)(void))(v145 + 352))();
        swift_release();
        uint64_t v147 = 0;
        uint64_t v148 = (void *)0xE000000000000000;
        switch(v146)
        {
          case 0:
          case 4:
            uint64_t v147 = 0xD000000000000023;
            uint64_t v149 = "RULES.FORM.PLACEHOLDER.CHOOSEFOLDER";
            goto LABEL_21;
          case 2:
          case 6:
            uint64_t v147 = 0xD000000000000023;
            uint64_t v149 = "RULES.FORM.PLACEHOLDER.EMAILADDRESS";
LABEL_21:
            uint64_t v148 = (void *)((unint64_t)(v149 - 32) | 0x8000000000000000);
            break;
          default:
            break;
        }
        type metadata accessor for MAPreferencesViewProvider();
        uint64_t v175 = swift_getObjCClassFromMetadata();
        v176 = (objc_class *)[self bundleForClass:v175];
        v273._uint64_t countAndFlagsBits = 2777980912;
        v273._object = (void *)0xA400000000000000;
        v289._uint64_t countAndFlagsBits = v147;
        v289._object = v148;
        sub_E5690(v289);
        v290._uint64_t countAndFlagsBits = 2777980912;
        v290._object = (void *)0xA400000000000000;
        sub_E5690(v290);
        v209._uint64_t countAndFlagsBits = 0xE000000000000000;
        v291._uint64_t countAndFlagsBits = v147;
        v291._object = v148;
        v296.value._uint64_t countAndFlagsBits = 0;
        v296.value._object = 0;
        v177.super.isa = v176;
        uint64_t v178 = sub_E3FE0(v291, v296, v177, v273, v209);
        v180 = v179;
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        uint64_t v181 = sub_E4780();
        __chkstk_darwin(v181);
        swift_getKeyPath();
        sub_E48D0();
        swift_release();
        swift_release();
        v270._uint64_t countAndFlagsBits = v178;
        v270._object = v180;
        sub_E3F8();
        uint64_t v182 = v213;
        sub_E5420();
        sub_105AC(&qword_131808, &qword_1317D8);
        Swift::String v183 = v214;
        uint64_t v184 = v219;
        sub_E5000();
        (*(void (**)(char *, uint64_t))(v217 + 8))(v182, v184);
        uint64_t KeyPath = swift_getKeyPath();
        uint64_t v186 = v220;
        uint64_t v187 = (uint64_t)v215;
        uint64_t v188 = v221;
        (*(void (**)(char *, char *, uint64_t))(v220 + 16))(v215, v183, v221);
        uint64_t v189 = v222;
        uint64_t v190 = (uint64_t *)(v187 + *(int *)(v222 + 36));
        v190[1] = 0;
        v190[2] = 0;
        *uint64_t v190 = KeyPath;
        (*(void (**)(char *, uint64_t))(v186 + 8))(v183, v188);
        v191 = (void *)sub_DC554();
        uint64_t v192 = v216;
        sub_E5060();
        sub_102B4(v187, &qword_139C10);
        v273._uint64_t countAndFlagsBits = v189;
        v273._object = v191;
        uint64_t OpaqueTypeConformance2 = (void *)swift_getOpaqueTypeConformance2();
        uint64_t v194 = v218;
        uint64_t v195 = v225;
        sub_E5090();
        (*(void (**)(char *, uint64_t))(v223 + 8))(v192, v195);
        v273._uint64_t countAndFlagsBits = v195;
        v273._object = OpaqueTypeConformance2;
        swift_getOpaqueTypeConformance2();
        uint64_t v196 = v229;
        uint64_t v197 = v226;
        sub_E5010();
        (*(void (**)(char *, uint64_t))(v224 + 8))(v194, v197);
        uint64_t v198 = sub_E4780();
        __chkstk_darwin(v198);
        swift_getKeyPath();
        sub_E48D0();
        swift_release();
        swift_release();
        Swift::String v258 = v273;
        Swift::String v199 = v274;
        sub_E4770();
        swift_release();
        uint64_t v200 = v230;
        uint64_t v201 = (uint64_t)v228;
        uint64_t v202 = v231;
        (*(void (**)(char *, char *, uint64_t))(v230 + 16))(v228, v196, v231);
        uint64_t v203 = v238;
        uint64_t v204 = v201 + *(int *)(v238 + 36);
        *(Swift::String *)uint64_t v204 = v258;
        *(Swift::String *)(v204 + 16) = v199;
        *(void *)(v204 + 32) = 90;
        (*(void (**)(char *, uint64_t))(v200 + 8))(v196, v202);
        uint64_t v205 = v227;
        sub_10250(v201, v227, &qword_139BF8);
        uint64_t v156 = v239;
        sub_10250(v205, v239, &qword_139BF8);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v237 + 56))(v156, 0, 1, v203);
      }
      else
      {
        uint64_t v156 = v239;
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v237 + 56))(v239, 1, 1, v238);
      }
      uint64_t v113 = &qword_139BE8;
      sub_105F0(v156, v251, &qword_139BE8);
      swift_storeEnumTagMultiPayload();
      uint64_t v206 = sub_105AC(&qword_139BD8, &qword_139BD0);
      unint64_t v207 = sub_8F778();
      v273._uint64_t countAndFlagsBits = v249;
      v273._object = &type metadata for RuleCondition;
      v274._uint64_t countAndFlagsBits = v206;
      v274._object = (void *)v207;
      swift_getOpaqueTypeConformance2();
      sub_DCAD0(&qword_139BE0, &qword_139BE8, (void (*)(void))sub_DC434);
      uint64_t v173 = (uint64_t)v254;
      sub_E4C50();
      uint64_t v174 = &qword_139BC8;
      sub_105F0(v173, v261, &qword_139BC8);
      goto LABEL_24;
    case 11:
      uint64_t v150 = v264;
      uint64_t v151 = *(void *)(v37 + 16);
      swift_getWitnessTable();
      uint64_t v152 = *(void *)sub_E4770();
      char v153 = (*(uint64_t (**)(void))(v152 + 352))();
      uint64_t v154 = swift_release();
      if ((v153 & 0xFB) != 0)
      {
        uint64_t v155 = sub_6898(&qword_139C50);
        uint64_t v156 = (uint64_t)v236;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v155 - 8) + 56))(v236, 1, 1, v155);
      }
      else
      {
        __chkstk_darwin(v154);
        sub_DB1C4(v150, v151, v211);
        sub_6898(&qword_139CD0);
        sub_105AC(&qword_139CD8, &qword_139CD0);
        sub_DCE30();
        uint64_t v156 = (uint64_t)v236;
        sub_E4850();
        uint64_t v172 = sub_6898(&qword_139C50);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v172 - 8) + 56))(v156, 0, 1, v172);
      }
      uint64_t v113 = &qword_139C40;
      sub_105F0(v156, v247, &qword_139C40);
      swift_storeEnumTagMultiPayload();
      sub_DC724();
      uint64_t v173 = (uint64_t)v248;
      sub_E4C50();
      uint64_t v174 = &qword_139C30;
      sub_105F0(v173, v261, &qword_139C30);
LABEL_24:
      swift_storeEnumTagMultiPayload();
      sub_DC320();
      sub_DC6A8();
      uint64_t v208 = (uint64_t)v262;
      sub_E4C50();
      sub_102B4(v173, v174);
      sub_105F0(v208, v268, &qword_139BB8);
      swift_storeEnumTagMultiPayload();
      sub_DC048();
      sub_DC25C();
      sub_E4C50();
      sub_102B4(v208, &qword_139BB8);
      uint64_t v114 = v156;
      break;
    default:
      swift_storeEnumTagMultiPayload();
      sub_DC724();
      uint64_t v111 = (uint64_t)v248;
      sub_E4C50();
      sub_105F0(v111, v261, &qword_139C30);
      swift_storeEnumTagMultiPayload();
      sub_DC320();
      sub_DC6A8();
      uint64_t v112 = (uint64_t)v262;
      sub_E4C50();
      sub_102B4(v111, &qword_139C30);
      uint64_t v113 = &qword_139BB8;
      sub_105F0(v112, v268, &qword_139BB8);
      swift_storeEnumTagMultiPayload();
      sub_DC048();
      sub_DC25C();
      sub_E4C50();
      uint64_t v114 = v112;
      break;
  }
  uint64_t v171 = v113;
  return sub_102B4(v114, v171);
}

uint64_t sub_DA1E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v32 = a3;
  uint64_t v5 = type metadata accessor for MSRuleBaseView();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v26 = (char *)&KeyPath - v7;
  uint64_t v8 = type metadata accessor for MSRuleBaseView.RuleFormElement();
  uint64_t v9 = sub_E57B0();
  uint64_t v30 = v9;
  uint64_t v10 = sub_62A4(&qword_139B50);
  uint64_t v29 = v10;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v28 = WitnessTable;
  uint64_t v27 = swift_getWitnessTable();
  uint64_t v35 = v9;
  uint64_t v36 = v8;
  uint64_t v37 = v10;
  uint64_t v38 = WitnessTable;
  uint64_t v39 = v27;
  uint64_t v12 = sub_E5360();
  uint64_t v31 = *(void *)(v12 - 8);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v15 = (char *)&KeyPath - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&KeyPath - v16;
  uint64_t v35 = *(void *)(a1 + *(int *)(v5 + 36));
  uint64_t v33 = a2;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v18 = v26;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v26, a1, v5);
  unint64_t v19 = (*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v20 + v19, v18, v5);
  uint64_t v21 = sub_DC298(&qword_139B58, &qword_139B50, (void (*)(void))sub_DC048, (void (*)(void))sub_DC25C);
  swift_bridgeObjectRetain();
  sub_E5340();
  uint64_t v34 = v21;
  uint64_t v22 = swift_getWitnessTable();
  sub_5F070(v15, v12, v22);
  uint64_t v23 = *(void (**)(char *, uint64_t))(v31 + 8);
  v23(v15, v12);
  sub_5F070(v17, v12, v22);
  return ((uint64_t (*)(char *, uint64_t))v23)(v17, v12);
}

uint64_t sub_DA564@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v32 = a3;
  uint64_t v5 = type metadata accessor for MSRuleBaseView();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v26 = (char *)&KeyPath - v7;
  uint64_t v8 = type metadata accessor for MSRuleBaseView.RuleFormElement();
  uint64_t v9 = sub_E57B0();
  uint64_t v30 = v9;
  uint64_t v10 = sub_62A4(&qword_139B50);
  uint64_t v29 = v10;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v28 = WitnessTable;
  uint64_t v27 = swift_getWitnessTable();
  uint64_t v35 = v9;
  uint64_t v36 = v8;
  uint64_t v37 = v10;
  uint64_t v38 = WitnessTable;
  uint64_t v39 = v27;
  uint64_t v12 = sub_E5360();
  uint64_t v31 = *(void *)(v12 - 8);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v15 = (char *)&KeyPath - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&KeyPath - v16;
  uint64_t v35 = *(void *)(a1 + *(int *)(v5 + 40));
  uint64_t v33 = a2;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v18 = v26;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v26, a1, v5);
  unint64_t v19 = (*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v20 + v19, v18, v5);
  uint64_t v21 = sub_DC298(&qword_139B58, &qword_139B50, (void (*)(void))sub_DC048, (void (*)(void))sub_DC25C);
  swift_bridgeObjectRetain();
  sub_E5340();
  uint64_t v34 = v21;
  uint64_t v22 = swift_getWitnessTable();
  sub_5F070(v15, v12, v22);
  uint64_t v23 = *(void (**)(char *, uint64_t))(v31 + 8);
  v23(v15, v12);
  sub_5F070(v17, v12, v22);
  return ((uint64_t (*)(char *, uint64_t))v23)(v17, v12);
}

uint64_t sub_DA8E4@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MSRuleBaseView();
  swift_getWitnessTable();
  uint64_t v2 = *(void *)sub_E4770();
  (*(void (**)(void))(v2 + 1120))();
  uint64_t v4 = v3;
  uint64_t result = swift_release();
  if (v4)
  {
    sub_E3F8();
    uint64_t v6 = sub_E4F60();
    uint64_t v8 = v7;
    char v10 = v9 & 1;
    sub_E5170();
    uint64_t v11 = sub_E4F30();
    uint64_t v4 = v12;
    uint64_t v14 = v13;
    uint64_t v16 = v15 & 1;
    sub_EF0C(v6, v8, v10);
    swift_release();
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v16 = 0;
    uint64_t v14 = 0;
  }
  *a1 = v11;
  a1[1] = v4;
  a1[2] = v16;
  a1[3] = v14;
  return result;
}

uint64_t sub_DAA7C()
{
  return sub_E5340();
}

uint64_t sub_DAB50@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = 0xD000000000000020;
  uint64_t v4 = (void *)0x80000000000F7310;
  switch(*a1)
  {
    case 1:
      uint64_t v5 = "RULES.RULEOPTIONS.CONDITION.TO";
      goto LABEL_4;
    case 2:
      uint64_t v5 = "RULES.RULEOPTIONS.CONDITION.CC";
LABEL_4:
      uint64_t v4 = (void *)((unint64_t)(v5 - 32) | 0x8000000000000000);
      uint64_t v3 = 0xD00000000000001ELL;
      break;
    case 3:
      uint64_t v3 = 0xD000000000000022;
      uint64_t v6 = "RULES.RULEOPTIONS.CONDITION.TOORCC";
      goto LABEL_8;
    case 4:
      uint64_t v3 = 0xD000000000000023;
      uint64_t v6 = "RULES.RULEOPTIONS.CONDITION.SUBJECT";
      goto LABEL_8;
    case 5:
      uint64_t v3 = 0xD000000000000022;
      uint64_t v6 = "RULES.RULEOPTIONS.CONDITION.LISTID";
LABEL_8:
      uint64_t v4 = (void *)((unint64_t)(v6 - 32) | 0x8000000000000000);
      break;
    default:
      break;
  }
  type metadata accessor for MAPreferencesViewProvider();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v8 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v15._uint64_t countAndFlagsBits = v3;
  v15._object = v4;
  sub_E5690(v15);
  v16._uint64_t countAndFlagsBits = 2777980912;
  v16._object = (void *)0xA400000000000000;
  sub_E5690(v16);
  v19._uint64_t countAndFlagsBits = 2777980912;
  v14._uint64_t countAndFlagsBits = 0xE000000000000000;
  v17._uint64_t countAndFlagsBits = v3;
  v17._object = v4;
  v18.value._uint64_t countAndFlagsBits = 0;
  v18.value._object = 0;
  v9.super.isa = v8;
  v19._object = (void *)0xA400000000000000;
  sub_E3FE0(v17, v18, v9, v19, v14);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_E3F8();
  uint64_t result = sub_E4F60();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v11;
  *(unsigned char *)(a2 + 16) = v12 & 1;
  *(void *)(a2 + 24) = v13;
  return result;
}

uint64_t sub_DAD1C()
{
  return sub_E5340();
}

uint64_t sub_DADF0@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = 0xD000000000000025;
  uint64_t v4 = (void *)0x80000000000F7470;
  switch(*a1)
  {
    case 1:
      uint64_t v3 = 0xD000000000000024;
      uint64_t v5 = "RULES.RULEOPTIONS.ACTION.MOVETOTRASH";
      goto LABEL_8;
    case 2:
      uint64_t v3 = 0xD000000000000022;
      uint64_t v5 = "RULES.RULEOPTIONS.ACTION.FORWARDTO";
      goto LABEL_8;
    case 3:
      uint64_t v4 = (void *)0x80000000000F73E0;
      uint64_t v3 = 0xD000000000000021;
      break;
    case 4:
      uint64_t v3 = 0xD000000000000030;
      uint64_t v5 = "RULES.RULEOPTIONS.ACTION.MOVETOFOLDERANDMARKREAD";
      goto LABEL_8;
    case 5:
      uint64_t v3 = 0xD00000000000002FLL;
      uint64_t v5 = "RULES.RULEOPTIONS.ACTION.MOVETOTRASHANDMARKREAD";
      goto LABEL_8;
    case 6:
      uint64_t v3 = 0xD00000000000002DLL;
      uint64_t v5 = "RULES.RULEOPTIONS.ACTION.FORWARDTOANDMARKREAD";
LABEL_8:
      uint64_t v4 = (void *)((unint64_t)(v5 - 32) | 0x8000000000000000);
      break;
    default:
      break;
  }
  type metadata accessor for MAPreferencesViewProvider();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v7 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v14._uint64_t countAndFlagsBits = v3;
  v14._object = v4;
  sub_E5690(v14);
  v15._uint64_t countAndFlagsBits = 2777980912;
  v15._object = (void *)0xA400000000000000;
  sub_E5690(v15);
  v18._uint64_t countAndFlagsBits = 2777980912;
  v13._uint64_t countAndFlagsBits = 0xE000000000000000;
  v16._uint64_t countAndFlagsBits = v3;
  v16._object = v4;
  v17.value._uint64_t countAndFlagsBits = 0;
  v17.value._object = 0;
  v8.super.isa = v7;
  v18._object = (void *)0xA400000000000000;
  sub_E3FE0(v16, v17, v8, v18, v13);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_E3F8();
  uint64_t result = sub_E4F60();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v10;
  *(unsigned char *)(a2 + 16) = v11 & 1;
  *(void *)(a2 + 24) = v12;
  return result;
}

uint64_t sub_DAFD4(uint64_t a1, unsigned __int8 *a2)
{
  unsigned int v2 = *a2;
  type metadata accessor for MSRuleBaseView();
  swift_getWitnessTable();
  uint64_t v3 = sub_E4770();
  unint64_t v4 = 0x80000000000F7120;
  if (v2 == 4) {
    unint64_t v5 = 0xD00000000000001ELL;
  }
  else {
    unint64_t v5 = 0xD00000000000001DLL;
  }
  if (v2 != 4) {
    unint64_t v4 = 0x80000000000F7100;
  }
  if (v2 >= 4) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0xD000000000000029;
  }
  if (v2 >= 4) {
    uint64_t v7 = (void *)v4;
  }
  else {
    uint64_t v7 = (void *)0x80000000000F7140;
  }
  uint64_t v8 = v3;
  type metadata accessor for MAPreferencesViewProvider();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v10 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v18._uint64_t countAndFlagsBits = v6;
  v18._object = v7;
  sub_E5690(v18);
  v19._uint64_t countAndFlagsBits = 2777980912;
  v19._object = (void *)0xA400000000000000;
  sub_E5690(v19);
  v22._uint64_t countAndFlagsBits = 2777980912;
  v16._uint64_t countAndFlagsBits = 0xE000000000000000;
  v20._uint64_t countAndFlagsBits = v6;
  v20._object = v7;
  v21.value._uint64_t countAndFlagsBits = 0;
  v21.value._object = 0;
  v11.super.isa = v10;
  v22._object = (void *)0xA400000000000000;
  uint64_t v12 = sub_E3FE0(v20, v21, v11, v22, v16);
  uint64_t v14 = v13;
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(*(void *)v8 + 600))(v12, v14);

  return swift_release();
}

uint64_t sub_DB1C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v27 = a1;
  uint64_t v28 = a3;
  uint64_t v4 = type metadata accessor for MSRuleBaseView();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v22 - v6;
  swift_getWitnessTable();
  uint64_t v8 = *(void *)sub_E4770();
  (*(void (**)(void *__return_ptr))(v8 + 1048))(v29);
  swift_release();
  uint64_t v26 = *(void *)(sub_E4770() + OBJC_IVAR____TtC18icloudMailSettings19MSRuleBaseViewModel_folderList);
  swift_retain();
  swift_release();
  uint64_t v9 = *(void *)sub_E4770();
  uint64_t v10 = (*(uint64_t (**)(void))(v9 + 544))();
  uint64_t v24 = v11;
  uint64_t v25 = v10;
  swift_release();
  uint64_t v12 = *(void *)sub_E4770();
  uint64_t v13 = (*(uint64_t (**)(void))(v12 + 1000))();
  uint64_t v22 = v14;
  uint64_t v23 = v13;
  swift_release();
  uint64_t v15 = *(void *)sub_E4770();
  uint64_t v16 = (*(uint64_t (**)(void))(v15 + 1024))();
  uint64_t v18 = v17;
  swift_release();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v27, v4);
  unint64_t v19 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v20 + v19, v7, v4);
  return sub_97814((uint64_t)v29, v26, v25, v24, v23, v22, v16, v18, v28, (uint64_t)sub_DD26C, v20);
}

uint64_t sub_DB518(uint64_t a1, uint64_t a2)
{
  type metadata accessor for MSRuleBaseView();
  swift_getWitnessTable();
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))(*(void *)sub_E4770() + 552);
  swift_bridgeObjectRetain();
  v4(a1, a2);

  return swift_release();
}

uint64_t sub_DB604@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_E4BA0();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v2 = sub_6898(&qword_139D28);
  return sub_DB664((void *)(a1 + *(int *)(v2 + 44)));
}

uint64_t sub_DB664@<X0>(void *a1@<X8>)
{
  int v51 = a1;
  uint64_t v45 = sub_6898(&qword_131828) - 8;
  __chkstk_darwin(v45);
  uint64_t v44 = (uint64_t *)((char *)&v40 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v2 = sub_E4F10();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_6898(&qword_136708) - 8;
  __chkstk_darwin(v43);
  uint64_t v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_6898(&qword_136710) - 8;
  __chkstk_darwin(v48);
  uint64_t v46 = (uint64_t)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_6898(&qword_139D30) - 8;
  uint64_t v9 = __chkstk_darwin(v50);
  uint64_t v47 = (uint64_t)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v49 = (uint64_t)&v40 - v11;
  type metadata accessor for MSRuleBaseView();
  swift_getWitnessTable();
  uint64_t v12 = *(void *)sub_E4770();
  uint64_t v13 = (*(uint64_t (**)(void))(v12 + 1232))();
  uint64_t v15 = v14;
  swift_release();
  *(void *)&long long v52 = v13;
  *((void *)&v52 + 1) = v15;
  sub_E3F8();
  uint64_t v16 = sub_E4F60();
  uint64_t v40 = v17;
  uint64_t v41 = v18;
  char v20 = v19 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v22 = swift_getKeyPath();
  uint64_t v42 = v3;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for Text.TruncationMode.tail(_:), v2);
  uint64_t v23 = swift_getKeyPath();
  uint64_t v24 = v44;
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)v44 + *(int *)(v45 + 36), v5, v2);
  *uint64_t v24 = v23;
  uint64_t v25 = (uint64_t)v24;
  sub_105F0((uint64_t)v24, (uint64_t)&v7[*(int *)(v43 + 44)], &qword_131828);
  uint64_t v27 = v40;
  uint64_t v26 = v41;
  *(void *)uint64_t v7 = v16;
  *((void *)v7 + 1) = v27;
  v7[16] = v20;
  *((void *)v7 + 3) = v26;
  *((void *)v7 + 4) = KeyPath;
  *((void *)v7 + 5) = 0x3FE999999999999ALL;
  *((void *)v7 + 6) = v22;
  *((void *)v7 + 7) = 1;
  v7[64] = 0;
  sub_FA04(v16, v27, v20);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_102B4(v25, &qword_131828);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v5, v2);
  sub_EF0C(v16, v27, v20);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v28 = sub_E51B0();
  uint64_t v29 = swift_getKeyPath();
  uint64_t v30 = v46;
  sub_105F0((uint64_t)v7, v46, &qword_136708);
  uint64_t v31 = (uint64_t *)(v30 + *(int *)(v48 + 44));
  *uint64_t v31 = v29;
  v31[1] = v28;
  sub_102B4((uint64_t)v7, &qword_136708);
  sub_E5400();
  sub_E47D0();
  uint64_t v32 = v47;
  sub_105F0(v30, v47, &qword_136710);
  uint64_t v33 = (_OWORD *)(v32 + *(int *)(v50 + 44));
  long long v34 = v53;
  _OWORD *v33 = v52;
  v33[1] = v34;
  v33[2] = v54;
  sub_102B4(v30, &qword_136710);
  uint64_t v35 = v49;
  sub_10250(v32, v49, &qword_139D30);
  sub_105F0(v35, v32, &qword_139D30);
  uint64_t v36 = v51;
  *int v51 = 0;
  *((unsigned char *)v36 + 8) = 1;
  uint64_t v37 = v36;
  uint64_t v38 = sub_6898(&qword_139D38);
  sub_105F0(v32, (uint64_t)v37 + *(int *)(v38 + 48), &qword_139D30);
  sub_102B4(v35, &qword_139D30);
  return sub_102B4(v32, &qword_139D30);
}

uint64_t sub_DBBD0(uint64_t a1, void *a2)
{
  v6._uint64_t countAndFlagsBits = a1;
  v3._rawValue = &off_120960;
  v6._object = a2;
  unint64_t v4 = sub_E5AF0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 0xD) {
    return 13;
  }
  else {
    return v4;
  }
}

unint64_t sub_DBC1C(char a1)
{
  unint64_t result = 0x656D614E656C7552;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000015;
      break;
    case 2:
    case 5:
    case 6:
      unint64_t result = 0x6F697469646E6F43;
      break;
    case 3:
      unint64_t result = 0xD000000000000012;
      break;
    case 4:
      unint64_t result = 0xD000000000000012;
      break;
    case 7:
      unint64_t result = 0x614C6E6F69746341;
      break;
    case 8:
    case 10:
      unint64_t result = 0xD000000000000010;
      break;
    case 9:
      unint64_t result = 0x654D6E6F69746341;
      break;
    case 11:
      unint64_t result = 0xD000000000000016;
      break;
    case 12:
      unint64_t result = 0x6E776F6E4B6E55;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_DBDBC()
{
  swift_getWitnessTable();

  return sub_E5C30();
}

uint64_t sub_DBE30(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return RawRepresentable<>.hashValue.getter(a1, a2, WitnessTable, &protocol witness table for String);
}

uint64_t sub_DBE9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return RawRepresentable<>.hash(into:)(a1, a2, a3, WitnessTable, &protocol witness table for String);
}

uint64_t sub_DBF0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return RawRepresentable<>._rawHashValue(seed:)(a1, a2, a3, WitnessTable, &protocol witness table for String);
}

uint64_t sub_DBF7C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_DBBD0(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_DBFB4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_DBC1C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_DBFE4()
{
  return swift_getWitnessTable();
}

uint64_t sub_DC000()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_DC048()
{
  return sub_DC298(&qword_139B60, &qword_139B68, (void (*)(void))sub_DC084, (void (*)(void))sub_DC174);
}

unint64_t sub_DC084()
{
  unint64_t result = qword_139B70;
  if (!qword_139B70)
  {
    sub_62A4(&qword_139B78);
    sub_62A4(&qword_139B80);
    sub_105AC(&qword_139B88, &qword_139B80);
    sub_8F778();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139B70);
  }
  return result;
}

unint64_t sub_DC174()
{
  unint64_t result = qword_139B90;
  if (!qword_139B90)
  {
    sub_62A4(&qword_139B98);
    sub_DC1F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139B90);
  }
  return result;
}

unint64_t sub_DC1F0()
{
  unint64_t result = qword_139BA0;
  if (!qword_139BA0)
  {
    sub_62A4(&qword_139BA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139BA0);
  }
  return result;
}

uint64_t sub_DC25C()
{
  return sub_DC298(&qword_139BB0, &qword_139BB8, (void (*)(void))sub_DC320, (void (*)(void))sub_DC6A8);
}

uint64_t sub_DC298(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_62A4(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_DC320()
{
  unint64_t result = qword_139BC0;
  if (!qword_139BC0)
  {
    sub_62A4(&qword_139BC8);
    sub_62A4(&qword_139BD0);
    sub_105AC(&qword_139BD8, &qword_139BD0);
    sub_8F778();
    swift_getOpaqueTypeConformance2();
    sub_DCAD0(&qword_139BE0, &qword_139BE8, (void (*)(void))sub_DC434);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139BC0);
  }
  return result;
}

unint64_t sub_DC434()
{
  unint64_t result = qword_139BF0;
  if (!qword_139BF0)
  {
    sub_62A4(&qword_139BF8);
    sub_62A4(&qword_139C00);
    sub_62A4(&qword_139C08);
    sub_62A4(&qword_139C10);
    sub_DC554();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_DC654();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139BF0);
  }
  return result;
}

unint64_t sub_DC554()
{
  unint64_t result = qword_139C18;
  if (!qword_139C18)
  {
    sub_62A4(&qword_139C10);
    sub_62A4(&qword_1317D8);
    sub_105AC(&qword_131808, &qword_1317D8);
    swift_getOpaqueTypeConformance2();
    sub_105AC(&qword_131810, &qword_131818);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139C18);
  }
  return result;
}

unint64_t sub_DC654()
{
  unint64_t result = qword_139C20;
  if (!qword_139C20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139C20);
  }
  return result;
}

unint64_t sub_DC6A8()
{
  unint64_t result = qword_139C28;
  if (!qword_139C28)
  {
    sub_62A4(&qword_139C30);
    sub_DC724();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139C28);
  }
  return result;
}

unint64_t sub_DC724()
{
  unint64_t result = qword_139C38;
  if (!qword_139C38)
  {
    sub_62A4(&qword_139C40);
    sub_105AC(&qword_139C48, &qword_139C50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139C38);
  }
  return result;
}

uint64_t sub_DC7BC@<X0>(uint64_t a1@<X8>)
{
  return sub_D25F4(*(void *)(v1 + 24), *(void *)(v1 + 16), a1);
}

uint64_t sub_DC7C8()
{
  return sub_DC8F0((uint64_t (*)(uint64_t, uint64_t))sub_D42A4);
}

uint64_t sub_DC7E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  (*(void (**)(void *__return_ptr))(**(void **)a1 + 1072))(v4);
  return sub_10250((uint64_t)v4, a2, &qword_1312F8);
}

uint64_t sub_DC854()
{
  return 8;
}

void *sub_DC860(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_DC86C@<X0>(uint64_t a1@<X8>)
{
  return sub_D3328(*(void *)(v1 + 24), *(void *)(v1 + 16), a1);
}

uint64_t sub_DC874()
{
  return sub_D3658(*(void *)(v0 + 24), *(void *)(v0 + 16));
}

uint64_t sub_DC87C@<X0>(uint64_t a1@<X8>)
{
  return sub_D388C(*(void *)(v1 + 24), *(void *)(v1 + 16), a1);
}

uint64_t sub_DC888()
{
  return sub_DC8F0(sub_D3E94);
}

uint64_t sub_DC8A8()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_DC8BC()
{
  return sub_DC8F0((uint64_t (*)(uint64_t, uint64_t))sub_D40D0);
}

uint64_t sub_DC8D8()
{
  return sub_DC8F0((uint64_t (*)(uint64_t, uint64_t))sub_D37C0);
}

uint64_t sub_DC8F0(uint64_t (*a1)(uint64_t, uint64_t))
{
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(type metadata accessor for MSRuleBaseView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return a1(v4, v2);
}

uint64_t sub_DC978@<X0>(uint64_t a1@<X8>)
{
  return sub_D468C(*(void *)(v1 + 24), *(void *)(v1 + 16), a1);
}

uint64_t sub_DC980()
{
  return sub_D4E3C() & 1;
}

uint64_t sub_DC9A0@<X0>(uint64_t a1@<X8>)
{
  return sub_D55AC(*(void *)(v1 + 24), *(void *)(v1 + 16), a1);
}

uint64_t sub_DC9A8@<X0>(uint64_t *a1@<X8>)
{
  return sub_DA8E4(a1);
}

unint64_t sub_DC9B0()
{
  unint64_t result = qword_139C68;
  if (!qword_139C68)
  {
    sub_62A4(&qword_139C58);
    sub_62A4(&qword_1317F8);
    sub_62A4(&qword_1317F0);
    sub_62A4(&qword_1317E8);
    sub_F928();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_DC654();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139C68);
  }
  return result;
}

uint64_t sub_DCAD0(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_62A4(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_DCB48()
{
  unint64_t result = qword_139C78;
  if (!qword_139C78)
  {
    sub_62A4(&qword_139C60);
    sub_DC9B0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139C78);
  }
  return result;
}

uint64_t sub_DCBC8@<X0>(uint64_t a1@<X8>)
{
  return sub_D4EBC(*(void *)(v1 + 24), *(void *)(v1 + 16), a1);
}

uint64_t sub_DCBD0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 304))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_DCC24(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 312);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_DCC94()
{
  return 8;
}

uint64_t sub_DCCAC@<X0>(unsigned __int8 *a1@<X0>, void (*a2)(char *, uint64_t)@<X8>)
{
  uint64_t v5 = *(void (**)(void, uint64_t))(v2 + 16);
  uint64_t v6 = *(void *)(type metadata accessor for MSRuleBaseView() - 8);
  uint64_t v7 = (unsigned __int8 *)(v2
                         + ((*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80)));

  return sub_D5B18(a1, v7, v5, a2);
}

uint64_t sub_DCD38@<X0>(uint64_t a1@<X8>)
{
  return sub_DA564(*(void *)(v1 + 24), *(void *)(v1 + 16), a1);
}

uint64_t sub_DCD40@<X0>(uint64_t a1@<X8>)
{
  return sub_DA1E4(*(void *)(v1 + 24), *(void *)(v1 + 16), a1);
}

uint64_t sub_DCD48@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 448))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_DCD9C(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 456);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_DCE0C()
{
  return 8;
}

uint64_t sub_DCE18@<X0>(uint64_t a1@<X8>)
{
  return sub_D73BC(*(void *)(v1 + 24), *(void *)(v1 + 16), a1);
}

uint64_t sub_DCE28@<X0>(uint64_t a1@<X8>)
{
  return sub_DB604(a1);
}

unint64_t sub_DCE30()
{
  unint64_t result = qword_139CE0;
  if (!qword_139CE0)
  {
    type metadata accessor for MSFolderListSelectionView();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139CE0);
  }
  return result;
}

uint64_t sub_DCE88@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 496))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_DCEDC(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 504);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_DCF4C()
{
  return 8;
}

uint64_t sub_DCF58@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 352))();
  *a2 = result;
  return result;
}

uint64_t sub_DCFAC(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 360))(*a1);
}

uint64_t sub_DCFFC()
{
  return 8;
}

unint64_t sub_DD008()
{
  unint64_t result = qword_139CF0;
  if (!qword_139CF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139CF0);
  }
  return result;
}

uint64_t sub_DD064@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 400))();
  *a2 = result;
  return result;
}

uint64_t sub_DD0B8(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 408))(*a1);
}

uint64_t sub_DD108()
{
  return 8;
}

unint64_t sub_DD114()
{
  unint64_t result = qword_139D08;
  if (!qword_139D08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_139D08);
  }
  return result;
}

uint64_t sub_DD168(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_62A4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_DD1C8(uint64_t a1, unsigned __int8 *a2)
{
  return sub_DAFD4(a1, a2);
}

uint64_t sub_DD26C(uint64_t a1, uint64_t a2)
{
  type metadata accessor for MSRuleBaseView();

  return sub_DB518(a1, a2);
}

uint64_t sub_DD300()
{
  uint64_t v1 = *(void *)(type metadata accessor for MSRuleBaseView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  sub_6898(&qword_1314A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_E47F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_6E40();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_DD45C@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for MSRuleBaseView();
  return sub_D773C(*a1, v4, a2);
}

uint64_t sub_DD4DC()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_DD998()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MSRuleUpdateAPI();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MSRuleUpdateAPI()
{
  uint64_t result = qword_139D68;
  if (!qword_139D68) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_DDA1C()
{
  return type metadata accessor for MSRuleUpdateAPI();
}

uint64_t sub_DDA24()
{
  uint64_t v0 = ACAccountDataclassMail;
  id v1 = ACAccountDataclassMail;
  return v0;
}

id sub_DDA70()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MSUpdateCustomDomainAPIRequest();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MSUpdateCustomDomainAPIRequest()
{
  uint64_t result = qword_139F18;
  if (!qword_139F18) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_DDAF4()
{
  return type metadata accessor for MSUpdateCustomDomainAPIRequest();
}

uint64_t sub_DDAFC()
{
  return sub_10AE4();
}

uint64_t sub_DDB10()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_E4320();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_131238 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_67B4(v2, (uint64_t)qword_148D58);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_E4300();
  os_log_type_t v8 = sub_E5870();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&def_66DD4, v7, v8, "[Addresses] Edit primary address tapped", v9, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_retain();
  sub_E4530();
  uint64_t result = swift_release();
  uint64_t v11 = v37;
  if (v37)
  {
    uint64_t v30 = v44;
    uint64_t v34 = v43;
    uint64_t v33 = v42;
    uint64_t v32 = v41;
    uint64_t v31 = v40;
    uint64_t v12 = v36;
    v45[0] = v36;
    v45[1] = v37;
    void v45[2] = v38;
    void v45[3] = v39;
    v45[4] = v40;
    v45[5] = v41;
    v45[6] = v42;
    v45[7] = v43;
    v45[8] = v44;
    uint64_t v13 = *(void *)(v1 + OBJC_IVAR____TtCV18icloudMailSettings15MSAddressesView9ViewModel_defaultEmail + 8);
    uint64_t v28 = *(void *)(v1 + OBJC_IVAR____TtCV18icloudMailSettings15MSAddressesView9ViewModel_defaultEmail);
    sub_338A0(v1 + OBJC_IVAR____TtCV18icloudMailSettings15MSAddressesView9ViewModel_repository, (uint64_t)&v36);
    uint64_t v14 = sub_33904((uint64_t)&v36, v39);
    uint64_t v29 = &v27;
    __chkstk_darwin(v14);
    uint64_t v16 = (uint64_t *)((char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v17 + 16))(v16);
    uint64_t v18 = *v16;
    uint64_t v19 = type metadata accessor for MSRepositoryDefault();
    v35[3] = v19;
    v35[4] = &off_124FE8;
    v35[0] = v18;
    type metadata accessor for MSPrimaryAddressViewModel();
    uint64_t v20 = swift_allocObject();
    uint64_t v21 = sub_33904((uint64_t)v35, v19);
    __chkstk_darwin(v21);
    uint64_t v23 = (uint64_t *)((char *)&v27 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v24 + 16))(v23);
    uint64_t v25 = *v23;
    swift_bridgeObjectRetain();
    id v26 = sub_DFC5C((uint64_t)v45, v28, v13, v25, v20);
    sub_5A6D0(v12, v11);
    sub_6A34((uint64_t)v35);
    sub_6A34((uint64_t)&v36);
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v36 = (uint64_t)v26;
    swift_retain();
    return sub_E45C0();
  }
  return result;
}

uint64_t sub_DDFAC()
{
  return sub_1A42C();
}

uint64_t sub_DDFC0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_E4320();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_131238 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_67B4(v4, (uint64_t)qword_148D58);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  uint64_t v9 = sub_E4300();
  os_log_type_t v10 = sub_E5870();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&def_66DD4, v9, v10, "[Addresses] Edit custom email domain tapped", v11, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v12 = *(void *)(v2 + OBJC_IVAR____TtCV18icloudMailSettings15MSAddressesView9ViewModel_defaultEmail);
  uint64_t v13 = *(void *)(v2 + OBJC_IVAR____TtCV18icloudMailSettings15MSAddressesView9ViewModel_defaultEmail + 8);
  sub_338A0(v2 + OBJC_IVAR____TtCV18icloudMailSettings15MSAddressesView9ViewModel_repository, (uint64_t)v29);
  uint64_t v14 = sub_33904((uint64_t)v29, v29[3]);
  __chkstk_darwin(v14);
  uint64_t v16 = (void *)((char *)v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v17 + 16))(v16);
  uint64_t v18 = *v16;
  uint64_t v19 = type metadata accessor for MSRepositoryDefault();
  v28[3] = v19;
  v28[4] = &off_124FE8;
  v28[0] = v18;
  type metadata accessor for MSCustomEmailDetailViewModel();
  uint64_t v20 = swift_allocObject();
  uint64_t v21 = sub_33904((uint64_t)v28, v19);
  __chkstk_darwin(v21);
  uint64_t v23 = (void *)((char *)v28 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v24 + 16))(v23);
  uint64_t v25 = *v23;
  sub_150C4(a1);
  swift_bridgeObjectRetain();
  id v26 = sub_DFDCC(a1, v12, v13, v25, v20);
  sub_1511C(a1);
  sub_6A34((uint64_t)v28);
  sub_6A34((uint64_t)v29);
  swift_getKeyPath();
  swift_getKeyPath();
  v29[0] = v26;
  swift_retain();
  return sub_E45C0();
}

uint64_t sub_DE388()
{
  return sub_1A42C();
}

uint64_t sub_DE39C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_E4320();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_131238 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_67B4(v4, (uint64_t)qword_148D58);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  uint64_t v9 = sub_E4300();
  os_log_type_t v10 = sub_E5870();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&def_66DD4, v9, v10, "[Addresses] Edit alias tapped", v11, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v12 = *(void *)(v2 + OBJC_IVAR____TtCV18icloudMailSettings15MSAddressesView9ViewModel_defaultEmail);
  uint64_t v13 = *(void *)(v2 + OBJC_IVAR____TtCV18icloudMailSettings15MSAddressesView9ViewModel_defaultEmail + 8);
  sub_338A0(v2 + OBJC_IVAR____TtCV18icloudMailSettings15MSAddressesView9ViewModel_repository, (uint64_t)v29);
  uint64_t v14 = sub_33904((uint64_t)v29, v29[3]);
  __chkstk_darwin(v14);
  uint64_t v16 = (void *)((char *)v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v17 + 16))(v16);
  uint64_t v18 = *v16;
  uint64_t v19 = type metadata accessor for MSRepositoryDefault();
  v28[3] = v19;
  v28[4] = &off_124FE8;
  v28[0] = v18;
  type metadata accessor for MSAliasDetailViewModel();
  uint64_t v20 = swift_allocObject();
  uint64_t v21 = sub_33904((uint64_t)v28, v19);
  __chkstk_darwin(v21);
  uint64_t v23 = (void *)((char *)v28 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v24 + 16))(v23);
  uint64_t v25 = *v23;
  sub_5CF84(a1);
  swift_bridgeObjectRetain();
  id v26 = sub_DFFF8(a1, v12, v13, v25, v20);
  sub_5CFD8(a1);
  sub_6A34((uint64_t)v28);
  sub_6A34((uint64_t)v29);
  swift_getKeyPath();
  swift_getKeyPath();
  v29[0] = v26;
  swift_retain();
  return sub_E45C0();
}

uint64_t sub_DE764()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_E45B0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_DE7D8@<X0>(void *a1@<X8>)
{
  return sub_21308(a1);
}

uint64_t sub_DE7EC()
{
  return sub_21398();
}

uint64_t sub_DE800()
{
  return sub_10AE4();
}

uint64_t sub_DE814@<X0>(void *a1@<X8>)
{
  return sub_AB2C(a1);
}

uint64_t sub_DE828()
{
  return sub_ABBC();
}

uint64_t sub_DE83C@<X0>(void *a1@<X8>)
{
  return sub_21308(a1);
}

uint64_t sub_DE850()
{
  return sub_21398();
}

uint64_t sub_DE864()
{
  uint64_t v1 = v0;
  type metadata accessor for MAPreferencesViewProvider();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v3 = self;
  uint64_t v4 = (objc_class *)[v3 bundleForClass:ObjCClassFromMetadata];
  v38._uint64_t countAndFlagsBits = 0x5F53455341494C41;
  v38._object = (void *)0xEE005245544F4F46;
  sub_E5690(v38);
  v39._uint64_t countAndFlagsBits = 2777980912;
  v39._object = (void *)0xA400000000000000;
  sub_E5690(v39);
  v60._uint64_t countAndFlagsBits = 2777980912;
  v32._uint64_t countAndFlagsBits = 0xE000000000000000;
  v40._uint64_t countAndFlagsBits = 0x5F53455341494C41;
  v40._object = (void *)0xEE005245544F4F46;
  v55.value._uint64_t countAndFlagsBits = 0;
  v55.value._object = 0;
  v5.super.isa = v4;
  v60._object = (void *)0xA400000000000000;
  uint64_t v6 = sub_E3FE0(v40, v55, v5, v60, v32);

  swift_bridgeObjectRelease();
  uint64_t v37 = v6;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_E45B0();
  swift_release();
  swift_release();
  uint64_t v7 = *(void *)(v36 + 16);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(v1 + OBJC_IVAR____TtCV18icloudMailSettings15MSAddressesView9ViewModel_maxAliasCountAllowed);
  v33._object = v3;
  uint64_t v9 = (objc_class *)[v3 bundleForClass:ObjCClassFromMetadata];
  if (v8 >= v7)
  {
    v57.value._uint64_t countAndFlagsBits = 0xD000000000000011;
    v33._uint64_t countAndFlagsBits = 0x80000000000F7660;
    v44._object = (void *)0x80000000000F7620;
    v57.value._object = (void *)0x80000000000F7640;
    v44._uint64_t countAndFlagsBits = 0xD000000000000015;
    v14.super.isa = v9;
    v62._uint64_t countAndFlagsBits = 0;
    v62._object = (void *)0xE000000000000000;
    sub_E3FE0(v44, v57, v14, v62, v33);

    sub_6898(&qword_131740);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_E8C10;
    *(void *)(v15 + 56) = &type metadata for Int;
    *(void *)(v15 + 64) = &protocol witness table for Int;
    *(void *)(v15 + 32) = v8;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_E45B0();
    swift_release();
    swift_release();
    uint64_t v16 = *(void *)(v36 + 16);
    swift_bridgeObjectRelease();
    *(void *)(v15 + 96) = &type metadata for Int;
    *(void *)(v15 + 104) = &protocol witness table for Int;
    *(void *)(v15 + 72) = v16;
    uint64_t v11 = sub_E5590();
    uint64_t v13 = v17;
    swift_bridgeObjectRelease();
  }
  else
  {
    v41._uint64_t countAndFlagsBits = 0xD000000000000018;
    v41._object = (void *)0x80000000000F7700;
    sub_E5690(v41);
    v42._uint64_t countAndFlagsBits = 2777980912;
    v42._object = (void *)0xA400000000000000;
    sub_E5690(v42);
    v61._uint64_t countAndFlagsBits = 2777980912;
    v33._uint64_t countAndFlagsBits = 0xE000000000000000;
    v43._uint64_t countAndFlagsBits = 0xD000000000000018;
    v43._object = (void *)0x80000000000F7700;
    v56.value._uint64_t countAndFlagsBits = 0;
    v56.value._object = 0;
    v10.super.isa = v9;
    v61._object = (void *)0xA400000000000000;
    uint64_t v11 = sub_E3FE0(v43, v56, v10, v61, v33);
    uint64_t v13 = v12;
  }
  swift_bridgeObjectRelease();
  v45._uint64_t countAndFlagsBits = v11;
  v45._object = v13;
  sub_E5690(v45);
  swift_bridgeObjectRelease();
  v46._uint64_t countAndFlagsBits = 32;
  v46._object = (void *)0xE100000000000000;
  sub_E5690(v46);
  swift_bridgeObjectRelease();
  sub_6898(&qword_131740);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_E8C10;
  object = v34._object;
  uint64_t v20 = (objc_class *)[v34._object bundleForClass:ObjCClassFromMetadata];
  v47._uint64_t countAndFlagsBits = 0x4F4D5F4E5241454CLL;
  v47._object = (void *)0xEA00000000004552;
  sub_E5690(v47);
  v48._uint64_t countAndFlagsBits = 2777980912;
  v48._object = (void *)0xA400000000000000;
  sub_E5690(v48);
  v63._uint64_t countAndFlagsBits = 2777980912;
  v34._uint64_t countAndFlagsBits = 0xE000000000000000;
  v49._uint64_t countAndFlagsBits = 0x4F4D5F4E5241454CLL;
  v49._object = (void *)0xEA00000000004552;
  v58.value._uint64_t countAndFlagsBits = 0;
  v58.value._object = 0;
  v21.super.isa = v20;
  v63._object = (void *)0xA400000000000000;
  uint64_t v22 = sub_E3FE0(v49, v58, v21, v63, v34);
  uint64_t v24 = v23;

  swift_bridgeObjectRelease();
  *(void *)(v18 + 56) = &type metadata for String;
  unint64_t v25 = sub_F458();
  *(void *)(v18 + 64) = v25;
  *(void *)(v18 + 32) = v22;
  *(void *)(v18 + 40) = v24;
  id v26 = (objc_class *)[object bundleForClass:ObjCClassFromMetadata];
  v50._uint64_t countAndFlagsBits = 0xD000000000000015;
  v50._object = (void *)0x80000000000F76E0;
  sub_E5690(v50);
  v51._uint64_t countAndFlagsBits = 2777980912;
  v51._object = (void *)0xA400000000000000;
  sub_E5690(v51);
  v64._uint64_t countAndFlagsBits = 2777980912;
  v35._uint64_t countAndFlagsBits = 0xE000000000000000;
  v52._uint64_t countAndFlagsBits = 0xD000000000000015;
  v52._object = (void *)0x80000000000F76E0;
  v59.value._uint64_t countAndFlagsBits = 0;
  v59.value._object = 0;
  v27.super.isa = v26;
  v64._object = (void *)0xA400000000000000;
  uint64_t v28 = sub_E3FE0(v52, v59, v27, v64, v35);
  uint64_t v30 = v29;

  swift_bridgeObjectRelease();
  *(void *)(v18 + 96) = &type metadata for String;
  *(void *)(v18 + 104) = v25;
  *(void *)(v18 + 72) = v28;
  *(void *)(v18 + 80) = v30;
  v53._uint64_t countAndFlagsBits = sub_E55D0();
  sub_E5690(v53);
  swift_bridgeObjectRelease();
  v54._uint64_t countAndFlagsBits = 32;
  v54._object = (void *)0xE100000000000000;
  sub_E5690(v54);
  swift_bridgeObjectRelease();
  return v37;
}

uint64_t sub_DEDFC()
{
  uint64_t v1 = sub_6898(&qword_13A210);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6[1] = *(void *)(v0 + OBJC_IVAR____TtCV18icloudMailSettings15MSAddressesView9ViewModel_account);
  swift_retain();
  sub_6898(&qword_134D70);
  sub_105AC(&qword_13A218, &qword_134D70);
  sub_E45F0();
  swift_release();
  swift_allocObject();
  swift_weakInit();
  sub_105AC(&qword_13A220, &qword_13A210);
  sub_E4650();
  swift_release();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  swift_beginAccess();
  sub_E44F0();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_DF014@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[3];
  uint64_t v6 = a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = a1[6];
  uint64_t v9 = a1[7];
  uint64_t v10 = a1[8];
  *a2 = *a1;
  a2[1] = v2;
  a2[2] = v4;
  a2[3] = v5;
  a2[4] = v6;
  a2[5] = v7;
  a2[6] = v8;
  a2[7] = v9;
  a2[8] = v10;
  return sub_ADAF8(v3, v2);
}

uint64_t sub_DF064(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 48);
  v11[2] = *(_OWORD *)(a1 + 32);
  long long v12 = v1;
  uint64_t v13 = *(void *)(a1 + 64);
  long long v2 = *(_OWORD *)(a1 + 16);
  v11[0] = *(_OWORD *)a1;
  v11[1] = v2;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v14 = *((void *)&v12 + 1);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_89A6C((uint64_t)&v14);
    swift_retain();
    sub_E45C0();
    sub_691A0((uint64_t)v11);
    uint64_t v5 = swift_bridgeObjectRetain();
    uint64_t v6 = sub_AD384(v5, (uint64_t)v11);
    sub_8CC24((uint64_t)v11);
    swift_bridgeObjectRelease();
    if (v6[2]) {
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_E45C0();
    sub_C6F68();
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_E45C0();
    uint64_t v7 = v14;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    swift_bridgeObjectRetain();
    sub_E45C0();
    *(unsigned char *)(v4 + OBJC_IVAR____TtCV18icloudMailSettings15MSAddressesView9ViewModel_isAddAliasDisabled) = *(void *)(v7 + 16) >= *(void *)(v4 + OBJC_IVAR____TtCV18icloudMailSettings15MSAddressesView9ViewModel_maxAliasCountAllowed);
    uint64_t v8 = sub_DE864();
    uint64_t v9 = (uint64_t *)(v4 + OBJC_IVAR____TtCV18icloudMailSettings15MSAddressesView9ViewModel_footer);
    *uint64_t v9 = v8;
    v9[1] = v10;
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_DF2D0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCV18icloudMailSettings15MSAddressesView9ViewModel__selectedAddressToEdit;
  uint64_t v2 = sub_6898(&qword_138B68);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtCV18icloudMailSettings15MSAddressesView9ViewModel__aliases;
  uint64_t v4 = sub_6898(&qword_13A228);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtCV18icloudMailSettings15MSAddressesView9ViewModel__primaryEmail;
  uint64_t v6 = sub_6898(&qword_131D08);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  v7(v0 + OBJC_IVAR____TtCV18icloudMailSettings15MSAddressesView9ViewModel__primaryEmailForDisplay, v6);
  uint64_t v8 = v0 + OBJC_IVAR____TtCV18icloudMailSettings15MSAddressesView9ViewModel__customEmails;
  uint64_t v9 = sub_6898(&qword_13A230);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  sub_6A34(v0 + OBJC_IVAR____TtCV18icloudMailSettings15MSAddressesView9ViewModel_repository);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_DF498()
{
  sub_DF2D0();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_DF4F0()
{
  return _s9ViewModelCMa_8();
}

uint64_t _s9ViewModelCMa_8()
{
  uint64_t result = qword_13A118;
  if (!qword_13A118) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_DF544()
{
  sub_62EC(319, &qword_13A128, &qword_138B70);
  if (v0 <= 0x3F)
  {
    sub_62EC(319, &qword_13A130, &qword_138B78);
    if (v1 <= 0x3F)
    {
      sub_DF6FC();
      if (v2 <= 0x3F)
      {
        sub_62EC(319, (unint64_t *)&unk_13A138, &qword_138B80);
        if (v3 <= 0x3F) {
          swift_updateClassMetadata2();
        }
      }
    }
  }
}

void sub_DF6FC()
{
  if (!qword_1319E8)
  {
    unint64_t v0 = sub_E45D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1319E8);
    }
  }
}

uint64_t sub_DF754()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_DF78C(uint64_t a1)
{
  return sub_DF064(a1);
}

uint64_t sub_DF794@<X0>(void *a1@<X8>)
{
  return sub_21308(a1);
}

uint64_t sub_DF7BC()
{
  return sub_21398();
}

void *sub_DF7E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    sub_1229C(0, v4, 0);
    uint64_t v8 = (unsigned char *)(a1 + 48);
    uint64_t v9 = *(void *)(a2 + 32);
    uint64_t v10 = *(void *)(a2 + 40);
    uint64_t v18 = v9;
    uint64_t v19 = a4;
    do
    {
      uint64_t v11 = *((void *)v8 - 2);
      long long v12 = (void *)*((void *)v8 - 1);
      char v21 = *v8;
      uint64_t v22 = v9;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v23._uint64_t countAndFlagsBits = 64;
      v23._object = (void *)0xE100000000000000;
      sub_E5690(v23);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v24._uint64_t countAndFlagsBits = v11;
      v24._object = v12;
      sub_E5690(v24);
      swift_bridgeObjectRelease();
      if (v22 == a3 && v10 == a4) {
        char v13 = 1;
      }
      else {
        char v13 = sub_E5C20();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v15 = _swiftEmptyArrayStorage[2];
      unint64_t v14 = _swiftEmptyArrayStorage[3];
      if (v15 >= v14 >> 1) {
        sub_1229C(v14 > 1, v15 + 1, 1);
      }
      v8 += 24;
      _swiftEmptyArrayStorage[2] = v15 + 1;
      uint64_t v16 = &_swiftEmptyArrayStorage[5 * v15];
      uint64_t v9 = v18;
      a4 = v19;
      v16[4] = v18;
      v16[5] = v10;
      _OWORD v16[6] = v11;
      v16[7] = v12;
      *((unsigned char *)v16 + 64) = v21;
      *((unsigned char *)v16 + 65) = v13 & 1;
      --v4;
    }
    while (v4);
  }
  return _swiftEmptyArrayStorage;
}

void *sub_DF9A4(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  int64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    sub_1229C(0, v4, 0);
    uint64_t v8 = (unsigned char *)(a1 + 48);
    uint64_t v9 = *a2;
    uint64_t v10 = a2[1];
    uint64_t v18 = *a2;
    uint64_t v19 = a4;
    do
    {
      uint64_t v11 = *((void *)v8 - 2);
      long long v12 = (void *)*((void *)v8 - 1);
      char v21 = *v8;
      uint64_t v22 = v9;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v23._uint64_t countAndFlagsBits = 64;
      v23._object = (void *)0xE100000000000000;
      sub_E5690(v23);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v24._uint64_t countAndFlagsBits = v11;
      v24._object = v12;
      sub_E5690(v24);
      swift_bridgeObjectRelease();
      if (v22 == a3 && v10 == a4) {
        char v13 = 1;
      }
      else {
        char v13 = sub_E5C20();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v15 = _swiftEmptyArrayStorage[2];
      unint64_t v14 = _swiftEmptyArrayStorage[3];
      if (v15 >= v14 >> 1) {
        sub_1229C(v14 > 1, v15 + 1, 1);
      }
      v8 += 24;
      _swiftEmptyArrayStorage[2] = v15 + 1;
      uint64_t v16 = &_swiftEmptyArrayStorage[5 * v15];
      uint64_t v9 = v18;
      a4 = v19;
      v16[4] = v18;
      v16[5] = v10;
      _OWORD v16[6] = v11;
      v16[7] = v12;
      *((unsigned char *)v16 + 64) = v21;
      *((unsigned char *)v16 + 65) = v13 & 1;
      --v4;
    }
    while (v4);
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_DFB64@<X0>(void *a1@<X8>)
{
  return sub_AB2C(a1);
}

uint64_t sub_DFB8C()
{
  return sub_ABBC();
}

uint64_t sub_DFBB4@<X0>(void *a1@<X8>)
{
  return sub_AB2C(a1);
}

uint64_t sub_DFBDC()
{
  return sub_ABBC();
}

uint64_t sub_DFC04@<X0>(void *a1@<X8>)
{
  return sub_21308(a1);
}

uint64_t sub_DFC2C()
{
  return sub_21398();
}

id sub_DFC5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v25 = type metadata accessor for MSRepositoryDefault();
  id v26 = &off_124FE8;
  v24[0] = a4;
  uint64_t v10 = a5 + OBJC_IVAR____TtC18icloudMailSettings25MSPrimaryAddressViewModel_account;
  *(void *)(v10 + 64) = *(void *)(a1 + 64);
  long long v11 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v10 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v10 + 48) = v11;
  long long v12 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)uint64_t v10 = *(_OWORD *)a1;
  *(_OWORD *)(v10 + 16) = v12;
  sub_338A0((uint64_t)v24, a5 + OBJC_IVAR____TtC18icloudMailSettings25MSPrimaryAddressViewModel_repository);
  uint64_t v13 = *(void *)(a1 + 48);
  swift_bridgeObjectRetain();
  sub_691A0(a1);
  unint64_t v14 = sub_DF7E4(v13, a1, a2, a3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void **)(a1 + 16);
  unint64_t v15 = *(void *)(a1 + 24);
  uint64_t v17 = *(void **)(*sub_67EC(v24, v25) + 24);
  swift_bridgeObjectRetain();
  id result = objc_msgSend(v17, "aa_fullName");
  if (result)
  {
    uint64_t v19 = result;
    uint64_t v20 = sub_E55B0();
    uint64_t v22 = v21;

    uint64_t v23 = sub_10CE4(0, 0, v14, v16, v15, 1, 0, 0, v20, v22);
    sub_6A34((uint64_t)v24);
    return (id)v23;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_DFDCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v31 = type metadata accessor for MSRepositoryDefault();
  Swift::String v32 = &off_124FE8;
  v30[0] = a4;
  uint64_t v10 = a5 + OBJC_IVAR____TtC18icloudMailSettings28MSCustomEmailDetailViewModel_customDomain;
  *(void *)(v10 + 64) = *(void *)(a1 + 64);
  long long v11 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v10 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v10 + 48) = v11;
  long long v12 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)uint64_t v10 = *(_OWORD *)a1;
  *(_OWORD *)(v10 + 16) = v12;
  sub_338A0((uint64_t)v30, a5 + OBJC_IVAR____TtC18icloudMailSettings28MSCustomEmailDetailViewModel_repository);
  uint64_t v13 = *(void *)(a1 + 16);
  unint64_t v14 = *(void **)(a1 + 24);
  sub_6898(&qword_131D20);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_E7940;
  uint64_t v16 = *(void *)a1;
  uint64_t v17 = *(void *)(a1 + 8);
  uint64_t v29 = *(void *)a1;
  swift_bridgeObjectRetain();
  v33._uint64_t countAndFlagsBits = 64;
  v33._object = (void *)0xE100000000000000;
  sub_E5690(v33);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_150C4(a1);
  swift_bridgeObjectRetain();
  v34._uint64_t countAndFlagsBits = v13;
  v34._object = v14;
  sub_E5690(v34);
  swift_bridgeObjectRelease();
  if (v29 == a2 && v17 == a3) {
    char v18 = 1;
  }
  else {
    char v18 = sub_E5C20();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v19 = *(unsigned char *)(a1 + 32);
  *(void *)(v15 + 32) = v16;
  *(void *)(v15 + 40) = v17;
  *(void *)(v15 + 48) = v13;
  *(void *)(v15 + 56) = v14;
  *(unsigned char *)(v15 + 64) = v19;
  *(unsigned char *)(v15 + 65) = v18 & 1;
  uint64_t v20 = *(void **)(a1 + 40);
  unint64_t v21 = *(void *)(a1 + 48);
  uint64_t v22 = *(void **)(*sub_67EC(v30, v31) + 24);
  swift_bridgeObjectRetain();
  id result = objc_msgSend(v22, "aa_fullName");
  if (result)
  {
    Swift::String v24 = result;
    uint64_t v25 = sub_E55B0();
    uint64_t v27 = v26;

    uint64_t v28 = sub_10CE4(v13, (uint64_t)v14, (void *)v15, v20, v21, 1, 0, 0, v25, v27);
    sub_6A34((uint64_t)v30);
    return (id)v28;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_DFFF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v28 = type metadata accessor for MSRepositoryDefault();
  uint64_t v29 = &off_124FE8;
  v27[0] = a4;
  uint64_t v10 = (_OWORD *)(a5 + OBJC_IVAR____TtC18icloudMailSettings22MSAliasDetailViewModel_alias);
  *(_OWORD *)((char *)v10 + 41) = *(_OWORD *)(a1 + 41);
  long long v11 = *(_OWORD *)(a1 + 32);
  long long v12 = *(_OWORD *)a1;
  v10[1] = *(_OWORD *)(a1 + 16);
  v10[2] = v11;
  *uint64_t v10 = v12;
  sub_338A0((uint64_t)v27, a5 + OBJC_IVAR____TtC18icloudMailSettings22MSAliasDetailViewModel_repository);
  uint64_t v13 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  sub_5CF84(a1);
  unint64_t v14 = sub_DF9A4(v13, (uint64_t *)a1, a2, a3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void **)(a1 + 24);
  unint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void **)(a1 + 40);
  unint64_t v18 = *(void *)(a1 + 48);
  char v19 = *(void **)(*sub_67EC(v27, v28) + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id result = objc_msgSend(v19, "aa_fullName");
  if (result)
  {
    unint64_t v21 = result;
    int v22 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v23 = sub_E55B0();
    uint64_t v25 = v24;

    uint64_t v26 = sub_10CE4(0, 1, v14, v15, v16, v22, v17, v18, v23, v25);
    sub_6A34((uint64_t)v27);
    return (id)v26;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_E0184(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_338A0(a4, (uint64_t)v26);
  uint64_t v11 = sub_33904((uint64_t)v26, v27);
  __chkstk_darwin(v11);
  uint64_t v13 = (void *)((char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v14 + 16))(v13);
  uint64_t v15 = *v13;
  uint64_t v16 = type metadata accessor for MSRepositoryDefault();
  v25[3] = v16;
  v25[4] = &off_124FE8;
  v25[0] = v15;
  type metadata accessor for DefaultEmailSelectionView.ViewModel();
  uint64_t v17 = (void *)swift_allocObject();
  uint64_t v18 = sub_33904((uint64_t)v25, v16);
  __chkstk_darwin(v18);
  uint64_t v20 = (void *)((char *)v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v21 + 16))(v20);
  uint64_t v22 = *v20;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v23 = sub_E2E70(a1, a2, a3, v22, a5, a6, v17);
  sub_6A34((uint64_t)v25);
  sub_6A34((uint64_t)v26);
  return v23;
}

uint64_t sub_E0398@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v56 = a4;
  uint64_t v7 = sub_E4B80();
  uint64_t v54 = *(void *)(v7 - 8);
  uint64_t v55 = v7;
  __chkstk_darwin(v7);
  Swift::String v53 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_6898(&qword_13A3F0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v48 = v9;
  uint64_t v49 = v10;
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_6898(&qword_13A3F8);
  uint64_t v13 = *(void *)(v47 - 8);
  __chkstk_darwin(v47);
  uint64_t v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_6898(&qword_13A400);
  __chkstk_darwin(v46);
  uint64_t v17 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_6898(&qword_13A408);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v51 = v18;
  uint64_t v52 = v19;
  __chkstk_darwin(v18);
  Swift::String v50 = (char *)&v45 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = a1;
  uint64_t v58 = a2;
  char v59 = a3 & 1;
  sub_6898(&qword_13A410);
  uint64_t v21 = sub_62A4(&qword_138E78);
  uint64_t v22 = sub_62A4(&qword_131570);
  unint64_t v23 = sub_B5CE0();
  unint64_t v24 = sub_E44C();
  uint64_t v25 = sub_105AC((unint64_t *)&qword_1315D0, &qword_131570);
  v60._uint64_t countAndFlagsBits = v21;
  v60._object = &type metadata for MSError;
  unint64_t v61 = v22;
  unint64_t v62 = v23;
  unint64_t v63 = v24;
  uint64_t v64 = v25;
  swift_getOpaqueTypeConformance2();
  sub_E4EA0();
  sub_105AC(&qword_13A418, &qword_13A3F0);
  uint64_t v26 = v48;
  sub_E4FA0();
  (*(void (**)(char *, uint64_t))(v49 + 8))(v12, v26);
  uint64_t v27 = v47;
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v17, v15, v47);
  uint64_t v28 = v46;
  uint64_t v29 = (uint64_t (**)())&v17[*(int *)(v46 + 36)];
  *uint64_t v29 = sub_E1A50;
  v29[1] = 0;
  void v29[2] = 0;
  v29[3] = 0;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v27);
  type metadata accessor for MAPreferencesViewProvider();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v31 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v60._uint64_t countAndFlagsBits = 2777980912;
  v60._object = (void *)0xA400000000000000;
  v65._uint64_t countAndFlagsBits = 0x5F544C5541464544;
  v65._object = (void *)0xED00004C49414D45;
  sub_E5690(v65);
  v66._uint64_t countAndFlagsBits = 2777980912;
  v66._object = (void *)0xA400000000000000;
  sub_E5690(v66);
  v44._uint64_t countAndFlagsBits = 0xE000000000000000;
  v67._uint64_t countAndFlagsBits = 0x5F544C5541464544;
  v67._object = (void *)0xED00004C49414D45;
  v68.value._uint64_t countAndFlagsBits = 0;
  v68.value._object = 0;
  v32.super.isa = v31;
  uint64_t v33 = sub_E3FE0(v67, v68, v32, v60, v44);
  Swift::String v35 = v34;

  swift_bridgeObjectRelease();
  v60._uint64_t countAndFlagsBits = v33;
  v60._object = v35;
  unint64_t v36 = sub_E3378();
  unint64_t v37 = sub_E3F8();
  Swift::String v38 = v50;
  sub_E5050();
  swift_bridgeObjectRelease();
  sub_102B4((uint64_t)v17, &qword_13A400);
  Swift::String v39 = v53;
  uint64_t v40 = v54;
  uint64_t v41 = v55;
  (*(void (**)(char *, void, uint64_t))(v54 + 104))(v53, enum case for NavigationBarItem.TitleDisplayMode.inline(_:), v55);
  v60._uint64_t countAndFlagsBits = v28;
  v60._object = &type metadata for String;
  unint64_t v61 = v36;
  unint64_t v62 = v37;
  swift_getOpaqueTypeConformance2();
  uint64_t v42 = v51;
  sub_E50D0();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v39, v41);
  return (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v38, v42);
}

uint64_t sub_E0998@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  v22[1] = a4;
  char v6 = a3 & 1;
  uint64_t v7 = sub_6898(&qword_138E78);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MAPreferencesViewProvider();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v12 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v27._uint64_t countAndFlagsBits = 2777980912;
  v27._object = (void *)0xA400000000000000;
  v32._uint64_t countAndFlagsBits = 0xD00000000000001BLL;
  v32._object = (void *)0x80000000000F77A0;
  sub_E5690(v32);
  v33._uint64_t countAndFlagsBits = 2777980912;
  v33._object = (void *)0xA400000000000000;
  sub_E5690(v33);
  v21._uint64_t countAndFlagsBits = 0xE000000000000000;
  v34._uint64_t countAndFlagsBits = 0xD00000000000001BLL;
  v34._object = (void *)0x80000000000F77A0;
  v35.value._uint64_t countAndFlagsBits = 0;
  v35.value._object = 0;
  v13.super.isa = v12;
  uint64_t v14 = sub_E3FE0(v34, v35, v13, v27, v21);
  uint64_t v16 = v15;

  swift_bridgeObjectRelease();
  v27._uint64_t countAndFlagsBits = v14;
  v27._object = v16;
  sub_E3F8();
  v27._uint64_t countAndFlagsBits = sub_E4F60();
  v27._object = v17;
  LOBYTE(v28) = v18 & 1;
  *((void *)&v28 + 1) = v19;
  v22[4] = a1;
  v22[5] = a2;
  char v23 = v6;
  sub_6898(&qword_138E90);
  sub_B5D68();
  sub_E53B0();
  type metadata accessor for DefaultEmailSelectionView.ViewModel();
  sub_E3460();
  sub_E4780();
  swift_getKeyPath();
  sub_E48D0();
  swift_release();
  swift_release();
  Swift::String v27 = v24;
  long long v28 = v25;
  v29[0] = v26[0];
  *(_OWORD *)((char *)v29 + 9) = *(_OWORD *)((char *)v26 + 9);
  sub_B024C((uint64_t)&v27, 19279, 0xE200000000000000);
  uint64_t countAndFlagsBits = v27._countAndFlagsBits;
  sub_E5F4((uint64_t)&countAndFlagsBits);
  swift_release();
  sub_10250((uint64_t)&v28, (uint64_t)v31, &qword_1312F8);
  sub_E620((uint64_t)v31);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_E0CB4(uint64_t a1, uint64_t a2, char a3)
{
  type metadata accessor for DefaultEmailSelectionView.ViewModel();
  sub_E3460();
  sub_E4770();
  swift_bridgeObjectRetain();
  swift_release();
  swift_getKeyPath();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  *(unsigned char *)(v6 + 32) = a3 & 1;
  sub_6D60();
  sub_6898(&qword_131848);
  sub_6898(&qword_138EA0);
  sub_105AC(&qword_13A430, &qword_131848);
  sub_B5DDC();
  return sub_E5340();
}

uint64_t sub_E0E10@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v10 = sub_6898(&qword_138EB0);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  NSBundle v13 = &v21[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = *a1;
  uint64_t v14 = a1[1];
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  *(unsigned char *)(v16 + 32) = a4 & 1;
  *(void *)(v16 + 40) = v15;
  *(void *)(v16 + 48) = v14;
  uint64_t v22 = v15;
  uint64_t v23 = v14;
  uint64_t v24 = a2;
  uint64_t v25 = a3;
  char v26 = a4 & 1;
  sub_6D60();
  swift_bridgeObjectRetain();
  sub_6898(&qword_13A438);
  sub_105AC(&qword_13A440, &qword_13A438);
  sub_E5270();
  uint64_t v17 = sub_E51A0();
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v11 + 16))(a5, v13, v10);
  uint64_t v19 = (uint64_t *)(a5 + *(int *)(sub_6898(&qword_138EA0) + 36));
  *uint64_t v19 = KeyPath;
  v19[1] = v17;
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t sub_E1010()
{
  return swift_release();
}

uint64_t sub_E1100@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = sub_E4BA0();
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 1;
  uint64_t v6 = sub_6898(&qword_13A448);
  return sub_E1180(a1, a2, a3 + *(int *)(v6 + 44));
}

uint64_t sub_E1180@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v61 = a3;
  uint64_t v54 = sub_6898(&qword_131630);
  uint64_t v48 = *(void *)(v54 - 8);
  __chkstk_darwin(v54);
  uint64_t v47 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_6898(&qword_13A450);
  __chkstk_darwin(v51);
  uint64_t v52 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_6898(&qword_137DA8);
  uint64_t v50 = *(void *)(v53 - 8);
  __chkstk_darwin(v53);
  uint64_t v49 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_6898(&qword_13A458);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v55 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v58 = (uint64_t)&v47 - v11;
  uint64_t v62 = a1;
  unint64_t v63 = a2;
  sub_E3F8();
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_E4F60();
  uint64_t v59 = v13;
  uint64_t v60 = v12;
  int v56 = v14;
  uint64_t v57 = v15;
  type metadata accessor for DefaultEmailSelectionView.ViewModel();
  sub_E3460();
  uint64_t v16 = sub_E4770();
  uint64_t v17 = *(void *)(v16 + 24);
  uint64_t v18 = *(void *)(v16 + 32);
  swift_bridgeObjectRetain();
  swift_release();
  if (v17 != a1 || v18 != a2)
  {
    char v19 = sub_E5C20();
    swift_bridgeObjectRelease();
    if (v19) {
      goto LABEL_5;
    }
    sub_E4770();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_E45B0();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v32 = v60;
    uint64_t v31 = v61;
    uint64_t v34 = v59;
    if (v63)
    {
      if (v62 == a1 && v63 == a2)
      {
        swift_bridgeObjectRelease();
LABEL_13:
        uint64_t v40 = v47;
        sub_E4790();
        uint64_t v41 = v48;
        uint64_t v42 = v54;
        (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v52, v40, v54);
        swift_storeEnumTagMultiPayload();
        uint64_t v43 = sub_62A4(&qword_137DB8);
        unint64_t v44 = sub_9C208();
        uint64_t v62 = v43;
        unint64_t v63 = v44;
        swift_getOpaqueTypeConformance2();
        sub_105AC(&qword_131628, &qword_131630);
        uint64_t v28 = (uint64_t)v55;
        sub_E4C50();
        (*(void (**)(char *, uint64_t))(v41 + 8))(v40, v42);
        uint64_t v45 = sub_6898(&qword_13A460);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v28, 0, 1, v45);
        uint64_t v30 = v58;
        sub_10250(v28, v58, &qword_13A458);
        uint64_t v33 = v57;
        goto LABEL_6;
      }
      char v39 = sub_E5C20();
      swift_bridgeObjectRelease();
      if (v39) {
        goto LABEL_13;
      }
    }
    uint64_t v46 = sub_6898(&qword_13A460);
    uint64_t v30 = v58;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v58, 1, 1, v46);
    uint64_t v33 = v57;
    char v35 = v56;
    uint64_t v28 = (uint64_t)v55;
    goto LABEL_7;
  }
  swift_bridgeObjectRelease();
LABEL_5:
  uint64_t v20 = sub_E51C0();
  uint64_t v21 = sub_E5180();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v62 = v20;
  unint64_t v63 = KeyPath;
  uint64_t v64 = v21;
  sub_E4E60();
  uint64_t v23 = sub_6898(&qword_137DB8);
  unint64_t v24 = sub_9C208();
  uint64_t v25 = v49;
  sub_E4FD0();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v26 = v50;
  uint64_t v27 = v53;
  (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v52, v25, v53);
  swift_storeEnumTagMultiPayload();
  uint64_t v62 = v23;
  unint64_t v63 = v24;
  swift_getOpaqueTypeConformance2();
  sub_105AC(&qword_131628, &qword_131630);
  uint64_t v28 = (uint64_t)v55;
  sub_E4C50();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v25, v27);
  uint64_t v29 = sub_6898(&qword_13A460);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v28, 0, 1, v29);
  uint64_t v30 = v58;
  sub_10250(v28, v58, &qword_13A458);
  uint64_t v32 = v60;
  uint64_t v31 = v61;
  uint64_t v33 = v57;
  uint64_t v34 = v59;
LABEL_6:
  char v35 = v56;
LABEL_7:
  char v36 = v35 & 1;
  sub_E356C(v30, v28);
  *(void *)uint64_t v31 = v32;
  *(void *)(v31 + 8) = v34;
  *(unsigned char *)(v31 + 16) = v36;
  *(void *)(v31 + 24) = v33;
  *(void *)(v31 + 32) = 0;
  *(unsigned char *)(v31 + 40) = 1;
  uint64_t v37 = sub_6898(&qword_13A468);
  sub_E356C(v28, v31 + *(int *)(v37 + 64));
  sub_FA04(v32, v34, v36);
  swift_bridgeObjectRetain();
  sub_102B4(v30, &qword_13A458);
  sub_102B4(v28, &qword_13A458);
  sub_EF0C(v32, v34, v36);
  return swift_bridgeObjectRelease();
}

double sub_E1914@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_E45B0();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = v6;
  return result;
}

uint64_t sub_E19A4()
{
  return sub_E45C0();
}

uint64_t sub_E1A50()
{
  uint64_t v0 = sub_E4320();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  long long v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_131238 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_67B4(v0, (uint64_t)qword_148D58);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  uint64_t v5 = sub_E4300();
  os_log_type_t v6 = sub_E5870();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&def_66DD4, v5, v6, "[Default Email Selection] page viewed", v7, 2u);
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_E1BDC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_E45B0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_E1C50@<X0>(uint64_t a1@<X8>)
{
  return sub_E0398(*(void *)v1, *(void *)(v1 + 8), *(unsigned char *)(v1 + 16), a1);
}

double sub_E1C5C@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_E45B0();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = v6;
  return result;
}

uint64_t sub_E1CE8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_E4320();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  char v6 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v26 - v7;
  if (qword_131238 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_67B4(v2, (uint64_t)qword_148D58);
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v10(v8, v9, v2);
  uint64_t v11 = sub_E4300();
  os_log_type_t v12 = sub_E5870();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    v26[0] = v3;
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&def_66DD4, v11, v12, "[Default Email Selection] update started", v13, 2u);
    uint64_t v3 = v26[0];
    swift_slowDealloc();
  }

  int v14 = *(void (**)(char *, uint64_t))(v3 + 8);
  v14(v8, v2);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_E45B0();
  swift_release();
  swift_release();
  uint64_t v15 = *((void *)&v27 + 1);
  if (*((void *)&v27 + 1))
  {
    uint64_t v16 = v27;
    long long v28 = 0u;
    long long v29 = 0u;
    sub_67EC((void *)(v1 + OBJC_IVAR____TtCV18icloudMailSettings25DefaultEmailSelectionView9ViewModel_repository), *(void *)(v1 + OBJC_IVAR____TtCV18icloudMailSettings25DefaultEmailSelectionView9ViewModel_repository + 24));
    swift_bridgeObjectRetain();
    v26[1] = sub_8D194(&v27);
    uint64_t v17 = swift_allocObject();
    swift_weakInit();
    uint64_t v18 = swift_allocObject();
    long long v19 = v28;
    *(_OWORD *)(v18 + 16) = v27;
    *(_OWORD *)(v18 + 32) = v19;
    *(_OWORD *)(v18 + 48) = v29;
    *(void *)(v18 + 64) = v17;
    uint64_t v20 = swift_allocObject();
    swift_weakInit();
    uint64_t v21 = (void *)swift_allocObject();
    v21[2] = v20;
    v21[3] = v16;
    v21[4] = v15;
    sub_6898(&qword_1322D8);
    sub_105AC((unint64_t *)&qword_1322E0, &qword_1322D8);
    sub_E4610();
    swift_release();
    swift_release();
    swift_release();
    swift_beginAccess();
    sub_E44F0();
    swift_endAccess();
    return swift_release();
  }
  else
  {
    v10(v6, v9, v2);
    uint64_t v23 = sub_E4300();
    os_log_type_t v24 = sub_E5870();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&def_66DD4, v23, v24, "[Default Email Selection] no change, skipping", v25, 2u);
      swift_slowDealloc();
    }

    return ((uint64_t (*)(char *, uint64_t))v14)(v6, v2);
  }
}

uint64_t sub_E2160(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_E4320();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)v40 - v10;
  uint64_t v13 = *(void *)a1;
  uint64_t v12 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v46 = *(void *)(a1 + 24);
  uint64_t v47 = *(void *)(a1 + 32);
  uint64_t v48 = v14;
  uint64_t v15 = a3 + 16;
  LODWORD(a1) = *(unsigned __int8 *)(a1 + 40);
  if (v12)
  {
    int v45 = a1;
    sub_10250(a2, (uint64_t)v60, &qword_1331D8);
    sub_10250(a2 + 16, (uint64_t)v59, &qword_1331D8);
    sub_10250(a2 + 32, (uint64_t)v58, &qword_1331D8);
    swift_bridgeObjectRetain();
    sub_5F47C((uint64_t)v60);
    sub_5F47C((uint64_t)v59);
    sub_5F47C((uint64_t)v58);
    uint64_t v17 = sub_3B104();
    sub_E620((uint64_t)v60);
    sub_E620((uint64_t)v59);
    sub_E620((uint64_t)v58);
    if (v17)
    {
      uint64_t v43 = sub_E5530();
      unint64_t v19 = v18;
      swift_bridgeObjectRelease();
      if (qword_131238 != -1) {
        swift_once();
      }
      uint64_t v20 = sub_67B4(v5, (uint64_t)qword_148D58);
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v11, v20, v5);
      swift_bridgeObjectRetain();
      uint64_t v21 = sub_E4300();
      uint64_t v22 = v6;
      os_log_type_t v23 = sub_E5880();
      if (os_log_type_enabled(v21, v23))
      {
        uint64_t v24 = swift_slowAlloc();
        uint64_t v42 = v13;
        uint64_t v25 = (uint8_t *)v24;
        uint64_t v26 = swift_slowAlloc();
        unint64_t v44 = v9;
        uint64_t v51 = v26;
        uint64_t v41 = v22;
        *(_DWORD *)uint64_t v25 = 136642819;
        v40[1] = v25 + 4;
        swift_bridgeObjectRetain();
        v57[0] = sub_57A98(v43, v19, &v51);
        sub_E5900();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&def_66DD4, v21, v23, "[Default Email Selection] params: %{sensitive}s", v25, 0xCu);
        swift_arrayDestroy();
        uint64_t v9 = v44;
        swift_slowDealloc();
        uint64_t v13 = v42;
        swift_slowDealloc();

        uint64_t v6 = v41;
        (*(void (**)(char *, uint64_t))(v41 + 8))(v11, v5);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v22 + 8))(v11, v5);
        uint64_t v6 = v22;
      }
    }
    if (qword_131238 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_67B4(v5, (uint64_t)qword_148D58);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v27, v5);
    swift_bridgeObjectRetain();
    long long v28 = v9;
    long long v29 = sub_E4300();
    os_log_type_t v30 = sub_E5880();
    if (os_log_type_enabled(v29, v30))
    {
      unint64_t v44 = v28;
      a1 = swift_slowAlloc();
      v57[0] = swift_slowAlloc();
      uint64_t v43 = v15;
      *(_DWORD *)a1 = 136315138;
      uint64_t v42 = a1 + 4;
      uint64_t v51 = v13;
      uint64_t v52 = v12;
      uint64_t v53 = v48;
      LOBYTE(v54) = v46 & 1;
      uint64_t v55 = v47;
      char v56 = v45 & 1;
      sub_69E0();
      uint64_t v31 = sub_E5C60();
      uint64_t v51 = sub_57A98(v31, v32, v57);
      sub_E5900();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&def_66DD4, v29, v30, "[Default Email Selection] update failed: %s", (uint8_t *)a1, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      LOBYTE(a1) = v45;
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v6 + 8))(v44, v5);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v28, v5);
      LOBYTE(a1) = v45;
    }
  }
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    char v33 = a1 & 1;
    if (v12) {
      uint64_t v34 = v13;
    }
    else {
      uint64_t v34 = 0;
    }
    if (v12) {
      uint64_t v35 = v48;
    }
    else {
      uint64_t v35 = 0;
    }
    if (v12) {
      uint64_t v36 = v46 & 1;
    }
    else {
      uint64_t v36 = 0;
    }
    if (v12) {
      uint64_t v37 = v47;
    }
    else {
      uint64_t v37 = 0;
    }
    if (v12) {
      char v38 = v33;
    }
    else {
      char v38 = 0;
    }
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v51 = v34;
    uint64_t v52 = v12;
    uint64_t v53 = v35;
    uint64_t v54 = v36;
    uint64_t v55 = v37;
    char v56 = v38;
    swift_bridgeObjectRetain();
    sub_E45C0();
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v49 = 0;
    uint64_t v50 = 0;
    return sub_E45C0();
  }
  return result;
}

uint64_t sub_E2838(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = sub_E4320();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = &v17[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_131238 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_67B4(v6, (uint64_t)qword_148D58);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  uint64_t v11 = sub_E4300();
  os_log_type_t v12 = sub_E5870();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&def_66DD4, v11, v12, "[Default Email Selection] update successful", v13, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    *(void *)(Strong + 24) = a3;
    *(void *)(Strong + 32) = a4;
    swift_bridgeObjectRetain();
    swift_release();
    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v16 = *(void (**)(uint64_t, uint64_t))(result
                                                  + OBJC_IVAR____TtCV18icloudMailSettings25DefaultEmailSelectionView9ViewModel_completionHandler);
    swift_retain();
    swift_release();
    v16(a3, a4);
    return swift_release();
  }
  return result;
}

uint64_t sub_E2A8C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtCV18icloudMailSettings25DefaultEmailSelectionView9ViewModel__newDefaultSelection;
  uint64_t v2 = sub_6898(&qword_134908);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtCV18icloudMailSettings25DefaultEmailSelectionView9ViewModel__updateError;
  uint64_t v4 = sub_6898(&qword_131488);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_6A34(v0 + OBJC_IVAR____TtCV18icloudMailSettings25DefaultEmailSelectionView9ViewModel_repository);
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v5, v6);
}

uint64_t sub_E2BBC()
{
  return type metadata accessor for DefaultEmailSelectionView.ViewModel();
}

uint64_t type metadata accessor for DefaultEmailSelectionView.ViewModel()
{
  uint64_t result = qword_13A288;
  if (!qword_13A288) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_E2C10()
{
  sub_62EC(319, (unint64_t *)&unk_137E98, &qword_1331D8);
  if (v0 <= 0x3F)
  {
    sub_62EC(319, (unint64_t *)&qword_1312F0, &qword_1312F8);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t sub_E2D2C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for DefaultEmailSelectionView.ViewModel();
  uint64_t result = sub_E4510();
  *a1 = result;
  return result;
}

double sub_E2D6C@<D0>(_OWORD *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_E45B0();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_E2DEC()
{
  return sub_E45C0();
}

void *sub_E2E70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v26 = a5;
  uint64_t v27 = a6;
  uint64_t v25 = a3;
  uint64_t v11 = sub_6898(&qword_131488);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_6898(&qword_134908);
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  unint64_t v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = type metadata accessor for MSRepositoryDefault();
  unint64_t v32 = &off_124FE8;
  *(void *)&long long v30 = a4;
  unint64_t v19 = (char *)a7 + OBJC_IVAR____TtCV18icloudMailSettings25DefaultEmailSelectionView9ViewModel__newDefaultSelection;
  long long v28 = 0uLL;
  sub_6898(&qword_1331D8);
  sub_E4570();
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v19, v18, v15);
  uint64_t v20 = (char *)a7 + OBJC_IVAR____TtCV18icloudMailSettings25DefaultEmailSelectionView9ViewModel__updateError;
  long long v28 = 0u;
  memset(v29, 0, sizeof(v29));
  sub_6898(&qword_1312F8);
  sub_E4570();
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v20, v14, v11);
  *(void *)((char *)a7 + OBJC_IVAR____TtCV18icloudMailSettings25DefaultEmailSelectionView9ViewModel_cancellables) = &_swiftEmptySetSingleton;
  a7[3] = a1;
  a7[4] = a2;
  a7[2] = v25;
  sub_47280(&v30, (uint64_t)a7 + OBJC_IVAR____TtCV18icloudMailSettings25DefaultEmailSelectionView9ViewModel_repository);
  uint64_t v21 = (void *)((char *)a7
                 + OBJC_IVAR____TtCV18icloudMailSettings25DefaultEmailSelectionView9ViewModel_completionHandler);
  uint64_t v22 = v27;
  *uint64_t v21 = v26;
  v21[1] = v22;
  return a7;
}

uint64_t sub_E30CC()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_E3104()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_E3154(uint64_t a1)
{
  return sub_E2160(a1, v1 + 16, *(void *)(v1 + 64));
}

uint64_t sub_E3160()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_E31A0(uint64_t a1)
{
  return sub_E2838(a1, v1[2], v1[3], v1[4]);
}

uint64_t destroy for DefaultEmailSelectionView()
{
  return sub_6E40();
}

uint64_t _s18icloudMailSettings25DefaultEmailSelectionViewVwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_6D60();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for DefaultEmailSelectionView(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_6D60();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_6E40();
  return a1;
}

uint64_t assignWithTake for DefaultEmailSelectionView(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_6E40();
  return a1;
}

uint64_t getEnumTagSinglePayload for DefaultEmailSelectionView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DefaultEmailSelectionView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)double result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DefaultEmailSelectionView()
{
  return &type metadata for DefaultEmailSelectionView;
}

uint64_t sub_E3350()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_E336C@<X0>(uint64_t a1@<X8>)
{
  return sub_E0998(*(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned char *)(v1 + 32), a1);
}

unint64_t sub_E3378()
{
  unint64_t result = qword_13A420;
  if (!qword_13A420)
  {
    sub_62A4(&qword_13A400);
    sub_62A4(&qword_13A3F0);
    sub_105AC(&qword_13A418, &qword_13A3F0);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_13A420);
  }
  return result;
}

uint64_t sub_E3454()
{
  return sub_E0CB4(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
}

unint64_t sub_E3460()
{
  unint64_t result = qword_13A428;
  if (!qword_13A428)
  {
    type metadata accessor for DefaultEmailSelectionView.ViewModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_13A428);
  }
  return result;
}

uint64_t sub_E34B8()
{
  sub_6E40();

  return _swift_deallocObject(v0, 33, 7);
}

uint64_t sub_E34F4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_E0E10(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), *(unsigned char *)(v2 + 32), a2);
}

uint64_t sub_E3500()
{
  sub_6E40();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_E3544()
{
  return sub_E1010();
}

uint64_t sub_E3554@<X0>(uint64_t a1@<X8>)
{
  return sub_E1100(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_E356C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6898(&qword_13A458);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_E35D4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_E3680()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_E36B4()
{
  sub_3A08();
  sub_39EC(&def_66DD4, v0, v1, "[MailSettingsSpecifierProvider] account not provisioned for mail", v2, v3, v4, v5, v6);
}

void sub_E36E8(void *a1, NSObject *a2)
{
  uint64_t v3 = objc_msgSend(a1, "aa_altDSID");
  sub_3A14();
  sub_3A20(&def_66DD4, a2, v4, "[MailSettingsSpecifierProvider] adding mail specifier for primary cloudaccount %@", v5);
}

void sub_E3774(void *a1, NSObject *a2)
{
  uint64_t v3 = objc_msgSend(a1, "aa_altDSID");
  sub_3A14();
  sub_3A20(&def_66DD4, a2, v4, "[MailSettingsSpecifierProvider] adding mail specifier for secondary cloudaccount %@", v5);
}

void sub_E3800()
{
  sub_3A08();
  sub_39EC(&def_66DD4, v0, v1, "[MailSettingsSpecifierProvider] mail Specifier tapped", v2, v3, v4, v5, v6);
}

void sub_E3834()
{
  sub_3A08();
  sub_39EC(&def_66DD4, v0, v1, "[MailSettingsSpecifierProvider] Mail account is configured, navigating to Unified Settings", v2, v3, v4, v5, v6);
}

void sub_E3868()
{
  sub_3A08();
  sub_39EC(&def_66DD4, v0, v1, "[MailSettingsSpecifierProvider] Mail account is not configured, presenting account creation flow", v2, v3, v4, v5, v6);
}

void sub_E389C()
{
  sub_3A14();
  sub_3A20(&def_66DD4, v0, v1, "[MailSettingsSpecifierProvider] %@ not loaded. Loading...", v2);
}

void sub_E3908()
{
  sub_3A14();
  sub_3A20(&def_66DD4, v0, v1, "[MailSettingsSpecifierProvider] mail dataclass state changed to %@", v2);
}

void sub_E3974()
{
  sub_3A08();
  sub_39EC(&def_66DD4, v0, v1, "[MailSettingsSpecifierProvider] Navigating to Unified Settings", v2, v3, v4, v5, v6);
}

void sub_E39A8()
{
  sub_3A08();
  sub_39EC(&def_66DD4, v0, v1, "[MailSettingsSpecifierProvider] Mail account has been successfully created", v2, v3, v4, v5, v6);
}

void sub_E39DC()
{
  sub_3A08();
  sub_39EC(&def_66DD4, v0, v1, "[PreferencesViewController] Mail is not configured for BYOD universal link", v2, v3, v4, v5, v6);
}

void sub_E3A10()
{
  sub_3A08();
  sub_39EC(&def_66DD4, v0, v1, "[PreferencesViewController] handleURL BYOD universal link", v2, v3, v4, v5, v6);
}

void sub_E3A44()
{
  sub_3A14();
  sub_5440(&def_66DD4, v0, v1, "[PreferencesViewController] handleURL Mail data class universal link with path: %@", v2, v3, v4, v5, v6);
}

void sub_E3AAC()
{
  sub_3A14();
  sub_5440(&def_66DD4, v0, v1, "[PreferencesViewController] handleURL from universal link with params: %@", v2, v3, v4, v5, v6);
}

void sub_E3B14(id *a1, NSObject *a2)
{
  uint64_t v3 = [*a1 navigationController];
  uint64_t v4 = [v3 viewControllers];
  sub_3A14();
  _os_log_debug_impl(&def_66DD4, a2, OS_LOG_TYPE_DEBUG, "Pop to iCloud Mail Settings: %@", v5, 0xCu);
}

void sub_E3BC4()
{
  sub_3A14();
  sub_5440(&def_66DD4, v0, v1, "Deeplink: %@", v2, v3, v4, v5, v6);
}

void sub_E3C2C()
{
  sub_3A08();
  sub_39EC(&def_66DD4, v0, v1, "[PreferencesViewController] Mailbox behavior was tapped", v2, v3, v4, v5, v6);
}

void sub_E3C60()
{
  sub_3A08();
  sub_39EC(&def_66DD4, v0, v1, "[PreferencesViewController] Custom Email Domain was tapped", v2, v3, v4, v5, v6);
}

void sub_E3C94()
{
  sub_3A08();
  sub_39EC(&def_66DD4, v0, v1, "[PreferencesViewController] S/MIME was tapped", v2, v3, v4, v5, v6);
}

void sub_E3CC8()
{
  sub_3A08();
  sub_545C(&def_66DD4, v0, v1, "[PreferencesViewController] Mailbox Behavior Specifier is nil", v2, v3, v4, v5, v6);
}

void sub_E3CFC()
{
  sub_3A08();
  sub_545C(&def_66DD4, v0, v1, "[PreferencesViewController] S/MIME Specifier is nil", v2, v3, v4, v5, v6);
}

void sub_E3D30()
{
  sub_3A08();
  sub_545C(&def_66DD4, v0, v1, "Account manager is nil, initiating new one", v2, v3, v4, v5, v6);
}

void sub_E3D64(os_log_t log)
{
  int v1 = 138412290;
  CFStringRef v2 = @"iCloudMailboxSpecifierProvider";
  _os_log_error_impl(&def_66DD4, log, OS_LOG_TYPE_ERROR, "[PreferencesViewController] Failed to load %@ from MailAccountSettings.bundle", (uint8_t *)&v1, 0xCu);
}

void sub_E3DE8()
{
  sub_3A14();
  sub_5440(&def_66DD4, v0, v1, "%@ not loaded. Loading...", v2, v3, v4, v5, v6);
}

Class sub_E3E50()
{
  return URLRequest._bridgeToObjectiveC()().super.isa;
}

uint64_t sub_E3E60()
{
  return static URLRequest._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_E3E70()
{
  return type metadata accessor for URLRequest();
}

uint64_t sub_E3E80()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_E3E90()
{
  return JSONDecoder.init()();
}

uint64_t sub_E3EA0()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_E3EB0()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t sub_E3EC0()
{
  return JSONEncoder.init()();
}

uint64_t sub_E3ED0()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t sub_E3EE0()
{
  return static CharacterSet.whitespacesAndNewlines.getter();
}

uint64_t sub_E3EF0()
{
  return type metadata accessor for CharacterSet();
}

uint64_t sub_E3F00()
{
  return URLQueryItem.init(name:value:)();
}

uint64_t sub_E3F10()
{
  return URLQueryItem.name.getter();
}

uint64_t sub_E3F20()
{
  return URLQueryItem.value.getter();
}

uint64_t sub_E3F30()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t sub_E3F40()
{
  return URLComponents.queryItems.modify();
}

uint64_t sub_E3F50()
{
  return URLComponents.queryItems.getter();
}

uint64_t sub_E3F60()
{
  return URLComponents.queryItems.setter();
}

uint64_t sub_E3F70()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t sub_E3F80()
{
  return URLComponents.url.getter();
}

uint64_t sub_E3F90()
{
  return URLComponents.init(string:)();
}

uint64_t sub_E3FA0()
{
  return type metadata accessor for URLComponents();
}

uint64_t sub_E3FB0()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t sub_E3FC0()
{
  return LocalizedError.failureReason.getter();
}

uint64_t sub_E3FD0()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t sub_E3FE0(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_E3FF0()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_E4000()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_E4010()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_E4020()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t _s10Foundation3URLV18icloudMailSettingsE2idSSvg_0()
{
  return URL.absoluteString.getter();
}

uint64_t sub_E4040()
{
  return URL.lastPathComponent.getter();
}

void sub_E4050(NSURL *retstr@<X8>)
{
}

uint64_t sub_E4060()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_E4070()
{
  return URL.path.getter();
}

uint64_t sub_E4080()
{
  return URL.init(string:)();
}

uint64_t sub_E4090()
{
  return type metadata accessor for URL();
}

NSData sub_E40A0()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_E40B0()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_E40C0()
{
  return static Date.FormatStyle.TimeStyle.omitted.getter();
}

uint64_t sub_E40D0()
{
  return static Date.FormatStyle.TimeStyle.shortened.getter();
}

uint64_t sub_E40E0()
{
  return type metadata accessor for Date.FormatStyle.TimeStyle();
}

uint64_t sub_E40F0()
{
  return static Date.FormatStyle.DateStyle.abbreviated.getter();
}

uint64_t sub_E4100()
{
  return static Date.FormatStyle.DateStyle.long.getter();
}

uint64_t sub_E4110()
{
  return static Date.FormatStyle.DateStyle.omitted.getter();
}

uint64_t sub_E4120()
{
  return type metadata accessor for Date.FormatStyle.DateStyle();
}

uint64_t sub_E4130()
{
  return Date.addingTimeInterval(_:)();
}

NSDate sub_E4140()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_E4150()
{
  return static Date.< infix(_:_:)();
}

uint64_t sub_E4160()
{
  return Date.init(timeIntervalSince1970:)();
}

uint64_t sub_E4170()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_E4180()
{
  return Date.formatted(date:time:)();
}

uint64_t sub_E4190()
{
  return Date.init()();
}

uint64_t sub_E41A0()
{
  return type metadata accessor for Date();
}

uint64_t sub_E41B0()
{
  return UUID.uuidString.getter();
}

uint64_t sub_E41C0()
{
  return UUID.init()();
}

uint64_t sub_E41D0()
{
  return type metadata accessor for UUID();
}

NSLocale sub_E41E0()
{
  return Locale._bridgeToObjectiveC()();
}

uint64_t sub_E41F0()
{
  return static Locale.current.getter();
}

uint64_t sub_E4200()
{
  return type metadata accessor for Locale();
}

uint64_t sub_E4210()
{
  return Calendar.isDateInToday(_:)();
}

uint64_t sub_E4220()
{
  return type metadata accessor for Calendar.MatchingPolicy();
}

uint64_t sub_E4230()
{
  return type metadata accessor for Calendar.SearchDirection();
}

uint64_t sub_E4240()
{
  return type metadata accessor for Calendar.RepeatedTimePolicy();
}

uint64_t sub_E4250()
{
  return Calendar.date(bySettingHour:minute:second:of:matchingPolicy:repeatedTimePolicy:direction:)();
}

uint64_t sub_E4260()
{
  return static Calendar.current.getter();
}

uint64_t sub_E4270()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_E4280()
{
  return type metadata accessor for IndexSet.Index();
}

uint64_t sub_E4290()
{
  return IndexSet.first.getter();
}

uint64_t sub_E42A0()
{
  return type metadata accessor for IndexSet();
}

uint64_t sub_E42B0()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_E42C0()
{
  return Regex.init(_regexString:version:)();
}

uint64_t sub_E42D0()
{
  return Regex.Match.output.getter();
}

uint64_t sub_E42E0()
{
  return AsyncIconImage.init<>(icon:descriptor:)();
}

uint64_t sub_E42F0()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_E4300()
{
  return Logger.logObject.getter();
}

uint64_t sub_E4310()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_E4320()
{
  return type metadata accessor for Logger();
}

uint64_t sub_E4330()
{
  return RemoteAction.performSynchronousAction(with:localStore:)();
}

uint64_t sub_E4360()
{
  return RemoteAction.modifyView(_:with:)();
}

uint64_t sub_E4370()
{
  return RemoteAction.modifyView(_:with:localStore:)();
}

uint64_t sub_E4380()
{
  return Referenceable<>.resolvedValue(store:)();
}

uint64_t sub_E4390()
{
  return type metadata accessor for Referenceable();
}

uint64_t sub_E43D0()
{
  return type metadata accessor for DecodableState();
}

uint64_t sub_E43E0()
{
  return dispatch thunk of StateDecodable.asDecodable.getter();
}

uint64_t sub_E43F0()
{
  return ContentModifier.modifyView(_:with:)();
}

uint64_t sub_E4400()
{
  return ContentModifier.modifyView(_:)();
}

uint64_t sub_E4410()
{
  return dispatch thunk of ContentRegistry.addViewType(_:id:)();
}

uint64_t sub_E4420()
{
  return dispatch thunk of ContentRegistry.addActionType(_:id:)();
}

uint64_t sub_E4430()
{
  return type metadata accessor for ContentRegistry();
}

uint64_t sub_E4440()
{
  return LocalStateStore.init()();
}

uint64_t sub_E4450()
{
  return type metadata accessor for LocalStateStore();
}

uint64_t sub_E4460()
{
  return RemoteStateStore.init()();
}

uint64_t sub_E4470()
{
  return type metadata accessor for RemoteStateStore();
}

uint64_t sub_E4480()
{
  return RemoteStateStore.subscript.setter();
}

uint64_t sub_E4490()
{
  return StringResolvable.resolved(with:)();
}

uint64_t sub_E44A0()
{
  return type metadata accessor for StringResolvable();
}

uint64_t sub_E44B0()
{
  return RemoteContentView.init(id:url:stateStore:localStateStore:)();
}

uint64_t sub_E44C0()
{
  return type metadata accessor for RemoteContentView();
}

uint64_t sub_E44D0()
{
  return Publishers.CombineLatest.init(_:_:)();
}

uint64_t sub_E44E0()
{
  return Publishers.CombineLatest4.init(_:_:_:_:)();
}

uint64_t sub_E44F0()
{
  return AnyCancellable.store(in:)();
}

void sub_E4500()
{
}

uint64_t sub_E4510()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_E4520()
{
  return CurrentValueSubject.send(_:)();
}

uint64_t sub_E4530()
{
  return CurrentValueSubject.value.getter();
}

uint64_t sub_E4540()
{
  return CurrentValueSubject.value.setter();
}

uint64_t sub_E4550()
{
  return CurrentValueSubject.init(_:)();
}

uint64_t sub_E4560()
{
  return Future.init(_:)();
}

uint64_t sub_E4570()
{
  return Published.init(initialValue:)();
}

uint64_t sub_E4580()
{
  return Published.projectedValue.getter();
}

uint64_t sub_E4590()
{
  return Published.projectedValue.setter();
}

uint64_t sub_E45A0()
{
  return static Published.subscript.modify();
}

uint64_t sub_E45B0()
{
  return static Published.subscript.getter();
}

uint64_t sub_E45C0()
{
  return static Published.subscript.setter();
}

uint64_t sub_E45D0()
{
  return type metadata accessor for Published();
}

uint64_t sub_E45E0()
{
  return Publisher.eraseToAnyPublisher()();
}

uint64_t sub_E45F0()
{
  return Publisher.compactMap<A>(_:)();
}

uint64_t sub_E4600()
{
  return Publisher.map<A>(_:)();
}

uint64_t sub_E4610()
{
  return Publisher.sink(receiveCompletion:receiveValue:)();
}

uint64_t sub_E4620()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t sub_E4630()
{
  return Publisher.mapError<A>(_:)();
}

uint64_t sub_E4640()
{
  return Publisher.dropFirst(_:)();
}

uint64_t sub_E4650()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t sub_E4660()
{
  return Publisher<>.assign(to:)();
}

uint64_t sub_E4670()
{
  return AsyncImage.init(url:scale:transaction:content:)();
}

uint64_t sub_E4680()
{
  return static ButtonRole.destructive.getter();
}

uint64_t sub_E4690()
{
  return static ButtonRole.cancel.getter();
}

uint64_t sub_E46A0()
{
  return type metadata accessor for ButtonRole();
}

uint64_t sub_E46B0()
{
  return DatePicker<>.init<A>(_:selection:displayedComponents:)();
}

uint64_t sub_E46C0()
{
  return DatePicker<>.init<A>(_:selection:in:displayedComponents:)();
}

uint64_t sub_E46D0()
{
  return EditButton.init()();
}

uint64_t sub_E46E0()
{
  return type metadata accessor for EditButton();
}

uint64_t sub_E46F0()
{
  return FocusState.wrappedValue.setter();
}

uint64_t sub_E4700()
{
  return FocusState.projectedValue.getter();
}

uint64_t sub_E4710()
{
  return FocusState.init<>()();
}

uint64_t sub_E4720()
{
  return ScrollView.init(_:showsIndicators:content:)();
}

uint64_t sub_E4730()
{
  return static ColorScheme.== infix(_:_:)();
}

uint64_t sub_E4740()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_E4750()
{
  return type metadata accessor for ControlSize();
}

uint64_t sub_E4760()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_E4770()
{
  return StateObject.wrappedValue.getter();
}

uint64_t sub_E4780()
{
  return StateObject.projectedValue.getter();
}

uint64_t sub_E4790()
{
  return ProgressView<>.init<>()();
}

uint64_t sub_E47A0()
{
  return static ViewModifier._makeView(modifier:inputs:body:)();
}

uint64_t sub_E47B0()
{
  return static ViewModifier._makeViewList(modifier:inputs:body:)();
}

uint64_t sub_E47C0()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t sub_E47D0()
{
  return _FrameLayout.init(width:height:alignment:)();
}

void sub_E47E0()
{
}

uint64_t sub_E47F0()
{
  return type metadata accessor for DismissAction();
}

uint64_t sub_E4800()
{
  return GeometryProxy.size.getter();
}

uint64_t sub_E4810()
{
  return GeometryProxy.frame(in:)();
}

uint64_t sub_E4820()
{
  return type metadata accessor for GeometryProxy();
}

uint64_t sub_E4830()
{
  return static PreferenceKey._isReadableByHost.getter();
}

uint64_t sub_E4840()
{
  return static PreferenceKey._includesRemovedValues.getter();
}

uint64_t sub_E4850()
{
  return NavigationLink.init(destination:label:)();
}

uint64_t sub_E4860()
{
  return NavigationLink.init(destination:isActive:label:)();
}

uint64_t sub_E4870()
{
  return NavigationLink<>.init<A>(_:destination:)();
}

uint64_t sub_E4880()
{
  return type metadata accessor for NavigationLink();
}

uint64_t sub_E4890()
{
  return type metadata accessor for NavigationPath();
}

uint64_t sub_E48A0()
{
  return NavigationView.init(content:)();
}

uint64_t sub_E48B0()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t sub_E48C0()
{
  return ObservedObject.projectedValue.getter();
}

uint64_t sub_E48D0()
{
  return ObservedObject.Wrapper.subscript.getter();
}

uint64_t sub_E48E0()
{
  return AsyncImagePhase.image.getter();
}

uint64_t sub_E48F0()
{
  return type metadata accessor for CoordinateSpace();
}

uint64_t sub_E4900()
{
  return type metadata accessor for LayoutDirection();
}

uint64_t sub_E4910()
{
  return ModifiedContent<>.accessibilityLabel<A>(_:)();
}

uint64_t sub_E4920()
{
  return type metadata accessor for ModifiedContent();
}

uint64_t sub_E4930()
{
  return NavigationStack.init<>(root:)();
}

uint64_t sub_E4940()
{
  return type metadata accessor for NavigationStack();
}

uint64_t sub_E4950()
{
  return ScrollViewProxy.scrollTo<A>(_:anchor:)();
}

uint64_t sub_E4960()
{
  return type metadata accessor for ScrollViewProxy();
}

uint64_t sub_E4970()
{
  return ToolbarItemGroup.init(placement:content:)();
}

uint64_t sub_E4980()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_E4990()
{
  return EnvironmentObject.error()();
}

uint64_t sub_E49A0()
{
  return EnvironmentObject.init()();
}

uint64_t sub_E49B0()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t sub_E49C0()
{
  return EnvironmentValues.imageScale.setter();
}

uint64_t sub_E49D0()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_E49E0()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t sub_E49F0()
{
  return EnvironmentValues.controlSize.getter();
}

uint64_t sub_E4A00()
{
  return EnvironmentValues.controlSize.setter();
}

uint64_t sub_E4A10()
{
  return EnvironmentValues.truncationMode.getter();
}

uint64_t sub_E4A20()
{
  return EnvironmentValues.truncationMode.setter();
}

uint64_t sub_E4A30()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_E4A40()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_E4A50()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t sub_E4A60()
{
  return EnvironmentValues.layoutDirection.setter();
}

uint64_t sub_E4A70()
{
  return EnvironmentValues.textContentType.getter();
}

uint64_t sub_E4A80()
{
  return EnvironmentValues.textContentType.setter();
}

uint64_t sub_E4A90()
{
  return EnvironmentValues.minimumScaleFactor.getter();
}

uint64_t sub_E4AA0()
{
  return EnvironmentValues.minimumScaleFactor.setter();
}

uint64_t sub_E4AB0()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_E4AC0()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_E4AD0()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_E4AE0()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_E4AF0()
{
  return EnvironmentValues.dismiss.getter();
}

uint64_t sub_E4B00()
{
  return EnvironmentValues.editMode.getter();
}

uint64_t sub_E4B10()
{
  return EnvironmentValues.editMode.setter();
}

uint64_t sub_E4B20()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t sub_E4B30()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t sub_E4B40()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_E4B50()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_E4B60()
{
  return EnvironmentValues.init()();
}

uint64_t sub_E4B70()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_E4B80()
{
  return type metadata accessor for NavigationBarItem.TitleDisplayMode();
}

uint64_t sub_E4B90()
{
  return static VerticalAlignment.top.getter();
}

uint64_t sub_E4BA0()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_E4BB0()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_E4BC0()
{
  return LocalizedStringKey.init(_:)();
}

uint64_t sub_E4BD0()
{
  return static AccessibilityTraits.isButton.getter();
}

uint64_t sub_E4BE0()
{
  return type metadata accessor for AccessibilityTraits();
}

uint64_t sub_E4BF0()
{
  return static HorizontalAlignment.listRowSeparatorLeading.getter();
}

uint64_t sub_E4C00()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_E4C10()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_E4C20()
{
  return TupleToolbarContent.init(_:)();
}

uint64_t sub_E4C30()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_E4C40()
{
  return type metadata accessor for _ConditionalContent.Storage();
}

uint64_t sub_E4C50()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_E4C60()
{
  return type metadata accessor for _ConditionalContent();
}

uint64_t sub_E4C70()
{
  return static DatePickerComponents.hourAndMinute.getter();
}

uint64_t sub_E4C80()
{
  return static DatePickerComponents.date.getter();
}

uint64_t sub_E4C90()
{
  return type metadata accessor for DatePickerComponents();
}

uint64_t sub_E4CA0()
{
  return static ToolbarItemPlacement.navigationBarLeading.getter();
}

uint64_t sub_E4CB0()
{
  return static ToolbarItemPlacement.navigationBarTrailing.getter();
}

uint64_t sub_E4CC0()
{
  return type metadata accessor for ToolbarItemPlacement();
}

uint64_t sub_E4CD0()
{
  return static ToolbarContentBuilder.buildBlock<A>(_:)();
}

uint64_t sub_E4CE0()
{
  return static HierarchicalShapeStyle.primary.getter();
}

uint64_t sub_E4CF0()
{
  return static HierarchicalShapeStyle.secondary.getter();
}

uint64_t sub_E4D00()
{
  return static AccessibilityChildBehavior.ignore.getter();
}

uint64_t sub_E4D10()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t sub_E4D20()
{
  return static TextInputAutocapitalization.never.getter();
}

uint64_t sub_E4D30()
{
  return type metadata accessor for TextInputAutocapitalization();
}

uint64_t sub_E4D40()
{
  return BorderedProminentButtonStyle.init()();
}

uint64_t sub_E4D50()
{
  return type metadata accessor for BorderedProminentButtonStyle();
}

uint64_t sub_E4D60()
{
  return UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)();
}

uint64_t sub_E4D70()
{
  return static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)();
}

uint64_t sub_E4D80()
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)();
}

uint64_t sub_E4DA0()
{
  return static UIViewControllerRepresentable._layoutOptions(_:)();
}

uint64_t sub_E4DB0()
{
  return UIViewControllerRepresentable._identifiedViewTree(in:)();
}

uint64_t sub_E4DC0()
{
  return UIViewControllerRepresentable.body.getter();
}

uint64_t sub_E4DE0()
{
  return UIViewControllerRepresentable<>.makeCoordinator()();
}

uint64_t sub_E4DF0()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_E4E00()
{
  return static Axis.Set.vertical.getter();
}

uint64_t sub_E4E10()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_E4E20()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_E4E30()
{
  return static Font.largeTitle.getter();
}

uint64_t sub_E4E40()
{
  return static Font.subheadline.getter();
}

uint64_t sub_E4E50()
{
  return static Font.Weight.bold.getter();
}

uint64_t sub_E4E60()
{
  return static Font.Weight.medium.getter();
}

uint64_t sub_E4E70()
{
  return static Font.Weight.semibold.getter();
}

uint64_t sub_E4E80()
{
  return static Font.title2.getter();
}

uint64_t sub_E4E90()
{
  return static Font.footnote.getter();
}

uint64_t sub_E4EA0()
{
  return List<>.init(content:)();
}

uint64_t sub_E4EB0()
{
  return type metadata accessor for List();
}

uint64_t sub_E4EC0()
{
  return Text.fontWeight(_:)();
}

uint64_t sub_E4ED0()
{
  return type metadata accessor for Text.WritingMode();
}

uint64_t sub_E4EE0()
{
  return Text.Measurements.size(of:in:writingMode:)();
}

uint64_t sub_E4EF0()
{
  return Text.Measurements.init()();
}

uint64_t sub_E4F00()
{
  return type metadata accessor for Text.Measurements();
}

uint64_t sub_E4F10()
{
  return type metadata accessor for Text.TruncationMode();
}

uint64_t sub_E4F20()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_E4F30()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t sub_E4F40()
{
  return Text.font(_:)();
}

uint64_t sub_E4F50()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_E4F60()
{
  return Text.init<A>(_:)();
}

uint64_t sub_E4F70()
{
  return View.dataSource(_:)();
}

uint64_t sub_E4F80()
{
  return View.contentRegistry(_:)();
}

uint64_t sub_E4FA0()
{
  return View.settingsListAppearance()();
}

uint64_t sub_E4FB0()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_E4FC0()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_E4FD0()
{
  return View.fontWeight(_:)();
}

uint64_t sub_E4FE0()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t sub_E4FF0()
{
  return View.refreshable(action:)();
}

uint64_t sub_E5000()
{
  return View.keyboardType(_:)();
}

uint64_t sub_E5010()
{
  return View.labelsHidden()();
}

uint64_t sub_E5020()
{
  return View.onTapGesture(count:perform:)();
}

uint64_t sub_E5030()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_E5040()
{
  return View.navigationTitle(_:)();
}

uint64_t sub_E5050()
{
  return View.navigationTitle<A>(_:)();
}

uint64_t sub_E5060()
{
  return View.autocapitalization(_:)();
}

uint64_t sub_E5070()
{
  return View.confirmationDialog<A, B, C>(_:isPresented:titleVisibility:actions:message:)();
}

uint64_t sub_E5080()
{
  return View.accessibilityElement(children:)();
}

uint64_t sub_E5090()
{
  return View.disableAutocorrection(_:)();
}

uint64_t sub_E50A0()
{
  return View.accessibilityAddTraits(_:)();
}

uint64_t sub_E50B0()
{
  return View.textInputAutocapitalization(_:)();
}

uint64_t sub_E50C0()
{
  return View.navigationBarBackButtonHidden(_:)();
}

uint64_t sub_E50D0()
{
  return View.navigationBarTitleDisplayMode(_:)();
}

uint64_t sub_E50E0()
{
  return View.alert<A, B>(isPresented:error:actions:)();
}

uint64_t sub_E50F0()
{
  return View.sheet<A>(isPresented:onDismiss:content:)();
}

uint64_t sub_E5100()
{
  return View.sheet<A, B>(item:onDismiss:content:)();
}

uint64_t sub_E5110()
{
  return View.focused(_:)();
}

uint64_t sub_E5120()
{
  return View.toolbar<A>(content:)();
}

uint64_t sub_E5130()
{
  return View.toolbar<A>(content:)();
}

uint64_t sub_E5140()
{
  return View.onAppear(perform:)();
}

uint64_t sub_E5150()
{
  return View.onChange<A>(of:initial:_:)();
}

uint64_t sub_E5160()
{
  return View.lineLimit(_:reservesSpace:)();
}

uint64_t sub_E5170()
{
  return static Color.red.getter();
}

uint64_t sub_E5180()
{
  return static Color.blue.getter();
}

uint64_t sub_E5190()
{
  return static Color.clear.getter();
}

uint64_t sub_E51A0()
{
  return static Color.primary.getter();
}

uint64_t sub_E51B0()
{
  return static Color.secondary.getter();
}

uint64_t sub_E51C0()
{
  return Image.init(systemName:)();
}

uint64_t sub_E51D0()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_E51E0()
{
  return type metadata accessor for Image.Scale();
}

uint64_t sub_E51F0()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_E5200()
{
  return Image.init(_:bundle:)();
}

uint64_t sub_E5210()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_E5220()
{
  return State.wrappedValue.getter();
}

uint64_t sub_E5230()
{
  return State.wrappedValue.setter();
}

uint64_t sub_E5240()
{
  return State.projectedValue.getter();
}

uint64_t sub_E5250()
{
  return type metadata accessor for State();
}

uint64_t sub_E5260()
{
  return Button.init(role:action:label:)();
}

uint64_t sub_E5270()
{
  return Button.init(action:label:)();
}

uint64_t sub_E5280()
{
  return Button<>.init<A>(_:role:action:)();
}

uint64_t sub_E5290()
{
  return Button<>.init<A>(_:action:)();
}

uint64_t sub_E52A0()
{
  return HStack.init(alignment:spacing:content:)();
}

uint64_t sub_E52B0()
{
  return type metadata accessor for HStack();
}

uint64_t sub_E52C0()
{
  return Picker<>.init(_:selection:content:)();
}

uint64_t sub_E52D0()
{
  return Toggle.init(isOn:label:)();
}

uint64_t sub_E52E0()
{
  return Toggle<>.init<A>(_:isOn:)();
}

uint64_t sub_E52F0()
{
  return Binding.wrappedValue.getter();
}

uint64_t sub_E5300()
{
  return Binding.wrappedValue.setter();
}

uint64_t sub_E5310()
{
  return Binding.subscript.getter();
}

uint64_t sub_E5320()
{
  return Binding.projectedValue.getter();
}

uint64_t sub_E5330()
{
  return static Binding.constant(_:)();
}

uint64_t sub_E5340()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_E5350()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_E5360()
{
  return type metadata accessor for ForEach();
}

uint64_t sub_E5370()
{
  return Section<>.init<A>(_:content:)();
}

uint64_t sub_E5380()
{
  return Section<>.init(header:content:)();
}

uint64_t sub_E5390()
{
  return Section<>.init(header:footer:content:)();
}

uint64_t sub_E53A0()
{
  return Section<>.init(content:)();
}

uint64_t sub_E53B0()
{
  return Section<>.init(footer:content:)();
}

uint64_t sub_E53C0()
{
  return type metadata accessor for Section();
}

uint64_t sub_E53D0()
{
  return static EditMode.== infix(_:_:)();
}

uint64_t sub_E53E0()
{
  return type metadata accessor for EditMode();
}

uint64_t sub_E53F0()
{
  return static Alignment.center.getter();
}

uint64_t sub_E5400()
{
  return static Alignment.leading.getter();
}

uint64_t sub_E5410()
{
  return TextField.init(text:prompt:axis:label:)();
}

uint64_t sub_E5420()
{
  return TextField<>.init<A>(_:text:onEditingChanged:onCommit:)();
}

uint64_t sub_E5430()
{
  return TextField<>.init<A>(_:text:axis:)();
}

uint64_t sub_E5440()
{
  return type metadata accessor for TupleView();
}

uint64_t sub_E5450()
{
  return TupleView.init(_:)();
}

uint64_t sub_E5460()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_E5470()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_E5480()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_E5490()
{
  return static DispatchTime.now()();
}

uint64_t sub_E54A0()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_E54B0()
{
  return + infix(_:_:)();
}

uint64_t sub_E54C0()
{
  return type metadata accessor for SettingsEventImage();
}

uint64_t sub_E54D0()
{
  return SettingsEventCenter.emitNavigationEventForSystemSetting(icon:title:localizedNavigationComponents:deepLink:)();
}

uint64_t sub_E54E0()
{
  return static SettingsEventCenter.default.getter();
}

uint64_t sub_E54F0()
{
  return type metadata accessor for SettingsEventCenter();
}

NSDictionary sub_E5500()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_E5510()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_E5520()
{
  return Dictionary.description.getter();
}

uint64_t sub_E5530()
{
  return Dictionary.debugDescription.getter();
}

uint64_t sub_E5540()
{
  return BidirectionalCollection<>.matches<A, B>(of:)();
}

uint64_t sub_E5550()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_E5560()
{
  return MutableCollection.move(fromOffsets:toOffset:)();
}

uint64_t sub_E5570()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_E5580()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_E5590()
{
  return static String.localizedStringWithFormat(_:_:)();
}

uint64_t sub_E55A0()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_E55B0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_E55C0()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t sub_E55D0()
{
  return String.init(format:_:)();
}

uint64_t sub_E55E0()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_E55F0()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_E5600()
{
  return String.init<A>(describing:)();
}

uint64_t sub_E5610()
{
  return String.lowercased()()._countAndFlagsBits;
}

uint64_t sub_E5620()
{
  return String.uppercased()()._countAndFlagsBits;
}

uint64_t sub_E5630()
{
  return static String._fromSubstring(_:)();
}

uint64_t sub_E5640()
{
  return String.hash(into:)();
}

uint64_t sub_E5650()
{
  return String.count.getter();
}

uint64_t sub_E5660()
{
  return String.index(before:)();
}

uint64_t sub_E5670()
{
  return String.index(_:offsetBy:)();
}

void sub_E5680(Swift::String a1)
{
}

void sub_E5690(Swift::String a1)
{
}

uint64_t sub_E56A0()
{
  return String.Iterator.next()().value._countAndFlagsBits;
}

Swift::Int sub_E56B0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_E56C0()
{
  return String.subscript.getter();
}

uint64_t sub_E56E0()
{
  return dispatch thunk of Sequence.makeIterator()();
}

uint64_t sub_E56F0()
{
  return Sequence.contains(where:)();
}

uint64_t sub_E5700()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_E5740()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_E5750()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_E5760()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_E5770()
{
  return specialized Array._endMutation()();
}

uint64_t sub_E5780()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_E5790()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_E57A0()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_E57B0()
{
  return type metadata accessor for Array();
}

uint64_t sub_E57C0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_E57D0()
{
  return static MainActor.shared.getter();
}

uint64_t sub_E57E0()
{
  return type metadata accessor for MainActor();
}

NSNumber sub_E57F0()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_E5800()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t sub_E5810()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t sub_E5820()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t sub_E5830()
{
  return RangeReplaceableCollection<>.remove(atOffsets:)();
}

uint64_t sub_E5840()
{
  return NSPredicate.init(format:_:)();
}

uint64_t sub_E5860()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_E5870()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_E5880()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_E5890()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_E58A0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_E58B0()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t sub_E58C0()
{
  return type metadata accessor for OS_dispatch_queue.SchedulerOptions();
}

uint64_t sub_E58D0()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_E58E0()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_E58F0()
{
  return type metadata accessor for Optional();
}

uint64_t sub_E5900()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_E5910()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_E5920()
{
  return StringProtocol.components<A>(separatedBy:)();
}

uint64_t sub_E5930()
{
  return StringProtocol.trimmingCharacters(in:)();
}

uint64_t sub_E5940()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t sub_E5950()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t sub_E5960()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_E5970()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_E5980()
{
  return _HashTable.previousHole(before:)();
}

Swift::Int sub_E5990(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_E59A0()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_E59B0()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_E59C0()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_E59D0()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

void sub_E59E0(Swift::Int a1)
{
}

uint64_t sub_E59F0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_E5A00()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_E5A10()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_E5A20()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_E5A30()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_E5A40()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_E5A50()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_E5A60()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_E5A70()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_E5A80()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_E5A90()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_E5AA0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_E5AB0()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_E5AC0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_E5AD0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_E5AE0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_E5AF0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_E5B00()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_E5B10()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_E5B20()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_E5B30()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_E5B40()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_E5B50()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_E5B60()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_E5B70()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_E5B80()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_E5B90()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_E5BA0()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_E5BB0()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_E5BC0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_E5BD0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_E5BE0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_E5BF0()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

Swift::Int sub_E5C00(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_E5C10()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_E5C20()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_E5C30()
{
  return == infix<A>(_:_:)();
}

uint64_t sub_E5C40()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_E5C50()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_E5C60()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_E5C70()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_E5C80()
{
  return Error._code.getter();
}

uint64_t sub_E5C90()
{
  return Error._domain.getter();
}

uint64_t sub_E5CA0()
{
  return Error._userInfo.getter();
}

uint64_t sub_E5CB0()
{
  return Hasher.init(_seed:)();
}

void sub_E5CC0(Swift::UInt a1)
{
}

void sub_E5CD0(Swift::UInt8 a1)
{
}

Swift::Int sub_E5CE0()
{
  return Hasher._finalize()();
}

uint64_t sub_E5CF0()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_E5D00()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return _CFStringConvertEncodingToNSStringEncoding(encoding);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

uint64_t UISystemRootDirectory()
{
  return _UISystemRootDirectory();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
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

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
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

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return _swift_getOpaqueTypeMetadata2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTupleTypeLayout2()
{
  return _swift_getTupleTypeLayout2();
}

uint64_t swift_getTupleTypeMetadata()
{
  return _swift_getTupleTypeMetadata();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return _swift_getTupleTypeMetadata2();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
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

uint64_t swift_retain_n()
{
  return _swift_retain_n();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend__hasIcloudMailConfigured(void *a1, const char *a2, ...)
{
  return _[a1 _hasIcloudMailConfigured];
}

id objc_msgSend__loadMailSettingsBundleIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _loadMailSettingsBundleIfNeeded];
}

id objc_msgSend__navigateToExistingFlow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToExistingFlow:");
}

id objc_msgSend__navigateToMailPreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToMailPreferences:");
}

id objc_msgSend__navigateToSwiftUIFlow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToSwiftUIFlow:");
}

id objc_msgSend__onMailAccountCreated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onMailAccountCreated:");
}

id objc_msgSend__presentAccountCreationPage(void *a1, const char *a2, ...)
{
  return _[a1 _presentAccountCreationPage];
}

id objc_msgSend_aa_altDSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_altDSID");
}

id objc_msgSend_aa_childMailAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_childMailAccount");
}

id objc_msgSend_aa_isAccountClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_isAccountClass:");
}

id objc_msgSend_aa_isManagedAppleID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_isManagedAppleID");
}

id objc_msgSend_aa_needsEmailConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_needsEmailConfiguration");
}

id objc_msgSend_aa_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_primaryAppleAccount");
}

id objc_msgSend_ac_filter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ac_filter:");
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return _[a1 account];
}

id objc_msgSend_accountManager(void *a1, const char *a2, ...)
{
  return _[a1 accountManager];
}

id objc_msgSend_accountStore(void *a1, const char *a2, ...)
{
  return _[a1 accountStore];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return _[a1 accounts];
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_acui_linkListCellSpecifierForDataclass_account_target_set_get_detail_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acui_linkListCellSpecifierForDataclass:account:target:set:get:detail:");
}

id objc_msgSend_acui_specifierForDataclass_account_target_set_get_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acui_specifierForDataclass:account:target:set:get:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addSwiftUIView(void *a1, const char *a2, ...)
{
  return _[a1 addSwiftUIView];
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_appleAccount(void *a1, const char *a2, ...)
{
  return _[a1 appleAccount];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return _[a1 defaultStore];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_getSwiftUIViewWithAccountStore_appleAccount_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSwiftUIViewWithAccountStore:appleAccount:delegate:");
}

id objc_msgSend_handleDeeplink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDeeplink:");
}

id objc_msgSend_handleURL_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleURL:withCompletion:");
}

id objc_msgSend_handleUniversalLinkWithUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleUniversalLinkWithUserInfo:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_initAccountInfo(void *a1, const char *a2, ...)
{
  return _[a1 initAccountInfo];
}

id objc_msgSend_initWithAccountManager_presenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountManager:presenter:");
}

id objc_msgSend_initWithAccountStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountStore:");
}

id objc_msgSend_initWithAccountStore_appleAccount_presenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountStore:appleAccount:presenter:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_isEnabledForDataclass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEnabledForDataclass:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isLoaded(void *a1, const char *a2, ...)
{
  return _[a1 isLoaded];
}

id objc_msgSend_isProvisionedForDataclass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isProvisionedForDataclass:");
}

id objc_msgSend_load(void *a1, const char *a2, ...)
{
  return _[a1 load];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_mailboxSpecifierProvider(void *a1, const char *a2, ...)
{
  return _[a1 mailboxSpecifierProvider];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_onCustomEmailDomainEntryPointChangeWithSpinning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onCustomEmailDomainEntryPointChangeWithSpinning:");
}

id objc_msgSend_openMailboxBehaviors(void *a1, const char *a2, ...)
{
  return _[a1 openMailboxBehaviors];
}

id objc_msgSend_openSMIME(void *a1, const char *a2, ...)
{
  return _[a1 openSMIME];
}

id objc_msgSend_parentAccount(void *a1, const char *a2, ...)
{
  return _[a1 parentAccount];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_performControllerLoadAction(void *a1, const char *a2, ...)
{
  return _[a1 performControllerLoadAction];
}

id objc_msgSend_popToViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popToViewController:animated:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_presentMailImport(void *a1, const char *a2, ...)
{
  return _[a1 presentMailImport];
}

id objc_msgSend_presentWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentWithCompletionHandler:");
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return _[a1 queryItems];
}

id objc_msgSend_saveAccount_withDataclassActions_doVerify_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveAccount:withDataclassActions:doVerify:completion:");
}

id objc_msgSend_setAccountManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountManager:");
}

id objc_msgSend_setAccountStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountStore:");
}

id objc_msgSend_setAccounts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccounts:");
}

id objc_msgSend_setAppleAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppleAccount:");
}

id objc_msgSend_setControllerLoadAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setControllerLoadAction:");
}

id objc_msgSend_setDeeplink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeeplink:");
}

id objc_msgSend_setDetailControllerClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDetailControllerClass:");
}

id objc_msgSend_setEnabled_forDataclass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:forDataclass:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpecifier:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_specifierProvider_dataclassSwitchStateDidChange_withSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierProvider:dataclassSwitchStateDidChange:withSpecifier:");
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return _[a1 specifiers];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return _[a1 target];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return _[a1 viewControllers];
}