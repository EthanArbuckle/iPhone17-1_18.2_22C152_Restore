BOOL sub_100002CB8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100002CD0()
{
  Swift::UInt v1 = *v0;
  sub_100016640();
  sub_100016650(v1);
  return sub_100016660();
}

void sub_100002D18()
{
  sub_100016650(*v0);
}

Swift::Int sub_100002D44()
{
  Swift::UInt v1 = *v0;
  sub_100016640();
  sub_100016650(v1);
  return sub_100016660();
}

void sub_100002D88(uint64_t *a1@<X8>)
{
  uint64_t v2 = 1;
  if (*v1) {
    uint64_t v2 = 2;
  }
  *a1 = v2;
}

void *sub_100002DA0(char a1, size_t a2)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    result = (void *)sub_1000165C0();
    __break(1u);
  }
  else
  {
    if (!a2) {
      return _swiftEmptyArrayStorage;
    }
    uint64_t v4 = sub_100016460();
    *(void *)(v4 + 16) = a2;
    memset((void *)(v4 + 32), a1 & 1, a2);
    return (void *)v4;
  }
  return result;
}

void *sub_100002E5C(char a1, uint64_t a2, uint64_t a3)
{
  if (a3 < 0)
  {
    result = (void *)sub_1000165C0();
    __break(1u);
  }
  else
  {
    if (a3)
    {
      uint64_t v6 = sub_100016460();
      uint64_t v7 = v6;
      *(void *)(v6 + 16) = a3;
      char v8 = a1 & 1;
      *(unsigned char *)(v6 + 32) = v8;
      *(void *)(v6 + 40) = a2;
      if (a3 != 1)
      {
        *(unsigned char *)(v6 + 48) = v8;
        *(void *)(v6 + 56) = a2;
        uint64_t v9 = a3 - 2;
        if (v9)
        {
          v10 = (void *)(v6 + 72);
          do
          {
            *((unsigned char *)v10 - 8) = v8;
            void *v10 = a2;
            v10 += 2;
            swift_retain();
            --v9;
          }
          while (v9);
        }
        swift_retain();
      }
    }
    else
    {
      swift_release();
      return _swiftEmptyArrayStorage;
    }
    return (void *)v7;
  }
  return result;
}

uint64_t sub_100002F64@<X0>(uint64_t a1@<X8>)
{
  uint64_t v68 = a1;
  uint64_t v62 = sub_1000064CC(&qword_100021728);
  uint64_t v2 = *(void *)(v62 - 8);
  __chkstk_darwin(v62);
  uint64_t v4 = (char *)&v61 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000064CC(&qword_100021730);
  uint64_t v6 = v5 - 8;
  __chkstk_darwin(v5);
  char v8 = (char *)&v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000064CC(&qword_100021738);
  uint64_t v10 = v9 - 8;
  __chkstk_darwin(v9);
  uint64_t v63 = (uint64_t)&v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_1000064CC(&qword_100021740);
  __chkstk_darwin(v61);
  v64 = (char *)&v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000064CC(&qword_100021748);
  uint64_t v66 = *(void *)(v13 - 8);
  uint64_t v67 = v13;
  __chkstk_darwin(v13);
  v65 = (char *)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = v1;
  sub_1000161E0();
  sub_1000064CC(&qword_100021750);
  sub_100006FF8();
  sub_1000160A0();
  char v15 = sub_1000161F0();
  v16 = self;
  id v17 = [v16 currentDevice];
  [v17 userInterfaceIdiom];

  sub_100016090();
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v26 = v62;
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v8, v4, v62);
  v27 = &v8[*(int *)(v6 + 44)];
  char *v27 = v15;
  uint64_t v28 = v61;
  *((void *)v27 + 1) = v19;
  *((void *)v27 + 2) = v21;
  *((void *)v27 + 3) = v23;
  *((void *)v27 + 4) = v25;
  v27[40] = 0;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v26);
  LOBYTE(v4) = sub_100016210();
  id v29 = [v16 currentDevice];
  [v29 userInterfaceIdiom];

  sub_100016090();
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v38 = v63;
  sub_100007C90((uint64_t)v8, v63, &qword_100021730);
  uint64_t v39 = v38 + *(int *)(v10 + 44);
  *(unsigned char *)uint64_t v39 = (_BYTE)v4;
  *(void *)(v39 + 8) = v31;
  *(void *)(v39 + 16) = v33;
  *(void *)(v39 + 24) = v35;
  *(void *)(v39 + 32) = v37;
  *(unsigned char *)(v39 + 40) = 0;
  sub_100007CF4((uint64_t)v8, &qword_100021730);
  LOBYTE(v10) = sub_100016220();
  v40 = v16;
  uint64_t v41 = (uint64_t)v64;
  id v42 = [v40 currentDevice];
  [v42 userInterfaceIdiom];

  sub_100016090();
  uint64_t v44 = v43;
  uint64_t v46 = v45;
  uint64_t v48 = v47;
  uint64_t v50 = v49;
  sub_100007C90(v38, v41, &qword_100021738);
  uint64_t v51 = v41 + *(int *)(v28 + 36);
  *(unsigned char *)uint64_t v51 = v10;
  *(void *)(v51 + 8) = v44;
  *(void *)(v51 + 16) = v46;
  *(void *)(v51 + 24) = v48;
  *(void *)(v51 + 32) = v50;
  *(unsigned char *)(v51 + 40) = 0;
  sub_100007CF4(v38, &qword_100021738);
  if (*(void *)(v1 + 8))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100016060();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v52 = swift_allocObject();
    long long v53 = *(_OWORD *)(v1 + 176);
    *(_OWORD *)(v52 + 176) = *(_OWORD *)(v1 + 160);
    *(_OWORD *)(v52 + 192) = v53;
    *(void *)(v52 + 208) = *(void *)(v1 + 192);
    long long v54 = *(_OWORD *)(v1 + 112);
    *(_OWORD *)(v52 + 112) = *(_OWORD *)(v1 + 96);
    *(_OWORD *)(v52 + 128) = v54;
    long long v55 = *(_OWORD *)(v1 + 144);
    *(_OWORD *)(v52 + 144) = *(_OWORD *)(v1 + 128);
    *(_OWORD *)(v52 + 160) = v55;
    long long v56 = *(_OWORD *)(v1 + 48);
    *(_OWORD *)(v52 + 48) = *(_OWORD *)(v1 + 32);
    *(_OWORD *)(v52 + 64) = v56;
    long long v57 = *(_OWORD *)(v1 + 80);
    *(_OWORD *)(v52 + 80) = *(_OWORD *)(v1 + 64);
    *(_OWORD *)(v52 + 96) = v57;
    long long v58 = *(_OWORD *)(v1 + 16);
    *(_OWORD *)(v52 + 16) = *(_OWORD *)v1;
    *(_OWORD *)(v52 + 32) = v58;
    sub_1000070F0(v1);
    sub_100007238(&qword_100021770, &qword_100021740, (void (*)(void))sub_100007210);
    v59 = v65;
    sub_100016280();
    swift_release();
    sub_100007CF4(v41, &qword_100021740);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v66 + 32))(v68, v59, v67);
  }
  else
  {
    type metadata accessor for AudioManager();
    sub_100006474();
    uint64_t result = sub_1000160F0();
    __break(1u);
  }
  return result;
}

void *sub_10000355C(void *result)
{
  if ((*result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v1 = (uint64_t)result;
    swift_getKeyPath();
    uint64_t v2 = swift_allocObject();
    long long v3 = *(_OWORD *)(v1 + 176);
    *(_OWORD *)(v2 + 176) = *(_OWORD *)(v1 + 160);
    *(_OWORD *)(v2 + 192) = v3;
    *(void *)(v2 + 208) = *(void *)(v1 + 192);
    long long v4 = *(_OWORD *)(v1 + 112);
    *(_OWORD *)(v2 + 112) = *(_OWORD *)(v1 + 96);
    *(_OWORD *)(v2 + 128) = v4;
    long long v5 = *(_OWORD *)(v1 + 144);
    *(_OWORD *)(v2 + 144) = *(_OWORD *)(v1 + 128);
    *(_OWORD *)(v2 + 160) = v5;
    long long v6 = *(_OWORD *)(v1 + 48);
    *(_OWORD *)(v2 + 48) = *(_OWORD *)(v1 + 32);
    *(_OWORD *)(v2 + 64) = v6;
    long long v7 = *(_OWORD *)(v1 + 80);
    *(_OWORD *)(v2 + 80) = *(_OWORD *)(v1 + 64);
    *(_OWORD *)(v2 + 96) = v7;
    long long v8 = *(_OWORD *)(v1 + 16);
    *(_OWORD *)(v2 + 16) = *(_OWORD *)v1;
    *(_OWORD *)(v2 + 32) = v8;
    sub_1000070F0(v1);
    sub_1000064CC(&qword_100021790);
    sub_1000064CC(&qword_100021768);
    sub_100007368();
    sub_1000075E8(&qword_100021760, &qword_100021768);
    return (void *)sub_100016370();
  }
  return result;
}

uint64_t sub_1000036A8@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v5 = *a1;
  *(void *)a3 = sub_1000161B0();
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 1;
  uint64_t v6 = sub_1000064CC(&qword_1000217A8);
  return sub_100003708(a2, v5, a3 + *(int *)(v6 + 44));
}

uint64_t sub_100003708@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v38 = a3;
  uint64_t v5 = sub_1000160E0();
  uint64_t v6 = v5 - 8;
  __chkstk_darwin(v5);
  long long v8 = (_OWORD *)((char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = sub_1000064CC(&qword_1000217B0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000064CC(&qword_1000217B8);
  uint64_t v13 = v12 - 8;
  __chkstk_darwin(v12);
  char v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1000064CC(&qword_1000217C0);
  uint64_t v17 = v16 - 8;
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v11 = sub_100016190();
  *((void *)v11 + 1) = 0;
  v11[16] = 1;
  uint64_t v20 = sub_1000064CC(&qword_1000217C8);
  sub_100003A1C(a1, a2, (uint64_t)&v11[*(int *)(v20 + 44)]);
  LOBYTE(a2) = sub_100016200();
  sub_100007C90((uint64_t)v11, (uint64_t)v15, &qword_1000217B0);
  uint64_t v21 = &v15[*(int *)(v13 + 44)];
  *uint64_t v21 = a2;
  *(_OWORD *)(v21 + 8) = 0u;
  *(_OWORD *)(v21 + 24) = 0u;
  v21[40] = 1;
  sub_100007CF4((uint64_t)v11, &qword_1000217B0);
  id v22 = [self secondarySystemBackgroundColor];
  uint64_t v23 = sub_100016290();
  LOBYTE(v13) = sub_100016200();
  sub_100007C90((uint64_t)v15, (uint64_t)v19, &qword_1000217B8);
  uint64_t v24 = &v19[*(int *)(v17 + 44)];
  *(void *)uint64_t v24 = v23;
  v24[8] = v13;
  sub_100007CF4((uint64_t)v15, &qword_1000217B8);
  uint64_t v25 = (char *)v8 + *(int *)(v6 + 28);
  uint64_t v26 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v27 = sub_1000161A0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 104))(v25, v26, v27);
  __asm { FMOV            V0.2D, #12.0 }
  *long long v8 = _Q0;
  uint64_t v33 = sub_1000064CC(&qword_1000217D0);
  uint64_t v34 = v38;
  uint64_t v35 = v38 + *(int *)(v33 + 36);
  sub_100007438((uint64_t)v8, v35);
  *(_WORD *)(v35 + *(int *)(sub_1000064CC(&qword_1000217D8) + 36)) = 256;
  sub_100007C90((uint64_t)v19, v34, &qword_1000217C0);
  sub_10000749C((uint64_t)v8);
  return sub_100007CF4((uint64_t)v19, &qword_1000217C0);
}

uint64_t sub_100003A1C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v99 = a3;
  uint64_t v101 = sub_1000064CC(&qword_1000217E0);
  uint64_t v100 = *(void *)(v101 - 8);
  __chkstk_darwin(v101);
  v105 = (char *)&v95 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = sub_1000064CC(&qword_1000217E8);
  uint64_t v6 = __chkstk_darwin(v106);
  uint64_t v98 = (uint64_t)&v95 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  v97 = (char *)&v95 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v108 = (uint64_t)&v95 - v11;
  __chkstk_darwin(v10);
  uint64_t v107 = (uint64_t)&v95 - v12;
  uint64_t v13 = sub_1000064CC(&qword_1000217F0);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  uint64_t v96 = (uint64_t)&v95 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v109 = (uint64_t *)((char *)&v95 - v16);
  v102 = (void *)sub_1000064CC(&qword_1000217F8);
  uint64_t v17 = *(v102 - 1);
  __chkstk_darwin(v102);
  uint64_t v19 = (char *)&v95 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = sub_1000064CC(&qword_100021800);
  uint64_t v20 = *(void *)(v104 - 8);
  __chkstk_darwin(v104);
  id v22 = (char *)&v95 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v103 = sub_1000064CC(&qword_100021808);
  uint64_t v23 = __chkstk_darwin(v103);
  uint64_t v95 = (uint64_t)&v95 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __chkstk_darwin(v23);
  uint64_t v27 = (char *)&v95 - v26;
  __chkstk_darwin(v25);
  uint64_t v110 = (uint64_t)&v95 - v28;
  uint64_t v29 = swift_allocObject();
  long long v30 = *(_OWORD *)(a1 + 176);
  *(_OWORD *)(v29 + 176) = *(_OWORD *)(a1 + 160);
  *(_OWORD *)(v29 + 192) = v30;
  uint64_t v31 = *(void *)(a1 + 192);
  long long v32 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(v29 + 112) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(v29 + 128) = v32;
  long long v33 = *(_OWORD *)(a1 + 144);
  *(_OWORD *)(v29 + 144) = *(_OWORD *)(a1 + 128);
  *(_OWORD *)(v29 + 160) = v33;
  long long v34 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v29 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v29 + 64) = v34;
  long long v35 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v29 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v29 + 96) = v35;
  long long v36 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v29 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v29 + 32) = v36;
  *(void *)(v29 + 208) = v31;
  *(void *)(v29 + 216) = a2;
  uint64_t v111 = a1;
  unint64_t v112 = a2;
  sub_1000070F0(a1);
  sub_1000064CC(&qword_100021810);
  sub_100007514();
  sub_100016340();
  if (!*(void *)(a1 + 8)) {
    goto LABEL_9;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100016060();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v37 = swift_allocObject();
  long long v38 = *(_OWORD *)(a1 + 176);
  *(_OWORD *)(v37 + 176) = *(_OWORD *)(a1 + 160);
  *(_OWORD *)(v37 + 192) = v38;
  uint64_t v39 = *(void *)(a1 + 192);
  long long v40 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(v37 + 112) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(v37 + 128) = v40;
  long long v41 = *(_OWORD *)(a1 + 144);
  *(_OWORD *)(v37 + 144) = *(_OWORD *)(a1 + 128);
  *(_OWORD *)(v37 + 160) = v41;
  long long v42 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v37 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v37 + 64) = v42;
  long long v43 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v37 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v37 + 96) = v43;
  long long v44 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v37 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v37 + 32) = v44;
  *(void *)(v37 + 208) = v39;
  *(void *)(v37 + 216) = a2;
  sub_1000070F0(a1);
  sub_1000075E8(&qword_100021840, &qword_1000217F8);
  uint64_t v45 = v102;
  sub_100016280();
  swift_release();
  (*(void (**)(char *, void *))(v17 + 8))(v19, v45);
  long long v115 = *(_OWORD *)(a1 + 152);
  sub_1000064CC(&qword_100021848);
  sub_100016320();
  LOBYTE(v45) = v113;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v47 = swift_allocObject();
  *(unsigned char *)(v47 + 16) = (_BYTE)v45;
  uint64_t v48 = v104;
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v27, v22, v104);
  uint64_t v49 = (uint64_t *)&v27[*(int *)(v103 + 36)];
  *uint64_t v49 = KeyPath;
  v49[1] = (uint64_t)sub_100007694;
  v49[2] = v47;
  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v48);
  sub_100007E6C((uint64_t)v27, v110, &qword_100021808);
  uint64_t v50 = sub_1000161C0();
  uint64_t v51 = v109;
  uint64_t *v109 = v50;
  v51[1] = 0;
  *((unsigned char *)v51 + 16) = 1;
  uint64_t v52 = sub_1000064CC(&qword_100021850);
  sub_1000052DC(a2, (uint64_t)v51 + *(int *)(v52 + 44));
  uint64_t v53 = swift_allocObject();
  long long v54 = *(_OWORD *)(a1 + 176);
  *(_OWORD *)(v53 + 176) = *(_OWORD *)(a1 + 160);
  *(_OWORD *)(v53 + 192) = v54;
  uint64_t v55 = *(void *)(a1 + 192);
  long long v56 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(v53 + 112) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(v53 + 128) = v56;
  long long v57 = *(_OWORD *)(a1 + 144);
  *(_OWORD *)(v53 + 144) = *(_OWORD *)(a1 + 128);
  *(_OWORD *)(v53 + 160) = v57;
  long long v58 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v53 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v53 + 64) = v58;
  long long v59 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v53 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v53 + 96) = v59;
  long long v60 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v53 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v53 + 32) = v60;
  *(void *)(v53 + 208) = v55;
  *(void *)(v53 + 216) = a2;
  __chkstk_darwin(v53);
  *(&v95 - 2) = a1;
  *(&v95 - 1) = a2;
  sub_1000070F0(a1);
  sub_1000064CC(&qword_100021858);
  unint64_t v61 = sub_1000076E0();
  uint64_t v62 = v105;
  sub_100016340();
  long long v115 = *(_OWORD *)(a1 + 56);
  long long v113 = *(_OWORD *)(a1 + 56);
  uint64_t v63 = sub_1000064CC(&qword_100021888);
  sub_100016320();
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)(v114 + 16) > a2)
  {
    char v64 = *(unsigned char *)(v114 + a2 + 32);
    swift_bridgeObjectRelease();
    uint64_t v65 = swift_getKeyPath();
    uint64_t v66 = swift_allocObject();
    *(unsigned char *)(v66 + 16) = (v64 & 1) == 0;
    uint64_t v67 = v100;
    uint64_t v103 = v61;
    uint64_t v104 = v63;
    uint64_t v68 = v108;
    uint64_t v69 = v101;
    v102 = *(void **)(v100 + 16);
    ((void (*)(uint64_t, char *, uint64_t))v102)(v108, v62, v101);
    v70 = (uint64_t *)(v68 + *(int *)(v106 + 36));
    uint64_t *v70 = v65;
    v70[1] = (uint64_t)sub_100008074;
    v70[2] = v66;
    uint64_t v100 = *(void *)(v67 + 8);
    ((void (*)(char *, uint64_t))v100)(v62, v69);
    sub_100007E6C(v68, v107, &qword_1000217E8);
    uint64_t v71 = swift_allocObject();
    v72 = v62;
    long long v73 = *(_OWORD *)(a1 + 176);
    *(_OWORD *)(v71 + 176) = *(_OWORD *)(a1 + 160);
    *(_OWORD *)(v71 + 192) = v73;
    uint64_t v74 = *(void *)(a1 + 192);
    long long v75 = *(_OWORD *)(a1 + 112);
    *(_OWORD *)(v71 + 112) = *(_OWORD *)(a1 + 96);
    *(_OWORD *)(v71 + 128) = v75;
    long long v76 = *(_OWORD *)(a1 + 144);
    *(_OWORD *)(v71 + 144) = *(_OWORD *)(a1 + 128);
    *(_OWORD *)(v71 + 160) = v76;
    long long v77 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)(v71 + 48) = *(_OWORD *)(a1 + 32);
    *(_OWORD *)(v71 + 64) = v77;
    long long v78 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)(v71 + 80) = *(_OWORD *)(a1 + 64);
    *(_OWORD *)(v71 + 96) = v78;
    long long v79 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v71 + 16) = *(_OWORD *)a1;
    *(_OWORD *)(v71 + 32) = v79;
    *(void *)(v71 + 208) = v74;
    *(void *)(v71 + 216) = a2;
    __chkstk_darwin(v71);
    *(&v95 - 2) = a1;
    *(&v95 - 1) = a2;
    sub_1000070F0(a1);
    sub_100016340();
    long long v113 = v115;
    sub_100016320();
    if (*(void *)(v114 + 16) > a2)
    {
      char v80 = *(unsigned char *)(v114 + a2 + 32);
      swift_bridgeObjectRelease();
      uint64_t v81 = swift_getKeyPath();
      uint64_t v82 = swift_allocObject();
      *(unsigned char *)(v82 + 16) = (v80 & 1) == 0;
      uint64_t v83 = (uint64_t)v97;
      ((void (*)(char *, char *, uint64_t))v102)(v97, v72, v69);
      v84 = (uint64_t *)(v83 + *(int *)(v106 + 36));
      uint64_t *v84 = v81;
      v84[1] = (uint64_t)sub_100008074;
      v84[2] = v82;
      ((void (*)(char *, uint64_t))v100)(v72, v69);
      uint64_t v85 = v108;
      sub_100007E6C(v83, v108, &qword_1000217E8);
      uint64_t v86 = v95;
      sub_100007C90(v110, v95, &qword_100021808);
      v87 = v109;
      uint64_t v88 = v96;
      sub_100007C90((uint64_t)v109, v96, &qword_1000217F0);
      uint64_t v89 = v107;
      sub_100007C90(v107, v83, &qword_1000217E8);
      uint64_t v90 = v98;
      sub_100007C90(v85, v98, &qword_1000217E8);
      uint64_t v91 = v99;
      sub_100007C90(v86, v99, &qword_100021808);
      v92 = (int *)sub_1000064CC(&qword_100021890);
      sub_100007C90(v88, v91 + v92[12], &qword_1000217F0);
      uint64_t v93 = v91 + v92[16];
      *(void *)uint64_t v93 = 0;
      *(unsigned char *)(v93 + 8) = 1;
      sub_100007C90(v83, v91 + v92[20], &qword_1000217E8);
      sub_100007C90(v90, v91 + v92[24], &qword_1000217E8);
      sub_100007CF4(v85, &qword_1000217E8);
      sub_100007CF4(v89, &qword_1000217E8);
      sub_100007CF4((uint64_t)v87, &qword_1000217F0);
      sub_100007CF4(v110, &qword_100021808);
      sub_100007CF4(v90, &qword_1000217E8);
      sub_100007CF4(v83, &qword_1000217E8);
      sub_100007CF4(v88, &qword_1000217F0);
      return sub_100007CF4(v86, &qword_100021808);
    }
    goto LABEL_8;
  }
  __break(1u);
LABEL_8:
  __break(1u);
LABEL_9:
  type metadata accessor for AudioManager();
  sub_100006474();
  uint64_t result = sub_1000160F0();
  __break(1u);
  return result;
}

uint64_t sub_1000045E0(uint64_t a1, unint64_t a2)
{
  long long v3 = *(char **)(a1 + 8);
  if (!v3) {
    goto LABEL_13;
  }
  uint64_t v5 = qword_1000216E0;
  swift_retain();
  if (v5 == -1)
  {
    if ((a2 & 0x8000000000000000) == 0) {
      goto LABEL_4;
    }
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  swift_once();
  if ((a2 & 0x8000000000000000) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  uint64_t v6 = *(void *)(qword_1000225B0 + 32);
  if (*(void *)(v6 + 16) <= a2)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v7 = v6 + 16 * a2;
  uint64_t v8 = *(void *)(v7 + 32);
  uint64_t v9 = *(void *)(v7 + 40);
  swift_bridgeObjectRetain();
  sub_10000FF48(v8, v9);
  swift_bridgeObjectRelease();
  swift_release();
  long long v12 = *(_OWORD *)(a1 + 152);
  sub_1000064CC(&qword_100021848);
  sub_100016330();
  long long v12 = *(_OWORD *)(a1 + 120);
  sub_1000064CC(&qword_1000218C8);
  sub_100016330();
  sub_100004808(a2);
  uint64_t v5 = sub_1000162B0();
  long long v12 = *(_OWORD *)(a1 + 136);
  uint64_t v14 = v12;
  sub_100007E6C((uint64_t)&v12 + 8, (uint64_t)v13, &qword_1000218E8);
  sub_10000792C((uint64_t)&v14);
  sub_100007958((uint64_t)v13);
  sub_1000064CC(&qword_1000218F0);
  sub_100016320();
  long long v3 = v11;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_11:
  }
    long long v3 = sub_1000060C0((uint64_t)v3);
  if (*((void *)v3 + 2) > a2)
  {
    *(void *)&v3[16 * a2 + 40] = v5;
    swift_release();
    sub_100016330();
    sub_100007984((uint64_t)&v14);
    return sub_1000079B0((uint64_t)v13);
  }
  __break(1u);
LABEL_13:
  type metadata accessor for AudioManager();
  sub_100006474();
  uint64_t result = sub_1000160F0();
  __break(1u);
  return result;
}

uint64_t sub_100004808(unint64_t a1)
{
  uint64_t v2 = v1;
  long long v28 = *(_OWORD *)(v1 + 136);
  uint64_t v30 = v28;
  sub_100007E6C((uint64_t)&v28 + 8, (uint64_t)v29, &qword_1000218E8);
  long long aBlock = v28;
  sub_10000792C((uint64_t)&v30);
  sub_100007958((uint64_t)v29);
  id v4 = (id)sub_1000064CC(&qword_1000218F0);
  sub_100016320();
  uint64_t v5 = (char *)v19;
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    if ((a1 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v5 = sub_1000060C0(v19);
  if ((a1 & 0x8000000000000000) != 0) {
    goto LABEL_8;
  }
LABEL_3:
  if (*((void *)v5 + 2) > a1)
  {
    v5[16 * a1 + 32] = 1;
    long long aBlock = v28;
    uint64_t v27 = v5;
    sub_100016330();
    sub_100007984((uint64_t)&v30);
    sub_1000079B0((uint64_t)v29);
    uint64_t v6 = self;
    uint64_t v7 = swift_allocObject();
    long long v8 = *(_OWORD *)(v2 + 176);
    *(_OWORD *)(v7 + 176) = *(_OWORD *)(v2 + 160);
    *(_OWORD *)(v7 + 192) = v8;
    uint64_t v9 = *(void *)(v2 + 192);
    long long v10 = *(_OWORD *)(v2 + 112);
    *(_OWORD *)(v7 + 112) = *(_OWORD *)(v2 + 96);
    *(_OWORD *)(v7 + 128) = v10;
    long long v11 = *(_OWORD *)(v2 + 144);
    *(_OWORD *)(v7 + 144) = *(_OWORD *)(v2 + 128);
    *(_OWORD *)(v7 + 160) = v11;
    long long v12 = *(_OWORD *)(v2 + 48);
    *(_OWORD *)(v7 + 48) = *(_OWORD *)(v2 + 32);
    *(_OWORD *)(v7 + 64) = v12;
    long long v13 = *(_OWORD *)(v2 + 80);
    *(_OWORD *)(v7 + 80) = *(_OWORD *)(v2 + 64);
    *(_OWORD *)(v7 + 96) = v13;
    long long v14 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v7 + 16) = *(_OWORD *)v2;
    *(_OWORD *)(v7 + 32) = v14;
    *(void *)(v7 + 208) = v9;
    *(void *)(v7 + 216) = a1;
    uint64_t v24 = sub_100007F9C;
    uint64_t v25 = v7;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    id v22 = sub_10000946C;
    uint64_t v23 = &unk_10001D050;
    uint64_t v15 = _Block_copy(&aBlock);
    sub_1000070F0(v2);
    swift_release();
    id v4 = [v6 scheduledTimerWithTimeInterval:1 repeats:v15 block:0.5];
    _Block_release(v15);
    long long aBlock = *(_OWORD *)(v2 + 104);
    uint64_t v27 = (char *)aBlock;
    sub_100007E6C((uint64_t)&aBlock + 8, (uint64_t)v26, &qword_1000218D8);
    sub_10000792C((uint64_t)&v27);
    sub_100007958((uint64_t)v26);
    sub_1000064CC(&qword_1000218E0);
    sub_100016320();
    uint64_t v5 = v20;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if (result) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  __break(1u);
LABEL_10:
  uint64_t result = sub_1000060AC((uint64_t)v5);
  uint64_t v5 = (char *)result;
LABEL_5:
  if (*((void *)v5 + 2) <= a1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v17 = &v5[8 * a1];
    uint64_t v18 = (void *)*((void *)v17 + 4);
    *((void *)v17 + 4) = v4;

    sub_100016450();
    sub_100016330();
    sub_100007984((uint64_t)&v27);
    return sub_1000079B0((uint64_t)v26);
  }
  return result;
}

uint64_t sub_100004AEC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_1000162F0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v27 = *(_OWORD *)(a1 + 136);
  long long v22 = *(_OWORD *)(a1 + 136);
  sub_1000064CC(&qword_1000218F0);
  uint64_t result = sub_100016320();
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t result = v20;
  if (*(void *)(v20 + 16) <= a2)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  swift_bridgeObjectRelease();
  sub_1000162E0();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for Image.ResizingMode.stretch(_:), v6);
  uint64_t v19 = sub_100016300();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_100016380();
  sub_1000160C0();
  uint64_t v11 = v22;
  char v12 = BYTE8(v22);
  uint64_t v13 = v23;
  char v14 = v24;
  uint64_t v16 = v25;
  uint64_t v15 = v26;
  long long v20 = v27;
  uint64_t result = sub_100016320();
  if (*(void *)(v21 + 16) > a2)
  {
    uint64_t v17 = *(void *)(v21 + 16 * a2 + 40);
    swift_retain();
    swift_bridgeObjectRelease();
    uint64_t result = swift_getKeyPath();
    *(void *)a3 = v19;
    *(void *)(a3 + 8) = v11;
    *(unsigned char *)(a3 + 16) = v12;
    *(void *)(a3 + 24) = v13;
    *(unsigned char *)(a3 + 32) = v14;
    *(void *)(a3 + 40) = v16;
    *(void *)(a3 + 48) = v15;
    *(void *)(a3 + 56) = result;
    *(void *)(a3 + 64) = v17;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_100004D5C(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a1 + 8)) {
    goto LABEL_15;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100016060();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  if ((v14 & 1) == 0) {
    return result;
  }
  os_log_type_t v5 = sub_1000164A0();
  if (qword_1000216E8 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_1000225B8;
  if (os_log_type_enabled((os_log_t)qword_1000225B8, v5))
  {
    sub_1000070F0(a1);
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 134218240;
    *(void *)&long long v14 = a2;
    sub_100016570();
    *(_WORD *)(v7 + 12) = 2048;
    long long v14 = *(_OWORD *)(a1 + 120);
    sub_1000064CC(&qword_1000218C8);
    sub_100016320();
    sub_100016570();
    sub_100007D50(a1);
    _os_log_impl((void *)&_mh_execute_header, v6, v5, "View: audio audioPlaybackCompleted : Index%ld, selectedPlaybackIndex%ld", (uint8_t *)v7, 0x16u);
    swift_slowDealloc();
  }
  long long v14 = *(_OWORD *)(a1 + 152);
  sub_1000064CC(&qword_100021848);
  sub_100016330();
  long long v14 = *(_OWORD *)(a1 + 120);
  sub_1000064CC(&qword_1000218C8);
  sub_100016320();
  sub_1000050A0(v9);
  *((void *)&v11 + 1) = *((void *)&v14 + 1);
  sub_100016320();
  long long v11 = *(_OWORD *)(a1 + 56);
  uint64_t v13 = v11;
  sub_100007E6C((uint64_t)&v11 + 8, (uint64_t)v12, &qword_1000218D0);
  sub_10000792C((uint64_t)&v13);
  sub_100007958((uint64_t)v12);
  sub_1000064CC(&qword_100021888);
  sub_100016320();
  uint64_t v8 = (char *)v10;
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    if ((v9 & 0x8000000000000000) == 0) {
      goto LABEL_9;
    }
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v8 = sub_1000060D4(v10);
  if ((v9 & 0x8000000000000000) != 0) {
    goto LABEL_13;
  }
LABEL_9:
  if (v9 >= *((void *)v8 + 2))
  {
LABEL_14:
    __break(1u);
LABEL_15:
    type metadata accessor for AudioManager();
    sub_100006474();
    uint64_t result = sub_1000160F0();
    __break(1u);
    return result;
  }
  v8[v9 + 32] = 1;
  sub_100016330();
  sub_100007984((uint64_t)&v13);
  sub_1000079B0((uint64_t)v12);
  swift_retain();
  sub_10000E550();
  return swift_release();
}

uint64_t sub_1000050A0(unint64_t a1)
{
  uint64_t v2 = v1;
  long long v14 = *(_OWORD *)(v1 + 104);
  uint64_t v16 = v14;
  sub_100007E6C((uint64_t)&v14 + 8, (uint64_t)v15, &qword_1000218D8);
  long long v11 = v14;
  sub_1000064CC(&qword_1000218E0);
  id v4 = &v11;
  sub_100016320();
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    id v4 = v9;
    if (*((void *)v9 + 2) > a1)
    {
      id v5 = *((id *)v9 + a1 + 4);
      swift_bridgeObjectRelease();
      [v5 invalidate];

      long long v11 = v14;
      sub_10000792C((uint64_t)&v16);
      sub_100007958((uint64_t)v15);
      sub_100016320();
      id v4 = v9;
      if (swift_isUniquelyReferenced_nonNull_native()) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_10:
  id v4 = (long long *)sub_1000060AC((uint64_t)v4);
  unint64_t v9 = v4;
LABEL_4:
  if (*((void *)v4 + 2) <= a1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v6 = (char *)v4 + 8 * a1;
    uint64_t v7 = (void *)*((void *)v6 + 4);
    *((void *)v6 + 4) = 0;

    sub_100016450();
    long long v11 = v14;
    uint64_t v13 = v9;
    sub_100016330();
    sub_100007984((uint64_t)&v16);
    sub_1000079B0((uint64_t)v15);
    long long v11 = *(_OWORD *)(v2 + 136);
    uint64_t v13 = (long long *)v11;
    sub_100007E6C((uint64_t)&v11 + 8, (uint64_t)v12, &qword_1000218E8);
    sub_10000792C((uint64_t)&v13);
    sub_100007958((uint64_t)v12);
    sub_1000064CC(&qword_1000218F0);
    sub_100016320();
    id v4 = v10;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if (result) {
      goto LABEL_6;
    }
  }
  uint64_t result = (uint64_t)sub_1000060C0((uint64_t)v4);
  id v4 = (long long *)result;
LABEL_6:
  if (*((void *)v4 + 2) <= a1)
  {
    __break(1u);
  }
  else
  {
    LOBYTE(v4[a1 + 2]) = 1;
    sub_100016330();
    sub_100007984((uint64_t)&v13);
    return sub_1000079B0((uint64_t)v12);
  }
  return result;
}

uint64_t sub_1000052DC@<X0>(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1000064CC(&qword_1000218A8);
  __chkstk_darwin();
  uint64_t v6 = (uint64_t *)((char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_100016230();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000064CC(&qword_1000218B0);
  uint64_t result = __chkstk_darwin();
  long long v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000216E0 == -1)
  {
    if ((a1 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t result = swift_once();
  if ((a1 & 0x8000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v15 = *(void *)(qword_1000225B0 + 32);
  if (*(void *)(v15 + 16) > a1)
  {
    uint64_t v16 = v15 + 16 * a1;
    uint64_t v34 = v4;
    uint64_t v35 = a2;
    uint64_t v17 = *(void *)(v16 + 32);
    uint64_t v18 = *(void *)(v16 + 40);
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_1000079DC(v17, v18);
    uint64_t v21 = v20;
    swift_bridgeObjectRelease();
    uint64_t v36 = v19;
    uint64_t v37 = v21;
    sub_100007B90();
    uint64_t v22 = sub_100016240();
    uint64_t v32 = v11;
    uint64_t v33 = v23;
    uint64_t v24 = v22;
    uint64_t v26 = v25;
    LOBYTE(v19) = v27 & 1;
    uint64_t KeyPath = swift_getKeyPath();
    (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for Text.TruncationMode.tail(_:), v7);
    uint64_t v29 = v7;
    uint64_t v30 = swift_getKeyPath();
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))((char *)v6 + *(int *)(v34 + 28), v10, v29);
    *uint64_t v6 = v30;
    sub_100007C90((uint64_t)v6, (uint64_t)&v14[*(int *)(v32 + 36)], &qword_1000218A8);
    *(void *)long long v14 = v24;
    *((void *)v14 + 1) = v26;
    v14[16] = v19;
    *((void *)v14 + 3) = v33;
    *((void *)v14 + 4) = KeyPath;
    *((void *)v14 + 5) = 1;
    v14[48] = 0;
    sub_100007C70(v24, v26, v19);
    swift_bridgeObjectRetain();
    swift_retain();
    sub_100007CF4((uint64_t)v6, &qword_1000218A8);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v29);
    sub_100007C80(v24, v26, v19);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v31 = v35;
    sub_100007C90((uint64_t)v14, v35, &qword_1000218B0);
    *(_WORD *)(v31 + *(int *)(sub_1000064CC(&qword_1000218C0) + 36)) = 256;
    return sub_100007CF4((uint64_t)v14, &qword_1000218B0);
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_100005648@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_1000162F0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000162E0();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for Image.ResizingMode.stretch(_:), v6);
  uint64_t v29 = sub_100016300();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_100016380();
  uint64_t result = sub_1000160C0();
  uint64_t v11 = v32;
  char v12 = v33;
  uint64_t v13 = v34;
  char v14 = v35;
  uint64_t v16 = v36;
  uint64_t v15 = v37;
  if (qword_1000216E0 == -1)
  {
    if ((a2 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t result = swift_once();
  if ((a2 & 0x8000000000000000) != 0) {
    goto LABEL_12;
  }
LABEL_3:
  uint64_t v17 = *(void *)(qword_1000225B0 + 32);
  if (*(void *)(v17 + 16) > a2)
  {
    uint64_t v18 = v17 + 16 * a2;
    uint64_t v20 = *(void *)(v18 + 32);
    uint64_t v19 = *(void *)(v18 + 40);
    long long v30 = *(_OWORD *)(a1 + 72);
    swift_bridgeObjectRetain();
    sub_1000064CC(&qword_100021898);
    sub_100016320();
    uint64_t v21 = v31;
    if (*(void *)(v31 + 16) && (unint64_t v22 = sub_100015C34(v20, v19), (v23 & 1) != 0))
    {
      int v24 = *(unsigned __int8 *)(*(void *)(v21 + 56) + v22);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v24 == 1)
      {
        uint64_t v25 = sub_1000162D0();
LABEL_10:
        uint64_t v27 = v25;
        uint64_t result = swift_getKeyPath();
        *(void *)a3 = v29;
        *(void *)(a3 + 8) = 0;
        *(_WORD *)(a3 + 16) = 1;
        *(void *)(a3 + 24) = v11;
        *(unsigned char *)(a3 + 32) = v12;
        *(void *)(a3 + 40) = v13;
        *(unsigned char *)(a3 + 48) = v14;
        *(void *)(a3 + 56) = v16;
        *(void *)(a3 + 64) = v15;
        *(void *)(a3 + 72) = result;
        *(void *)(a3 + 80) = v27;
        return result;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    id v26 = [self lightGrayColor];
    uint64_t v25 = sub_100016290();
    goto LABEL_10;
  }
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_100005904(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  if (qword_1000216E0 == -1)
  {
    if ((a2 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t result = swift_once();
  if ((a2 & 0x8000000000000000) != 0) {
    goto LABEL_8;
  }
LABEL_3:
  uint64_t v6 = *(void *)(qword_1000225B0 + 32);
  if (*(void *)(v6 + 16) <= a2)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  uint64_t v7 = v6 + 16 * a2;
  uint64_t v9 = *(void *)(v7 + 32);
  uint64_t v8 = *(void *)(v7 + 40);
  long long v12 = *(_OWORD *)(v5 + 72);
  uint64_t v14 = v12;
  sub_100007E6C((uint64_t)&v12 + 8, (uint64_t)v13, &qword_1000218A0);
  swift_bridgeObjectRetain();
  sub_10000792C((uint64_t)&v14);
  sub_100007958((uint64_t)v13);
  sub_1000064CC(&qword_100021898);
  sub_100016320();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_1000140F8(a3 & 1, v9, v8, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100016330();
  sub_100007984((uint64_t)&v14);
  uint64_t result = sub_1000079B0((uint64_t)v13);
  uint64_t v11 = *(void (**)())(v5 + 184);
  if (v11)
  {
    sub_100016320();
    v11();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100005AC0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_1000162F0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000162E0();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for Image.ResizingMode.stretch(_:), v6);
  uint64_t v29 = sub_100016300();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_100016380();
  uint64_t result = sub_1000160C0();
  uint64_t v11 = v32;
  char v12 = v33;
  uint64_t v13 = v34;
  char v14 = v35;
  uint64_t v16 = v36;
  uint64_t v15 = v37;
  if (qword_1000216E0 == -1)
  {
    if ((a2 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t result = swift_once();
  if ((a2 & 0x8000000000000000) != 0) {
    goto LABEL_12;
  }
LABEL_3:
  uint64_t v17 = *(void *)(qword_1000225B0 + 32);
  if (*(void *)(v17 + 16) > a2)
  {
    uint64_t v18 = v17 + 16 * a2;
    uint64_t v20 = *(void *)(v18 + 32);
    uint64_t v19 = *(void *)(v18 + 40);
    long long v30 = *(_OWORD *)(a1 + 72);
    swift_bridgeObjectRetain();
    sub_1000064CC(&qword_100021898);
    sub_100016320();
    uint64_t v21 = v31;
    if (*(void *)(v31 + 16) && (unint64_t v22 = sub_100015C34(v20, v19), (v23 & 1) != 0))
    {
      char v24 = *(unsigned char *)(*(void *)(v21 + 56) + v22);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v24 & 1) == 0)
      {
        uint64_t v25 = sub_1000162A0();
LABEL_10:
        uint64_t v27 = v25;
        uint64_t result = swift_getKeyPath();
        *(void *)a3 = v29;
        *(void *)(a3 + 8) = 0;
        *(_WORD *)(a3 + 16) = 1;
        *(void *)(a3 + 24) = v11;
        *(unsigned char *)(a3 + 32) = v12;
        *(void *)(a3 + 40) = v13;
        *(unsigned char *)(a3 + 48) = v14;
        *(void *)(a3 + 56) = v16;
        *(void *)(a3 + 64) = v15;
        *(void *)(a3 + 72) = result;
        *(void *)(a3 + 80) = v27;
        return result;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    id v26 = [self lightGrayColor];
    uint64_t v25 = sub_100016290();
    goto LABEL_10;
  }
LABEL_13:
  __break(1u);
  return result;
}

void sub_100005D78(uint64_t a1)
{
  if (*(void *)(a1 + 8))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100016060();
    swift_release();
    swift_release();
    swift_release();
    if (v4)
    {
      unint64_t v1 = sub_100014994((uint64_t)&_swiftEmptyArrayStorage);
      if (qword_1000216F8 != -1) {
        swift_once();
      }
      uint64_t Strong = swift_unknownObjectWeakLoadStrong();
      if (Strong)
      {
        long long v3 = (void *)Strong;
        sub_1000156FC(3, v1);
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
  }
  else
  {
    type metadata accessor for AudioManager();
    sub_100006474();
    sub_1000160F0();
    __break(1u);
  }
}

uint64_t sub_100005EAC()
{
  return swift_release();
}

uint64_t sub_100005F18(uint64_t a1, unint64_t a2)
{
  long long v6 = *(_OWORD *)(a1 + 136);
  uint64_t v8 = v6;
  sub_100007E6C((uint64_t)&v6 + 8, (uint64_t)v7, &qword_1000218E8);
  sub_10000792C((uint64_t)&v8);
  sub_100007958((uint64_t)v7);
  sub_1000064CC(&qword_1000218F0);
  sub_100016320();
  uint64_t v3 = v5;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result)
  {
    if ((a2 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t result = (uint64_t)sub_1000060C0(v5);
  uint64_t v3 = result;
  if ((a2 & 0x8000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if (*(void *)(v3 + 16) > a2)
  {
    *(unsigned char *)(v3 + 16 * a2 + 32) = (*(unsigned char *)(v3 + 16 * a2 + 32) & 1) == 0;
    sub_100016330();
    sub_100007984((uint64_t)&v8);
    return sub_1000079B0((uint64_t)v7);
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_10000602C()
{
  return sub_100016270();
}

uint64_t sub_100006048@<X0>(uint64_t a1@<X8>)
{
  return sub_100002F64(a1);
}

uint64_t sub_1000060AC(uint64_t a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

char *sub_1000060C0(uint64_t a1)
{
  return sub_10000C88C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_1000060D4(uint64_t a1)
{
  return sub_10000C99C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1000060E8(uint64_t a1)
{
  uint64_t v2 = sub_100016230();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_100016120();
}

void *sub_1000061B0@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for AudioManager();
  sub_100006474();
  uint64_t v2 = sub_100016100();
  uint64_t v12 = v3;
  uint64_t v13 = v2;
  sub_100016310();
  char v11 = v14;
  sub_100016310();
  char v10 = v14;
  sub_100016310();
  uint64_t v4 = v14;
  sub_1000064CC(&qword_100021708);
  uint64_t v5 = (_OWORD *)swift_allocObject();
  v5[1] = xmmword_100018920;
  v5[2] = 0u;
  v5[3] = 0u;
  uint64_t v15 = v5;
  sub_100016450();
  sub_1000064CC(&qword_100021710);
  sub_100016310();
  sub_100016310();
  sub_100016310();
  sub_1000064CC(&qword_100021718);
  sub_100016310();
  if (qword_1000216E0 != -1) {
    swift_once();
  }
  size_t v6 = *(void *)(*(void *)(qword_1000225B0 + 32) + 16);
  uint64_t v7 = sub_100002DA0(0, v6);
  uint64_t v8 = sub_1000162C0();
  uint64_t result = sub_100002E5C(0, v8, v6);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v13;
  *(void *)(a1 + 16) = v12;
  *(unsigned char *)(a1 + 24) = v11;
  *(_DWORD *)(a1 + 25) = v15;
  *(_DWORD *)(a1 + 28) = *(_DWORD *)((char *)&v15 + 3);
  *(void *)(a1 + 32) = v16;
  *(unsigned char *)(a1 + 40) = v10;
  *(_DWORD *)(a1 + 41) = 2;
  *(_DWORD *)(a1 + 44) = 0;
  *(void *)(a1 + 48) = v16;
  *(void *)(a1 + 56) = v7;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = &_swiftEmptyDictionarySingleton;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = v4;
  *(void *)(a1 + 96) = v16;
  *(void *)(a1 + 104) = v15;
  *(void *)(a1 + 112) = v16;
  *(void *)(a1 + 120) = v15;
  *(void *)(a1 + 128) = v16;
  *(void *)(a1 + 136) = result;
  *(void *)(a1 + 144) = 0;
  *(unsigned char *)(a1 + 152) = (_BYTE)v15;
  *(_DWORD *)(a1 + 156) = *(_DWORD *)&v18[3];
  *(_DWORD *)(a1 + 153) = *(_DWORD *)v18;
  *(void *)(a1 + 160) = v16;
  *(unsigned char *)(a1 + 168) = (_BYTE)v15;
  *(_DWORD *)(a1 + 172) = *(_DWORD *)&v17[3];
  *(_DWORD *)(a1 + 169) = *(_DWORD *)v17;
  *(void *)(a1 + 176) = v16;
  *(void *)(a1 + 184) = 0;
  *(void *)(a1 + 192) = 0;
  return result;
}

unint64_t sub_100006474()
{
  unint64_t result = qword_100021700;
  if (!qword_100021700)
  {
    type metadata accessor for AudioManager();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021700);
  }
  return result;
}

uint64_t sub_1000064CC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for MicrophoneTestEvaluatingView.ButtonState(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  return a1;
}

uint64_t destroy for MicrophoneTestEvaluatingView.ButtonState()
{
  return swift_release();
}

uint64_t assignWithCopy for MicrophoneTestEvaluatingView.ButtonState(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for MicrophoneTestEvaluatingView.ButtonState(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for MicrophoneTestEvaluatingView.ButtonState(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for MicrophoneTestEvaluatingView.ButtonState(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MicrophoneTestEvaluatingView.ButtonState(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MicrophoneTestEvaluatingView.ButtonState()
{
  return &type metadata for MicrophoneTestEvaluatingView.ButtonState;
}

unsigned char *initializeBufferWithCopyOfBuffer for MicrophoneTestEvaluatingView.AlertType(unsigned char *result, unsigned char *a2)
{
  void *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MicrophoneTestEvaluatingView.AlertType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for MicrophoneTestEvaluatingView.AlertType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 1;
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
        JUMPOUT(0x1000067DCLL);
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
          void *result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_100006804(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100006810(unsigned char *result, char a2)
{
  void *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MicrophoneTestEvaluatingView.AlertType()
{
  return &type metadata for MicrophoneTestEvaluatingView.AlertType;
}

uint64_t initializeBufferWithCopyOfBuffer for MicrophoneTestEvaluatingView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for MicrophoneTestEvaluatingView(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  if (*(void *)(a1 + 184))
  {
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for MicrophoneTestEvaluatingView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  uint64_t v7 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v7;
  uint64_t v8 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v8;
  uint64_t v9 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v9;
  uint64_t v13 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v13;
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  char v10 = (_OWORD *)(a2 + 184);
  uint64_t v14 = *(void *)(a2 + 184);
  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  if (v14)
  {
    uint64_t v11 = *(void *)(a2 + 192);
    *(void *)(a1 + 184) = v14;
    *(void *)(a1 + 192) = v11;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 184) = *v10;
  }
  return a1;
}

uint64_t assignWithCopy for MicrophoneTestEvaluatingView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_release();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_retain();
  swift_release();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_retain();
  swift_release();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_retain();
  swift_release();
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_retain();
  swift_release();
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_retain();
  swift_release();
  uint64_t v4 = *(void *)(a2 + 184);
  if (!*(void *)(a1 + 184))
  {
    if (v4)
    {
      uint64_t v6 = *(void *)(a2 + 192);
      *(void *)(a1 + 184) = v4;
      *(void *)(a1 + 192) = v6;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
    return a1;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v5 = *(void *)(a2 + 192);
  *(void *)(a1 + 184) = v4;
  *(void *)(a1 + 192) = v5;
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for MicrophoneTestEvaluatingView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  long long v5 = *(_OWORD *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 96) = v6;
  __n128 result = *(__n128 *)(a2 + 144);
  long long v9 = *(_OWORD *)(a2 + 160);
  long long v10 = *(_OWORD *)(a2 + 176);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(_OWORD *)(a1 + 160) = v9;
  *(_OWORD *)(a1 + 176) = v10;
  *(__n128 *)(a1 + 144) = result;
  return result;
}

uint64_t assignWithTake for MicrophoneTestEvaluatingView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  swift_release();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  swift_release();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_release();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_release();
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_release();
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_release();
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_release();
  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_release();
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_release();
  uint64_t v5 = *(void *)(a2 + 184);
  if (!*(void *)(a1 + 184))
  {
    if (v5)
    {
      uint64_t v7 = *(void *)(a2 + 192);
      *(void *)(a1 + 184) = v5;
      *(void *)(a1 + 192) = v7;
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
    return a1;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v6 = *(void *)(a2 + 192);
  *(void *)(a1 + 184) = v5;
  *(void *)(a1 + 192) = v6;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for MicrophoneTestEvaluatingView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 200)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 56);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MicrophoneTestEvaluatingView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 200) = 1;
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
      *(void *)(result + 56) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 200) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MicrophoneTestEvaluatingView()
{
  return &type metadata for MicrophoneTestEvaluatingView;
}

uint64_t sub_100006F70()
{
  return swift_getOpaqueTypeConformance2();
}

void *sub_100006F8C()
{
  return &protocol witness table for Int;
}

unint64_t sub_100006F9C()
{
  unint64_t result = qword_100021720;
  if (!qword_100021720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021720);
  }
  return result;
}

void *sub_100006FF0()
{
  return sub_10000355C(*(void **)(v0 + 16));
}

unint64_t sub_100006FF8()
{
  unint64_t result = qword_100021758;
  if (!qword_100021758)
  {
    sub_100007090(&qword_100021750);
    sub_1000075E8(&qword_100021760, &qword_100021768);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021758);
  }
  return result;
}

uint64_t sub_100007090(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000070E0()
{
  return sub_100007ED8(216);
}

void sub_1000070E8()
{
  sub_100005D78(v0 + 16);
}

uint64_t sub_1000070F0(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 184);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_100007200(v3);
  return a1;
}

uint64_t sub_100007200(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_100007210()
{
  return sub_100007238(&qword_100021778, &qword_100021738, (void (*)(void))sub_1000072B8);
}

uint64_t sub_100007238(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007090(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000072B8()
{
  unint64_t result = qword_100021780;
  if (!qword_100021780)
  {
    sub_100007090(&qword_100021730);
    sub_1000075E8(&qword_100021788, &qword_100021728);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021780);
  }
  return result;
}

uint64_t sub_100007358()
{
  return sub_100007ED8(216);
}

uint64_t sub_100007360@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000036A8(a1, v2 + 16, a2);
}

unint64_t sub_100007368()
{
  unint64_t result = qword_100021798;
  if (!qword_100021798)
  {
    sub_100007090(&qword_100021790);
    sub_1000073E4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021798);
  }
  return result;
}

unint64_t sub_1000073E4()
{
  unint64_t result = qword_1000217A0;
  if (!qword_1000217A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000217A0);
  }
  return result;
}

uint64_t sub_100007438(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000160E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000749C(uint64_t a1)
{
  uint64_t v2 = sub_1000160E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000074F8()
{
  return sub_100007ED8(224);
}

uint64_t sub_100007500()
{
  return sub_1000045E0(v0 + 16, *(void *)(v0 + 216));
}

uint64_t sub_10000750C@<X0>(uint64_t a1@<X8>)
{
  return sub_100004AEC(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

unint64_t sub_100007514()
{
  unint64_t result = qword_100021818;
  if (!qword_100021818)
  {
    sub_100007090(&qword_100021810);
    sub_100007814(&qword_100021820, &qword_100021828);
    sub_1000075E8(&qword_100021830, &qword_100021838);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021818);
  }
  return result;
}

uint64_t sub_1000075D4()
{
  return sub_100007ED8(224);
}

uint64_t sub_1000075DC()
{
  return sub_100004D5C(v0 + 16, *(void *)(v0 + 216));
}

uint64_t sub_1000075E8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007090(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000762C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100016150();
  *a1 = result & 1;
  return result;
}

uint64_t sub_10000765C()
{
  return sub_100016160();
}

uint64_t sub_100007684()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_100007694(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_1000076AC()
{
  return sub_100007ED8(224);
}

uint64_t sub_1000076B4()
{
  return sub_100005904(v0 + 16, *(void *)(v0 + 216), 1);
}

uint64_t sub_1000076D8@<X0>(uint64_t a1@<X8>)
{
  return sub_100005648(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

unint64_t sub_1000076E0()
{
  unint64_t result = qword_100021860;
  if (!qword_100021860)
  {
    sub_100007090(&qword_100021858);
    sub_100007780();
    sub_1000075E8(&qword_100021830, &qword_100021838);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021860);
  }
  return result;
}

unint64_t sub_100007780()
{
  unint64_t result = qword_100021868;
  if (!qword_100021868)
  {
    sub_100007090(&qword_100021870);
    sub_100007814(&qword_100021878, &qword_100021880);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021868);
  }
  return result;
}

uint64_t sub_100007814(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007090(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100007880()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100007890()
{
  return sub_100007ED8(224);
}

uint64_t sub_100007898()
{
  return sub_100005904(v0 + 16, *(void *)(v0 + 216), 0);
}

uint64_t sub_1000078BC@<X0>(uint64_t a1@<X8>)
{
  return sub_100005AC0(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_1000078C4()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000078D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100016130();
  *a1 = result;
  return result;
}

uint64_t sub_100007900()
{
  return sub_100016140();
}

uint64_t sub_10000792C(uint64_t a1)
{
  return a1;
}

uint64_t sub_100007958(uint64_t a1)
{
  return a1;
}

uint64_t sub_100007984(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000079B0(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000079DC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x74746F427466654CLL && a2 == 0xEA00000000006D6FLL;
  if (v2 || (sub_100016620() & 1) != 0)
  {
    unsigned int v5 = 1413891404;
LABEL_7:
    unint64_t v6 = v5 | 0x43494D5F00000000;
    uint64_t v7 = (void *)0xEF454E4F48504F52;
    return sub_100014830(v6, v7);
  }
  if (a1 == 0x746F427468676952 && a2 == 0xEB000000006D6F74 || (sub_100016620() & 1) != 0)
  {
    uint64_t v8 = "RIGHT_MICROPHONE";
LABEL_12:
    uint64_t v7 = (void *)((unint64_t)(v8 - 32) | 0x8000000000000000);
    unint64_t v6 = 0xD000000000000010;
    return sub_100014830(v6, v7);
  }
  if (a1 == 0x746E6F7246 && a2 == 0xE500000000000000 || (sub_100016620() & 1) != 0)
  {
    uint64_t v8 = "FRONT_MICROPHONE";
    goto LABEL_12;
  }
  if (a1 == 1801675074 && a2 == 0xE400000000000000 || (sub_100016620() & 1) != 0)
  {
    unsigned int v5 = 1380009298;
    goto LABEL_7;
  }
  return 0;
}

unint64_t sub_100007B90()
{
  unint64_t result = qword_1000218B8;
  if (!qword_1000218B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000218B8);
  }
  return result;
}

uint64_t sub_100007BE4@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_100016170();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_100007C18()
{
  return sub_100016180();
}

uint64_t sub_100007C48()
{
  return sub_100016110();
}

uint64_t sub_100007C70(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_100007C80(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100007C90(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000064CC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100007CF4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000064CC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100007D50(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 184);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_100007E5C(v3);
  return a1;
}

uint64_t sub_100007E5C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100007E6C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000064CC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100007ED0()
{
  return sub_100007ED8(224);
}

uint64_t sub_100007ED8(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  if (*(void *)(v1 + 200)) {
    swift_release();
  }

  return _swift_deallocObject(v1, a1, 7);
}

uint64_t sub_100007F9C()
{
  return sub_100005EAC();
}

uint64_t sub_100007FA8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100007FB8()
{
  return swift_release();
}

uint64_t sub_100007FC0()
{
  return sub_100005F18(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_100007FDC()
{
  return swift_getOpaqueTypeConformance2();
}

void *sub_100008078()
{
  type metadata accessor for MicrophoneTestSharedData();
  uint64_t result = (void *)swift_allocObject();
  result[2] = 0x4008000000000000;
  result[3] = 100;
  result[4] = &_swiftEmptyArrayStorage;
  qword_1000225B0 = (uint64_t)result;
  return result;
}

uint64_t sub_1000080BC()
{
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for MicrophoneTestSharedData()
{
  return self;
}

char *sub_100008118(uint64_t a1)
{
  uint64_t v3 = OBJC_IVAR____TtC15Diagnostic_600437MicrophoneTestCompletedViewController_testResults;
  uint64_t v4 = v1;
  *(void *)&v1[v3] = sub_100014994((uint64_t)_swiftEmptyArrayStorage);

  sub_100014830(0xD000000000000010, (void *)0x8000000100017170);
  NSString v5 = sub_1000163F0();
  swift_bridgeObjectRelease();
  sub_100014830(0xD000000000000016, (void *)0x8000000100017190);
  NSString v6 = sub_1000163F0();
  swift_bridgeObjectRelease();
  NSString v7 = sub_1000163F0();
  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for MicrophoneTestCompletedViewController();
  uint64_t v8 = (char *)objc_msgSendSuper2(&v10, "initWithTitle:detailText:symbolName:contentLayout:", v5, v6, v7, 2);

  *(void *)&v8[OBJC_IVAR____TtC15Diagnostic_600437MicrophoneTestCompletedViewController_testResults] = a1;
  swift_bridgeObjectRelease();
  return v8;
}

void sub_100008254()
{
  uint64_t v1 = v0;
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for MicrophoneTestCompletedViewController();
  [super viewDidLoad];
  id v2 = [v0 navigationItem];
  [v2 setHidesBackButton:1];

  id v3 = [self boldButton];
  sub_100014830(19279, (void *)0xE200000000000000);
  NSString v4 = sub_1000163F0();
  swift_bridgeObjectRelease();
  [v3 setTitle:v4 forState:0];

  sub_1000087F0();
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  NSString v6 = (void *)sub_100016540();
  [v3 addAction:v6 forControlEvents:64];

  id v7 = [v1 buttonTray];
  [v7 addButton:v3];
}

void sub_1000083F0()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    return;
  }
  uint64_t v1 = (char *)Strong;
  uint64_t v18 = OBJC_IVAR____TtC15Diagnostic_600437MicrophoneTestCompletedViewController_testResults;
  uint64_t v2 = *(void *)(Strong + OBJC_IVAR____TtC15Diagnostic_600437MicrophoneTestCompletedViewController_testResults);
  uint64_t v3 = v2 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  uint64_t v6 = v5 & *(void *)(v2 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  swift_bridgeObjectRetain_n();
  int64_t v8 = 0;
  while (v6)
  {
    v6 &= v6 - 1;
LABEL_6:
    sub_100007B90();
    if (sub_100016580())
    {
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v2 = *(void *)&v1[v18];
      uint64_t v12 = qword_1000216F8;
      swift_bridgeObjectRetain();
      if (v12 == -1) {
        goto LABEL_27;
      }
      goto LABEL_38;
    }
  }
  int64_t v9 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
LABEL_38:
    swift_once();
LABEL_27:
    uint64_t v13 = swift_unknownObjectWeakLoadStrong();
    if (v13)
    {
      uint64_t v14 = (char *)v13;
      uint64_t v15 = 900;
LABEL_33:
      sub_100015170(v15, v2);
      swift_bridgeObjectRelease();

      uint64_t v1 = v14;
LABEL_35:

      return;
    }
    goto LABEL_34;
  }
  if (v9 >= v7) {
    goto LABEL_29;
  }
  uint64_t v10 = *(void *)(v3 + 8 * v9);
  ++v8;
  if (v10) {
    goto LABEL_25;
  }
  int64_t v8 = v9 + 1;
  if (v9 + 1 >= v7) {
    goto LABEL_29;
  }
  uint64_t v10 = *(void *)(v3 + 8 * v8);
  if (v10) {
    goto LABEL_25;
  }
  int64_t v8 = v9 + 2;
  if (v9 + 2 >= v7) {
    goto LABEL_29;
  }
  uint64_t v10 = *(void *)(v3 + 8 * v8);
  if (v10) {
    goto LABEL_25;
  }
  int64_t v8 = v9 + 3;
  if (v9 + 3 >= v7) {
    goto LABEL_29;
  }
  uint64_t v10 = *(void *)(v3 + 8 * v8);
  if (v10) {
    goto LABEL_25;
  }
  int64_t v8 = v9 + 4;
  if (v9 + 4 >= v7) {
    goto LABEL_29;
  }
  uint64_t v10 = *(void *)(v3 + 8 * v8);
  if (v10)
  {
LABEL_25:
    uint64_t v6 = (v10 - 1) & v10;
    goto LABEL_6;
  }
  int64_t v11 = v9 + 5;
  if (v11 >= v7)
  {
LABEL_29:
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v2 = *(void *)&v1[v18];
    uint64_t v16 = qword_1000216F8;
    swift_bridgeObjectRetain();
    if (v16 != -1) {
      swift_once();
    }
    uint64_t v17 = swift_unknownObjectWeakLoadStrong();
    if (v17)
    {
      uint64_t v14 = (char *)v17;
      uint64_t v15 = 0;
      goto LABEL_33;
    }
LABEL_34:
    swift_bridgeObjectRelease();
    goto LABEL_35;
  }
  uint64_t v10 = *(void *)(v3 + 8 * v11);
  if (v10)
  {
    int64_t v8 = v11;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v8 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v8 >= v7) {
      goto LABEL_29;
    }
    uint64_t v10 = *(void *)(v3 + 8 * v8);
    ++v11;
    if (v10) {
      goto LABEL_25;
    }
  }
  __break(1u);
}

id sub_100008788()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MicrophoneTestCompletedViewController();
  [super dealloc];
}

uint64_t type metadata accessor for MicrophoneTestCompletedViewController()
{
  return self;
}

unint64_t sub_1000087F0()
{
  unint64_t result = qword_100021A10;
  if (!qword_100021A10)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100021A10);
  }
  return result;
}

uint64_t sub_100008830()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100008868()
{
}

id sub_100008870(uint64_t a1)
{
  v1[OBJC_IVAR____TtC15Diagnostic_600437MicrophoneTestRecordingViewController_shouldStop] = 0;
  *(void *)&v1[OBJC_IVAR____TtC15Diagnostic_600437MicrophoneTestRecordingViewController_audioManager] = a1;
  swift_retain();
  sub_100014830(0xD000000000000010, (void *)0x80000001000172C0);
  NSString v2 = sub_1000163F0();
  swift_bridgeObjectRelease();
  NSString v3 = sub_1000163F0();
  id v4 = [self currentDevice];
  id v5 = [v4 userInterfaceIdiom];

  if (v5 == (id)1) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 2;
  }
  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for MicrophoneTestRecordingViewController();
  id v7 = [super initWithTitle:v2 detailText:0 symbolName:v3 contentLayout:v6];

  swift_release();
  return v7;
}

void sub_10000899C()
{
  v41.receiver = v0;
  v41.super_class = (Class)type metadata accessor for MicrophoneTestRecordingViewController();
  [super viewDidLoad];
  id v1 = [v0 navigationItem];
  [v1 setHidesBackButton:1];

  id v2 = [v0 navigationController];
  sub_100016480();
  id v3 = v0;
  uint64_t v4 = sub_100016470();
  id v5 = (void *)swift_allocObject();
  v5[2] = v4;
  v5[3] = &protocol witness table for MainActor;
  v5[4] = v3;
  id v6 = v3;
  uint64_t v7 = sub_100016470();
  int64_t v8 = (void *)swift_allocObject();
  v8[2] = v7;
  v8[3] = &protocol witness table for MainActor;
  v8[4] = v6;
  sub_100016360();
  type metadata accessor for AudioManager();
  sub_100006474();
  uint64_t v9 = sub_100016100();
  sub_10000AD38(v9, v10, (uint64_t)v2, v38, v39, v40, (uint64_t)&v42);
  swift_retain();
  sub_100016030();
  id v11 = objc_allocWithZone((Class)sub_1000064CC(&qword_100021A50));
  uint64_t v12 = (void *)sub_1000161D0();
  id v13 = [v12 view];
  if (!v13) {
    goto LABEL_4;
  }
  uint64_t v14 = v13;
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v15 = [v6 contentView];
  [v15 addSubview:v14];

  sub_1000064CC(&qword_100021A58);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_100018C60;
  id v17 = [v14 leadingAnchor];
  id v18 = [v6 contentView];
  id v19 = [v18 leadingAnchor];

  id v20 = [v17 constraintEqualToAnchor:v19];
  *(void *)(v16 + 32) = v20;
  id v21 = [v14 trailingAnchor];
  id v22 = [v6 contentView];
  id v23 = [v22 trailingAnchor];

  id v24 = [v21 constraintEqualToAnchor:v23];
  *(void *)(v16 + 40) = v24;
  id v25 = [v14 centerYAnchor];
  id v26 = [v6 view];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = self;
    id v29 = [v27 centerYAnchor];

    id v30 = [v25 constraintEqualToAnchor:v29];
    *(void *)(v16 + 48) = v30;
    sub_100016450();
    sub_1000093CC(0, &qword_100021A60);
    Class isa = sub_100016440().super.isa;
    swift_bridgeObjectRelease();
    [v28 activateConstraints:isa];

    id v32 = [self linkButton];
    sub_100014830(0x4345525F504F5453, (void *)0xEE00474E4944524FLL);
    NSString v33 = sub_1000163F0();
    swift_bridgeObjectRelease();
    [v32 setTitle:v33 forState:0];

    sub_1000093CC(0, (unint64_t *)&qword_100021A10);
    uint64_t v34 = swift_allocObject();
    *(void *)(v34 + 16) = v6;
    id v35 = v6;
    uint64_t v36 = (void *)sub_100016540();
    [v32 addAction:v36 forControlEvents:64];

    id v37 = [v35 buttonTray];
    [v37 addButton:v32];

    uint64_t v12 = v37;
LABEL_4:

    return;
  }
  __break(1u);
}

void sub_100008F84(uint64_t a1, unsigned char *a2)
{
  a2[OBJC_IVAR____TtC15Diagnostic_600437MicrophoneTestRecordingViewController_shouldStop] = 1;
  sub_100014830(0xD00000000000001ELL, (void *)0x8000000100017320);
  sub_100014830(0xD00000000000001ELL, (void *)0x8000000100017340);
  NSString v3 = sub_1000163F0();
  swift_bridgeObjectRelease();
  NSString v4 = sub_1000163F0();
  swift_bridgeObjectRelease();
  id v5 = [self alertControllerWithTitle:v3 message:v4 preferredStyle:1];

  sub_100014830(0xD000000000000026, (void *)0x8000000100017360);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  uint64_t v7 = a2;
  NSString v8 = sub_1000163F0();
  swift_bridgeObjectRelease();
  v11[4] = sub_100009448;
  v11[5] = v6;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_10000946C;
  v11[3] = &unk_10001D140;
  uint64_t v9 = _Block_copy(v11);
  swift_release();
  id v10 = [self actionWithTitle:v8 style:0 handler:v9];
  _Block_release(v9);

  [v5 addAction:v10];
  [v7 presentViewController:v5 animated:1 completion:0];
}

void sub_1000091C8(int a1, id a2)
{
  id v2 = [a2 navigationController];
  if (v2)
  {
    id v3 = v2;
  }
}

id sub_1000092EC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MicrophoneTestRecordingViewController();
  [super dealloc];
}

uint64_t type metadata accessor for MicrophoneTestRecordingViewController()
{
  return self;
}

void sub_100009358(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(*(void *)(v1 + 32)
                 + OBJC_IVAR____TtC15Diagnostic_600437MicrophoneTestRecordingViewController_shouldStop);
}

uint64_t sub_100009374()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

unsigned char *sub_1000093B4(unsigned char *result)
{
  *(unsigned char *)(*(void *)(v1 + 32) + OBJC_IVAR____TtC15Diagnostic_600437MicrophoneTestRecordingViewController_shouldStop) = *result;
  return result;
}

uint64_t sub_1000093CC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100009408()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100009440(uint64_t a1)
{
  sub_100008F84(a1, *(unsigned char **)(v1 + 16));
}

void sub_100009448(int a1)
{
  sub_1000091C8(a1, *(id *)(v1 + 16));
}

uint64_t sub_100009450(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100009460()
{
  return swift_release();
}

void sub_10000946C(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_1000094D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v95 = a1;
  uint64_t v3 = sub_1000064CC(&qword_100021A70);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v79 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000064CC(&qword_100021A78);
  uint64_t v8 = v7 - 8;
  __chkstk_darwin(v7);
  id v10 = (char *)&v79 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_1000064CC(&qword_100021A80);
  __chkstk_darwin(v80);
  uint64_t v12 = (char *)&v79 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = sub_1000064CC(&qword_100021A88);
  uint64_t v82 = *(void *)(v96 - 8);
  __chkstk_darwin(v96);
  uint64_t v81 = (char *)&v79 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = sub_1000064CC(&qword_100021A90);
  uint64_t v84 = *(void *)(v85 - 8);
  __chkstk_darwin(v85);
  uint64_t v83 = (char *)&v79 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = sub_1000064CC(&qword_100021A98);
  uint64_t v87 = *(void *)(v92 - 8);
  __chkstk_darwin(v92);
  uint64_t v86 = (char *)&v79 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1000064CC(&qword_100021AA0);
  uint64_t v93 = *(void *)(v16 - 8);
  uint64_t v94 = v16;
  __chkstk_darwin(v16);
  uint64_t v90 = (char *)&v79 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = sub_1000064CC(&qword_100021AA8);
  uint64_t v89 = *(void *)(v91 - 8);
  __chkstk_darwin(v91);
  uint64_t v88 = (char *)&v79 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v97 = *(_OWORD *)(v1 + 32);
  sub_1000064CC(&qword_100021AB0);
  sub_100016320();
  char v101 = 0;
  *(void *)&long long v97 = 0x3FF0000000000000;
  sub_1000064CC(&qword_100021AB8);
  sub_10000B3AC();
  sub_10000B420();
  sub_1000160B0();
  char v19 = sub_1000161F0();
  id v20 = [self currentDevice];
  [v20 userInterfaceIdiom];

  sub_100016090();
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v10, v6, v3);
  id v29 = &v10[*(int *)(v8 + 44)];
  *id v29 = v19;
  *((void *)v29 + 1) = v22;
  *((void *)v29 + 2) = v24;
  *((void *)v29 + 3) = v26;
  *((void *)v29 + 4) = v28;
  v29[40] = 0;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v30 = v80;
  uint64_t v31 = (_OWORD *)swift_allocObject();
  long long v32 = *(_OWORD *)(v2 + 112);
  v31[7] = *(_OWORD *)(v2 + 96);
  v31[8] = v32;
  *(_OWORD *)((char *)v31 + 137) = *(_OWORD *)(v2 + 121);
  long long v33 = *(_OWORD *)(v2 + 48);
  v31[3] = *(_OWORD *)(v2 + 32);
  v31[4] = v33;
  long long v34 = *(_OWORD *)(v2 + 80);
  v31[5] = *(_OWORD *)(v2 + 64);
  v31[6] = v34;
  long long v35 = *(_OWORD *)(v2 + 16);
  v31[1] = *(_OWORD *)v2;
  v31[2] = v35;
  sub_10000B480((uint64_t)v10, (uint64_t)v12);
  uint64_t v36 = (uint64_t (**)())&v12[*(int *)(v30 + 36)];
  *uint64_t v36 = sub_10000B478;
  v36[1] = (uint64_t (*)())v31;
  v36[2] = 0;
  v36[3] = 0;
  sub_10000B4E8(v2);
  sub_100007CF4((uint64_t)v10, &qword_100021A78);
  if (*(void *)v2)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100016060();
    swift_release();
    swift_release();
    swift_release();
    id v37 = (_OWORD *)swift_allocObject();
    long long v38 = *(_OWORD *)(v2 + 112);
    v37[7] = *(_OWORD *)(v2 + 96);
    v37[8] = v38;
    *(_OWORD *)((char *)v37 + 137) = *(_OWORD *)(v2 + 121);
    long long v39 = *(_OWORD *)(v2 + 48);
    v37[3] = *(_OWORD *)(v2 + 32);
    v37[4] = v39;
    long long v40 = *(_OWORD *)(v2 + 80);
    v37[5] = *(_OWORD *)(v2 + 64);
    v37[6] = v40;
    long long v41 = *(_OWORD *)(v2 + 16);
    v37[1] = *(_OWORD *)v2;
    v37[2] = v41;
    sub_10000B4E8(v2);
    uint64_t v42 = sub_10000B5F0(&qword_100021AD0, &qword_100021A80, (void (*)(void))sub_10000B5C0);
    long long v43 = v81;
    sub_100016280();
    swift_release();
    sub_100007CF4((uint64_t)v12, &qword_100021A80);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100016060();
    swift_release();
    swift_release();
    swift_release();
    char v44 = 0;
    if (v97)
    {
      long long v97 = *(_OWORD *)(v2 + 64);
      sub_1000064CC(&qword_100021848);
      sub_100016320();
      char v44 = v100;
    }
    char v100 = v44;
    uint64_t v45 = (_OWORD *)swift_allocObject();
    long long v46 = *(_OWORD *)(v2 + 112);
    v45[7] = *(_OWORD *)(v2 + 96);
    v45[8] = v46;
    *(_OWORD *)((char *)v45 + 137) = *(_OWORD *)(v2 + 121);
    long long v47 = *(_OWORD *)(v2 + 48);
    v45[3] = *(_OWORD *)(v2 + 32);
    v45[4] = v47;
    long long v48 = *(_OWORD *)(v2 + 80);
    v45[5] = *(_OWORD *)(v2 + 64);
    v45[6] = v48;
    long long v49 = *(_OWORD *)(v2 + 16);
    v45[1] = *(_OWORD *)v2;
    v45[2] = v49;
    sub_10000B4E8(v2);
    *(void *)&long long v97 = v30;
    *((void *)&v97 + 1) = &type metadata for Bool;
    uint64_t v98 = v42;
    uint64_t v99 = &protocol witness table for Bool;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v51 = v83;
    uint64_t v52 = v96;
    sub_100016280();
    swift_release();
    (*(void (**)(char *, uint64_t))(v82 + 8))(v43, v52);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100016060();
    swift_release();
    swift_release();
    swift_release();
    char v53 = 0;
    long long v54 = v86;
    uint64_t v55 = v85;
    if (v97 == 1)
    {
      long long v97 = *(_OWORD *)(v2 + 80);
      sub_1000064CC(&qword_100021848);
      sub_100016320();
      char v53 = v100;
    }
    char v100 = v53;
    long long v56 = (_OWORD *)swift_allocObject();
    long long v57 = *(_OWORD *)(v2 + 112);
    v56[7] = *(_OWORD *)(v2 + 96);
    v56[8] = v57;
    *(_OWORD *)((char *)v56 + 137) = *(_OWORD *)(v2 + 121);
    long long v58 = *(_OWORD *)(v2 + 48);
    v56[3] = *(_OWORD *)(v2 + 32);
    v56[4] = v58;
    long long v59 = *(_OWORD *)(v2 + 80);
    v56[5] = *(_OWORD *)(v2 + 64);
    v56[6] = v59;
    long long v60 = *(_OWORD *)(v2 + 16);
    v56[1] = *(_OWORD *)v2;
    v56[2] = v60;
    sub_10000B4E8(v2);
    *(void *)&long long v97 = v96;
    *((void *)&v97 + 1) = &type metadata for Bool;
    uint64_t v98 = OpaqueTypeConformance2;
    uint64_t v99 = &protocol witness table for Bool;
    uint64_t v61 = swift_getOpaqueTypeConformance2();
    sub_100016280();
    swift_release();
    (*(void (**)(char *, uint64_t))(v84 + 8))(v51, v55);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100016060();
    swift_release();
    swift_release();
    swift_release();
    char v62 = 0;
    if (v97 == 1)
    {
      long long v97 = *(_OWORD *)(v2 + 96);
      sub_1000064CC(&qword_100021848);
      sub_100016320();
      char v62 = v100;
    }
    char v100 = v62;
    uint64_t v63 = (_OWORD *)swift_allocObject();
    long long v64 = *(_OWORD *)(v2 + 112);
    v63[7] = *(_OWORD *)(v2 + 96);
    v63[8] = v64;
    *(_OWORD *)((char *)v63 + 137) = *(_OWORD *)(v2 + 121);
    long long v65 = *(_OWORD *)(v2 + 48);
    v63[3] = *(_OWORD *)(v2 + 32);
    v63[4] = v65;
    long long v66 = *(_OWORD *)(v2 + 80);
    v63[5] = *(_OWORD *)(v2 + 64);
    v63[6] = v66;
    long long v67 = *(_OWORD *)(v2 + 16);
    v63[1] = *(_OWORD *)v2;
    v63[2] = v67;
    sub_10000B4E8(v2);
    *(void *)&long long v97 = v55;
    *((void *)&v97 + 1) = &type metadata for Bool;
    uint64_t v98 = v61;
    uint64_t v99 = &protocol witness table for Bool;
    uint64_t v68 = swift_getOpaqueTypeConformance2();
    uint64_t v69 = v90;
    uint64_t v70 = v92;
    sub_100016280();
    swift_release();
    (*(void (**)(char *, uint64_t))(v87 + 8))(v54, v70);
    long long v97 = *(_OWORD *)(v2 + 120);
    LOBYTE(v98) = *(unsigned char *)(v2 + 136);
    sub_1000064CC(&qword_100021AE8);
    sub_100016350();
    uint64_t v71 = (_OWORD *)swift_allocObject();
    long long v72 = *(_OWORD *)(v2 + 112);
    v71[7] = *(_OWORD *)(v2 + 96);
    v71[8] = v72;
    *(_OWORD *)((char *)v71 + 137) = *(_OWORD *)(v2 + 121);
    long long v73 = *(_OWORD *)(v2 + 48);
    v71[3] = *(_OWORD *)(v2 + 32);
    v71[4] = v73;
    long long v74 = *(_OWORD *)(v2 + 80);
    v71[5] = *(_OWORD *)(v2 + 64);
    v71[6] = v74;
    long long v75 = *(_OWORD *)(v2 + 16);
    v71[1] = *(_OWORD *)v2;
    v71[2] = v75;
    sub_10000B4E8(v2);
    *(void *)&long long v97 = v70;
    *((void *)&v97 + 1) = &type metadata for Bool;
    uint64_t v98 = v68;
    uint64_t v99 = &protocol witness table for Bool;
    swift_getOpaqueTypeConformance2();
    long long v76 = v88;
    uint64_t v77 = v94;
    sub_100016280();
    swift_release();
    (*(void (**)(char *, uint64_t))(v93 + 8))(v69, v77);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v89 + 32))(v95, v76, v91);
  }
  else
  {
    type metadata accessor for AudioManager();
    sub_100006474();
    uint64_t result = sub_1000160F0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10000A198@<X0>(uint64_t a1@<X8>)
{
  sub_100014830(0xD000000000000013, (void *)0x80000001000173B0);
  sub_100007B90();
  uint64_t v2 = sub_100016240();
  uint64_t v4 = v3;
  char v6 = v5;
  uint64_t v8 = v7;
  char v9 = sub_100016220();
  uint64_t result = sub_100016090();
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v6 & 1;
  *(void *)(a1 + 24) = v8;
  *(unsigned char *)(a1 + 32) = v9;
  *(void *)(a1 + 40) = v11;
  *(void *)(a1 + 48) = v12;
  *(void *)(a1 + 56) = v13;
  *(void *)(a1 + 64) = v14;
  *(unsigned char *)(a1 + 72) = 0;
  return result;
}

uint64_t sub_10000A248(void *a1)
{
  sub_10000A984();
  sub_10000B800();
  if (*a1)
  {
    swift_retain();
    sub_10000E9FC();
    return swift_release();
  }
  else
  {
    type metadata accessor for AudioManager();
    sub_100006474();
    uint64_t result = sub_1000160F0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10000A2C8(uint64_t a1)
{
  if (*(void *)a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100016060();
    swift_release();
    swift_release();
    uint64_t result = swift_release();
    if (v7)
    {
      long long v7 = *(_OWORD *)(a1 + 48);
      sub_1000064CC(&qword_100021848);
      uint64_t result = sub_100016320();
      if (v8[0] == 1)
      {
        sub_10000B798(a1 + 112, (uint64_t)v8);
        sub_10000B798((uint64_t)v8, (uint64_t)&v7);
        uint64_t v3 = (void *)v7;
        if ((void)v7)
        {
          id v4 = objc_allocWithZone((Class)type metadata accessor for MicrophoneTestEvaluatingViewController());
          uint64_t v5 = swift_retain();
          id v6 = sub_1000124C8(v5);
          [v3 pushViewController:v6 animated:1];
        }
        swift_retain();
        sub_10000E550();
        return swift_release();
      }
    }
  }
  else
  {
    type metadata accessor for AudioManager();
    sub_100006474();
    uint64_t result = sub_1000160F0();
    __break(1u);
  }
  return result;
}

void sub_10000A424(void *a1)
{
  if (*a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100016060();
    swift_release();
    swift_release();
    swift_release();
    if (v4)
    {
      unint64_t v1 = sub_100014994((uint64_t)&_swiftEmptyArrayStorage);
      if (qword_1000216F8 != -1) {
        swift_once();
      }
      uint64_t Strong = swift_unknownObjectWeakLoadStrong();
      if (Strong)
      {
        uint64_t v3 = (void *)Strong;
        sub_1000156FC(0, v1);
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
  }
  else
  {
    type metadata accessor for AudioManager();
    sub_100006474();
    sub_1000160F0();
    __break(1u);
  }
}

void sub_10000A558(void *a1)
{
  if (*a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100016060();
    swift_release();
    swift_release();
    swift_release();
    if (v4)
    {
      unint64_t v1 = sub_100014994((uint64_t)&_swiftEmptyArrayStorage);
      if (qword_1000216F8 != -1) {
        swift_once();
      }
      uint64_t Strong = swift_unknownObjectWeakLoadStrong();
      if (Strong)
      {
        uint64_t v3 = (void *)Strong;
        sub_1000156FC(1, v1);
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
  }
  else
  {
    type metadata accessor for AudioManager();
    sub_100006474();
    sub_1000160F0();
    __break(1u);
  }
}

void sub_10000A68C(void *a1)
{
  if (*a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100016060();
    swift_release();
    swift_release();
    swift_release();
    if (v4)
    {
      unint64_t v1 = sub_100014994((uint64_t)&_swiftEmptyArrayStorage);
      if (qword_1000216F8 != -1) {
        swift_once();
      }
      uint64_t Strong = swift_unknownObjectWeakLoadStrong();
      if (Strong)
      {
        uint64_t v3 = (void *)Strong;
        sub_1000156FC(2, v1);
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
  }
  else
  {
    type metadata accessor for AudioManager();
    sub_100006474();
    sub_1000160F0();
    __break(1u);
  }
}

uint64_t sub_10000A7C0()
{
  sub_1000064CC(&qword_100021AE8);
  uint64_t result = sub_100016350();
  if (v1 == 1) {
    return sub_10000A824();
  }
  return result;
}

uint64_t sub_10000A824()
{
  long long v2 = *(_OWORD *)(v0 + 16);
  sub_1000064CC(&qword_100021AF0);
  sub_100016320();
  [v3 invalidate:v2];

  if (*(void *)v0)
  {
    swift_retain();
    sub_10000F5AC();
    swift_release();
    swift_retain();
    sub_10000E550();
    swift_release();
    sub_1000064CC(&qword_100021848);
    sub_100016330();
    sub_100016330();
    sub_100016330();
    sub_100016330();
    swift_retain();
    sub_100010E0C();
    return swift_release();
  }
  else
  {
    type metadata accessor for AudioManager();
    sub_100006474();
    uint64_t result = sub_1000160F0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10000A984()
{
  char v1 = v0;
  long long v16 = v0[2];
  id v21 = 0;
  sub_1000064CC(&qword_100021AB0);
  uint64_t result = sub_100016330();
  if (qword_1000216E0 != -1) {
    uint64_t result = swift_once();
  }
  double v3 = *(double *)(qword_1000225B0 + 16);
  double v4 = v3 / 100.0;
  double v5 = v3 / (v3 / 100.0);
  if ((~*(void *)&v5 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v5 <= -9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v5 < 9.22337204e18)
  {
    uint64_t v6 = (uint64_t)v5;
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = 0;
    uint64_t v8 = self;
    uint64_t v9 = swift_allocObject();
    long long v10 = v1[7];
    *(_OWORD *)(v9 + 112) = v1[6];
    *(_OWORD *)(v9 + 128) = v10;
    *(_OWORD *)(v9 + 137) = *(_OWORD *)((char *)v1 + 121);
    long long v11 = v1[3];
    *(_OWORD *)(v9 + 48) = v1[2];
    *(_OWORD *)(v9 + 64) = v11;
    long long v12 = v1[5];
    *(_OWORD *)(v9 + 80) = v1[4];
    *(_OWORD *)(v9 + 96) = v12;
    long long v13 = v1[1];
    *(_OWORD *)(v9 + 16) = *v1;
    *(_OWORD *)(v9 + 32) = v13;
    *(void *)(v9 + 160) = v7;
    *(void *)(v9 + 168) = v6;
    char v19 = sub_10000BB64;
    uint64_t v20 = v9;
    *(void *)&long long v16 = _NSConcreteStackBlock;
    *((void *)&v16 + 1) = 1107296256;
    uint64_t v17 = sub_10000946C;
    uint64_t v18 = &unk_10001D348;
    uint64_t v14 = _Block_copy(&v16);
    sub_10000B4E8((uint64_t)v1);
    swift_retain();
    swift_release();
    id v15 = [v8 scheduledTimerWithTimeInterval:1 repeats:v14 block:v4];
    _Block_release(v14);
    long long v16 = v1[1];
    id v21 = v15;
    sub_1000064CC(&qword_100021AF0);
    sub_100016330();
    return swift_release();
  }
LABEL_9:
  __break(1u);
  return result;
}

id sub_10000ABC8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)(a3 + 16);
  swift_beginAccess();
  long long v13 = *(_OWORD *)(a2 + 32);
  sub_1000064CC(&qword_100021AB0);
  sub_100016330();
  id result = (id)swift_beginAccess();
  uint64_t v10 = *(void *)(a3 + 16);
  BOOL v11 = __OFADD__(v10, 1);
  uint64_t v12 = v10 + 1;
  if (v11)
  {
    __break(1u);
    goto LABEL_7;
  }
  *uint64_t v8 = v12;
  if (v12 < a4) {
    return result;
  }
  if (!*(void *)a2)
  {
LABEL_7:
    type metadata accessor for AudioManager();
    sub_100006474();
    id result = (id)sub_1000160F0();
    __break(1u);
    return result;
  }
  swift_retain();
  sub_10000F5AC();
  swift_release();
  return [a1 invalidate];
}

uint64_t sub_10000ACE4@<X0>(uint64_t a1@<X8>)
{
  return sub_1000094D4(a1);
}

uint64_t sub_10000AD38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X8>)
{
  sub_1000064CC(&qword_100021A68);
  sub_100016310();
  sub_100016310();
  sub_100016310();
  sub_100016310();
  sub_100016310();
  uint64_t result = sub_100016310();
  *(void *)a7 = a1;
  *(void *)(a7 + 8) = a2;
  *(void *)(a7 + 16) = v15;
  *(void *)(a7 + 24) = v16;
  *(void *)(a7 + 32) = v15;
  *(void *)(a7 + 40) = v16;
  *(unsigned char *)(a7 + 48) = v15;
  *(void *)(a7 + 56) = v16;
  *(unsigned char *)(a7 + 64) = v15;
  *(void *)(a7 + 72) = v16;
  *(unsigned char *)(a7 + 80) = v15;
  *(void *)(a7 + 88) = v16;
  *(unsigned char *)(a7 + 96) = v15;
  *(void *)(a7 + 104) = v16;
  *(void *)(a7 + 112) = a3;
  *(void *)(a7 + 120) = a4;
  *(void *)(a7 + 128) = a5;
  *(unsigned char *)(a7 + 136) = a6;
  return result;
}

uint64_t destroy for MicrophoneTestRecordingView(uint64_t a1)
{
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for MicrophoneTestRecordingView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  double v5 = *(void **)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v4;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  uint64_t v7 = *(void **)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v7;
  uint64_t v8 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v8;
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  swift_retain();
  id v9 = v5;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  id v10 = v7;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for MicrophoneTestRecordingView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = *(void **)(a1 + 16);
  double v5 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v5;
  id v6 = v5;

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_retain();
  swift_release();
  uint64_t v7 = *(void **)(a1 + 112);
  uint64_t v8 = *(void **)(a2 + 112);
  *(void *)(a1 + 112) = v8;
  id v9 = v8;

  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_retain();
  swift_release();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  return a1;
}

__n128 initializeWithTake for MicrophoneTestRecordingView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 121) = *(_OWORD *)(a2 + 121);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t assignWithTake for MicrophoneTestRecordingView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);

  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_release();
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  swift_release();
  long long v4 = *(void **)(a1 + 112);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);

  swift_release();
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  swift_release();
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  return a1;
}

uint64_t getEnumTagSinglePayload for MicrophoneTestRecordingView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 137)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 128);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MicrophoneTestRecordingView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 136) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 137) = 1;
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
      *(void *)(result + 128) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 137) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MicrophoneTestRecordingView()
{
  return &type metadata for MicrophoneTestRecordingView;
}

uint64_t sub_10000B390()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000B3AC()
{
  unint64_t result = qword_100021AC0;
  if (!qword_100021AC0)
  {
    sub_100007090(&qword_100021AB8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021AC0);
  }
  return result;
}

unint64_t sub_10000B420()
{
  unint64_t result = qword_100021AC8;
  if (!qword_100021AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021AC8);
  }
  return result;
}

uint64_t sub_10000B478()
{
  return sub_10000A248((void *)(v0 + 16));
}

uint64_t sub_10000B480(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000064CC(&qword_100021A78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000B4E8(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 16);
  long long v6 = *(void **)(a1 + 112);
  swift_retain();
  swift_retain();
  swift_retain();
  id v3 = v2;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  id v4 = v6;
  return a1;
}

uint64_t sub_10000B5B8()
{
  return sub_10000A2C8(v0 + 16);
}

uint64_t sub_10000B5C0()
{
  return sub_10000B5F0(&qword_100021AD8, &qword_100021A78, (void (*)(void))sub_10000B66C);
}

uint64_t sub_10000B5F0(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007090(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000B66C()
{
  unint64_t result = qword_100021AE0;
  if (!qword_100021AE0)
  {
    sub_100007090(&qword_100021A70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021AE0);
  }
  return result;
}

void sub_10000B6D4()
{
  sub_10000A424((void *)(v0 + 16));
}

void sub_10000B6E8()
{
  sub_10000A558((void *)(v0 + 16));
}

void sub_10000B6FC()
{
  sub_10000A68C((void *)(v0 + 16));
}

uint64_t sub_10000B708()
{
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 153, 7);
}

uint64_t sub_10000B790()
{
  return sub_10000A7C0();
}

uint64_t sub_10000B798(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000064CC(&qword_100021AF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id sub_10000B800()
{
  uint64_t v0 = self;
  id v1 = [v0 sharedInstance];
  id v15 = 0;
  unsigned int v2 = [v1 setCategory:AVAudioSessionCategoryRecord mode:AVAudioSessionModeDefault options:0 error:&v15];

  id v3 = v15;
  if (v2
    && (id v4 = v15,
        id v5 = [v0 sharedInstance],
        id v15 = 0,
        unsigned int v6 = [v5 setActive:1 error:&v15],
        v5,
        id v3 = v15,
        v6))
  {
    return v3;
  }
  else
  {
    id v8 = v3;
    sub_100015F70();

    swift_willThrow();
    os_log_type_t v9 = sub_1000164B0();
    if (qword_1000216E8 != -1) {
      swift_once();
    }
    id v10 = qword_1000225B8;
    os_log_type_t v11 = v9;
    if (os_log_type_enabled((os_log_t)qword_1000225B8, v9))
    {
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      long long v13 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 138412290;
      swift_errorRetain();
      uint64_t v14 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v15 = v14;
      sub_100016570();
      *long long v13 = v14;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Failed to set up the recording session: %@", v12, 0xCu);
      sub_1000064CC((uint64_t *)&unk_100021B00);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    return (id)swift_errorRelease();
  }
}

uint64_t sub_10000BAC4()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000BAD4()
{
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 176, 7);
}

id sub_10000BB64(void *a1)
{
  return sub_10000ABC8(a1, v1 + 16, *(void *)(v1 + 160), *(void *)(v1 + 168));
}

uint64_t sub_10000BB70(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000BB80()
{
  return swift_release();
}

uint64_t sub_10000BB88()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000BCEC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = OBJC_IVAR___MicrophoneTestInputs_audioRecordingDuration;
  *(void *)&v1[OBJC_IVAR___MicrophoneTestInputs_audioRecordingDuration] = 0x4008000000000000;
  uint64_t v6 = *(void *)&v1[OBJC_IVAR___MicrophoneTestInputs_audioRecordingDurationKey];
  uint64_t v5 = *(void *)&v1[OBJC_IVAR___MicrophoneTestInputs_audioRecordingDurationKey + 8];
  if (!*(void *)(a1 + 16))
  {
    long long v54 = 0u;
    long long v55 = 0u;
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  unint64_t v7 = sub_100015C34(v6, v5);
  if ((v8 & 1) == 0)
  {
    long long v54 = 0u;
    long long v55 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  sub_10000D250(*(void *)(a1 + 56) + 32 * v7, (uint64_t)&v54);
  swift_bridgeObjectRelease();
  if (!*((void *)&v55 + 1))
  {
LABEL_11:
    sub_10000CBA8((uint64_t)&v54);
    goto LABEL_12;
  }
  if ((swift_dynamicCast() & 1) == 0 || v53 < 1.0 || v53 > 10.0)
  {
LABEL_12:
    sub_1000164B0();
    sub_1000064CC(&qword_100021BF8);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_100018E30;
    *(void *)(v9 + 56) = &type metadata for String;
    *(void *)(v9 + 64) = sub_10000CC08();
    *(void *)(v9 + 32) = v6;
    *(void *)(v9 + 40) = v5;
    sub_10000CC5C();
    swift_bridgeObjectRetain();
    id v10 = (void *)sub_100016550();
    sub_100016010();
    swift_bridgeObjectRelease();

    if (!*(void *)(a1 + 16)) {
      goto LABEL_8;
    }
    goto LABEL_13;
  }
  *(double *)&v1[v4] = v53;
  if (!*(void *)(a1 + 16))
  {
LABEL_8:
    long long v54 = 0u;
    long long v55 = 0u;
LABEL_20:
    sub_10000CBA8((uint64_t)&v54);
    goto LABEL_21;
  }
LABEL_13:
  uint64_t v11 = *(void *)&v2[OBJC_IVAR___MicrophoneTestInputs_stringPropertiesKey];
  uint64_t v12 = *(void *)&v2[OBJC_IVAR___MicrophoneTestInputs_stringPropertiesKey + 8];
  swift_bridgeObjectRetain();
  unint64_t v13 = sub_100015C34(v11, v12);
  if (v14)
  {
    sub_10000D250(*(void *)(a1 + 56) + 32 * v13, (uint64_t)&v54);
  }
  else
  {
    long long v54 = 0u;
    long long v55 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v55 + 1)) {
    goto LABEL_20;
  }
  sub_1000064CC(&qword_100021C20);
  if (swift_dynamicCast())
  {
    unint64_t v15 = *(void *)&v53;
    if (*(void *)(*(void *)&v53 + 16)) {
      goto LABEL_22;
    }
    swift_bridgeObjectRelease();
  }
LABEL_21:
  unint64_t v15 = sub_100014994((uint64_t)_swiftEmptyArrayStorage);
LABEL_22:
  *(void *)&v2[OBJC_IVAR___MicrophoneTestInputs_stringProperties] = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)&v2[OBJC_IVAR___MicrophoneTestInputs_microphoneSequenceKey];
  uint64_t v16 = *(void *)&v2[OBJC_IVAR___MicrophoneTestInputs_microphoneSequenceKey + 8];
  if (!*(void *)(a1 + 16))
  {
    long long v54 = 0u;
    long long v55 = 0u;
LABEL_33:
    sub_10000CBA8((uint64_t)&v54);
    goto LABEL_34;
  }
  swift_bridgeObjectRetain();
  unint64_t v18 = sub_100015C34(v17, v16);
  if (v19)
  {
    sub_10000D250(*(void *)(a1 + 56) + 32 * v18, (uint64_t)&v54);
  }
  else
  {
    long long v54 = 0u;
    long long v55 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v55 + 1)) {
    goto LABEL_33;
  }
  sub_1000064CC(&qword_100021C10);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_34:
    sub_1000164C0();
LABEL_35:
    sub_1000064CC(&qword_100021BF8);
    uint64_t v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_100018E30;
    *(void *)(v23 + 56) = &type metadata for String;
    *(void *)(v23 + 64) = sub_10000CC08();
    *(void *)(v23 + 32) = v17;
    *(void *)(v23 + 40) = v16;
    sub_10000CC5C();
    swift_bridgeObjectRetain();
    uint64_t v24 = (void *)sub_100016550();
    sub_100016010();
    swift_bridgeObjectRelease();

    return 0;
  }
  double v20 = v53;
  if (!*(void *)(*(void *)&v53 + 16))
  {
    swift_bridgeObjectRelease();
    goto LABEL_34;
  }
  uint64_t v17 = *(void *)&v2[OBJC_IVAR___MicrophoneTestInputs_inputComponentsKey];
  uint64_t v16 = *(void *)&v2[OBJC_IVAR___MicrophoneTestInputs_inputComponentsKey + 8];
  if (!*(void *)(a1 + 16))
  {
    long long v54 = 0u;
    long long v55 = 0u;
LABEL_73:
    swift_bridgeObjectRelease();
    sub_10000CBA8((uint64_t)&v54);
    sub_1000164B0();
    goto LABEL_35;
  }
  swift_bridgeObjectRetain();
  unint64_t v21 = sub_100015C34(v17, v16);
  if (v22)
  {
    sub_10000D250(*(void *)(a1 + 56) + 32 * v21, (uint64_t)&v54);
  }
  else
  {
    long long v54 = 0u;
    long long v55 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v55 + 1)) {
    goto LABEL_73;
  }
  sub_1000064CC(&qword_100021C18);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_75:
    swift_bridgeObjectRelease();
    sub_1000164B0();
    goto LABEL_35;
  }
  if (!*(void *)(*(void *)&v53 + 16))
  {
    swift_bridgeObjectRelease();
    goto LABEL_75;
  }
  uint64_t v50 = *(void *)(*(void *)&v53 + 16);
  if (!v50)
  {
LABEL_76:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_1000216E0 != -1) {
      goto LABEL_81;
    }
    goto LABEL_77;
  }
  unint64_t v26 = 0;
  uint64_t v27 = *(void *)&v53 + 64;
  uint64_t v28 = (char *)_swiftEmptyArrayStorage;
LABEL_45:
  if (v26 < *(void *)(*(void *)&v20 + 16))
  {
    uint64_t v29 = *(void *)(*(void *)&v53 + 32 + 8 * v26);
    unint64_t v51 = v26 + 1;
    uint64_t v30 = 1 << *(unsigned char *)(*(void *)&v53 + 32);
    if (v30 < 64) {
      uint64_t v31 = ~(-1 << v30);
    }
    else {
      uint64_t v31 = -1;
    }
    unint64_t v32 = v31 & *(void *)(*(void *)&v53 + 64);
    int64_t v33 = (unint64_t)(v30 + 63) >> 6;
    swift_bridgeObjectRetain();
    int64_t v34 = 0;
    if (v32)
    {
LABEL_50:
      unint64_t v35 = __clz(__rbit64(v32));
      v32 &= v32 - 1;
      unint64_t v36 = v35 | (v34 << 6);
      goto LABEL_51;
    }
    while (1)
    {
      int64_t v37 = v34 + 1;
      if (__OFADD__(v34, 1))
      {
        __break(1u);
LABEL_79:
        __break(1u);
        break;
      }
      if (v37 >= v33) {
        goto LABEL_44;
      }
      unint64_t v38 = *(void *)(v27 + 8 * v37);
      ++v34;
      if (!v38)
      {
        int64_t v34 = v37 + 1;
        if (v37 + 1 >= v33) {
          goto LABEL_44;
        }
        unint64_t v38 = *(void *)(v27 + 8 * v34);
        if (!v38)
        {
          int64_t v34 = v37 + 2;
          if (v37 + 2 >= v33) {
            goto LABEL_44;
          }
          unint64_t v38 = *(void *)(v27 + 8 * v34);
          if (!v38)
          {
            int64_t v39 = v37 + 3;
            if (v39 >= v33)
            {
LABEL_44:
              swift_release();
              unint64_t v26 = v51;
              double v20 = v53;
              if (v51 == v50) {
                goto LABEL_76;
              }
              goto LABEL_45;
            }
            unint64_t v38 = *(void *)(v27 + 8 * v39);
            if (!v38)
            {
              while (1)
              {
                int64_t v34 = v39 + 1;
                if (__OFADD__(v39, 1)) {
                  goto LABEL_79;
                }
                if (v34 >= v33) {
                  goto LABEL_44;
                }
                unint64_t v38 = *(void *)(v27 + 8 * v34);
                ++v39;
                if (v38) {
                  goto LABEL_66;
                }
              }
            }
            int64_t v34 = v39;
          }
        }
      }
LABEL_66:
      unint64_t v32 = (v38 - 1) & v38;
      unint64_t v36 = __clz(__rbit64(v38)) + (v34 << 6);
LABEL_51:
      if (*(void *)(*(void *)(*(void *)&v53 + 56) + 8 * v36) == v29)
      {
        long long v40 = (uint64_t *)(*(void *)(*(void *)&v53 + 48) + 16 * v36);
        uint64_t v41 = v40[1];
        uint64_t v52 = *v40;
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v28 = sub_10000CA98(0, *((void *)v28 + 2) + 1, 1, v28);
        }
        unint64_t v43 = *((void *)v28 + 2);
        unint64_t v42 = *((void *)v28 + 3);
        char v44 = v28;
        if (v43 >= v42 >> 1) {
          char v44 = sub_10000CA98((char *)(v42 > 1), v43 + 1, 1, v28);
        }
        *((void *)v44 + 2) = v43 + 1;
        uint64_t v28 = v44;
        uint64_t v45 = &v44[16 * v43];
        *((void *)v45 + 4) = v52;
        *((void *)v45 + 5) = v41;
        if (v32) {
          goto LABEL_50;
        }
      }
      else if (v32)
      {
        goto LABEL_50;
      }
    }
  }
  __break(1u);
LABEL_81:
  swift_once();
LABEL_77:
  uint64_t v46 = qword_1000225B0;
  long long v47 = v2;
  uint64_t v48 = swift_bridgeObjectRetain();
  long long v49 = sub_10000D0F8(v48, (uint64_t)v47);
  swift_bridgeObjectRelease_n();

  *(void *)(v46 + 32) = v49;
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_10000C4C4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  *(void *)(a1 + *a4) = sub_1000163E0();
  swift_bridgeObjectRelease();
  return 1;
}

id sub_10000C528()
{
  *(void *)&v0[OBJC_IVAR___MicrophoneTestInputs_audioRecordingDuration] = 0;
  *(void *)&v0[OBJC_IVAR___MicrophoneTestInputs_stringProperties] = 0;
  *(void *)&v0[OBJC_IVAR___MicrophoneTestInputs_microphoneSequence] = _swiftEmptyArrayStorage;
  uint64_t v1 = &v0[OBJC_IVAR___MicrophoneTestInputs_audioRecordingDurationKey];
  *(void *)uint64_t v1 = 0xD000000000000016;
  *((void *)v1 + 1) = 0x80000001000173F0;
  uint64_t v2 = &v0[OBJC_IVAR___MicrophoneTestInputs_stringPropertiesKey];
  *(void *)uint64_t v2 = 0xD000000000000010;
  *((void *)v2 + 1) = 0x8000000100017410;
  id v3 = &v0[OBJC_IVAR___MicrophoneTestInputs_microphoneSequenceKey];
  *(void *)id v3 = 0x65636E6575716573;
  *((void *)v3 + 1) = 0xE800000000000000;
  uint64_t v4 = &v0[OBJC_IVAR___MicrophoneTestInputs_inputComponentsKey];
  *(void *)uint64_t v4 = 0x6D6F437475706E69;
  *((void *)v4 + 1) = 0xEF73746E656E6F70;
  sub_1000064CC(&qword_100021C30);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100018920;
  *(void *)(inited + 32) = 0x6D6F74746F42;
  *(void *)(inited + 40) = 0xE600000000000000;
  *(void *)(inited + 48) = 0x74746F427466654CLL;
  *(void *)(inited + 56) = 0xEA00000000006D6FLL;
  *(void *)(inited + 64) = 0x746E6F7246;
  *(void *)(inited + 72) = 0xE500000000000000;
  *(void *)(inited + 80) = 0x746E6F7246;
  *(void *)(inited + 88) = 0xE500000000000000;
  *(void *)(inited + 96) = 1801675074;
  *(void *)(inited + 104) = 0xE400000000000000;
  *(void *)(inited + 112) = 1801675074;
  *(void *)(inited + 120) = 0xE400000000000000;
  *(void *)(inited + 128) = 4410946;
  *(void *)(inited + 136) = 0xE300000000000000;
  uint64_t v6 = OBJC_IVAR___MicrophoneTestInputs_microphoneNameMapping;
  *(void *)(inited + 144) = 0x746F427468676952;
  *(void *)(inited + 152) = 0xEB000000006D6F74;
  unint64_t v7 = v0;
  *(void *)&v0[v6] = sub_100014994(inited);
  *(void *)&v7[OBJC_IVAR___MicrophoneTestInputs_predicates] = &_swiftEmptyDictionarySingleton;
  *(void *)&v7[OBJC_IVAR___MicrophoneTestInputs_parameters] = &_swiftEmptyDictionarySingleton;
  *(void *)&v7[OBJC_IVAR___MicrophoneTestInputs_specifications] = &_swiftEmptyDictionarySingleton;

  v9.receiver = v7;
  v9.super_class = (Class)type metadata accessor for MicrophoneTestInputs();
  return [super init];
}

id sub_10000C758()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MicrophoneTestInputs();
  return [super dealloc];
}

uint64_t type metadata accessor for MicrophoneTestInputs()
{
  return self;
}

char *sub_10000C88C(char *result, int64_t a2, char a3, char *a4)
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
      sub_1000064CC((uint64_t *)&unk_100021C40);
      id v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      unint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      id v10 = (char *)&_swiftEmptyArrayStorage;
      unint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10000CE28(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_10000C99C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      int64_t v9 = *((void *)a4 + 2);
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      sub_1000064CC(&qword_100021C38);
      id v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32]) {
          memmove(v12, a4 + 32, v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      id v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_10000CF1C(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_10000CA98(char *result, int64_t a2, char a3, char *a4)
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
      sub_1000064CC(&qword_100021C28);
      id v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      unint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      id v10 = (char *)&_swiftEmptyArrayStorage;
      unint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10000D004(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000CBA8(uint64_t a1)
{
  uint64_t v2 = sub_1000064CC(&qword_100021BF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000CC08()
{
  unint64_t result = qword_100021C00;
  if (!qword_100021C00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021C00);
  }
  return result;
}

unint64_t sub_10000CC5C()
{
  unint64_t result = qword_100021C08;
  if (!qword_100021C08)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100021C08);
  }
  return result;
}

uint64_t sub_10000CC9C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000CCBC(a1, a2, a3, *v3);
  *id v3 = (char *)result;
  return result;
}

uint64_t sub_10000CCBC(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000064CC(&qword_100021C28);
    id v10 = (char *)swift_allocObject();
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
    id v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v10 + 32;
  char v14 = a4 + 32;
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
  uint64_t result = sub_100016600();
  __break(1u);
  return result;
}

uint64_t sub_10000CE28(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_100016600();
  __break(1u);
  return result;
}

char *sub_10000CF1C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + a1 + 32);
    unint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  uint64_t result = (char *)sub_100016600();
  __break(1u);
  return result;
}

uint64_t sub_10000D004(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_100016600();
  __break(1u);
  return result;
}

void *sub_10000D0F8(uint64_t a1, uint64_t a2)
{
  int64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_10000CC9C(0, v2, 0);
    uint64_t v5 = *(void *)(a2 + OBJC_IVAR___MicrophoneTestInputs_microphoneNameMapping);
    unint64_t v6 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v7 = *v6;
      if (*(void *)(v5 + 16))
      {
        uint64_t v8 = *(v6 - 1);
        swift_bridgeObjectRetain_n();
        unint64_t v9 = sub_100015C34(v8, v7);
        if (v10)
        {
          int64_t v11 = (uint64_t *)(*(void *)(v5 + 56) + 16 * v9);
          uint64_t v12 = *v11;
          unint64_t v13 = v11[1];
          swift_bridgeObjectRetain();
        }
        else
        {
          uint64_t v12 = 0;
          unint64_t v13 = 0xE000000000000000;
        }
      }
      else
      {
        swift_bridgeObjectRetain();
        uint64_t v12 = 0;
        unint64_t v13 = 0xE000000000000000;
        swift_bridgeObjectRetain();
      }
      swift_bridgeObjectRelease_n();
      unint64_t v15 = _swiftEmptyArrayStorage[2];
      unint64_t v14 = _swiftEmptyArrayStorage[3];
      if (v15 >= v14 >> 1) {
        sub_10000CC9C(v14 > 1, v15 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v15 + 1;
      uint64_t v16 = (char *)&_swiftEmptyArrayStorage[2 * v15];
      *((void *)v16 + 4) = v12;
      *((void *)v16 + 5) = v13;
      v6 += 2;
      --v2;
    }
    while (v2);
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_10000D250(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id sub_10000D2B0(uint64_t a1)
{
  int64_t v2 = v1;
  *(void *)&v1[OBJC_IVAR____TtC15Diagnostic_600436MicrophoneTestStartingViewController_audioManager] = a1;
  swift_retain();
  sub_100014830(0xD000000000000016, (void *)0x8000000100017690);
  NSString v3 = sub_1000163F0();
  swift_bridgeObjectRelease();
  uint64_t v24 = 0;
  unint64_t v25 = 0xE000000000000000;
  uint64_t v4 = self;
  id v5 = [v4 currentDevice];
  id v6 = [v5 userInterfaceIdiom];

  if (v6 == (id)1) {
    uint64_t v7 = 0xD000000000000029;
  }
  else {
    uint64_t v7 = 0xD00000000000002BLL;
  }
  if (v6 == (id)1) {
    uint64_t v8 = (void *)0x8000000100017740;
  }
  else {
    uint64_t v8 = (void *)0x80000001000176B0;
  }
  uint64_t v9 = sub_100014830(v7, v8);
  int64_t v11 = v10;
  swift_bridgeObjectRelease();
  v26._countAndFlagsBits = v9;
  v26._object = v11;
  sub_100016430(v26);
  swift_bridgeObjectRelease();
  v27._countAndFlagsBits = 657930;
  v27._object = (void *)0xE300000000000000;
  sub_100016430(v27);
  id v12 = [v4 currentDevice];
  id v13 = [v12 userInterfaceIdiom];

  if (v13 == (id)1) {
    uint64_t v14 = 0xD00000000000002BLL;
  }
  else {
    uint64_t v14 = 0xD00000000000002DLL;
  }
  if (v13 == (id)1) {
    unint64_t v15 = (void *)0x8000000100017710;
  }
  else {
    unint64_t v15 = (void *)0x80000001000176E0;
  }
  uint64_t v16 = sub_100014830(v14, v15);
  unint64_t v18 = v17;
  swift_bridgeObjectRelease();
  v28._countAndFlagsBits = v16;
  v28._object = v18;
  sub_100016430(v28);
  swift_bridgeObjectRelease();
  NSString v19 = sub_1000163F0();
  swift_bridgeObjectRelease();
  NSString v20 = sub_1000163F0();
  v23.receiver = v2;
  v23.super_class = (Class)type metadata accessor for MicrophoneTestStartingViewController();
  id v21 = [super initWithTitle:v3 detailText:v19 symbolName:v20 contentLayout:2];

  swift_release();
  return v21;
}

void sub_10000D500()
{
  v13.receiver = v0;
  v13.super_class = (Class)type metadata accessor for MicrophoneTestStartingViewController();
  [super viewDidLoad];
  id v1 = [self boldButton];
  sub_100014830(0x45525F5452415453, (void *)0xEF474E4944524F43);
  NSString v2 = sub_1000163F0();
  swift_bridgeObjectRelease();
  [v1 setTitle:v2 forState:0];

  sub_1000087F0();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v0;
  id v4 = v0;
  id v5 = (void *)sub_100016540();
  [v1 addAction:v5 forControlEvents:64];

  id v6 = [self linkButton];
  sub_100014830(0x455F4C45434E4143, (void *)0xEB00000000544958);
  NSString v7 = sub_1000163F0();
  swift_bridgeObjectRelease();
  [v6 setTitle:v7 forState:0];

  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v4;
  id v9 = v4;
  char v10 = (void *)sub_100016540();
  [v6 addAction:v10 forControlEvents:64];

  id v11 = [v9 buttonTray];
  [v11 addButton:v1];

  id v12 = [v9 buttonTray];
  [v12 addButton:v6];
}

void sub_10000D7B0(int a1, id a2)
{
  id v2 = [a2 navigationController];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = objc_allocWithZone((Class)type metadata accessor for MicrophoneTestRecordingViewController());
    uint64_t v5 = swift_retain();
    id v6 = sub_100008870(v5);
    [v3 pushViewController:v6 animated:1];
  }
}

void sub_10000D874(uint64_t a1, void *a2)
{
  sub_100014830(0xD000000000000018, (void *)0x80000001000177B0);
  sub_100014830(0xD000000000000018, (void *)0x80000001000177D0);
  NSString v3 = sub_1000163F0();
  swift_bridgeObjectRelease();
  NSString v4 = sub_1000163F0();
  swift_bridgeObjectRelease();
  id v5 = [self alertControllerWithTitle:v3 message:v4 preferredStyle:1];

  sub_100014830(20302, (void *)0xE200000000000000);
  NSString v6 = sub_1000163F0();
  swift_bridgeObjectRelease();
  NSString v7 = self;
  id v8 = [v7 actionWithTitle:v6 style:0 handler:0];

  [v5 addAction:v8];
  sub_100014830(5457241, (void *)0xE300000000000000);
  NSString v9 = sub_1000163F0();
  swift_bridgeObjectRelease();
  v12[4] = sub_10000DACC;
  v12[5] = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_10000946C;
  v12[3] = &unk_10001D3C0;
  char v10 = _Block_copy(v12);
  swift_release();
  id v11 = [v7 actionWithTitle:v9 style:1 handler:v10];
  _Block_release(v10);

  [v5 addAction:v11];
  [a2 presentViewController:v5 animated:1 completion:0];
}

void sub_10000DACC()
{
  unint64_t v0 = sub_100014994((uint64_t)_swiftEmptyArrayStorage);
  if (qword_1000216F8 != -1) {
    swift_once();
  }
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v2 = (id)Strong;
    sub_100015170(-900, v0);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

id sub_10000DC48()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MicrophoneTestStartingViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for MicrophoneTestStartingViewController()
{
  return self;
}

uint64_t sub_10000DCB0()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000DCE8(int a1)
{
  sub_10000D7B0(a1, *(id *)(v1 + 16));
}

void sub_10000DCF0(uint64_t a1)
{
  sub_10000D874(a1, *(void **)(v1 + 16));
}

uint64_t sub_10000DCF8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000DD08()
{
  return swift_release();
}

uint64_t sub_10000DD14()
{
  sub_1000093CC(0, (unint64_t *)&qword_100021C08);
  uint64_t result = sub_100016560();
  qword_1000225B8 = result;
  return result;
}

uint64_t sub_10000DD90()
{
  return sub_10000DE1C();
}

uint64_t sub_10000DDA4()
{
  return sub_10000DE1C();
}

uint64_t sub_10000DDB8()
{
  return sub_10000DE1C();
}

uint64_t sub_10000DDCC()
{
  return sub_10000DE1C();
}

uint64_t sub_10000DDE0()
{
  return sub_10000DE1C();
}

uint64_t sub_10000DDF4()
{
  return sub_10000DE1C();
}

uint64_t sub_10000DE08()
{
  return sub_10000DE1C();
}

uint64_t sub_10000DE1C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100016060();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_10000DE88()
{
  uint64_t v1 = sub_100016000();
  uint64_t v35 = *(void *)(v1 - 8);
  uint64_t v36 = v1;
  __chkstk_darwin(v1);
  int64_t v34 = (char *)v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_100016500();
  uint64_t v37 = *(void *)(v33 - 8);
  __chkstk_darwin(v33);
  unint64_t v32 = (char *)v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000164F0();
  __chkstk_darwin(v4);
  uint64_t v5 = sub_1000163C0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_1000064CC(&qword_100021FF0);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  NSString v9 = (char *)v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = v0 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager__stopRecordingCompleted;
  LOBYTE(v38) = 0;
  sub_100016050();
  id v11 = *(void (**)(uint64_t, char *, uint64_t))(v7 + 32);
  v11(v10, v9, v6);
  uint64_t v12 = v0 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager__audioPlaybackCompleted;
  LOBYTE(v38) = 0;
  sub_100016050();
  v11(v12, v9, v6);
  uint64_t v13 = v0 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager__audioStartRecordingFailed;
  LOBYTE(v38) = 0;
  sub_100016050();
  v11(v13, v9, v6);
  uint64_t v14 = v0 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager__audioStopRecordingFailed;
  LOBYTE(v38) = 0;
  sub_100016050();
  v11(v14, v9, v6);
  uint64_t v15 = v0 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager__audioPlaybackFailed;
  LOBYTE(v38) = 0;
  sub_100016050();
  v11(v15, v9, v6);
  uint64_t v16 = v0 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager__createAudioFileFailed;
  uint64_t v31 = v0;
  LOBYTE(v38) = 0;
  sub_100016050();
  v11(v16, v9, v6);
  uint64_t v17 = v0 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager__readAudioFileFailed;
  LOBYTE(v38) = 0;
  sub_100016050();
  v11(v17, v9, v6);
  uint64_t v30 = OBJC_IVAR____TtC15Diagnostic_600412AudioManager_audioInputQueue;
  sub_1000093CC(0, &qword_100021FF8);
  sub_1000163B0();
  unint64_t v38 = _swiftEmptyArrayStorage;
  v29[1] = sub_100011DA4(&qword_100022000, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  v29[0] = sub_1000064CC(&qword_100022008);
  v29[2] = sub_100011DEC(&qword_100022010, &qword_100022008);
  sub_100016590();
  uint64_t v18 = enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:);
  NSString v19 = *(void (**)(char *, uint64_t, uint64_t))(v37 + 104);
  v37 += 104;
  id v21 = v32;
  uint64_t v20 = v33;
  v19(v32, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v33);
  uint64_t v22 = sub_100016530();
  uint64_t v23 = v31;
  *(void *)(v31 + v30) = v22;
  uint64_t v30 = OBJC_IVAR____TtC15Diagnostic_600412AudioManager_audioOutputQueue;
  sub_1000163B0();
  unint64_t v38 = _swiftEmptyArrayStorage;
  sub_100016590();
  v19(v21, v18, v20);
  *(void *)(v23 + v30) = sub_100016530();
  uint64_t v24 = OBJC_IVAR____TtC15Diagnostic_600412AudioManager_audioDeviceTest;
  *(void *)(v23 + v24) = [objc_allocWithZone((Class)AVAudioDeviceTest) init];
  unint64_t v25 = v34;
  sub_100015F90();
  sub_100015FB0();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v25, v36);
  uint64_t v26 = OBJC_IVAR____TtC15Diagnostic_600412AudioManager_sequence;
  *(void *)(v23 + v26) = [objc_allocWithZone((Class)AVAudioDeviceTestSequence) init];
  [*(id *)(v23 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager_audioDeviceTest) setProcessSequenceAsynchronously:1];
  [*(id *)(v23 + v26) setOutputMode:0];
  [*(id *)(v23 + v26) setPriority:0];
  LODWORD(v27) = 1.0;
  [*(id *)(v23 + v26) setVolume:v27];
  [*(id *)(v23 + v26) setNumberOfChannels:4];
  return v23;
}

uint64_t sub_10000E550()
{
  uint64_t v1 = sub_1000163A0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000163C0();
  uint64_t v5 = *(void *)(v12 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000093CC(0, &qword_100021FF8);
  uint64_t v8 = (void *)sub_100016510();
  aBlock[4] = sub_100012400;
  uint64_t v14 = v0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000E9F8;
  aBlock[3] = &unk_10001D690;
  NSString v9 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_1000163B0();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100011DA4(&qword_100022020, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_1000064CC(&qword_100022028);
  sub_100011DEC(&qword_100022030, &qword_100022028);
  sub_100016590();
  sub_100016520();
  _Block_release(v9);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v12);
}

uint64_t sub_10000E808()
{
  return sub_100016070();
}

uint64_t sub_10000E9FC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000163A0();
  uint64_t v38 = *(void *)(v2 - 8);
  uint64_t v39 = v2;
  __chkstk_darwin(v2);
  uint64_t v37 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000163C0();
  uint64_t v35 = *(void *)(v4 - 8);
  uint64_t v36 = v4;
  __chkstk_darwin(v4);
  int64_t v34 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100016000();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v33 - v11;
  sub_1000110D4();
  sub_100015FC0();
  sub_100015FD0();
  uint64_t v13 = *(void (**)(char *, uint64_t))(v7 + 8);
  v13(v10, v6);
  uint64_t v14 = sub_100015FF0();
  uint64_t v16 = v15;
  v13(v12, v6);
  uint64_t v17 = OBJC_IVAR____TtC15Diagnostic_600412AudioManager_sequence;
  id v18 = *(id *)(v1 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager_sequence);
  NSString v19 = sub_1000163F0();
  [v18 setMicrophone:v19];

  sub_1000164D0();
  if (qword_1000216E8 != -1) {
    swift_once();
  }
  sub_1000064CC(&qword_100021BF8);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_100018E90;
  id v21 = *(id *)(v1 + v17);
  id v22 = [v21 description];
  uint64_t v23 = sub_100016400();
  uint64_t v25 = v24;

  *(void *)(v20 + 56) = &type metadata for String;
  unint64_t v26 = sub_10000CC08();
  *(void *)(v20 + 32) = v23;
  *(void *)(v20 + 40) = v25;
  *(void *)(v20 + 96) = &type metadata for String;
  *(void *)(v20 + 104) = v26;
  *(void *)(v20 + 64) = v26;
  *(void *)(v20 + 72) = v14;
  *(void *)(v20 + 80) = v16;
  swift_bridgeObjectRetain();
  sub_100016020();
  swift_bridgeObjectRelease();
  double v27 = (void *)swift_allocObject();
  v27[2] = v1;
  v27[3] = v14;
  v27[4] = v16;
  aBlock[4] = sub_100012328;
  void aBlock[5] = v27;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000E9F8;
  aBlock[3] = &unk_10001D5F0;
  Swift::String v28 = _Block_copy(aBlock);
  swift_retain();
  uint64_t v29 = v34;
  sub_1000163B0();
  long long v40 = &_swiftEmptyArrayStorage;
  sub_100011DA4(&qword_100022020, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_1000064CC(&qword_100022028);
  sub_100011DEC(&qword_100022030, &qword_100022028);
  uint64_t v30 = v37;
  uint64_t v31 = v39;
  sub_100016590();
  sub_100016520();
  _Block_release(v28);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v30, v31);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v29, v36);
  return swift_release();
}

void sub_10000EF18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)(a1 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager_audioDeviceTest);
  id v7 = *(id *)(a1 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager_sequence);
  NSString v8 = sub_1000163F0();
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a1;
  v9[3] = a2;
  v9[4] = a3;
  v11[4] = sub_100012378;
  v11[5] = v9;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_10000F4FC;
  v11[3] = &unk_10001D640;
  uint64_t v10 = _Block_copy(v11);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_release();
  [v6 startRecording:v7 filePath:v8 completion:v10];
  _Block_release(v10);
}

uint64_t sub_10000F058(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_1000163A0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000163C0();
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v25 = a2;
    uint64_t v26 = v14;
    uint64_t v27 = v13;
    uint64_t v28 = v9;
    swift_errorRetain();
    sub_1000164B0();
    if (qword_1000216E8 != -1) {
      swift_once();
    }
    sub_1000064CC(&qword_100021BF8);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_100018E30;
    aBlock[0] = a1;
    swift_errorRetain();
    sub_1000064CC(&qword_100022018);
    uint64_t v18 = sub_100016410();
    uint64_t v20 = v19;
    *(void *)(v17 + 56) = &type metadata for String;
    *(void *)(v17 + 64) = sub_10000CC08();
    *(void *)(v17 + 32) = v18;
    *(void *)(v17 + 40) = v20;
    sub_100016020();
    swift_bridgeObjectRelease();
    sub_1000093CC(0, &qword_100021FF8);
    id v21 = (void *)sub_100016510();
    aBlock[4] = sub_100012384;
    void aBlock[5] = v25;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000E9F8;
    aBlock[3] = &unk_10001D668;
    id v22 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    sub_1000163B0();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_100011DA4(&qword_100022020, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_1000064CC(&qword_100022028);
    sub_100011DEC(&qword_100022030, &qword_100022028);
    sub_100016590();
    sub_100016520();
    _Block_release(v22);

    swift_errorRelease();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v11, v8);
    return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v16, v27);
  }
  else
  {
    sub_1000164D0();
    if (qword_1000216E8 != -1) {
      swift_once();
    }
    sub_1000064CC(&qword_100021BF8);
    uint64_t v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_100018E30;
    *(void *)(v24 + 56) = &type metadata for String;
    *(void *)(v24 + 64) = sub_10000CC08();
    *(void *)(v24 + 32) = a3;
    *(void *)(v24 + 40) = a4;
    swift_bridgeObjectRetain();
    sub_100016020();
    return swift_bridgeObjectRelease();
  }
}

void sub_10000F4FC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_10000F568(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_10000F5AC()
{
  uint64_t v1 = sub_1000163A0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  id v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10[0] = sub_1000163C0();
  uint64_t v5 = *(void *)(v10[0] - 8);
  __chkstk_darwin(v10[0]);
  id v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000164D0();
  if (qword_1000216E8 != -1) {
    swift_once();
  }
  sub_100016020();
  aBlock[4] = sub_10001221C;
  void aBlock[5] = v0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000E9F8;
  aBlock[3] = &unk_10001D528;
  uint64_t v8 = _Block_copy(aBlock);
  swift_retain();
  sub_1000163B0();
  v10[1] = &_swiftEmptyArrayStorage;
  sub_100011DA4(&qword_100022020, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_1000064CC(&qword_100022028);
  sub_100011DEC(&qword_100022030, &qword_100022028);
  sub_100016590();
  sub_100016520();
  _Block_release(v8);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, void))(v5 + 8))(v7, v10[0]);
  swift_release();
  sub_1000164D0();
  return sub_100016020();
}

void sub_10000F8D4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager_audioDeviceTest);
  v3[4] = sub_100012224;
  v3[5] = a1;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 1107296256;
  v3[2] = sub_10000F4FC;
  v3[3] = &unk_10001D550;
  uint64_t v2 = _Block_copy(v3);
  swift_retain();
  swift_release();
  [v1 stopRecording:v2];
  _Block_release(v2);
}

uint64_t sub_10000F9A4(void **a1, uint64_t a2)
{
  uint64_t v4 = sub_1000163A0();
  uint64_t v5 = *(void (***)(char *, uint64_t))(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000163C0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v24 = v9;
    uint64_t v25 = v8;
    uint64_t v26 = v5;
    swift_errorRetain();
    sub_1000164B0();
    if (qword_1000216E8 != -1) {
      swift_once();
    }
    sub_1000064CC(&qword_100021BF8);
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_100018E30;
    long long aBlock = a1;
    swift_errorRetain();
    sub_1000064CC(&qword_100022018);
    uint64_t v13 = sub_100016410();
    uint64_t v15 = v14;
    *(void *)(v12 + 56) = &type metadata for String;
    *(void *)(v12 + 64) = sub_10000CC08();
    *(void *)(v12 + 32) = v13;
    *(void *)(v12 + 40) = v15;
    sub_100016020();
    swift_bridgeObjectRelease();
    sub_1000093CC(0, &qword_100021FF8);
    uint64_t v16 = (void *)sub_100016510();
    uint64_t v31 = sub_100012258;
    uint64_t v32 = a2;
    long long aBlock = _NSConcreteStackBlock;
    uint64_t v28 = 1107296256;
    uint64_t v29 = sub_10000E9F8;
    uint64_t v30 = &unk_10001D5A0;
    uint64_t v17 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    sub_1000163B0();
    long long aBlock = (void **)&_swiftEmptyArrayStorage;
    sub_100011DA4(&qword_100022020, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_1000064CC(&qword_100022028);
    sub_100011DEC(&qword_100022030, &qword_100022028);
    sub_100016590();
    sub_100016520();
    _Block_release(v17);

    swift_errorRelease();
    v26[1](v7, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v11, v25);
  }
  else
  {
    sub_1000093CC(0, &qword_100021FF8);
    uint64_t v19 = sub_100016510();
    uint64_t v31 = sub_10001222C;
    uint64_t v32 = a2;
    uint64_t v26 = (void (**)(char *, uint64_t))v19;
    long long aBlock = _NSConcreteStackBlock;
    uint64_t v28 = 1107296256;
    uint64_t v29 = sub_10000E9F8;
    uint64_t v30 = &unk_10001D578;
    uint64_t v20 = v9;
    id v21 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    sub_1000163B0();
    long long aBlock = (void **)&_swiftEmptyArrayStorage;
    sub_100011DA4(&qword_100022020, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_1000064CC(&qword_100022028);
    sub_100011DEC(&qword_100022030, &qword_100022028);
    sub_100016590();
    id v22 = v26;
    sub_100016520();
    _Block_release(v21);

    v5[1](v7, v4);
    (*(void (**)(char *, uint64_t))(v20 + 8))(v11, v8);
    sub_1000164A0();
    if (qword_1000216E8 != -1) {
      swift_once();
    }
    return sub_100016020();
  }
}

uint64_t sub_10000FF48(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1000163A0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000163C0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[0] = *(void *)(v3 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager_audioOutputQueue);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = v3;
  v14[3] = a1;
  v14[4] = a2;
  aBlock[4] = sub_100011FD8;
  void aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000E9F8;
  aBlock[3] = &unk_10001D488;
  uint64_t v15 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1000163B0();
  v17[1] = &_swiftEmptyArrayStorage;
  sub_100011DA4(&qword_100022020, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_1000064CC(&qword_100022028);
  sub_100011DEC(&qword_100022030, &qword_100022028);
  sub_100016590();
  sub_100016520();
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return swift_release();
}

void sub_100010210(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_100016000();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v13 = (char *)v41 - v12;
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)v41 - v14;
  uint64_t v16 = *(void **)(a1 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager_audioDeviceTest);
  [v16 stopPlayback];
  uint64_t v17 = OBJC_IVAR____TtC15Diagnostic_600412AudioManager_sequence;
  [*(id *)(a1 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager_sequence) setOutputMode:1];
  swift_bridgeObjectRetain();
  if (sub_1000120D0(a2, a3) == 5)
  {
    sub_1000164B0();
    if (qword_1000216E8 != -1) {
      swift_once();
    }
    sub_100016020();
  }
  else
  {
    id v44 = v16;
    id v18 = *(id *)(a1 + v17);
    NSString v19 = sub_1000163F0();
    [v18 setMicrophone:v19];

    id v20 = *(id *)(a1 + v17);
    sub_100015FC0();
    sub_100015FD0();
    id v21 = *(void (**)(char *, uint64_t))(v7 + 8);
    v21(v13, v6);
    sub_100015FA0(v22);
    uint64_t v24 = v23;
    unint64_t v42 = v21;
    uint64_t v43 = v6;
    v21(v15, v6);
    [v20 setStimulusURL:v24];

    v41[1] = sub_1000164D0();
    if (qword_1000216E8 != -1) {
      swift_once();
    }
    sub_1000064CC(&qword_100021BF8);
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_100018E90;
    id v26 = [*(id *)(a1 + v17) microphone];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = sub_100016400();
      unint64_t v30 = v29;
    }
    else
    {
      uint64_t v28 = 0;
      unint64_t v30 = 0;
    }
    *(void *)(v25 + 56) = &type metadata for String;
    unint64_t v31 = sub_10000CC08();
    *(void *)(v25 + 64) = v31;
    unint64_t v32 = 0xD000000000000010;
    if (v30) {
      unint64_t v32 = v28;
    }
    unint64_t v33 = 0x8000000100017B10;
    if (v30) {
      unint64_t v33 = v30;
    }
    *(void *)(v25 + 32) = v32;
    *(void *)(v25 + 40) = v33;
    id v34 = [*(id *)(a1 + v17) stimulusURL];
    sub_100015FE0();

    uint64_t v35 = sub_100015F80();
    uint64_t v37 = v36;
    v42(v10, v43);
    *(void *)(v25 + 96) = &type metadata for String;
    *(void *)(v25 + 104) = v31;
    *(void *)(v25 + 72) = v35;
    *(void *)(v25 + 80) = v37;
    sub_100016020();
    swift_bridgeObjectRelease();
    uint64_t v38 = *(void **)(a1 + v17);
    aBlock[4] = sub_10001211C;
    void aBlock[5] = a1;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000F4FC;
    aBlock[3] = &unk_10001D4B0;
    uint64_t v39 = _Block_copy(aBlock);
    id v40 = v38;
    swift_retain();
    swift_release();
    [v44 playback:v40 filePath:0 completion:v39];
    _Block_release(v39);
  }
}

uint64_t sub_100010700(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_100016000();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v7 = (char *)v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)v38 - v8;
  uint64_t v10 = sub_1000163A0();
  uint64_t v46 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000163C0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  id v18 = (char *)v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = v15;
  if (v17)
  {
    uint64_t v41 = (char *)v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    unint64_t v42 = v12;
    uint64_t v43 = v14;
    uint64_t v44 = v10;
    NSString v19 = v17;
    swift_errorRetain();
    int v39 = sub_1000164B0();
    if (qword_1000216E8 != -1) {
      swift_once();
    }
    v38[1] = qword_1000225B8;
    sub_1000064CC(&qword_100021BF8);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_100018E90;
    long long aBlock = v19;
    swift_errorRetain();
    sub_1000064CC(&qword_100022018);
    uint64_t v21 = sub_100016410();
    id v40 = v19;
    uint64_t v23 = v22;
    *(void *)(v20 + 56) = &type metadata for String;
    unint64_t v24 = sub_10000CC08();
    *(void *)(v20 + 64) = v24;
    *(void *)(v20 + 32) = v21;
    *(void *)(v20 + 40) = v23;
    sub_100015FC0();
    sub_100015FD0();
    uint64_t v25 = *(void (**)(char *, uint64_t))(v4 + 8);
    v25(v7, v3);
    uint64_t v26 = sub_100015F80();
    uint64_t v28 = v27;
    v25(v9, v3);
    *(void *)(v20 + 96) = &type metadata for String;
    *(void *)(v20 + 104) = v24;
    *(void *)(v20 + 72) = v26;
    *(void *)(v20 + 80) = v28;
    sub_100016020();
    swift_bridgeObjectRelease();
    sub_1000093CC(0, &qword_100021FF8);
    unint64_t v29 = (void *)sub_100016510();
    unint64_t v51 = sub_100012150;
    uint64_t v52 = a2;
    long long aBlock = _NSConcreteStackBlock;
    uint64_t v48 = 1107296256;
    long long v49 = sub_10000E9F8;
    uint64_t v50 = &unk_10001D500;
    unint64_t v30 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    unint64_t v31 = v41;
    sub_1000163B0();
    long long aBlock = (void **)&_swiftEmptyArrayStorage;
    sub_100011DA4(&qword_100022020, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_1000064CC(&qword_100022028);
    sub_100011DEC(&qword_100022030, &qword_100022028);
    unint64_t v32 = v42;
    uint64_t v33 = v44;
    sub_100016590();
    sub_100016520();
    _Block_release(v30);

    (*(void (**)(char *, uint64_t))(v46 + 8))(v32, v33);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v31, v45);
    sub_100011680();
    sub_10000E550();
    return swift_errorRelease();
  }
  else
  {
    sub_1000093CC(0, &qword_100021FF8);
    uint64_t v35 = v14;
    uint64_t v36 = (void *)sub_100016510();
    unint64_t v51 = sub_100012124;
    uint64_t v52 = a2;
    long long aBlock = _NSConcreteStackBlock;
    uint64_t v48 = 1107296256;
    long long v49 = sub_10000E9F8;
    uint64_t v50 = &unk_10001D4D8;
    uint64_t v37 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    sub_1000163B0();
    long long aBlock = (void **)&_swiftEmptyArrayStorage;
    sub_100011DA4(&qword_100022020, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_1000064CC(&qword_100022028);
    sub_100011DEC(&qword_100022030, &qword_100022028);
    sub_100016590();
    sub_100016520();
    _Block_release(v37);

    (*(void (**)(char *, uint64_t))(v46 + 8))(v12, v10);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v18, v45);
    sub_1000164A0();
    if (qword_1000216E8 != -1) {
      swift_once();
    }
    return sub_100016020();
  }
}

uint64_t sub_100010E0C()
{
  return sub_100010E4C((uint64_t)sub_100011F88, (uint64_t)&unk_10001D438);
}

uint64_t sub_100010E2C()
{
  return sub_100010E4C((uint64_t)sub_100011F7C, (uint64_t)&unk_10001D410);
}

uint64_t sub_100010E4C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_1000163A0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000163C0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15[0] = *(void *)(v2 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager_audioOutputQueue);
  aBlock[4] = a1;
  uint64_t v17 = v2;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000E9F8;
  aBlock[3] = a2;
  uint64_t v13 = _Block_copy(aBlock);
  swift_retain();
  sub_1000163B0();
  v15[1] = &_swiftEmptyArrayStorage;
  sub_100011DA4(&qword_100022020, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_1000064CC(&qword_100022028);
  sub_100011DEC(&qword_100022030, &qword_100022028);
  sub_100016590();
  sub_100016520();
  _Block_release(v13);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return swift_release();
}

uint64_t sub_1000110D4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000163A0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000163C0();
  uint64_t v30 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100011680();
  sub_10000E550();
  id v9 = [self defaultManager];
  sub_100015FA0((NSURL *)OBJC_IVAR____TtC15Diagnostic_600412AudioManager_audioFileFolderURL);
  uint64_t v11 = v10;
  aBlock[0] = 0;
  unsigned int v12 = [v9 createDirectoryAtURL:v10 withIntermediateDirectories:0 attributes:0 error:aBlock];

  if (v12)
  {
    id v13 = aBlock[0];
    sub_1000164D0();
    if (qword_1000216E8 != -1) {
      swift_once();
    }
    sub_1000064CC(&qword_100021BF8);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_100018E30;
    uint64_t v15 = sub_100015FF0();
    uint64_t v17 = v16;
    *(void *)(v14 + 56) = &type metadata for String;
    *(void *)(v14 + 64) = sub_10000CC08();
    *(void *)(v14 + 32) = v15;
    *(void *)(v14 + 40) = v17;
    sub_100016020();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v28 = v6;
    uint64_t v29 = v3;
    id v19 = aBlock[0];
    uint64_t v20 = (void *)sub_100015F70();

    swift_willThrow();
    sub_1000164B0();
    if (qword_1000216E8 != -1) {
      swift_once();
    }
    sub_1000064CC(&qword_100021BF8);
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_100018E30;
    aBlock[0] = v20;
    swift_errorRetain();
    sub_1000064CC(&qword_100022018);
    uint64_t v22 = sub_100016410();
    uint64_t v24 = v23;
    *(void *)(v21 + 56) = &type metadata for String;
    *(void *)(v21 + 64) = sub_10000CC08();
    *(void *)(v21 + 32) = v22;
    *(void *)(v21 + 40) = v24;
    sub_100016020();
    swift_bridgeObjectRelease();
    sub_1000093CC(0, &qword_100021FF8);
    uint64_t v25 = (void *)sub_100016510();
    aBlock[4] = sub_100011D60;
    void aBlock[5] = v1;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_10000E9F8;
    aBlock[3] = &unk_10001D3E8;
    uint64_t v26 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    sub_1000163B0();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_100011DA4(&qword_100022020, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_1000064CC(&qword_100022028);
    sub_100011DEC(&qword_100022030, &qword_100022028);
    sub_100016590();
    sub_100016520();
    _Block_release(v26);

    (*(void (**)(char *, uint64_t))(v29 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v8, v28);
    sub_100011680();
    sub_10000E550();
    return swift_errorRelease();
  }
}

uint64_t sub_100011610()
{
  return sub_100016070();
}

void sub_100011680()
{
  uint64_t v0 = self;
  id v1 = [v0 defaultManager];
  sub_100015FF0();
  NSString v2 = sub_1000163F0();
  swift_bridgeObjectRelease();
  unsigned int v3 = [v1 fileExistsAtPath:v2];

  if (v3)
  {
    id v4 = [v0 defaultManager];
    sub_100015FA0(v5);
    uint64_t v7 = v6;
    id v21 = 0;
    unsigned int v8 = [v4 removeItemAtURL:v6 error:&v21];

    if (v8)
    {
      id v9 = v21;
      sub_1000164D0();
      if (qword_1000216E8 != -1) {
        swift_once();
      }
      sub_1000064CC(&qword_100021BF8);
      uint64_t v10 = swift_allocObject();
      *(_OWORD *)(v10 + 16) = xmmword_100018E30;
      uint64_t v11 = sub_100015FF0();
      uint64_t v13 = v12;
      *(void *)(v10 + 56) = &type metadata for String;
      *(void *)(v10 + 64) = sub_10000CC08();
      *(void *)(v10 + 32) = v11;
      *(void *)(v10 + 40) = v13;
      sub_100016020();
      swift_bridgeObjectRelease();
    }
    else
    {
      id v14 = v21;
      uint64_t v15 = (void *)sub_100015F70();

      swift_willThrow();
      sub_1000164B0();
      if (qword_1000216E8 != -1) {
        swift_once();
      }
      sub_1000064CC(&qword_100021BF8);
      uint64_t v16 = swift_allocObject();
      *(_OWORD *)(v16 + 16) = xmmword_100018E30;
      id v21 = v15;
      swift_errorRetain();
      sub_1000064CC(&qword_100022018);
      uint64_t v17 = sub_100016410();
      uint64_t v19 = v18;
      *(void *)(v16 + 56) = &type metadata for String;
      *(void *)(v16 + 64) = sub_10000CC08();
      *(void *)(v16 + 32) = v17;
      *(void *)(v16 + 40) = v19;
      sub_100016020();
      uint64_t v20 = swift_bridgeObjectRelease();
      sub_100011680(v20);
      sub_10000E550();
      swift_errorRelease();
    }
  }
}

uint64_t sub_100011980()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager__stopRecordingCompleted;
  uint64_t v2 = sub_1000064CC(&qword_100021FF0);
  unsigned int v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager__audioPlaybackCompleted, v2);
  v3(v0 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager__audioStartRecordingFailed, v2);
  v3(v0 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager__audioStopRecordingFailed, v2);
  v3(v0 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager__audioPlaybackFailed, v2);
  v3(v0 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager__createAudioFileFailed, v2);
  v3(v0 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager__readAudioFileFailed, v2);

  uint64_t v4 = v0 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager_audioFileFolderURL;
  uint64_t v5 = sub_100016000();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  return v0;
}

uint64_t sub_100011B28()
{
  sub_100011980();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_100011B80()
{
  return type metadata accessor for AudioManager();
}

uint64_t type metadata accessor for AudioManager()
{
  uint64_t result = qword_100021D50;
  if (!qword_100021D50) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100011BD4()
{
  sub_100011CBC();
  if (v0 <= 0x3F)
  {
    sub_100016000();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_100011CBC()
{
  if (!qword_100021D60)
  {
    unint64_t v0 = sub_100016080();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100021D60);
    }
  }
}

void *sub_100011D14()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_100011D20@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AudioManager();
  uint64_t result = sub_100016040();
  *a1 = result;
  return result;
}

uint64_t sub_100011D60()
{
  return sub_100011610();
}

uint64_t sub_100011D8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100011D9C()
{
  return swift_release();
}

uint64_t sub_100011DA4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100011DEC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007090(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100011E3C@<X0>(unsigned char *a1@<X8>)
{
  return sub_100011FE4(a1);
}

uint64_t sub_100011E50()
{
  return sub_100012060();
}

uint64_t sub_100011E64@<X0>(unsigned char *a1@<X8>)
{
  return sub_100011FE4(a1);
}

uint64_t sub_100011E78()
{
  return sub_100012060();
}

uint64_t sub_100011E8C@<X0>(unsigned char *a1@<X8>)
{
  return sub_100011FE4(a1);
}

uint64_t sub_100011EA0()
{
  return sub_100012060();
}

uint64_t sub_100011EB4@<X0>(unsigned char *a1@<X8>)
{
  return sub_100011FE4(a1);
}

uint64_t sub_100011EC8()
{
  return sub_100012060();
}

uint64_t sub_100011EDC@<X0>(unsigned char *a1@<X8>)
{
  return sub_100011FE4(a1);
}

uint64_t sub_100011EF0()
{
  return sub_100012060();
}

uint64_t sub_100011F04@<X0>(unsigned char *a1@<X8>)
{
  return sub_100011FE4(a1);
}

uint64_t sub_100011F18@<X0>(unsigned char *a1@<X8>)
{
  return sub_100011FE4(a1);
}

uint64_t sub_100011F40()
{
  return sub_100012060();
}

uint64_t sub_100011F54()
{
  return sub_100012060();
}

uint64_t sub_100011F7C()
{
  return sub_100011F94((SEL *)&selRef_cancel);
}

uint64_t sub_100011F88()
{
  return sub_100011F94((SEL *)&selRef_stopPlayback);
}

uint64_t sub_100011F94(SEL *a1)
{
  [*(id *)(v1 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager_audioDeviceTest) *a1];
  sub_100011680();

  return sub_10000E550();
}

void sub_100011FD8()
{
  sub_100010210(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_100011FE4@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100016060();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100012060()
{
  return sub_100016070();
}

uint64_t sub_1000120D0(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_10001CC68;
  v6._object = a2;
  unint64_t v4 = sub_100016610(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 5) {
    return 5;
  }
  else {
    return v4;
  }
}

uint64_t sub_10001211C(uint64_t a1)
{
  return sub_100010700(a1, v1);
}

uint64_t sub_100012124()
{
  return sub_100011610();
}

uint64_t sub_100012150()
{
  return sub_100011610();
}

uint64_t sub_10001217C@<X0>(unsigned char *a1@<X8>)
{
  return sub_100011FE4(a1);
}

uint64_t sub_1000121A4()
{
  return sub_100012060();
}

uint64_t sub_1000121CC@<X0>(unsigned char *a1@<X8>)
{
  return sub_100011FE4(a1);
}

uint64_t sub_1000121F4()
{
  return sub_100012060();
}

void sub_10001221C()
{
  sub_10000F8D4(v0);
}

uint64_t sub_100012224(void **a1)
{
  return sub_10000F9A4(a1, v1);
}

uint64_t sub_10001222C()
{
  return sub_100011610();
}

uint64_t sub_100012258()
{
  return sub_100011610();
}

uint64_t sub_100012284@<X0>(unsigned char *a1@<X8>)
{
  return sub_100011FE4(a1);
}

uint64_t sub_1000122AC()
{
  return sub_100012060();
}

uint64_t sub_1000122D4@<X0>(unsigned char *a1@<X8>)
{
  return sub_100011FE4(a1);
}

uint64_t sub_1000122FC()
{
  return sub_100012060();
}

void sub_100012328()
{
  sub_10000EF18(v0[2], v0[3], v0[4]);
}

uint64_t sub_100012338()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100012378(uint64_t a1)
{
  return sub_10000F058(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_100012384()
{
  return sub_100011610();
}

uint64_t sub_1000123B0@<X0>(unsigned char *a1@<X8>)
{
  return sub_100011FE4(a1);
}

uint64_t sub_1000123D8()
{
  return sub_100012060();
}

uint64_t sub_100012400()
{
  return sub_10000E808();
}

uint64_t sub_100012408@<X0>(unsigned char *a1@<X8>)
{
  return sub_100011FE4(a1);
}

uint64_t sub_100012430()
{
  return sub_100012060();
}

id sub_1000124C8(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR____TtC15Diagnostic_600438MicrophoneTestEvaluatingViewController_checked] = &_swiftEmptyDictionarySingleton;
  *(void *)&v1[OBJC_IVAR____TtC15Diagnostic_600438MicrophoneTestEvaluatingViewController_audioManager] = a1;
  swift_retain();
  sub_100014830(0xD000000000000015, (void *)0x8000000100017DA0);
  NSString v2 = sub_1000163F0();
  swift_bridgeObjectRelease();
  sub_100014830(0xD00000000000001BLL, (void *)0x8000000100017DC0);
  NSString v3 = sub_1000163F0();
  swift_bridgeObjectRelease();
  NSString v4 = sub_1000163F0();
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for MicrophoneTestEvaluatingViewController();
  id v5 = [super initWithTitle:v2 detailText:v3 symbolName:v4 contentLayout:3];

  swift_release();
  return v5;
}

void sub_1000125F0()
{
  v61.receiver = v0;
  v61.super_class = (Class)type metadata accessor for MicrophoneTestEvaluatingViewController();
  [super viewDidLoad];
  id v1 = [v0 navigationItem];
  [v1 setHidesBackButton:1];

  uint64_t v2 = swift_allocObject();
  sub_1000061B0((uint64_t)v62);
  long long v3 = v62[11];
  *(_OWORD *)(v2 + 176) = v62[10];
  *(_OWORD *)(v2 + 192) = v3;
  *(void *)(v2 + 208) = v63;
  long long v4 = v62[7];
  *(_OWORD *)(v2 + 112) = v62[6];
  *(_OWORD *)(v2 + 128) = v4;
  long long v5 = v62[9];
  *(_OWORD *)(v2 + 144) = v62[8];
  *(_OWORD *)(v2 + 160) = v5;
  long long v6 = v62[3];
  *(_OWORD *)(v2 + 48) = v62[2];
  *(_OWORD *)(v2 + 64) = v6;
  long long v7 = v62[5];
  *(_OWORD *)(v2 + 80) = v62[4];
  *(_OWORD *)(v2 + 96) = v7;
  long long v8 = v62[1];
  *(_OWORD *)(v2 + 16) = v62[0];
  *(_OWORD *)(v2 + 32) = v8;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v0;
  *(void *)(v9 + 24) = v2;
  swift_beginAccess();
  uint64_t v10 = *(void *)(v2 + 200);
  *(void *)(v2 + 200) = sub_100014794;
  *(void *)(v2 + 208) = v9;
  id v11 = v0;
  swift_retain();
  sub_100007E5C(v10);
  long long v12 = *(_OWORD *)(v2 + 64);
  v64[2] = *(_OWORD *)(v2 + 48);
  v64[3] = v12;
  long long v13 = *(_OWORD *)(v2 + 128);
  v64[6] = *(_OWORD *)(v2 + 112);
  v64[7] = v13;
  long long v14 = *(_OWORD *)(v2 + 96);
  v64[4] = *(_OWORD *)(v2 + 80);
  v64[5] = v14;
  uint64_t v65 = *(void *)(v2 + 208);
  long long v15 = *(_OWORD *)(v2 + 192);
  v64[10] = *(_OWORD *)(v2 + 176);
  v64[11] = v15;
  long long v16 = *(_OWORD *)(v2 + 160);
  v64[8] = *(_OWORD *)(v2 + 144);
  v64[9] = v16;
  long long v17 = *(_OWORD *)(v2 + 32);
  v64[0] = *(_OWORD *)(v2 + 16);
  v64[1] = v17;
  type metadata accessor for AudioManager();
  swift_retain();
  sub_1000070F0((uint64_t)v64);
  sub_100006474();
  sub_100016030();
  id v18 = objc_allocWithZone((Class)sub_1000064CC(&qword_100022070));
  uint64_t v19 = (void *)sub_1000161D0();
  id v20 = [v19 view];
  if (v20)
  {
    id v21 = v20;
    [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v22 = [v11 contentView];
    [v22 addSubview:v21];

    id v60 = self;
    sub_1000064CC(&qword_100021A58);
    uint64_t v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_1000190E0;
    id v24 = [v21 leadingAnchor];
    id v25 = [v11 contentView];
    id v26 = [v25 leadingAnchor];

    id v27 = [v24 constraintEqualToAnchor:v26];
    *(void *)(v23 + 32) = v27;
    id v28 = [v21 trailingAnchor];
    id v29 = [v11 contentView];
    id v30 = [v29 trailingAnchor];

    id v31 = [v28 constraintEqualToAnchor:v30];
    *(void *)(v23 + 40) = v31;
    id v32 = [v21 topAnchor];
    id v33 = [v11 contentView];
    id v34 = [v33 topAnchor];

    id v35 = [v32 constraintEqualToAnchor:v34];
    *(void *)(v23 + 48) = v35;
    id v36 = [v21 bottomAnchor];
    id v37 = [v11 contentView];
    id v38 = [v37 bottomAnchor];

    id v39 = [v36 constraintEqualToAnchor:v38];
    *(void *)(v23 + 56) = v39;
    sub_100016450();
    sub_1000093CC(0, &qword_100021A60);
    Class isa = sub_100016440().super.isa;
    swift_bridgeObjectRelease();
    [v60 activateConstraints:isa];

    id v41 = [self linkButton];
    sub_100014830(0x415F44524F434552, (void *)0xEC0000004E494147);
    NSString v42 = sub_1000163F0();
    swift_bridgeObjectRelease();
    [v41 setTitle:v42 forState:0];

    sub_1000093CC(0, (unint64_t *)&qword_100021A10);
    uint64_t v43 = swift_allocObject();
    *(void *)(v43 + 16) = v11;
    id v44 = v11;
    uint64_t v57 = v43;
    uint64_t v45 = (void *)sub_100016540();
    [v41 addAction:v45 forControlEvents:64];

    id v46 = [v44 buttonTray];
    [v46 addButton:v41];

    id v47 = [v44 navigationItem];
    sub_1000093CC(0, &qword_100022078);
    uint64_t v48 = swift_allocObject();
    *(void *)(v48 + 16) = v44;
    id v49 = v44;
    uint64_t v58 = v48;
    v66.value.super.super.Class isa = (Class)sub_100016540();
    v66.is_nil = 0;
    Class v50 = sub_1000164E0(UIBarButtonSystemItemCancel, v66, v68).super.super.isa;
    [v47 setLeftBarButtonItem:v50];

    id v51 = [v49 navigationItem];
    uint64_t v52 = swift_allocObject();
    *(void *)(v52 + 16) = v49;
    id v53 = v49;
    uint64_t v59 = v52;
    v67.value.super.super.Class isa = (Class)sub_100016540();
    v67.is_nil = 0;
    Class v54 = sub_1000164E0(UIBarButtonSystemItemDone, v67, v69).super.super.isa;
    [v51 setRightBarButtonItem:v54];

    id v55 = [v53 navigationItem];
    id v56 = [v55 rightBarButtonItem];

    if (v56)
    {
      [v56 setEnabled:0];
      swift_release();
    }
    else
    {
      swift_release();
    }
  }
  else
  {
    swift_release();
  }
}

void sub_100012E1C(uint64_t a1, char *a2, uint64_t a3)
{
  *(void *)&a2[OBJC_IVAR____TtC15Diagnostic_600438MicrophoneTestEvaluatingViewController_checked] = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v6 = [a2 navigationItem];
  id v7 = [v6 rightBarButtonItem];

  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 16);
    swift_beginAccess();
    [v7 setEnabled:v8 == *(void *)(a3 + 16)];
  }
}

void sub_100012EE4(uint64_t a1, void *a2)
{
  sub_100014830(0xD000000000000019, (void *)0x8000000100017D60);
  sub_100014830(0xD000000000000019, (void *)0x8000000100017D80);
  NSString v3 = sub_1000163F0();
  swift_bridgeObjectRelease();
  NSString v4 = sub_1000163F0();
  swift_bridgeObjectRelease();
  id v5 = [self alertControllerWithTitle:v3 message:v4 preferredStyle:1];

  sub_100014830(20302, (void *)0xE200000000000000);
  NSString v6 = sub_1000163F0();
  swift_bridgeObjectRelease();
  uint64_t v19 = (void (*)(uint64_t))nullsub_1;
  uint64_t v20 = 0;
  long long v15 = _NSConcreteStackBlock;
  uint64_t v16 = 1107296256;
  long long v17 = sub_10000946C;
  id v18 = &unk_10001D7D0;
  id v7 = _Block_copy(&v15);
  swift_release();
  uint64_t v8 = self;
  id v9 = [v8 actionWithTitle:v6 style:0 handler:v7];
  _Block_release(v7);

  [v5 addAction:v9];
  sub_100014830(5457241, (void *)0xE300000000000000);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  id v11 = a2;
  NSString v12 = sub_1000163F0();
  swift_bridgeObjectRelease();
  uint64_t v19 = sub_100014804;
  uint64_t v20 = v10;
  long long v15 = _NSConcreteStackBlock;
  uint64_t v16 = 1107296256;
  long long v17 = sub_10000946C;
  id v18 = &unk_10001D820;
  long long v13 = _Block_copy(&v15);
  swift_release();
  id v14 = [v8 actionWithTitle:v12 style:1 handler:v13];
  _Block_release(v13);

  [v5 addAction:v14];
  [v11 presentViewController:v5 animated:1 completion:0];
}

void sub_1000131E0(uint64_t a1, void *a2)
{
  swift_retain();
  sub_100010E2C();
  swift_release();
  id v3 = [a2 navigationController];
  if (v3)
  {
    id v4 = v3;
  }
}

void sub_100013288(uint64_t a1, void *a2)
{
  sub_100014830(0xD000000000000018, (void *)0x80000001000177B0);
  sub_100014830(0xD000000000000018, (void *)0x80000001000177D0);
  NSString v3 = sub_1000163F0();
  swift_bridgeObjectRelease();
  NSString v4 = sub_1000163F0();
  swift_bridgeObjectRelease();
  id v5 = [self alertControllerWithTitle:v3 message:v4 preferredStyle:1];

  sub_100014830(20302, (void *)0xE200000000000000);
  NSString v6 = sub_1000163F0();
  swift_bridgeObjectRelease();
  long long v17 = (void (*)())nullsub_1;
  uint64_t v18 = 0;
  long long v13 = _NSConcreteStackBlock;
  uint64_t v14 = 1107296256;
  long long v15 = sub_10000946C;
  uint64_t v16 = &unk_10001D780;
  id v7 = _Block_copy(&v13);
  swift_release();
  uint64_t v8 = self;
  id v9 = [v8 actionWithTitle:v6 style:0 handler:v7];
  _Block_release(v7);

  [v5 addAction:v9];
  sub_100014830(5457241, (void *)0xE300000000000000);
  NSString v10 = sub_1000163F0();
  swift_bridgeObjectRelease();
  long long v17 = sub_10000DACC;
  uint64_t v18 = 0;
  long long v13 = _NSConcreteStackBlock;
  uint64_t v14 = 1107296256;
  long long v15 = sub_10000946C;
  uint64_t v16 = &unk_10001D7A8;
  id v11 = _Block_copy(&v13);
  swift_release();
  id v12 = [v8 actionWithTitle:v10 style:1 handler:v11];
  _Block_release(v11);

  [v5 addAction:v12];
  [a2 presentViewController:v5 animated:1 completion:0];
}

uint64_t sub_100013554(uint64_t a1, void *a2)
{
  NSString v10 = &_swiftEmptyDictionarySingleton;
  uint64_t v3 = swift_bridgeObjectRetain();
  sub_10001370C(v3, (uint64_t *)&v10);
  swift_bridgeObjectRelease();
  swift_retain();
  sub_100011680();
  sub_10000E550();
  swift_release();
  id v4 = [a2 navigationController];
  if (v4)
  {
    id v5 = v4;
    id v6 = objc_allocWithZone((Class)type metadata accessor for MicrophoneTestCompletedViewController());
    uint64_t v7 = swift_bridgeObjectRetain();
    uint64_t v8 = sub_100008118(v7);
    [v5 pushViewController:v8 animated:1];
  }

  return swift_bridgeObjectRelease();
}

uint64_t sub_100013654(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)a1;
  uint64_t v4 = *(void *)(a1 + 8);
  if (*(unsigned char *)(a1 + 16)) {
    uint64_t v5 = 1936941392;
  }
  else {
    uint64_t v5 = 1818845510;
  }
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *a2;
  *a2 = 0x8000000000000000;
  sub_100014264(v5, 0xE400000000000000, v3, v4, isUniquelyReferenced_nonNull_native);
  *a2 = v8;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_10001370C(uint64_t a1, uint64_t *a2)
{
  uint64_t v5 = a1 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a1 + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v11 = 0;
  if (!v8) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    long long v17 = (void *)(*(void *)(a1 + 48) + 16 * i);
    uint64_t v18 = v17[1];
    char v19 = *(unsigned char *)(*(void *)(a1 + 56) + i);
    v21[0] = *v17;
    v21[1] = v18;
    char v22 = v19;
    swift_bridgeObjectRetain();
    sub_100013654((uint64_t)v21, a2);
    if (v2)
    {
      swift_release();
      return swift_bridgeObjectRelease();
    }
    uint64_t result = swift_bridgeObjectRelease();
    if (v8) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v11++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v11 >= v9) {
      return swift_release();
    }
    unint64_t v15 = *(void *)(v5 + 8 * v11);
    if (!v15)
    {
      int64_t v16 = v11 + 1;
      if (v11 + 1 >= v9) {
        return swift_release();
      }
      unint64_t v15 = *(void *)(v5 + 8 * v16);
      if (v15) {
        goto LABEL_14;
      }
      int64_t v16 = v11 + 2;
      if (v11 + 2 >= v9) {
        return swift_release();
      }
      unint64_t v15 = *(void *)(v5 + 8 * v16);
      if (v15) {
        goto LABEL_14;
      }
      int64_t v16 = v11 + 3;
      if (v11 + 3 >= v9) {
        return swift_release();
      }
      unint64_t v15 = *(void *)(v5 + 8 * v16);
      if (v15)
      {
LABEL_14:
        int64_t v11 = v16;
        goto LABEL_15;
      }
      int64_t v20 = v11 + 4;
      if (v11 + 4 >= v9) {
        return swift_release();
      }
      unint64_t v15 = *(void *)(v5 + 8 * v20);
      v11 += 4;
      if (!v15) {
        break;
      }
    }
LABEL_15:
    unint64_t v8 = (v15 - 1) & v15;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v9) {
      return swift_release();
    }
    unint64_t v15 = *(void *)(v5 + 8 * v11);
    ++v20;
    if (v15) {
      goto LABEL_15;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_100013968()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MicrophoneTestEvaluatingViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for MicrophoneTestEvaluatingViewController()
{
  return self;
}

uint64_t sub_100013A0C()
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  if (*(void *)(v0 + 200)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 216, 7);
}

uint64_t sub_100013AC4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000064CC(&qword_100022088);
  char v37 = a2;
  uint64_t v6 = sub_1000165E0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  id v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v35) {
      break;
    }
    char v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
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
    char v32 = *(unsigned char *)(*(void *)(v5 + 56) + v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_100016640();
    sub_100016420();
    uint64_t result = sub_100016660();
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
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(unsigned char *)(*(void *)(v7 + 56) + v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  char v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *char v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_100013DD0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000064CC(&qword_100022080);
  char v42 = a2;
  uint64_t v6 = sub_1000165E0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  id v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    int64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    char v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    int64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_100016640();
    sub_100016420();
    uint64_t result = sub_100016660();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    unint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *unint64_t v19 = v34;
    v19[1] = v33;
    unint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    *unint64_t v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  int64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1000140F8(char a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_100015C34(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_1000143EC();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      *(unsigned char *)(v18[7] + v12) = a1 & 1;
      return result;
    }
    goto LABEL_11;
  }
  sub_100013AC4(result, a4 & 1);
  uint64_t result = sub_100015C34(a2, a3);
  if ((v16 & 1) != (v19 & 1))
  {
LABEL_17:
    uint64_t result = sub_100016630();
    __break(1u);
    return result;
  }
  unint64_t v12 = result;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v20 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v20 = a2;
  v20[1] = a3;
  *(unsigned char *)(v18[7] + v12) = a1 & 1;
  uint64_t v21 = v18[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v23;

  return swift_bridgeObjectRetain();
}

uint64_t sub_100014264(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_100015C34(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_100014598();
LABEL_7:
    unint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_bridgeObjectRelease();
      *uint64_t v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_100013DD0(v17, a5 & 1);
  unint64_t v23 = sub_100015C34(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_100016630();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  unint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  unint64_t v25 = (uint64_t *)(v20[6] + 16 * v14);
  *unint64_t v25 = a3;
  v25[1] = a4;
  int64_t v26 = (void *)(v20[7] + 16 * v14);
  *int64_t v26 = a1;
  v26[1] = a2;
  uint64_t v27 = v20[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v29;

  return swift_bridgeObjectRetain();
}

void *sub_1000143EC()
{
  id v1 = v0;
  sub_1000064CC(&qword_100022088);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1000165D0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *id v1 = v4;
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    BOOL v16 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    LOBYTE(v16) = *(unsigned char *)(*(void *)(v2 + 56) + v15);
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + 16 * v15);
    *uint64_t v19 = v18;
    v19[1] = v17;
    *(unsigned char *)(*(void *)(v4 + 56) + v15) = (_BYTE)v16;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_100014598()
{
  id v1 = v0;
  sub_1000064CC(&qword_100022080);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1000165D0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *id v1 = v4;
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    int64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    unint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v23 = v19;
    v23[1] = v18;
    char v24 = (void *)(*(void *)(v4 + 56) + v16);
    *char v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_100014754()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_100014794(uint64_t a1)
{
  sub_100012E1C(a1, *(char **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10001479C()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000147D4(uint64_t a1)
{
  sub_100012EE4(a1, *(void **)(v1 + 16));
}

void sub_1000147DC(uint64_t a1)
{
  sub_100013288(a1, *(void **)(v1 + 16));
}

uint64_t sub_1000147E4(uint64_t a1)
{
  return sub_100013554(a1, *(void **)(v1 + 16));
}

uint64_t sub_1000147EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000147FC()
{
  return swift_release();
}

void sub_100014804(uint64_t a1)
{
  sub_1000131E0(a1, *(void **)(v1 + 16));
}

uint64_t sub_100014830(uint64_t a1, void *a2)
{
  if (qword_1000216F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v4 = off_100022090;
  if (!*((void *)off_100022090 + 2)) {
    goto LABEL_10;
  }
  swift_bridgeObjectRetain();
  unint64_t v5 = sub_100015C34(a1, (uint64_t)a2);
  if ((v6 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_10:
    swift_endAccess();
    goto LABEL_11;
  }
  unint64_t v7 = (uint64_t *)(v4[7] + 16 * v5);
  uint64_t v9 = *v7;
  unint64_t v8 = v7[1];
  swift_endAccess();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0) {
    uint64_t v10 = v9 & 0xFFFFFFFFFFFFLL;
  }
  if (!v10)
  {
    swift_bridgeObjectRelease();
LABEL_11:
    uint64_t v11 = (objc_class *)[self mainBundle];
    v14._countAndFlagsBits = 0xE000000000000000;
    v15._countAndFlagsBits = a1;
    v15._object = a2;
    v16.value._countAndFlagsBits = 0;
    v16.value._object = 0;
    v12.super.Class isa = v11;
    v17._countAndFlagsBits = 0;
    v17._object = (void *)0xE000000000000000;
    uint64_t v9 = sub_100015F60(v15, v16, v12, v17, v14);
  }
  return v9;
}

unint64_t sub_100014994(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000064CC(&qword_100022080);
  uint64_t v2 = (void *)sub_1000165F0();
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
    unint64_t result = sub_100015C34(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    NSBundle v12 = (void *)(v2[7] + 16 * result);
    *NSBundle v12 = v8;
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

void *sub_100014AB8()
{
  unint64_t result = (void *)sub_100014994((uint64_t)&_swiftEmptyArrayStorage);
  off_100022090 = result;
  return result;
}

uint64_t sub_100014AE0()
{
  type metadata accessor for MicrophoneTestViewControllerManager();
  uint64_t v0 = swift_allocObject();
  uint64_t result = swift_unknownObjectWeakInit();
  qword_1000225D8 = v0;
  return result;
}

uint64_t sub_100014B24()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for MicrophoneTestViewControllerManager()
{
  return self;
}

void sub_100014B80()
{
  uint64_t v1 = v0;
  v12.receiver = v0;
  v12.super_class = (Class)type metadata accessor for MicrophoneTestViewController();
  [super viewDidLoad];
  id v2 = [v0 view];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = [self systemBackgroundColor];
    [v3 setBackgroundColor:v4];

    if (qword_1000216F8 != -1) {
      swift_once();
    }
    swift_unknownObjectWeakAssign();
    id v5 = objc_allocWithZone((Class)type metadata accessor for MicrophoneTestStartingViewController());
    uint64_t v6 = swift_retain();
    id v7 = sub_10000D2B0(v6);
    id v8 = [objc_allocWithZone((Class)UINavigationController) initWithRootViewController:v7];
    [v8 setModalPresentationStyle:0];
    [v1 presentViewController:v8 animated:1 completion:0];
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      char v10 = (void *)Strong;
      id v11 = *(id *)(Strong + OBJC_IVAR___MicrophoneTestViewController_headphonesDetector);

      [v11 stop];
      id v7 = v8;
      id v8 = v11;
    }
  }
  else
  {
    __break(1u);
  }
}

id sub_100014E08()
{
  id v1 = [self defaultCenter];
  sub_100016400();
  NSString v2 = sub_1000163F0();
  swift_bridgeObjectRelease();
  id v3 = [self mainQueue];
  uint64_t v4 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v8[4] = sub_100015C14;
  v8[5] = v4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_10001500C;
  v8[3] = &unk_10001D870;
  id v5 = _Block_copy(v8);
  swift_release();
  id v6 = [v1 addObserverForName:v2 object:0 queue:v3 usingBlock:v5];
  _Block_release(v5);
  swift_unknownObjectRelease();

  return [*(id *)(v0 + OBJC_IVAR___MicrophoneTestViewController_headphonesDetector) start];
}

uint64_t sub_100014F98()
{
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    id v1 = (void *)result;
    unint64_t v2 = sub_100014994((uint64_t)_swiftEmptyArrayStorage);
    sub_1000156FC(4, v2);

    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10001500C(uint64_t a1)
{
  uint64_t v2 = sub_100015F50();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = *(void (**)(char *))(a1 + 32);
  sub_100015F40();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

id sub_100015170(uint64_t a1, uint64_t a2)
{
  os_log_type_t v4 = sub_1000164D0();
  if (qword_1000216E8 != -1) {
    swift_once();
  }
  id v5 = qword_1000225B8;
  if (os_log_type_enabled((os_log_t)qword_1000225B8, v4))
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v6 = 134217984;
    sub_100016570();
    _os_log_impl((void *)&_mh_execute_header, v5, v4, "Finished test with status %ld", v6, 0xCu);
    swift_slowDealloc();
  }
  id v7 = [v2 result];
  Class isa = sub_100016490().super.super.isa;
  [v7 setStatusCode:isa];

  id v9 = [v2 result];
  sub_10001533C(a2);
  Class v10 = sub_1000163D0().super.isa;
  swift_bridgeObjectRelease();
  [v9 setData:v10];

  return [v2 setFinished:1];
}

uint64_t sub_10001533C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_1000064CC((uint64_t *)&unk_1000221A0);
    uint64_t v2 = (void *)sub_1000165F0();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v27 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
  id v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v27 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v27 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v27 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    Swift::String v17 = (void *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v18 = v17[1];
    *(void *)&v36[0] = *v17;
    *((void *)&v36[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    swift_dynamicCast();
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_100015BC4(&v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_100015BC4(v35, v36);
    sub_100015BC4(v36, &v32);
    uint64_t result = sub_1000165A0(v2[5]);
    uint64_t v19 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)&v6[8 * (v20 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v20) & ~*(void *)&v6[8 * (v20 >> 6)])) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)&v6[8 * v21];
      }
      while (v25 == -1);
      unint64_t v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(void *)(v10 + 32) = v30;
    uint64_t result = (uint64_t)sub_100015BC4(&v32, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_100015BD4();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v27 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

id sub_1000156FC(uint64_t a1, uint64_t a2)
{
  os_log_type_t v4 = sub_1000164D0();
  if (qword_1000216E8 != -1) {
    swift_once();
  }
  unint64_t v5 = qword_1000225B8;
  if (os_log_type_enabled((os_log_t)qword_1000225B8, v4))
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v6 = 134217984;
    sub_100016570();
    _os_log_impl((void *)&_mh_execute_header, v5, v4, "Finished test with status %ld", v6, 0xCu);
    swift_slowDealloc();
  }
  id v7 = [v2 result];
  Class isa = sub_100016490().super.super.isa;
  [v7 setStatusCode:isa];

  id v9 = [v2 result];
  sub_10001533C(a2);
  Class v10 = sub_1000163D0().super.isa;
  swift_bridgeObjectRelease();
  [v9 setData:v10];

  return [v2 setFinished:1];
}

id sub_1000158E4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = OBJC_IVAR___MicrophoneTestViewController_audioManager;
  type metadata accessor for AudioManager();
  swift_allocObject();
  id v7 = v3;
  *(void *)&v3[v6] = sub_10000DE88();
  uint64_t v8 = OBJC_IVAR___MicrophoneTestViewController_headphonesDetector;
  *(void *)&v7[v8] = [objc_allocWithZone((Class)DAHeadphonesDetector) init];

  if (a2)
  {
    NSString v9 = sub_1000163F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v9 = 0;
  }
  v12.receiver = v7;
  v12.super_class = (Class)type metadata accessor for MicrophoneTestViewController();
  id v10 = [super initWithNibName:v9 bundle:a3];

  return v10;
}

id sub_100015A3C(void *a1)
{
  uint64_t v3 = OBJC_IVAR___MicrophoneTestViewController_audioManager;
  type metadata accessor for AudioManager();
  swift_allocObject();
  os_log_type_t v4 = v1;
  *(void *)&v1[v3] = sub_10000DE88();
  uint64_t v5 = OBJC_IVAR___MicrophoneTestViewController_headphonesDetector;
  *(void *)&v4[v5] = [objc_allocWithZone((Class)DAHeadphonesDetector) init];

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for MicrophoneTestViewController();
  [super initWithCoder:a1];

  return v6;
}

id sub_100015B20()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MicrophoneTestViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for MicrophoneTestViewController()
{
  return self;
}

_OWORD *sub_100015BC4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100015BD4()
{
  return swift_release();
}

uint64_t sub_100015BDC()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100015C14()
{
  return sub_100014F98();
}

uint64_t sub_100015C1C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100015C2C()
{
  return swift_release();
}

unint64_t sub_100015C34(uint64_t a1, uint64_t a2)
{
  sub_100016640();
  sub_100016420();
  Swift::Int v4 = sub_100016660();

  return sub_100015CAC(a1, a2, v4);
}

unint64_t sub_100015CAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100016620() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_100016620() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_100015D90(uint64_t a1)
{
  if (a1 && (type metadata accessor for MicrophoneTestInputs(), (uint64_t v1 = swift_dynamicCastClass()) != 0))
  {
    uint64_t v2 = v1;
    uint64_t v3 = qword_1000216E0;
    swift_unknownObjectRetain();
    if (v3 != -1) {
      swift_once();
    }
    double v4 = *(double *)(v2 + OBJC_IVAR___MicrophoneTestInputs_audioRecordingDuration);
    if (v4 > 10.0) {
      double v4 = 10.0;
    }
    *(double *)(qword_1000225B0 + 16) = v4;
    uint64_t v5 = OBJC_IVAR___MicrophoneTestInputs_stringProperties;
    uint64_t v6 = *(void *)(v2 + OBJC_IVAR___MicrophoneTestInputs_stringProperties);
    if (!v6)
    {
LABEL_19:
      __break(1u);
      return sub_100015F40();
    }
    if (*(void *)(v6 + 16))
    {
      if (qword_1000216F0 == -1 || (swift_once(), (uint64_t v6 = *(void *)(v2 + v5)) != 0))
      {
        swift_beginAccess();
        off_100022090 = (_UNKNOWN *)v6;
        swift_bridgeObjectRetain();
        swift_unknownObjectRelease();
        return swift_bridgeObjectRelease();
      }
      __break(1u);
      goto LABEL_19;
    }
    return swift_unknownObjectRelease();
  }
  else
  {
    unint64_t v8 = sub_100014994((uint64_t)_swiftEmptyArrayStorage);
    sub_100015170(-912, v8);
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100015F40()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100015F50()
{
  return type metadata accessor for Notification();
}

uint64_t sub_100015F60(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_100015F70()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100015F80()
{
  return URL.absoluteString.getter();
}

uint64_t sub_100015F90()
{
  return URL.init(fileURLWithPath:)();
}

void sub_100015FA0(NSURL *retstr@<X8>)
{
}

uint64_t sub_100015FB0()
{
  return URL.appendingPathComponent(_:isDirectory:)();
}

uint64_t sub_100015FC0()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_100015FD0()
{
  return URL.appendingPathExtension(_:)();
}

uint64_t sub_100015FE0()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100015FF0()
{
  return URL.path.getter();
}

uint64_t sub_100016000()
{
  return type metadata accessor for URL();
}

uint64_t sub_100016010()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t sub_100016020()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_100016030()
{
  return static ObservableObject.environmentStore.getter();
}

uint64_t sub_100016040()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_100016050()
{
  return Published.init(initialValue:)();
}

uint64_t sub_100016060()
{
  return static Published.subscript.getter();
}

uint64_t sub_100016070()
{
  return static Published.subscript.setter();
}

uint64_t sub_100016080()
{
  return type metadata accessor for Published();
}

uint64_t sub_100016090()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_1000160A0()
{
  return ScrollView.init(_:showsIndicators:content:)();
}

uint64_t sub_1000160B0()
{
  return ProgressView.init<A>(value:total:label:)();
}

uint64_t sub_1000160C0()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_1000160D0()
{
  return withAnimation<A>(_:_:)();
}

uint64_t sub_1000160E0()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_1000160F0()
{
  return EnvironmentObject.error()();
}

uint64_t sub_100016100()
{
  return EnvironmentObject.init()();
}

uint64_t sub_100016110()
{
  return EnvironmentValues.truncationMode.getter();
}

uint64_t sub_100016120()
{
  return EnvironmentValues.truncationMode.setter();
}

uint64_t sub_100016130()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_100016140()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_100016150()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t sub_100016160()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t sub_100016170()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_100016180()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_100016190()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_1000161A0()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_1000161B0()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_1000161C0()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_1000161D0()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_1000161E0()
{
  return static Axis.Set.vertical.getter();
}

uint64_t sub_1000161F0()
{
  return static Edge.Set.horizontal.getter();
}

uint64_t sub_100016200()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_100016210()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_100016220()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_100016230()
{
  return type metadata accessor for Text.TruncationMode();
}

uint64_t sub_100016240()
{
  return Text.init<A>(_:)();
}

uint64_t sub_100016250()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_100016260()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_100016270()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100016280()
{
  return View.onChange<A>(of:initial:_:)();
}

uint64_t sub_100016290()
{
  return Color.init(uiColor:)();
}

uint64_t sub_1000162A0()
{
  return static Color.red.getter();
}

uint64_t sub_1000162B0()
{
  return static Color.blue.getter();
}

uint64_t sub_1000162C0()
{
  return static Color.black.getter();
}

uint64_t sub_1000162D0()
{
  return static Color.green.getter();
}

uint64_t sub_1000162E0()
{
  return Image.init(systemName:)();
}

uint64_t sub_1000162F0()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_100016300()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_100016310()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_100016320()
{
  return State.wrappedValue.getter();
}

uint64_t sub_100016330()
{
  return State.wrappedValue.setter();
}

uint64_t sub_100016340()
{
  return Button.init(action:label:)();
}

uint64_t sub_100016350()
{
  return Binding.wrappedValue.getter();
}

uint64_t sub_100016360()
{
  return Binding.init(get:set:)();
}

uint64_t sub_100016370()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_100016380()
{
  return static Alignment.center.getter();
}

uint64_t sub_100016390()
{
  return static Animation.default.getter();
}

uint64_t sub_1000163A0()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_1000163B0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_1000163C0()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary sub_1000163D0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1000163E0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_1000163F0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100016400()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100016410()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100016420()
{
  return String.hash(into:)();
}

void sub_100016430(Swift::String a1)
{
}

NSArray sub_100016440()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100016450()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100016460()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_100016470()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100016480()
{
  return type metadata accessor for MainActor();
}

NSNumber sub_100016490()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_1000164A0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_1000164B0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000164C0()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_1000164D0()
{
  return static os_log_type_t.default.getter();
}

UIBarButtonItem sub_1000164E0(UIBarButtonSystemItem systemItem, UIAction_optional primaryAction, UIMenu_optional menu)
{
  return UIBarButtonItem.init(systemItem:primaryAction:menu:)(systemItem, primaryAction, menu);
}

uint64_t sub_1000164F0()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_100016500()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_100016510()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_100016520()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_100016530()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_100016540()
{
  return UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
}

uint64_t sub_100016550()
{
  return static OS_os_log.default.getter();
}

uint64_t sub_100016560()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_100016570()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100016580()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t sub_100016590()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

Swift::Int sub_1000165A0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_1000165C0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000165D0()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_1000165E0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_1000165F0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100016600()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100016610(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100016620()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100016630()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100016640()
{
  return Hasher.init(_seed:)();
}

void sub_100016650(Swift::UInt a1)
{
}

Swift::Int sub_100016660()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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
  return [super a2];
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:selector:name:object:];
}

id objc_msgSend_audioRouteChanged(void *a1, const char *a2, ...)
{
  return _[a1 audioRouteChanged];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentRoute(void *a1, const char *a2, ...)
{
  return _[a1 currentRoute];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_outputs(void *a1, const char *a2, ...)
{
  return _[a1 outputs];
}

id objc_msgSend_portType(void *a1, const char *a2, ...)
{
  return _[a1 portType];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:];
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:name:object:];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}