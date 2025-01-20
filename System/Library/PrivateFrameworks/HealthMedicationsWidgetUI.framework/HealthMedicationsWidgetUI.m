uint64_t sub_2510D4DFC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t result;

  if (qword_26B215168 != -1) {
    swift_once();
  }
  v2 = sub_2510FB130();
  v4 = v3;
  sub_2510D504C();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2510FC400;
  *(void *)(inited + 32) = sub_2510FB130();
  *(void *)(inited + 40) = v6;
  *(void *)(inited + 48) = sub_2510FB130();
  *(void *)(inited + 56) = v7;
  v8 = sub_2510E5624(inited);
  swift_bridgeObjectRelease();
  swift_setDeallocating();
  swift_arrayDestroy();
  v9 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  v10 = (char *)a1 + v9[6];
  v11 = type metadata accessor for MedmojiIconConfiguration();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v12 = (char *)a1 + v9[8];
  v13 = sub_2510FB2A0();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  *a1 = v2;
  a1[1] = v4;
  a1[2] = v8;
  *((unsigned char *)a1 + v9[7]) = 3;
  return result;
}

void sub_2510D504C()
{
  if (!qword_26B2157B8)
  {
    unint64_t v0 = sub_2510FBE50();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B2157B8);
    }
  }
}

uint64_t type metadata accessor for MedicationsWidgetViewModel()
{
  uint64_t result = qword_26B214FD8;
  if (!qword_26B214FD8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *sub_2510D50F0(void *a1, void *a2, int *a3)
{
  v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    void *v4 = *a2;
    v4 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    a1[2] = a2[2];
    uint64_t v8 = a3[6];
    __dst = (char *)a1 + v8;
    v9 = (char *)a2 + v8;
    uint64_t v10 = type metadata accessor for MedmojiIconConfiguration();
    uint64_t v11 = *(void *)(v10 - 8);
    v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v12(v9, 1, v10))
    {
      sub_2510D5408(0, qword_26B2150B0, (void (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration);
      memcpy(__dst, v9, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      uint64_t v15 = sub_2510FB420();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(__dst, v9, v15);
      uint64_t v16 = *(int *)(v10 + 20);
      v17 = &__dst[v16];
      v18 = &v9[v16];
      uint64_t v19 = sub_2510FB3D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(__dst, 0, 1, v10);
    }
    uint64_t v20 = a3[8];
    *((unsigned char *)v4 + a3[7]) = *((unsigned char *)a2 + a3[7]);
    v21 = (char *)v4 + v20;
    v22 = (char *)a2 + v20;
    uint64_t v23 = sub_2510FB2A0();
    uint64_t v24 = *(void *)(v23 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
    {
      sub_2510D5408(0, &qword_26B214D50, MEMORY[0x263F07490]);
      memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v21, v22, v23);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
    }
  }
  return v4;
}

void sub_2510D5408(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_2510FBCE0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_2510D545C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for MedmojiIconConfiguration();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5))
  {
    uint64_t v6 = sub_2510FB420();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v4, v6);
    uint64_t v7 = v4 + *(int *)(v5 + 20);
    uint64_t v8 = sub_2510FB3D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  uint64_t v9 = a1 + *(int *)(a2 + 32);
  uint64_t v10 = sub_2510FB2A0();
  uint64_t v13 = *(void *)(v10 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v9, 1, v10);
  if (!result)
  {
    v12 = *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8);
    return v12(v9, v10);
  }
  return result;
}

void *sub_2510D5618(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  uint64_t v7 = a3[6];
  __dst = (char *)a1 + v7;
  uint64_t v8 = (char *)a2 + v7;
  uint64_t v9 = type metadata accessor for MedmojiIconConfiguration();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v11(v8, 1, v9))
  {
    sub_2510D5408(0, qword_26B2150B0, (void (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration);
    memcpy(__dst, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    uint64_t v13 = sub_2510FB420();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(__dst, v8, v13);
    uint64_t v14 = *(int *)(v9 + 20);
    uint64_t v15 = &__dst[v14];
    uint64_t v16 = &v8[v14];
    uint64_t v17 = sub_2510FB3D0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(__dst, 0, 1, v9);
  }
  uint64_t v18 = a3[8];
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  uint64_t v21 = sub_2510FB2A0();
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    sub_2510D5408(0, &qword_26B214D50, MEMORY[0x263F07490]);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v19, v20, v21);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  return a1;
}

void *sub_2510D58E0(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for MedmojiIconConfiguration();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      uint64_t v14 = sub_2510FB420();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v7, v8, v14);
      uint64_t v15 = *(int *)(v9 + 20);
      uint64_t v16 = &v7[v15];
      uint64_t v17 = &v8[v15];
      uint64_t v18 = sub_2510FB3D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    sub_2510D5CC4((uint64_t)v7);
LABEL_6:
    sub_2510D5408(0, qword_26B2150B0, (void (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration);
    memcpy(v7, v8, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v30 = sub_2510FB420();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 24))(v7, v8, v30);
  uint64_t v31 = *(int *)(v9 + 20);
  v32 = &v7[v31];
  v33 = &v8[v31];
  uint64_t v34 = sub_2510FB3D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 24))(v32, v33, v34);
LABEL_7:
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  uint64_t v20 = a3[8];
  uint64_t v21 = (char *)a1 + v20;
  uint64_t v22 = (char *)a2 + v20;
  uint64_t v23 = sub_2510FB2A0();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48);
  int v26 = v25(v21, 1, v23);
  int v27 = v25(v22, 1, v23);
  if (!v26)
  {
    if (!v27)
    {
      (*(void (**)(char *, char *, uint64_t))(v24 + 24))(v21, v22, v23);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v24 + 8))(v21, v23);
    goto LABEL_12;
  }
  if (v27)
  {
LABEL_12:
    sub_2510D5408(0, &qword_26B214D50, MEMORY[0x263F07490]);
    memcpy(v21, v22, *(void *)(*(void *)(v28 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v21, v22, v23);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  return a1;
}

uint64_t sub_2510D5CC4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MedmojiIconConfiguration();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2510D5D20(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)(a1 + v6);
  uint64_t v8 = (char *)(a2 + v6);
  uint64_t v9 = type metadata accessor for MedmojiIconConfiguration();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    sub_2510D5408(0, qword_26B2150B0, (void (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    uint64_t v12 = sub_2510FB420();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v7, v8, v12);
    uint64_t v13 = *(int *)(v9 + 20);
    uint64_t v14 = &v7[v13];
    uint64_t v15 = &v8[v13];
    uint64_t v16 = sub_2510FB3D0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v17 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (const void *)(a2 + v17);
  uint64_t v20 = sub_2510FB2A0();
  uint64_t v21 = *(void *)(v20 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
  {
    sub_2510D5408(0, &qword_26B214D50, MEMORY[0x263F07490]);
    memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v21 + 32))(v18, v19, v20);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
  }
  return a1;
}

void *sub_2510D5FC0(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for MedmojiIconConfiguration();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      uint64_t v15 = sub_2510FB420();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v8, v9, v15);
      uint64_t v16 = *(int *)(v10 + 20);
      uint64_t v17 = &v8[v16];
      uint64_t v18 = &v9[v16];
      uint64_t v19 = sub_2510FB3D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    sub_2510D5CC4((uint64_t)v8);
LABEL_6:
    sub_2510D5408(0, qword_26B2150B0, (void (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration);
    memcpy(v8, v9, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v31 = sub_2510FB420();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 40))(v8, v9, v31);
  uint64_t v32 = *(int *)(v10 + 20);
  v33 = &v8[v32];
  uint64_t v34 = &v9[v32];
  uint64_t v35 = sub_2510FB3D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 40))(v33, v34, v35);
LABEL_7:
  uint64_t v21 = a3[8];
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  uint64_t v22 = (char *)a1 + v21;
  uint64_t v23 = (char *)a2 + v21;
  uint64_t v24 = sub_2510FB2A0();
  uint64_t v25 = *(void *)(v24 - 8);
  int v26 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v25 + 48);
  int v27 = v26(v22, 1, v24);
  int v28 = v26(v23, 1, v24);
  if (!v27)
  {
    if (!v28)
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 40))(v22, v23, v24);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v25 + 8))(v22, v24);
    goto LABEL_12;
  }
  if (v28)
  {
LABEL_12:
    sub_2510D5408(0, &qword_26B214D50, MEMORY[0x263F07490]);
    memcpy(v22, v23, *(void *)(*(void *)(v29 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v22, v23, v24);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
  return a1;
}

uint64_t sub_2510D6388(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2510D639C);
}

uint64_t sub_2510D639C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_2510D5408(0, qword_26B2150B0, (void (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 24);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      sub_2510D5408(0, &qword_26B214D50, MEMORY[0x263F07490]);
      int v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 32);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_2510D6500(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2510D6514);
}

uint64_t sub_2510D6514(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    sub_2510D5408(0, qword_26B2150B0, (void (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 24);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      sub_2510D5408(0, &qword_26B214D50, MEMORY[0x263F07490]);
      int v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 32);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_2510D6678()
{
  sub_2510D5408(319, qword_26B2150B0, (void (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration);
  if (v0 <= 0x3F)
  {
    sub_2510D5408(319, &qword_26B214D50, MEMORY[0x263F07490]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *sub_2510D6798(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_2510FB420();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_2510FB3D0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t sub_2510D68A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2510FB420();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_2510FB3D0();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t sub_2510D6948(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2510FB420();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2510FB3D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t sub_2510D6A00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2510FB420();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2510FB3D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_2510D6AB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2510FB420();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2510FB3D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_2510D6B70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2510FB420();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2510FB3D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_2510D6C28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2510D6C3C);
}

uint64_t sub_2510D6C3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2510FB420();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_2510FB3D0();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_2510D6D34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2510D6D48);
}

uint64_t sub_2510D6D48(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_2510FB420();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_2510FB3D0();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t type metadata accessor for MedmojiIconConfiguration()
{
  uint64_t result = qword_26B215078;
  if (!qword_26B215078) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2510D6E98()
{
  uint64_t result = sub_2510FB420();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_2510FB3D0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t HKMedicationUserDomainConcept.title.getter()
{
  return sub_2510FB460();
}

unint64_t sub_2510D6FA0()
{
  unint64_t result = qword_269B20B50[0];
  if (!qword_269B20B50[0])
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, qword_269B20B50);
  }
  return result;
}

uint64_t HKMedicationUserDomainConcept.visualConfig.getter@<X0>(uint64_t a1@<X8>)
{
  unint64_t v2 = v1;
  sub_2510D71F4();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(v2, sel_userVisualizationConfigJSONString);
  if (v7)
  {
    uint64_t v8 = v7;
    sub_2510FBB70();

    sub_2510FB410();
    uint64_t v9 = sub_2510FB420();
    uint64_t v10 = *(void *)(v9 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v6, 1, v9) != 1)
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(a1, v6, v9);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v10 + 56))(a1, 0, 1, v9);
    }
    sub_2510D724C((uint64_t)v6);
  }
  uint64_t v11 = sub_2510FB420();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(a1, 1, 1, v11);
}

void sub_2510D71F4()
{
  if (!qword_26B215510)
  {
    sub_2510FB420();
    unint64_t v0 = sub_2510FBCE0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B215510);
    }
  }
}

uint64_t sub_2510D724C(uint64_t a1)
{
  sub_2510D71F4();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for MedicationsWidgetConfiguration()
{
  return &type metadata for MedicationsWidgetConfiguration;
}

uint64_t sub_2510D72B8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2510D72D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v35 = a1;
  sub_2510D7B44();
  uint64_t v2 = v1;
  uint64_t OpaqueTypeConformance2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510D7CCC();
  uint64_t v32 = v5;
  uint64_t v30 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  id v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510D7E38();
  uint64_t v33 = *(void *)(v8 - 8);
  uint64_t v34 = v8;
  MEMORY[0x270FA5388]();
  uint64_t v31 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510FBB70();
  type metadata accessor for MedicationsWidgetTimelineGenerator();
  swift_allocObject();
  uint64_t v40 = sub_2510E2800();
  sub_2510D7C18();
  uint64_t v10 = type metadata accessor for MedicationsWidgetEntryView();
  uint64_t v11 = sub_2510D7D9C(&qword_26B214F40, (void (*)(uint64_t))type metadata accessor for MedicationsWidgetEntryView);
  uint64_t v36 = v10;
  uint64_t v37 = v11;
  swift_getOpaqueTypeConformance2();
  sub_2510D7F48();
  sub_2510FBAA0();
  if (qword_26B215168 != -1) {
    swift_once();
  }
  uint64_t v36 = sub_2510FB130();
  uint64_t v37 = v12;
  uint64_t v13 = sub_2510D7D9C(&qword_26B215130, (void (*)(uint64_t))sub_2510D7B44);
  unint64_t v14 = sub_2510D7DE4();
  uint64_t v15 = MEMORY[0x263F8D310];
  sub_2510FB720();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(OpaqueTypeConformance2 + 8))(v4, v2);
  uint64_t v40 = sub_2510FB130();
  uint64_t v41 = v16;
  uint64_t v36 = v2;
  uint64_t v37 = v15;
  uint64_t v38 = v13;
  unint64_t v39 = v14;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v17 = v31;
  uint64_t v18 = v32;
  sub_2510FB700();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v7, v18);
  sub_2510D8048(0, qword_26B215170, MEMORY[0x263F1FD10], MEMORY[0x263F8E0F8]);
  uint64_t v19 = sub_2510FBA70();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(void *)(v20 + 72);
  unint64_t v22 = (*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_2510FC4B0;
  unint64_t v24 = v23 + v22;
  uint64_t v25 = *(void (**)(unint64_t, void, uint64_t))(v20 + 104);
  v25(v24, *MEMORY[0x263F1FD00], v19);
  v25(v24 + v21, *MEMORY[0x263F1FCF0], v19);
  v25(v24 + 2 * v21, *MEMORY[0x263F1FD08], v19);
  uint64_t v36 = v18;
  uint64_t v37 = MEMORY[0x263F8D310];
  uint64_t v38 = OpaqueTypeConformance2;
  unint64_t v39 = v14;
  swift_getOpaqueTypeConformance2();
  uint64_t v26 = v34;
  sub_2510FB710();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v17, v26);
}

uint64_t sub_2510D78D8(uint64_t a1)
{
  sub_2510D8048(0, &qword_26B215460, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v12 - v2;
  type metadata accessor for MedicationsWidgetEntry();
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for MedicationsWidgetEntryView();
  MEMORY[0x270FA5388]();
  uint64_t v8 = (uint64_t *)((char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2510D7F9C(a1, (uint64_t)v5);
  *uint64_t v8 = swift_getKeyPath();
  sub_2510D8048(0, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  swift_storeEnumTagMultiPayload();
  sub_2510D80AC((uint64_t)v5, (uint64_t)v8 + *(int *)(v6 + 20));
  id v9 = (id)HKMedicationsRoomDeepLink();
  sub_2510FB1C0();

  uint64_t v10 = sub_2510FB1D0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v3, 0, 1, v10);
  sub_2510D7D9C(&qword_26B214F40, (void (*)(uint64_t))type metadata accessor for MedicationsWidgetEntryView);
  sub_2510FB880();
  sub_2510D8110((uint64_t)v3);
  return sub_2510D819C((uint64_t)v8);
}

void sub_2510D7B44()
{
  if (!qword_26B215138)
  {
    sub_2510D7C18();
    type metadata accessor for MedicationsWidgetEntryView();
    sub_2510D7D9C(&qword_26B214F40, (void (*)(uint64_t))type metadata accessor for MedicationsWidgetEntryView);
    swift_getOpaqueTypeConformance2();
    unint64_t v0 = sub_2510FBAB0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B215138);
    }
  }
}

void sub_2510D7C18()
{
  if (!qword_26B215128)
  {
    type metadata accessor for MedicationsWidgetEntryView();
    sub_2510D7D9C(&qword_26B214F40, (void (*)(uint64_t))type metadata accessor for MedicationsWidgetEntryView);
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_26B215128);
    }
  }
}

void sub_2510D7CCC()
{
  if (!qword_26B215120)
  {
    sub_2510D7B44();
    sub_2510D7D9C(&qword_26B215130, (void (*)(uint64_t))sub_2510D7B44);
    sub_2510D7DE4();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_26B215120);
    }
  }
}

uint64_t sub_2510D7D9C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_2510D7DE4()
{
  unint64_t result = qword_26B215140;
  if (!qword_26B215140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B215140);
  }
  return result;
}

void sub_2510D7E38()
{
  if (!qword_26B215118)
  {
    sub_2510D7CCC();
    sub_2510D7B44();
    sub_2510D7D9C(&qword_26B215130, (void (*)(uint64_t))sub_2510D7B44);
    sub_2510D7DE4();
    swift_getOpaqueTypeConformance2();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_26B215118);
    }
  }
}

unint64_t sub_2510D7F48()
{
  unint64_t result = qword_26B214D60;
  if (!qword_26B214D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B214D60);
  }
  return result;
}

uint64_t sub_2510D7F9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MedicationsWidgetEntry();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2510D8000()
{
  return sub_2510FB600();
}

uint64_t sub_2510D8024()
{
  return sub_2510FB600();
}

void sub_2510D8048(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_2510D80AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MedicationsWidgetEntry();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2510D8110(uint64_t a1)
{
  sub_2510D8048(0, &qword_26B215460, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2510D819C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MedicationsWidgetEntryView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2510D81F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2510D830C()
{
  uint64_t v0 = sub_2510FB2E0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v29 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v30 = (char *)&v28 - v5;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  unint64_t v8 = (char *)&v28 - v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v28 - v9;
  uint64_t v11 = sub_2510FB300();
  uint64_t v32 = *(void *)(v11 - 8);
  uint64_t v33 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v31 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v28 - v14;
  sub_2510FB2D0();
  sub_2510FB2F0();
  uint64_t v16 = *MEMORY[0x263F07678];
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v28(v8, v16, v0);
  sub_2510D8B24();
  sub_2510FBBD0();
  sub_2510FBBD0();
  if (v36 == v34 && v37 == v35) {
    char v17 = 1;
  }
  else {
    char v17 = sub_2510FBE60();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v18 = *(void (**)(char *, uint64_t))(v1 + 8);
  v18(v8, v0);
  v18(v10, v0);
  uint64_t v20 = v31;
  uint64_t v19 = v32;
  uint64_t v21 = v33;
  (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v31, v15, v33);
  if (v17)
  {
    unint64_t v22 = *(void (**)(char *, uint64_t))(v19 + 8);
    v22(v20, v21);
    v22(v15, v21);
    char v23 = 1;
  }
  else
  {
    sub_2510FB2F0();
    unint64_t v24 = v29;
    v28(v29, *MEMORY[0x263F07680], v0);
    sub_2510FBBD0();
    sub_2510FBBD0();
    if (v36 == v34 && v37 == v35) {
      char v23 = 1;
    }
    else {
      char v23 = sub_2510FBE60();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v18(v24, v0);
    v18(v30, v0);
    uint64_t v25 = *(void (**)(char *, uint64_t))(v32 + 8);
    uint64_t v26 = v33;
    v25(v31, v33);
    v25(v15, v26);
  }
  return v23 & 1;
}

uint64_t sub_2510D8714(uint64_t a1)
{
  uint64_t v29 = sub_2510FB300();
  uint64_t v32 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v31 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_2510FB2E0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v28 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  int v27 = (char *)&v25 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v25 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v25 - v12;
  uint64_t v30 = a1;
  sub_2510FB2F0();
  uint64_t v14 = *MEMORY[0x263F07668];
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  v26(v11, v14, v3);
  sub_2510D8B24();
  sub_2510FBBD0();
  sub_2510FBBD0();
  if (v35 == v33 && v36 == v34) {
    char v15 = 1;
  }
  else {
    char v15 = sub_2510FBE60();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v4 + 8);
  v16(v11, v3);
  v16(v13, v3);
  uint64_t v18 = v31;
  uint64_t v17 = v32;
  uint64_t v19 = v29;
  (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v31, v30, v29);
  if (v15) {
    goto LABEL_9;
  }
  uint64_t v20 = v27;
  sub_2510FB2F0();
  v26(v28, *MEMORY[0x263F07670], v3);
  sub_2510FBBD0();
  sub_2510FBBD0();
  if (v35 == v33 && v36 == v34)
  {
    swift_bridgeObjectRelease_n();
    v16(v28, v3);
    v16(v20, v3);
    uint64_t v18 = v31;
    uint64_t v17 = v32;
LABEL_9:
    (*(void (**)(char *, uint64_t))(v17 + 8))(v18, v19);
    goto LABEL_10;
  }
  char v24 = sub_2510FBE60();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v16(v28, v3);
  v16(v20, v3);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v31, v19);
  if ((v24 & 1) == 0) {
    return 2;
  }
LABEL_10:
  uint64_t v21 = (void *)sub_2510FB2B0();
  id v22 = objc_msgSend(v21, sel_positionOfDayPeriodInFormattedTime);

  uint64_t result = 2;
  if ((unint64_t)v22 <= 2) {
    return (2 - v22);
  }
  return result;
}

unint64_t sub_2510D8B24()
{
  unint64_t result = qword_26B215480;
  if (!qword_26B215480)
  {
    sub_2510FB2E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B215480);
  }
  return result;
}

id sub_2510D8B7C()
{
  type metadata accessor for MedicationsWidgetTimelineGenerator();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_26B215D60 = (uint64_t)result;
  return result;
}

ValueMetadata *type metadata accessor for MedicationsWidgetTimelineProvider()
{
  return &type metadata for MedicationsWidgetTimelineProvider;
}

unint64_t sub_2510D8BE8()
{
  unint64_t result = qword_26B2154D0;
  if (!qword_26B2154D0)
  {
    type metadata accessor for MedicationsWidgetEntry();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2154D0);
  }
  return result;
}

uint64_t sub_2510D8C40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2510FBB10();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v32 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v25 - v8;
  uint64_t v10 = sub_2510FB4A0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510FB480();
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v14(v9, a1, v4);
  char v15 = sub_2510FB490();
  os_log_type_t v16 = sub_2510FBC70();
  int v31 = v16;
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v29 = v11;
    uint64_t v18 = v17;
    uint64_t v27 = swift_slowAlloc();
    uint64_t v34 = v27;
    *(_DWORD *)uint64_t v18 = 136446466;
    uint64_t v30 = a2;
    uint64_t v33 = sub_2510E2DF0(0xD000000000000021, 0x80000002510FC550, &v34);
    uint64_t v28 = v10;
    sub_2510FBCF0();
    *(_WORD *)(v18 + 12) = 2082;
    os_log_t v26 = v15;
    v14(v32, (uint64_t)v9, v4);
    uint64_t v19 = sub_2510FBB80();
    uint64_t v33 = sub_2510E2DF0(v19, v20, &v34);
    a2 = v30;
    sub_2510FBCF0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);
    os_log_t v21 = v26;
    _os_log_impl(&dword_2510D3000, v26, (os_log_type_t)v31, "[%{public}s] Returning placeholder for context %{public}s", (uint8_t *)v18, 0x16u);
    uint64_t v22 = v27;
    swift_arrayDestroy();
    MEMORY[0x253395510](v22, -1, -1);
    MEMORY[0x253395510](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v29 + 8))(v13, v28);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  sub_2510FB290();
  uint64_t v23 = type metadata accessor for MedicationsWidgetEntry();
  return sub_2510D4DFC((uint64_t *)(a2 + *(int *)(v23 + 20)));
}

uint64_t sub_2510D8FBC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t v8 = sub_2510FBB10();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v35 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v28 - v12;
  uint64_t v14 = sub_2510FB4A0();
  uint64_t v36 = *(void *)(v14 - 8);
  uint64_t v37 = v14;
  MEMORY[0x270FA5388](v14);
  os_log_type_t v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510FB480();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v17(v13, a2, v8);
  uint64_t v18 = sub_2510FB490();
  os_log_type_t v19 = sub_2510FBC70();
  int v34 = v19;
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v31 = a1;
    uint64_t v21 = v20;
    uint64_t v30 = swift_slowAlloc();
    uint64_t v39 = v30;
    *(_DWORD *)uint64_t v21 = 136446466;
    uint64_t v33 = a3;
    uint64_t v38 = sub_2510E2DF0(0xD000000000000021, 0x80000002510FC550, &v39);
    uint64_t v32 = a4;
    sub_2510FBCF0();
    *(_WORD *)(v21 + 12) = 2082;
    os_log_t v29 = v18;
    v17(v35, (uint64_t)v13, v8);
    uint64_t v22 = sub_2510FBB80();
    uint64_t v38 = sub_2510E2DF0(v22, v23, &v39);
    a3 = v33;
    sub_2510FBCF0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
    os_log_t v24 = v29;
    _os_log_impl(&dword_2510D3000, v29, (os_log_type_t)v34, "[%{public}s] Returning snapshot for context %{public}s", (uint8_t *)v21, 0x16u);
    uint64_t v25 = v30;
    swift_arrayDestroy();
    MEMORY[0x253395510](v25, -1, -1);
    uint64_t v26 = v21;
    a1 = v31;
    MEMORY[0x253395510](v26, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
  }
  (*(void (**)(char *, uint64_t))(v36 + 8))(v16, v37);
  return a3(a1);
}

uint64_t sub_2510D931C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v56 = a4;
  uint64_t v50 = a2;
  uint64_t v51 = a3;
  uint64_t v57 = sub_2510FBA70();
  uint64_t v55 = *(void *)(v57 - 8);
  MEMORY[0x270FA5388](v57);
  v52 = (char *)v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2510FB2A0();
  uint64_t v53 = *(void *)(v6 - 8);
  uint64_t v54 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v59 = (uint64_t)v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2510FBB10();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  v49 = (char *)v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v42 - v13;
  MEMORY[0x270FA5388](v12);
  os_log_type_t v16 = (char *)v42 - v15;
  uint64_t v17 = sub_2510FB4A0();
  uint64_t v47 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  os_log_type_t v19 = (char *)v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510FB480();
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  uint64_t v48 = a1;
  v20(v16, a1, v8);
  uint64_t v21 = sub_2510FB490();
  os_log_type_t v22 = sub_2510FBC70();
  LODWORD(v46) = v22;
  BOOL v23 = os_log_type_enabled(v21, v22);
  uint64_t v58 = v9 + 16;
  if (v23)
  {
    uint64_t v24 = swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    v61[0] = v43;
    *(_DWORD *)uint64_t v24 = 136446466;
    uint64_t v44 = v17;
    uint64_t v60 = sub_2510E2DF0(0xD000000000000021, 0x80000002510FC550, v61);
    uint64_t v45 = v9;
    sub_2510FBCF0();
    *(_WORD *)(v24 + 12) = 2082;
    v42[1] = v24 + 14;
    v20(v14, (uint64_t)v16, v8);
    uint64_t v25 = sub_2510FBB80();
    uint64_t v60 = sub_2510E2DF0(v25, v26, v61);
    uint64_t v9 = v45;
    sub_2510FBCF0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v16, v8);
    _os_log_impl(&dword_2510D3000, v21, (os_log_type_t)v46, "[%{public}s] Requesting timeline for context %{public}s", (uint8_t *)v24, 0x16u);
    uint64_t v27 = v43;
    swift_arrayDestroy();
    MEMORY[0x253395510](v27, -1, -1);
    MEMORY[0x253395510](v24, -1, -1);

    (*(void (**)(char *, uint64_t))(v47 + 8))(v19, v44);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v16, v8);

    (*(void (**)(char *, uint64_t))(v47 + 8))(v19, v17);
  }
  uint64_t v28 = v48;
  v20(v14, v48, v8);
  uint64_t v29 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v30 = v8;
  uint64_t v31 = (v29 + 16) & ~v29;
  uint64_t v47 = v29 | 7;
  unint64_t v32 = (v10 + v31 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v33 = swift_allocObject();
  v46 = *(void (**)(uint64_t, char *, uint64_t))(v9 + 32);
  v46(v33 + v31, v14, v30);
  int v34 = (void *)(v33 + v32);
  uint64_t v35 = v51;
  *int v34 = v50;
  v34[1] = v35;
  swift_retain();
  sub_2510FB290();
  uint64_t v36 = (uint64_t)v52;
  sub_2510FBB00();
  uint64_t v37 = v49;
  v20(v49, v28, v30);
  uint64_t v38 = swift_allocObject();
  v46(v38 + v31, v37, v30);
  uint64_t v39 = (uint64_t (**)(uint64_t))(v38 + v32);
  *uint64_t v39 = sub_2510DA324;
  v39[1] = (uint64_t (*)(uint64_t))v33;
  swift_retain();
  uint64_t v40 = v59;
  sub_2510DEC98(v59, v36, (uint64_t)sub_2510DA340, v38);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v36, v57);
  (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v40, v54);
  return swift_release();
}

uint64_t sub_2510D991C(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  uint64_t v45 = a1;
  uint64_t v7 = sub_2510FBAD0();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v43 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510DA358();
  uint64_t v46 = v9;
  uint64_t v44 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  v42 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2510FBB10();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v35 - v16;
  uint64_t v18 = sub_2510FB4A0();
  uint64_t v40 = *(void *)(v18 - 8);
  uint64_t v41 = v18;
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v35 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510FB480();
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v21(v17, a2, v11);
  os_log_type_t v22 = sub_2510FB490();
  os_log_type_t v23 = sub_2510FBC70();
  int v39 = v23;
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = swift_slowAlloc();
    os_log_t v35 = v22;
    uint64_t v25 = v24;
    uint64_t v36 = swift_slowAlloc();
    uint64_t v48 = v36;
    *(_DWORD *)uint64_t v25 = 136446466;
    uint64_t v37 = a4;
    uint64_t v47 = sub_2510E2DF0(0xD000000000000021, 0x80000002510FC550, &v48);
    uint64_t v38 = a3;
    sub_2510FBCF0();
    *(_WORD *)(v25 + 12) = 2082;
    v21(v15, (uint64_t)v17, v11);
    uint64_t v26 = sub_2510FBB80();
    uint64_t v47 = sub_2510E2DF0(v26, v27, &v48);
    a3 = v38;
    sub_2510FBCF0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
    os_log_t v28 = v35;
    _os_log_impl(&dword_2510D3000, v35, (os_log_type_t)v39, "[%{public}s] Returning timeline for context %{public}s", (uint8_t *)v25, 0x16u);
    uint64_t v29 = v36;
    swift_arrayDestroy();
    MEMORY[0x253395510](v29, -1, -1);
    MEMORY[0x253395510](v25, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
  }
  (*(void (**)(char *, uint64_t))(v40 + 8))(v20, v41);
  sub_2510DA3BC();
  uint64_t v30 = *(void *)(type metadata accessor for MedicationsWidgetEntry() - 8);
  unint64_t v31 = (*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  uint64_t v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_2510FC560;
  sub_2510D7F9C(v45, v32 + v31);
  sub_2510FBAC0();
  sub_2510D8BE8();
  uint64_t v33 = v42;
  sub_2510FBB20();
  a3(v33);
  return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v33, v46);
}

uint64_t sub_2510D9E10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v24 = a2;
  uint64_t v25 = a3;
  uint64_t v5 = sub_2510FBB10();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_2510FBA70();
  uint64_t v9 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_2510FB2A0();
  uint64_t v12 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v14 = (char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21[1] = *v3;
  sub_2510FB290();
  sub_2510FBB00();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  unint64_t v15 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v16 = (v7 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v17 + v15, v8, v5);
  uint64_t v18 = (void *)(v17 + v16);
  uint64_t v19 = v25;
  void *v18 = v24;
  v18[1] = v19;
  swift_retain();
  sub_2510DEC98((uint64_t)v14, (uint64_t)v11, (uint64_t)sub_2510DA340, v17);
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v23);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v22);
}

uint64_t sub_2510DA0BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2510D931C(a1, a2, a3, *v3);
}

uint64_t sub_2510DA0C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_2510DA178;
  return MEMORY[0x270F07720](a1, a2, a3);
}

uint64_t sub_2510DA178()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2510DA26C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_2510DA574;
  return MEMORY[0x270F07728](a1, a2, a3);
}

uint64_t sub_2510DA324(uint64_t a1)
{
  return sub_2510DA4C0(a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_2510D991C);
}

uint64_t sub_2510DA340(uint64_t a1)
{
  return sub_2510DA4C0(a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_2510D8FBC);
}

void sub_2510DA358()
{
  if (!qword_269B20B68)
  {
    type metadata accessor for MedicationsWidgetEntry();
    sub_2510D8BE8();
    unint64_t v0 = sub_2510FBB30();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B20B68);
    }
  }
}

void sub_2510DA3BC()
{
  if (!qword_269B20B70)
  {
    type metadata accessor for MedicationsWidgetEntry();
    unint64_t v0 = sub_2510FBE50();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B20B70);
    }
  }
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = sub_2510FBB10();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_2510DA4C0(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(sub_2510FBB10() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v2 + v5;
  uint64_t v7 = (uint64_t *)(v2 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v8 = *v7;
  uint64_t v9 = v7[1];

  return a2(a1, v6, v8, v9);
}

uint64_t *sub_2510DA578(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    uint64_t v9 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_2510DE1E8(0, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_2510FBA70();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v10 = *(int *)(a3 + 20);
    int v39 = a1;
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v13 = sub_2510FB2A0();
    uint64_t v37 = *(void *)(v13 - 8);
    uint64_t v38 = v13;
    os_log_t v35 = *(void (**)(char *, char *))(v37 + 16);
    v35(v11, v12);
    uint64_t v14 = *(int *)(type metadata accessor for MedicationsWidgetEntry() + 20);
    unint64_t v15 = &v11[v14];
    unint64_t v16 = &v12[v14];
    uint64_t v17 = *(void *)&v12[v14 + 8];
    *(void *)unint64_t v15 = *(void *)&v12[v14];
    *((void *)v15 + 1) = v17;
    *((void *)v15 + 2) = *(void *)&v12[v14 + 16];
    uint64_t v18 = (int *)type metadata accessor for MedicationsWidgetViewModel();
    uint64_t v19 = v18[6];
    __dst = &v15[v19];
    uint64_t v20 = &v16[v19];
    uint64_t v21 = type metadata accessor for MedmojiIconConfiguration();
    uint64_t v22 = *(void *)(v21 - 8);
    uint64_t v23 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v23(v20, 1, v21))
    {
      sub_2510DE1E8(0, qword_26B2150B0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, MEMORY[0x263F8D8F0]);
      memcpy(__dst, v20, *(void *)(*(void *)(v24 - 8) + 64));
    }
    else
    {
      uint64_t v25 = sub_2510FB420();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(__dst, v20, v25);
      uint64_t v26 = *(int *)(v21 + 20);
      unint64_t v27 = &__dst[v26];
      os_log_t v28 = &v20[v26];
      uint64_t v29 = sub_2510FB3D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 16))(v27, v28, v29);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(__dst, 0, 1, v21);
    }
    v15[v18[7]] = v16[v18[7]];
    uint64_t v30 = v18[8];
    unint64_t v31 = &v15[v30];
    uint64_t v32 = &v16[v30];
    uint64_t v9 = v39;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(&v16[v30], 1, v38))
    {
      sub_2510DE1E8(0, &qword_26B214D50, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
      memcpy(v31, v32, *(void *)(*(void *)(v33 - 8) + 64));
    }
    else
    {
      ((void (*)(char *, char *, uint64_t))v35)(v31, v32, v38);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v31, 0, 1, v38);
    }
  }
  return v9;
}

uint64_t sub_2510DA9E0(uint64_t a1, uint64_t a2)
{
  sub_2510DE1E8(0, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_2510FBA70();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_2510FB2A0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v17(v5, v6);
  uint64_t v8 = v5 + *(int *)(type metadata accessor for MedicationsWidgetEntry() + 20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v10 = v8 + *(int *)(v9 + 24);
  uint64_t v11 = type metadata accessor for MedmojiIconConfiguration();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(v10, 1, v11))
  {
    uint64_t v12 = sub_2510FB420();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v10, v12);
    uint64_t v13 = v10 + *(int *)(v11 + 20);
    uint64_t v14 = sub_2510FB3D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  }
  uint64_t v15 = v8 + *(int *)(v9 + 32);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v15, 1, v6);
  if (!result)
  {
    return ((uint64_t (*)(uint64_t, uint64_t))v17)(v15, v6);
  }
  return result;
}

void *sub_2510DAC74(void *a1, void *a2, uint64_t a3)
{
  sub_2510DE1E8(0, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_2510FBA70();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_2510FB2A0();
  uint64_t v34 = *(void *)(v10 - 8);
  uint64_t v35 = v10;
  uint64_t v32 = *(void (**)(char *, char *))(v34 + 16);
  v32(v8, v9);
  uint64_t v11 = *(int *)(type metadata accessor for MedicationsWidgetEntry() + 20);
  uint64_t v12 = &v8[v11];
  uint64_t v13 = &v9[v11];
  uint64_t v14 = *(void *)&v9[v11 + 8];
  *(void *)uint64_t v12 = *(void *)&v9[v11];
  *((void *)v12 + 1) = v14;
  *((void *)v12 + 2) = *(void *)&v9[v11 + 16];
  uint64_t v15 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v16 = v15[6];
  __dst = &v12[v16];
  uint64_t v17 = &v13[v16];
  uint64_t v18 = type metadata accessor for MedmojiIconConfiguration();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v20(v17, 1, v18))
  {
    sub_2510DE1E8(0, qword_26B2150B0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, MEMORY[0x263F8D8F0]);
    memcpy(__dst, v17, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    uint64_t v22 = sub_2510FB420();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(__dst, v17, v22);
    uint64_t v23 = *(int *)(v18 + 20);
    uint64_t v24 = &__dst[v23];
    uint64_t v25 = &v17[v23];
    uint64_t v26 = sub_2510FB3D0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(__dst, 0, 1, v18);
  }
  v12[v15[7]] = v13[v15[7]];
  uint64_t v27 = v15[8];
  os_log_t v28 = &v12[v27];
  uint64_t v29 = &v13[v27];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(&v13[v27], 1, v35))
  {
    sub_2510DE1E8(0, &qword_26B214D50, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
    memcpy(v28, v29, *(void *)(*(void *)(v30 - 8) + 64));
  }
  else
  {
    ((void (*)(char *, char *, uint64_t))v32)(v28, v29, v35);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v28, 0, 1, v35);
  }
  return a1;
}

void *sub_2510DB08C(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_2510DB5F0((uint64_t)a1);
    sub_2510DE1E8(0, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_2510FBA70();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v46 = a1;
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_2510FB2A0();
  uint64_t v44 = *(void *)(v10 - 8);
  uint64_t v45 = v10;
  uint64_t v43 = *(void (**)(char *, char *))(v44 + 24);
  v43(v8, v9);
  uint64_t v11 = *(int *)(type metadata accessor for MedicationsWidgetEntry() + 20);
  uint64_t v12 = &v8[v11];
  uint64_t v13 = &v9[v11];
  *(void *)uint64_t v12 = *(void *)&v9[v11];
  *((void *)v12 + 1) = *(void *)&v9[v11 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v12 + 2) = *((void *)v13 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v15 = v14[6];
  uint64_t v16 = &v12[v15];
  uint64_t v17 = &v13[v15];
  uint64_t v18 = type metadata accessor for MedmojiIconConfiguration();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
  int v21 = v20(v16, 1, v18);
  int v22 = v20(v17, 1, v18);
  if (v21)
  {
    if (!v22)
    {
      uint64_t v23 = sub_2510FB420();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16))(v16, v17, v23);
      uint64_t v24 = *(int *)(v18 + 20);
      uint64_t v25 = &v16[v24];
      uint64_t v26 = &v17[v24];
      uint64_t v27 = sub_2510FB3D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (v22)
  {
    sub_2510DE5A0((uint64_t)v16, (uint64_t (*)(void))type metadata accessor for MedmojiIconConfiguration);
LABEL_11:
    sub_2510DE1E8(0, qword_26B2150B0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, MEMORY[0x263F8D8F0]);
    memcpy(v16, v17, *(void *)(*(void *)(v28 - 8) + 64));
    goto LABEL_12;
  }
  uint64_t v38 = sub_2510FB420();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 24))(v16, v17, v38);
  uint64_t v39 = *(int *)(v18 + 20);
  uint64_t v40 = &v16[v39];
  uint64_t v41 = &v17[v39];
  uint64_t v42 = sub_2510FB3D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 24))(v40, v41, v42);
LABEL_12:
  v12[v14[7]] = v13[v14[7]];
  uint64_t v29 = v14[8];
  uint64_t v30 = &v12[v29];
  unint64_t v31 = &v13[v29];
  uint64_t v32 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v44 + 48);
  int v33 = v32(&v12[v29], 1, v45);
  int v34 = v32(v31, 1, v45);
  if (!v33)
  {
    uint64_t v35 = v46;
    if (!v34)
    {
      ((void (*)(char *, char *, uint64_t))v43)(v30, v31, v45);
      return v35;
    }
    (*(void (**)(char *, uint64_t))(v44 + 8))(v30, v45);
    goto LABEL_17;
  }
  uint64_t v35 = v46;
  if (v34)
  {
LABEL_17:
    sub_2510DE1E8(0, &qword_26B214D50, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
    memcpy(v30, v31, *(void *)(*(void *)(v36 - 8) + 64));
    return v35;
  }
  (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v30, v31, v45);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v44 + 56))(v30, 0, 1, v45);
  return v35;
}

uint64_t sub_2510DB5F0(uint64_t a1)
{
  sub_2510DE1E8(0, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *sub_2510DB67C(char *a1, char *a2, uint64_t a3)
{
  sub_2510DE1E8(0, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  uint64_t v7 = v6;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_2510FBA70();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = sub_2510FB2A0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
  v37(v10, v11, v12);
  uint64_t v14 = *(int *)(type metadata accessor for MedicationsWidgetEntry() + 20);
  uint64_t v15 = &v10[v14];
  uint64_t v16 = &v11[v14];
  *(_OWORD *)uint64_t v15 = *(_OWORD *)&v11[v14];
  *((void *)v15 + 2) = *(void *)&v11[v14 + 16];
  uint64_t v17 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v18 = v17[6];
  uint64_t v19 = &v15[v18];
  uint64_t v20 = &v16[v18];
  uint64_t v21 = type metadata accessor for MedmojiIconConfiguration();
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    sub_2510DE1E8(0, qword_26B2150B0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, MEMORY[0x263F8D8F0]);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    uint64_t v24 = sub_2510FB420();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v19, v20, v24);
    uint64_t v25 = *(int *)(v21 + 20);
    uint64_t v36 = v13;
    uint64_t v26 = a1;
    uint64_t v27 = &v19[v25];
    uint64_t v28 = &v20[v25];
    uint64_t v29 = sub_2510FB3D0();
    uint64_t v30 = v27;
    a1 = v26;
    uint64_t v13 = v36;
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 32))(v30, v28, v29);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  v15[v17[7]] = v16[v17[7]];
  uint64_t v31 = v17[8];
  uint64_t v32 = &v15[v31];
  int v33 = &v16[v31];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(&v16[v31], 1, v12))
  {
    sub_2510DE1E8(0, &qword_26B214D50, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
    memcpy(v32, v33, *(void *)(*(void *)(v34 - 8) + 64));
  }
  else
  {
    v37(v32, v33, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v32, 0, 1, v12);
  }
  return a1;
}

char *sub_2510DBA88(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_2510DB5F0((uint64_t)a1);
    sub_2510DE1E8(0, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
    uint64_t v7 = v6;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v8 = sub_2510FBA70();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
    }
  }
  uint64_t v9 = *(int *)(a3 + 20);
  v49 = a1;
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = sub_2510FB2A0();
  uint64_t v47 = *(void *)(v12 - 8);
  uint64_t v48 = v12;
  uint64_t v46 = *(void (**)(char *, char *))(v47 + 40);
  v46(v10, v11);
  uint64_t v13 = *(int *)(type metadata accessor for MedicationsWidgetEntry() + 20);
  uint64_t v14 = &v10[v13];
  uint64_t v15 = &v11[v13];
  uint64_t v16 = *(void *)&v11[v13 + 8];
  *(void *)uint64_t v14 = *(void *)&v11[v13];
  *((void *)v14 + 1) = v16;
  swift_bridgeObjectRelease();
  *((void *)v14 + 2) = *((void *)v15 + 2);
  swift_bridgeObjectRelease();
  uint64_t v17 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v18 = v17[6];
  uint64_t v19 = &v14[v18];
  uint64_t v20 = &v15[v18];
  uint64_t v21 = type metadata accessor for MedmojiIconConfiguration();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48);
  int v24 = v23(v19, 1, v21);
  int v25 = v23(v20, 1, v21);
  if (v24)
  {
    if (!v25)
    {
      uint64_t v26 = sub_2510FB420();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(v19, v20, v26);
      uint64_t v27 = *(int *)(v21 + 20);
      uint64_t v28 = &v19[v27];
      uint64_t v29 = &v20[v27];
      uint64_t v30 = sub_2510FB3D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 32))(v28, v29, v30);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (v25)
  {
    sub_2510DE5A0((uint64_t)v19, (uint64_t (*)(void))type metadata accessor for MedmojiIconConfiguration);
LABEL_10:
    sub_2510DE1E8(0, qword_26B2150B0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, MEMORY[0x263F8D8F0]);
    memcpy(v19, v20, *(void *)(*(void *)(v31 - 8) + 64));
    goto LABEL_11;
  }
  uint64_t v41 = sub_2510FB420();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v41 - 8) + 40))(v19, v20, v41);
  uint64_t v42 = *(int *)(v21 + 20);
  uint64_t v43 = &v19[v42];
  uint64_t v44 = &v20[v42];
  uint64_t v45 = sub_2510FB3D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v45 - 8) + 40))(v43, v44, v45);
LABEL_11:
  v14[v17[7]] = v15[v17[7]];
  uint64_t v32 = v17[8];
  int v33 = &v14[v32];
  uint64_t v34 = &v15[v32];
  uint64_t v35 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v47 + 48);
  int v36 = v35(&v14[v32], 1, v48);
  int v37 = v35(v34, 1, v48);
  if (!v36)
  {
    uint64_t v38 = v49;
    if (!v37)
    {
      ((void (*)(char *, char *, uint64_t))v46)(v33, v34, v48);
      return v38;
    }
    (*(void (**)(char *, uint64_t))(v47 + 8))(v33, v48);
    goto LABEL_16;
  }
  uint64_t v38 = v49;
  if (v37)
  {
LABEL_16:
    sub_2510DE1E8(0, &qword_26B214D50, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
    memcpy(v33, v34, *(void *)(*(void *)(v39 - 8) + 64));
    return v38;
  }
  (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v33, v34, v48);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v47 + 56))(v33, 0, 1, v48);
  return v38;
}

uint64_t sub_2510DBFDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2510DBFF0);
}

uint64_t sub_2510DBFF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2510DE1E8(0, &qword_26B215568, MEMORY[0x263F1FD10], MEMORY[0x263F185D0]);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = type metadata accessor for MedicationsWidgetEntry();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_2510DC118(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2510DC12C);
}

uint64_t sub_2510DC12C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_2510DE1E8(0, &qword_26B215568, MEMORY[0x263F1FD10], MEMORY[0x263F185D0]);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = type metadata accessor for MedicationsWidgetEntry();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t type metadata accessor for MedicationsWidgetEntryView()
{
  uint64_t result = qword_26B214F48;
  if (!qword_26B214F48) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2510DC2AC()
{
  sub_2510DE1E8(319, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  if (v0 <= 0x3F)
  {
    type metadata accessor for MedicationsWidgetEntry();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_2510DC3A4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2510DC3C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v89 = a1;
  uint64_t v2 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x263F19B20];
  sub_2510DD2F4(0, &qword_26B2155D8, MEMORY[0x263F19B20]);
  uint64_t v76 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v77 = (uint64_t)&v72 - v4;
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x263F19B28];
  sub_2510DD2F4(0, &qword_26B215620, MEMORY[0x263F19B28]);
  uint64_t v88 = v6;
  MEMORY[0x270FA5388](v6);
  v78 = (char *)&v72 - v7;
  uint64_t v75 = type metadata accessor for MedicationsWidgetRectangularView();
  MEMORY[0x270FA5388](v75);
  uint64_t v73 = (uint64_t)&v72 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185D0];
  sub_2510DE1E8(0, &qword_269B20B78, MEMORY[0x263F18FF8], MEMORY[0x263F185D0]);
  MEMORY[0x270FA5388](v10 - 8);
  v74 = (uint64_t *)((char *)&v72 - v11);
  uint64_t v84 = type metadata accessor for MedicationsWidgetInlineView();
  MEMORY[0x270FA5388](v84);
  v72 = (char *)&v72 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510DE760(0, &qword_26B2155F8, v2);
  uint64_t v85 = v13;
  MEMORY[0x270FA5388](v13);
  uint64_t v87 = (uint64_t)&v72 - v14;
  sub_2510DD35C(0, &qword_26B2155D0, v2);
  uint64_t v81 = v15;
  MEMORY[0x270FA5388](v15);
  uint64_t v82 = (uint64_t)&v72 - v16;
  sub_2510DD35C(0, &qword_26B215610, v5);
  uint64_t v86 = v17;
  MEMORY[0x270FA5388](v17);
  v83 = (char *)&v72 - v18;
  uint64_t v19 = sub_2510FB300();
  uint64_t v79 = *(void *)(v19 - 8);
  uint64_t v80 = v19;
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v72 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510DE1E8(0, &qword_26B215560, MEMORY[0x263F1FC90], v9);
  MEMORY[0x270FA5388](v22 - 8);
  int v24 = (uint64_t *)((char *)&v72 - v23);
  sub_2510DE1E8(0, &qword_26B215568, MEMORY[0x263F1FD10], v9);
  MEMORY[0x270FA5388](v25 - 8);
  uint64_t v27 = (uint64_t *)((char *)&v72 - v26);
  uint64_t v28 = type metadata accessor for MedicationsWidgetViewModel();
  MEMORY[0x270FA5388](v28 - 8);
  uint64_t v30 = (char *)&v72 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = (int *)type metadata accessor for MedicationsWidgetCircularView(0);
  MEMORY[0x270FA5388](v31);
  int v33 = (char *)&v72 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_2510FBA70();
  uint64_t v35 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  int v37 = (char *)&v72 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510DD3CC((uint64_t)v37);
  int v38 = (*(uint64_t (**)(char *, uint64_t))(v35 + 88))(v37, v34);
  if (MEMORY[0x263F1FCE8] && v38 == *MEMORY[0x263F1FCE8] || v38 == *MEMORY[0x263F1FD00])
  {
    uint64_t v54 = v1 + *(int *)(type metadata accessor for MedicationsWidgetEntryView() + 20);
    uint64_t v55 = type metadata accessor for MedicationsWidgetEntry();
    sub_2510DE440(v54 + *(int *)(v55 + 20), (uint64_t)v30, (uint64_t (*)(void))type metadata accessor for MedicationsWidgetViewModel);
    *uint64_t v27 = swift_getKeyPath();
    uint64_t v56 = (uint64_t (*)(uint64_t))MEMORY[0x263F1FD10];
    uint64_t v57 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
    sub_2510DE1E8(0, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
    swift_storeEnumTagMultiPayload();
    *int v24 = swift_getKeyPath();
    uint64_t v58 = (uint64_t (*)(uint64_t))MEMORY[0x263F1FC90];
    sub_2510DE1E8(0, &qword_26B215558, MEMORY[0x263F1FC90], v57);
    swift_storeEnumTagMultiPayload();
    sub_2510FB2D0();
    LOBYTE(v57) = sub_2510D8714((uint64_t)v21);
    (*(void (**)(char *, uint64_t))(v79 + 8))(v21, v80);
    sub_2510DE35C((uint64_t)v27, (uint64_t)v33, &qword_26B215568, v56);
    sub_2510DE35C((uint64_t)v24, (uint64_t)&v33[v31[5]], &qword_26B215560, v58);
    sub_2510DE3DC((uint64_t)v30, (uint64_t)&v33[v31[6]]);
    v33[v31[7]] = (char)v57;
    sub_2510DE440((uint64_t)v33, v82, type metadata accessor for MedicationsWidgetCircularView);
    swift_storeEnumTagMultiPayload();
    sub_2510DE600(&qword_26B2154A0, (void (*)(uint64_t))type metadata accessor for MedicationsWidgetCircularView);
    sub_2510DE600(&qword_26B215488, (void (*)(uint64_t))type metadata accessor for MedicationsWidgetInlineView);
    uint64_t v59 = (uint64_t)v83;
    sub_2510FB740();
    sub_2510DE4A8(v59, v87, (uint64_t)&qword_26B215610, (uint64_t (*)(void, uint64_t, void))sub_2510DD35C);
    swift_storeEnumTagMultiPayload();
    sub_2510DD6C0();
    sub_2510DD7B4();
    sub_2510FB740();
    sub_2510DE528(v59, (uint64_t)&qword_26B215610, (uint64_t (*)(void, uint64_t, void))sub_2510DD35C);
    return sub_2510DE5A0((uint64_t)v33, type metadata accessor for MedicationsWidgetCircularView);
  }
  else if (v38 == *MEMORY[0x263F1FD08])
  {
    uint64_t v39 = v1 + *(int *)(type metadata accessor for MedicationsWidgetEntryView() + 20);
    uint64_t v40 = type metadata accessor for MedicationsWidgetEntry();
    sub_2510DE440(v39 + *(int *)(v40 + 20), (uint64_t)v30, (uint64_t (*)(void))type metadata accessor for MedicationsWidgetViewModel);
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v42 = v74;
    uint64_t *v74 = KeyPath;
    uint64_t v43 = (uint64_t (*)(uint64_t))MEMORY[0x263F18FF8];
    uint64_t v44 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
    sub_2510DE1E8(0, &qword_269B20B80, MEMORY[0x263F18FF8], MEMORY[0x263F185C8]);
    swift_storeEnumTagMultiPayload();
    *uint64_t v27 = swift_getKeyPath();
    uint64_t v45 = (uint64_t (*)(uint64_t))MEMORY[0x263F1FD10];
    sub_2510DE1E8(0, &qword_26B215110, MEMORY[0x263F1FD10], v44);
    swift_storeEnumTagMultiPayload();
    *int v24 = swift_getKeyPath();
    uint64_t v46 = (uint64_t (*)(uint64_t))MEMORY[0x263F1FC90];
    sub_2510DE1E8(0, &qword_26B215558, MEMORY[0x263F1FC90], v44);
    swift_storeEnumTagMultiPayload();
    uint64_t v47 = swift_getKeyPath();
    uint64_t v48 = (uint64_t)v42;
    uint64_t v49 = v73;
    sub_2510DE35C(v48, v73, &qword_269B20B78, v43);
    uint64_t v50 = (int *)v75;
    sub_2510DE35C((uint64_t)v27, v49 + *(int *)(v75 + 20), &qword_26B215568, v45);
    sub_2510DE35C((uint64_t)v24, v49 + v50[6], &qword_26B215560, v46);
    uint64_t v51 = v49 + v50[7];
    *(void *)uint64_t v51 = v47;
    *(unsigned char *)(v51 + 8) = 0;
    sub_2510DE3DC((uint64_t)v30, v49 + v50[8]);
    sub_2510DE440(v49, v77, (uint64_t (*)(void))type metadata accessor for MedicationsWidgetRectangularView);
    swift_storeEnumTagMultiPayload();
    sub_2510DE600(&qword_26B2154B8, (void (*)(uint64_t))type metadata accessor for MedicationsWidgetRectangularView);
    uint64_t v52 = (uint64_t)v78;
    sub_2510FB740();
    sub_2510DE4A8(v52, v87, (uint64_t)&qword_26B215620, (uint64_t (*)(void, uint64_t, void))sub_2510DD2F4);
    swift_storeEnumTagMultiPayload();
    sub_2510DD6C0();
    sub_2510DD7B4();
    sub_2510FB740();
    sub_2510DE528(v52, (uint64_t)&qword_26B215620, (uint64_t (*)(void, uint64_t, void))sub_2510DD2F4);
    return sub_2510DE5A0(v49, (uint64_t (*)(void))type metadata accessor for MedicationsWidgetRectangularView);
  }
  else if (v38 == *MEMORY[0x263F1FCF0])
  {
    uint64_t v60 = v1 + *(int *)(type metadata accessor for MedicationsWidgetEntryView() + 20);
    uint64_t v61 = type metadata accessor for MedicationsWidgetEntry();
    uint64_t v62 = (uint64_t)v30;
    sub_2510DE440(v60 + *(int *)(v61 + 20), (uint64_t)v30, (uint64_t (*)(void))type metadata accessor for MedicationsWidgetViewModel);
    uint64_t v63 = swift_getKeyPath();
    uint64_t v64 = (uint64_t)v74;
    uint64_t *v74 = v63;
    v65 = (uint64_t (*)(uint64_t))MEMORY[0x263F18FF8];
    v66 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
    sub_2510DE1E8(0, &qword_269B20B80, MEMORY[0x263F18FF8], MEMORY[0x263F185C8]);
    swift_storeEnumTagMultiPayload();
    uint64_t v67 = swift_getKeyPath();
    uint64_t v68 = v84;
    uint64_t v69 = (uint64_t)v72;
    *(void *)&v72[*(int *)(v84 + 20)] = v67;
    sub_2510DE1E8(0, &qword_26B215110, MEMORY[0x263F1FD10], v66);
    swift_storeEnumTagMultiPayload();
    sub_2510DE35C(v64, v69, &qword_269B20B78, v65);
    sub_2510DE3DC(v62, v69 + *(int *)(v68 + 24));
    sub_2510DE440(v69, v82, (uint64_t (*)(void))type metadata accessor for MedicationsWidgetInlineView);
    swift_storeEnumTagMultiPayload();
    sub_2510DE600(&qword_26B2154A0, (void (*)(uint64_t))type metadata accessor for MedicationsWidgetCircularView);
    sub_2510DE600(&qword_26B215488, (void (*)(uint64_t))type metadata accessor for MedicationsWidgetInlineView);
    uint64_t v70 = (uint64_t)v83;
    sub_2510FB740();
    sub_2510DE4A8(v70, v87, (uint64_t)&qword_26B215610, (uint64_t (*)(void, uint64_t, void))sub_2510DD35C);
    swift_storeEnumTagMultiPayload();
    sub_2510DD6C0();
    sub_2510DD7B4();
    sub_2510FB740();
    sub_2510DE528(v70, (uint64_t)&qword_26B215610, (uint64_t (*)(void, uint64_t, void))sub_2510DD35C);
    return sub_2510DE5A0(v69, (uint64_t (*)(void))type metadata accessor for MedicationsWidgetInlineView);
  }
  else
  {
    swift_storeEnumTagMultiPayload();
    sub_2510DE600(&qword_26B2154B8, (void (*)(uint64_t))type metadata accessor for MedicationsWidgetRectangularView);
    uint64_t v71 = (uint64_t)v78;
    sub_2510FB740();
    sub_2510DE4A8(v71, v87, (uint64_t)&qword_26B215620, (uint64_t (*)(void, uint64_t, void))sub_2510DD2F4);
    swift_storeEnumTagMultiPayload();
    sub_2510DD6C0();
    sub_2510DD7B4();
    sub_2510FB740();
    sub_2510DE528(v71, (uint64_t)&qword_26B215620, (uint64_t (*)(void, uint64_t, void))sub_2510DD2F4);
    return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v37, v34);
  }
}

uint64_t sub_2510DD2D4()
{
  return sub_2510FB8C0();
}

void sub_2510DD2F4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, void))
{
  if (!*a2)
  {
    uint64_t v6 = type metadata accessor for MedicationsWidgetRectangularView();
    unint64_t v7 = a3(a1, v6, MEMORY[0x263F1BA08]);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

void sub_2510DD35C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = type metadata accessor for MedicationsWidgetCircularView(255);
    uint64_t v7 = type metadata accessor for MedicationsWidgetInlineView();
    unint64_t v8 = a3(a1, v6, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_2510DD3CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2510FB650();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v8 = (uint64_t (*)(uint64_t))MEMORY[0x263F1FD10];
  sub_2510DE1E8(0, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (void *)((char *)v20 - v10);
  sub_2510DE648(v2, (uint64_t)v20 - v10, &qword_26B215110, v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_2510FBA70();
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v12 - 8) + 32))(a1, v11, v12);
  }
  else
  {
    uint64_t v14 = *v11;
    os_log_type_t v15 = sub_2510FBC60();
    uint64_t v16 = sub_2510FB790();
    os_log_type_t v17 = v15;
    if (os_log_type_enabled(v16, v15))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v21 = v19;
      v20[1] = v14;
      *(_DWORD *)uint64_t v18 = 136315138;
      v20[2] = sub_2510E2DF0(0x6146746567646957, 0xEC000000796C696DLL, &v21);
      sub_2510FBCF0();
      _os_log_impl(&dword_2510D3000, v16, v17, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253395510](v19, -1, -1);
      MEMORY[0x253395510](v18, -1, -1);
    }

    sub_2510FB640();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

unint64_t sub_2510DD6C0()
{
  unint64_t result = qword_26B215608;
  if (!qword_26B215608)
  {
    sub_2510DD35C(255, &qword_26B215610, MEMORY[0x263F19B28]);
    sub_2510DE600(&qword_26B2154A0, (void (*)(uint64_t))type metadata accessor for MedicationsWidgetCircularView);
    sub_2510DE600(&qword_26B215488, (void (*)(uint64_t))type metadata accessor for MedicationsWidgetInlineView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B215608);
  }
  return result;
}

unint64_t sub_2510DD7B4()
{
  unint64_t result = qword_26B215618;
  if (!qword_26B215618)
  {
    sub_2510DD2F4(255, &qword_26B215620, MEMORY[0x263F19B28]);
    sub_2510DE600(&qword_26B2154B8, (void (*)(uint64_t))type metadata accessor for MedicationsWidgetRectangularView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B215618);
  }
  return result;
}

uint64_t sub_2510DD878@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2510FB650();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v8 = (uint64_t (*)(uint64_t))MEMORY[0x263F18FF8];
  sub_2510DE1E8(0, &qword_269B20B80, MEMORY[0x263F18FF8], MEMORY[0x263F185C8]);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v19 - v10;
  sub_2510DE648(v2, (uint64_t)v19 - v10, &qword_269B20B80, v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_2510FB560();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v12 - 8) + 32))(a1, v11, v12);
  }
  else
  {
    os_log_type_t v14 = sub_2510FBC60();
    os_log_type_t v15 = sub_2510FB790();
    os_log_type_t v16 = v14;
    if (os_log_type_enabled(v15, v14))
    {
      os_log_type_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v20 = v18;
      v19[1] = a1;
      *(_DWORD *)os_log_type_t v17 = 136315138;
      v19[2] = sub_2510E2DF0(0xD000000000000010, 0x80000002510FCF00, &v20);
      sub_2510FBCF0();
      _os_log_impl(&dword_2510D3000, v15, v16, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253395510](v18, -1, -1);
      MEMORY[0x253395510](v17, -1, -1);
    }

    sub_2510FB640();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_2510DDB60@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2510FB650();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v8 = (uint64_t (*)(uint64_t))MEMORY[0x263F1FC90];
  sub_2510DE1E8(0, &qword_26B215558, MEMORY[0x263F1FC90], MEMORY[0x263F185C8]);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v19 - v10;
  sub_2510DE648(v2, (uint64_t)v19 - v10, &qword_26B215558, v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_2510FBA60();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v12 - 8) + 32))(a1, v11, v12);
  }
  else
  {
    os_log_type_t v14 = sub_2510FBC60();
    os_log_type_t v15 = sub_2510FB790();
    os_log_type_t v16 = v14;
    if (os_log_type_enabled(v15, v14))
    {
      os_log_type_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v20 = v18;
      v19[1] = a1;
      *(_DWORD *)os_log_type_t v17 = 136315138;
      v19[2] = sub_2510E2DF0(0xD000000000000013, 0x80000002510FCF20, &v20);
      sub_2510FBCF0();
      _os_log_impl(&dword_2510D3000, v15, v16, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253395510](v18, -1, -1);
      MEMORY[0x253395510](v17, -1, -1);
    }

    sub_2510FB640();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_2510DDE48(uint64_t a1, char a2)
{
  uint64_t v4 = sub_2510FB650();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return a1 & 1;
  }
  swift_retain();
  os_log_type_t v8 = sub_2510FBC60();
  uint64_t v9 = sub_2510FB790();
  os_log_type_t v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v15 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v14 = sub_2510E2DF0(1819242306, 0xE400000000000000, &v15);
    sub_2510FBCF0();
    _os_log_impl(&dword_2510D3000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253395510](v12, -1, -1);
    MEMORY[0x253395510](v11, -1, -1);
  }

  sub_2510FB640();
  swift_getAtKeyPath();
  sub_2510DE804(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

uint64_t sub_2510DE04C()
{
  return sub_2510FB5C0();
}

uint64_t sub_2510DE070(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t sub_2510DE140(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2510DE070(a1, a2, a3, a4, MEMORY[0x263F18FF8], MEMORY[0x263F19398]);
}

uint64_t sub_2510DE184()
{
  return sub_2510FB610();
}

uint64_t sub_2510DE1A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2510DE070(a1, a2, a3, a4, MEMORY[0x263F1FC90], MEMORY[0x263F1FB98]);
}

void sub_2510DE1E8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_2510DE24C()
{
  sub_2510FB5F0();
  sub_2510DE600(&qword_269B20B88, MEMORY[0x263F1FB28]);
  sub_2510FB660();
  return v1;
}

uint64_t sub_2510DE2C8@<X0>(unsigned char *a1@<X8>)
{
  sub_2510FB5F0();
  sub_2510DE600(&qword_269B20B88, MEMORY[0x263F1FB28]);
  uint64_t result = sub_2510FB660();
  *a1 = v3;
  return result;
}

uint64_t sub_2510DE35C(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  sub_2510DE1E8(0, a3, a4, MEMORY[0x263F185D0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a2, a1, v6);
  return a2;
}

uint64_t sub_2510DE3DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MedicationsWidgetViewModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2510DE440(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2510DE4A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void, uint64_t, void))
{
  uint64_t v6 = a4(0, a3, MEMORY[0x263F19B28]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

uint64_t sub_2510DE528(uint64_t a1, uint64_t a2, uint64_t (*a3)(void, uint64_t, void))
{
  uint64_t v4 = a3(0, a2, MEMORY[0x263F19B28]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_2510DE5A0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2510DE600(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2510DE648(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  sub_2510DE1E8(0, a3, a4, MEMORY[0x263F185C8]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

unint64_t sub_2510DE6CC()
{
  unint64_t result = qword_26B215650;
  if (!qword_26B215650)
  {
    sub_2510DE760(255, &qword_26B215658, MEMORY[0x263F19B28]);
    sub_2510DD6C0();
    sub_2510DD7B4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B215650);
  }
  return result;
}

void sub_2510DE760(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, void))MEMORY[0x263F19B28];
    sub_2510DD35C(255, &qword_26B215610, MEMORY[0x263F19B28]);
    uint64_t v8 = v7;
    sub_2510DD2F4(255, &qword_26B215620, v6);
    unint64_t v10 = a3(a1, v8, v9);
    if (!v11) {
      atomic_store(v10, a2);
    }
  }
}

uint64_t sub_2510DE804(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t sub_2510DE818()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for MedicationsWidget()
{
  return &type metadata for MedicationsWidget;
}

unint64_t sub_2510DE84C()
{
  unint64_t result = qword_26B214D58;
  if (!qword_26B214D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B214D58);
  }
  return result;
}

uint64_t sub_2510DE8A0(char a1)
{
  return *(void *)&aNoneschepastdu[8 * a1];
}

uint64_t sub_2510DE8C0(char *a1, char *a2)
{
  return sub_2510E8C04(*a1, *a2);
}

uint64_t sub_2510DE8CC()
{
  return sub_2510DE8D4();
}

uint64_t sub_2510DE8D4()
{
  return sub_2510FBEE0();
}

uint64_t sub_2510DE940()
{
  return sub_2510DE948();
}

uint64_t sub_2510DE948()
{
  sub_2510FBB90();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2510DE99C()
{
  return sub_2510DE9A4();
}

uint64_t sub_2510DE9A4()
{
  return sub_2510FBEE0();
}

uint64_t sub_2510DEA0C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2510E6878();
  *a1 = result;
  return result;
}

uint64_t sub_2510DEA3C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2510DE8A0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2510DEA68()
{
  return 1;
}

uint64_t sub_2510DEA70()
{
  return sub_2510FBEE0();
}

uint64_t sub_2510DEAB4()
{
  return sub_2510FBED0();
}

uint64_t sub_2510DEADC()
{
  return sub_2510FBEE0();
}

id sub_2510DEB2C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2510FB300();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = OBJC_IVAR____TtC25HealthMedicationsWidgetUI34MedicationsWidgetTimelineGenerator____lazy_storage___dateFormatter;
  uint64_t v7 = *(void **)(v1
                + OBJC_IVAR____TtC25HealthMedicationsWidgetUI34MedicationsWidgetTimelineGenerator____lazy_storage___dateFormatter);
  if (v7)
  {
    id v8 = *(id *)(v1
               + OBJC_IVAR____TtC25HealthMedicationsWidgetUI34MedicationsWidgetTimelineGenerator____lazy_storage___dateFormatter);
  }
  else
  {
    id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
    objc_msgSend(v9, sel_setDateStyle_, 0);
    objc_msgSend(v9, sel_setTimeStyle_, 1);
    sub_2510FB2D0();
    unint64_t v10 = (void *)sub_2510FB2B0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    objc_msgSend(v9, sel_setLocale_, v10);

    uint64_t v11 = *(void **)(v1 + v6);
    *(void *)(v1 + v6) = v9;
    id v8 = v9;

    uint64_t v7 = 0;
  }
  id v12 = v7;
  return v8;
}

uint64_t sub_2510DEC98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v84 = a4;
  uint64_t v85 = a2;
  uint64_t v86 = a3;
  uint64_t v80 = a1;
  uint64_t v89 = *v4;
  uint64_t v83 = sub_2510FBA70();
  uint64_t v88 = *(void *)(v83 - 8);
  uint64_t v77 = *(char **)(v88 + 64);
  MEMORY[0x270FA5388](v83);
  uint64_t v81 = (char *)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = (uint64_t (*)(uint64_t))MEMORY[0x263F8F110];
  sub_2510E2D8C(0, &qword_26B215780, MEMORY[0x263F8F110], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v6 - 8);
  v65 = (char *)&v62 - v7;
  uint64_t v8 = sub_2510FBCB0();
  uint64_t v73 = *(void *)(v8 - 8);
  v74 = (void (*)(char *, uint64_t, uint64_t))v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v63 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510E2D8C(0, &qword_26B215550, MEMORY[0x263F44CA0], MEMORY[0x263EFDE48]);
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v62 - v13;
  sub_2510E59B0();
  uint64_t v16 = v15;
  uint64_t v17 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v62 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510E5ACC();
  uint64_t v64 = v20;
  uint64_t v66 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v62 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510E5B98();
  uint64_t v76 = v23;
  uint64_t v78 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v82 = (char *)&v62 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_2510FB2A0();
  uint64_t v71 = *(void *)(v67 - 8);
  uint64_t v72 = *(void *)(v71 + 64);
  MEMORY[0x270FA5388](v67);
  uint64_t v26 = (void *)v4[2];
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v27 + 16);
  uint64_t v68 = v27 + 16;
  uint64_t v69 = v28;
  uint64_t v79 = (char *)&v62 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  ((void (*)(char *, uint64_t))v28)(v79, v80);
  id v29 = objc_allocWithZone((Class)sub_2510FB450());
  id v30 = v26;
  uint64_t v70 = sub_2510FB440();
  sub_2510FB430();
  sub_2510E5A44();
  sub_2510FB500();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  sub_2510E62C0(0, &qword_26B2157D0);
  sub_2510E6144(&qword_26B215518, (void (*)(uint64_t))sub_2510E59B0);
  sub_2510FB520();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  uint64_t v31 = v63;
  sub_2510FBCA0();
  id v90 = *(id *)(v87 + OBJC_IVAR____TtC25HealthMedicationsWidgetUI34MedicationsWidgetTimelineGenerator_queue);
  id v32 = v90;
  uint64_t v33 = sub_2510FBC90();
  uint64_t v34 = (uint64_t)v65;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v65, 1, 1, v33);
  *(void *)(swift_allocObject() + 16) = v89;
  sub_2510E2AF8();
  sub_2510E6144(&qword_26B215528, (void (*)(uint64_t))sub_2510E5ACC);
  sub_2510E6144(&qword_26B215788, (void (*)(uint64_t))sub_2510E2AF8);
  id v35 = v32;
  uint64_t v36 = v64;
  sub_2510FB510();
  swift_release();
  sub_2510E618C(v34, &qword_26B215780, v75);

  (*(void (**)(char *, void (*)(char *, uint64_t, uint64_t)))(v73 + 8))(v31, v74);
  (*(void (**)(char *, uint64_t))(v66 + 8))(v22, v36);
  uint64_t v37 = swift_allocObject();
  swift_weakInit();
  uint64_t v38 = v88;
  v74 = *(void (**)(char *, uint64_t, uint64_t))(v88 + 16);
  uint64_t v39 = v81;
  uint64_t v40 = v83;
  v74(v81, v85, v83);
  uint64_t v41 = *(unsigned __int8 *)(v38 + 80);
  uint64_t v42 = (v41 + 24) & ~v41;
  uint64_t v73 = v41 | 7;
  uint64_t v75 = (uint64_t (*)(uint64_t))(v77 + 7);
  unint64_t v43 = (unint64_t)&v77[v42 + 7] & 0xFFFFFFFFFFFFFFF8;
  uint64_t v44 = swift_allocObject();
  *(void *)(v44 + 16) = v37;
  uint64_t v45 = *(char **)(v38 + 32);
  uint64_t v88 = v38 + 32;
  uint64_t v77 = v45;
  ((void (*)(uint64_t, char *, uint64_t))v45)(v44 + v42, v39, v40);
  uint64_t v46 = (void *)(v44 + v43);
  uint64_t v47 = v84;
  *uint64_t v46 = v86;
  v46[1] = v47;
  *(void *)(v44 + ((v43 + 23) & 0xFFFFFFFFFFFFFFF8)) = v89;
  uint64_t v48 = swift_allocObject();
  swift_weakInit();
  uint64_t v49 = v67;
  v69(v79, v80, v67);
  v74(v39, v85, v40);
  uint64_t v50 = v71;
  unint64_t v51 = (*(unsigned __int8 *)(v71 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v71 + 80);
  unint64_t v52 = (v72 + v41 + v51) & ~v41;
  unint64_t v53 = ((unint64_t)v75 + v52) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v54 = swift_allocObject();
  uint64_t v55 = (void *)v70;
  *(void *)(v54 + 16) = v48;
  *(void *)(v54 + 24) = v55;
  (*(void (**)(unint64_t, char *, uint64_t))(v50 + 32))(v54 + v51, v79, v49);
  ((void (*)(unint64_t, char *, uint64_t))v77)(v54 + v52, v81, v83);
  uint64_t v56 = (void *)(v54 + v53);
  uint64_t v57 = v84;
  *uint64_t v56 = v86;
  v56[1] = v57;
  *(void *)(v54 + ((v53 + 23) & 0xFFFFFFFFFFFFFFF8)) = v89;
  sub_2510E6144(&qword_26B215538, (void (*)(uint64_t))sub_2510E5B98);
  swift_retain_n();
  id v58 = v55;
  uint64_t v59 = v76;
  uint64_t v60 = v82;
  sub_2510FB4F0();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v78 + 8))(v60, v59);
  swift_beginAccess();
  sub_2510FB4E0();
  swift_endAccess();

  return swift_release();
}

uint64_t sub_2510DF718()
{
  return sub_2510FB400() & 1;
}

uint64_t sub_2510DF740(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(void), uint64_t a5, uint64_t a6)
{
  uint64_t v48 = a6;
  uint64_t v51 = a3;
  uint64_t v52 = a5;
  sub_2510E2D8C(0, &qword_26B214D50, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v45 - v9;
  uint64_t v11 = sub_2510FB2A0();
  uint64_t v49 = *(void *)(v11 - 8);
  uint64_t v50 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for MedicationsWidgetEntry();
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_2510FB4A0();
  uint64_t v53 = *(void *)(v17 - 8);
  uint64_t v54 = v17;
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v45 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v45 - v21;
  uint64_t v23 = *a1;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v25 = result;
    if (v23)
    {
      sub_2510FB480();
      uint64_t v26 = sub_2510FB490();
      os_log_type_t v27 = sub_2510FBC50();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v47 = v25;
        uint64_t v28 = swift_slowAlloc();
        uint64_t v46 = a4;
        id v29 = (uint8_t *)v28;
        uint64_t v30 = swift_slowAlloc();
        uint64_t v56 = v30;
        *(_DWORD *)id v29 = 136446210;
        uint64_t v45 = v29 + 4;
        uint64_t v31 = sub_2510FBEF0();
        uint64_t v55 = sub_2510E2DF0(v31, v32, &v56);
        sub_2510FBCF0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2510D3000, v26, v27, "[%{public}s] Timed out waiting for medication summary", v29, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x253395510](v30, -1, -1);
        uint64_t v33 = v29;
        a4 = v46;
        MEMORY[0x253395510](v33, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v53 + 8))(v22, v54);
      sub_2510FB290();
      sub_2510E5968(0, (unint64_t *)&qword_26B2157B8);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_2510FC400;
      if (qword_26B215168 != -1) {
        swift_once();
      }
      *(void *)(inited + 32) = sub_2510FB130();
      *(void *)(inited + 40) = v35;
      *(void *)(inited + 48) = sub_2510FB130();
      *(void *)(inited + 56) = v36;
      uint64_t v38 = v49;
      uint64_t v37 = v50;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v49 + 56))(v10, 1, 1, v50);
      sub_2510E1660((uint64_t)v13, inited, v51, 3, 0, (uint64_t)v10, (uint64_t)v16);
      swift_bridgeObjectRelease();
      sub_2510E618C((uint64_t)v10, &qword_26B214D50, MEMORY[0x263F07490]);
      (*(void (**)(char *, uint64_t))(v38 + 8))(v13, v37);
      a4(v16);
      swift_release();
      return sub_2510E61FC((uint64_t)v16);
    }
    else
    {
      sub_2510FB480();
      uint64_t v39 = sub_2510FB490();
      uint64_t v40 = sub_2510FBC70();
      if (os_log_type_enabled(v39, (os_log_type_t)v40))
      {
        uint64_t v41 = (uint8_t *)swift_slowAlloc();
        uint64_t v42 = swift_slowAlloc();
        uint64_t v56 = v42;
        *(_DWORD *)uint64_t v41 = 136446210;
        uint64_t v43 = sub_2510FBEF0();
        uint64_t v55 = sub_2510E2DF0(v43, v44, &v56);
        sub_2510FBCF0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2510D3000, v39, (os_log_type_t)v40, "[%{public}s] Finished fetching medication day summary", v41, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x253395510](v42, -1, -1);
        MEMORY[0x253395510](v41, -1, -1);
      }

      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v20, v54);
    }
  }
  return result;
}

uint64_t sub_2510DFD84(void (**a1)(char *, uint64_t), uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t), uint64_t a7, uint64_t a8)
{
  uint64_t v195 = a8;
  uint64_t v191 = a7;
  v192 = a6;
  uint64_t v189 = a4;
  v199 = a1;
  sub_2510E2D8C(0, &qword_26B214D50, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v178 - v11;
  uint64_t v200 = sub_2510FB2A0();
  uint64_t v193 = *(void *)(v200 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v200);
  *(void *)&long long v186 = (char *)&v178 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v185 = (char *)&v178 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  *(void *)&long long v184 = (char *)&v178 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  v197 = (char *)&v178 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v178 - v22;
  MEMORY[0x270FA5388](v21);
  uint64_t v194 = (uint64_t)&v178 - v24;
  uint64_t v25 = type metadata accessor for MedicationsWidgetEntry();
  uint64_t v26 = MEMORY[0x270FA5388](v25 - 8);
  uint64_t v183 = (uint64_t)&v178 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v26);
  id v29 = (char *)&v178 - v28;
  uint64_t v198 = sub_2510FB4A0();
  unint64_t v196 = *(void *)(v198 - 8);
  MEMORY[0x270FA5388](v198);
  uint64_t v31 = (char *)&v178 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (!result) {
    return result;
  }
  uint64_t v33 = result;
  sub_2510FB480();
  os_log_t v34 = a3;
  uint64_t v35 = sub_2510FB490();
  os_log_type_t v36 = sub_2510FBC70();
  int v181 = v36;
  BOOL v37 = os_log_type_enabled(v35, v36);
  uint64_t v187 = a5;
  v188 = v12;
  uint64_t v190 = v33;
  v182 = v29;
  if (v37)
  {
    uint64_t v38 = swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    unint64_t v205 = v39;
    *(_DWORD *)uint64_t v38 = 136446466;
    os_log_t v180 = v35;
    uint64_t v40 = sub_2510FBEF0();
    uint64_t v203 = sub_2510E2DF0(v40, v41, (uint64_t *)&v205);
    sub_2510FBCF0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v38 + 12) = 2080;
    uint64_t v195 = v38 + 14;
    uint64_t v42 = v34;
    id v43 = [v42 description];
    uint64_t v44 = sub_2510FBB70();
    unint64_t v46 = v45;

    uint64_t v203 = sub_2510E2DF0(v44, v46, (uint64_t *)&v205);
    sub_2510FBCF0();

    swift_bridgeObjectRelease();
    os_log_t v34 = v180;
    _os_log_impl(&dword_2510D3000, v180, (os_log_type_t)v181, "[%{public}s] Creating snapshot from provider: %s", (uint8_t *)v38, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253395510](v39, -1, -1);
    MEMORY[0x253395510](v38, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v196 + 8))(v31, v198);
  unint64_t v205 = MEMORY[0x263F8EE78];
  unint64_t v47 = sub_2510FB3E0();
  sub_2510E2B38(v47);
  unint64_t v48 = sub_2510FB3F0();
  sub_2510E2B38(v48);
  sub_2510E2D04(&v205);
  unint64_t v49 = v205;
  if (v205 >> 62)
  {
LABEL_40:
    swift_bridgeObjectRetain();
    uint64_t v50 = sub_2510FBE00();
    swift_bridgeObjectRelease();
    uint64_t v51 = v194;
    if (v50) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v50 = *(void *)((v205 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v51 = v194;
    if (v50)
    {
LABEL_7:
      uint64_t v52 = (void (**)(char *, char *, uint64_t))(v193 + 16);
      uint64_t v53 = 4;
      uint64_t v198 = 0;
      v199 = (void (**)(char *, uint64_t))(v193 + 8);
      uint64_t v195 = (v193 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      unint64_t v196 = v49 & 0xC000000000000001;
      while (1)
      {
        uint64_t v54 = v53 - 4;
        if (v196)
        {
          uint64_t v55 = MEMORY[0x253394F90](v53 - 4, v49);
          uint64_t v56 = v53 - 3;
          if (__OFADD__(v54, 1)) {
            goto LABEL_39;
          }
        }
        else
        {
          uint64_t v55 = *(void *)(v49 + 8 * v53);
          swift_retain();
          uint64_t v56 = v53 - 3;
          if (__OFADD__(v54, 1))
          {
LABEL_39:
            __break(1u);
            goto LABEL_40;
          }
        }
        sub_2510FB390();
        sub_2510FB280();
        if (v57 < 0.0 && sub_2510FB3A0() != 4 && sub_2510FB3A0() != 5)
        {
          swift_bridgeObjectRelease();
          id v123 = sub_2510DEB2C();
          v124 = (void *)sub_2510FBB50();
          v125 = v23;
          v126 = (void *)sub_2510FB260();
          id v127 = objc_msgSend(v123, sel_hm_localizableTimeStringKeyWithPrefix_date_, v124, v126);

          sub_2510FBB70();
          if (qword_26B215168 != -1) {
            swift_once();
          }
          v197 = (char *)sub_2510FB130();
          *(void *)&long long v184 = v128;
          swift_bridgeObjectRelease();
          sub_2510E6258();
          uint64_t v195 = v129;
          uint64_t v130 = swift_allocObject();
          long long v186 = xmmword_2510FC560;
          *(_OWORD *)(v130 + 16) = xmmword_2510FC560;
          id v131 = sub_2510DEB2C();
          v132 = (void *)sub_2510FB260();
          id v133 = objc_msgSend(v131, sel_stringFromDate_, v132);

          uint64_t v134 = sub_2510FBB70();
          uint64_t v136 = v135;

          unint64_t v205 = v134;
          uint64_t v206 = v136;
          uint64_t v203 = 32;
          unint64_t v204 = 0xE100000000000000;
          uint64_t v201 = 41154;
          unint64_t v202 = 0xA200000000000000;
          sub_2510D7DE4();
          uint64_t v137 = MEMORY[0x263F8D310];
          uint64_t v138 = sub_2510FBD30();
          uint64_t v140 = v139;
          swift_bridgeObjectRelease();
          *(void *)(v130 + 56) = v137;
          v185 = (char *)sub_2510E6310();
          *(void *)(v130 + 64) = v185;
          *(void *)(v130 + 32) = v138;
          *(void *)(v130 + 40) = v140;
          uint64_t v141 = sub_2510FBB60();
          unint64_t v196 = v142;
          v197 = (char *)v141;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          id v143 = sub_2510DEB2C();
          v144 = (void *)sub_2510FBB50();
          v179 = v125;
          v145 = (void *)sub_2510FB260();
          id v146 = objc_msgSend(v143, sel_hm_localizableTimeStringKeyWithPrefix_date_, v144, v145);

          sub_2510FBB70();
          *(void *)&long long v184 = sub_2510FB130();
          swift_bridgeObjectRelease();
          uint64_t v147 = swift_allocObject();
          *(_OWORD *)(v147 + 16) = v186;
          id v148 = sub_2510DEB2C();
          v149 = (void *)sub_2510FB260();
          id v150 = objc_msgSend(v148, sel_stringFromDate_, v149);

          uint64_t v151 = sub_2510FBB70();
          uint64_t v153 = v152;

          unint64_t v205 = v151;
          uint64_t v206 = v153;
          uint64_t v203 = 32;
          unint64_t v204 = 0xE100000000000000;
          uint64_t v201 = 41154;
          unint64_t v202 = 0xA200000000000000;
          uint64_t v154 = MEMORY[0x263F8D310];
          uint64_t v155 = sub_2510FBD30();
          uint64_t v157 = v156;
          swift_bridgeObjectRelease();
          v158 = v185;
          *(void *)(v147 + 56) = v154;
          *(void *)(v147 + 64) = v158;
          *(void *)(v147 + 32) = v155;
          *(void *)(v147 + 40) = v157;
          uint64_t v159 = sub_2510FBB60();
          uint64_t v161 = v160;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v162 = v194;
          sub_2510E134C(v194);
          sub_2510E5968(0, (unint64_t *)&qword_26B2157B8);
          uint64_t inited = swift_initStackObject();
          *(_OWORD *)(inited + 16) = xmmword_2510FC400;
          unint64_t v164 = v196;
          *(void *)(inited + 32) = v197;
          *(void *)(inited + 40) = v164;
          *(void *)(inited + 48) = v159;
          *(void *)(inited + 56) = v161;
          v165 = (void *)sub_2510FB380();
          uint64_t v166 = (uint64_t)v188;
          sub_2510FB390();
          uint64_t v167 = v193 + 56;
          uint64_t v168 = v200;
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v193 + 56))(v166, 0, 1, v200);
          uint64_t v169 = (uint64_t)v182;
          sub_2510E1660(v162, inited, v187, 1, v165, v166, (uint64_t)v182);
          swift_bridgeObjectRelease();

          sub_2510E618C(v166, &qword_26B214D50, MEMORY[0x263F07490]);
          v170 = *(void (**)(uint64_t, uint64_t))(v167 - 48);
          v170(v194, v168);
          v192(v169);
          swift_release();
          swift_release();
          swift_release();
          sub_2510E61FC(v169);
          return ((uint64_t (*)(char *, uint64_t))v170)(v179, v168);
        }
        id v58 = v197;
        uint64_t v59 = v200;
        (*v52)(v197, v23, v200);
        if (v198) {
          break;
        }
        sub_2510FB280();
        uint64_t v59 = v200;
        double v63 = v62;
        uint64_t v64 = v58;
        uint64_t v61 = *v199;
        (*v199)(v64, v200);
        if (v63 <= 0.0) {
          goto LABEL_21;
        }
        if (sub_2510FB3A0() == 4)
        {
          uint64_t v59 = v200;
LABEL_21:
          swift_release();
          v61(v23, v59);
          if (v56 == v50) {
            goto LABEL_27;
          }
          goto LABEL_22;
        }
        uint64_t v65 = sub_2510FB3A0();
        v61(v23, v200);
        if (v65 == 5)
        {
          swift_release();
          if (v56 == v50)
          {
            v197 = (char *)v61;
            swift_bridgeObjectRelease();
LABEL_32:
            uint64_t v115 = v184;
            sub_2510E134C(v184);
            sub_2510E5968(0, (unint64_t *)&qword_26B2157B8);
            uint64_t v116 = swift_initStackObject();
            *(_OWORD *)(v116 + 16) = xmmword_2510FC400;
            uint64_t v118 = v187;
            uint64_t v117 = (uint64_t)v188;
            if (qword_26B215168 != -1) {
              swift_once();
            }
            *(void *)(v116 + 32) = sub_2510FB130();
            *(void *)(v116 + 40) = v119;
            *(void *)(v116 + 48) = sub_2510FB130();
            *(void *)(v116 + 56) = v120;
            uint64_t v121 = v200;
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v193 + 56))(v117, 1, 1, v200);
            uint64_t v122 = v183;
            sub_2510E1660(v115, v116, v118, 3, 0, v117, v183);
            swift_bridgeObjectRelease();
            sub_2510E618C(v117, &qword_26B214D50, MEMORY[0x263F07490]);
            ((void (*)(uint64_t, uint64_t))v197)(v115, v121);
            v192(v122);
            swift_release();
            uint64_t v114 = v122;
            return sub_2510E61FC(v114);
          }
          uint64_t v198 = 0;
          ++v53;
        }
        else
        {
          uint64_t v198 = v55;
          uint64_t v59 = v200;
          if (v56 == v50)
          {
LABEL_27:
            swift_bridgeObjectRelease();
            uint64_t v66 = v198;
            if (v198)
            {
              swift_retain();
              uint64_t v67 = v59;
              id v68 = sub_2510DEB2C();
              uint64_t v69 = (char *)v61;
              uint64_t v70 = (void *)sub_2510FBB50();
              uint64_t v71 = v194;
              sub_2510FB390();
              uint64_t v72 = (void *)sub_2510FB260();
              v197 = v69;
              ((void (*)(uint64_t, uint64_t))v69)(v71, v67);
              id v73 = objc_msgSend(v68, sel_hm_localizableTimeStringKeyWithPrefix_date_, v70, v72);

              sub_2510FBB70();
              if (qword_26B215168 != -1) {
                swift_once();
              }
              unint64_t v196 = sub_2510FB130();
              uint64_t v183 = v74;
              swift_bridgeObjectRelease();
              sub_2510E6258();
              uint64_t v189 = v75;
              uint64_t v76 = swift_allocObject();
              long long v184 = xmmword_2510FC560;
              *(_OWORD *)(v76 + 16) = xmmword_2510FC560;
              uint64_t v77 = v185;
              sub_2510FB390();
              id v78 = sub_2510DEB2C();
              uint64_t v79 = (void *)sub_2510FB260();
              id v80 = objc_msgSend(v78, sel_stringFromDate_, v79);
              uint64_t v198 = v66;
              id v81 = v80;

              uint64_t v82 = sub_2510FBB70();
              uint64_t v84 = v83;

              unint64_t v205 = v82;
              uint64_t v206 = v84;
              uint64_t v203 = 32;
              unint64_t v204 = 0xE100000000000000;
              uint64_t v201 = 41154;
              unint64_t v202 = 0xA200000000000000;
              sub_2510D7DE4();
              uint64_t v85 = MEMORY[0x263F8D310];
              uint64_t v86 = sub_2510FBD30();
              uint64_t v88 = v87;
              swift_bridgeObjectRelease();
              ((void (*)(char *, uint64_t))v197)(v77, v200);
              *(void *)(v76 + 56) = v85;
              v185 = (char *)sub_2510E6310();
              *(void *)(v76 + 64) = v185;
              *(void *)(v76 + 32) = v86;
              *(void *)(v76 + 40) = v88;
              uint64_t v89 = sub_2510FBB60();
              uint64_t v195 = v90;
              unint64_t v196 = v89;
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              sub_2510FB130();
              uint64_t v183 = sub_2510FB130();
              swift_bridgeObjectRelease();
              uint64_t v91 = swift_allocObject();
              *(_OWORD *)(v91 + 16) = v184;
              uint64_t v92 = v186;
              sub_2510FB390();
              id v93 = sub_2510DEB2C();
              v94 = (void *)sub_2510FB260();
              id v95 = objc_msgSend(v93, sel_stringFromDate_, v94);

              uint64_t v96 = sub_2510FBB70();
              uint64_t v98 = v97;

              unint64_t v205 = v96;
              uint64_t v206 = v98;
              uint64_t v203 = 32;
              unint64_t v204 = 0xE100000000000000;
              uint64_t v201 = 41154;
              unint64_t v202 = 0xA200000000000000;
              uint64_t v99 = MEMORY[0x263F8D310];
              uint64_t v100 = sub_2510FBD30();
              uint64_t v102 = v101;
              swift_bridgeObjectRelease();
              uint64_t v103 = v200;
              ((void (*)(uint64_t, uint64_t))v197)(v92, v200);
              v104 = v185;
              *(void *)(v91 + 56) = v99;
              *(void *)(v91 + 64) = v104;
              *(void *)(v91 + 32) = v100;
              *(void *)(v91 + 40) = v102;
              uint64_t v105 = sub_2510FBB60();
              uint64_t v107 = v106;
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v108 = v194;
              sub_2510FB390();
              sub_2510E5968(0, (unint64_t *)&qword_26B2157B8);
              uint64_t v109 = swift_initStackObject();
              *(_OWORD *)(v109 + 16) = xmmword_2510FC400;
              uint64_t v110 = v195;
              *(void *)(v109 + 32) = v196;
              *(void *)(v109 + 40) = v110;
              *(void *)(v109 + 48) = v105;
              *(void *)(v109 + 56) = v107;
              v111 = (void *)sub_2510FB380();
              uint64_t v112 = (uint64_t)v188;
              sub_2510FB390();
              (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v193 + 56))(v112, 0, 1, v103);
              uint64_t v113 = (uint64_t)v182;
              sub_2510E1660(v108, v109, v187, 2, v111, v112, (uint64_t)v182);
              swift_bridgeObjectRelease();

              sub_2510E618C(v112, &qword_26B214D50, MEMORY[0x263F07490]);
              ((void (*)(uint64_t, uint64_t))v197)(v108, v103);
              v192(v113);
              swift_release();
              swift_release_n();
              uint64_t v114 = v113;
              return sub_2510E61FC(v114);
            }
            v197 = (char *)v61;
            goto LABEL_32;
          }
LABEL_22:
          ++v53;
        }
      }
      uint64_t v60 = v58;
      uint64_t v61 = *v199;
      (*v199)(v60, v59);
      goto LABEL_21;
    }
  }
  swift_bridgeObjectRelease();
  sub_2510E134C(v51);
  sub_2510E5968(0, (unint64_t *)&qword_26B2157B8);
  uint64_t v171 = swift_initStackObject();
  *(_OWORD *)(v171 + 16) = xmmword_2510FC400;
  if (qword_26B215168 != -1) {
    swift_once();
  }
  *(void *)(v171 + 32) = sub_2510FB130();
  *(void *)(v171 + 40) = v172;
  *(void *)(v171 + 48) = sub_2510FB130();
  *(void *)(v171 + 56) = v173;
  uint64_t v174 = v193;
  uint64_t v175 = (uint64_t)v188;
  uint64_t v176 = v200;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v193 + 56))(v188, 1, 1, v200);
  uint64_t v177 = (uint64_t)v182;
  sub_2510E1660(v51, v171, v187, 0, 0, v175, (uint64_t)v182);
  swift_bridgeObjectRelease();
  sub_2510E618C(v175, &qword_26B214D50, MEMORY[0x263F07490]);
  (*(void (**)(uint64_t, uint64_t))(v174 + 8))(v51, v176);
  v192(v177);
  swift_release();
  uint64_t v114 = v177;
  return sub_2510E61FC(v114);
}

uint64_t sub_2510E134C@<X0>(uint64_t a1@<X8>)
{
  v17[1] = a1;
  uint64_t v2 = sub_2510FB340();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510E2D8C(0, &qword_26B214D50, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v17 - v7;
  uint64_t v9 = sub_2510FB2A0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v17 - v14;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F07870], v2);
  sub_2510FB330();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v1, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v13, v9);
    sub_2510E618C((uint64_t)v8, &qword_26B214D50, MEMORY[0x263F07490]);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v8, v9);
  }
  sub_2510FB310();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t sub_2510E1660@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v131 = a6;
  id v125 = a5;
  uint64_t v141 = a4;
  uint64_t v129 = a2;
  uint64_t v136 = a7;
  uint64_t v10 = *v7;
  uint64_t v130 = type metadata accessor for MedicationsWidgetViewModel();
  MEMORY[0x270FA5388](v130);
  uint64_t v120 = (uint64_t *)((char *)&v107 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v118 = sub_2510FB3D0();
  uint64_t v117 = *(void *)(v118 - 8);
  MEMORY[0x270FA5388](v118);
  uint64_t v116 = (char *)&v107 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_2510E2D8C(0, (unint64_t *)&qword_26B215510, MEMORY[0x263F44CB8], MEMORY[0x263F8D8F0]);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  uint64_t v113 = (uint64_t)&v107 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v121 = (uint64_t)&v107 - v17;
  uint64_t v124 = sub_2510FB420();
  uint64_t v123 = *(void *)(v124 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v124);
  uint64_t v110 = (char *)&v107 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v114 = (char *)&v107 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v112 = (char *)&v107 - v22;
  sub_2510E2D8C(0, qword_26B2150B0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, v13);
  uint64_t v24 = MEMORY[0x270FA5388](v23 - 8);
  uint64_t v115 = (char *)&v107 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  uint64_t v140 = (uint64_t)&v107 - v26;
  uint64_t v27 = sub_2510FBA70();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  uint64_t v138 = (char *)&v107 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v29);
  unint64_t v32 = (char *)&v107 - v31;
  uint64_t v33 = sub_2510FB2A0();
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v35 = MEMORY[0x270FA5388](v33);
  uint64_t v119 = (char *)&v107 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v35);
  uint64_t v38 = (char *)&v107 - v37;
  uint64_t v137 = sub_2510FB4A0();
  uint64_t v139 = *(void *)(v137 - 8);
  uint64_t v39 = MEMORY[0x270FA5388](v137);
  uint64_t v122 = (char *)&v107 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v39);
  uint64_t v42 = (char *)&v107 - v41;
  sub_2510FB480();
  id v43 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v34 + 16);
  uint64_t v132 = a1;
  id v127 = v43;
  uint64_t v128 = v34 + 16;
  v43((uint64_t)v38, a1, v33);
  uint64_t v142 = v28;
  id v133 = *(void (**)(char *, uint64_t, uint64_t))(v28 + 16);
  uint64_t v134 = a3;
  v133(v32, a3, v27);
  uint64_t v44 = sub_2510FB490();
  os_log_type_t v45 = sub_2510FBC70();
  int v46 = v45;
  BOOL v47 = os_log_type_enabled(v44, v45);
  uint64_t v135 = v33;
  uint64_t v111 = v10;
  uint64_t v126 = v34;
  if (v47)
  {
    uint64_t v48 = swift_slowAlloc();
    int v108 = v46;
    uint64_t v49 = v48;
    uint64_t v109 = swift_slowAlloc();
    uint64_t v144 = v109;
    *(_DWORD *)uint64_t v49 = 136315906;
    os_log_t v107 = v44;
    uint64_t v50 = sub_2510FBEF0();
    uint64_t v143 = sub_2510E2DF0(v50, v51, &v144);
    sub_2510FBCF0();
    swift_bridgeObjectRelease();
    uint64_t v52 = 8 * (char)v141;
    uint64_t v53 = *(void *)&aNoneschepastdu[v52];
    *(_WORD *)(v49 + 12) = 2082;
    uint64_t v143 = sub_2510E2DF0(v53, *(void *)&aUptodatealllog[v52 + 16], &v144);
    sub_2510FBCF0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v49 + 22) = 2082;
    sub_2510E6144(&qword_26B215478, MEMORY[0x263F07490]);
    uint64_t v54 = sub_2510FBE40();
    uint64_t v143 = sub_2510E2DF0(v54, v55, &v144);
    sub_2510FBCF0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v126 + 8))(v38, v33);
    *(_WORD *)(v49 + 32) = 2082;
    sub_2510E6144(&qword_26B215748, MEMORY[0x263F1FD10]);
    uint64_t v56 = sub_2510FBE40();
    uint64_t v143 = sub_2510E2DF0(v56, v57, &v144);
    sub_2510FBCF0();
    swift_bridgeObjectRelease();
    id v58 = *(void (**)(char *, uint64_t))(v142 + 8);
    v58(v32, v27);
    os_log_t v59 = v107;
    _os_log_impl(&dword_2510D3000, v107, (os_log_type_t)v108, "[%s] Creating entry for state: %{public}s date: %{public}s family: %{public}s", (uint8_t *)v49, 0x2Au);
    uint64_t v60 = v109;
    swift_arrayDestroy();
    MEMORY[0x253395510](v60, -1, -1);
    MEMORY[0x253395510](v49, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v34 + 8))(v38, v33);
    id v58 = *(void (**)(char *, uint64_t))(v142 + 8);
    v58(v32, v27);
  }
  uint64_t v61 = *(void (**)(char *, uint64_t))(v139 + 8);
  uint64_t v62 = v137;
  v61(v42, v137);
  uint64_t v63 = v27;
  uint64_t v64 = type metadata accessor for MedmojiIconConfiguration();
  uint64_t v65 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v64 - 8) + 56);
  uint64_t v66 = v140;
  v65(v140, 1, 1, v64);
  uint64_t v67 = v138;
  v133(v138, v134, v63);
  int v68 = (*(uint64_t (**)(char *, uint64_t))(v142 + 88))(v67, v63);
  if (MEMORY[0x263F1FCE8] && v68 == *MEMORY[0x263F1FCE8])
  {
    if (v141 == 1 && v125)
    {
      id v69 = v125;
      uint64_t v70 = v113;
      HKMedicationUserDomainConcept.visualConfig.getter(v113);
      uint64_t v71 = v123;
      uint64_t v72 = v124;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v123 + 48))(v70, 1, v124) != 1)
      {
        uint64_t v142 = *(void *)(v71 + 32);
        id v73 = v110;
        ((void (*)(char *, uint64_t, uint64_t))v142)(v110, v70, v72);
        uint64_t v74 = v114;
        (*(void (**)(char *, char *, uint64_t))(v71 + 16))(v114, v73, v72);
        uint64_t v75 = v71;
        uint64_t v76 = v116;
        sub_2510FB3C0();

        (*(void (**)(char *, uint64_t))(v75 + 8))(v73, v72);
        sub_2510E618C(v140, qword_26B2150B0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration);
        uint64_t v77 = (uint64_t)v115;
        ((void (*)(char *, char *, uint64_t))v142)(v115, v74, v72);
        uint64_t v66 = v140;
        (*(void (**)(uint64_t, char *, uint64_t))(v117 + 32))(v77 + *(int *)(v64 + 20), v76, v118);
LABEL_19:
        v65(v77, 0, 1, v64);
        sub_2510E5790(v77, v66);
        goto LABEL_20;
      }
LABEL_13:

      sub_2510E618C(v70, (unint64_t *)&qword_26B215510, MEMORY[0x263F44CB8]);
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  if (v68 == *MEMORY[0x263F1FD00])
  {
    if (v125)
    {
      id v69 = v125;
      uint64_t v70 = v121;
      HKMedicationUserDomainConcept.visualConfig.getter(v121);
      uint64_t v78 = v123;
      uint64_t v79 = v124;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v123 + 48))(v70, 1, v124) != 1)
      {
        uint64_t v142 = *(void *)(v78 + 32);
        uint64_t v89 = v112;
        ((void (*)(char *, uint64_t, uint64_t))v142)(v112, v70, v79);
        uint64_t v90 = v114;
        (*(void (**)(char *, char *, uint64_t))(v78 + 16))(v114, v89, v79);
        uint64_t v91 = v116;
        sub_2510FB3C0();

        (*(void (**)(char *, uint64_t))(v78 + 8))(v89, v79);
        sub_2510E618C(v140, qword_26B2150B0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration);
        uint64_t v77 = (uint64_t)v115;
        ((void (*)(char *, char *, uint64_t))v142)(v115, v90, v79);
        uint64_t v66 = v140;
        (*(void (**)(uint64_t, char *, uint64_t))(v117 + 32))(v77 + *(int *)(v64 + 20), v91, v118);
        goto LABEL_19;
      }
      goto LABEL_13;
    }
LABEL_20:
    if (qword_26B215168 != -1) {
      swift_once();
    }
    uint64_t v92 = sub_2510FB130();
    uint64_t v94 = v93;
    uint64_t v144 = MEMORY[0x263F8EE88];
    uint64_t v95 = swift_bridgeObjectRetain();
    uint64_t v96 = sub_2510E5624(v95);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v97 = type metadata accessor for MedicationsWidgetEntry();
    uint64_t v98 = v136;
    uint64_t v99 = (uint64_t *)(v136 + *(int *)(v97 + 20));
    uint64_t v100 = v130;
    sub_2510E5790(v66, (uint64_t)v99 + *(int *)(v130 + 24));
    sub_2510E5824(v131, (uint64_t)v99 + *(int *)(v100 + 32));
    *uint64_t v99 = v92;
    v99[1] = v94;
    v99[2] = v96;
    *((unsigned char *)v99 + *(int *)(v100 + 28)) = v141;
    return v127(v98, v132, v135);
  }
  if (v68 == *MEMORY[0x263F1FD08] || v68 == *MEMORY[0x263F1FCF0]) {
    goto LABEL_20;
  }
  uint64_t v141 = v63;
  id v80 = v122;
  sub_2510FB480();
  id v81 = sub_2510FB490();
  os_log_type_t v82 = sub_2510FBC60();
  if (os_log_type_enabled(v81, v82))
  {
    uint64_t v83 = (uint8_t *)swift_slowAlloc();
    uint64_t v84 = swift_slowAlloc();
    uint64_t v144 = v84;
    *(_DWORD *)uint64_t v83 = 136446210;
    uint64_t v85 = sub_2510FBEF0();
    uint64_t v143 = sub_2510E2DF0(v85, v86, &v144);
    uint64_t v66 = v140;
    sub_2510FBCF0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2510D3000, v81, v82, "[%{public}s] Requested unsupported widget family entry", v83, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253395510](v84, -1, -1);
    MEMORY[0x253395510](v83, -1, -1);

    uint64_t v87 = v122;
    uint64_t v88 = v137;
  }
  else
  {

    uint64_t v87 = v80;
    uint64_t v88 = v62;
  }
  v61(v87, v88);
  uint64_t v102 = v141;
  uint64_t v103 = v119;
  sub_2510FB290();
  v104 = v120;
  sub_2510D4DFC(v120);
  sub_2510E618C(v66, qword_26B2150B0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration);
  uint64_t v105 = v136;
  (*(void (**)(uint64_t, char *, uint64_t))(v126 + 32))(v136, v103, v135);
  uint64_t v106 = type metadata accessor for MedicationsWidgetEntry();
  sub_2510DE3DC((uint64_t)v104, v105 + *(int *)(v106 + 20));
  return ((uint64_t (*)(char *, uint64_t))v58)(v138, v102);
}

uint64_t sub_2510E260C()
{
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC25HealthMedicationsWidgetUI34MedicationsWidgetTimelineGenerator_calendar;
  uint64_t v2 = sub_2510FB350();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)v0
                     + OBJC_IVAR____TtC25HealthMedicationsWidgetUI34MedicationsWidgetTimelineGenerator____lazy_storage___dateFormatter));
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_2510E26E4()
{
  return type metadata accessor for MedicationsWidgetTimelineGenerator();
}

uint64_t type metadata accessor for MedicationsWidgetTimelineGenerator()
{
  uint64_t result = qword_26B214D90;
  if (!qword_26B214D90) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2510E2738()
{
  uint64_t result = sub_2510FB350();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_2510E2800()
{
  uint64_t v8 = sub_2510FBCC0();
  uint64_t v1 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510FBC80();
  MEMORY[0x270FA5388]();
  sub_2510FBA10();
  MEMORY[0x270FA5388]();
  *(void *)(v0 + 16) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A410]), sel_init);
  sub_2510FB320();
  *(void *)(v0 + OBJC_IVAR____TtC25HealthMedicationsWidgetUI34MedicationsWidgetTimelineGenerator_cancellables) = MEMORY[0x263F8EE88];
  uint64_t v7 = OBJC_IVAR____TtC25HealthMedicationsWidgetUI34MedicationsWidgetTimelineGenerator_queue;
  unint64_t v6 = sub_2510E2AF8();
  sub_2510FBA00();
  uint64_t v9 = MEMORY[0x263F8EE78];
  sub_2510E6144(&qword_26B215158, MEMORY[0x263F8F0F8]);
  uint64_t v4 = (uint64_t (*)(uint64_t))MEMORY[0x263F8F0F8];
  sub_2510E2D8C(0, &qword_26B215148, MEMORY[0x263F8F0F8], MEMORY[0x263F8D488]);
  sub_2510E6364(&qword_26B215150, &qword_26B215148, v4);
  sub_2510FBD50();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F130], v8);
  *(void *)(v0 + v7) = sub_2510FBCD0();
  *(void *)(v0 + OBJC_IVAR____TtC25HealthMedicationsWidgetUI34MedicationsWidgetTimelineGenerator_timeoutInterval) = 0x4024000000000000;
  *(void *)(v0
            + OBJC_IVAR____TtC25HealthMedicationsWidgetUI34MedicationsWidgetTimelineGenerator____lazy_storage___dateFormatter) = 0;
  return v0;
}

unint64_t sub_2510E2AF8()
{
  unint64_t result = qword_26B215160;
  if (!qword_26B215160)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B215160);
  }
  return result;
}

uint64_t sub_2510E2B38(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_2510FBE00();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_2510FBE00();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x253394FA0](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_2510E5214(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_2510FBE00();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();

  return sub_2510FBBE0();
}

uint64_t sub_2510E2D04(unint64_t *a1)
{
  unint64_t v2 = *a1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *a1 = v2;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v2 & 0x8000000000000000) != 0
    || (v2 & 0x4000000000000000) != 0)
  {
    sub_2510E55A8(v2);
    unint64_t v2 = v4;
    *a1 = v4;
  }
  uint64_t v5 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v7[0] = (v2 & 0xFFFFFFFFFFFFFF8) + 32;
  v7[1] = v5;
  sub_2510E40B0(v7);
  return sub_2510FBBE0();
}

void sub_2510E2D8C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_2510E2DF0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2510E2EC4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2510E590C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_2510E590C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2510E2EC4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2510FBD00();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2510E3080(a5, a6);
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
  uint64_t v8 = sub_2510FBDB0();
  if (!v8)
  {
    sub_2510FBDF0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2510FBE10();
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

uint64_t sub_2510E3080(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2510E3118(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2510E3304(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2510E3304(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2510E3118(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_2510E3290(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2510FBD80();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2510FBDF0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2510FBBA0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2510FBE10();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2510FBDF0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_2510E3290(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  sub_2510E5968(0, &qword_26B2157C0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2510E3304(char a1, int64_t a2, char a3, char *a4)
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
    sub_2510E5968(0, &qword_26B2157C0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  BOOL v13 = a4 + 32;
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
  uint64_t result = sub_2510FBE10();
  __break(1u);
  return result;
}

uint64_t sub_2510E3460(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2510E3480(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_2510E3480(char a1, int64_t a2, char a3, char *a4)
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
    sub_2510E5968(0, (unint64_t *)&qword_26B2157B8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  BOOL v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
  uint64_t result = sub_2510FBE10();
  __break(1u);
  return result;
}

uint64_t sub_2510E35F8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_2510FBEC0();
  swift_bridgeObjectRetain();
  sub_2510FBB90();
  uint64_t v8 = sub_2510FBEE0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_2510FBE60() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_2510FBE60() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_2510E3A98(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *unint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_2510E37A8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_2510E6440(0, &qword_26B215790, MEMORY[0x263F8D310], MEMORY[0x263F8D320], MEMORY[0x263F8DBD8]);
  uint64_t v3 = sub_2510FBD70();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16)) {
    goto LABEL_37;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v31 = v0;
  uint64_t v32 = v2 + 56;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(v2 + 56);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v14 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_22;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      return result;
    }
    if (v16 >= v8) {
      break;
    }
    uint64_t v17 = (void *)(v2 + 56);
    unint64_t v18 = *(void *)(v32 + 8 * v16);
    ++v11;
    if (!v18)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v8) {
        goto LABEL_31;
      }
      unint64_t v18 = *(void *)(v32 + 8 * v11);
      if (!v18)
      {
        int64_t v19 = v16 + 2;
        if (v19 >= v8)
        {
LABEL_31:
          swift_release();
          uint64_t v1 = v31;
          goto LABEL_33;
        }
        unint64_t v18 = *(void *)(v32 + 8 * v19);
        if (!v18)
        {
          while (1)
          {
            int64_t v11 = v19 + 1;
            if (__OFADD__(v19, 1)) {
              goto LABEL_39;
            }
            if (v11 >= v8) {
              goto LABEL_31;
            }
            unint64_t v18 = *(void *)(v32 + 8 * v11);
            ++v19;
            if (v18) {
              goto LABEL_21;
            }
          }
        }
        int64_t v11 = v19;
      }
    }
LABEL_21:
    unint64_t v7 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v11 << 6);
LABEL_22:
    uint64_t v20 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    sub_2510FBEC0();
    sub_2510FBB90();
    uint64_t result = sub_2510FBEE0();
    uint64_t v23 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v24 = result & ~v23;
    unint64_t v25 = v24 >> 6;
    if (((-1 << v24) & ~*(void *)(v9 + 8 * (v24 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v24) & ~*(void *)(v9 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v28 = v25 == v27;
        if (v25 == v27) {
          unint64_t v25 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v9 + 8 * v25);
      }
      while (v29 == -1);
      unint64_t v12 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *BOOL v13 = v21;
    v13[1] = v22;
    ++*(void *)(v4 + 16);
  }
  swift_release();
  uint64_t v1 = v31;
  uint64_t v17 = (void *)(v2 + 56);
LABEL_33:
  uint64_t v30 = 1 << *(unsigned char *)(v2 + 32);
  if (v30 > 63) {
    bzero(v17, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v17 = -1 << v30;
  }
  *(void *)(v2 + 16) = 0;
LABEL_37:
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_2510E3A98(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_2510E37A8();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_2510E3C34();
      goto LABEL_22;
    }
    sub_2510E3DFC();
  }
  uint64_t v11 = *v4;
  sub_2510FBEC0();
  sub_2510FBB90();
  uint64_t result = sub_2510FBEE0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_2510FBE60(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_2510FBE70();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        unint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_2510FBE60();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  uint64_t *v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_2510E3C34()
{
  uint64_t v1 = v0;
  sub_2510E6440(0, &qword_26B215790, MEMORY[0x263F8D310], MEMORY[0x263F8D320], MEMORY[0x263F8DBD8]);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2510FBD60();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    int64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v19 = *v17;
    v19[1] = v18;
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

uint64_t sub_2510E3DFC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_2510E6440(0, &qword_26B215790, MEMORY[0x263F8D310], MEMORY[0x263F8D320], MEMORY[0x263F8DBD8]);
  uint64_t v3 = sub_2510FBD70();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_32:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain_n();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_21;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
    if (v16 >= v29) {
      goto LABEL_30;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_30;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v18 = v16 + 2;
        if (v18 >= v29)
        {
LABEL_30:
          uint64_t result = swift_release_n();
          uint64_t v1 = v0;
          goto LABEL_32;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v18);
        int64_t v11 = v18;
        if (!v17) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_21:
    int64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_2510FBEC0();
    swift_bridgeObjectRetain();
    sub_2510FBB90();
    uint64_t result = sub_2510FBEE0();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_33;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_30;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_20;
    }
  }
LABEL_34:
  __break(1u);
  return result;
}

uint64_t sub_2510E40B0(uint64_t *a1)
{
  uint64_t v124 = sub_2510FB2A0();
  uint64_t v2 = *(void *)(v124 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v124);
  uint64_t v123 = (char *)&v109 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v122 = (char *)&v109 - v5;
  uint64_t v6 = a1[1];
  uint64_t result = sub_2510FBE30();
  if (result >= v6)
  {
    if (v6 < 0) {
      goto LABEL_133;
    }
    if (v6) {
      return sub_2510E49B0(0, v6, 1, a1);
    }
    return result;
  }
  if (v6 >= 0) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = v6 + 1;
  }
  if (v6 < -1) {
    goto LABEL_141;
  }
  uint64_t v114 = result;
  if (v6 < 2)
  {
    int64_t v11 = (char *)MEMORY[0x263F8EE78];
    uint64_t v127 = MEMORY[0x263F8EE78];
    uint64_t v119 = (char *)((MEMORY[0x263F8EE78] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v6 != 1)
    {
      unint64_t v14 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_99:
      uint64_t v100 = v120;
      if (v14 >= 2)
      {
        uint64_t v101 = *a1;
        do
        {
          unint64_t v102 = v14 - 2;
          if (v14 < 2) {
            goto LABEL_128;
          }
          if (!v101) {
            goto LABEL_140;
          }
          uint64_t v103 = v11;
          v104 = v11 + 32;
          uint64_t v105 = *(void *)&v11[16 * v102 + 32];
          uint64_t v106 = *(void *)&v11[16 * v14 + 24];
          sub_2510E4BB0((char *)(v101 + 8 * v105), (char *)(v101 + 8 * *(void *)&v104[16 * v14 - 16]), (char *)(v101 + 8 * v106), v119);
          if (v100) {
            break;
          }
          if (v106 < v105) {
            goto LABEL_129;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v103 = sub_2510E5200((uint64_t)v103);
          }
          if (v102 >= *((void *)v103 + 2)) {
            goto LABEL_130;
          }
          os_log_t v107 = &v103[16 * v102 + 32];
          *(void *)os_log_t v107 = v105;
          *((void *)v107 + 1) = v106;
          unint64_t v108 = *((void *)v103 + 2);
          if (v14 > v108) {
            goto LABEL_131;
          }
          int64_t v11 = v103;
          memmove(&v103[16 * v14 + 16], &v103[16 * v14 + 32], 16 * (v108 - v14));
          *((void *)v103 + 2) = v108 - 1;
          unint64_t v14 = v108 - 1;
        }
        while (v108 > 2);
      }
LABEL_110:
      swift_bridgeObjectRelease();
      *(void *)((v127 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_2510FBBE0();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v9 = v8 >> 1;
    sub_2510FB3B0();
    uint64_t v10 = sub_2510FBBF0();
    *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) = v9;
    uint64_t v119 = (char *)((v10 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v127 = v10;
  }
  uint64_t v12 = 0;
  uint64_t v13 = *a1;
  uint64_t v121 = (void (**)(char *, uint64_t))(v2 + 8);
  uint64_t v112 = v13 + 16;
  uint64_t v110 = a1;
  uint64_t v111 = v13 - 8;
  int64_t v11 = (char *)MEMORY[0x263F8EE78];
  uint64_t v117 = v6;
  uint64_t v126 = v13;
  while (1)
  {
    uint64_t v15 = v12;
    uint64_t v16 = v12 + 1;
    uint64_t v116 = v12;
    if (v12 + 1 < v6)
    {
      swift_retain();
      swift_retain();
      unint64_t v17 = v122;
      sub_2510FB390();
      int64_t v18 = v123;
      sub_2510FB390();
      LODWORD(v125) = sub_2510FB270();
      int64_t v19 = (char *)*v121;
      uint64_t v20 = v18;
      uint64_t v21 = v124;
      (*v121)(v20, v124);
      uint64_t v118 = v19;
      ((void (*)(char *, uint64_t))v19)(v17, v21);
      swift_release();
      uint64_t v6 = v117;
      swift_release();
      uint64_t v16 = v15 + 2;
      if (v15 + 2 < v6)
      {
        uint64_t v113 = v11;
        uint64_t v22 = v112 + 8 * v15;
        while (1)
        {
          uint64_t v23 = v16;
          swift_retain();
          swift_retain();
          unint64_t v24 = v122;
          sub_2510FB390();
          char v25 = v123;
          sub_2510FB390();
          int v26 = sub_2510FB270();
          BOOL v27 = v25;
          uint64_t v28 = v124;
          int64_t v29 = (void (*)(char *, uint64_t))v118;
          ((void (*)(char *, uint64_t))v118)(v27, v124);
          v29(v24, v28);
          swift_release();
          swift_release();
          if ((v125 ^ v26)) {
            break;
          }
          ++v16;
          v22 += 8;
          uint64_t v6 = v117;
          if (v117 == v23 + 1)
          {
            uint64_t v16 = v117;
            goto LABEL_22;
          }
        }
        uint64_t v6 = v117;
LABEL_22:
        uint64_t v15 = v116;
        int64_t v11 = v113;
      }
      uint64_t v30 = v126;
      if (v125)
      {
        if (v16 < v15) {
          goto LABEL_134;
        }
        if (v15 < v16)
        {
          uint64_t v31 = (uint64_t *)(v111 + 8 * v16);
          uint64_t v32 = v16;
          uint64_t v33 = v15;
          uint64_t v34 = (uint64_t *)(v126 + 8 * v15);
          do
          {
            if (v33 != --v32)
            {
              if (!v30) {
                goto LABEL_139;
              }
              uint64_t v35 = *v34;
              *uint64_t v34 = *v31;
              *uint64_t v31 = v35;
            }
            ++v33;
            --v31;
            ++v34;
          }
          while (v33 < v32);
        }
      }
    }
    if (v16 >= v6) {
      goto LABEL_49;
    }
    if (__OFSUB__(v16, v15)) {
      goto LABEL_132;
    }
    if (v16 - v15 >= v114) {
      goto LABEL_49;
    }
    if (__OFADD__(v15, v114)) {
      goto LABEL_135;
    }
    uint64_t v36 = v15 + v114 >= v6 ? v6 : v15 + v114;
    if (v36 < v15) {
      break;
    }
    if (v16 != v36)
    {
      uint64_t v113 = v11;
      uint64_t v37 = (char *)(v111 + 8 * v16);
      uint64_t v115 = v36;
      do
      {
        uint64_t v125 = v16;
        uint64_t v38 = v15;
        uint64_t v118 = v37;
        uint64_t v39 = (uint64_t *)v37;
        do
        {
          swift_retain();
          swift_retain();
          uint64_t v40 = v122;
          sub_2510FB390();
          uint64_t v41 = v123;
          sub_2510FB390();
          char v42 = sub_2510FB270();
          id v43 = *v121;
          uint64_t v44 = v41;
          uint64_t v45 = v124;
          (*v121)(v44, v124);
          v43(v40, v45);
          swift_release();
          swift_release();
          if ((v42 & 1) == 0) {
            break;
          }
          if (!v126) {
            goto LABEL_137;
          }
          uint64_t v46 = *v39;
          *uint64_t v39 = v39[1];
          v39[1] = v46;
          --v39;
          ++v38;
        }
        while (v125 != v38);
        uint64_t v16 = v125 + 1;
        uint64_t v37 = v118 + 8;
        uint64_t v15 = v116;
      }
      while (v125 + 1 != v115);
      uint64_t v16 = v115;
      int64_t v11 = v113;
    }
LABEL_49:
    if (v16 < v15) {
      goto LABEL_127;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int64_t v11 = sub_2510E504C(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v48 = *((void *)v11 + 2);
    unint64_t v47 = *((void *)v11 + 3);
    unint64_t v14 = v48 + 1;
    uint64_t v49 = v126;
    if (v48 >= v47 >> 1)
    {
      uint64_t v99 = sub_2510E504C((char *)(v47 > 1), v48 + 1, 1, v11);
      uint64_t v49 = v126;
      int64_t v11 = v99;
    }
    *((void *)v11 + 2) = v14;
    uint64_t v50 = v11 + 32;
    unint64_t v51 = &v11[16 * v48 + 32];
    *(void *)unint64_t v51 = v15;
    *((void *)v51 + 1) = v16;
    uint64_t v125 = v16;
    if (v48)
    {
      while (1)
      {
        unint64_t v52 = v14 - 1;
        if (v14 >= 4)
        {
          unint64_t v57 = &v50[16 * v14];
          uint64_t v58 = *((void *)v57 - 8);
          uint64_t v59 = *((void *)v57 - 7);
          BOOL v63 = __OFSUB__(v59, v58);
          uint64_t v60 = v59 - v58;
          if (v63) {
            goto LABEL_116;
          }
          uint64_t v62 = *((void *)v57 - 6);
          uint64_t v61 = *((void *)v57 - 5);
          BOOL v63 = __OFSUB__(v61, v62);
          uint64_t v55 = v61 - v62;
          char v56 = v63;
          if (v63) {
            goto LABEL_117;
          }
          unint64_t v64 = v14 - 2;
          uint64_t v65 = &v50[16 * v14 - 32];
          uint64_t v67 = *(void *)v65;
          uint64_t v66 = *((void *)v65 + 1);
          BOOL v63 = __OFSUB__(v66, v67);
          uint64_t v68 = v66 - v67;
          if (v63) {
            goto LABEL_119;
          }
          BOOL v63 = __OFADD__(v55, v68);
          uint64_t v69 = v55 + v68;
          if (v63) {
            goto LABEL_122;
          }
          if (v69 >= v60)
          {
            uint64_t v87 = &v50[16 * v52];
            uint64_t v89 = *(void *)v87;
            uint64_t v88 = *((void *)v87 + 1);
            BOOL v63 = __OFSUB__(v88, v89);
            uint64_t v90 = v88 - v89;
            if (v63) {
              goto LABEL_126;
            }
            BOOL v80 = v55 < v90;
            goto LABEL_86;
          }
        }
        else
        {
          if (v14 != 3)
          {
            uint64_t v81 = *((void *)v11 + 4);
            uint64_t v82 = *((void *)v11 + 5);
            BOOL v63 = __OFSUB__(v82, v81);
            uint64_t v74 = v82 - v81;
            char v75 = v63;
            goto LABEL_80;
          }
          uint64_t v54 = *((void *)v11 + 4);
          uint64_t v53 = *((void *)v11 + 5);
          BOOL v63 = __OFSUB__(v53, v54);
          uint64_t v55 = v53 - v54;
          char v56 = v63;
        }
        if (v56) {
          goto LABEL_118;
        }
        unint64_t v64 = v14 - 2;
        uint64_t v70 = &v50[16 * v14 - 32];
        uint64_t v72 = *(void *)v70;
        uint64_t v71 = *((void *)v70 + 1);
        BOOL v73 = __OFSUB__(v71, v72);
        uint64_t v74 = v71 - v72;
        char v75 = v73;
        if (v73) {
          goto LABEL_121;
        }
        uint64_t v76 = &v50[16 * v52];
        uint64_t v78 = *(void *)v76;
        uint64_t v77 = *((void *)v76 + 1);
        BOOL v63 = __OFSUB__(v77, v78);
        uint64_t v79 = v77 - v78;
        if (v63) {
          goto LABEL_124;
        }
        if (__OFADD__(v74, v79)) {
          goto LABEL_125;
        }
        if (v74 + v79 >= v55)
        {
          BOOL v80 = v55 < v79;
LABEL_86:
          if (v80) {
            unint64_t v52 = v64;
          }
          goto LABEL_88;
        }
LABEL_80:
        if (v75) {
          goto LABEL_120;
        }
        uint64_t v83 = &v50[16 * v52];
        uint64_t v85 = *(void *)v83;
        uint64_t v84 = *((void *)v83 + 1);
        BOOL v63 = __OFSUB__(v84, v85);
        uint64_t v86 = v84 - v85;
        if (v63) {
          goto LABEL_123;
        }
        if (v86 < v74) {
          goto LABEL_14;
        }
LABEL_88:
        unint64_t v91 = v52 - 1;
        if (v52 - 1 >= v14)
        {
          __break(1u);
LABEL_113:
          __break(1u);
LABEL_114:
          __break(1u);
LABEL_115:
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
          goto LABEL_136;
        }
        if (!v49) {
          goto LABEL_138;
        }
        uint64_t v92 = v11;
        uint64_t v93 = &v50[16 * v91];
        uint64_t v94 = *(void *)v93;
        uint64_t v95 = &v50[16 * v52];
        uint64_t v96 = *((void *)v95 + 1);
        uint64_t v97 = v120;
        sub_2510E4BB0((char *)(v49 + 8 * *(void *)v93), (char *)(v49 + 8 * *(void *)v95), (char *)(v49 + 8 * v96), v119);
        uint64_t v120 = v97;
        if (v97) {
          goto LABEL_110;
        }
        if (v96 < v94) {
          goto LABEL_113;
        }
        if (v52 > *((void *)v92 + 2)) {
          goto LABEL_114;
        }
        *(void *)uint64_t v93 = v94;
        *(void *)&v50[16 * v91 + 8] = v96;
        unint64_t v98 = *((void *)v92 + 2);
        if (v52 >= v98) {
          goto LABEL_115;
        }
        int64_t v11 = v92;
        unint64_t v14 = v98 - 1;
        memmove(&v50[16 * v52], v95 + 16, 16 * (v98 - 1 - v52));
        *((void *)v92 + 2) = v98 - 1;
        uint64_t v49 = v126;
        if (v98 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v14 = 1;
LABEL_14:
    uint64_t v6 = v117;
    uint64_t v12 = v125;
    if (v125 >= v117)
    {
      a1 = v110;
      goto LABEL_99;
    }
  }
LABEL_136:
  __break(1u);
LABEL_137:
  __break(1u);
LABEL_138:
  __break(1u);
LABEL_139:
  __break(1u);
LABEL_140:
  __break(1u);
LABEL_141:
  uint64_t result = sub_2510FBDF0();
  __break(1u);
  return result;
}

uint64_t sub_2510E49B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v26 = a1;
  uint64_t v31 = sub_2510FB2A0();
  uint64_t v7 = MEMORY[0x270FA5388](v31);
  uint64_t v30 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v7);
  int64_t v29 = (char *)&v24 - v11;
  uint64_t v25 = a2;
  if (a3 != a2)
  {
    uint64_t v12 = *a4;
    uint64_t v28 = v10 + 8;
    uint64_t v32 = v12;
    uint64_t v13 = (void *)(v12 + 8 * a3 - 8);
    uint64_t v15 = (void (**)(char *, uint64_t))(v10 + 8);
    unint64_t v14 = v29;
LABEL_5:
    uint64_t v16 = v26;
    BOOL v27 = v13;
    uint64_t v33 = a3;
    while (1)
    {
      swift_retain();
      swift_retain();
      sub_2510FB390();
      unint64_t v17 = v30;
      sub_2510FB390();
      char v18 = sub_2510FB270();
      int64_t v19 = *v15;
      uint64_t v20 = v17;
      uint64_t v21 = v31;
      (*v15)(v20, v31);
      v19(v14, v21);
      swift_release();
      uint64_t v22 = v33;
      uint64_t result = swift_release();
      if ((v18 & 1) == 0)
      {
LABEL_4:
        a3 = v22 + 1;
        uint64_t v13 = v27 + 1;
        if (a3 == v25) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v32) {
        break;
      }
      uint64_t v23 = *v13;
      *uint64_t v13 = v13[1];
      v13[1] = v23;
      --v13;
      if (v22 == ++v16) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_2510E4BB0(char *a1, char *a2, char *a3, char *a4)
{
  uint64_t v48 = sub_2510FB2A0();
  uint64_t v8 = *(void *)(v48 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v48);
  unint64_t v47 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v46 = (char *)&v38 - v11;
  uint64_t v12 = a2 - a1;
  uint64_t v13 = a2 - a1 + 7;
  if (a2 - a1 >= 0) {
    uint64_t v13 = a2 - a1;
  }
  uint64_t v14 = v13 >> 3;
  uint64_t v15 = a2;
  uint64_t v44 = a3;
  uint64_t v16 = a3 - a2;
  uint64_t v17 = v16 / 8;
  unint64_t v51 = a1;
  uint64_t v50 = a4;
  if (v13 >> 3 >= v16 / 8)
  {
    if (v16 < -7) {
      goto LABEL_43;
    }
    if (a4 != v15 || &v15[8 * v17] <= a4) {
      memmove(a4, v15, 8 * v17);
    }
    uint64_t v25 = &a4[8 * v17];
    uint64_t v49 = v25;
    unint64_t v51 = v15;
    if (v16 < 8 || a1 >= v15) {
      goto LABEL_42;
    }
    uint64_t v39 = (void (**)(char *, uint64_t))(v8 + 8);
    uint64_t v40 = a1;
    uint64_t v26 = v44 - 8;
    BOOL v27 = v15;
    uint64_t v41 = a4;
    while (1)
    {
      unint64_t v45 = (unint64_t)v15;
      id v43 = v25;
      uint64_t v44 = v26 + 8;
      int64_t v29 = v25 - 8;
      char v42 = v27 - 8;
      swift_retain();
      swift_retain();
      uint64_t v30 = v46;
      sub_2510FB390();
      uint64_t v31 = v47;
      sub_2510FB390();
      char v32 = sub_2510FB270();
      uint64_t v33 = *v39;
      uint64_t v34 = v31;
      uint64_t v35 = v48;
      (*v39)(v34, v48);
      v33(v30, v35);
      swift_release();
      swift_release();
      if (v32) {
        break;
      }
      uint64_t v49 = v29;
      BOOL v27 = (char *)v45;
      if (v44 < v43 || v26 >= v43)
      {
        *(void *)uint64_t v26 = *(void *)v29;
        uint64_t v25 = v29;
        goto LABEL_30;
      }
      unint64_t v28 = (unint64_t)v40;
      unint64_t v36 = (unint64_t)v41;
      if (v44 != v43) {
        *(void *)uint64_t v26 = *(void *)v29;
      }
      uint64_t v25 = v29;
      if ((unint64_t)v29 <= v36) {
        goto LABEL_42;
      }
LABEL_31:
      v26 -= 8;
      uint64_t v15 = v27;
      if ((unint64_t)v27 <= v28) {
        goto LABEL_42;
      }
    }
    uint64_t v25 = v43;
    BOOL v27 = v42;
    if (v44 != (char *)v45 || (unint64_t)v26 >= v45) {
      *(void *)uint64_t v26 = *(void *)v42;
    }
    unint64_t v51 = v27;
LABEL_30:
    unint64_t v28 = (unint64_t)v40;
    if (v25 <= v41) {
      goto LABEL_42;
    }
    goto LABEL_31;
  }
  if (v12 >= -7)
  {
    if (a4 != a1 || &a1[8 * v14] <= a4) {
      memmove(a4, a1, 8 * v14);
    }
    id v43 = &a4[8 * v14];
    uint64_t v49 = v43;
    if (v12 >= 8 && v15 < v44)
    {
      char v42 = (char *)(v8 + 8);
      char v18 = v46;
      do
      {
        int64_t v19 = a4;
        swift_retain();
        swift_retain();
        sub_2510FB390();
        uint64_t v20 = v47;
        sub_2510FB390();
        LODWORD(v45) = sub_2510FB270();
        uint64_t v21 = *(void (**)(char *, uint64_t))v42;
        uint64_t v22 = v20;
        uint64_t v23 = v48;
        (*(void (**)(char *, uint64_t))v42)(v22, v48);
        v21(v18, v23);
        swift_release();
        swift_release();
        if (v45)
        {
          uint64_t v24 = v15 + 8;
          if (a1 < v15 || a1 >= v24 || a1 != v15) {
            *(void *)a1 = *(void *)v15;
          }
        }
        else
        {
          if (a1 != a4) {
            *(void *)a1 = *(void *)a4;
          }
          a4 += 8;
          uint64_t v50 = v19 + 8;
          uint64_t v24 = v15;
        }
        a1 += 8;
        unint64_t v51 = a1;
        if (a4 >= v43) {
          break;
        }
        uint64_t v15 = v24;
      }
      while (v24 < v44);
    }
LABEL_42:
    sub_2510E5144((void **)&v51, (const void **)&v50, &v49);
    return 1;
  }
LABEL_43:
  uint64_t result = sub_2510FBE10();
  __break(1u);
  return result;
}

char *sub_2510E504C(char *result, int64_t a2, char a3, char *a4)
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
    sub_2510E63BC();
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_2510E5144(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_2510FBE10();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_2510E5200(uint64_t a1)
{
  return sub_2510E504C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2510E5214(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_2510FBE00();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_2510FBE00();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        int64_t v11 = (uint64_t (*)(uint64_t))MEMORY[0x263F44C60];
        sub_2510E2D8C(0, &qword_269B20B90, MEMORY[0x263F44C60], MEMORY[0x263F8D488]);
        sub_2510E6364(&qword_269B20B98, &qword_269B20B90, v11);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          uint64_t v13 = sub_2510E5470(v17, i, a3);
          uint64_t v15 = *v14;
          swift_retain();
          ((void (*)(uint64_t (**)(), void))v13)(v17, 0);
          *(void *)(a1 + 8 * i) = v15;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_2510FB3B0();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_2510FBE10();
  __break(1u);
  return result;
}

void (*sub_2510E5470(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_2510E5520(v6, a2, a3);
  return sub_2510E54D8;
}

void sub_2510E54D8(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t (*sub_2510E5520(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = MEMORY[0x253394F90](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    uint64_t v4 = swift_retain();
LABEL_5:
    *uint64_t v3 = v4;
    return sub_2510E55A0;
  }
  __break(1u);
  return result;
}

uint64_t sub_2510E55A0()
{
  return swift_release();
}

void sub_2510E55A8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_2510FBE00();
    swift_bridgeObjectRelease();
  }

  JUMPOUT(0x253394FA0);
}

uint64_t sub_2510E5624(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 16);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  unint64_t v2 = 0;
  uint64_t v3 = result + 40;
  uint64_t v4 = -(uint64_t)v1;
  uint64_t v5 = MEMORY[0x263F8EE78];
  uint64_t v15 = result + 40;
  unint64_t v16 = *(void *)(result + 16);
  do
  {
    if (v2 <= v1) {
      unint64_t v6 = v1;
    }
    else {
      unint64_t v6 = v2;
    }
    uint64_t v7 = -(uint64_t)v6;
    for (unint64_t i = (uint64_t *)(v3 + 16 * v2++); ; i += 2)
    {
      if (v7 + v2 == 1)
      {
        __break(1u);
        return result;
      }
      uint64_t v10 = *(i - 1);
      uint64_t v9 = *i;
      swift_bridgeObjectRetain_n();
      char v11 = sub_2510E35F8(&v17, v10, v9);
      swift_bridgeObjectRelease();
      if (v11) {
        break;
      }
      uint64_t result = swift_bridgeObjectRelease();
      ++v2;
      if (v4 + v2 == 1) {
        return v5;
      }
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = v5;
    if ((result & 1) == 0)
    {
      uint64_t result = sub_2510E3460(0, *(void *)(v5 + 16) + 1, 1);
      uint64_t v5 = v18;
    }
    unint64_t v13 = *(void *)(v5 + 16);
    unint64_t v12 = *(void *)(v5 + 24);
    if (v13 >= v12 >> 1)
    {
      uint64_t result = sub_2510E3460(v12 > 1, v13 + 1, 1);
      uint64_t v5 = v18;
    }
    *(void *)(v5 + 16) = v13 + 1;
    uint64_t v14 = v5 + 16 * v13;
    *(void *)(v14 + 32) = v10;
    *(void *)(v14 + 40) = v9;
    uint64_t v3 = v15;
    unint64_t v1 = v16;
  }
  while (v4 + v2);
  return v5;
}

uint64_t sub_2510E5790(uint64_t a1, uint64_t a2)
{
  sub_2510E2D8C(0, qword_26B2150B0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2510E5824(uint64_t a1, uint64_t a2)
{
  sub_2510E2D8C(0, &qword_26B214D50, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_2510E590C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_2510E5968(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_2510FBE50();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

void sub_2510E59B0()
{
  if (!qword_26B215520)
  {
    sub_2510E2D8C(255, &qword_26B215550, MEMORY[0x263F44CA0], MEMORY[0x263EFDE48]);
    sub_2510E5A44();
    unint64_t v0 = sub_2510FB4B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B215520);
    }
  }
}

unint64_t sub_2510E5A44()
{
  unint64_t result = qword_26B215548;
  if (!qword_26B215548)
  {
    sub_2510E2D8C(255, &qword_26B215550, MEMORY[0x263F44CA0], MEMORY[0x263EFDE48]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B215548);
  }
  return result;
}

void sub_2510E5ACC()
{
  if (!qword_26B215530)
  {
    sub_2510E59B0();
    sub_2510E62C0(255, &qword_26B2157D0);
    sub_2510E6144(&qword_26B215518, (void (*)(uint64_t))sub_2510E59B0);
    unint64_t v0 = sub_2510FB4C0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B215530);
    }
  }
}

void sub_2510E5B98()
{
  if (!qword_26B215540)
  {
    sub_2510E5ACC();
    sub_2510E2AF8();
    sub_2510E6144(&qword_26B215528, (void (*)(uint64_t))sub_2510E5ACC);
    sub_2510E6144(&qword_26B215788, (void (*)(uint64_t))sub_2510E2AF8);
    unint64_t v0 = sub_2510FB4D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B215540);
    }
  }
}

uint64_t sub_2510E5C84()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2510E5C94@<X0>(uint64_t *a1@<X8>)
{
  sub_2510E6490();
  uint64_t result = swift_allocError();
  *a1 = result;
  return result;
}

uint64_t sub_2510E5CD4()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2510E5D0C()
{
  uint64_t v1 = sub_2510FBA70();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_2510E5E00(uint64_t *a1)
{
  uint64_t v3 = *(void *)(sub_2510FBA70() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void (**)(void))(v1 + v5);
  uint64_t v8 = *(void *)(v1 + v5 + 8);
  uint64_t v9 = *(void *)(v1 + ((v5 + 23) & 0xFFFFFFFFFFFFFFF8));

  return sub_2510DF740(a1, v6, v1 + v4, v7, v8, v9);
}

uint64_t sub_2510E5EB0()
{
  uint64_t v1 = sub_2510FB2A0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = sub_2510FBA70();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v4 + v5 + v8) & ~v8;
  uint64_t v10 = v3 | v8 | 7;
  unint64_t v11 = ((((*(void *)(v7 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  swift_release();

  return MEMORY[0x270FA0238](v0, v11, v10);
}

uint64_t sub_2510E6030(void (**a1)(char *, uint64_t))
{
  uint64_t v3 = *(void *)(sub_2510FB2A0() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v6 = *(void *)(sub_2510FBA70() - 8);
  unint64_t v7 = (v4 + v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v8 = (*(void *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = *(void *)(v1 + 16);
  uint64_t v10 = *(void **)(v1 + 24);
  unint64_t v11 = *(void (**)(uint64_t))(v1 + v8);
  uint64_t v12 = *(void *)(v1 + v8 + 8);
  uint64_t v13 = *(void *)(v1 + ((v8 + 23) & 0xFFFFFFFFFFFFFFF8));

  return sub_2510DFD84(a1, v9, v10, v1 + v4, v1 + v7, v11, v12, v13);
}

uint64_t sub_2510E6144(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2510E618C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_2510E2D8C(0, a2, a3, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_2510E61FC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MedicationsWidgetEntry();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2510E6258()
{
  if (!qword_26B2157C8)
  {
    sub_2510E62C0(255, &qword_26B2157D8);
    unint64_t v0 = sub_2510FBE50();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B2157C8);
    }
  }
}

uint64_t sub_2510E62C0(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_2510E6310()
{
  unint64_t result = qword_26B215750;
  if (!qword_26B215750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B215750);
  }
  return result;
}

uint64_t sub_2510E6364(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2510E2D8C(255, a2, a3, MEMORY[0x263F8D488]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_2510E63BC()
{
  if (!qword_269B20BA0)
  {
    sub_2510E6440(255, &qword_269B20BA8, MEMORY[0x263F8D6C8], MEMORY[0x263F8D6E0], MEMORY[0x263F8D870]);
    unint64_t v0 = sub_2510FBE50();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B20BA0);
    }
  }
}

void sub_2510E6440(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, uint64_t, uint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = a5(0, a3, a4);
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

unint64_t sub_2510E6490()
{
  unint64_t result = qword_269B20BB0;
  if (!qword_269B20BB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B20BB0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MedicationsWidgetTimelineGenerator.TimelineGeneratorError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for MedicationsWidgetTimelineGenerator.TimelineGeneratorError(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x2510E65D8);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2510E6600()
{
  return 0;
}

ValueMetadata *type metadata accessor for MedicationsWidgetTimelineGenerator.TimelineGeneratorError()
{
  return &type metadata for MedicationsWidgetTimelineGenerator.TimelineGeneratorError;
}

unint64_t sub_2510E661C()
{
  unint64_t result = qword_269B20BB8;
  if (!qword_269B20BB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B20BB8);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MedicationsWidgetTimelineGenerator.State(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for MedicationsWidgetTimelineGenerator.State(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2510E67D8);
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

uint64_t sub_2510E6800(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2510E6808(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MedicationsWidgetTimelineGenerator.State()
{
  return &type metadata for MedicationsWidgetTimelineGenerator.State;
}

unint64_t sub_2510E6824()
{
  unint64_t result = qword_269B20BC0;
  if (!qword_269B20BC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B20BC0);
  }
  return result;
}

uint64_t sub_2510E6878()
{
  unint64_t v0 = sub_2510FBE20();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

void *sub_2510E68C4(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    uint64_t v9 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_2510E6DB8(0, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_2510FBA70();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v10 = *(int *)(a3 + 20);
    unint64_t v11 = (void *)((char *)a1 + v10);
    uint64_t v12 = (void *)((char *)a2 + v10);
    sub_2510E6DB8(0, &qword_26B215558, MEMORY[0x263F1FC90], MEMORY[0x263F185C8]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_2510FBA60();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *unint64_t v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v38 = a3;
    uint64_t v39 = a2;
    uint64_t v14 = *(int *)(a3 + 24);
    uint64_t v40 = a1;
    uint64_t v15 = (void *)((char *)a1 + v14);
    unint64_t v16 = (char *)a2 + v14;
    uint64_t v17 = *(void *)((char *)a2 + v14 + 8);
    *uint64_t v15 = *(void *)((char *)a2 + v14);
    v15[1] = v17;
    v15[2] = *(void *)((char *)a2 + v14 + 16);
    uint64_t v18 = (int *)type metadata accessor for MedicationsWidgetViewModel();
    uint64_t v19 = v18[6];
    __dst = (char *)v15 + v19;
    uint64_t v20 = &v16[v19];
    uint64_t v21 = type metadata accessor for MedmojiIconConfiguration();
    uint64_t v22 = *(void *)(v21 - 8);
    uint64_t v23 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v23(v20, 1, v21))
    {
      sub_2510E6DB8(0, qword_26B2150B0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, MEMORY[0x263F8D8F0]);
      memcpy(__dst, v20, *(void *)(*(void *)(v24 - 8) + 64));
    }
    else
    {
      uint64_t v25 = sub_2510FB420();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(__dst, v20, v25);
      uint64_t v26 = *(int *)(v21 + 20);
      BOOL v27 = &__dst[v26];
      unint64_t v28 = &v20[v26];
      uint64_t v29 = sub_2510FB3D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 16))(v27, v28, v29);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(__dst, 0, 1, v21);
    }
    *((unsigned char *)v15 + v18[7]) = v16[v18[7]];
    uint64_t v30 = v18[8];
    uint64_t v31 = (char *)v15 + v30;
    char v32 = &v16[v30];
    uint64_t v33 = sub_2510FB2A0();
    uint64_t v34 = *(void *)(v33 - 8);
    uint64_t v9 = v40;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
    {
      sub_2510E6DB8(0, &qword_26B214D50, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
      memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v31, v32, v33);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
    }
    *((unsigned char *)v40 + *(int *)(v38 + 28)) = *((unsigned char *)v39 + *(int *)(v38 + 28));
  }
  return v9;
}

void sub_2510E6DB8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_2510E6E1C(uint64_t a1, uint64_t a2)
{
  sub_2510E6DB8(0, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_2510FBA70();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  sub_2510E6DB8(0, &qword_26B215558, MEMORY[0x263F1FC90], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_2510FBA60();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v9 = v7 + *(int *)(v8 + 24);
  uint64_t v10 = type metadata accessor for MedmojiIconConfiguration();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v9, 1, v10))
  {
    uint64_t v11 = sub_2510FB420();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v9, v11);
    uint64_t v12 = v9 + *(int *)(v10 + 20);
    uint64_t v13 = sub_2510FB3D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  }
  uint64_t v14 = v7 + *(int *)(v8 + 32);
  uint64_t v15 = sub_2510FB2A0();
  uint64_t v18 = *(void *)(v15 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(v14, 1, v15);
  if (!result)
  {
    uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t))(v18 + 8);
    return v17(v14, v15);
  }
  return result;
}

void *sub_2510E7114(void *a1, void *a2, uint64_t a3)
{
  sub_2510E6DB8(0, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_2510FBA70();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  sub_2510E6DB8(0, &qword_26B215558, MEMORY[0x263F1FC90], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_2510FBA60();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v35 = a3;
  unint64_t v36 = a2;
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v37 = a1;
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = *(void *)((char *)a2 + v11 + 8);
  *uint64_t v12 = *(void *)((char *)a2 + v11);
  v12[1] = v14;
  v12[2] = *(void *)((char *)a2 + v11 + 16);
  uint64_t v15 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v16 = v15[6];
  __dst = (char *)v12 + v16;
  uint64_t v17 = &v13[v16];
  uint64_t v18 = type metadata accessor for MedmojiIconConfiguration();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v20(v17, 1, v18))
  {
    sub_2510E6DB8(0, qword_26B2150B0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, MEMORY[0x263F8D8F0]);
    memcpy(__dst, v17, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    uint64_t v22 = sub_2510FB420();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(__dst, v17, v22);
    uint64_t v23 = *(int *)(v18 + 20);
    uint64_t v24 = &__dst[v23];
    uint64_t v25 = &v17[v23];
    uint64_t v26 = sub_2510FB3D0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(__dst, 0, 1, v18);
  }
  *((unsigned char *)v12 + v15[7]) = v13[v15[7]];
  uint64_t v27 = v15[8];
  unint64_t v28 = (char *)v12 + v27;
  uint64_t v29 = &v13[v27];
  uint64_t v30 = sub_2510FB2A0();
  uint64_t v31 = *(void *)(v30 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30))
  {
    sub_2510E6DB8(0, &qword_26B214D50, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
    memcpy(v28, v29, *(void *)(*(void *)(v32 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v28, v29, v30);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v28, 0, 1, v30);
  }
  *((unsigned char *)v37 + *(int *)(v35 + 28)) = *((unsigned char *)v36 + *(int *)(v35 + 28));
  return v37;
}

void *sub_2510E75B8(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = (uint64_t (*)(uint64_t))MEMORY[0x263F1FD10];
    uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
    sub_2510F0560((uint64_t)a1, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
    sub_2510E6DB8(0, &qword_26B215110, v6, v7);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v8 = sub_2510FBA70();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (void *)((char *)a1 + v9);
    uint64_t v11 = (void *)((char *)a2 + v9);
    uint64_t v12 = (uint64_t (*)(uint64_t))MEMORY[0x263F1FC90];
    uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
    sub_2510F0560((uint64_t)a1 + v9, &qword_26B215558, MEMORY[0x263F1FC90], MEMORY[0x263F185C8]);
    sub_2510E6DB8(0, &qword_26B215558, v12, v13);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = sub_2510FBA60();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v10, v11, v14);
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v50 = a3;
  unint64_t v51 = a2;
  uint64_t v15 = *(int *)(a3 + 24);
  unint64_t v52 = a1;
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (char *)a2 + v15;
  *uint64_t v16 = *(void *)((char *)a2 + v15);
  v16[1] = *(void *)((char *)a2 + v15 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v16[2] = *((void *)v17 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v19 = v18[6];
  uint64_t v20 = (char *)v16 + v19;
  uint64_t v21 = &v17[v19];
  uint64_t v22 = type metadata accessor for MedmojiIconConfiguration();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48);
  int v25 = v24(v20, 1, v22);
  int v26 = v24(v21, 1, v22);
  if (v25)
  {
    if (!v26)
    {
      uint64_t v27 = sub_2510FB420();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16))(v20, v21, v27);
      uint64_t v28 = *(int *)(v22 + 20);
      uint64_t v29 = &v20[v28];
      uint64_t v30 = &v21[v28];
      uint64_t v31 = sub_2510FB3D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 16))(v29, v30, v31);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (v26)
  {
    sub_2510F05BC((uint64_t)v20, (uint64_t (*)(void))type metadata accessor for MedmojiIconConfiguration);
LABEL_14:
    sub_2510E6DB8(0, qword_26B2150B0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, MEMORY[0x263F8D8F0]);
    memcpy(v20, v21, *(void *)(*(void *)(v32 - 8) + 64));
    goto LABEL_15;
  }
  uint64_t v45 = sub_2510FB420();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v45 - 8) + 24))(v20, v21, v45);
  uint64_t v46 = *(int *)(v22 + 20);
  unint64_t v47 = &v20[v46];
  uint64_t v48 = &v21[v46];
  uint64_t v49 = sub_2510FB3D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v49 - 8) + 24))(v47, v48, v49);
LABEL_15:
  *((unsigned char *)v16 + v18[7]) = v17[v18[7]];
  uint64_t v33 = v18[8];
  uint64_t v34 = (char *)v16 + v33;
  uint64_t v35 = &v17[v33];
  uint64_t v36 = sub_2510FB2A0();
  uint64_t v37 = *(void *)(v36 - 8);
  uint64_t v38 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v37 + 48);
  int v39 = v38(v34, 1, v36);
  int v40 = v38(v35, 1, v36);
  if (!v39)
  {
    char v42 = v51;
    uint64_t v41 = v52;
    if (!v40)
    {
      (*(void (**)(char *, char *, uint64_t))(v37 + 24))(v34, v35, v36);
      goto LABEL_21;
    }
    (*(void (**)(char *, uint64_t))(v37 + 8))(v34, v36);
    goto LABEL_20;
  }
  char v42 = v51;
  uint64_t v41 = v52;
  if (v40)
  {
LABEL_20:
    sub_2510E6DB8(0, &qword_26B214D50, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
    memcpy(v34, v35, *(void *)(*(void *)(v43 - 8) + 64));
    goto LABEL_21;
  }
  (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v34, v35, v36);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
LABEL_21:
  *((unsigned char *)v41 + *(int *)(v50 + 28)) = *((unsigned char *)v42 + *(int *)(v50 + 28));
  return v41;
}

char *sub_2510E7BDC(char *a1, char *a2, int *a3)
{
  sub_2510E6DB8(0, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  uint64_t v7 = v6;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_2510FBA70();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  uint64_t v9 = a3[5];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  sub_2510E6DB8(0, &qword_26B215558, MEMORY[0x263F1FC90], MEMORY[0x263F185C8]);
  uint64_t v13 = v12;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = sub_2510FBA60();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v10, v11, v14);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
  }
  uint64_t v15 = a3[6];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  *(_OWORD *)uint64_t v16 = *(_OWORD *)&a2[v15];
  *((void *)v16 + 2) = *(void *)&a2[v15 + 16];
  uint64_t v18 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v19 = v18[6];
  uint64_t v20 = &v16[v19];
  uint64_t v21 = &v17[v19];
  uint64_t v22 = type metadata accessor for MedmojiIconConfiguration();
  uint64_t v23 = *(void *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
  {
    sub_2510E6DB8(0, qword_26B2150B0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, MEMORY[0x263F8D8F0]);
    memcpy(v20, v21, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    uint64_t v25 = sub_2510FB420();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 32))(v20, v21, v25);
    uint64_t v26 = *(int *)(v22 + 20);
    int v40 = a1;
    uint64_t v27 = a2;
    uint64_t v28 = a3;
    uint64_t v29 = &v20[v26];
    uint64_t v30 = &v21[v26];
    uint64_t v31 = sub_2510FB3D0();
    uint64_t v32 = v29;
    a3 = v28;
    a2 = v27;
    a1 = v40;
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 32))(v32, v30, v31);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  }
  v16[v18[7]] = v17[v18[7]];
  uint64_t v33 = v18[8];
  uint64_t v34 = &v16[v33];
  uint64_t v35 = &v17[v33];
  uint64_t v36 = sub_2510FB2A0();
  uint64_t v37 = *(void *)(v36 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36))
  {
    sub_2510E6DB8(0, &qword_26B214D50, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
    memcpy(v34, v35, *(void *)(*(void *)(v38 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v34, v35, v36);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
  }
  a1[a3[7]] = a2[a3[7]];
  return a1;
}

char *sub_2510E8080(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = (uint64_t (*)(uint64_t))MEMORY[0x263F1FD10];
    uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
    sub_2510F0560((uint64_t)a1, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
    sub_2510E6DB8(0, &qword_26B215110, v6, v7);
    uint64_t v9 = v8;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_2510FBA70();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(a1, a2, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    uint64_t v11 = *(int *)(a3 + 20);
    uint64_t v12 = &a1[v11];
    uint64_t v13 = &a2[v11];
    uint64_t v14 = (uint64_t (*)(uint64_t))MEMORY[0x263F1FC90];
    uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
    sub_2510F0560((uint64_t)&a1[v11], &qword_26B215558, MEMORY[0x263F1FC90], MEMORY[0x263F185C8]);
    sub_2510E6DB8(0, &qword_26B215558, v14, v15);
    uint64_t v17 = v16;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v18 = sub_2510FBA60();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v12, v13, v18);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64));
    }
  }
  uint64_t v55 = a3;
  char v56 = a2;
  uint64_t v19 = *(int *)(a3 + 24);
  unint64_t v57 = a1;
  uint64_t v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  uint64_t v22 = *(void *)&a2[v19 + 8];
  *(void *)uint64_t v20 = *(void *)&a2[v19];
  *((void *)v20 + 1) = v22;
  swift_bridgeObjectRelease();
  *((void *)v20 + 2) = *((void *)v21 + 2);
  swift_bridgeObjectRelease();
  uint64_t v23 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v24 = v23[6];
  uint64_t v25 = &v20[v24];
  uint64_t v26 = &v21[v24];
  uint64_t v27 = type metadata accessor for MedmojiIconConfiguration();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48);
  int v30 = v29(v25, 1, v27);
  int v31 = v29(v26, 1, v27);
  if (v30)
  {
    if (!v31)
    {
      uint64_t v32 = sub_2510FB420();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 32))(v25, v26, v32);
      uint64_t v33 = *(int *)(v27 + 20);
      uint64_t v34 = &v25[v33];
      uint64_t v35 = &v26[v33];
      uint64_t v36 = sub_2510FB3D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 32))(v34, v35, v36);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (v31)
  {
    sub_2510F05BC((uint64_t)v25, (uint64_t (*)(void))type metadata accessor for MedmojiIconConfiguration);
LABEL_13:
    sub_2510E6DB8(0, qword_26B2150B0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, MEMORY[0x263F8D8F0]);
    memcpy(v25, v26, *(void *)(*(void *)(v37 - 8) + 64));
    goto LABEL_14;
  }
  uint64_t v50 = sub_2510FB420();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v50 - 8) + 40))(v25, v26, v50);
  uint64_t v51 = *(int *)(v27 + 20);
  unint64_t v52 = &v25[v51];
  uint64_t v53 = &v26[v51];
  uint64_t v54 = sub_2510FB3D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v54 - 8) + 40))(v52, v53, v54);
LABEL_14:
  v20[v23[7]] = v21[v23[7]];
  uint64_t v38 = v23[8];
  int v39 = &v20[v38];
  int v40 = &v21[v38];
  uint64_t v41 = sub_2510FB2A0();
  uint64_t v42 = *(void *)(v41 - 8);
  uint64_t v43 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v42 + 48);
  int v44 = v43(v39, 1, v41);
  int v45 = v43(v40, 1, v41);
  if (!v44)
  {
    unint64_t v47 = v56;
    uint64_t v46 = v57;
    if (!v45)
    {
      (*(void (**)(char *, char *, uint64_t))(v42 + 40))(v39, v40, v41);
      goto LABEL_20;
    }
    (*(void (**)(char *, uint64_t))(v42 + 8))(v39, v41);
    goto LABEL_19;
  }
  unint64_t v47 = v56;
  uint64_t v46 = v57;
  if (v45)
  {
LABEL_19:
    sub_2510E6DB8(0, &qword_26B214D50, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
    memcpy(v39, v40, *(void *)(*(void *)(v48 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v39, v40, v41);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v42 + 56))(v39, 0, 1, v41);
LABEL_20:
  v46[*(int *)(v55 + 28)] = v47[*(int *)(v55 + 28)];
  return v46;
}

uint64_t sub_2510E869C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2510E86B0);
}

uint64_t sub_2510E86B0(uint64_t a1, uint64_t a2, int *a3)
{
  sub_2510E6DB8(0, &qword_26B215568, MEMORY[0x263F1FD10], MEMORY[0x263F185D0]);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_8:
    return v9(v10, a2, v8);
  }
  sub_2510E6DB8(0, &qword_26B215560, MEMORY[0x263F1FC90], MEMORY[0x263F185D0]);
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[5];
LABEL_7:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_8;
  }
  uint64_t v14 = type metadata accessor for MedicationsWidgetViewModel();
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[6];
    goto LABEL_7;
  }
  unsigned int v16 = *(unsigned __int8 *)(a1 + a3[7]);
  if (v16 >= 2) {
    int v17 = ((v16 + 2147483646) & 0x7FFFFFFF) - 1;
  }
  else {
    int v17 = -2;
  }
  if (v17 < 0) {
    int v17 = -1;
  }
  return (v17 + 1);
}

uint64_t sub_2510E888C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2510E88A0);
}

uint64_t sub_2510E88A0(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  sub_2510E6DB8(0, &qword_26B215568, MEMORY[0x263F1FD10], MEMORY[0x263F185D0]);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    sub_2510E6DB8(0, &qword_26B215560, MEMORY[0x263F1FC90], MEMORY[0x263F185D0]);
    if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
    {
      uint64_t v10 = v13;
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v15 = a4[5];
    }
    else
    {
      uint64_t result = type metadata accessor for MedicationsWidgetViewModel();
      if (*(_DWORD *)(*(void *)(result - 8) + 84) != a3)
      {
        *(unsigned char *)(a1 + a4[7]) = a2 + 2;
        return result;
      }
      uint64_t v10 = result;
      uint64_t v14 = *(void *)(result - 8);
      uint64_t v15 = a4[6];
    }
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for MedicationsWidgetCircularView(uint64_t a1)
{
  return sub_2510EA1FC(a1, (uint64_t *)&unk_26B2154A8);
}

void sub_2510E8A7C()
{
  sub_2510E6DB8(319, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  if (v0 <= 0x3F)
  {
    sub_2510E6DB8(319, &qword_26B215558, MEMORY[0x263F1FC90], MEMORY[0x263F185C8]);
    if (v1 <= 0x3F)
    {
      type metadata accessor for MedicationsWidgetViewModel();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t sub_2510E8BE8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2510E8C04(char a1, char a2)
{
  if (*(void *)&aNoneschepastdu_0[8 * a1] == *(void *)&aNoneschepastdu_0[8 * a2]
    && *(void *)&aUptodatealllog_0[8 * a1 + 16] == *(void *)&aUptodatealllog_0[8 * a2 + 16])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_2510FBE60();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_2510E8C8C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v41 = a2;
  uint64_t v37 = type metadata accessor for ImageView(0);
  MEMORY[0x270FA5388](v37);
  uint64_t v36 = (uint64_t *)((char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2510EA054(0, &qword_26B2155E0, (uint64_t (*)(uint64_t))sub_2510E9FC4, type metadata accessor for ImageView, MEMORY[0x263F19B20]);
  uint64_t v39 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v36 - v5;
  sub_2510E9FC4(0);
  uint64_t v40 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (uint64_t *)((char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2510E9F7C(0);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v38 = (uint64_t)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v36 - v13;
  uint64_t v15 = sub_2510FBA30();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v36 - v20;
  sub_2510FBA20();
  uint64_t v22 = a1;
  uint64_t v23 = a1 + *(int *)(type metadata accessor for MedicationsWidgetCircularView(0) + 24);
  switch(*(unsigned char *)(v23 + *(int *)(type metadata accessor for MedicationsWidgetViewModel() + 28)))
  {
    case 1:
      swift_bridgeObjectRelease();
      goto LABEL_4;
    default:
      char v24 = sub_2510FBE60();
      swift_bridgeObjectRelease();
      uint64_t v25 = v37;
      if (v24)
      {
LABEL_4:
        uint64_t *v9 = sub_2510FB6E0();
        v9[1] = 0;
        *((unsigned char *)v9 + 16) = 1;
        sub_2510ED738(0, &qword_26B215580, sub_2510EA00C);
        sub_2510E9328(v22, (uint64_t)v9 + *(int *)(v26 + 44));
        sub_2510EFF8C((uint64_t)v9, (uint64_t)v6, (uint64_t (*)(void))sub_2510E9FC4);
        swift_storeEnumTagMultiPayload();
        sub_2510EA370(&qword_26B2156C0, sub_2510E9FC4);
        sub_2510EA370(&qword_26B2154F0, (void (*)(uint64_t))type metadata accessor for ImageView);
        sub_2510FB740();
        uint64_t v27 = (uint64_t (*)(void))sub_2510E9FC4;
      }
      else
      {
        uint64_t v28 = sub_2510FB7D0();
        uint64_t KeyPath = swift_getKeyPath();
        uint64_t v9 = v36;
        *uint64_t v36 = KeyPath;
        sub_2510E6DB8(0, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
        swift_storeEnumTagMultiPayload();
        *(uint64_t *)((char *)v9 + *(int *)(v25 + 20)) = v28;
        sub_2510EFF8C((uint64_t)v9, (uint64_t)v6, type metadata accessor for ImageView);
        swift_storeEnumTagMultiPayload();
        sub_2510EA370(&qword_26B2156C0, sub_2510E9FC4);
        sub_2510EA370(&qword_26B2154F0, (void (*)(uint64_t))type metadata accessor for ImageView);
        sub_2510FB740();
        uint64_t v27 = type metadata accessor for ImageView;
      }
      sub_2510F05BC((uint64_t)v9, v27);
      int v30 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
      v30(v19, v21, v15);
      uint64_t v31 = v38;
      sub_2510EFF8C((uint64_t)v14, v38, (uint64_t (*)(void))sub_2510E9F7C);
      uint64_t v32 = v41;
      v30(v41, v19, v15);
      sub_2510E9F48(0);
      sub_2510EFF8C(v31, (uint64_t)&v32[*(int *)(v33 + 48)], (uint64_t (*)(void))sub_2510E9F7C);
      sub_2510F05BC((uint64_t)v14, (uint64_t (*)(void))sub_2510E9F7C);
      uint64_t v34 = *(void (**)(char *, uint64_t))(v16 + 8);
      v34(v21, v15);
      sub_2510F05BC(v31, (uint64_t (*)(void))sub_2510E9F7C);
      return ((uint64_t (*)(char *, uint64_t))v34)(v19, v15);
  }
}

uint64_t sub_2510E9328@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v41 = a2;
  sub_2510EA234(0);
  uint64_t v42 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v37 = (uint64_t)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510EA054(0, &qword_26B2155E8, (uint64_t (*)(uint64_t))sub_2510EA0D8, (uint64_t (*)(uint64_t))sub_2510EA234, MEMORY[0x263F19B20]);
  uint64_t v38 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v40 = (uint64_t)&v35 - v6;
  sub_2510EA0D8(0);
  uint64_t v39 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v36 = (uint64_t)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for ImageView(0);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (uint64_t *)((char *)&v35 - v13);
  uint64_t v15 = type metadata accessor for TimeView(0);
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v35 - v19;
  uint64_t v21 = type metadata accessor for MedicationsWidgetCircularView(0);
  uint64_t v22 = v21;
  uint64_t v23 = *(int *)(v21 + 28);
  uint64_t v24 = a1;
  char v25 = *(unsigned char *)(a1 + v23);
  if (v25)
  {
    sub_2510EFF8C(v24 + *(int *)(v21 + 24), (uint64_t)v20, (uint64_t (*)(void))type metadata accessor for MedicationsWidgetViewModel);
    v20[*(int *)(v15 + 20)] = v25;
    uint64_t v31 = sub_2510FB7F0();
    *uint64_t v14 = swift_getKeyPath();
    sub_2510E6DB8(0, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
    swift_storeEnumTagMultiPayload();
    *(uint64_t *)((char *)v14 + *(int *)(v9 + 20)) = v31;
    sub_2510EFF8C((uint64_t)v20, (uint64_t)v18, type metadata accessor for TimeView);
    sub_2510EFF8C((uint64_t)v14, (uint64_t)v12, type metadata accessor for ImageView);
    uint64_t v32 = v36;
    sub_2510EFF8C((uint64_t)v18, v36, type metadata accessor for TimeView);
    sub_2510EA10C(0);
    sub_2510EFF8C((uint64_t)v12, v32 + *(int *)(v33 + 48), type metadata accessor for ImageView);
    sub_2510F05BC((uint64_t)v12, type metadata accessor for ImageView);
    sub_2510F05BC((uint64_t)v18, type metadata accessor for TimeView);
    sub_2510EFF8C(v32, v40, (uint64_t (*)(void))sub_2510EA0D8);
    swift_storeEnumTagMultiPayload();
    sub_2510EA370(&qword_26B215700, sub_2510EA0D8);
    sub_2510EA370(&qword_26B215710, sub_2510EA234);
    sub_2510FB740();
    sub_2510F05BC(v32, (uint64_t (*)(void))sub_2510EA0D8);
    sub_2510F05BC((uint64_t)v14, type metadata accessor for ImageView);
    uint64_t v29 = (uint64_t)v20;
    int v30 = type metadata accessor for TimeView;
  }
  else
  {
    uint64_t v26 = sub_2510FB7F0();
    *uint64_t v14 = swift_getKeyPath();
    sub_2510E6DB8(0, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
    swift_storeEnumTagMultiPayload();
    *(uint64_t *)((char *)v14 + *(int *)(v9 + 20)) = v26;
    sub_2510EFF8C(v24 + *(int *)(v22 + 24), (uint64_t)v20, (uint64_t (*)(void))type metadata accessor for MedicationsWidgetViewModel);
    v20[*(int *)(v15 + 20)] = *(unsigned char *)(v24 + v23);
    sub_2510EFF8C((uint64_t)v14, (uint64_t)v12, type metadata accessor for ImageView);
    sub_2510EFF8C((uint64_t)v20, (uint64_t)v18, type metadata accessor for TimeView);
    uint64_t v27 = v37;
    sub_2510EFF8C((uint64_t)v12, v37, type metadata accessor for ImageView);
    sub_2510EA268(0);
    sub_2510EFF8C((uint64_t)v18, v27 + *(int *)(v28 + 48), type metadata accessor for TimeView);
    sub_2510F05BC((uint64_t)v18, type metadata accessor for TimeView);
    sub_2510F05BC((uint64_t)v12, type metadata accessor for ImageView);
    sub_2510EFF8C(v27, v40, (uint64_t (*)(void))sub_2510EA234);
    swift_storeEnumTagMultiPayload();
    sub_2510EA370(&qword_26B215700, sub_2510EA0D8);
    sub_2510EA370(&qword_26B215710, sub_2510EA234);
    sub_2510FB740();
    sub_2510F05BC(v27, (uint64_t (*)(void))sub_2510EA234);
    sub_2510F05BC((uint64_t)v20, type metadata accessor for TimeView);
    uint64_t v29 = (uint64_t)v14;
    int v30 = type metadata accessor for ImageView;
  }
  return sub_2510F05BC(v29, v30);
}

uint64_t sub_2510E99F8(uint64_t a1)
{
  sub_2510EA474(0);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned char *v4 = sub_2510FB7A0();
  sub_2510EA6D4();
  v6[1] = *(void *)(a1 + *(int *)(type metadata accessor for MedicationsWidgetCircularView(0) + 24) + 16);
  swift_getKeyPath();
  sub_2510EFC94(0, &qword_26B215758, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
  sub_2510EA5F0();
  swift_bridgeObjectRetain();
  sub_2510FB9A0();
  sub_2510EA370(&qword_26B215570, sub_2510EA474);
  sub_2510FB8D0();
  return sub_2510F05BC((uint64_t)v4, (uint64_t (*)(void))sub_2510EA474);
}

uint64_t sub_2510E9BC0@<X0>(uint64_t a1@<X8>)
{
  sub_2510D7DE4();
  sub_2510FBD10();
  uint64_t v2 = sub_2510FB850();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  sub_2510FB910();
  uint64_t v7 = sub_2510FB820();
  uint64_t v9 = v8;
  char v11 = v10;
  uint64_t v13 = v12;
  swift_release();
  sub_2510EA794(v2, v4, v6);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v7;
  *(void *)(a1 + 8) = v9;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v13;
  return result;
}

uint64_t sub_2510E9CB0()
{
  sub_2510E9E80();
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (uint64_t *)&v10[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *uint64_t v3 = sub_2510FB9C0();
  v3[1] = v4;
  sub_2510ED738(0, &qword_26B215590, sub_2510E9F14);
  sub_2510E8C8C(v0, (char *)v3 + *(int *)(v5 + 44));
  uint64_t v11 = v0;
  sub_2510EA3C0();
  sub_2510EA370(&qword_26B2156E0, (void (*)(uint64_t))sub_2510E9E80);
  sub_2510EA474(255);
  uint64_t v7 = v6;
  uint64_t v8 = sub_2510EA370(&qword_26B215570, sub_2510EA474);
  uint64_t v12 = v7;
  uint64_t v13 = v8;
  swift_getOpaqueTypeConformance2();
  sub_2510FB860();
  return sub_2510F05BC((uint64_t)v3, (uint64_t (*)(void))sub_2510E9E80);
}

void sub_2510E9E80()
{
  if (!qword_26B2156E8)
  {
    sub_2510E9F14(255);
    sub_2510EA370(&qword_26B215720, sub_2510E9F14);
    unint64_t v0 = sub_2510FB990();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B2156E8);
    }
  }
}

void sub_2510E9F14(uint64_t a1)
{
}

void sub_2510E9F48(uint64_t a1)
{
}

void sub_2510E9F7C(uint64_t a1)
{
}

void sub_2510E9FC4(uint64_t a1)
{
}

void sub_2510EA00C(uint64_t a1)
{
}

void sub_2510EA054(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v9 = a3(255);
    uint64_t v10 = a4(255);
    unint64_t v11 = a5(a1, v9, v10);
    if (!v12) {
      atomic_store(v11, a2);
    }
  }
}

void sub_2510EA0D8(uint64_t a1)
{
}

void sub_2510EA10C(uint64_t a1)
{
}

void sub_2510EA140(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t), void (*a4)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    a4(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v7) {
      atomic_store(TupleTypeMetadata2, a2);
    }
  }
}

uint64_t type metadata accessor for TimeView(uint64_t a1)
{
  return sub_2510EA1FC(a1, (uint64_t *)&unk_26B2154D8);
}

uint64_t type metadata accessor for ImageView(uint64_t a1)
{
  return sub_2510EA1FC(a1, (uint64_t *)&unk_26B2154F8);
}

uint64_t sub_2510EA1FC(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2510EA234(uint64_t a1)
{
}

void sub_2510EA268(uint64_t a1)
{
}

unint64_t sub_2510EA29C()
{
  unint64_t result = qword_26B215630;
  if (!qword_26B215630)
  {
    sub_2510EA00C(255);
    sub_2510EA370(&qword_26B215700, sub_2510EA0D8);
    sub_2510EA370(&qword_26B215710, sub_2510EA234);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B215630);
  }
  return result;
}

uint64_t sub_2510EA370(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2510EA3B8()
{
  return sub_2510E99F8(*(void *)(v0 + 16));
}

void sub_2510EA3C0()
{
  if (!qword_26B2156A8)
  {
    sub_2510EA474(255);
    sub_2510EA370(&qword_26B215570, sub_2510EA474);
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_26B2156A8);
    }
  }
}

void sub_2510EA474(uint64_t a1)
{
}

void sub_2510EA4BC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(void), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v9 = a3(255);
    uint64_t v10 = a4();
    unint64_t v11 = a5(a1, v9, v10);
    if (!v12) {
      atomic_store(v11, a2);
    }
  }
}

void sub_2510EA53C()
{
  if (!qword_26B2156F8)
  {
    sub_2510EFC94(255, &qword_26B215758, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
    sub_2510EA5F0();
    unint64_t v0 = sub_2510FB9B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B2156F8);
    }
  }
}

unint64_t sub_2510EA5F0()
{
  unint64_t result = qword_26B215760;
  if (!qword_26B215760)
  {
    sub_2510EFC94(255, &qword_26B215758, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B215760);
  }
  return result;
}

unint64_t sub_2510EA66C()
{
  unint64_t result = qword_26B2156F0;
  if (!qword_26B2156F0)
  {
    sub_2510EA53C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2156F0);
  }
  return result;
}

void sub_2510EA6D4()
{
  if (!qword_26B215598)
  {
    sub_2510EA53C();
    sub_2510EA740();
    unint64_t v0 = sub_2510FB530();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B215598);
    }
  }
}

unint64_t sub_2510EA740()
{
  unint64_t result = qword_269B20BC8;
  if (!qword_269B20BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B20BC8);
  }
  return result;
}

uint64_t sub_2510EA794(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_2510EA7A4()
{
  sub_2510F01A8();
  uint64_t v129 = v0;
  MEMORY[0x270FA5388](v0);
  uint64_t v128 = (char *)&v121 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v135 = sub_2510FB100();
  uint64_t v134 = *(void *)(v135 - 8);
  MEMORY[0x270FA5388](v135);
  id v133 = (char *)&v121 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510F023C();
  uint64_t v127 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v126 = (char *)&v121 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v139 = sub_2510FB020();
  uint64_t v141 = *(void *)(v139 - 8);
  MEMORY[0x270FA5388](v139);
  uint64_t v138 = (char *)&v121 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v150 = sub_2510FB090();
  MEMORY[0x270FA5388](v150);
  v149 = (char *)&v121 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v137 = sub_2510FB170();
  uint64_t v140 = *(void *)(v137 - 8);
  MEMORY[0x270FA5388](v137);
  uint64_t v136 = (char *)&v121 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510F02D0();
  uint64_t v131 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v132 = (char *)&v121 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_2510E6DB8(0, &qword_26B215418, MEMORY[0x263F065F0], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v178 = (char *)&v121 - v12;
  sub_2510F0364();
  uint64_t v177 = v13;
  uint64_t v162 = *(void (***)(char *, uint64_t))(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v176 = (char *)&v121 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v175 = sub_2510FB150();
  v163 = *(void (***)(char *, uint64_t))(v175 - 8);
  MEMORY[0x270FA5388](v175);
  uint64_t v174 = (char *)&v121 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v179 = sub_2510FB040();
  uint64_t v160 = *(void (***)(char *, uint64_t))(v179 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v179);
  uint64_t v156 = (char *)&v121 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v157 = (char *)&v121 - v18;
  uint64_t v187 = sub_2510FB0C0();
  uint64_t v148 = *(void *)(v187 - 8);
  MEMORY[0x270FA5388](v187);
  long long v186 = (char *)&v121 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510E6DB8(0, &qword_26B215430, MEMORY[0x263F067B0], v10);
  MEMORY[0x270FA5388](v20 - 8);
  os_log_t v180 = (char *)&v121 - v21;
  uint64_t v147 = sub_2510FB0D0();
  long long v184 = *(void (***)(void, char *, uint64_t))(v147 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v147);
  v182 = (char *)&v121 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  id v146 = (char *)&v121 - v24;
  uint64_t v181 = sub_2510FB0E0();
  v185 = *(void (**)(char *, uint64_t))(v181 - 8);
  MEMORY[0x270FA5388](v181);
  uint64_t v26 = (void (**)(char *, void (**)(char *, uint64_t, uint64_t, uint64_t)))((char *)&v121
                                                                                              - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2510F03C4();
  uint64_t v173 = v27;
  uint64_t v28 = MEMORY[0x270FA5388](v27);
  uint64_t v172 = (char *)&v121 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v28);
  uint64_t v183 = (uint64_t)&v121 - v30;
  uint64_t v171 = (void (**)(char *, uint64_t, uint64_t, uint64_t))sub_2510FB230();
  v170 = (void (**)(char *, void (**)(char *, uint64_t, uint64_t, uint64_t)))*(v171 - 1);
  MEMORY[0x270FA5388](v171);
  uint64_t v169 = (char *)&v121 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v145 = sub_2510FB110();
  uint64_t v144 = *(void *)(v145 - 8);
  MEMORY[0x270FA5388](v145);
  uint64_t v33 = (char *)&v121 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_2510FB1B0();
  MEMORY[0x270FA5388](v34 - 8);
  uint64_t v168 = (void (*)(char *, uint64_t, uint64_t))((char *)&v121 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v36 = sub_2510FB370();
  MEMORY[0x270FA5388](v36 - 8);
  uint64_t v167 = (void (*)(char *, uint64_t))((char *)&v121 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v38 = sub_2510FB350();
  MEMORY[0x270FA5388](v38 - 8);
  uint64_t v166 = (void (**)(char *))((char *)&v121 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v40 = sub_2510FB300();
  MEMORY[0x270FA5388](v40 - 8);
  sub_2510E6DB8(0, &qword_26B215468, MEMORY[0x263F06FF0], v10);
  MEMORY[0x270FA5388](v41 - 8);
  uint64_t v43 = (char *)&v121 - v42;
  sub_2510E6DB8(0, &qword_26B215470, MEMORY[0x263F07008], v10);
  MEMORY[0x270FA5388](v44 - 8);
  uint64_t v46 = (char *)&v121 - v45;
  uint64_t v143 = sub_2510FB250();
  uint64_t v142 = *(void *)(v143 - 8);
  MEMORY[0x270FA5388](v143);
  uint64_t v48 = (char *)&v121 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510E6DB8(0, &qword_26B214D50, MEMORY[0x263F07490], v10);
  MEMORY[0x270FA5388](v49 - 8);
  uint64_t v51 = (char *)&v121 - v50;
  uint64_t v52 = sub_2510FB2A0();
  uint64_t v53 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  uint64_t v55 = (char *)&v121 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = type metadata accessor for MedicationsWidgetViewModel();
  sub_2510E5824(v151 + *(int *)(v56 + 32), (uint64_t)v51);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v53 + 48))(v51, 1, v52) == 1)
  {
    sub_2510F0560((uint64_t)v51, &qword_26B214D50, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
    return 0;
  }
  uint64_t v123 = v53;
  uint64_t v58 = *(void (**)(char *, char *, uint64_t))(v53 + 32);
  uint64_t v124 = v52;
  v58(v55, v51, v52);
  uint64_t v59 = sub_2510FB210();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v59 - 8) + 56))(v46, 1, 1, v59);
  sub_2510FB1F0();
  uint64_t v60 = sub_2510FB200();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v60 - 8) + 56))(v43, 0, 1, v60);
  sub_2510FB2C0();
  sub_2510FB320();
  sub_2510FB360();
  sub_2510FB1A0();
  sub_2510FB240();
  uint64_t v61 = v169;
  uint64_t v125 = v48;
  sub_2510FB1E0();
  uint64_t v122 = v55;
  sub_2510FB220();
  v170[1](v61, v171);
  uint64_t v130 = v33;
  sub_2510FB0F0();
  uint64_t v62 = (char *)v185;
  BOOL v63 = (void (*)(char *, uint64_t, uint64_t))*((void *)v185 + 2);
  unint64_t v64 = v172;
  uint64_t v65 = v181;
  uint64_t v169 = (char *)v185 + 16;
  uint64_t v168 = v63;
  v63(v172, (uint64_t)v26, v181);
  uint64_t v66 = sub_2510EA370(&qword_26B215440, MEMORY[0x263F067C8]);
  uint64_t v67 = v146;
  sub_2510FBC00();
  uint64_t v68 = (void (*)(char *, uint64_t))*((void *)v62 + 1);
  v185 = (void (*)(char *, uint64_t))(v62 + 8);
  v170 = v26;
  uint64_t v167 = v68;
  v68((char *)v26, v65);
  uint64_t v69 = v173;
  uint64_t v70 = v184;
  uint64_t v71 = v147;
  ((void (**)(char *, char *, uint64_t))v184)[4](&v64[v173[9]], v67, v147);
  uint64_t v72 = (uint64_t)v64;
  uint64_t v73 = v183;
  sub_2510F0458(v72, v183, (uint64_t (*)(void))sub_2510F03C4);
  uint64_t v74 = v73 + v69[9];
  char v75 = (int *)v70[2];
  v70 += 2;
  uint64_t v172 = (char *)(v70 - 1);
  uint64_t v173 = v75;
  uint64_t v166 = (void (**)(char *))(v148 + 16);
  uint64_t v171 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v148 + 56);
  v165 = (unsigned int (**)(char *, uint64_t, uint64_t))(v148 + 48);
  unint64_t v164 = (void (**)(char *, char *, uint64_t))(v148 + 32);
  ++v163;
  ++v162;
  uint64_t v161 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v160 + 6);
  uint64_t v154 = (void (**)(char *, uint64_t, uint64_t))(v160 + 4);
  unsigned int v153 = *MEMORY[0x263F065A0];
  uint64_t v152 = (void (**)(char *, void, uint64_t))(v160 + 13);
  uint64_t v155 = v160 + 1;
  uint64_t v160 = (void (**)(char *, uint64_t))(v148 + 8);
  uint64_t v159 = v66;
  uint64_t v158 = v74;
  long long v184 = v70;
  ((void (*)(char *, uint64_t, uint64_t))v75)(v67, v74, v71);
  while (1)
  {
    uint64_t v76 = v182;
    sub_2510FBC10();
    sub_2510EA370(&qword_26B215438, MEMORY[0x263F067B8]);
    char v77 = sub_2510FBB40();
    uint64_t v78 = *(void (**)(char *, uint64_t))v172;
    (*(void (**)(char *, uint64_t))v172)(v76, v71);
    v78(v67, v71);
    if (v77)
    {
      (*v171)(v180, 1, 1, v187);
LABEL_12:
      sub_2510F05BC(v73, (uint64_t (*)(void))sub_2510F03C4);
      uint64_t v95 = v130;
      sub_2510FB080();
      sub_2510EA370(&qword_26B215428, MEMORY[0x263F066D8]);
      uint64_t v57 = sub_2510FBBC0();
      (*(void (**)(char *, uint64_t))(v144 + 8))(v95, v145);
      (*(void (**)(char *, uint64_t))(v142 + 8))(v125, v143);
      (*(void (**)(char *, uint64_t))(v123 + 8))(v122, v124);
      return v57;
    }
    uint64_t v79 = (void (*)(uint64_t *, void))sub_2510FBC30();
    BOOL v80 = v180;
    uint64_t v81 = v187;
    (*v166)(v180);
    v79(&v188, 0);
    uint64_t v82 = (char *)v170;
    v168((char *)v170, v73, v65);
    sub_2510FBC20();
    v167(v82, v65);
    (*v171)(v80, 0, 1, v81);
    if ((*v165)(v80, 1, v81) == 1) {
      goto LABEL_12;
    }
    uint64_t v83 = v67;
    uint64_t v84 = v71;
    uint64_t v85 = v186;
    (*v164)(v186, v80, v81);
    uint64_t v86 = v174;
    sub_2510FB0A0();
    swift_getKeyPath();
    sub_2510FB060();
    uint64_t v87 = v176;
    sub_2510FB140();
    swift_release();
    (*v163)(v86, v175);
    swift_getKeyPath();
    sub_2510F050C();
    uint64_t v89 = v177;
    uint64_t v88 = (uint64_t)v178;
    sub_2510FB180();
    swift_release();
    (*v162)(v87, v89);
    uint64_t v90 = v179;
    if ((*v161)(v88, 1, v179) == 1)
    {
      (*v160)(v85, v81);
      sub_2510F0560(v88, &qword_26B215418, MEMORY[0x263F065F0], MEMORY[0x263F8D8F0]);
      uint64_t v73 = v183;
      uint64_t v71 = v84;
      goto LABEL_5;
    }
    unint64_t v91 = v157;
    (*v154)(v157, v88, v90);
    uint64_t v92 = v156;
    (*v152)(v156, v153, v90);
    char v93 = sub_2510FB030();
    uint64_t v94 = *v155;
    (*v155)(v92, v90);
    if (v93) {
      break;
    }
    uint64_t v71 = v84;
    v94(v91, v90);
    (*v160)(v186, v187);
    uint64_t v73 = v183;
LABEL_5:
    uint64_t v67 = v83;
    uint64_t v65 = v181;
    ((void (*)(char *, uint64_t, uint64_t))v173)(v67, v158, v71);
  }
  v185 = v94;
  uint64_t v97 = (uint64_t)v132;
  sub_2510FB0B0();
  sub_2510EA370(&qword_26B215778, (void (*)(uint64_t))sub_2510F02D0);
  unint64_t v98 = v136;
  uint64_t v99 = v131;
  sub_2510FB120();
  sub_2510F05BC(v97, (uint64_t (*)(void))sub_2510F02D0);
  sub_2510FB160();
  uint64_t v100 = *(void (**)(char *, uint64_t))(v140 + 8);
  v140 += 8;
  v100(v98, v137);
  sub_2510EA370(&qword_26B215428, MEMORY[0x263F066D8]);
  uint64_t v188 = sub_2510FBBC0();
  uint64_t v189 = v101;
  unint64_t v102 = v138;
  sub_2510FB010();
  sub_2510D7DE4();
  sub_2510FBD20();
  uint64_t v103 = *(void (***)(void, char *, uint64_t))(v141 + 8);
  v141 += 8;
  long long v184 = v103;
  ((void (*)(char *, uint64_t))v103)(v102, v139);
  swift_bridgeObjectRelease();
  LOBYTE(v102) = *(unsigned char *)(v151 + *(int *)(type metadata accessor for TimeView(0) + 20));
  sub_2510FB0B0();
  if (v102)
  {
    uint64_t v112 = v97 + *(int *)(v99 + 36);
    uint64_t v113 = v134;
    uint64_t v114 = v133;
    uint64_t v115 = v135;
    (*(void (**)(char *, uint64_t, uint64_t))(v134 + 16))(v133, v112, v135);
    sub_2510F05BC(v97, (uint64_t (*)(void))sub_2510F02D0);
    sub_2510EA370(&qword_26B215450, MEMORY[0x263F067E8]);
    uint64_t result = sub_2510FBB40();
    if ((result & 1) == 0) {
      goto LABEL_21;
    }
    uint64_t v116 = (uint64_t)v126;
    (*(void (**)(char *, char *, uint64_t))(v113 + 32))(v126, v114, v115);
    sub_2510EA370(&qword_269B20BD0, (void (*)(uint64_t))sub_2510F023C);
    uint64_t v117 = v136;
    uint64_t v118 = v130;
    sub_2510FB120();
    sub_2510F05BC(v116, (uint64_t (*)(void))sub_2510F023C);
    sub_2510FB160();
    v100(v117, v137);
    uint64_t v188 = sub_2510FBBC0();
    uint64_t v189 = v119;
    uint64_t v120 = v138;
    sub_2510FB010();
    uint64_t v57 = sub_2510FBD20();
    ((void (*)(char *, uint64_t))v184)(v120, v139);
    swift_bridgeObjectRelease();
    v185(v157, v179);
    (*v160)(v186, v187);
    sub_2510F05BC(v183, (uint64_t (*)(void))sub_2510F03C4);
    (*(void (**)(char *, uint64_t))(v144 + 8))(v118, v145);
LABEL_19:
    (*(void (**)(char *, uint64_t))(v142 + 8))(v125, v143);
    (*(void (**)(char *, uint64_t))(v123 + 8))(v122, v124);
    return v57;
  }
  uint64_t v104 = v134;
  uint64_t v105 = v133;
  uint64_t v106 = v135;
  (*(void (**)(char *, uint64_t, uint64_t))(v134 + 16))(v133, v97, v135);
  sub_2510F05BC(v97, (uint64_t (*)(void))sub_2510F02D0);
  sub_2510EA370(&qword_26B215450, MEMORY[0x263F067E8]);
  uint64_t result = sub_2510FBB40();
  if (result)
  {
    uint64_t v107 = (uint64_t)v128;
    (*(void (**)(char *, char *, uint64_t))(v104 + 32))(v128, v105, v106);
    sub_2510EA370(&qword_26B2157A8, (void (*)(uint64_t))sub_2510F01A8);
    unint64_t v108 = v136;
    uint64_t v109 = v130;
    sub_2510FB120();
    sub_2510F05BC(v107, (uint64_t (*)(void))sub_2510F01A8);
    sub_2510FB160();
    v100(v108, v137);
    uint64_t v188 = sub_2510FBBC0();
    uint64_t v189 = v110;
    uint64_t v111 = v138;
    sub_2510FB010();
    uint64_t v57 = sub_2510FBD20();
    ((void (*)(char *, uint64_t))v184)(v111, v139);
    swift_bridgeObjectRelease();
    v185(v157, v179);
    (*v160)(v186, v187);
    sub_2510F05BC(v183, (uint64_t (*)(void))sub_2510F03C4);
    (*(void (**)(char *, uint64_t))(v144 + 8))(v109, v145);
    goto LABEL_19;
  }
  __break(1u);
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_2510EC418@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v191 = a1;
  sub_2510EFCE0();
  uint64_t v190 = v3;
  uint64_t v179 = *(void (***)(char *, uint64_t, uint64_t))(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v178 = (char *)&v169 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510EFA68(0, &qword_26B215600, MEMORY[0x263F19B20]);
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v169 - v7;
  sub_2510EFEC4(0, &qword_26B2155F0, MEMORY[0x263F19B20]);
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v169 - v11;
  sub_2510EFAF4(0);
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (void (**)(char *, uint64_t, uint64_t))((char *)&v169 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2510EFC38(0, &qword_26B2156B8);
  uint64_t v184 = v17;
  uint64_t v192 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v169 - v18;
  sub_2510EFB8C();
  uint64_t v183 = v20;
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  uint64_t v180 = (uint64_t)&v169 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v181 = (char *)&v169 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  v182 = (char *)&v169 - v26;
  MEMORY[0x270FA5388](v25);
  uint64_t v185 = (uint64_t)&v169 - v27;
  sub_2510EFEC4(0, &qword_26B215648, MEMORY[0x263F19B28]);
  uint64_t v29 = v28;
  MEMORY[0x270FA5388](v28);
  uint64_t v31 = (char *)&v169 - v30;
  char v32 = sub_2510D830C();
  uint64_t v188 = v8;
  uint64_t v189 = a2;
  uint64_t v187 = v6;
  uint64_t v186 = v29;
  if (v32)
  {
    uint64_t v33 = sub_2510EA7A4();
    unint64_t v35 = v34;
    swift_bridgeObjectRelease();
    uint64_t v193 = v33;
    unint64_t v194 = v35;
    sub_2510D7DE4();
    uint64_t v36 = sub_2510FB850();
    uint64_t v38 = v37;
    char v40 = v39 & 1;
    sub_2510FB7C0();
    uint64_t v41 = sub_2510FB830();
    uint64_t v42 = v190;
    uint64_t v44 = v43;
    char v46 = v45;
    swift_release();
    char v47 = v46 & 1;
    sub_2510EA794(v36, v38, v40);
    swift_bridgeObjectRelease();
    sub_2510FB7E0();
    uint64_t v48 = sub_2510FB810();
    uint64_t v50 = v49;
    uint64_t v52 = v51;
    char v54 = v53 & 1;
    sub_2510EA794(v41, v44, v47);
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v193 = v48;
    unint64_t v194 = v50;
    char v195 = v54;
    uint64_t v196 = v52;
    uint64_t v197 = KeyPath;
    uint64_t v198 = 1;
    char v199 = 0;
    sub_2510EFD64();
    uint64_t v57 = v56;
    unint64_t v58 = sub_2510EFDDC();
    uint64_t v59 = (uint64_t)v178;
    sub_2510FB8D0();
    sub_2510EA794(v48, v50, v54);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v60 = (uint64_t)v179;
    v179[2](v188, v59, v42);
    swift_storeEnumTagMultiPayload();
    sub_2510F0074();
    uint64_t v193 = v57;
    unint64_t v194 = v58;
    swift_getOpaqueTypeConformance2();
    sub_2510FB740();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v60 + 8))(v59, v42);
  }
  else
  {
    uint64_t v175 = v31;
    uint64_t v176 = v10;
    uint64_t v177 = v14;
    uint64_t v178 = v12;
    uint64_t v179 = v16;
    char v62 = *(unsigned char *)(v191 + *(int *)(type metadata accessor for TimeView(0) + 20));
    uint64_t v63 = sub_2510EA7A4();
    unint64_t v66 = v65;
    unint64_t v68 = v67;
    if (v62)
    {
      uint64_t v123 = v64;
      swift_bridgeObjectRelease();
      uint64_t v193 = v123;
      unint64_t v194 = v68;
      v170 = (uint64_t (*)(void))sub_2510D7DE4();
      uint64_t v124 = sub_2510FB850();
      uint64_t v126 = v125;
      char v128 = v127 & 1;
      sub_2510FB7F0();
      uint64_t v129 = sub_2510FB830();
      uint64_t v131 = v130;
      char v133 = v132;
      uint64_t v135 = v134;
      swift_release();
      sub_2510EA794(v124, v126, v128);
      swift_bridgeObjectRelease();
      uint64_t v193 = v129;
      unint64_t v194 = v131;
      char v195 = v133 & 1;
      uint64_t v196 = v135;
      sub_2510FB8D0();
      sub_2510EA794(v129, v131, v133 & 1);
      swift_bridgeObjectRelease();
      uint64_t v136 = swift_getKeyPath();
      uint64_t v137 = v192;
      uint64_t v138 = *(void (**)(char *, char *, uint64_t))(v192 + 16);
      uint64_t v173 = (void (*)(char *, char *, uint64_t))(v192 + 16);
      uint64_t v174 = v138;
      uint64_t v139 = (uint64_t)v182;
      uint64_t v140 = v184;
      v138(v182, v19, v184);
      uint64_t v141 = v139 + *(int *)(v183 + 36);
      *(void *)uint64_t v141 = v136;
      *(void *)(v141 + 8) = 1;
      *(unsigned char *)(v141 + 16) = 0;
      uint64_t v142 = *(void (**)(char *, uint64_t))(v137 + 8);
      uint64_t v192 = v137 + 8;
      uint64_t v172 = v142;
      v142(v19, v140);
      uint64_t v171 = sub_2510EFB8C;
      sub_2510F0458(v139, v185, (uint64_t (*)(void))sub_2510EFB8C);
      uint64_t v143 = sub_2510EA7A4();
      unint64_t v145 = v144;
      swift_bridgeObjectRelease();
      uint64_t v193 = v143;
      unint64_t v194 = v145;
      uint64_t v146 = sub_2510FB850();
      uint64_t v148 = v147;
      LOBYTE(v140) = v149 & 1;
      sub_2510FB7C0();
      uint64_t v150 = sub_2510FB830();
      uint64_t v152 = v151;
      LOBYTE(v131) = v153;
      swift_release();
      LOBYTE(v139) = v131 & 1;
      sub_2510EA794(v146, v148, v140);
      swift_bridgeObjectRelease();
      sub_2510FB7E0();
      uint64_t v154 = sub_2510FB810();
      uint64_t v156 = v155;
      uint64_t v158 = v157;
      LOBYTE(v131) = v159 & 1;
      char v160 = v139;
      uint64_t v113 = v185;
      sub_2510EA794(v150, v152, v160);
      swift_bridgeObjectRelease();
      uint64_t v193 = v154;
      unint64_t v194 = v156;
      char v195 = v131;
      uint64_t v196 = v158;
      sub_2510FB8D0();
      uint64_t v161 = v156;
      uint64_t v114 = (uint64_t)v182;
      sub_2510EA794(v154, v161, v131);
      swift_bridgeObjectRelease();
      uint64_t v162 = swift_getKeyPath();
      uint64_t v117 = (uint64_t)v181;
      uint64_t v163 = v184;
      v174(v181, v19, v184);
      uint64_t v164 = v117 + *(int *)(v183 + 36);
      *(void *)uint64_t v164 = v162;
      *(void *)(v164 + 8) = 1;
      *(unsigned char *)(v164 + 16) = 0;
      v172(v19, v163);
      sub_2510F0458(v117, v114, (uint64_t (*)(void))v171);
    }
    else
    {
      uint64_t v69 = v63;
      swift_bridgeObjectRelease();
      uint64_t v193 = v69;
      unint64_t v194 = v66;
      uint64_t v174 = (void (*)(char *, char *, uint64_t))sub_2510D7DE4();
      uint64_t v70 = sub_2510FB850();
      uint64_t v72 = v71;
      char v74 = v73 & 1;
      sub_2510FB7C0();
      uint64_t v75 = sub_2510FB830();
      uint64_t v77 = v76;
      char v79 = v78;
      swift_release();
      char v80 = v79 & 1;
      sub_2510EA794(v70, v72, v74);
      swift_bridgeObjectRelease();
      sub_2510FB7E0();
      uint64_t v81 = sub_2510FB810();
      uint64_t v83 = v82;
      uint64_t v85 = v84;
      char v87 = v86 & 1;
      sub_2510EA794(v75, v77, v80);
      swift_bridgeObjectRelease();
      uint64_t v193 = v81;
      unint64_t v194 = v83;
      char v195 = v87;
      uint64_t v196 = v85;
      sub_2510FB8D0();
      sub_2510EA794(v81, v83, v87);
      swift_bridgeObjectRelease();
      uint64_t v88 = swift_getKeyPath();
      uint64_t v89 = v192;
      uint64_t v90 = *(void (**)(char *, char *, uint64_t))(v192 + 16);
      uint64_t v172 = (void (*)(char *, uint64_t))(v192 + 16);
      uint64_t v173 = v90;
      unint64_t v91 = v19;
      uint64_t v92 = (uint64_t)v182;
      uint64_t v169 = v91;
      uint64_t v93 = v184;
      v90(v182, v91, v184);
      uint64_t v94 = v92 + *(int *)(v183 + 36);
      *(void *)uint64_t v94 = v88;
      *(void *)(v94 + 8) = 1;
      *(unsigned char *)(v94 + 16) = 0;
      uint64_t v95 = *(void (**)())(v89 + 8);
      uint64_t v192 = v89 + 8;
      uint64_t v171 = v95;
      ((void (*)(char *, uint64_t))v95)(v91, v93);
      v170 = (uint64_t (*)(void))sub_2510EFB8C;
      sub_2510F0458(v92, v185, (uint64_t (*)(void))sub_2510EFB8C);
      sub_2510EA7A4();
      uint64_t v97 = v96;
      unint64_t v99 = v98;
      swift_bridgeObjectRelease();
      uint64_t v193 = v97;
      unint64_t v194 = v99;
      uint64_t v100 = sub_2510FB850();
      uint64_t v102 = v101;
      char v104 = v103 & 1;
      sub_2510FB7F0();
      uint64_t v105 = sub_2510FB830();
      uint64_t v107 = v106;
      char v109 = v108;
      uint64_t v111 = v110;
      swift_release();
      char v112 = v104;
      uint64_t v113 = v185;
      sub_2510EA794(v100, v102, v112);
      uint64_t v114 = v92;
      swift_bridgeObjectRelease();
      uint64_t v193 = v105;
      unint64_t v194 = v107;
      char v195 = v109 & 1;
      uint64_t v196 = v111;
      uint64_t v115 = v169;
      sub_2510FB8D0();
      sub_2510EA794(v105, v107, v109 & 1);
      swift_bridgeObjectRelease();
      uint64_t v116 = swift_getKeyPath();
      uint64_t v117 = (uint64_t)v181;
      uint64_t v118 = v184;
      v173(v181, v115, v184);
      uint64_t v119 = v117 + *(int *)(v183 + 36);
      *(void *)uint64_t v119 = v116;
      *(void *)(v119 + 8) = 1;
      *(unsigned char *)(v119 + 16) = 0;
      ((void (*)(char *, uint64_t))v171)(v115, v118);
      sub_2510F0458(v117, v114, v170);
    }
    sub_2510EFF8C(v113, v117, (uint64_t (*)(void))sub_2510EFB8C);
    uint64_t v120 = v180;
    sub_2510EFF8C(v114, v180, (uint64_t (*)(void))sub_2510EFB8C);
    uint64_t v121 = (uint64_t)v179;
    sub_2510EFF8C(v117, (uint64_t)v179, (uint64_t (*)(void))sub_2510EFB8C);
    sub_2510EFB28();
    sub_2510EFF8C(v120, v121 + *(int *)(v122 + 48), (uint64_t (*)(void))sub_2510EFB8C);
    sub_2510F05BC(v120, (uint64_t (*)(void))sub_2510EFB8C);
    sub_2510F05BC(v117, (uint64_t (*)(void))sub_2510EFB8C);
    sub_2510EFF8C(v121, (uint64_t)v178, (uint64_t (*)(void))sub_2510EFAF4);
    swift_storeEnumTagMultiPayload();
    sub_2510EA370(&qword_26B215730, sub_2510EFAF4);
    uint64_t v165 = (uint64_t)v175;
    sub_2510FB740();
    sub_2510F05BC(v121, (uint64_t (*)(void))sub_2510EFAF4);
    sub_2510F05BC(v114, (uint64_t (*)(void))sub_2510EFB8C);
    sub_2510F05BC(v113, (uint64_t (*)(void))sub_2510EFB8C);
    sub_2510EFFF4(v165, (uint64_t)v188);
    swift_storeEnumTagMultiPayload();
    sub_2510F0074();
    sub_2510EFD64();
    uint64_t v167 = v166;
    unint64_t v168 = sub_2510EFDDC();
    uint64_t v193 = v167;
    unint64_t v194 = v168;
    swift_getOpaqueTypeConformance2();
    sub_2510FB740();
    return sub_2510F0130(v165);
  }
}

uint64_t sub_2510ED3DC@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_2510FB6E0();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  sub_2510EF9E4();
  return sub_2510EC418(v1, a1 + *(int *)(v3 + 44));
}

uint64_t sub_2510ED424@<X0>(uint64_t a1@<X8>)
{
  uint64_t v27 = a1;
  uint64_t v2 = sub_2510FBA70();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25[1] = MEMORY[0x263F1FBF0];
  sub_2510EFC38(0, &qword_26B215698);
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v25 - v9;
  sub_2510EF814();
  uint64_t v26 = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510DD3CC((uint64_t)v5);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v28 = sub_2510FB950();
  uint64_t v15 = MEMORY[0x263F1B570];
  uint64_t v16 = MEMORY[0x263F1B558];
  sub_2510FB870();
  swift_release();
  uint64_t v28 = v15;
  uint64_t v29 = v16;
  swift_getOpaqueTypeConformance2();
  sub_2510FB8B0();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v17 = *(void *)(v1 + *(int *)(type metadata accessor for ImageView(0) + 20));
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v20 = v26;
  uint64_t v19 = v27;
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 16))(v27, v14, v26);
  sub_2510EF8F8();
  uint64_t v22 = (uint64_t *)(v19 + *(int *)(v21 + 36));
  uint64_t *v22 = KeyPath;
  v22[1] = v17;
  uint64_t v23 = *(uint64_t (**)(char *, uint64_t))(v12 + 8);
  swift_retain();
  return v23(v14, v20);
}

void sub_2510ED738(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_2510FB530();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t *sub_2510ED7A4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    sub_2510E6DB8(0, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_2510FBA70();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t sub_2510ED8EC(uint64_t a1)
{
  sub_2510E6DB8(0, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_2510FBA70();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }

  return swift_release();
}

void *sub_2510ED9B8(void *a1, void *a2, uint64_t a3)
{
  sub_2510E6DB8(0, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_2510FBA70();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  swift_retain();
  return a1;
}

void *sub_2510EDAB4(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = (uint64_t (*)(uint64_t))MEMORY[0x263F1FD10];
    uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
    sub_2510F0560((uint64_t)a1, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
    sub_2510E6DB8(0, &qword_26B215110, v6, v7);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v8 = sub_2510FBA70();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  return a1;
}

char *sub_2510EDBEC(char *a1, char *a2, uint64_t a3)
{
  sub_2510E6DB8(0, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  uint64_t v7 = v6;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_2510FBA70();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *sub_2510EDCEC(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = (uint64_t (*)(uint64_t))MEMORY[0x263F1FD10];
    uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
    sub_2510F0560((uint64_t)a1, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
    sub_2510E6DB8(0, &qword_26B215110, v6, v7);
    uint64_t v9 = v8;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_2510FBA70();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(a1, a2, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  swift_release();
  return a1;
}

uint64_t sub_2510EDE24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2510EDE38);
}

uint64_t sub_2510EDE38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2510E6DB8(0, &qword_26B215568, MEMORY[0x263F1FD10], MEMORY[0x263F185D0]);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_2510EDF28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2510EDF3C);
}

void sub_2510EDF3C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_2510E6DB8(0, &qword_26B215568, MEMORY[0x263F1FD10], MEMORY[0x263F185D0]);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v10(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
}

void sub_2510EE028()
{
  sub_2510E6DB8(319, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void *sub_2510EE0F0(void *a1, void *a2, uint64_t a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    void *v4 = *a2;
    unint64_t v4 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    a1[2] = a2[2];
    uint64_t v7 = (int *)type metadata accessor for MedicationsWidgetViewModel();
    uint64_t v8 = v7[6];
    __dst = (char *)v4 + v8;
    uint64_t v9 = (char *)a2 + v8;
    uint64_t v10 = type metadata accessor for MedmojiIconConfiguration();
    uint64_t v11 = *(void *)(v10 - 8);
    uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v12(v9, 1, v10))
    {
      sub_2510E6DB8(0, qword_26B2150B0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, MEMORY[0x263F8D8F0]);
      memcpy(__dst, v9, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      uint64_t v15 = sub_2510FB420();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(__dst, v9, v15);
      uint64_t v16 = *(int *)(v10 + 20);
      uint64_t v17 = &__dst[v16];
      uint64_t v18 = &v9[v16];
      uint64_t v19 = sub_2510FB3D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(__dst, 0, 1, v10);
    }
    *((unsigned char *)v4 + v7[7]) = *((unsigned char *)a2 + v7[7]);
    uint64_t v20 = v7[8];
    uint64_t v21 = (char *)v4 + v20;
    uint64_t v22 = (char *)a2 + v20;
    uint64_t v23 = sub_2510FB2A0();
    uint64_t v24 = *(void *)(v23 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
    {
      sub_2510E6DB8(0, &qword_26B214D50, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
      memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v21, v22, v23);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
    }
    *((unsigned char *)v4 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  }
  return v4;
}

uint64_t sub_2510EE450(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v3 = a1 + *(int *)(v2 + 24);
  uint64_t v4 = type metadata accessor for MedmojiIconConfiguration();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(v3, 1, v4))
  {
    uint64_t v5 = sub_2510FB420();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v3, v5);
    uint64_t v6 = v3 + *(int *)(v4 + 20);
    uint64_t v7 = sub_2510FB3D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  uint64_t v8 = a1 + *(int *)(v2 + 32);
  uint64_t v9 = sub_2510FB2A0();
  uint64_t v12 = *(void *)(v9 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v8, 1, v9);
  if (!result)
  {
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(v12 + 8);
    return v11(v8, v9);
  }
  return result;
}

void *sub_2510EE614(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  a1[2] = a2[2];
  uint64_t v6 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v7 = v6[6];
  __dst = (char *)a1 + v7;
  uint64_t v8 = (char *)a2 + v7;
  uint64_t v9 = type metadata accessor for MedmojiIconConfiguration();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v11(v8, 1, v9))
  {
    sub_2510E6DB8(0, qword_26B2150B0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, MEMORY[0x263F8D8F0]);
    memcpy(__dst, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    uint64_t v13 = sub_2510FB420();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(__dst, v8, v13);
    uint64_t v14 = *(int *)(v9 + 20);
    uint64_t v15 = &__dst[v14];
    uint64_t v16 = &v8[v14];
    uint64_t v17 = sub_2510FB3D0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(__dst, 0, 1, v9);
  }
  *((unsigned char *)a1 + v6[7]) = *((unsigned char *)a2 + v6[7]);
  uint64_t v18 = v6[8];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  uint64_t v21 = sub_2510FB2A0();
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    sub_2510E6DB8(0, &qword_26B214D50, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v19, v20, v21);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  return a1;
}

void *sub_2510EE924(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v6 = v5[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for MedmojiIconConfiguration();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      uint64_t v14 = sub_2510FB420();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v7, v8, v14);
      uint64_t v15 = *(int *)(v9 + 20);
      uint64_t v16 = &v7[v15];
      uint64_t v17 = &v8[v15];
      uint64_t v18 = sub_2510FB3D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    sub_2510F05BC((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for MedmojiIconConfiguration);
LABEL_6:
    sub_2510E6DB8(0, qword_26B2150B0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, MEMORY[0x263F8D8F0]);
    memcpy(v7, v8, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v30 = sub_2510FB420();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 24))(v7, v8, v30);
  uint64_t v31 = *(int *)(v9 + 20);
  char v32 = &v7[v31];
  uint64_t v33 = &v8[v31];
  uint64_t v34 = sub_2510FB3D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 24))(v32, v33, v34);
LABEL_7:
  *((unsigned char *)a1 + v5[7]) = *((unsigned char *)a2 + v5[7]);
  uint64_t v20 = v5[8];
  uint64_t v21 = (char *)a1 + v20;
  uint64_t v22 = (char *)a2 + v20;
  uint64_t v23 = sub_2510FB2A0();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48);
  int v26 = v25(v21, 1, v23);
  int v27 = v25(v22, 1, v23);
  if (!v26)
  {
    if (!v27)
    {
      (*(void (**)(char *, char *, uint64_t))(v24 + 24))(v21, v22, v23);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v24 + 8))(v21, v23);
    goto LABEL_12;
  }
  if (v27)
  {
LABEL_12:
    sub_2510E6DB8(0, &qword_26B214D50, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
    memcpy(v21, v22, *(void *)(*(void *)(v28 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v21, v22, v23);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
LABEL_13:
  *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_2510EED68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v7 = v6[6];
  uint64_t v8 = (char *)(a1 + v7);
  uint64_t v9 = (char *)(a2 + v7);
  uint64_t v10 = type metadata accessor for MedmojiIconConfiguration();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    sub_2510E6DB8(0, qword_26B2150B0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, MEMORY[0x263F8D8F0]);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    uint64_t v13 = sub_2510FB420();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v8, v9, v13);
    uint64_t v14 = *(int *)(v10 + 20);
    uint64_t v15 = &v8[v14];
    uint64_t v16 = &v9[v14];
    uint64_t v17 = sub_2510FB3D0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  *(unsigned char *)(a1 + v6[7]) = *(unsigned char *)(a2 + v6[7]);
  uint64_t v18 = v6[8];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (const void *)(a2 + v18);
  uint64_t v21 = sub_2510FB2A0();
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    sub_2510E6DB8(0, &qword_26B214D50, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v22 + 32))(v19, v20, v21);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

void *sub_2510EF054(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  uint64_t v6 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v7 = v6[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for MedmojiIconConfiguration();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      uint64_t v15 = sub_2510FB420();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v8, v9, v15);
      uint64_t v16 = *(int *)(v10 + 20);
      uint64_t v17 = &v8[v16];
      uint64_t v18 = &v9[v16];
      uint64_t v19 = sub_2510FB3D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    sub_2510F05BC((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for MedmojiIconConfiguration);
LABEL_6:
    sub_2510E6DB8(0, qword_26B2150B0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, MEMORY[0x263F8D8F0]);
    memcpy(v8, v9, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v31 = sub_2510FB420();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 40))(v8, v9, v31);
  uint64_t v32 = *(int *)(v10 + 20);
  uint64_t v33 = &v8[v32];
  uint64_t v34 = &v9[v32];
  uint64_t v35 = sub_2510FB3D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 40))(v33, v34, v35);
LABEL_7:
  *((unsigned char *)a1 + v6[7]) = *((unsigned char *)a2 + v6[7]);
  uint64_t v21 = v6[8];
  uint64_t v22 = (char *)a1 + v21;
  uint64_t v23 = (char *)a2 + v21;
  uint64_t v24 = sub_2510FB2A0();
  uint64_t v25 = *(void *)(v24 - 8);
  int v26 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v25 + 48);
  int v27 = v26(v22, 1, v24);
  int v28 = v26(v23, 1, v24);
  if (!v27)
  {
    if (!v28)
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 40))(v22, v23, v24);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v25 + 8))(v22, v24);
    goto LABEL_12;
  }
  if (v28)
  {
LABEL_12:
    sub_2510E6DB8(0, &qword_26B214D50, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
    memcpy(v22, v23, *(void *)(*(void *)(v29 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v22, v23, v24);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
LABEL_13:
  *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_2510EF480(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2510EF494);
}

uint64_t sub_2510EF494(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 2) {
      int v11 = ((v10 + 2147483646) & 0x7FFFFFFF) - 1;
    }
    else {
      int v11 = -2;
    }
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_2510EF570(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2510EF584);
}

uint64_t sub_2510EF584(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 2;
  }
  return result;
}

uint64_t sub_2510EF640()
{
  uint64_t result = type metadata accessor for MedicationsWidgetViewModel();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2510EF6D4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2510EF7DC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2510EF7F8()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_2510EF814()
{
  if (!qword_26B2156A0)
  {
    sub_2510EFC38(255, &qword_26B215698);
    swift_getOpaqueTypeConformance2();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_26B2156A0);
    }
  }
}

void sub_2510EF8F8()
{
  if (!qword_26B2155B8)
  {
    sub_2510EF814();
    sub_2510EF978(255, &qword_26B215678, &qword_26B215690, MEMORY[0x263F1A738]);
    unint64_t v0 = sub_2510FB540();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B2155B8);
    }
  }
}

void sub_2510EF978(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4)
{
  if (!*a2)
  {
    sub_2510EFC94(255, a3, a4, MEMORY[0x263F8D8F0]);
    unint64_t v5 = sub_2510FB770();
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_2510EF9E4()
{
  if (!qword_26B215588)
  {
    sub_2510EFA68(255, &qword_26B215668, MEMORY[0x263F19B28]);
    unint64_t v0 = sub_2510FB530();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B215588);
    }
  }
}

void sub_2510EFA68(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    sub_2510EFEC4(255, &qword_26B215648, MEMORY[0x263F19B28]);
    uint64_t v7 = v6;
    sub_2510EFCE0();
    unint64_t v9 = a3(a1, v7, v8);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

void sub_2510EFAF4(uint64_t a1)
{
}

void sub_2510EFB28()
{
  if (!qword_26B2155C8)
  {
    sub_2510EFB8C();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_26B2155C8);
    }
  }
}

void sub_2510EFB8C()
{
  if (!qword_26B2155C0)
  {
    sub_2510EFC38(255, &qword_26B2156B8);
    sub_2510EF978(255, &qword_26B215688, &qword_26B215768, MEMORY[0x263F8D6C8]);
    unint64_t v0 = sub_2510FB540();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B2155C0);
    }
  }
}

void sub_2510EFC38(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v4) {
      atomic_store(OpaqueTypeMetadata2, a2);
    }
  }
}

void sub_2510EFC94(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_2510EFCE0()
{
  if (!qword_26B2156B0)
  {
    sub_2510EFD64();
    sub_2510EFDDC();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_26B2156B0);
    }
  }
}

void sub_2510EFD64()
{
  if (!qword_26B2155A8)
  {
    sub_2510EF978(255, &qword_26B215688, &qword_26B215768, MEMORY[0x263F8D6C8]);
    unint64_t v0 = sub_2510FB540();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B2155A8);
    }
  }
}

unint64_t sub_2510EFDDC()
{
  unint64_t result = qword_26B2155A0;
  if (!qword_26B2155A0)
  {
    sub_2510EFD64();
    sub_2510EFE74(&qword_26B215680, &qword_26B215688, &qword_26B215768, MEMORY[0x263F8D6C8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2155A0);
  }
  return result;
}

uint64_t sub_2510EFE74(unint64_t *a1, unint64_t *a2, unint64_t *a3, uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2510EF978(255, a2, a3, a4);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_2510EFEC4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    sub_2510EFAF4(255);
    unint64_t v7 = a3(a1, v6, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_2510EFF28@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_2510FB620();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_2510EFF5C()
{
  return sub_2510FB630();
}

uint64_t sub_2510EFF8C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2510EFFF4(uint64_t a1, uint64_t a2)
{
  sub_2510EFEC4(0, &qword_26B215648, MEMORY[0x263F19B28]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_2510F0074()
{
  unint64_t result = qword_26B215640;
  if (!qword_26B215640)
  {
    sub_2510EFEC4(255, &qword_26B215648, MEMORY[0x263F19B28]);
    sub_2510EA370(&qword_26B215730, sub_2510EFAF4);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B215640);
  }
  return result;
}

uint64_t sub_2510F0130(uint64_t a1)
{
  sub_2510EFEC4(0, &qword_26B215648, MEMORY[0x263F19B28]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2510F01A8()
{
  if (!qword_26B2157B0)
  {
    sub_2510FB100();
    sub_2510EA370(&qword_26B215448, MEMORY[0x263F067E8]);
    unint64_t v0 = sub_2510FBDE0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B2157B0);
    }
  }
}

void sub_2510F023C()
{
  if (!qword_26B2157A0)
  {
    sub_2510FB100();
    sub_2510EA370(&qword_26B215448, MEMORY[0x263F067E8]);
    unint64_t v0 = sub_2510FBDD0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B2157A0);
    }
  }
}

void sub_2510F02D0()
{
  if (!qword_26B215770)
  {
    sub_2510FB100();
    sub_2510EA370(&qword_26B215448, MEMORY[0x263F067E8]);
    unint64_t v0 = sub_2510FBC40();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B215770);
    }
  }
}

void sub_2510F0364()
{
  if (!qword_26B215458)
  {
    sub_2510FB060();
    unint64_t v0 = sub_2510FB190();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B215458);
    }
  }
}

void sub_2510F03C4()
{
  if (!qword_26B215798)
  {
    sub_2510FB0E0();
    sub_2510EA370(&qword_26B215440, MEMORY[0x263F067C8]);
    unint64_t v0 = sub_2510FBDC0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B215798);
    }
  }
}

uint64_t sub_2510F0458(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2510F04C0@<X0>(uint64_t *a1@<X8>)
{
  sub_2510FB070();
  uint64_t result = sub_2510FB060();
  *a1 = result;
  return result;
}

void sub_2510F04F0()
{
}

unint64_t sub_2510F050C()
{
  unint64_t result = qword_26B215420;
  if (!qword_26B215420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B215420);
  }
  return result;
}

uint64_t sub_2510F0560(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  sub_2510E6DB8(0, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  return a1;
}

uint64_t sub_2510F05BC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_2510F0620()
{
  unint64_t result = qword_26B2155B0;
  if (!qword_26B2155B0)
  {
    sub_2510EF8F8();
    sub_2510EFC38(255, &qword_26B215698);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_2510EFE74(&qword_26B215670, &qword_26B215678, &qword_26B215690, MEMORY[0x263F1A738]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2155B0);
  }
  return result;
}

uint64_t sub_2510F0740()
{
  return sub_2510EA370(&qword_26B2156D0, (void (*)(uint64_t))sub_2510F0788);
}

void sub_2510F0788()
{
  if (!qword_26B2156D8)
  {
    sub_2510EFA68(255, &qword_26B215668, MEMORY[0x263F19B28]);
    sub_2510F0808();
    unint64_t v0 = sub_2510FB980();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B2156D8);
    }
  }
}

unint64_t sub_2510F0808()
{
  unint64_t result = qword_26B215660;
  if (!qword_26B215660)
  {
    sub_2510EFA68(255, &qword_26B215668, MEMORY[0x263F19B28]);
    sub_2510F0074();
    sub_2510EFD64();
    sub_2510EFDDC();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B215660);
  }
  return result;
}

uint64_t *sub_2510F08D8(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    unint64_t v9 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_2510F0EA4(0, &qword_269B20B80, MEMORY[0x263F18FF8], MEMORY[0x263F185C8]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_2510FB560();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v10 = a3[5];
    int v11 = (uint64_t *)((char *)a1 + v10);
    uint64_t v12 = (uint64_t *)((char *)a2 + v10);
    sub_2510F0EA4(0, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_2510FBA70();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *int v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v14 = a3[6];
    uint64_t v15 = (uint64_t *)((char *)a1 + v14);
    uint64_t v16 = (uint64_t *)((char *)a2 + v14);
    sub_2510F0EA4(0, &qword_26B215558, MEMORY[0x263F1FC90], MEMORY[0x263F185C8]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v17 = sub_2510FBA60();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    }
    else
    {
      *uint64_t v15 = *v16;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v18 = a3[7];
    uint64_t v19 = (char *)a1 + v18;
    uint64_t v20 = (char *)a2 + v18;
    uint64_t v21 = *(void *)v20;
    char v22 = v20[8];
    sub_2510F0F08(*(void *)v20, v22);
    *(void *)uint64_t v19 = v21;
    v19[8] = v22;
    uint64_t v23 = a3[8];
    char v47 = a1;
    uint64_t v24 = (uint64_t *)((char *)a1 + v23);
    uint64_t v25 = (char *)a2 + v23;
    uint64_t v26 = *(uint64_t *)((char *)a2 + v23 + 8);
    *uint64_t v24 = *(uint64_t *)((char *)a2 + v23);
    v24[1] = v26;
    v24[2] = *(uint64_t *)((char *)a2 + v23 + 16);
    int v27 = (int *)type metadata accessor for MedicationsWidgetViewModel();
    uint64_t v28 = v27[6];
    __dst = (char *)v24 + v28;
    uint64_t v29 = &v25[v28];
    uint64_t v30 = type metadata accessor for MedmojiIconConfiguration();
    uint64_t v31 = *(void *)(v30 - 8);
    uint64_t v32 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v32(v29, 1, v30))
    {
      sub_2510F0EA4(0, qword_26B2150B0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, MEMORY[0x263F8D8F0]);
      memcpy(__dst, v29, *(void *)(*(void *)(v33 - 8) + 64));
    }
    else
    {
      uint64_t v34 = sub_2510FB420();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16))(__dst, v29, v34);
      uint64_t v35 = *(int *)(v30 + 20);
      uint64_t v36 = &__dst[v35];
      uint64_t v37 = &v29[v35];
      uint64_t v38 = sub_2510FB3D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 16))(v36, v37, v38);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(__dst, 0, 1, v30);
    }
    *((unsigned char *)v24 + v27[7]) = v25[v27[7]];
    uint64_t v39 = v27[8];
    char v40 = (char *)v24 + v39;
    uint64_t v41 = &v25[v39];
    uint64_t v42 = sub_2510FB2A0();
    uint64_t v43 = *(void *)(v42 - 8);
    unint64_t v9 = v47;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v43 + 48))(v41, 1, v42))
    {
      sub_2510F0EA4(0, &qword_26B214D50, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
      memcpy(v40, v41, *(void *)(*(void *)(v44 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v43 + 16))(v40, v41, v42);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v43 + 56))(v40, 0, 1, v42);
    }
  }
  return v9;
}

void sub_2510F0EA4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_2510F0F08(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_2510F0F14(uint64_t a1, int *a2)
{
  sub_2510F0EA4(0, &qword_269B20B80, MEMORY[0x263F18FF8], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_2510FB560();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + a2[5];
  sub_2510F0EA4(0, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_2510FBA70();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = a1 + a2[6];
  sub_2510F0EA4(0, &qword_26B215558, MEMORY[0x263F1FC90], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_2510FBA60();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }
  sub_2510DE804(*(void *)(a1 + a2[7]), *(unsigned char *)(a1 + a2[7] + 8));
  uint64_t v9 = a1 + a2[8];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v11 = v9 + *(int *)(v10 + 24);
  uint64_t v12 = type metadata accessor for MedmojiIconConfiguration();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v11, 1, v12))
  {
    uint64_t v13 = sub_2510FB420();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v11, v13);
    uint64_t v14 = v11 + *(int *)(v12 + 20);
    uint64_t v15 = sub_2510FB3D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  }
  uint64_t v16 = v9 + *(int *)(v10 + 32);
  uint64_t v17 = sub_2510FB2A0();
  uint64_t v20 = *(void *)(v17 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v20 + 48))(v16, 1, v17);
  if (!result)
  {
    uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t))(v20 + 8);
    return v19(v16, v17);
  }
  return result;
}

void *sub_2510F12B8(void *a1, void *a2, int *a3)
{
  sub_2510F0EA4(0, &qword_269B20B80, MEMORY[0x263F18FF8], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_2510FB560();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  sub_2510F0EA4(0, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_2510FBA70();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  sub_2510F0EA4(0, &qword_26B215558, MEMORY[0x263F1FC90], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = sub_2510FBA60();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  }
  else
  {
    *uint64_t v12 = *v13;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v15 = a3[7];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = *(void *)v17;
  char v19 = v17[8];
  sub_2510F0F08(*(void *)v17, v19);
  *(void *)uint64_t v16 = v18;
  v16[8] = v19;
  uint64_t v20 = a3[8];
  uint64_t v44 = a1;
  uint64_t v21 = (void *)((char *)a1 + v20);
  char v22 = (char *)a2 + v20;
  uint64_t v23 = *(void *)((char *)a2 + v20 + 8);
  void *v21 = *(void *)((char *)a2 + v20);
  v21[1] = v23;
  void v21[2] = *(void *)((char *)a2 + v20 + 16);
  uint64_t v24 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v25 = v24[6];
  __dst = (char *)v21 + v25;
  uint64_t v26 = &v22[v25];
  uint64_t v27 = type metadata accessor for MedmojiIconConfiguration();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v29(v26, 1, v27))
  {
    sub_2510F0EA4(0, qword_26B2150B0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, MEMORY[0x263F8D8F0]);
    memcpy(__dst, v26, *(void *)(*(void *)(v30 - 8) + 64));
  }
  else
  {
    uint64_t v31 = sub_2510FB420();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 16))(__dst, v26, v31);
    uint64_t v32 = *(int *)(v27 + 20);
    uint64_t v33 = &__dst[v32];
    uint64_t v34 = &v26[v32];
    uint64_t v35 = sub_2510FB3D0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 16))(v33, v34, v35);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(__dst, 0, 1, v27);
  }
  *((unsigned char *)v21 + v24[7]) = v22[v24[7]];
  uint64_t v36 = v24[8];
  uint64_t v37 = (char *)v21 + v36;
  uint64_t v38 = &v22[v36];
  uint64_t v39 = sub_2510FB2A0();
  uint64_t v40 = *(void *)(v39 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v38, 1, v39))
  {
    sub_2510F0EA4(0, &qword_26B214D50, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
    memcpy(v37, v38, *(void *)(*(void *)(v41 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v37, v38, v39);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
  }
  return v44;
}

void *sub_2510F1834(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = (uint64_t (*)(uint64_t))MEMORY[0x263F18FF8];
    uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
    sub_2510F5D60((uint64_t)a1, &qword_269B20B80, MEMORY[0x263F18FF8], MEMORY[0x263F185C8]);
    sub_2510F0EA4(0, &qword_269B20B80, v6, v7);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v8 = sub_2510FB560();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = (void *)((char *)a1 + v9);
    uint64_t v11 = (void *)((char *)a2 + v9);
    uint64_t v12 = (uint64_t (*)(uint64_t))MEMORY[0x263F1FD10];
    uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
    sub_2510F5D60((uint64_t)a1 + v9, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
    sub_2510F0EA4(0, &qword_26B215110, v12, v13);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = sub_2510FBA70();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v10, v11, v14);
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v15 = a3[6];
    uint64_t v16 = (void *)((char *)a1 + v15);
    uint64_t v17 = (void *)((char *)a2 + v15);
    uint64_t v18 = (uint64_t (*)(uint64_t))MEMORY[0x263F1FC90];
    char v19 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
    sub_2510F5D60((uint64_t)a1 + v15, &qword_26B215558, MEMORY[0x263F1FC90], MEMORY[0x263F185C8]);
    sub_2510F0EA4(0, &qword_26B215558, v18, v19);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v20 = sub_2510FBA60();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v20 - 8) + 16))(v16, v17, v20);
    }
    else
    {
      *uint64_t v16 = *v17;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v21 = a3[7];
  char v22 = (char *)a1 + v21;
  uint64_t v23 = (char *)a2 + v21;
  uint64_t v24 = *(void *)v23;
  char v25 = v23[8];
  sub_2510F0F08(*(void *)v23, v25);
  uint64_t v26 = *(void *)v22;
  char v27 = v22[8];
  *(void *)char v22 = v24;
  v22[8] = v25;
  sub_2510DE804(v26, v27);
  uint64_t v28 = a3[8];
  uint64_t v61 = a1;
  uint64_t v29 = (void *)((char *)a1 + v28);
  uint64_t v30 = (char *)a2 + v28;
  *uint64_t v29 = *(void *)((char *)a2 + v28);
  v29[1] = *(void *)((char *)a2 + v28 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v29[2] = *((void *)v30 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v31 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v32 = v31[6];
  uint64_t v33 = (char *)v29 + v32;
  uint64_t v34 = &v30[v32];
  uint64_t v35 = type metadata accessor for MedmojiIconConfiguration();
  uint64_t v36 = *(void *)(v35 - 8);
  uint64_t v37 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v36 + 48);
  LODWORD(v22) = v37(v33, 1, v35);
  int v38 = v37(v34, 1, v35);
  if (v22)
  {
    if (!v38)
    {
      uint64_t v39 = sub_2510FB420();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v39 - 8) + 16))(v33, v34, v39);
      uint64_t v40 = *(int *)(v35 + 20);
      uint64_t v41 = &v33[v40];
      uint64_t v42 = &v34[v40];
      uint64_t v43 = sub_2510FB3D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 16))(v41, v42, v43);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (v38)
  {
    sub_2510F64E4((uint64_t)v33, (uint64_t (*)(void))type metadata accessor for MedmojiIconConfiguration);
LABEL_17:
    sub_2510F0EA4(0, qword_26B2150B0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, MEMORY[0x263F8D8F0]);
    memcpy(v33, v34, *(void *)(*(void *)(v44 - 8) + 64));
    goto LABEL_18;
  }
  uint64_t v56 = sub_2510FB420();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v56 - 8) + 24))(v33, v34, v56);
  uint64_t v57 = *(int *)(v35 + 20);
  unint64_t v58 = &v33[v57];
  uint64_t v59 = &v34[v57];
  uint64_t v60 = sub_2510FB3D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v60 - 8) + 24))(v58, v59, v60);
LABEL_18:
  *((unsigned char *)v29 + v31[7]) = v30[v31[7]];
  uint64_t v45 = v31[8];
  char v46 = (char *)v29 + v45;
  char v47 = &v30[v45];
  uint64_t v48 = sub_2510FB2A0();
  uint64_t v49 = *(void *)(v48 - 8);
  uint64_t v50 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v49 + 48);
  int v51 = v50(v46, 1, v48);
  int v52 = v50(v47, 1, v48);
  if (!v51)
  {
    char v53 = v61;
    if (!v52)
    {
      (*(void (**)(char *, char *, uint64_t))(v49 + 24))(v46, v47, v48);
      return v53;
    }
    (*(void (**)(char *, uint64_t))(v49 + 8))(v46, v48);
    goto LABEL_23;
  }
  char v53 = v61;
  if (v52)
  {
LABEL_23:
    sub_2510F0EA4(0, &qword_26B214D50, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
    memcpy(v46, v47, *(void *)(*(void *)(v54 - 8) + 64));
    return v53;
  }
  (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v46, v47, v48);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v49 + 56))(v46, 0, 1, v48);
  return v53;
}

char *sub_2510F1F5C(char *a1, char *a2, int *a3)
{
  sub_2510F0EA4(0, &qword_269B20B80, MEMORY[0x263F18FF8], MEMORY[0x263F185C8]);
  uint64_t v7 = v6;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_2510FB560();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  uint64_t v9 = a3[5];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  sub_2510F0EA4(0, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  uint64_t v13 = v12;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = sub_2510FBA70();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v10, v11, v14);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
  }
  uint64_t v15 = a3[6];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  sub_2510F0EA4(0, &qword_26B215558, MEMORY[0x263F1FC90], MEMORY[0x263F185C8]);
  uint64_t v19 = v18;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v20 = sub_2510FBA60();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v16, v17, v20);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v16, v17, *(void *)(*(void *)(v19 - 8) + 64));
  }
  uint64_t v21 = a3[7];
  uint64_t v22 = a3[8];
  uint64_t v23 = &a1[v21];
  uint64_t v24 = &a2[v21];
  *(void *)uint64_t v23 = *(void *)v24;
  v23[8] = v24[8];
  char v25 = &a1[v22];
  uint64_t v26 = &a2[v22];
  *(_OWORD *)char v25 = *(_OWORD *)&a2[v22];
  *((void *)v25 + 2) = *(void *)&a2[v22 + 16];
  char v27 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v28 = v27[6];
  uint64_t v29 = &v25[v28];
  uint64_t v30 = &v26[v28];
  uint64_t v31 = type metadata accessor for MedmojiIconConfiguration();
  uint64_t v32 = *(void *)(v31 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v30, 1, v31))
  {
    sub_2510F0EA4(0, qword_26B2150B0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, MEMORY[0x263F8D8F0]);
    memcpy(v29, v30, *(void *)(*(void *)(v33 - 8) + 64));
  }
  else
  {
    uint64_t v34 = sub_2510FB420();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 32))(v29, v30, v34);
    uint64_t v35 = *(int *)(v31 + 20);
    uint64_t v36 = &v29[v35];
    uint64_t v37 = &v30[v35];
    uint64_t v38 = sub_2510FB3D0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 32))(v36, v37, v38);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
  }
  v25[v27[7]] = v26[v27[7]];
  uint64_t v39 = v27[8];
  uint64_t v40 = &v25[v39];
  uint64_t v41 = &v26[v39];
  uint64_t v42 = sub_2510FB2A0();
  uint64_t v43 = *(void *)(v42 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v43 + 48))(v41, 1, v42))
  {
    sub_2510F0EA4(0, &qword_26B214D50, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
    memcpy(v40, v41, *(void *)(*(void *)(v44 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v40, v41, v42);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v43 + 56))(v40, 0, 1, v42);
  }
  return a1;
}

char *sub_2510F24B8(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = (uint64_t (*)(uint64_t))MEMORY[0x263F18FF8];
    uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
    sub_2510F5D60((uint64_t)a1, &qword_269B20B80, MEMORY[0x263F18FF8], MEMORY[0x263F185C8]);
    sub_2510F0EA4(0, &qword_269B20B80, v6, v7);
    uint64_t v9 = v8;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_2510FB560();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(a1, a2, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    uint64_t v11 = a3[5];
    uint64_t v12 = &a1[v11];
    uint64_t v13 = &a2[v11];
    uint64_t v14 = (uint64_t (*)(uint64_t))MEMORY[0x263F1FD10];
    uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
    sub_2510F5D60((uint64_t)&a1[v11], &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
    sub_2510F0EA4(0, &qword_26B215110, v14, v15);
    uint64_t v17 = v16;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v18 = sub_2510FBA70();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v12, v13, v18);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64));
    }
    uint64_t v19 = a3[6];
    uint64_t v20 = &a1[v19];
    uint64_t v21 = &a2[v19];
    uint64_t v22 = (uint64_t (*)(uint64_t))MEMORY[0x263F1FC90];
    uint64_t v23 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
    sub_2510F5D60((uint64_t)&a1[v19], &qword_26B215558, MEMORY[0x263F1FC90], MEMORY[0x263F185C8]);
    sub_2510F0EA4(0, &qword_26B215558, v22, v23);
    uint64_t v25 = v24;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v26 = sub_2510FBA60();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(v20, v21, v26);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v20, v21, *(void *)(*(void *)(v25 - 8) + 64));
    }
  }
  uint64_t v27 = a3[7];
  uint64_t v28 = &a1[v27];
  uint64_t v29 = &a2[v27];
  uint64_t v30 = *(void *)v29;
  LOBYTE(v29) = v29[8];
  uint64_t v31 = *(void *)v28;
  char v32 = v28[8];
  *(void *)uint64_t v28 = v30;
  v28[8] = (char)v29;
  sub_2510DE804(v31, v32);
  uint64_t v33 = a3[8];
  unint64_t v68 = a1;
  uint64_t v34 = &a1[v33];
  uint64_t v35 = &a2[v33];
  uint64_t v36 = *(void *)&a2[v33 + 8];
  *(void *)uint64_t v34 = *(void *)&a2[v33];
  *((void *)v34 + 1) = v36;
  swift_bridgeObjectRelease();
  *((void *)v34 + 2) = *((void *)v35 + 2);
  swift_bridgeObjectRelease();
  uint64_t v37 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v38 = v37[6];
  uint64_t v39 = &v34[v38];
  uint64_t v40 = &v35[v38];
  uint64_t v41 = type metadata accessor for MedmojiIconConfiguration();
  uint64_t v42 = *(void *)(v41 - 8);
  uint64_t v43 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v42 + 48);
  int v44 = v43(v39, 1, v41);
  int v45 = v43(v40, 1, v41);
  if (v44)
  {
    if (!v45)
    {
      uint64_t v46 = sub_2510FB420();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 32))(v39, v40, v46);
      uint64_t v47 = *(int *)(v41 + 20);
      uint64_t v48 = &v39[v47];
      uint64_t v49 = &v40[v47];
      uint64_t v50 = sub_2510FB3D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v50 - 8) + 32))(v48, v49, v50);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v42 + 56))(v39, 0, 1, v41);
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (v45)
  {
    sub_2510F64E4((uint64_t)v39, (uint64_t (*)(void))type metadata accessor for MedmojiIconConfiguration);
LABEL_16:
    sub_2510F0EA4(0, qword_26B2150B0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, MEMORY[0x263F8D8F0]);
    memcpy(v39, v40, *(void *)(*(void *)(v51 - 8) + 64));
    goto LABEL_17;
  }
  uint64_t v63 = sub_2510FB420();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v63 - 8) + 40))(v39, v40, v63);
  uint64_t v64 = *(int *)(v41 + 20);
  unint64_t v65 = &v39[v64];
  unint64_t v66 = &v40[v64];
  uint64_t v67 = sub_2510FB3D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v67 - 8) + 40))(v65, v66, v67);
LABEL_17:
  v34[v37[7]] = v35[v37[7]];
  uint64_t v52 = v37[8];
  char v53 = &v34[v52];
  uint64_t v54 = &v35[v52];
  uint64_t v55 = sub_2510FB2A0();
  uint64_t v56 = *(void *)(v55 - 8);
  uint64_t v57 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v56 + 48);
  int v58 = v57(v53, 1, v55);
  int v59 = v57(v54, 1, v55);
  if (!v58)
  {
    uint64_t v60 = v68;
    if (!v59)
    {
      (*(void (**)(char *, char *, uint64_t))(v56 + 40))(v53, v54, v55);
      return v60;
    }
    (*(void (**)(char *, uint64_t))(v56 + 8))(v53, v55);
    goto LABEL_22;
  }
  uint64_t v60 = v68;
  if (v59)
  {
LABEL_22:
    sub_2510F0EA4(0, &qword_26B214D50, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
    memcpy(v53, v54, *(void *)(*(void *)(v61 - 8) + 64));
    return v60;
  }
  (*(void (**)(char *, char *, uint64_t))(v56 + 32))(v53, v54, v55);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v56 + 56))(v53, 0, 1, v55);
  return v60;
}

uint64_t sub_2510F2BD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2510F2BE8);
}

uint64_t sub_2510F2BE8(uint64_t a1, uint64_t a2, int *a3)
{
  sub_2510F0EA4(0, &qword_269B20B78, MEMORY[0x263F18FF8], MEMORY[0x263F185D0]);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_8:
    return v9(v10, a2, v8);
  }
  sub_2510F0EA4(0, &qword_26B215568, MEMORY[0x263F1FD10], MEMORY[0x263F185D0]);
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[5];
LABEL_7:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_8;
  }
  sub_2510F0EA4(0, &qword_26B215560, MEMORY[0x263F1FC90], MEMORY[0x263F185D0]);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[6];
    goto LABEL_7;
  }
  if (a2 == 254)
  {
    unsigned int v16 = *(unsigned __int8 *)(a1 + a3[7] + 8);
    if (v16 > 1) {
      return (v16 ^ 0xFF) + 1;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v17 = type metadata accessor for MedicationsWidgetViewModel();
    uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 48);
    uint64_t v19 = v17;
    uint64_t v20 = a1 + a3[8];
    return v18(v20, a2, v19);
  }
}

uint64_t sub_2510F2E40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2510F2E54);
}

void sub_2510F2E54(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  sub_2510F0EA4(0, &qword_269B20B78, MEMORY[0x263F18FF8], MEMORY[0x263F185D0]);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_8:
    v11(v12, a2, a2, v10);
    return;
  }
  sub_2510F0EA4(0, &qword_26B215568, MEMORY[0x263F1FD10], MEMORY[0x263F185D0]);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v14 = *(void *)(v13 - 8);
    uint64_t v15 = a4[5];
LABEL_7:
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_8;
  }
  sub_2510F0EA4(0, &qword_26B215560, MEMORY[0x263F1FC90], MEMORY[0x263F185D0]);
  if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a3)
  {
    uint64_t v10 = v16;
    uint64_t v14 = *(void *)(v16 - 8);
    uint64_t v15 = a4[6];
    goto LABEL_7;
  }
  if (a3 == 254)
  {
    *(unsigned char *)(a1 + a4[7] + 8) = -(char)a2;
  }
  else
  {
    uint64_t v17 = type metadata accessor for MedicationsWidgetViewModel();
    uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
    uint64_t v19 = v17;
    uint64_t v20 = a1 + a4[8];
    v18(v20, a2, a2, v19);
  }
}

uint64_t type metadata accessor for MedicationsWidgetRectangularView()
{
  uint64_t result = qword_26B2154C0;
  if (!qword_26B2154C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2510F30FC()
{
  sub_2510F0EA4(319, &qword_269B20B80, MEMORY[0x263F18FF8], MEMORY[0x263F185C8]);
  if (v0 <= 0x3F)
  {
    sub_2510F0EA4(319, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
    if (v1 <= 0x3F)
    {
      sub_2510F0EA4(319, &qword_26B215558, MEMORY[0x263F1FC90], MEMORY[0x263F185C8]);
      if (v2 <= 0x3F)
      {
        type metadata accessor for MedicationsWidgetViewModel();
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

uint64_t sub_2510F32D4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2510F32F0()
{
  uint64_t v1 = sub_2510FB760();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510F4F94();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510F595C(0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v7 = sub_2510FB6F0();
  *((void *)v7 + 1) = 0;
  v7[16] = 1;
  sub_2510F597C();
  sub_2510F3574(v0, (uint64_t)&v7[*(int *)(v11 + 44)]);
  uint64_t v12 = sub_2510FB9D0();
  sub_2510F4DBC(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v10, 0.0, 1, 0.0, 1, v12, v13, (void (*)(uint64_t, uint64_t))sub_2510F5ABC, (uint64_t (*)(void))sub_2510F595C);
  sub_2510F64E4((uint64_t)v7, (uint64_t (*)(void))sub_2510F4F94);
  v15[1] = sub_2510FB930();
  sub_2510FB750();
  sub_2510F5A14();
  sub_2510FB8F0();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  swift_release();
  return sub_2510F64E4((uint64_t)v10, (uint64_t (*)(void))sub_2510F595C);
}

uint64_t sub_2510F3574@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v201 = a2;
  uint64_t v3 = type metadata accessor for MedicationsWidgetRectangularView();
  uint64_t v156 = *(void *)(v3 - 8);
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v157 = v5;
  uint64_t v158 = (uint64_t)&v154 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510EA474(0);
  MEMORY[0x270FA5388](v6 - 8);
  char v159 = (char *)&v154 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510F5794(0);
  uint64_t v195 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v161 = (uint64_t)&v154 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510F56E0();
  uint64_t v198 = v10;
  uint64_t v163 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v162 = (char *)&v154 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510F55F4();
  uint64_t v200 = v12;
  uint64_t v165 = *(void *)(v12 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  char v160 = (char *)&v154 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v164 = (char *)&v154 - v15;
  sub_2510F5AD4(0, &qword_269B20CB0, MEMORY[0x263F19B20]);
  uint64_t v194 = v16;
  MEMORY[0x270FA5388](v16);
  uint64_t v196 = (uint64_t *)((char *)&v154 - v17);
  uint64_t v18 = sub_2510FB560();
  uint64_t v191 = *(void *)(v18 - 8);
  uint64_t v192 = v18;
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  uint64_t v190 = (char *)&v154 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v189 = (uint64_t)&v154 - v21;
  sub_2510F5570(0);
  uint64_t v23 = MEMORY[0x270FA5388](v22 - 8);
  uint64_t v199 = (uint64_t)&v154 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v197 = (char *)&v154 - v25;
  uint64_t v188 = sub_2510FBA60();
  uint64_t v187 = *(void *)(v188 - 8);
  uint64_t v26 = MEMORY[0x270FA5388](v188);
  uint64_t v186 = (char *)&v154 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v26);
  uint64_t v185 = (uint64_t)&v154 - v28;
  uint64_t v179 = (uint64_t (*)(uint64_t))MEMORY[0x263F1B548];
  uint64_t v178 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F1A418];
  sub_2510F0EA4(0, &qword_269B20C20, MEMORY[0x263F1B548], MEMORY[0x263F1A418]);
  uint64_t v167 = v29 - 8;
  MEMORY[0x270FA5388](v29 - 8);
  uint64_t v175 = (uint64_t *)((char *)&v154 - v30);
  uint64_t v173 = sub_2510FB960();
  uint64_t v31 = *(void *)(v173 - 8);
  MEMORY[0x270FA5388](v173);
  uint64_t v33 = (char *)&v154 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_2510FBA70();
  uint64_t v35 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v37 = (char *)&v154 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_2510FB6C0();
  MEMORY[0x270FA5388](v38 - 8);
  sub_2510F5324();
  uint64_t v170 = v39 - 8;
  MEMORY[0x270FA5388](v39 - 8);
  uint64_t v41 = (char *)&v154 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510F5304(0);
  uint64_t v174 = v42;
  MEMORY[0x270FA5388](v42);
  uint64_t v171 = (uint64_t)&v154 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510F5250();
  uint64_t v176 = v44;
  uint64_t v177 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  uint64_t v172 = (char *)&v154 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510F5164();
  uint64_t v181 = v46;
  uint64_t v180 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  uint64_t v169 = (char *)&v154 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510F50E4();
  uint64_t v183 = v48;
  MEMORY[0x270FA5388](v48);
  uint64_t v184 = (char *)&v154 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2510F507C();
  uint64_t v51 = MEMORY[0x270FA5388](v50 - 8);
  uint64_t v193 = (uint64_t)&v154 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = MEMORY[0x270FA5388](v51);
  v182 = (char *)&v154 - v54;
  MEMORY[0x270FA5388](v53);
  uint64_t v202 = (uint64_t)&v154 - v55;
  sub_2510FB6B0();
  sub_2510FB6A0();
  uint64_t v168 = v4;
  uint64_t v166 = a1;
  sub_2510DD3CC((uint64_t)v37);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v37, v34);
  sub_2510FB950();
  sub_2510FB680();
  swift_release();
  sub_2510FB6A0();
  uint64_t v155 = a1 + *(int *)(v4 + 40);
  sub_2510FB690();
  sub_2510FB6A0();
  sub_2510FB6D0();
  uint64_t v56 = sub_2510FB840();
  uint64_t v58 = v57;
  uint64_t v60 = v59;
  LOBYTE(v4) = v61 & 1;
  uint64_t v62 = v173;
  (*(void (**)(char *, void, uint64_t))(v31 + 104))(v33, *MEMORY[0x263F1B538], v173);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v64 = v175;
  (*(void (**)(char *, char *, uint64_t))(v31 + 16))((char *)v175 + *(int *)(v167 + 36), v33, v62);
  *uint64_t v64 = KeyPath;
  sub_2510F5CBC((uint64_t)v64, (uint64_t)&v41[*(int *)(v170 + 44)]);
  *(void *)uint64_t v41 = v56;
  *((void *)v41 + 1) = v58;
  v41[16] = v4;
  *((void *)v41 + 3) = v60;
  sub_2510F5D50(v56, v58, v4);
  swift_bridgeObjectRetain();
  sub_2510F5D60((uint64_t)v64, &qword_269B20C20, v179, v178);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v33, v62);
  uint64_t v65 = v58;
  unint64_t v66 = v169;
  sub_2510EA794(v56, v65, v4);
  swift_bridgeObjectRelease();
  uint64_t v67 = sub_2510FB800();
  uint64_t v68 = swift_getKeyPath();
  uint64_t v69 = v171;
  sub_2510F655C((uint64_t)v41, v171, (uint64_t (*)(void))sub_2510F5324);
  uint64_t v70 = v174;
  uint64_t v71 = (uint64_t *)(v69 + *(int *)(v174 + 36));
  *uint64_t v71 = v68;
  v71[1] = v67;
  sub_2510F64E4((uint64_t)v41, (uint64_t (*)(void))sub_2510F5324);
  uint64_t v72 = sub_2510F5884(&qword_269B20C28, sub_2510F5304, (void (*)(void))sub_2510F5420);
  char v73 = v172;
  sub_2510FB8B0();
  uint64_t v74 = v166;
  sub_2510F64E4(v69, (uint64_t (*)(void))sub_2510F5304);
  uint64_t v204 = v70;
  uint64_t v205 = v72;
  swift_getOpaqueTypeConformance2();
  uint64_t v75 = v176;
  sub_2510FB870();
  (*(void (**)(char *, uint64_t))(v177 + 8))(v73, v75);
  uint64_t v76 = v185;
  sub_2510DDB60(v185);
  uint64_t v77 = v186;
  sub_2510FBA50();
  char v78 = v77;
  LOBYTE(v77) = sub_2510FBA40();
  char v79 = *(void (**)(char *, uint64_t))(v187 + 8);
  char v80 = v78;
  uint64_t v81 = v188;
  v79(v80, v188);
  v79((char *)v76, v81);
  if (v77) {
    uint64_t v82 = sub_2510FB930();
  }
  else {
    uint64_t v82 = sub_2510FB910();
  }
  uint64_t v83 = v82;
  uint64_t v84 = swift_getKeyPath();
  uint64_t v85 = v180;
  uint64_t v86 = (uint64_t)v184;
  uint64_t v87 = v181;
  (*(void (**)(char *, char *, uint64_t))(v180 + 16))(v184, v66, v181);
  uint64_t v88 = (uint64_t *)(v86 + *(int *)(v183 + 36));
  *uint64_t v88 = v84;
  v88[1] = v83;
  (*(void (**)(char *, uint64_t))(v85 + 8))(v66, v87);
  if (qword_26B215168 != -1) {
    swift_once();
  }
  uint64_t v204 = sub_2510FB130();
  uint64_t v205 = v89;
  sub_2510D7DE4();
  uint64_t v90 = sub_2510FB850();
  uint64_t v92 = v91;
  char v94 = v93 & 1;
  sub_2510F5E6C();
  uint64_t v95 = (uint64_t)v182;
  sub_2510FB8E0();
  sub_2510EA794(v90, v92, v94);
  swift_bridgeObjectRelease();
  sub_2510F64E4(v86, (uint64_t (*)(void))sub_2510F50E4);
  sub_2510F6398(v95, v202, (uint64_t (*)(void))sub_2510F507C);
  uint64_t v96 = v189;
  sub_2510DD878(v189);
  uint64_t v97 = v190;
  sub_2510FB550();
  sub_2510F68D4(&qword_269B20CC8, MEMORY[0x263F18FF8]);
  uint64_t v98 = v192;
  LOBYTE(v90) = sub_2510FBD40();
  unint64_t v99 = *(void (**)(char *, uint64_t))(v191 + 8);
  v99(v97, v98);
  v99((char *)v96, v98);
  if (v90)
  {
    uint64_t v100 = sub_2510FB9E0();
    uint64_t v204 = MEMORY[0x253394DB0](45, 0xE100000000000000, v100);
    uint64_t v205 = v101;
    uint64_t v102 = sub_2510FB850();
    uint64_t v191 = v103;
    uint64_t v192 = v102;
    uint64_t v189 = v104;
    int v106 = v105 & 1;
    uint64_t v107 = sub_2510FB9F0();
    uint64_t v204 = MEMORY[0x253394DB0](45, 0xE100000000000000, v107);
    uint64_t v205 = v108;
    uint64_t v109 = sub_2510FB850();
    uint64_t v111 = v110;
    char v113 = v112 & 1;
    sub_2510FB940();
    uint64_t v114 = sub_2510FB820();
    uint64_t v116 = v115;
    char v118 = v117;
    uint64_t v120 = v119;
    swift_release();
    char v121 = v118 & 1;
    sub_2510EA794(v109, v111, v113);
    swift_bridgeObjectRelease();
    int v122 = v106;
    char v203 = v106;
    uint64_t v124 = v191;
    uint64_t v123 = v192;
    sub_2510F5D50(v192, v191, v106);
    uint64_t v125 = v189;
    swift_bridgeObjectRetain();
    sub_2510F5D50(v114, v116, v121);
    swift_bridgeObjectRetain();
    LODWORD(v190) = v122;
    sub_2510F5D50(v123, v124, v122);
    swift_bridgeObjectRetain();
    sub_2510F5D50(v114, v116, v121);
    swift_bridgeObjectRetain();
    sub_2510EA794(v114, v116, v121);
    swift_bridgeObjectRelease();
    sub_2510EA794(v123, v124, v203);
    swift_bridgeObjectRelease();
    uint64_t v126 = v196;
    *uint64_t v196 = v123;
    v126[1] = v124;
    *((unsigned char *)v126 + 16) = v122;
    v126[3] = v125;
    v126[4] = v114;
    v126[5] = v116;
    *((unsigned char *)v126 + 48) = v121;
    v126[7] = v120;
    swift_storeEnumTagMultiPayload();
    sub_2510F0EA4(0, &qword_269B20C58, (uint64_t (*)(uint64_t))sub_2510F5590, MEMORY[0x263F1BAC8]);
    sub_2510F6480(&qword_269B20CD0, &qword_269B20C58, (uint64_t (*)(uint64_t))sub_2510F5590);
    uint64_t v127 = sub_2510F5884(&qword_269B20C80, sub_2510F5794, (void (*)(void))sub_2510F5928);
    uint64_t v204 = v195;
    uint64_t v205 = v127;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v204 = v198;
    uint64_t v205 = OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2();
    uint64_t v129 = (uint64_t)v197;
    sub_2510FB740();
    sub_2510EA794(v114, v116, v121);
    swift_bridgeObjectRelease();
    sub_2510EA794(v192, v191, (char)v190);
    swift_bridgeObjectRelease();
  }
  else
  {
    char v130 = sub_2510FB7B0();
    uint64_t v131 = (uint64_t)v159;
    *char v159 = v130;
    sub_2510EA6D4();
    uint64_t v204 = *(void *)(v155 + 16);
    swift_getKeyPath();
    uint64_t v132 = v158;
    sub_2510F655C(v74, v158, (uint64_t (*)(void))type metadata accessor for MedicationsWidgetRectangularView);
    unint64_t v133 = (*(unsigned __int8 *)(v156 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v156 + 80);
    uint64_t v134 = swift_allocObject();
    sub_2510F6398(v132, v134 + v133, (uint64_t (*)(void))type metadata accessor for MedicationsWidgetRectangularView);
    sub_2510F5838(0, &qword_26B215758, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
    sub_2510EA5F0();
    swift_bridgeObjectRetain();
    sub_2510FB9A0();
    uint64_t v135 = sub_2510FB7C0();
    uint64_t v136 = swift_getKeyPath();
    uint64_t v137 = v161;
    sub_2510F655C(v131, v161, (uint64_t (*)(void))sub_2510EA474);
    uint64_t v138 = v195;
    uint64_t v139 = (uint64_t *)(v137 + *(int *)(v195 + 36));
    *uint64_t v139 = v136;
    v139[1] = v135;
    sub_2510F64E4(v131, (uint64_t (*)(void))sub_2510EA474);
    uint64_t v140 = sub_2510F5884(&qword_269B20C80, sub_2510F5794, (void (*)(void))sub_2510F5928);
    uint64_t v141 = v162;
    sub_2510FB900();
    sub_2510F64E4(v137, (uint64_t (*)(void))sub_2510F5794);
    uint64_t v204 = v138;
    uint64_t v205 = v140;
    uint64_t v142 = swift_getOpaqueTypeConformance2();
    uint64_t v143 = v160;
    uint64_t v144 = v198;
    sub_2510FB8D0();
    (*(void (**)(char *, uint64_t))(v163 + 8))(v141, v144);
    uint64_t v145 = v165;
    uint64_t v146 = v164;
    uint64_t v147 = v200;
    (*(void (**)(char *, char *, uint64_t))(v165 + 32))(v164, v143, v200);
    (*(void (**)(uint64_t *, char *, uint64_t))(v145 + 16))(v196, v146, v147);
    swift_storeEnumTagMultiPayload();
    sub_2510F0EA4(0, &qword_269B20C58, (uint64_t (*)(uint64_t))sub_2510F5590, MEMORY[0x263F1BAC8]);
    sub_2510F6480(&qword_269B20CD0, &qword_269B20C58, (uint64_t (*)(uint64_t))sub_2510F5590);
    uint64_t v204 = v144;
    uint64_t v205 = v142;
    swift_getOpaqueTypeConformance2();
    uint64_t v129 = (uint64_t)v197;
    sub_2510FB740();
    (*(void (**)(char *, uint64_t))(v145 + 8))(v146, v147);
  }
  uint64_t v148 = v202;
  uint64_t v149 = v193;
  sub_2510F655C(v202, v193, (uint64_t (*)(void))sub_2510F507C);
  uint64_t v150 = v199;
  sub_2510F655C(v129, v199, (uint64_t (*)(void))sub_2510F5570);
  uint64_t v151 = v201;
  sub_2510F655C(v149, v201, (uint64_t (*)(void))sub_2510F507C);
  sub_2510F5048(0);
  sub_2510F655C(v150, v151 + *(int *)(v152 + 48), (uint64_t (*)(void))sub_2510F5570);
  sub_2510F64E4(v129, (uint64_t (*)(void))sub_2510F5570);
  sub_2510F64E4(v148, (uint64_t (*)(void))sub_2510F507C);
  sub_2510F64E4(v150, (uint64_t (*)(void))sub_2510F5570);
  return sub_2510F64E4(v149, (uint64_t (*)(void))sub_2510F507C);
}

uint64_t sub_2510F4C18@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_2510D7DE4();
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_2510FB850();
  uint64_t v6 = v5;
  char v8 = v7;
  uint64_t v9 = a1 + *(int *)(type metadata accessor for MedicationsWidgetRectangularView() + 28);
  uint64_t v10 = *(void *)v9;
  char v11 = *(unsigned char *)(v9 + 8);
  sub_2510F0F08(*(void *)v9, v11);
  char v12 = sub_2510DDE48(v10, v11);
  sub_2510DE804(v10, v11);
  if (v12) {
    sub_2510FB920();
  }
  uint64_t v13 = sub_2510FB820();
  uint64_t v15 = v14;
  char v17 = v16;
  uint64_t v19 = v18;
  swift_release();
  sub_2510EA794(v4, v6, v8 & 1);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v13;
  *(void *)(a2 + 8) = v15;
  *(unsigned char *)(a2 + 16) = v17 & 1;
  *(void *)(a2 + 24) = v19;
  return result;
}

double sub_2510F4D4C@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_2510F4DBC(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, (void (*)(uint64_t, uint64_t))sub_2510F6544, (uint64_t (*)(void))sub_2510F691C).n128_u64[0];
  return result;
}

__n128 sub_2510F4DBC@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, void (*a16)(uint64_t, uint64_t), uint64_t (*a17)(void))
{
  uint64_t v18 = v17;
  uint64_t v20 = a17;
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
    sub_2510FBC60();
    uint64_t v29 = (void *)sub_2510FB790();
    sub_2510FB470();

    uint64_t v20 = a17;
  }
  sub_2510FB570();
  a16(v18, a9);
  uint64_t v30 = (_OWORD *)(a9 + *(int *)(v20(0) + 36));
  v30[4] = v36;
  v30[5] = v37;
  v30[6] = v38;
  *uint64_t v30 = v32;
  v30[1] = v33;
  __n128 result = v35;
  v30[2] = v34;
  v30[3] = v35;
  return result;
}

void sub_2510F4F94()
{
  if (!qword_269B20BD8)
  {
    sub_2510F0EA4(255, &qword_269B20BE0, (uint64_t (*)(uint64_t))sub_2510F5048, MEMORY[0x263F1BAC8]);
    sub_2510F6480(&qword_269B20C88, &qword_269B20BE0, (uint64_t (*)(uint64_t))sub_2510F5048);
    unint64_t v0 = sub_2510FB980();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B20BD8);
    }
  }
}

void sub_2510F5048(uint64_t a1)
{
}

void sub_2510F507C()
{
  if (!qword_269B20BF0)
  {
    sub_2510F50E4();
    sub_2510FB780();
    unint64_t v0 = sub_2510FB540();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B20BF0);
    }
  }
}

void sub_2510F50E4()
{
  if (!qword_269B20BF8)
  {
    sub_2510F5164();
    sub_2510F53B4(255, &qword_269B20C40, &qword_269B20C48, MEMORY[0x263F1B440]);
    unint64_t v0 = sub_2510FB540();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B20BF8);
    }
  }
}

void sub_2510F5164()
{
  if (!qword_269B20C00)
  {
    sub_2510F5250();
    sub_2510F5304(255);
    sub_2510F5884(&qword_269B20C28, sub_2510F5304, (void (*)(void))sub_2510F5420);
    swift_getOpaqueTypeConformance2();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_269B20C00);
    }
  }
}

void sub_2510F5250()
{
  if (!qword_269B20C08)
  {
    sub_2510F5304(255);
    sub_2510F5884(&qword_269B20C28, sub_2510F5304, (void (*)(void))sub_2510F5420);
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_269B20C08);
    }
  }
}

void sub_2510F5304(uint64_t a1)
{
}

void sub_2510F5324()
{
  if (!qword_269B20C18)
  {
    sub_2510F0EA4(255, &qword_269B20C20, MEMORY[0x263F1B548], MEMORY[0x263F1A418]);
    unint64_t v0 = sub_2510FB540();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B20C18);
    }
  }
}

void sub_2510F53B4(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4)
{
  if (!*a2)
  {
    sub_2510F5838(255, a3, a4, MEMORY[0x263F8D8F0]);
    unint64_t v5 = sub_2510FB770();
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

unint64_t sub_2510F5420()
{
  unint64_t result = qword_269B20C30;
  if (!qword_269B20C30)
  {
    sub_2510F5324();
    sub_2510F5498();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B20C30);
  }
  return result;
}

unint64_t sub_2510F5498()
{
  unint64_t result = qword_269B20C38;
  if (!qword_269B20C38)
  {
    sub_2510F0EA4(255, &qword_269B20C20, MEMORY[0x263F1B548], MEMORY[0x263F1A418]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B20C38);
  }
  return result;
}

uint64_t sub_2510F5520(unint64_t *a1, unint64_t *a2, unint64_t *a3, uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2510F53B4(255, a2, a3, a4);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_2510F5570(uint64_t a1)
{
}

void sub_2510F5590()
{
  if (!qword_269B20C60)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_269B20C60);
    }
  }
}

void sub_2510F55F4()
{
  if (!qword_269B20C68)
  {
    sub_2510F56E0();
    sub_2510F5794(255);
    sub_2510F5884(&qword_269B20C80, sub_2510F5794, (void (*)(void))sub_2510F5928);
    swift_getOpaqueTypeConformance2();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_269B20C68);
    }
  }
}

void sub_2510F56E0()
{
  if (!qword_269B20C70)
  {
    sub_2510F5794(255);
    sub_2510F5884(&qword_269B20C80, sub_2510F5794, (void (*)(void))sub_2510F5928);
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_269B20C70);
    }
  }
}

void sub_2510F5794(uint64_t a1)
{
}

void sub_2510F57B4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    sub_2510F53B4(255, &qword_26B215678, &qword_26B215690, MEMORY[0x263F1A738]);
    unint64_t v4 = sub_2510FB540();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_2510F5838(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_2510F5884(unint64_t *a1, void (*a2)(uint64_t), void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    a3();
    sub_2510F5520(&qword_26B215670, &qword_26B215678, &qword_26B215690, MEMORY[0x263F1A738]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2510F5928()
{
  return sub_2510F68D4(&qword_26B215570, sub_2510EA474);
}

void sub_2510F595C(uint64_t a1)
{
}

void sub_2510F597C()
{
  if (!qword_269B20C98)
  {
    sub_2510F0EA4(255, &qword_269B20BE0, (uint64_t (*)(uint64_t))sub_2510F5048, MEMORY[0x263F1BAC8]);
    unint64_t v0 = sub_2510FB530();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B20C98);
    }
  }
}

unint64_t sub_2510F5A14()
{
  unint64_t result = qword_269B20CA0;
  if (!qword_269B20CA0)
  {
    sub_2510F595C(255);
    sub_2510F68D4(&qword_269B20CA8, (void (*)(uint64_t))sub_2510F4F94);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B20CA0);
  }
  return result;
}

uint64_t sub_2510F5ABC(uint64_t a1, uint64_t a2)
{
  return sub_2510F655C(a1, a2, (uint64_t (*)(void))sub_2510F4F94);
}

void sub_2510F5AD4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    sub_2510F0EA4(255, &qword_269B20C58, (uint64_t (*)(uint64_t))sub_2510F5590, MEMORY[0x263F1BAC8]);
    uint64_t v7 = v6;
    sub_2510F55F4();
    unint64_t v9 = a3(a1, v7, v8);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

uint64_t sub_2510F5B74@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2510FB5D0();
  *a1 = result;
  return result;
}

uint64_t sub_2510F5BA0()
{
  return sub_2510FB5E0();
}

uint64_t sub_2510F5BCC()
{
  return sub_2510FB580();
}

uint64_t sub_2510F5BF0(uint64_t a1)
{
  uint64_t v2 = sub_2510FB960();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_2510FB590();
}

uint64_t sub_2510F5CBC(uint64_t a1, uint64_t a2)
{
  sub_2510F0EA4(0, &qword_269B20C20, MEMORY[0x263F1B548], MEMORY[0x263F1A418]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2510F5D50(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_2510F5D60(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  sub_2510F0EA4(0, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  return a1;
}

uint64_t sub_2510F5DBC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2510FB5D0();
  *a1 = result;
  return result;
}

uint64_t sub_2510F5DE8()
{
  return sub_2510FB5E0();
}

uint64_t sub_2510F5E14@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2510FB5A0();
  *a1 = result;
  return result;
}

uint64_t sub_2510F5E40()
{
  return sub_2510FB5B0();
}

unint64_t sub_2510F5E6C()
{
  unint64_t result = qword_269B20CB8;
  if (!qword_269B20CB8)
  {
    sub_2510F50E4();
    sub_2510F5250();
    sub_2510F5304(255);
    sub_2510F5884(&qword_269B20C28, sub_2510F5304, (void (*)(void))sub_2510F5420);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_2510F5520(&qword_269B20CC0, &qword_269B20C40, &qword_269B20C48, MEMORY[0x263F1B440]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B20CB8);
  }
  return result;
}

uint64_t sub_2510F5F9C()
{
  uint64_t v1 = (int *)type metadata accessor for MedicationsWidgetRectangularView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  sub_2510F0EA4(0, &qword_269B20B80, MEMORY[0x263F18FF8], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_2510FB560();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v5 + v1[5];
  sub_2510F0EA4(0, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_2510FBA70();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }
  uint64_t v9 = v5 + v1[6];
  sub_2510F0EA4(0, &qword_26B215558, MEMORY[0x263F1FC90], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_2510FBA60();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }
  sub_2510DE804(*(void *)(v5 + v1[7]), *(unsigned char *)(v5 + v1[7] + 8));
  uint64_t v11 = v5 + v1[8];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v12 = type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v13 = v11 + *(int *)(v12 + 24);
  uint64_t v14 = type metadata accessor for MedmojiIconConfiguration();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48))(v13, 1, v14))
  {
    uint64_t v15 = sub_2510FB420();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v13, v15);
    uint64_t v16 = v13 + *(int *)(v14 + 20);
    uint64_t v17 = sub_2510FB3D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  }
  uint64_t v18 = v11 + *(int *)(v12 + 32);
  uint64_t v19 = sub_2510FB2A0();
  uint64_t v20 = *(void *)(v19 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19)) {
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v18, v19);
  }

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_2510F6398(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2510F6400@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for MedicationsWidgetRectangularView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_2510F4C18(v4, a1);
}

uint64_t sub_2510F6480(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2510F0EA4(255, a2, a3, MEMORY[0x263F1BAC8]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2510F64E4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2510F6544(uint64_t a1, uint64_t a2)
{
  return sub_2510F655C(a1, a2, (uint64_t (*)(void))sub_2510F65C4);
}

uint64_t sub_2510F655C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_2510F65C4()
{
  if (!qword_269B20CD8)
  {
    sub_2510F6658();
    sub_2510F68D4(&qword_269B20D18, (void (*)(uint64_t))sub_2510F6658);
    unint64_t v0 = sub_2510FB980();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B20CD8);
    }
  }
}

void sub_2510F6658()
{
  if (!qword_269B20CE0)
  {
    sub_2510F0EA4(255, &qword_269B20CE8, (uint64_t (*)(uint64_t))sub_2510F670C, MEMORY[0x263F1BAC8]);
    sub_2510F6480(&qword_269B20D10, &qword_269B20CE8, (uint64_t (*)(uint64_t))sub_2510F670C);
    unint64_t v0 = sub_2510FB970();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B20CE0);
    }
  }
}

void sub_2510F670C(uint64_t a1)
{
}

void sub_2510F6740(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t), void (*a4)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    a4(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v7) {
      atomic_store(TupleTypeMetadata2, a2);
    }
  }
}

void sub_2510F67BC()
{
  if (!qword_269B20CF8)
  {
    sub_2510EFC38(255, &qword_269B20D00);
    sub_2510FB780();
    unint64_t v0 = sub_2510FB540();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B20CF8);
    }
  }
}

void sub_2510F6850()
{
  if (!qword_269B20D08)
  {
    sub_2510EFC38(255, &qword_26B2156B8);
    unint64_t v0 = sub_2510FBCE0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B20D08);
    }
  }
}

uint64_t sub_2510F68D4(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_2510F691C(uint64_t a1)
{
}

void sub_2510F693C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_2510FB540();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_2510F6998()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *sub_2510F6A04(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    uint64_t v9 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_2510F6EE4(0, &qword_269B20B80, MEMORY[0x263F18FF8], MEMORY[0x263F185C8]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_2510FB560();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v10 = *(int *)(a3 + 20);
    uint64_t v11 = (uint64_t *)((char *)a1 + v10);
    uint64_t v12 = (uint64_t *)((char *)a2 + v10);
    sub_2510F6EE4(0, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_2510FBA70();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *uint64_t v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v14 = *(int *)(a3 + 24);
    long long v38 = a1;
    uint64_t v15 = (uint64_t *)((char *)a1 + v14);
    uint64_t v16 = (char *)a2 + v14;
    uint64_t v17 = *(uint64_t *)((char *)a2 + v14 + 8);
    *uint64_t v15 = *(uint64_t *)((char *)a2 + v14);
    v15[1] = v17;
    void v15[2] = *(uint64_t *)((char *)a2 + v14 + 16);
    uint64_t v18 = (int *)type metadata accessor for MedicationsWidgetViewModel();
    uint64_t v19 = v18[6];
    __dst = (char *)v15 + v19;
    uint64_t v20 = &v16[v19];
    uint64_t v21 = type metadata accessor for MedmojiIconConfiguration();
    uint64_t v22 = *(void *)(v21 - 8);
    uint64_t v23 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v23(v20, 1, v21))
    {
      sub_2510F6EE4(0, qword_26B2150B0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, MEMORY[0x263F8D8F0]);
      memcpy(__dst, v20, *(void *)(*(void *)(v24 - 8) + 64));
    }
    else
    {
      uint64_t v25 = sub_2510FB420();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(__dst, v20, v25);
      uint64_t v26 = *(int *)(v21 + 20);
      uint64_t v27 = &__dst[v26];
      uint64_t v28 = &v20[v26];
      uint64_t v29 = sub_2510FB3D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 16))(v27, v28, v29);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(__dst, 0, 1, v21);
    }
    *((unsigned char *)v15 + v18[7]) = v16[v18[7]];
    uint64_t v30 = v18[8];
    uint64_t v31 = (char *)v15 + v30;
    long long v32 = &v16[v30];
    uint64_t v33 = sub_2510FB2A0();
    uint64_t v34 = *(void *)(v33 - 8);
    uint64_t v9 = v38;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
    {
      sub_2510F6EE4(0, &qword_26B214D50, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
      memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v31, v32, v33);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
    }
  }
  return v9;
}

void sub_2510F6EE4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_2510F6F48(uint64_t a1, uint64_t a2)
{
  sub_2510F6EE4(0, &qword_269B20B80, MEMORY[0x263F18FF8], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_2510FB560();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  sub_2510F6EE4(0, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_2510FBA70();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v9 = v7 + *(int *)(v8 + 24);
  uint64_t v10 = type metadata accessor for MedmojiIconConfiguration();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v9, 1, v10))
  {
    uint64_t v11 = sub_2510FB420();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v9, v11);
    uint64_t v12 = v9 + *(int *)(v10 + 20);
    uint64_t v13 = sub_2510FB3D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  }
  uint64_t v14 = v7 + *(int *)(v8 + 32);
  uint64_t v15 = sub_2510FB2A0();
  uint64_t v18 = *(void *)(v15 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(v14, 1, v15);
  if (!result)
  {
    uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t))(v18 + 8);
    return v17(v14, v15);
  }
  return result;
}

void *sub_2510F7240(void *a1, void *a2, uint64_t a3)
{
  sub_2510F6EE4(0, &qword_269B20B80, MEMORY[0x263F18FF8], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_2510FB560();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  sub_2510F6EE4(0, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_2510FBA70();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v35 = a1;
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = *(void *)((char *)a2 + v11 + 8);
  *uint64_t v12 = *(void *)((char *)a2 + v11);
  v12[1] = v14;
  v12[2] = *(void *)((char *)a2 + v11 + 16);
  uint64_t v15 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v16 = v15[6];
  __dst = (char *)v12 + v16;
  uint64_t v17 = &v13[v16];
  uint64_t v18 = type metadata accessor for MedmojiIconConfiguration();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v20(v17, 1, v18))
  {
    sub_2510F6EE4(0, qword_26B2150B0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, MEMORY[0x263F8D8F0]);
    memcpy(__dst, v17, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    uint64_t v22 = sub_2510FB420();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(__dst, v17, v22);
    uint64_t v23 = *(int *)(v18 + 20);
    uint64_t v24 = &__dst[v23];
    uint64_t v25 = &v17[v23];
    uint64_t v26 = sub_2510FB3D0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(__dst, 0, 1, v18);
  }
  *((unsigned char *)v12 + v15[7]) = v13[v15[7]];
  uint64_t v27 = v15[8];
  uint64_t v28 = (char *)v12 + v27;
  uint64_t v29 = &v13[v27];
  uint64_t v30 = sub_2510FB2A0();
  uint64_t v31 = *(void *)(v30 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30))
  {
    sub_2510F6EE4(0, &qword_26B214D50, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
    memcpy(v28, v29, *(void *)(*(void *)(v32 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v28, v29, v30);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v28, 0, 1, v30);
  }
  return v35;
}

void *sub_2510F76D0(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = (uint64_t (*)(uint64_t))MEMORY[0x263F18FF8];
    sub_2510F7CD0((uint64_t)a1, &qword_269B20B80, MEMORY[0x263F18FF8]);
    sub_2510F6EE4(0, &qword_269B20B80, v6, MEMORY[0x263F185C8]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_2510FB560();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (void *)((char *)a1 + v8);
    uint64_t v10 = (void *)((char *)a2 + v8);
    uint64_t v11 = (uint64_t (*)(uint64_t))MEMORY[0x263F1FD10];
    sub_2510F7CD0((uint64_t)a1 + v8, &qword_26B215110, MEMORY[0x263F1FD10]);
    sub_2510F6EE4(0, &qword_26B215110, v11, MEMORY[0x263F185C8]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_2510FBA70();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v9, v10, v12);
    }
    else
    {
      void *v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v47 = a1;
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (char *)a2 + v13;
  *uint64_t v14 = *(void *)((char *)a2 + v13);
  v14[1] = *(void *)((char *)a2 + v13 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14[2] = *((void *)v15 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v17 = v16[6];
  uint64_t v18 = (char *)v14 + v17;
  uint64_t v19 = &v15[v17];
  uint64_t v20 = type metadata accessor for MedmojiIconConfiguration();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48);
  int v23 = v22(v18, 1, v20);
  int v24 = v22(v19, 1, v20);
  if (v23)
  {
    if (!v24)
    {
      uint64_t v25 = sub_2510FB420();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(v18, v19, v25);
      uint64_t v26 = *(int *)(v20 + 20);
      uint64_t v27 = &v18[v26];
      uint64_t v28 = &v19[v26];
      uint64_t v29 = sub_2510FB3D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 16))(v27, v28, v29);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (v24)
  {
    sub_2510F964C((uint64_t)v18, (uint64_t (*)(void))type metadata accessor for MedmojiIconConfiguration);
LABEL_14:
    sub_2510F6EE4(0, qword_26B2150B0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, MEMORY[0x263F8D8F0]);
    memcpy(v18, v19, *(void *)(*(void *)(v30 - 8) + 64));
    goto LABEL_15;
  }
  uint64_t v42 = sub_2510FB420();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 24))(v18, v19, v42);
  uint64_t v43 = *(int *)(v20 + 20);
  uint64_t v44 = &v18[v43];
  uint64_t v45 = &v19[v43];
  uint64_t v46 = sub_2510FB3D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 24))(v44, v45, v46);
LABEL_15:
  *((unsigned char *)v14 + v16[7]) = v15[v16[7]];
  uint64_t v31 = v16[8];
  uint64_t v32 = (char *)v14 + v31;
  uint64_t v33 = &v15[v31];
  uint64_t v34 = sub_2510FB2A0();
  uint64_t v35 = *(void *)(v34 - 8);
  long long v36 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v35 + 48);
  int v37 = v36(v32, 1, v34);
  int v38 = v36(v33, 1, v34);
  if (!v37)
  {
    uint64_t v39 = v47;
    if (!v38)
    {
      (*(void (**)(char *, char *, uint64_t))(v35 + 24))(v32, v33, v34);
      return v39;
    }
    (*(void (**)(char *, uint64_t))(v35 + 8))(v32, v34);
    goto LABEL_20;
  }
  uint64_t v39 = v47;
  if (v38)
  {
LABEL_20:
    sub_2510F6EE4(0, &qword_26B214D50, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
    memcpy(v32, v33, *(void *)(*(void *)(v40 - 8) + 64));
    return v39;
  }
  (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v32, v33, v34);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
  return v39;
}

uint64_t sub_2510F7CD0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_2510F6EE4(0, a2, a3, MEMORY[0x263F185C8]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

char *sub_2510F7D40(char *a1, char *a2, uint64_t a3)
{
  sub_2510F6EE4(0, &qword_269B20B80, MEMORY[0x263F18FF8], MEMORY[0x263F185C8]);
  uint64_t v7 = v6;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_2510FB560();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  sub_2510F6EE4(0, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  uint64_t v13 = v12;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = sub_2510FBA70();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v10, v11, v14);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
  }
  uint64_t v15 = *(int *)(a3 + 24);
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  *(_OWORD *)uint64_t v16 = *(_OWORD *)&a2[v15];
  *((void *)v16 + 2) = *(void *)&a2[v15 + 16];
  uint64_t v18 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v19 = v18[6];
  uint64_t v20 = &v16[v19];
  uint64_t v21 = &v17[v19];
  uint64_t v22 = type metadata accessor for MedmojiIconConfiguration();
  uint64_t v23 = *(void *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
  {
    sub_2510F6EE4(0, qword_26B2150B0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, MEMORY[0x263F8D8F0]);
    memcpy(v20, v21, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    uint64_t v25 = sub_2510FB420();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 32))(v20, v21, v25);
    uint64_t v26 = *(int *)(v22 + 20);
    uint64_t v27 = &v20[v26];
    uint64_t v28 = &v21[v26];
    uint64_t v29 = sub_2510FB3D0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 32))(v27, v28, v29);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  }
  v16[v18[7]] = v17[v18[7]];
  uint64_t v30 = v18[8];
  uint64_t v31 = &v16[v30];
  uint64_t v32 = &v17[v30];
  uint64_t v33 = sub_2510FB2A0();
  uint64_t v34 = *(void *)(v33 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
  {
    sub_2510F6EE4(0, &qword_26B214D50, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
    memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v31, v32, v33);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
  }
  return a1;
}

char *sub_2510F81B8(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = (uint64_t (*)(uint64_t))MEMORY[0x263F18FF8];
    sub_2510F7CD0((uint64_t)a1, &qword_269B20B80, MEMORY[0x263F18FF8]);
    sub_2510F6EE4(0, &qword_269B20B80, v6, MEMORY[0x263F185C8]);
    uint64_t v8 = v7;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_2510FB560();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    uint64_t v10 = *(int *)(a3 + 20);
    uint64_t v11 = &a1[v10];
    uint64_t v12 = &a2[v10];
    uint64_t v13 = (uint64_t (*)(uint64_t))MEMORY[0x263F1FD10];
    sub_2510F7CD0((uint64_t)&a1[v10], &qword_26B215110, MEMORY[0x263F1FD10]);
    sub_2510F6EE4(0, &qword_26B215110, v13, MEMORY[0x263F185C8]);
    uint64_t v15 = v14;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v16 = sub_2510FBA70();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v11, v12, v16);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
    }
  }
  uint64_t v17 = *(int *)(a3 + 24);
  uint64_t v52 = a1;
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  uint64_t v20 = *(void *)&a2[v17 + 8];
  *(void *)uint64_t v18 = *(void *)&a2[v17];
  *((void *)v18 + 1) = v20;
  swift_bridgeObjectRelease();
  *((void *)v18 + 2) = *((void *)v19 + 2);
  swift_bridgeObjectRelease();
  uint64_t v21 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v22 = v21[6];
  uint64_t v23 = &v18[v22];
  uint64_t v24 = &v19[v22];
  uint64_t v25 = type metadata accessor for MedmojiIconConfiguration();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v26 + 48);
  int v28 = v27(v23, 1, v25);
  int v29 = v27(v24, 1, v25);
  if (v28)
  {
    if (!v29)
    {
      uint64_t v30 = sub_2510FB420();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 32))(v23, v24, v30);
      uint64_t v31 = *(int *)(v25 + 20);
      uint64_t v32 = &v23[v31];
      uint64_t v33 = &v24[v31];
      uint64_t v34 = sub_2510FB3D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 32))(v32, v33, v34);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (v29)
  {
    sub_2510F964C((uint64_t)v23, (uint64_t (*)(void))type metadata accessor for MedmojiIconConfiguration);
LABEL_13:
    sub_2510F6EE4(0, qword_26B2150B0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, MEMORY[0x263F8D8F0]);
    memcpy(v23, v24, *(void *)(*(void *)(v35 - 8) + 64));
    goto LABEL_14;
  }
  uint64_t v47 = sub_2510FB420();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v47 - 8) + 40))(v23, v24, v47);
  uint64_t v48 = *(int *)(v25 + 20);
  uint64_t v49 = &v23[v48];
  uint64_t v50 = &v24[v48];
  uint64_t v51 = sub_2510FB3D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v51 - 8) + 40))(v49, v50, v51);
LABEL_14:
  v18[v21[7]] = v19[v21[7]];
  uint64_t v36 = v21[8];
  int v37 = &v18[v36];
  int v38 = &v19[v36];
  uint64_t v39 = sub_2510FB2A0();
  uint64_t v40 = *(void *)(v39 - 8);
  uint64_t v41 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v40 + 48);
  int v42 = v41(v37, 1, v39);
  int v43 = v41(v38, 1, v39);
  if (!v42)
  {
    uint64_t v44 = v52;
    if (!v43)
    {
      (*(void (**)(char *, char *, uint64_t))(v40 + 40))(v37, v38, v39);
      return v44;
    }
    (*(void (**)(char *, uint64_t))(v40 + 8))(v37, v39);
    goto LABEL_19;
  }
  uint64_t v44 = v52;
  if (v43)
  {
LABEL_19:
    sub_2510F6EE4(0, &qword_26B214D50, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
    memcpy(v37, v38, *(void *)(*(void *)(v45 - 8) + 64));
    return v44;
  }
  (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v37, v38, v39);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
  return v44;
}

uint64_t sub_2510F87B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2510F87C4);
}

uint64_t sub_2510F87C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2510F6EE4(0, &qword_269B20B78, MEMORY[0x263F18FF8], MEMORY[0x263F185D0]);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  sub_2510F6EE4(0, &qword_26B215568, MEMORY[0x263F1FD10], MEMORY[0x263F185D0]);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  uint64_t v14 = type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + *(int *)(a3 + 24);

  return v15(v17, a2, v16);
}

uint64_t sub_2510F8970(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2510F8984);
}

uint64_t sub_2510F8984(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_2510F6EE4(0, &qword_269B20B78, MEMORY[0x263F18FF8], MEMORY[0x263F185D0]);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  sub_2510F6EE4(0, &qword_26B215568, MEMORY[0x263F1FD10], MEMORY[0x263F185D0]);
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  uint64_t v16 = type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + *(int *)(a4 + 24);

  return v17(v19, a2, a2, v18);
}

uint64_t type metadata accessor for MedicationsWidgetInlineView()
{
  uint64_t result = qword_26B215490;
  if (!qword_26B215490) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2510F8B88()
{
  sub_2510F6EE4(319, &qword_269B20B80, MEMORY[0x263F18FF8], MEMORY[0x263F185C8]);
  if (v0 <= 0x3F)
  {
    sub_2510F6EE4(319, &qword_26B215110, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
    if (v1 <= 0x3F)
    {
      type metadata accessor for MedicationsWidgetViewModel();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t sub_2510F8CEC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2510F8D08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v57 = a2;
  sub_2510F6850();
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v58 = (uint64_t)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v56 = (char *)&v50 - v6;
  uint64_t v7 = sub_2510FBA70();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x263F1B558];
  sub_2510EFC38(0, &qword_269B20D00);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v52 = v12;
  uint64_t v53 = v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v50 - v14;
  sub_2510F67BC();
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  uint64_t v55 = (uint64_t)&v50 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v50 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v50 - v22;
  uint64_t v51 = type metadata accessor for MedicationsWidgetInlineView();
  uint64_t v54 = a1;
  sub_2510DD3CC((uint64_t)v10);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v59 = sub_2510FB950();
  sub_2510FB8B0();
  swift_release();
  if (qword_26B215168 != -1) {
    swift_once();
  }
  uint64_t v59 = sub_2510FB130();
  uint64_t v60 = v24;
  sub_2510D7DE4();
  uint64_t v25 = sub_2510FB850();
  uint64_t v27 = v26;
  char v29 = v28 & 1;
  uint64_t v59 = MEMORY[0x263F1B570];
  uint64_t v60 = v11;
  swift_getOpaqueTypeConformance2();
  uint64_t v30 = v52;
  sub_2510FB8E0();
  sub_2510EA794(v25, v27, v29);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v15, v30);
  sub_2510F9580((uint64_t)v21, (uint64_t)v23);
  uint64_t v31 = *(void *)(v54 + *(int *)(v51 + 24) + 16);
  uint64_t v32 = *(void *)(v31 + 16);
  uint64_t v33 = (uint64_t)v23;
  if (v32)
  {
    uint64_t v34 = v31 + 16 * v32;
    uint64_t v35 = *(void *)(v34 + 24);
    uint64_t v59 = *(void *)(v34 + 16);
    uint64_t v60 = v35;
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_2510FB850();
    uint64_t v38 = v37;
    uint64_t v59 = v36;
    uint64_t v60 = v37;
    char v40 = v39 & 1;
    char v61 = v39 & 1;
    uint64_t v62 = v41;
    uint64_t v42 = (uint64_t)v56;
    sub_2510FB8D0();
    sub_2510EA794(v36, v38, v40);
    swift_bridgeObjectRelease();
    sub_2510EFC38(0, &qword_26B2156B8);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v42, 0, 1, v43);
  }
  else
  {
    sub_2510EFC38(0, &qword_26B2156B8);
    uint64_t v42 = (uint64_t)v56;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v56, 1, 1, v44);
  }
  uint64_t v45 = v55;
  sub_2510F95E4(v33, v55, (uint64_t (*)(void))sub_2510F67BC);
  uint64_t v46 = v58;
  sub_2510F95E4(v42, v58, (uint64_t (*)(void))sub_2510F6850);
  uint64_t v47 = v57;
  sub_2510F95E4(v45, v57, (uint64_t (*)(void))sub_2510F67BC);
  sub_2510F670C(0);
  sub_2510F95E4(v46, v47 + *(int *)(v48 + 48), (uint64_t (*)(void))sub_2510F6850);
  sub_2510F964C(v42, (uint64_t (*)(void))sub_2510F6850);
  sub_2510F964C(v33, (uint64_t (*)(void))sub_2510F67BC);
  sub_2510F964C(v46, (uint64_t (*)(void))sub_2510F6850);
  return sub_2510F964C(v45, (uint64_t (*)(void))sub_2510F67BC);
}

uint64_t sub_2510F935C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  sub_2510F65C4();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v6 = sub_2510FB6F0();
  *((void *)v6 + 1) = 0;
  v6[16] = 1;
  sub_2510F9480();
  uint64_t v8 = &v6[*(int *)(v7 + 44)];
  *(void *)uint64_t v8 = sub_2510FB670();
  *((void *)v8 + 1) = 0;
  v8[16] = 1;
  sub_2510F94E8();
  sub_2510F8D08(v2, (uint64_t)&v8[*(int *)(v9 + 44)]);
  uint64_t v10 = sub_2510FB9D0();
  sub_2510F4D4C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, a1, 0.0, 1, 0.0, 1, v10, v11);
  return sub_2510F964C((uint64_t)v6, (uint64_t (*)(void))sub_2510F65C4);
}

void sub_2510F9480()
{
  if (!qword_269B20D28)
  {
    sub_2510F6658();
    unint64_t v0 = sub_2510FB530();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B20D28);
    }
  }
}

void sub_2510F94E8()
{
  if (!qword_269B20D30)
  {
    sub_2510F6EE4(255, &qword_269B20CE8, (uint64_t (*)(uint64_t))sub_2510F670C, MEMORY[0x263F1BAC8]);
    unint64_t v0 = sub_2510FB530();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B20D30);
    }
  }
}

uint64_t sub_2510F9580(uint64_t a1, uint64_t a2)
{
  sub_2510F67BC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2510F95E4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2510F964C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_2510F96B0()
{
  unint64_t result = qword_269B20D38;
  if (!qword_269B20D38)
  {
    sub_2510F691C(255);
    sub_2510F9758((unint64_t *)&unk_269B20D40, (void (*)(uint64_t))sub_2510F65C4);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B20D38);
  }
  return result;
}

uint64_t sub_2510F9758(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *sub_2510F97A0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2510FB2A0();
    uint64_t v33 = *(void *)(v7 - 8);
    uint64_t v34 = v7;
    uint64_t v30 = *(void (**)(uint64_t *, uint64_t *))(v33 + 16);
    v30(a1, a2);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = *(uint64_t *)((char *)a2 + v8 + 8);
    void *v9 = *(uint64_t *)((char *)a2 + v8);
    v9[1] = v11;
    v9[2] = *(uint64_t *)((char *)a2 + v8 + 16);
    uint64_t v12 = type metadata accessor for MedicationsWidgetViewModel();
    uint64_t v13 = *(int *)(v12 + 24);
    __dst = (char *)v9 + v13;
    uint64_t v32 = v12;
    uint64_t v14 = &v10[v13];
    uint64_t v15 = type metadata accessor for MedmojiIconConfiguration();
    uint64_t v16 = *(void *)(v15 - 8);
    uint64_t v17 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v17(v14, 1, v15))
    {
      sub_2510D5408(0, qword_26B2150B0, (void (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration);
      memcpy(__dst, v14, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      uint64_t v20 = sub_2510FB420();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(__dst, v14, v20);
      uint64_t v21 = *(int *)(v15 + 20);
      uint64_t v22 = &__dst[v21];
      uint64_t v23 = &v14[v21];
      uint64_t v24 = sub_2510FB3D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(__dst, 0, 1, v15);
    }
    *((unsigned char *)v9 + *(int *)(v32 + 28)) = v10[*(int *)(v32 + 28)];
    uint64_t v25 = *(int *)(v32 + 32);
    uint64_t v26 = (char *)v9 + v25;
    uint64_t v27 = &v10[v25];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(&v10[v25], 1, v34))
    {
      sub_2510D5408(0, &qword_26B214D50, MEMORY[0x263F07490]);
      memcpy(v26, v27, *(void *)(*(void *)(v28 - 8) + 64));
    }
    else
    {
      ((void (*)(char *, char *, uint64_t))v30)(v26, v27, v34);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v26, 0, 1, v34);
    }
  }
  return a1;
}

uint64_t sub_2510F9B0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2510FB2A0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v15(a1, v4);
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v8 = v6 + *(int *)(v7 + 24);
  uint64_t v9 = type metadata accessor for MedmojiIconConfiguration();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v8, 1, v9))
  {
    uint64_t v10 = sub_2510FB420();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v8, v10);
    uint64_t v11 = v8 + *(int *)(v9 + 20);
    uint64_t v12 = sub_2510FB3D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  }
  uint64_t v13 = v6 + *(int *)(v7 + 32);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v13, 1, v4);
  if (!result)
  {
    return ((uint64_t (*)(uint64_t, uint64_t))v15)(v13, v4);
  }
  return result;
}

uint64_t sub_2510F9D00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2510FB2A0();
  uint64_t v30 = *(void *)(v6 - 8);
  uint64_t v31 = v6;
  uint64_t v28 = *(void (**)(uint64_t, uint64_t))(v30 + 16);
  v28(a1, a2);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a2 + v7 + 8);
  *uint64_t v8 = *(void *)(a2 + v7);
  v8[1] = v10;
  v8[2] = *(void *)(a2 + v7 + 16);
  uint64_t v11 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v12 = v11[6];
  __dst = (char *)v8 + v12;
  uint64_t v13 = (char *)(v9 + v12);
  uint64_t v14 = type metadata accessor for MedmojiIconConfiguration();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v16(v13, 1, v14))
  {
    sub_2510D5408(0, qword_26B2150B0, (void (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration);
    memcpy(__dst, v13, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    uint64_t v18 = sub_2510FB420();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(__dst, v13, v18);
    uint64_t v19 = *(int *)(v14 + 20);
    uint64_t v20 = &__dst[v19];
    uint64_t v21 = &v13[v19];
    uint64_t v22 = sub_2510FB3D0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(__dst, 0, 1, v14);
  }
  *((unsigned char *)v8 + v11[7]) = *(unsigned char *)(v9 + v11[7]);
  uint64_t v23 = v11[8];
  uint64_t v24 = (char *)v8 + v23;
  uint64_t v25 = (const void *)(v9 + v23);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v30 + 48))(v9 + v23, 1, v31))
  {
    sub_2510D5408(0, &qword_26B214D50, MEMORY[0x263F07490]);
    memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    ((void (*)(char *, const void *, uint64_t))v28)(v24, v25, v31);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v24, 0, 1, v31);
  }
  return a1;
}

uint64_t sub_2510FA020(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2510FB2A0();
  uint64_t v39 = *(void *)(v6 - 8);
  uint64_t v40 = v6;
  uint64_t v38 = *(void (**)(uint64_t, uint64_t))(v39 + 24);
  v38(a1, a2);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  *uint64_t v8 = *(void *)(a2 + v7);
  v8[1] = *(void *)(a2 + v7 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[2] = *(void *)(v9 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v11 = v10[6];
  uint64_t v12 = (char *)v8 + v11;
  uint64_t v13 = (char *)(v9 + v11);
  uint64_t v14 = type metadata accessor for MedmojiIconConfiguration();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48);
  int v17 = v16(v12, 1, v14);
  int v18 = v16(v13, 1, v14);
  if (v17)
  {
    if (!v18)
    {
      uint64_t v19 = sub_2510FB420();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v12, v13, v19);
      uint64_t v20 = *(int *)(v14 + 20);
      uint64_t v21 = &v12[v20];
      uint64_t v22 = &v13[v20];
      uint64_t v23 = sub_2510FB3D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v18)
  {
    sub_2510D5CC4((uint64_t)v12);
LABEL_6:
    sub_2510D5408(0, qword_26B2150B0, (void (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration);
    memcpy(v12, v13, *(void *)(*(void *)(v24 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v33 = sub_2510FB420();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 24))(v12, v13, v33);
  uint64_t v34 = *(int *)(v14 + 20);
  uint64_t v35 = &v12[v34];
  uint64_t v36 = &v13[v34];
  uint64_t v37 = sub_2510FB3D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 24))(v35, v36, v37);
LABEL_7:
  *((unsigned char *)v8 + v10[7]) = *(unsigned char *)(v9 + v10[7]);
  uint64_t v25 = v10[8];
  uint64_t v26 = (char *)v8 + v25;
  uint64_t v27 = (char *)(v9 + v25);
  uint64_t v28 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v39 + 48);
  int v29 = v28((char *)v8 + v25, 1, v40);
  int v30 = v28(v27, 1, v40);
  if (!v29)
  {
    if (!v30)
    {
      ((void (*)(char *, char *, uint64_t))v38)(v26, v27, v40);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v39 + 8))(v26, v40);
    goto LABEL_12;
  }
  if (v30)
  {
LABEL_12:
    sub_2510D5408(0, &qword_26B214D50, MEMORY[0x263F07490]);
    memcpy(v26, v27, *(void *)(*(void *)(v31 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v26, v27, v40);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v39 + 56))(v26, 0, 1, v40);
  return a1;
}

uint64_t sub_2510FA464(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2510FB2A0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32);
  v31(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(_OWORD *)uint64_t v9 = *(_OWORD *)(a2 + v8);
  *(void *)(v9 + 16) = *(void *)(a2 + v8 + 16);
  uint64_t v11 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v12 = v11[6];
  uint64_t v13 = (char *)(v9 + v12);
  uint64_t v14 = (char *)(v10 + v12);
  uint64_t v15 = type metadata accessor for MedmojiIconConfiguration();
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    sub_2510D5408(0, qword_26B2150B0, (void (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    uint64_t v18 = sub_2510FB420();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v13, v14, v18);
    uint64_t v19 = *(int *)(v15 + 20);
    uint64_t v30 = a1;
    uint64_t v20 = v7;
    uint64_t v21 = &v13[v19];
    uint64_t v22 = &v14[v19];
    uint64_t v23 = sub_2510FB3D0();
    uint64_t v24 = v21;
    uint64_t v7 = v20;
    a1 = v30;
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32))(v24, v22, v23);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  *(unsigned char *)(v9 + v11[7]) = *(unsigned char *)(v10 + v11[7]);
  uint64_t v25 = v11[8];
  uint64_t v26 = (void *)(v9 + v25);
  uint64_t v27 = (const void *)(v10 + v25);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v10 + v25, 1, v6))
  {
    sub_2510D5408(0, &qword_26B214D50, MEMORY[0x263F07490]);
    memcpy(v26, v27, *(void *)(*(void *)(v28 - 8) + 64));
  }
  else
  {
    v31((uint64_t)v26, (uint64_t)v27, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(v26, 0, 1, v6);
  }
  return a1;
}

uint64_t sub_2510FA774(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2510FB2A0();
  uint64_t v40 = *(void *)(v6 - 8);
  uint64_t v41 = v6;
  uint64_t v39 = *(void (**)(uint64_t, uint64_t))(v40 + 40);
  v39(a1, a2);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a2 + v7 + 8);
  *uint64_t v8 = *(void *)(a2 + v7);
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v8[2] = *(void *)(v9 + 16);
  swift_bridgeObjectRelease();
  uint64_t v11 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  uint64_t v12 = v11[6];
  uint64_t v13 = (char *)v8 + v12;
  uint64_t v14 = (char *)(v9 + v12);
  uint64_t v15 = type metadata accessor for MedmojiIconConfiguration();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (v18)
  {
    if (!v19)
    {
      uint64_t v20 = sub_2510FB420();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v13, v14, v20);
      uint64_t v21 = *(int *)(v15 + 20);
      uint64_t v22 = &v13[v21];
      uint64_t v23 = &v14[v21];
      uint64_t v24 = sub_2510FB3D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v22, v23, v24);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v19)
  {
    sub_2510D5CC4((uint64_t)v13);
LABEL_6:
    sub_2510D5408(0, qword_26B2150B0, (void (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration);
    memcpy(v13, v14, *(void *)(*(void *)(v25 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v34 = sub_2510FB420();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 40))(v13, v14, v34);
  uint64_t v35 = *(int *)(v15 + 20);
  uint64_t v36 = &v13[v35];
  uint64_t v37 = &v14[v35];
  uint64_t v38 = sub_2510FB3D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 40))(v36, v37, v38);
LABEL_7:
  *((unsigned char *)v8 + v11[7]) = *(unsigned char *)(v9 + v11[7]);
  uint64_t v26 = v11[8];
  uint64_t v27 = (char *)v8 + v26;
  uint64_t v28 = (char *)(v9 + v26);
  int v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v40 + 48);
  int v30 = v29((char *)v8 + v26, 1, v41);
  int v31 = v29(v28, 1, v41);
  if (!v30)
  {
    if (!v31)
    {
      ((void (*)(char *, char *, uint64_t))v39)(v27, v28, v41);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v40 + 8))(v27, v41);
    goto LABEL_12;
  }
  if (v31)
  {
LABEL_12:
    sub_2510D5408(0, &qword_26B214D50, MEMORY[0x263F07490]);
    memcpy(v27, v28, *(void *)(*(void *)(v32 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v27, v28, v41);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(v27, 0, 1, v41);
  return a1;
}

uint64_t sub_2510FABA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2510FABB4);
}

uint64_t sub_2510FABB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2510FB2A0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = type metadata accessor for MedicationsWidgetViewModel();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_2510FACAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2510FACC0);
}

uint64_t sub_2510FACC0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_2510FB2A0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = type metadata accessor for MedicationsWidgetViewModel();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t type metadata accessor for MedicationsWidgetEntry()
{
  uint64_t result = qword_26B214EB0;
  if (!qword_26B214EB0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2510FAE10()
{
  uint64_t result = sub_2510FB2A0();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for MedicationsWidgetViewModel();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_2510FAED8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2510FB2A0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_2510FAF40@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for MedicationsWidgetViewModel();
  sub_2510FBAE0();
  uint64_t v2 = sub_2510FBAF0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(a1, 0, 1, v2);
}

uint64_t sub_2510FAFDC()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_2510FB010()
{
  return MEMORY[0x270EEE098]();
}

uint64_t sub_2510FB020()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_2510FB030()
{
  return MEMORY[0x270EEE9F8]();
}

uint64_t sub_2510FB040()
{
  return MEMORY[0x270EEEA00]();
}

uint64_t sub_2510FB050()
{
  return MEMORY[0x270EEEA40]();
}

uint64_t sub_2510FB060()
{
  return MEMORY[0x270EEEA48]();
}

uint64_t sub_2510FB070()
{
  return MEMORY[0x270EEEA50]();
}

uint64_t sub_2510FB080()
{
  return MEMORY[0x270EEEA90]();
}

uint64_t sub_2510FB090()
{
  return MEMORY[0x270EEEAE8]();
}

uint64_t sub_2510FB0A0()
{
  return MEMORY[0x270EEEC70]();
}

uint64_t sub_2510FB0B0()
{
  return MEMORY[0x270EEEC90]();
}

uint64_t sub_2510FB0C0()
{
  return MEMORY[0x270EEECA8]();
}

uint64_t sub_2510FB0D0()
{
  return MEMORY[0x270EEECC0]();
}

uint64_t sub_2510FB0E0()
{
  return MEMORY[0x270EEECD0]();
}

uint64_t sub_2510FB0F0()
{
  return MEMORY[0x270EEECF8]();
}

uint64_t sub_2510FB100()
{
  return MEMORY[0x270EEED18]();
}

uint64_t sub_2510FB110()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_2510FB120()
{
  return MEMORY[0x270EEEE28]();
}

uint64_t sub_2510FB130()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_2510FB140()
{
  return MEMORY[0x270EEF030]();
}

uint64_t sub_2510FB150()
{
  return MEMORY[0x270EEF070]();
}

uint64_t sub_2510FB160()
{
  return MEMORY[0x270EEF160]();
}

uint64_t sub_2510FB170()
{
  return MEMORY[0x270EEF1B8]();
}

uint64_t sub_2510FB180()
{
  return MEMORY[0x270EEF9F0]();
}

uint64_t sub_2510FB190()
{
  return MEMORY[0x270EEFA00]();
}

uint64_t sub_2510FB1A0()
{
  return MEMORY[0x270EEFB78]();
}

uint64_t sub_2510FB1B0()
{
  return MEMORY[0x270EEFB88]();
}

uint64_t sub_2510FB1C0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_2510FB1D0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2510FB1E0()
{
  return MEMORY[0x270EF02E0]();
}

uint64_t sub_2510FB1F0()
{
  return MEMORY[0x270EF0310]();
}

uint64_t sub_2510FB200()
{
  return MEMORY[0x270EF0320]();
}

uint64_t sub_2510FB210()
{
  return MEMORY[0x270EF0360]();
}

uint64_t sub_2510FB220()
{
  return MEMORY[0x270EF03C0]();
}

uint64_t sub_2510FB230()
{
  return MEMORY[0x270EF03F8]();
}

uint64_t sub_2510FB240()
{
  return MEMORY[0x270EF0428]();
}

uint64_t sub_2510FB250()
{
  return MEMORY[0x270EF06E0]();
}

uint64_t sub_2510FB260()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_2510FB270()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_2510FB280()
{
  return MEMORY[0x270EF09E0]();
}

uint64_t sub_2510FB290()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_2510FB2A0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2510FB2B0()
{
  return MEMORY[0x270EF0EE0]();
}

uint64_t sub_2510FB2C0()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_2510FB2D0()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_2510FB2E0()
{
  return MEMORY[0x270EF1098]();
}

uint64_t sub_2510FB2F0()
{
  return MEMORY[0x270EF10A0]();
}

uint64_t sub_2510FB300()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_2510FB310()
{
  return MEMORY[0x270EF1100]();
}

uint64_t sub_2510FB320()
{
  return MEMORY[0x270EF12E0]();
}

uint64_t sub_2510FB330()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_2510FB340()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_2510FB350()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_2510FB360()
{
  return MEMORY[0x270EF15D0]();
}

uint64_t sub_2510FB370()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_2510FB380()
{
  return MEMORY[0x270F353B8]();
}

uint64_t sub_2510FB390()
{
  return MEMORY[0x270F353C0]();
}

uint64_t sub_2510FB3A0()
{
  return MEMORY[0x270F353C8]();
}

uint64_t sub_2510FB3B0()
{
  return MEMORY[0x270F353D0]();
}

uint64_t sub_2510FB3C0()
{
  return MEMORY[0x270F353D8]();
}

uint64_t sub_2510FB3D0()
{
  return MEMORY[0x270F353E0]();
}

uint64_t sub_2510FB3E0()
{
  return MEMORY[0x270F35498]();
}

uint64_t sub_2510FB3F0()
{
  return MEMORY[0x270F354A0]();
}

uint64_t sub_2510FB400()
{
  return MEMORY[0x270F354A8]();
}

uint64_t sub_2510FB410()
{
  return MEMORY[0x270F35520]();
}

uint64_t sub_2510FB420()
{
  return MEMORY[0x270F35528]();
}

uint64_t sub_2510FB430()
{
  return MEMORY[0x270F35550]();
}

uint64_t sub_2510FB440()
{
  return MEMORY[0x270F35558]();
}

uint64_t sub_2510FB450()
{
  return MEMORY[0x270F35560]();
}

uint64_t sub_2510FB460()
{
  return MEMORY[0x270F355E8]();
}

uint64_t sub_2510FB470()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_2510FB480()
{
  return MEMORY[0x270F356A0]();
}

uint64_t sub_2510FB490()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2510FB4A0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2510FB4B0()
{
  return MEMORY[0x270EE3888]();
}

uint64_t sub_2510FB4C0()
{
  return MEMORY[0x270EE3900]();
}

uint64_t sub_2510FB4D0()
{
  return MEMORY[0x270EE3A50]();
}

uint64_t sub_2510FB4E0()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t sub_2510FB4F0()
{
  return MEMORY[0x270EE3E98]();
}

uint64_t sub_2510FB500()
{
  return MEMORY[0x270EE3EB0]();
}

uint64_t sub_2510FB510()
{
  return MEMORY[0x270EE3F80]();
}

uint64_t sub_2510FB520()
{
  return MEMORY[0x270EE3FF0]();
}

uint64_t sub_2510FB530()
{
  return MEMORY[0x270EFF918]();
}

uint64_t sub_2510FB540()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_2510FB550()
{
  return MEMORY[0x270F00560]();
}

uint64_t sub_2510FB560()
{
  return MEMORY[0x270F00578]();
}

uint64_t sub_2510FB570()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_2510FB580()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_2510FB590()
{
  return MEMORY[0x270F00868]();
}

uint64_t sub_2510FB5A0()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_2510FB5B0()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_2510FB5C0()
{
  return MEMORY[0x270F00AC8]();
}

uint64_t sub_2510FB5D0()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_2510FB5E0()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_2510FB5F0()
{
  return MEMORY[0x270F07348]();
}

uint64_t sub_2510FB600()
{
  return MEMORY[0x270F07370]();
}

uint64_t sub_2510FB610()
{
  return MEMORY[0x270F073D8]();
}

uint64_t sub_2510FB620()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_2510FB630()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_2510FB640()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_2510FB650()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_2510FB660()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_2510FB670()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_2510FB680()
{
  return MEMORY[0x270F01218]();
}

uint64_t sub_2510FB690()
{
  return MEMORY[0x270F01228]();
}

uint64_t sub_2510FB6A0()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_2510FB6B0()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_2510FB6C0()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_2510FB6D0()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_2510FB6E0()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_2510FB6F0()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_2510FB700()
{
  return MEMORY[0x270F073F8]();
}

uint64_t sub_2510FB710()
{
  return MEMORY[0x270F07400]();
}

uint64_t sub_2510FB720()
{
  return MEMORY[0x270F07410]();
}

uint64_t sub_2510FB730()
{
  return MEMORY[0x270F017B8]();
}

uint64_t sub_2510FB740()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_2510FB750()
{
  return MEMORY[0x270F07428]();
}

uint64_t sub_2510FB760()
{
  return MEMORY[0x270F025F0]();
}

uint64_t sub_2510FB770()
{
  return MEMORY[0x270F02798]();
}

uint64_t sub_2510FB780()
{
  return MEMORY[0x270F027A8]();
}

uint64_t sub_2510FB790()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_2510FB7A0()
{
  return MEMORY[0x270F029F0]();
}

uint64_t sub_2510FB7B0()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_2510FB7C0()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_2510FB7D0()
{
  return MEMORY[0x270F02B90]();
}

uint64_t sub_2510FB7E0()
{
  return MEMORY[0x270F02BF8]();
}

uint64_t sub_2510FB7F0()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t sub_2510FB800()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_2510FB810()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_2510FB820()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_2510FB830()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_2510FB840()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_2510FB850()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_2510FB860()
{
  return MEMORY[0x270F07430]();
}

uint64_t sub_2510FB870()
{
  return MEMORY[0x270F07438]();
}

uint64_t sub_2510FB880()
{
  return MEMORY[0x270F07458]();
}

uint64_t sub_2510FB890()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_2510FB8A0()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_2510FB8B0()
{
  return MEMORY[0x270F03408]();
}

uint64_t sub_2510FB8C0()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_2510FB8D0()
{
  return MEMORY[0x270F038B8]();
}

uint64_t sub_2510FB8E0()
{
  return MEMORY[0x270F039A0]();
}

uint64_t sub_2510FB8F0()
{
  return MEMORY[0x270F03B20]();
}

uint64_t sub_2510FB900()
{
  return MEMORY[0x270F04258]();
}

uint64_t sub_2510FB910()
{
  return MEMORY[0x270F04408]();
}

uint64_t sub_2510FB920()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_2510FB930()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_2510FB940()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_2510FB950()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_2510FB960()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_2510FB970()
{
  return MEMORY[0x270F04960]();
}

uint64_t sub_2510FB980()
{
  return MEMORY[0x270F04AF8]();
}

uint64_t sub_2510FB990()
{
  return MEMORY[0x270F04B10]();
}

uint64_t sub_2510FB9A0()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_2510FB9B0()
{
  return MEMORY[0x270F04CC0]();
}

uint64_t sub_2510FB9C0()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_2510FB9D0()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_2510FB9E0()
{
  return MEMORY[0x270EE3138]();
}

uint64_t sub_2510FB9F0()
{
  return MEMORY[0x270EE3140]();
}

uint64_t sub_2510FBA00()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2510FBA10()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2510FBA20()
{
  return MEMORY[0x270F07498]();
}

uint64_t sub_2510FBA30()
{
  return MEMORY[0x270F074A0]();
}

uint64_t sub_2510FBA40()
{
  return MEMORY[0x270F07550]();
}

uint64_t sub_2510FBA50()
{
  return MEMORY[0x270F07558]();
}

uint64_t sub_2510FBA60()
{
  return MEMORY[0x270F07570]();
}

uint64_t sub_2510FBA70()
{
  return MEMORY[0x270F07608]();
}

uint64_t sub_2510FBAA0()
{
  return MEMORY[0x270F07788]();
}

uint64_t sub_2510FBAB0()
{
  return MEMORY[0x270F07790]();
}

uint64_t sub_2510FBAC0()
{
  return MEMORY[0x270F077A8]();
}

uint64_t sub_2510FBAD0()
{
  return MEMORY[0x270F077B8]();
}

uint64_t sub_2510FBAE0()
{
  return MEMORY[0x270F07848]();
}

uint64_t sub_2510FBAF0()
{
  return MEMORY[0x270F07850]();
}

uint64_t sub_2510FBB00()
{
  return MEMORY[0x270F078B0]();
}

uint64_t sub_2510FBB10()
{
  return MEMORY[0x270F078C0]();
}

uint64_t sub_2510FBB20()
{
  return MEMORY[0x270F079F0]();
}

uint64_t sub_2510FBB30()
{
  return MEMORY[0x270F079F8]();
}

uint64_t sub_2510FBB40()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2510FBB50()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2510FBB60()
{
  return MEMORY[0x270EF19B8]();
}

uint64_t sub_2510FBB70()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2510FBB80()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2510FBB90()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2510FBBA0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2510FBBB0()
{
  return MEMORY[0x270F9D898]();
}

uint64_t sub_2510FBBC0()
{
  return MEMORY[0x270F9D8D8]();
}

uint64_t sub_2510FBBD0()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_2510FBBE0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2510FBBF0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_2510FBC00()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_2510FBC10()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_2510FBC20()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_2510FBC30()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_2510FBC40()
{
  return MEMORY[0x270F9E330]();
}

uint64_t sub_2510FBC50()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2510FBC60()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_2510FBC70()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2510FBC80()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_2510FBC90()
{
  return MEMORY[0x270FA0CD0]();
}

uint64_t sub_2510FBCA0()
{
  return MEMORY[0x270FA0D00]();
}

uint64_t sub_2510FBCB0()
{
  return MEMORY[0x270FA0D20]();
}

uint64_t sub_2510FBCC0()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_2510FBCD0()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_2510FBCE0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2510FBCF0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2510FBD00()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2510FBD10()
{
  return MEMORY[0x270EF2470]();
}

uint64_t sub_2510FBD20()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_2510FBD30()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_2510FBD40()
{
  return MEMORY[0x270F9E730]();
}

uint64_t sub_2510FBD50()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2510FBD60()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2510FBD70()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2510FBD80()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2510FBD90()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2510FBDA0()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_2510FBDB0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2510FBDC0()
{
  return MEMORY[0x270F9ED90]();
}

uint64_t sub_2510FBDD0()
{
  return MEMORY[0x270F9EDA8]();
}

uint64_t sub_2510FBDE0()
{
  return MEMORY[0x270F9EDB0]();
}

uint64_t sub_2510FBDF0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2510FBE00()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2510FBE10()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2510FBE20()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2510FBE30()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_2510FBE40()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2510FBE50()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_2510FBE60()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2510FBE70()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2510FBE80()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2510FBE90()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2510FBEA0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2510FBEB0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2510FBEC0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2510FBED0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2510FBEE0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2510FBEF0()
{
  return MEMORY[0x270FA0128]();
}

uint64_t HKMedicationsRoomDeepLink()
{
  return MEMORY[0x270F352D8]();
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
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x270FA0358]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x270FA03F8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}