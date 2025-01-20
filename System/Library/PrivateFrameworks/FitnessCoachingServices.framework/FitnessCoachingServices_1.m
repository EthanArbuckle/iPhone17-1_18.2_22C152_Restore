uint64_t sub_1D3C1166C(uint64_t *a1, uint64_t (*a2)(id, id))
{
  uint64_t v4;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v8[2];

  v4 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v4;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    sub_1D3BCE9D8();
  }
  v6 = *(void *)(v4 + 16);
  v8[0] = v4 + 32;
  v8[1] = v6;
  sub_1D3C10EA8(v8, a2);
  return sub_1D3C2F760();
}

uint64_t sub_1D3C11700(id *a1, void **a2)
{
  return sub_1D3C0FAF8(a1, a2) & 1;
}

ValueMetadata *type metadata accessor for FirstGlanceWorkoutProvider()
{
  return &type metadata for FirstGlanceWorkoutProvider;
}

void *sub_1D3C11730(uint64_t a1, uint64_t *a2, int *a3)
{
  v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v28 = *a2;
    void *v4 = *a2;
    v4 = (void *)(v28 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    uint64_t v8 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v8;
    uint64_t v9 = a2[4];
    uint64_t v10 = a2[5];
    *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
    uint64_t v11 = a3[8];
    uint64_t v36 = a1 + v11;
    uint64_t v12 = (uint64_t)a2 + v11;
    *(void *)(a1 + 32) = v9;
    *(void *)(a1 + 40) = v10;
    uint64_t v13 = sub_1D3C2E3F0();
    v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v36, v12, v13);
    uint64_t v15 = a3[9];
    uint64_t v16 = a3[10];
    v17 = (void *)((char *)v4 + v15);
    v18 = (uint64_t *)((char *)a2 + v15);
    uint64_t v19 = v18[1];
    void *v17 = *v18;
    v17[1] = v19;
    *((unsigned char *)v4 + v16) = *((unsigned char *)a2 + v16);
    uint64_t v20 = a3[11];
    uint64_t v21 = a3[12];
    v22 = (void *)((char *)v4 + v20);
    v23 = (uint64_t *)((char *)a2 + v20);
    uint64_t v24 = v23[1];
    void *v22 = *v23;
    v22[1] = v24;
    v25 = (char *)v4 + v21;
    v26 = (uint64_t *)((char *)a2 + v21);
    unint64_t v27 = *(uint64_t *)((char *)a2 + v21 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v27 >> 60 == 15)
    {
      *(_OWORD *)v25 = *(_OWORD *)v26;
    }
    else
    {
      uint64_t v29 = *v26;
      sub_1D3B9778C(*v26, v27);
      *(void *)v25 = v29;
      *((void *)v25 + 1) = v27;
    }
    uint64_t v30 = a3[13];
    uint64_t v31 = a3[14];
    v32 = (void *)((char *)v4 + v30);
    v33 = (uint64_t *)((char *)a2 + v30);
    uint64_t v34 = v33[1];
    void *v32 = *v33;
    v32[1] = v34;
    *((unsigned char *)v4 + v31) = *((unsigned char *)a2 + v31);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_1D3C118F0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = sub_1D3C2E3F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6 = (uint64_t *)(a1 + *(int *)(a2 + 48));
  unint64_t v7 = v6[1];
  if (v7 >> 60 != 15) {
    sub_1D3B97734(*v6, v7);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D3C119D0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v10 = a3[8];
  uint64_t v34 = a1 + v10;
  uint64_t v11 = a2 + v10;
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  uint64_t v12 = sub_1D3C2E3F0();
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13(v34, v11, v12);
  uint64_t v14 = a3[9];
  uint64_t v15 = a3[10];
  uint64_t v16 = (void *)(a1 + v14);
  v17 = (void *)(a2 + v14);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  *(unsigned char *)(a1 + v15) = *(unsigned char *)(a2 + v15);
  uint64_t v19 = a3[11];
  uint64_t v20 = a3[12];
  uint64_t v21 = (void *)(a1 + v19);
  v22 = (void *)(a2 + v19);
  uint64_t v23 = v22[1];
  *uint64_t v21 = *v22;
  v21[1] = v23;
  uint64_t v24 = a1 + v20;
  v25 = (uint64_t *)(a2 + v20);
  unint64_t v26 = *(void *)(a2 + v20 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v26 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
  }
  else
  {
    uint64_t v27 = *v25;
    sub_1D3B9778C(*v25, v26);
    *(void *)uint64_t v24 = v27;
    *(void *)(v24 + 8) = v26;
  }
  uint64_t v28 = a3[13];
  uint64_t v29 = a3[14];
  uint64_t v30 = (void *)(a1 + v28);
  uint64_t v31 = (void *)(a2 + v28);
  uint64_t v32 = v31[1];
  *uint64_t v30 = *v31;
  v30[1] = v32;
  *(unsigned char *)(a1 + v29) = *(unsigned char *)(a2 + v29);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1D3C11B40(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v6 = a3[8];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_1D3C2E3F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[9];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  uint64_t v13 = a3[11];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[12];
  v17 = (uint64_t *)(a1 + v16);
  uint64_t v18 = (uint64_t *)(a2 + v16);
  unint64_t v19 = *(void *)(a2 + v16 + 8);
  if (*(void *)(a1 + v16 + 8) >> 60 != 15)
  {
    if (v19 >> 60 != 15)
    {
      uint64_t v21 = *v18;
      sub_1D3B9778C(v21, v19);
      uint64_t v22 = *v17;
      unint64_t v23 = v17[1];
      uint64_t *v17 = v21;
      v17[1] = v19;
      sub_1D3B97734(v22, v23);
      goto LABEL_8;
    }
    sub_1D3C11D48((uint64_t)v17);
    goto LABEL_6;
  }
  if (v19 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)v17 = *(_OWORD *)v18;
    goto LABEL_8;
  }
  uint64_t v20 = *v18;
  sub_1D3B9778C(v20, v19);
  uint64_t *v17 = v20;
  v17[1] = v19;
LABEL_8:
  uint64_t v24 = a3[13];
  v25 = (void *)(a1 + v24);
  unint64_t v26 = (void *)(a2 + v24);
  void *v25 = *v26;
  v25[1] = v26[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[14]) = *(unsigned char *)(a2 + a3[14]);
  return a1;
}

uint64_t sub_1D3C11D48(uint64_t a1)
{
  return a1;
}

uint64_t sub_1D3C11D9C(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v7 = a3[8];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1D3C2E3F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(unsigned char *)(a1 + v11) = *(unsigned char *)(a2 + v11);
  uint64_t v12 = a3[12];
  *(_OWORD *)(a1 + a3[11]) = *(_OWORD *)(a2 + a3[11]);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  uint64_t v13 = a3[14];
  *(_OWORD *)(a1 + a3[13]) = *(_OWORD *)(a2 + a3[13]);
  *(unsigned char *)(a1 + v13) = *(unsigned char *)(a2 + v13);
  return a1;
}

uint64_t sub_1D3C11E74(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v9 = a3[8];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_1D3C2E3F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  uint64_t v13 = a3[9];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (uint64_t *)(a2 + v13);
  uint64_t v17 = *v15;
  uint64_t v16 = v15[1];
  *uint64_t v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[11];
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  unint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (uint64_t *)(a2 + v18);
  uint64_t v22 = *v20;
  uint64_t v21 = v20[1];
  *unint64_t v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  uint64_t v23 = a3[12];
  uint64_t v24 = (uint64_t *)(a1 + v23);
  v25 = (uint64_t *)(a2 + v23);
  unint64_t v26 = *(void *)(a1 + v23 + 8);
  if (v26 >> 60 != 15)
  {
    unint64_t v27 = v25[1];
    if (v27 >> 60 != 15)
    {
      uint64_t v28 = *v24;
      *uint64_t v24 = *v25;
      v24[1] = v27;
      sub_1D3B97734(v28, v26);
      goto LABEL_6;
    }
    sub_1D3C11D48((uint64_t)v24);
  }
  *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
LABEL_6:
  uint64_t v29 = a3[13];
  uint64_t v30 = (void *)(a1 + v29);
  uint64_t v31 = (uint64_t *)(a2 + v29);
  uint64_t v33 = *v31;
  uint64_t v32 = v31[1];
  *uint64_t v30 = v33;
  v30[1] = v32;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[14]) = *(unsigned char *)(a2 + a3[14]);
  return a1;
}

uint64_t sub_1D3C11FE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1D3C11FFC);
}

uint64_t sub_1D3C11FFC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_1D3C2E3F0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 32);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1D3C120AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1D3C120C0);
}

uint64_t sub_1D3C120C0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1D3C2E3F0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 32);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for NotificationRequest()
{
  uint64_t result = qword_1EBD757F8;
  if (!qword_1EBD757F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1D3C121B4()
{
  uint64_t result = sub_1D3C2E3F0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

id sub_1D3C12288()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1D3C2F000();
  uint64_t v47 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  v46 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD76D68);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1D3C2E220();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v42 - v12;
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F445B0]), sel_init);
  uint64_t v15 = (void *)sub_1D3C2F180();
  objc_msgSend(v14, sel_setTitle_, v15);

  uint64_t v16 = (void *)sub_1D3C2F180();
  objc_msgSend(v14, sel_setBody_, v16);

  uint64_t v17 = (void *)sub_1D3C2F180();
  objc_msgSend(v14, sel_setCategoryIdentifier_, v17);

  uint64_t v18 = (int *)type metadata accessor for NotificationRequest();
  objc_msgSend(v14, sel_setInterruptionLevel_, (*(unsigned char *)(v1 + v18[10]) & 1) == 0);
  unint64_t v19 = (void *)sub_1D3C2E3A0();
  objc_msgSend(v14, sel_setExpirationDate_, v19);

  if ((*(unsigned char *)(v1 + v18[14]) & 1) == 0)
  {
    id v20 = objc_msgSend(self, sel_defaultSound);
    if (v20)
    {
      uint64_t v21 = v20;
      objc_msgSend(v14, sel_setSound_, v20);
    }
  }
  if (*(void *)(v1 + v18[11] + 8))
  {
    uint64_t v22 = (void *)sub_1D3C2F180();
    objc_msgSend(v14, sel_setSubtitle_, v22);
  }
  uint64_t v23 = *(void *)(v1 + v18[12] + 8) >> 60;
  uint64_t v48 = v2;
  uint64_t v24 = v11;
  if (v23 == 15) {
    sub_1D3C1C148(MEMORY[0x1E4FBC860]);
  }
  else {
    sub_1D3C0BB58();
  }
  v25 = (void *)sub_1D3C2F0E0();
  swift_bridgeObjectRelease();
  objc_msgSend(v14, sel_setUserInfo_, v25);

  if (*(void *)(v1 + v18[13] + 8))
  {
    sub_1D3C2E210();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
    {
      sub_1D3B5F744((uint64_t)v6, &qword_1EBD76D68);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v6, v7);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD763A0);
      uint64_t v44 = swift_allocObject();
      *(_OWORD *)(v44 + 16) = xmmword_1D3C32BA0;
      uint64_t v43 = v7;
      unint64_t v26 = v24;
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v24, v13, v7);
      swift_bridgeObjectRetain();
      unint64_t v27 = v46;
      sub_1D3C2EFF0();
      uint64_t v42 = sub_1D3C2EFE0();
      v45 = v13;
      (*(void (**)(char *, uint64_t))(v47 + 8))(v27, v48);
      id v28 = objc_allocWithZone(MEMORY[0x1E4F445F0]);
      uint64_t v29 = (void *)sub_1D3C2F180();
      swift_bridgeObjectRelease();
      uint64_t v30 = (void *)sub_1D3C2E200();
      uint64_t v31 = (void *)sub_1D3C2F180();
      swift_bridgeObjectRelease();
      id v32 = objc_msgSend(v28, sel_initWithIdentifier_URL_type_options_, v29, v30, v31, 0);

      uint64_t v33 = *(void (**)(char *, uint64_t))(v8 + 8);
      uint64_t v34 = v43;
      v33(v26, v43);
      uint64_t v35 = v44;
      *(void *)(v44 + 32) = v32;
      uint64_t v49 = v35;
      sub_1D3C2F250();
      sub_1D3C15D48();
      uint64_t v36 = (void *)sub_1D3C2F220();
      swift_bridgeObjectRelease();
      objc_msgSend(v14, sel_setAttachments_, v36);

      v33(v45, v34);
    }
  }
  if (*(unsigned char *)(v1 + 48) == 2) {
    id v37 = objc_msgSend(self, sel_triggerWithTimeInterval_repeats_, 0, 60.0);
  }
  else {
    id v37 = 0;
  }
  swift_bridgeObjectRetain();
  id v38 = v14;
  v39 = (void *)sub_1D3C2F180();
  swift_bridgeObjectRelease();
  id v40 = objc_msgSend(self, sel_requestWithIdentifier_content_trigger_, v39, v38, v37);

  return v40;
}

unint64_t sub_1D3C128D4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD74730);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1D3C31AC0;
  unint64_t v38 = 0x656D614E707061;
  unint64_t v39 = 0xE700000000000000;
  uint64_t v3 = MEMORY[0x1E4FBB1A0];
  sub_1D3C2F690();
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  *(void *)(v2 + 96) = v3;
  *(void *)(v2 + 72) = v5;
  *(void *)(v2 + 80) = v4;
  unint64_t v38 = 2036625250;
  unint64_t v39 = 0xE400000000000000;
  swift_bridgeObjectRetain();
  sub_1D3C2F690();
  uint64_t v7 = v1[2];
  uint64_t v6 = v1[3];
  *(void *)(v2 + 168) = v3;
  *(void *)(v2 + 144) = v7;
  *(void *)(v2 + 152) = v6;
  unint64_t v38 = 0x79726F6765746163;
  unint64_t v39 = 0xE800000000000000;
  swift_bridgeObjectRetain();
  sub_1D3C2F690();
  uint64_t v9 = v1[4];
  uint64_t v8 = v1[5];
  *(void *)(v2 + 240) = v3;
  *(void *)(v2 + 216) = v9;
  *(void *)(v2 + 224) = v8;
  unint64_t v38 = 0x79616C6564;
  unint64_t v39 = 0xE500000000000000;
  swift_bridgeObjectRetain();
  sub_1D3C2F690();
  uint64_t v10 = *((unsigned __int8 *)v1 + 48) + 1;
  uint64_t v11 = MEMORY[0x1E4FBB550];
  *(void *)(v2 + 312) = MEMORY[0x1E4FBB550];
  *(void *)(v2 + 288) = v10;
  unint64_t v38 = 0x6974617269707865;
  unint64_t v39 = 0xEA00000000006E6FLL;
  sub_1D3C2F690();
  uint64_t v12 = (int *)type metadata accessor for NotificationRequest();
  uint64_t v13 = (uint64_t)v1 + v12[8];
  uint64_t v14 = sub_1D3C2E3F0();
  *(void *)(v2 + 384) = v14;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v2 + 360));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(boxed_opaque_existential_1, v13, v14);
  unint64_t v38 = 0x696669746E656469;
  unint64_t v39 = 0xEA00000000007265;
  sub_1D3C2F690();
  uint64_t v16 = (uint64_t *)((char *)v1 + v12[9]);
  uint64_t v18 = *v16;
  uint64_t v17 = v16[1];
  *(void *)(v2 + 456) = v3;
  *(void *)(v2 + 432) = v18;
  *(void *)(v2 + 440) = v17;
  unint64_t v38 = 0xD000000000000011;
  unint64_t v39 = 0x80000001D3C389D0;
  swift_bridgeObjectRetain();
  sub_1D3C2F690();
  uint64_t v19 = 1;
  if (*((unsigned char *)v1 + v12[10])) {
    uint64_t v19 = 2;
  }
  *(void *)(v2 + 528) = v11;
  *(void *)(v2 + 504) = v19;
  unint64_t v20 = sub_1D3C1C148(v2);
  uint64_t v21 = (uint64_t *)((char *)v1 + v12[13]);
  uint64_t v22 = v21[1];
  if (v22)
  {
    uint64_t v23 = *v21;
    swift_bridgeObjectRetain();
    sub_1D3C2F690();
    uint64_t v37 = v3;
    *(void *)&long long v36 = v23;
    *((void *)&v36 + 1) = v22;
    sub_1D3C0CCF8(&v36, v35);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_1D3C1575C(v35, (uint64_t)&v38, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    sub_1D3B77354((uint64_t)&v38);
  }
  if ((*((unsigned char *)v1 + v12[14]) & 1) == 0)
  {
    *(void *)&long long v36 = 0x646E756F73;
    *((void *)&v36 + 1) = 0xE500000000000000;
    sub_1D3C2F690();
    uint64_t v37 = v3;
    *(void *)&long long v36 = 0x746C7561666564;
    *((void *)&v36 + 1) = 0xE700000000000000;
    sub_1D3C0CCF8(&v36, v35);
    char v25 = swift_isUniquelyReferenced_nonNull_native();
    sub_1D3C1575C(v35, (uint64_t)&v38, v25);
    swift_bridgeObjectRelease();
    sub_1D3B77354((uint64_t)&v38);
  }
  unint64_t v26 = (uint64_t *)((char *)v1 + v12[11]);
  uint64_t v27 = v26[1];
  if (v27)
  {
    uint64_t v28 = *v26;
    *(void *)&long long v36 = 0x656C746974;
    *((void *)&v36 + 1) = 0xE500000000000000;
    swift_bridgeObjectRetain();
    sub_1D3C2F690();
    uint64_t v37 = v3;
    *(void *)&long long v36 = v28;
    *((void *)&v36 + 1) = v27;
    sub_1D3C0CCF8(&v36, v35);
    char v29 = swift_isUniquelyReferenced_nonNull_native();
    sub_1D3C1575C(v35, (uint64_t)&v38, v29);
    swift_bridgeObjectRelease();
    sub_1D3B77354((uint64_t)&v38);
  }
  uint64_t v30 = (uint64_t *)((char *)v1 + v12[12]);
  unint64_t v31 = v30[1];
  if (v31 >> 60 != 15)
  {
    uint64_t v32 = *v30;
    *(void *)&long long v36 = 0x6F666E4972657375;
    *((void *)&v36 + 1) = 0xE800000000000000;
    sub_1D3C15C74(v32, v31);
    sub_1D3C2F690();
    uint64_t v37 = MEMORY[0x1E4F277C0];
    *(void *)&long long v36 = v32;
    *((void *)&v36 + 1) = v31;
    sub_1D3C0CCF8(&v36, v35);
    sub_1D3B9778C(v32, v31);
    char v33 = swift_isUniquelyReferenced_nonNull_native();
    sub_1D3C1575C(v35, (uint64_t)&v38, v33);
    swift_bridgeObjectRelease();
    sub_1D3B77354((uint64_t)&v38);
    sub_1D3BB2DB0(v32, v31);
  }
  return v20;
}

uint64_t sub_1D3C12E08()
{
  return sub_1D3C2F950();
}

uint64_t sub_1D3C12E5C()
{
  return sub_1D3C2F1C0();
}

uint64_t sub_1D3C12E74()
{
  return sub_1D3C2F950();
}

uint64_t sub_1D3C12EC4@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_1D3C2F830();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_1D3C12F18(void *a1@<X8>)
{
  *a1 = 0x746C7561666564;
  a1[1] = 0xE700000000000000;
}

uint64_t sub_1D3C12F34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD74670);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1D3C2E3F0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v61 = 0x656D614E707061;
  *((void *)&v61 + 1) = 0xE700000000000000;
  sub_1D3C2F690();
  if (*(void *)(a1 + 16) && (unint64_t v11 = sub_1D3C13EAC((uint64_t)v62), (v12 & 1) != 0))
  {
    sub_1D3B5EFBC(*(void *)(a1 + 56) + 32 * v11, (uint64_t)&v63);
  }
  else
  {
    long long v63 = 0u;
    long long v64 = 0u;
  }
  sub_1D3B77354((uint64_t)v62);
  if (!*((void *)&v64 + 1)) {
    goto LABEL_36;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_32:
    swift_bridgeObjectRelease();
LABEL_38:
    sub_1D3C15D88();
    swift_allocError();
    return swift_willThrow();
  }
  uint64_t v13 = *((void *)&v61 + 1);
  uint64_t v65 = v61;
  *(void *)&long long v61 = 2036625250;
  *((void *)&v61 + 1) = 0xE400000000000000;
  sub_1D3C2F690();
  if (*(void *)(a1 + 16) && (unint64_t v14 = sub_1D3C13EAC((uint64_t)v62), (v15 & 1) != 0))
  {
    sub_1D3B5EFBC(*(void *)(a1 + 56) + 32 * v14, (uint64_t)&v63);
  }
  else
  {
    long long v63 = 0u;
    long long v64 = 0u;
  }
  sub_1D3B77354((uint64_t)v62);
  if (!*((void *)&v64 + 1))
  {
LABEL_35:
    swift_bridgeObjectRelease();
LABEL_36:
    swift_bridgeObjectRelease();
    uint64_t v22 = &qword_1EBD763B8;
    uint64_t v23 = (char *)&v63;
LABEL_37:
    sub_1D3B5F744((uint64_t)v23, v22);
    goto LABEL_38;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_31:
    swift_bridgeObjectRelease();
    goto LABEL_32;
  }
  long long v60 = v61;
  *(void *)&long long v61 = 0x79726F6765746163;
  *((void *)&v61 + 1) = 0xE800000000000000;
  sub_1D3C2F690();
  if (*(void *)(a1 + 16) && (unint64_t v16 = sub_1D3C13EAC((uint64_t)v62), (v17 & 1) != 0))
  {
    sub_1D3B5EFBC(*(void *)(a1 + 56) + 32 * v16, (uint64_t)&v63);
  }
  else
  {
    long long v63 = 0u;
    long long v64 = 0u;
  }
  sub_1D3B77354((uint64_t)v62);
  if (!*((void *)&v64 + 1))
  {
LABEL_34:
    swift_bridgeObjectRelease();
    goto LABEL_35;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_30:
    swift_bridgeObjectRelease();
    goto LABEL_31;
  }
  long long v59 = v61;
  *(void *)&long long v61 = 0x79616C6564;
  *((void *)&v61 + 1) = 0xE500000000000000;
  sub_1D3C2F690();
  if (*(void *)(a1 + 16) && (unint64_t v18 = sub_1D3C13EAC((uint64_t)v62), (v19 & 1) != 0))
  {
    sub_1D3B5EFBC(*(void *)(a1 + 56) + 32 * v18, (uint64_t)&v63);
  }
  else
  {
    long long v63 = 0u;
    long long v64 = 0u;
  }
  sub_1D3B77354((uint64_t)v62);
  if (!*((void *)&v64 + 1))
  {
    swift_bridgeObjectRelease();
    goto LABEL_34;
  }
  if ((swift_dynamicCast() & 1) == 0 || (unint64_t)(v61 - 1) >= 3)
  {
    swift_bridgeObjectRelease();
    goto LABEL_30;
  }
  uint64_t v58 = v61 - 1;
  *(void *)&long long v61 = 0x6974617269707865;
  *((void *)&v61 + 1) = 0xEA00000000006E6FLL;
  sub_1D3C2F690();
  if (*(void *)(a1 + 16) && (unint64_t v20 = sub_1D3C13EAC((uint64_t)v62), (v21 & 1) != 0))
  {
    sub_1D3B5EFBC(*(void *)(a1 + 56) + 32 * v20, (uint64_t)&v63);
  }
  else
  {
    long long v63 = 0u;
    long long v64 = 0u;
  }
  sub_1D3B77354((uint64_t)v62);
  if (!*((void *)&v64 + 1))
  {
    sub_1D3B5F744((uint64_t)&v63, &qword_1EBD763B8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    goto LABEL_46;
  }
  int v25 = swift_dynamicCast();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, v25 ^ 1u, 1, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
LABEL_46:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v22 = &qword_1EBD74670;
    uint64_t v23 = v6;
    goto LABEL_37;
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
  *(void *)&long long v61 = 0xD000000000000011;
  *((void *)&v61 + 1) = 0x80000001D3C389D0;
  sub_1D3C2F690();
  if (*(void *)(a1 + 16) && (unint64_t v26 = sub_1D3C13EAC((uint64_t)v62), (v27 & 1) != 0))
  {
    sub_1D3B5EFBC(*(void *)(a1 + 56) + 32 * v26, (uint64_t)&v63);
  }
  else
  {
    long long v63 = 0u;
    long long v64 = 0u;
  }
  sub_1D3B77354((uint64_t)v62);
  if (!*((void *)&v64 + 1)) {
    goto LABEL_64;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_63;
  }
  if ((void)v61 == 1)
  {
    char v28 = 0;
    goto LABEL_54;
  }
  if ((void)v61 != 2)
  {
LABEL_63:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_65:
    sub_1D3C15D88();
    swift_allocError();
    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  char v28 = 1;
LABEL_54:
  *(void *)&long long v61 = 0x696669746E656469;
  *((void *)&v61 + 1) = 0xEA00000000007265;
  sub_1D3C2F690();
  if (*(void *)(a1 + 16) && (unint64_t v29 = sub_1D3C13EAC((uint64_t)v62), (v30 & 1) != 0))
  {
    sub_1D3B5EFBC(*(void *)(a1 + 56) + 32 * v29, (uint64_t)&v63);
  }
  else
  {
    long long v63 = 0u;
    long long v64 = 0u;
  }
  sub_1D3B77354((uint64_t)v62);
  if (!*((void *)&v64 + 1))
  {
LABEL_64:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1D3B5F744((uint64_t)&v63, &qword_1EBD763B8);
    goto LABEL_65;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_63;
  }
  uint64_t v56 = *((void *)&v61 + 1);
  uint64_t v57 = v61;
  *(void *)a2 = v65;
  *(void *)(a2 + 8) = v13;
  uint64_t v31 = *((void *)&v60 + 1);
  *(void *)(a2 + 16) = v60;
  *(void *)(a2 + 24) = v31;
  uint64_t v32 = *((void *)&v59 + 1);
  *(void *)(a2 + 32) = v59;
  *(void *)(a2 + 40) = v32;
  char v33 = (int *)type metadata accessor for NotificationRequest();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(a2 + v33[8], v10, v7);
  uint64_t v34 = (void *)(a2 + v33[9]);
  uint64_t v35 = v56;
  *uint64_t v34 = v57;
  v34[1] = v35;
  *(unsigned char *)(a2 + v33[10]) = v28;
  *(void *)&long long v63 = 0x656C746974;
  *((void *)&v63 + 1) = 0xE500000000000000;
  sub_1D3C2F690();
  if (*(void *)(a1 + 16) && (unint64_t v36 = sub_1D3C13EAC((uint64_t)v62), (v37 & 1) != 0))
  {
    sub_1D3B5EFBC(*(void *)(a1 + 56) + 32 * v36, (uint64_t)&v63);
  }
  else
  {
    long long v63 = 0u;
    long long v64 = 0u;
  }
  sub_1D3B77354((uint64_t)v62);
  if (*((void *)&v64 + 1))
  {
    int v38 = swift_dynamicCast();
    uint64_t v40 = *((void *)&v61 + 1);
    uint64_t v39 = v61;
    if (!v38)
    {
      uint64_t v39 = 0;
      uint64_t v40 = 0;
    }
  }
  else
  {
    sub_1D3B5F744((uint64_t)&v63, &qword_1EBD763B8);
    uint64_t v39 = 0;
    uint64_t v40 = 0;
  }
  v41 = (void *)(a2 + v33[11]);
  void *v41 = v39;
  v41[1] = v40;
  *(unsigned char *)(a2 + 48) = v58;
  *(void *)&long long v63 = 0x6D65686361747461;
  *((void *)&v63 + 1) = 0xEF68746150746E65;
  sub_1D3C2F690();
  if (*(void *)(a1 + 16) && (unint64_t v42 = sub_1D3C13EAC((uint64_t)v62), (v43 & 1) != 0))
  {
    sub_1D3B5EFBC(*(void *)(a1 + 56) + 32 * v42, (uint64_t)&v63);
  }
  else
  {
    long long v63 = 0u;
    long long v64 = 0u;
  }
  sub_1D3B77354((uint64_t)v62);
  if (*((void *)&v64 + 1))
  {
    int v44 = swift_dynamicCast();
    uint64_t v46 = *((void *)&v61 + 1);
    uint64_t v45 = v61;
    if (!v44)
    {
      uint64_t v45 = 0;
      uint64_t v46 = 0;
    }
  }
  else
  {
    sub_1D3B5F744((uint64_t)&v63, &qword_1EBD763B8);
    uint64_t v45 = 0;
    uint64_t v46 = 0;
  }
  uint64_t v47 = (void *)(a2 + v33[13]);
  *uint64_t v47 = v45;
  v47[1] = v46;
  *(void *)&long long v61 = 0x6F666E4972657375;
  *((void *)&v61 + 1) = 0xE800000000000000;
  sub_1D3C2F690();
  if (*(void *)(a1 + 16) && (unint64_t v48 = sub_1D3C13EAC((uint64_t)v62), (v49 & 1) != 0))
  {
    sub_1D3B5EFBC(*(void *)(a1 + 56) + 32 * v48, (uint64_t)&v63);
  }
  else
  {
    long long v63 = 0u;
    long long v64 = 0u;
  }
  sub_1D3B77354((uint64_t)v62);
  if (!*((void *)&v64 + 1))
  {
    sub_1D3B5F744((uint64_t)&v63, &qword_1EBD763B8);
    goto LABEL_87;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_87:
    long long v50 = xmmword_1D3C313C0;
    goto LABEL_88;
  }
  long long v50 = v61;
LABEL_88:
  *(_OWORD *)(a2 + v33[12]) = v50;
  *(void *)&long long v61 = 0x646E756F73;
  *((void *)&v61 + 1) = 0xE500000000000000;
  sub_1D3C2F690();
  if (*(void *)(a1 + 16) && (unint64_t v51 = sub_1D3C13EAC((uint64_t)v62), (v52 & 1) != 0))
  {
    sub_1D3B5EFBC(*(void *)(a1 + 56) + 32 * v51, (uint64_t)&v63);
  }
  else
  {
    long long v63 = 0u;
    long long v64 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_1D3B77354((uint64_t)v62);
  if (!*((void *)&v64 + 1))
  {
    sub_1D3B5F744((uint64_t)&v63, &qword_1EBD763B8);
LABEL_97:
    char v54 = 1;
    goto LABEL_98;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_97;
  }
  uint64_t v53 = sub_1D3C2F830();
  swift_bridgeObjectRelease();
  if (v53) {
    goto LABEL_97;
  }
  char v54 = 0;
LABEL_98:
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  *(unsigned char *)(a2 + v33[14]) = v54;
  return result;
}

uint64_t sub_1D3C13A5C()
{
  swift_bridgeObjectRetain();
  sub_1D3C2F1C0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1D3C2F1C0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1D3C2F1C0();
  swift_bridgeObjectRelease();
  sub_1D3C2F930();
  uint64_t v1 = (int *)type metadata accessor for NotificationRequest();
  sub_1D3C2E3F0();
  sub_1D3C13DEC(&qword_1EA6B68E0, MEMORY[0x1E4F27928]);
  sub_1D3C2F130();
  swift_bridgeObjectRetain();
  sub_1D3C2F1C0();
  swift_bridgeObjectRelease();
  sub_1D3C2F930();
  if (*(void *)(v0 + v1[11] + 8))
  {
    sub_1D3C2F940();
    swift_bridgeObjectRetain();
    sub_1D3C2F1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1D3C2F940();
  }
  uint64_t v2 = (uint64_t *)(v0 + v1[12]);
  unint64_t v3 = v2[1];
  if (v3 >> 60 == 15)
  {
    sub_1D3C2F940();
  }
  else
  {
    uint64_t v4 = *v2;
    sub_1D3C2F940();
    sub_1D3B9778C(v4, v3);
    sub_1D3C2E260();
    sub_1D3BB2DB0(v4, v3);
  }
  if (*(void *)(v0 + v1[13] + 8))
  {
    sub_1D3C2F940();
    swift_bridgeObjectRetain();
    sub_1D3C2F1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1D3C2F940();
  }
  if (*(unsigned char *)(v0 + v1[14]) == 1) {
    return sub_1D3C2F940();
  }
  sub_1D3C2F940();
  return sub_1D3C2F1C0();
}

uint64_t sub_1D3C13D20()
{
  return sub_1D3C2F950();
}

uint64_t sub_1D3C13D64()
{
  return sub_1D3C2F950();
}

uint64_t sub_1D3C13DA4()
{
  return sub_1D3C13DEC(&qword_1EA6B68D8, (void (*)(uint64_t))type metadata accessor for NotificationRequest);
}

uint64_t sub_1D3C13DEC(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1D3C13E34(uint64_t a1, uint64_t a2)
{
  sub_1D3C2F920();
  sub_1D3C2F1C0();
  uint64_t v4 = sub_1D3C2F950();
  return sub_1D3C13F5C(a1, a2, v4);
}

unint64_t sub_1D3C13EAC(uint64_t a1)
{
  uint64_t v2 = sub_1D3C2F670();
  return sub_1D3C14040(a1, v2);
}

unint64_t sub_1D3C13EF0(uint64_t a1)
{
  sub_1D3C2F920();
  sub_1D3C2F930();
  uint64_t v2 = sub_1D3C2F950();
  return sub_1D3C14108(a1, v2);
}

unint64_t sub_1D3C13F5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1D3C2F880() & 1) == 0)
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
      while (!v14 && (sub_1D3C2F880() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1D3C14040(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_1D3C15C88(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x1D943CE10](v9, a1);
      sub_1D3B77354((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_1D3C14108(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_1D3C141A4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD76CA8);
  char v38 = a2;
  uint64_t v6 = sub_1D3C2F7F0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_38;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  unint64_t v36 = v2;
  uint64_t v37 = v5 + 64;
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
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_21;
    }
    if (__OFADD__(v14++, 1)) {
      goto LABEL_40;
    }
    if (v14 >= v11) {
      break;
    }
    uint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v37 + 8 * v14);
    if (!v24)
    {
      int64_t v25 = v14 + 1;
      if (v14 + 1 >= v11)
      {
LABEL_31:
        swift_release();
        uint64_t v3 = v36;
        if ((v38 & 1) == 0) {
          goto LABEL_38;
        }
        goto LABEL_34;
      }
      unint64_t v24 = *(void *)(v37 + 8 * v25);
      if (!v24)
      {
        while (1)
        {
          int64_t v14 = v25 + 1;
          if (__OFADD__(v25, 1)) {
            break;
          }
          if (v14 >= v11) {
            goto LABEL_31;
          }
          unint64_t v24 = *(void *)(v37 + 8 * v14);
          ++v25;
          if (v24) {
            goto LABEL_20;
          }
        }
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return result;
      }
      ++v14;
    }
LABEL_20:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_21:
    unint64_t v26 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v28 = *v26;
    uint64_t v27 = v26[1];
    unint64_t v29 = *(void **)(*(void *)(v5 + 56) + 8 * v21);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v30 = v29;
    }
    sub_1D3C2F920();
    sub_1D3C2F1C0();
    uint64_t result = sub_1D3C2F950();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v33 = v17 == v32;
        if (v17 == v32) {
          unint64_t v17 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v12 + 8 * v17);
      }
      while (v34 == -1);
      unint64_t v18 = __clz(__rbit64(~v34)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    char v19 = (void *)(*(void *)(v7 + 48) + 16 * v18);
    *char v19 = v28;
    v19[1] = v27;
    *(void *)(*(void *)(v7 + 56) + 8 * v18) = v29;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  uint64_t v23 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_38;
  }
LABEL_34:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_38:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1D3C14494(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for NotificationRequest();
  uint64_t v42 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD76CA0);
  int v43 = a2;
  uint64_t v9 = sub_1D3C2F7F0();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  v41 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1 << v11);
  }
  else {
    uint64_t v13 = -1;
  }
  unint64_t v14 = v13 & v12;
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v15 = v9 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v14)
    {
      unint64_t v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v40) {
      break;
    }
    uint64_t v23 = v41;
    unint64_t v24 = v41[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v40) {
        goto LABEL_34;
      }
      unint64_t v24 = v41[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v40)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v39;
          if ((v43 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v41[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v40) {
              goto LABEL_34;
            }
            unint64_t v24 = v41[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v14 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    unint64_t v26 = (uint64_t *)(*(void *)(v8 + 48) + 16 * v21);
    uint64_t v28 = *v26;
    uint64_t v27 = v26[1];
    uint64_t v29 = *(void *)(v42 + 72);
    uint64_t v30 = *(void *)(v8 + 56) + v29 * v21;
    if (v43)
    {
      sub_1D3B6FD1C(v30, (uint64_t)v7);
    }
    else
    {
      sub_1D3B6FC5C(v30, (uint64_t)v7);
      swift_bridgeObjectRetain();
    }
    sub_1D3C2F920();
    sub_1D3C2F1C0();
    uint64_t result = sub_1D3C2F950();
    uint64_t v31 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v15 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v18 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    char v19 = (void *)(*(void *)(v10 + 48) + 16 * v18);
    *char v19 = v28;
    v19[1] = v27;
    uint64_t result = sub_1D3B6FD1C((uint64_t)v7, *(void *)(v10 + 56) + v29 * v18);
    ++*(void *)(v10 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  uint64_t v23 = v41;
  if ((v43 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v8 + 32);
  if (v38 >= 64) {
    bzero(v23, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v38;
  }
  *(void *)(v8 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v10;
  return result;
}

uint64_t sub_1D3C14838(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6B68F0);
  char v37 = a2;
  uint64_t v6 = sub_1D3C2F7F0();
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
  char v34 = v2;
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
    int64_t v22 = (void *)(v5 + 64);
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
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    char v32 = *(unsigned char *)(*(void *)(v5 + 56) + v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_1D3C2F920();
    sub_1D3C2F1C0();
    uint64_t result = sub_1D3C2F950();
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
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(unsigned char *)(*(void *)(v7 + 56) + v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  int64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1D3C14B44(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD74720);
  uint64_t v6 = sub_1D3C2F7F0();
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
    int64_t v22 = (void *)(v5 + 64);
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
      sub_1D3C0CCF8((_OWORD *)(*(void *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_1D3C15C88(v25, (uint64_t)&v38);
      sub_1D3B5EFBC(*(void *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    uint64_t result = sub_1D3C2F670();
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
    uint64_t result = (uint64_t)sub_1D3C0CCF8(v37, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  int64_t v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

id sub_1D3C14E5C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD76CA8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1D3C2F7E0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    if (__OFADD__(v9++, 1)) {
      goto LABEL_26;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    if (!v23) {
      break;
    }
LABEL_23:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    long long v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v9 + 1;
  if (v9 + 1 >= v13) {
    goto LABEL_24;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

void *sub_1D3C14FF8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for NotificationRequest();
  uint64_t v29 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD76CA0);
  uint64_t v5 = *v0;
  uint64_t v6 = sub_1D3C2F7E0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    id result = (void *)swift_release();
LABEL_25:
    *uint64_t v1 = v7;
    return result;
  }
  long long v27 = v1;
  id result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    id result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v28 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v23 >= v14) {
      goto LABEL_23;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_23;
      }
      unint64_t v24 = *(void *)(v28 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v29 + 72) * v16;
    sub_1D3B6FC5C(*(void *)(v5 + 56) + v21, (uint64_t)v4);
    int64_t v22 = (void *)(*(void *)(v7 + 48) + v17);
    void *v22 = v19;
    v22[1] = v20;
    sub_1D3B6FD1C((uint64_t)v4, *(void *)(v7 + 56) + v21);
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14)
  {
LABEL_23:
    id result = (void *)swift_release();
    uint64_t v1 = v27;
    goto LABEL_25;
  }
  unint64_t v24 = *(void *)(v28 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_23;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_1D3C15264()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6B68F0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1D3C2F7E0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    unint64_t v16 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    LOBYTE(v16) = *(unsigned char *)(*(void *)(v2 + 56) + v15);
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + 16 * v15);
    *uint64_t v19 = v18;
    v19[1] = v17;
    *(unsigned char *)(*(void *)(v4 + 56) + v15) = (_BYTE)v16;
    id result = (void *)swift_bridgeObjectRetain();
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

void *sub_1D3C15410()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD74720);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1D3C2F7E0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    sub_1D3C15C88(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    uint64_t v17 = 32 * v15;
    sub_1D3B5EFBC(*(void *)(v2 + 56) + v17, (uint64_t)v24);
    uint64_t v18 = *(void *)(v4 + 48) + v16;
    long long v19 = v25[0];
    long long v20 = v25[1];
    *(void *)(v18 + 32) = v26;
    *(_OWORD *)uint64_t v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    id result = sub_1D3C0CCF8(v24, (_OWORD *)(*(void *)(v4 + 56) + v17));
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

uint64_t sub_1D3C155F8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_1D3C13E34(a2, a3);
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
      sub_1D3C14FF8();
      goto LABEL_7;
    }
    sub_1D3C14494(v15, a4 & 1);
    unint64_t v22 = sub_1D3C13E34(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      unint64_t v12 = v22;
      uint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_1D3C2F8C0();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7];
    uint64_t v20 = v19 + *(void *)(*(void *)(type metadata accessor for NotificationRequest() - 8) + 72) * v12;
    return sub_1D3C15CE4(a1, v20);
  }
LABEL_13:
  sub_1D3C158A8(v12, a2, a3, a1, v18);
  return swift_bridgeObjectRetain();
}

_OWORD *sub_1D3C1575C(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_1D3C13EAC(a2);
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
      sub_1D3C15410();
      goto LABEL_7;
    }
    sub_1D3C14B44(v13, a3 & 1);
    unint64_t v19 = sub_1D3C13EAC(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      char v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
LABEL_13:
      sub_1D3C15C88(a2, (uint64_t)v21);
      return sub_1D3C15940(v10, (uint64_t)v21, a1, v16);
    }
LABEL_15:
    uint64_t result = (_OWORD *)sub_1D3C2F8C0();
    __break(1u);
    return result;
  }
LABEL_7:
  char v16 = *v4;
  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v17 = (_OWORD *)(v16[7] + 32 * v10);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  return sub_1D3C0CCF8(a1, v17);
}

uint64_t sub_1D3C158A8(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = (void *)(a5[6] + 16 * a1);
  *uint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = type metadata accessor for NotificationRequest();
  uint64_t result = sub_1D3B6FD1C(a4, v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

_OWORD *sub_1D3C15940(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  uint64_t result = sub_1D3C0CCF8(a3, (_OWORD *)(a4[7] + 32 * a1));
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

uint64_t sub_1D3C159BC(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 != *(void *)a2 || *(void *)(a1 + 8) != *(void *)(a2 + 8))
  {
    char v5 = sub_1D3C2F880();
    uint64_t result = 0;
    if ((v5 & 1) == 0) {
      return result;
    }
  }
  if (*(void *)(a1 + 16) != *(void *)(a2 + 16) || *(void *)(a1 + 24) != *(void *)(a2 + 24))
  {
    char v8 = sub_1D3C2F880();
    uint64_t result = 0;
    if ((v8 & 1) == 0) {
      return result;
    }
  }
  if (*(void *)(a1 + 32) != *(void *)(a2 + 32) || *(void *)(a1 + 40) != *(void *)(a2 + 40))
  {
    char v9 = sub_1D3C2F880();
    uint64_t result = 0;
    if ((v9 & 1) == 0) {
      return result;
    }
  }
  if (*(unsigned __int8 *)(a1 + 48) != *(unsigned __int8 *)(a2 + 48)) {
    return 0;
  }
  uint64_t v10 = (int *)type metadata accessor for NotificationRequest();
  if ((sub_1D3C2E3C0() & 1) == 0) {
    return 0;
  }
  uint64_t v11 = v10[9];
  uint64_t v12 = *(void *)(a1 + v11);
  uint64_t v13 = *(void *)(a1 + v11 + 8);
  uint64_t v14 = (void *)(a2 + v11);
  if (v12 != *v14 || v13 != v14[1])
  {
    char v16 = sub_1D3C2F880();
    uint64_t result = 0;
    if ((v16 & 1) == 0) {
      return result;
    }
  }
  if (*(unsigned __int8 *)(a1 + v10[10]) != *(unsigned __int8 *)(a2 + v10[10])) {
    return 0;
  }
  uint64_t v17 = v10[11];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = *(void *)(a1 + v17 + 8);
  char v20 = (void *)(a2 + v17);
  uint64_t v21 = v20[1];
  if (v19)
  {
    if (!v21) {
      return 0;
    }
    if (*v18 != *v20 || v19 != v21)
    {
      char v22 = sub_1D3C2F880();
      uint64_t result = 0;
      if ((v22 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v21)
  {
    return 0;
  }
  uint64_t v23 = v10[12];
  uint64_t v24 = *(void *)(a1 + v23);
  unint64_t v25 = *(void *)(a1 + v23 + 8);
  uint64_t v26 = (uint64_t *)(a2 + v23);
  uint64_t v27 = *v26;
  unint64_t v28 = v26[1];
  if (v25 >> 60 != 15)
  {
    if (v28 >> 60 != 15)
    {
      sub_1D3C15C74(v24, v25);
      sub_1D3C15C74(v27, v28);
      BOOL v29 = sub_1D3C0C894(v24, v25, v27, v28);
      sub_1D3BB2DB0(v27, v28);
      sub_1D3BB2DB0(v24, v25);
      if (!v29) {
        return 0;
      }
      goto LABEL_37;
    }
LABEL_35:
    sub_1D3C15C74(v24, v25);
    sub_1D3C15C74(v27, v28);
    sub_1D3BB2DB0(v24, v25);
    sub_1D3BB2DB0(v27, v28);
    return 0;
  }
  if (v28 >> 60 != 15) {
    goto LABEL_35;
  }
LABEL_37:
  uint64_t v30 = v10[13];
  char v31 = (void *)(a1 + v30);
  uint64_t v32 = *(void *)(a1 + v30 + 8);
  BOOL v33 = (void *)(a2 + v30);
  uint64_t v34 = v33[1];
  if (!v32)
  {
    if (v34) {
      return 0;
    }
    goto LABEL_44;
  }
  if (!v34) {
    return 0;
  }
  if (*v31 == *v33 && v32 == v34 || (v35 = sub_1D3C2F880(), uint64_t result = 0, (v35 & 1) != 0))
  {
LABEL_44:
    uint64_t v36 = v10[14];
    char v37 = *(unsigned char *)(a1 + v36);
    char v38 = *(unsigned char *)(a2 + v36);
    if (v37)
    {
      if ((v38 & 1) == 0) {
        return 0;
      }
    }
    else if (v38)
    {
      return 0;
    }
    return 1;
  }
  return result;
}

uint64_t sub_1D3C15C74(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1D3B9778C(a1, a2);
  }
  return a1;
}

uint64_t sub_1D3C15C88(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1D3C15CE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NotificationRequest();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_1D3C15D48()
{
  unint64_t result = qword_1EA6B68E8;
  if (!qword_1EA6B68E8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA6B68E8);
  }
  return result;
}

unint64_t sub_1D3C15D88()
{
  unint64_t result = qword_1EA6B68F8;
  if (!qword_1EA6B68F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA6B68F8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for NotificationSound(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1D3C15E78);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for NotificationSound()
{
  return &type metadata for NotificationSound;
}

unint64_t sub_1D3C15EB4()
{
  unint64_t result = qword_1EA6B6900;
  if (!qword_1EA6B6900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA6B6900);
  }
  return result;
}

uint64_t sub_1D3C15F08(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_1D3C15F1C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

id sub_1D3C15F30()
{
  uint64_t v0 = sub_1D3C2F040();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  int v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = objc_msgSend(self, sel_sharedInstance);
  if (!result)
  {
    sub_1D3C2EE60();
    uint64_t v5 = sub_1D3C2F030();
    os_log_type_t v6 = sub_1D3C2F3F0();
    if (os_log_type_enabled(v5, v6))
    {
      unint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v7 = 0;
      _os_log_impl(&dword_1D3B55000, v5, v6, "Failed to get device registry", v7, 2u);
      MEMORY[0x1D943DA70](v7, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for PairedDeviceRegistry()
{
  return &type metadata for PairedDeviceRegistry;
}

uint64_t FitnessPlusPlanDataProvider.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1D3C2E790();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v10[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1D3C2E6F0();
  sub_1D3B5BCDC();
  sub_1D3C2F4F0();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E4F9B9B8], v2);
  v10[3] = sub_1D3C2E780();
  v10[4] = MEMORY[0x1E4F9B9B0];
  __swift_allocate_boxed_opaque_existential_1(v10);
  sub_1D3C2E770();
  sub_1D3C2E7C0();
  swift_allocObject();
  sub_1D3C2E7B0();
  sub_1D3C2F4F0();
  uint64_t result = sub_1D3C2E6E0();
  uint64_t v8 = MEMORY[0x1E4F9AA90];
  a1[3] = v6;
  a1[4] = v8;
  *a1 = result;
  return result;
}

uint64_t FitnessPlusPlanDataProvider.notificationSchedule(forDate:)(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  uint64_t v3 = sub_1D3C2E4F0();
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  v2[8] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD76D78);
  v2[9] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD76D70);
  v2[10] = swift_task_alloc();
  v2[11] = swift_task_alloc();
  v2[12] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1D3C16360, 0, 0);
}

uint64_t sub_1D3C16360()
{
  uint64_t v1 = (void *)v0[4];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[13] = v4;
  void *v4 = v0;
  v4[1] = sub_1D3C1641C;
  uint64_t v5 = v0[3];
  return MEMORY[0x1F414B2F0](v5, v2, v3);
}

uint64_t sub_1D3C1641C(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(v4 + 112) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x1F4188298](sub_1D3C165A4, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(uint64_t))(v4 + 8);
    return v5(a1);
  }
}

uint64_t sub_1D3C165A4()
{
  uint64_t v1 = *(void **)(v0 + 112);
  *(void *)(v0 + 16) = v1;
  uint64_t v2 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 96);
  uint64_t v5 = *(void *)(v0 + 64);
  uint64_t v4 = *(void *)(v0 + 72);
  uint64_t v6 = *(void *)(v0 + 40);
  uint64_t v7 = *(void *)(v0 + 48);
  id v8 = v1;
  __swift_instantiateConcreteTypeFromMangledName(qword_1EBD74738);
  int v9 = swift_dynamicCast();
  uint64_t v10 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56);
  v10(v3, v9 ^ 1u, 1, v6);
  (*(void (**)(uint64_t, void, uint64_t))(v7 + 104))(v2, *MEMORY[0x1E4F9CF28], v6);
  v10(v2, 0, 1, v6);
  uint64_t v11 = v4 + *(int *)(v5 + 48);
  sub_1D3C16950(v3, v4);
  sub_1D3C16950(v2, v11);
  uint64_t v12 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  if (v12(v4, 1, v6) == 1)
  {
    uint64_t v13 = *(void *)(v0 + 40);
    sub_1D3B5F744(*(void *)(v0 + 88), &qword_1EBD76D70);
    if (v12(v11, 1, v13) == 1)
    {
      uint64_t v14 = *(void *)(v0 + 96);
      sub_1D3B5F744(*(void *)(v0 + 72), &qword_1EBD76D70);
      sub_1D3B5F744(v14, &qword_1EBD76D70);
LABEL_8:

      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      BOOL v29 = *(uint64_t (**)(uint64_t))(v0 + 8);
      uint64_t v30 = MEMORY[0x1E4FBC860];
      return v29(v30);
    }
    goto LABEL_6;
  }
  uint64_t v15 = *(void *)(v0 + 40);
  sub_1D3C16950(*(void *)(v0 + 72), *(void *)(v0 + 80));
  if (v12(v11, 1, v15) == 1)
  {
    uint64_t v16 = *(void *)(v0 + 80);
    uint64_t v17 = *(void *)(v0 + 40);
    uint64_t v18 = *(void *)(v0 + 48);
    sub_1D3B5F744(*(void *)(v0 + 88), &qword_1EBD76D70);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
LABEL_6:
    uint64_t v19 = *(void *)(v0 + 96);
    sub_1D3B5F744(*(void *)(v0 + 72), &qword_1EBD76D78);
    sub_1D3B5F744(v19, &qword_1EBD76D70);
    goto LABEL_11;
  }
  uint64_t v21 = *(void *)(v0 + 88);
  uint64_t v20 = *(void *)(v0 + 96);
  uint64_t v23 = *(void *)(v0 + 72);
  uint64_t v22 = *(void *)(v0 + 80);
  uint64_t v25 = *(void *)(v0 + 48);
  uint64_t v24 = *(void *)(v0 + 56);
  uint64_t v26 = *(void *)(v0 + 40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 32))(v24, v11, v26);
  sub_1D3C169B8();
  char v27 = sub_1D3C2F170();
  unint64_t v28 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
  v28(v24, v26);
  sub_1D3B5F744(v21, &qword_1EBD76D70);
  v28(v22, v26);
  sub_1D3B5F744(v23, &qword_1EBD76D70);
  sub_1D3B5F744(v20, &qword_1EBD76D70);
  if (v27) {
    goto LABEL_8;
  }
LABEL_11:
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v32 = *(uint64_t (**)(void))(v0 + 8);
  return v32();
}

uint64_t sub_1D3C16950(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD76D70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1D3C169B8()
{
  unint64_t result = qword_1EA6B6910;
  if (!qword_1EA6B6910)
  {
    sub_1D3C2E4F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA6B6910);
  }
  return result;
}

uint64_t sub_1D3C16A10(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1D3B8E428;
  return FitnessPlusPlanDataProvider.notificationSchedule(forDate:)(a1);
}

uint64_t dispatch thunk of FitnessPlusPlanDataProviding.notificationSchedule(forDate:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 8) + **(int **)(a3 + 8));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_1D3B6178C;
  return v9(a1, a2, a3);
}

ValueMetadata *type metadata accessor for FitnessPlusPlanDataProvider()
{
  return &type metadata for FitnessPlusPlanDataProvider;
}

uint64_t sub_1D3C16BB8(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 8) + **(int **)(a2 + 8));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1D3B5C3DC;
  return v7(a1, a2);
}

uint64_t sub_1D3C16CA8(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 16) + **(int **)(a2 + 16));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1D3B77A88;
  return v7(a1, a2);
}

uint64_t sub_1D3C16D98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 24) + **(int **)(a3 + 24));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_1D3B5C2E8;
  return v9(a1, a2, a3);
}

uint64_t sub_1D3C16E9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 32) + **(int **)(a3 + 32));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_1D3B5C3DC;
  return v9(a1, a2, a3);
}

uint64_t sub_1D3C16FA0(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for NotificationRequest();
  uint64_t v34 = *(void *)(v3 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v3 - 8);
  uint64_t v33 = (uint64_t)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v32 = (uint64_t)&v27 - v6;
  int64_t v7 = *(void *)(a1 + 16);
  uint64_t v8 = MEMORY[0x1E4FBC860];
  if (!v7) {
    return v8;
  }
  uint64_t v27 = v1;
  uint64_t v35 = MEMORY[0x1E4FBC860];
  sub_1D3C17BA4(0, v7, 0);
  uint64_t result = sub_1D3C184C8(a1);
  uint64_t v11 = result;
  uint64_t v12 = 0;
  uint64_t v13 = a1 + 64;
  uint64_t v28 = a1 + 80;
  int64_t v29 = v7;
  uint64_t v30 = v10;
  uint64_t v31 = a1 + 64;
  while ((v11 & 0x8000000000000000) == 0 && v11 < 1 << *(unsigned char *)(a1 + 32))
  {
    unint64_t v16 = (unint64_t)v11 >> 6;
    if ((*(void *)(v13 + 8 * ((unint64_t)v11 >> 6)) & (1 << v11)) == 0) {
      goto LABEL_25;
    }
    if (*(_DWORD *)(a1 + 36) != v10) {
      goto LABEL_26;
    }
    uint64_t v17 = v32;
    sub_1D3B6FC5C(*(void *)(a1 + 56) + *(void *)(v34 + 72) * v11, v32);
    uint64_t v18 = v33;
    sub_1D3B6FD1C(v17, v33);
    unint64_t v19 = sub_1D3C128D4();
    sub_1D3B6FCC0(v18);
    uint64_t v8 = v35;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = sub_1D3C17BA4(0, *(void *)(v8 + 16) + 1, 1);
      uint64_t v8 = v35;
    }
    unint64_t v21 = *(void *)(v8 + 16);
    unint64_t v20 = *(void *)(v8 + 24);
    if (v21 >= v20 >> 1)
    {
      uint64_t result = sub_1D3C17BA4(v20 > 1, v21 + 1, 1);
      uint64_t v8 = v35;
    }
    *(void *)(v8 + 16) = v21 + 1;
    *(void *)(v8 + 8 * v21 + 32) = v19;
    int64_t v14 = 1 << *(unsigned char *)(a1 + 32);
    if (v11 >= v14) {
      goto LABEL_27;
    }
    uint64_t v13 = v31;
    uint64_t v22 = *(void *)(v31 + 8 * v16);
    if ((v22 & (1 << v11)) == 0) {
      goto LABEL_28;
    }
    LODWORD(v10) = v30;
    if (*(_DWORD *)(a1 + 36) != v30) {
      goto LABEL_29;
    }
    unint64_t v23 = v22 & (-2 << (v11 & 0x3F));
    if (v23)
    {
      int64_t v14 = __clz(__rbit64(v23)) | v11 & 0xFFFFFFFFFFFFFFC0;
      int64_t v15 = v29;
    }
    else
    {
      unint64_t v24 = v16 + 1;
      unint64_t v25 = (unint64_t)(v14 + 63) >> 6;
      int64_t v15 = v29;
      if (v16 + 1 < v25)
      {
        unint64_t v26 = *(void *)(v31 + 8 * v24);
        if (v26)
        {
LABEL_22:
          int64_t v14 = __clz(__rbit64(v26)) + (v24 << 6);
        }
        else
        {
          while (v25 - 2 != v16)
          {
            unint64_t v26 = *(void *)(v28 + 8 * v16++);
            if (v26)
            {
              unint64_t v24 = v16 + 1;
              goto LABEL_22;
            }
          }
        }
      }
    }
    ++v12;
    uint64_t v11 = v14;
    if (v12 == v15) {
      return v8;
    }
  }
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_1D3C17290(uint64_t a1)
{
  uint64_t v31 = a1;
  uint64_t v2 = sub_1D3C2F040();
  uint64_t v32 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v4 = (char *)v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD76770);
  uint64_t v6 = MEMORY[0x1F4188790](v5 - 8);
  uint64_t v8 = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)v29 - v9;
  uint64_t v11 = type metadata accessor for NotificationRequest();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  int64_t v14 = (char *)v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = swift_bridgeObjectRetain();
  sub_1D3C12F34(v15, (uint64_t)v10);
  if (v1)
  {

    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
    sub_1D3C1883C((uint64_t)v10);
    sub_1D3C2EE60();
    swift_bridgeObjectRetain_n();
    unint64_t v16 = sub_1D3C2F030();
    os_log_type_t v17 = sub_1D3C2F3F0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v31 = v2;
      unint64_t v19 = (uint8_t *)v18;
      uint64_t v30 = swift_slowAlloc();
      uint64_t v34 = v30;
      *(_DWORD *)unint64_t v19 = 136315138;
      v29[0] = v19 + 4;
      swift_bridgeObjectRetain();
      v29[1] = MEMORY[0x1E4FBC840] + 8;
      uint64_t v20 = sub_1D3C2F110();
      unint64_t v22 = v21;
      swift_bridgeObjectRelease();
      uint64_t v33 = sub_1D3B5E520(v20, v22, &v34);
      sub_1D3C2F550();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1D3B55000, v16, v17, "Failed to create request from dictionary %s", v19, 0xCu);
      uint64_t v23 = v30;
      swift_arrayDestroy();
      MEMORY[0x1D943DA70](v23, -1, -1);
      MEMORY[0x1D943DA70](v19, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v4, v31);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v4, v2);
    }
  }
  else
  {
    unint64_t v25 = *(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56);
    v25(v10, 0, 1, v11);
    sub_1D3B6FD1C((uint64_t)v10, (uint64_t)v14);
    unint64_t v26 = (uint64_t *)&v14[*(int *)(v11 + 36)];
    uint64_t v27 = *v26;
    uint64_t v28 = v26[1];
    sub_1D3B6FC5C((uint64_t)v14, (uint64_t)v8);
    v25(v8, 0, 1, v11);
    swift_bridgeObjectRetain();
    sub_1D3BF1864((uint64_t)v8, v27, v28);
    return sub_1D3B6FCC0((uint64_t)v14);
  }
}

void sub_1D3C176A0()
{
  swift_beginAccess();
  uint64_t v0 = swift_bridgeObjectRetain();
  sub_1D3C16FA0(v0);
  swift_bridgeObjectRelease();
  id v1 = objc_allocWithZone(MEMORY[0x1E4F1CB18]);
  uint64_t v2 = (void *)sub_1D3C2F180();
  id v3 = objc_msgSend(v1, sel_initWithSuiteName_, v2);

  if (!v3) {
    id v3 = objc_msgSend(self, sel_standardUserDefaults);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD76C08);
  uint64_t v4 = (void *)sub_1D3C2F220();
  swift_bridgeObjectRelease();
  sub_1D3C2ED70();
  uint64_t v5 = (void *)sub_1D3C2F180();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_setObject_forKey_, v4, v5);
}

uint64_t sub_1D3C177D4()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return MEMORY[0x1F4188210](v0);
}

uint64_t type metadata accessor for NotificationRequestStore()
{
  return self;
}

uint64_t sub_1D3C17830()
{
  v1[6] = v0;
  uint64_t v2 = sub_1D3C2F040();
  v1[7] = v2;
  v1[8] = *(void *)(v2 - 8);
  v1[9] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1D3C178F0, v0, 0);
}

uint64_t sub_1D3C178F0()
{
  unint64_t v19 = v0;
  uint64_t v1 = v0[6];
  unint64_t v2 = sub_1D3C18550();
  swift_beginAccess();
  *(void *)(v1 + 112) = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_1D3C2EE60();
  swift_bridgeObjectRetain();
  id v3 = sub_1D3C2F030();
  os_log_type_t v4 = sub_1D3C2F410();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v15 = v0[8];
    uint64_t v16 = v0[7];
    uint64_t v17 = v0[9];
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v18 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    type metadata accessor for NotificationRequest();
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1D3C2F110();
    unint64_t v9 = v8;
    swift_bridgeObjectRelease();
    v0[5] = sub_1D3B5E520(v7, v9, &v18);
    sub_1D3C2F550();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1D3B55000, v3, v4, "Loaded stored notification requests %s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D943DA70](v6, -1, -1);
    MEMORY[0x1D943DA70](v5, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v17, v16);
  }
  else
  {
    uint64_t v11 = v0[8];
    uint64_t v10 = v0[9];
    uint64_t v12 = v0[7];
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  }
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_1D3C17B64(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1D3C17C98(a1, a2, a3, *v3);
  *id v3 = (char *)result;
  return result;
}

uint64_t sub_1D3C17B84(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1D3C17E08(a1, a2, a3, *v3);
  *id v3 = (char *)result;
  return result;
}

uint64_t sub_1D3C17BA4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1D3C17F68(a1, a2, a3, (void *)*v3);
  *id v3 = result;
  return result;
}

uint64_t sub_1D3C17BC4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1D3C18280(a1, a2, a3, (void *)*v3, &qword_1EBD76CE0, (uint64_t (*)(void))type metadata accessor for NotificationRequest);
  *id v3 = result;
  return result;
}

uint64_t sub_1D3C17C00(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1D3C180F4(a1, a2, a3, *v3);
  *id v3 = (char *)result;
  return result;
}

uint64_t sub_1D3C17C20(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1D3C18280(a1, a2, a3, (void *)*v3, &qword_1EA6B54A8, MEMORY[0x1E4F61F10]);
  *id v3 = result;
  return result;
}

uint64_t sub_1D3C17C5C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1D3C18280(a1, a2, a3, (void *)*v3, &qword_1EA6B6948, MEMORY[0x1E4F9E628]);
  *id v3 = result;
  return result;
}

uint64_t sub_1D3C17C98(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD763A8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v13 = v10 + 32;
  int64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_1D3C2F810();
  __break(1u);
  return result;
}

uint64_t sub_1D3C17E08(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD76D00);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v13 = v10 + 32;
  int64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_1D3C2F810();
  __break(1u);
  return result;
}

uint64_t sub_1D3C17F68(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD76CE8);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD76C08);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_1D3C2F810();
  __break(1u);
  return result;
}

uint64_t sub_1D3C180F4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD74728);
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
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
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
  uint64_t result = sub_1D3C2F810();
  __break(1u);
  return result;
}

uint64_t sub_1D3C18260(char a1, int64_t a2, char a3, void *a4)
{
  return sub_1D3C18280(a1, a2, a3, a4, &qword_1EA6B54A8, MEMORY[0x1E4F61F10]);
}

uint64_t sub_1D3C18280(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    uint64_t v16 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  size_t v17 = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_34;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(a6(0) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  unint64_t v21 = (char *)v16 + v20;
  unint64_t v22 = (char *)a4 + v20;
  if (a1)
  {
    if (v16 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v23 = *(void *)(v19 + 72) * v11;
  unint64_t v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  uint64_t result = sub_1D3C2F810();
  __break(1u);
  return result;
}

uint64_t sub_1D3C184C8(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  unint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

unint64_t sub_1D3C18550()
{
  uint64_t v0 = sub_1D3C2F040();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D3C2ED70();
  id v4 = objc_allocWithZone(MEMORY[0x1E4F1CB18]);
  char v5 = (void *)sub_1D3C2F180();
  id v6 = objc_msgSend(v4, sel_initWithSuiteName_, v5);

  if (!v6) {
    id v6 = objc_msgSend(self, sel_standardUserDefaults);
  }
  unint64_t v7 = (void *)sub_1D3C2F180();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v6, sel_arrayForKey_, v7);

  if (v8 && (uint64_t v9 = sub_1D3C2F230(), v8, v10 = sub_1D3BECD50(v9), swift_bridgeObjectRelease(), v10))
  {
    unint64_t v11 = sub_1D3C1C3A0(MEMORY[0x1E4FBC860]);
    unint64_t v20 = v11;
    uint64_t v12 = *(void *)(v10 + 16);
    if (v12)
    {
      swift_bridgeObjectRetain();
      for (uint64_t i = 0; i != v12; ++i)
      {
        v19[2] = *(void *)(v10 + 8 * i + 32);
        swift_bridgeObjectRetain();
        sub_1D3C17290((uint64_t)&v20);
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease_n();
      return v20;
    }
    else
    {
      unint64_t v14 = v11;
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_1D3C2EE60();
    unint64_t v15 = sub_1D3C2F030();
    os_log_type_t v16 = sub_1D3C2F410();
    if (os_log_type_enabled(v15, v16))
    {
      size_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)size_t v17 = 0;
      _os_log_impl(&dword_1D3B55000, v15, v16, "No stored requests to load", v17, 2u);
      MEMORY[0x1D943DA70](v17, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return sub_1D3C1C3A0(MEMORY[0x1E4FBC860]);
  }
  return v14;
}

uint64_t sub_1D3C1883C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD76770);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1D3C1889C()
{
  uint64_t result = sub_1D3C2F180();
  qword_1EBD77098 = result;
  return result;
}

uint64_t sub_1D3C188DC()
{
  uint64_t result = *MEMORY[0x1E4F61C28];
  if (*MEMORY[0x1E4F61C28])
  {
    uint64_t result = sub_1D3C2F1E0();
    qword_1EBD77060 = result;
    *(void *)algn_1EBD77068 = v1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1D3C18914()
{
  uint64_t result = sub_1D3C2F190();
  qword_1EBD77040 = result;
  *(void *)algn_1EBD77048 = v1;
  return result;
}

uint64_t sub_1D3C18944()
{
  uint64_t result = sub_1D3C2F190();
  qword_1EBD77050 = result;
  *(void *)algn_1EBD77058 = v1;
  return result;
}

uint64_t sub_1D3C18974(uint64_t a1, uint64_t a2)
{
  unint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 8) + **(int **)(a2 + 8));
  char v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *char v5 = v2;
  v5[1] = sub_1D3C18A64;
  return v7(a1, a2);
}

uint64_t sub_1D3C18A64(uint64_t a1, char a2)
{
  uint64_t v7 = *v2;
  uint64_t v4 = a2 & 1;
  swift_task_dealloc();
  char v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, v4);
}

uint64_t sub_1D3C18B68(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, void))(a4 + 16))(a1, a2 & 1);
}

uint64_t sub_1D3C18B80(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_1D3C18B94@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v27 = a2;
  uint64_t v4 = sub_1D3C2E4D0();
  uint64_t v25 = *(void *)(v4 - 8);
  uint64_t v26 = v4;
  MEMORY[0x1F4188790](v4);
  id v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1D3C2E4C0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1D3C2E3F0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  unint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD74670);
  MEMORY[0x1F4188790](v15 - 8);
  size_t v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v18 = objc_msgSend(a1, sel_displayCount);
  if ((unint64_t)v18 <= 2)
  {
    __swift_project_boxed_opaque_existential_1((void *)(v2 + 40), *(void *)(v2 + 64));
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD74970);
    sub_1D3C2E8F0();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v17, 1, v11) == 1)
    {
      sub_1D3C2E3E0();
      return sub_1D3B5D398((uint64_t)v17);
    }
    else
    {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v12 + 32))(v27, v17, v11);
    }
  }
  else
  {
    if (v18 == (id)5 || v18 == (id)4)
    {
      id v22 = objc_msgSend(a1, sel_lastDisplayDate);
      sub_1D3C2E3D0();

      (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E4F27C30], v7);
      __swift_project_boxed_opaque_existential_1((void *)(v2 + 40), *(void *)(v2 + 64));
      sub_1D3B61294();
    }
    else
    {
      if (v18 == (id)3)
      {
        id v19 = objc_msgSend(a1, sel_lastDisplayDate);
        sub_1D3C2E3D0();

        unint64_t v20 = (unsigned int *)MEMORY[0x1E4F27C30];
      }
      else
      {
        id v23 = objc_msgSend(a1, sel_lastDisplayDate);
        sub_1D3C2E3D0();

        unint64_t v20 = (unsigned int *)MEMORY[0x1E4F27C20];
      }
      (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *v20, v7);
      __swift_project_boxed_opaque_existential_1((void *)(v2 + 40), *(void *)(v2 + 64));
      sub_1D3B61294();
    }
    sub_1D3C2E330();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v6, v26);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_1D3C1901C()
{
  v1[4] = v0;
  uint64_t v2 = sub_1D3C2EC50();
  v1[5] = v2;
  v1[6] = *(void *)(v2 - 8);
  v1[7] = swift_task_alloc();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD76C30);
  v1[8] = v3;
  v1[9] = *(void *)(v3 - 8);
  v1[10] = swift_task_alloc();
  uint64_t v4 = sub_1D3C2E1B0();
  v1[11] = v4;
  v1[12] = *(void *)(v4 - 8);
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  uint64_t v5 = sub_1D3C2E4C0();
  v1[15] = v5;
  v1[16] = *(void *)(v5 - 8);
  v1[17] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD74670);
  v1[18] = swift_task_alloc();
  uint64_t v6 = sub_1D3C2E3F0();
  v1[19] = v6;
  v1[20] = *(void *)(v6 - 8);
  v1[21] = swift_task_alloc();
  v1[22] = swift_task_alloc();
  v1[23] = swift_task_alloc();
  v1[24] = swift_task_alloc();
  uint64_t v7 = sub_1D3C2E4D0();
  v1[25] = v7;
  v1[26] = *(void *)(v7 - 8);
  v1[27] = swift_task_alloc();
  v1[28] = swift_task_alloc();
  v1[29] = swift_task_alloc();
  uint64_t v8 = sub_1D3C2F040();
  v1[30] = v8;
  v1[31] = *(void *)(v8 - 8);
  v1[32] = swift_task_alloc();
  v1[33] = swift_task_alloc();
  v1[34] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1D3C193A8, 0, 0);
}

uint64_t sub_1D3C193A8()
{
  uint64_t v1 = v0[34];
  uint64_t v2 = v0[30];
  uint64_t v3 = v0[31];
  uint64_t v4 = v0[19];
  uint64_t v5 = v0[20];
  uint64_t v6 = v0[18];
  uint64_t v7 = v0[4];
  sub_1D3C2EE60();
  sub_1D3C2F020();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[35] = v8;
  v0[36] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v8(v1, v2);
  __swift_project_boxed_opaque_existential_1((void *)(v7 + 40), *(void *)(v7 + 64));
  sub_1D3B61294();
  id v9 = objc_msgSend(self, sel_hk_gregorianCalendarWithUTCTimeZone);
  sub_1D3C2E480();

  __swift_project_boxed_opaque_existential_1((void *)(v7 + 40), *(void *)(v7 + 64));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD74970);
  sub_1D3C2E8F0();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v6, 1, v4) == 1)
  {
    uint64_t v10 = v0[18];
    sub_1D3C2E3E0();
    sub_1D3B5D398(v10);
  }
  else
  {
    (*(void (**)(void, void, void))(v0[20] + 32))(v0[23], v0[18], v0[19]);
  }
  uint64_t v11 = v0[26];
  uint64_t v12 = v0[27];
  uint64_t v13 = v0[25];
  uint64_t v14 = v0[23];
  uint64_t v15 = v0[20];
  uint64_t v38 = v0[19];
  uint64_t v16 = v0[16];
  uint64_t v17 = v0[17];
  uint64_t v18 = v0[15];
  sub_1D3C2E4B0();
  sub_1D3C2E2A0();
  id v19 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v0[37] = v19;
  v0[38] = (v11 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v19(v12, v13);
  unint64_t v20 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
  v0[39] = v20;
  v0[40] = (v15 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v20(v14, v38);
  uint64_t v21 = *MEMORY[0x1E4F27BF0];
  id v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 104);
  v22(v17, v21, v18);
  sub_1D3C2E2C0();
  id v23 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
  v23(v17, v18);
  v22(v17, v21, v18);
  sub_1D3C2E2C0();
  v23(v17, v18);
  sub_1D3C2E310();
  sub_1D3C2E310();
  id v24 = objc_msgSend(self, sel_sharedBehavior);
  if (!v24)
  {
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v26 = v24;
  id v27 = objc_msgSend(v24, sel_features);

  if (!v27)
  {
LABEL_14:
    __break(1u);
    return MEMORY[0x1F41197D8](v24, v25);
  }
  unsigned int v28 = objc_msgSend(v27, sel_scheduledGoals);

  if (v28)
  {
    int64_t v29 = (void *)v0[4];
    uint64_t v30 = v29[3];
    uint64_t v31 = v29[4];
    __swift_project_boxed_opaque_existential_1(v29, v30);
    uint64_t v32 = (void *)swift_task_alloc();
    v0[41] = v32;
    void *v32 = v0;
    v32[1] = sub_1D3C198F4;
    id v24 = (id)v30;
    uint64_t v25 = v31;
    return MEMORY[0x1F41197D8](v24, v25);
  }
  uint64_t v34 = v0[6];
  uint64_t v33 = v0[7];
  uint64_t v35 = v0[5];
  __swift_project_boxed_opaque_existential_1((void *)v0[4], *(void *)(v0[4] + 24));
  v0[2] = MEMORY[0x1E4FBC860];
  sub_1D3C1BF94((unint64_t *)&qword_1EBD749B0, MEMORY[0x1E4F61EE0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD762C0);
  sub_1D3B875E8();
  sub_1D3C2F5A0();
  sub_1D3C2EAD0();
  (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v33, v35);
  long long v39 = (uint64_t (__cdecl *)())((char *)&dword_1EA6B61B0 + dword_1EA6B61B0);
  uint64_t v36 = (void *)swift_task_alloc();
  v0[43] = v36;
  *uint64_t v36 = v0;
  v36[1] = sub_1D3C19E14;
  return v39();
}

uint64_t sub_1D3C198F4(char a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 336) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_1D3C1A704;
  }
  else
  {
    *(unsigned char *)(v4 + 368) = a1 & 1;
    uint64_t v5 = sub_1D3C19A20;
  }
  return MEMORY[0x1F4188298](v5, 0, 0);
}

uint64_t sub_1D3C19A20()
{
  if (*(unsigned char *)(v0 + 368) == 1)
  {
    sub_1D3C2EE60();
    uint64_t v1 = sub_1D3C2F030();
    os_log_type_t v2 = sub_1D3C2F410();
    if (os_log_type_enabled(v1, v2))
    {
      uint64_t v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_1D3B55000, v1, v2, "Goal schedules exist, not generating goal recommendation", v3, 2u);
      MEMORY[0x1D943DA70](v3, -1, -1);
    }
    uint64_t v4 = v1;
    uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
    id v27 = *(void (**)(uint64_t, uint64_t))(v0 + 296);
    unint64_t v20 = *(void (**)(uint64_t, uint64_t))(v0 + 280);
    uint64_t v6 = *(void *)(v0 + 264);
    uint64_t v7 = *(void *)(v0 + 240);
    uint64_t v25 = *(void *)(v0 + 224);
    uint64_t v26 = *(void *)(v0 + 232);
    uint64_t v23 = *(void *)(v0 + 192);
    uint64_t v24 = *(void *)(v0 + 200);
    uint64_t v21 = *(void *)(v0 + 168);
    uint64_t v22 = *(void *)(v0 + 176);
    uint64_t v8 = *(void *)(v0 + 152);
    uint64_t v10 = *(void *)(v0 + 104);
    uint64_t v9 = *(void *)(v0 + 112);
    uint64_t v12 = *(void *)(v0 + 88);
    uint64_t v11 = *(void *)(v0 + 96);

    v20(v6, v7);
    uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v13(v10, v12);
    v13(v9, v12);
    v5(v21, v8);
    v5(v22, v8);
    v5(v23, v8);
    v27(v25, v24);
    v27(v26, v24);
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v14 = *(uint64_t (**)(void, uint64_t))(v0 + 8);
    return v14(0, 1);
  }
  else
  {
    uint64_t v17 = *(void *)(v0 + 48);
    uint64_t v16 = *(void *)(v0 + 56);
    uint64_t v18 = *(void *)(v0 + 40);
    __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 32), *(void *)(*(void *)(v0 + 32) + 24));
    *(void *)(v0 + 16) = MEMORY[0x1E4FBC860];
    sub_1D3C1BF94((unint64_t *)&qword_1EBD749B0, MEMORY[0x1E4F61EE0]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD762C0);
    sub_1D3B875E8();
    sub_1D3C2F5A0();
    sub_1D3C2EAD0();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
    unsigned int v28 = (uint64_t (__cdecl *)())((char *)&dword_1EA6B61B0 + dword_1EA6B61B0);
    id v19 = (void *)swift_task_alloc();
    *(void *)(v0 + 344) = v19;
    *id v19 = v0;
    v19[1] = sub_1D3C19E14;
    return v28();
  }
}

uint64_t sub_1D3C19E14(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 352) = a1;
  *(void *)(v3 + 360) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_1D3C1AA48;
  }
  else {
    uint64_t v4 = sub_1D3C19F28;
  }
  return MEMORY[0x1F4188298](v4, 0, 0);
}

uint64_t sub_1D3C19F28()
{
  unint64_t v2 = v0[22].u64[0];
  uint64_t v3 = (int8x16_t *)swift_task_alloc();
  v3[1] = vextq_s8(v0[14], v0[14], 8uLL);
  uint64_t v4 = sub_1D3C1B038(sub_1D3C1BF74, (uint64_t)v3, v2);
  char v6 = v5;
  swift_task_dealloc();
  unint64_t v7 = v0[22].u64[0];
  char v74 = v6;
  if (v6)
  {
    uint64_t v12 = v0[4].i64[1];
    uint64_t v11 = v0[5].i64[0];
    uint64_t v13 = v0[4].i64[0];
    swift_bridgeObjectRelease();
    uint64_t v14 = sub_1D3C2E9C0();
    sub_1D3C1BF94(&qword_1EA6B6968, MEMORY[0x1E4F61E00]);
    uint64_t v15 = (void *)swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v14 - 8) + 104))(v16, *MEMORY[0x1E4F61DF8], v14);
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    sub_1D3C2EE60();
    id v17 = v15;
    id v18 = v15;
    id v19 = sub_1D3C2F030();
    os_log_type_t v20 = sub_1D3C2F3F0();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v21 = 138412290;
      id v23 = v15;
      uint64_t v24 = _swift_stdlib_bridgeErrorToNSError();
      v0[1].i64[1] = v24;
      sub_1D3C2F550();
      void *v22 = v24;

      _os_log_impl(&dword_1D3B55000, v19, v20, "Error creating weekly goal: %@", v21, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD76370);
      swift_arrayDestroy();
      MEMORY[0x1D943DA70](v22, -1, -1);
      MEMORY[0x1D943DA70](v21, -1, -1);
    }
    else
    {
    }
    uint64_t v25 = (void (*)(uint64_t, uint64_t))v0[19].i64[1];
    v70 = (void (*)(uint64_t, uint64_t))v0[18].i64[1];
    uint64_t v56 = (void (*)(uint64_t, uint64_t))v0[17].i64[1];
    uint64_t v26 = v0[16].i64[0];
    uint64_t v27 = v0[15].i64[0];
    uint64_t v66 = v0[14].i64[0];
    uint64_t v68 = v0[14].i64[1];
    uint64_t v63 = v0[12].i64[0];
    uint64_t v64 = v0[12].i64[1];
    uint64_t v59 = v0[10].i64[1];
    uint64_t v61 = v0[11].i64[0];
    uint64_t v28 = v0[9].i64[1];
    uint64_t v30 = v0[6].i64[1];
    uint64_t v29 = v0[7].i64[0];
    uint64_t v32 = v0[5].i64[1];
    uint64_t v31 = v0[6].i64[0];

    v56(v26, v27);
    uint64_t v33 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
    v33(v30, v32);
    v33(v29, v32);
    v25(v59, v28);
    v25(v61, v28);
    v25(v63, v28);
    v70(v66, v64);
    v70(v68, v64);
    id v72 = 0;
    goto LABEL_31;
  }
  unint64_t v8 = v7 >> 62;
  if (!(v7 >> 62))
  {
    unint64_t v9 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if ((uint64_t)v9 >= v4) {
      goto LABEL_4;
    }
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  swift_bridgeObjectRetain();
  unint64_t v9 = sub_1D3C2F7C0();
  uint64_t result = swift_bridgeObjectRelease();
  if ((uint64_t)v9 < v4)
  {
    __break(1u);
    return result;
  }
  uint64_t v1 = v0[22].i64[0];
  swift_bridgeObjectRetain();
  uint64_t v53 = sub_1D3C2F7C0();
  swift_bridgeObjectRelease();
  if (v53 < v4)
  {
    __break(1u);
    goto LABEL_37;
  }
LABEL_4:
  if (v4 < 0)
  {
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  if (v8)
  {
    uint64_t v1 = v0[22].i64[0];
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1D3C2F7C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v10 < (uint64_t)v9) {
    goto LABEL_39;
  }
  if ((v9 & 0x8000000000000000) != 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  if ((v7 & 0xC000000000000001) != 0 && v4 != v9)
  {
    if (v4 < v9)
    {
      sub_1D3C1BFDC();
      uint64_t v34 = v4;
      do
      {
        uint64_t v35 = v34 + 1;
        sub_1D3C2F710();
        uint64_t v34 = v35;
      }
      while (v9 != v35);
      goto LABEL_19;
    }
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
LABEL_19:
  if (v8)
  {
    swift_bridgeObjectRetain();
    unint64_t v7 = sub_1D3C2F7D0();
    uint64_t v1 = v38;
    uint64_t v4 = v39;
    unint64_t v9 = v40;
    swift_bridgeObjectRelease_n();
    if (v9)
    {
LABEL_21:
      sub_1D3C2F890();
      swift_unknownObjectRetain_n();
      uint64_t v36 = swift_dynamicCastClass();
      if (!v36)
      {
        swift_unknownObjectRelease();
        uint64_t v36 = MEMORY[0x1E4FBC860];
      }
      uint64_t v37 = *(void *)(v36 + 16);
      swift_release();
      if (!__OFSUB__(v9 >> 1, v4))
      {
        if (v37 == (v9 >> 1) - v4)
        {
          if (!swift_dynamicCastClass()) {
            swift_unknownObjectRelease();
          }
          goto LABEL_30;
        }
        goto LABEL_43;
      }
LABEL_42:
      __break(1u);
LABEL_43:
      swift_unknownObjectRelease();
      goto LABEL_29;
    }
  }
  else
  {
    v7 &= 0xFFFFFFFFFFFFFF8uLL;
    uint64_t v1 = v7 + 32;
    unint64_t v9 = (2 * v9) | 1;
    if (v9) {
      goto LABEL_21;
    }
  }
  swift_unknownObjectRetain();
LABEL_29:
  sub_1D3C07744(v7, v1, v4, v9);
LABEL_30:
  v41 = (void (*)(uint64_t, uint64_t))v0[19].i64[1];
  v71 = (void (*)(uint64_t, uint64_t))v0[18].i64[1];
  id v73 = (id)v0[14].i64[1];
  uint64_t v67 = v0[12].i64[1];
  uint64_t v69 = v0[14].i64[0];
  uint64_t v65 = v0[12].i64[0];
  uint64_t v60 = v0[10].i64[1];
  uint64_t v62 = v0[11].i64[0];
  uint64_t v42 = v0[9].i64[1];
  uint64_t v43 = v0[6].i64[0];
  uint64_t v57 = v0[6].i64[1];
  uint64_t v58 = v0[7].i64[0];
  uint64_t v44 = v0[5].i64[1];
  uint64_t v45 = v0[4].i64[1];
  uint64_t v54 = v0[4].i64[0];
  uint64_t v55 = v0[5].i64[0];
  swift_unknownObjectRelease();
  uint64_t v46 = self;
  sub_1D3C1BFDC();
  uint64_t v47 = (void *)sub_1D3C2F220();
  swift_release();
  objc_msgSend(v46, sel_recommendedNewWeeklyGoalForActivitySummaries_, v47);
  char v49 = v48;

  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v55, v54);
  long long v50 = *(void (**)(uint64_t, uint64_t))(v43 + 8);
  v50(v57, v44);
  v50(v58, v44);
  v41(v60, v42);
  v41(v62, v42);
  v41(v65, v42);
  v71(v69, v67);
  v71((uint64_t)v73, v67);
  id v72 = v49;
LABEL_31:
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v51 = (uint64_t (*)(id, void))v0->i64[1];
  return v51(v72, v74 & 1);
}

uint64_t sub_1D3C1A704()
{
  uint64_t v1 = (void *)v0[42];
  sub_1D3C2EE60();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_1D3C2F030();
  os_log_type_t v5 = sub_1D3C2F3F0();
  id v29 = v1;
  if (os_log_type_enabled(v4, v5))
  {
    char v6 = (uint8_t *)swift_slowAlloc();
    unint64_t v7 = (void *)swift_slowAlloc();
    *(_DWORD *)char v6 = 138412290;
    id v8 = v1;
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v9;
    sub_1D3C2F550();
    *unint64_t v7 = v9;

    _os_log_impl(&dword_1D3B55000, v4, v5, "Error creating weekly goal: %@", v6, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD76370);
    swift_arrayDestroy();
    MEMORY[0x1D943DA70](v7, -1, -1);
    MEMORY[0x1D943DA70](v6, -1, -1);
  }
  else
  {
  }
  uint64_t v10 = (void (*)(uint64_t, uint64_t))v0[39];
  uint64_t v28 = (void (*)(uint64_t, uint64_t))v0[37];
  uint64_t v21 = (void (*)(uint64_t, uint64_t))v0[35];
  uint64_t v11 = v0[32];
  uint64_t v12 = v0[30];
  uint64_t v26 = v0[28];
  uint64_t v27 = v0[29];
  uint64_t v24 = v0[24];
  uint64_t v25 = v0[25];
  uint64_t v22 = v0[21];
  uint64_t v23 = v0[22];
  uint64_t v13 = v0[19];
  uint64_t v15 = v0[13];
  uint64_t v14 = v0[14];
  uint64_t v17 = v0[11];
  uint64_t v16 = v0[12];

  v21(v11, v12);
  id v18 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
  v18(v15, v17);
  v18(v14, v17);
  v10(v22, v13);
  v10(v23, v13);
  v10(v24, v13);
  v28(v26, v25);
  v28(v27, v25);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v19 = (uint64_t (*)(void, uint64_t))v0[1];
  return v19(0, 1);
}

uint64_t sub_1D3C1AA48()
{
  (*(void (**)(void, void))(v0[9] + 8))(v0[10], v0[8]);
  uint64_t v1 = (void *)v0[45];
  sub_1D3C2EE60();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_1D3C2F030();
  os_log_type_t v5 = sub_1D3C2F3F0();
  id v29 = v1;
  if (os_log_type_enabled(v4, v5))
  {
    char v6 = (uint8_t *)swift_slowAlloc();
    unint64_t v7 = (void *)swift_slowAlloc();
    *(_DWORD *)char v6 = 138412290;
    id v8 = v1;
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v9;
    sub_1D3C2F550();
    *unint64_t v7 = v9;

    _os_log_impl(&dword_1D3B55000, v4, v5, "Error creating weekly goal: %@", v6, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD76370);
    swift_arrayDestroy();
    MEMORY[0x1D943DA70](v7, -1, -1);
    MEMORY[0x1D943DA70](v6, -1, -1);
  }
  else
  {
  }
  uint64_t v10 = (void (*)(uint64_t, uint64_t))v0[39];
  uint64_t v28 = (void (*)(uint64_t, uint64_t))v0[37];
  uint64_t v21 = (void (*)(uint64_t, uint64_t))v0[35];
  uint64_t v11 = v0[32];
  uint64_t v12 = v0[30];
  uint64_t v26 = v0[28];
  uint64_t v27 = v0[29];
  uint64_t v24 = v0[24];
  uint64_t v25 = v0[25];
  uint64_t v22 = v0[21];
  uint64_t v23 = v0[22];
  uint64_t v13 = v0[19];
  uint64_t v15 = v0[13];
  uint64_t v14 = v0[14];
  uint64_t v17 = v0[11];
  uint64_t v16 = v0[12];

  v21(v11, v12);
  id v18 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
  v18(v15, v17);
  v18(v14, v17);
  v10(v22, v13);
  v10(v23, v13);
  v10(v24, v13);
  v28(v26, v25);
  v28(v27, v25);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v19 = (uint64_t (*)(void, uint64_t))v0[1];
  return v19(0, 1);
}

uint64_t sub_1D3C1ADA4(void **a1, uint64_t a2)
{
  uint64_t v20 = a2;
  uint64_t v3 = sub_1D3C2E1B0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  char v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD74670);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1D3C2E3F0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *a1;
  uint64_t v15 = (void *)sub_1D3C2E470();
  id v16 = objc_msgSend(v14, sel_dateComponentsForCalendar_, v15, v14, v20);

  sub_1D3C2E190();
  sub_1D3C2E490();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_1D3B5D398((uint64_t)v9);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v9, v10);
    if (sub_1D3C2E290()) {
      uint64_t HasNonZeroMoveGoal = FIActivitySummaryHasNonZeroMoveGoal();
    }
    else {
      uint64_t HasNonZeroMoveGoal = 0;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  return HasNonZeroMoveGoal;
}

uint64_t sub_1D3C1B038(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62) {
    goto LABEL_14;
  }
  uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v7 = 0;
  if (v6)
  {
    while (1)
    {
      id v8 = (a3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1D943CEB0](v7, a3) : *(id *)(a3 + 8 * v7 + 32);
      uint64_t v9 = v8;
      id v13 = v8;
      char v10 = a1(&v13);

      if (v3 || (v10 & 1) != 0) {
        break;
      }
      uint64_t v11 = v7 + 1;
      if (__OFADD__(v7, 1))
      {
        __break(1u);
LABEL_14:
        swift_bridgeObjectRetain();
        uint64_t v6 = sub_1D3C2F7C0();
        swift_bridgeObjectRelease();
        uint64_t v7 = 0;
        if (!v6) {
          return v7;
        }
      }
      else
      {
        ++v7;
        if (v11 == v6) {
          return 0;
        }
      }
    }
  }
  return v7;
}

uint64_t sub_1D3C1B154(uint64_t a1, char a2, double a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD74670);
  MEMORY[0x1F4188790](v6 - 8);
  id v8 = (char *)&v80 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = sub_1D3C2E3F0();
  uint64_t v89 = *(void *)(v87 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v87);
  v83 = (void (*)(char *, uint64_t))((char *)&v80 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  v82 = (char *)&v80 - v12;
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  uint64_t v15 = (char *)&v80 - v14;
  MEMORY[0x1F4188790](v13);
  v86 = (char *)&v80 - v16;
  uint64_t v17 = sub_1D3C2F040();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x1F4188790](v17);
  uint64_t v21 = (char *)&v80 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x1F4188790](v19);
  uint64_t v24 = (char *)&v80 - v23;
  uint64_t v25 = MEMORY[0x1F4188790](v22);
  v85 = (char *)&v80 - v26;
  uint64_t v27 = MEMORY[0x1F4188790](v25);
  v84 = (char *)&v80 - v28;
  MEMORY[0x1F4188790](v27);
  uint64_t v30 = (char *)&v80 - v29;
  sub_1D3C2EE60();
  sub_1D3C2F020();
  uint64_t v31 = *(uint64_t (**)(char *, uint64_t))(v18 + 8);
  uint64_t v90 = v17;
  uint64_t v91 = v18 + 8;
  uint64_t result = v31(v30, v17);
  if (a2) {
    return 0;
  }
  if (*(double *)&a1 <= -9.22337204e18)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (*(double *)&a1 >= 9.22337204e18)
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if ((a1 & 0x7FF0000000000000) == 0x7FF0000000000000
    || (*(void *)&a3 & 0x7FF0000000000000) == 0x7FF0000000000000)
  {
    goto LABEL_30;
  }
  if (a3 <= -9.22337204e18)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  if (a3 < 9.22337204e18)
  {
    if (a1 == *(uint64_t *)&a3)
    {
      sub_1D3C2EE60();
      uint64_t v33 = sub_1D3C2F030();
      os_log_type_t v34 = sub_1D3C2F410();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v35 = 0;
        _os_log_impl(&dword_1D3B55000, v33, v34, "Goal recommendation matches current goal", v35, 2u);
        MEMORY[0x1D943DA70](v35, -1, -1);
      }

      v31(v21, v90);
    }
    else
    {
      uint64_t v37 = v88;
      id v38 = objc_msgSend(v88[10], sel_currentDisplayContext, *(double *)&a1);
      if (!v38)
      {
        sub_1D3C2EE60();
        uint64_t v43 = sub_1D3C2F030();
        os_log_type_t v44 = sub_1D3C2F410();
        if (os_log_type_enabled(v43, v44))
        {
          uint64_t v45 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v45 = 0;
          _os_log_impl(&dword_1D3B55000, v43, v44, "Goal recommendation allow, no display context", v45, 2u);
          MEMORY[0x1D943DA70](v45, -1, -1);
        }

        v31(v24, v90);
        return 1;
      }
      uint64_t v39 = v38;
      uint64_t v40 = (uint64_t)v86;
      sub_1D3C18B94(v38, (uint64_t)v86);
      __swift_project_boxed_opaque_existential_1(v37 + 5, (uint64_t)v37[8]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD74970);
      sub_1D3C2E8F0();
      uint64_t v41 = v89;
      uint64_t v42 = v87;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v89 + 48))(v8, 1, v87) == 1)
      {
        sub_1D3C2E3E0();
        sub_1D3B5D398((uint64_t)v8);
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v15, v8, v42);
      }
      char v46 = sub_1D3C2E2F0();
      uint64_t v47 = *(void (**)(char *, uint64_t))(v41 + 8);
      v47(v15, v42);
      uint64_t v89 = v41 + 8;
      unint64_t v48 = (void (**)(char *, uint64_t, uint64_t))(v41 + 16);
      if (v46)
      {
        char v49 = v84;
        sub_1D3C2EE60();
        long long v50 = v82;
        (*v48)(v82, v40, v42);
        id v51 = v39;
        uint64_t v52 = v40;
        uint64_t v53 = sub_1D3C2F030();
        os_log_type_t v54 = sub_1D3C2F410();
        v88 = (id *)v39;
        os_log_type_t v55 = v54;
        if (os_log_type_enabled(v53, v54))
        {
          uint64_t v56 = swift_slowAlloc();
          uint64_t v57 = swift_slowAlloc();
          v83 = (void (*)(char *, uint64_t))v31;
          v81 = (void *)v57;
          v85 = (char *)swift_slowAlloc();
          v93 = v85;
          *(_DWORD *)uint64_t v56 = 136315394;
          sub_1D3C1BF94((unint64_t *)&qword_1EBD764E0, MEMORY[0x1E4F27928]);
          uint64_t v58 = sub_1D3C2F860();
          uint64_t v92 = sub_1D3B5E520(v58, v59, (uint64_t *)&v93);
          sub_1D3C2F550();
          swift_bridgeObjectRelease();
          v47(v50, v42);
          *(_WORD *)(v56 + 12) = 2112;
          uint64_t v92 = (uint64_t)v51;
          id v60 = v51;
          sub_1D3C2F550();
          uint64_t v61 = v81;
          void *v81 = v88;

          _os_log_impl(&dword_1D3B55000, v53, v55, "Goal recommendation allow, next valid date %s, display context: %@", (uint8_t *)v56, 0x16u);
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD76370);
          uint64_t v36 = 1;
          swift_arrayDestroy();
          MEMORY[0x1D943DA70](v61, -1, -1);
          uint64_t v62 = v85;
          swift_arrayDestroy();
          MEMORY[0x1D943DA70](v62, -1, -1);
          MEMORY[0x1D943DA70](v56, -1, -1);

          v83(v84, v90);
          v47(v86, v87);
        }
        else
        {

          v47(v50, v42);
          v31(v49, v90);
          v47((char *)v52, v42);
          return 1;
        }
        return v36;
      }
      v84 = (char *)v47;
      uint64_t v63 = v85;
      sub_1D3C2EE60();
      uint64_t v64 = (char *)v83;
      (*v48)((char *)v83, v40, v42);
      id v65 = v39;
      uint64_t v66 = v40;
      uint64_t v67 = sub_1D3C2F030();
      uint64_t v68 = (id *)v39;
      os_log_type_t v69 = sub_1D3C2F410();
      if (os_log_type_enabled(v67, v69))
      {
        uint64_t v70 = swift_slowAlloc();
        v88 = v68;
        uint64_t v71 = v70;
        v81 = (void *)swift_slowAlloc();
        v82 = (char *)swift_slowAlloc();
        v93 = v82;
        *(_DWORD *)uint64_t v71 = 136315394;
        sub_1D3C1BF94((unint64_t *)&qword_1EBD764E0, MEMORY[0x1E4F27928]);
        uint64_t v72 = sub_1D3C2F860();
        uint64_t v92 = sub_1D3B5E520(v72, v73, (uint64_t *)&v93);
        sub_1D3C2F550();
        swift_bridgeObjectRelease();
        char v74 = v64;
        uint64_t v75 = (void (*)(uint64_t, uint64_t))v84;
        ((void (*)(char *, uint64_t))v84)(v74, v42);
        *(_WORD *)(v71 + 12) = 2112;
        v83 = (void (*)(char *, uint64_t))v31;
        uint64_t v92 = (uint64_t)v65;
        id v76 = v65;
        sub_1D3C2F550();
        v77 = v81;
        void *v81 = v88;

        _os_log_impl(&dword_1D3B55000, v67, v69, "Goal recommendation not allow, next valid date: %s, display context: %@", (uint8_t *)v71, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD76370);
        swift_arrayDestroy();
        MEMORY[0x1D943DA70](v77, -1, -1);
        v78 = v82;
        swift_arrayDestroy();
        MEMORY[0x1D943DA70](v78, -1, -1);
        MEMORY[0x1D943DA70](v71, -1, -1);

        v83(v85, v90);
        v75((uint64_t)v86, v87);
      }
      else
      {

        v79 = (void (*)(uint64_t, uint64_t))v84;
        ((void (*)(char *, uint64_t))v84)(v64, v42);

        v31(v63, v90);
        v79(v66, v42);
      }
    }
    return 0;
  }
LABEL_32:
  __break(1u);
  return result;
}

char *sub_1D3C1BC20()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD74670);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1D3C2E3F0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  id v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1D3C2F040();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D3C2EE60();
  sub_1D3C2F020();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  __swift_project_boxed_opaque_existential_1(v1 + 5, v1[8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD74970);
  sub_1D3C2E8F0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_1D3C2E3E0();
    sub_1D3B5D398((uint64_t)v4);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  }
  uint64_t v13 = (void *)v1[10];
  id v14 = objc_msgSend(v13, sel_currentDisplayContext);
  if (!v14)
  {
    id v21 = objc_allocWithZone(MEMORY[0x1E4F62140]);
    uint64_t v22 = (void *)sub_1D3C2E3A0();
    id v20 = objc_msgSend(v21, sel_initWithDisplayCount_lastDisplayDate_, 1, v22);

    objc_msgSend(v13, sel_updateDisplayContext_, v20);
    goto LABEL_8;
  }
  uint64_t v15 = v14;
  uint64_t result = (char *)objc_msgSend(v14, sel_displayCount);
  uint64_t v17 = result + 1;
  if (!__OFADD__(result, 1))
  {
    id v18 = objc_allocWithZone(MEMORY[0x1E4F62140]);
    uint64_t v19 = (void *)sub_1D3C2E3A0();
    id v20 = objc_msgSend(v18, sel_initWithDisplayCount_lastDisplayDate_, v17, v19);

    objc_msgSend(v13, sel_updateDisplayContext_, v20);
LABEL_8:

    return (char *)(*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  __break(1u);
  return result;
}

uint64_t sub_1D3C1BF74(void **a1)
{
  return sub_1D3C1ADA4(a1, *(void *)(v1 + 16)) & 1;
}

uint64_t sub_1D3C1BF94(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1D3C1BFDC()
{
  unint64_t result = qword_1EBD76C60;
  if (!qword_1EBD76C60)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBD76C60);
  }
  return result;
}

ValueMetadata *type metadata accessor for WeeklyGoalProvider()
{
  return &type metadata for WeeklyGoalProvider;
}

unint64_t sub_1D3C1C02C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD76CA8);
  uint64_t v2 = (void *)sub_1D3C2F800();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_1D3C13E34(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
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

unint64_t sub_1D3C1C148(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD74720);
  uint64_t v2 = sub_1D3C2F800();
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
    sub_1D3BB0BA8(v6, (uint64_t)v15, &qword_1EBD74710);
    unint64_t result = sub_1D3C13EAC((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_1D3C0CCF8(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
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

unint64_t sub_1D3C1C28C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6B68F0);
  uint64_t v2 = (void *)sub_1D3C2F800();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (unsigned char *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    char v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_1D3C13E34(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    long long v10 = (uint64_t *)(v2[6] + 16 * result);
    *long long v10 = v5;
    v10[1] = v6;
    *(unsigned char *)(v2[7] + result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 24;
    v2[2] = v13;
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

unint64_t sub_1D3C1C3A0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD762B8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (void *)((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    char v7 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD76CA0);
  uint64_t v6 = sub_1D3C2F800();
  char v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = (uint64_t)v5 + *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v25[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_1D3BB0BA8(v12, (uint64_t)v5, &qword_1EBD762B8);
    uint64_t v14 = *v5;
    uint64_t v15 = v5[1];
    unint64_t result = sub_1D3C13E34(*v5, v15);
    if (v17) {
      break;
    }
    unint64_t v18 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v19 = (uint64_t *)(v7[6] + 16 * result);
    *uint64_t v19 = v14;
    v19[1] = v15;
    uint64_t v20 = v7[7];
    uint64_t v21 = type metadata accessor for NotificationRequest();
    unint64_t result = sub_1D3C2BA10(v9, v20 + *(void *)(*(void *)(v21 - 8) + 72) * v18, (uint64_t (*)(void))type metadata accessor for NotificationRequest);
    uint64_t v22 = v7[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23) {
      goto LABEL_11;
    }
    v7[2] = v24;
    v12 += v13;
    if (!--v8)
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

uint64_t Daemon.bundleIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Daemon.init()@<X0>(void *a1@<X8>)
{
  uint64_t v2 = (uint64_t *)sub_1D3C2E790();
  v489 = (uint64_t *)*(v2 - 1);
  v490 = v2;
  MEMORY[0x1F4188790](v2);
  v491 = (char *)&v476 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v508 = (uint64_t *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EBD74670);
  MEMORY[0x1F4188790](v508);
  v506 = (ValueMetadata *)((char *)&v476 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v507 = (uint64_t *)sub_1D3C2E9B0();
  v505 = (uint64_t *)*(v507 - 1);
  MEMORY[0x1F4188790](v507);
  uint64_t v6 = (char *)&v476 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1D3C2F040();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v476 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a1 = 0xD00000000000001ALL;
  a1[1] = 0x80000001D3C356C0;
  v504 = (void *)0x80000001D3C356C0;
  sub_1D3C2EE60();
  unint64_t v11 = sub_1D3C2F030();
  os_log_type_t v12 = sub_1D3C2F410();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_1D3B55000, v11, v12, "Starting Up...", v13, 2u);
    MEMORY[0x1D943DA70](v13, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F62088]), sel_init);
  a1[32] = v14;
  v509 = a1 + 38;
  v497 = (ValueMetadata *)type metadata accessor for DateProvider();
  a1[41] = v497;
  a1[42] = &off_1F2B4A0B8;
  __swift_allocate_boxed_opaque_existential_1(a1 + 38);
  uint64_t v15 = (void (*)(void, void, void))v505[13];
  uint64_t v16 = (uint64_t)v507;
  v15(v6, *MEMORY[0x1E4F61DC8], v507);
  uint64_t v17 = sub_1D3C2E3F0();
  (*(void (**)(ValueMetadata *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v506, 1, 1, v17);
  sub_1D3B61230(&qword_1EBD74968, &qword_1EBD74670);
  v487 = (uint64_t *)v14;
  sub_1D3C2E910();
  v15(v6, *MEMORY[0x1E4F61DF0], v16);
  long long v513 = 0uLL;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD746E8);
  sub_1D3B61230(&qword_1EBD762B0, &qword_1EBD746E8);
  sub_1D3C2E910();
  v498 = a1 + 43;
  a1[46] = &type metadata for DuetObserver;
  a1[47] = &off_1F2B4AAF0;
  v508 = a1 + 33;
  a1[36] = &type metadata for BiomeObserver;
  a1[37] = &off_1F2B4B4B8;
  unint64_t v18 = self;
  id v19 = objc_msgSend(v18, sel_defaultCenter);
  uint64_t v20 = type metadata accessor for FitnessModeObserver();
  uint64_t v21 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v21 + 112) = v19;
  *(_DWORD *)(v21 + 120) = 0;
  *(unsigned char *)(v21 + 124) = 1;
  v503 = a1 + 48;
  a1[51] = v20;
  a1[52] = &off_1F2B4C3B8;
  a1[48] = v21;
  id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F2B0B8]), sel_init);
  a1[100] = v22;
  uint64_t v23 = type metadata accessor for LanguageChangeObserver();
  uint64_t v24 = swift_allocObject();
  id v25 = v22;
  swift_defaultActor_initialize();
  *(_DWORD *)(v24 + 112) = 0;
  *(unsigned char *)(v24 + 116) = 1;
  a1[134] = v23;
  a1[135] = &off_1F2B49E88;
  a1[131] = v24;
  v500 = a1 + 212;
  a1[215] = &type metadata for LockStateProvider;
  a1[216] = &off_1F2B4A0A0;
  id v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA5570]), sel_init);
  a1[220] = v26;
  id v27 = objc_allocWithZone(MEMORY[0x1E4F61C80]);
  v507 = (uint64_t *)v26;
  id v28 = objc_msgSend(v27, sel_initWithHealthStore_, v25);
  a1[221] = v28;
  id v29 = objc_allocWithZone(MEMORY[0x1E4F61C68]);
  v495 = (uint64_t *)v28;
  id v30 = objc_msgSend(v29, sel_initWithHealthStore_, v25);
  a1[196] = v30;
  type metadata accessor for XPCActivityScheduler();
  uint64_t v31 = swift_allocObject();
  uint64_t v499 = v31;
  id v493 = v30;
  swift_defaultActor_initialize();
  a1[238] = v31;
  v506 = (ValueMetadata *)sub_1D3C2E8E0();
  swift_retain();
  uint64_t v32 = (void *)sub_1D3C2E8D0();
  a1[241] = v32;
  id v492 = v32;
  uint64_t v33 = (uint64_t *)v18;
  a1[239] = objc_msgSend(v18, (SEL)&byte_1E69BA1CD);
  a1[240] = &unk_1F2B49CD0;
  v504 = a1 + 22;
  uint64_t v34 = sub_1D3C2E9E0();
  uint64_t v35 = MEMORY[0x1E4F61E10];
  a1[25] = v34;
  a1[26] = v35;
  __swift_allocate_boxed_opaque_existential_1(a1 + 22);
  id v494 = v25;
  sub_1D3C2E9D0();
  uint64_t v36 = (uint64_t)v509;
  sub_1D3B60858((uint64_t)v509, (uint64_t)&v513);
  id v502 = a1 + 69;
  a1[72] = type metadata accessor for FirstPickupDateValidator();
  a1[73] = &off_1F2B4BE00;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a1 + 69);
  sub_1D3BB60EC(&v513, (uint64_t)boxed_opaque_existential_1);
  sub_1D3B60858(v36, (uint64_t)&v513);
  uint64_t v38 = (uint64_t)v498;
  sub_1D3B60858((uint64_t)v498, (uint64_t)&v510);
  id v39 = objc_msgSend(v18, (SEL)&byte_1E69BA1CD);
  LOBYTE(v36) = sub_1D3C2EF00();
  uint64_t v40 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v513, v514);
  MEMORY[0x1F4188790](v40);
  uint64_t v42 = (char *)&v476 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v43 + 16))(v42);
  uint64_t v44 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v510, (uint64_t)v511);
  MEMORY[0x1F4188790](v44);
  (*(void (**)(void))(v45 + 16))();
  id v46 = sub_1D3C29270((uint64_t)v42, v39, v36);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v510);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v513);
  a1[218] = v46;
  a1[219] = &off_1F2B49FA0;
  id v47 = objc_allocWithZone(MEMORY[0x1E4F61C70]);
  unint64_t v48 = v507;
  id v49 = objc_msgSend(v47, sel_initWithSleepStore_delegate_, v507, v46);

  a1[217] = v49;
  sub_1D3B60858((uint64_t)v508, (uint64_t)&v513);
  uint64_t v50 = (uint64_t)v509;
  sub_1D3B60858((uint64_t)v509, (uint64_t)&v510);
  sub_1D3B60858((uint64_t)v502, (uint64_t)&v536);
  sub_1D3B60858(v38, (uint64_t)&v533);
  v508 = (uint64_t *)v49;
  v505 = v33;
  id v502 = objc_msgSend(v33, sel_defaultCenter);
  LODWORD(v501) = sub_1D3C2EF00();
  uint64_t v51 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v513, v514);
  v507 = &v476;
  MEMORY[0x1F4188790](v51);
  (*(void (**)(void))(v52 + 16))();
  uint64_t v53 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v510, (uint64_t)v511);
  MEMORY[0x1F4188790](v53);
  os_log_type_t v55 = (char *)&v476 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v56 + 16))(v55);
  uint64_t v57 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v536, (uint64_t)v537);
  MEMORY[0x1F4188790](v57);
  unint64_t v59 = (char *)&v476 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v60 + 16))(v59);
  uint64_t v61 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v533, (uint64_t)v534);
  MEMORY[0x1F4188790](v61);
  (*(void (**)(void))(v62 + 16))();
  uint64_t v63 = sub_1D3C25844((uint64_t)v55, (uint64_t)v59, (uint64_t)v502, (char)v501);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v533);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v536);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v510);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v513);
  id v502 = a1 + 74;
  a1[77] = type metadata accessor for FirstPickupObserver(0);
  a1[78] = &off_1F2B4B570;
  a1[74] = v63;
  sub_1D3B60858(v50, (uint64_t)&v513);
  sub_1D3B60858((uint64_t)(a1 + 74), (uint64_t)&v510);
  id v64 = objc_msgSend(v33, sel_defaultCenter);
  uint64_t v65 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v513, v514);
  MEMORY[0x1F4188790](v65);
  uint64_t v67 = (char *)&v476 - ((v66 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v68 + 16))(v67);
  uint64_t v69 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v510, (uint64_t)v511);
  MEMORY[0x1F4188790](v69);
  uint64_t v71 = (uint64_t *)((char *)&v476 - ((v70 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v72 + 16))(v71);
  unint64_t v73 = sub_1D3C25C8C((uint64_t)v67, *v71, (uint64_t)v508, (uint64_t)v64);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v510);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v513);
  v501 = a1 + 222;
  a1[225] = type metadata accessor for UserDayProvider();
  a1[226] = &off_1F2B4BD10;
  a1[222] = v73;
  a1[30] = &type metadata for NotificationSettingsProvider;
  a1[31] = &off_1F2B4A518;
  uint64_t v74 = swift_allocObject();
  a1[27] = v74;
  v488 = a1 + 27;
  uint64_t v75 = (uint64_t)v503;
  sub_1D3B60858((uint64_t)v503, v74 + 16);
  *(void *)(v74 + 56) = 0xD000000000000019;
  *(void *)(v74 + 64) = 0x80000001D3C38B60;
  v508 = a1 + 146;
  a1[149] = &type metadata for NotificationSettingsProvider;
  a1[150] = &off_1F2B4A518;
  uint64_t v76 = swift_allocObject();
  a1[146] = v76;
  sub_1D3B60858(v75, v76 + 16);
  *(void *)(v76 + 56) = 0xD000000000000017;
  *(void *)(v76 + 64) = 0x80000001D3C38B80;
  v507 = a1 + 207;
  a1[210] = &type metadata for PrivacySettingsProvider;
  a1[211] = &off_1F2B4C1A8;
  uint64_t v77 = type metadata accessor for NotificationRequestStore();
  uint64_t v78 = swift_allocObject();
  swift_defaultActor_initialize();
  uint64_t v79 = MEMORY[0x1E4FBC860];
  *(void *)(v78 + 112) = sub_1D3C1C3A0(MEMORY[0x1E4FBC860]);
  a1[179] = v77;
  a1[180] = &off_1F2B4DA48;
  a1[176] = v78;
  sub_1D3C2EF00();
  sub_1D3C2EF20();
  id v80 = objc_allocWithZone(MEMORY[0x1E4F44680]);
  v81 = (void *)sub_1D3C2F180();
  swift_bridgeObjectRelease();
  id v82 = objc_msgSend(v80, sel_initWithBundleIdentifier_, v81);

  a1[227] = v82;
  v496 = a1 + 161;
  a1[164] = &type metadata for NotificationRequestPublisher;
  a1[165] = &off_1F2B4BC60;
  a1[161] = v82;
  sub_1D3B60858((uint64_t)v498, (uint64_t)&v513);
  sub_1D3B60858((uint64_t)(a1 + 161), (uint64_t)&v510);
  sub_1D3B60858((uint64_t)v500, (uint64_t)&v536);
  uint64_t v83 = swift_allocObject();
  id v84 = v82;
  swift_defaultActor_initialize();
  *(void *)(v83 + 112) = sub_1D3C1C3A0(v79);
  uint64_t v85 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v513, v514);
  MEMORY[0x1F4188790](v85);
  (*(void (**)(void))(v86 + 16))();
  uint64_t v87 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v510, (uint64_t)v511);
  MEMORY[0x1F4188790](v87);
  uint64_t v89 = (uint64_t *)((char *)&v476 - ((v88 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v90 + 16))(v89);
  uint64_t v91 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v536, (uint64_t)v537);
  MEMORY[0x1F4188790](v91);
  (*(void (**)(void))(v92 + 16))();
  uint64_t v93 = sub_1D3C25EE8(*v89, v83);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v536);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v510);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v513);
  v498 = a1 + 166;
  a1[169] = type metadata accessor for NotificationRequestScheduler();
  a1[170] = &off_1F2B4A6E0;
  a1[166] = v93;
  a1[174] = &type metadata for NotificationRequestServiceFactory;
  a1[175] = &off_1F2B4B9E8;
  a1[171] = v84;
  sub_1D3B60858((uint64_t)(a1 + 171), (uint64_t)&v513);
  uint64_t v94 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v513, v514);
  v485 = &v476;
  MEMORY[0x1F4188790](v94);
  v96 = (uint64_t *)((char *)&v476 - ((v95 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v97 + 16))(v96);
  uint64_t v98 = *v96;
  v511 = &type metadata for NotificationRequestServiceFactory;
  v512 = &off_1F2B4B9E8;
  *(void *)&long long v510 = v98;
  v537 = v506;
  v538 = (_UNKNOWN **)MEMORY[0x1E4F61CD0];
  v99 = v492;
  *(void *)&long long v536 = v492;
  uint64_t v100 = type metadata accessor for NotificationRequestListener();
  uint64_t v101 = swift_allocObject();
  uint64_t v102 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v510, (uint64_t)&type metadata for NotificationRequestServiceFactory);
  MEMORY[0x1F4188790](v102);
  v104 = (uint64_t *)((char *)&v476 - ((v103 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v105 + 16))(v104);
  uint64_t v106 = *v104;
  v534 = &type metadata for NotificationRequestServiceFactory;
  v535 = &off_1F2B4B9E8;
  *(void *)&long long v533 = v106;
  v486 = v99;
  id v492 = v84;
  swift_defaultActor_initialize();
  sub_1D3B819AC(&v533, v101 + 112);
  sub_1D3B819AC(&v536, v101 + 152);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v510);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v513);
  a1[159] = v100;
  a1[160] = &off_1F2B4D328;
  a1[156] = v101;
  sub_1D3B60858((uint64_t)v488, (uint64_t)&v513);
  sub_1D3B60858((uint64_t)v508, (uint64_t)&v510);
  id v107 = objc_msgSend(v505, sel_defaultCenter);
  LOBYTE(v83) = sub_1D3C2EF00();
  uint64_t v108 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v513, v514);
  MEMORY[0x1F4188790](v108);
  v110 = (char *)&v476 - ((v109 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v111 + 16))(v110);
  uint64_t v112 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v510, (uint64_t)v511);
  MEMORY[0x1F4188790](v112);
  v114 = (char *)&v476 - ((v113 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v115 + 16))(v114);
  uint64_t v116 = sub_1D3C26214((uint64_t)v110, (uint64_t)v114, (uint64_t)v107, v83);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v510);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v513);
  a1[184] = type metadata accessor for NotificationSettingsSystem();
  a1[185] = &off_1F2B4A3E8;
  a1[181] = v116;
  sub_1D3B60858((uint64_t)v509, (uint64_t)&v513);
  v485 = (uint64_t *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F62118]), sel_init);
  id v117 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F62150]), sel_init);
  uint64_t v118 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v513, v514);
  v488 = &v476;
  MEMORY[0x1F4188790](v118);
  v120 = (char *)&v476 - ((v119 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v121 + 16))(v120);
  v122 = v497;
  v511 = v497;
  v512 = &off_1F2B4A0B8;
  v123 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v510);
  sub_1D3C2BA10((uint64_t)v120, (uint64_t)v123, (uint64_t (*)(void))type metadata accessor for DateProvider);
  v124 = (ValueMetadata *)type metadata accessor for NotificationSuppressionSystem();
  uint64_t v125 = swift_allocObject();
  uint64_t v126 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v510, (uint64_t)v511);
  MEMORY[0x1F4188790](v126);
  v128 = (char *)&v476 - ((v127 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v129 + 16))(v128);
  v537 = v122;
  v538 = &off_1F2B4A0B8;
  v130 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v536);
  sub_1D3C2BA10((uint64_t)v128, (uint64_t)v130, (uint64_t (*)(void))type metadata accessor for DateProvider);
  sub_1D3B60858((uint64_t)&v536, v125 + 16);
  *(void *)(v125 + 56) = v485;
  *(void *)(v125 + 64) = v117;
  objc_msgSend(v117, sel_setDelegate_, v125);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v536);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v510);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v513);
  a1[194] = v124;
  a1[195] = &off_1F2B4C9E8;
  a1[191] = v125;
  sub_1D3B60858((uint64_t)(a1 + 191), (uint64_t)&v513);
  uint64_t v131 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v513, v514);
  v497 = (ValueMetadata *)&v476;
  MEMORY[0x1F4188790](v131);
  v133 = (uint64_t *)((char *)&v476 - ((v132 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v134 + 16))(v133);
  uint64_t v135 = *v133;
  v511 = v124;
  v512 = &off_1F2B4C9E8;
  *(void *)&long long v510 = v135;
  v136 = v506;
  v537 = v506;
  v538 = (_UNKNOWN **)MEMORY[0x1E4F61CD0];
  v137 = v486;
  *(void *)&long long v536 = v486;
  uint64_t v138 = type metadata accessor for NotificationSuppressionListener();
  uint64_t v139 = swift_allocObject();
  uint64_t v140 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v510, (uint64_t)v124);
  MEMORY[0x1F4188790](v140);
  v142 = (uint64_t *)((char *)&v476 - ((v141 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v143 + 16))(v142);
  uint64_t v144 = *v142;
  v534 = v124;
  v535 = &off_1F2B4C9E8;
  *(void *)&long long v533 = v144;
  v486 = v137;
  swift_defaultActor_initialize();
  sub_1D3B819AC(&v533, v139 + 112);
  sub_1D3B819AC(&v536, v139 + 152);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v510);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v513);
  a1[189] = v138;
  a1[190] = &off_1F2B4D7F0;
  a1[186] = v139;
  v497 = (ValueMetadata *)(a1 + 59);
  a1[62] = &type metadata for FirstGlanceStore;
  a1[63] = &off_1F2B4CC20;
  id v145 = v494;
  a1[59] = v494;
  v485 = a1 + 54;
  a1[57] = &type metadata for FirstGlanceServiceFactory;
  a1[58] = &off_1F2B4CB48;
  uint64_t v146 = swift_allocObject();
  a1[54] = v146;
  uint64_t v147 = (uint64_t)v504;
  sub_1D3B60858((uint64_t)v504, v146 + 16);
  uint64_t v148 = (uint64_t)v509;
  sub_1D3B60858((uint64_t)v509, v146 + 56);
  uint64_t v149 = (uint64_t)v503;
  sub_1D3B60858((uint64_t)v503, v146 + 96);
  v150 = v495;
  *(void *)(v146 + 136) = v145;
  *(void *)(v146 + 144) = v150;
  sub_1D3B60858((uint64_t)(a1 + 54), (uint64_t)&v513);
  uint64_t v151 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v513, v514);
  v484 = &v476;
  MEMORY[0x1F4188790](v151);
  v153 = (char *)&v476 - ((v152 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v154 + 16))(v153);
  v511 = &type metadata for FirstGlanceServiceFactory;
  v512 = &off_1F2B4CB48;
  uint64_t v155 = swift_allocObject();
  *(void *)&long long v510 = v155;
  long long v156 = *((_OWORD *)v153 + 7);
  *(_OWORD *)(v155 + 112) = *((_OWORD *)v153 + 6);
  *(_OWORD *)(v155 + 128) = v156;
  *(void *)(v155 + 144) = *((void *)v153 + 16);
  long long v157 = *((_OWORD *)v153 + 3);
  *(_OWORD *)(v155 + 48) = *((_OWORD *)v153 + 2);
  *(_OWORD *)(v155 + 64) = v157;
  long long v158 = *((_OWORD *)v153 + 5);
  *(_OWORD *)(v155 + 80) = *((_OWORD *)v153 + 4);
  *(_OWORD *)(v155 + 96) = v158;
  long long v159 = *((_OWORD *)v153 + 1);
  *(_OWORD *)(v155 + 16) = *(_OWORD *)v153;
  *(_OWORD *)(v155 + 32) = v159;
  v537 = v136;
  v538 = (_UNKNOWN **)MEMORY[0x1E4F61CD0];
  v160 = v486;
  *(void *)&long long v536 = v486;
  type metadata accessor for FirstGlanceListener();
  uint64_t v161 = swift_allocObject();
  uint64_t v162 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v510, (uint64_t)&type metadata for FirstGlanceServiceFactory);
  MEMORY[0x1F4188790](v162);
  v164 = (char *)&v476 - ((v163 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v165 + 16))(v164);
  v534 = &type metadata for FirstGlanceServiceFactory;
  v535 = &off_1F2B4CB48;
  uint64_t v166 = swift_allocObject();
  *(void *)&long long v533 = v166;
  long long v167 = *((_OWORD *)v164 + 7);
  *(_OWORD *)(v166 + 112) = *((_OWORD *)v164 + 6);
  *(_OWORD *)(v166 + 128) = v167;
  *(void *)(v166 + 144) = *((void *)v164 + 16);
  long long v168 = *((_OWORD *)v164 + 3);
  *(_OWORD *)(v166 + 48) = *((_OWORD *)v164 + 2);
  *(_OWORD *)(v166 + 64) = v168;
  long long v169 = *((_OWORD *)v164 + 5);
  *(_OWORD *)(v166 + 80) = *((_OWORD *)v164 + 4);
  *(_OWORD *)(v166 + 96) = v169;
  long long v170 = *((_OWORD *)v164 + 1);
  *(_OWORD *)(v166 + 16) = *(_OWORD *)v164;
  *(_OWORD *)(v166 + 32) = v170;
  id v494 = v494;
  v488 = v495;
  v486 = v160;
  swift_defaultActor_initialize();
  sub_1D3B819AC(&v533, v161 + 112);
  sub_1D3B819AC(&v536, v161 + 152);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v510);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v513);
  a1[53] = v161;
  sub_1D3B60858(v147, (uint64_t)&v513);
  sub_1D3B60858(v148, (uint64_t)&v510);
  sub_1D3B60858(v149, (uint64_t)&v536);
  sub_1D3B60858((uint64_t)v497, (uint64_t)&v533);
  sub_1D3B60858((uint64_t)v502, (uint64_t)&v530);
  sub_1D3B60858((uint64_t)v498, (uint64_t)v528);
  sub_1D3B60858((uint64_t)v508, (uint64_t)v526);
  sub_1D3B60858((uint64_t)v507, (uint64_t)v524);
  sub_1D3B60858((uint64_t)v485, (uint64_t)v522);
  sub_1D3B60858((uint64_t)v501, (uint64_t)v520);
  v485 = v487;
  v484 = (uint64_t *)objc_msgSend(v505, sel_defaultCenter);
  uint64_t v171 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v510, (uint64_t)v511);
  v495 = &v476;
  MEMORY[0x1F4188790](v171);
  v483 = (uint64_t *)((char *)&v476 - ((v172 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(void))(v173 + 16))();
  uint64_t v174 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v536, (uint64_t)v537);
  v487 = &v476;
  MEMORY[0x1F4188790](v174);
  v480 = (uint64_t *)((char *)&v476 - ((v175 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(void))(v176 + 16))();
  uint64_t v177 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v533, (uint64_t)v534);
  v482 = &v476;
  MEMORY[0x1F4188790](v177);
  v478 = (uint64_t *)((char *)&v476 - ((v178 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(void))(v179 + 16))();
  uint64_t v180 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v530, (uint64_t)v531);
  v481 = &v476;
  MEMORY[0x1F4188790](v180);
  v182 = (uint64_t *)((char *)&v476 - ((v181 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v183 + 16))(v182);
  uint64_t v184 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v528, v529);
  v479 = &v476;
  MEMORY[0x1F4188790](v184);
  v186 = (uint64_t *)((char *)&v476 - ((v185 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v187 + 16))(v186);
  uint64_t v188 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v526, v527);
  v477 = &v476;
  MEMORY[0x1F4188790](v188);
  v190 = (char *)&v476 - ((v189 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v191 + 16))(v190);
  uint64_t v192 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v524, v525);
  uint64_t v476 = (uint64_t)&v476;
  MEMORY[0x1F4188790](v192);
  (*(void (**)(char *, uint64_t))(v194 + 16))((char *)&v476 - ((v193 + 15) & 0xFFFFFFFFFFFFFFF0), v195);
  uint64_t v196 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v522, v523);
  MEMORY[0x1F4188790](v196);
  v198 = (char *)&v476 - ((v197 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v199 + 16))(v198);
  uint64_t v200 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v520, v521);
  MEMORY[0x1F4188790](v200);
  v202 = (uint64_t *)((char *)&v476 - ((v201 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v203 + 16))(v202);
  uint64_t v204 = *v186;
  v205 = v485;
  v206 = sub_1D3C264AC((uint64_t)v485, &v513, (uint64_t)v483, *v480, *v478, *v182, v204, (uint64_t)v190, (uint64_t)v198, *v202, (uint64_t)v484);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v520);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v522);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v524);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v526);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v528);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v530);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v533);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v536);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v510);
  a1[67] = type metadata accessor for FirstGlanceSystem();
  a1[68] = &off_1F2B4A198;
  a1[64] = v206;
  a1[82] = &type metadata for FitnessPlusPlanDataProvider;
  a1[83] = &protocol witness table for FitnessPlusPlanDataProvider;
  v207 = (void *)swift_allocObject();
  a1[79] = v207;
  uint64_t v208 = sub_1D3C2E6F0();
  sub_1D3B88A14(0, (unint64_t *)&qword_1EBD74700);
  sub_1D3C2F4F0();
  ((void (*)(char *, void, uint64_t *))v489[13])(v491, *MEMORY[0x1E4F9B9B8], v490);
  uint64_t v514 = sub_1D3C2E780();
  uint64_t v515 = MEMORY[0x1E4F9B9B0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v513);
  sub_1D3C2E770();
  sub_1D3C2E7C0();
  swift_allocObject();
  sub_1D3C2E7B0();
  sub_1D3C2F4F0();
  uint64_t v209 = sub_1D3C2E6E0();
  uint64_t v210 = MEMORY[0x1E4F9AA90];
  v207[5] = v208;
  v207[6] = v210;
  v207[2] = v209;
  v490 = a1 + 85;
  a1[88] = &type metadata for FitnessPlusPlanServiceFactory;
  a1[89] = &off_1F2B4A7D0;
  uint64_t v211 = swift_allocObject();
  a1[85] = v211;
  sub_1D3B60858((uint64_t)v504, v211 + 16);
  uint64_t v212 = (uint64_t)v509;
  sub_1D3B60858((uint64_t)v509, v211 + 56);
  v487 = a1 + 79;
  sub_1D3B60858((uint64_t)(a1 + 79), v211 + 96);
  uint64_t v213 = (uint64_t)v498;
  sub_1D3B60858((uint64_t)v498, v211 + 144);
  id v214 = v494;
  *(void *)(v211 + 136) = v494;
  a1[93] = &type metadata for FitnessPlusPlanStore;
  a1[94] = &off_1F2B4CFD8;
  uint64_t v215 = swift_allocObject();
  a1[90] = v215;
  uint64_t v216 = (uint64_t)v503;
  sub_1D3B60858((uint64_t)v503, v215 + 16);
  sub_1D3B60858((uint64_t)(a1 + 79), (uint64_t)&v513);
  sub_1D3B60858(v216, (uint64_t)&v510);
  sub_1D3B60858(v212, (uint64_t)&v536);
  sub_1D3B60858((uint64_t)(a1 + 90), (uint64_t)&v533);
  sub_1D3B60858((uint64_t)v502, (uint64_t)&v530);
  sub_1D3B60858(v213, (uint64_t)v528);
  sub_1D3B60858((uint64_t)v508, (uint64_t)v526);
  sub_1D3B60858((uint64_t)v507, (uint64_t)v524);
  sub_1D3B60858((uint64_t)(a1 + 85), (uint64_t)v522);
  sub_1D3B60858((uint64_t)v501, (uint64_t)v520);
  sub_1D3B60858((uint64_t)v500, (uint64_t)v518);
  v489 = v205;
  v491 = (char *)v214;
  swift_retain();
  id v494 = objc_msgSend(v505, sel_defaultCenter, v476, v477);
  uint64_t v217 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v510, (uint64_t)v511);
  v495 = &v476;
  MEMORY[0x1F4188790](v217);
  v219 = (uint64_t *)((char *)&v476 - ((v218 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v220 + 16))(v219);
  uint64_t v221 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v536, (uint64_t)v537);
  v485 = &v476;
  MEMORY[0x1F4188790](v221);
  v482 = (uint64_t *)((char *)&v476 - ((v222 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(void))(v223 + 16))();
  uint64_t v224 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v533, (uint64_t)v534);
  v484 = &v476;
  MEMORY[0x1F4188790](v224);
  v481 = (uint64_t *)((char *)&v476 - ((v225 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(void))(v226 + 16))();
  uint64_t v227 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v530, (uint64_t)v531);
  v483 = &v476;
  MEMORY[0x1F4188790](v227);
  v229 = (uint64_t *)((char *)&v476 - ((v228 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v230 + 16))(v229);
  uint64_t v231 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v528, v529);
  v480 = &v476;
  MEMORY[0x1F4188790](v231);
  v233 = (uint64_t *)((char *)&v476 - ((v232 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v234 + 16))(v233);
  uint64_t v235 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v526, v527);
  v479 = &v476;
  MEMORY[0x1F4188790](v235);
  v237 = (char *)&v476 - ((v236 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v238 + 16))(v237);
  uint64_t v239 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v524, v525);
  v478 = &v476;
  MEMORY[0x1F4188790](v239);
  (*(void (**)(void))(v240 + 16))();
  uint64_t v241 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v522, v523);
  v477 = &v476;
  MEMORY[0x1F4188790](v241);
  v243 = (char *)&v476 - ((v242 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v244 + 16))(v243);
  uint64_t v245 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v520, v521);
  uint64_t v476 = (uint64_t)&v476;
  MEMORY[0x1F4188790](v245);
  v247 = (uint64_t *)((char *)&v476 - ((v246 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v248 + 16))(v247);
  uint64_t v249 = v519;
  uint64_t v250 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v518, v519);
  MEMORY[0x1F4188790](v250);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t))(v252 + 16))((char *)&v476 - ((v251 + 15) & 0xFFFFFFFFFFFFFFF0), v253, v249, v254, v255);
  uint64_t v256 = *v219;
  uint64_t v257 = *v229;
  uint64_t v258 = *v233;
  uint64_t v259 = *v247;
  v260 = (void *)v499;
  swift_retain();
  uint64_t v475 = v259;
  v261 = v489;
  v262 = sub_1D3C26C7C((uint64_t)v489, (uint64_t)&v513, v256, (uint64_t)v482, (uint64_t)v481, v257, v258, (uint64_t)v237, (uint64_t)v243, v475, v260, (uint64_t)v494);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v518);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v520);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v522);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v524);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v526);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v528);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v530);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v533);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v536);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v510);
  v495 = (uint64_t *)type metadata accessor for FitnessPlusPlanSystem();
  a1[98] = v495;
  a1[99] = &off_1F2B4D4D0;
  a1[95] = v262;
  uint64_t v263 = (uint64_t)v509;
  sub_1D3B60858((uint64_t)v509, (uint64_t)&v513);
  sub_1D3B60858((uint64_t)v487, (uint64_t)&v510);
  sub_1D3B60858((uint64_t)v490, (uint64_t)&v536);
  uint64_t v264 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v513, v514);
  MEMORY[0x1F4188790](v264);
  v266 = (char *)&v476 - ((v265 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v267 + 16))(v266);
  uint64_t v268 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v536, (uint64_t)v537);
  MEMORY[0x1F4188790](v268);
  v270 = (char *)&v476 - ((v269 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v271 + 16))(v270);
  swift_retain_n();
  v490 = v486;
  id v494 = v262;
  uint64_t v272 = sub_1D3C275EC((uint64_t)v266, &v510, (uint64_t)v262, (uint64_t)v270, (uint64_t)v490);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v536);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v513);
  a1[84] = v272;
  sub_1D3B60858((uint64_t)v504, (uint64_t)&v513);
  sub_1D3B60858(v263, (uint64_t)v516);
  v516[10] = &off_1F2B4D030;
  v516[9] = &type metadata for PauseRingsSampleQuery;
  id v273 = v491;
  v516[6] = v491;
  uint64_t v274 = (uint64_t)v498;
  sub_1D3B60858((uint64_t)v498, (uint64_t)&v517);
  v516[5] = v273;
  sub_1D3B60858((uint64_t)v503, (uint64_t)&v536);
  sub_1D3B60858(v263, (uint64_t)&v533);
  sub_1D3B60858((uint64_t)v502, (uint64_t)&v530);
  sub_1D3B60858(v274, (uint64_t)v528);
  sub_1D3B60858((uint64_t)v508, (uint64_t)v526);
  sub_1D3B60858((uint64_t)v507, (uint64_t)v524);
  sub_1D3B60858((uint64_t)v501, (uint64_t)v522);
  sub_1D3B60858((uint64_t)v500, (uint64_t)v520);
  id v275 = v273;
  v498 = v261;
  v489 = (uint64_t *)v275;
  v491 = (char *)objc_msgSend(v505, sel_defaultCenter, v476, v477, v478, v479, v480);
  uint64_t v276 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v536, (uint64_t)v537);
  v500 = &v476;
  MEMORY[0x1F4188790](v276);
  v278 = (uint64_t *)((char *)&v476 - ((v277 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v279 + 16))(v278);
  uint64_t v280 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v533, (uint64_t)v534);
  v487 = &v476;
  MEMORY[0x1F4188790](v280);
  v485 = (uint64_t *)((char *)&v476 - ((v281 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(void))(v282 + 16))();
  uint64_t v283 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v530, (uint64_t)v531);
  v486 = &v476;
  MEMORY[0x1F4188790](v283);
  v285 = (uint64_t *)((char *)&v476 - ((v284 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v286 + 16))(v285);
  uint64_t v287 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v528, v529);
  v484 = &v476;
  MEMORY[0x1F4188790](v287);
  v289 = (uint64_t *)((char *)&v476 - ((v288 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v290 + 16))(v289);
  uint64_t v291 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v526, v527);
  v483 = &v476;
  MEMORY[0x1F4188790](v291);
  v293 = (char *)&v476 - ((v292 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v294 + 16))(v293);
  uint64_t v295 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v524, v525);
  v482 = &v476;
  MEMORY[0x1F4188790](v295);
  (*(void (**)(void))(v296 + 16))();
  uint64_t v297 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v522, v523);
  MEMORY[0x1F4188790](v297);
  v299 = (uint64_t *)((char *)&v476 - ((v298 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v300 + 16))(v299);
  uint64_t v301 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v520, v521);
  MEMORY[0x1F4188790](v301);
  (*(void (**)(void))(v302 + 16))();
  sub_1D3C29590((uint64_t)&v513, (uint64_t)&v510);
  uint64_t v303 = *v278;
  uint64_t v304 = *v285;
  uint64_t v305 = *v289;
  uint64_t v306 = *v299;
  uint64_t v307 = v499;
  swift_retain();
  v308 = (char *)sub_1D3C27908((uint64_t)v498, v303, (uint64_t)v485, v304, v305, (uint64_t)v293, (uint64_t)&v510, v306, v307, (uint64_t)v491);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v520);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v522);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v524);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v526);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v528);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v530);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v533);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v536);
  uint64_t v499 = type metadata accessor for PauseRingsSystem();
  a1[200] = v499;
  a1[201] = &off_1F2B4CD30;
  a1[197] = v308;
  uint64_t v309 = (uint64_t)v509;
  sub_1D3B60858((uint64_t)v509, (uint64_t)&v536);
  uint64_t v310 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v536, (uint64_t)v537);
  MEMORY[0x1F4188790](v310);
  v312 = (char *)&v476 - ((v311 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v313 + 16))(v312);
  sub_1D3C29590((uint64_t)&v513, (uint64_t)&v510);
  v491 = v308;
  swift_retain_n();
  v314 = v490;
  uint64_t v315 = sub_1D3C28240((uint64_t)v312, (uint64_t)v308, (uint64_t)&v510, (uint64_t)v314);
  v500 = (uint64_t *)v315;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v536);
  a1[205] = type metadata accessor for PauseRingsListener();
  a1[206] = &off_1F2B4A9D0;
  a1[202] = v315;
  a1[109] = &type metadata for GoalCompletionServiceFactory;
  a1[110] = &off_1F2B4A998;
  uint64_t v316 = swift_allocObject();
  a1[106] = v316;
  sub_1D3B60858(v309, v316 + 16);
  uint64_t v317 = (uint64_t)v496;
  sub_1D3B60858((uint64_t)v496, v316 + 64);
  sub_1D3B60858((uint64_t)v508, v316 + 104);
  sub_1D3B60858((uint64_t)v507, v316 + 144);
  v318 = v489;
  *(void *)(v316 + 56) = v489;
  sub_1D3B60858((uint64_t)(a1 + 106), (uint64_t)&v510);
  uint64_t v319 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v510, (uint64_t)v511);
  v490 = &v476;
  MEMORY[0x1F4188790](v319);
  v321 = (char *)&v476 - ((v320 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v322 + 16))(v321);
  v537 = &type metadata for GoalCompletionServiceFactory;
  v538 = &off_1F2B4A998;
  uint64_t v323 = swift_allocObject();
  *(void *)&long long v536 = v323;
  long long v324 = *((_OWORD *)v321 + 9);
  *(_OWORD *)(v323 + 144) = *((_OWORD *)v321 + 8);
  *(_OWORD *)(v323 + 160) = v324;
  *(void *)(v323 + 176) = *((void *)v321 + 20);
  long long v325 = *((_OWORD *)v321 + 5);
  *(_OWORD *)(v323 + 80) = *((_OWORD *)v321 + 4);
  *(_OWORD *)(v323 + 96) = v325;
  long long v326 = *((_OWORD *)v321 + 7);
  *(_OWORD *)(v323 + 112) = *((_OWORD *)v321 + 6);
  *(_OWORD *)(v323 + 128) = v326;
  long long v327 = *((_OWORD *)v321 + 1);
  *(_OWORD *)(v323 + 16) = *(_OWORD *)v321;
  *(_OWORD *)(v323 + 32) = v327;
  long long v328 = *((_OWORD *)v321 + 3);
  *(_OWORD *)(v323 + 48) = *((_OWORD *)v321 + 2);
  *(_OWORD *)(v323 + 64) = v328;
  v534 = v506;
  v535 = (_UNKNOWN **)MEMORY[0x1E4F61CD0];
  *(void *)&long long v533 = v314;
  uint64_t v329 = type metadata accessor for GoalCompletionListener();
  uint64_t v330 = swift_allocObject();
  uint64_t v331 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v536, (uint64_t)&type metadata for GoalCompletionServiceFactory);
  MEMORY[0x1F4188790](v331);
  v333 = (char *)&v476 - ((v332 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v334 + 16))(v333);
  v531 = &type metadata for GoalCompletionServiceFactory;
  v532 = &off_1F2B4A998;
  uint64_t v335 = swift_allocObject();
  *(void *)&long long v530 = v335;
  long long v336 = *((_OWORD *)v333 + 9);
  *(_OWORD *)(v335 + 144) = *((_OWORD *)v333 + 8);
  *(_OWORD *)(v335 + 160) = v336;
  *(void *)(v335 + 176) = *((void *)v333 + 20);
  long long v337 = *((_OWORD *)v333 + 5);
  *(_OWORD *)(v335 + 80) = *((_OWORD *)v333 + 4);
  *(_OWORD *)(v335 + 96) = v337;
  long long v338 = *((_OWORD *)v333 + 7);
  *(_OWORD *)(v335 + 112) = *((_OWORD *)v333 + 6);
  *(_OWORD *)(v335 + 128) = v338;
  long long v339 = *((_OWORD *)v333 + 1);
  *(_OWORD *)(v335 + 16) = *(_OWORD *)v333;
  *(_OWORD *)(v335 + 32) = v339;
  long long v340 = *((_OWORD *)v333 + 3);
  *(_OWORD *)(v335 + 48) = *((_OWORD *)v333 + 2);
  *(_OWORD *)(v335 + 64) = v340;
  v341 = v318;
  v487 = v341;
  v342 = v314;
  swift_retain();
  swift_defaultActor_initialize();
  sub_1D3B819AC(&v530, v330 + 112);
  sub_1D3B819AC(&v533, v330 + 152);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v536);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v510);
  a1[104] = v329;
  a1[105] = &off_1F2B4BB98;
  a1[101] = v330;
  a1[114] = &type metadata for GoalProgressServiceFactory;
  a1[115] = &off_1F2B4B988;
  uint64_t v343 = swift_allocObject();
  a1[111] = v343;
  sub_1D3B60858((uint64_t)v509, v343 + 16);
  sub_1D3B60858(v317, v343 + 64);
  sub_1D3B60858((uint64_t)v508, v343 + 104);
  sub_1D3B60858((uint64_t)v507, v343 + 144);
  *(void *)(v343 + 56) = v341;
  v344 = v488;
  *(void *)(v343 + 184) = v488;
  sub_1D3B60858((uint64_t)(a1 + 111), (uint64_t)&v510);
  uint64_t v345 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v510, (uint64_t)v511);
  v489 = &v476;
  MEMORY[0x1F4188790](v345);
  v347 = (_OWORD *)((char *)&v476 - ((v346 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(_OWORD *))(v348 + 16))(v347);
  v537 = &type metadata for GoalProgressServiceFactory;
  v538 = &off_1F2B4B988;
  v349 = (_OWORD *)swift_allocObject();
  *(void *)&long long v536 = v349;
  long long v350 = v347[9];
  v349[9] = v347[8];
  v349[10] = v350;
  v349[11] = v347[10];
  long long v351 = v347[5];
  v349[5] = v347[4];
  v349[6] = v351;
  long long v352 = v347[7];
  v349[7] = v347[6];
  v349[8] = v352;
  long long v353 = v347[1];
  v349[1] = *v347;
  v349[2] = v353;
  long long v354 = v347[3];
  v349[3] = v347[2];
  v349[4] = v354;
  v534 = v506;
  v535 = (_UNKNOWN **)MEMORY[0x1E4F61CD0];
  *(void *)&long long v533 = v342;
  uint64_t v355 = type metadata accessor for GoalProgressListener();
  uint64_t v356 = swift_allocObject();
  uint64_t v357 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v536, (uint64_t)&type metadata for GoalProgressServiceFactory);
  MEMORY[0x1F4188790](v357);
  v359 = (_OWORD *)((char *)&v476 - ((v358 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(_OWORD *))(v360 + 16))(v359);
  v531 = &type metadata for GoalProgressServiceFactory;
  v532 = &off_1F2B4B988;
  v361 = (_OWORD *)swift_allocObject();
  *(void *)&long long v530 = v361;
  long long v362 = v359[9];
  v361[9] = v359[8];
  v361[10] = v362;
  v361[11] = v359[10];
  long long v363 = v359[5];
  v361[5] = v359[4];
  v361[6] = v363;
  long long v364 = v359[7];
  v361[7] = v359[6];
  v361[8] = v364;
  long long v365 = v359[1];
  v361[1] = *v359;
  v361[2] = v365;
  long long v366 = v359[3];
  v361[3] = v359[2];
  v361[4] = v366;
  v367 = v487;
  v490 = v344;
  v488 = v342;
  swift_defaultActor_initialize();
  sub_1D3B819AC(&v530, v356 + 112);
  sub_1D3B819AC(&v533, v356 + 152);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v536);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v510);
  a1[119] = v355;
  a1[120] = &off_1F2B4BE48;
  a1[116] = v356;
  a1[124] = sub_1D3C2EC90();
  a1[125] = MEMORY[0x1E4F61EF0];
  __swift_allocate_boxed_opaque_existential_1(a1 + 121);
  v489 = v367;
  sub_1D3C2EC80();
  sub_1D3B60858((uint64_t)v509, (uint64_t)&v510);
  sub_1D3B60858((uint64_t)v503, (uint64_t)&v536);
  sub_1D3B60858((uint64_t)v508, (uint64_t)&v533);
  sub_1D3B60858((uint64_t)(a1 + 121), (uint64_t)&v530);
  sub_1D3B60858((uint64_t)v507, (uint64_t)v528);
  sub_1D3B60858((uint64_t)v501, (uint64_t)v526);
  id v368 = objc_msgSend(v505, sel_defaultCenter);
  uint64_t v369 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v510, (uint64_t)v511);
  v508 = &v476;
  MEMORY[0x1F4188790](v369);
  v371 = (char *)&v476 - ((v370 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v372 + 16))(v371);
  uint64_t v373 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v536, (uint64_t)v537);
  v505 = &v476;
  MEMORY[0x1F4188790](v373);
  v375 = (uint64_t *)((char *)&v476 - ((v374 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v376 + 16))(v375);
  uint64_t v377 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v533, (uint64_t)v534);
  v503 = &v476;
  MEMORY[0x1F4188790](v377);
  v379 = (char *)&v476 - ((v378 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v380 + 16))(v379);
  uint64_t v381 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v528, v529);
  MEMORY[0x1F4188790](v381);
  (*(void (**)(void))(v382 + 16))();
  uint64_t v383 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v526, v527);
  MEMORY[0x1F4188790](v383);
  v385 = (uint64_t *)((char *)&v476 - ((v384 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v386 + 16))(v385);
  v387 = sub_1D3C2854C((uint64_t)v498, (uint64_t)v371, *v375, (uint64_t)v379, &v530, *v385, (uint64_t)v368);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v526);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v528);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v533);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v536);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v510);
  a1[129] = type metadata accessor for GoalProgressSystem();
  a1[130] = &off_1F2B4C060;
  a1[126] = v387;
  a1[144] = &type metadata for MoveModeServiceFactory;
  a1[145] = &off_1F2B4A840;
  v388 = v492;
  a1[141] = v492;
  sub_1D3B60858((uint64_t)(a1 + 141), (uint64_t)&v510);
  uint64_t v389 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v510, (uint64_t)v511);
  v505 = &v476;
  MEMORY[0x1F4188790](v389);
  v391 = (uint64_t *)((char *)&v476 - ((v390 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v392 + 16))(v391);
  uint64_t v393 = *v391;
  v537 = &type metadata for MoveModeServiceFactory;
  v538 = &off_1F2B4A840;
  *(void *)&long long v536 = v393;
  v394 = v506;
  v534 = v506;
  v535 = (_UNKNOWN **)MEMORY[0x1E4F61CD0];
  v395 = v488;
  *(void *)&long long v533 = v488;
  uint64_t v396 = type metadata accessor for MoveModeListener();
  uint64_t v397 = swift_allocObject();
  uint64_t v398 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v536, (uint64_t)&type metadata for MoveModeServiceFactory);
  MEMORY[0x1F4188790](v398);
  v400 = (uint64_t *)((char *)&v476 - ((v399 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v401 + 16))(v400);
  uint64_t v402 = *v400;
  v531 = &type metadata for MoveModeServiceFactory;
  v532 = &off_1F2B4A840;
  *(void *)&long long v530 = v402;
  v503 = v395;
  v508 = v388;
  swift_defaultActor_initialize();
  sub_1D3B819AC(&v530, v397 + 112);
  sub_1D3B819AC(&v533, v397 + 152);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v536);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v510);
  a1[139] = v396;
  a1[140] = &off_1F2B4A7E0;
  a1[136] = v397;
  a1[236] = &type metadata for WalkSuggestionServiceFactory;
  a1[237] = &off_1F2B4C4D0;
  uint64_t v403 = swift_allocObject();
  a1[233] = v403;
  sub_1D3B60858((uint64_t)v504, v403 + 16);
  sub_1D3B60858((uint64_t)v509, v403 + 56);
  v404 = v489;
  *(void *)(v403 + 96) = v489;
  sub_1D3B60858((uint64_t)(a1 + 233), (uint64_t)&v510);
  uint64_t v405 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v510, (uint64_t)v511);
  v505 = &v476;
  MEMORY[0x1F4188790](v405);
  v407 = (char *)&v476 - ((v406 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v408 + 16))(v407);
  v537 = &type metadata for WalkSuggestionServiceFactory;
  v538 = &off_1F2B4C4D0;
  uint64_t v409 = swift_allocObject();
  *(void *)&long long v536 = v409;
  long long v410 = *((_OWORD *)v407 + 3);
  *(_OWORD *)(v409 + 48) = *((_OWORD *)v407 + 2);
  *(_OWORD *)(v409 + 64) = v410;
  *(_OWORD *)(v409 + 80) = *((_OWORD *)v407 + 4);
  *(void *)(v409 + 96) = *((void *)v407 + 10);
  long long v411 = *((_OWORD *)v407 + 1);
  *(_OWORD *)(v409 + 16) = *(_OWORD *)v407;
  *(_OWORD *)(v409 + 32) = v411;
  v534 = v394;
  v535 = (_UNKNOWN **)MEMORY[0x1E4F61CD0];
  v412 = v503;
  *(void *)&long long v533 = v503;
  uint64_t v413 = type metadata accessor for WalkSuggestionListener();
  uint64_t v414 = swift_allocObject();
  uint64_t v415 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v536, (uint64_t)&type metadata for WalkSuggestionServiceFactory);
  MEMORY[0x1F4188790](v415);
  v417 = (char *)&v476 - ((v416 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v418 + 16))(v417);
  v531 = &type metadata for WalkSuggestionServiceFactory;
  v532 = &off_1F2B4C4D0;
  uint64_t v419 = swift_allocObject();
  *(void *)&long long v530 = v419;
  long long v420 = *((_OWORD *)v417 + 3);
  *(_OWORD *)(v419 + 48) = *((_OWORD *)v417 + 2);
  *(_OWORD *)(v419 + 64) = v420;
  *(_OWORD *)(v419 + 80) = *((_OWORD *)v417 + 4);
  *(void *)(v419 + 96) = *((void *)v417 + 10);
  long long v421 = *((_OWORD *)v417 + 1);
  *(_OWORD *)(v419 + 16) = *(_OWORD *)v417;
  *(_OWORD *)(v419 + 32) = v421;
  v422 = v404;
  v423 = v412;
  swift_defaultActor_initialize();
  sub_1D3B819AC(&v530, v414 + 112);
  sub_1D3B819AC(&v533, v414 + 152);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v536);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v510);
  a1[231] = v413;
  a1[232] = &off_1F2B4BE10;
  a1[228] = v414;
  a1[10] = &type metadata for AchievementNotificationServiceFactory;
  a1[11] = &off_1F2B4A308;
  v424 = (void *)swift_allocObject();
  a1[7] = v424;
  sub_1D3B60858((uint64_t)v504, (uint64_t)(v424 + 2));
  sub_1D3B60858((uint64_t)v509, (uint64_t)(v424 + 7));
  sub_1D3B60858((uint64_t)v496, (uint64_t)(v424 + 13));
  sub_1D3B60858((uint64_t)v507, (uint64_t)(v424 + 18));
  v424[12] = v422;
  id v425 = v493;
  v424[23] = v490;
  v424[24] = v425;
  sub_1D3B60858((uint64_t)(a1 + 7), (uint64_t)&v510);
  uint64_t v426 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v510, (uint64_t)v511);
  v509 = &v476;
  MEMORY[0x1F4188790](v426);
  v428 = (char *)&v476 - ((v427 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v429 + 16))(v428);
  v537 = &type metadata for AchievementNotificationServiceFactory;
  v538 = &off_1F2B4A308;
  uint64_t v430 = swift_allocObject();
  *(void *)&long long v536 = v430;
  long long v431 = *((_OWORD *)v428 + 9);
  *(_OWORD *)(v430 + 144) = *((_OWORD *)v428 + 8);
  *(_OWORD *)(v430 + 160) = v431;
  *(_OWORD *)(v430 + 176) = *((_OWORD *)v428 + 10);
  *(void *)(v430 + 192) = *((void *)v428 + 22);
  long long v432 = *((_OWORD *)v428 + 5);
  *(_OWORD *)(v430 + 80) = *((_OWORD *)v428 + 4);
  *(_OWORD *)(v430 + 96) = v432;
  long long v433 = *((_OWORD *)v428 + 7);
  *(_OWORD *)(v430 + 112) = *((_OWORD *)v428 + 6);
  *(_OWORD *)(v430 + 128) = v433;
  long long v434 = *((_OWORD *)v428 + 1);
  *(_OWORD *)(v430 + 16) = *(_OWORD *)v428;
  *(_OWORD *)(v430 + 32) = v434;
  long long v435 = *((_OWORD *)v428 + 3);
  *(_OWORD *)(v430 + 48) = *((_OWORD *)v428 + 2);
  *(_OWORD *)(v430 + 64) = v435;
  v534 = v506;
  v535 = (_UNKNOWN **)MEMORY[0x1E4F61CD0];
  *(void *)&long long v533 = v423;
  uint64_t v436 = type metadata accessor for AchievementNotificationListener();
  uint64_t v437 = swift_allocObject();
  uint64_t v438 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v536, (uint64_t)&type metadata for AchievementNotificationServiceFactory);
  MEMORY[0x1F4188790](v438);
  v440 = (char *)&v476 - ((v439 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v441 + 16))(v440);
  v531 = &type metadata for AchievementNotificationServiceFactory;
  v532 = &off_1F2B4A308;
  uint64_t v442 = swift_allocObject();
  *(void *)&long long v530 = v442;
  long long v443 = *((_OWORD *)v440 + 9);
  *(_OWORD *)(v442 + 144) = *((_OWORD *)v440 + 8);
  *(_OWORD *)(v442 + 160) = v443;
  *(_OWORD *)(v442 + 176) = *((_OWORD *)v440 + 10);
  *(void *)(v442 + 192) = *((void *)v440 + 22);
  long long v444 = *((_OWORD *)v440 + 5);
  *(_OWORD *)(v442 + 80) = *((_OWORD *)v440 + 4);
  *(_OWORD *)(v442 + 96) = v444;
  long long v445 = *((_OWORD *)v440 + 7);
  *(_OWORD *)(v442 + 112) = *((_OWORD *)v440 + 6);
  *(_OWORD *)(v442 + 128) = v445;
  long long v446 = *((_OWORD *)v440 + 1);
  *(_OWORD *)(v442 + 16) = *(_OWORD *)v440;
  *(_OWORD *)(v442 + 32) = v446;
  long long v447 = *((_OWORD *)v440 + 3);
  *(_OWORD *)(v442 + 48) = *((_OWORD *)v440 + 2);
  *(_OWORD *)(v442 + 64) = v447;
  v448 = v423;
  swift_defaultActor_initialize();
  sub_1D3B819AC(&v530, v437 + 112);
  sub_1D3B819AC(&v533, v437 + 152);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v536);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v510);
  a1[5] = v436;
  a1[6] = &off_1F2B4AA08;
  a1[2] = v437;
  sub_1D3B60858((uint64_t)v497, (uint64_t)&v510);
  sub_1D3B60858((uint64_t)v502, (uint64_t)&v536);
  uint64_t v449 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v510, (uint64_t)v511);
  MEMORY[0x1F4188790](v449);
  v451 = (uint64_t *)((char *)&v476 - ((v450 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v452 + 16))(v451);
  uint64_t v453 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v536, (uint64_t)v537);
  MEMORY[0x1F4188790](v453);
  v455 = (uint64_t *)((char *)&v476 - ((v454 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v456 + 16))(v455);
  uint64_t v457 = sub_1D3C28A94(*v451, *v455);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v536);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v510);
  v458 = (ValueMetadata *)type metadata accessor for AdminSystem();
  a1[17] = v457;
  uint64_t v459 = (uint64_t)(a1 + 17);
  *(void *)(v459 + 24) = v458;
  *(void *)(v459 + 32) = &off_1F2B4A340;
  sub_1D3B60858(v459, (uint64_t)&v510);
  uint64_t v460 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v510, (uint64_t)v511);
  MEMORY[0x1F4188790](v460);
  v462 = (uint64_t *)((char *)&v476 - ((v461 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v463 + 16))(v462);
  uint64_t v464 = *v462;
  v537 = v458;
  v538 = &off_1F2B4A340;
  *(void *)&long long v536 = v464;
  v534 = v506;
  v535 = (_UNKNOWN **)MEMORY[0x1E4F61CD0];
  *(void *)&long long v533 = v448;
  uint64_t v465 = type metadata accessor for AdminListener();
  uint64_t v466 = swift_allocObject();
  uint64_t v467 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v536, (uint64_t)v458);
  MEMORY[0x1F4188790](v467);
  v469 = (uint64_t *)((char *)&v476 - ((v468 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v470 + 16))(v469);
  uint64_t v471 = *v469;
  v531 = v458;
  v532 = &off_1F2B4A340;
  *(void *)&long long v530 = v471;
  v472 = v448;
  swift_defaultActor_initialize();
  sub_1D3B819AC(&v530, v466 + 112);
  sub_1D3B819AC(&v533, v466 + 152);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v536);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v510);
  *(void *)(v459 - 16) = v465;
  *(void *)(v459 - 8) = &off_1F2B4A048;
  *(void *)(v459 - 40) = v466;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&qword_1EBD76380);
  uint64_t v473 = swift_allocObject();
  *(_OWORD *)(v473 + 16) = xmmword_1D3C31AF0;
  *(void *)(v473 + 56) = v495;
  *(void *)(v473 + 64) = &off_1F2B4D4C0;
  *(void *)(v473 + 32) = v494;
  *(void *)(v473 + 96) = v499;
  *(void *)(v473 + 104) = &off_1F2B4CD20;
  *(void *)(v473 + 72) = v491;
  v511 = &type metadata for NotificationConfigurationCoordinator;
  v512 = &off_1F2B4DF80;
  swift_release();
  *(void *)&long long v510 = v508;
  *((void *)&v510 + 1) = v473;
  sub_1D3C29754((uint64_t)&v513);
  return sub_1D3B819AC(&v510, v459 + 1072);
}

uint64_t Daemon.activate()()
{
  v1[17] = v0;
  uint64_t v2 = sub_1D3C2F040();
  v1[18] = v2;
  v1[19] = *(void *)(v2 - 8);
  v1[20] = swift_task_alloc();
  v1[21] = swift_task_alloc();
  v1[22] = swift_task_alloc();
  v1[23] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1D3C2144C, 0, 0);
}

uint64_t sub_1D3C2144C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 136) + 1904);
  *(void *)(v0 + 192) = v1;
  return MEMORY[0x1F4188298](sub_1D3C21470, v1, 0);
}

uint64_t sub_1D3C21470()
{
  uint64_t v1 = v0[23];
  uint64_t v2 = v0[18];
  uint64_t v3 = v0[19];
  sub_1D3C2EE60();
  sub_1D3C2F020();
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[25] = v4;
  v0[26] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v4(v1, v2);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[27] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_1D3C21570;
  return sub_1D3BC67E0();
}

uint64_t sub_1D3C21570()
{
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1D3C2166C, 0, 0);
}

uint64_t sub_1D3C2166C()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 136) + 384), *(void *)(*(void *)(v0 + 136) + 408));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 224) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1D3C2170C;
  return sub_1D3BC4A88();
}

uint64_t sub_1D3C2170C()
{
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1D3C21808, 0, 0);
}

uint64_t sub_1D3C21808()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 136) + 424);
  *(void *)(v0 + 232) = v1;
  return MEMORY[0x1F4188298](sub_1D3C2182C, v1, 0);
}

uint64_t sub_1D3C2182C()
{
  uint64_t v1 = (void *)v0[29];
  uint64_t v2 = v1[22];
  uint64_t v3 = v1[23];
  __swift_project_boxed_opaque_existential_1(v1 + 19, v2);
  uint64_t v4 = swift_allocObject();
  v0[30] = v4;
  swift_weakInit();
  uint64_t v5 = (void *)swift_task_alloc();
  v0[31] = v5;
  uint64_t v6 = sub_1D3C2EA60();
  *uint64_t v5 = v0;
  v5[1] = sub_1D3C2194C;
  uint64_t v7 = MEMORY[0x1E4F61E30];
  return MEMORY[0x1F4119818](2, &unk_1EA6B6978, v4, v2, v6, v3, v7);
}

uint64_t sub_1D3C2194C()
{
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x1F4188298](sub_1D3C21A64, 0, 0);
}

uint64_t sub_1D3C21A64()
{
  uint64_t v1 = __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 136) + 1088), *(void *)(*(void *)(v0 + 136) + 1112));
  uint64_t v2 = *v1;
  *(void *)(v0 + 256) = *v1;
  return MEMORY[0x1F4188298](sub_1D3C21AD8, v2, 0);
}

uint64_t sub_1D3C21AD8()
{
  uint64_t v1 = (void *)v0[32];
  uint64_t v2 = v1[22];
  uint64_t v3 = v1[23];
  __swift_project_boxed_opaque_existential_1(v1 + 19, v2);
  uint64_t v4 = swift_allocObject();
  v0[33] = v4;
  swift_weakInit();
  uint64_t v5 = (void *)swift_task_alloc();
  v0[34] = v5;
  uint64_t v6 = sub_1D3B88A14(0, &qword_1EBD76310);
  *uint64_t v5 = v0;
  v5[1] = sub_1D3C21C08;
  uint64_t v7 = MEMORY[0x1E4F61F88];
  return MEMORY[0x1F4119808](4, &unk_1EA6B6980, v4, v2, v6, v3, v7);
}

uint64_t sub_1D3C21C08()
{
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x1F4188298](sub_1D3C21D20, 0, 0);
}

uint64_t sub_1D3C21D20()
{
  uint64_t v1 = __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 136) + 16), *(void *)(*(void *)(v0 + 136) + 40));
  uint64_t v2 = *v1;
  *(void *)(v0 + 280) = *v1;
  return MEMORY[0x1F4188298](sub_1D3C21D94, v2, 0);
}

uint64_t sub_1D3C21D94()
{
  uint64_t v1 = (void *)v0[35];
  uint64_t v2 = v1[22];
  uint64_t v3 = v1[23];
  __swift_project_boxed_opaque_existential_1(v1 + 19, v2);
  uint64_t v4 = swift_allocObject();
  v0[36] = v4;
  swift_weakInit();
  uint64_t v5 = (void *)swift_task_alloc();
  v0[37] = v5;
  uint64_t v6 = sub_1D3C2EDC0();
  *uint64_t v5 = v0;
  v5[1] = sub_1D3C21EB4;
  uint64_t v7 = MEMORY[0x1E4F61F28];
  return MEMORY[0x1F4119808](6, &unk_1EA6B6988, v4, v2, v6, v3, v7);
}

uint64_t sub_1D3C21EB4()
{
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x1F4188298](sub_1D3C21FCC, 0, 0);
}

uint64_t sub_1D3C21FCC()
{
  uint64_t v1 = __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 136) + 1248), *(void *)(*(void *)(v0 + 136) + 1272));
  uint64_t v2 = *v1;
  *(void *)(v0 + 304) = *v1;
  return MEMORY[0x1F4188298](sub_1D3C22040, v2, 0);
}

uint64_t sub_1D3C22040()
{
  uint64_t v1 = (void *)v0[38];
  uint64_t v3 = v1[22];
  uint64_t v2 = v1[23];
  __swift_project_boxed_opaque_existential_1(v1 + 19, v3);
  uint64_t v4 = swift_allocObject();
  v0[39] = v4;
  swift_weakInit();
  swift_retain();
  uint64_t v5 = (void *)swift_task_alloc();
  v0[40] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_1D3C22154;
  return MEMORY[0x1F4119810](2, &unk_1EA6B6990, v4, v3, v2);
}

uint64_t sub_1D3C22154()
{
  swift_task_dealloc();
  swift_release_n();
  return MEMORY[0x1F4188298](sub_1D3C22270, 0, 0);
}

uint64_t sub_1D3C22270()
{
  uint64_t v1 = __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 136) + 808), *(void *)(*(void *)(v0 + 136) + 832));
  uint64_t v2 = *v1;
  *(void *)(v0 + 328) = *v1;
  return MEMORY[0x1F4188298](sub_1D3C222E4, v2, 0);
}

uint64_t sub_1D3C222E4()
{
  uint64_t v1 = (void *)v0[41];
  uint64_t v2 = v1[22];
  uint64_t v3 = v1[23];
  __swift_project_boxed_opaque_existential_1(v1 + 19, v2);
  uint64_t v4 = swift_allocObject();
  v0[42] = v4;
  swift_weakInit();
  uint64_t v5 = (void *)swift_task_alloc();
  v0[43] = v5;
  uint64_t v6 = sub_1D3B88A14(0, &qword_1EBD76340);
  *uint64_t v5 = v0;
  v5[1] = sub_1D3C22414;
  uint64_t v7 = MEMORY[0x1E4F61FA0];
  return MEMORY[0x1F4119808](3, &unk_1EA6B6998, v4, v2, v6, v3, v7);
}

uint64_t sub_1D3C22414()
{
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x1F4188298](sub_1D3C2252C, 0, 0);
}

uint64_t sub_1D3C2252C()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 136) + 928), *(void *)(*(void *)(v0 + 136) + 952));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 352) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1D3C225CC;
  return sub_1D3BB7890();
}

uint64_t sub_1D3C225CC()
{
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1D3C226C8, 0, 0);
}

uint64_t sub_1D3C226C8()
{
  uint64_t v1 = __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 136) + 1824), *(void *)(*(void *)(v0 + 136) + 1848));
  uint64_t v2 = *v1;
  *(void *)(v0 + 360) = *v1;
  return MEMORY[0x1F4188298](sub_1D3C2273C, v2, 0);
}

uint64_t sub_1D3C2273C()
{
  uint64_t v1 = (void *)v0[45];
  uint64_t v3 = v1[22];
  uint64_t v2 = v1[23];
  __swift_project_boxed_opaque_existential_1(v1 + 19, v3);
  uint64_t v4 = swift_allocObject();
  v0[46] = v4;
  swift_weakInit();
  uint64_t v5 = (void *)swift_task_alloc();
  v0[47] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_1D3C22854;
  uint64_t v6 = MEMORY[0x1E4F61CF8];
  uint64_t v7 = MEMORY[0x1E4F61CF0];
  return MEMORY[0x1F4119818](3, &unk_1EA6B69A0, v4, v3, v6, v2, v7);
}

uint64_t sub_1D3C22854()
{
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x1F4188298](sub_1D3C2296C, 0, 0);
}

uint64_t sub_1D3C2296C()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 136) + 1008), *(void *)(*(void *)(v0 + 136) + 1032));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 384) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1D3C22A0C;
  return sub_1D3BBA2EC();
}

uint64_t sub_1D3C22A0C()
{
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1D3C22B08, 0, 0);
}

uint64_t sub_1D3C22B08()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 136) + 512), *(void *)(*(void *)(v0 + 136) + 536));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 392) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1D3C22BA8;
  return sub_1D3B6EBF0();
}

uint64_t sub_1D3C22BA8()
{
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1D3C22CA4, 0, 0);
}

uint64_t sub_1D3C22CA4()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 136) + 1776), *(void *)(*(void *)(v0 + 136) + 1800));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 400) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1D3C22D44;
  return sub_1D3BB3C00();
}

uint64_t sub_1D3C22D44()
{
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1D3C22E40, 0, 0);
}

uint64_t sub_1D3C22E40()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 408) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1D3C22ED4;
  return sub_1D3BC26B4();
}

uint64_t sub_1D3C22ED4()
{
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1D3C22FD0, 0, 0);
}

uint64_t sub_1D3C22FD0()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 136) + 1616), *(void *)(*(void *)(v0 + 136) + 1640));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 416) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1D3C23070;
  return sub_1D3B841A4();
}

uint64_t sub_1D3C23070()
{
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1D3C2316C, 0, 0);
}

uint64_t sub_1D3C2316C()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 136) + 1488), *(void *)(*(void *)(v0 + 136) + 1512));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 424) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1D3C2320C;
  return sub_1D3C0D95C();
}

uint64_t sub_1D3C2320C()
{
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1D3C23308, 0, 0);
}

uint64_t sub_1D3C23308()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 136) + 1448), *(void *)(*(void *)(v0 + 136) + 1472));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 432) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1D3C233A8;
  return sub_1D3B741BC();
}

uint64_t sub_1D3C233A8()
{
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1D3C234A4, 0, 0);
}

uint64_t sub_1D3C234A4()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 136) + 96), *(void *)(*(void *)(v0 + 136) + 120));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 440) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1D3C23544;
  return sub_1D3B5F9F8();
}

uint64_t sub_1D3C23544()
{
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1D3C23640, 0, 0);
}

uint64_t sub_1D3C23640()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 136) + 1048), *(void *)(*(void *)(v0 + 136) + 1072));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 448) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1D3C236E0;
  return sub_1D3B5B9D0();
}

uint64_t sub_1D3C236E0()
{
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1D3C237DC, 0, 0);
}

uint64_t sub_1D3C237DC()
{
  uint64_t v1 = __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 136) + 1208), *(void *)(*(void *)(v0 + 136) + 1232));
  uint64_t v3 = *v1;
  uint64_t v2 = v1[1];
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 456) = v4;
  void *v4 = v0;
  v4[1] = sub_1D3C23884;
  return sub_1D3C2C248(v3, v2);
}

uint64_t sub_1D3C23884()
{
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1D3C23980, 0, 0);
}

uint64_t sub_1D3C23980()
{
  uint64_t v1 = *(void **)(v0 + 136);
  __swift_project_boxed_opaque_existential_1(v1 + 191, v1[194]);
  sub_1D3BD1E44();
  __swift_project_boxed_opaque_existential_1(v1 + 166, v1[169]);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 464) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1D3C23A34;
  return sub_1D3B7FFC4();
}

uint64_t sub_1D3C23A34()
{
  *(void *)(*(void *)v1 + 472) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1D3C23BE8;
  }
  else {
    uint64_t v2 = sub_1D3C23B48;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1D3C23B48()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 136) + 592), *(void *)(*(void *)(v0 + 136) + 616));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 480) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1D3C23E58;
  return sub_1D3B9D034();
}

uint64_t sub_1D3C23BE8()
{
  uint64_t v21 = v0;
  uint64_t v1 = (void *)v0[59];
  sub_1D3C2EE60();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_1D3C2F030();
  os_log_type_t v5 = sub_1D3C2F3F0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[59];
    id v19 = (void (*)(uint64_t, uint64_t))v0[25];
    uint64_t v17 = v0[18];
    uint64_t v18 = v0[22];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v20 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_getErrorValue();
    uint64_t v9 = MEMORY[0x1D943D060](v0[9], v0[10]);
    v0[16] = sub_1D3B5E520(v9, v10, &v20);
    sub_1D3C2F550();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1D3B55000, v4, v5, "Error activating notification request scheduler: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D943DA70](v8, -1, -1);
    MEMORY[0x1D943DA70](v7, -1, -1);

    v19(v18, v17);
  }
  else
  {
    unint64_t v11 = (void *)v0[59];
    os_log_type_t v12 = (void (*)(uint64_t, uint64_t))v0[25];
    uint64_t v13 = v0[22];
    uint64_t v14 = v0[18];

    v12(v13, v14);
  }
  __swift_project_boxed_opaque_existential_1((void *)(v0[17] + 592), *(void *)(v0[17] + 616));
  uint64_t v15 = (void *)swift_task_alloc();
  v0[60] = v15;
  *uint64_t v15 = v0;
  v15[1] = sub_1D3C23E58;
  return sub_1D3B9D034();
}

uint64_t sub_1D3C23E58()
{
  *(void *)(*(void *)v1 + 488) = v0;
  swift_task_dealloc();
  if (v0) {
    id v2 = sub_1D3C241E8;
  }
  else {
    id v2 = sub_1D3C23F6C;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1D3C23F6C()
{
  uint64_t v21 = v0;
  uint64_t v1 = (void *)v0[61];
  sub_1D3B5C73C();
  if (v1)
  {
    sub_1D3C2EE60();
    id v2 = v1;
    id v3 = v1;
    uint64_t v4 = sub_1D3C2F030();
    os_log_type_t v5 = sub_1D3C2F3F0();
    BOOL v6 = os_log_type_enabled(v4, v5);
    uint64_t v7 = (void (*)(uint64_t, uint64_t))v0[25];
    uint64_t v8 = v0[20];
    uint64_t v9 = v0[18];
    if (v6)
    {
      id v19 = (void (*)(uint64_t, uint64_t))v0[25];
      uint64_t v17 = v0 + 15;
      uint64_t v18 = v0[20];
      unint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v20 = v11;
      *(_DWORD *)unint64_t v10 = 136315138;
      swift_getErrorValue();
      uint64_t v12 = MEMORY[0x1D943D060](v0[6], v0[7]);
      v0[15] = sub_1D3B5E520(v12, v13, &v20);
      sub_1D3C2F550();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1D3B55000, v4, v5, "Error activating sleep observer: %s", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D943DA70](v11, -1, -1);
      MEMORY[0x1D943DA70](v10, -1, -1);

      v19(v18, v9);
    }
    else
    {

      v7(v8, v9);
    }
  }
  uint64_t v14 = v0[17];
  objc_msgSend(*(id *)(v14 + 1736), sel_activate, v17);
  __swift_project_boxed_opaque_existential_1((void *)(v14 + 760), *(void *)(v14 + 784));
  uint64_t v15 = (void *)swift_task_alloc();
  v0[62] = v15;
  *uint64_t v15 = v0;
  v15[1] = sub_1D3C24614;
  return sub_1D3C04FB0();
}

uint64_t sub_1D3C241E8()
{
  uint64_t v23 = v0;
  uint64_t v1 = (void *)v0[61];
  sub_1D3C2EE60();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_1D3C2F030();
  os_log_type_t v5 = sub_1D3C2F3F0();
  if (os_log_type_enabled(v4, v5))
  {
    BOOL v6 = (void *)v0[61];
    uint64_t v21 = (void (*)(uint64_t, uint64_t))v0[25];
    uint64_t v19 = v0[18];
    uint64_t v20 = v0[21];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v22 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_getErrorValue();
    uint64_t v9 = MEMORY[0x1D943D060](v0[3], v0[4]);
    v0[13] = sub_1D3B5E520(v9, v10, &v22);
    sub_1D3C2F550();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1D3B55000, v4, v5, "Error activating first pickup observer: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D943DA70](v8, -1, -1);
    MEMORY[0x1D943DA70](v7, -1, -1);

    v21(v20, v19);
  }
  else
  {
    uint64_t v11 = (void *)v0[61];
    uint64_t v12 = (void (*)(uint64_t, uint64_t))v0[25];
    uint64_t v13 = v0[21];
    uint64_t v14 = v0[18];

    v12(v13, v14);
  }
  sub_1D3B5C73C();
  uint64_t v15 = v0[17];
  objc_msgSend(*(id *)(v15 + 1736), sel_activate, v18);
  __swift_project_boxed_opaque_existential_1((void *)(v15 + 760), *(void *)(v15 + 784));
  uint64_t v16 = (void *)swift_task_alloc();
  v0[62] = v16;
  *uint64_t v16 = v0;
  v16[1] = sub_1D3C24614;
  return sub_1D3C04FB0();
}

uint64_t sub_1D3C24614()
{
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1D3C24710, 0, 0);
}

uint64_t sub_1D3C24710()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 136) + 1576), *(void *)(*(void *)(v0 + 136) + 1600));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 504) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1D3C247B0;
  return sub_1D3BE415C();
}

uint64_t sub_1D3C247B0()
{
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1D3C248AC, 0, 0);
}

uint64_t sub_1D3C248AC()
{
  XPCStreamHandler.activate()();
  sub_1D3C2E8C0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void *sub_1D3C24964(uint64_t a1, long long *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  uint64_t v54 = type metadata accessor for DateProvider();
  os_log_type_t v55 = &off_1F2B4A0B8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v53);
  sub_1D3C2BA10(a3, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(void))type metadata accessor for DateProvider);
  uint64_t v52 = &off_1F2B4C3B8;
  uint64_t v51 = type metadata accessor for FitnessModeObserver();
  *(void *)&long long v50 = a4;
  unint64_t v48 = &type metadata for FirstGlanceStore;
  id v49 = &off_1F2B4CC20;
  *(void *)&long long v47 = a5;
  uint64_t PickupObserver = type metadata accessor for FirstPickupObserver(0);
  id v46 = &off_1F2B4B570;
  *(void *)&long long v44 = a6;
  uint64_t v42 = type metadata accessor for NotificationRequestScheduler();
  uint64_t v43 = &off_1F2B4A6E0;
  *(void *)&long long v41 = a7;
  id v39 = &type metadata for NotificationSettingsProvider;
  uint64_t v40 = &off_1F2B4A518;
  uint64_t v20 = swift_allocObject();
  *(void *)&long long v38 = v20;
  long long v21 = *(_OWORD *)(a8 + 16);
  *(_OWORD *)(v20 + 16) = *(_OWORD *)a8;
  *(_OWORD *)(v20 + 32) = v21;
  *(_OWORD *)(v20 + 48) = *(_OWORD *)(a8 + 32);
  *(void *)(v20 + 64) = *(void *)(a8 + 48);
  uint64_t v36 = &type metadata for PrivacySettingsProvider;
  uint64_t v37 = &off_1F2B4C1A8;
  uint64_t v33 = &type metadata for FirstGlanceServiceFactory;
  uint64_t v34 = &off_1F2B4CB48;
  uint64_t v22 = swift_allocObject();
  *(void *)&long long v32 = v22;
  long long v23 = *(_OWORD *)(a9 + 112);
  *(_OWORD *)(v22 + 112) = *(_OWORD *)(a9 + 96);
  *(_OWORD *)(v22 + 128) = v23;
  *(void *)(v22 + 144) = *(void *)(a9 + 128);
  long long v24 = *(_OWORD *)(a9 + 48);
  *(_OWORD *)(v22 + 48) = *(_OWORD *)(a9 + 32);
  *(_OWORD *)(v22 + 64) = v24;
  long long v25 = *(_OWORD *)(a9 + 80);
  *(_OWORD *)(v22 + 80) = *(_OWORD *)(a9 + 64);
  *(_OWORD *)(v22 + 96) = v25;
  long long v26 = *(_OWORD *)(a9 + 16);
  *(_OWORD *)(v22 + 16) = *(_OWORD *)a9;
  *(_OWORD *)(v22 + 32) = v26;
  uint64_t v30 = type metadata accessor for UserDayProvider();
  uint64_t v31 = &off_1F2B4BD10;
  *(void *)&long long v29 = a10;
  swift_defaultActor_initialize();
  a12[14] = a1;
  sub_1D3B819AC(a2, (uint64_t)(a12 + 15));
  sub_1D3B819AC(&v53, (uint64_t)(a12 + 20));
  sub_1D3B819AC(&v50, (uint64_t)(a12 + 25));
  sub_1D3B819AC(&v47, (uint64_t)(a12 + 30));
  sub_1D3B819AC(&v44, (uint64_t)(a12 + 35));
  a12[40] = a11;
  sub_1D3B819AC(&v41, (uint64_t)(a12 + 41));
  sub_1D3B819AC(&v38, (uint64_t)(a12 + 46));
  sub_1D3B819AC(&v35, (uint64_t)(a12 + 51));
  sub_1D3B819AC(&v32, (uint64_t)(a12 + 56));
  a12[61] = 0;
  sub_1D3B819AC(&v29, (uint64_t)(a12 + 62));
  return a12;
}

uint64_t sub_1D3C24BD0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v22 = &type metadata for NotificationSettingsProvider;
  long long v23 = &off_1F2B4A518;
  uint64_t v10 = swift_allocObject();
  uint64_t v20 = &off_1F2B4A518;
  *(void *)&long long v21 = v10;
  long long v11 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v10 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v10 + 32) = v11;
  *(_OWORD *)(v10 + 48) = *(_OWORD *)(a1 + 32);
  *(void *)(v10 + 64) = *(void *)(a1 + 48);
  uint64_t v19 = &type metadata for NotificationSettingsProvider;
  uint64_t v12 = swift_allocObject();
  *(void *)&long long v18 = v12;
  long long v13 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v12 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v12 + 32) = v13;
  *(_OWORD *)(v12 + 48) = *(_OWORD *)(a2 + 32);
  *(void *)(v12 + 64) = *(void *)(a2 + 48);
  uint64_t v16 = &type metadata for PairedDeviceRegistry;
  uint64_t v17 = &off_1F2B4D980;
  swift_defaultActor_initialize();
  sub_1D3B819AC(&v21, a5 + 112);
  sub_1D3B819AC(&v18, a5 + 152);
  *(void *)(a5 + 192) = a3;
  sub_1D3B819AC(&v15, a5 + 200);
  *(unsigned char *)(a5 + 240) = a4;
  *(void *)(a5 + 248) = 0;
  return a5;
}

uint64_t sub_1D3C24CE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v16 = &type metadata for DuetObserver;
  uint64_t v17 = &off_1F2B4AAF0;
  uint64_t v14 = &off_1F2B4BC60;
  long long v13 = &type metadata for NotificationRequestPublisher;
  *(void *)&long long v12 = a1;
  uint64_t v10 = &type metadata for LockStateProvider;
  long long v11 = &off_1F2B4A0A0;
  uint64_t v7 = type metadata accessor for NotificationRequestStore();
  uint64_t v8 = &off_1F2B4DA48;
  *(void *)&long long v6 = a2;
  swift_defaultActor_initialize();
  sub_1D3B819AC(&v15, a3 + 112);
  sub_1D3B819AC(&v12, a3 + 152);
  sub_1D3B819AC(&v6, a3 + 192);
  sub_1D3B819AC(&v9, a3 + 232);
  *(void *)(a3 + 272) = 0;
  *(unsigned char *)(a3 + 280) = -1;
  return a3;
}

uint64_t sub_1D3C24DB8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v10 = sub_1D3C2E9B0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  long long v13 = &v17[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v31 = &type metadata for BiomeObserver;
  long long v32 = &off_1F2B4B4B8;
  uint64_t v28 = type metadata accessor for DateProvider();
  long long v29 = &off_1F2B4A0B8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v27);
  sub_1D3C2BA10(a1, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(void))type metadata accessor for DateProvider);
  uint64_t PickupDateValidator = type metadata accessor for FirstPickupDateValidator();
  long long v26 = &off_1F2B4BE00;
  long long v15 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v24);
  sub_1D3C2BA10(a2, (uint64_t)v15, (uint64_t (*)(void))type metadata accessor for FirstPickupDateValidator);
  uint64_t v22 = &type metadata for DuetObserver;
  long long v23 = &off_1F2B4AAF0;
  uint64_t v19 = &type metadata for FirstPickupStore;
  uint64_t v20 = &off_1F2B49FF8;
  swift_defaultActor_initialize();
  *(void *)(a5 + 288) = 0;
  *(unsigned char *)(a5 + 296) = -1;
  (*(void (**)(unsigned char *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x1E4F61DD8], v10);
  v17[7] = 1;
  sub_1D3C2E910();
  sub_1D3B819AC(&v30, a5 + 112);
  sub_1D3B819AC(&v27, a5 + 152);
  sub_1D3B819AC(&v24, a5 + 192);
  sub_1D3B819AC(&v21, a5 + 232);
  *(void *)(a5 + 272) = a3;
  *(unsigned char *)(a5 + 280) = a4;
  type metadata accessor for FirstPickupObserver.State(0);
  swift_storeEnumTagMultiPayload();
  sub_1D3B819AC(&v18, a5 + OBJC_IVAR____TtC23FitnessCoachingServices19FirstPickupObserver_store);
  return a5;
}

void *sub_1D3C2503C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, long long *a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v36 = type metadata accessor for DateProvider();
  uint64_t v37 = &off_1F2B4A0B8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v35);
  sub_1D3C2BA10(a2, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(void))type metadata accessor for DateProvider);
  uint64_t v33 = type metadata accessor for FitnessModeObserver();
  uint64_t v34 = &off_1F2B4C3B8;
  *(void *)&long long v32 = a3;
  long long v30 = &type metadata for NotificationSettingsProvider;
  uint64_t v31 = &off_1F2B4A518;
  uint64_t v17 = swift_allocObject();
  *(void *)&long long v29 = v17;
  long long v18 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)(v17 + 16) = *(_OWORD *)a4;
  *(_OWORD *)(v17 + 32) = v18;
  *(_OWORD *)(v17 + 48) = *(_OWORD *)(a4 + 32);
  *(void *)(v17 + 64) = *(void *)(a4 + 48);
  long long v27 = &type metadata for PrivacySettingsProvider;
  uint64_t v28 = &off_1F2B4C1A8;
  uint64_t v24 = type metadata accessor for UserDayProvider();
  long long v25 = &off_1F2B4BD10;
  *(void *)&long long v23 = a6;
  long long v21 = &type metadata for GoalProgressConfigurationFactory;
  uint64_t v22 = &off_1F2B4BFA0;
  swift_defaultActor_initialize();
  a8[14] = a1;
  sub_1D3B819AC(&v20, (uint64_t)(a8 + 15));
  sub_1D3B819AC(&v35, (uint64_t)(a8 + 20));
  sub_1D3B819AC(&v32, (uint64_t)(a8 + 25));
  a8[30] = a7;
  sub_1D3B819AC(&v29, (uint64_t)(a8 + 31));
  sub_1D3B819AC(a5, (uint64_t)(a8 + 41));
  sub_1D3B819AC(&v26, (uint64_t)(a8 + 36));
  a8[46] = 0;
  sub_1D3B819AC(&v23, (uint64_t)(a8 + 47));
  return a8;
}

void *sub_1D3C251E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  v46[3] = type metadata accessor for FitnessModeObserver();
  v46[4] = &off_1F2B4C3B8;
  v46[0] = a2;
  v45[3] = type metadata accessor for DateProvider();
  v45[4] = (uint64_t)&off_1F2B4A0B8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v45);
  sub_1D3C2BA10(a3, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(void))type metadata accessor for DateProvider);
  uint64_t v43 = &type metadata for PauseRingsStore;
  long long v44 = &off_1F2B4B790;
  v41[3] = type metadata accessor for FirstPickupObserver(0);
  v41[4] = &off_1F2B4B570;
  v41[0] = a4;
  v40[3] = type metadata accessor for NotificationRequestScheduler();
  v40[4] = &off_1F2B4A6E0;
  v40[0] = a5;
  v39[3] = &type metadata for NotificationSettingsProvider;
  v39[4] = &off_1F2B4A518;
  uint64_t v20 = swift_allocObject();
  v39[0] = v20;
  long long v21 = *(_OWORD *)(a6 + 16);
  *(_OWORD *)(v20 + 16) = *(_OWORD *)a6;
  *(_OWORD *)(v20 + 32) = v21;
  *(_OWORD *)(v20 + 48) = *(_OWORD *)(a6 + 32);
  *(void *)(v20 + 64) = *(void *)(a6 + 48);
  uint64_t v37 = &type metadata for PrivacySettingsProvider;
  long long v38 = &off_1F2B4C1A8;
  v35[3] = &type metadata for PauseRingsServiceFactory;
  v35[4] = &off_1F2B4B488;
  uint64_t v22 = swift_allocObject();
  v35[0] = v22;
  long long v23 = *(_OWORD *)(a7 + 144);
  *(_OWORD *)(v22 + 144) = *(_OWORD *)(a7 + 128);
  *(_OWORD *)(v22 + 160) = v23;
  *(void *)(v22 + 176) = *(void *)(a7 + 160);
  long long v24 = *(_OWORD *)(a7 + 80);
  *(_OWORD *)(v22 + 80) = *(_OWORD *)(a7 + 64);
  *(_OWORD *)(v22 + 96) = v24;
  long long v25 = *(_OWORD *)(a7 + 112);
  *(_OWORD *)(v22 + 112) = *(_OWORD *)(a7 + 96);
  *(_OWORD *)(v22 + 128) = v25;
  long long v26 = *(_OWORD *)(a7 + 16);
  *(_OWORD *)(v22 + 16) = *(_OWORD *)a7;
  *(_OWORD *)(v22 + 32) = v26;
  long long v27 = *(_OWORD *)(a7 + 48);
  *(_OWORD *)(v22 + 48) = *(_OWORD *)(a7 + 32);
  *(_OWORD *)(v22 + 64) = v27;
  v34[3] = type metadata accessor for UserDayProvider();
  v34[4] = &off_1F2B4BD10;
  v34[0] = a8;
  v33[3] = type metadata accessor for XPCActivityScheduler();
  v33[4] = &off_1F2B4C608;
  v33[0] = a9;
  uint64_t v31 = &type metadata for LockStateProvider;
  long long v32 = &off_1F2B4A0A0;
  swift_defaultActor_initialize();
  a11[14] = a1;
  sub_1D3B60858((uint64_t)v46, (uint64_t)(a11 + 15));
  sub_1D3B60858((uint64_t)v45, (uint64_t)(a11 + 20));
  sub_1D3B60858((uint64_t)v42, (uint64_t)(a11 + 25));
  sub_1D3B60858((uint64_t)v41, (uint64_t)(a11 + 30));
  a11[35] = a10;
  sub_1D3B60858((uint64_t)v40, (uint64_t)(a11 + 36));
  sub_1D3B60858((uint64_t)v39, (uint64_t)(a11 + 41));
  sub_1D3B60858((uint64_t)v36, (uint64_t)(a11 + 46));
  sub_1D3B60858((uint64_t)v35, (uint64_t)(a11 + 51));
  sub_1D3B60858((uint64_t)v34, (uint64_t)(a11 + 56));
  sub_1D3B60858((uint64_t)v30, (uint64_t)(a11 + 61));
  sub_1D3B60858((uint64_t)v33, (uint64_t)(a11 + 66));
  sub_1D3C2EF50();
  uint64_t v28 = sub_1D3C2EF40();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v46);
  a11[71] = v28;
  a11[72] = 0;
  return a11;
}

void *sub_1D3C254F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  v48[3] = type metadata accessor for FitnessModeObserver();
  v48[4] = &off_1F2B4C3B8;
  v48[0] = a3;
  v47[3] = type metadata accessor for DateProvider();
  v47[4] = (uint64_t)&off_1F2B4A0B8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v47);
  sub_1D3C2BA10(a4, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(void))type metadata accessor for DateProvider);
  v46[3] = &type metadata for FitnessPlusPlanStore;
  v46[4] = &off_1F2B4CFD8;
  uint64_t v20 = swift_allocObject();
  v46[0] = v20;
  long long v21 = *(_OWORD *)(a5 + 16);
  *(_OWORD *)(v20 + 16) = *(_OWORD *)a5;
  *(_OWORD *)(v20 + 32) = v21;
  *(void *)(v20 + 48) = *(void *)(a5 + 32);
  v45[3] = type metadata accessor for FirstPickupObserver(0);
  v45[4] = &off_1F2B4B570;
  v45[0] = a6;
  v44[3] = type metadata accessor for NotificationRequestScheduler();
  v44[4] = &off_1F2B4A6E0;
  v44[0] = a7;
  v43[3] = &type metadata for NotificationSettingsProvider;
  v43[4] = &off_1F2B4A518;
  uint64_t v22 = swift_allocObject();
  v43[0] = v22;
  long long v23 = *(_OWORD *)(a8 + 16);
  *(_OWORD *)(v22 + 16) = *(_OWORD *)a8;
  *(_OWORD *)(v22 + 32) = v23;
  *(_OWORD *)(v22 + 48) = *(_OWORD *)(a8 + 32);
  *(void *)(v22 + 64) = *(void *)(a8 + 48);
  long long v41 = &type metadata for PrivacySettingsProvider;
  uint64_t v42 = &off_1F2B4C1A8;
  v39[3] = &type metadata for FitnessPlusPlanServiceFactory;
  v39[4] = &off_1F2B4A7D0;
  uint64_t v24 = swift_allocObject();
  v39[0] = v24;
  long long v25 = *(_OWORD *)(a9 + 144);
  *(_OWORD *)(v24 + 144) = *(_OWORD *)(a9 + 128);
  *(_OWORD *)(v24 + 160) = v25;
  *(void *)(v24 + 176) = *(void *)(a9 + 160);
  long long v26 = *(_OWORD *)(a9 + 80);
  *(_OWORD *)(v24 + 80) = *(_OWORD *)(a9 + 64);
  *(_OWORD *)(v24 + 96) = v26;
  long long v27 = *(_OWORD *)(a9 + 112);
  *(_OWORD *)(v24 + 112) = *(_OWORD *)(a9 + 96);
  *(_OWORD *)(v24 + 128) = v27;
  long long v28 = *(_OWORD *)(a9 + 16);
  *(_OWORD *)(v24 + 16) = *(_OWORD *)a9;
  *(_OWORD *)(v24 + 32) = v28;
  long long v29 = *(_OWORD *)(a9 + 48);
  *(_OWORD *)(v24 + 48) = *(_OWORD *)(a9 + 32);
  *(_OWORD *)(v24 + 64) = v29;
  v38[3] = type metadata accessor for UserDayProvider();
  v38[4] = &off_1F2B4BD10;
  v38[0] = a10;
  v37[3] = type metadata accessor for XPCActivityScheduler();
  v37[4] = &off_1F2B4C608;
  v37[0] = a11;
  long long v35 = &type metadata for LockStateProvider;
  uint64_t v36 = &off_1F2B4A0A0;
  swift_defaultActor_initialize();
  a13[14] = a1;
  sub_1D3B60858(a2, (uint64_t)(a13 + 15));
  sub_1D3B60858((uint64_t)v48, (uint64_t)(a13 + 20));
  sub_1D3B60858((uint64_t)v47, (uint64_t)(a13 + 25));
  sub_1D3B60858((uint64_t)v46, (uint64_t)(a13 + 30));
  sub_1D3B60858((uint64_t)v45, (uint64_t)(a13 + 35));
  a13[40] = a12;
  sub_1D3B60858((uint64_t)v44, (uint64_t)(a13 + 41));
  sub_1D3B60858((uint64_t)v43, (uint64_t)(a13 + 46));
  sub_1D3B60858((uint64_t)v40, (uint64_t)(a13 + 51));
  sub_1D3B60858((uint64_t)v39, (uint64_t)(a13 + 56));
  sub_1D3B60858((uint64_t)v38, (uint64_t)(a13 + 61));
  sub_1D3B60858((uint64_t)v34, (uint64_t)(a13 + 66));
  sub_1D3B60858((uint64_t)v37, (uint64_t)(a13 + 71));
  sub_1D3C2EF50();
  uint64_t v30 = sub_1D3C2EF40();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v46);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
  __swift_destroy_boxed_opaque_existential_1(a2);
  a13[76] = v30;
  a13[77] = 0;
  return a13;
}

uint64_t sub_1D3C25844(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  long long v41 = &type metadata for BiomeObserver;
  uint64_t v42 = &off_1F2B4B4B8;
  uint64_t v38 = type metadata accessor for DateProvider();
  id v39 = &off_1F2B4A0B8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v37);
  sub_1D3C2BA10(a1, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(void))type metadata accessor for DateProvider);
  uint64_t PickupDateValidator = type metadata accessor for FirstPickupDateValidator();
  uint64_t v36 = &off_1F2B4BE00;
  long long v9 = __swift_allocate_boxed_opaque_existential_1(v34);
  sub_1D3C2BA10(a2, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for FirstPickupDateValidator);
  long long v32 = &type metadata for DuetObserver;
  uint64_t v33 = &off_1F2B4AAF0;
  long long v29 = &type metadata for FirstPickupStore;
  uint64_t v30 = &off_1F2B49FF8;
  type metadata accessor for FirstPickupObserver(0);
  uint64_t v10 = swift_allocObject();
  uint64_t v11 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v40, (uint64_t)&type metadata for BiomeObserver);
  MEMORY[0x1F4188790](v11);
  (*(void (**)(void))(v12 + 16))();
  uint64_t v13 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v37, v38);
  MEMORY[0x1F4188790](v13);
  long long v15 = &v28[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  (*(void (**)(unsigned char *))(v16 + 16))(v15);
  uint64_t v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v34, PickupDateValidator);
  MEMORY[0x1F4188790](v17);
  uint64_t v19 = &v28[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  (*(void (**)(unsigned char *))(v20 + 16))(v19);
  uint64_t v21 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v31, (uint64_t)&type metadata for DuetObserver);
  MEMORY[0x1F4188790](v21);
  (*(void (**)(void))(v22 + 16))();
  uint64_t v23 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v28, (uint64_t)&type metadata for FirstPickupStore);
  MEMORY[0x1F4188790](v23);
  (*(void (**)(void))(v24 + 16))();
  uint64_t v25 = sub_1D3C24DB8((uint64_t)v15, (uint64_t)v19, a3, a4, v10);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
  return v25;
}

void *sub_1D3C25C8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for DateProvider();
  uint64_t v32 = v8;
  uint64_t v33 = &off_1F2B4A0B8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v31);
  sub_1D3C2BA10(a1, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(void))type metadata accessor for DateProvider);
  uint64_t PickupObserver = type metadata accessor for FirstPickupObserver(0);
  v30[3] = PickupObserver;
  v30[4] = &off_1F2B4B570;
  v30[0] = a2;
  type metadata accessor for UserDayProvider();
  uint64_t v11 = (void *)swift_allocObject();
  uint64_t v12 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v31, v32);
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v15 + 16))(v14);
  uint64_t v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v30, PickupObserver);
  MEMORY[0x1F4188790](v16);
  uint64_t v18 = (uint64_t *)((char *)&v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v19 + 16))(v18);
  uint64_t v20 = *v18;
  uint64_t v28 = v8;
  long long v29 = &off_1F2B4A0B8;
  uint64_t v21 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v27);
  sub_1D3C2BA10((uint64_t)v14, (uint64_t)v21, (uint64_t (*)(void))type metadata accessor for DateProvider);
  uint64_t v25 = PickupObserver;
  long long v26 = &off_1F2B4B570;
  *(void *)&long long v24 = v20;
  swift_defaultActor_initialize();
  sub_1D3B819AC(&v27, (uint64_t)(v11 + 14));
  sub_1D3B819AC(&v24, (uint64_t)(v11 + 19));
  v11[24] = a4;
  v11[25] = a3;
  v11[26] = 0;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  return v11;
}

uint64_t sub_1D3C25EE8(uint64_t a1, uint64_t a2)
{
  long long v27 = &type metadata for DuetObserver;
  uint64_t v28 = &off_1F2B4AAF0;
  v25[3] = &type metadata for NotificationRequestPublisher;
  v25[4] = &off_1F2B4BC60;
  v25[0] = a1;
  uint64_t v23 = &type metadata for LockStateProvider;
  long long v24 = &off_1F2B4A0A0;
  uint64_t v3 = type metadata accessor for NotificationRequestStore();
  v21[3] = v3;
  v21[4] = &off_1F2B4DA48;
  v21[0] = a2;
  type metadata accessor for NotificationRequestScheduler();
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, (uint64_t)&type metadata for DuetObserver);
  MEMORY[0x1F4188790](v5);
  (*(void (**)(char *))(v7 + 16))((char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v25, (uint64_t)&type metadata for NotificationRequestPublisher);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (void *)((char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v11 + 16))(v10);
  uint64_t v12 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v22, (uint64_t)&type metadata for LockStateProvider);
  MEMORY[0x1F4188790](v12);
  (*(void (**)(char *))(v14 + 16))((char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v21, v3);
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (void *)((char *)v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v18 + 16))(v17);
  uint64_t v19 = sub_1D3C24CE8(*v10, *v17, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  return v19;
}

uint64_t sub_1D3C26214(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  v28[3] = &type metadata for NotificationSettingsProvider;
  v28[4] = &off_1F2B4A518;
  uint64_t v8 = swift_allocObject();
  v27[4] = &off_1F2B4A518;
  v28[0] = v8;
  long long v9 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v8 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v8 + 32) = v9;
  *(_OWORD *)(v8 + 48) = *(_OWORD *)(a1 + 32);
  *(void *)(v8 + 64) = *(void *)(a1 + 48);
  v27[3] = &type metadata for NotificationSettingsProvider;
  uint64_t v10 = swift_allocObject();
  v27[0] = v10;
  long long v11 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v10 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v10 + 32) = v11;
  *(_OWORD *)(v10 + 48) = *(_OWORD *)(a2 + 32);
  *(void *)(v10 + 64) = *(void *)(a2 + 48);
  uint64_t v25 = &type metadata for PairedDeviceRegistry;
  long long v26 = &off_1F2B4D980;
  type metadata accessor for NotificationSettingsSystem();
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v28, (uint64_t)&type metadata for NotificationSettingsProvider);
  uint64_t v14 = off_1F2B4A4F8;
  uint64_t size = off_1F2B4A4F8->size;
  MEMORY[0x1F4188790](v13);
  unint64_t v16 = (size + 15) & 0xFFFFFFFFFFFFFFF0;
  initializeWithCopy = (void (*)(unsigned char *))v14->initializeWithCopy;
  initializeWithCopy(&v24[-v16 - 8]);
  uint64_t v18 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v27, (uint64_t)&type metadata for NotificationSettingsProvider);
  MEMORY[0x1F4188790](v18);
  initializeWithCopy(&v24[-v16 - 8]);
  uint64_t v19 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v24, (uint64_t)&type metadata for PairedDeviceRegistry);
  MEMORY[0x1F4188790](v19);
  (*(void (**)(void))(v20 + 16))();
  uint64_t v21 = sub_1D3C24BD0((uint64_t)&v24[-v16 - 8], (uint64_t)&v24[-v16 - 8], a3, a4, v12);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  return v21;
}

void *sub_1D3C264AC(uint64_t a1, long long *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v64 = a1;
  uint64_t v65 = a2;
  uint64_t v63 = a11;
  uint64_t v89 = type metadata accessor for DateProvider();
  uint64_t v90 = &off_1F2B4A0B8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v88);
  sub_1D3C2BA10(a3, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(void))type metadata accessor for DateProvider);
  uint64_t v18 = type metadata accessor for FitnessModeObserver();
  v87[4] = &off_1F2B4C3B8;
  v87[3] = v18;
  v87[0] = a4;
  uint64_t v85 = &type metadata for FirstGlanceStore;
  uint64_t v86 = &off_1F2B4CC20;
  v84[0] = a5;
  uint64_t PickupObserver = type metadata accessor for FirstPickupObserver(0);
  uint64_t v83 = &off_1F2B4B570;
  v81[0] = a6;
  uint64_t v79 = type metadata accessor for NotificationRequestScheduler();
  id v80 = &off_1F2B4A6E0;
  v78[0] = a7;
  uint64_t v76 = &type metadata for NotificationSettingsProvider;
  uint64_t v77 = &off_1F2B4A518;
  uint64_t v19 = swift_allocObject();
  v75[0] = v19;
  long long v20 = *(_OWORD *)(a8 + 16);
  *(_OWORD *)(v19 + 16) = *(_OWORD *)a8;
  *(_OWORD *)(v19 + 32) = v20;
  *(_OWORD *)(v19 + 48) = *(_OWORD *)(a8 + 32);
  *(void *)(v19 + 64) = *(void *)(a8 + 48);
  unint64_t v73 = &type metadata for PrivacySettingsProvider;
  uint64_t v74 = &off_1F2B4C1A8;
  uint64_t v70 = &type metadata for FirstGlanceServiceFactory;
  uint64_t v71 = &off_1F2B4CB48;
  uint64_t v21 = swift_allocObject();
  v69[0] = v21;
  long long v22 = *(_OWORD *)(a9 + 112);
  *(_OWORD *)(v21 + 112) = *(_OWORD *)(a9 + 96);
  *(_OWORD *)(v21 + 128) = v22;
  *(void *)(v21 + 144) = *(void *)(a9 + 128);
  long long v23 = *(_OWORD *)(a9 + 48);
  *(_OWORD *)(v21 + 48) = *(_OWORD *)(a9 + 32);
  *(_OWORD *)(v21 + 64) = v23;
  long long v24 = *(_OWORD *)(a9 + 80);
  *(_OWORD *)(v21 + 80) = *(_OWORD *)(a9 + 64);
  *(_OWORD *)(v21 + 96) = v24;
  long long v25 = *(_OWORD *)(a9 + 16);
  *(_OWORD *)(v21 + 16) = *(_OWORD *)a9;
  *(_OWORD *)(v21 + 32) = v25;
  uint64_t v67 = type metadata accessor for UserDayProvider();
  uint64_t v68 = &off_1F2B4BD10;
  v66[0] = a10;
  type metadata accessor for FirstGlanceSystem();
  uint64_t v62 = (void *)swift_allocObject();
  uint64_t v26 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v88, v89);
  MEMORY[0x1F4188790](v26);
  uint64_t v28 = (char *)&v62 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v29 + 16))(v28);
  uint64_t v30 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v87, v18);
  MEMORY[0x1F4188790](v30);
  uint64_t v32 = (uint64_t *)((char *)&v62 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v33 + 16))(v32);
  uint64_t v34 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v84, (uint64_t)v85);
  MEMORY[0x1F4188790](v34);
  uint64_t v36 = (uint64_t *)((char *)&v62 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v37 + 16))(v36);
  uint64_t v38 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v81, PickupObserver);
  MEMORY[0x1F4188790](v38);
  uint64_t v40 = (uint64_t *)((char *)&v62 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v41 + 16))(v40);
  uint64_t v42 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v78, v79);
  MEMORY[0x1F4188790](v42);
  long long v44 = (uint64_t *)((char *)&v62 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v45 + 16))(v44);
  uint64_t v46 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v75, (uint64_t)v76);
  MEMORY[0x1F4188790](v46);
  unint64_t v48 = (char *)&v62 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v49 + 16))(v48);
  uint64_t v50 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v72, (uint64_t)v73);
  MEMORY[0x1F4188790](v50);
  (*(void (**)(void))(v51 + 16))();
  uint64_t v52 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v69, (uint64_t)v70);
  MEMORY[0x1F4188790](v52);
  uint64_t v54 = (char *)&v62 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v55 + 16))(v54);
  uint64_t v56 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v66, v67);
  MEMORY[0x1F4188790](v56);
  uint64_t v58 = (uint64_t *)((char *)&v62 - ((v57 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v59 + 16))(v58);
  uint64_t v60 = sub_1D3C24964(v64, v65, (uint64_t)v28, *v32, *v36, *v40, *v44, (uint64_t)v48, (uint64_t)v54, *v58, v63, v62);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v66);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v69);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v72);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v75);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v78);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v81);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v84);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v87);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v88);
  return v60;
}

void *sub_1D3C26C7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12)
{
  uint64_t v75 = a1;
  uint64_t v76 = a2;
  uint64_t v74 = a12;
  unint64_t v73 = a11;
  uint64_t v18 = type metadata accessor for FitnessModeObserver();
  v107[3] = v18;
  v107[4] = &off_1F2B4C3B8;
  v107[0] = a3;
  uint64_t v105 = type metadata accessor for DateProvider();
  uint64_t v106 = &off_1F2B4A0B8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v104);
  sub_1D3C2BA10(a4, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(void))type metadata accessor for DateProvider);
  uint64_t v102 = &type metadata for FitnessPlusPlanStore;
  uint64_t v103 = &off_1F2B4CFD8;
  uint64_t v20 = swift_allocObject();
  v101[0] = v20;
  long long v21 = *(_OWORD *)(a5 + 16);
  *(_OWORD *)(v20 + 16) = *(_OWORD *)a5;
  *(_OWORD *)(v20 + 32) = v21;
  *(void *)(v20 + 48) = *(void *)(a5 + 32);
  uint64_t PickupObserver = type metadata accessor for FirstPickupObserver(0);
  uint64_t v100 = &off_1F2B4B570;
  v98[0] = a6;
  uint64_t v96 = type metadata accessor for NotificationRequestScheduler();
  uint64_t v97 = &off_1F2B4A6E0;
  v95[0] = a7;
  uint64_t v93 = &type metadata for NotificationSettingsProvider;
  uint64_t v94 = &off_1F2B4A518;
  uint64_t v22 = swift_allocObject();
  v92[0] = v22;
  long long v23 = *(_OWORD *)(a8 + 16);
  *(_OWORD *)(v22 + 16) = *(_OWORD *)a8;
  *(_OWORD *)(v22 + 32) = v23;
  *(_OWORD *)(v22 + 48) = *(_OWORD *)(a8 + 32);
  *(void *)(v22 + 64) = *(void *)(a8 + 48);
  uint64_t v90 = &type metadata for PrivacySettingsProvider;
  uint64_t v91 = &off_1F2B4C1A8;
  uint64_t v87 = &type metadata for FitnessPlusPlanServiceFactory;
  uint64_t v88 = &off_1F2B4A7D0;
  uint64_t v24 = swift_allocObject();
  v86[0] = v24;
  long long v25 = *(_OWORD *)(a9 + 144);
  *(_OWORD *)(v24 + 144) = *(_OWORD *)(a9 + 128);
  *(_OWORD *)(v24 + 160) = v25;
  *(void *)(v24 + 176) = *(void *)(a9 + 160);
  long long v26 = *(_OWORD *)(a9 + 80);
  *(_OWORD *)(v24 + 80) = *(_OWORD *)(a9 + 64);
  *(_OWORD *)(v24 + 96) = v26;
  long long v27 = *(_OWORD *)(a9 + 112);
  *(_OWORD *)(v24 + 112) = *(_OWORD *)(a9 + 96);
  *(_OWORD *)(v24 + 128) = v27;
  long long v28 = *(_OWORD *)(a9 + 16);
  *(_OWORD *)(v24 + 16) = *(_OWORD *)a9;
  *(_OWORD *)(v24 + 32) = v28;
  long long v29 = *(_OWORD *)(a9 + 48);
  *(_OWORD *)(v24 + 48) = *(_OWORD *)(a9 + 32);
  *(_OWORD *)(v24 + 64) = v29;
  uint64_t v84 = type metadata accessor for UserDayProvider();
  uint64_t v85 = &off_1F2B4BD10;
  v83[0] = a10;
  uint64_t v81 = type metadata accessor for XPCActivityScheduler();
  id v82 = &off_1F2B4C608;
  v80[0] = v73;
  uint64_t v78 = &type metadata for LockStateProvider;
  uint64_t v79 = &off_1F2B4A0A0;
  type metadata accessor for FitnessPlusPlanSystem();
  unint64_t v73 = (void *)swift_allocObject();
  uint64_t v30 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v107, v18);
  MEMORY[0x1F4188790](v30);
  uint64_t v72 = (uint64_t *)((char *)&v71 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(void))(v32 + 16))();
  uint64_t v33 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v104, v105);
  MEMORY[0x1F4188790](v33);
  uint64_t v35 = (char *)&v71 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v36 + 16))(v35);
  uint64_t v37 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v101, (uint64_t)v102);
  MEMORY[0x1F4188790](v37);
  uint64_t v39 = (char *)&v71 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v40 + 16))(v39);
  uint64_t v41 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v98, PickupObserver);
  MEMORY[0x1F4188790](v41);
  uint64_t v43 = (uint64_t *)((char *)&v71 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v44 + 16))(v43);
  uint64_t v45 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v95, v96);
  MEMORY[0x1F4188790](v45);
  uint64_t v47 = (uint64_t *)((char *)&v71 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v48 + 16))(v47);
  uint64_t v49 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v92, (uint64_t)v93);
  MEMORY[0x1F4188790](v49);
  uint64_t v51 = (char *)&v71 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v52 + 16))(v51);
  uint64_t v53 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v89, (uint64_t)v90);
  MEMORY[0x1F4188790](v53);
  (*(void (**)(void))(v54 + 16))();
  uint64_t v55 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v86, (uint64_t)v87);
  MEMORY[0x1F4188790](v55);
  uint64_t v57 = (char *)&v71 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v58 + 16))(v57);
  uint64_t v59 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v83, v84);
  MEMORY[0x1F4188790](v59);
  uint64_t v61 = (uint64_t *)((char *)&v71 - ((v60 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v62 + 16))(v61);
  uint64_t v63 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v80, v81);
  MEMORY[0x1F4188790](v63);
  uint64_t v65 = (uint64_t *)((char *)&v71 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v66 + 16))(v65);
  uint64_t v67 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v77, (uint64_t)v78);
  MEMORY[0x1F4188790](v67);
  (*(void (**)(void))(v68 + 16))();
  uint64_t v69 = sub_1D3C254F4(v75, v76, *v72, (uint64_t)v35, (uint64_t)v39, *v43, *v47, (uint64_t)v51, (uint64_t)v57, *v61, *v65, v74, v73);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v77);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v80);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v83);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v86);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v89);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v92);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v95);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v101);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v104);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v107);
  return v69;
}

uint64_t sub_1D3C275EC(uint64_t a1, long long *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v39 = type metadata accessor for DateProvider();
  uint64_t v40 = &off_1F2B4A0B8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v38);
  sub_1D3C2BA10(a1, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(void))type metadata accessor for DateProvider);
  uint64_t v11 = type metadata accessor for FitnessPlusPlanSystem();
  uint64_t v37[3] = v11;
  v37[4] = &off_1F2B4D4D0;
  v37[0] = a3;
  uint64_t v35 = &type metadata for FitnessPlusPlanServiceFactory;
  uint64_t v36 = &off_1F2B4A7D0;
  uint64_t v12 = swift_allocObject();
  v34[0] = v12;
  long long v13 = *(_OWORD *)(a4 + 144);
  *(_OWORD *)(v12 + 144) = *(_OWORD *)(a4 + 128);
  *(_OWORD *)(v12 + 160) = v13;
  *(void *)(v12 + 176) = *(void *)(a4 + 160);
  long long v14 = *(_OWORD *)(a4 + 80);
  *(_OWORD *)(v12 + 80) = *(_OWORD *)(a4 + 64);
  *(_OWORD *)(v12 + 96) = v14;
  long long v15 = *(_OWORD *)(a4 + 112);
  *(_OWORD *)(v12 + 112) = *(_OWORD *)(a4 + 96);
  *(_OWORD *)(v12 + 128) = v15;
  long long v16 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)(v12 + 16) = *(_OWORD *)a4;
  *(_OWORD *)(v12 + 32) = v16;
  long long v17 = *(_OWORD *)(a4 + 48);
  *(_OWORD *)(v12 + 48) = *(_OWORD *)(a4 + 32);
  *(_OWORD *)(v12 + 64) = v17;
  type metadata accessor for FitnessPlusPlanListener();
  uint64_t v18 = swift_allocObject();
  uint64_t v19 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v38, v39);
  MEMORY[0x1F4188790](v19);
  long long v21 = (char *)&v34[-1] - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v22 + 16))(v21);
  uint64_t v23 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v37, v11);
  MEMORY[0x1F4188790](v23);
  long long v25 = (void *)((char *)&v34[-1] - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v26 + 16))(v25);
  uint64_t v27 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v34, (uint64_t)v35);
  MEMORY[0x1F4188790](v27);
  long long v29 = (char *)&v34[-1] - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v30 + 16))(v29);
  uint64_t v31 = sub_1D3C28DE0((uint64_t)v21, a2, *v25, (uint64_t)v29, a5, v18);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
  return v31;
}

void *sub_1D3C27908(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v70 = a1;
  uint64_t v69 = a10;
  uint64_t v17 = type metadata accessor for FitnessModeObserver();
  void v101[3] = v17;
  v101[4] = &off_1F2B4C3B8;
  v101[0] = a2;
  uint64_t v99 = type metadata accessor for DateProvider();
  uint64_t v100 = &off_1F2B4A0B8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v98);
  sub_1D3C2BA10(a3, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(void))type metadata accessor for DateProvider);
  uint64_t v96 = &type metadata for PauseRingsStore;
  uint64_t v97 = &off_1F2B4B790;
  uint64_t PickupObserver = type metadata accessor for FirstPickupObserver(0);
  uint64_t v94 = &off_1F2B4B570;
  v92[0] = a4;
  uint64_t v90 = type metadata accessor for NotificationRequestScheduler();
  uint64_t v91 = &off_1F2B4A6E0;
  v89[0] = a5;
  uint64_t v87 = &type metadata for NotificationSettingsProvider;
  uint64_t v88 = &off_1F2B4A518;
  uint64_t v19 = swift_allocObject();
  v86[0] = v19;
  long long v20 = *(_OWORD *)(a6 + 16);
  *(_OWORD *)(v19 + 16) = *(_OWORD *)a6;
  *(_OWORD *)(v19 + 32) = v20;
  *(_OWORD *)(v19 + 48) = *(_OWORD *)(a6 + 32);
  *(void *)(v19 + 64) = *(void *)(a6 + 48);
  uint64_t v84 = &type metadata for PrivacySettingsProvider;
  uint64_t v85 = &off_1F2B4C1A8;
  uint64_t v81 = &type metadata for PauseRingsServiceFactory;
  id v82 = &off_1F2B4B488;
  uint64_t v21 = swift_allocObject();
  v80[0] = v21;
  long long v22 = *(_OWORD *)(a7 + 144);
  *(_OWORD *)(v21 + 144) = *(_OWORD *)(a7 + 128);
  *(_OWORD *)(v21 + 160) = v22;
  *(void *)(v21 + 176) = *(void *)(a7 + 160);
  long long v23 = *(_OWORD *)(a7 + 80);
  *(_OWORD *)(v21 + 80) = *(_OWORD *)(a7 + 64);
  *(_OWORD *)(v21 + 96) = v23;
  long long v24 = *(_OWORD *)(a7 + 112);
  *(_OWORD *)(v21 + 112) = *(_OWORD *)(a7 + 96);
  *(_OWORD *)(v21 + 128) = v24;
  long long v25 = *(_OWORD *)(a7 + 16);
  *(_OWORD *)(v21 + 16) = *(_OWORD *)a7;
  *(_OWORD *)(v21 + 32) = v25;
  long long v26 = *(_OWORD *)(a7 + 48);
  *(_OWORD *)(v21 + 48) = *(_OWORD *)(a7 + 32);
  *(_OWORD *)(v21 + 64) = v26;
  uint64_t v78 = type metadata accessor for UserDayProvider();
  uint64_t v79 = &off_1F2B4BD10;
  v77[0] = a8;
  uint64_t v75 = type metadata accessor for XPCActivityScheduler();
  uint64_t v76 = &off_1F2B4C608;
  v74[0] = a9;
  uint64_t v72 = &type metadata for LockStateProvider;
  unint64_t v73 = &off_1F2B4A0A0;
  type metadata accessor for PauseRingsSystem();
  uint64_t v68 = (void *)swift_allocObject();
  uint64_t v27 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v101, v17);
  MEMORY[0x1F4188790](v27);
  long long v29 = (uint64_t *)((char *)&v67 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v30 + 16))(v29);
  uint64_t v31 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v98, v99);
  MEMORY[0x1F4188790](v31);
  uint64_t v33 = (char *)&v67 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v34 + 16))(v33);
  uint64_t v35 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v95, (uint64_t)v96);
  MEMORY[0x1F4188790](v35);
  (*(void (**)(void))(v36 + 16))();
  uint64_t v37 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v92, PickupObserver);
  MEMORY[0x1F4188790](v37);
  uint64_t v39 = (uint64_t *)((char *)&v67 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v40 + 16))(v39);
  uint64_t v41 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v89, v90);
  MEMORY[0x1F4188790](v41);
  uint64_t v43 = (uint64_t *)((char *)&v67 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v44 + 16))(v43);
  uint64_t v45 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v86, (uint64_t)v87);
  MEMORY[0x1F4188790](v45);
  uint64_t v47 = (char *)&v67 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v48 + 16))(v47);
  uint64_t v49 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v83, (uint64_t)v84);
  MEMORY[0x1F4188790](v49);
  (*(void (**)(void))(v50 + 16))();
  uint64_t v51 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v80, (uint64_t)v81);
  MEMORY[0x1F4188790](v51);
  uint64_t v53 = (char *)&v67 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v54 + 16))(v53);
  uint64_t v55 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v77, v78);
  MEMORY[0x1F4188790](v55);
  uint64_t v57 = (uint64_t *)((char *)&v67 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v58 + 16))(v57);
  uint64_t v59 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v74, v75);
  MEMORY[0x1F4188790](v59);
  uint64_t v61 = (uint64_t *)((char *)&v67 - ((v60 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v62 + 16))(v61);
  uint64_t v63 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v71, (uint64_t)v72);
  MEMORY[0x1F4188790](v63);
  (*(void (**)(void))(v64 + 16))();
  uint64_t v65 = sub_1D3C251E4(v70, *v29, (uint64_t)v33, *v39, *v43, (uint64_t)v47, (uint64_t)v53, *v57, *v61, v69, v68);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v71);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v74);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v77);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v80);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v83);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v86);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v89);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v92);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v95);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v101);
  return v65;
}

uint64_t sub_1D3C28240(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v37 = type metadata accessor for DateProvider();
  uint64_t v38 = &off_1F2B4A0B8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v36);
  sub_1D3C2BA10(a1, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(void))type metadata accessor for DateProvider);
  uint64_t v9 = type metadata accessor for PauseRingsSystem();
  v35[3] = v9;
  v35[4] = &off_1F2B4CD30;
  v35[0] = a2;
  uint64_t v33 = &type metadata for PauseRingsServiceFactory;
  uint64_t v34 = &off_1F2B4B488;
  uint64_t v10 = swift_allocObject();
  v32[0] = v10;
  long long v11 = *(_OWORD *)(a3 + 144);
  *(_OWORD *)(v10 + 144) = *(_OWORD *)(a3 + 128);
  *(_OWORD *)(v10 + 160) = v11;
  *(void *)(v10 + 176) = *(void *)(a3 + 160);
  long long v12 = *(_OWORD *)(a3 + 80);
  *(_OWORD *)(v10 + 80) = *(_OWORD *)(a3 + 64);
  *(_OWORD *)(v10 + 96) = v12;
  long long v13 = *(_OWORD *)(a3 + 112);
  *(_OWORD *)(v10 + 112) = *(_OWORD *)(a3 + 96);
  *(_OWORD *)(v10 + 128) = v13;
  long long v14 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v10 + 16) = *(_OWORD *)a3;
  *(_OWORD *)(v10 + 32) = v14;
  long long v15 = *(_OWORD *)(a3 + 48);
  *(_OWORD *)(v10 + 48) = *(_OWORD *)(a3 + 32);
  *(_OWORD *)(v10 + 64) = v15;
  type metadata accessor for PauseRingsListener();
  uint64_t v16 = swift_allocObject();
  uint64_t v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v36, v37);
  MEMORY[0x1F4188790](v17);
  uint64_t v19 = (char *)&v32[-1] - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v20 + 16))(v19);
  uint64_t v21 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v35, v9);
  MEMORY[0x1F4188790](v21);
  long long v23 = (void *)((char *)&v32[-1] - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v24 + 16))(v23);
  uint64_t v25 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v32, (uint64_t)v33);
  MEMORY[0x1F4188790](v25);
  uint64_t v27 = (char *)&v32[-1] - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v28 + 16))(v27);
  uint64_t v29 = sub_1D3C28C94((uint64_t)v19, *v23, (uint64_t)v27, a4, v16);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
  return v29;
}

void *sub_1D3C2854C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, long long *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v55 = type metadata accessor for DateProvider();
  uint64_t v56 = &off_1F2B4A0B8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v54);
  sub_1D3C2BA10(a2, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(void))type metadata accessor for DateProvider);
  uint64_t v15 = type metadata accessor for FitnessModeObserver();
  v53[3] = v15;
  v53[4] = &off_1F2B4C3B8;
  v53[0] = a3;
  uint64_t v51 = &type metadata for NotificationSettingsProvider;
  uint64_t v52 = &off_1F2B4A518;
  uint64_t v16 = swift_allocObject();
  v50[0] = v16;
  long long v17 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)(v16 + 16) = *(_OWORD *)a4;
  *(_OWORD *)(v16 + 32) = v17;
  *(_OWORD *)(v16 + 48) = *(_OWORD *)(a4 + 32);
  *(void *)(v16 + 64) = *(void *)(a4 + 48);
  uint64_t v48 = &type metadata for PrivacySettingsProvider;
  uint64_t v49 = &off_1F2B4C1A8;
  uint64_t v45 = type metadata accessor for UserDayProvider();
  uint64_t v46 = &off_1F2B4BD10;
  v44[0] = a6;
  uint64_t v42 = &type metadata for GoalProgressConfigurationFactory;
  uint64_t v43 = &off_1F2B4BFA0;
  type metadata accessor for GoalProgressSystem();
  uint64_t v18 = (void *)swift_allocObject();
  uint64_t v19 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v54, v55);
  MEMORY[0x1F4188790](v19);
  uint64_t v21 = &v41[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *))(v22 + 16))(v21);
  uint64_t v23 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v53, v15);
  MEMORY[0x1F4188790](v23);
  uint64_t v25 = (uint64_t *)&v41[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(uint64_t *))(v26 + 16))(v25);
  uint64_t v27 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v50, (uint64_t)v51);
  MEMORY[0x1F4188790](v27);
  uint64_t v29 = &v41[-((v28 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *))(v30 + 16))(v29);
  uint64_t v31 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v47, (uint64_t)v48);
  MEMORY[0x1F4188790](v31);
  (*(void (**)(void))(v32 + 16))();
  uint64_t v33 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v44, v45);
  MEMORY[0x1F4188790](v33);
  uint64_t v35 = (uint64_t *)&v41[-((v34 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(uint64_t *))(v36 + 16))(v35);
  uint64_t v37 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v41, (uint64_t)v42);
  MEMORY[0x1F4188790](v37);
  (*(void (**)(void))(v38 + 16))();
  uint64_t v39 = sub_1D3C2503C(a1, (uint64_t)v21, *v25, (uint64_t)v29, a5, *v35, a7, v18);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v50);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v53);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v54);
  return v39;
}

uint64_t sub_1D3C28A94(uint64_t a1, uint64_t a2)
{
  v23[3] = &type metadata for FirstGlanceStore;
  v23[4] = &off_1F2B4CC20;
  v23[0] = a1;
  uint64_t PickupObserver = type metadata accessor for FirstPickupObserver(0);
  v22[3] = PickupObserver;
  v22[4] = &off_1F2B4B570;
  v22[0] = a2;
  type metadata accessor for AdminSystem();
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v23, (uint64_t)&type metadata for FirstGlanceStore);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (uint64_t *)((char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v8 + 16))(v7);
  uint64_t v9 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v22, PickupObserver);
  MEMORY[0x1F4188790](v9);
  long long v11 = (uint64_t *)((char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v12 + 16))(v11);
  uint64_t v13 = *v7;
  uint64_t v14 = *v11;
  uint64_t v20 = &type metadata for FirstGlanceStore;
  uint64_t v21 = &off_1F2B4CC20;
  uint64_t v18 = &off_1F2B4B570;
  *(void *)&long long v19 = v13;
  uint64_t v17 = PickupObserver;
  *(void *)&long long v16 = v14;
  swift_defaultActor_initialize();
  sub_1D3B819AC(&v19, v4 + 112);
  sub_1D3B819AC(&v16, v4 + 152);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  return v4;
}

uint64_t sub_1D3C28C94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v28 = sub_1D3C2E8E0();
  uint64_t v29 = MEMORY[0x1E4F61CD0];
  *(void *)&long long v27 = a4;
  uint64_t v25 = type metadata accessor for DateProvider();
  uint64_t v26 = &off_1F2B4A0B8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v24);
  sub_1D3C2BA10(a1, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(void))type metadata accessor for DateProvider);
  uint64_t v22 = type metadata accessor for PauseRingsSystem();
  uint64_t v23 = &off_1F2B4CD30;
  *(void *)&long long v21 = a2;
  long long v19 = &type metadata for PauseRingsServiceFactory;
  uint64_t v20 = &off_1F2B4B488;
  uint64_t v11 = swift_allocObject();
  *(void *)&long long v18 = v11;
  long long v12 = *(_OWORD *)(a3 + 144);
  *(_OWORD *)(v11 + 144) = *(_OWORD *)(a3 + 128);
  *(_OWORD *)(v11 + 160) = v12;
  *(void *)(v11 + 176) = *(void *)(a3 + 160);
  long long v13 = *(_OWORD *)(a3 + 80);
  *(_OWORD *)(v11 + 80) = *(_OWORD *)(a3 + 64);
  *(_OWORD *)(v11 + 96) = v13;
  long long v14 = *(_OWORD *)(a3 + 112);
  *(_OWORD *)(v11 + 112) = *(_OWORD *)(a3 + 96);
  *(_OWORD *)(v11 + 128) = v14;
  long long v15 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v11 + 16) = *(_OWORD *)a3;
  *(_OWORD *)(v11 + 32) = v15;
  long long v16 = *(_OWORD *)(a3 + 48);
  *(_OWORD *)(v11 + 48) = *(_OWORD *)(a3 + 32);
  *(_OWORD *)(v11 + 64) = v16;
  swift_defaultActor_initialize();
  sub_1D3B819AC(&v24, a5 + 112);
  sub_1D3B819AC(&v21, a5 + 152);
  sub_1D3B819AC(&v18, a5 + 192);
  sub_1D3B819AC(&v27, a5 + 232);
  return a5;
}

uint64_t sub_1D3C28DE0(uint64_t a1, long long *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v30 = sub_1D3C2E8E0();
  uint64_t v31 = MEMORY[0x1E4F61CD0];
  *(void *)&long long v29 = a5;
  uint64_t v27 = type metadata accessor for DateProvider();
  uint64_t v28 = &off_1F2B4A0B8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v26);
  sub_1D3C2BA10(a1, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(void))type metadata accessor for DateProvider);
  uint64_t v24 = type metadata accessor for FitnessPlusPlanSystem();
  uint64_t v25 = &off_1F2B4D4D0;
  *(void *)&long long v23 = a3;
  long long v21 = &type metadata for FitnessPlusPlanServiceFactory;
  uint64_t v22 = &off_1F2B4A7D0;
  uint64_t v13 = swift_allocObject();
  *(void *)&long long v20 = v13;
  long long v14 = *(_OWORD *)(a4 + 144);
  *(_OWORD *)(v13 + 144) = *(_OWORD *)(a4 + 128);
  *(_OWORD *)(v13 + 160) = v14;
  *(void *)(v13 + 176) = *(void *)(a4 + 160);
  long long v15 = *(_OWORD *)(a4 + 80);
  *(_OWORD *)(v13 + 80) = *(_OWORD *)(a4 + 64);
  *(_OWORD *)(v13 + 96) = v15;
  long long v16 = *(_OWORD *)(a4 + 112);
  *(_OWORD *)(v13 + 112) = *(_OWORD *)(a4 + 96);
  *(_OWORD *)(v13 + 128) = v16;
  long long v17 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)(v13 + 16) = *(_OWORD *)a4;
  *(_OWORD *)(v13 + 32) = v17;
  long long v18 = *(_OWORD *)(a4 + 48);
  *(_OWORD *)(v13 + 48) = *(_OWORD *)(a4 + 32);
  *(_OWORD *)(v13 + 64) = v18;
  swift_defaultActor_initialize();
  sub_1D3B819AC(&v26, a6 + 112);
  sub_1D3B819AC(a2, a6 + 192);
  sub_1D3B819AC(&v23, a6 + 152);
  sub_1D3B819AC(&v20, a6 + 232);
  sub_1D3B819AC(&v29, a6 + 272);
  return a6;
}

unint64_t sub_1D3C28F3C(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return MEMORY[0x1E4FBC868];
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA6B69B0);
  uint64_t v3 = (void *)sub_1D3C2F800();
  uint64_t v4 = a1[4];
  uint64_t v5 = (void *)a1[5];
  unint64_t result = sub_1D3C13EF0(v4);
  if (v7)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    id v17 = v5;
    return (unint64_t)v3;
  }
  uint64_t v8 = (void **)(a1 + 7);
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v3[6] + v9) = v4;
    *(void *)(v3[7] + v9) = v5;
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      break;
    }
    v3[2] = v12;
    if (!--v1) {
      goto LABEL_8;
    }
    uint64_t v13 = v8 + 2;
    uint64_t v4 = (uint64_t)*(v8 - 1);
    long long v14 = *v8;
    id v15 = v5;
    unint64_t result = sub_1D3C13EF0(v4);
    uint64_t v8 = v13;
    uint64_t v5 = v14;
    if (v16) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_1D3C29034(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6B69A8);
    uint64_t v3 = (void *)sub_1D3C2F800();
    for (uint64_t i = (uint64_t *)(a1 + 40); ; i += 2)
    {
      uint64_t v5 = *(i - 1);
      uint64_t v6 = *i;
      unint64_t result = sub_1D3C13EF0(v5);
      if (v8) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      uint64_t v9 = 8 * result;
      *(void *)(v3[6] + v9) = v5;
      *(void *)(v3[7] + v9) = v6;
      uint64_t v10 = v3[2];
      BOOL v11 = __OFADD__(v10, 1);
      uint64_t v12 = v10 + 1;
      if (v11) {
        goto LABEL_10;
      }
      v3[2] = v12;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC868];
  }
  return result;
}

id sub_1D3C29110(uint64_t a1, void *a2, char a3, void *a4)
{
  v20[3] = type metadata accessor for DateProvider();
  v20[4] = (uint64_t)&off_1F2B4A0B8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v20);
  sub_1D3C2BA10(a1, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(void))type metadata accessor for DateProvider);
  long long v18 = &type metadata for DuetObserver;
  long long v19 = &off_1F2B4AAF0;
  sub_1D3B60858((uint64_t)v20, (uint64_t)a4 + OBJC_IVAR____TtC23FitnessCoachingServices13SleepObserver_dateProvider);
  sub_1D3B60858((uint64_t)v17, (uint64_t)a4 + OBJC_IVAR____TtC23FitnessCoachingServices13SleepObserver_duetObserver);
  type metadata accessor for UnfairLock();
  uint64_t v9 = swift_allocObject();
  uint64_t v10 = a4;
  BOOL v11 = (_DWORD *)swift_slowAlloc();
  *(void *)(v9 + 16) = v11;
  *BOOL v11 = 0;
  *(void *)&v10[OBJC_IVAR____TtC23FitnessCoachingServices13SleepObserver_lock] = v9;
  *(void *)&v10[OBJC_IVAR____TtC23FitnessCoachingServices13SleepObserver_notificationCenter] = a2;
  v10[OBJC_IVAR____TtC23FitnessCoachingServices13SleepObserver_platform] = a3;
  uint64_t v12 = &v10[OBJC_IVAR____TtC23FitnessCoachingServices13SleepObserver_state];
  *(void *)uint64_t v12 = 0;
  v12[8] = -1;
  id v13 = a2;

  v16.receiver = v10;
  v16.super_class = (Class)type metadata accessor for SleepObserver();
  id v14 = objc_msgSendSuper2(&v16, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  return v14;
}

id sub_1D3C29270(uint64_t a1, void *a2, char a3)
{
  uint64_t v20 = type metadata accessor for DateProvider();
  long long v21 = &off_1F2B4A0B8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v19);
  sub_1D3C2BA10(a1, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(void))type metadata accessor for DateProvider);
  id v17 = &type metadata for DuetObserver;
  long long v18 = &off_1F2B4AAF0;
  id v7 = objc_allocWithZone((Class)type metadata accessor for SleepObserver());
  uint64_t v8 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v19, v20);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = &v16[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *))(v11 + 16))(v10);
  uint64_t v12 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v16, (uint64_t)v17);
  MEMORY[0x1F4188790](v12);
  (*(void (**)(void))(v13 + 16))();
  id v14 = sub_1D3C29110((uint64_t)v10, a2, a3, v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  return v14;
}

uint64_t sub_1D3C29468()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 72, 7);
}

uint64_t sub_1D3C294A8()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);

  return MEMORY[0x1F4186498](v0, 152, 7);
}

uint64_t sub_1D3C29500()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);

  __swift_destroy_boxed_opaque_existential_1(v0 + 144);
  return MEMORY[0x1F4186498](v0, 184, 7);
}

uint64_t sub_1D3C29558()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1D3C29590(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1D3C295EC()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  __swift_destroy_boxed_opaque_existential_1(v0 + 144);
  return MEMORY[0x1F4186498](v0, 184, 7);
}

uint64_t sub_1D3C29644()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  __swift_destroy_boxed_opaque_existential_1(v0 + 144);

  return MEMORY[0x1F4186498](v0, 192, 7);
}

uint64_t sub_1D3C296A4()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);

  return MEMORY[0x1F4186498](v0, 104, 7);
}

uint64_t sub_1D3C296EC()
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));

  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 13));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 18));

  return MEMORY[0x1F4186498](v0, 200, 7);
}

uint64_t sub_1D3C29754(uint64_t a1)
{
  return a1;
}

uint64_t sub_1D3C297A8()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1D3C297E0(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_1D3B5C3DC;
  return sub_1D3B7A910(a1, v1);
}

uint64_t sub_1D3C2987C(uint64_t *a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_1D3B5C2E8;
  return sub_1D3B81F98(a1, v1);
}

uint64_t sub_1D3C29914(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_1D3B5C3DC;
  return sub_1D3B84C30(a1, v1);
}

uint64_t sub_1D3C299AC()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_1D3B5C3DC;
  return sub_1D3BF0610(v0);
}

uint64_t sub_1D3C29A3C(uint64_t *a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_1D3B5C3DC;
  return sub_1D3BB1DD8(a1, v1);
}

uint64_t sub_1D3C29AD4(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_1D3B5C3DC;
  return sub_1D3BB6F8C(a1, v1);
}

void destroy for Daemon(uint64_t a1)
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  __swift_destroy_boxed_opaque_existential_1(a1 + 136);
  __swift_destroy_boxed_opaque_existential_1(a1 + 176);
  __swift_destroy_boxed_opaque_existential_1(a1 + 216);

  __swift_destroy_boxed_opaque_existential_1(a1 + 264);
  __swift_destroy_boxed_opaque_existential_1(a1 + 304);
  __swift_destroy_boxed_opaque_existential_1(a1 + 344);
  __swift_destroy_boxed_opaque_existential_1(a1 + 384);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 432);
  __swift_destroy_boxed_opaque_existential_1(a1 + 472);
  __swift_destroy_boxed_opaque_existential_1(a1 + 512);
  __swift_destroy_boxed_opaque_existential_1(a1 + 552);
  __swift_destroy_boxed_opaque_existential_1(a1 + 592);
  __swift_destroy_boxed_opaque_existential_1(a1 + 632);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 680);
  __swift_destroy_boxed_opaque_existential_1(a1 + 720);
  __swift_destroy_boxed_opaque_existential_1(a1 + 760);

  __swift_destroy_boxed_opaque_existential_1(a1 + 808);
  __swift_destroy_boxed_opaque_existential_1(a1 + 848);
  __swift_destroy_boxed_opaque_existential_1(a1 + 888);
  __swift_destroy_boxed_opaque_existential_1(a1 + 928);
  __swift_destroy_boxed_opaque_existential_1(a1 + 968);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1008);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1048);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1088);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1128);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1168);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1208);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1248);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1288);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1328);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1368);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1408);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1448);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1488);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1528);

  __swift_destroy_boxed_opaque_existential_1(a1 + 1576);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1616);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1656);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1696);

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 1776);

  __swift_destroy_boxed_opaque_existential_1(a1 + 1824);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1864);
  swift_release();

  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 1928);
}

uint64_t initializeWithCopy for Daemon(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = a2 + 16;
  long long v6 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v6;
  uint64_t v7 = v6;
  uint64_t v8 = **(void (***)(uint64_t, uint64_t, uint64_t))(v6 - 8);
  swift_bridgeObjectRetain();
  v8(a1 + 16, v5, v7);
  long long v9 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 56, a2 + 56);
  long long v10 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 120) = v10;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 96, a2 + 96);
  long long v11 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 160) = v11;
  (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 136, a2 + 136);
  long long v12 = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 200) = v12;
  (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 176, a2 + 176);
  long long v13 = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 240) = v13;
  (**(void (***)(uint64_t, uint64_t))(v13 - 8))(a1 + 216, a2 + 216);
  id v14 = *(void **)(a2 + 256);
  *(void *)(a1 + 256) = v14;
  long long v15 = *(_OWORD *)(a2 + 288);
  *(_OWORD *)(a1 + 288) = v15;
  uint64_t v16 = v15;
  id v17 = **(void (***)(uint64_t, uint64_t, uint64_t))(v15 - 8);
  id v18 = v14;
  v17(a1 + 264, a2 + 264, v16);
  uint64_t v19 = *(void *)(a2 + 328);
  uint64_t v20 = *(void *)(a2 + 336);
  *(void *)(a1 + 328) = v19;
  *(void *)(a1 + 336) = v20;
  (**(void (***)(uint64_t, uint64_t))(v19 - 8))(a1 + 304, a2 + 304);
  long long v21 = *(_OWORD *)(a2 + 368);
  *(_OWORD *)(a1 + 368) = v21;
  (**(void (***)(uint64_t, uint64_t))(v21 - 8))(a1 + 344, a2 + 344);
  uint64_t v22 = *(void *)(a2 + 408);
  uint64_t v23 = *(void *)(a2 + 416);
  *(void *)(a1 + 408) = v22;
  *(void *)(a1 + 416) = v23;
  (**(void (***)(uint64_t, uint64_t))(v22 - 8))(a1 + 384, a2 + 384);
  *(void *)(a1 + 424) = *(void *)(a2 + 424);
  uint64_t v25 = *(void *)(a2 + 456);
  uint64_t v24 = *(void *)(a2 + 464);
  *(void *)(a1 + 456) = v25;
  *(void *)(a1 + 464) = v24;
  long long v26 = **(void (***)(uint64_t, uint64_t, uint64_t))(v25 - 8);
  swift_retain();
  v26(a1 + 432, a2 + 432, v25);
  long long v27 = *(_OWORD *)(a2 + 496);
  *(_OWORD *)(a1 + 496) = v27;
  (**(void (***)(uint64_t, uint64_t))(v27 - 8))(a1 + 472, a2 + 472);
  uint64_t v28 = *(void *)(a2 + 536);
  *(void *)(a1 + 536) = v28;
  *(void *)(a1 + 544) = *(void *)(a2 + 544);
  (**(void (***)(uint64_t, uint64_t))(v28 - 8))(a1 + 512, a2 + 512);
  long long v29 = *(_OWORD *)(a2 + 576);
  *(_OWORD *)(a1 + 576) = v29;
  (**(void (***)(uint64_t, uint64_t))(v29 - 8))(a1 + 552, a2 + 552);
  uint64_t v30 = *(void *)(a2 + 616);
  *(void *)(a1 + 616) = v30;
  *(void *)(a1 + 624) = *(void *)(a2 + 624);
  (**(void (***)(uint64_t, uint64_t))(v30 - 8))(a1 + 592, a2 + 592);
  long long v31 = *(_OWORD *)(a2 + 656);
  *(_OWORD *)(a1 + 656) = v31;
  (**(void (***)(uint64_t, uint64_t))(v31 - 8))(a1 + 632, a2 + 632);
  *(void *)(a1 + 672) = *(void *)(a2 + 672);
  long long v32 = *(_OWORD *)(a2 + 704);
  *(_OWORD *)(a1 + 704) = v32;
  uint64_t v33 = v32;
  uint64_t v34 = **(void (***)(uint64_t, uint64_t, uint64_t))(v32 - 8);
  swift_retain();
  v34(a1 + 680, a2 + 680, v33);
  uint64_t v35 = *(void *)(a2 + 744);
  *(void *)(a1 + 744) = v35;
  *(void *)(a1 + 752) = *(void *)(a2 + 752);
  (**(void (***)(uint64_t, uint64_t))(v35 - 8))(a1 + 720, a2 + 720);
  long long v36 = *(_OWORD *)(a2 + 784);
  *(_OWORD *)(a1 + 784) = v36;
  (**(void (***)(uint64_t, uint64_t))(v36 - 8))(a1 + 760, a2 + 760);
  uint64_t v37 = *(void **)(a2 + 800);
  *(void *)(a1 + 800) = v37;
  long long v38 = *(_OWORD *)(a2 + 832);
  *(_OWORD *)(a1 + 832) = v38;
  uint64_t v39 = v38;
  uint64_t v40 = **(void (***)(uint64_t, uint64_t, uint64_t))(v38 - 8);
  id v41 = v37;
  v40(a1 + 808, a2 + 808, v39);
  uint64_t v42 = *(void *)(a2 + 872);
  *(void *)(a1 + 872) = v42;
  *(void *)(a1 + 880) = *(void *)(a2 + 880);
  (**(void (***)(uint64_t, uint64_t))(v42 - 8))(a1 + 848, a2 + 848);
  long long v43 = *(_OWORD *)(a2 + 912);
  *(_OWORD *)(a1 + 912) = v43;
  (**(void (***)(uint64_t, uint64_t))(v43 - 8))(a1 + 888, a2 + 888);
  uint64_t v44 = *(void *)(a2 + 952);
  *(void *)(a1 + 952) = v44;
  *(void *)(a1 + 960) = *(void *)(a2 + 960);
  (**(void (***)(uint64_t, uint64_t))(v44 - 8))(a1 + 928, a2 + 928);
  long long v45 = *(_OWORD *)(a2 + 992);
  *(_OWORD *)(a1 + 992) = v45;
  (**(void (***)(uint64_t, uint64_t))(v45 - 8))(a1 + 968, a2 + 968);
  uint64_t v46 = *(void *)(a2 + 1032);
  *(void *)(a1 + 1032) = v46;
  *(void *)(a1 + 1040) = *(void *)(a2 + 1040);
  (**(void (***)(uint64_t, uint64_t))(v46 - 8))(a1 + 1008, a2 + 1008);
  long long v47 = *(_OWORD *)(a2 + 1072);
  *(_OWORD *)(a1 + 1072) = v47;
  (**(void (***)(uint64_t, uint64_t))(v47 - 8))(a1 + 1048, a2 + 1048);
  uint64_t v48 = *(void *)(a2 + 1112);
  *(void *)(a1 + 1112) = v48;
  *(void *)(a1 + 1120) = *(void *)(a2 + 1120);
  (**(void (***)(uint64_t, uint64_t))(v48 - 8))(a1 + 1088, a2 + 1088);
  long long v49 = *(_OWORD *)(a2 + 1152);
  *(_OWORD *)(a1 + 1152) = v49;
  (**(void (***)(uint64_t, uint64_t))(v49 - 8))(a1 + 1128, a2 + 1128);
  uint64_t v50 = *(void *)(a2 + 1192);
  *(void *)(a1 + 1192) = v50;
  *(void *)(a1 + 1200) = *(void *)(a2 + 1200);
  (**(void (***)(uint64_t, uint64_t))(v50 - 8))(a1 + 1168, a2 + 1168);
  long long v51 = *(_OWORD *)(a2 + 1232);
  *(_OWORD *)(a1 + 1232) = v51;
  (**(void (***)(uint64_t, uint64_t))(v51 - 8))(a1 + 1208, a2 + 1208);
  uint64_t v52 = *(void *)(a2 + 1272);
  *(void *)(a1 + 1272) = v52;
  *(void *)(a1 + 1280) = *(void *)(a2 + 1280);
  (**(void (***)(uint64_t, uint64_t))(v52 - 8))(a1 + 1248, a2 + 1248);
  long long v53 = *(_OWORD *)(a2 + 1312);
  *(_OWORD *)(a1 + 1312) = v53;
  (**(void (***)(uint64_t, uint64_t))(v53 - 8))(a1 + 1288, a2 + 1288);
  uint64_t v54 = *(void *)(a2 + 1352);
  *(void *)(a1 + 1352) = v54;
  *(void *)(a1 + 1360) = *(void *)(a2 + 1360);
  (**(void (***)(uint64_t, uint64_t))(v54 - 8))(a1 + 1328, a2 + 1328);
  long long v55 = *(_OWORD *)(a2 + 1392);
  *(_OWORD *)(a1 + 1392) = v55;
  (**(void (***)(uint64_t, uint64_t))(v55 - 8))(a1 + 1368, a2 + 1368);
  uint64_t v56 = *(void *)(a2 + 1432);
  *(void *)(a1 + 1432) = v56;
  *(void *)(a1 + 1440) = *(void *)(a2 + 1440);
  (**(void (***)(uint64_t, uint64_t))(v56 - 8))(a1 + 1408, a2 + 1408);
  long long v57 = *(_OWORD *)(a2 + 1472);
  *(_OWORD *)(a1 + 1472) = v57;
  (**(void (***)(uint64_t, uint64_t))(v57 - 8))(a1 + 1448, a2 + 1448);
  uint64_t v58 = *(void *)(a2 + 1512);
  *(void *)(a1 + 1512) = v58;
  *(void *)(a1 + 1520) = *(void *)(a2 + 1520);
  (**(void (***)(uint64_t, uint64_t))(v58 - 8))(a1 + 1488, a2 + 1488);
  long long v59 = *(_OWORD *)(a2 + 1552);
  *(_OWORD *)(a1 + 1552) = v59;
  (**(void (***)(uint64_t, uint64_t))(v59 - 8))(a1 + 1528, a2 + 1528);
  uint64_t v60 = *(void **)(a2 + 1568);
  *(void *)(a1 + 1568) = v60;
  long long v61 = *(_OWORD *)(a2 + 1600);
  *(_OWORD *)(a1 + 1600) = v61;
  uint64_t v62 = v61;
  uint64_t v63 = **(void (***)(uint64_t, uint64_t, uint64_t))(v61 - 8);
  id v64 = v60;
  v63(a1 + 1576, a2 + 1576, v62);
  uint64_t v65 = *(void *)(a2 + 1640);
  *(void *)(a1 + 1640) = v65;
  *(void *)(a1 + 1648) = *(void *)(a2 + 1648);
  (**(void (***)(uint64_t, uint64_t))(v65 - 8))(a1 + 1616, a2 + 1616);
  long long v66 = *(_OWORD *)(a2 + 1680);
  *(_OWORD *)(a1 + 1680) = v66;
  (**(void (***)(uint64_t, uint64_t))(v66 - 8))(a1 + 1656, a2 + 1656);
  uint64_t v67 = *(void *)(a2 + 1720);
  *(void *)(a1 + 1720) = v67;
  *(void *)(a1 + 1728) = *(void *)(a2 + 1728);
  (**(void (***)(uint64_t, uint64_t))(v67 - 8))(a1 + 1696, a2 + 1696);
  uint64_t v68 = *(void **)(a2 + 1736);
  *(void *)(a1 + 1736) = v68;
  *(_OWORD *)(a1 + 1744) = *(_OWORD *)(a2 + 1744);
  uint64_t v69 = *(void **)(a2 + 1760);
  *(void *)(a1 + 1760) = v69;
  uint64_t v70 = *(void **)(a2 + 1768);
  *(void *)(a1 + 1768) = v70;
  uint64_t v71 = *(void *)(a2 + 1800);
  *(void *)(a1 + 1800) = v71;
  *(void *)(a1 + 1808) = *(void *)(a2 + 1808);
  uint64_t v72 = **(void (***)(uint64_t, uint64_t, uint64_t))(v71 - 8);
  id v73 = v68;
  swift_unknownObjectRetain();
  id v74 = v69;
  id v75 = v70;
  v72(a1 + 1776, a2 + 1776, v71);
  uint64_t v76 = *(void **)(a2 + 1816);
  *(void *)(a1 + 1816) = v76;
  uint64_t v77 = *(void *)(a2 + 1848);
  *(void *)(a1 + 1848) = v77;
  *(void *)(a1 + 1856) = *(void *)(a2 + 1856);
  uint64_t v78 = **(void (***)(uint64_t, uint64_t, uint64_t))(v77 - 8);
  id v79 = v76;
  v78(a1 + 1824, a2 + 1824, v77);
  long long v80 = *(_OWORD *)(a2 + 1888);
  *(_OWORD *)(a1 + 1888) = v80;
  (**(void (***)(uint64_t, uint64_t))(v80 - 8))(a1 + 1864, a2 + 1864);
  *(void *)(a1 + 1904) = *(void *)(a2 + 1904);
  uint64_t v81 = *(void **)(a2 + 1912);
  *(void *)(a1 + 1912) = v81;
  *(void *)(a1 + 1920) = *(void *)(a2 + 1920);
  id v82 = *(void **)(a2 + 1928);
  *(void *)(a1 + 1928) = v82;
  swift_retain();
  id v83 = v81;
  swift_bridgeObjectRetain();
  id v84 = v82;
  return a1;
}

uint64_t *assignWithCopy for Daemon(uint64_t *a1, uint64_t *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  __swift_assign_boxed_opaque_existential_1(a1 + 7, a2 + 7);
  __swift_assign_boxed_opaque_existential_1(a1 + 12, a2 + 12);
  __swift_assign_boxed_opaque_existential_1(a1 + 17, a2 + 17);
  __swift_assign_boxed_opaque_existential_1(a1 + 22, a2 + 22);
  __swift_assign_boxed_opaque_existential_1(a1 + 27, a2 + 27);
  uint64_t v4 = (void *)a2[32];
  uint64_t v5 = (void *)a1[32];
  a1[32] = (uint64_t)v4;
  id v6 = v4;

  __swift_assign_boxed_opaque_existential_1(a1 + 33, a2 + 33);
  __swift_assign_boxed_opaque_existential_1(a1 + 38, a2 + 38);
  __swift_assign_boxed_opaque_existential_1(a1 + 43, a2 + 43);
  __swift_assign_boxed_opaque_existential_1(a1 + 48, a2 + 48);
  a1[53] = a2[53];
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1(a1 + 54, a2 + 54);
  __swift_assign_boxed_opaque_existential_1(a1 + 59, a2 + 59);
  __swift_assign_boxed_opaque_existential_1(a1 + 64, a2 + 64);
  __swift_assign_boxed_opaque_existential_1(a1 + 69, a2 + 69);
  __swift_assign_boxed_opaque_existential_1(a1 + 74, a2 + 74);
  __swift_assign_boxed_opaque_existential_1(a1 + 79, a2 + 79);
  a1[84] = a2[84];
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1(a1 + 85, a2 + 85);
  __swift_assign_boxed_opaque_existential_1(a1 + 90, a2 + 90);
  __swift_assign_boxed_opaque_existential_1(a1 + 95, a2 + 95);
  uint64_t v7 = (void *)a2[100];
  uint64_t v8 = (void *)a1[100];
  a1[100] = (uint64_t)v7;
  id v9 = v7;

  __swift_assign_boxed_opaque_existential_1(a1 + 101, a2 + 101);
  __swift_assign_boxed_opaque_existential_1(a1 + 106, a2 + 106);
  __swift_assign_boxed_opaque_existential_1(a1 + 111, a2 + 111);
  __swift_assign_boxed_opaque_existential_1(a1 + 116, a2 + 116);
  __swift_assign_boxed_opaque_existential_1(a1 + 121, a2 + 121);
  __swift_assign_boxed_opaque_existential_1(a1 + 126, a2 + 126);
  __swift_assign_boxed_opaque_existential_1(a1 + 131, a2 + 131);
  __swift_assign_boxed_opaque_existential_1(a1 + 136, a2 + 136);
  __swift_assign_boxed_opaque_existential_1(a1 + 141, a2 + 141);
  __swift_assign_boxed_opaque_existential_1(a1 + 146, a2 + 146);
  __swift_assign_boxed_opaque_existential_1(a1 + 151, a2 + 151);
  __swift_assign_boxed_opaque_existential_1(a1 + 156, a2 + 156);
  __swift_assign_boxed_opaque_existential_1(a1 + 161, a2 + 161);
  __swift_assign_boxed_opaque_existential_1(a1 + 166, a2 + 166);
  __swift_assign_boxed_opaque_existential_1(a1 + 171, a2 + 171);
  __swift_assign_boxed_opaque_existential_1(a1 + 176, a2 + 176);
  __swift_assign_boxed_opaque_existential_1(a1 + 181, a2 + 181);
  __swift_assign_boxed_opaque_existential_1(a1 + 186, a2 + 186);
  __swift_assign_boxed_opaque_existential_1(a1 + 191, a2 + 191);
  long long v10 = (void *)a2[196];
  long long v11 = (void *)a1[196];
  a1[196] = (uint64_t)v10;
  id v12 = v10;

  __swift_assign_boxed_opaque_existential_1(a1 + 197, a2 + 197);
  __swift_assign_boxed_opaque_existential_1(a1 + 202, a2 + 202);
  __swift_assign_boxed_opaque_existential_1(a1 + 207, a2 + 207);
  __swift_assign_boxed_opaque_existential_1(a1 + 212, a2 + 212);
  long long v13 = (void *)a2[217];
  id v14 = (void *)a1[217];
  a1[217] = (uint64_t)v13;
  id v15 = v13;

  uint64_t v16 = a2[219];
  a1[218] = a2[218];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[219] = v16;
  id v17 = (void *)a2[220];
  id v18 = (void *)a1[220];
  a1[220] = (uint64_t)v17;
  id v19 = v17;

  uint64_t v20 = (void *)a2[221];
  long long v21 = (void *)a1[221];
  a1[221] = (uint64_t)v20;
  id v22 = v20;

  __swift_assign_boxed_opaque_existential_1(a1 + 222, a2 + 222);
  uint64_t v23 = (void *)a2[227];
  uint64_t v24 = (void *)a1[227];
  a1[227] = (uint64_t)v23;
  id v25 = v23;

  __swift_assign_boxed_opaque_existential_1(a1 + 228, a2 + 228);
  __swift_assign_boxed_opaque_existential_1(a1 + 233, a2 + 233);
  a1[238] = a2[238];
  swift_retain();
  swift_release();
  long long v26 = (void *)a2[239];
  long long v27 = (void *)a1[239];
  a1[239] = (uint64_t)v26;
  id v28 = v26;

  a1[240] = a2[240];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v29 = (void *)a2[241];
  uint64_t v30 = (void *)a1[241];
  a1[241] = (uint64_t)v29;
  id v31 = v29;

  return a1;
}

void *__swift_memcpy1936_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x790uLL);
}

uint64_t assignWithTake for Daemon(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  long long v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  long long v6 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v6;
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  __swift_destroy_boxed_opaque_existential_1(a1 + 136);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  __swift_destroy_boxed_opaque_existential_1(a1 + 176);
  long long v7 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v7;
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  __swift_destroy_boxed_opaque_existential_1(a1 + 216);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  uint64_t v8 = *(void *)(a2 + 256);
  id v9 = *(void **)(a1 + 256);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  *(void *)(a1 + 256) = v8;

  __swift_destroy_boxed_opaque_existential_1(a1 + 264);
  long long v10 = *(_OWORD *)(a2 + 280);
  *(_OWORD *)(a1 + 264) = *(_OWORD *)(a2 + 264);
  *(_OWORD *)(a1 + 280) = v10;
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  __swift_destroy_boxed_opaque_existential_1(a1 + 304);
  long long v11 = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
  *(_OWORD *)(a1 + 320) = v11;
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  __swift_destroy_boxed_opaque_existential_1(a1 + 344);
  long long v12 = *(_OWORD *)(a2 + 360);
  *(_OWORD *)(a1 + 344) = *(_OWORD *)(a2 + 344);
  *(_OWORD *)(a1 + 360) = v12;
  *(void *)(a1 + 376) = *(void *)(a2 + 376);
  __swift_destroy_boxed_opaque_existential_1(a1 + 384);
  long long v13 = *(_OWORD *)(a2 + 400);
  *(_OWORD *)(a1 + 384) = *(_OWORD *)(a2 + 384);
  *(_OWORD *)(a1 + 400) = v13;
  uint64_t v14 = *(void *)(a2 + 424);
  *(void *)(a1 + 416) = *(void *)(a2 + 416);
  *(void *)(a1 + 424) = v14;
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 432);
  long long v15 = *(_OWORD *)(a2 + 448);
  *(_OWORD *)(a1 + 432) = *(_OWORD *)(a2 + 432);
  *(_OWORD *)(a1 + 448) = v15;
  *(void *)(a1 + 464) = *(void *)(a2 + 464);
  __swift_destroy_boxed_opaque_existential_1(a1 + 472);
  long long v16 = *(_OWORD *)(a2 + 488);
  *(_OWORD *)(a1 + 472) = *(_OWORD *)(a2 + 472);
  *(_OWORD *)(a1 + 488) = v16;
  *(void *)(a1 + 504) = *(void *)(a2 + 504);
  __swift_destroy_boxed_opaque_existential_1(a1 + 512);
  long long v17 = *(_OWORD *)(a2 + 528);
  *(_OWORD *)(a1 + 512) = *(_OWORD *)(a2 + 512);
  *(_OWORD *)(a1 + 528) = v17;
  *(void *)(a1 + 544) = *(void *)(a2 + 544);
  __swift_destroy_boxed_opaque_existential_1(a1 + 552);
  long long v18 = *(_OWORD *)(a2 + 568);
  *(_OWORD *)(a1 + 552) = *(_OWORD *)(a2 + 552);
  *(_OWORD *)(a1 + 568) = v18;
  *(void *)(a1 + 584) = *(void *)(a2 + 584);
  __swift_destroy_boxed_opaque_existential_1(a1 + 592);
  long long v19 = *(_OWORD *)(a2 + 608);
  *(_OWORD *)(a1 + 592) = *(_OWORD *)(a2 + 592);
  *(_OWORD *)(a1 + 608) = v19;
  *(void *)(a1 + 624) = *(void *)(a2 + 624);
  __swift_destroy_boxed_opaque_existential_1(a1 + 632);
  long long v20 = *(_OWORD *)(a2 + 648);
  *(_OWORD *)(a1 + 632) = *(_OWORD *)(a2 + 632);
  *(_OWORD *)(a1 + 648) = v20;
  *(void *)(a1 + 664) = *(void *)(a2 + 664);
  *(void *)(a1 + 672) = *(void *)(a2 + 672);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 680);
  long long v21 = *(_OWORD *)(a2 + 696);
  *(_OWORD *)(a1 + 680) = *(_OWORD *)(a2 + 680);
  *(_OWORD *)(a1 + 696) = v21;
  *(void *)(a1 + 712) = *(void *)(a2 + 712);
  __swift_destroy_boxed_opaque_existential_1(a1 + 720);
  long long v22 = *(_OWORD *)(a2 + 736);
  *(_OWORD *)(a1 + 720) = *(_OWORD *)(a2 + 720);
  *(_OWORD *)(a1 + 736) = v22;
  *(void *)(a1 + 752) = *(void *)(a2 + 752);
  __swift_destroy_boxed_opaque_existential_1(a1 + 760);
  long long v23 = *(_OWORD *)(a2 + 776);
  *(_OWORD *)(a1 + 760) = *(_OWORD *)(a2 + 760);
  *(_OWORD *)(a1 + 776) = v23;
  *(void *)(a1 + 792) = *(void *)(a2 + 792);
  uint64_t v24 = *(void **)(a1 + 800);
  *(void *)(a1 + 800) = *(void *)(a2 + 800);

  __swift_destroy_boxed_opaque_existential_1(a1 + 808);
  long long v25 = *(_OWORD *)(a2 + 824);
  *(_OWORD *)(a1 + 808) = *(_OWORD *)(a2 + 808);
  *(_OWORD *)(a1 + 824) = v25;
  *(void *)(a1 + 840) = *(void *)(a2 + 840);
  __swift_destroy_boxed_opaque_existential_1(a1 + 848);
  long long v26 = *(_OWORD *)(a2 + 864);
  *(_OWORD *)(a1 + 848) = *(_OWORD *)(a2 + 848);
  *(_OWORD *)(a1 + 864) = v26;
  *(void *)(a1 + 880) = *(void *)(a2 + 880);
  __swift_destroy_boxed_opaque_existential_1(a1 + 888);
  long long v27 = *(_OWORD *)(a2 + 904);
  *(_OWORD *)(a1 + 888) = *(_OWORD *)(a2 + 888);
  *(_OWORD *)(a1 + 904) = v27;
  *(void *)(a1 + 920) = *(void *)(a2 + 920);
  __swift_destroy_boxed_opaque_existential_1(a1 + 928);
  long long v28 = *(_OWORD *)(a2 + 944);
  *(_OWORD *)(a1 + 928) = *(_OWORD *)(a2 + 928);
  *(_OWORD *)(a1 + 944) = v28;
  *(void *)(a1 + 960) = *(void *)(a2 + 960);
  __swift_destroy_boxed_opaque_existential_1(a1 + 968);
  long long v29 = *(_OWORD *)(a2 + 984);
  *(_OWORD *)(a1 + 968) = *(_OWORD *)(a2 + 968);
  *(_OWORD *)(a1 + 984) = v29;
  *(void *)(a1 + 1000) = *(void *)(a2 + 1000);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1008);
  long long v30 = *(_OWORD *)(a2 + 1024);
  *(_OWORD *)(a1 + 1008) = *(_OWORD *)(a2 + 1008);
  *(_OWORD *)(a1 + 1024) = v30;
  *(void *)(a1 + 1040) = *(void *)(a2 + 1040);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1048);
  long long v31 = *(_OWORD *)(a2 + 1064);
  *(_OWORD *)(a1 + 1048) = *(_OWORD *)(a2 + 1048);
  *(_OWORD *)(a1 + 1064) = v31;
  *(void *)(a1 + 1080) = *(void *)(a2 + 1080);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1088);
  *(_OWORD *)(a1 + 1088) = *(_OWORD *)(a2 + 1088);
  *(_OWORD *)(a1 + 1104) = *(_OWORD *)(a2 + 1104);
  *(void *)(a1 + 1120) = *(void *)(a2 + 1120);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1128);
  long long v32 = *(_OWORD *)(a2 + 1144);
  *(_OWORD *)(a1 + 1128) = *(_OWORD *)(a2 + 1128);
  *(_OWORD *)(a1 + 1144) = v32;
  *(void *)(a1 + 1160) = *(void *)(a2 + 1160);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1168);
  *(_OWORD *)(a1 + 1168) = *(_OWORD *)(a2 + 1168);
  *(_OWORD *)(a1 + 1184) = *(_OWORD *)(a2 + 1184);
  *(void *)(a1 + 1200) = *(void *)(a2 + 1200);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1208);
  long long v33 = *(_OWORD *)(a2 + 1224);
  *(_OWORD *)(a1 + 1208) = *(_OWORD *)(a2 + 1208);
  *(_OWORD *)(a1 + 1224) = v33;
  *(void *)(a1 + 1240) = *(void *)(a2 + 1240);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1248);
  *(_OWORD *)(a1 + 1248) = *(_OWORD *)(a2 + 1248);
  *(_OWORD *)(a1 + 1264) = *(_OWORD *)(a2 + 1264);
  *(void *)(a1 + 1280) = *(void *)(a2 + 1280);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1288);
  long long v34 = *(_OWORD *)(a2 + 1304);
  *(_OWORD *)(a1 + 1288) = *(_OWORD *)(a2 + 1288);
  *(_OWORD *)(a1 + 1304) = v34;
  *(void *)(a1 + 1320) = *(void *)(a2 + 1320);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1328);
  *(_OWORD *)(a1 + 1328) = *(_OWORD *)(a2 + 1328);
  *(_OWORD *)(a1 + 1344) = *(_OWORD *)(a2 + 1344);
  *(void *)(a1 + 1360) = *(void *)(a2 + 1360);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1368);
  long long v35 = *(_OWORD *)(a2 + 1384);
  *(_OWORD *)(a1 + 1368) = *(_OWORD *)(a2 + 1368);
  *(_OWORD *)(a1 + 1384) = v35;
  *(void *)(a1 + 1400) = *(void *)(a2 + 1400);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1408);
  *(_OWORD *)(a1 + 1408) = *(_OWORD *)(a2 + 1408);
  *(_OWORD *)(a1 + 1424) = *(_OWORD *)(a2 + 1424);
  *(void *)(a1 + 1440) = *(void *)(a2 + 1440);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1448);
  long long v36 = *(_OWORD *)(a2 + 1464);
  *(_OWORD *)(a1 + 1448) = *(_OWORD *)(a2 + 1448);
  *(_OWORD *)(a1 + 1464) = v36;
  *(void *)(a1 + 1480) = *(void *)(a2 + 1480);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1488);
  *(_OWORD *)(a1 + 1488) = *(_OWORD *)(a2 + 1488);
  *(_OWORD *)(a1 + 1504) = *(_OWORD *)(a2 + 1504);
  *(void *)(a1 + 1520) = *(void *)(a2 + 1520);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1528);
  long long v37 = *(_OWORD *)(a2 + 1544);
  *(_OWORD *)(a1 + 1528) = *(_OWORD *)(a2 + 1528);
  *(_OWORD *)(a1 + 1544) = v37;
  *(void *)(a1 + 1560) = *(void *)(a2 + 1560);
  long long v38 = *(void **)(a1 + 1568);
  *(void *)(a1 + 1568) = *(void *)(a2 + 1568);

  __swift_destroy_boxed_opaque_existential_1(a1 + 1576);
  long long v39 = *(_OWORD *)(a2 + 1592);
  *(_OWORD *)(a1 + 1576) = *(_OWORD *)(a2 + 1576);
  *(_OWORD *)(a1 + 1592) = v39;
  *(void *)(a1 + 1608) = *(void *)(a2 + 1608);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1616);
  *(_OWORD *)(a1 + 1616) = *(_OWORD *)(a2 + 1616);
  *(_OWORD *)(a1 + 1632) = *(_OWORD *)(a2 + 1632);
  *(void *)(a1 + 1648) = *(void *)(a2 + 1648);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1656);
  long long v40 = *(_OWORD *)(a2 + 1672);
  *(_OWORD *)(a1 + 1656) = *(_OWORD *)(a2 + 1656);
  *(_OWORD *)(a1 + 1672) = v40;
  *(void *)(a1 + 1688) = *(void *)(a2 + 1688);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1696);
  *(_OWORD *)(a1 + 1696) = *(_OWORD *)(a2 + 1696);
  *(_OWORD *)(a1 + 1712) = *(_OWORD *)(a2 + 1712);
  *(void *)(a1 + 1728) = *(void *)(a2 + 1728);
  id v41 = *(void **)(a1 + 1736);
  *(void *)(a1 + 1736) = *(void *)(a2 + 1736);

  uint64_t v42 = *(void *)(a2 + 1752);
  *(void *)(a1 + 1744) = *(void *)(a2 + 1744);
  swift_unknownObjectRelease();
  *(void *)(a1 + 1752) = v42;
  long long v43 = *(void **)(a1 + 1760);
  *(void *)(a1 + 1760) = *(void *)(a2 + 1760);

  uint64_t v44 = *(void **)(a1 + 1768);
  *(void *)(a1 + 1768) = *(void *)(a2 + 1768);

  __swift_destroy_boxed_opaque_existential_1(a1 + 1776);
  *(_OWORD *)(a1 + 1776) = *(_OWORD *)(a2 + 1776);
  *(_OWORD *)(a1 + 1792) = *(_OWORD *)(a2 + 1792);
  *(void *)(a1 + 1808) = *(void *)(a2 + 1808);
  long long v45 = *(void **)(a1 + 1816);
  *(void *)(a1 + 1816) = *(void *)(a2 + 1816);

  __swift_destroy_boxed_opaque_existential_1(a1 + 1824);
  *(_OWORD *)(a1 + 1824) = *(_OWORD *)(a2 + 1824);
  *(_OWORD *)(a1 + 1840) = *(_OWORD *)(a2 + 1840);
  *(void *)(a1 + 1856) = *(void *)(a2 + 1856);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1864);
  long long v46 = *(_OWORD *)(a2 + 1880);
  *(_OWORD *)(a1 + 1864) = *(_OWORD *)(a2 + 1864);
  *(_OWORD *)(a1 + 1880) = v46;
  *(void *)(a1 + 1896) = *(void *)(a2 + 1896);
  *(void *)(a1 + 1904) = *(void *)(a2 + 1904);
  swift_release();
  long long v47 = *(void **)(a1 + 1912);
  *(void *)(a1 + 1912) = *(void *)(a2 + 1912);

  *(void *)(a1 + 1920) = *(void *)(a2 + 1920);
  swift_bridgeObjectRelease();
  uint64_t v48 = *(void **)(a1 + 1928);
  *(void *)(a1 + 1928) = *(void *)(a2 + 1928);

  return a1;
}

uint64_t getEnumTagSinglePayload for Daemon(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 1936)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Daemon(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 1928) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 1912) = 0u;
    *(_OWORD *)(result + 1896) = 0u;
    *(_OWORD *)(result + 1880) = 0u;
    *(_OWORD *)(result + 1864) = 0u;
    *(_OWORD *)(result + 1848) = 0u;
    *(_OWORD *)(result + 1832) = 0u;
    *(_OWORD *)(result + 1816) = 0u;
    *(_OWORD *)(result + 1800) = 0u;
    *(_OWORD *)(result + 1784) = 0u;
    *(_OWORD *)(result + 1768) = 0u;
    *(_OWORD *)(result + 1752) = 0u;
    *(_OWORD *)(result + 1736) = 0u;
    *(_OWORD *)(result + 1720) = 0u;
    *(_OWORD *)(result + 1704) = 0u;
    *(_OWORD *)(result + 1688) = 0u;
    *(_OWORD *)(result + 1672) = 0u;
    *(_OWORD *)(result + 1656) = 0u;
    *(_OWORD *)(result + 1640) = 0u;
    *(_OWORD *)(result + 1624) = 0u;
    *(_OWORD *)(result + 1608) = 0u;
    *(_OWORD *)(result + 1592) = 0u;
    *(_OWORD *)(result + 1576) = 0u;
    *(_OWORD *)(result + 1560) = 0u;
    *(_OWORD *)(result + 1544) = 0u;
    *(_OWORD *)(result + 1528) = 0u;
    *(_OWORD *)(result + 1512) = 0u;
    *(_OWORD *)(result + 1496) = 0u;
    *(_OWORD *)(result + 1480) = 0u;
    *(_OWORD *)(result + 1464) = 0u;
    *(_OWORD *)(result + 1448) = 0u;
    *(_OWORD *)(result + 1432) = 0u;
    *(_OWORD *)(result + 1416) = 0u;
    *(_OWORD *)(result + 1400) = 0u;
    *(_OWORD *)(result + 1384) = 0u;
    *(_OWORD *)(result + 1368) = 0u;
    *(_OWORD *)(result + 1352) = 0u;
    *(_OWORD *)(result + 1336) = 0u;
    *(_OWORD *)(result + 1320) = 0u;
    *(_OWORD *)(result + 1304) = 0u;
    *(_OWORD *)(result + 1288) = 0u;
    *(_OWORD *)(result + 1272) = 0u;
    *(_OWORD *)(result + 1256) = 0u;
    *(_OWORD *)(result + 1240) = 0u;
    *(_OWORD *)(result + 1224) = 0u;
    *(_OWORD *)(result + 1208) = 0u;
    *(_OWORD *)(result + 1192) = 0u;
    *(_OWORD *)(result + 1176) = 0u;
    *(_OWORD *)(result + 1160) = 0u;
    *(_OWORD *)(result + 1144) = 0u;
    *(_OWORD *)(result + 1128) = 0u;
    *(_OWORD *)(result + 1112) = 0u;
    *(_OWORD *)(result + 1096) = 0u;
    *(_OWORD *)(result + 1080) = 0u;
    *(_OWORD *)(result + 1064) = 0u;
    *(_OWORD *)(result + 1048) = 0u;
    *(_OWORD *)(result + 1032) = 0u;
    *(_OWORD *)(result + 1016) = 0u;
    *(_OWORD *)(result + 1000) = 0u;
    *(_OWORD *)(result + 984) = 0u;
    *(_OWORD *)(result + 968) = 0u;
    *(_OWORD *)(result + 952) = 0u;
    *(_OWORD *)(result + 936) = 0u;
    *(_OWORD *)(result + 920) = 0u;
    *(_OWORD *)(result + 904) = 0u;
    *(_OWORD *)(result + 888) = 0u;
    *(_OWORD *)(result + 872) = 0u;
    *(_OWORD *)(result + 856) = 0u;
    *(_OWORD *)(result + 840) = 0u;
    *(_OWORD *)(result + 824) = 0u;
    *(_OWORD *)(result + 808) = 0u;
    *(_OWORD *)(result + 792) = 0u;
    *(_OWORD *)(result + 776) = 0u;
    *(_OWORD *)(result + 760) = 0u;
    *(_OWORD *)(result + 744) = 0u;
    *(_OWORD *)(result + 728) = 0u;
    *(_OWORD *)(result + 712) = 0u;
    *(_OWORD *)(result + 696) = 0u;
    *(_OWORD *)(result + 680) = 0u;
    *(_OWORD *)(result + 664) = 0u;
    *(_OWORD *)(result + 648) = 0u;
    *(_OWORD *)(result + 632) = 0u;
    *(_OWORD *)(result + 616) = 0u;
    *(_OWORD *)(result + 600) = 0u;
    *(_OWORD *)(result + 584) = 0u;
    *(_OWORD *)(result + 568) = 0u;
    *(_OWORD *)(result + 552) = 0u;
    *(_OWORD *)(result + 536) = 0u;
    *(_OWORD *)(result + 520) = 0u;
    *(_OWORD *)(result + 504) = 0u;
    *(_OWORD *)(result + 488) = 0u;
    *(_OWORD *)(result + 472) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 1936) = 1;
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
    *(unsigned char *)(result + 1936) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Daemon()
{
  return &type metadata for Daemon;
}

uint64_t sub_1D3C2B9B8()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);

  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  __swift_destroy_boxed_opaque_existential_1(v0 + 144);
  return MEMORY[0x1F4186498](v0, 184, 7);
}

uint64_t sub_1D3C2BA10(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1D3C2BA90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  BOOL v4 = a1 == 0x6169726F67657267 && a2 == 0xE90000000000006ELL;
  if (v4 || (sub_1D3C2F880() & 1) != 0)
  {
    long long v7 = (unsigned int *)MEMORY[0x1E4F27B20];
LABEL_7:
    uint64_t v8 = *v7;
    uint64_t v9 = sub_1D3C2E430();
    uint64_t v16 = *(void *)(v9 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 104))(a3, v8, v9);
    long long v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 56);
    uint64_t v11 = a3;
    uint64_t v12 = 0;
    uint64_t v13 = v9;
    goto LABEL_8;
  }
  if (a1 == 0x7473696864647562 && a2 == 0xE800000000000000 || (sub_1D3C2F880() & 1) != 0)
  {
    long long v7 = (unsigned int *)MEMORY[0x1E4F27B10];
    goto LABEL_7;
  }
  if (a1 == 0x6573656E696863 && a2 == 0xE700000000000000 || (sub_1D3C2F880() & 1) != 0)
  {
    long long v7 = (unsigned int *)MEMORY[0x1E4F27AF0];
    goto LABEL_7;
  }
  if (a1 == 0x636974706F63 && a2 == 0xE600000000000000 || (sub_1D3C2F880() & 1) != 0)
  {
    long long v7 = (unsigned int *)MEMORY[0x1E4F27AD8];
    goto LABEL_7;
  }
  if (a1 == 0xD000000000000013 && a2 == 0x80000001D3C38C30 || (sub_1D3C2F880() & 1) != 0)
  {
    long long v7 = (unsigned int *)MEMORY[0x1E4F27AD0];
    goto LABEL_7;
  }
  if (a1 == 0xD000000000000011 && a2 == 0x80000001D3C38C50 || (sub_1D3C2F880() & 1) != 0)
  {
    long long v7 = (unsigned int *)MEMORY[0x1E4F27AC8];
    goto LABEL_7;
  }
  if (a1 == 0x776572626568 && a2 == 0xE600000000000000 || (sub_1D3C2F880() & 1) != 0)
  {
    long long v7 = (unsigned int *)MEMORY[0x1E4F27AE0];
    goto LABEL_7;
  }
  if (a1 == 0x313036386F7369 && a2 == 0xE700000000000000 || (sub_1D3C2F880() & 1) != 0)
  {
    long long v7 = (unsigned int *)MEMORY[0x1E4F27B00];
    goto LABEL_7;
  }
  if (a1 == 0x6E6169646E69 && a2 == 0xE600000000000000 || (sub_1D3C2F880() & 1) != 0)
  {
    long long v7 = (unsigned int *)MEMORY[0x1E4F27AE8];
    goto LABEL_7;
  }
  if (a1 == 0x63696D616C7369 && a2 == 0xE700000000000000 || (sub_1D3C2F880() & 1) != 0)
  {
    long long v7 = (unsigned int *)MEMORY[0x1E4F27AF8];
    goto LABEL_7;
  }
  if (a1 == 0x4363696D616C7369 && a2 == 0xEC0000006C697669 || (sub_1D3C2F880() & 1) != 0)
  {
    long long v7 = (unsigned int *)MEMORY[0x1E4F27AA8];
    goto LABEL_7;
  }
  if (a1 == 0x6573656E6170616ALL && a2 == 0xE800000000000000 || (sub_1D3C2F880() & 1) != 0)
  {
    long long v7 = (unsigned int *)MEMORY[0x1E4F27B18];
    goto LABEL_7;
  }
  if (a1 == 0x6E616973726570 && a2 == 0xE700000000000000 || (sub_1D3C2F880() & 1) != 0)
  {
    long long v7 = (unsigned int *)MEMORY[0x1E4F27B08];
    goto LABEL_7;
  }
  if (a1 == 0x63696C6275706572 && a2 == 0xEF616E696843664FLL || (sub_1D3C2F880() & 1) != 0)
  {
    long long v7 = (unsigned int *)MEMORY[0x1E4F27AB8];
    goto LABEL_7;
  }
  if (a1 == 0x5463696D616C7369 && a2 == 0xEE0072616C756261 || (sub_1D3C2F880() & 1) != 0)
  {
    long long v7 = (unsigned int *)MEMORY[0x1E4F27AB0];
    goto LABEL_7;
  }
  if (a1 == 0xD000000000000010 && a2 == 0x80000001D3C38C70 || (sub_1D3C2F880() & 1) != 0)
  {
    long long v7 = (unsigned int *)MEMORY[0x1E4F27AC0];
    goto LABEL_7;
  }
  uint64_t v15 = sub_1D3C2E430();
  long long v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v13 = v15;
  uint64_t v11 = a3;
  uint64_t v12 = 1;
LABEL_8:
  return v10(v11, v12, 1, v13);
}

uint64_t sub_1D3C2C134(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_1D3C2C148(uint64_t a1, uint64_t a2)
{
  long long v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 8) + **(int **)(a2 + 8));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1D3B5C2E8;
  return v7(a1, a2);
}

ValueMetadata *type metadata accessor for NotificationConfigurationCoordinator()
{
  return &type metadata for NotificationConfigurationCoordinator;
}

uint64_t sub_1D3C2C248(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = a2;
  return MEMORY[0x1F4188298](sub_1D3C2C268, 0, 0);
}

uint64_t sub_1D3C2C268()
{
  uint64_t v1 = v0 + 10;
  uint64_t v2 = v0[17];
  uint64_t v3 = MEMORY[0x1E4FBC860];
  unint64_t v40 = MEMORY[0x1E4FBC860];
  uint64_t v4 = *(void *)(v2 + 16);
  if (v4)
  {
    uint64_t v5 = v2 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_1D3B60858(v5, (uint64_t)(v0 + 10));
      uint64_t v6 = v0[13];
      uint64_t v7 = v0[14];
      __swift_project_boxed_opaque_existential_1(v0 + 10, v6);
      uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v6, v7);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 10));
      sub_1D3C2CB2C(v8);
      v5 += 40;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
    unint64_t v9 = v40;
  }
  else
  {
    unint64_t v9 = MEMORY[0x1E4FBC860];
  }
  uint64_t v10 = sub_1D3C0A1A8(v9);
  v0[18] = v10;
  swift_bridgeObjectRelease();
  unint64_t v37 = v10 & 0xC000000000000001;
  uint64_t v38 = v10;
  if ((v10 & 0xC000000000000001) != 0)
  {
    uint64_t v11 = sub_1D3C2F620();
    if (v11) {
      goto LABEL_8;
    }
LABEL_11:
    uint64_t v16 = MEMORY[0x1E4FBC860];
LABEL_26:
    v0[19] = v16;
    long long v34 = (void *)v0[16];
    v0[2] = v0;
    v0[7] = v0 + 15;
    v0[3] = sub_1D3C2C674;
    uint64_t v35 = swift_continuation_init();
    v0[10] = MEMORY[0x1E4F143A8];
    v0[11] = 0x40000000;
    v0[12] = sub_1D3C2C830;
    v0[13] = &block_descriptor_12;
    v0[14] = v35;
    objc_msgSend(v34, sel_getNotificationCategoriesWithCompletionHandler_, v1);
    uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)(v0 + 2);
    return MEMORY[0x1F41881E8](isUniquelyReferenced_nonNull_native);
  }
  uint64_t v11 = *(void *)(v10 + 16);
  if (!v11) {
    goto LABEL_11;
  }
LABEL_8:
  uint64_t v39 = v3;
  sub_1D3C17C00(0, v11 & ~(v11 >> 63), 0);
  uint64_t v12 = v10;
  if (v37)
  {
    uint64_t isUniquelyReferenced_nonNull_native = sub_1D3C2F5D0();
    char v15 = 1;
  }
  else
  {
    uint64_t isUniquelyReferenced_nonNull_native = sub_1D3C2D6A8(v10);
    char v15 = v17 & 1;
  }
  uint64_t v41 = isUniquelyReferenced_nonNull_native;
  uint64_t v42 = v14;
  char v43 = v15;
  if ((v11 & 0x8000000000000000) == 0)
  {
    do
    {
      while (1)
      {
        sub_1D3C2D450(v41, v42, v43, v12);
        uint64_t v24 = v23;
        id v25 = objc_msgSend(v23, sel_identifier);
        uint64_t v26 = sub_1D3C2F190();
        uint64_t v28 = v27;

        uint64_t v29 = v39;
        uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          uint64_t isUniquelyReferenced_nonNull_native = sub_1D3C17C00(0, *(void *)(v39 + 16) + 1, 1);
          uint64_t v29 = v39;
        }
        unint64_t v31 = *(void *)(v29 + 16);
        unint64_t v30 = *(void *)(v29 + 24);
        if (v31 >= v30 >> 1)
        {
          uint64_t isUniquelyReferenced_nonNull_native = sub_1D3C17C00(v30 > 1, v31 + 1, 1);
          uint64_t v29 = v39;
        }
        *(void *)(v29 + 16) = v31 + 1;
        uint64_t v32 = v29 + 16 * v31;
        *(void *)(v32 + 32) = v26;
        *(void *)(v32 + 40) = v28;
        if (v37) {
          break;
        }
        uint64_t v12 = v38;
        int64_t v18 = sub_1D3C2D36C(v41, v42, v43, v38);
        uint64_t v20 = v19;
        char v22 = v21;
        sub_1D3C2D730(v41, v42, v43);
        uint64_t v41 = v18;
        uint64_t v42 = v20;
        char v43 = v22 & 1;
        uint64_t v1 = v0 + 10;
        if (!--v11) {
          goto LABEL_25;
        }
      }
      uint64_t v12 = v38;
      if ((v43 & 1) == 0) {
        goto LABEL_30;
      }
      if (sub_1D3C2F5F0()) {
        swift_isUniquelyReferenced_nonNull_native();
      }
      uint64_t v1 = v0 + 10;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6B69C8);
      long long v33 = (void (*)(void *, void))sub_1D3C2F390();
      sub_1D3C2F660();
      v33(v0 + 10, 0);
      --v11;
    }
    while (v11);
LABEL_25:
    sub_1D3C2D730(v41, v42, v43);
    uint64_t v16 = v39;
    goto LABEL_26;
  }
  __break(1u);
LABEL_30:
  __break(1u);
  return MEMORY[0x1F41881E8](isUniquelyReferenced_nonNull_native);
}

uint64_t sub_1D3C2C674()
{
  return MEMORY[0x1F4188298](sub_1D3C2C754, 0, 0);
}

uint64_t sub_1D3C2C754()
{
  unint64_t v1 = *(void *)(v0 + 144);
  uint64_t v2 = *(void **)(v0 + 128);
  uint64_t v3 = (void *)sub_1D3C2DBB4(*(void *)(v0 + 120), *(void **)(v0 + 152));
  swift_bridgeObjectRelease();
  sub_1D3C2C8AC(v1, v3);
  sub_1D3C2DE80();
  sub_1D3C2DEC0();
  uint64_t v4 = (void *)sub_1D3C2F360();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setNotificationCategories_, v4);

  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_1D3C2C830(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  sub_1D3C2DE80();
  sub_1D3C2DEC0();
  **(void **)(*(void *)(v1 + 64) + 40) = sub_1D3C2F370();
  return MEMORY[0x1F41881F8](v1);
}

void sub_1D3C2C8AC(unint64_t a1, void *a2)
{
  unint64_t v2 = a1;
  v18[1] = a2;
  if ((a1 & 0xC000000000000001) != 0)
  {
    sub_1D3C2F5E0();
    sub_1D3C2DE80();
    sub_1D3C2DEC0();
    sub_1D3C2F3A0();
    unint64_t v2 = (unint64_t)v18[2];
    char v17 = v18[3];
    uint64_t v3 = (uint64_t)v18[4];
    id v4 = v18[5];
    unint64_t v5 = (unint64_t)v18[6];
  }
  else
  {
    id v4 = 0;
    uint64_t v6 = -1 << *(unsigned char *)(a1 + 32);
    char v17 = (void *)(a1 + 56);
    uint64_t v3 = ~v6;
    uint64_t v7 = -v6;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v5 = v8 & *(void *)(a1 + 56);
  }
  int64_t v9 = (unint64_t)(v3 + 64) >> 6;
  if ((v2 & 0x8000000000000000) != 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v5)
    {
      uint64_t v10 = (v5 - 1) & v5;
      unint64_t v11 = __clz(__rbit64(v5)) | ((void)v4 << 6);
      uint64_t v12 = (char *)v4;
      goto LABEL_29;
    }
    uint64_t v14 = (uint64_t)v4 + 1;
    if (__OFADD__(v4, 1)) {
      break;
    }
    if (v14 >= v9) {
      goto LABEL_32;
    }
    unint64_t v15 = v17[v14];
    uint64_t v12 = (char *)v4 + 1;
    if (!v15)
    {
      uint64_t v12 = (char *)v4 + 2;
      if ((uint64_t)v4 + 2 >= v9) {
        goto LABEL_32;
      }
      unint64_t v15 = v17[(void)v12];
      if (!v15)
      {
        uint64_t v12 = (char *)v4 + 3;
        if ((uint64_t)v4 + 3 >= v9) {
          goto LABEL_32;
        }
        unint64_t v15 = v17[(void)v12];
        if (!v15)
        {
          uint64_t v12 = (char *)v4 + 4;
          if ((uint64_t)v4 + 4 >= v9) {
            goto LABEL_32;
          }
          unint64_t v15 = v17[(void)v12];
          if (!v15)
          {
            uint64_t v12 = (char *)v4 + 5;
            if ((uint64_t)v4 + 5 >= v9) {
              goto LABEL_32;
            }
            unint64_t v15 = v17[(void)v12];
            if (!v15)
            {
              uint64_t v16 = (char *)v4 + 6;
              while ((char *)v9 != v16)
              {
                unint64_t v15 = v17[(void)v16++];
                if (v15)
                {
                  uint64_t v12 = v16 - 1;
                  goto LABEL_28;
                }
              }
LABEL_32:
              sub_1D3C0B220();
              return;
            }
          }
        }
      }
    }
LABEL_28:
    uint64_t v10 = (v15 - 1) & v15;
    unint64_t v11 = __clz(__rbit64(v15)) + ((void)v12 << 6);
LABEL_29:
    id v13 = *(id *)(*(void *)(v2 + 48) + 8 * v11);
    if (!v13) {
      goto LABEL_32;
    }
    while (1)
    {
      sub_1D3C07E5C(v18, v13);

      id v4 = v12;
      unint64_t v5 = v10;
      if ((v2 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      if (sub_1D3C2F650())
      {
        sub_1D3C2DE80();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v13 = v18[0];
        swift_unknownObjectRelease();
        uint64_t v12 = (char *)v4;
        uint64_t v10 = v5;
        if (v13) {
          continue;
        }
      }
      goto LABEL_32;
    }
  }
  __break(1u);
}

uint64_t sub_1D3C2CB2C(uint64_t result)
{
  id v4 = v2;
  uint64_t v5 = result;
  if ((result & 0xC000000000000001) != 0)
  {
    unint64_t result = sub_1D3C2F620();
    uint64_t v6 = result;
  }
  else
  {
    uint64_t v6 = *(void *)(result + 16);
  }
  if ((unint64_t)*v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_1D3C2F7C0();
    unint64_t result = swift_bridgeObjectRelease();
    uint64_t v8 = v20 + v6;
    if (!__OFADD__(v20, v6)) {
      goto LABEL_6;
    }
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v7 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v8 = v7 + v6;
  if (__OFADD__(v7, v6)) {
    goto LABEL_24;
  }
LABEL_6:
  unint64_t v9 = *v4;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  uint64_t *v4 = v9;
  uint64_t v11 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    uint64_t v12 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_16;
    }
    uint64_t v11 = 1;
  }
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_1D3C2F7C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v13 <= v8) {
    uint64_t v13 = v8;
  }
  swift_bridgeObjectRetain();
  uint64_t v14 = MEMORY[0x1D943CEC0](v11, v13, 1, v9);
  swift_bridgeObjectRelease();
  uint64_t *v4 = v14;
  uint64_t v12 = v14 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
  uint64_t v15 = *(void *)(v12 + 16);
  uint64_t v16 = (*(void *)(v12 + 24) >> 1) - v15;
  unint64_t result = (uint64_t)sub_1D3C094F8(&v44, (void *)(v12 + 8 * v15 + 32), v16, v5);
  if (result < v6)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (result >= 1)
  {
    uint64_t v17 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v18 = __OFADD__(v17, result);
    uint64_t v19 = v17 + result;
    if (v18)
    {
      __break(1u);
LABEL_33:
      if (!sub_1D3C2F650()) {
        goto LABEL_21;
      }
      sub_1D3C2DE80();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      uint64_t v24 = v43;
      swift_unknownObjectRelease();
      while (2)
      {
        if (!v24) {
          goto LABEL_21;
        }
        while (1)
        {
          uint64_t v26 = *v4 & 0xFFFFFFFFFFFFFF8;
          if (v3 + 1 > *(void *)(v26 + 0x18) >> 1)
          {
            sub_1D3C2F260();
            uint64_t v26 = *v4 & 0xFFFFFFFFFFFFFF8;
          }
          uint64_t v27 = *(void *)(v26 + 24) >> 1;
          if (v3 < v27) {
            break;
          }
LABEL_37:
          *(void *)(v26 + 16) = v3;
        }
        uint64_t v28 = v26 + 32;
        while (1)
        {
          *(void *)(v28 + 8 * v3++) = v24;
          int64_t v29 = v47;
          if (v44 < 0)
          {
            if (!sub_1D3C2F650()) {
              goto LABEL_74;
            }
            sub_1D3C2DE80();
            swift_unknownObjectRetain();
            swift_dynamicCast();
            uint64_t v24 = v43;
            swift_unknownObjectRelease();
            goto LABEL_49;
          }
          if (!v48) {
            break;
          }
          unint64_t v30 = (v48 - 1) & v48;
          unint64_t v31 = __clz(__rbit64(v48)) | (v47 << 6);
LABEL_45:
          uint64_t v24 = *(void **)(*(void *)(v44 + 48) + 8 * v31);
          id v32 = v24;
LABEL_46:
          int64_t v47 = v29;
          unint64_t v48 = v30;
LABEL_49:
          if (!v24)
          {
LABEL_74:
            *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10) = v3;
            goto LABEL_21;
          }
          if (v3 >= v27)
          {
            uint64_t v26 = *v4 & 0xFFFFFFFFFFFFFF8;
            goto LABEL_37;
          }
        }
        int64_t v33 = v47 + 1;
        if (__OFADD__(v47, 1))
        {
          __break(1u);
LABEL_98:
          uint64_t v24 = 0;
          unint64_t v22 = 0;
          int64_t v21 = v1;
LABEL_30:
          int64_t v47 = v21;
          unint64_t v48 = v22;
          continue;
        }
        break;
      }
      int64_t v34 = (unint64_t)(v46 + 64) >> 6;
      if (v33 >= v34)
      {
        uint64_t v24 = 0;
        unint64_t v30 = 0;
        goto LABEL_46;
      }
      unint64_t v35 = *(void *)(v45 + 8 * v33);
      if (!v35)
      {
        int64_t v36 = v47 + 2;
        if (v47 + 2 >= v34) {
          goto LABEL_71;
        }
        unint64_t v35 = *(void *)(v45 + 8 * v36);
        if (!v35)
        {
          int64_t v1 = v47 + 3;
          if (v47 + 3 >= v34) {
            goto LABEL_72;
          }
          unint64_t v35 = *(void *)(v45 + 8 * v1);
          if (v35)
          {
            int64_t v33 = v47 + 3;
            goto LABEL_55;
          }
          int64_t v36 = v47 + 4;
          if (v47 + 4 >= v34)
          {
            uint64_t v24 = 0;
            unint64_t v30 = 0;
            int64_t v29 = v47 + 3;
            goto LABEL_46;
          }
          unint64_t v35 = *(void *)(v45 + 8 * v36);
          if (!v35)
          {
            int64_t v33 = v47 + 5;
            if (v47 + 5 >= v34)
            {
LABEL_72:
              uint64_t v24 = 0;
              unint64_t v30 = 0;
              int64_t v29 = v36;
              goto LABEL_46;
            }
            unint64_t v35 = *(void *)(v45 + 8 * v33);
            if (!v35)
            {
              int64_t v33 = v34 - 1;
              uint64_t v37 = v47 + 6;
              while (v34 != v37)
              {
                unint64_t v35 = *(void *)(v45 + 8 * v37++);
                if (v35)
                {
                  int64_t v33 = v37 - 1;
                  goto LABEL_55;
                }
              }
LABEL_71:
              uint64_t v24 = 0;
              unint64_t v30 = 0;
              int64_t v29 = v33;
              goto LABEL_46;
            }
            goto LABEL_55;
          }
        }
        int64_t v33 = v36;
      }
LABEL_55:
      unint64_t v30 = (v35 - 1) & v35;
      unint64_t v31 = __clz(__rbit64(v35)) + (v33 << 6);
      int64_t v29 = v33;
      goto LABEL_45;
    }
    *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10) = v19;
  }
  if (result != v16)
  {
LABEL_21:
    sub_1D3C0B220();
    return sub_1D3C2F250();
  }
LABEL_26:
  uint64_t v3 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  int64_t v21 = v47;
  if (v44 < 0) {
    goto LABEL_33;
  }
  if (v48)
  {
    unint64_t v22 = (v48 - 1) & v48;
    unint64_t v23 = __clz(__rbit64(v48)) | (v47 << 6);
LABEL_29:
    uint64_t v24 = *(void **)(*(void *)(v44 + 48) + 8 * v23);
    id v25 = v24;
    goto LABEL_30;
  }
  int64_t v38 = v47 + 1;
  if (!__OFADD__(v47, 1))
  {
    int64_t v39 = (unint64_t)(v46 + 64) >> 6;
    if (v38 >= v39)
    {
      uint64_t v24 = 0;
      unint64_t v22 = 0;
      goto LABEL_30;
    }
    unint64_t v40 = *(void *)(v45 + 8 * v38);
    if (v40) {
      goto LABEL_79;
    }
    int64_t v41 = v47 + 2;
    if (v47 + 2 >= v39)
    {
LABEL_95:
      uint64_t v24 = 0;
      unint64_t v22 = 0;
      int64_t v21 = v38;
      goto LABEL_30;
    }
    unint64_t v40 = *(void *)(v45 + 8 * v41);
    if (v40) {
      goto LABEL_83;
    }
    int64_t v1 = v47 + 3;
    if (v47 + 3 < v39)
    {
      unint64_t v40 = *(void *)(v45 + 8 * v1);
      if (v40)
      {
        int64_t v38 = v47 + 3;
        goto LABEL_79;
      }
      int64_t v41 = v47 + 4;
      if (v47 + 4 >= v39) {
        goto LABEL_98;
      }
      unint64_t v40 = *(void *)(v45 + 8 * v41);
      if (v40)
      {
LABEL_83:
        int64_t v38 = v41;
LABEL_79:
        unint64_t v22 = (v40 - 1) & v40;
        unint64_t v23 = __clz(__rbit64(v40)) + (v38 << 6);
        int64_t v21 = v38;
        goto LABEL_29;
      }
      int64_t v38 = v47 + 5;
      if (v47 + 5 < v39)
      {
        unint64_t v40 = *(void *)(v45 + 8 * v38);
        if (!v40)
        {
          int64_t v38 = v39 - 1;
          uint64_t v42 = v47 + 6;
          do
          {
            if (v39 == v42) {
              goto LABEL_95;
            }
            unint64_t v40 = *(void *)(v45 + 8 * v42++);
          }
          while (!v40);
          int64_t v38 = v42 - 1;
        }
        goto LABEL_79;
      }
    }
    uint64_t v24 = 0;
    unint64_t v22 = 0;
    int64_t v21 = v41;
    goto LABEL_30;
  }
  __break(1u);
  return result;
}

uint64_t sub_1D3C2D10C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v9 = MEMORY[0x1E4FBC870];
LABEL_36:
    swift_release();
    return v9;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD74718);
  uint64_t result = sub_1D3C2F6D0();
  uint64_t v9 = result;
  uint64_t v28 = a1;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    uint64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_39;
    }
    if (v15 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v28[v15];
    ++v11;
    if (!v16)
    {
      uint64_t v11 = v15 + 1;
      if (v15 + 1 >= a2) {
        goto LABEL_36;
      }
      unint64_t v16 = v28[v11];
      if (!v16)
      {
        uint64_t v11 = v15 + 2;
        if (v15 + 2 >= a2) {
          goto LABEL_36;
        }
        unint64_t v16 = v28[v11];
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    id v18 = *(id *)(*(void *)(v4 + 48) + 8 * v14);
    uint64_t result = sub_1D3C2F510();
    uint64_t v19 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v21 == v24;
        if (v21 == v24) {
          unint64_t v21 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v12 + 8 * v21);
      }
      while (v26 == -1);
      unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
    }
    *(void *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(void *)(*(void *)(v9 + 48) + 8 * v22) = v18;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v17 = v15 + 3;
  if (v17 >= a2) {
    goto LABEL_36;
  }
  unint64_t v16 = v28[v17];
  if (v16)
  {
    uint64_t v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v28[v11];
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

int64_t sub_1D3C2D36C(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

void sub_1D3C2D450(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      if (a4 < 0) {
        uint64_t v7 = a4;
      }
      else {
        uint64_t v7 = a4 & 0xFFFFFFFFFFFFFF8;
      }
      MEMORY[0x1D943CDD0](a1, a2, v7);
      sub_1D3C2DE80();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
LABEL_27:
    __break(1u);
    return;
  }
  if (a3) {
    goto LABEL_13;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_20;
  }
  __break(1u);
LABEL_13:
  if (sub_1D3C2F600() != *(_DWORD *)(a4 + 36))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  sub_1D3C2F610();
  sub_1D3C2DE80();
  swift_unknownObjectRetain();
  swift_dynamicCast();
  unint64_t v4 = v17;
  swift_unknownObjectRelease();
  uint64_t v8 = sub_1D3C2F510();
  uint64_t v9 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v6 = v8 & ~v9;
  if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
  {
LABEL_26:

    __break(1u);
    goto LABEL_27;
  }
  id v10 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
  char v11 = sub_1D3C2F520();

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = ~v9;
    do
    {
      unint64_t v6 = (v6 + 1) & v12;
      if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_26;
      }
      id v13 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
      char v14 = sub_1D3C2F520();
    }
    while ((v14 & 1) == 0);
  }

LABEL_20:
  uint64_t v15 = *(void **)(*(void *)(a4 + 48) + 8 * v6);
  id v16 = v15;
}

uint64_t sub_1D3C2D6A8(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 72);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_1D3C2D730(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1D3C2D73C(uint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  int64_t v4 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = a3 + 56;
  uint64_t v5 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a3 + 56);
  int64_t v31 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v27 = (unint64_t *)result;
  uint64_t v28 = a4 + 7;
  while (1)
  {
    while (1)
    {
      if (v7)
      {
        unint64_t v8 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        int64_t v34 = v4;
        unint64_t v9 = v8 | (v4 << 6);
      }
      else
      {
        int64_t v10 = v4 + 1;
        if (__OFADD__(v4, 1)) {
          goto LABEL_41;
        }
        if (v10 >= v31) {
          goto LABEL_39;
        }
        unint64_t v11 = *(void *)(v30 + 8 * v10);
        int64_t v12 = v4 + 1;
        if (!v11)
        {
          int64_t v12 = v4 + 2;
          if (v4 + 2 >= v31) {
            goto LABEL_39;
          }
          unint64_t v11 = *(void *)(v30 + 8 * v12);
          if (!v11)
          {
            int64_t v12 = v4 + 3;
            if (v4 + 3 >= v31) {
              goto LABEL_39;
            }
            unint64_t v11 = *(void *)(v30 + 8 * v12);
            if (!v11)
            {
              uint64_t v13 = v4 + 4;
              if (v4 + 4 >= v31) {
                goto LABEL_39;
              }
              unint64_t v11 = *(void *)(v30 + 8 * v13);
              if (!v11)
              {
                while (1)
                {
                  int64_t v12 = v13 + 1;
                  if (__OFADD__(v13, 1)) {
                    goto LABEL_42;
                  }
                  if (v12 >= v31) {
                    goto LABEL_39;
                  }
                  unint64_t v11 = *(void *)(v30 + 8 * v12);
                  ++v13;
                  if (v11) {
                    goto LABEL_20;
                  }
                }
              }
              int64_t v12 = v4 + 4;
            }
          }
        }
LABEL_20:
        unint64_t v7 = (v11 - 1) & v11;
        int64_t v34 = v12;
        unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
      }
      id v14 = *(id *)(*(void *)(a3 + 48) + 8 * v9);
      id v15 = objc_msgSend(v14, sel_identifier);
      uint64_t v16 = sub_1D3C2F190();
      uint64_t v18 = v17;

      uint64_t v19 = a4[2];
      if (v19) {
        break;
      }
LABEL_36:

      uint64_t result = swift_bridgeObjectRelease();
      *(unint64_t *)((char *)v27 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
      BOOL v25 = __OFADD__(v29++, 1);
      int64_t v4 = v34;
      if (v25)
      {
        __break(1u);
LABEL_39:
        swift_retain();
        return sub_1D3C2D10C(v27, a2, v29, a3);
      }
    }
    if (a4[4] != v16 || a4[5] != v18)
    {
      uint64_t result = sub_1D3C2F880();
      if ((result & 1) == 0) {
        break;
      }
    }
LABEL_4:

    uint64_t result = swift_bridgeObjectRelease();
    int64_t v4 = v34;
  }
  if (v19 == 1) {
    goto LABEL_36;
  }
  unint64_t v21 = v28;
  uint64_t v22 = 1;
  while (1)
  {
    uint64_t v23 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (*(v21 - 1) == v16 && *v21 == v18) {
      goto LABEL_4;
    }
    uint64_t result = sub_1D3C2F880();
    if (result) {
      goto LABEL_4;
    }
    v21 += 2;
    ++v22;
    if (v23 == v19) {
      goto LABEL_36;
    }
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_1D3C2D9E8(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  unint64_t v7 = (unint64_t)((1 << v5) + 63) >> 6;
  size_t v8 = 8 * v7;
  uint64_t isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v6 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1F4188790](isStackAllocationSafe);
    bzero((char *)v13 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1D3C2D73C((uint64_t)v13 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v7, a1, a2);
    swift_release();
    swift_bridgeObjectRelease();
    if (v2) {
      swift_willThrow();
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    unint64_t v11 = (void *)swift_slowAlloc();
    bzero(v11, v8);
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1D3C2D73C((uint64_t)v11, v7, a1, a2);
    swift_release();
    swift_bridgeObjectRelease();
    MEMORY[0x1D943DA70](v11, -1, -1);
    swift_bridgeObjectRelease_n();
  }
  return v10;
}

uint64_t sub_1D3C2DBB4(uint64_t a1, void *a2)
{
  if ((a1 & 0xC000000000000001) == 0) {
    return sub_1D3C2D9E8(a1, a2);
  }
  uint64_t v3 = MEMORY[0x1E4FBC870];
  uint64_t v27 = MEMORY[0x1E4FBC870];
  swift_bridgeObjectRetain();
  sub_1D3C2F5E0();
  if (!sub_1D3C2F650())
  {
LABEL_36:
    swift_bridgeObjectRelease();
    swift_release();
    return v3;
  }
  sub_1D3C2DE80();
  while (1)
  {
    swift_dynamicCast();
    id v4 = objc_msgSend(v26, sel_identifier);
    uint64_t v5 = sub_1D3C2F190();
    uint64_t v7 = v6;

    uint64_t v8 = a2[2];
    if (!v8) {
      goto LABEL_21;
    }
    if (a2[4] != v5 || a2[5] != v7)
    {
      uint64_t result = sub_1D3C2F880();
      if ((result & 1) == 0) {
        break;
      }
    }
LABEL_4:
    swift_bridgeObjectRelease();

LABEL_5:
    if (!sub_1D3C2F650())
    {
      uint64_t v3 = v27;
      goto LABEL_36;
    }
  }
  if (v8 == 1)
  {
LABEL_21:
    swift_bridgeObjectRelease();
    uint64_t v15 = v27;
    unint64_t v16 = *(void *)(v27 + 16);
    if (*(void *)(v27 + 24) <= v16)
    {
      sub_1D3C08348(v16 + 1);
      uint64_t v15 = v27;
    }
    uint64_t result = sub_1D3C2F510();
    uint64_t v17 = v15 + 56;
    uint64_t v18 = -1 << *(unsigned char *)(v15 + 32);
    unint64_t v19 = result & ~v18;
    unint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~*(void *)(v15 + 56 + 8 * (v19 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v19) & ~*(void *)(v15 + 56 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v18) >> 6;
      do
      {
        if (++v20 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_37;
        }
        BOOL v24 = v20 == v23;
        if (v20 == v23) {
          unint64_t v20 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v17 + 8 * v20);
      }
      while (v25 == -1);
      unint64_t v21 = __clz(__rbit64(~v25)) + (v20 << 6);
    }
    *(void *)(v17 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    *(void *)(*(void *)(v15 + 48) + 8 * v21) = v26;
    ++*(void *)(v15 + 16);
    goto LABEL_5;
  }
  unint64_t v11 = a2 + 7;
  uint64_t v12 = 1;
  while (1)
  {
    uint64_t v13 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (*(v11 - 1) == v5 && *v11 == v7) {
      goto LABEL_4;
    }
    uint64_t result = sub_1D3C2F880();
    if (result) {
      goto LABEL_4;
    }
    v11 += 2;
    ++v12;
    if (v13 == v8) {
      goto LABEL_21;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_1D3C2DE80()
{
  unint64_t result = qword_1EBD76328;
  if (!qword_1EBD76328)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBD76328);
  }
  return result;
}

unint64_t sub_1D3C2DEC0()
{
  unint64_t result = qword_1EBD76330;
  if (!qword_1EBD76330)
  {
    sub_1D3C2DE80();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBD76330);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for WalkSuggestionError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1D3C2DFB4);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for WalkSuggestionError()
{
  return &type metadata for WalkSuggestionError;
}

unint64_t sub_1D3C2DFF0()
{
  unint64_t result = qword_1EA6B69D0;
  if (!qword_1EA6B69D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA6B69D0);
  }
  return result;
}

uint64_t sub_1D3C2E0E0()
{
  return MEMORY[0x1F40E34A0]();
}

uint64_t sub_1D3C2E0F0()
{
  return MEMORY[0x1F40E34D0]();
}

uint64_t sub_1D3C2E100()
{
  return MEMORY[0x1F40E34E8]();
}

uint64_t sub_1D3C2E110()
{
  return MEMORY[0x1F40E34F8]();
}

uint64_t sub_1D3C2E120()
{
  return MEMORY[0x1F40E3530]();
}

uint64_t sub_1D3C2E130()
{
  return MEMORY[0x1F40E3550]();
}

uint64_t sub_1D3C2E140()
{
  return MEMORY[0x1F40E3590]();
}

uint64_t sub_1D3C2E150()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t sub_1D3C2E160()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1D3C2E170()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1D3C2E180()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1D3C2E190()
{
  return MEMORY[0x1F40E38E8]();
}

uint64_t sub_1D3C2E1A0()
{
  return MEMORY[0x1F40E3958]();
}

uint64_t sub_1D3C2E1B0()
{
  return MEMORY[0x1F40E3A58]();
}

uint64_t sub_1D3C2E1C0()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1D3C2E1D0()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1D3C2E1E0()
{
  return MEMORY[0x1F414B0B0]();
}

uint64_t sub_1D3C2E1F0()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1D3C2E200()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1D3C2E210()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1D3C2E220()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1D3C2E230()
{
  return MEMORY[0x1F40E4C30]();
}

uint64_t sub_1D3C2E240()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1D3C2E250()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1D3C2E260()
{
  return MEMORY[0x1F40E4DB8]();
}

uint64_t sub_1D3C2E270()
{
  return MEMORY[0x1F40E4EE0]();
}

uint64_t sub_1D3C2E280()
{
  return MEMORY[0x1F41195D0]();
}

uint64_t sub_1D3C2E290()
{
  return MEMORY[0x1F41195D8]();
}

uint64_t sub_1D3C2E2A0()
{
  return MEMORY[0x1F41195E0]();
}

uint64_t sub_1D3C2E2B0()
{
  return MEMORY[0x1F41195E8]();
}

uint64_t sub_1D3C2E2C0()
{
  return MEMORY[0x1F41195F0]();
}

uint64_t sub_1D3C2E2D0()
{
  return MEMORY[0x1F41195F8]();
}

uint64_t sub_1D3C2E2E0()
{
  return MEMORY[0x1F4119600]();
}

uint64_t sub_1D3C2E2F0()
{
  return MEMORY[0x1F4119608]();
}

uint64_t sub_1D3C2E300()
{
  return MEMORY[0x1F4119610]();
}

uint64_t sub_1D3C2E310()
{
  return MEMORY[0x1F4119618]();
}

uint64_t sub_1D3C2E320()
{
  return MEMORY[0x1F4119620]();
}

uint64_t sub_1D3C2E330()
{
  return MEMORY[0x1F4119628]();
}

uint64_t sub_1D3C2E340()
{
  return MEMORY[0x1F4119630]();
}

uint64_t sub_1D3C2E350()
{
  return MEMORY[0x1F4119638]();
}

uint64_t sub_1D3C2E360()
{
  return MEMORY[0x1F4119640]();
}

uint64_t sub_1D3C2E370()
{
  return MEMORY[0x1F4119648]();
}

uint64_t sub_1D3C2E380()
{
  return MEMORY[0x1F4119650]();
}

uint64_t sub_1D3C2E390()
{
  return MEMORY[0x1F40E5158]();
}

uint64_t sub_1D3C2E3A0()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1D3C2E3B0()
{
  return MEMORY[0x1F40E52B0]();
}

uint64_t sub_1D3C2E3C0()
{
  return MEMORY[0x1F40E52C0]();
}

uint64_t sub_1D3C2E3D0()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1D3C2E3E0()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1D3C2E3F0()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1D3C2E400()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1D3C2E410()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1D3C2E420()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1D3C2E430()
{
  return MEMORY[0x1F40E58A8]();
}

uint64_t sub_1D3C2E440()
{
  return MEMORY[0x1F40E58B0]();
}

uint64_t sub_1D3C2E450()
{
  return MEMORY[0x1F40E58D0]();
}

uint64_t sub_1D3C2E460()
{
  return MEMORY[0x1F40E5978]();
}

uint64_t sub_1D3C2E470()
{
  return MEMORY[0x1F40E59E0]();
}

uint64_t sub_1D3C2E480()
{
  return MEMORY[0x1F40E5A18]();
}

uint64_t sub_1D3C2E490()
{
  return MEMORY[0x1F40E5A40]();
}

uint64_t sub_1D3C2E4A0()
{
  return MEMORY[0x1F40E5A80]();
}

uint64_t sub_1D3C2E4B0()
{
  return MEMORY[0x1F40E5AB8]();
}

uint64_t sub_1D3C2E4C0()
{
  return MEMORY[0x1F40E5AF0]();
}

uint64_t sub_1D3C2E4D0()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_1D3C2E4E0()
{
  return MEMORY[0x1F414D388]();
}

uint64_t sub_1D3C2E4F0()
{
  return MEMORY[0x1F414D5D8]();
}

uint64_t sub_1D3C2E500()
{
  return MEMORY[0x1F414DE18]();
}

uint64_t sub_1D3C2E510()
{
  return MEMORY[0x1F414DE28]();
}

uint64_t sub_1D3C2E520()
{
  return MEMORY[0x1F414DE30]();
}

uint64_t sub_1D3C2E530()
{
  return MEMORY[0x1F414DEF8]();
}

uint64_t sub_1D3C2E540()
{
  return MEMORY[0x1F414EE38]();
}

uint64_t sub_1D3C2E550()
{
  return MEMORY[0x1F414EE50]();
}

uint64_t sub_1D3C2E560()
{
  return MEMORY[0x1F414EE58]();
}

uint64_t sub_1D3C2E570()
{
  return MEMORY[0x1F414F7F8]();
}

uint64_t sub_1D3C2E580()
{
  return MEMORY[0x1F414F808]();
}

uint64_t sub_1D3C2E590()
{
  return MEMORY[0x1F414F840]();
}

uint64_t sub_1D3C2E5A0()
{
  return MEMORY[0x1F414F878]();
}

uint64_t sub_1D3C2E5B0()
{
  return MEMORY[0x1F4119150]();
}

uint64_t sub_1D3C2E5C0()
{
  return MEMORY[0x1F411D188]();
}

uint64_t sub_1D3C2E5D0()
{
  return MEMORY[0x1F411D190]();
}

uint64_t sub_1D3C2E5E0()
{
  return MEMORY[0x1F411D198]();
}

uint64_t sub_1D3C2E5F0()
{
  return MEMORY[0x1F411D1A0]();
}

uint64_t sub_1D3C2E600()
{
  return MEMORY[0x1F411D1D8]();
}

uint64_t sub_1D3C2E610()
{
  return MEMORY[0x1F411D1E0]();
}

uint64_t sub_1D3C2E620()
{
  return MEMORY[0x1F411D1E8]();
}

uint64_t sub_1D3C2E630()
{
  return MEMORY[0x1F411D1F0]();
}

uint64_t sub_1D3C2E640()
{
  return MEMORY[0x1F411D260]();
}

uint64_t sub_1D3C2E650()
{
  return MEMORY[0x1F411D268]();
}

uint64_t sub_1D3C2E670()
{
  return MEMORY[0x1F411D278]();
}

uint64_t sub_1D3C2E680()
{
  return MEMORY[0x1F411D280]();
}

uint64_t sub_1D3C2E690()
{
  return MEMORY[0x1F411D288]();
}

uint64_t sub_1D3C2E6A0()
{
  return MEMORY[0x1F411D290]();
}

uint64_t sub_1D3C2E6C0()
{
  return MEMORY[0x1F411D2C0]();
}

uint64_t sub_1D3C2E6D0()
{
  return MEMORY[0x1F411D2C8]();
}

uint64_t sub_1D3C2E6E0()
{
  return MEMORY[0x1F414B2E0]();
}

uint64_t sub_1D3C2E6F0()
{
  return MEMORY[0x1F414B2E8]();
}

uint64_t sub_1D3C2E710()
{
  return MEMORY[0x1F414B308]();
}

uint64_t sub_1D3C2E720()
{
  return MEMORY[0x1F414B310]();
}

uint64_t sub_1D3C2E730()
{
  return MEMORY[0x1F414B318]();
}

uint64_t sub_1D3C2E740()
{
  return MEMORY[0x1F414B320]();
}

uint64_t sub_1D3C2E750()
{
  return MEMORY[0x1F414B328]();
}

uint64_t sub_1D3C2E760()
{
  return MEMORY[0x1F414B330]();
}

uint64_t sub_1D3C2E770()
{
  return MEMORY[0x1F414B8F8]();
}

uint64_t sub_1D3C2E780()
{
  return MEMORY[0x1F414B900]();
}

uint64_t sub_1D3C2E790()
{
  return MEMORY[0x1F414B908]();
}

uint64_t sub_1D3C2E7A0()
{
  return MEMORY[0x1F414BDD0]();
}

uint64_t sub_1D3C2E7B0()
{
  return MEMORY[0x1F414BEC0]();
}

uint64_t sub_1D3C2E7C0()
{
  return MEMORY[0x1F414BED8]();
}

uint64_t sub_1D3C2E7E0()
{
  return MEMORY[0x1F4186968]();
}

uint64_t sub_1D3C2E7F0()
{
  return MEMORY[0x1F4186978]();
}

uint64_t sub_1D3C2E800()
{
  return MEMORY[0x1F4119658]();
}

uint64_t sub_1D3C2E810()
{
  return MEMORY[0x1F4119660]();
}

uint64_t sub_1D3C2E820()
{
  return MEMORY[0x1F4119668]();
}

uint64_t sub_1D3C2E830()
{
  return MEMORY[0x1F4119670]();
}

uint64_t sub_1D3C2E840()
{
  return MEMORY[0x1F4119678]();
}

uint64_t sub_1D3C2E850()
{
  return MEMORY[0x1F4119680]();
}

uint64_t sub_1D3C2E860()
{
  return MEMORY[0x1F4119688]();
}

uint64_t sub_1D3C2E870()
{
  return MEMORY[0x1F4119690]();
}

uint64_t sub_1D3C2E880()
{
  return MEMORY[0x1F4119698]();
}

uint64_t sub_1D3C2E890()
{
  return MEMORY[0x1F41196A0]();
}

uint64_t sub_1D3C2E8A0()
{
  return MEMORY[0x1F41196A8]();
}

uint64_t sub_1D3C2E8B0()
{
  return MEMORY[0x1F41196B0]();
}

uint64_t sub_1D3C2E8C0()
{
  return MEMORY[0x1F41196B8]();
}

uint64_t sub_1D3C2E8D0()
{
  return MEMORY[0x1F41196C0]();
}

uint64_t sub_1D3C2E8E0()
{
  return MEMORY[0x1F41196C8]();
}

uint64_t sub_1D3C2E8F0()
{
  return MEMORY[0x1F41196D0]();
}

uint64_t sub_1D3C2E900()
{
  return MEMORY[0x1F41196D8]();
}

uint64_t sub_1D3C2E910()
{
  return MEMORY[0x1F41196E0]();
}

uint64_t sub_1D3C2E920()
{
  return MEMORY[0x1F41196E8]();
}

uint64_t sub_1D3C2E930()
{
  return MEMORY[0x1F41196F0]();
}

uint64_t sub_1D3C2E940()
{
  return MEMORY[0x1F41196F8]();
}

uint64_t sub_1D3C2E950()
{
  return MEMORY[0x1F4119700]();
}

uint64_t sub_1D3C2E960()
{
  return MEMORY[0x1F4119708]();
}

uint64_t sub_1D3C2E990()
{
  return MEMORY[0x1F4119720]();
}

uint64_t sub_1D3C2E9A0()
{
  return MEMORY[0x1F4119728]();
}

uint64_t sub_1D3C2E9B0()
{
  return MEMORY[0x1F4119730]();
}

uint64_t sub_1D3C2E9C0()
{
  return MEMORY[0x1F4119738]();
}

uint64_t sub_1D3C2E9D0()
{
  return MEMORY[0x1F4119740]();
}

uint64_t sub_1D3C2E9E0()
{
  return MEMORY[0x1F4119748]();
}

uint64_t sub_1D3C2E9F0()
{
  return MEMORY[0x1F4119750]();
}

uint64_t sub_1D3C2EA00()
{
  return MEMORY[0x1F4119758]();
}

uint64_t sub_1D3C2EA10()
{
  return MEMORY[0x1F4119760]();
}

uint64_t sub_1D3C2EA20()
{
  return MEMORY[0x1F4119768]();
}

uint64_t sub_1D3C2EA30()
{
  return MEMORY[0x1F4119770]();
}

uint64_t sub_1D3C2EA40()
{
  return MEMORY[0x1F4119778]();
}

uint64_t sub_1D3C2EA50()
{
  return MEMORY[0x1F4119780]();
}

uint64_t sub_1D3C2EA60()
{
  return MEMORY[0x1F4119788]();
}

uint64_t sub_1D3C2EA70()
{
  return MEMORY[0x1F4119790]();
}

uint64_t sub_1D3C2EA80()
{
  return MEMORY[0x1F4119798]();
}

uint64_t sub_1D3C2EA90()
{
  return MEMORY[0x1F41197A0]();
}

uint64_t sub_1D3C2EAA0()
{
  return MEMORY[0x1F41197A8]();
}

uint64_t sub_1D3C2EAB0()
{
  return MEMORY[0x1F41197B0]();
}

uint64_t sub_1D3C2EAC0()
{
  return MEMORY[0x1F41197B8]();
}

uint64_t sub_1D3C2EAD0()
{
  return MEMORY[0x1F41197C0]();
}

uint64_t sub_1D3C2EAE0()
{
  return MEMORY[0x1F41197C8]();
}

uint64_t sub_1D3C2EB20()
{
  return MEMORY[0x1F41197E8]();
}

uint64_t sub_1D3C2EB30()
{
  return MEMORY[0x1F41197F0]();
}

uint64_t sub_1D3C2EB40()
{
  return MEMORY[0x1F41197F8]();
}

uint64_t sub_1D3C2EB50()
{
  return MEMORY[0x1F4119800]();
}

uint64_t sub_1D3C2EB90()
{
  return MEMORY[0x1F4119820]();
}

uint64_t sub_1D3C2EBA0()
{
  return MEMORY[0x1F4119828]();
}

uint64_t sub_1D3C2EBB0()
{
  return MEMORY[0x1F4119830]();
}

uint64_t sub_1D3C2EBC0()
{
  return MEMORY[0x1F4119838]();
}

uint64_t sub_1D3C2EBD0()
{
  return MEMORY[0x1F4119840]();
}

uint64_t sub_1D3C2EBE0()
{
  return MEMORY[0x1F4119848]();
}

uint64_t sub_1D3C2EBF0()
{
  return MEMORY[0x1F4119850]();
}

uint64_t sub_1D3C2EC00()
{
  return MEMORY[0x1F4119858]();
}

uint64_t sub_1D3C2EC10()
{
  return MEMORY[0x1F4119860]();
}

uint64_t sub_1D3C2EC20()
{
  return MEMORY[0x1F4119868]();
}

uint64_t sub_1D3C2EC30()
{
  return MEMORY[0x1F4119870]();
}

uint64_t sub_1D3C2EC40()
{
  return MEMORY[0x1F4119878]();
}

uint64_t sub_1D3C2EC50()
{
  return MEMORY[0x1F4119880]();
}

uint64_t sub_1D3C2EC60()
{
  return MEMORY[0x1F4119888]();
}

uint64_t sub_1D3C2EC70()
{
  return MEMORY[0x1F4119890]();
}

uint64_t sub_1D3C2EC80()
{
  return MEMORY[0x1F4119898]();
}

uint64_t sub_1D3C2EC90()
{
  return MEMORY[0x1F41198A0]();
}

uint64_t sub_1D3C2ECA0()
{
  return MEMORY[0x1F41198A8]();
}

uint64_t sub_1D3C2ECB0()
{
  return MEMORY[0x1F41198B0]();
}

uint64_t sub_1D3C2ECC0()
{
  return MEMORY[0x1F41198B8]();
}

uint64_t sub_1D3C2ECE0()
{
  return MEMORY[0x1F41198C8]();
}

uint64_t sub_1D3C2ECF0()
{
  return MEMORY[0x1F41198D0]();
}

uint64_t sub_1D3C2ED00()
{
  return MEMORY[0x1F41198D8]();
}

uint64_t sub_1D3C2ED10()
{
  return MEMORY[0x1F41198E0]();
}

uint64_t sub_1D3C2ED20()
{
  return MEMORY[0x1F41198E8]();
}

uint64_t sub_1D3C2ED30()
{
  return MEMORY[0x1F41198F0]();
}

uint64_t sub_1D3C2ED40()
{
  return MEMORY[0x1F41198F8]();
}

uint64_t sub_1D3C2ED70()
{
  return MEMORY[0x1F4119910]();
}

uint64_t sub_1D3C2ED80()
{
  return MEMORY[0x1F4119918]();
}

uint64_t sub_1D3C2ED90()
{
  return MEMORY[0x1F4119920]();
}

uint64_t sub_1D3C2EDA0()
{
  return MEMORY[0x1F4119928]();
}

uint64_t sub_1D3C2EDB0()
{
  return MEMORY[0x1F4119930]();
}

uint64_t sub_1D3C2EDC0()
{
  return MEMORY[0x1F4119938]();
}

uint64_t sub_1D3C2EDD0()
{
  return MEMORY[0x1F4119940]();
}

uint64_t sub_1D3C2EDF0()
{
  return MEMORY[0x1F4119950]();
}

uint64_t sub_1D3C2EE00()
{
  return MEMORY[0x1F4119958]();
}

uint64_t sub_1D3C2EE10()
{
  return MEMORY[0x1F4119960]();
}

uint64_t sub_1D3C2EE20()
{
  return MEMORY[0x1F4119968]();
}

uint64_t sub_1D3C2EE30()
{
  return MEMORY[0x1F4119970]();
}

uint64_t sub_1D3C2EE40()
{
  return MEMORY[0x1F4119978]();
}

uint64_t sub_1D3C2EE50()
{
  return MEMORY[0x1F4119980]();
}

uint64_t sub_1D3C2EE60()
{
  return MEMORY[0x1F4119988]();
}

uint64_t sub_1D3C2EE70()
{
  return MEMORY[0x1F4119990]();
}

uint64_t sub_1D3C2EE80()
{
  return MEMORY[0x1F4119998]();
}

uint64_t sub_1D3C2EE90()
{
  return MEMORY[0x1F41199A0]();
}

uint64_t sub_1D3C2EEA0()
{
  return MEMORY[0x1F41199A8]();
}

uint64_t sub_1D3C2EEB0()
{
  return MEMORY[0x1F41199B0]();
}

uint64_t sub_1D3C2EEC0()
{
  return MEMORY[0x1F41199B8]();
}

uint64_t sub_1D3C2EED0()
{
  return MEMORY[0x1F41199C0]();
}

uint64_t sub_1D3C2EEE0()
{
  return MEMORY[0x1F41199C8]();
}

uint64_t sub_1D3C2EEF0()
{
  return MEMORY[0x1F41199D0]();
}

uint64_t sub_1D3C2EF00()
{
  return MEMORY[0x1F41199D8]();
}

uint64_t sub_1D3C2EF10()
{
  return MEMORY[0x1F41199E0]();
}

uint64_t sub_1D3C2EF20()
{
  return MEMORY[0x1F41199E8]();
}

uint64_t sub_1D3C2EF30()
{
  return MEMORY[0x1F41199F0]();
}

uint64_t sub_1D3C2EF40()
{
  return MEMORY[0x1F41199F8]();
}

uint64_t sub_1D3C2EF50()
{
  return MEMORY[0x1F4119A00]();
}

uint64_t sub_1D3C2EF60()
{
  return MEMORY[0x1F4119A08]();
}

uint64_t sub_1D3C2EF70()
{
  return MEMORY[0x1F411D328]();
}

uint64_t sub_1D3C2EF80()
{
  return MEMORY[0x1F4106830]();
}

uint64_t sub_1D3C2EF90()
{
  return MEMORY[0x1F4106838]();
}

uint64_t sub_1D3C2EFA0()
{
  return MEMORY[0x1F4106840]();
}

uint64_t sub_1D3C2EFB0()
{
  return MEMORY[0x1F4106848]();
}

uint64_t sub_1D3C2EFC0()
{
  return MEMORY[0x1F4106858]();
}

uint64_t sub_1D3C2EFD0()
{
  return MEMORY[0x1F4106860]();
}

uint64_t sub_1D3C2EFE0()
{
  return MEMORY[0x1F4187858]();
}

uint64_t sub_1D3C2EFF0()
{
  return MEMORY[0x1F4187970]();
}

uint64_t sub_1D3C2F000()
{
  return MEMORY[0x1F4187A18]();
}

uint64_t sub_1D3C2F010()
{
  return MEMORY[0x1F4119A10]();
}

uint64_t sub_1D3C2F020()
{
  return MEMORY[0x1F4119A18]();
}

uint64_t sub_1D3C2F030()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1D3C2F040()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1D3C2F050()
{
  return MEMORY[0x1F41884A8]();
}

uint64_t sub_1D3C2F060()
{
  return MEMORY[0x1F40E78A0]();
}

uint64_t sub_1D3C2F070()
{
  return MEMORY[0x1F40E78A8]();
}

uint64_t sub_1D3C2F080()
{
  return MEMORY[0x1F40E78B0]();
}

uint64_t sub_1D3C2F090()
{
  return MEMORY[0x1F40E78B8]();
}

uint64_t sub_1D3C2F0A0()
{
  return MEMORY[0x1F40E78C0]();
}

uint64_t sub_1D3C2F0B0()
{
  return MEMORY[0x1F40E78C8]();
}

uint64_t sub_1D3C2F0C0()
{
  return MEMORY[0x1F40E7910]();
}

uint64_t sub_1D3C2F0D0()
{
  return MEMORY[0x1F40E7930]();
}

uint64_t sub_1D3C2F0E0()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1D3C2F0F0()
{
  return MEMORY[0x1F40E6018]();
}

uint64_t sub_1D3C2F100()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1D3C2F110()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1D3C2F120()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1D3C2F130()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1D3C2F140()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1D3C2F150()
{
  return MEMORY[0x1F4183748]();
}

uint64_t sub_1D3C2F160()
{
  return MEMORY[0x1F4183750]();
}

uint64_t sub_1D3C2F170()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1D3C2F180()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1D3C2F190()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1D3C2F1A0()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1D3C2F1B0()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1D3C2F1C0()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1D3C2F1D0()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1D3C2F1E0()
{
  return MEMORY[0x1F4183A60]();
}

uint64_t sub_1D3C2F1F0()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1D3C2F200()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1D3C2F210()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1D3C2F220()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1D3C2F230()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1D3C2F240()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1D3C2F250()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1D3C2F260()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1D3C2F270()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1D3C2F280()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1D3C2F290()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1D3C2F2A0()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_1D3C2F2B0()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1D3C2F2D0()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1D3C2F2E0()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1D3C2F2F0()
{
  return MEMORY[0x1F4187E68]();
}

uint64_t sub_1D3C2F300()
{
  return MEMORY[0x1F4187ED0]();
}

uint64_t sub_1D3C2F320()
{
  return MEMORY[0x1F40E63C8]();
}

uint64_t sub_1D3C2F330()
{
  return MEMORY[0x1F4119A20]();
}

uint64_t sub_1D3C2F340()
{
  return MEMORY[0x1F4119A28]();
}

uint64_t sub_1D3C2F350()
{
  return MEMORY[0x1F4119A30]();
}

uint64_t sub_1D3C2F360()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1D3C2F370()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1D3C2F380()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1D3C2F390()
{
  return MEMORY[0x1F4184178]();
}

uint64_t sub_1D3C2F3A0()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1D3C2F3B0()
{
  return MEMORY[0x1F40E6478]();
}

uint64_t sub_1D3C2F3C0()
{
  return MEMORY[0x1F4119A38]();
}

uint64_t sub_1D3C2F3D0()
{
  return MEMORY[0x1F40E6520]();
}

uint64_t sub_1D3C2F3E0()
{
  return MEMORY[0x1F40E6538]();
}

uint64_t sub_1D3C2F3F0()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1D3C2F400()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1D3C2F410()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1D3C2F420()
{
  return MEMORY[0x1F40E7960]();
}

uint64_t sub_1D3C2F430()
{
  return MEMORY[0x1F4119A40]();
}

uint64_t sub_1D3C2F440()
{
  return MEMORY[0x1F4119A48]();
}

uint64_t sub_1D3C2F450()
{
  return MEMORY[0x1F4119A50]();
}

uint64_t sub_1D3C2F460()
{
  return MEMORY[0x1F4119A58]();
}

uint64_t sub_1D3C2F470()
{
  return MEMORY[0x1F4119A60]();
}

uint64_t sub_1D3C2F480()
{
  return MEMORY[0x1F4119A68]();
}

uint64_t sub_1D3C2F490()
{
  return MEMORY[0x1F4119A70]();
}

uint64_t sub_1D3C2F4A0()
{
  return MEMORY[0x1F4119A78]();
}

uint64_t sub_1D3C2F4B0()
{
  return MEMORY[0x1F4119A80]();
}

uint64_t sub_1D3C2F4C0()
{
  return MEMORY[0x1F4119A88]();
}

uint64_t sub_1D3C2F4D0()
{
  return MEMORY[0x1F4119A90]();
}

uint64_t sub_1D3C2F4E0()
{
  return MEMORY[0x1F40E66D8]();
}

uint64_t sub_1D3C2F4F0()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1D3C2F500()
{
  return MEMORY[0x1F40E68F8]();
}

uint64_t sub_1D3C2F510()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1D3C2F520()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1D3C2F530()
{
  return MEMORY[0x1F414FCC8]();
}

uint64_t sub_1D3C2F540()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1D3C2F550()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1D3C2F560()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1D3C2F570()
{
  return MEMORY[0x1F40E6D88]();
}

uint64_t sub_1D3C2F580()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1D3C2F590()
{
  return MEMORY[0x1F4184A78]();
}

uint64_t sub_1D3C2F5A0()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1D3C2F5B0()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1D3C2F5C0()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1D3C2F5D0()
{
  return MEMORY[0x1F4184B58]();
}

uint64_t sub_1D3C2F5E0()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1D3C2F5F0()
{
  return MEMORY[0x1F4184B68]();
}

uint64_t sub_1D3C2F600()
{
  return MEMORY[0x1F4184B80]();
}

uint64_t sub_1D3C2F610()
{
  return MEMORY[0x1F4184B88]();
}

uint64_t sub_1D3C2F620()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1D3C2F630()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1D3C2F640()
{
  return MEMORY[0x1F4184BB0]();
}

uint64_t sub_1D3C2F650()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1D3C2F660()
{
  return MEMORY[0x1F4184BD8]();
}

uint64_t sub_1D3C2F670()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1D3C2F680()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1D3C2F690()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1D3C2F6A0()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1D3C2F6B0()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1D3C2F6C0()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1D3C2F6D0()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1D3C2F6E0()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1D3C2F6F0()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1D3C2F700()
{
  return MEMORY[0x1F4184D20]();
}

uint64_t sub_1D3C2F710()
{
  return MEMORY[0x1F4184D70]();
}

uint64_t sub_1D3C2F720()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1D3C2F730()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1D3C2F740()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1D3C2F750()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1D3C2F760()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1D3C2F770()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1D3C2F780()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1D3C2F790()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1D3C2F7A0()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1D3C2F7B0()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1D3C2F7C0()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1D3C2F7D0()
{
  return MEMORY[0x1F4185358]();
}

uint64_t sub_1D3C2F7E0()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1D3C2F7F0()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1D3C2F800()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1D3C2F810()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1D3C2F820()
{
  return MEMORY[0x1F4188038]();
}

uint64_t sub_1D3C2F830()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1D3C2F840()
{
  return MEMORY[0x1F4185730]();
}

uint64_t sub_1D3C2F850()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1D3C2F860()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1D3C2F870()
{
  return MEMORY[0x1F41859A8]();
}

uint64_t sub_1D3C2F880()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1D3C2F890()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_1D3C2F8B0()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1D3C2F8C0()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1D3C2F8D0()
{
  return MEMORY[0x1F4119A98]();
}

uint64_t sub_1D3C2F8E0()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1D3C2F8F0()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1D3C2F900()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1D3C2F910()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1D3C2F920()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1D3C2F930()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1D3C2F940()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1D3C2F950()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1D3C2F960()
{
  return MEMORY[0x1F4186318]();
}

uint64_t ACHCodableFromAchievement()
{
  return MEMORY[0x1F41067B8]();
}

uint64_t ACHEncodeAchievementIntoUserInfoDictionary()
{
  return MEMORY[0x1F41067D0]();
}

uint64_t ACHMonthlyChallengeAchievementFromAchievementsForDate()
{
  return MEMORY[0x1F41067D8]();
}

uint64_t ACHMonthlyChallengeAchievementIsDayBased()
{
  return MEMORY[0x1F41067E0]();
}

uint64_t ASCodableFriendListFromFriends()
{
  return MEMORY[0x1F4106850]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1F410C8D0]();
}

uint64_t FIActivitySummaryHasNonZeroMoveGoal()
{
  return MEMORY[0x1F4119560]();
}

uint64_t FIExperienceTypeWithHealthStoreAndDefaultExperienceType()
{
  return MEMORY[0x1F4119580]();
}

uint64_t FILocalizationTableForExperienceType()
{
  return MEMORY[0x1F4119590]();
}

uint64_t FIMoveGoalQuantityForActivitySummary()
{
  return MEMORY[0x1F41195A8]();
}

uint64_t FIMoveQuantityForActivitySummary()
{
  return MEMORY[0x1F41195B0]();
}

uint64_t FIRandomKeyForPrefixWithTableName()
{
  return MEMORY[0x1F41195B8]();
}

uint64_t HKFirstDayOfWeekForWeeklyGoalCalculations()
{
  return MEMORY[0x1F40E7D08]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1F412F980]();
}

uint64_t SBSGetScreenLockStatus()
{
  return MEMORY[0x1F415C380]();
}

uint64_t TCCAccessCopyInformationForBundleId()
{
  return MEMORY[0x1F415CB90]();
}

uint64_t TCCAccessGetOverride()
{
  return MEMORY[0x1F415CBA8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _HKCacheIndexFromDate()
{
  return MEMORY[0x1F40E8150]();
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x1F40E81B8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return MEMORY[0x1F40CA130]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
{
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x1F40CB438](*(void *)&a1, a2, a3);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CCDD0](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x1F41881C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1F4188218]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1F4188220]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1F41866A0]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1F41866C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1F41867A8]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1F41867B0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1F41868E8]();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1F40CE978](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE990](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1F40CE9D0](activity, state);
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1F40CF040](object1, object2);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return MEMORY[0x1F40CF2F0]();
}