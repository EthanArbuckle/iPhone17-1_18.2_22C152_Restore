uint64_t sub_100005D9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t result;
  void v5[2];

  sub_10000A460();
  __chkstk_darwin();
  sub_10000A3B0();
  __chkstk_darwin();
  v0 = sub_10000A470();
  v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009994(0, &qword_100010400);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v0);
  sub_10000A3A0();
  v5[1] = &_swiftEmptyArrayStorage;
  sub_100007FD4(&qword_100010408, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100008A64(&qword_100010410);
  sub_1000099D0();
  sub_10000A4B0();
  result = sub_10000A490();
  qword_100010F00 = result;
  return result;
}

uint64_t sub_100005FCC(uint64_t a1, uint64_t a2)
{
  v2[14] = a1;
  v2[15] = a2;
  uint64_t v3 = sub_10000A410();
  v2[16] = v3;
  v2[17] = *(void *)(v3 - 8);
  v2[18] = swift_task_alloc();
  uint64_t v4 = sub_10000A280();
  v2[19] = v4;
  v2[20] = *(void *)(v4 - 8);
  v2[21] = swift_task_alloc();
  v2[22] = swift_task_alloc();
  v2[23] = swift_task_alloc();
  v2[24] = swift_task_alloc();
  uint64_t v5 = sub_10000A170();
  v2[25] = v5;
  v2[26] = *(void *)(v5 - 8);
  v2[27] = swift_task_alloc();
  v2[28] = swift_task_alloc();
  uint64_t v6 = sub_10000A100();
  v2[29] = v6;
  v2[30] = *(void *)(v6 - 8);
  uint64_t v7 = swift_task_alloc();
  v2[31] = v7;
  v8 = (void *)swift_task_alloc();
  v2[32] = v8;
  void *v8 = v2;
  v8[1] = sub_100006218;
  return ThumbnailRequest.fileURL.getter(v7);
}

uint64_t sub_100006218()
{
  *(void *)(*(void *)v1 + 264) = v0;
  swift_task_dealloc();
  if (v0) {
    v2 = sub_100006BC0;
  }
  else {
    v2 = sub_10000632C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000632C()
{
  v83 = v0;
  uint64_t v1 = (id *)(v0 + 10);
  if (qword_1000104D0 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[33];
  uint64_t v3 = v0[31];
  uint64_t v4 = v0[15];
  uint64_t v5 = (void *)qword_100010F00;
  uint64_t v6 = swift_task_alloc();
  *(void *)(v6 + 16) = v3;
  *(void *)(v6 + 24) = v4;
  sub_100009994(0, &qword_1000103A8);
  id v7 = v5;
  sub_10000A480();

  swift_task_dealloc();
  if (v2) {
    goto LABEL_4;
  }
  id v13 = *v1;
  id v14 = [*v1 embeddedThumbnail];
  if (v14)
  {
    v15 = v14;
    uint64_t v16 = sub_10000A110();
    unint64_t v18 = v17;

    id v19 = [v13 embeddedThumbnailType];
    if (v19)
    {
      v20 = v19;
      uint64_t v21 = v0[27];
      uint64_t v22 = v0[26];
      uint64_t v75 = v0[25];
      uint64_t v77 = v0[28];
      uint64_t v24 = v0[23];
      uint64_t v23 = v0[24];
      id v78 = v13;
      uint64_t v25 = v0[19];
      uint64_t v26 = v0[20];
      sub_10000A240();

      (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 32))(v23, v24, v25);
      sub_10000A160();
      sub_100008A0C(v16, v18);
      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v23, v25);
      v27 = v78;
      v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32);
      v28(v77, v21, v75);
LABEL_24:
      uint64_t v63 = v0[30];
      uint64_t v64 = v0[31];
      uint64_t v65 = v0[28];
      uint64_t v66 = v0[29];
      uint64_t v67 = v0[25];
      uint64_t v68 = v0[14];
      [v27 multipage];
      sub_10000A140();

      (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v64, v66);
      v28(v68, v65, v67);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      v29 = (uint64_t (*)(void))v0[1];
      goto LABEL_25;
    }
    sub_100008A0C(v16, v18);
  }
  uint64_t v30 = v0[17];
  uint64_t v31 = v0[18];
  uint64_t v32 = v0[16];
  id v33 = [v13 htmlContent];
  sub_10000A3E0();

  sub_10000A400();
  uint64_t v34 = sub_10000A3F0();
  unint64_t v36 = v35;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v31, v32);
  if (v36 >> 60 != 15)
  {
    uint64_t v37 = v0[27];
    uint64_t v79 = v0[28];
    uint64_t v38 = v0[26];
    v39 = v13;
    uint64_t v40 = v0[22];
    uint64_t v72 = v0[25];
    uint64_t v74 = v0[21];
    uint64_t v41 = v0[20];
    uint64_t v71 = v0[19];
    sub_10000A250();
    unint64_t v42 = v36;
    id v43 = [v39 attachments];
    sub_100009994(0, &qword_1000103C8);
    sub_10000A3C0();

    uint64_t v69 = v34;
    unint64_t v70 = v42;
    sub_10000A160();
    swift_bridgeObjectRelease();
    v44 = *(void (**)(uint64_t, uint64_t))(v41 + 8);
    v44(v40, v71);
    uint64_t v45 = v72;
    v73 = *(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 32);
    v73(v79, v37, v45);
    v80 = v39;
    [v39 size];
    double v47 = v46;
    double v49 = v48;
    sub_10000A180();
    sub_10000A210();
    LOBYTE(v38) = sub_10000A270();
    v44(v74, v71);
    v44(v40, v71);
    if (v38)
    {
      double v50 = v47 * 1.33333333;
      if (v47 * 1.33333333 >= v49) {
        double v50 = v49;
      }
      if (v49 * 1.33333333 < v47) {
        double v47 = v49 * 1.33333333;
      }
      else {
        double v49 = v50;
      }
    }
    uint64_t v52 = v0[21];
    uint64_t v51 = v0[22];
    uint64_t v76 = v0[19];
    uint64_t v53 = sub_10000A3E0();
    uint64_t v55 = v54;
    v85.width = v47;
    v85.height = v49;
    CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v85);
    v82 = (void *)sub_100009994(0, &qword_1000103D0);
    *(void *)v81 = DictionaryRepresentation;
    v57 = (void (*)(void *, void))sub_10000A150();
    sub_1000071B0((uint64_t)v81, v53, v55);
    v57(v0 + 2, 0);
    sub_10000A180();
    sub_10000A220();
    char v58 = sub_10000A270();
    v44(v52, v76);
    v44(v51, v76);
    if (v58)
    {
      uint64_t v59 = sub_10000A3E0();
      uint64_t v61 = v60;
      v82 = &type metadata for String;
      strcpy(v81, "/html/body/div");
      v81[15] = -18;
      v62 = (void (*)(void *, void))sub_10000A150();
      sub_1000071B0((uint64_t)v81, v59, v61);
      v62(v0 + 6, 0);
    }
    sub_1000089F8(v69, v70);
    v27 = v80;
    v28 = v73;
    goto LABEL_24;
  }
  type metadata accessor for QLThumbnailError(0);
  v0[13] = 0;
  sub_1000088B8((uint64_t)&_swiftEmptyArrayStorage);
  sub_100007FD4(&qword_1000103C0, type metadata accessor for QLThumbnailError);
  sub_10000A0D0();
  swift_willThrow();

LABEL_4:
  type metadata accessor for Code(0);
  v0[11] = 1;
  swift_errorRetain();
  sub_100007FD4(&qword_1000103B0, type metadata accessor for Code);
  char v8 = sub_10000A060();
  swift_errorRelease();
  if (v8)
  {
    swift_errorRelease();
    v9 = (void *)swift_task_alloc();
    v0[34] = v9;
    void *v9 = v0;
    v9[1] = sub_100006C84;
    uint64_t v10 = v0[14];
    uint64_t v11 = v0[15];
    return sub_100007288(v10, v11);
  }
  (*(void (**)(void, void))(v0[30] + 8))(v0[31], v0[29]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v29 = (uint64_t (*)(void))v0[1];
LABEL_25:
  return v29();
}

uint64_t sub_100006BC0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100006C84()
{
  *(void *)(*(void *)v1 + 280) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100006E74;
  }
  else {
    uint64_t v2 = sub_100006D98;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100006D98()
{
  (*(void (**)(void, void))(v0[30] + 8))(v0[31], v0[29]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_100006E74()
{
  (*(void (**)(void, void))(v0[30] + 8))(v0[31], v0[29]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

id sub_100006F50@<X0>(void *a1@<X8>)
{
  id v19 = a1;
  uint64_t v21 = sub_10000A1B0();
  uint64_t v1 = *(void *)(v21 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000A280();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  id v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v20 = self;
  sub_10000A0F0(v8);
  uint64_t v10 = v9;
  sub_10000A180();
  Class isa = sub_10000A230().super.isa;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_10000A1D0();
  sub_10000A190();
  double v13 = v12;
  double v15 = v14;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v21);
  id v22 = 0;
  id v16 = objc_msgSend(v20, "parseFile:contentType:requestedSize:error:", v10, isa, &v22, v13, v15);

  id result = v22;
  if (v16)
  {
    *id v19 = v16;
  }
  else
  {
    unint64_t v18 = result;
    sub_10000A0E0();

    return (id)swift_willThrow();
  }
  return result;
}

uint64_t sub_1000071B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_100008D08((_OWORD *)a1, v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_100009274(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1000098E0(a1, &qword_1000103D8);
    sub_100008BF0(a2, a3, v9);
    swift_bridgeObjectRelease();
    return sub_1000098E0((uint64_t)v9, &qword_1000103D8);
  }
}

uint64_t sub_100007288(uint64_t a1, uint64_t a2)
{
  v2[6] = a1;
  v2[7] = a2;
  uint64_t v3 = sub_10000A1B0();
  v2[8] = v3;
  v2[9] = *(void *)(v3 - 8);
  v2[10] = swift_task_alloc();
  uint64_t v4 = sub_10000A280();
  v2[11] = v4;
  v2[12] = *(void *)(v4 - 8);
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  sub_10000A450();
  v2[15] = sub_10000A440();
  uint64_t v6 = sub_10000A430();
  return _swift_task_switch(sub_1000073E8, v6, v5);
}

uint64_t sub_1000073E8()
{
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v3 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v4 = *(void *)(v0 + 80);
  uint64_t v5 = *(void *)(v0 + 88);
  uint64_t v6 = *(void *)(v0 + 72);
  uint64_t v14 = *(void *)(v0 + 64);
  swift_release();
  sub_10000A180();
  sub_10000A220();
  char v7 = sub_10000A270();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v8(v2, v5);
  v8(v1, v5);
  double v9 = 1280.0;
  if ((v7 & 1) == 0) {
    double v9 = 3.0;
  }
  double v10 = 720.0;
  if ((v7 & 1) == 0) {
    double v10 = 4.0;
  }
  *(void *)(v0 + 16) = sub_100007638;
  *(void *)(v0 + 24) = 0;
  *(double *)(v0 + 32) = v9 / v10;
  *(_WORD *)(v0 + 40) = 0;
  sub_100008A64(&qword_1000103F0);
  swift_allocObject();
  sub_10000A2E0();
  sub_10000A1D0();
  sub_10000A190();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v11(v4, v14);
  sub_10000A2B0();
  sub_10000A1D0();
  sub_10000A1A0();
  v11(v4, v14);
  sub_10000A2C0();
  sub_10000A2F0();
  swift_retain();
  sub_10000A130();
  swift_release_n();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  double v12 = *(uint64_t (**)(void))(v0 + 8);
  return v12();
}

uint64_t sub_100007638@<X0>(uint64_t a1@<X8>)
{
  uint64_t v21 = sub_10000A350();
  uint64_t v2 = *(void *)(v21 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)&KeyPath - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008A64(&qword_1000103F8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&KeyPath - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_10000A380();
  sub_10000A2A0();
  sub_10000A2A0();
  uint64_t v7 = sub_10000A330();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v19 = sub_10000A340();
  sub_1000098E0((uint64_t)v6, &qword_1000103F8);
  uint64_t KeyPath = swift_getKeyPath();
  sub_10000A2A0();
  sub_10000A2A0();
  sub_10000A390();
  sub_10000A290();
  uint64_t v8 = v22;
  char v9 = v23;
  uint64_t v10 = v24;
  char v11 = v25;
  uint64_t v12 = v26;
  uint64_t v13 = v27;
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for Color.RGBColorSpace.sRGB(_:), v21);
  uint64_t v14 = sub_10000A370();
  uint64_t v15 = sub_10000A360();
  uint64_t result = sub_10000A320();
  uint64_t v17 = KeyPath;
  *(void *)a1 = v20;
  *(void *)(a1 + 8) = v17;
  *(void *)(a1 + 16) = v19;
  *(void *)(a1 + 24) = v8;
  *(unsigned char *)(a1 + 32) = v9;
  *(void *)(a1 + 40) = v10;
  *(unsigned char *)(a1 + 48) = v11;
  *(void *)(a1 + 56) = v12;
  *(void *)(a1 + 64) = v13;
  *(void *)(a1 + 72) = v14;
  *(void *)(a1 + 80) = v15;
  *(unsigned char *)(a1 + 88) = result;
  return result;
}

uint64_t sub_1000078B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_10000A1F0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_10000791C(uint64_t a1)
{
  uint64_t v2 = sub_100007FD4(&qword_100010398, (void (*)(uint64_t))type metadata accessor for OfficeThumbnailExtension);

  return ThumbnailExtension.configuration.getter(a1, v2);
}

uint64_t sub_100007998()
{
  return CGImageSourceEnableRestrictedDecoding();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t type metadata accessor for OfficeThumbnailExtension()
{
  uint64_t result = qword_1000104D8;
  if (!qword_1000104D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100007B1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000A1F0();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_100007B88(uint64_t a1)
{
  uint64_t v2 = sub_10000A1F0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_100007BEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000A1F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_100007C50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000A1F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_100007CB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000A1F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_100007D18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000A1F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_100007D7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100007D90);
}

uint64_t sub_100007D90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000A1F0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_100007DFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100007E10);
}

uint64_t sub_100007E10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000A1F0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_100007E80()
{
  uint64_t result = sub_10000A1F0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_100007F0C()
{
  return sub_100007FD4(&qword_100010310, (void (*)(uint64_t))type metadata accessor for OfficeThumbnailExtension);
}

uint64_t sub_100007F54()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100007FD4(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_10000801C@<X0>(void *a1@<X8>)
{
  return sub_100006F50(a1);
}

void type metadata accessor for Code(uint64_t a1)
{
}

void type metadata accessor for QLThumbnailError(uint64_t a1)
{
}

uint64_t sub_100008060(uint64_t a1)
{
  uint64_t v2 = sub_100007FD4(&qword_100010440, type metadata accessor for QLThumbnailError);

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_1000080CC(uint64_t a1)
{
  uint64_t v2 = sub_100007FD4(&qword_100010440, type metadata accessor for QLThumbnailError);

  return Error<>._code.getter(a1, v2);
}

uint64_t sub_10000813C(uint64_t a1)
{
  uint64_t v2 = sub_100007FD4(&qword_1000103C0, type metadata accessor for QLThumbnailError);

  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

uint64_t sub_1000081A8@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

id sub_1000081B0()
{
  return *v0;
}

uint64_t sub_1000081B8()
{
  return sub_10000A3E0();
}

uint64_t sub_1000081C8(uint64_t a1)
{
  uint64_t v2 = sub_100007FD4(&qword_1000103C0, type metadata accessor for QLThumbnailError);

  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_100008234(uint64_t a1)
{
  uint64_t v2 = sub_100007FD4(&qword_1000103C0, type metadata accessor for QLThumbnailError);

  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_1000082A0(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100007FD4(&qword_1000103C0, type metadata accessor for QLThumbnailError);
  id v5 = a1;

  return _BridgedStoredNSError.init(_bridgedNSError:)(v5, a2, v4);
}

uint64_t sub_100008330(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007FD4(&qword_1000103C0, type metadata accessor for QLThumbnailError);

  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

uint64_t sub_1000083B0()
{
  return sub_10000A3E0();
}

uint64_t sub_1000083C0(uint64_t a1)
{
  uint64_t v2 = sub_100007FD4(&qword_100010480, type metadata accessor for OIError);

  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_10000842C(uint64_t a1)
{
  uint64_t v2 = sub_100007FD4(&qword_100010480, type metadata accessor for OIError);

  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_100008498(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100007FD4(&qword_100010480, type metadata accessor for OIError);
  id v5 = a1;

  return _BridgedStoredNSError.init(_bridgedNSError:)(v5, a2, v4);
}

uint64_t sub_100008528()
{
  id v1 = *v0;
  uint64_t v2 = sub_10000A4A0();

  return v2;
}

uint64_t sub_100008560(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007FD4(&qword_100010480, type metadata accessor for OIError);

  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_1000085DC()
{
  return sub_10000A560();
}

void *sub_10000863C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_10000864C(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_100008658(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_10000866C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100007FD4(&qword_1000103C0, type metadata accessor for QLThumbnailError);

  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

uint64_t sub_1000086F0(uint64_t a1)
{
  uint64_t v2 = sub_100007FD4(&qword_100010488, type metadata accessor for OIError);

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_10000875C(uint64_t a1)
{
  uint64_t v2 = sub_100007FD4(&qword_100010488, type metadata accessor for OIError);

  return Error<>._code.getter(a1, v2);
}

uint64_t sub_1000087C8(uint64_t a1)
{
  uint64_t v2 = sub_100007FD4(&qword_100010480, type metadata accessor for OIError);

  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

uint64_t sub_100008834(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100007FD4(&qword_100010480, type metadata accessor for OIError);

  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

unint64_t sub_1000088B8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100008A64(&qword_1000103E0);
  uint64_t v2 = sub_10000A4F0();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1000097D4(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100008D18(v15, v16, (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_100008AA8);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    char v11 = (uint64_t *)(v3[6] + 16 * result);
    *char v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_100008D08(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
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

uint64_t sub_1000089F8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100008A0C(a1, a2);
  }
  return a1;
}

uint64_t sub_100008A0C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_100008A64(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100008AA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_10000A500() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_10000A500() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_10000A500()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

double sub_100008BF0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_100008D18(a1, a2, (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000945C);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_100009540();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_100008D08((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_10000909C(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

_OWORD *sub_100008D08(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100008D18(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, Swift::Int))
{
  sub_10000A550();
  sub_10000A420();
  Swift::Int v5 = sub_10000A560();

  return a3(a1, a2, v5);
}

uint64_t sub_100008D9C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100008A64(&qword_1000103E0);
  uint64_t v6 = sub_10000A4E0();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      uint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      uint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_100008D08(v24, v35);
      }
      else
      {
        sub_100009778((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_10000A550();
      sub_10000A420();
      uint64_t result = sub_10000A560();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      void *v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_100008D08(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_10000909C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_10000A4C0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_10000A550();
        swift_bridgeObjectRetain();
        sub_10000A420();
        Swift::Int v10 = sub_10000A560();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(a2 + 48);
          int64_t v13 = (_OWORD *)(v12 + 16 * v3);
          unint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            *int64_t v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          unint64_t v16 = (_OWORD *)(v15 + 32 * v3);
          unint64_t v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 2))
          {
            long long v9 = v17[1];
            *unint64_t v16 = *v17;
            v16[1] = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    int64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *int64_t v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_100009274(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  Swift::Int v10 = (void *)*v4;
  unint64_t v12 = sub_100008D18(a2, a3, (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000945C);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_100009540();
      goto LABEL_7;
    }
    sub_100008D9C(v15, a4 & 1);
    uint64_t v21 = sub_100008D18(a2, a3, (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000945C);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      int64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_10000A510();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    sub_100009728((uint64_t)v19);
    return sub_100008D08(a1, v19);
  }
LABEL_13:
  sub_1000093F0(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_1000093F0(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  *unint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_100008D08(a4, (_OWORD *)(a5[7] + 32 * a1));
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

unint64_t sub_10000945C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10000A500() & 1) == 0)
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
      while (!v14 && (sub_10000A500() & 1) == 0);
    }
  }
  return v6;
}

void *sub_100009540()
{
  id v1 = v0;
  sub_100008A64(&qword_1000103E0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10000A4D0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *id v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
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
      goto LABEL_30;
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
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_100009778(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = v19;
    v21[1] = v18;
    sub_100008D08(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    id v1 = v25;
    goto LABEL_28;
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
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_100009728(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100009778(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000097D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008A64(&qword_1000103E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000983C()
{
  return sub_10000A2D0();
}

void sub_10000987C(void (*a1)(void))
{
  id v3 = (id)(*(uint64_t (**)(void))(v1 + 16))();
  a1();
}

uint64_t sub_1000098E0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100008A64(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000993C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000A300();
  *a1 = result;
  return result;
}

uint64_t sub_100009968()
{
  return sub_10000A310();
}

uint64_t sub_100009994(uint64_t a1, unint64_t *a2)
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

unint64_t sub_1000099D0()
{
  unint64_t result = qword_100010418;
  if (!qword_100010418)
  {
    sub_100009A2C(&qword_100010410);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010418);
  }
  return result;
}

uint64_t sub_100009A2C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100009A74()
{
  return sub_100007FD4(&qword_100010430, type metadata accessor for QLThumbnailError);
}

uint64_t sub_100009ABC()
{
  return sub_100007FD4(&qword_100010438, type metadata accessor for QLThumbnailError);
}

uint64_t sub_100009B04()
{
  return sub_100007FD4(&qword_100010440, type metadata accessor for QLThumbnailError);
}

uint64_t sub_100009B4C()
{
  return sub_100007FD4(&qword_100010448, type metadata accessor for QLThumbnailError);
}

uint64_t sub_100009B94()
{
  return sub_100007FD4(&qword_100010450, type metadata accessor for QLThumbnailError);
}

uint64_t sub_100009BDC()
{
  return sub_100007FD4(&qword_100010458, _s3__C4CodeOMa_0);
}

void _s3__C4CodeOMa_0(uint64_t a1)
{
}

uint64_t sub_100009C38()
{
  return sub_100007FD4(&qword_100010460, _s3__C4CodeOMa_0);
}

unint64_t sub_100009C84()
{
  unint64_t result = qword_100010468;
  if (!qword_100010468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010468);
  }
  return result;
}

uint64_t sub_100009CD8()
{
  return sub_100007FD4(&qword_100010470, _s3__C4CodeOMa_0);
}

uint64_t sub_100009D20()
{
  return sub_100007FD4(&qword_1000103C0, type metadata accessor for QLThumbnailError);
}

uint64_t sub_100009D68()
{
  return sub_100007FD4(&qword_100010478, type metadata accessor for Code);
}

uint64_t sub_100009DB0()
{
  return sub_100007FD4(&qword_100010480, type metadata accessor for OIError);
}

void type metadata accessor for OIError(uint64_t a1)
{
}

void sub_100009E0C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100009E54()
{
  return sub_100007FD4(&qword_100010488, type metadata accessor for OIError);
}

uint64_t sub_100009E9C()
{
  return sub_100007FD4(&qword_100010490, type metadata accessor for OIError);
}

uint64_t sub_100009EE4()
{
  return sub_100007FD4(&qword_100010498, type metadata accessor for OIError);
}

uint64_t sub_100009F2C()
{
  return sub_100007FD4(&qword_1000103B0, type metadata accessor for Code);
}

uint64_t sub_100009F74()
{
  return sub_100007FD4(&qword_1000104A0, type metadata accessor for Code);
}

uint64_t sub_100009FBC()
{
  return sub_100007FD4(&qword_1000104A8, type metadata accessor for OIError);
}

uint64_t sub_10000A004()
{
  return sub_100007FD4(&qword_1000104B0, type metadata accessor for OIError);
}

uint64_t sub_10000A060()
{
  return static _ErrorCodeProtocol.~= infix(_:_:)();
}

uint64_t sub_10000A0D0()
{
  return _BridgedStoredNSError.init(_:userInfo:)();
}

uint64_t sub_10000A0E0()
{
  return _convertNSErrorToError(_:)();
}

void sub_10000A0F0(NSURL *retstr@<X8>)
{
}

uint64_t sub_10000A100()
{
  return type metadata accessor for URL();
}

uint64_t sub_10000A110()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000A120()
{
  return static AppExtension.main()();
}

uint64_t sub_10000A130()
{
  return static ThumbnailReply.imageRenderer(_:)();
}

uint64_t sub_10000A140()
{
  return ThumbnailReply.inlinePreviewMode.setter();
}

uint64_t sub_10000A150()
{
  return ThumbnailReply.additionalProperties.modify();
}

uint64_t sub_10000A160()
{
  return static ThumbnailReply.data(_:contentType:attachments:)();
}

uint64_t sub_10000A170()
{
  return type metadata accessor for ThumbnailReply();
}

uint64_t sub_10000A180()
{
  return ThumbnailRequest.contentType.getter();
}

uint64_t sub_10000A190()
{
  return ThumbnailRequest.Options.maximumSize.getter();
}

uint64_t sub_10000A1A0()
{
  return ThumbnailRequest.Options.scale.getter();
}

uint64_t sub_10000A1B0()
{
  return type metadata accessor for ThumbnailRequest.Options();
}

uint64_t sub_10000A1D0()
{
  return ThumbnailRequest.options.getter();
}

uint64_t sub_10000A1E0()
{
  return ThumbnailProvider.init(contentType:generator:)();
}

uint64_t sub_10000A1F0()
{
  return type metadata accessor for ThumbnailProvider();
}

uint64_t sub_10000A210()
{
  return static UTType.spreadsheet.getter();
}

uint64_t sub_10000A220()
{
  return static UTType.presentation.getter();
}

UTType sub_10000A230()
{
  return UTType._bridgeToObjectiveC()();
}

uint64_t sub_10000A240()
{
  return static UTType._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000A250()
{
  return static UTType.html.getter();
}

uint64_t sub_10000A260()
{
  return static UTType.item.getter();
}

uint64_t sub_10000A270()
{
  return UTType.conforms(to:)();
}

uint64_t sub_10000A280()
{
  return type metadata accessor for UTType();
}

uint64_t sub_10000A290()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_10000A2A0()
{
  return GeometryProxy.size.getter();
}

uint64_t sub_10000A2B0()
{
  return ImageRenderer.proposedSize.setter();
}

uint64_t sub_10000A2C0()
{
  return ImageRenderer.scale.setter();
}

uint64_t sub_10000A2D0()
{
  return ImageRenderer.render(rasterizationScale:renderer:)();
}

uint64_t sub_10000A2E0()
{
  return ImageRenderer.init(content:)();
}

uint64_t sub_10000A2F0()
{
  return ImageRenderer.isOpaque.setter();
}

uint64_t sub_10000A300()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_10000A310()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_10000A320()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_10000A330()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_10000A340()
{
  return static Font.system(size:weight:design:)();
}

uint64_t sub_10000A350()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t sub_10000A360()
{
  return static Color.white.getter();
}

uint64_t sub_10000A370()
{
  return Color.init(_:white:opacity:)();
}

uint64_t sub_10000A380()
{
  return Image.init(_internalSystemName:)();
}

uint64_t sub_10000A390()
{
  return static Alignment.center.getter();
}

uint64_t sub_10000A3A0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_10000A3B0()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_10000A3C0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000A3D0()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_10000A3E0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000A3F0()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t sub_10000A400()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_10000A410()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_10000A420()
{
  return String.hash(into:)();
}

uint64_t sub_10000A430()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10000A440()
{
  return static MainActor.shared.getter();
}

uint64_t sub_10000A450()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_10000A460()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_10000A470()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_10000A480()
{
  return OS_dispatch_queue.sync<A>(execute:)();
}

uint64_t sub_10000A490()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_10000A4A0()
{
  return NSObject.hashValue.getter();
}

uint64_t sub_10000A4B0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_10000A4C0()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_10000A4D0()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_10000A4E0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_10000A4F0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10000A500()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10000A510()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10000A540()
{
  return Error._userInfo.getter();
}

uint64_t sub_10000A550()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_10000A560()
{
  return Hasher._finalize()();
}

void CFRelease(CFTypeRef cf)
{
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCopyPropertiesAtIndex(isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithData(data, options);
}

uint64_t CGImageSourceDisableCaching()
{
  return _CGImageSourceDisableCaching();
}

uint64_t CGImageSourceDisableHardwareDecoding()
{
  return _CGImageSourceDisableHardwareDecoding();
}

uint64_t CGImageSourceDisableMetadataParsing()
{
  return _CGImageSourceDisableMetadataParsing();
}

uint64_t CGImageSourceDisableRAWDecoding()
{
  return _CGImageSourceDisableRAWDecoding();
}

uint64_t CGImageSourceEnableRestrictedDecoding()
{
  return _CGImageSourceEnableRestrictedDecoding();
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return _CGImageSourceGetCount(isrc);
}

CFDictionaryRef CGSizeCreateDictionaryRepresentation(CGSize size)
{
  return _CGSizeCreateDictionaryRepresentation(size);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t OICopyHTMLThumbnailFromFileAtURL()
{
  return _OICopyHTMLThumbnailFromFileAtURL();
}

uint64_t OICopyPrecomputedThumbnailDataFromFileAtURLIfPresent()
{
  return _OICopyPrecomputedThumbnailDataFromFileAtURLIfPresent();
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

id objc_retainAutorelease(id a1)
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

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
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

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_embeddedThumbnail(void *a1, const char *a2, ...)
{
  return _[a1 embeddedThumbnail];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_initWithData_contentType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:contentType:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _[a1 pathExtension];
}

id objc_msgSend_setAttachments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttachments:");
}

id objc_msgSend_setEmbeddedThumbnail_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEmbeddedThumbnail:");
}

id objc_msgSend_setEmbeddedThumbnailType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEmbeddedThumbnailType:");
}

id objc_msgSend_setHtmlContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHtmlContent:");
}

id objc_msgSend_setMultipage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMultipage:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSize:");
}

id objc_msgSend_typeWithFilenameExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "typeWithFilenameExtension:");
}

id objc_msgSend_typeWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "typeWithIdentifier:");
}