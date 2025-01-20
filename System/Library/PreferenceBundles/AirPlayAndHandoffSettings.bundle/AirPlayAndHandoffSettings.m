uint64_t sub_2D7C@<X0>(void *a1@<X0>, char a2@<W1>, char *a3@<X8>)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  char *v26;
  void *v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, char *, uint64_t);
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t);
  uint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;

  v48 = a3;
  v4 = a2 & 1;
  v5 = sub_5F88(&qword_1C230);
  v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_5F88(&qword_1C238);
  v10 = __chkstk_darwin(v9 - 8);
  v47 = (uint64_t)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v44 = (char *)&v41 - v12;
  v13 = sub_5F88(&qword_1C240);
  v45 = *(void *)(v13 - 8);
  v46 = v13;
  v14 = __chkstk_darwin(v13);
  v43 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v42 = (char *)&v41 - v16;
  v49 = swift_allocBox();
  v18 = v17;
  sub_5E00(a1, v4);
  sub_5830(a1, v4);
  sub_5E1C(a1, v4);
  sub_138D0();
  sub_6AD8((unint64_t *)&qword_1C248, (void (*)(uint64_t))&type metadata accessor for AirPlayAndHandoffSettingsState);
  v41 = v18;
  sub_13D80();
  sub_13A90();
  if (qword_1C228 != -1) {
    swift_once();
  }
  v19 = (id)qword_1D158;
  v54 = sub_13B80();
  v55 = v20;
  v56 = v21 & 1;
  v57 = v22;
  v50 = sub_48B0(a1, v4);
  v51 = v23;
  v52 = v24 & 1;
  v53 = v25;
  sub_5F88(&qword_1C250);
  sub_6A4C(&qword_1C258, &qword_1C250);
  v26 = v42;
  sub_13D30();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v41, v5);
  sub_13D60();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v27 = (void *)v54;
  v28 = sub_13740();

  if (v28)
  {
    sub_5F88(&qword_1C270);
    sub_6A4C(&qword_1C278, &qword_1C270);
    v29 = (uint64_t)v44;
    sub_13D40();
    v30 = sub_5F88(&qword_1C260);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v29, 0, 1, v30);
  }
  else
  {
    v31 = sub_5F88(&qword_1C260);
    v29 = (uint64_t)v44;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v44, 1, 1, v31);
  }
  v33 = v45;
  v32 = v46;
  v34 = *(void (**)(char *, char *, uint64_t))(v45 + 16);
  v35 = v43;
  v34(v43, v26, v46);
  v36 = v47;
  sub_6B20(v29, v47, &qword_1C238);
  v37 = v48;
  v34(v48, v35, v32);
  v38 = sub_5F88(&qword_1C268);
  sub_6B20(v36, (uint64_t)&v37[*(int *)(v38 + 48)], &qword_1C238);
  sub_620C(v29, &qword_1C238);
  v39 = *(void (**)(char *, uint64_t))(v33 + 8);
  v39(v26, v32);
  sub_620C(v36, &qword_1C238);
  v39(v35, v32);
  return swift_release();
}

uint64_t sub_334C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  v47 = a2;
  uint64_t v38 = sub_5F88(&qword_1C2F8);
  __chkstk_darwin(v38);
  v37[1] = (char *)v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_5F88(&qword_1C300);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v46 = (uint64_t)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v45 = (char *)v37 - v7;
  uint64_t v8 = sub_5F88(&qword_1C230);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  v12 = (char *)v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)v37 - v13;
  uint64_t v15 = sub_5F88(&qword_1C308);
  uint64_t v43 = *(void *)(v15 - 8);
  uint64_t v44 = v15;
  uint64_t v16 = __chkstk_darwin(v15);
  v42 = (char *)v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v19 = (char *)v37 - v18;
  uint64_t v39 = a1;
  uint64_t v20 = swift_projectBox();
  v40 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  uint64_t v41 = v20;
  v40(v12, v20, v8);
  sub_13D70();
  v21 = *(void (**)(char *, uint64_t))(v9 + 8);
  v21(v12, v8);
  swift_getKeyPath();
  sub_13D90();
  swift_release();
  v21(v14, v8);
  uint64_t v48 = v51;
  uint64_t v49 = v52;
  char v50 = v53;
  sub_13DB0();
  sub_5F88(&qword_1C310);
  sub_13D00();
  swift_release();
  swift_release();
  v22 = v19;
  swift_release();
  sub_13CE0();
  v40(v14, v41, v8);
  sub_13D60();
  v21(v14, v8);
  v23 = v54;
  LOBYTE(v8) = sub_13740();

  if (v8)
  {
    sub_5F88(&qword_1C328);
    sub_6278();
    sub_13B50();
    sub_5F88(&qword_1C360);
    sub_6420();
    sub_6A4C(&qword_1C370, &qword_1C2F8);
    uint64_t v24 = (uint64_t)v45;
    sub_139B0();
    uint64_t v25 = sub_5F88(&qword_1C318);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v24, 0, 1, v25);
  }
  else
  {
    uint64_t v26 = sub_5F88(&qword_1C318);
    uint64_t v24 = (uint64_t)v45;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v45, 1, 1, v26);
  }
  v28 = v42;
  uint64_t v27 = v43;
  v29 = *(void (**)(char *, char *, uint64_t))(v43 + 16);
  v30 = v19;
  uint64_t v31 = v44;
  v29(v42, v30, v44);
  uint64_t v32 = v46;
  sub_6B20(v24, v46, &qword_1C300);
  v33 = v47;
  v29(v47, v28, v31);
  uint64_t v34 = sub_5F88(&qword_1C320);
  sub_6B20(v32, (uint64_t)&v33[*(int *)(v34 + 48)], &qword_1C300);
  sub_620C(v24, &qword_1C300);
  v35 = *(void (**)(char *, uint64_t))(v27 + 8);
  v35(v22, v31);
  sub_620C(v32, &qword_1C300);
  return ((uint64_t (*)(char *, uint64_t))v35)(v28, v31);
}

uint64_t sub_3900@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_13740();
  *a1 = result & 1;
  return result;
}

uint64_t sub_3930()
{
  return sub_13750();
}

uint64_t sub_3958@<X0>(uint64_t a1@<X8>)
{
  return sub_5728(a1);
}

uint64_t sub_397C()
{
  sub_425C((uint64_t)v1);
  sub_5F88(&qword_1C378);
  sub_5F88(&qword_1C358);
  sub_5FD4(&qword_1C338);
  sub_5FD4(&qword_1C340);
  sub_13A30();
  sub_6A4C(&qword_1C348, &qword_1C340);
  swift_getOpaqueTypeConformance2();
  swift_getOpaqueTypeConformance2();
  sub_63B4();
  return sub_13D50();
}

uint64_t sub_3ACC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v38 = a1;
  uint64_t v1 = sub_13A30();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v36 = v1;
  uint64_t v37 = v2;
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_5F88(&qword_1C230);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)v29 - v10;
  uint64_t v12 = sub_5F88(&qword_1C340);
  uint64_t v33 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  v14 = (char *)v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_5F88(&qword_1C338);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v34 = v15;
  uint64_t v35 = v16;
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_13A90();
  uint64_t v31 = v20;
  uint64_t v32 = v19;
  v29[3] = v21;
  uint64_t v30 = v22;
  uint64_t v23 = swift_projectBox();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v23, v5);
  sub_13D70();
  uint64_t v24 = *(void (**)(char *, uint64_t))(v6 + 8);
  v24(v9, v5);
  swift_getKeyPath();
  sub_13D90();
  swift_release();
  v24(v11, v5);
  long long v42 = v39;
  uint64_t v43 = v40;
  type metadata accessor for APRKAdvertisingAccessMode();
  sub_5F88(&qword_1C380);
  sub_6AD8(&qword_1C388, (void (*)(uint64_t))type metadata accessor for APRKAdvertisingAccessMode);
  sub_6A4C(&qword_1C390, &qword_1C380);
  sub_13CC0();
  sub_13A20();
  uint64_t v25 = sub_6A4C(&qword_1C348, &qword_1C340);
  uint64_t v26 = v36;
  sub_13BF0();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v4, v26);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v14, v12);
  *(void *)&long long v39 = v12;
  *((void *)&v39 + 1) = v26;
  uint64_t v40 = v25;
  uint64_t v41 = &protocol witness table for InlinePickerStyle;
  swift_getOpaqueTypeConformance2();
  uint64_t v27 = v34;
  sub_13C00();
  return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v18, v27);
}

uint64_t sub_3F84@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_13760();
  *a1 = result;
  return result;
}

uint64_t sub_3FB0()
{
  return sub_13770();
}

uint64_t sub_3FD8()
{
  uint64_t v0 = sub_5F88(&qword_1C398);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v9 - v5;
  uint64_t v10 = 3;
  type metadata accessor for APRKAdvertisingAccessMode();
  sub_6AD8(&qword_1C388, (void (*)(uint64_t))type metadata accessor for APRKAdvertisingAccessMode);
  sub_13950();
  uint64_t v10 = 0;
  sub_13950();
  sub_6A4C(&qword_1C3A0, &qword_1C398);
  sub_13990();
  sub_5F88(&qword_1C3A8);
  sub_13990();
  uint64_t v7 = *(void (**)(char *, uint64_t))(v1 + 8);
  v7(v4, v0);
  return ((uint64_t (*)(char *, uint64_t))v7)(v6, v0);
}

uint64_t sub_4214@<X0>(uint64_t a1@<X8>)
{
  return sub_5728(a1);
}

uint64_t sub_423C@<X0>(uint64_t a1@<X8>)
{
  return sub_5728(a1);
}

double sub_425C@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_5F88(&qword_1C230);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = swift_projectBox();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  sub_13D60();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v7 = (void *)v26;
  uint64_t v8 = sub_13760();

  if (v8)
  {
    sub_13A90();
    if (qword_1C228 != -1) {
      swift_once();
    }
    id v9 = (id)qword_1D158;
    uint64_t v21 = sub_13B80();
    uint64_t v22 = v11;
    uint64_t v23 = v10 & 1;
    uint64_t v24 = v12;
    char v25 = 1;
  }
  else
  {
    sub_13A90();
    if (qword_1C228 != -1) {
      swift_once();
    }
    id v13 = (id)qword_1D158;
    uint64_t v21 = sub_13B80();
    uint64_t v22 = v14;
    uint64_t v23 = v15 & 1;
    uint64_t v24 = v16;
    char v25 = 0;
  }
  sub_13AE0();
  double result = *(double *)&v26;
  long long v18 = v27;
  char v19 = v28;
  *(_OWORD *)a1 = v26;
  *(_OWORD *)(a1 + 16) = v18;
  *(unsigned char *)(a1 + 32) = v19;
  return result;
}

uint64_t sub_4528()
{
  sub_5F88(&qword_1C358);
  sub_63B4();

  return sub_139A0();
}

double sub_45C4@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_5F88(&qword_1C230);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = swift_projectBox();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  sub_13D60();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v7 = (void *)v26;
  uint64_t v8 = sub_13760();

  if (v8)
  {
    sub_13A90();
    if (qword_1C228 != -1) {
      swift_once();
    }
    id v9 = (id)qword_1D158;
    uint64_t v21 = sub_13B80();
    uint64_t v22 = v11;
    uint64_t v23 = v10 & 1;
    uint64_t v24 = v12;
    char v25 = 1;
  }
  else
  {
    sub_13A90();
    if (qword_1C228 != -1) {
      swift_once();
    }
    id v13 = (id)qword_1D158;
    uint64_t v21 = sub_13B80();
    uint64_t v22 = v14;
    uint64_t v23 = v15 & 1;
    uint64_t v24 = v16;
    char v25 = 0;
  }
  sub_13AE0();
  double result = *(double *)&v26;
  long long v18 = v27;
  char v19 = v28;
  *(_OWORD *)a1 = v26;
  *(_OWORD *)(a1 + 16) = v18;
  *(unsigned char *)(a1 + 32) = v19;
  return result;
}

uint64_t sub_488C@<X0>(uint64_t a1@<X8>)
{
  return sub_5728(a1);
}

uint64_t sub_48B0(void *a1, char a2)
{
  char v3 = a2 & 1;
  sub_5E00(a1, a2 & 1);
  id v4 = sub_5830(a1, v3);
  sub_5E1C(a1, v3);
  char v5 = sub_13740();

  if ((v5 & 1) == 0) {
    goto LABEL_4;
  }
  sub_5E00(a1, v3);
  id v6 = sub_5830(a1, v3);
  sub_5E1C(a1, v3);
  uint64_t v7 = sub_13760();

  if (!v7) {
    goto LABEL_4;
  }
  sub_5E00(a1, v3);
  id v8 = sub_5830(a1, v3);
  sub_5E1C(a1, v3);
  uint64_t v9 = sub_13760();

  if (v9 != 3)
  {
    sub_13A90();
  }
  else
  {
LABEL_4:
    sub_13A90();
    if (qword_1C228 != -1) {
      swift_once();
    }
    id v10 = (id)qword_1D158;
  }
  return sub_13B80();
}

uint64_t sub_4AA0@<X0>(char *a1@<X8>)
{
  v29 = a1;
  uint64_t v1 = sub_5F88(&qword_1C230);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  id v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_5F88(&qword_1C280);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v28 = (uint64_t)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v27 - v8;
  uint64_t v10 = sub_5F88(&qword_1C288);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v27 - v15;
  sub_5F88(&qword_1C290);
  sub_602C();
  sub_139A0();
  uint64_t v17 = swift_projectBox();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v17, v1);
  sub_13D60();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  long long v18 = v30;
  LOBYTE(v1) = sub_137E0();

  if (v1)
  {
    swift_retain();
    sub_13CB0();
    uint64_t v19 = sub_5F88(&qword_1C2D0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v9, 0, 1, v19);
  }
  else
  {
    uint64_t v20 = sub_5F88(&qword_1C2D0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v9, 1, 1, v20);
  }
  uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v21(v14, v16, v10);
  uint64_t v22 = v28;
  sub_6B20((uint64_t)v9, v28, &qword_1C280);
  uint64_t v23 = v29;
  v21(v29, v14, v10);
  uint64_t v24 = sub_5F88(&qword_1C2D8);
  sub_6B20(v22, (uint64_t)&v23[*(int *)(v24 + 48)], &qword_1C280);
  sub_620C((uint64_t)v9, &qword_1C280);
  char v25 = *(void (**)(char *, uint64_t))(v11 + 8);
  v25(v16, v10);
  sub_620C(v22, &qword_1C280);
  return ((uint64_t (*)(char *, uint64_t))v25)(v14, v10);
}

uint64_t sub_4EBC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v59 = a1;
  uint64_t v1 = sub_5F88(&qword_1C2E0);
  uint64_t v57 = *(void *)(v1 - 8);
  uint64_t v58 = v1;
  __chkstk_darwin(v1);
  char v53 = (char *)&v42 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_5F88(&qword_1C2E8) - 8;
  uint64_t v3 = __chkstk_darwin(v56);
  v54 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v55 = (uint64_t)&v42 - v5;
  uint64_t v6 = sub_5F88(&qword_1C230);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v42 - v11;
  uint64_t v49 = sub_5F88(&qword_1C2B8);
  uint64_t v47 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v44 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_5F88(&qword_1C2A0);
  __chkstk_darwin(v46);
  uint64_t v15 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_5F88(&qword_1C2F0);
  uint64_t v51 = *(void *)(v16 - 8);
  uint64_t v52 = v16;
  __chkstk_darwin(v16);
  v45 = (char *)&v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_5F88(&qword_1C290) - 8;
  __chkstk_darwin(v50);
  uint64_t v48 = (char *)&v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = swift_projectBox();
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v43 = v19;
  v20(v10, v19, v6);
  sub_13D70();
  uint64_t v21 = *(void (**)(char *, uint64_t))(v7 + 8);
  v21(v10, v6);
  swift_getKeyPath();
  sub_13D90();
  swift_release();
  v21(v12, v6);
  uint64_t v42 = v7 + 8;
  uint64_t v22 = v44;
  sub_13CE0();
  v20(v12, v19, v6);
  sub_13D60();
  v21(v12, v6);
  uint64_t v23 = v60;
  LOBYTE(v7) = sub_138A0();

  double v24 = 1.0;
  if (v7) {
    double v25 = 0.0;
  }
  else {
    double v25 = 1.0;
  }
  uint64_t v26 = v47;
  uint64_t v27 = v49;
  (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v15, v22, v49);
  *(double *)&v15[*(int *)(v46 + 36)] = v25;
  (*(void (**)(char *, uint64_t))(v26 + 8))(v22, v27);
  sub_6100();
  uint64_t v28 = v45;
  sub_13C00();
  sub_620C((uint64_t)v15, &qword_1C2A0);
  uint64_t v49 = sub_13DA0();
  uint64_t v30 = v29;
  uint64_t v31 = v53;
  sub_13960();
  v20(v12, v43, v6);
  sub_13D60();
  v21(v12, v6);
  uint64_t v32 = v60;
  char v33 = sub_138A0();

  if ((v33 & 1) == 0) {
    double v24 = 0.0;
  }
  uint64_t v34 = (uint64_t)v48;
  uint64_t v35 = (uint64_t)&v48[*(int *)(v50 + 44)];
  uint64_t v37 = v57;
  uint64_t v36 = v58;
  uint64_t v38 = (uint64_t)v54;
  (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v54, v31, v58);
  *(double *)(v38 + *(int *)(v56 + 44)) = v24;
  (*(void (**)(char *, uint64_t))(v37 + 8))(v31, v36);
  uint64_t v39 = v55;
  sub_61A8(v38, v55, &qword_1C2E8);
  sub_61A8(v39, v35, &qword_1C2E8);
  uint64_t v40 = (uint64_t *)(v35 + *(int *)(sub_5F88(&qword_1C2C8) + 36));
  *uint64_t v40 = v49;
  v40[1] = v30;
  (*(void (**)(uint64_t, char *, uint64_t))(v51 + 32))(v34, v28, v52);
  return sub_61A8(v34, v59, &qword_1C290);
}

uint64_t sub_5550@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_137E0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_5580()
{
  return sub_137F0();
}

uint64_t sub_55AC@<X0>(uint64_t a1@<X8>)
{
  return sub_5728(a1);
}

void sub_55D0()
{
  uint64_t v0 = sub_5F88(&qword_1C230);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = swift_projectBox();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  sub_13D60();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  uint64_t v5 = (void *)v8[0];
  uint64_t v6 = (void (*)(void *, void))sub_13800();
  *uint64_t v7 = !*v7;
  v6(v8, 0);
}

uint64_t sub_5704@<X0>(uint64_t a1@<X8>)
{
  return sub_5728(a1);
}

uint64_t sub_5728@<X0>(uint64_t a1@<X8>)
{
  sub_13A90();
  if (qword_1C228 != -1) {
    swift_once();
  }
  id v2 = (id)qword_1D158;
  uint64_t result = sub_13B80();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_5808()
{
  return sub_13C10();
}

uint64_t sub_5824@<X0>(char *a1@<X8>)
{
  return sub_2D7C(*(void **)v1, *(unsigned char *)(v1 + 8), a1);
}

id sub_5830(void *a1, char a2)
{
  id v12 = a1;
  uint64_t v3 = sub_13A10();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    id v11 = v12;
    return v11;
  }
  else
  {
    swift_retain();
    os_log_type_t v7 = sub_13EC0();
    uint64_t v8 = sub_13B20();
    if (os_log_type_enabled(v8, v7))
    {
      uint64_t v9 = swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 136315138;
      *(void *)(v9 + 4) = sub_6504(0xD00000000000001ELL, 0x8000000000016EA0, &v13);
      _os_log_impl(&dword_0, v8, v7, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v9, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_13A00();
    swift_getAtKeyPath();
    sub_5E1C(v12, 0);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return (id)v13;
  }
}

uint64_t sub_5A3C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_13A10();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  os_log_type_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_5F88(&qword_1C3D8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6B20(v2, (uint64_t)v10, &qword_1C3D8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_13980();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_13EC0();
    uint64_t v14 = sub_13B20();
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136315138;
      *(void *)(v15 + 4) = sub_6504(0x417373696D736944, 0xED00006E6F697463, &v17);
      _os_log_impl(&dword_0, v14, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_13A00();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

Swift::Int sub_5CD0()
{
  Swift::UInt v1 = *v0;
  sub_13EF0();
  sub_13F00(v1);
  return sub_13F10();
}

void sub_5D18()
{
  sub_13F00(*v0);
}

Swift::Int sub_5D44()
{
  Swift::UInt v1 = *v0;
  sub_13EF0();
  sub_13F00(v1);
  return sub_13F10();
}

void *sub_5D88@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_5D98(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_5DA4(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t initializeBufferWithCopyOfBuffer for AirPlayReceiverSection(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_5E00(*(id *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

id sub_5E00(id a1, char a2)
{
  if (a2) {
    return a1;
  }
  else {
    return (id)swift_retain();
  }
}

void destroy for AirPlayReceiverSection(uint64_t a1)
{
}

void sub_5E1C(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_release();
  }
}

uint64_t assignWithCopy for AirPlayReceiverSection(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_5E00(*(id *)a2, v4);
  uint64_t v5 = *(void **)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  sub_5E1C(v5, v6);
  return a1;
}

uint64_t initializeWithTake for AirPlayReceiverSection(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t assignWithTake for AirPlayReceiverSection(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  char v4 = *((unsigned char *)a2 + 8);
  uint64_t v5 = *(void **)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  sub_5E1C(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for AirPlayReceiverSection(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AirPlayReceiverSection(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AirPlayReceiverSection()
{
  return &type metadata for AirPlayReceiverSection;
}

uint64_t sub_5F6C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_5F88(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_5FCC@<X0>(char *a1@<X8>)
{
  return sub_334C(v1, a1);
}

uint64_t sub_5FD4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_601C@<X0>(char *a1@<X8>)
{
  return sub_4AA0(a1);
}

uint64_t sub_6024@<X0>(uint64_t a1@<X8>)
{
  return sub_4EBC(a1);
}

unint64_t sub_602C()
{
  unint64_t result = qword_1C298;
  if (!qword_1C298)
  {
    sub_5FD4(&qword_1C290);
    sub_5FD4(&qword_1C2A0);
    sub_6100();
    swift_getOpaqueTypeConformance2();
    sub_6A4C(&qword_1C2C0, &qword_1C2C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C298);
  }
  return result;
}

unint64_t sub_6100()
{
  unint64_t result = qword_1C2A8;
  if (!qword_1C2A8)
  {
    sub_5FD4(&qword_1C2A0);
    sub_6A4C(&qword_1C2B0, &qword_1C2B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C2A8);
  }
  return result;
}

void sub_61A0()
{
}

uint64_t sub_61A8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_5F88(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_620C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_5F88(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_6268()
{
  return sub_4528();
}

uint64_t sub_6270()
{
  return sub_397C();
}

unint64_t sub_6278()
{
  unint64_t result = qword_1C330;
  if (!qword_1C330)
  {
    sub_5FD4(&qword_1C328);
    sub_5FD4(&qword_1C338);
    sub_5FD4(&qword_1C340);
    sub_13A30();
    sub_6A4C(&qword_1C348, &qword_1C340);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_63B4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C330);
  }
  return result;
}

unint64_t sub_63B4()
{
  unint64_t result = qword_1C350;
  if (!qword_1C350)
  {
    sub_5FD4(&qword_1C358);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C350);
  }
  return result;
}

unint64_t sub_6420()
{
  unint64_t result = qword_1C368;
  if (!qword_1C368)
  {
    sub_5FD4(&qword_1C360);
    sub_63B4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C368);
  }
  return result;
}

uint64_t sub_649C@<X0>(uint64_t a1@<X8>)
{
  return sub_3ACC(a1);
}

void type metadata accessor for APRKAdvertisingAccessMode()
{
  if (!qword_1C3B8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1C3B8);
    }
  }
}

double sub_64FC@<D0>(uint64_t a1@<X8>)
{
  return sub_45C4(a1);
}

unint64_t sub_6504(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_65D8(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_6728((uint64_t)v12, *a3);
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
      sub_6728((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_66D8((uint64_t)v12);
  return v7;
}

unint64_t sub_65D8(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          unint64_t result = 0;
          *((unsigned char *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    unint64_t result = (unint64_t)sub_6784(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_13EE0();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_66D8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_6728(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

char *sub_6784(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (char *)sub_681C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_6920(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_6920((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 1;
  v2[v4 + 32] = 0;
  return v2;
}

void *sub_681C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
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
      unint64_t v3 = sub_68B8(v2, 0);
      unint64_t result = (void *)sub_13ED0();
      if (v5) {
        break;
      }
      if (result == (void *)v2) {
        return v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_13E20();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_68B8(uint64_t a1, uint64_t a2)
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
  sub_5F88(&qword_1C3B0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_6920(char *result, int64_t a2, char a3, char *a4)
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
    sub_5F88(&qword_1C3B0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  id v12 = v10 + 32;
  os_log_type_t v13 = a4 + 32;
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
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_6A10()
{
  return sub_6A4C(&qword_1C3C0, &qword_1C3C8);
}

uint64_t sub_6A4C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_5FD4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_6A90()
{
  return sub_6AD8(&qword_1C3D0, (void (*)(uint64_t))type metadata accessor for APRKAdvertisingAccessMode);
}

uint64_t sub_6AD8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_6B20(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_5F88(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

ValueMetadata *type metadata accessor for AutomaticallyAirPlaySection()
{
  return &type metadata for AutomaticallyAirPlaySection;
}

uint64_t sub_6B98()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_6BB4@<X0>(void *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  char v5 = a2 & 1;
  uint64_t v6 = sub_5F88(&qword_1C3E0);
  __chkstk_darwin(v6);
  uint64_t v7 = sub_5F88(&qword_1C3E8);
  __chkstk_darwin(v7 - 8);
  int64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_5F88(&qword_1C230);
  uint64_t v10 = swift_allocBox();
  sub_5E00(a1, v5);
  sub_5830(a1, v5);
  sub_5E1C(a1, v5);
  sub_138D0();
  sub_8660((unint64_t *)&qword_1C248, (void (*)(uint64_t))&type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_13D80();
  id v11 = [self currentDevice];
  unsigned __int8 v12 = objc_msgSend(v11, "sf_inRetailKioskMode");

  if (v12)
  {
    uint64_t v14 = sub_5F88(&qword_1C450);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v9, 1, 1, v14);
  }
  else
  {
    uint64_t v15 = __chkstk_darwin(v13);
    *(&v20 - 4) = (uint64_t)a1;
    *((unsigned char *)&v20 - 24) = v16;
    *(&v20 - 2) = v10;
    __chkstk_darwin(v15);
    *(&v20 - 4) = v10;
    *(&v20 - 3) = (uint64_t)a1;
    *((unsigned char *)&v20 - 16) = v17;
    sub_5F88(&qword_1C3F0);
    sub_81E8();
    sub_13B50();
    sub_5F88(&qword_1C418);
    sub_8324();
    sub_6A4C(&qword_1C448, &qword_1C3E0);
    sub_139B0();
    uint64_t v18 = sub_5F88(&qword_1C450);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v9, 0, 1, v18);
  }
  sub_84B8((uint64_t)v9, a3);
  return swift_release();
}

uint64_t sub_6F14()
{
  sub_13A90();
  if (qword_1C228 != -1) {
    swift_once();
  }
  id v0 = (id)qword_1D158;
  sub_13B80();
  sub_5F88(&qword_1C458);
  sub_5FD4(&qword_1C400);
  sub_5FD4(&qword_1C408);
  sub_13A30();
  sub_6A4C(&qword_1C410, &qword_1C408);
  swift_getOpaqueTypeConformance2();
  swift_getOpaqueTypeConformance2();
  return sub_13D50();
}

uint64_t sub_70FC@<X0>(uint64_t a1@<X1>, int a2@<W2>, uint64_t a3@<X8>)
{
  int v36 = a2;
  uint64_t v35 = a1;
  uint64_t v42 = a3;
  uint64_t v3 = sub_13A30();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v40 = v3;
  uint64_t v41 = v4;
  __chkstk_darwin(v3);
  uint64_t v38 = (char *)v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_5F88(&qword_1C460);
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_5F88(&qword_1C230);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  id v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)v30 - v12;
  uint64_t v14 = sub_5F88(&qword_1C408);
  uint64_t v34 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  char v16 = (char *)v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_5F88(&qword_1C400);
  uint64_t v39 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  uint64_t v18 = (char *)v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_13A90();
  uint64_t v32 = v20;
  uint64_t v33 = v19;
  v30[3] = v21;
  uint64_t v31 = v22;
  uint64_t v23 = swift_projectBox();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, v23, v7);
  sub_13D70();
  double v24 = *(void (**)(char *, uint64_t))(v8 + 8);
  v24(v11, v7);
  swift_getKeyPath();
  sub_13D90();
  swift_release();
  v24(v13, v7);
  uint64_t v43 = v35;
  char v44 = v36 & 1;
  sub_136C0();
  sub_5F88(&qword_1C468);
  sub_8660(&qword_1C470, (void (*)(uint64_t))&type metadata accessor for AirPlayMode);
  sub_8560();
  sub_13CD0();
  double v25 = v38;
  sub_13A20();
  uint64_t v26 = sub_6A4C(&qword_1C410, &qword_1C408);
  uint64_t v27 = v40;
  sub_13BF0();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v25, v27);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v16, v14);
  uint64_t v45 = v14;
  uint64_t v46 = v27;
  uint64_t v47 = v26;
  uint64_t v48 = &protocol witness table for InlinePickerStyle;
  swift_getOpaqueTypeConformance2();
  uint64_t v28 = v37;
  sub_13C00();
  return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v18, v28);
}

uint64_t sub_75F8(uint64_t a1)
{
  uint64_t v2 = sub_136C0();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_13730();
}

uint64_t sub_76C4(void *a1, char a2)
{
  sub_136B0();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(unsigned char *)(v4 + 24) = a2 & 1;
  sub_5E00(a1, a2 & 1);
  sub_5F88(&qword_1C480);
  sub_136C0();
  sub_5F88(&qword_1C430);
  sub_6A4C(&qword_1C488, &qword_1C480);
  sub_83A0();
  sub_8660(&qword_1C490, (void (*)(uint64_t))&type metadata accessor for AirPlayMode);
  return sub_13D20();
}

uint64_t sub_7810@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_136C0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  int v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == enum case for AirPlayMode.never(_:))
  {
    *(void *)&long long v30 = a2;
    sub_13A90();
    if (qword_1C228 != -1) {
      swift_once();
    }
    id v9 = (id)qword_1D158;
    uint64_t v10 = sub_13B80();
    uint64_t v12 = v11;
    *(void *)&long long v31 = v10;
    *((void *)&v31 + 1) = v11;
    char v14 = v13 & 1;
    *(void *)&long long v32 = v13 & 1;
    *((void *)&v32 + 1) = v15;
    LOBYTE(v33) = 0;
    sub_86A8(v10, v11, v13 & 1);
    swift_bridgeObjectRetain();
    sub_13AE0();
    long long v31 = v34;
    long long v32 = v35;
    LOBYTE(v33) = v36;
    HIBYTE(v33) = 1;
    sub_5F88(&qword_1C358);
    sub_5F88(&qword_1C440);
    sub_844C((unint64_t *)&qword_1C350, &qword_1C358);
    sub_844C(&qword_1C438, &qword_1C440);
  }
  else
  {
    if (v8 == enum case for AirPlayMode.ask(_:))
    {
      *(void *)&long long v30 = a2;
      sub_13A90();
      if (qword_1C228 != -1) {
        swift_once();
      }
      id v16 = (id)qword_1D158;
      uint64_t v17 = sub_13B80();
      uint64_t v10 = v17;
      uint64_t v12 = v18;
      *(void *)&long long v31 = v17;
      *((void *)&v31 + 1) = v18;
      char v14 = v19 & 1;
      *(void *)&long long v32 = v19 & 1;
      *((void *)&v32 + 1) = v20;
      LOBYTE(v33) = 0;
    }
    else
    {
      if (v8 != enum case for AirPlayMode.automatic(_:))
      {
        long long v31 = 0u;
        long long v32 = 0u;
        LOBYTE(v33) = 1;
        sub_13AE0();
        long long v31 = v34;
        long long v32 = v35;
        LOBYTE(v33) = v36;
        HIBYTE(v33) = 1;
        sub_5F88(&qword_1C358);
        sub_5F88(&qword_1C440);
        sub_844C((unint64_t *)&qword_1C350, &qword_1C358);
        sub_844C(&qword_1C438, &qword_1C440);
        sub_13AE0();
        long long v29 = v35;
        long long v30 = v34;
        unsigned __int8 v27 = v36;
        char v28 = v37;
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        long long v26 = v29;
        long long v25 = v30;
        goto LABEL_15;
      }
      *(void *)&long long v30 = a2;
      sub_13A90();
      if (qword_1C228 != -1) {
        swift_once();
      }
      id v21 = (id)qword_1D158;
      uint64_t v17 = sub_13B80();
      uint64_t v10 = v17;
      uint64_t v12 = v18;
      char v14 = v22 & 1;
      *(void *)&long long v31 = v17;
      *((void *)&v31 + 1) = v18;
      *(void *)&long long v32 = v22 & 1;
      *((void *)&v32 + 1) = v23;
      LOBYTE(v33) = 1;
    }
    sub_86A8(v17, v18, v14);
    swift_bridgeObjectRetain();
    sub_13AE0();
    long long v31 = v34;
    long long v32 = v35;
    __int16 v33 = v36;
    sub_5F88(&qword_1C358);
    sub_5F88(&qword_1C440);
    sub_844C((unint64_t *)&qword_1C350, &qword_1C358);
    sub_844C(&qword_1C438, &qword_1C440);
  }
  sub_13AE0();
  sub_86B8(v10, v12, v14);
  uint64_t result = swift_bridgeObjectRelease();
  long long v25 = v34;
  long long v26 = v35;
  unsigned __int8 v27 = v36;
  char v28 = v37;
  a2 = v30;
LABEL_15:
  *(_OWORD *)a2 = v25;
  *(_OWORD *)(a2 + 16) = v26;
  *(unsigned char *)(a2 + 32) = v27;
  *(unsigned char *)(a2 + 33) = v28;
  return result;
}

uint64_t sub_7E50()
{
  return sub_139A0();
}

double sub_7EEC@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_136C0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_5F88(&qword_1C230);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = swift_projectBox();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  sub_13D60();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v11 = *(void **)&v16[0];
  sub_13720();

  sub_7810((uint64_t)v5, (uint64_t)v16);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  char v12 = v17;
  char v13 = v18;
  double result = *(double *)v16;
  long long v15 = v16[1];
  *(_OWORD *)a1 = v16[0];
  *(_OWORD *)(a1 + 16) = v15;
  *(unsigned char *)(a1 + 32) = v12;
  *(unsigned char *)(a1 + 33) = v13;
  return result;
}

uint64_t sub_80D8@<X0>(uint64_t a1@<X8>)
{
  sub_13A90();
  if (qword_1C228 != -1) {
    swift_once();
  }
  id v2 = (id)qword_1D158;
  uint64_t result = sub_13B80();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_81C0@<X0>(uint64_t a1@<X8>)
{
  return sub_6BB4(*(void **)v1, *(unsigned char *)(v1 + 8), a1);
}

uint64_t sub_81CC()
{
  return sub_7E50();
}

uint64_t sub_81DC()
{
  return sub_6F14();
}

unint64_t sub_81E8()
{
  unint64_t result = qword_1C3F8;
  if (!qword_1C3F8)
  {
    sub_5FD4(&qword_1C3F0);
    sub_5FD4(&qword_1C400);
    sub_5FD4(&qword_1C408);
    sub_13A30();
    sub_6A4C(&qword_1C410, &qword_1C408);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C3F8);
  }
  return result;
}

unint64_t sub_8324()
{
  unint64_t result = qword_1C420;
  if (!qword_1C420)
  {
    sub_5FD4(&qword_1C418);
    sub_83A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C420);
  }
  return result;
}

unint64_t sub_83A0()
{
  unint64_t result = qword_1C428;
  if (!qword_1C428)
  {
    sub_5FD4(&qword_1C430);
    sub_844C((unint64_t *)&qword_1C350, &qword_1C358);
    sub_844C(&qword_1C438, &qword_1C440);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C428);
  }
  return result;
}

uint64_t sub_844C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_5FD4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_84B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5F88(&qword_1C3E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_8520@<X0>(uint64_t a1@<X8>)
{
  return sub_70FC(*(void *)(v1 + 24), *(unsigned __int8 *)(v1 + 32), a1);
}

uint64_t sub_852C()
{
  return sub_13720();
}

uint64_t sub_8554()
{
  return sub_76C4(*(void **)(v0 + 16), *(unsigned char *)(v0 + 24));
}

unint64_t sub_8560()
{
  unint64_t result = qword_1C478;
  if (!qword_1C478)
  {
    sub_5FD4(&qword_1C468);
    sub_83A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C478);
  }
  return result;
}

uint64_t sub_85D4()
{
  sub_5E1C(*(id *)(v0 + 16), *(unsigned char *)(v0 + 24));

  return _swift_deallocObject(v0, 25, 7);
}

double sub_8610@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_7810(a1, (uint64_t)v7);
  char v3 = v8;
  char v4 = v9;
  double result = *(double *)v7;
  long long v6 = v7[1];
  *(_OWORD *)a2 = v7[0];
  *(_OWORD *)(a2 + 16) = v6;
  *(unsigned char *)(a2 + 32) = v3;
  *(unsigned char *)(a2 + 33) = v4;
  return result;
}

uint64_t sub_8660(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_86A8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_86B8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

double sub_86C8@<D0>(uint64_t a1@<X8>)
{
  return sub_7EEC(a1);
}

unint64_t sub_86DC()
{
  unint64_t result = qword_1C498;
  if (!qword_1C498)
  {
    sub_5FD4(&qword_1C3E8);
    sub_6A4C(&qword_1C4A0, &qword_1C450);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C498);
  }
  return result;
}

ValueMetadata *type metadata accessor for ContinuityCameraSection()
{
  return &type metadata for ContinuityCameraSection;
}

uint64_t sub_8784()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_87A0@<X0>(void *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_5F88(&qword_1C4A8);
  __chkstk_darwin(v6 - 8);
  char v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_5F88(&qword_1C230);
  swift_allocBox();
  a2 &= 1u;
  sub_5E00(a1, a2);
  sub_5830(a1, a2);
  sub_5E1C(a1, a2);
  sub_138D0();
  sub_8D2C();
  sub_13D80();
  id v9 = [self currentDevice];
  LOBYTE(a1) = objc_msgSend(v9, "sf_inRetailKioskMode");

  if ((a1 & 1) != 0
    || (sub_13D60(), uint64_t v10 = (void *)v20, v11 = sub_138B0(), v10, (v11 & 1) == 0))
  {
    uint64_t v17 = sub_5F88(&qword_1C4B0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v8, 1, 1, v17);
  }
  else
  {
    sub_13A90();
    if (qword_1C228 != -1) {
      swift_once();
    }
    id v12 = (id)qword_1D158;
    uint64_t v20 = sub_13B80();
    uint64_t v21 = v13;
    char v22 = v14 & 1;
    uint64_t v23 = v15;
    sub_5F88(&qword_1C308);
    sub_8DF4();
    sub_13D50();
    uint64_t v16 = sub_5F88(&qword_1C4B0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v8, 0, 1, v16);
  }
  sub_8D84((uint64_t)v8, a3);
  return swift_release();
}

uint64_t sub_8A94()
{
  uint64_t v0 = sub_5F88(&qword_1C230);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  char v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v10 - v5;
  uint64_t v7 = swift_projectBox();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v7, v0);
  sub_13D70();
  char v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  swift_getKeyPath();
  sub_13D90();
  swift_release();
  v8(v6, v0);
  return sub_13CE0();
}

uint64_t sub_8C38@<X0>(uint64_t a1@<X8>)
{
  sub_13A90();
  if (qword_1C228 != -1) {
    swift_once();
  }
  id v2 = (id)qword_1D158;
  uint64_t result = sub_13B80();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_8D20@<X0>(uint64_t a1@<X8>)
{
  return sub_87A0(*(void **)v1, *(unsigned char *)(v1 + 8), a1);
}

unint64_t sub_8D2C()
{
  unint64_t result = qword_1C248;
  if (!qword_1C248)
  {
    sub_138D0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C248);
  }
  return result;
}

uint64_t sub_8D84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5F88(&qword_1C4A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_8DEC()
{
  return sub_8A94();
}

unint64_t sub_8DF4()
{
  unint64_t result = qword_1C4B8;
  if (!qword_1C4B8)
  {
    sub_5FD4(&qword_1C308);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C4B8);
  }
  return result;
}

uint64_t sub_8E50@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_13860();
  *a1 = result & 1;
  return result;
}

uint64_t sub_8E80()
{
  return sub_13870();
}

unint64_t sub_8EAC()
{
  unint64_t result = qword_1C4C0;
  if (!qword_1C4C0)
  {
    sub_5FD4(&qword_1C4A8);
    sub_8F20();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C4C0);
  }
  return result;
}

unint64_t sub_8F20()
{
  unint64_t result = qword_1C4C8;
  if (!qword_1C4C8)
  {
    sub_5FD4(&qword_1C4B0);
    sub_8DF4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C4C8);
  }
  return result;
}

ValueMetadata *type metadata accessor for CursorAndKeyboardSection()
{
  return &type metadata for CursorAndKeyboardSection;
}

uint64_t sub_8FB8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_8FD4@<X0>(void *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_5F88(&qword_1C4A8);
  __chkstk_darwin(v6 - 8);
  char v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_5F88(&qword_1C230);
  swift_allocBox();
  a2 &= 1u;
  sub_5E00(a1, a2);
  sub_5830(a1, a2);
  sub_5E1C(a1, a2);
  sub_138D0();
  sub_8D2C();
  sub_13D80();
  id v9 = [self currentDevice];
  LODWORD(a1) = objc_msgSend(v9, "sf_isiPad");

  if (a1
    && (id v10 = [self sharedPreferences],
        unsigned int v11 = [v10 isSupported],
        v10,
        v11)
    && (sub_13D60(), v12 = (void *)v22, char v13 = sub_13790(), v12, (v13 & 1) != 0))
  {
    sub_13A90();
    if (qword_1C228 != -1) {
      swift_once();
    }
    id v14 = (id)qword_1D158;
    uint64_t v22 = sub_13B80();
    uint64_t v23 = v15;
    char v24 = v16 & 1;
    uint64_t v25 = v17;
    sub_5F88(&qword_1C308);
    sub_8DF4();
    sub_13D50();
    uint64_t v18 = sub_5F88(&qword_1C4B0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v8, 0, 1, v18);
  }
  else
  {
    uint64_t v19 = sub_5F88(&qword_1C4B0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v8, 1, 1, v19);
  }
  sub_8D84((uint64_t)v8, a3);
  return swift_release();
}

uint64_t sub_9304()
{
  uint64_t v0 = sub_5F88(&qword_1C230);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v10 - v5;
  uint64_t v7 = swift_projectBox();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v7, v0);
  sub_13D70();
  char v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  swift_getKeyPath();
  sub_13D90();
  swift_release();
  v8(v6, v0);
  return sub_13CE0();
}

uint64_t sub_94A8@<X0>(uint64_t a1@<X8>)
{
  sub_13A90();
  if (qword_1C228 != -1) {
    swift_once();
  }
  id v2 = (id)qword_1D158;
  uint64_t result = sub_13B80();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_9590@<X0>(uint64_t a1@<X8>)
{
  return sub_8FD4(*(void **)v1, *(unsigned char *)(v1 + 8), a1);
}

uint64_t sub_959C()
{
  return sub_9304();
}

uint64_t sub_95A4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_13700();
  *a1 = result & 1;
  return result;
}

uint64_t sub_95D4()
{
  return sub_13710();
}

ValueMetadata *type metadata accessor for HandoffSection()
{
  return &type metadata for HandoffSection;
}

uint64_t sub_960C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_9628(void *a1, char a2)
{
  sub_5F88(&qword_1C230);
  swift_allocBox();
  a2 &= 1u;
  sub_5E00(a1, a2);
  sub_5830(a1, a2);
  sub_5E1C(a1, a2);
  sub_138D0();
  sub_8D2C();
  sub_13D80();
  sub_13A90();
  if (qword_1C228 != -1) {
    swift_once();
  }
  id v4 = (id)qword_1D158;
  sub_13B80();
  sub_5F88(&qword_1C4D0);
  sub_5FD4(&qword_1C4D8);
  sub_AB94();
  swift_getOpaqueTypeConformance2();
  sub_13D50();
  return swift_release();
}

uint64_t sub_9814@<X0>(uint64_t a1@<X8>)
{
  uint64_t v56 = a1;
  uint64_t v1 = sub_13B10();
  uint64_t v57 = *(void *)(v1 - 8);
  uint64_t v58 = v1;
  __chkstk_darwin(v1);
  uint64_t v55 = (char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_5F88(&qword_1C230);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  id v9 = (char *)&v39 - v8;
  uint64_t v10 = sub_5F88(&qword_1C288);
  uint64_t v49 = *(void *)(v10 - 8);
  uint64_t v50 = v10;
  __chkstk_darwin(v10);
  id v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_5F88(&qword_1C510);
  uint64_t v53 = *(void *)(v13 - 8);
  uint64_t v54 = v13;
  __chkstk_darwin(v13);
  uint64_t v59 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_5F88(&qword_1C4D8);
  __chkstk_darwin(v51);
  uint64_t v52 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_5F88(&qword_1C290);
  sub_602C();
  uint64_t v48 = v12;
  sub_139A0();
  sub_13A90();
  if (qword_1C228 != -1) {
    swift_once();
  }
  id v16 = (id)qword_1D158;
  uint64_t v41 = sub_13B80();
  uint64_t v40 = v17;
  uint64_t v43 = v18;
  char v20 = v19 & 1;
  uint64_t v21 = swift_projectBox();
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  uint64_t v45 = v4 + 16;
  uint64_t v46 = v22;
  uint64_t v47 = v21;
  v22(v7, v21, v3);
  sub_13D70();
  uint64_t v23 = *(void (**)(char *, uint64_t))(v4 + 8);
  v23(v7, v3);
  uint64_t v42 = v23;
  swift_getKeyPath();
  uint64_t v44 = v4 + 8;
  sub_13D90();
  swift_release();
  v23(v9, v3);
  sub_5F88(&qword_1C4E8);
  sub_ACCC();
  sub_6A4C(&qword_1C4F8, &qword_1C4E8);
  uint64_t v24 = v50;
  uint64_t v25 = v41;
  uint64_t v26 = v3;
  uint64_t v27 = v40;
  char v28 = v48;
  sub_13C40();
  swift_release();
  swift_release();
  sub_86B8(v25, v27, v20);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v49 + 8))(v28, v24);
  v46(v9, v47, v26);
  sub_13D60();
  v42(v9, v26);
  long long v29 = v60;
  LOBYTE(v24) = sub_13850();

  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v31 = swift_allocObject();
  *(unsigned char *)(v31 + 16) = v24 & 1;
  uint64_t v33 = (uint64_t)v52;
  uint64_t v32 = v53;
  long long v34 = v59;
  uint64_t v35 = v54;
  (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v52, v59, v54);
  unsigned __int8 v36 = (uint64_t *)(v33 + *(int *)(v51 + 36));
  *unsigned __int8 v36 = KeyPath;
  v36[1] = (uint64_t)sub_ADC8;
  v36[2] = v31;
  (*(void (**)(char *, uint64_t))(v32 + 8))(v34, v35);
  char v37 = v55;
  sub_13B00();
  sub_AB94();
  sub_13C30();
  (*(void (**)(char *, uint64_t))(v57 + 8))(v37, v58);
  return sub_620C(v33, &qword_1C4D8);
}

uint64_t sub_9EEC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v59 = a1;
  uint64_t v1 = sub_5F88(&qword_1C2E0);
  uint64_t v57 = *(void *)(v1 - 8);
  uint64_t v58 = v1;
  __chkstk_darwin(v1);
  uint64_t v53 = (char *)&v42 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_5F88(&qword_1C2E8) - 8;
  uint64_t v3 = __chkstk_darwin(v56);
  uint64_t v54 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v55 = (uint64_t)&v42 - v5;
  uint64_t v6 = sub_5F88(&qword_1C230);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  id v12 = (char *)&v42 - v11;
  uint64_t v49 = sub_5F88(&qword_1C2B8);
  uint64_t v47 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v44 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_5F88(&qword_1C2A0);
  __chkstk_darwin(v46);
  uint64_t v15 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_5F88(&qword_1C2F0);
  uint64_t v51 = *(void *)(v16 - 8);
  uint64_t v52 = v16;
  __chkstk_darwin(v16);
  uint64_t v45 = (char *)&v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_5F88(&qword_1C290) - 8;
  __chkstk_darwin(v50);
  uint64_t v48 = (char *)&v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = swift_projectBox();
  char v20 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v43 = v19;
  v20(v10, v19, v6);
  sub_13D70();
  uint64_t v21 = *(void (**)(char *, uint64_t))(v7 + 8);
  v21(v10, v6);
  swift_getKeyPath();
  sub_13D90();
  swift_release();
  v21(v12, v6);
  uint64_t v42 = v7 + 8;
  uint64_t v22 = v44;
  sub_13CE0();
  v20(v12, v19, v6);
  sub_13D60();
  v21(v12, v6);
  uint64_t v23 = v60;
  LOBYTE(v7) = sub_136D0();

  double v24 = 1.0;
  if (v7) {
    double v25 = 0.0;
  }
  else {
    double v25 = 1.0;
  }
  uint64_t v26 = v47;
  uint64_t v27 = v49;
  (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v15, v22, v49);
  *(double *)&v15[*(int *)(v46 + 36)] = v25;
  (*(void (**)(char *, uint64_t))(v26 + 8))(v22, v27);
  sub_6100();
  char v28 = v45;
  sub_13C00();
  sub_620C((uint64_t)v15, &qword_1C2A0);
  uint64_t v49 = sub_13DA0();
  uint64_t v30 = v29;
  uint64_t v31 = v53;
  sub_13960();
  v20(v12, v43, v6);
  sub_13D60();
  v21(v12, v6);
  uint64_t v32 = v60;
  char v33 = sub_136D0();

  if ((v33 & 1) == 0) {
    double v24 = 0.0;
  }
  uint64_t v34 = (uint64_t)v48;
  uint64_t v35 = (uint64_t)&v48[*(int *)(v50 + 44)];
  uint64_t v37 = v57;
  uint64_t v36 = v58;
  uint64_t v38 = (uint64_t)v54;
  (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v54, v31, v58);
  *(double *)(v38 + *(int *)(v56 + 44)) = v24;
  (*(void (**)(char *, uint64_t))(v37 + 8))(v31, v36);
  uint64_t v39 = v55;
  sub_61A8(v38, v55, &qword_1C2E8);
  sub_61A8(v39, v35, &qword_1C2E8);
  uint64_t v40 = (uint64_t *)(v35 + *(int *)(sub_5F88(&qword_1C2C8) + 36));
  *uint64_t v40 = v49;
  v40[1] = v30;
  (*(void (**)(uint64_t, char *, uint64_t))(v51 + 32))(v34, v28, v52);
  return sub_61A8(v34, v59, &qword_1C290);
}

uint64_t sub_A580@<X0>(uint64_t a1@<X8>)
{
  return sub_AAA8(a1);
}

uint64_t sub_A5A4@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_13AB0();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v2 = sub_5F88(&qword_1C518);
  return sub_A5F4((char *)(a1 + *(int *)(v2 + 44)));
}

uint64_t sub_A5F4@<X0>(char *a1@<X8>)
{
  double v24 = a1;
  uint64_t v1 = sub_5F88(&qword_1C520);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_5F88(&qword_1C2D0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v11 = (char *)&v23 - v10;
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v23 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v23 - v15;
  swift_retain();
  sub_13CB0();
  sub_138E0();
  uint64_t v17 = sub_138F0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v3, 0, 1, v17);
  swift_retain();
  sub_13CA0();
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  v18(v11, v16, v4);
  v18(v8, v14, v4);
  uint64_t v19 = v24;
  v18(v24, v11, v4);
  uint64_t v20 = sub_5F88(&qword_1C528);
  v18(&v19[*(int *)(v20 + 48)], v8, v4);
  uint64_t v21 = *(void (**)(char *, uint64_t))(v5 + 8);
  v21(v14, v4);
  v21(v16, v4);
  v21(v8, v4);
  return ((uint64_t (*)(char *, uint64_t))v21)(v11, v4);
}

uint64_t sub_A920@<X0>(uint64_t a1@<X8>)
{
  return sub_AAA8(a1);
}

void sub_A948(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3 = sub_5F88(&qword_1C230);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = swift_projectBox();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  sub_13D60();
  uint64_t v8 = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v9 = (void *)v10[1];
  a2(v8);
}

uint64_t sub_AA60@<X0>(uint64_t a1@<X8>)
{
  return sub_AAA8(a1);
}

uint64_t sub_AA80@<X0>(uint64_t a1@<X8>)
{
  return sub_AAA8(a1);
}

uint64_t sub_AAA8@<X0>(uint64_t a1@<X8>)
{
  sub_13A90();
  if (qword_1C228 != -1) {
    swift_once();
  }
  id v2 = (id)qword_1D158;
  uint64_t result = sub_13B80();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_AB80()
{
  return sub_9628(*(void **)v0, *(unsigned char *)(v0 + 8));
}

uint64_t sub_AB8C@<X0>(uint64_t a1@<X8>)
{
  return sub_9814(a1);
}

unint64_t sub_AB94()
{
  unint64_t result = qword_1C4E0;
  if (!qword_1C4E0)
  {
    sub_5FD4(&qword_1C4D8);
    sub_5FD4(&qword_1C288);
    sub_5FD4(&qword_1C4E8);
    sub_ACCC();
    sub_6A4C(&qword_1C4F8, &qword_1C4E8);
    swift_getOpaqueTypeConformance2();
    sub_6A4C(&qword_1C500, &qword_1C508);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C4E0);
  }
  return result;
}

unint64_t sub_ACCC()
{
  unint64_t result = qword_1C4F0;
  if (!qword_1C4F0)
  {
    sub_5FD4(&qword_1C288);
    sub_602C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C4F0);
  }
  return result;
}

uint64_t sub_AD48@<X0>(uint64_t a1@<X8>)
{
  return sub_9EEC(a1);
}

uint64_t sub_AD50@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_136E0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_AD80()
{
  return sub_136F0();
}

uint64_t sub_ADA8@<X0>(uint64_t a1@<X8>)
{
  return sub_A5A4(a1);
}

uint64_t sub_ADB8()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_ADC8(unsigned char *a1)
{
  return sub_12F20(a1, *(unsigned char *)(v1 + 16));
}

void sub_ADD0()
{
  sub_A948(v0, (void (*)(uint64_t))&AirPlayAndHandoffSettingsState.userDidTapDontAllowHandoff());
}

void sub_AE00()
{
  sub_A948(v0, (void (*)(uint64_t))&AirPlayAndHandoffSettingsState.userDidCancelForTurnOffHandoff());
}

uint64_t sub_AE30@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_13790();
  *a1 = result & 1;
  return result;
}

uint64_t sub_AE60()
{
  return sub_137A0();
}

unint64_t sub_AE8C()
{
  unint64_t result = qword_1C530;
  if (!qword_1C530)
  {
    sub_5FD4(&qword_1C538);
    sub_5FD4(&qword_1C4D8);
    sub_AB94();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C530);
  }
  return result;
}

ValueMetadata *type metadata accessor for OnenessSection()
{
  return &type metadata for OnenessSection;
}

uint64_t sub_AF58()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_AF74@<X0>(void *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_5F88(&qword_1C540);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v21[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_5F88(&qword_1C230);
  swift_allocBox();
  a2 &= 1u;
  sub_5E00(a1, a2);
  sub_5830(a1, a2);
  sub_5E1C(a1, a2);
  sub_138D0();
  sub_FF60((unint64_t *)&qword_1C248, (void (*)(uint64_t))&type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_13D80();
  uint64_t v23 = &type metadata for SettingsAppFeatureFlags;
  unint64_t v24 = sub_E930();
  char v9 = sub_13640();
  sub_66D8((uint64_t)v21);
  if ((v9 & 1) != 0
    && (sub_13D60(),
        uint64_t v10 = (void *)v21[0],
        uint64_t v11 = sub_137C0(),
        v10,
        uint64_t v12 = *(void *)(v11 + 16),
        swift_bridgeObjectRelease(),
        v12))
  {
    sub_13A90();
    if (qword_1C228 != -1) {
      swift_once();
    }
    id v13 = (id)qword_1D158;
    v21[0] = sub_13B80();
    v21[1] = v14;
    char v22 = v15 & 1;
    uint64_t v23 = v16;
    sub_5F88(&qword_1C558);
    sub_6A4C(&qword_1C560, &qword_1C558);
    sub_13D50();
    uint64_t v17 = sub_5F88(&qword_1C550);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v8, 0, 1, v17);
  }
  else
  {
    uint64_t v18 = sub_5F88(&qword_1C550);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v8, 1, 1, v18);
  }
  sub_E984((uint64_t)v8, a3);
  return swift_release();
}

uint64_t sub_B2B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v29 = a2;
  uint64_t v30 = a1;
  uint64_t v2 = sub_5F88(&qword_1C230);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for OnenessListOfDevices();
  uint64_t v7 = __chkstk_darwin(v6);
  char v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v25 - v10;
  uint64_t v12 = sub_5F88(&qword_1C568);
  uint64_t v27 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v13 = __chkstk_darwin(v12);
  char v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v26 = (char *)&v25 - v16;
  uint64_t v17 = sub_138D0();
  uint64_t v18 = sub_FF60((unint64_t *)&qword_1C248, (void (*)(uint64_t))&type metadata accessor for AirPlayAndHandoffSettingsState);
  *(void *)char v9 = sub_13930();
  v9[8] = v19 & 1;
  uint64_t v20 = (uint64_t *)&v9[*(int *)(v6 + 20)];
  *uint64_t v20 = swift_getKeyPath();
  sub_5F88(&qword_1C3D8);
  swift_storeEnumTagMultiPayload();
  sub_EA6C((uint64_t)v9, (uint64_t)v11);
  uint64_t v21 = swift_projectBox();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v21, v2);
  sub_13D60();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  char v22 = v31;
  uint64_t v23 = sub_FF60(&qword_1C570, (void (*)(uint64_t))type metadata accessor for OnenessListOfDevices);
  sub_13BE0();

  sub_EAD0((uint64_t)v11);
  (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v26, v15, v28);
  sub_5F88(&qword_1C360);
  sub_6420();
  uint64_t v31 = (void *)v6;
  uint64_t v32 = v17;
  uint64_t v33 = v23;
  uint64_t v34 = v18;
  swift_getOpaqueTypeConformance2();
  return sub_139B0();
}

uint64_t sub_B66C()
{
  sub_5F88(&qword_1C358);
  sub_63B4();

  return sub_139A0();
}

uint64_t sub_B708@<X0>(void *a1@<X8>)
{
  uint64_t v47 = a1;
  uint64_t v1 = sub_13A80();
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v40 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_5F88(&qword_1C578);
  __chkstk_darwin(v4 - 8);
  uint64_t v45 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_136A0();
  uint64_t v44 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  uint64_t v43 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_5F88(&qword_1C230);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = swift_projectBox();
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v12(v10, v11, v7);
  sub_13D60();
  uint64_t v13 = *(void (**)(char *, uint64_t))(v8 + 8);
  v13(v10, v7);
  uint64_t v14 = v53;
  uint64_t v15 = sub_137C0();

  uint64_t v16 = *(void *)(v15 + 16);
  swift_bridgeObjectRelease();
  if (v16 == 1)
  {
    uint64_t v40 = v3;
    uint64_t v41 = v12;
    uint64_t v42 = v11;
    v12(v10, v11, v7);
    sub_13D60();
    v13(v10, v7);
    uint64_t v17 = v53;
    uint64_t v18 = sub_137C0();

    if (*(void *)(v18 + 16))
    {
      uint64_t v20 = v44;
      uint64_t v19 = (uint64_t)v45;
      uint64_t v21 = v46;
      (*(void (**)(char *, unint64_t, uint64_t))(v44 + 16))(v45, v18 + ((*(unsigned __int8 *)(v44 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80)), v46);
      uint64_t v22 = 0;
    }
    else
    {
      uint64_t v22 = 1;
      uint64_t v19 = (uint64_t)v45;
      uint64_t v21 = v46;
      uint64_t v20 = v44;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56))(v19, v22, 1, v21);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v20 + 48))(v19, 1, v21) != 1)
    {
      uint64_t v36 = v43;
      (*(void (**)(char *, uint64_t, uint64_t))(v20 + 32))(v43, v19, v21);
      uint64_t v37 = v21;
      uint64_t v48 = sub_13690();
      uint64_t v49 = v38;
      uint64_t v50 = 0;
      uint64_t v51 = &_swiftEmptyArrayStorage;
      char v52 = 0;
      sub_13AE0();
      uint64_t v31 = v53;
      uint64_t v32 = v54;
      uint64_t v33 = v55;
      uint64_t v34 = v56;
      char v35 = v57;
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v36, v37);
      goto LABEL_11;
    }
    sub_620C(v19, &qword_1C578);
    uint64_t v12 = v41;
    uint64_t v11 = v42;
  }
  sub_13A70();
  v58._countAndFlagsBits = 0;
  v58._object = (void *)0xE000000000000000;
  sub_13A60(v58);
  v12(v10, v11, v7);
  sub_13D60();
  v13(v10, v7);
  uint64_t v23 = v53;
  uint64_t v24 = sub_137C0();

  uint64_t v25 = *(void **)(v24 + 16);
  swift_bridgeObjectRelease();
  uint64_t v53 = v25;
  sub_13A40();
  v59._countAndFlagsBits = 0x7363614D20;
  v59._object = (void *)0xE500000000000000;
  sub_13A60(v59);
  sub_13AA0();
  if (qword_1C228 != -1) {
    swift_once();
  }
  id v26 = (id)qword_1D158;
  uint64_t v48 = sub_13B80();
  uint64_t v49 = v27;
  uint64_t v50 = v28 & 1;
  uint64_t v51 = v29;
  char v52 = 1;
  uint64_t result = sub_13AE0();
  uint64_t v31 = v53;
  uint64_t v32 = v54;
  uint64_t v33 = v55;
  uint64_t v34 = v56;
  char v35 = v57;
LABEL_11:
  uint64_t v39 = v47;
  void *v47 = v31;
  v39[1] = v32;
  v39[2] = v33;
  v39[3] = v34;
  *((unsigned char *)v39 + 32) = v35;
  return result;
}

uint64_t sub_BC90@<X0>(uint64_t a1@<X8>)
{
  sub_13A90();
  if (qword_1C228 != -1) {
    swift_once();
  }
  id v2 = (id)qword_1D158;
  uint64_t result = sub_13B80();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_BD78@<X0>(uint64_t a1@<X8>)
{
  return sub_AF74(*(void **)v1, *(unsigned char *)(v1 + 8), a1);
}

uint64_t sub_BD84@<X0>(uint64_t a1@<X8>)
{
  uint64_t v29 = a1;
  uint64_t v2 = sub_5F88(&qword_1C630);
  uint64_t v24 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_5F88(&qword_1C638);
  uint64_t v27 = *(void *)(v5 - 8);
  uint64_t v28 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_5F88(&qword_1C640);
  uint64_t v25 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_5F88(&qword_1C230);
  uint64_t v11 = swift_allocBox();
  id v12 = *(id *)v1;
  char v13 = *(unsigned char *)(v1 + 8);
  sub_5E00(*(id *)v1, v13);
  sub_5830(v12, v13);
  sub_5E1C(v12, v13);
  sub_138D0();
  sub_FF60((unint64_t *)&qword_1C248, (void (*)(uint64_t))&type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_13D80();
  v23[1] = v11;
  uint64_t v30 = v11;
  uint64_t v31 = v1;
  sub_5F88(&qword_1C648);
  sub_F4BC();
  sub_13B50();
  sub_13A90();
  if (qword_1C228 != -1) {
    swift_once();
  }
  id v14 = (id)qword_1D158;
  uint64_t v15 = sub_13B80();
  uint64_t v17 = v16;
  char v19 = v18 & 1;
  uint64_t v20 = sub_6A4C(&qword_1C698, &qword_1C630);
  sub_13C20();
  sub_86B8(v15, v17, v19);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v4, v2);
  sub_13910();
  uint64_t v32 = v2;
  uint64_t v33 = v20;
  swift_getOpaqueTypeConformance2();
  sub_FF60(&qword_1C6A0, (void (*)(uint64_t))&type metadata accessor for EditButton);
  uint64_t v21 = v28;
  sub_13C60();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v7, v21);
  (*(void (**)(uint64_t, char *, uint64_t))(v25 + 32))(v29, v10, v26);
  return swift_release();
}

uint64_t sub_C234()
{
  sub_13A90();
  if (qword_1C228 != -1) {
    swift_once();
  }
  id v0 = (id)qword_1D158;
  sub_13B80();
  sub_5F88(&qword_1C660);
  sub_F544();
  return sub_13D50();
}

uint64_t sub_C370@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v25 = a1;
  uint64_t v26 = a2;
  uint64_t v2 = type metadata accessor for OnenessListOfDevices();
  uint64_t v24 = *(void *)(v2 - 8);
  uint64_t v3 = *(void *)(v24 + 64);
  __chkstk_darwin(v2 - 8);
  uint64_t v22 = (uint64_t)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_5F88(&qword_1C230);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_5F88(&qword_1C670);
  uint64_t v8 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = swift_projectBox();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v11, v4);
  sub_13D60();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  id v12 = v27;
  uint64_t v13 = sub_137C0();

  uint64_t v27 = (void *)v13;
  swift_getKeyPath();
  swift_retain();
  sub_5F88(&qword_1C6A8);
  sub_5F88(&qword_1C680);
  sub_6A4C(&qword_1C6B0, &qword_1C6A8);
  sub_FF60(&qword_1C6B8, (void (*)(uint64_t))&type metadata accessor for CompanionDevice);
  sub_6A4C(&qword_1C678, &qword_1C680);
  sub_13D10();
  uint64_t v14 = v22;
  sub_F68C(v25, v22);
  unint64_t v15 = (*(unsigned __int8 *)(v24 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  uint64_t v16 = swift_allocObject();
  sub_EA6C(v14, v16 + v15);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = sub_F80C;
  *(void *)(v17 + 24) = v16;
  uint64_t v18 = v26;
  uint64_t v19 = v23;
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(v26, v10, v23);
  uint64_t v20 = (uint64_t (**)())(v18 + *(int *)(sub_5F88(&qword_1C660) + 36));
  *uint64_t v20 = sub_FA50;
  v20[1] = (uint64_t (*)())v17;
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v19);
}

__n128 sub_C764@<Q0>(void *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_13AC0();
  sub_C7EC(a1, (uint64_t *)&v11);
  char v5 = v12;
  uint64_t v6 = v13;
  char v7 = v16;
  __n128 result = v11;
  long long v9 = v14;
  long long v10 = v15;
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  *(__n128 *)(a2 + 24) = result;
  *(unsigned char *)(a2 + 40) = v5;
  *(void *)(a2 + 48) = v6;
  *(_OWORD *)(a2 + 56) = v9;
  *(_OWORD *)(a2 + 72) = v10;
  *(unsigned char *)(a2 + 88) = v7;
  return result;
}

uint64_t sub_C7EC@<X0>(void *a1@<X1>, uint64_t *a2@<X8>)
{
  v93 = a1;
  v100 = a2;
  uint64_t v2 = sub_13A80();
  __chkstk_darwin(v2 - 8);
  v97 = (char *)&v84 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v96 = (void *)sub_5F88(&qword_1C230);
  uint64_t v95 = *(v96 - 1);
  __chkstk_darwin(v96);
  v94 = (char *)&v84 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_5F88(&qword_1C710);
  __chkstk_darwin(v5 - 8);
  char v7 = (char *)&v84 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_135E0();
  uint64_t v98 = *(void *)(v8 - 8);
  uint64_t v9 = __chkstk_darwin(v8);
  __n128 v11 = (char *)&v84 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v99 = (char *)&v84 - v12;
  uint64_t v13 = sub_5F88(&qword_1C718);
  __chkstk_darwin(v13 - 8);
  long long v15 = (char *)&v84 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_13670();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v84 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = sub_13690();
  uint64_t v109 = v20;
  sub_FFA8();
  uint64_t v21 = sub_13B90();
  uint64_t v102 = v22;
  int v101 = v23;
  uint64_t v25 = v24;
  sub_13680();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
  {
    sub_620C((uint64_t)v15, &qword_1C718);
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    unsigned __int8 v30 = -1;
  }
  else
  {
    uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
    uint64_t v90 = v16;
    v31(v19, v15, v16);
    sub_13650();
    uint64_t v32 = v98;
    int v33 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v98 + 48))(v7, 1, v8);
    uint64_t v92 = v25;
    uint64_t v91 = v21;
    uint64_t v89 = v17;
    v88 = v19;
    if (v33 == 1)
    {
      sub_620C((uint64_t)v7, &qword_1C710);
      sub_13A90();
      if (qword_1C228 != -1) {
        swift_once();
      }
      id v34 = (id)qword_1D158;
      uint64_t v35 = sub_13B80();
      uint64_t v37 = v36;
      char v39 = v38 & 1;
      sub_13B40();
      uint64_t v40 = sub_13B70();
      uint64_t v42 = v41;
      char v44 = v43;
      swift_release();
      sub_86B8(v35, v37, v39);
      swift_bridgeObjectRelease();
      LODWORD(v108) = sub_13AF0();
      uint64_t v45 = sub_13B60();
      uint64_t v47 = v46;
      uint64_t v49 = v48;
      uint64_t v51 = v50 & 1;
      sub_86B8(v40, v42, v44 & 1);
      swift_bridgeObjectRelease();
      uint64_t v103 = v45;
      uint64_t v104 = v47;
      uint64_t v105 = v51;
      uint64_t v106 = v49;
      char v107 = 1;
      sub_13AE0();
      uint64_t v26 = v108;
      uint64_t v27 = v109;
      uint64_t v28 = v110;
      uint64_t v29 = v111;
      unsigned __int8 v30 = v112;
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v99, v7, v8);
      uint64_t v87 = swift_projectBox();
      uint64_t v52 = v95;
      v86 = *(void (**)(char *, uint64_t, void *))(v95 + 16);
      uint64_t v53 = v94;
      uint64_t v54 = v96;
      v86(v94, v87, v96);
      sub_13D60();
      v85 = *(void (**)(char *, void *))(v52 + 8);
      v85(v53, v54);
      uint64_t v55 = (void *)v108;
      sub_13660();
      uint64_t v95 = sub_137D0();
      v93 = v56;

      char v57 = *(void (**)(char *, uint64_t))(v32 + 8);
      v57(v11, v8);
      v86(v53, v87, v54);
      sub_13D60();
      v85(v53, v54);
      Swift::String v58 = (void *)v108;
      sub_13660();
      uint64_t v59 = sub_13780();
      v61 = v60;

      uint64_t v98 = v8;
      v96 = v57;
      v57(v11, v8);
      sub_13A70();
      v113._countAndFlagsBits = 0x657375207473614CLL;
      v113._object = (void *)0xEA00000000002064;
      sub_13A60(v113);
      v114._countAndFlagsBits = v95;
      v114._object = v93;
      sub_13A50(v114);
      swift_bridgeObjectRelease();
      v115._countAndFlagsBits = 0x20726F6620;
      v115._object = (void *)0xE500000000000000;
      sub_13A60(v115);
      v116._countAndFlagsBits = v59;
      v116._object = v61;
      sub_13A50(v116);
      swift_bridgeObjectRelease();
      v117._countAndFlagsBits = 0;
      v117._object = (void *)0xE000000000000000;
      sub_13A60(v117);
      sub_13AA0();
      if (qword_1C228 != -1) {
        swift_once();
      }
      id v62 = (id)qword_1D158;
      uint64_t v63 = sub_13B80();
      uint64_t v65 = v64;
      char v67 = v66 & 1;
      sub_13B40();
      uint64_t v68 = sub_13B70();
      uint64_t v70 = v69;
      char v72 = v71;
      swift_release();
      sub_86B8(v63, v65, v67);
      swift_bridgeObjectRelease();
      LODWORD(v108) = sub_13AF0();
      uint64_t v73 = sub_13B60();
      uint64_t v75 = v74;
      uint64_t v77 = v76;
      uint64_t v79 = v78 & 1;
      sub_86B8(v68, v70, v72 & 1);
      swift_bridgeObjectRelease();
      uint64_t v103 = v73;
      uint64_t v104 = v75;
      uint64_t v105 = v79;
      uint64_t v106 = v77;
      char v107 = 0;
      sub_13AE0();
      uint64_t v26 = v108;
      uint64_t v27 = v109;
      uint64_t v28 = v110;
      uint64_t v29 = v111;
      unsigned __int8 v30 = v112;
      ((void (*)(char *, uint64_t))v96)(v99, v98);
    }
    (*(void (**)(char *, uint64_t))(v89 + 8))(v88, v90);
    uint64_t v25 = v92;
    uint64_t v21 = v91;
  }
  char v80 = v101 & 1;
  v81 = v100;
  uint64_t v82 = v102;
  uint64_t *v100 = v21;
  v81[1] = v82;
  *((unsigned char *)v81 + 16) = v80;
  v81[3] = v25;
  v81[4] = v26;
  v81[5] = v27;
  v81[6] = v28;
  v81[7] = v29;
  *((unsigned char *)v81 + 64) = v30;
  sub_86A8(v21, v82, v80);
  swift_bridgeObjectRetain();
  sub_FFFC(v26, v27, v28, v29, v30);
  sub_10050(v26, v27, v28, v29, v30);
  sub_86B8(v21, v82, v80);
  return swift_bridgeObjectRelease();
}

uint64_t sub_D1E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for OnenessListOfDevices();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4 - 8);
  char v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_13630();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8);
  uint64_t v11 = sub_5F88(&qword_1C6C0);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_13E70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  sub_F68C(a2, (uint64_t)v7);
  sub_13E50();
  uint64_t v15 = sub_13E40();
  unint64_t v16 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v17 = (v10 + *(unsigned __int8 *)(v5 + 80) + v16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v15;
  *(void *)(v18 + 24) = &protocol witness table for MainActor;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v18 + v16, (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  sub_EA6C((uint64_t)v7, v18 + v17);
  sub_E780((uint64_t)v13, (uint64_t)&unk_1C6D0, v18);
  return swift_release();
}

uint64_t sub_D470(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[12] = a4;
  v5[13] = a5;
  uint64_t v6 = sub_13980();
  v5[14] = v6;
  v5[15] = *(void *)(v6 - 8);
  v5[16] = swift_task_alloc();
  uint64_t v7 = sub_136A0();
  v5[17] = v7;
  v5[18] = *(void *)(v7 - 8);
  v5[19] = swift_task_alloc();
  uint64_t v8 = sub_13A10();
  v5[20] = v8;
  v5[21] = *(void *)(v8 - 8);
  v5[22] = swift_task_alloc();
  uint64_t v9 = sub_13630();
  v5[23] = v9;
  v5[24] = *(void *)(v9 - 8);
  v5[25] = swift_task_alloc();
  uint64_t v10 = sub_13610();
  v5[26] = v10;
  v5[27] = *(void *)(v10 - 8);
  v5[28] = swift_task_alloc();
  v5[29] = swift_task_alloc();
  v5[30] = sub_5F88(&qword_1C6E8);
  v5[31] = swift_task_alloc();
  sub_13E50();
  v5[32] = sub_13E40();
  uint64_t v12 = sub_13E30();
  v5[33] = v12;
  v5[34] = v11;
  return _swift_task_switch(sub_D718, v12, v11);
}

uint64_t sub_D718()
{
  uint64_t v51 = v0;
  uint64_t v1 = *(void *)(v0 + 240);
  uint64_t v2 = *(void *)(v0 + 216);
  sub_13620();
  uint64_t v3 = *(int *)(v1 + 36);
  *(_DWORD *)(v0 + 304) = v3;
  uint64_t v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  *(void *)(v0 + 280) = v4;
  uint64_t v6 = *(void *)(v0 + 224);
  uint64_t v5 = *(void *)(v0 + 232);
  uint64_t v7 = *(void *)(v0 + 208);
  uint64_t v8 = *(void *)(v0 + 216);
  v4(v5, *(void *)(v0 + 248) + v3, v7);
  sub_FF60(&qword_1C6F0, (void (*)(uint64_t))&type metadata accessor for IndexSet);
  sub_13E80();
  sub_FF60(&qword_1C6F8, (void (*)(uint64_t))&type metadata accessor for IndexSet.Index);
  char v9 = sub_13DD0();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v10(v6, v7);
  v10(v5, v7);
  uint64_t v11 = *(void *)(v0 + 248);
  if ((v9 & 1) == 0)
  {
    uint64_t v24 = (uint64_t *)(v0 + 80);
    uint64_t v26 = *(void *)(v0 + 192);
    uint64_t v25 = *(void *)(v0 + 200);
    uint64_t v27 = *(void *)(v0 + 184);
    uint64_t v28 = *(void *)(v0 + 104);
    uint64_t v29 = (void (*)(uint64_t, void))sub_13EA0();
    unint64_t v49 = *v30;
    v29(v0 + 16, 0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v25, v11, v27);
    sub_13E90();
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
    uint64_t v31 = *(void **)v28;
    if (*(unsigned char *)(v28 + 8))
    {
      *uint64_t v24 = (uint64_t)v31;
      sub_5E00(v31, 1);
      id v32 = v31;
      uint64_t v33 = *v24;
    }
    else
    {
      sub_5E00(v31, 0);
      swift_retain();
      os_log_type_t v34 = sub_13EC0();
      uint64_t v35 = sub_13B20();
      if (os_log_type_enabled(v35, v34))
      {
        uint64_t v36 = swift_slowAlloc();
        uint64_t v50 = swift_slowAlloc();
        *(_DWORD *)uint64_t v36 = 136315138;
        *(void *)(v36 + 4) = sub_6504(0xD00000000000001ELL, 0x8000000000016EA0, &v50);
        _os_log_impl(&dword_0, v35, v34, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v36, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      uint64_t v38 = *(void *)(v0 + 168);
      uint64_t v37 = *(void *)(v0 + 176);
      uint64_t v39 = *(void *)(v0 + 160);
      sub_13A00();
      swift_getAtKeyPath();
      sub_5E1C(v31, 0);
      uint64_t v40 = *(void (**)(uint64_t, uint64_t))(v38 + 8);
      v40(v37, v39);
      uint64_t v33 = *(void *)(v0 + 80);
      swift_retain();
      os_log_type_t v41 = sub_13EC0();
      uint64_t v42 = sub_13B20();
      if (os_log_type_enabled(v42, v41))
      {
        uint64_t v43 = swift_slowAlloc();
        uint64_t v50 = swift_slowAlloc();
        *(_DWORD *)uint64_t v43 = 136315138;
        *(void *)(v43 + 4) = sub_6504(0xD00000000000001ELL, 0x8000000000016EA0, &v50);
        _os_log_impl(&dword_0, v42, v41, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v43, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      uint64_t v44 = *(void *)(v0 + 176);
      uint64_t v45 = *(void *)(v0 + 160);
      sub_13A00();
      swift_getAtKeyPath();
      sub_5E1C(v31, 0);
      v40(v44, v45);
      sub_5E1C(v31, 0);
      id v32 = *(id *)(v0 + 88);
    }
    *(void *)(v0 + 288) = v33;
    uint64_t v46 = sub_137C0();

    if ((v49 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v49 < *(void *)(v46 + 16))
    {
      (*(void (**)(void, unint64_t, void))(*(void *)(v0 + 144) + 16))(*(void *)(v0 + 152), v46+ ((*(unsigned __int8 *)(*(void *)(v0 + 144) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v0 + 144) + 80))+ *(void *)(*(void *)(v0 + 144) + 72) * v49, *(void *)(v0 + 136));
      swift_bridgeObjectRelease();
      uint64_t v48 = (void *)swift_task_alloc();
      *(void *)(v0 + 296) = v48;
      *uint64_t v48 = v0;
      v48[1] = sub_DE8C;
      uint64_t v47 = *(void *)(v0 + 152);
      return AirPlayAndHandoffSettingsState.unpair(device:)(v47);
    }
    __break(1u);
    return AirPlayAndHandoffSettingsState.unpair(device:)(v47);
  }
  uint64_t v12 = *(void *)(v0 + 104);
  sub_620C(v11, &qword_1C6E8);
  swift_release();
  uint64_t v13 = *(void **)v12;
  LOBYTE(v12) = *(unsigned char *)(v12 + 8);
  sub_5E00(v13, v12);
  id v14 = sub_5830(v13, v12);
  sub_5E1C(v13, v12);
  uint64_t v15 = (void (*)(uint64_t, void))sub_137B0();
  sub_5F88(&qword_1C6A8);
  sub_6A4C(&qword_1C700, &qword_1C6A8);
  sub_6A4C(&qword_1C708, &qword_1C6A8);
  sub_13EB0();
  v15(v0 + 48, 0);

  sub_5E00(v13, v12);
  id v16 = sub_5830(v13, v12);
  sub_5E1C(v13, v12);
  uint64_t v17 = sub_137C0();

  uint64_t v18 = *(void *)(v17 + 16);
  swift_bridgeObjectRelease();
  if (!v18)
  {
    uint64_t v20 = *(void *)(v0 + 120);
    uint64_t v19 = *(void *)(v0 + 128);
    uint64_t v21 = *(void *)(v0 + 112);
    type metadata accessor for OnenessListOfDevices();
    sub_5A3C(v19);
    sub_13970();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v22 = *(uint64_t (**)(void))(v0 + 8);
  return v22();
}

uint64_t sub_DE8C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void **)(*v0 + 288);
  uint64_t v3 = *(void *)(*v0 + 152);
  uint64_t v4 = *(void *)(*v0 + 144);
  uint64_t v5 = *(void *)(*v0 + 136);
  swift_task_dealloc();

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  uint64_t v6 = *(void *)(v1 + 272);
  uint64_t v7 = *(void *)(v1 + 264);
  return _swift_task_switch(sub_E028, v7, v6);
}

uint64_t sub_E028()
{
  uint64_t v47 = v0;
  uint64_t v2 = *(void *)(v0 + 224);
  uint64_t v1 = *(void *)(v0 + 232);
  uint64_t v3 = *(void *)(v0 + 208);
  uint64_t v4 = *(void *)(v0 + 216);
  (*(void (**)(uint64_t, void, uint64_t))(v0 + 280))(v1, *(void *)(v0 + 248) + *(int *)(v0 + 304), v3);
  sub_FF60(&qword_1C6F0, (void (*)(uint64_t))&type metadata accessor for IndexSet);
  sub_13E80();
  sub_FF60(&qword_1C6F8, (void (*)(uint64_t))&type metadata accessor for IndexSet.Index);
  char v5 = sub_13DD0();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v6(v2, v3);
  v6(v1, v3);
  if ((v5 & 1) == 0)
  {
    uint64_t v19 = (uint64_t *)(v0 + 80);
    uint64_t v20 = *(void *)(v0 + 248);
    uint64_t v22 = *(void *)(v0 + 192);
    uint64_t v21 = *(void *)(v0 + 200);
    uint64_t v23 = *(void *)(v0 + 184);
    uint64_t v24 = *(void *)(v0 + 104);
    uint64_t v25 = (void (*)(uint64_t, void))sub_13EA0();
    unint64_t v45 = *v26;
    v25(v0 + 16, 0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v21, v20, v23);
    sub_13E90();
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
    uint64_t v27 = *(void **)v24;
    if (*(unsigned char *)(v24 + 8))
    {
      uint64_t *v19 = (uint64_t)v27;
      sub_5E00(v27, 1);
      id v28 = v27;
      uint64_t v29 = *v19;
    }
    else
    {
      sub_5E00(v27, 0);
      swift_retain();
      os_log_type_t v30 = sub_13EC0();
      uint64_t v31 = sub_13B20();
      if (os_log_type_enabled(v31, v30))
      {
        uint64_t v32 = swift_slowAlloc();
        uint64_t v46 = swift_slowAlloc();
        *(_DWORD *)uint64_t v32 = 136315138;
        *(void *)(v32 + 4) = sub_6504(0xD00000000000001ELL, 0x8000000000016EA0, &v46);
        _os_log_impl(&dword_0, v31, v30, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v32, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      uint64_t v34 = *(void *)(v0 + 168);
      uint64_t v33 = *(void *)(v0 + 176);
      uint64_t v35 = *(void *)(v0 + 160);
      sub_13A00();
      swift_getAtKeyPath();
      sub_5E1C(v27, 0);
      uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
      v36(v33, v35);
      uint64_t v29 = *(void *)(v0 + 80);
      swift_retain();
      os_log_type_t v37 = sub_13EC0();
      uint64_t v38 = sub_13B20();
      if (os_log_type_enabled(v38, v37))
      {
        uint64_t v39 = swift_slowAlloc();
        uint64_t v46 = swift_slowAlloc();
        *(_DWORD *)uint64_t v39 = 136315138;
        *(void *)(v39 + 4) = sub_6504(0xD00000000000001ELL, 0x8000000000016EA0, &v46);
        _os_log_impl(&dword_0, v38, v37, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v39, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      uint64_t v40 = *(void *)(v0 + 176);
      uint64_t v41 = *(void *)(v0 + 160);
      sub_13A00();
      swift_getAtKeyPath();
      sub_5E1C(v27, 0);
      v36(v40, v41);
      sub_5E1C(v27, 0);
      id v28 = *(id *)(v0 + 88);
    }
    *(void *)(v0 + 288) = v29;
    uint64_t v42 = sub_137C0();

    if ((v45 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v45 < *(void *)(v42 + 16))
    {
      (*(void (**)(void, unint64_t, void))(*(void *)(v0 + 144) + 16))(*(void *)(v0 + 152), v42+ ((*(unsigned __int8 *)(*(void *)(v0 + 144) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v0 + 144) + 80))+ *(void *)(*(void *)(v0 + 144) + 72) * v45, *(void *)(v0 + 136));
      swift_bridgeObjectRelease();
      uint64_t v44 = (void *)swift_task_alloc();
      *(void *)(v0 + 296) = v44;
      *uint64_t v44 = v0;
      v44[1] = sub_DE8C;
      uint64_t v43 = *(void *)(v0 + 152);
      return AirPlayAndHandoffSettingsState.unpair(device:)(v43);
    }
    __break(1u);
    return AirPlayAndHandoffSettingsState.unpair(device:)(v43);
  }
  uint64_t v7 = *(void *)(v0 + 104);
  sub_620C(*(void *)(v0 + 248), &qword_1C6E8);
  swift_release();
  uint64_t v8 = *(void **)v7;
  LOBYTE(v7) = *(unsigned char *)(v7 + 8);
  sub_5E00(v8, v7);
  id v9 = sub_5830(v8, v7);
  sub_5E1C(v8, v7);
  uint64_t v10 = (void (*)(uint64_t, void))sub_137B0();
  sub_5F88(&qword_1C6A8);
  sub_6A4C(&qword_1C700, &qword_1C6A8);
  sub_6A4C(&qword_1C708, &qword_1C6A8);
  sub_13EB0();
  v10(v0 + 48, 0);

  sub_5E00(v8, v7);
  id v11 = sub_5830(v8, v7);
  sub_5E1C(v8, v7);
  uint64_t v12 = sub_137C0();

  uint64_t v13 = *(void *)(v12 + 16);
  swift_bridgeObjectRelease();
  if (!v13)
  {
    uint64_t v15 = *(void *)(v0 + 120);
    uint64_t v14 = *(void *)(v0 + 128);
    uint64_t v16 = *(void *)(v0 + 112);
    type metadata accessor for OnenessListOfDevices();
    sub_5A3C(v14);
    sub_13970();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = *(uint64_t (**)(void))(v0 + 8);
  return v17();
}

uint64_t sub_E780(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_13E70();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_13E60();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_620C(a1, &qword_1C6C0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_13E30();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

unint64_t sub_E930()
{
  unint64_t result = qword_1C548;
  if (!qword_1C548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C548);
  }
  return result;
}

uint64_t sub_E984(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5F88(&qword_1C540);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_E9EC@<X0>(uint64_t a1@<X8>)
{
  return sub_B2B8(v1, a1);
}

uint64_t type metadata accessor for OnenessListOfDevices()
{
  uint64_t result = qword_1C5E0;
  if (!qword_1C5E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_EA40()
{
  return sub_B66C();
}

uint64_t sub_EA48()
{
  return sub_139D0();
}

uint64_t sub_EA6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for OnenessListOfDevices();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_EAD0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for OnenessListOfDevices();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_EB2C@<X0>(void *a1@<X8>)
{
  return sub_B708(a1);
}

char *sub_EB34(char *a1, char **a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *(void *)a1 = *a2;
    a1 = &v13[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    uint64_t v7 = *a2;
    char v8 = *((unsigned char *)a2 + 8);
    sub_5E00(*a2, v8);
    *(void *)a1 = v7;
    a1[8] = v8;
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = &a1[v9];
    id v11 = (char **)((char *)a2 + v9);
    sub_5F88(&qword_1C3D8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_13980();
      (*(void (**)(char *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *(void *)uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_EC74(uint64_t a1, uint64_t a2)
{
  sub_5E1C(*(id *)a1, *(unsigned char *)(a1 + 8));
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  sub_5F88(&qword_1C3D8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_13980();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_ED30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = *(id *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_5E00(*(id *)a2, v7);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  sub_5F88(&qword_1C3D8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_13980();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  else
  {
    *uint64_t v9 = *v10;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_EE18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = *(id *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_5E00(*(id *)a2, v7);
  uint64_t v8 = *(void **)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_5E1C(v8, v9);
  if (a1 != a2)
  {
    uint64_t v10 = *(int *)(a3 + 20);
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (void *)(a2 + v10);
    sub_620C(a1 + v10, &qword_1C3D8);
    sub_5F88(&qword_1C3D8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_13980();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *uint64_t v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_EF24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (void *)(a1 + v4);
  id v6 = (const void *)(a2 + v4);
  uint64_t v7 = sub_5F88(&qword_1C3D8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_13980();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  return a1;
}

uint64_t sub_F000(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  char v7 = *((unsigned char *)a2 + 8);
  uint64_t v8 = *(void **)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_5E1C(v8, v9);
  if ((uint64_t *)a1 != a2)
  {
    uint64_t v10 = *(int *)(a3 + 20);
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (char *)a2 + v10;
    sub_620C(a1 + v10, &qword_1C3D8);
    uint64_t v13 = sub_5F88(&qword_1C3D8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = sub_13980();
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v11, v12, v14);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_F108(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_F11C);
}

uint64_t sub_F11C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 254)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 8);
    if (v4 > 1) {
      return (v4 ^ 0xFF) + 1;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v8 = sub_5F88(&qword_1C580);
    char v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_F1C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_F1DC);
}

uint64_t sub_F1DC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 254)
  {
    *(unsigned char *)(result + 8) = -(char)a2;
  }
  else
  {
    uint64_t v7 = sub_5F88(&qword_1C580);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_F284()
{
  sub_F31C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_F31C()
{
  if (!qword_1C5F0)
  {
    sub_13980();
    unint64_t v0 = sub_13920();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1C5F0);
    }
  }
}

unint64_t sub_F378()
{
  unint64_t result = qword_1C620;
  if (!qword_1C620)
  {
    sub_5FD4(&qword_1C540);
    sub_F3EC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C620);
  }
  return result;
}

unint64_t sub_F3EC()
{
  unint64_t result = qword_1C628;
  if (!qword_1C628)
  {
    sub_5FD4(&qword_1C550);
    sub_6A4C(&qword_1C560, &qword_1C558);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C628);
  }
  return result;
}

uint64_t sub_F498()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_F4B4()
{
  return sub_C234();
}

unint64_t sub_F4BC()
{
  unint64_t result = qword_1C650;
  if (!qword_1C650)
  {
    sub_5FD4(&qword_1C648);
    sub_F544();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C650);
  }
  return result;
}

unint64_t sub_F544()
{
  unint64_t result = qword_1C658;
  if (!qword_1C658)
  {
    sub_5FD4(&qword_1C660);
    sub_F5E4();
    sub_6A4C(&qword_1C688, &qword_1C690);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C658);
  }
  return result;
}

unint64_t sub_F5E4()
{
  unint64_t result = qword_1C668;
  if (!qword_1C668)
  {
    sub_5FD4(&qword_1C670);
    sub_6A4C(&qword_1C678, &qword_1C680);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C668);
  }
  return result;
}

uint64_t sub_F67C@<X0>(uint64_t a1@<X8>)
{
  return sub_C370(*(void *)(v1 + 24), a1);
}

double sub_F684@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_C764(v1, a1).n128_u64[0];
  return result;
}

uint64_t sub_F68C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for OnenessListOfDevices();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_F6F0()
{
  uint64_t v1 = (int *)(type metadata accessor for OnenessListOfDevices() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  sub_5E1C(*(id *)(v0 + v3), *(unsigned char *)(v0 + v3 + 8));
  uint64_t v5 = v0 + v3 + v1[7];
  sub_5F88(&qword_1C3D8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_13980();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_F80C(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for OnenessListOfDevices() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_D1E4(a1, v4);
}

uint64_t sub_F87C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_F958;
  return v6(a1);
}

uint64_t sub_F958()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_FA50()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_FA78()
{
  uint64_t v1 = sub_13630();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = (int *)(type metadata accessor for OnenessListOfDevices() - 8);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)v6 + 80);
  uint64_t v8 = (v4 + v5 + v7) & ~v7;
  uint64_t v9 = *(void *)(*(void *)v6 + 64);
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  sub_5E1C(*(id *)(v0 + v8), *(unsigned char *)(v0 + v8 + 8));
  uint64_t v10 = v0 + v8 + v6[7];
  sub_5F88(&qword_1C3D8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_13980();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  }
  else
  {
    swift_release();
  }

  return _swift_deallocObject(v0, v8 + v9, v3 | v7 | 7);
}

uint64_t sub_FC28(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_13630() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(type metadata accessor for OnenessListOfDevices() - 8) + 80);
  unint64_t v8 = v5 + v6 + v7;
  uint64_t v9 = *(void *)(v1 + 16);
  uint64_t v10 = *(void *)(v1 + 24);
  uint64_t v11 = v1 + v5;
  uint64_t v12 = v1 + (v8 & ~v7);
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v13;
  *uint64_t v13 = v2;
  v13[1] = sub_FD7C;
  return sub_D470(a1, v9, v10, v11, v12);
}

uint64_t sub_FD7C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_FE70()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_FEA8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_FD7C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1C6D8 + dword_1C6D8);
  return v6(a1, v4);
}

uint64_t sub_FF60(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_FFA8()
{
  unint64_t result = qword_1C720;
  if (!qword_1C720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C720);
  }
  return result;
}

uint64_t sub_FFFC(uint64_t a1, uint64_t a2, char a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 != 255) {
    return sub_10014(a1, a2, a3);
  }
  return a1;
}

uint64_t sub_10014(uint64_t a1, uint64_t a2, char a3)
{
  sub_86A8(a1, a2, a3 & 1);

  return swift_bridgeObjectRetain();
}

uint64_t sub_10050(uint64_t a1, uint64_t a2, char a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 != 255) {
    return sub_10068(a1, a2, a3);
  }
  return a1;
}

uint64_t sub_10068(uint64_t a1, uint64_t a2, char a3)
{
  sub_86B8(a1, a2, a3 & 1);

  return swift_bridgeObjectRelease();
}

uint64_t sub_100A4()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for TransferToHomePodSection()
{
  return &type metadata for TransferToHomePodSection;
}

uint64_t sub_101C0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_101DC@<X0>(void *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_5F88(&qword_1C4A8);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_5F88(&qword_1C230);
  swift_allocBox();
  a2 &= 1u;
  sub_5E00(a1, a2);
  sub_5830(a1, a2);
  sub_5E1C(a1, a2);
  sub_138D0();
  sub_8D2C();
  sub_13D80();
  uint64_t v9 = self;
  id v10 = [v9 currentDevice];
  unsigned __int8 v11 = objc_msgSend(v10, "sf_inRetailKioskMode");

  if ((v11 & 1) != 0
    || (id v12 = [v9 currentDevice],
        unsigned __int8 v13 = objc_msgSend(v12, "sf_isiPad"),
        v12,
        (v13 & 1) != 0))
  {
    uint64_t v14 = sub_5F88(&qword_1C4B0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v8, 1, 1, v14);
  }
  else
  {
    sub_13A90();
    if (qword_1C228 != -1) {
      swift_once();
    }
    id v15 = (id)qword_1D158;
    void v21[2] = sub_13B80();
    v21[3] = v16;
    char v22 = v17 & 1;
    uint64_t v23 = v18;
    sub_5F88(&qword_1C308);
    sub_8DF4();
    sub_13D50();
    uint64_t v19 = sub_5F88(&qword_1C4B0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v8, 0, 1, v19);
  }
  sub_8D84((uint64_t)v8, a3);
  return swift_release();
}

uint64_t sub_104DC()
{
  uint64_t v0 = sub_5F88(&qword_1C230);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v10 - v5;
  uint64_t v7 = swift_projectBox();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v7, v0);
  sub_13D70();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  swift_getKeyPath();
  sub_13D90();
  swift_release();
  v8(v6, v0);
  return sub_13CE0();
}

uint64_t sub_10680@<X0>(uint64_t a1@<X8>)
{
  sub_13A90();
  if (qword_1C228 != -1) {
    swift_once();
  }
  id v2 = (id)qword_1D158;
  uint64_t result = sub_13B80();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_10768@<X0>(uint64_t a1@<X8>)
{
  return sub_101DC(*(void **)v1, *(unsigned char *)(v1 + 8), a1);
}

uint64_t sub_10774()
{
  return sub_104DC();
}

uint64_t sub_1077C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_13880();
  *a1 = result & 1;
  return result;
}

uint64_t sub_107AC()
{
  return sub_13890();
}

uint64_t sub_107D4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for FindAirPlayAndHandoffSettingsClass()
{
  return self;
}

id sub_10808()
{
  type metadata accessor for FindAirPlayAndHandoffSettingsClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_1D158 = (uint64_t)result;
  return result;
}

uint64_t getEnumTagSinglePayload for SettingsAppFeatureFlags(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for SettingsAppFeatureFlags(unsigned char *result, int a2, int a3)
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
        *id result = a2;
        return result;
      case 2:
        *(_WORD *)id result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)id result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *id result = 0;
      break;
    case 2:
      *(_WORD *)id result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x10954);
    case 4:
      *(_DWORD *)id result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1097C()
{
  return 0;
}

ValueMetadata *type metadata accessor for SettingsAppFeatureFlags()
{
  return &type metadata for SettingsAppFeatureFlags;
}

unint64_t sub_10998()
{
  unint64_t result = qword_1C7C0;
  if (!qword_1C7C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C7C0);
  }
  return result;
}

uint64_t sub_109EC()
{
  return 1;
}

Swift::Int sub_109F4()
{
  return sub_13F10();
}

void sub_10A38()
{
}

Swift::Int sub_10A60()
{
  return sub_13F10();
}

const char *sub_10AA0()
{
  return "SettingsApp";
}

const char *sub_10AB4()
{
  return "Oneness";
}

uint64_t sub_10AC8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v75 = a1;
  uint64_t v1 = sub_5F88(&qword_1C858);
  __chkstk_darwin(v1 - 8);
  int v3 = (char *)&v58 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_135D0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v63 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_13DC0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char **)((char *)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v61 = sub_5F88(&qword_1C860);
  uint64_t v60 = *(void *)(v61 - 8);
  __chkstk_darwin(v61);
  id v12 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = sub_5F88(&qword_1C868);
  uint64_t v62 = *(void *)(v64 - 8);
  __chkstk_darwin(v64);
  Swift::String v58 = (char *)&v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_5F88(&qword_1C870);
  __chkstk_darwin(v68);
  id v15 = (char *)&v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = sub_5F88(&qword_1C878);
  uint64_t v69 = *(void *)(v77 - 8);
  __chkstk_darwin(v77);
  char v67 = (char *)&v58 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_5F88(&qword_1C880);
  uint64_t v73 = *(void *)(v17 - 8);
  uint64_t v74 = v17;
  __chkstk_darwin(v17);
  char v78 = (char *)&v58 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_5F88(&qword_1C888);
  uint64_t v71 = *(void *)(v19 - 8);
  uint64_t v72 = v19;
  __chkstk_darwin(v19);
  uint64_t v70 = (char *)&v58 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_5F88(&qword_1C890);
  sub_6A4C(&qword_1C898, &qword_1C890);
  uint64_t v59 = v12;
  sub_13B50();
  *uint64_t v10 = 0xD000000000000024;
  v10[1] = 0x8000000000017650;
  uint64_t v65 = v8;
  uint64_t v21 = *(void (**)(void *, void, uint64_t))(v8 + 104);
  uint64_t v66 = v7;
  v21(v10, enum case for SettingsEventImage.graphicIcon(_:), v7);
  char v22 = v76;
  sub_11724();
  sub_135C0();
  uint64_t v23 = v3;
  uint64_t v24 = v4;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    type metadata accessor for AirPlayAndHandoffSettingsList();
    uint64_t v26 = v63;
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v63, v23, v4);
    sub_6A4C(&qword_1C8A0, &qword_1C860);
    uint64_t v27 = v58;
    uint64_t v28 = v61;
    uint64_t v29 = v59;
    sub_13BB0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v26, v24);
    (*(void (**)(void *, uint64_t))(v65 + 8))(v10, v66);
    (*(void (**)(char *, uint64_t))(v60 + 8))(v29, v28);
    uint64_t v30 = sub_139C0();
    LOBYTE(v29) = sub_13B30();
    uint64_t v31 = v62;
    uint64_t v32 = v64;
    (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v15, v27, v64);
    uint64_t v33 = v68;
    uint64_t v34 = &v15[*(int *)(v68 + 36)];
    *(void *)uint64_t v34 = v30;
    v34[8] = (char)v29;
    (*(void (**)(char *, uint64_t))(v31 + 8))(v27, v32);
    uint64_t v35 = v22[1];
    uint64_t v81 = *v22;
    uint64_t v82 = v35;
    sub_5F88(&qword_1C8A8);
    sub_13C80();
    uint64_t v36 = v79;
    uint64_t v37 = sub_138D0();
    unint64_t v38 = sub_12A68();
    unint64_t v39 = sub_8D2C();
    uint64_t v40 = v67;
    sub_13BE0();

    sub_620C((uint64_t)v15, &qword_1C870);
    uint64_t v81 = v33;
    uint64_t v82 = v37;
    v83 = (void *)v38;
    unint64_t v84 = v39;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v42 = v77;
    sub_13BA0();
    (*(void (**)(char *, uint64_t))(v69 + 8))(v40, v42);
    sub_13A90();
    if (qword_1C228 != -1) {
      swift_once();
    }
    id v43 = (id)qword_1D158;
    uint64_t v68 = sub_13B80();
    uint64_t v69 = v44;
    uint64_t v46 = v45;
    uint64_t v47 = v22[1];
    char v49 = v48 & 1;
    uint64_t v79 = (void *)*v22;
    uint64_t v80 = v47;
    sub_13C90();
    uint64_t v50 = v81;
    uint64_t v51 = v82;
    uint64_t v52 = v83;
    swift_getKeyPath();
    uint64_t v81 = v50;
    uint64_t v82 = v51;
    v83 = v52;
    sub_5F88(&qword_1C8B8);
    sub_13CF0();

    swift_release();
    swift_release();
    uint64_t v53 = swift_release();
    __chkstk_darwin(v53);
    sub_5F88(&qword_1C8C0);
    uint64_t v81 = v77;
    uint64_t v82 = OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2();
    sub_6A4C(&qword_1C8C8, &qword_1C8C0);
    uint64_t v54 = v74;
    uint64_t v55 = v70;
    uint64_t v56 = v68;
    char v57 = v78;
    sub_13C50();
    swift_release();
    swift_release();
    sub_86B8(v56, v46, v49);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v73 + 8))(v57, v54);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v71 + 32))(v75, v55, v72);
  }
  return result;
}

void sub_114FC(uint64_t a1@<X8>)
{
  sub_138D0();
  sub_8D2C();
  char v22 = (void *)sub_13930();
  char v21 = v2 & 1;
  int v3 = (void *)sub_13930();
  char v5 = v4 & 1;
  uint64_t v6 = (void *)sub_13930();
  char v8 = v7 & 1;
  uint64_t v16 = (void *)sub_13930();
  char v19 = v9 & 1;
  uint64_t v20 = (void *)sub_13930();
  char v17 = v10 & 1;
  uint64_t v11 = (void *)sub_13930();
  char v13 = v12 & 1;
  uint64_t v18 = (void *)sub_13930();
  *(void *)a1 = v22;
  char v15 = v14 & 1;
  *(unsigned char *)(a1 + 8) = v21;
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(unsigned char *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v16;
  *(unsigned char *)(a1 + 56) = v19;
  *(void *)(a1 + 64) = v20;
  *(unsigned char *)(a1 + 72) = v17;
  *(void *)(a1 + 80) = v11;
  *(unsigned char *)(a1 + 88) = v13;
  *(void *)(a1 + 96) = v18;
  *(unsigned char *)(a1 + 104) = v14 & 1;
  sub_5E00(v22, v21);
  sub_5E00(v3, v5);
  sub_5E00(v6, v8);
  sub_5E00(v16, v19);
  sub_5E00(v20, v17);
  sub_5E00(v11, v13);
  sub_5E00(v18, v15);
  sub_5E1C(v18, v15);
  sub_5E1C(v11, v13);
  sub_5E1C(v20, v17);
  sub_5E1C(v16, v19);
  sub_5E1C(v6, v8);
  sub_5E1C(v3, v5);

  sub_5E1C(v22, v21);
}

uint64_t sub_11724()
{
  uint64_t v0 = sub_13600();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_13580();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  char v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_13DF0();
  __chkstk_darwin(v5 - 8);
  sub_5F88(&qword_1C8E8);
  sub_13590();
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_14B60;
  sub_13DE0();
  if (qword_1C228 != -1) {
    swift_once();
  }
  id v7 = [(id)qword_1D158 bundleURL];
  sub_135B0();

  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for LocalizedStringResource.BundleDescription.atURL(_:), v1);
  sub_135F0();
  sub_135A0();
  return v6;
}

uint64_t sub_119BC@<X0>(void **a1@<X0>, char *a2@<X8>)
{
  char v67 = a2;
  uint64_t v65 = sub_5F88(&qword_1C8D0) - 8;
  uint64_t v3 = __chkstk_darwin(v65);
  uint64_t v66 = (uint64_t)v58 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v64 = (char *)v58 - v6;
  __chkstk_darwin(v5);
  uint64_t v72 = (uint64_t)v58 - v7;
  uint64_t v8 = type metadata accessor for AirPlayAndHandoffSettingsList();
  uint64_t v60 = *(void *)(v8 - 8);
  v58[2] = *(void *)(v60 + 64);
  __chkstk_darwin(v8 - 8);
  char v10 = (char *)v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_5F88(&qword_1C520);
  __chkstk_darwin(v11 - 8);
  char v13 = (char *)v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_5F88(&qword_1C2D0);
  uint64_t v73 = *(void *)(v62 - 8);
  uint64_t v14 = __chkstk_darwin(v62);
  uint64_t v63 = (char *)v58 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v59 = (char *)v58 - v17;
  __chkstk_darwin(v16);
  uint64_t v68 = (char *)v58 - v18;
  uint64_t v61 = sub_5F88(&qword_1C8D8);
  uint64_t v71 = *(void *)(v61 - 8);
  uint64_t v19 = __chkstk_darwin(v61);
  uint64_t v70 = (char *)v58 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v69 = (char *)v58 - v21;
  char v22 = a1[1];
  uint64_t v74 = *a1;
  uint64_t v75 = v22;
  v58[1] = sub_5F88(&qword_1C8A8);
  sub_13C90();
  uint64_t v24 = v77;
  uint64_t v23 = v78;
  uint64_t v25 = v79;
  swift_getKeyPath();
  uint64_t v74 = v24;
  uint64_t v75 = v23;
  uint64_t v76 = v25;
  sub_5F88(&qword_1C8B8);
  sub_13CF0();

  swift_release();
  swift_release();
  swift_release();
  sub_13940();
  sub_138E0();
  uint64_t v26 = sub_138F0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v13, 0, 1, v26);
  sub_12C10((uint64_t)a1, (uint64_t)v10);
  unint64_t v27 = (*(unsigned __int8 *)(v60 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80);
  uint64_t v28 = swift_allocObject();
  sub_12C78((uint64_t)v10, v28 + v27);
  sub_13CA0();
  sub_12C10((uint64_t)a1, (uint64_t)v10);
  uint64_t v29 = swift_allocObject();
  sub_12C78((uint64_t)v10, v29 + v27);
  uint64_t v30 = v59;
  sub_13CB0();
  uint64_t v31 = a1[1];
  uint64_t v77 = *a1;
  char v78 = v31;
  sub_13C80();
  uint64_t v32 = v74;
  uint64_t v33 = sub_13830();
  unint64_t v35 = v34;

  swift_bridgeObjectRelease();
  uint64_t v36 = HIBYTE(v35) & 0xF;
  if ((v35 & 0x2000000000000000) == 0) {
    uint64_t v36 = v33 & 0xFFFFFFFFFFFFLL;
  }
  BOOL v37 = v36 == 0;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v39 = swift_allocObject();
  *(unsigned char *)(v39 + 16) = v37;
  uint64_t v40 = v73;
  uint64_t v41 = *(void (**)(char *, char *, uint64_t))(v73 + 16);
  uint64_t v42 = (uint64_t)v64;
  uint64_t v43 = v62;
  v41(v64, v30, v62);
  uint64_t v44 = (uint64_t *)(v42 + *(int *)(v65 + 44));
  *uint64_t v44 = KeyPath;
  v44[1] = (uint64_t)sub_12F44;
  v44[2] = v39;
  uint64_t v45 = *(void (**)(char *, uint64_t))(v40 + 8);
  uint64_t v73 = v40 + 8;
  uint64_t v65 = (uint64_t)v45;
  v45(v30, v43);
  uint64_t v46 = v72;
  sub_12F5C(v42, v72);
  uint64_t v47 = v70;
  char v48 = *(void (**)(char *, char *, uint64_t))(v71 + 16);
  uint64_t v49 = v61;
  v48(v70, v69, v61);
  uint64_t v50 = v63;
  v41(v63, v68, v43);
  uint64_t v51 = v46;
  uint64_t v52 = v66;
  sub_12FC4(v51, v66);
  uint64_t v53 = v67;
  v48(v67, v47, v49);
  uint64_t v54 = sub_5F88(&qword_1C8E0);
  v41(&v53[*(int *)(v54 + 48)], v50, v43);
  sub_12FC4(v52, (uint64_t)&v53[*(int *)(v54 + 64)]);
  sub_620C(v72, &qword_1C8D0);
  uint64_t v55 = (void (*)(char *, uint64_t))v65;
  ((void (*)(char *, uint64_t))v65)(v68, v43);
  uint64_t v56 = *(void (**)(char *, uint64_t))(v71 + 8);
  v56(v69, v49);
  sub_620C(v52, &qword_1C8D0);
  v55(v50, v43);
  return ((uint64_t (*)(char *, uint64_t))v56)(v70, v49);
}

uint64_t sub_12124@<X0>(uint64_t a1@<X8>)
{
  return sub_AAA8(a1);
}

void sub_1214C(uint64_t a1, void (*a2)(uint64_t))
{
  sub_5F88(&qword_1C8A8);
  uint64_t v3 = sub_13C80();
  a2(v3);
}

uint64_t sub_121A4@<X0>(uint64_t a1@<X8>)
{
  return sub_AAA8(a1);
}

uint64_t sub_121BC@<X0>(void *a1@<X8>)
{
  uint64_t v2 = sub_13600();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = sub_13580();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_13DF0();
  __chkstk_darwin(v7 - 8);
  v11[1] = [objc_allocWithZone((Class)sub_138D0()) init];
  sub_13C70();
  uint64_t v8 = v11[3];
  *a1 = v11[2];
  a1[1] = v8;
  type metadata accessor for AirPlayAndHandoffSettingsList();
  sub_13DE0();
  if (qword_1C228 != -1) {
    swift_once();
  }
  id v9 = [(id)qword_1D158 bundleURL];
  sub_135B0();

  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.atURL(_:), v3);
  sub_135F0();
  return sub_135A0();
}

uint64_t type metadata accessor for AirPlayAndHandoffSettingsList()
{
  uint64_t result = qword_1C820;
  if (!qword_1C820) {
    return swift_getSingletonMetadata();
  }
  return result;
}

char *sub_12464(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    *((void *)a1 + 1) = a2[1];
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = &a1[v6];
    uint64_t v8 = (uint64_t)a2 + v6;
    uint64_t v9 = sub_13590();
    char v10 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
    uint64_t v11 = v4;
    swift_retain();
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t sub_12554(id *a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_13590();
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_125D4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_13590();
  char v10 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
  id v11 = v5;
  swift_retain();
  v10(v7, v8, v9);
  return a1;
}

uint64_t sub_12670(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v8 = v6;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_13590();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

_OWORD *sub_12718(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_13590();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_12794(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  swift_release();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_13590();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_12830(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_12844);
}

uint64_t sub_12844(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_13590();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_128F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_12908);
}

void *sub_12908(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_13590();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_129B0()
{
  uint64_t result = sub_13590();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_12A48()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_12A68()
{
  unint64_t result = qword_1C8B0;
  if (!qword_1C8B0)
  {
    sub_5FD4(&qword_1C870);
    sub_5FD4(&qword_1C860);
    sub_6A4C(&qword_1C8A0, &qword_1C860);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C8B0);
  }
  return result;
}

uint64_t sub_12B44@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_13810();
  *a1 = result & 1;
  return result;
}

uint64_t sub_12B74()
{
  return sub_13820();
}

uint64_t sub_12B9C@<X0>(char *a1@<X8>)
{
  return sub_119BC(*(void ***)(v1 + 16), a1);
}

uint64_t sub_12BA4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_13830();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_12BD0()
{
  return sub_13840();
}

uint64_t sub_12C10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AirPlayAndHandoffSettingsList();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_12C78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AirPlayAndHandoffSettingsList();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_12CDC()
{
}

uint64_t sub_12CF8()
{
  uint64_t v1 = (int *)(type metadata accessor for AirPlayAndHandoffSettingsList() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;

  swift_release();
  uint64_t v7 = v6 + v1[7];
  uint64_t v8 = sub_13590();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  return _swift_deallocObject(v0, v4, v5);
}

void sub_12DF4()
{
}

void sub_12E0C(void (*a1)(uint64_t))
{
  uint64_t v3 = *(void *)(type metadata accessor for AirPlayAndHandoffSettingsList() - 8);
  sub_1214C(v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)), a1);
}

uint64_t sub_12E70@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_139E0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_12EA0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_139E0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_12ED0()
{
  return sub_139F0();
}

uint64_t sub_12EF8()
{
  return sub_139F0();
}

unsigned char *sub_12F20(unsigned char *result, char a2)
{
  *result &= a2 ^ 1;
  return result;
}

uint64_t sub_12F34()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_12F44(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_12F5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5F88(&qword_1C8D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_12FC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5F88(&qword_1C8D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1302C()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_13160()
{
  uint64_t v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = type metadata accessor for AirPlayAndHandoffSettingsList();
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (id *)((char *)&v21.receiver - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v21.receiver = v1;
  v21.super_class = ObjectType;
  objc_msgSendSuper2(&v21, "viewDidLoad");
  sub_121BC(v5);
  id v6 = objc_allocWithZone((Class)sub_5F88(&qword_1C918));
  uint64_t v7 = (void *)sub_13AD0();
  if (qword_1C228 != -1) {
    swift_once();
  }
  v8.super.isa = (Class)qword_1D158;
  v22._countAndFlagsBits = 0xD000000000000014;
  v20._countAndFlagsBits = 0x8000000000017630;
  v22._object = (void *)0x8000000000017610;
  v23.value._countAndFlagsBits = 0;
  v23.value._object = 0;
  v24._countAndFlagsBits = 0;
  v24._object = (void *)0xE000000000000000;
  sub_13570(v22, v23, v8, v24, v20);
  NSString v9 = sub_13E00();
  swift_bridgeObjectRelease();
  [v1 setTitle:v9];

  id v10 = [v7 view];
  if (!v10)
  {
    uint64_t v11 = v7;
    goto LABEL_8;
  }
  uint64_t v11 = v10;
  id v12 = [v1 view];
  if (v12)
  {
    char v13 = v12;
    [v12 addSubview:v11];

    id v14 = [v1 view];
    if (v14)
    {
      uint64_t v15 = v14;
      [v14 bounds];
      double v17 = v16;
      double v19 = v18;

      objc_msgSend(v11, "setFrame:", 0.0, 0.0, v17, v19);
      [v11 setAutoresizingMask:18];
      [v1 addChildViewController:v7];
      [v7 didMoveToParentViewController:v1];

LABEL_8:
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

id sub_13514()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AirPlayAndHandoffSettingsRoot()
{
  return self;
}

uint64_t sub_13570(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_13580()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_13590()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_135A0()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_135B0()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_135C0()
{
  return URL.init(string:)();
}

uint64_t sub_135D0()
{
  return type metadata accessor for URL();
}

uint64_t sub_135E0()
{
  return type metadata accessor for Date();
}

uint64_t sub_135F0()
{
  return static Locale.current.getter();
}

uint64_t sub_13600()
{
  return type metadata accessor for Locale();
}

uint64_t sub_13610()
{
  return type metadata accessor for IndexSet.Index();
}

uint64_t sub_13620()
{
  return IndexSet.makeIterator()();
}

uint64_t sub_13630()
{
  return type metadata accessor for IndexSet();
}

uint64_t sub_13640()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_13650()
{
  return CompanionDevice.SessionInfo.end.getter();
}

uint64_t sub_13660()
{
  return CompanionDevice.SessionInfo.start.getter();
}

uint64_t sub_13670()
{
  return type metadata accessor for CompanionDevice.SessionInfo();
}

uint64_t sub_13680()
{
  return CompanionDevice.latestSessionInfo.getter();
}

uint64_t sub_13690()
{
  return CompanionDevice.name.getter();
}

uint64_t sub_136A0()
{
  return type metadata accessor for CompanionDevice();
}

uint64_t sub_136B0()
{
  return static AirPlayMode.allCases.getter();
}

uint64_t sub_136C0()
{
  return type metadata accessor for AirPlayMode();
}

uint64_t sub_136D0()
{
  return AirPlayAndHandoffSettingsState.isTogglingHandoff.getter();
}

uint64_t sub_136E0()
{
  return AirPlayAndHandoffSettingsState.showTurnOffHandoffAlert.getter();
}

uint64_t sub_136F0()
{
  return AirPlayAndHandoffSettingsState.showTurnOffHandoffAlert.setter();
}

uint64_t sub_13700()
{
  return AirPlayAndHandoffSettingsState.linkKeyboardAndMouseEnabled.getter();
}

uint64_t sub_13710()
{
  return AirPlayAndHandoffSettingsState.linkKeyboardAndMouseEnabled.setter();
}

uint64_t sub_13720()
{
  return AirPlayAndHandoffSettingsState.automaticallyAirPlayMode.getter();
}

uint64_t sub_13730()
{
  return AirPlayAndHandoffSettingsState.automaticallyAirPlayMode.setter();
}

uint64_t sub_13740()
{
  return AirPlayAndHandoffSettingsState.airPlayReceiverEnabled.getter();
}

uint64_t sub_13750()
{
  return AirPlayAndHandoffSettingsState.airPlayReceiverEnabled.setter();
}

uint64_t sub_13760()
{
  return AirPlayAndHandoffSettingsState.accessMode.getter();
}

uint64_t sub_13770()
{
  return AirPlayAndHandoffSettingsState.accessMode.setter();
}

uint64_t sub_13780()
{
  return AirPlayAndHandoffSettingsState.durationOf(start:end:)();
}

uint64_t sub_13790()
{
  return AirPlayAndHandoffSettingsState.handoffEnabled.getter();
}

uint64_t sub_137A0()
{
  return AirPlayAndHandoffSettingsState.handoffEnabled.setter();
}

uint64_t sub_137B0()
{
  return AirPlayAndHandoffSettingsState.onenessDevices.modify();
}

uint64_t sub_137C0()
{
  return AirPlayAndHandoffSettingsState.onenessDevices.getter();
}

uint64_t sub_137D0()
{
  return AirPlayAndHandoffSettingsState.formatStartDate(start:)();
}

uint64_t sub_137E0()
{
  return AirPlayAndHandoffSettingsState.requirePassword.getter();
}

uint64_t sub_137F0()
{
  return AirPlayAndHandoffSettingsState.requirePassword.setter();
}

uint64_t sub_13800()
{
  return AirPlayAndHandoffSettingsState.showPasswordAlert.modify();
}

uint64_t sub_13810()
{
  return AirPlayAndHandoffSettingsState.showPasswordAlert.getter();
}

uint64_t sub_13820()
{
  return AirPlayAndHandoffSettingsState.showPasswordAlert.setter();
}

uint64_t sub_13830()
{
  return AirPlayAndHandoffSettingsState.secureFieldPassword.getter();
}

uint64_t sub_13840()
{
  return AirPlayAndHandoffSettingsState.secureFieldPassword.setter();
}

uint64_t sub_13850()
{
  return AirPlayAndHandoffSettingsState.isContinuityRestricted.getter();
}

uint64_t sub_13860()
{
  return AirPlayAndHandoffSettingsState.continuityCameraEnabled.getter();
}

uint64_t sub_13870()
{
  return AirPlayAndHandoffSettingsState.continuityCameraEnabled.setter();
}

uint64_t sub_13880()
{
  return AirPlayAndHandoffSettingsState.transferToHomePodEnabled.getter();
}

uint64_t sub_13890()
{
  return AirPlayAndHandoffSettingsState.transferToHomePodEnabled.setter();
}

uint64_t sub_138A0()
{
  return AirPlayAndHandoffSettingsState.isTogglingRequirePassword.getter();
}

uint64_t sub_138B0()
{
  return AirPlayAndHandoffSettingsState.isContinuityCameraSupported.getter();
}

uint64_t sub_138D0()
{
  return type metadata accessor for AirPlayAndHandoffSettingsState();
}

uint64_t sub_138E0()
{
  return static ButtonRole.cancel.getter();
}

uint64_t sub_138F0()
{
  return type metadata accessor for ButtonRole();
}

uint64_t sub_13900()
{
  return EditButton.init()();
}

uint64_t sub_13910()
{
  return type metadata accessor for EditButton();
}

uint64_t sub_13920()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_13930()
{
  return Environment.init<A>(_:)();
}

uint64_t sub_13940()
{
  return SecureField.init(text:prompt:label:)();
}

uint64_t sub_13950()
{
  return PickerOption.init(value:content:)();
}

uint64_t sub_13960()
{
  return ProgressView<>.init<>()();
}

void sub_13970()
{
}

uint64_t sub_13980()
{
  return type metadata accessor for DismissAction();
}

uint64_t sub_13990()
{
  return dispatch thunk of PickerContent._identifiedView.getter();
}

uint64_t sub_139A0()
{
  return LabeledContent<>.init(content:label:)();
}

uint64_t sub_139B0()
{
  return NavigationLink.init(destination:label:)();
}

uint64_t sub_139C0()
{
  return static SafeAreaRegions.keyboard.getter();
}

uint64_t sub_139D0()
{
  return EnvironmentValues.dismiss.getter();
}

uint64_t sub_139E0()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t sub_139F0()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t sub_13A00()
{
  return EnvironmentValues.init()();
}

uint64_t sub_13A10()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_13A20()
{
  return InlinePickerStyle.init()();
}

uint64_t sub_13A30()
{
  return type metadata accessor for InlinePickerStyle();
}

uint64_t sub_13A40()
{
  return LocalizedStringKey.StringInterpolation.appendInterpolation<A>(_:specifier:)();
}

void sub_13A50(Swift::String a1)
{
}

void sub_13A60(Swift::String a1)
{
}

uint64_t sub_13A70()
{
  return LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_13A80()
{
  return type metadata accessor for LocalizedStringKey.StringInterpolation();
}

uint64_t sub_13A90()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_13AA0()
{
  return LocalizedStringKey.init(stringInterpolation:)();
}

uint64_t sub_13AB0()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_13AC0()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_13AD0()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_13AE0()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_13AF0()
{
  return static HierarchicalShapeStyle.secondary.getter();
}

uint64_t sub_13B00()
{
  return static AccessibilityChildBehavior.combine.getter();
}

uint64_t sub_13B10()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t sub_13B20()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_13B30()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_13B40()
{
  return static Font.subheadline.getter();
}

uint64_t sub_13B50()
{
  return List<>.init(content:)();
}

uint64_t sub_13B60()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t sub_13B70()
{
  return Text.font(_:)();
}

uint64_t sub_13B80()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_13B90()
{
  return Text.init<A>(_:)();
}

uint64_t sub_13BA0()
{
  return View.settingsListAppearance()();
}

uint64_t sub_13BB0()
{
  return View.emitNavigationEventOnAppearForSystemSetting(icon:title:localizedNavigationComponents:deepLink:)();
}

uint64_t sub_13BC0()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_13BD0()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_13BE0()
{
  return View.environment<A>(_:)();
}

uint64_t sub_13BF0()
{
  return View.pickerStyle<A>(_:)();
}

uint64_t sub_13C00()
{
  return View.labelsHidden()();
}

uint64_t sub_13C10()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_13C20()
{
  return View.navigationTitle(_:)();
}

uint64_t sub_13C30()
{
  return View.accessibilityElement(children:)();
}

uint64_t sub_13C40()
{
  return View.alert<A, B>(_:isPresented:actions:message:)();
}

uint64_t sub_13C50()
{
  return View.alert<A>(_:isPresented:actions:)();
}

uint64_t sub_13C60()
{
  return View.toolbar<A>(content:)();
}

uint64_t sub_13C70()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_13C80()
{
  return State.wrappedValue.getter();
}

uint64_t sub_13C90()
{
  return State.projectedValue.getter();
}

uint64_t sub_13CA0()
{
  return Button.init(role:action:label:)();
}

uint64_t sub_13CB0()
{
  return Button.init(action:label:)();
}

uint64_t sub_13CC0()
{
  return Picker<>.init<A>(_:selection:content:)();
}

uint64_t sub_13CD0()
{
  return Picker<>.init(_:selection:content:)();
}

uint64_t sub_13CE0()
{
  return Toggle.init(isOn:label:)();
}

uint64_t sub_13CF0()
{
  return Binding.subscript.getter();
}

uint64_t sub_13D00()
{
  return Binding.animation(_:)();
}

uint64_t sub_13D10()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_13D20()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_13D30()
{
  return Section<>.init(header:footer:content:)();
}

uint64_t sub_13D40()
{
  return Section<>.init(content:)();
}

uint64_t sub_13D50()
{
  return Section<>.init(footer:content:)();
}

uint64_t sub_13D60()
{
  return Bindable.wrappedValue.getter();
}

uint64_t sub_13D70()
{
  return Bindable.projectedValue.getter();
}

uint64_t sub_13D80()
{
  return Bindable<A>.init(wrappedValue:)();
}

uint64_t sub_13D90()
{
  return Bindable<A>.subscript.getter();
}

uint64_t sub_13DA0()
{
  return static Alignment.center.getter();
}

uint64_t sub_13DB0()
{
  return static Animation.default.getter();
}

uint64_t sub_13DC0()
{
  return type metadata accessor for SettingsEventImage();
}

uint64_t sub_13DD0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_13DE0()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_13DF0()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_13E00()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_13E10()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Int sub_13E20()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_13E30()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_13E40()
{
  return static MainActor.shared.getter();
}

uint64_t sub_13E50()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_13E60()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_13E70()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_13E80()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t sub_13E90()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t sub_13EA0()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t sub_13EB0()
{
  return RangeReplaceableCollection<>.remove(atOffsets:)();
}

uint64_t sub_13EC0()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_13ED0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_13EE0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_13EF0()
{
  return Hasher.init(_seed:)();
}

void sub_13F00(Swift::UInt a1)
{
}

Swift::Int sub_13F10()
{
  return Hasher._finalize()();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
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

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_projectBox()
{
  return _swift_projectBox();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}