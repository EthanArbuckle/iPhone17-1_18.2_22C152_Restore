uint64_t *sub_480C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    a1[1] = a2[1];
    v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    swift_retain();
    swift_retain();
    sub_49D4(&qword_14408);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v11 = sub_DCB8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    }
    else
    {
      *v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v12 = *(int *)(a3 + 24);
    v13 = (uint64_t *)((char *)a1 + v12);
    v14 = (uint64_t *)((char *)a2 + v12);
    sub_49D4(&qword_14410);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v15 = sub_DC98();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    }
    else
    {
      *v13 = *v14;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_49D4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_4A18(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  sub_49D4(&qword_14408);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_DCB8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  sub_49D4(&qword_14410);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_DC98();
    v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    return v8(v6, v7);
  }
  else
  {
    return swift_release();
  }
}

void *sub_4B50(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  v8 = (void *)((char *)a1 + v7);
  v9 = (void *)((char *)a2 + v7);
  swift_retain();
  swift_retain();
  sub_49D4(&qword_14408);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_DCB8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    void *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = *(int *)(a3 + 24);
  v12 = (void *)((char *)a1 + v11);
  v13 = (void *)((char *)a2 + v11);
  sub_49D4(&qword_14410);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = sub_DC98();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  }
  else
  {
    void *v12 = *v13;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_4CC0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (void *)((char *)a1 + v6);
    v8 = (void *)((char *)a2 + v6);
    sub_84C8((uint64_t)a1 + v6, &qword_14408);
    sub_49D4(&qword_14408);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_DCB8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v10 = *(int *)(a3 + 24);
    uint64_t v11 = (void *)((char *)a1 + v10);
    v12 = (void *)((char *)a2 + v10);
    sub_84C8((uint64_t)a1 + v10, &qword_14410);
    sub_49D4(&qword_14410);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_DC98();
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

_OWORD *sub_4E74(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  uint64_t v9 = sub_49D4(&qword_14408);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_DCB8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  uint64_t v11 = *(int *)(a3 + 24);
  v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_49D4(&qword_14410);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_DC98();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v12, v13, v15);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
  }
  return a1;
}

void *sub_4FF8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    sub_84C8((uint64_t)a1 + v6, &qword_14408);
    uint64_t v9 = sub_49D4(&qword_14408);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_DCB8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
    uint64_t v11 = *(int *)(a3 + 24);
    v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    sub_84C8((uint64_t)a1 + v11, &qword_14410);
    uint64_t v14 = sub_49D4(&qword_14410);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v15 = sub_DC98();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v12, v13, v15);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_51BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_51D0);
}

uint64_t sub_51D0(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_49D4(&qword_14418);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
      v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_49D4(&qword_14420);
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      v16 = (char *)a1 + *(int *)(a3 + 24);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_5304(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_5318);
}

void *sub_5318(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_49D4(&qword_14418);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)v5 + *(int *)(a4 + 20);
      v12 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return (void *)v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_49D4(&qword_14420);
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      v16 = (char *)v5 + *(int *)(a4 + 24);
      return (void *)v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t type metadata accessor for PaymentContactlessView()
{
  uint64_t result = qword_14480;
  if (!qword_14480) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_5498()
{
  sub_55A4(319, &qword_14490, (void (*)(uint64_t))&type metadata accessor for AppendSettingsNavigationPathAction);
  if (v0 <= 0x3F)
  {
    sub_55A4(319, (unint64_t *)&unk_14498, (void (*)(uint64_t))&type metadata accessor for ClearSettingsNavigationPathAction);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_55A4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_DCF8();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_55F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_5614@<X0>(uint64_t a1@<X8>)
{
  uint64_t v31 = a1;
  uint64_t v2 = type metadata accessor for PaymentContactlessView();
  uint64_t v26 = *(void *)(v2 - 8);
  __chkstk_darwin(v2 - 8);
  uint64_t v27 = v3;
  uint64_t v29 = (uint64_t)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_49D4(&qword_144D0);
  uint64_t v4 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_49D4(&qword_144D8);
  uint64_t v7 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = v1;
  uint64_t v32 = v1;
  sub_49D4(&qword_144E0);
  sub_7468();
  sub_DD98();
  sub_DD58();
  if (qword_14400 != -1) {
    swift_once();
  }
  id v10 = (id)qword_14AF0;
  uint64_t v11 = sub_DDA8();
  uint64_t v13 = v12;
  char v15 = v14 & 1;
  sub_86E0(&qword_14540, &qword_144D0);
  uint64_t v16 = v25;
  sub_DDE8();
  sub_7744(v11, v13, v15);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v16);
  uint64_t v17 = v29;
  sub_7754(v30, v29);
  unint64_t v18 = (*(unsigned __int8 *)(v26 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
  uint64_t v19 = swift_allocObject();
  sub_77BC(v17, v19 + v18);
  uint64_t v20 = v31;
  uint64_t v21 = v28;
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 16))(v31, v9, v28);
  v22 = (uint64_t (**)())(v20 + *(int *)(sub_49D4(&qword_14548) + 36));
  *v22 = sub_7820;
  v22[1] = (uint64_t (*)())v19;
  v22[2] = 0;
  v22[3] = 0;
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v21);
}

uint64_t sub_59F8()
{
  return sub_DE38();
}

uint64_t sub_5AA0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PaymentContactlessView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  uint64_t v11 = *(void *)(a1 + 8);
  sub_49D4(&qword_14560);
  sub_DE18();
  swift_getKeyPath();
  uint64_t v10 = v12;
  sub_856C(&qword_14570, (void (*)(uint64_t))type metadata accessor for PaymentContactlessModel);
  sub_DC18();
  swift_release();
  uint64_t v5 = *(void *)(v12 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v10 = v5;
  sub_7754(a1, (uint64_t)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = swift_allocObject();
  sub_77BC((uint64_t)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6);
  sub_49D4(&qword_14578);
  sub_49D4(&qword_14508);
  sub_86E0(&qword_14580, &qword_14578);
  sub_7568();
  sub_856C(&qword_14588, (void (*)(uint64_t))sub_841C);
  return sub_DE28();
}

uint64_t sub_5D04@<X0>(id *a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v135 = a3;
  sub_49D4(&qword_14598);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v122 = (uint64_t)&v118 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v132 = sub_49D4(&qword_145A0);
  ((void (*)(void))__chkstk_darwin)();
  v133 = (char *)&v118 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v125 = sub_49D4(&qword_145A8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v126 = (uint64_t)&v118 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_49D4(&qword_145B0);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  v119 = (char *)&v118 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v118 - v10;
  uint64_t v12 = sub_49D4(&qword_145B8);
  uint64_t v129 = *(void *)(v12 - 8);
  uint64_t v130 = v12;
  uint64_t v13 = __chkstk_darwin(v12);
  char v15 = (char *)&v118 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v13);
  v121 = (char *)&v118 - v17;
  __chkstk_darwin(v16);
  v127 = (char *)&v118 - v18;
  uint64_t v131 = sub_49D4(&qword_14538);
  uint64_t v19 = __chkstk_darwin(v131);
  uint64_t v21 = (char *)&v118 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v19);
  uint64_t v24 = (char *)&v118 - v23;
  uint64_t v25 = __chkstk_darwin(v22);
  v118 = (char *)&v118 - v26;
  uint64_t v27 = __chkstk_darwin(v25);
  uint64_t v120 = (uint64_t)&v118 - v28;
  uint64_t v29 = __chkstk_darwin(v27);
  uint64_t v31 = (char *)&v118 - v30;
  __chkstk_darwin(v29);
  uint64_t v123 = (uint64_t)&v118 - v32;
  uint64_t v134 = sub_49D4(&qword_14518);
  uint64_t v33 = __chkstk_darwin(v134);
  v124 = (char *)&v118 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v33);
  uint64_t v128 = (uint64_t)&v118 - v35;
  id v36 = *a1;
  id v37 = [*a1 bundleId];
  if (!v37) {
    goto LABEL_5;
  }
  v38 = v37;
  uint64_t v39 = sub_DEA8();
  uint64_t v41 = v40;

  if (v39 == 0xD000000000000012 && v41 == 0x800000000000F500) {
    goto LABEL_8;
  }
  char v42 = sub_E048();
  swift_bridgeObjectRelease();
  if ((v42 & 1) == 0)
  {
LABEL_5:
    id v43 = [v36 bundleId];
    if (v43)
    {
      v44 = v43;
      uint64_t v45 = sub_DEA8();
      uint64_t v47 = v46;

      if (v45 == 0xD000000000000016 && v47 == 0x800000000000F4A0)
      {
LABEL_8:
        swift_bridgeObjectRelease();
        goto LABEL_9;
      }
      char v84 = sub_E048();
      swift_bridgeObjectRelease();
      if (v84) {
        goto LABEL_9;
      }
    }
    uint64_t v85 = *((void *)a2 + 1);
    uint64_t v136 = *(void *)a2;
    uint64_t v137 = v85;
    sub_49D4(&qword_14560);
    sub_DE18();
    sub_8B70(v36, v122);
    uint64_t v86 = swift_release();
    __chkstk_darwin(v86);
    v117._countAndFlagsBits = (uint64_t)a2;
    v117._object = v36;
    sub_49D4(&qword_145C0);
    sub_DC88();
    sub_86E0(&qword_145C8, &qword_145C0);
    sub_856C(&qword_145D0, (void (*)(uint64_t))&type metadata accessor for SettingsAnyViewRecipe);
    sub_DD08();
    id v87 = [v36 bundleId];
    if (v87)
    {
      v88 = v87;
      uint64_t v89 = sub_DEA8();
      uint64_t v91 = v90;
    }
    else
    {
      uint64_t v89 = 0;
      uint64_t v91 = 0;
    }
    uint64_t v101 = (uint64_t)v133;
    uint64_t v102 = v130;
    uint64_t v103 = v131;
    uint64_t v104 = v129;
    (*(void (**)(char *, char *, uint64_t))(v129 + 16))(v21, v15, v130);
    v105 = (uint64_t *)&v21[*(int *)(v103 + 52)];
    uint64_t *v105 = v89;
    v105[1] = v91;
    (*(void (**)(char *, uint64_t))(v104 + 8))(v15, v102);
    v106 = &qword_14538;
    sub_85B4((uint64_t)v21, (uint64_t)v24, &qword_14538);
    sub_8464((uint64_t)v24, v101, &qword_14538);
    swift_storeEnumTagMultiPayload();
    sub_7640(&qword_14510, &qword_14518, (void (*)(void))sub_76AC);
    sub_86E0(&qword_14530, &qword_14538);
    sub_DD78();
    uint64_t v107 = (uint64_t)v24;
    return sub_84C8(v107, v106);
  }
LABEL_9:
  uint64_t v48 = *((void *)a2 + 1);
  uint64_t v136 = *(void *)a2;
  uint64_t v137 = v48;
  sub_49D4(&qword_14560);
  sub_DE18();
  uint64_t v49 = v138;
  swift_getKeyPath();
  uint64_t v136 = v49;
  sub_856C(&qword_14570, (void (*)(uint64_t))type metadata accessor for PaymentContactlessModel);
  sub_DC18();
  swift_release();
  int v50 = *(unsigned __int8 *)(v49 + 24);
  swift_release();
  if (v50 == 1)
  {
    if (qword_14400 != -1) {
      swift_once();
    }
    v51.super.isa = (Class)qword_14AF0;
    v117._countAndFlagsBits = 0x800000000000F4E0;
    v139._countAndFlagsBits = 0x74656C6C6157;
    v139._object = (void *)0xE600000000000000;
    v141.value._countAndFlagsBits = 0;
    v141.value._object = 0;
    v143._countAndFlagsBits = 0;
    v143._object = (void *)0xE000000000000000;
    uint64_t v52 = sub_DBE8(v139, v141, v51, v143, v117);
    v54 = v53;
    uint64_t v55 = *((void *)a2 + 1);
    uint64_t v136 = *(void *)a2;
    uint64_t v137 = v55;
    sub_DE18();
    sub_89C8();
    swift_release();
    uint64_t v56 = sub_DC68();
    uint64_t v57 = (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v56 - 8) + 56))(v11, 0, 1, v56);
    __chkstk_darwin(v57);
    *(&v118 - 4) = a2;
    *(&v118 - 3) = (char *)v36;
    v117._countAndFlagsBits = v52;
    v117._object = v54;
    sub_49D4(&qword_145C0);
    sub_86E0(&qword_145C8, &qword_145C0);
    sub_856C(&qword_145D8, (void (*)(uint64_t))&type metadata accessor for PreferencesControllerRecipe);
    sub_DD08();
    swift_bridgeObjectRelease();
    id v58 = [v36 bundleId];
    if (v58)
    {
      v59 = v58;
      uint64_t v60 = sub_DEA8();
      uint64_t v62 = v61;
    }
    else
    {
      uint64_t v60 = 0;
      uint64_t v62 = 0;
    }
    uint64_t v83 = (uint64_t)v133;
    uint64_t v92 = v130;
    uint64_t v93 = v131;
    uint64_t v94 = v129;
    v95 = v127;
    (*(void (**)(char *, char *, uint64_t))(v129 + 16))(v31, v127, v130);
    v96 = (uint64_t *)&v31[*(int *)(v93 + 52)];
    uint64_t *v96 = v60;
    v96[1] = v62;
    (*(void (**)(char *, uint64_t))(v94 + 8))(v95, v92);
    uint64_t v97 = (uint64_t)v31;
    uint64_t v98 = v123;
    sub_85B4(v97, v123, &qword_14538);
    sub_8464(v98, v126, &qword_14538);
    swift_storeEnumTagMultiPayload();
    sub_86E0(&qword_14530, &qword_14538);
    uint64_t v99 = (uint64_t)v124;
    sub_DD78();
    sub_84C8(v98, &qword_14538);
    uint64_t v100 = sub_49D4(&qword_14528);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v100 - 8) + 56))(v99, 0, 1, v100);
    uint64_t v82 = v128;
    sub_85B4(v99, v128, &qword_14518);
  }
  else
  {
    uint64_t v63 = *((void *)a2 + 1);
    uint64_t v136 = *(void *)a2;
    uint64_t v137 = v63;
    sub_DE18();
    uint64_t v64 = v138;
    swift_getKeyPath();
    uint64_t v136 = v64;
    sub_DC18();
    swift_release();
    int v65 = *(unsigned __int8 *)(v64 + 24);
    swift_release();
    if (v65 == 2)
    {
      if (qword_14400 != -1) {
        swift_once();
      }
      v66.super.isa = (Class)qword_14AF0;
      v117._countAndFlagsBits = 0x800000000000F4E0;
      v140._object = (void *)0x800000000000F4C0;
      v140._countAndFlagsBits = 0xD000000000000012;
      v142.value._countAndFlagsBits = 0;
      v142.value._object = 0;
      v144._countAndFlagsBits = 0;
      v144._object = (void *)0xE000000000000000;
      uint64_t v67 = sub_DBE8(v140, v142, v66, v144, v117);
      v69 = v68;
      uint64_t v70 = *((void *)a2 + 1);
      uint64_t v136 = *(void *)a2;
      uint64_t v137 = v70;
      sub_DE18();
      v71 = v119;
      sub_89C8();
      swift_release();
      uint64_t v72 = sub_DC68();
      uint64_t v73 = (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v72 - 8) + 56))(v71, 0, 1, v72);
      __chkstk_darwin(v73);
      *(&v118 - 4) = a2;
      *(&v118 - 3) = (char *)v36;
      v117._countAndFlagsBits = v67;
      v117._object = v69;
      sub_49D4(&qword_145C0);
      sub_86E0(&qword_145C8, &qword_145C0);
      sub_856C(&qword_145D8, (void (*)(uint64_t))&type metadata accessor for PreferencesControllerRecipe);
      v74 = v121;
      sub_DD08();
      swift_bridgeObjectRelease();
      id v75 = [v36 bundleId];
      uint64_t v76 = v131;
      if (v75)
      {
        v77 = v75;
        uint64_t v78 = sub_DEA8();
        uint64_t v80 = v79;
      }
      else
      {
        uint64_t v78 = 0;
        uint64_t v80 = 0;
      }
      uint64_t v83 = (uint64_t)v133;
      uint64_t v109 = v129;
      uint64_t v108 = v130;
      uint64_t v110 = (uint64_t)v118;
      (*(void (**)(char *, char *, uint64_t))(v129 + 16))(v118, v74, v130);
      v111 = (uint64_t *)(v110 + *(int *)(v76 + 52));
      uint64_t *v111 = v78;
      v111[1] = v80;
      (*(void (**)(char *, uint64_t))(v109 + 8))(v74, v108);
      uint64_t v112 = v120;
      sub_85B4(v110, v120, &qword_14538);
      sub_8464(v112, v126, &qword_14538);
      swift_storeEnumTagMultiPayload();
      sub_86E0(&qword_14530, &qword_14538);
      v113 = v124;
      sub_DD78();
      sub_84C8(v112, &qword_14538);
      uint64_t v114 = sub_49D4(&qword_14528);
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v114 - 8) + 56))(v113, 0, 1, v114);
      uint64_t v115 = (uint64_t)v113;
      uint64_t v82 = v128;
      sub_85B4(v115, v128, &qword_14518);
    }
    else
    {
      uint64_t v81 = sub_49D4(&qword_14528);
      uint64_t v82 = v128;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v81 - 8) + 56))(v128, 1, 1, v81);
      uint64_t v83 = (uint64_t)v133;
    }
  }
  v106 = &qword_14518;
  sub_8464(v82, v83, &qword_14518);
  swift_storeEnumTagMultiPayload();
  sub_7640(&qword_14510, &qword_14518, (void (*)(void))sub_76AC);
  sub_86E0(&qword_14530, &qword_14538);
  sub_DD78();
  uint64_t v107 = v82;
  return sub_84C8(v107, v106);
}

uint64_t sub_6D40()
{
  return sub_DDF8();
}

uint64_t sub_6E0C()
{
  return sub_DDF8();
}

uint64_t sub_6EE8(uint64_t *a1)
{
  uint64_t v2 = sub_49D4(&qword_14550);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_49D4(&qword_14558);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = a1[1];
  uint64_t v18 = *a1;
  uint64_t v19 = v8;
  sub_49D4(&qword_14560);
  sub_DE18();
  uint64_t v9 = v20;
  type metadata accessor for PaymentContactlessView();
  sub_79F8(&qword_14408, (uint64_t (*)(void))&type metadata accessor for AppendSettingsNavigationPathAction, 0xD000000000000022, 0x800000000000F470, (uint64_t)v7);
  uint64_t v10 = sub_DCB8();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 0, 1, v10);
  uint64_t v11 = v9 + OBJC_IVAR____TtC26PaymentContactlessUIPlugin23PaymentContactlessModel_appendSettingsNavigationPath;
  swift_beginAccess();
  sub_7C80((uint64_t)v7, v11, &qword_14558);
  swift_endAccess();
  swift_release();
  uint64_t v12 = a1[1];
  uint64_t v18 = *a1;
  uint64_t v19 = v12;
  sub_DE18();
  uint64_t v13 = v20;
  sub_79F8(&qword_14410, (uint64_t (*)(void))&type metadata accessor for ClearSettingsNavigationPathAction, 0xD000000000000021, 0x800000000000F440, (uint64_t)v4);
  uint64_t v14 = sub_DC98();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v4, 0, 1, v14);
  uint64_t v15 = v13 + OBJC_IVAR____TtC26PaymentContactlessUIPlugin23PaymentContactlessModel_clearSettingsNavigationPath;
  swift_beginAccess();
  sub_7C80((uint64_t)v4, v15, &qword_14550);
  swift_endAccess();
  swift_release();
  uint64_t v16 = a1[1];
  uint64_t v18 = *a1;
  uint64_t v19 = v16;
  sub_DE18();
  sub_8DA4();
  return swift_release();
}

id sub_71D4@<X0>(id a1@<X2>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
LABEL_5:
    id result = (id)sub_DD78();
    *(_OWORD *)a3 = v6;
    *(_OWORD *)(a3 + 16) = v7;
    *(unsigned char *)(a3 + 32) = v8;
    return result;
  }
  id result = [a1 localizedDisplayName];
  if (result)
  {
    uint64_t v5 = result;
    sub_DEA8();

    goto LABEL_5;
  }
  __break(1u);
  return result;
}

id sub_72A8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_49D4(&qword_145E8);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  long long v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = [a1 bundleId];
  if (result)
  {
    uint64_t v9 = result;
    sub_DEA8();

    id v10 = objc_allocWithZone((Class)ISIcon);
    NSString v11 = sub_DE98();
    swift_bridgeObjectRelease();
    [v10 initWithBundleIdentifier:v11];

    id v12 = [self imageDescriptorNamed:kISImageDescriptorTableUIName];
    sub_DCC8();
    return (id)(*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_7440()
{
  return sub_DDD8();
}

uint64_t sub_7460()
{
  return sub_59F8();
}

unint64_t sub_7468()
{
  unint64_t result = qword_144E8;
  if (!qword_144E8)
  {
    sub_7520(&qword_144E0);
    sub_7640(&qword_144F0, &qword_144F8, (void (*)(void))sub_7568);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_144E8);
  }
  return result;
}

uint64_t sub_7520(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_7568()
{
  unint64_t result = qword_14500;
  if (!qword_14500)
  {
    sub_7520(&qword_14508);
    sub_7640(&qword_14510, &qword_14518, (void (*)(void))sub_76AC);
    sub_86E0(&qword_14530, &qword_14538);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14500);
  }
  return result;
}

uint64_t sub_7640(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_7520(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_76AC()
{
  unint64_t result = qword_14520;
  if (!qword_14520)
  {
    sub_7520(&qword_14528);
    sub_86E0(&qword_14530, &qword_14538);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14520);
  }
  return result;
}

uint64_t sub_7744(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_7754(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PaymentContactlessView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_77BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PaymentContactlessView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_7820()
{
  uint64_t v1 = *(void *)(type metadata accessor for PaymentContactlessView() - 8);
  uint64_t v2 = (uint64_t *)(v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));

  return sub_6EE8(v2);
}

uint64_t sub_7880@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_856C(&qword_14570, (void (*)(uint64_t))type metadata accessor for PaymentContactlessModel);
  sub_DC18();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 24);
  return result;
}

uint64_t sub_7928()
{
  return swift_release();
}

uint64_t sub_79F8@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  unint64_t v23 = a4;
  uint64_t v9 = v5;
  uint64_t v11 = sub_DD48();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_49D4(a1);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_8464(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    os_log_type_t v20 = sub_DF28();
    uint64_t v21 = sub_DD88();
    if (os_log_type_enabled(v21, v20))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 136315138;
      *(void *)(v22 + 4) = sub_7CE4(a3, v23, &v24);
      _os_log_impl(&dword_0, v21, v20, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v22, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_DD38();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_7C80(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_49D4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

unint64_t sub_7CE4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_7DB8(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_7F08((uint64_t)v12, *a3);
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
      sub_7F08((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_7EB8((uint64_t)v12);
  return v7;
}

unint64_t sub_7DB8(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    unint64_t result = (unint64_t)sub_7F64(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_DFF8();
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

uint64_t sub_7EB8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_7F08(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

char *sub_7F64(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (char *)sub_7FFC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_8100(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_8100((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 1;
  v2[v4 + 32] = 0;
  return v2;
}

void *sub_7FFC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_8098(v2, 0);
      unint64_t result = (void *)sub_DFD8();
      if (v5) {
        break;
      }
      if (result == (void *)v2) {
        return v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_DEB8();
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

void *sub_8098(uint64_t a1, uint64_t a2)
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
  sub_49D4(&qword_14568);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_8100(char *result, int64_t a2, char a3, char *a4)
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
    sub_49D4(&qword_14568);
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
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_81F0()
{
  return sub_5AA0(*(void *)(v0 + 16));
}

uint64_t sub_8204()
{
  uint64_t v1 = type metadata accessor for PaymentContactlessView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_release();
  swift_release();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 20);
  sub_49D4(&qword_14408);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_DCB8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v0 + v3 + *(int *)(v1 + 24);
  sub_49D4(&qword_14410);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_DC98();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_839C@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for PaymentContactlessView() - 8);
  uint64_t v6 = (char *)(v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)));

  return sub_5D04(a1, v6, a2);
}

unint64_t sub_841C()
{
  unint64_t result = qword_14590;
  if (!qword_14590)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_14590);
  }
  return result;
}

uint64_t sub_845C()
{
  return sub_6E0C();
}

uint64_t sub_8464(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_49D4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_84C8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_49D4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_8524()
{
  return sub_6D40();
}

uint64_t sub_856C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_85B4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_49D4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_8618()
{
  return sub_6D40();
}

id sub_8660@<X0>(uint64_t a1@<X8>)
{
  return sub_71D4(*(id *)(v1 + 32), *(void *)(v1 + 24), a1);
}

id sub_866C@<X0>(uint64_t a1@<X8>)
{
  return sub_72A8(*(void **)(v1 + 16), a1);
}

unint64_t sub_8674()
{
  unint64_t result = qword_145F0;
  if (!qword_145F0)
  {
    sub_7520(&qword_145E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_145F0);
  }
  return result;
}

uint64_t sub_86E0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_7520(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_8724()
{
  return sub_926C(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

unint64_t sub_8748()
{
  unint64_t result = qword_14600;
  if (!qword_14600)
  {
    sub_7520(&qword_14548);
    sub_7520(&qword_144D0);
    sub_86E0(&qword_14540, &qword_144D0);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14600);
  }
  return result;
}

id sub_882C()
{
  type metadata accessor for PaymentContactlessUIPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_14AF0 = (uint64_t)result;
  return result;
}

uint64_t sub_8884()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_8928()
{
  swift_getKeyPath();
  sub_CC10(&qword_14570, (void (*)(uint64_t))type metadata accessor for PaymentContactlessModel);
  sub_DC18();
  swift_release();
  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t sub_89C8()
{
  sub_DF68();
  __chkstk_darwin();
  swift_bridgeObjectRetain();
  NSString v0 = sub_DE98();
  swift_bridgeObjectRelease();
  id v1 = [objc_allocWithZone((Class)PSSpecifier) initWithName:v0 target:0 set:0 get:0 detail:0 cell:1 edit:0];

  if (v1)
  {
    NSString v2 = sub_DE98();
    [v1 setIdentifier:v2];

    sub_DF58();
    return sub_DC58();
  }
  else
  {
    uint64_t result = sub_E008();
    __break(1u);
  }
  return result;
}

uint64_t sub_8B70@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = [a1 bundleId];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_DEA8();
    uint64_t v7 = v6;

    if ((v5 != 0xD000000000000012 || v7 != 0x800000000000F500)
      && (sub_E048() & 1) == 0
      && (v5 != 0xD000000000000016 || v7 != 0x800000000000F4A0)
      && (sub_E048() & 1) == 0)
    {
      __chkstk_darwin();
      sub_DCE8();
      sub_CC10(&qword_14758, (void (*)(uint64_t))&type metadata accessor for ApplicationSettingsView);
      sub_DC78();
      swift_bridgeObjectRelease();
      uint64_t v11 = sub_DC88();
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(a2, 0, 1, v11);
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v8 = sub_DC88();
  int64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);

  return v9(a2, 1, 1, v8);
}

uint64_t sub_8DA4()
{
  swift_getKeyPath();
  sub_CC10(&qword_14570, (void (*)(uint64_t))type metadata accessor for PaymentContactlessModel);
  sub_DC18();
  uint64_t result = swift_release();
  uint64_t v2 = OBJC_IVAR____TtC26PaymentContactlessUIPlugin23PaymentContactlessModel__pendingURLResource;
  if (*(void *)(v0 + OBJC_IVAR____TtC26PaymentContactlessUIPlugin23PaymentContactlessModel__pendingURLResource))
  {
    swift_getKeyPath();
    sub_DC18();
    swift_release();
    id v3 = *(void **)(v0 + v2);
    swift_getKeyPath();
    swift_bridgeObjectRetain();
    sub_DC18();
    swift_release();
    uint64_t v4 = *(void (**)(uint64_t))(v0
                                        + OBJC_IVAR____TtC26PaymentContactlessUIPlugin23PaymentContactlessModel__pendingCompletion);
    uint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC26PaymentContactlessUIPlugin23PaymentContactlessModel__pendingCompletion + 8);
    sub_BB34((uint64_t)v4);
    sub_ACC8(v3, v4, v5);
    sub_BB44((uint64_t)v4);
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    sub_DC08();
    swift_release();
    uint64_t v7 = swift_getKeyPath();
    __chkstk_darwin(v7);
    sub_DC08();
    return swift_release();
  }
  return result;
}

BOOL sub_9014(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_9028()
{
  Swift::UInt v1 = *v0;
  sub_E068();
  sub_E078(v1);
  return sub_E088();
}

void sub_9070()
{
  sub_E078(*v0);
}

Swift::Int sub_909C()
{
  Swift::UInt v1 = *v0;
  sub_E068();
  sub_E078(v1);
  return sub_E088();
}

uint64_t sub_90E0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_CC10(&qword_14570, (void (*)(uint64_t))type metadata accessor for PaymentContactlessModel);
  sub_DC18();
  swift_release();
  *a2 = *(void *)(v3 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t sub_918C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_926C(uint64_t result, char a2)
{
  *(unsigned char *)(result + 24) = a2;
  return result;
}

uint64_t sub_9274()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_9320@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_CC10(&qword_14570, (void (*)(uint64_t))type metadata accessor for PaymentContactlessModel);
  sub_DC18();
  swift_release();
  *a2 = *(void *)(v3 + OBJC_IVAR____TtC26PaymentContactlessUIPlugin23PaymentContactlessModel__pendingURLResource);
  return swift_bridgeObjectRetain();
}

uint64_t sub_93D4()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_94B4()
{
  swift_getKeyPath();
  sub_CC10(&qword_14570, (void (*)(uint64_t))type metadata accessor for PaymentContactlessModel);
  sub_DC18();
  swift_release();
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC26PaymentContactlessUIPlugin23PaymentContactlessModel__pendingCompletion);
  sub_BB34(v1);
  return v1;
}

uint64_t sub_9574@<X0>(uint64_t *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_CC10(&qword_14570, (void (*)(uint64_t))type metadata accessor for PaymentContactlessModel);
  sub_DC18();
  swift_release();
  uint64_t v4 = *(void *)(v3 + OBJC_IVAR____TtC26PaymentContactlessUIPlugin23PaymentContactlessModel__pendingCompletion);
  uint64_t v5 = *(void *)(v3 + OBJC_IVAR____TtC26PaymentContactlessUIPlugin23PaymentContactlessModel__pendingCompletion + 8);
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_CAB0;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())v6;
  return sub_BB34(v4);
}

uint64_t sub_966C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  if (*a1)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v2;
    *(void *)(v3 + 24) = v1;
    uint64_t v4 = sub_CA88;
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t KeyPath = swift_getKeyPath();
  __chkstk_darwin(KeyPath);
  sub_BB34(v2);
  sub_CC10(&qword_14570, (void (*)(uint64_t))type metadata accessor for PaymentContactlessModel);
  sub_DC08();
  sub_BB44((uint64_t)v4);
  return swift_release();
}

uint64_t sub_97C8()
{
  uint64_t v1 = v0;
  *(void *)(v0 + 16) = &_swiftEmptyArrayStorage;
  *(unsigned char *)(v0 + 24) = 0;
  *(void *)(v0 + 32) = 0;
  uint64_t v2 = v0 + OBJC_IVAR____TtC26PaymentContactlessUIPlugin23PaymentContactlessModel_appendSettingsNavigationPath;
  uint64_t v3 = sub_DCB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  uint64_t v4 = v1 + OBJC_IVAR____TtC26PaymentContactlessUIPlugin23PaymentContactlessModel_clearSettingsNavigationPath;
  uint64_t v5 = sub_DC98();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *(void *)(v1 + OBJC_IVAR____TtC26PaymentContactlessUIPlugin23PaymentContactlessModel__pendingURLResource) = 0;
  uint64_t v6 = (void *)(v1 + OBJC_IVAR____TtC26PaymentContactlessUIPlugin23PaymentContactlessModel__pendingCompletion);
  *uint64_t v6 = 0;
  v6[1] = 0;
  sub_DC28();
  uint64_t v7 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = sub_CB5C;
  aBlock[5] = v7;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_A00C;
  aBlock[3] = &unk_10A88;
  uint64_t v8 = _Block_copy(aBlock);
  int64_t v9 = self;
  swift_retain();
  id v10 = [v9 contextWithBundleId:0 onChange:v8];
  _Block_release(v8);
  swift_release();
  swift_release();
  uint64_t v11 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = v10;

  uint64_t v12 = *(void **)(v1 + 32);
  if (v12)
  {
    id v13 = [v12 defaultAppCandidates];
    sub_CBC0(0, (unint64_t *)&qword_14590);
    sub_DEC8();
  }
  uint64_t KeyPath = swift_getKeyPath();
  __chkstk_darwin(KeyPath);
  aBlock[0] = v1;
  sub_CC10(&qword_14570, (void (*)(uint64_t))type metadata accessor for PaymentContactlessModel);
  sub_DC08();
  swift_release();
  swift_bridgeObjectRelease();
  sub_A010();
  return v1;
}

uint64_t sub_9ADC(uint64_t a1)
{
  uint64_t v2 = sub_49D4(&qword_14788);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_DF18();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  sub_DEF8();
  swift_retain();
  uint64_t v6 = sub_DEE8();
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = v6;
  v7[3] = &protocol witness table for MainActor;
  v7[4] = a1;
  sub_9E58((uint64_t)v4, (uint64_t)&unk_14798, (uint64_t)v7);
  return swift_release();
}

uint64_t sub_9BF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[6] = a1;
  v4[7] = a4;
  sub_DEF8();
  v4[8] = sub_DEE8();
  uint64_t v6 = sub_DED8();
  return _swift_task_switch(sub_9C8C, v6, v5);
}

uint64_t sub_9C8C()
{
  swift_release();
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  uint64_t v2 = Strong;
  if (Strong)
  {
    uint64_t v3 = *(void **)(Strong + 32);
    if (v3)
    {
      id v4 = [v3 defaultAppCandidates];
      sub_CBC0(0, (unint64_t *)&qword_14590);
      uint64_t v5 = (void *)sub_DEC8();
    }
    else
    {
      uint64_t v5 = &_swiftEmptyArrayStorage;
    }
    swift_getKeyPath();
    uint64_t v6 = swift_task_alloc();
    *(void *)(v6 + 16) = v2;
    *(void *)(v6 + 24) = v5;
    *(void *)(v0 + 40) = v2;
    sub_CC10(&qword_14570, (void (*)(uint64_t))type metadata accessor for PaymentContactlessModel);
    sub_DC08();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_task_dealloc();
  }
  **(unsigned char **)(v0 + 48) = v2 == 0;
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_9E58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_DF18();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_DF08();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_84C8(a1, &qword_14788);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_DED8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  sub_49D4(&qword_147B0);
  return swift_task_create();
}

void sub_A010()
{
  if ([self isPassLibraryAvailable])
  {
    id v1 = [objc_allocWithZone((Class)PKPassLibrary) init];
    id v2 = [v1 passesOfType:1];

    sub_CBC0(0, &qword_14760);
    unint64_t v3 = sub_DEC8();

    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_E018();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v4 = *(void *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFFF8));
    }
    swift_bridgeObjectRelease();
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  uint64_t v6 = self;
  id v7 = [self sharedService];
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v0;
  *(unsigned char *)(v8 + 24) = v5;
  v10[4] = sub_CBB4;
  v10[5] = v8;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_AC40;
  v10[3] = &unk_10AD8;
  uint64_t v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  [v6 shouldShowWalletInSettingsWithApplePaySupportInformation:v7 completion:v9];
  _Block_release(v9);
}

uint64_t sub_A204()
{
  id v1 = *(void **)(v0 + 32);
  if (v1)
  {
    [v1 invalidate];
    id v2 = *(void **)(v0 + 32);
  }
  else
  {
    id v2 = 0;
  }
  *(void *)(v0 + 32) = 0;

  swift_bridgeObjectRelease();
  sub_84C8(v0 + OBJC_IVAR____TtC26PaymentContactlessUIPlugin23PaymentContactlessModel_appendSettingsNavigationPath, &qword_14558);
  sub_84C8(v0 + OBJC_IVAR____TtC26PaymentContactlessUIPlugin23PaymentContactlessModel_clearSettingsNavigationPath, &qword_14550);
  swift_bridgeObjectRelease();
  sub_BB44(*(void *)(v0 + OBJC_IVAR____TtC26PaymentContactlessUIPlugin23PaymentContactlessModel__pendingCompletion));
  uint64_t v3 = v0 + OBJC_IVAR____TtC26PaymentContactlessUIPlugin23PaymentContactlessModel___observationRegistrar;
  uint64_t v4 = sub_DC38();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t sub_A2F4()
{
  sub_A204();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_A34C()
{
  return type metadata accessor for PaymentContactlessModel();
}

uint64_t type metadata accessor for PaymentContactlessModel()
{
  uint64_t result = qword_14648;
  if (!qword_14648) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_A3A0()
{
  sub_A50C(319, &qword_14658, (void (*)(uint64_t))&type metadata accessor for AppendSettingsNavigationPathAction);
  if (v0 <= 0x3F)
  {
    sub_A50C(319, (unint64_t *)&unk_14660, (void (*)(uint64_t))&type metadata accessor for ClearSettingsNavigationPathAction);
    if (v1 <= 0x3F)
    {
      sub_DC38();
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_A50C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_DF78();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unsigned char *initializeBufferWithCopyOfBuffer for PaymentContactlessModel.WalletVisibilityStyle(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PaymentContactlessModel.WalletVisibilityStyle(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PaymentContactlessModel.WalletVisibilityStyle(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0xA6CCLL);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_A6F4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_A700(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PaymentContactlessModel.WalletVisibilityStyle()
{
  return &type metadata for PaymentContactlessModel.WalletVisibilityStyle;
}

unint64_t sub_A71C()
{
  unint64_t result = qword_14718;
  if (!qword_14718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14718);
  }
  return result;
}

uint64_t sub_A780(char a1, char a2, uint64_t a3, uint64_t a4, int a5)
{
  int v19 = a5;
  uint64_t v7 = sub_DE48();
  uint64_t v21 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = &v18[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v20 = sub_DE68();
  uint64_t v10 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v12 = &v18[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_CBC0(0, &qword_14768);
  id v13 = (void *)sub_DF38();
  uint64_t v14 = swift_allocObject();
  swift_weakInit();
  uint64_t v15 = swift_allocObject();
  *(unsigned char *)(v15 + 16) = a1;
  *(unsigned char *)(v15 + 17) = v19;
  *(unsigned char *)(v15 + 18) = a2;
  *(void *)(v15 + 24) = v14;
  aBlock[4] = sub_CBFC;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_A00C;
  aBlock[3] = &unk_10B28;
  uint64_t v16 = _Block_copy(aBlock);
  swift_retain();
  sub_DE58();
  uint64_t v22 = &_swiftEmptyArrayStorage;
  sub_CC10(&qword_14770, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_49D4(&qword_14778);
  sub_86E0(&qword_14780, &qword_14778);
  sub_DF98();
  sub_DF48();
  _Block_release(v16);

  (*(void (**)(unsigned char *, uint64_t))(v21 + 8))(v9, v7);
  (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v12, v20);
  swift_release();
  return swift_release();
}

uint64_t sub_AAB0()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    sub_CC10(&qword_14570, (void (*)(uint64_t))type metadata accessor for PaymentContactlessModel);
    sub_DC08();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_ABFC(uint64_t a1)
{
  unint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_AC40(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 32);
  swift_retain();
  id v8 = a4;
  v7(a2, a3, a4);
  swift_release();
}

id sub_ACC8(void *a1, void (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v88 = sub_49D4(&qword_14598);
  __chkstk_darwin(v88);
  uint64_t v9 = (char *)&v79 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v92 = sub_DC68();
  uint64_t v91 = *(void *)(v92 - 8);
  uint64_t v10 = __chkstk_darwin(v92);
  uint64_t v89 = (char *)&v79 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v90 = (char *)&v79 - v12;
  uint64_t v13 = sub_49D4(&qword_14558);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v79 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_DCB8();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  int v19 = (char *)&v79 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v4 + OBJC_IVAR____TtC26PaymentContactlessUIPlugin23PaymentContactlessModel_appendSettingsNavigationPath;
  swift_beginAccess();
  uint64_t v21 = v20;
  uint64_t v22 = (uint64_t (**)(char *, uint64_t))v17;
  sub_BB84(v21, (uint64_t)v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
  {
    sub_84C8((uint64_t)v15, &qword_14558);
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    *(&v79 - 2) = v4;
    *(&v79 - 1) = (uint64_t)a1;
    *(void *)&v96[0] = v4;
    sub_CC10(&qword_14570, (void (*)(uint64_t))type metadata accessor for PaymentContactlessModel);
    swift_bridgeObjectRetain();
    sub_DC08();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v24 = swift_getKeyPath();
    __chkstk_darwin(v24);
    *(&v79 - 4) = v4;
    *(&v79 - 3) = (uint64_t)a2;
    *(&v79 - 2) = a3;
    *(void *)&v96[0] = v4;
    sub_BB34((uint64_t)a2);
    sub_DC08();
    sub_BB44((uint64_t)a2);
    return (id)swift_release();
  }
  uint64_t v87 = a3;
  uint64_t v26 = (*(uint64_t (**)(char *, char *, uint64_t))(v17 + 32))(v19, v15, v16);
  if (!a1)
  {
LABEL_15:
    if (!a2) {
      return (id)v22[1](v19, v16);
    }
LABEL_16:
    a2(v26);
    return (id)v22[1](v19, v16);
  }
  *(void *)&v94[0] = 1752457584;
  *((void *)&v94[0] + 1) = 0xE400000000000000;
  swift_bridgeObjectRetain();
  sub_DFC8();
  if (a1[2] && (unint64_t v27 = sub_BBEC((uint64_t)v96), (v28 & 1) != 0))
  {
    sub_7F08(a1[7] + 32 * v27, (uint64_t)&v97);
  }
  else
  {
    long long v97 = 0u;
    long long v98 = 0u;
  }
  sub_BC30((uint64_t)v96);
  if (!*((void *)&v98 + 1))
  {
    swift_bridgeObjectRelease();
    uint64_t v26 = sub_84C8((uint64_t)&v97, &qword_14720);
    goto LABEL_15;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v26 = swift_bridgeObjectRelease();
    if (!a2) {
      return (id)v22[1](v19, v16);
    }
    goto LABEL_16;
  }
  uint64_t v82 = a2;
  uint64_t v29 = *((void *)&v94[0] + 1);
  unint64_t v30 = *(void *)&v94[0];
  v96[0] = v94[0];
  *(void *)&long long v97 = 47;
  *((void *)&v97 + 1) = 0xE100000000000000;
  unint64_t v81 = sub_BC84();
  uint64_t v31 = (void *)sub_DF88();
  uint64_t v32 = v31[2];
  uint64_t v86 = (const char *)v22;
  if (v32)
  {
    *((void *)&v80 + 1) = v29;
    uint64_t v34 = v31[4];
    unint64_t v33 = v31[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)&long long v80 = v30;
    if (v34 == 0xD000000000000012 && v33 == 0x800000000000F500)
    {
      uint64_t v22 = (uint64_t (**)(char *, uint64_t))"com.apple.Passbook";
LABEL_45:
      swift_bridgeObjectRelease();
      swift_getKeyPath();
      *(void *)&v96[0] = v4;
      sub_CC10(&qword_14570, (void (*)(uint64_t))type metadata accessor for PaymentContactlessModel);
      sub_DC18();
      swift_release();
      unint64_t v30 = *(void *)(v4 + 16);
      if (v30 >> 62) {
        goto LABEL_82;
      }
      uint64_t v88 = *(void *)((char *)&dword_10 + (v30 & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRetain();
      goto LABEL_47;
    }
    uint64_t v22 = (uint64_t (**)(char *, uint64_t))"com.apple.Passbook";
    if (sub_E048()) {
      goto LABEL_45;
    }
    unint64_t v85 = v33;
    if (v34 == 0xD000000000000016 && v85 == 0x800000000000F4A0) {
      goto LABEL_45;
    }
    if (sub_E048()) {
      goto LABEL_45;
    }
    uint64_t v91 = v34;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v91 = 0;
    unint64_t v85 = 0;
  }
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  *(void *)&v96[0] = v4;
  sub_CC10(&qword_14570, (void (*)(uint64_t))type metadata accessor for PaymentContactlessModel);
  sub_DC18();
  swift_release();
  unint64_t v35 = *(void *)(v4 + 16);
  if (v35 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_E018();
  }
  else
  {
    uint64_t v36 = *(void *)((char *)&dword_10 + (v35 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
  }
  uint64_t v22 = (uint64_t (**)(char *, uint64_t))v86;
  if (!v36)
  {
    swift_bridgeObjectRelease();
LABEL_72:
    uint64_t v75 = swift_bridgeObjectRelease();
    if (v82) {
      v82(v75);
    }
    return (id)v22[1](v19, v16);
  }
  uint64_t v90 = v19;
  unint64_t v92 = v35 & 0xC000000000000001;
  uint64_t v37 = 4;
  while (1)
  {
    int v19 = (char *)(v37 - 4);
    v38 = v92 ? (void *)sub_DFE8() : *(id *)(v35 + 8 * v37);
    a1 = v38;
    uint64_t v39 = v37 - 3;
    if (__OFADD__(v19, 1)) {
      break;
    }
    id v40 = [v38 bundleId];
    if (v40)
    {
      uint64_t v41 = v40;
      unint64_t v30 = sub_DEA8();
      uint64_t v43 = v42;

      if (!v85)
      {

        swift_bridgeObjectRelease();
        goto LABEL_27;
      }
      if (v30 == v91 && v85 == v43)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_77;
      }
      char v45 = sub_E048();
      swift_bridgeObjectRelease();
      if (v45)
      {
        swift_bridgeObjectRelease();
LABEL_77:
        uint64_t v76 = v86;
        swift_bridgeObjectRelease();
        sub_8B70(a1, (uint64_t)v9);
        sub_BCE0();
        v77 = v90;
        sub_DCA8();

        uint64_t v78 = sub_84C8((uint64_t)v9, &qword_14598);
        if (v82) {
          v82(v78);
        }
        return (id)(*((uint64_t (**)(char *, uint64_t))v76 + 1))(v77, v16);
      }
    }
    else if (!v85)
    {
      goto LABEL_77;
    }

LABEL_27:
    uint64_t v22 = (uint64_t (**)(char *, uint64_t))v86;
    ++v37;
    if (v39 == v36)
    {
      swift_bridgeObjectRelease();
      int v19 = v90;
      goto LABEL_72;
    }
  }
  __break(1u);
LABEL_81:
  __break(1u);
LABEL_82:
  swift_bridgeObjectRetain();
  uint64_t v88 = sub_E018();
LABEL_47:
  if (v88)
  {
    uint64_t v46 = v22;
    unint64_t v85 = v30 & 0xC000000000000001;
    uint64_t v22 = (uint64_t (**)(char *, uint64_t))&dword_4;
    unint64_t v83 = (unint64_t)"vigationPathAction";
    char v84 = v46 - 4;
    do
    {
      if (v85) {
        id v48 = (id)sub_DFE8();
      }
      else {
        id v48 = *(id *)(v30 + 8 * (void)v22);
      }
      uint64_t v49 = v48;
      int v50 = (char *)v22 - 3;
      if (__OFADD__((char *)v22 - 4, 1)) {
        goto LABEL_81;
      }
      id v51 = [v48 bundleId];
      if (v51)
      {
        uint64_t v52 = v51;
        uint64_t v53 = sub_DEA8();
        uint64_t v55 = v54;

        if (v53 == 0xD000000000000012 && v55 == ((unint64_t)v84 | 0x8000000000000000))
        {
LABEL_62:
          swift_bridgeObjectRelease();
LABEL_63:
          v96[0] = v80;
          *(void *)&long long v97 = 47;
          *((void *)&v97 + 1) = 0xE100000000000000;
          uint64_t v62 = sub_DF88();
          id result = (id)swift_bridgeObjectRelease();
          uint64_t v95 = v62;
          if (*(void *)(v62 + 16))
          {
            sub_C80C(0, 1);
            *(void *)&long long v97 = 1752457584;
            *((void *)&v97 + 1) = 0xE400000000000000;
            sub_DFC8();
            *(void *)&long long v97 = v95;
            swift_bridgeObjectRetain();
            sub_49D4(&qword_14738);
            sub_86E0(&qword_14740, &qword_14738);
            uint64_t v63 = sub_DE88();
            uint64_t v65 = v64;
            swift_bridgeObjectRelease();
            *((void *)&v98 + 1) = &type metadata for String;
            *(void *)&long long v97 = v63;
            *((void *)&v97 + 1) = v65;
            sub_C924(&v97, v94);
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v93 = a1;
            sub_C09C(v94, (uint64_t)v96, isUniquelyReferenced_nonNull_native);
            swift_bridgeObjectRelease();
            sub_BC30((uint64_t)v96);
            id result = [v49 localizedDisplayName];
            if (result)
            {
              uint64_t v67 = result;
              sub_DEA8();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();

              v68 = v89;
              sub_89C8();
              swift_bridgeObjectRelease();
              v69 = v90;
              uint64_t v70 = v82;
              sub_DC48();
              swift_bridgeObjectRelease();
              v71 = *(void (**)(char *, unint64_t))(v91 + 8);
              unint64_t v72 = v92;
              v71(v68, v92);
              sub_CC10(&qword_145D8, (void (*)(uint64_t))&type metadata accessor for PreferencesControllerRecipe);
              sub_DCA8();

              uint64_t v73 = ((uint64_t (*)(char *, unint64_t))v71)(v69, v72);
              if (v70) {
                v70(v73);
              }
              return (id)(*((uint64_t (**)(char *, uint64_t))v86 + 1))(v19, v16);
            }
          }
          else
          {
            __break(1u);
          }
          __break(1u);
          return result;
        }
        char v56 = sub_E048();
        swift_bridgeObjectRelease();
        if (v56) {
          goto LABEL_63;
        }
      }
      id v57 = [v49 bundleId];
      if (v57)
      {
        id v58 = v57;
        uint64_t v59 = sub_DEA8();
        uint64_t v61 = v60;

        if (v59 == 0xD000000000000016 && v61 == (v83 | 0x8000000000000000)) {
          goto LABEL_62;
        }
        char v47 = sub_E048();
        swift_bridgeObjectRelease();
        if (v47) {
          goto LABEL_63;
        }
      }

      uint64_t v22 = (uint64_t (**)(char *, uint64_t))((char *)v22 + 1);
    }
    while (v50 != (const char *)v88);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v74 = swift_bridgeObjectRelease();
  if (v82) {
    v82(v74);
  }
  return (id)(*((uint64_t (**)(char *, uint64_t))v86 + 1))(v19, v16);
}

uint64_t sub_BB34(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_BB44(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_BB54()
{
  return sub_CAD8();
}

uint64_t sub_BB6C()
{
  return sub_C9F8();
}

uint64_t sub_BB84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_49D4(&qword_14558);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_BBEC(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_DFA8(*(void *)(v2 + 40));

  return sub_C264(a1, v4);
}

uint64_t sub_BC30(uint64_t a1)
{
  return a1;
}

unint64_t sub_BC84()
{
  unint64_t result = qword_14728;
  if (!qword_14728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14728);
  }
  return result;
}

unint64_t sub_BCE0()
{
  unint64_t result = qword_14730;
  if (!qword_14730)
  {
    sub_7520(&qword_14598);
    sub_CC10(&qword_145D0, (void (*)(uint64_t))&type metadata accessor for SettingsAnyViewRecipe);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14730);
  }
  return result;
}

uint64_t sub_BD84(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_49D4(&qword_14748);
  uint64_t v6 = sub_E038();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
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
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v11) {
        goto LABEL_34;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v14 >= v11) {
              goto LABEL_34;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v14 = v24;
      }
    }
LABEL_21:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v5 + 48) + 40 * v20;
    if (a2)
    {
      long long v26 = *(_OWORD *)v25;
      long long v27 = *(_OWORD *)(v25 + 16);
      uint64_t v40 = *(void *)(v25 + 32);
      long long v38 = v26;
      long long v39 = v27;
      sub_C924((_OWORD *)(*(void *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_C934(v25, (uint64_t)&v38);
      sub_7F08(*(void *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    uint64_t result = sub_DFA8(*(void *)(v7 + 40));
    uint64_t v28 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v29 = result & ~v28;
    unint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v33 = v30 == v32;
        if (v30 == v32) {
          unint64_t v30 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      unint64_t v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t v16 = *(void *)(v7 + 48) + 40 * v15;
    long long v17 = v38;
    long long v18 = v39;
    *(void *)(v16 + 32) = v40;
    *(_OWORD *)uint64_t v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    uint64_t result = (uint64_t)sub_C924(v37, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

_OWORD *sub_C09C(_OWORD *a1, uint64_t a2, char a3)
{
  Swift::Int v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_BBEC(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_C32C();
      goto LABEL_7;
    }
    sub_BD84(v13, a3 & 1);
    unint64_t v19 = sub_BBEC(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      uint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
LABEL_13:
      sub_C934(a2, (uint64_t)v21);
      return sub_C1E8(v10, (uint64_t)v21, a1, v16);
    }
LABEL_15:
    uint64_t result = (_OWORD *)sub_E058();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v16 = *v4;
  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  long long v17 = (_OWORD *)(v16[7] + 32 * v10);
  sub_7EB8((uint64_t)v17);

  return sub_C924(a1, v17);
}

_OWORD *sub_C1E8(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  uint64_t result = sub_C924(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v8 = a4[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a4[2] = v10;
  }
  return result;
}

unint64_t sub_C264(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_C934(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_DFB8();
      sub_BC30((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

void *sub_C32C()
{
  uint64_t v1 = v0;
  sub_49D4(&qword_14748);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_E028();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    sub_C934(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    uint64_t v17 = 32 * v15;
    sub_7F08(*(void *)(v2 + 56) + v17, (uint64_t)v24);
    uint64_t v18 = *(void *)(v4 + 48) + v16;
    long long v19 = v25[0];
    long long v20 = v25[1];
    *(void *)(v18 + 32) = v26;
    *(_OWORD *)uint64_t v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    uint64_t result = sub_C924(v24, (_OWORD *)(*(void *)(v4 + 56) + v17));
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

char *sub_C514(char *result, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_49D4(&qword_14750);
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
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_C618(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  char v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_C6F8;
  return v5(v2 + 32);
}

uint64_t sub_C6F8()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_C80C(uint64_t result, int64_t a2)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v4 = *v2;
  int64_t v5 = *((void *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v6 = result;
  int64_t v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *((void *)v4 + 3) >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t v4 = sub_C514(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_19;
  }
  uint64_t v12 = *((void *)v4 + 2);
  BOOL v13 = __OFSUB__(v12, a2);
  uint64_t v14 = v12 - a2;
  if (v13) {
    goto LABEL_25;
  }
  unint64_t v15 = &v4[16 * a2 + 32];
  if (v6 != a2 || &v4[16 * v6 + 32] >= &v15[16 * v14]) {
    uint64_t result = (uint64_t)memmove(&v4[16 * v6 + 32], v15, 16 * v14);
  }
  uint64_t v16 = *((void *)v4 + 2);
  BOOL v13 = __OFADD__(v16, v8);
  uint64_t v17 = v16 - v7;
  if (!v13)
  {
    *((void *)v4 + 2) = v17;
LABEL_19:
    *uint64_t v2 = v4;
    return result;
  }
LABEL_26:
  __break(1u);
  return result;
}

_OWORD *sub_C924(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_C934(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_C990()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();

  return ApplicationSettingsView.init(applicationBundleIdentifier:)(v2, v1);
}

uint64_t sub_C9E0()
{
  return sub_CF08();
}

uint64_t sub_C9F8()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  uint64_t v3 = (uint64_t *)(v0[2] + OBJC_IVAR____TtC26PaymentContactlessUIPlugin23PaymentContactlessModel__pendingCompletion);
  uint64_t v4 = *v3;
  *uint64_t v3 = v1;
  v3[1] = v2;
  sub_BB34(v1);
  return sub_BB44(v4);
}

uint64_t sub_CA50()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_CA88()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_CAB0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_CAD8()
{
  *(void *)(*(void *)(v0 + 16)
            + OBJC_IVAR____TtC26PaymentContactlessUIPlugin23PaymentContactlessModel__pendingURLResource) = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_CB24()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_CB5C()
{
  return sub_9ADC(v0);
}

uint64_t sub_CB64(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_CB74()
{
  return swift_release();
}

uint64_t sub_CB7C()
{
  swift_release();

  return _swift_deallocObject(v0, 25, 7);
}

uint64_t sub_CBB4(char a1, char a2, uint64_t a3)
{
  return sub_A780(a1, a2, a3, *(void *)(v3 + 16), *(unsigned __int8 *)(v3 + 24));
}

uint64_t sub_CBC0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_CBFC()
{
  return sub_AAB0();
}

uint64_t sub_CC10(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_CC58()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 24) = *(unsigned char *)(v0 + 24);
}

uint64_t sub_CC68()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_CCA8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  int64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *int64_t v7 = v2;
  v7[1] = sub_CD5C;
  return sub_9BF4(a1, v4, v5, v6);
}

uint64_t sub_CD5C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_CE50(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_CD5C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_147A0 + dword_147A0);
  return v6(a1, v4);
}

uint64_t sub_CF08()
{
  *(void *)(*(void *)(v0 + 16) + 16) = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

id SESDefaultNFCApplication.id.getter()
{
  id result = [v0 bundleId];
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = sub_DEA8();

    return (id)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_CFC0()
{
  return &protocol witness table for String;
}

void sub_CFCC(uint64_t *a1@<X8>)
{
  id v3 = [*v1 bundleId];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_DEA8();
    uint64_t v7 = v6;

    *a1 = v5;
    a1[1] = v7;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_D02C()
{
  uint64_t v1 = OBJC_IVAR____TtC26PaymentContactlessUIPlugin26PaymentContactlessUIPlugin____lazy_storage___paymentContactlessModel;
  if (*(void *)(v0
                 + OBJC_IVAR____TtC26PaymentContactlessUIPlugin26PaymentContactlessUIPlugin____lazy_storage___paymentContactlessModel))
  {
    uint64_t v2 = *(void *)(v0
                   + OBJC_IVAR____TtC26PaymentContactlessUIPlugin26PaymentContactlessUIPlugin____lazy_storage___paymentContactlessModel);
  }
  else
  {
    uint64_t v3 = v0;
    type metadata accessor for PaymentContactlessModel();
    swift_allocObject();
    uint64_t v2 = sub_97C8();
    *(void *)(v3 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

uint64_t sub_D0A8@<X0>(void *a1@<X8>)
{
  uint64_t v3 = sub_49D4(&qword_14820);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v16 - v7;
  uint64_t v9 = v1
     + OBJC_IVAR____TtC26PaymentContactlessUIPlugin26PaymentContactlessUIPlugin____lazy_storage___paymentContactlessView;
  swift_beginAccess();
  sub_DAD0(v9, (uint64_t)v8);
  uint64_t v10 = type metadata accessor for PaymentContactlessView();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1) {
    return sub_77BC((uint64_t)v8, (uint64_t)a1);
  }
  sub_84C8((uint64_t)v8, &qword_14820);
  v16[4] = sub_D02C();
  type metadata accessor for PaymentContactlessModel();
  sub_DE08();
  uint64_t v12 = v16[2];
  *a1 = v16[1];
  a1[1] = v12;
  BOOL v13 = (void *)((char *)a1 + *(int *)(v10 + 20));
  uint64_t *v13 = swift_getKeyPath();
  sub_49D4(&qword_14408);
  swift_storeEnumTagMultiPayload();
  uint64_t v14 = (void *)((char *)a1 + *(int *)(v10 + 24));
  *uint64_t v14 = swift_getKeyPath();
  sub_49D4(&qword_14410);
  swift_storeEnumTagMultiPayload();
  sub_7754((uint64_t)a1, (uint64_t)v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v6, 0, 1, v10);
  swift_beginAccess();
  sub_DB80((uint64_t)v6, v9);
  return swift_endAccess();
}

void sub_D2E0()
{
  uint64_t v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = type metadata accessor for PaymentContactlessView();
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (id *)((char *)&v18.receiver - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18.receiver = v1;
  v18.super_class = ObjectType;
  objc_msgSendSuper2(&v18, "viewDidLoad");
  sub_D0A8(v5);
  id v6 = objc_allocWithZone((Class)sub_49D4(&qword_14818));
  uint64_t v7 = (void *)sub_DD68();
  id v8 = [v7 view];
  if (!v8)
  {
    uint64_t v9 = v7;
    goto LABEL_6;
  }
  uint64_t v9 = v8;
  id v10 = [v1 view];
  if (v10)
  {
    uint64_t v11 = v10;
    [v10 addSubview:v9];

    id v12 = [v1 view];
    if (v12)
    {
      BOOL v13 = v12;
      [v12 bounds];
      double v15 = v14;
      double v17 = v16;

      objc_msgSend(v9, "setFrame:", 0.0, 0.0, v15, v17);
      [v9 setAutoresizingMask:18];
      [v1 addChildViewController:v7];
      [v7 didMoveToParentViewController:v1];

LABEL_6:
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

id sub_D83C()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_D8D4()
{
  return type metadata accessor for PaymentContactlessUIPlugin();
}

uint64_t type metadata accessor for PaymentContactlessUIPlugin()
{
  uint64_t result = qword_147F8;
  if (!qword_147F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_D928()
{
  sub_DA34(319, &qword_14808, (void (*)(uint64_t))type metadata accessor for PaymentContactlessView);
  if (v0 <= 0x3F)
  {
    sub_DA34(319, &qword_14810, (void (*)(uint64_t))&type metadata accessor for URL);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_DA34(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_DF78();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_DA88()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_DAC0()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_DAD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_49D4(&qword_14820);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_DB38()
{
  return sub_DD28();
}

uint64_t sub_DB5C()
{
  return sub_DD18();
}

uint64_t sub_DB80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_49D4(&qword_14820);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_DBE8(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_DBF8()
{
  return type metadata accessor for URL();
}

uint64_t sub_DC08()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t sub_DC18()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t sub_DC28()
{
  return ObservationRegistrar.init()();
}

uint64_t sub_DC38()
{
  return type metadata accessor for ObservationRegistrar();
}

uint64_t sub_DC48()
{
  return PreferencesControllerRecipe.controllerRecipeWithPendingURLPayload(_:pendingURLCompletion:)();
}

uint64_t sub_DC58()
{
  return PreferencesControllerRecipe.init(specifier:bundleName:location:viewControllerClassName:)();
}

uint64_t sub_DC68()
{
  return type metadata accessor for PreferencesControllerRecipe();
}

uint64_t sub_DC78()
{
  return SettingsAnyViewRecipe.init<A>(content:)();
}

uint64_t sub_DC88()
{
  return type metadata accessor for SettingsAnyViewRecipe();
}

uint64_t sub_DC98()
{
  return type metadata accessor for ClearSettingsNavigationPathAction();
}

uint64_t sub_DCA8()
{
  return AppendSettingsNavigationPathAction.callAsFunction<A>(_:)();
}

uint64_t sub_DCB8()
{
  return type metadata accessor for AppendSettingsNavigationPathAction();
}

uint64_t sub_DCC8()
{
  return AsyncIconImage.init<>(icon:descriptor:)();
}

uint64_t sub_DCE8()
{
  return type metadata accessor for ApplicationSettingsView();
}

uint64_t sub_DCF8()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_DD08()
{
  return NavigationLink<>.init<A>(value:label:)();
}

uint64_t sub_DD18()
{
  return EnvironmentValues.clearSettingsNavigationPath.getter();
}

uint64_t sub_DD28()
{
  return EnvironmentValues.appendSettingsNavigationPath.getter();
}

uint64_t sub_DD38()
{
  return EnvironmentValues.init()();
}

uint64_t sub_DD48()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_DD58()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_DD68()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_DD78()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_DD88()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_DD98()
{
  return List<>.init(content:)();
}

uint64_t sub_DDA8()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_DDB8()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_DDC8()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_DDD8()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_DDE8()
{
  return View.navigationTitle(_:)();
}

uint64_t sub_DDF8()
{
  return Label.init(title:icon:)();
}

uint64_t sub_DE08()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_DE18()
{
  return State.wrappedValue.getter();
}

uint64_t sub_DE28()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_DE38()
{
  return Section<>.init(content:)();
}

uint64_t sub_DE48()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_DE58()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_DE68()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_DE78()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_DE88()
{
  return BidirectionalCollection<>.joined(separator:)();
}

NSString sub_DE98()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_DEA8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Int sub_DEB8()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_DEC8()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_DED8()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_DEE8()
{
  return static MainActor.shared.getter();
}

uint64_t sub_DEF8()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_DF08()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_DF18()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_DF28()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_DF38()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_DF48()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_DF58()
{
  return static NSBundle.PreferencesPluginLocation.default.getter();
}

uint64_t sub_DF68()
{
  return type metadata accessor for NSBundle.PreferencesPluginLocation();
}

uint64_t sub_DF78()
{
  return type metadata accessor for Optional();
}

uint64_t sub_DF88()
{
  return StringProtocol.components<A>(separatedBy:)();
}

uint64_t sub_DF98()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

Swift::Int sub_DFA8(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_DFB8()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_DFC8()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_DFD8()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_DFE8()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_DFF8()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_E008()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_E018()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_E028()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_E038()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_E048()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_E058()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_E068()
{
  return Hasher.init(_seed:)();
}

void sub_E078(Swift::UInt a1)
{
}

Swift::Int sub_E088()
{
  return Hasher._finalize()();
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

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
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