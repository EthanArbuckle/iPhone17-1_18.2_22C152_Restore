BOOL sub_100005830(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100005848()
{
  Swift::UInt v1 = *v0;
  sub_10000DED0();
  sub_10000DEE0(v1);
  return sub_10000DEF0();
}

void sub_100005890()
{
  sub_10000DEE0(*v0);
}

Swift::Int sub_1000058BC()
{
  Swift::UInt v1 = *v0;
  sub_10000DED0();
  sub_10000DEE0(v1);
  return sub_10000DEF0();
}

uint64_t sub_10000590C(uint64_t a1)
{
  unint64_t v2 = sub_10000C9C4();

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100005948(uint64_t a1)
{
  unint64_t v2 = sub_10000C9C4();

  return Error<>._code.getter(a1, v2);
}

uint64_t sub_10000598C(uint64_t a1, uint64_t a2)
{
  v2[10] = a1;
  v2[11] = a2;
  v2[12] = sub_10000A090(&qword_100014440);
  v2[13] = swift_task_alloc();
  uint64_t v3 = sub_10000D9A0();
  v2[14] = v3;
  v2[15] = *(void *)(v3 - 8);
  v2[16] = swift_task_alloc();
  v2[17] = sub_10000A090(&qword_100014448);
  v2[18] = swift_task_alloc();
  uint64_t v4 = sub_10000DA50();
  v2[19] = v4;
  v2[20] = *(void *)(v4 - 8);
  v2[21] = swift_task_alloc();
  uint64_t v5 = sub_10000D810();
  v2[22] = v5;
  v2[23] = *(void *)(v5 - 8);
  v2[24] = swift_task_alloc();
  v2[25] = swift_task_alloc();
  v2[26] = swift_task_alloc();
  sub_10000A090(&qword_100014450);
  v2[27] = swift_task_alloc();
  v2[28] = swift_task_alloc();
  v2[29] = swift_task_alloc();
  v2[30] = type metadata accessor for TodoView(0);
  v2[31] = swift_task_alloc();
  uint64_t v6 = sub_10000D850();
  v2[32] = v6;
  v2[33] = *(void *)(v6 - 8);
  uint64_t v7 = swift_task_alloc();
  v2[34] = v7;
  v2[35] = sub_10000DE60();
  v2[36] = sub_10000DE50();
  v8 = (void *)swift_task_alloc();
  v2[37] = v8;
  void *v8 = v2;
  v8[1] = sub_100005CC4;
  return ThumbnailRequest.fileURL.getter(v7);
}

uint64_t sub_100005CC4()
{
  *(void *)(*(void *)v1 + 304) = v0;
  swift_task_dealloc();
  uint64_t v3 = sub_10000DE40();
  if (v0) {
    uint64_t v4 = sub_1000065F8;
  }
  else {
    uint64_t v4 = sub_100005E20;
  }
  return _swift_task_switch(v4, v3, v2);
}

uint64_t sub_100005E20()
{
  swift_release();
  id v1 = objc_allocWithZone((Class)QLIcalParser);
  sub_10000D840(v2);
  uint64_t v4 = v3;
  id v5 = [v1 initWithURL:v3];

  if (!v5)
  {
    uint64_t v10 = v0[33];
    uint64_t v9 = v0[34];
    uint64_t v11 = v0[32];
    sub_10000A12C();
    swift_allocError();
    unsigned char *v12 = 0;
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    goto LABEL_15;
  }
  if (([v5 isTodo] & 1) == 0)
  {
    id v13 = [v5 startDate];
    uint64_t v14 = v0[28];
    if (v13)
    {
      v15 = v13;
      uint64_t v16 = v0[25];
      id v67 = v5;
      uint64_t v17 = v0[22];
      uint64_t v18 = v0[23];
      sub_10000D7E0();

      v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 32);
      v19(v14, v16, v17);
      v20 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56);
      v20(v14, 0, 1, v17);
      int v21 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(v14, 1, v17);
      id v5 = v67;
      if (v21 != 1)
      {
        uint64_t v22 = v0[26];
        uint64_t v24 = v0[23];
        uint64_t v23 = v0[24];
        uint64_t v25 = v0[22];
        v19(v22, v0[28], v25);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v23, v22, v25);
        id v26 = [v67 endDate];
        if (v26)
        {
          v27 = v26;
          sub_10000D7E0();

          uint64_t v28 = 0;
        }
        else
        {
          uint64_t v28 = 1;
        }
        v20(v0[27], v28, 1, v0[22]);
        id v43 = [v67 summary];
        if (v43)
        {
          v44 = v43;
          uint64_t v45 = sub_10000DE20();
          uint64_t v47 = v46;
        }
        else
        {
          uint64_t v45 = 0;
          uint64_t v47 = 0;
        }
        uint64_t v48 = v0[26];
        uint64_t v49 = v0[23];
        uint64_t v50 = v0[22];
        sub_10000A34C(v0[24], v0[27], v45, v47, (int)[v67 fullDay], v0 + 2);
        sub_10000B83C();
        uint64_t v68 = sub_10000DD90();
        (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v48, v50);
        goto LABEL_23;
      }
    }
    else
    {
      (*(void (**)(void, uint64_t, uint64_t, void))(v0[23] + 56))(v0[28], 1, 1, v0[22]);
    }
    uint64_t v35 = v0[33];
    uint64_t v36 = v0[34];
    uint64_t v37 = v0[32];
    sub_10000D324(v0[28], &qword_100014450);
    sub_10000A12C();
    swift_allocError();
    unsigned char *v38 = 1;
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v36, v37);
LABEL_15:
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
    swift_task_dealloc();
    v39 = (uint64_t (*)(void))v0[1];
    goto LABEL_26;
  }
  id v6 = [v5 dueDate];
  if (v6)
  {
    uint64_t v7 = v6;
    sub_10000D7E0();

    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 1;
  }
  (*(void (**)(void, uint64_t, uint64_t, void))(v0[23] + 56))(v0[29], v8, 1, v0[22]);
  unsigned __int8 v29 = [v5 isDone];
  id v30 = [v5 summary];
  if (v30)
  {
    v31 = v30;
    uint64_t v32 = sub_10000DE20();
    uint64_t v34 = v33;
  }
  else
  {
    uint64_t v32 = 0;
    uint64_t v34 = 0;
  }
  id v67 = v5;
  uint64_t v41 = v0[30];
  uint64_t v40 = v0[31];
  sub_10000D144(v0[29], v40, &qword_100014450);
  *(unsigned char *)(v40 + *(int *)(v41 + 20)) = v29;
  v42 = (uint64_t *)(v40 + *(int *)(v41 + 24));
  uint64_t *v42 = v32;
  v42[1] = v34;
  sub_10000A048(&qword_100014470, (void (*)(uint64_t))type metadata accessor for TodoView);
  uint64_t v68 = sub_10000DD90();
LABEL_23:
  uint64_t v51 = v0[20];
  uint64_t v52 = v0[21];
  uint64_t v53 = v0[19];
  uint64_t v54 = v0[16];
  uint64_t v65 = v0[17];
  v66 = (uint64_t *)v0[18];
  uint64_t v55 = v0[15];
  v56 = (uint64_t *)v0[13];
  uint64_t v63 = v0[12];
  uint64_t v64 = v0[14];
  sub_10000DA70();
  sub_10000DA30();
  v57 = *(void (**)(uint64_t, uint64_t))(v51 + 8);
  v57(v52, v53);
  sub_10000DA70();
  sub_10000DA40();
  v57(v52, v53);
  uint64_t KeyPath = swift_getKeyPath();
  swift_retain();
  sub_10000D990();
  (*(void (**)(char *, uint64_t, uint64_t))(v55 + 16))((char *)v56 + *(int *)(v63 + 28), v54, v64);
  uint64_t *v56 = KeyPath;
  sub_10000D1A8((uint64_t)v56, (uint64_t)v66 + *(int *)(v65 + 36), &qword_100014440);
  uint64_t *v66 = v68;
  swift_retain();
  sub_10000D324((uint64_t)v56, &qword_100014440);
  (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v54, v64);
  swift_release();
  sub_10000A090(&qword_100014468);
  swift_allocObject();
  sub_10000DB30();
  sub_10000DB10();
  sub_10000DB40();
  swift_retain();
  sub_10000DA20();
  swift_release();
  if ([v67 isTodo])
  {
    sub_10000DA10();
    sub_10000DA00();
  }
  uint64_t v60 = v0[33];
  uint64_t v59 = v0[34];
  uint64_t v61 = v0[32];

  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v59, v61);
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
  swift_task_dealloc();
  v39 = (uint64_t (*)(void))v0[1];
LABEL_26:
  return v39();
}

uint64_t sub_1000065F8()
{
  swift_release();
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
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100006708()
{
  return sub_10000DBA0();
}

uint64_t sub_10000672C(uint64_t a1)
{
  uint64_t v2 = sub_10000D9A0();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_10000DBB0();
}

uint64_t sub_1000067F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_10000DA90();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_10000685C(uint64_t a1)
{
  uint64_t v2 = sub_10000A048(&qword_100014430, (void (*)(uint64_t))type metadata accessor for CalendarThumbnailExtension);

  return ThumbnailExtension.configuration.getter(a1, v2);
}

uint64_t sub_1000068D8()
{
  uint64_t v0 = sub_10000DAC0();
  __chkstk_darwin(v0 - 8);
  sub_10000DAB0();
  return sub_10000DA80();
}

void sub_10000696C()
{
  qword_100014B20 = 0x4079000000000000;
}

void sub_10000697C()
{
  qword_100014B28 = 0x4051800000000000;
}

void sub_100006990()
{
  qword_100014B30 = 0x4067E00000000000;
}

void sub_1000069A4()
{
  qword_100014B38 = 0x403F000000000000;
}

void sub_1000069B4()
{
  qword_100014B40 = 0x405CC00000000000;
}

void sub_1000069C8()
{
  qword_100014B48 = 0x4024000000000000;
}

uint64_t sub_1000069D8()
{
  uint64_t v0 = sub_10000DD40();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000A090(&qword_1000145C8);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10000E610;
  uint64_t v5 = enum case for Color.RGBColorSpace.sRGB(_:);
  uint64_t v6 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v6(v3, enum case for Color.RGBColorSpace.sRGB(_:), v0);
  *(void *)(v4 + 32) = sub_10000DD70();
  v6(v3, v5, v0);
  *(void *)(v4 + 40) = sub_10000DD70();
  uint64_t v9 = v4;
  uint64_t result = sub_10000DE30();
  qword_100014B50 = v9;
  return result;
}

uint64_t sub_100006B54@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_10000A090(&qword_100014560);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000DB00();
  if (qword_100014690 != -1) {
    swift_once();
  }
  *(void *)uint64_t v8 = sub_10000DC20();
  *((void *)v8 + 1) = 0;
  v8[16] = 0;
  uint64_t v9 = sub_10000A090(&qword_100014568);
  sub_100006CA4(a2, a1, (uint64_t)&v8[*(int *)(v9 + 44)]);
  uint64_t v10 = sub_10000DD60();
  char v11 = sub_10000DC50();
  sub_10000D1A8((uint64_t)v8, a3, &qword_100014560);
  uint64_t v12 = a3 + *(int *)(sub_10000A090(&qword_100014570) + 36);
  *(void *)uint64_t v12 = v10;
  *(unsigned char *)(v12 + 8) = v11;
  return sub_10000D324((uint64_t)v8, &qword_100014560);
}

uint64_t sub_100006CA4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)&long long v66 = a2;
  uint64_t v70 = a3;
  uint64_t v4 = sub_10000A090(&qword_100014578);
  __chkstk_darwin(v4 - 8);
  uint64_t v63 = (char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_10000A090(&qword_100014580) - 8;
  __chkstk_darwin(v58);
  v57 = (uint64_t *)((char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_10000A090(&qword_100014588);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_10000A090(&qword_100014590) - 8;
  __chkstk_darwin(v55);
  char v11 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_10000A090(&qword_100014598) - 8;
  __chkstk_darwin(v59);
  v56 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_10000A090(&qword_1000145A0);
  __chkstk_darwin(v60);
  uint64_t v61 = (uint64_t)&v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_10000A090(&qword_1000145A8);
  __chkstk_darwin(v62);
  uint64_t v65 = (uint64_t)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = sub_10000A090(&qword_1000145B0);
  uint64_t v15 = __chkstk_darwin(v64);
  uint64_t v68 = (uint64_t)&v54 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v67 = (uint64_t)&v54 - v17;
  uint64_t v69 = a1;
  uint64_t v18 = *a1;
  uint64_t v19 = a1[1];
  uint64_t v81 = v18;
  uint64_t v82 = v19;
  sub_10000CAC8();
  swift_bridgeObjectRetain();
  uint64_t v20 = sub_10000DD00();
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  char v26 = v25 & 1;
  uint64_t v27 = enum case for Text.Case.uppercase(_:);
  uint64_t v28 = sub_10000DCC0();
  uint64_t v29 = *(void *)(v28 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v29 + 104))(v9, v27, v28);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v9, 0, 1, v28);
  uint64_t KeyPath = swift_getKeyPath();
  v31 = v57;
  sub_10000D1A8((uint64_t)v9, (uint64_t)v57 + *(int *)(v58 + 36), &qword_100014588);
  uint64_t *v31 = KeyPath;
  sub_10000D1A8((uint64_t)v31, (uint64_t)&v11[*(int *)(v55 + 44)], &qword_100014580);
  *(void *)char v11 = v20;
  *((void *)v11 + 1) = v22;
  v11[16] = v26;
  *((void *)v11 + 3) = v24;
  sub_10000CB1C(v20, v22, v26);
  swift_bridgeObjectRetain();
  sub_10000D324((uint64_t)v31, &qword_100014580);
  sub_10000D324((uint64_t)v9, &qword_100014588);
  sub_10000CB2C(v20, v22, v26);
  uint64_t v32 = (uint64_t)v56;
  swift_bridgeObjectRelease();
  uint64_t v33 = sub_10000DD60();
  sub_10000D1A8((uint64_t)v11, v32, &qword_100014590);
  *(void *)(v32 + *(int *)(v59 + 44)) = v33;
  sub_10000D324((uint64_t)v11, &qword_100014590);
  if (qword_100014698 != -1) {
    swift_once();
  }
  sub_10000DC80();
  uint64_t v34 = sub_10000DC70();
  uint64_t v35 = (uint64_t)v63;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v63, 1, 1, v34);
  uint64_t v36 = sub_10000DCA0();
  sub_10000D324(v35, &qword_100014578);
  uint64_t v37 = swift_getKeyPath();
  uint64_t v38 = v61;
  sub_10000D1A8(v32, v61, &qword_100014598);
  v39 = (uint64_t *)(v38 + *(int *)(v60 + 36));
  uint64_t *v39 = v37;
  v39[1] = v36;
  sub_10000D324(v32, &qword_100014598);
  sub_10000DB00();
  if (qword_1000146B0 != -1) {
    swift_once();
  }
  sub_10000DDC0();
  sub_10000DAF0();
  uint64_t v40 = v65;
  sub_10000D1A8(v38, v65, &qword_1000145A0);
  uint64_t v41 = (_OWORD *)(v40 + *(int *)(v62 + 36));
  long long v42 = v72;
  *uint64_t v41 = v71;
  v41[1] = v42;
  v41[2] = v73;
  sub_10000D324(v38, &qword_1000145A0);
  if (qword_1000146C0 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_10000DDF0();
  sub_10000DE00();
  sub_10000DDB0();
  sub_10000DB50();
  uint64_t v43 = v74;
  long long v66 = v75;
  uint64_t v44 = v76;
  uint64_t v45 = v77;
  char v46 = sub_10000DC50();
  uint64_t v47 = v68;
  sub_10000D1A8(v40, v68, &qword_1000145A8);
  uint64_t v48 = v47 + *(int *)(v64 + 36);
  *(void *)uint64_t v48 = v43;
  *(_OWORD *)(v48 + 8) = v66;
  *(void *)(v48 + 24) = v44;
  *(void *)(v48 + 32) = v45;
  *(unsigned char *)(v48 + 40) = v46;
  sub_10000D324(v40, &qword_1000145A8);
  uint64_t v49 = v67;
  sub_10000D144(v47, v67, &qword_1000145B0);
  uint64_t v50 = sub_10000DC20();
  sub_1000074EC(v69, (uint64_t)v78);
  v79[304] = 0;
  memcpy(&v79[7], v78, 0x129uLL);
  sub_10000D1A8(v49, v47, &qword_1000145B0);
  uint64_t v51 = v70;
  sub_10000D1A8(v47, v70, &qword_1000145B0);
  uint64_t v52 = (void *)(v51 + *(int *)(sub_10000A090(&qword_1000145C0) + 48));
  v80[0] = v50;
  v80[1] = 0;
  LOBYTE(v80[2]) = 0;
  memcpy((char *)&v80[2] + 1, v79, 0x130uLL);
  memcpy(v52, v80, 0x141uLL);
  sub_10000CB3C((uint64_t)v80);
  sub_10000D324(v49, &qword_1000145B0);
  uint64_t v81 = v50;
  uint64_t v82 = 0;
  char v83 = 0;
  memcpy(v84, v79, sizeof(v84));
  sub_10000CC20((uint64_t)&v81);
  return sub_10000D324(v47, &qword_1000145B0);
}

uint64_t sub_1000074EC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10000DD40();
  uint64_t v71 = *(void *)(v4 - 8);
  uint64_t v72 = v4;
  __chkstk_darwin(v4);
  uint64_t v70 = &v65[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_10000A090(&qword_100014578);
  __chkstk_darwin(v6 - 8);
  uint64_t KeyPath = &v65[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v85 = sub_10000DC20();
  sub_100007C60((uint64_t)a1, &v129);
  uint64_t v87 = v130;
  int v86 = v131;
  uint64_t v88 = v133;
  uint64_t v89 = v129;
  if (qword_1000146A0 != -1) {
    swift_once();
  }
  sub_10000DDC0();
  sub_10000DAF0();
  uint64_t v82 = v93;
  uint64_t v83 = v91;
  int v76 = v92;
  int v77 = v94;
  uint64_t v80 = v96;
  uint64_t v81 = v95;
  uint64_t v84 = sub_10000DC20();
  uint64_t v8 = a1[5];
  uint64_t v129 = a1[4];
  uint64_t v130 = v8;
  sub_10000CAC8();
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_10000DD00();
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v14 = a1[7];
  char v16 = v15 & 1;
  uint64_t v129 = a1[6];
  uint64_t v130 = v14;
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_10000DD00();
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  LOBYTE(v129) = v16;
  char v23 = v22 & 1;
  LOBYTE(v107) = v16;
  LOBYTE(v127[0]) = v22 & 1;
  sub_10000CB1C(v9, v11, v16);
  swift_bridgeObjectRetain();
  sub_10000CB1C(v17, v19, v23);
  swift_bridgeObjectRetain();
  uint64_t v74 = v19;
  uint64_t v75 = v17;
  sub_10000CB2C(v17, v19, v23);
  uint64_t v73 = v21;
  swift_bridgeObjectRelease();
  uint64_t v78 = v11;
  uint64_t v79 = v9;
  sub_10000CB2C(v9, v11, v129);
  uint64_t v69 = v13;
  swift_bridgeObjectRelease();
  char v24 = v107;
  char v25 = v127[0];
  if (qword_1000146A8 != -1) {
    swift_once();
  }
  sub_10000DC90();
  uint64_t v26 = sub_10000DC70();
  uint64_t v27 = (uint64_t)KeyPath;
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(KeyPath, 1, 1, v26);
  uint64_t v68 = sub_10000DCA0();
  sub_10000D324(v27, &qword_100014578);
  uint64_t KeyPath = (unsigned char *)swift_getKeyPath();
  int v66 = sub_10000DC40();
  if (qword_1000146B8 != -1) {
    swift_once();
  }
  sub_10000DAD0();
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  char v104 = 1;
  char v102 = v24;
  char v100 = v25;
  char v97 = 0;
  (*(void (**)(unsigned char *, void, uint64_t))(v71 + 104))(v70, enum case for Color.RGBColorSpace.sRGB(_:), v72);
  uint64_t v36 = sub_10000DD80();
  char v37 = v104;
  char v38 = v102;
  char v39 = v100;
  char v40 = v97;
  uint64_t v41 = swift_getKeyPath();
  *(_DWORD *)(a2 + 284) = *(_DWORD *)&v120[3];
  *(_DWORD *)(a2 + 281) = *(_DWORD *)v120;
  *(_DWORD *)v152 = *(_DWORD *)v105;
  *(_DWORD *)&v132[3] = *(_DWORD *)&v103[3];
  *(_DWORD *)v132 = *(_DWORD *)v103;
  *(_DWORD *)v136 = *(_DWORD *)v101;
  *(_DWORD *)&v141[3] = *(_DWORD *)&v99[3];
  *(_DWORD *)v141 = *(_DWORD *)v99;
  *(_DWORD *)&v146[3] = *(_DWORD *)&v98[3];
  *(_DWORD *)v146 = *(_DWORD *)v98;
  *(_DWORD *)&v152[3] = *(_DWORD *)&v105[3];
  *(_DWORD *)((char *)&v108 + 1) = *(_DWORD *)v103;
  DWORD1(v108) = *(_DWORD *)&v103[3];
  HIDWORD(v109) = *(_DWORD *)&v101[3];
  *(_DWORD *)((char *)&v109 + 9) = *(_DWORD *)v101;
  HIDWORD(v111) = *(_DWORD *)&v99[3];
  *(_DWORD *)((char *)&v111 + 9) = *(_DWORD *)v99;
  HIDWORD(v113) = *(_DWORD *)&v98[3];
  *(_DWORD *)((char *)&v113 + 9) = *(_DWORD *)v98;
  DWORD1(v116) = *(_DWORD *)&v105[3];
  *(_DWORD *)((char *)&v116 + 1) = *(_DWORD *)v105;
  char v124 = v76;
  *((void *)&v107 + 1) = 0;
  LOBYTE(v108) = v37;
  uint64_t v43 = v78;
  uint64_t v42 = v79;
  *((void *)&v108 + 1) = v79;
  *(void *)&long long v109 = v78;
  BYTE8(v109) = v38;
  uint64_t v45 = v68;
  uint64_t v44 = v69;
  uint64_t v47 = v74;
  uint64_t v46 = v75;
  *(void *)&long long v110 = v69;
  *((void *)&v110 + 1) = v75;
  *(void *)&long long v111 = v74;
  BYTE8(v111) = v39;
  uint64_t v48 = v73;
  uint64_t v49 = KeyPath;
  *(void *)&long long v112 = v73;
  *((void *)&v112 + 1) = KeyPath;
  *(void *)&long long v113 = v68;
  char v50 = v66;
  BYTE8(v113) = v66;
  *(void *)&long long v114 = v29;
  *((void *)&v114 + 1) = v31;
  *(void *)&long long v115 = v33;
  *((void *)&v115 + 1) = v35;
  LOBYTE(v116) = v40;
  *((void *)&v116 + 1) = v36;
  *(void *)&long long v117 = v41;
  *((void *)&v117 + 1) = 1;
  char v122 = v77;
  long long v51 = v116;
  *(_OWORD *)(a2 + 264) = v117;
  *(_DWORD *)(a2 + 17) = v127[0];
  *(_DWORD *)(a2 + 20) = *(_DWORD *)((char *)v127 + 3);
  *(_DWORD *)(a2 + 41) = *(_DWORD *)v125;
  *(_DWORD *)(a2 + 44) = *(_DWORD *)&v125[3];
  *(_DWORD *)(a2 + 65) = *(_DWORD *)v123;
  *(_DWORD *)(a2 + 68) = *(_DWORD *)&v123[3];
  *(_DWORD *)(a2 + 84) = *(_DWORD *)&v121[3];
  long long v53 = v114;
  long long v52 = v115;
  long long v54 = v109;
  long long v55 = v110;
  long long v56 = v111;
  long long v57 = v112;
  long long v58 = v113;
  *(_DWORD *)(a2 + 81) = *(_DWORD *)v121;
  char v128 = 1;
  char v59 = v86;
  char v126 = v86;
  *(void *)a2 = v85;
  *(unsigned char *)(a2 + 16) = 1;
  *(unsigned char *)(a2 + 40) = v59;
  *(void *)(a2 + 56) = v83;
  *(unsigned char *)(a2 + 64) = v124;
  *(void *)(a2 + 72) = v82;
  *(unsigned char *)(a2 + 80) = v122;
  *(void *)(a2 + 88) = v81;
  char v119 = 1;
  *(void *)(a2 + 96) = v80;
  *(unsigned char *)(a2 + 296) = 1;
  uint64_t v60 = v84;
  *(void *)&long long v107 = v84;
  uint64_t v61 = v89;
  *(void *)(a2 + 48) = v88;
  *(_OWORD *)(a2 + 248) = v51;
  *(_OWORD *)(a2 + 232) = v52;
  *(_OWORD *)(a2 + 152) = v55;
  *(_OWORD *)(a2 + 136) = v54;
  long long v62 = v107;
  *(_OWORD *)(a2 + 120) = v108;
  *(_OWORD *)(a2 + 104) = v62;
  *(unsigned char *)(a2 + 280) = 0;
  *(_OWORD *)(a2 + 216) = v53;
  *(_OWORD *)(a2 + 200) = v58;
  *(_OWORD *)(a2 + 184) = v57;
  *(_OWORD *)(a2 + 168) = v56;
  *(void *)(a2 + 8) = 0;
  uint64_t v63 = v87;
  *(void *)(a2 + 24) = v61;
  *(void *)(a2 + 32) = v63;
  *(void *)(a2 + 288) = 0;
  unsigned __int8 v131 = v37;
  uint64_t v133 = v42;
  uint64_t v134 = v43;
  char v135 = v38;
  *(_DWORD *)&v136[3] = *(_DWORD *)&v101[3];
  uint64_t v137 = v44;
  uint64_t v138 = v46;
  uint64_t v139 = v47;
  char v140 = v39;
  uint64_t v142 = v48;
  v143 = v49;
  uint64_t v144 = v45;
  char v145 = v50;
  char v151 = v40;
  uint64_t v153 = v36;
  uint64_t v154 = v41;
  uint64_t v155 = 1;
  uint64_t v129 = v60;
  char v106 = 0;
  char v90 = v59;
  char v118 = 0;
  uint64_t v130 = 0;
  uint64_t v147 = v29;
  uint64_t v148 = v31;
  uint64_t v149 = v33;
  uint64_t v150 = v35;
  char v156 = 0;
  sub_10000CB1C(v61, v63, v59);
  swift_bridgeObjectRetain();
  sub_10000CD08((uint64_t)&v107);
  sub_10000CDB4((uint64_t)&v129);
  sub_10000CB2C(v61, v63, v90);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100007C60@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v33 = a2;
  uint64_t v3 = sub_10000A090(&qword_100014578);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000DD40();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  uint64_t v34 = v10;
  uint64_t v35 = v11;
  sub_10000CAC8();
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_10000DD00();
  uint64_t v14 = v13;
  char v16 = v15 & 1;
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for Color.RGBColorSpace.sRGB(_:), v6);
  uint64_t v34 = sub_10000DD80();
  uint64_t v17 = sub_10000DCB0();
  uint64_t v19 = v18;
  char v21 = v20;
  sub_10000CB2C(v12, v14, v16);
  swift_release();
  swift_bridgeObjectRelease();
  if (qword_1000146A0 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_10000DC70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v5, 1, 1, v22);
  sub_10000DCA0();
  sub_10000D324((uint64_t)v5, &qword_100014578);
  uint64_t v23 = sub_10000DCD0();
  uint64_t v25 = v24;
  char v27 = v26;
  uint64_t v29 = v28;
  swift_release();
  sub_10000CB2C(v17, v19, v21 & 1);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v31 = v33;
  *uint64_t v33 = v23;
  v31[1] = v25;
  *((unsigned char *)v31 + 16) = v27 & 1;
  v31[3] = v29;
  return result;
}

uint64_t sub_100007F58@<X0>(uint64_t a1@<X8>)
{
  long long v3 = v1[1];
  v9[0] = *v1;
  v9[1] = v3;
  long long v4 = v1[3];
  v9[2] = v1[2];
  v9[3] = v4;
  uint64_t v5 = (_OWORD *)swift_allocObject();
  long long v6 = v1[1];
  v5[1] = *v1;
  v5[2] = v6;
  long long v7 = v1[3];
  v5[3] = v1[2];
  v5[4] = v7;
  *(void *)a1 = sub_10000CA68;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = 0x3FF0000000000000;
  *(_WORD *)(a1 + 24) = 0;
  return sub_10000CA70((uint64_t)v9);
}

double sub_100007FDC@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10000DD40();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  long long v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for TodoView(0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8 - 8);
  sub_10000D080(v2, (uint64_t)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for TodoView);
  unint64_t v11 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = swift_allocObject();
  sub_10000CF9C((uint64_t)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v12 + v11);
  uint64_t v13 = sub_10000DD50();
  sub_10000A090(&qword_1000145C8);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_10000E610;
  *(void *)(v14 + 32) = sub_10000DD60();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for Color.RGBColorSpace.sRGB(_:), v4);
  *(void *)(v14 + 40) = sub_10000DD80();
  uint64_t v21 = v14;
  sub_10000DE30();
  sub_10000DDD0();
  sub_10000DDE0();
  sub_10000DDB0();
  sub_10000DB50();
  uint64_t v15 = v21;
  long long v20 = v22;
  uint64_t v16 = v23;
  uint64_t v17 = v24;
  char v18 = sub_10000DC50();
  *(void *)a1 = sub_10000D000;
  *(void *)(a1 + 8) = v12;
  *(void *)(a1 + 16) = v13;
  *(void *)(a1 + 24) = v15;
  double result = *(double *)&v20;
  *(_OWORD *)(a1 + 32) = v20;
  *(void *)(a1 + 48) = v16;
  *(void *)(a1 + 56) = v17;
  *(unsigned char *)(a1 + 64) = v18;
  *(void *)(a1 + 72) = 0x3FF0000000000000;
  *(_WORD *)(a1 + 80) = 0;
  return result;
}

uint64_t sub_10000826C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10000A090(&qword_1000145D0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (double *)((char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000DB00();
  double v8 = v7 / 400.0;
  *(void *)uint64_t v6 = sub_10000DC30();
  v6[1] = v8 * 20.0;
  *((unsigned char *)v6 + 16) = 0;
  uint64_t v9 = sub_10000A090(&qword_1000145D8);
  sub_1000083BC(a1, (uint64_t)v6 + *(int *)(v9 + 44));
  char v10 = sub_10000DC50();
  sub_10000DAD0();
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  sub_10000D1A8((uint64_t)v6, a2, &qword_1000145D0);
  uint64_t v19 = a2 + *(int *)(sub_10000A090(&qword_1000145E0) + 36);
  *(unsigned char *)uint64_t v19 = v10;
  *(void *)(v19 + 8) = v12;
  *(void *)(v19 + 16) = v14;
  *(void *)(v19 + 24) = v16;
  *(void *)(v19 + 32) = v18;
  *(unsigned char *)(v19 + 40) = 0;
  return sub_10000D324((uint64_t)v6, &qword_1000145D0);
}

uint64_t sub_1000083BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v121 = sub_10000DD40();
  double v118 = *(double *)(v121 - 8);
  __chkstk_darwin(v121);
  v101 = (char *)&v88 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10000DDA0();
  __chkstk_darwin(v5 - 8);
  long long v113 = (char *)&v88 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = sub_10000A090(&qword_1000145E8);
  __chkstk_darwin(v114);
  uint64_t v115 = (uint64_t)&v88 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = sub_10000A090(&qword_1000145F0);
  uint64_t v8 = __chkstk_darwin(v116);
  uint64_t v135 = (uint64_t)&v88 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v127 = (uint64_t)&v88 - v10;
  uint64_t v11 = sub_10000A090(&qword_100014578);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v88 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(double *)&uint64_t v14 = COERCE_DOUBLE(sub_10000DDC0());
  uint64_t v133 = v15;
  uint64_t v134 = v14;
  uint64_t v16 = 0;
  sub_10000DAE0();
  double v17 = v230;
  unsigned int v129 = HIDWORD(v231);
  unsigned int v130 = v231;
  uint64_t v128 = v233;
  unint64_t v102 = v234;
  double v103 = v232;
  uint64_t v18 = sub_10000DDC0();
  uint64_t v131 = v19;
  uint64_t v132 = v18;
  uint64_t v20 = type metadata accessor for TodoView(0);
  uint64_t v21 = 0;
  uint64_t v22 = *(int *)(v20 + 20);
  uint64_t v117 = a1;
  int v23 = *(unsigned __int8 *)(a1 + v22);
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  if (v23 == 1)
  {
    unsigned __int8 v27 = sub_10000DC50();
    sub_10000DAD0();
    uint64_t v16 = v28;
    uint64_t v21 = v27;
  }
  uint64_t v119 = v16;
  *(void *)&long long v100 = v25;
  *((void *)&v100 + 1) = v26;
  uint64_t v124 = v21;
  double v94 = v17 * 0.5;
  int v126 = v23 ^ 1;
  char v154 = v23 ^ 1;
  uint64_t v29 = v24;
  uint64_t v96 = v24;
  sub_10000DDC0();
  sub_10000DAF0();
  uint64_t v122 = v145;
  uint64_t v123 = v147;
  uint64_t v125 = v149;
  uint64_t v120 = v150;
  unsigned __int8 v158 = v146;
  unsigned __int8 v156 = v148;
  sub_10000DC00();
  uint64_t v30 = sub_10000DCF0();
  uint64_t v32 = v31;
  char v34 = v33 & 1;
  sub_10000DC80();
  uint64_t v107 = sub_10000DC70();
  uint64_t v35 = *(void *)(v107 - 8);
  *(void *)v105 = *(void *)(v35 + 56);
  uint64_t v109 = v35 + 56;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))v105)(v13, 1, 1, v107);
  sub_10000DCA0();
  sub_10000D324((uint64_t)v13, &qword_100014578);
  uint64_t v36 = sub_10000DCD0();
  uint64_t v98 = v37;
  uint64_t v99 = v36;
  uint64_t v95 = v13;
  char v39 = v38;
  uint64_t v97 = v40;
  swift_release();
  int v106 = v39 & 1;
  sub_10000CB2C(v30, v32, v34);
  swift_bridgeObjectRelease();
  uint64_t v41 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v42 = sub_10000DC10();
  uint64_t v43 = (uint64_t)v113;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v42 - 8) + 104))(v113, v41, v42);
  sub_10000DDC0();
  sub_10000DAF0();
  uint64_t v44 = v115;
  sub_10000D080(v43, v115, (uint64_t (*)(void))&type metadata accessor for Capsule);
  uint64_t v45 = (_OWORD *)(v44 + *(int *)(v114 + 36));
  long long v46 = v152;
  *uint64_t v45 = v151;
  v45[1] = v46;
  v45[2] = v153;
  sub_10000D0E8(v43);
  LODWORD(v90) = enum case for Color.RGBColorSpace.sRGB(_:);
  uint64_t v89 = *(void (**)(char *))(*(void *)&v118 + 104);
  uint64_t v47 = v101;
  v89(v101);
  uint64_t v48 = sub_10000DD80();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v50 = v135;
  sub_10000D1A8(v44, v135, &qword_1000145E8);
  long long v51 = (uint64_t *)(v50 + *(int *)(v116 + 36));
  *long long v51 = KeyPath;
  v51[1] = v48;
  sub_10000D324(v44, &qword_1000145E8);
  uint64_t v52 = v127;
  sub_10000D144(v50, v127, &qword_1000145F0);
  uint64_t v110 = sub_10000DC30();
  sub_100009158(v117, (uint64_t)&v230);
  long long v113 = v231;
  uint64_t v114 = *(void *)&v230;
  LOBYTE(v48) = LOBYTE(v232);
  unint64_t v92 = v234;
  uint64_t v93 = v233;
  uint64_t v117 = v236;
  double v118 = v235;
  uint64_t v116 = v237;
  LODWORD(v115) = sub_10000DC60();
  sub_10000DAD0();
  uint64_t v54 = v53;
  uint64_t v56 = v55;
  uint64_t v58 = v57;
  uint64_t v91 = v59;
  unsigned __int8 v168 = 1;
  unsigned __int8 v166 = v48;
  unsigned __int8 v163 = 0;
  uint64_t v112 = swift_getKeyPath();
  int v108 = v168;
  v173[0] = *(_DWORD *)v167;
  *(_DWORD *)((char *)v173 + 3) = *(_DWORD *)&v167[3];
  int v104 = v166;
  v172[0] = *(_DWORD *)v165;
  *(_DWORD *)((char *)v172 + 3) = *(_DWORD *)&v165[3];
  v171[0] = *(_DWORD *)v164;
  *(_DWORD *)((char *)v171 + 3) = *(_DWORD *)&v164[3];
  int v111 = v163;
  unsigned __int8 v169 = 0;
  sub_10000DC90();
  uint64_t v60 = (uint64_t)v95;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))v105)(v95, 1, 1, v107);
  uint64_t v109 = sub_10000DCA0();
  sub_10000D324(v60, &qword_100014578);
  uint64_t v107 = swift_getKeyPath();
  v178[0] = v173[0];
  *(_DWORD *)((char *)v178 + 3) = *(_DWORD *)((char *)v173 + 3);
  v177[0] = v172[0];
  *(_DWORD *)((char *)v177 + 3) = *(_DWORD *)((char *)v172 + 3);
  v176[0] = v171[0];
  *(_DWORD *)((char *)v176 + 3) = *(_DWORD *)((char *)v171 + 3);
  *(_DWORD *)((char *)v175 + 3) = *(_DWORD *)&v170[3];
  v175[0] = *(_DWORD *)v170;
  v105[0] = v169;
  ((void (*)(char *, void, uint64_t))v89)(v47, LODWORD(v90), v121);
  uint64_t v121 = sub_10000DD80();
  v137[0] = v175[0];
  *(_DWORD *)((char *)v137 + 3) = *(_DWORD *)((char *)v175 + 3);
  v136[0] = *(_DWORD *)v174;
  *(_DWORD *)((char *)v136 + 3) = *(_DWORD *)&v174[3];
  int v143 = v161;
  __int16 v144 = v162;
  int v141 = v159;
  __int16 v142 = v160;
  LOBYTE(v47) = v158;
  LODWORD(v95) = v158;
  v140[0] = *(_DWORD *)v157;
  *(_DWORD *)((char *)v140 + 3) = *(_DWORD *)&v157[3];
  LOBYTE(v48) = v156;
  LODWORD(v101) = v156;
  *(_DWORD *)((char *)v139 + 3) = *(_DWORD *)&v155[3];
  v139[0] = *(_DWORD *)v155;
  LOBYTE(v60) = v106;
  char v138 = v106;
  sub_10000D1A8(v52, v50, &qword_1000145F0);
  *(void *)&long long v179 = v134;
  *((void *)&v179 + 1) = v133;
  *(double *)&long long v180 = v17 * 0.5;
  *((double *)&v180 + 1) = v17;
  *(void *)&long long v181 = __PAIR64__(v129, v130);
  unint64_t v61 = v102;
  double v62 = v103;
  *((double *)&v181 + 1) = v103;
  *(void *)&long long v182 = v128;
  *((void *)&v182 + 1) = v102;
  LOWORD(v183) = 256;
  *(_DWORD *)((char *)&v183 + 2) = v161;
  WORD3(v183) = v162;
  *((void *)&v183 + 1) = v132;
  *(void *)&long long v184 = v131;
  *((void *)&v184 + 1) = v124;
  *(void *)&long long v185 = v119;
  *((void *)&v185 + 1) = v29;
  uint64_t v63 = v100;
  long long v186 = v100;
  double v90 = v17;
  uint64_t v64 = *((void *)&v100 + 1);
  LOBYTE(v187) = 0;
  BYTE1(v187) = v126;
  *(_DWORD *)((char *)&v187 + 2) = v159;
  WORD3(v187) = v160;
  *((void *)&v187 + 1) = v122;
  LOBYTE(v188) = (_BYTE)v47;
  *(_DWORD *)((char *)&v188 + 1) = *(_DWORD *)v157;
  DWORD1(v188) = *(_DWORD *)&v157[3];
  *((void *)&v188 + 1) = v123;
  LOBYTE(v189) = v48;
  *(_DWORD *)((char *)&v189 + 1) = *(_DWORD *)v155;
  DWORD1(v189) = *(_DWORD *)&v155[3];
  *((void *)&v189 + 1) = v125;
  uint64_t v65 = v120;
  uint64_t v190 = v120;
  long long v66 = v188;
  *(_OWORD *)(a2 + 128) = v187;
  *(_OWORD *)(a2 + 144) = v66;
  *(_OWORD *)(a2 + 160) = v189;
  long long v67 = v182;
  *(_OWORD *)(a2 + 32) = v181;
  *(_OWORD *)(a2 + 48) = v67;
  long long v68 = v180;
  *(_OWORD *)a2 = v179;
  *(_OWORD *)(a2 + 16) = v68;
  long long v69 = v186;
  *(_OWORD *)(a2 + 96) = v185;
  *(_OWORD *)(a2 + 112) = v69;
  long long v70 = v184;
  *(_OWORD *)(a2 + 64) = v183;
  *(_OWORD *)(a2 + 80) = v70;
  uint64_t v72 = v98;
  uint64_t v71 = v99;
  *(void *)(a2 + 176) = v65;
  *(void *)(a2 + 184) = v71;
  *(void *)(a2 + 192) = v72;
  *(unsigned char *)(a2 + 200) = v60;
  *(void *)(a2 + 208) = v97;
  uint64_t v73 = sub_10000A090(&qword_1000145F8);
  sub_10000D1A8(v50, a2 + *(int *)(v73 + 64), &qword_1000145F0);
  uint64_t v74 = a2 + *(int *)(v73 + 80);
  long long v191 = (unint64_t)v110;
  LOBYTE(v192) = v108;
  *(_DWORD *)((char *)&v192 + 1) = v178[0];
  DWORD1(v192) = *(_DWORD *)((char *)v178 + 3);
  *((void *)&v192 + 1) = v114;
  *(void *)&long long v193 = v113;
  BYTE8(v193) = v104;
  *(_DWORD *)((char *)&v193 + 9) = v177[0];
  HIDWORD(v193) = *(_DWORD *)((char *)v177 + 3);
  unint64_t v76 = v92;
  uint64_t v75 = v93;
  *(void *)&long long v194 = v93;
  *((void *)&v194 + 1) = v92;
  *(double *)&long long v195 = v118;
  *((void *)&v195 + 1) = v117;
  *(void *)&long long v196 = v116;
  BYTE8(v196) = v115;
  *(_DWORD *)((char *)&v196 + 9) = v176[0];
  HIDWORD(v196) = *(_DWORD *)((char *)v176 + 3);
  *(void *)&long long v197 = v54;
  *((void *)&v197 + 1) = v56;
  *(void *)&long long v198 = v58;
  uint64_t v77 = v91;
  *((void *)&v198 + 1) = v91;
  LOBYTE(v199) = v111;
  DWORD1(v199) = *(_DWORD *)((char *)v175 + 3);
  *(_DWORD *)((char *)&v199 + 1) = v175[0];
  *((void *)&v199 + 1) = v112;
  *(void *)&long long v200 = 1;
  BYTE8(v200) = v105[0];
  HIDWORD(v200) = *(_DWORD *)&v174[3];
  *(_DWORD *)((char *)&v200 + 9) = *(_DWORD *)v174;
  *(void *)&long long v201 = v107;
  *((void *)&v201 + 1) = v109;
  uint64_t v202 = v121;
  long long v79 = v199;
  long long v78 = v200;
  long long v80 = v201;
  *(void *)(v74 + 176) = v121;
  *(_OWORD *)(v74 + 144) = v78;
  *(_OWORD *)(v74 + 160) = v80;
  long long v81 = v191;
  long long v82 = v192;
  long long v83 = v194;
  *(_OWORD *)(v74 + 32) = v193;
  *(_OWORD *)(v74 + 48) = v83;
  *(_OWORD *)uint64_t v74 = v81;
  *(_OWORD *)(v74 + 16) = v82;
  long long v84 = v195;
  long long v85 = v196;
  long long v86 = v197;
  *(_OWORD *)(v74 + 112) = v198;
  *(_OWORD *)(v74 + 128) = v79;
  *(_OWORD *)(v74 + 80) = v85;
  *(_OWORD *)(v74 + 96) = v86;
  *(_OWORD *)(v74 + 64) = v84;
  sub_10000D20C((uint64_t)&v179);
  sub_10000CB1C(v71, v72, v106);
  swift_bridgeObjectRetain();
  sub_10000D238((uint64_t)&v191);
  sub_10000D324(v127, &qword_1000145F0);
  v203[0] = v110;
  v203[1] = 0;
  char v204 = v108;
  *(_DWORD *)v205 = v178[0];
  *(_DWORD *)&v205[3] = *(_DWORD *)((char *)v178 + 3);
  uint64_t v206 = v114;
  v207 = v113;
  char v208 = v104;
  *(_DWORD *)v209 = v177[0];
  *(_DWORD *)&v209[3] = *(_DWORD *)((char *)v177 + 3);
  uint64_t v210 = v75;
  unint64_t v211 = v76;
  double v212 = v118;
  uint64_t v213 = v117;
  uint64_t v214 = v116;
  char v215 = v115;
  *(_DWORD *)&v216[3] = *(_DWORD *)((char *)v176 + 3);
  *(_DWORD *)v216 = v176[0];
  uint64_t v217 = v54;
  uint64_t v218 = v56;
  uint64_t v219 = v58;
  uint64_t v220 = v77;
  char v221 = v111;
  *(_DWORD *)&v222[3] = *(_DWORD *)((char *)v137 + 3);
  *(_DWORD *)v222 = v137[0];
  uint64_t v223 = v112;
  uint64_t v224 = 1;
  char v225 = v105[0];
  *(_DWORD *)&v226[3] = *(_DWORD *)((char *)v136 + 3);
  *(_DWORD *)v226 = v136[0];
  uint64_t v227 = v107;
  uint64_t v228 = v109;
  uint64_t v229 = v121;
  sub_10000D380((uint64_t)v203);
  sub_10000D324(v135, &qword_1000145F0);
  sub_10000CB2C(v71, v72, v138);
  swift_bridgeObjectRelease();
  double v230 = *(double *)&v134;
  v231 = v133;
  double v232 = v94;
  uint64_t v233 = *(void *)&v90;
  unint64_t v234 = __PAIR64__(v129, v130);
  double v235 = v62;
  uint64_t v236 = v128;
  uint64_t v237 = v61;
  char v238 = 0;
  char v239 = 1;
  int v240 = v143;
  __int16 v241 = v144;
  uint64_t v242 = v132;
  uint64_t v243 = v131;
  uint64_t v244 = v124;
  uint64_t v245 = v119;
  uint64_t v246 = v96;
  uint64_t v247 = v63;
  uint64_t v248 = v64;
  char v249 = 0;
  char v250 = v126;
  __int16 v252 = v142;
  int v251 = v141;
  uint64_t v253 = v122;
  char v254 = (char)v95;
  *(_DWORD *)&v255[3] = *(_DWORD *)((char *)v140 + 3);
  *(_DWORD *)v255 = v140[0];
  uint64_t v256 = v123;
  char v257 = (char)v101;
  *(_DWORD *)&v258[3] = *(_DWORD *)((char *)v139 + 3);
  *(_DWORD *)v258 = v139[0];
  uint64_t v259 = v125;
  uint64_t v260 = v120;
  return sub_10000D46C((uint64_t)&v230);
}

uint64_t sub_100009158@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10000D830();
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v75 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000D9E0();
  __chkstk_darwin(v7 - 8);
  long long v82 = (char *)&v75 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000D9A0();
  __chkstk_darwin(v9 - 8);
  long long v81 = (char *)&v75 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000A090(&qword_100014488);
  __chkstk_darwin(v11 - 8);
  long long v79 = (char *)&v75 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10000A090(&qword_100014490);
  __chkstk_darwin(v13 - 8);
  uint64_t v77 = (char *)&v75 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_10000D940();
  __chkstk_darwin(v80);
  long long v78 = (char *)&v75 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10000A090(&qword_100014498);
  __chkstk_darwin(v16 - 8);
  uint64_t v18 = (char *)&v75 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_10000D9C0();
  uint64_t v87 = *(void *)(v19 - 8);
  uint64_t v88 = v19;
  uint64_t v20 = __chkstk_darwin(v19);
  unint64_t v76 = (char *)&v75 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  long long v84 = (char *)&v75 - v22;
  uint64_t v23 = sub_10000A090(&qword_100014450);
  uint64_t v24 = __chkstk_darwin(v23 - 8);
  uint64_t v85 = (uint64_t)&v75 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  unsigned __int8 v27 = (char *)&v75 - v26;
  uint64_t v28 = sub_10000A090(&qword_1000144A0);
  __chkstk_darwin(v28 - 8);
  uint64_t v30 = (char *)&v75 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_10000D980();
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v94 = v31;
  uint64_t v95 = v32;
  uint64_t v33 = __chkstk_darwin(v31);
  long long v83 = (char *)&v75 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v33);
  uint64_t v89 = (char *)&v75 - v35;
  uint64_t v36 = (uint64_t *)(a1 + *(int *)(type metadata accessor for TodoView(0) + 24));
  unint64_t v37 = v36[1];
  long long v86 = v18;
  if (v37)
  {
    uint64_t v38 = *v36;
    unint64_t v39 = v37;
  }
  else
  {
    unint64_t v39 = 0xE100000000000000;
    uint64_t v38 = 32;
  }
  uint64_t v96 = v38;
  unint64_t v97 = v39;
  sub_10000CAC8();
  swift_bridgeObjectRetain();
  uint64_t v40 = sub_10000DD00();
  uint64_t v91 = v41;
  uint64_t v92 = v40;
  int v90 = v42;
  uint64_t v93 = v43;
  uint64_t v44 = a1;
  sub_10000D1A8(a1, (uint64_t)v27, &qword_100014450);
  uint64_t v45 = sub_10000D810();
  uint64_t v46 = *(void *)(v45 - 8);
  uint64_t v47 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48);
  if (v47(v27, 1, v45) == 1)
  {
    sub_10000D324((uint64_t)v27, &qword_100014450);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v95 + 56))(v30, 1, 1, v94);
LABEL_7:
    long long v51 = &qword_1000144A0;
    uint64_t v52 = (uint64_t)v30;
    goto LABEL_12;
  }
  uint64_t v75 = v6;
  sub_10000D7F0();
  uint64_t v48 = *(void (**)(char *, uint64_t))(v46 + 8);
  v48(v27, v45);
  uint64_t v50 = v94;
  uint64_t v49 = v95;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v95 + 48))(v30, 1, v94) == 1) {
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v49 + 32))(v89, v30, v50);
  uint64_t v53 = v85;
  sub_10000D1A8(v44, v85, &qword_100014450);
  if (v47((char *)v53, 1, v45) == 1)
  {
    uint64_t v54 = v50;
    sub_10000D324(v53, &qword_100014450);
    uint64_t v55 = (uint64_t)v86;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v87 + 56))(v86, 1, 1, v88);
  }
  else
  {
    uint64_t v55 = (uint64_t)v86;
    sub_10000D800();
    uint64_t v54 = v94;
    v48((char *)v53, v45);
    uint64_t v57 = v87;
    uint64_t v56 = v88;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v87 + 48))(v55, 1, v88) != 1)
    {
      long long v67 = v84;
      (*(void (**)(char *, uint64_t, uint64_t))(v57 + 32))(v84, v55, v56);
      (*(void (**)(char *, char *, uint64_t))(v95 + 16))(v83, v89, v54);
      long long v68 = v77;
      sub_10000D890();
      uint64_t v69 = sub_10000D8B0();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v69 - 8) + 56))(v68, 0, 1, v69);
      long long v70 = v79;
      sub_10000D860();
      uint64_t v71 = sub_10000D880();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v71 - 8) + 56))(v70, 0, 1, v71);
      (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v76, v67, v56);
      sub_10000D990();
      sub_10000D9D0();
      sub_10000D820();
      sub_10000D8D0();
      sub_10000A048(&qword_100014600, (void (*)(uint64_t))&type metadata accessor for Date.FormatStyle);
      sub_10000A048(&qword_100014608, (void (*)(uint64_t))&type metadata accessor for Date);
      uint64_t v58 = sub_10000DCE0();
      uint64_t v59 = v72;
      uint64_t v61 = v73;
      uint64_t v60 = v74 & 1;
      (*(void (**)(char *, uint64_t))(v57 + 8))(v84, v56);
      (*(void (**)(char *, uint64_t))(v95 + 8))(v89, v94);
      goto LABEL_13;
    }
  }
  (*(void (**)(char *, uint64_t))(v95 + 8))(v89, v54);
  long long v51 = &qword_100014498;
  uint64_t v52 = v55;
LABEL_12:
  sub_10000D324(v52, v51);
  uint64_t v58 = 0;
  uint64_t v59 = 0;
  uint64_t v60 = 0;
  uint64_t v61 = 0;
LABEL_13:
  char v62 = v90;
  char v63 = v90 & 1;
  uint64_t v65 = v91;
  uint64_t v64 = v92;
  *(void *)a2 = v92;
  *(void *)(a2 + 8) = v65;
  *(unsigned char *)(a2 + 16) = v62 & 1;
  *(void *)(a2 + 24) = v93;
  *(void *)(a2 + 32) = v58;
  *(void *)(a2 + 40) = v59;
  *(void *)(a2 + 48) = v60;
  *(void *)(a2 + 56) = v61;
  sub_10000CB1C(v64, v65, v62 & 1);
  swift_bridgeObjectRetain();
  sub_10000D2E0(v58, v59, v60, v61);
  sub_10000D428(v58, v59, v60, v61);
  sub_10000CB2C(v64, v65, v63);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100009AC0()
{
  return sub_10000DD30();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t type metadata accessor for CalendarThumbnailExtension(uint64_t a1)
{
  return sub_10000A0F4(a1, qword_1000146C8);
}

uint64_t sub_100009B90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000DA90();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_100009BFC(uint64_t a1)
{
  uint64_t v2 = sub_10000DA90();
  long long v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_100009C60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000DA90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_100009CC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000DA90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_100009D28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000DA90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_100009D8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000DA90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_100009DF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100009E04);
}

uint64_t sub_100009E04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000DA90();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_100009E70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100009E84);
}

uint64_t sub_100009E84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000DA90();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_100009EF4()
{
  uint64_t result = sub_10000DA90();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_100009F80()
{
  return sub_10000A048(&qword_1000143A8, (void (*)(uint64_t))type metadata accessor for CalendarThumbnailExtension);
}

uint64_t sub_100009FC8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000A048(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000A090(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for TodoView(uint64_t a1)
{
  return sub_10000A0F4(a1, qword_1000147E8);
}

uint64_t sub_10000A0F4(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_10000A12C()
{
  unint64_t result = qword_100014458;
  if (!qword_100014458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014458);
  }
  return result;
}

uint64_t sub_10000A180()
{
  return sub_10000DBC0();
}

uint64_t sub_10000A1A4(uint64_t a1)
{
  uint64_t v2 = sub_10000A090(&qword_100014588);
  __chkstk_darwin(v2 - 8);
  sub_10000D1A8(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_100014588);
  return sub_10000DBD0();
}

uint64_t sub_10000A238@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000DB80();
  *a1 = result;
  return result;
}

uint64_t sub_10000A264()
{
  return sub_10000DB90();
}

uint64_t sub_10000A290@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_10000DBE0();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_10000A2C4()
{
  return sub_10000DBF0();
}

uint64_t sub_10000A2F4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000DB60();
  *a1 = result;
  return result;
}

uint64_t sub_10000A320()
{
  return sub_10000DB70();
}

uint64_t sub_10000A34C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t *a6@<X8>)
{
  LODWORD(v156) = a5;
  uint64_t v166 = a4;
  uint64_t v159 = a3;
  uint64_t v168 = a2;
  v165 = a6;
  uint64_t v143 = sub_10000A090(&qword_100014478);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  __int16 v144 = (char *)&v120 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v137 = (char *)&v120 - v9;
  uint64_t v138 = sub_10000A090(&qword_100014480);
  uint64_t v10 = __chkstk_darwin(v138);
  uint64_t v139 = (char *)&v120 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v142 = (uint64_t)&v120 - v12;
  uint64_t v141 = sub_10000D970();
  uint64_t v140 = *(void *)(v141 - 8);
  __chkstk_darwin(v141);
  uint64_t v145 = (char *)&v120 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10000A090(&qword_100014450);
  __chkstk_darwin(v14 - 8);
  uint64_t v148 = (uint64_t)&v120 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v154 = sub_10000D900();
  long long v153 = *(void (***)(char *, uint64_t))(v154 - 8);
  __chkstk_darwin(v154);
  long long v152 = (char *)&v120 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v162 = sub_10000D920();
  uint64_t v151 = *(void *)(v162 - 8);
  __chkstk_darwin(v162);
  uint64_t v150 = (char *)&v120 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_10000D830();
  __chkstk_darwin(v18 - 8);
  unsigned __int8 v158 = (char *)&v120 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_10000D9E0();
  __chkstk_darwin(v20 - 8);
  int v161 = (char *)&v120 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_10000D9A0();
  __chkstk_darwin(v22 - 8);
  __int16 v160 = (char *)&v120 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_10000A090(&qword_100014488);
  __chkstk_darwin(v24 - 8);
  uint64_t v155 = (char *)&v120 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_10000A090(&qword_100014490);
  __chkstk_darwin(v26 - 8);
  v164 = (char *)&v120 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v157 = sub_10000D940();
  uint64_t v170 = *(void *)(v157 - 8);
  uint64_t v28 = __chkstk_darwin(v157);
  uint64_t v149 = (char *)&v120 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v28);
  uint64_t v31 = (char *)&v120 - v30;
  uint64_t v32 = sub_10000A090(&qword_100014498);
  __chkstk_darwin(v32 - 8);
  uint64_t v34 = (char *)&v120 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v169 = sub_10000D9C0();
  uint64_t v167 = *(void *)(v169 - 8);
  uint64_t v35 = __chkstk_darwin(v169);
  unint64_t v37 = (char *)&v120 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v35);
  unsigned __int8 v163 = (char *)&v120 - v38;
  uint64_t v39 = sub_10000A090(&qword_1000144A0);
  uint64_t v40 = __chkstk_darwin(v39 - 8);
  uint64_t v147 = (char *)&v120 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v40);
  uint64_t v43 = (char *)&v120 - v42;
  uint64_t v44 = sub_10000D980();
  uint64_t v45 = *(void *)(v44 - 8);
  uint64_t v46 = __chkstk_darwin(v44);
  unsigned __int8 v146 = (char *)&v120 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v46);
  uint64_t v49 = (char *)&v120 - v48;
  sub_10000D7F0();
  uint64_t v50 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48);
  if (v50(v43, 1, v44) == 1)
  {
    sub_10000D324((uint64_t)v43, &qword_1000144A0);
    uint64_t v51 = 0;
    uint64_t v52 = 0;
    uint64_t v53 = 0;
    unint64_t v54 = 0xE000000000000000;
    unint64_t v55 = 0xE000000000000000;
    unint64_t v56 = 0xE000000000000000;
    uint64_t v57 = a1;
    uint64_t v58 = v166;
    if (!v166) {
      goto LABEL_18;
    }
LABEL_14:
    uint64_t v175 = v159;
    uint64_t v176 = v58;
    unint64_t v156 = v55;
    uint64_t v173 = 13;
    unint64_t v174 = 0xE100000000000000;
    uint64_t v171 = 32;
    unint64_t v172 = 0xE100000000000000;
    sub_10000B934();
    sub_10000B988();
    uint64_t v162 = v54;
    uint64_t v170 = v53;
    uint64_t v169 = v56;
    sub_10000DE70();
    swift_bridgeObjectRelease();
    uint64_t v175 = v177;
    uint64_t v176 = v178;
    uint64_t v173 = 10;
    unint64_t v174 = 0xE100000000000000;
    uint64_t v171 = 32;
    unint64_t v172 = 0xE100000000000000;
    unint64_t v55 = v156;
    uint64_t v53 = v170;
    unint64_t v56 = v169;
    unint64_t v54 = v162;
    sub_10000DE70();
    swift_bridgeObjectRelease();
    uint64_t v92 = v179;
    unint64_t v93 = v180;
LABEL_19:
    sub_10000D324(v168, &qword_100014450);
    uint64_t v118 = sub_10000D810();
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v118 - 8) + 8))(v57, v118);
    uint64_t v119 = v165;
    uint64_t *v165 = v51;
    v119[1] = v54;
    v119[2] = v52;
    v119[3] = v55;
    v119[4] = v92;
    v119[5] = v93;
    v119[6] = v53;
    v119[7] = v56;
    return result;
  }
  uint64_t v59 = *(void (**)(char *, uint64_t, uint64_t))(v45 + 32);
  uint64_t v126 = v45 + 32;
  uint64_t v125 = v59;
  v59(v49, (uint64_t)v43, v44);
  sub_10000D800();
  int v60 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v167 + 48))(v34, 1, v169);
  uint64_t v136 = a1;
  if (v60 == 1)
  {
    (*(void (**)(char *, uint64_t))(v45 + 8))(v49, v44);
    sub_10000D324((uint64_t)v34, &qword_100014498);
    uint64_t v51 = 0;
    uint64_t v52 = 0;
    uint64_t v53 = 0;
    unint64_t v54 = 0xE000000000000000;
    unint64_t v55 = 0xE000000000000000;
    unint64_t v56 = 0xE000000000000000;
    uint64_t v58 = v166;
    goto LABEL_13;
  }
  uint64_t v122 = v45 + 48;
  uint64_t v123 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v50;
  uint64_t v128 = v45;
  uint64_t v127 = v44;
  uint64_t v61 = v167;
  char v62 = v163;
  uint64_t v63 = v169;
  (*(void (**)(char *, char *, uint64_t))(v167 + 32))(v163, v34, v169);
  uint64_t v131 = sub_10000D8B0();
  uint64_t v64 = *(void *)(v131 - 8);
  unsigned int v130 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v64 + 56);
  uint64_t v129 = v64 + 56;
  v130(v164, 1, 1, v131);
  uint64_t v135 = sub_10000D880();
  uint64_t v65 = *(void *)(v135 - 8);
  uint64_t v133 = *(void (**)(void))(v65 + 56);
  uint64_t v132 = v65 + 56;
  long long v66 = v31;
  long long v67 = v155;
  v133();
  uint64_t v134 = *(void (**)(char *, char *, uint64_t))(v61 + 16);
  v134(v37, v62, v63);
  sub_10000D990();
  sub_10000D9D0();
  sub_10000D820();
  long long v68 = v149;
  sub_10000D8D0();
  uint64_t v69 = v150;
  sub_10000D910();
  sub_10000D8E0();
  (*(void (**)(char *, uint64_t))(v151 + 8))(v69, v162);
  long long v70 = *(void (***)(char *, uint64_t))(v170 + 8);
  v170 += 8;
  uint64_t v71 = v157;
  ((void (*)(char *, uint64_t))v70)(v68, v157);
  uint64_t v151 = sub_10000D930();
  uint64_t v162 = v72;
  ((void (*)(char *, uint64_t))v70)(v66, v71);
  v130(v164, 1, 1, v131);
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v133)(v67, 1, 1, v135);
  uint64_t v124 = v61 + 16;
  v134(v37, v163, v169);
  sub_10000D990();
  sub_10000D9D0();
  sub_10000D820();
  uint64_t v150 = v37;
  sub_10000D8D0();
  uint64_t v73 = v152;
  sub_10000D8F0();
  sub_10000D8C0();
  v153[1](v73, v154);
  uint64_t v74 = v157;
  ((void (*)(char *, uint64_t))v70)(v68, v157);
  uint64_t v52 = sub_10000D930();
  unint64_t v55 = v75;
  uint64_t v154 = (uint64_t)v66;
  long long v153 = v70;
  ((void (*)(char *, uint64_t))v70)(v66, v74);
  if (v156)
  {
    (*(void (**)(char *, uint64_t))(v167 + 8))(v163, v169);
    (*(void (**)(char *, uint64_t))(v128 + 8))(v49, v127);
    uint64_t v53 = 0;
    unint64_t v56 = 0xE000000000000000;
    uint64_t v58 = v166;
    uint64_t v51 = v151;
    unint64_t v54 = v162;
    goto LABEL_13;
  }
  unint64_t v156 = v55;
  long long v152 = (char *)v52;
  uint64_t v121 = v49;
  uint64_t v76 = v169;
  uint64_t v77 = v148;
  sub_10000D1A8(v168, v148, &qword_100014450);
  uint64_t v78 = sub_10000D810();
  uint64_t v79 = *(void *)(v78 - 8);
  int v80 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v79 + 48))(v77, 1, v78);
  uint64_t v81 = v128;
  if (v80 == 1)
  {
    sub_10000D324(v77, &qword_100014450);
    uint64_t v82 = (uint64_t)v147;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v81 + 56))(v147, 1, 1, v127);
    uint64_t v83 = v167;
LABEL_11:
    sub_10000D324(v82, &qword_1000144A0);
    long long v86 = v163;
LABEL_12:
    uint64_t v87 = v164;
    sub_10000D8A0();
    v130(v87, 0, 1, v131);
    uint64_t v88 = v155;
    sub_10000D870();
    ((void (*)(char *, void, uint64_t, uint64_t))v133)(v88, 0, 1, v135);
    v134(v150, v86, v76);
    sub_10000D990();
    sub_10000D9D0();
    sub_10000D820();
    uint64_t v89 = v154;
    sub_10000D8D0();
    int v90 = v121;
    uint64_t v53 = sub_10000D930();
    unint64_t v56 = v91;
    ((void (*)(uint64_t, uint64_t))v153)(v89, v157);
    (*(void (**)(char *, uint64_t))(v83 + 8))(v86, v76);
    (*(void (**)(char *, uint64_t))(v128 + 8))(v90, v127);
    uint64_t v58 = v166;
    uint64_t v51 = v151;
    unint64_t v54 = v162;
    uint64_t v52 = (uint64_t)v152;
    unint64_t v55 = v156;
LABEL_13:
    uint64_t v57 = v136;
    if (v58) {
      goto LABEL_14;
    }
LABEL_18:
    uint64_t v92 = 0;
    unint64_t v93 = 0xE000000000000000;
    goto LABEL_19;
  }
  uint64_t v82 = (uint64_t)v147;
  sub_10000D7F0();
  (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v77, v78);
  uint64_t v84 = v127;
  int v85 = v123(v82, 1, v127);
  uint64_t v83 = v167;
  if (v85 == 1) {
    goto LABEL_11;
  }
  uint64_t v94 = v146;
  v125(v146, v82, v84);
  uint64_t v95 = v121;
  long long v86 = v163;
  uint64_t v96 = v84;
  if ((sub_10000D9B0() & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v81 + 8))(v94, v84);
    goto LABEL_12;
  }
  unint64_t v97 = v164;
  sub_10000D8A0();
  v130(v97, 0, 1, v131);
  uint64_t v98 = v76;
  uint64_t v99 = v155;
  sub_10000D870();
  ((void (*)(char *, void, uint64_t, uint64_t))v133)(v99, 0, 1, v135);
  v134(v150, v86, v98);
  sub_10000D990();
  sub_10000D9D0();
  sub_10000D950();
  sub_10000A048(&qword_1000144B8, (void (*)(uint64_t))&type metadata accessor for Date);
  uint64_t result = sub_10000DE10();
  if (result)
  {
    uint64_t v101 = v96;
    uint64_t v102 = v143;
    double v103 = v137;
    int v104 = &v137[*(int *)(v143 + 48)];
    v105 = *(void (**)(char *, char *, uint64_t))(v81 + 16);
    v105(v137, v95, v101);
    uint64_t v170 = (uint64_t)v104;
    v105(v104, v94, v101);
    int v106 = v144;
    uint64_t v107 = &v144[*(int *)(v102 + 48)];
    v105(v144, v103, v101);
    v105(v107, v104, v101);
    uint64_t v108 = (uint64_t)v139;
    uint64_t v109 = (void (*)(char *, char *, uint64_t))v125;
    v125(v139, (uint64_t)v106, v101);
    uint64_t v110 = *(void (**)(char *, uint64_t))(v128 + 8);
    v110(v107, v101);
    int v111 = &v106[*(int *)(v102 + 48)];
    v109(v106, v103, v101);
    v109(v111, (char *)v170, v101);
    v109((char *)(v108 + *(int *)(v138 + 36)), v111, v101);
    uint64_t v112 = v110;
    v110(v106, v101);
    uint64_t v113 = v142;
    sub_10000D144(v108, v142, &qword_100014480);
    uint64_t v114 = v145;
    uint64_t v53 = sub_10000D960();
    unint64_t v116 = v115;
    sub_10000D324(v113, &qword_100014480);
    (*(void (**)(char *, uint64_t))(v140 + 8))(v114, v141);
    uint64_t v117 = v112;
    v112(v146, v101);
    (*(void (**)(char *, uint64_t))(v167 + 8))(v163, v169);
    unint64_t v56 = v116;
    v117(v121, v101);
    uint64_t v57 = v136;
    uint64_t v58 = v166;
    uint64_t v51 = v151;
    unint64_t v54 = v162;
    uint64_t v52 = (uint64_t)v152;
    unint64_t v55 = v156;
    if (v166) {
      goto LABEL_14;
    }
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

unint64_t sub_10000B83C()
{
  unint64_t result = qword_100014460;
  if (!qword_100014460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014460);
  }
  return result;
}

uint64_t sub_10000B890()
{
  return sub_10000DB20();
}

void sub_10000B8D0(void (*a1)(void))
{
  id v3 = (id)(*(uint64_t (**)(void))(v1 + 16))();
  a1();
}

unint64_t sub_10000B934()
{
  unint64_t result = qword_1000144A8;
  if (!qword_1000144A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000144A8);
  }
  return result;
}

unint64_t sub_10000B988()
{
  unint64_t result = qword_1000144B0;
  if (!qword_1000144B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000144B0);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for EventView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for EventView()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for EventView(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for EventView(void *a1, void *a2)
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
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for EventView(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

void *assignWithTake for EventView(void *a1, void *a2)
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
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EventView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EventView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EventView()
{
  return &type metadata for EventView;
}

unsigned char *initializeBufferWithCopyOfBuffer for CalendarThumbnailExtension.Errors(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CalendarThumbnailExtension.Errors(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CalendarThumbnailExtension.Errors(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10000BE04);
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

uint64_t sub_10000BE2C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000BE38(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CalendarThumbnailExtension.Errors()
{
  return &type metadata for CalendarThumbnailExtension.Errors;
}

uint64_t *sub_10000BE54(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_10000D810();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = sub_10000A090(&qword_100014450);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v11 = *(int *)(a3 + 24);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
    uint64_t v12 = (uint64_t *)((char *)a1 + v11);
    uint64_t v13 = (uint64_t *)((char *)a2 + v11);
    uint64_t v14 = v13[1];
    void *v12 = *v13;
    v12[1] = v14;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_10000BFE0(uint64_t a1)
{
  uint64_t v2 = sub_10000D810();
  uint64_t v3 = *(void *)(v2 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2)) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  }

  return swift_bridgeObjectRelease();
}

char *sub_10000C0B0(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_10000D810();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_10000A090(&qword_100014450);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = *(int *)(a3 + 24);
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = *((void *)v11 + 1);
  *(void *)uint64_t v10 = *(void *)v11;
  *((void *)v10 + 1) = v12;
  swift_bridgeObjectRetain();
  return a1;
}

char *sub_10000C1EC(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_10000D810();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v11 = sub_10000A090(&qword_100014450);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  *(void *)uint64_t v13 = *(void *)v14;
  *((void *)v13 + 1) = *((void *)v14 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_10000C3A4(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_10000D810();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_10000A090(&qword_100014450);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = *(int *)(a3 + 24);
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  *(_OWORD *)&a1[v9] = *(_OWORD *)&a2[v9];
  return a1;
}

char *sub_10000C4D4(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_10000D810();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v11 = sub_10000A090(&qword_100014450);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  uint64_t v12 = *(int *)(a3 + 24);
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v16 = *(void *)v14;
  uint64_t v15 = *((void *)v14 + 1);
  *(void *)uint64_t v13 = v16;
  *((void *)v13 + 1) = v15;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10000C678(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000C68C);
}

uint64_t sub_10000C68C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000A090(&qword_100014450);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_10000C760(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000C774);
}

uint64_t sub_10000C774(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10000A090(&qword_100014450);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = a2;
  }
  return result;
}

void sub_10000C838()
{
  sub_10000C8D8();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_10000C8D8()
{
  if (!qword_100014518)
  {
    sub_10000D810();
    unint64_t v0 = sub_10000DE80();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100014518);
    }
  }
}

unint64_t sub_10000C938()
{
  unint64_t result = qword_100014550;
  if (!qword_100014550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014550);
  }
  return result;
}

uint64_t sub_10000C98C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000C9A8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000C9C4()
{
  unint64_t result = qword_100014558;
  if (!qword_100014558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014558);
  }
  return result;
}

uint64_t sub_10000CA18()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 80, 7);
}

uint64_t sub_10000CA68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100006B54(a1, (void *)(v2 + 16), a2);
}

uint64_t sub_10000CA70(uint64_t a1)
{
  return a1;
}

unint64_t sub_10000CAC8()
{
  unint64_t result = qword_1000145B8;
  if (!qword_1000145B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000145B8);
  }
  return result;
}

uint64_t sub_10000CB1C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_10000CB2C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_10000CB3C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 152);
  uint64_t v3 = *(void *)(a1 + 160);
  char v4 = *(unsigned char *)(a1 + 168);
  uint64_t v5 = *(void *)(a1 + 184);
  uint64_t v6 = *(void *)(a1 + 192);
  char v7 = *(unsigned char *)(a1 + 200);
  sub_10000CB1C(*(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned char *)(a1 + 64));
  swift_bridgeObjectRetain();
  sub_10000CB1C(v2, v3, v4);
  swift_bridgeObjectRetain();
  sub_10000CB1C(v5, v6, v7);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_10000CC20(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 152);
  uint64_t v3 = *(void *)(a1 + 160);
  char v4 = *(unsigned char *)(a1 + 168);
  uint64_t v5 = *(void *)(a1 + 184);
  uint64_t v6 = *(void *)(a1 + 192);
  char v7 = *(unsigned char *)(a1 + 200);
  sub_10000CB2C(*(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned char *)(a1 + 64));
  swift_bridgeObjectRelease();
  sub_10000CB2C(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_10000CB2C(v5, v6, v7);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return a1;
}

uint64_t sub_10000CD08(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  char v4 = *(unsigned char *)(a1 + 72);
  sub_10000CB1C(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRetain();
  sub_10000CB1C(v2, v3, v4);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_10000CDB4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  char v4 = *(unsigned char *)(a1 + 72);
  sub_10000CB2C(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRelease();
  sub_10000CB2C(v2, v3, v4);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return a1;
}

uint64_t sub_10000CE60()
{
  uint64_t v1 = *(void *)(type metadata accessor for TodoView(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = sub_10000D810();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  }
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10000CF9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TodoView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000D000@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for TodoView(0) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_10000826C(v4, a1);
}

uint64_t sub_10000D080(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000D0E8(uint64_t a1)
{
  uint64_t v2 = sub_10000DDA0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000D144(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000A090(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000D1A8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000A090(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000D20C(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000D238(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 80);
  sub_10000CB1C(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRetain();
  sub_10000D2E0(v2, v3, v4, v5);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_10000D2E0(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_10000CB1C(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_10000D324(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000A090(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000D380(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 80);
  sub_10000CB2C(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRelease();
  sub_10000D428(v2, v3, v4, v5);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_10000D428(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_10000CB2C(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10000D46C(uint64_t a1)
{
  return a1;
}

unint64_t sub_10000D49C()
{
  unint64_t result = qword_100014610;
  if (!qword_100014610)
  {
    sub_10000D53C(&qword_100014618);
    sub_10000D768(&qword_100014620, &qword_100014628);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014610);
  }
  return result;
}

uint64_t sub_10000D53C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000D588()
{
  unint64_t result = qword_100014630;
  if (!qword_100014630)
  {
    sub_10000D53C(&qword_100014638);
    sub_10000D604();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014630);
  }
  return result;
}

unint64_t sub_10000D604()
{
  unint64_t result = qword_100014640;
  if (!qword_100014640)
  {
    sub_10000D53C(&qword_100014648);
    sub_10000D6A4();
    sub_10000D768(&qword_100014680, &qword_100014688);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014640);
  }
  return result;
}

unint64_t sub_10000D6A4()
{
  unint64_t result = qword_100014650;
  if (!qword_100014650)
  {
    sub_10000D53C(&qword_100014658);
    sub_10000D768(&qword_100014660, &qword_100014668);
    sub_10000D768(&qword_100014670, &qword_100014678);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014650);
  }
  return result;
}

uint64_t sub_10000D768(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000D53C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000D7B0()
{
  return static CustomNSError.errorDomain.getter();
}

uint64_t sub_10000D7C0()
{
  return CustomNSError.errorUserInfo.getter();
}

uint64_t sub_10000D7D0()
{
  return CustomNSError.errorCode.getter();
}

uint64_t sub_10000D7E0()
{
  return static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000D7F0()
{
  return DateComponents.date.getter();
}

uint64_t sub_10000D800()
{
  return DateComponents.calendar.getter();
}

uint64_t sub_10000D810()
{
  return type metadata accessor for DateComponents();
}

uint64_t sub_10000D820()
{
  return static FormatStyleCapitalizationContext.unknown.getter();
}

uint64_t sub_10000D830()
{
  return type metadata accessor for FormatStyleCapitalizationContext();
}

void sub_10000D840(NSURL *retstr@<X8>)
{
}

uint64_t sub_10000D850()
{
  return type metadata accessor for URL();
}

uint64_t sub_10000D860()
{
  return static Date.FormatStyle.TimeStyle.omitted.getter();
}

uint64_t sub_10000D870()
{
  return static Date.FormatStyle.TimeStyle.shortened.getter();
}

uint64_t sub_10000D880()
{
  return type metadata accessor for Date.FormatStyle.TimeStyle();
}

uint64_t sub_10000D890()
{
  return static Date.FormatStyle.DateStyle.abbreviated.getter();
}

uint64_t sub_10000D8A0()
{
  return static Date.FormatStyle.DateStyle.omitted.getter();
}

uint64_t sub_10000D8B0()
{
  return type metadata accessor for Date.FormatStyle.DateStyle();
}

uint64_t sub_10000D8C0()
{
  return Date.FormatStyle.day(_:)();
}

uint64_t sub_10000D8D0()
{
  return Date.FormatStyle.init(date:time:locale:calendar:timeZone:capitalizationContext:)();
}

uint64_t sub_10000D8E0()
{
  return Date.FormatStyle.month(_:)();
}

uint64_t sub_10000D8F0()
{
  return static Date.FormatStyle.Symbol.Day.defaultDigits.getter();
}

uint64_t sub_10000D900()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Day();
}

uint64_t sub_10000D910()
{
  return static Date.FormatStyle.Symbol.Month.abbreviated.getter();
}

uint64_t sub_10000D920()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Month();
}

uint64_t sub_10000D930()
{
  return Date.FormatStyle.format(_:)();
}

uint64_t sub_10000D940()
{
  return type metadata accessor for Date.FormatStyle();
}

uint64_t sub_10000D950()
{
  return Date.IntervalFormatStyle.init(date:time:locale:calendar:timeZone:)();
}

uint64_t sub_10000D960()
{
  return Date.IntervalFormatStyle.format(_:)();
}

uint64_t sub_10000D970()
{
  return type metadata accessor for Date.IntervalFormatStyle();
}

uint64_t sub_10000D980()
{
  return type metadata accessor for Date();
}

uint64_t sub_10000D990()
{
  return static Locale.autoupdatingCurrent.getter();
}

uint64_t sub_10000D9A0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_10000D9B0()
{
  return Calendar.isDate(_:inSameDayAs:)();
}

uint64_t sub_10000D9C0()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_10000D9D0()
{
  return static TimeZone.autoupdatingCurrent.getter();
}

uint64_t sub_10000D9E0()
{
  return type metadata accessor for TimeZone();
}

uint64_t sub_10000D9F0()
{
  return static AppExtension.main()();
}

uint64_t sub_10000DA00()
{
  return ThumbnailReply.iconCorner.setter();
}

uint64_t sub_10000DA10()
{
  return ThumbnailReply.iconFlavor.setter();
}

uint64_t sub_10000DA20()
{
  return static ThumbnailReply.imageRenderer(_:)();
}

uint64_t sub_10000DA30()
{
  return ThumbnailRequest.Options.maximumSize.getter();
}

uint64_t sub_10000DA40()
{
  return ThumbnailRequest.Options.scale.getter();
}

uint64_t sub_10000DA50()
{
  return type metadata accessor for ThumbnailRequest.Options();
}

uint64_t sub_10000DA70()
{
  return ThumbnailRequest.options.getter();
}

uint64_t sub_10000DA80()
{
  return ThumbnailProvider.init(contentType:generator:)();
}

uint64_t sub_10000DA90()
{
  return type metadata accessor for ThumbnailProvider();
}

uint64_t sub_10000DAB0()
{
  return static UTType.item.getter();
}

uint64_t sub_10000DAC0()
{
  return type metadata accessor for UTType();
}

uint64_t sub_10000DAD0()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_10000DAE0()
{
  return StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
}

uint64_t sub_10000DAF0()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_10000DB00()
{
  return GeometryProxy.size.getter();
}

uint64_t sub_10000DB10()
{
  return ImageRenderer.proposedSize.setter();
}

uint64_t sub_10000DB20()
{
  return ImageRenderer.render(rasterizationScale:renderer:)();
}

uint64_t sub_10000DB30()
{
  return ImageRenderer.init(content:)();
}

uint64_t sub_10000DB40()
{
  return ImageRenderer.isOpaque.setter();
}

uint64_t sub_10000DB50()
{
  return LinearGradient.init(gradient:startPoint:endPoint:)();
}

uint64_t sub_10000DB60()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_10000DB70()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_10000DB80()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_10000DB90()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_10000DBA0()
{
  return EnvironmentValues.locale.getter();
}

uint64_t sub_10000DBB0()
{
  return EnvironmentValues.locale.setter();
}

uint64_t sub_10000DBC0()
{
  return EnvironmentValues.textCase.getter();
}

uint64_t sub_10000DBD0()
{
  return EnvironmentValues.textCase.setter();
}

uint64_t sub_10000DBE0()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_10000DBF0()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_10000DC00()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_10000DC10()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_10000DC20()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_10000DC30()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_10000DC40()
{
  return static Edge.Set.horizontal.getter();
}

uint64_t sub_10000DC50()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_10000DC60()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_10000DC70()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_10000DC80()
{
  return static Font.Weight.bold.getter();
}

uint64_t sub_10000DC90()
{
  return static Font.Weight.medium.getter();
}

uint64_t sub_10000DCA0()
{
  return static Font.system(size:weight:design:)();
}

uint64_t sub_10000DCB0()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t sub_10000DCC0()
{
  return type metadata accessor for Text.Case();
}

uint64_t sub_10000DCD0()
{
  return Text.font(_:)();
}

uint64_t sub_10000DCE0()
{
  return Text.init<A>(_:format:)();
}

uint64_t sub_10000DCF0()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_10000DD00()
{
  return Text.init<A>(_:)();
}

uint64_t sub_10000DD10()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_10000DD20()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_10000DD30()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_10000DD40()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t sub_10000DD50()
{
  return static Color.blue.getter();
}

uint64_t sub_10000DD60()
{
  return static Color.white.getter();
}

uint64_t sub_10000DD70()
{
  return Color.init(_:red:green:blue:opacity:)();
}

uint64_t sub_10000DD80()
{
  return Color.init(_:white:opacity:)();
}

uint64_t sub_10000DD90()
{
  return AnyView.init<A>(_:)();
}

uint64_t sub_10000DDA0()
{
  return type metadata accessor for Capsule();
}

uint64_t sub_10000DDB0()
{
  return Gradient.init(colors:)();
}

uint64_t sub_10000DDC0()
{
  return static Alignment.center.getter();
}

uint64_t sub_10000DDD0()
{
  return static UnitPoint.topTrailing.getter();
}

uint64_t sub_10000DDE0()
{
  return static UnitPoint.bottomLeading.getter();
}

uint64_t sub_10000DDF0()
{
  return static UnitPoint.top.getter();
}

uint64_t sub_10000DE00()
{
  return static UnitPoint.bottom.getter();
}

uint64_t sub_10000DE10()
{
  return dispatch thunk of static Comparable.<= infix(_:_:)();
}

uint64_t sub_10000DE20()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000DE30()
{
  return specialized Array._endMutation()();
}

uint64_t sub_10000DE40()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10000DE50()
{
  return static MainActor.shared.getter();
}

uint64_t sub_10000DE60()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_10000DE70()
{
  return RangeReplaceableCollection<>.replacing<A, B>(_:with:maxReplacements:)();
}

uint64_t sub_10000DE80()
{
  return type metadata accessor for Optional();
}

uint64_t sub_10000DEB0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_10000DEC0()
{
  return Error._userInfo.getter();
}

uint64_t sub_10000DED0()
{
  return Hasher.init(_seed:)();
}

void sub_10000DEE0(Swift::UInt a1)
{
}

Swift::Int sub_10000DEF0()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

void objc_storeStrong(id *location, id obj)
{
}

uint64_t swift_allocError()
{
  return _swift_allocError();
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

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
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

id objc_msgSend_calendar(void *a1, const char *a2, ...)
{
  return _[a1 calendar];
}

id objc_msgSend_componentForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentForKey:");
}

id objc_msgSend_componentKeys(void *a1, const char *a2, ...)
{
  return _[a1 componentKeys];
}

id objc_msgSend_componentOccurrencesForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentOccurrencesForKey:");
}

id objc_msgSend_components(void *a1, const char *a2, ...)
{
  return _[a1 components];
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dateByAddingUnit_value_toDate_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingUnit:value:toDate:options:");
}

id objc_msgSend_dateFromComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateFromComponents:");
}

id objc_msgSend_dtend(void *a1, const char *a2, ...)
{
  return _[a1 dtend];
}

id objc_msgSend_dtstart(void *a1, const char *a2, ...)
{
  return _[a1 dtstart];
}

id objc_msgSend_due(void *a1, const char *a2, ...)
{
  return _[a1 due];
}

id objc_msgSend_hasTimeComponent(void *a1, const char *a2, ...)
{
  return _[a1 hasTimeComponent];
}

id objc_msgSend_initWithContentsOfURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfURL:options:error:");
}

id objc_msgSend_parseICSDate_calendar_isEndDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseICSDate:calendar:isEndDate:");
}

id objc_msgSend_setCalendar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCalendar:");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_summary(void *a1, const char *a2, ...)
{
  return _[a1 summary];
}

id objc_msgSend_systemCalendarForDate_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemCalendarForDate:options:");
}